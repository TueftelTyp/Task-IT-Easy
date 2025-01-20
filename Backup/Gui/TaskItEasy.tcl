#############################################################################
# Generated by PAGE version 8.0
#  in conjunction with Tcl version 8.6
#  Jan 20, 2025 03:46:02 PM CET  platform: Windows NT
set vTcl(timestamp) ""
if {![info exists vTcl(borrow)]} {
    ::vTcl::MessageBox -title Error -message  "You must open project files from within PAGE."
    exit}


set vTcl(actual_gui_font_dft_desc)  TkDefaultFont
set vTcl(actual_gui_font_dft_name)  TkDefaultFont
set vTcl(actual_gui_font_text_desc)  TkTextFont
set vTcl(actual_gui_font_text_name)  TkTextFont
set vTcl(actual_gui_font_fixed_desc)  TkFixedFont
set vTcl(actual_gui_font_fixed_name)  TkFixedFont
set vTcl(actual_gui_font_menu_desc)  TkMenuFont
set vTcl(actual_gui_font_menu_name)  TkMenuFont
set vTcl(actual_gui_font_tooltip_desc)  TkDefaultFont
set vTcl(actual_gui_font_tooltip_name)  TkDefaultFont
set vTcl(actual_gui_font_treeview_desc)  TkDefaultFont
set vTcl(actual_gui_font_treeview_name)  TkDefaultFont
########################################### 
set vTcl(actual_gui_bg) #d9d9d9
set vTcl(actual_gui_fg) #000000
set vTcl(actual_gui_analog) #ececec
set vTcl(actual_gui_menu_analog) #ececec
set vTcl(actual_gui_menu_bg) #d9d9d9
set vTcl(actual_gui_menu_fg) #000000
set vTcl(complement_color) gray40
set vTcl(analog_color_p) #c3c3c3
set vTcl(analog_color_m) beige
set vTcl(tabfg1) black
set vTcl(tabfg2) white
set vTcl(actual_gui_menu_active_bg)  #ececec
set vTcl(actual_gui_menu_active_fg)  #000000
########################################### 
set vTcl(pr,autoalias) 1
set vTcl(pr,relative_placement) 1
set vTcl(mode) Relative
set vTcl(project_theme) alt



proc vTclWindow.top1 {base} {
    global vTcl
    if {$base == ""} {
        set base .top1
    }
    if {[winfo exists $base]} {
        wm deiconify $base; return
    }
    set top $base
    set target $base
    ###################
    # CREATING WIDGETS
    ###################
    vTcl::widgets::core::toplevel::createCmd $top -class Toplevel \
        -menu $top.m56 -background #d7d7d7 -highlightbackground #d9d9d9 \
        -highlightcolor black 
    wm focusmodel $top passive
    wm geometry $top 590x467+333+102
    update
    # set in toplevel.wgt.
    global vTcl
    global img_list
    set vTcl(save,dflt,origin) 0
    wm maxsize $top 3844 1061
    wm minsize $top 120 1
    wm overrideredirect $top 0
    wm resizable $top 0 0
    wm deiconify $top
    set toptitle "Task it easy"
    wm title $top $toptitle
    namespace eval ::widgets::${top}::ClassOption {}
    set ::widgets::${top}::ClassOption(-toptitle) $toptitle
    vTcl:DefineAlias "$top" "TaskoFix" vTcl:Toplevel:WidgetProc "" 1
    set vTcl(real_top) {}
    label "$top.lab49" \
        -activebackground #d9d9d9 -activeforeground black -anchor w \
        -background #d9d9d9 -compound left -disabledforeground #a3a3a3 \
        -font "-family {Segoe UI} -size 9" -foreground black \
        -highlightbackground #d9d9d9 -highlightcolor black -text "Code:" 
    vTcl:DefineAlias "$top.lab49" "Label8" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.lab49
    label "$top.lab48" \
        -activebackground #d9d9d9 -activeforeground black -anchor w \
        -background #d9d9d9 -compound left -disabledforeground #a3a3a3 \
        -font "-family {Segoe UI} -size 9" -foreground black \
        -highlightbackground #d9d9d9 -highlightcolor black -text "Path:" 
    vTcl:DefineAlias "$top.lab48" "Label7" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.lab48
    ttk::label "$top.tLa50" \
        -font "-family {Segoe UI} -size 9" -relief flat -anchor w \
        -justify left -text "Type:" -compound left 
    vTcl:DefineAlias "$top.tLa50" "TLabel3" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.tLa50
    ttk::label "$top.tLa53" \
        -font "-family {Segoe UI} -size 9" -relief flat -anchor w \
        -justify left -text "Interval:" -compound right 
    vTcl:DefineAlias "$top.tLa53" "TLabel2" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.tLa53
    ttk::label "$top.tLa49" \
        -font "-family {Segoe UI} -size 9" -relief flat -anchor w \
        -justify left -text "Task Name:" -compound left 
    vTcl:DefineAlias "$top.tLa49" "TLabel1" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.tLa49
    button "$top.but51" \
        -activebackground #d9d9d9 -activeforeground black -background #0b1be6 \
        -command "filedialog.askopenfilename" -disabledforeground #a3a3a3 \
        -font "-family {Segoe UI} -size 9" -foreground white \
        -highlightbackground #d9d9d9 -highlightcolor black -text "Browse" 
    vTcl:DefineAlias "$top.but51" "Button_browse" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.but51
    ttk::entry "$top.tEn52" \
        -font "-family {Segoe UI} -size 9" -cursor xterm 
    vTcl:DefineAlias "$top.tEn52" "task_name" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.tEn52
    ttk::spinbox "$top.tSp57" \
        -from 1 -to 100 -font "-family {Segoe UI} -size 9" -justify center \
        -background white 
    vTcl:DefineAlias "$top.tSp57" "interval" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.tSp57
    ttk::entry "$top.tEn56" \
        -font "-family {Segoe UI} -size 9" -cursor xterm 
    vTcl:DefineAlias "$top.tEn56" "selected_program_path" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.tEn56
    ttk::combobox "$top.tCo49" \
        -values "Executable Powershell Batch" \
        -font "-family {Segoe UI} -size 9" -state readonly \
        -textvariable "combobox" 
    vTcl:DefineAlias "$top.tCo49" "selected_program" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.tCo49
    ttk::combobox "$top.tCo47" \
        -values "Seconds Minutes Hours Days" \
        -font "-family {Segoe UI} -size 9" -state readonly \
        -textvariable "Seconds" 
    vTcl:DefineAlias "$top.tCo47" "interval_unit" vTcl:WidgetProc "TaskoFix" 1
    bind $top.tCo47 <<SetBalloon>> {
        set ::vTcl::balloon::%W {Unit}
    }
    vTcl:copy_lock $top.tCo47
    text "$top.tex47" \
        -background white -font "-family {Segoe UI} -size 9" \
        -foreground black -height 294 -highlightbackground #d9d9d9 \
        -highlightcolor black -insertbackground black \
        -selectbackground #d9d9d9 -selectforeground black -width 308 \
        -wrap word 
    $top.tex47 configure -font "TkTextFont"
    $top.tex47 insert end text
    vTcl:DefineAlias "$top.tex47" "script_code" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.tex47
    vTcl::widgets::ttk::scrolledlistbox::CreateCmd "$top.scr81" \
        -background #d9d9d9 -height 75 -highlightbackground #d9d9d9 \
        -highlightcolor black -width 125 
    vTcl:DefineAlias "$top.scr81" "ScrolledListbox" vTcl:WidgetProc "TaskoFix" 1

    $top.scr81.01 configure -background white \
        -cursor xterm \
        -disabledforeground #a3a3a3 \
        -font TkFixedFont \
        -foreground black \
        -height 3 \
        -highlightbackground #d9d9d9 \
        -highlightcolor #d9d9d9 \
        -selectbackground #d9d9d9 \
        -selectforeground black \
        -width 10
    vTcl:copy_lock $top.scr81
    button "$top.but61" \
        -activebackground #d9d9d9 -activeforeground black -background #832c7a \
        -command "import_tasks" -disabledforeground #a3a3a3 \
        -font "-family {Segoe UI} -size 9" -foreground #ffffff \
        -highlightbackground #d9d9d9 -highlightcolor black -text "Import" 
    vTcl:DefineAlias "$top.but61" "Button_import" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.but61
    button "$top.but60" \
        -activebackground #d9d9d9 -activeforeground black -background #2b8484 \
        -command "export_tasks" -disabledforeground #a3a3a3 \
        -font "-family {Segoe UI} -size 9" -foreground #ffffff \
        -highlightbackground #d9d9d9 -highlightcolor black -text "Export" 
    vTcl:DefineAlias "$top.but60" "Button_export" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.but60
    button "$top.but56" \
        -activebackground #d9d9d9 -activeforeground black -background #e09e23 \
        -command "edit_task" -disabledforeground #a3a3a3 \
        -font "-family {Segoe UI} -size 9" -foreground #ffffff \
        -highlightbackground #d9d9d9 -highlightcolor black -text "Edit Task" 
    vTcl:DefineAlias "$top.but56" "Button_edit" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.but56
    button "$top.but57" \
        -activebackground #d9d9d9 -activeforeground black -background #be0707 \
        -command "delete_task" -disabledforeground #a3a3a3 \
        -font "-family {Segoe UI} -size 9" -foreground #ffffff \
        -highlightbackground #d9d9d9 -highlightcolor black \
        -text "Delete Task" 
    vTcl:DefineAlias "$top.but57" "Button_delete" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.but57
    button "$top.but55" \
        -activebackground #d9d9d9 -activeforeground black -background #30a329 \
        -command "add_task" -disabledforeground #a3a3a3 \
        -font "-family {Segoe UI} -size 9" -foreground #ffffff \
        -highlightbackground #d9d9d9 -highlightcolor black -text "Add Task" 
    vTcl:DefineAlias "$top.but55" "Button_add" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.but55
    text "$top.tex51" \
        -background white -font "-family {Segoe UI} -size 9" \
        -foreground black -height 294 -highlightbackground #d9d9d9 \
        -highlightcolor black -insertbackground black \
        -selectbackground #d9d9d9 -selectforeground black -width 308 \
        -wrap word 
    $top.tex51 configure -font "TkTextFont"
    $top.tex51 insert end text
    vTcl:DefineAlias "$top.tex51" "batch_code" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.tex51
    label "$top.lab59" \
        -activebackground #d9d9d9 -activeforeground black -anchor w \
        -background #d9d9d9 -compound left -disabledforeground #a3a3a3 \
        -font "-family {Segoe UI} -size 6" -foreground black \
        -highlightbackground #d9d9d9 -highlightcolor black -text "Buchner IT" 
    vTcl:DefineAlias "$top.lab59" "Label1" vTcl:WidgetProc "TaskoFix" 1
    vTcl:copy_lock $top.lab59
    ###################
    # SETTING GEOMETRY
    ###################
    place $top.lab49 \
        -in $top -x 0 -relx 0.061 -y 0 -rely 0.323 -width 0 -relwidth 0.058 \
        -height 0 -relheight 0.045 -anchor nw -bordermode ignore 
    place $top.lab48 \
        -in $top -x 0 -relx 0.068 -y 0 -rely 0.246 -width 0 -relwidth 0.058 \
        -height 0 -relheight 0.045 -anchor nw -bordermode ignore 
    place $top.tLa50 \
        -in $top -x 0 -relx 0.067 -y 0 -rely 0.178 -width 0 -relwidth 0.056 \
        -height 0 -relheight 0.038 -anchor nw -bordermode ignore 
    place $top.tLa53 \
        -in $top -x 0 -relx 0.047 -y 0 -rely 0.111 -width 0 -relwidth 0.09 \
        -height 0 -relheight 0.039 -anchor nw -bordermode ignore 
    place $top.tLa49 \
        -in $top -x 0 -relx 0.017 -y 0 -rely 0.022 -width 0 -relwidth 0.138 \
        -height 0 -relheight 0.082 -anchor nw -bordermode ignore 
    place $top.but51 \
        -in $top -x 0 -relx 0.576 -y 0 -rely 0.248 -width 47 -relwidth 0 \
        -height 23 -relheight 0 -anchor nw -bordermode ignore 
    place $top.tEn52 \
        -in $top -x 0 -relx 0.136 -y 0 -rely 0.043 -width 0 -relwidth 0.397 \
        -height 0 -relheight 0.047 -anchor nw -bordermode ignore 
    place $top.tSp57 \
        -in $top -x 0 -relx 0.137 -y 0 -rely 0.107 -width 0 -relwidth 0.139 \
        -height 0 -relheight 0.047 -anchor nw -bordermode ignore 
    place $top.tEn56 \
        -in $top -x 0 -relx 0.136 -y 0 -rely 0.248 -width 255 -relwidth 0 \
        -height 22 -relheight 0 -anchor nw -bordermode ignore 
    place $top.tCo49 \
        -in $top -x 0 -relx 0.136 -y 0 -rely 0.178 -width 0 -relwidth 0.232 \
        -height 0 -relheight 0.047 -anchor nw -bordermode ignore 
    place $top.tCo47 \
        -in $top -x 0 -relx 0.305 -y 0 -rely 0.107 -width 0 -relwidth 0.227 \
        -height 0 -relheight 0.047 -anchor nw -bordermode ignore 
    place $top.tex47 \
        -in $top -x 0 -relx 0.136 -y 0 -rely 0.33 -width 0 -relwidth 0.522 \
        -height 0 -relheight 0.63 -anchor nw -bordermode ignore 
    place $top.scr81 \
        -in $top -x 0 -relx 0.712 -y 0 -rely 0.407 -width 0 -relwidth 0.273 \
        -height 0 -relheight 0.482 -anchor nw -bordermode ignore 
    place $top.but61 \
        -in $top -x 0 -relx 0.729 -y 0 -rely 0.899 -width 57 -relwidth 0 \
        -height 26 -relheight 0 -anchor nw -bordermode ignore 
    place $top.but60 \
        -in $top -x 0 -relx 0.864 -y 0 -rely 0.899 -width 57 -relwidth 0 \
        -height 26 -relheight 0 -anchor nw -bordermode ignore 
    place $top.but56 \
        -in $top -x 0 -relx 0.715 -y 0 -rely 0.332 -width 67 -relwidth 0 \
        -height 26 -relheight 0 -anchor nw -bordermode ignore 
    place $top.but57 \
        -in $top -x 0 -relx 0.856 -y 0 -rely 0.332 -width 77 -relwidth 0 \
        -height 26 -relheight 0 -anchor nw -bordermode ignore 
    place $top.but55 \
        -in $top -x 0 -relx 0.717 -y 0 -rely 0.246 -width 67 -relwidth 0 \
        -height 26 -relheight 0 -anchor nw -bordermode ignore 
    place $top.tex51 \
        -in $top -x 0 -relx 0.153 -y 0 -rely 0.33 -width 0 -relwidth 0.522 \
        -height 0 -relheight 0.63 -anchor nw -bordermode ignore 
    place $top.lab59 \
        -in $top -x 0 -relx 0.881 -y 0 -rely 0.257 -width 0 -relwidth 0.076 \
        -height 0 -relheight 0.026 -anchor nw -bordermode ignore 

    vTcl:FireEvent $base <<Ready>>
}

proc vTclWindow.top2 {base} {
    global vTcl
    if {$base == ""} {
        set base .top2
    }
    if {[winfo exists $base]} {
        wm deiconify $base; return
    }
    set top $base
    set target $base
    ###################
    # CREATING WIDGETS
    ###################
    vTcl::widgets::core::toplevel::createCmd $top -class Toplevel \
        -menu $top.m65 -background #d9d9d9 -highlightbackground #d9d9d9 \
        -highlightcolor black 
    wm focusmodel $top passive
    wm geometry $top 390x457+949+91
    update
    # set in toplevel.wgt.
    global vTcl
    global img_list
    set vTcl(save,dflt,origin) 0
    wm maxsize $top 3844 1061
    wm minsize $top 120 1
    wm overrideredirect $top 0
    wm resizable $top 1 1
    wm deiconify $top
    set toptitle "Task it easy - Editor"
    wm title $top $toptitle
    namespace eval ::widgets::${top}::ClassOption {}
    set ::widgets::${top}::ClassOption(-toptitle) $toptitle
    vTcl:DefineAlias "$top" "edit_window" vTcl:Toplevel:WidgetProc "" 1
    set vTcl(real_top) {}
    label "$top.lab62" \
        -activebackground #d9d9d9 -activeforeground black -anchor w \
        -background #d9d9d9 -compound left -disabledforeground #a3a3a3 \
        -font "-family {Segoe UI} -size 9" -foreground black \
        -highlightbackground #d9d9d9 -highlightcolor black -text "Task Name:" 
    vTcl:DefineAlias "$top.lab62" "Label2" vTcl:WidgetProc "edit_window" 1
    vTcl:copy_lock $top.lab62
    label "$top.lab64" \
        -activebackground #d9d9d9 -activeforeground black -anchor w \
        -background #d9d9d9 -compound left -disabledforeground #a3a3a3 \
        -font "-family {Segoe UI} -size 9" -foreground black \
        -highlightbackground #d9d9d9 -highlightcolor black -text "Interval:" 
    vTcl:DefineAlias "$top.lab64" "Label3" vTcl:WidgetProc "edit_window" 1
    vTcl:copy_lock $top.lab64
    label "$top.lab72" \
        -activebackground #d9d9d9 -activeforeground black -anchor w \
        -background #d9d9d9 -compound left -disabledforeground #a3a3a3 \
        -font "-family {Segoe UI} -size 9" -foreground black \
        -highlightbackground #d9d9d9 -highlightcolor black -text "Type:" 
    vTcl:DefineAlias "$top.lab72" "Label6" vTcl:WidgetProc "edit_window" 1
    vTcl:copy_lock $top.lab72
    label "$top.lab68" \
        -activebackground #d9d9d9 -activeforeground black -anchor w \
        -background #d9d9d9 -compound left -disabledforeground #a3a3a3 \
        -font "-family {Segoe UI} -size 9" -foreground black \
        -highlightbackground #d9d9d9 -highlightcolor black -text "Path:" 
    vTcl:DefineAlias "$top.lab68" "Label4" vTcl:WidgetProc "edit_window" 1
    vTcl:copy_lock $top.lab68
    label "$top.lab70" \
        -activebackground #d9d9d9 -activeforeground black -anchor w \
        -background #d9d9d9 -compound left -disabledforeground #a3a3a3 \
        -font "-family {Segoe UI} -size 9" -foreground black \
        -highlightbackground #d9d9d9 -highlightcolor black \
        -text "Script Code:" 
    vTcl:DefineAlias "$top.lab70" "Label5" vTcl:WidgetProc "edit_window" 1
    vTcl:copy_lock $top.lab70
    menu "$top.m65" \
        -activebackground #d9d9d9 -activeforeground black \
        -font "-family {Segoe UI} -size 9" -tearoff 0 
    button "$top.but73" \
        -activebackground #d9d9d9 -activeforeground black -background #30a329 \
        -command "save_changes" -disabledforeground #a3a3a3 \
        -font "-family {Segoe UI} -size 9" -foreground #ffffff \
        -highlightbackground #d9d9d9 -highlightcolor black \
        -text "Save Changes" 
    vTcl:DefineAlias "$top.but73" "Button_save_changes" vTcl:WidgetProc "edit_window" 1
    vTcl:copy_lock $top.but73
    ttk::entry "$top.tEn53" \
        -font "-family {Segoe UI} -size 9" -cursor xterm 
    vTcl:DefineAlias "$top.tEn53" "new_name" vTcl:WidgetProc "edit_window" 1
    vTcl:copy_lock $top.tEn53
    ttk::spinbox "$top.tSp58" \
        -from 1 -to 100 -font "-family {Segoe UI} -size 9" -justify center \
        -background white 
    vTcl:DefineAlias "$top.tSp58" "new_interval" vTcl:WidgetProc "edit_window" 1
    vTcl:copy_lock $top.tSp58
    ttk::combobox "$top.tCo71" \
        -values "Executable Powershell Batch" \
        -font "-family {Segoe UI} -size 9" -state readonly \
        -textvariable "combobox" 
    vTcl:DefineAlias "$top.tCo71" "new_program" vTcl:WidgetProc "edit_window" 1
    vTcl:copy_lock $top.tCo71
    ttk::entry "$top.tEn62" \
        -font "-family {Segoe UI} -size 9" -cursor xterm 
    vTcl:DefineAlias "$top.tEn62" "new_path" vTcl:WidgetProc "edit_window" 1
    vTcl:copy_lock $top.tEn62
    text "$top.tex64" \
        -background white -font "-family {Segoe UI} -size 9" \
        -foreground black -height 274 -highlightbackground #d9d9d9 \
        -highlightcolor black -insertbackground black \
        -selectbackground #d9d9d9 -selectforeground black -width 348 \
        -wrap word 
    $top.tex64 configure -font "TkTextFont"
    $top.tex64 insert end text
    vTcl:DefineAlias "$top.tex64" "new_batch_code" vTcl:WidgetProc "edit_window" 1
    ttk::combobox "$top.tCo66" \
        -values "Seconds Minutes Hours Days" \
        -font "-family {Segoe UI} -size 9" -state readonly \
        -textvariable "combobox" 
    vTcl:DefineAlias "$top.tCo66" "new_unit" vTcl:WidgetProc "edit_window" 1
    vTcl:copy_lock $top.tCo66
    text "$top.tex63" \
        -background white -font "-family {Segoe UI} -size 9" \
        -foreground black -height 274 -highlightbackground #d9d9d9 \
        -highlightcolor black -insertbackground black \
        -selectbackground #d9d9d9 -selectforeground black -width 348 \
        -wrap word 
    $top.tex63 configure -font "TkTextFont"
    $top.tex63 insert end text
    vTcl:DefineAlias "$top.tex63" "new_code" vTcl:WidgetProc "edit_window" 1
    vTcl:copy_lock $top.tex63
    ###################
    # SETTING GEOMETRY
    ###################
    place $top.lab62 \
        -in $top -x 0 -relx 0.027 -y 0 -rely 0.028 -width 0 -relwidth 0.175 \
        -height 0 -relheight 0.045 -anchor nw -bordermode ignore 
    place $top.lab64 \
        -in $top -x 0 -relx 0.077 -y 0 -rely 0.088 -width 0 -relwidth 0.113 \
        -height 0 -relheight 0.046 -anchor nw -bordermode ignore 
    place $top.lab72 \
        -in $top -x 0 -relx 0.11 -y 0 -rely 0.147 -width 0 -relwidth 0.087 \
        -height 0 -relheight 0.046 -anchor nw -bordermode ignore 
    place $top.lab68 \
        -in $top -x 0 -relx 0.11 -y 0 -rely 0.208 -width 0 -relwidth 0.087 \
        -height 0 -relheight 0.046 -anchor nw -bordermode ignore 
    place $top.lab70 \
        -in $top -x 0 -relx 0.41 -y 0 -rely 0.265 -width 0 -relwidth 0.19 \
        -height 0 -relheight 0.046 -anchor nw -bordermode ignore 
    place $top.but73 \
        -in $top -x 0 -relx 0.385 -y 0 -rely 0.921 -width 87 -relwidth 0 \
        -height 26 -relheight 0 -anchor nw -bordermode ignore 
    place $top.tEn53 \
        -in $top -x 0 -relx 0.205 -y 0 -rely 0.028 -width 0 -relwidth 0.6 \
        -height 0 -relheight 0.048 -anchor nw -bordermode ignore 
    place $top.tSp58 \
        -in $top -x 0 -relx 0.205 -y 0 -rely 0.088 -width 0 -relwidth 0.21 \
        -height 0 -relheight 0.048 -anchor nw -bordermode ignore 
    place $top.tCo71 \
        -in $top -x 0 -relx 0.205 -y 0 -rely 0.149 -width 0 -relwidth 0.359 \
        -height 0 -relheight 0.048 -anchor nw -bordermode ignore 
    place $top.tEn62 \
        -in $top -x 0 -relx 0.205 -y 0 -rely 0.208 -width 254 -relwidth 0 \
        -height 22 -relheight 0 -anchor nw -bordermode ignore 
    place $top.tex64 \
        -in $top -x 0 -relx 0.077 -y 0 -rely 0.306 -width 0 -relwidth 0.892 \
        -height 0 -relheight 0.6 -anchor nw -bordermode ignore 
    place $top.tCo66 \
        -in $top -x 0 -relx 0.444 -y 0 -rely 0.088 -width 0 -relwidth 0.362 \
        -height 0 -relheight 0.048 -anchor nw -bordermode ignore 
    place $top.tex63 \
        -in $top -x 0 -relx 0.051 -y 0 -rely 0.306 -width 0 -relwidth 0.892 \
        -height 0 -relheight 0.6 -anchor nw -bordermode ignore 

    vTcl:FireEvent $base <<Ready>>
}

proc 36 {args} {return 1}


Window show .
set btop1 ""
if {$vTcl(borrow)} {
    set btop1 .bor[expr int([expr rand() * 100])]
    while {[lsearch $btop1 $vTcl(tops)] != -1} {
        set btop1 .bor[expr int([expr rand() * 100])]
    }
}
set vTcl(btop) $btop1
Window show .top1 $btop1
if {$vTcl(borrow)} {
    $btop1 configure -background plum
}
set btop2 ""
if {$vTcl(borrow)} {
    set btop2 .bor[expr int([expr rand() * 100])]
    while {[lsearch $btop2 $vTcl(tops)] != -1} {
        set btop2 .bor[expr int([expr rand() * 100])]
    }
}
set vTcl(btop) $btop2
Window show .top2 $btop2
if {$vTcl(borrow)} {
    $btop2 configure -background plum
}

