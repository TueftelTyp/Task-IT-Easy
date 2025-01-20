import tkinter as tk
from tkinter import simpledialog, messagebox, filedialog
import schedule
import time
import threading
import subprocess
import webbrowser
import json

tasks = []  # List to hold task details

# Versionsnummer
__version__ = "1.0.0"

def run_scheduled_tasks():
    """Runs scheduled tasks in a loop."""
    while True:
        schedule.run_pending()
        time.sleep(1)

def browse_for_program():
    """Function to open the file dialog for selecting executables or batch files based on selected program type."""
    selected_program = program_type_var.get()
    
    if selected_program == "PowerShell":
        filetypes = [("PowerShell Scripts", "*.ps1")]
    elif selected_program == "Executable":
        filetypes = [("Executable files", "*.exe")]
    elif selected_program == "Batch":
        filetypes = [("Batch files", "*.bat"), ("Batch files", "*.cmd")]
    else:
        filetypes = []

    file_path = filedialog.askopenfilename(filetypes=filetypes)
    if file_path:
        program_path_entry.delete(0, tk.END)  # Clear current entry
        program_path_entry.insert(0, file_path)  # Insert the selected path

def add_task():
    """Adds a task to the schedule."""
    task_name = task_name_entry.get()
    task_interval = interval_entry.get()
    interval_unit = interval_unit_var.get()
    script_code = script_text.get("1.0", tk.END).strip()
    batch_code = batch_text.get("1.0", tk.END).strip()
    selected_program = program_type_var.get()
    selected_program_path = program_path_entry.get()

    if not task_name or not task_interval or not interval_unit or (not script_code and not batch_code and not selected_program_path):
        messagebox.showerror("Error", "Please fill in all fields.")
        return

    try:
        interval = int(task_interval)

        def task_action():
            print(f"Executing: {task_name}")
            if selected_program == "PowerShell":
                subprocess.run(["powershell", "-ExecutionPolicy", "Bypass", "-File", script_code], shell=True)
            elif selected_program == "Executable":
                subprocess.run([selected_program_path], shell=True)
            elif selected_program == "Batch":
                subprocess.run([selected_program_path], shell=True)
            elif selected_program == "Batch Script":
                subprocess.run(batch_code, shell=True)

        if interval_unit == "Seconds":
            job = schedule.every(interval).seconds.do(task_action)
        elif interval_unit == "Minutes":
            job = schedule.every(interval).minutes.do(task_action)
        elif interval_unit == "Hours":
            job = schedule.every(interval).hours.do(task_action)
        elif interval_unit == "Days":
            job = schedule.every(interval).days.do(task_action)
        else:
            messagebox.showerror("Error", "Invalid interval unit.")
            return

        tasks.append({
            "name": task_name,
            "interval": interval,
            "unit": interval_unit,
            "code": script_code,
            "batch_code": batch_code,
            "program": selected_program,
            "path": selected_program_path,
            "action": task_action,
            "job": job  # Save the job to delete it later
        })
        task_listbox.insert(tk.END, f"{task_name} - Every {interval} {interval_unit}")
        task_name_entry.delete(0, tk.END)
        interval_entry.delete(0, tk.END)
        script_text.delete("1.0", tk.END)
        batch_text.delete("1.0", tk.END)
        program_path_entry.delete(0, tk.END)
    except ValueError:
        messagebox.showerror("Error", "Interval must be a valid number.")

def edit_task():
    """Edits the selected task."""
    selected_index = task_listbox.curselection()
    if not selected_index:
        messagebox.showerror("Error", "Please select a task to edit.")
        return

    index = selected_index[0]
    task = tasks[index]

    # Open the task in a new window for editing
    edit_window = tk.Toplevel(root)
    edit_window.title(f"Edit Task: {task['name']}")

    # Task name entry
    tk.Label(edit_window, text="Task Name:").pack(pady=5)
    task_name_entry_edit = tk.Entry(edit_window, width=40)
    task_name_entry_edit.insert(tk.END, task["name"])
    task_name_entry_edit.pack(pady=5)

    # Interval entry
    tk.Label(edit_window, text="Interval:").pack(pady=5)
    interval_entry_edit = tk.Entry(edit_window, width=10)
    interval_entry_edit.insert(tk.END, task["interval"])
    interval_entry_edit.pack(pady=5)

    # Interval unit
    interval_unit_var_edit = tk.StringVar(value=task["unit"])
    interval_unit_menu_edit = tk.OptionMenu(edit_window, interval_unit_var_edit, "Seconds", "Minutes", "Hours", "Days")
    interval_unit_menu_edit.pack(pady=5)

    # Program type dropdown
    program_type_var_edit = tk.StringVar(value=task["program"])
    program_type_menu_edit = tk.OptionMenu(edit_window, program_type_var_edit, "PowerShell", "Executable", "Batch")
    program_type_menu_edit.pack(pady=5)

    # Path input for program
    program_path_label_edit = tk.Label(edit_window, text="Executable/Batch Path (if selected):")
    program_path_label_edit.pack(pady=5)
    program_path_entry_edit = tk.Entry(edit_window, width=60)
    program_path_entry_edit.insert(tk.END, task["path"])
    program_path_entry_edit.pack(pady=5)

    # PowerShell script text area
    script_label_edit = tk.Label(edit_window, text="PowerShell Script Code:")
    script_text_edit = tk.Text(edit_window, width=60, height=10)
    script_text_edit.insert(tk.END, task["code"])

    # Batch script text area
    batch_label_edit = tk.Label(edit_window, text="Batch Script Code:")
    batch_text_edit = tk.Text(edit_window, width=60, height=10)
    batch_text_edit.insert(tk.END, task["batch_code"])

    # Bind program type selection to show/hide script fields
    def toggle_edit_fields(*args):
        if program_type_var_edit.get() == "PowerShell":
            script_label_edit.pack()  # Show PowerShell label
            script_text_edit.pack()  # Show PowerShell script field
            batch_label_edit.pack_forget()  # Hide Batch label
            batch_text_edit.pack_forget()  # Hide Batch script field
        elif program_type_var_edit.get() == "Batch":
            batch_label_edit.pack()  # Show Batch label
            batch_text_edit.pack()  # Show Batch script field
            script_label_edit.pack_forget()  # Hide PowerShell label
            script_text_edit.pack_forget()  # Hide PowerShell script field
        else:
            script_label_edit.pack_forget()  # Hide both fields
            script_text_edit.pack_forget()
            batch_label_edit.pack_forget()
            batch_text_edit.pack_forget()

    program_type_var_edit.trace("w", toggle_edit_fields)

    toggle_edit_fields()  # Initially hide based on the selected program type

    # Button to save the changes
    def save_changes():
        new_name = task_name_entry_edit.get()
        new_interval = interval_entry_edit.get()
        new_unit = interval_unit_var_edit.get()
        new_code = script_text_edit.get("1.0", tk.END).strip()
        new_batch_code = batch_text_edit.get("1.0", tk.END).strip()
        new_program = program_type_var_edit.get()
        new_path = program_path_entry_edit.get()

        if not new_name or not new_interval or not new_unit or (not new_code and not new_batch_code and not new_path):
            messagebox.showerror("Error", "Please fill in all fields.")
            return

        try:
            interval = int(new_interval)

            schedule.clear(task["action"])

            def new_action():
                print(f"Executing: {new_name}")
                if new_program == "PowerShell":
                    subprocess.run(["powershell", "-ExecutionPolicy", "Bypass", "-File", new_code], shell=True)
                elif new_program == "Executable":
                    subprocess.run([new_path], shell=True)
                elif new_program == "Batch":
                    subprocess.run([new_path], shell=True)
                elif new_program == "Batch Script":
                    subprocess.run(new_batch_code, shell=True)

            if new_unit == "Seconds":
                job = schedule.every(interval).seconds.do(new_action)
            elif new_unit == "Minutes":
                job = schedule.every(interval).minutes.do(new_action)
            elif new_unit == "Hours":
                job = schedule.every(interval).hours.do(new_action)
            elif new_unit == "Days":
                job = schedule.every(interval).days.do(new_action)
            else:
                messagebox.showerror("Error", "Invalid interval unit.")
                return

            tasks[index] = {
                "name": new_name,
                "interval": interval,
                "unit": new_unit,
                "code": new_code,
                "batch_code": new_batch_code,
                "program": new_program,
                "path": new_path,
                "action": new_action,
                "job": job  # Save the job to delete it later
            }
            task_listbox.delete(index)
            task_listbox.insert(index, f"{new_name} - Every {interval} {new_unit}")

            edit_window.destroy()

        except ValueError:
            messagebox.showerror("Error", "Interval must be a valid number.")

    save_button = tk.Button(edit_window, text="Save Changes", command=save_changes)
    save_button.pack(pady=5)

def delete_task():
    """Deletes the selected task."""
    selected_index = task_listbox.curselection()
    if not selected_index:
        messagebox.showerror("Error", "Please select a task to delete.")
        return

    index = selected_index[0]
    task = tasks.pop(index)
    schedule.clear(task["action"])
    schedule.cancel_job(task["job"])  # Ensure that the task is removed from the scheduler
    task_listbox.delete(index)

# Initialize the main window
root = tk.Tk()
root.title("Task it easy")

# Ein Label für die Versionsnummer und Hyperlink erstellen
def create_version_label():
    # Versionsnummer Text
    version_text = f"Version {__version__}"
    
    # Hyperlink Text
    hyperlink_text = " Buchner IT"
    
    # Kombinieren von Text und Hyperlink
    full_text = version_text + hyperlink_text
    
    # Label mit Version und Hyperlink erstellen
    version_label = tk.Label(root, text=full_text, font=("Arial", 6, "italic"), fg="gray", cursor="hand2")
    version_label.pack(side=tk.BOTTOM, pady=10)
    
    # Bind das Klicken des Hyperlinks, um mehr Infos zu öffnen
    version_label.bind("<Button-1>", open_link)
    
# Funktion zum Öffnen des Links
def open_link(event):
    webbrowser.open("https://buchner-it.de", new=1)  # öffnet den Link im Standard-Browser

# Versionsnummer Label mit Hyperlink erstellen
create_version_label()

# Background color
root.configure(bg="#f0f0f0")

# Input fields for task name
task_name_label = tk.Label(root, text="Task Name:", bg="#f0f0f0", fg="#333")
task_name_label.pack(pady=5)
task_name_entry = tk.Entry(root, width=40, bd=2)
task_name_entry.pack(pady=5)

# Input fields for interval and unit
interval_label = tk.Label(root, text="Interval:", bg="#f0f0f0", fg="#333")
interval_label.pack(pady=5)
interval_entry = tk.Entry(root, width=10, bd=2)
interval_entry.pack(pady=5)

interval_unit_var = tk.StringVar(value="Seconds")
interval_unit_menu = tk.OptionMenu(root, interval_unit_var, "Seconds", "Minutes", "Hours", "Days")
interval_unit_menu.pack(pady=5)

# Dropdown for program type (PowerShell, Executable, or Batch)
program_type_var = tk.StringVar(value="Executable")
program_type_menu = tk.OptionMenu(root, program_type_var, "PowerShell", "Executable", "Batch")
program_type_menu.pack(pady=5)

# Frame for program path and browse button (next to each other)
program_path_frame = tk.Frame(root, bg="#f0f0f0")
program_path_frame.pack(pady=5)

program_path_label = tk.Label(program_path_frame, text="Executable/Batch Path (if selected):", bg="#f0f0f0", fg="#333")
program_path_label.pack(side=tk.LEFT, padx=5)
program_path_entry = tk.Entry(program_path_frame, width=60, bd=2)
program_path_entry.pack(side=tk.LEFT, padx=5)

browse_button = tk.Button(program_path_frame, text="Browse", command=browse_for_program, bg="#0081FE", fg="white", bd=2)
browse_button.pack(side=tk.LEFT, padx=5)

# Text fields for PowerShell and Batch Scripts
script_label = tk.Label(root, text="PowerShell Script Code:", bg="#f0f0f0", fg="#333")
script_text = tk.Text(root, width=60, height=10)
script_text.pack(pady=5)

batch_label = tk.Label(root, text="Batch Script Code:", bg="#f0f0f0", fg="#333")
batch_text = tk.Text(root, width=60, height=10)
batch_text.pack(pady=5)

# Bind program type selection to show/hide script fields
def toggle_fields(*args):
    if program_type_var.get() == "PowerShell":
        script_label.pack()  # Show PowerShell label
        script_text.pack()  # Show PowerShell script field
        batch_label.pack_forget()  # Hide Batch label
        batch_text.pack_forget()  # Hide Batch script field
        program_path_label.pack_forget()  # Hide Program Path label
        program_path_entry.pack_forget()  # Hide Program Path field
    elif program_type_var.get() == "Batch":
        batch_label.pack()  # Show Batch label
        batch_text.pack()  # Show Batch script field
        script_label.pack_forget()  # Hide PowerShell label
        script_text.pack_forget()  # Hide PowerShell script field
        program_path_label.pack()  # Show Program Path label
        program_path_entry.pack()  # Show Program Path field
    else:
        script_label.pack_forget()  # Hide PowerShell label
        script_text.pack_forget()  # Hide PowerShell script field
        batch_label.pack_forget()  # Hide Batch label
        batch_text.pack_forget()  # Hide Batch script field
        program_path_label.pack_forget()  # Hide Program Path label
        program_path_entry.pack_forget()  # Hide Program Path field

program_type_var.trace("w", toggle_fields)

toggle_fields()  # Initially hide the relevant fields based on the selected program

# Add Task Button
add_button = tk.Button(root, text="Add Task", command=add_task, bg="#4CAF50", fg="white", bd=2)
add_button.pack(pady=5)

# Listbox for tasks
task_listbox = tk.Listbox(root, width=60, height=10, bd=2)
task_listbox.pack(pady=5)

# Edit and Delete Buttons
edit_button = tk.Button(root, text="Edit Task", command=edit_task, bg="#FF9800", fg="white", bd=2)
edit_button.pack(pady=5)

delete_button = tk.Button(root, text="Delete Task", command=delete_task, bg="#F44336", fg="white", bd=2)
delete_button.pack(pady=5)

# Start the task running loop in a separate thread
thread = threading.Thread(target=run_scheduled_tasks, daemon=True)
thread.start()

# Import Export
import json

def export_tasks():
    """Exportiert alle Aufgaben in eine JSON-Datei."""
    if not tasks:
        messagebox.showwarning("Warning", "There are no tasks to export.")
        return

    # Dateidialog, um den Speicherort für die Exportdatei auszuwählen
    file_path = filedialog.asksaveasfilename(defaultextension=".json", filetypes=[("JSON files", "*.json")])
    if not file_path:
        return  # Abbrechen, wenn keine Datei ausgewählt wird

    try:
        # Aufgaben in ein Dictionary umwandeln
        tasks_data = [{
            "name": task["name"],
            "interval": task["interval"],
            "unit": task["unit"],
            "code": task["code"],
            "batch_code": task["batch_code"],
            "program": task["program"],
            "path": task["path"]
        } for task in tasks]

        # Aufgaben in JSON-Datei speichern
        with open(file_path, 'w') as json_file:
            json.dump(tasks_data, json_file, indent=4)
        
        messagebox.showinfo("Success", f"Tasks were successfully exported to: {file_path}")
    except Exception as e:
        messagebox.showerror("Error", f"Error when exporting the tasks: {e}")

def import_tasks():
    """Importiert Aufgaben aus einer JSON-Datei."""
    file_path = filedialog.askopenfilename(filetypes=[("JSON files", "*.json")])
    if not file_path:
        return  # Abbrechen, wenn keine Datei ausgewählt wird

    try:
        with open(file_path, 'r') as json_file:
            tasks_data = json.load(json_file)

        # Alle Aufgaben in der Liste aktualisieren
        for task_data in tasks_data:
            def task_action():
                print(f"Executing: {task_data['name']}")
                if task_data["program"] == "PowerShell":
                    subprocess.run(["powershell", "-ExecutionPolicy", "Bypass", "-File", task_data["code"]], shell=True)
                elif task_data["program"] == "Executable":
                    subprocess.run([task_data["path"]], shell=True)
                elif task_data["program"] == "Batch":
                    subprocess.run([task_data["path"]], shell=True)

            if task_data["unit"] == "Seconds":
                job = schedule.every(task_data["interval"]).seconds.do(task_action)
            elif task_data["unit"] == "Minutes":
                job = schedule.every(task_data["interval"]).minutes.do(task_action)
            elif task_data["unit"] == "Hours":
                job = schedule.every(task_data["interval"]).hours.do(task_action)
            elif task_data["unit"] == "Days":
                job = schedule.every(task_data["interval"]).days.do(task_action)
            else:
                continue  # Bei einem ungültigen Intervall überspringen

            tasks.append({
                "name": task_data["name"],
                "interval": task_data["interval"],
                "unit": task_data["unit"],
                "code": task_data["code"],
                "batch_code": task_data["batch_code"],
                "program": task_data["program"],
                "path": task_data["path"],
                "action": task_action,
                "job": job
            })
            task_listbox.insert(tk.END, f"{task_data['name']} - Every {task_data['interval']} {task_data['unit']}")
        
        messagebox.showinfo("Success", f"Tasks were successfully imported from: {file_path}")
    except Exception as e:
        messagebox.showerror("Error", f"Error when importing the tasks: {e}")

# Buttons für den Export und Import von Aufgaben
export_button = tk.Button(root, text="Export Tasks", command=export_tasks, bg="#2196F3", fg="white", bd=2)
export_button.pack(pady=5)

import_button = tk.Button(root, text="Import Tasks", command=import_tasks, bg="#2196F3", fg="white", bd=2)
import_button.pack(pady=5)


root.mainloop()
