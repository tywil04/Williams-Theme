package require Tk 8.6

namespace eval ttk::theme::minimal-tkinter {
	package provide ttk::theme::minimal-tkinter 1.0

	ttk::style theme create minimal-tkinter -parent clam -settings {
		variable images
		set imgdir [file join [file dirname [info script]] .]

		# Get all Textures
		foreach file [glob -directory $imgdir/checkmark *.png] {
			set img [file tail [file rootname $file]]
			set images($img) [image create photo -file $file -format png]
		}
		foreach file [glob -directory $imgdir/scale *.png] {
			set img [file tail [file rootname $file]]
			set images($img) [image create photo -file $file -format png]
		}
		foreach file [glob -directory $imgdir/shapes *.png] {
			set img [file tail [file rootname $file]]
			set images($img) [image create photo -file $file -format png]
		}
		foreach file [glob -directory $imgdir/radio *.png] {
			set img [file tail [file rootname $file]]
			set images($img) [image create photo -file $file -format png]
		}
		foreach file [glob -directory $imgdir/switch *.png] {
			set img [file tail [file rootname $file]]
			set images($img) [image create photo -file $file -format png]
		}
		foreach file [glob -directory $imgdir/buttons *.png] {
			set img [file tail [file rootname $file]]
			set images($img) [image create photo -file $file -format png]
		}
		foreach file [glob -directory $imgdir/misc *.png] {
			set img [file tail [file rootname $file]]
			set images($img) [image create photo -file $file -format png]
		}
		foreach file [glob -directory $imgdir/combobox *.png] {
			set img [file tail [file rootname $file]]
			set images($img) [image create photo -file $file -format png]
		}
		foreach file [glob -directory $imgdir/tab *.png] {
			set img [file tail [file rootname $file]]
			set images($img) [image create photo -file $file -format png]
		}
		foreach file [glob -directory $imgdir/scrollbars *.png] {
			set img [file tail [file rootname $file]]
			set images($img) [image create photo -file $file -format png]
		}
		foreach file [glob -directory $imgdir/tree *.png] {
			set img [file tail [file rootname $file]]
			set images($img) [image create photo -file $file -format png]
		}
		foreach file [glob -directory $imgdir/arrows *.png] {
			set img [file tail [file rootname $file]]
			set images($img) [image create photo -file $file -format png]
		}
		
		# Define Colours
		array set colours {
		    -foreground "#ffffff"
		    -background "#333333"
		    -selected-foreground "#ffffff"
		    -selected-background "#007fff"
		}
		
		ttk::style configure . \
		    -background $colours(-background) \
		    -foreground $colours(-foreground) \
		    -troughcolor $colours(-background) \
		    -focuscolor $colours(-selected-background) \
		    -selectbackground $colours(-selected-background) \
		    -selectforeground $colours(-selected-foreground) \
		    -insertcolor $colours(-foreground) \
		    -insertwidth 1 \
		    -fieldbackground $colours(-selected-background) \
		    -font {"Segoe Ui" 10} \
		    -borderwidth 1 \
		    -relief flat

		tk_setPalette background [ttk::style lookup . -background] \
		    foreground [ttk::style lookup . -foreground] \
		    highlightColor [ttk::style lookup . -focuscolor] \
		    selectBackground [ttk::style lookup . -selectbackground] \
		    selectForeground [ttk::style lookup . -selectforeground] \
		    activeBackground [ttk::style lookup . -selectbackground] \
		    activeForeground [ttk::style lookup . -selectforeground]

		ttk::style map . -foreground [list disabled $colours(-foreground)]

		option add *font [ttk::style lookup . -font]
		option add *Menu.selectcolor $colours(-foreground)

		# Config Layouts
		ttk::style layout TButton {Button.button -children {Button.padding -children {Button.label -side left -expand true}}}

		ttk::style layout Toolbutton {Toolbutton.button -children {Toolbutton.padding -children {Toolbutton.label -side left -expand true}}}

		ttk::style layout TMenubutton {Menubutton.button -children {Menubutton.padding -children {Menubutton.indicator -side right ; Menubutton.label -side right -expand true}}}

		ttk::style layout TOptionMenu {OptionMenu.button -children {OptionMenu.padding -children {OptionMenu.indicator -side right ; OptionMenu.label -side right -expand true}}}

		ttk::style layout Accent {AccentButton.button -children {AccentButton.padding -children {AccentButton.label -side left -expand true}}}

		ttk::style layout TCheckbutton {Checkbutton.button -children {Checkbutton.padding -children {Checkbutton.indicator -side left ; Checkbutton.label -side right -expand true}}}

		ttk::style layout Switch {Switch.button -children {Switch.padding -children {Switch -side left ; Switch.label -side right -expand true}}}

		ttk::style layout Toggle {ToggleButton.button -children {ToggleButton.padding -children {ToggleButton.label -side left -expand true}}}

		ttk::style layout TRadiobutton {Radiobutton.button -children {Radiobutton.padding -children {Radiobutton.indicator -side left ; Radiobutton.label -side right -expand true}}}

		ttk::style layout Vertical.TScrollbar {Vertical.Scrollbar.trough -sticky ns -children {Vertical.Scrollbar.thumb -expand true}}

		ttk::style layout Horizontal.TScrollbar {Horizontal.Scrollbar.trough -sticky ew -children {Horizontal.Scrollbar.thumb -expand true}}

		ttk::style layout TCombobox {Combobox.field -sticky nswe -children {Combobox.padding -expand true -sticky nswe -children {Combobox.textarea -sticky nswe}} Combobox.button -side right -sticky ns -children {Combobox.arrow -sticky nsew}}

		ttk::style layout TSpinbox {Spinbox.field -sticky nsew -children {Spinbox.padding -expand true -sticky nswe -children {Spinbox.textarea -sticky nswe}} Spinbox.button -side right -sticky ns -children {null -side right -children {Spinbox.uparrow -side top ; Spinbox.downarrow -side bottom}}}

		ttk::style layout Horizontal.TSeparator {Horizontal.separator -sticky nswe}

		ttk::style layout Vertical.TSeparator {Vertical.separator -sticky nswe}

		ttk::style layout Card.TFrame {Card.field {Card.padding -expand 1}}

		ttk::style layout TLabelframe {Labelframe.border {Labelframe.padding -expand 1 -children {Labelframe.label -side right}}}

		ttk::style layout TNotebook.Tab {Notebook.tab -children {Notebook.padding -side top -children {Notebook.label -side top -sticky {}}}}

		ttk::style layout Treeview.Item {Treeitem.padding -sticky nswe -children {Treeitem.indicator -side left -sticky {} ; Treeitem.image -side left -sticky {} ; Treeitem.text -side left -sticky {}}}

		
		# Sash Hack
		ttk::style configure Sash -gripcount 0
		
		# Config Styles
		# Button
		ttk::style configure TButton -padding {8 4 8 4} -width -10 -anchor center

		ttk::style element create Button.button image \
		    [list $images(button) \
		    {selected disabled} $images(button) \
		        disabled $images(button) \
		        pressed $images(button) \
		        selected $images(button) \
		        active $images(button-hover) \
		    ] -border 4 -sticky ewns

		# AccentButton
		ttk::style configure Accent -padding {8 4 8 4} -width -10 -anchor center

		ttk::style element create AccentButton.button image \
		    [list $images(blue-button) \
		    {selected disabled} $images(blue-button-hover) \
		        disabled $images(blue-button-hover) \
		        pressed $images(blue-button) \
		        selected $images(blue-button) \
		        active $images(blue-button-hover) \
		    ] -border 4 -sticky ewns

		# ToggleButton
		ttk::style configure Toggle -padding {8 4 8 4} -width -10 -anchor center

		ttk::style element create ToggleButton.button image \
		    [list $images(button) \
		        {selected disabled} $images(button-hover) \
		        disabled $images(button-hover) \
		        {pressed selected} $images(blue-button-hover) \
		        {active selected} $images(blue-button-hover) \
		        selected $images(blue-button) \
		        {pressed !selected} $images(button-hover) \
		        active $images(button-hover) \
		    ] -border 4 -sticky ewns

		# Toolbutton
		ttk::style configure Toolbutton -padding {8 4 8 4} -width -10 -anchor center

		ttk::style element create Toolbutton.button image \
		    [list $images(empty) \
		    {selected disabled} $images(empty) \
		        disabled $images(empty) \
		        pressed $images(button) \
		        selected $images(button) \
		        active $images(button) \
		    ] -border 4 -sticky ewns

		# Menubutton
		ttk::style configure TMenubutton -padding {8 4 4 4}

		ttk::style element create Menubutton.button \
		    image [list $images(button) \
		        disabled $images(button) \
		        pressed $images(button) \
		        active $images(button-hover) \
		    ] -border 4 -sticky ewns 

		ttk::style element create Menubutton.indicator \
		    image [list $images(arrow-down) \
		        active   $images(arrow-down) \
		        pressed  $images(arrow-down) \
		        disabled $images(arrow-down) \
		    ] -width 15 -sticky e
		
		# Checkbutton
		ttk::style configure TCheckbutton -padding 4

		ttk::style element create Checkbutton.indicator image \
		    [list $images(checkmark-holder) \
		        {selected disabled} $images(checkmark-disabled) \
		        disabled $images(checkmark-holder) \
		        {pressed selected} $images(checkmark-hover) \
		        {active selected} $images(checkmark-hover) \
		        selected $images(checkmark) \
		        {pressed !selected} $images(checkmark-disabled) \
		        active $images(checkmark-disabled) \
		    ] -width 26 -sticky w

		# Switch
		ttk::style element create Switch image \
		    [list $images(switch-off) \
		        {selected disabled} $images(switch-disabled) \
		        disabled $images(switch-off) \
		        {pressed selected} $images(switch-on-hover) \
		        {active selected} $images(switch-on-hover) \
		        selected $images(switch-on) \
		        {pressed !selected} $images(switch-off-hover) \
		        active $images(switch-off-hover) \
		    ] -width 46 -sticky w
		    
		# Radiobutton
		ttk::style configure TRadiobutton -padding 4

		ttk::style element create Radiobutton.indicator image \
		    [list $images(radio-holder) \
		        {selected disabled} $images(radio-disabled) \
		        disabled $images(radio-holder) \
		        {pressed selected} $images(radio-hover) \
		        {active selected} $images(radio-hover) \
		        selected $images(radio) \
		        {pressed !selected} $images(radio-disabled) \
		        active $images(radio-disabled) \
		    ] -width 26 -sticky w
		
		# Scrollbar
		ttk::style element create Horizontal.Scrollbar.trough image $images(scale-horizontal) -sticky ew -border 6 -padding 0

		ttk::style element create Horizontal.Scrollbar.thumb \
		     image [list $images(scrollbar-horizontal) \
		        disabled $images(scrollbar-horizontal-track) \
		        pressed $images(scrollbar-horizontal-hover) \
		        active $images(scrollbar-horizontal) \
		    ] -sticky ew -border 6 -padding 0

		ttk::style element create Vertical.Scrollbar.trough image $images(scrollbar-vertical-track) -sticky ns -border 6 -padding 0

		ttk::style element create Vertical.Scrollbar.thumb \
		    image [list $images(scrollbar-vertical) \
		        disabled  $images(scrollbar-vertical-track) \
		        pressed $images(scrollbar-vertical-hover) \
		        active $images(scrollbar-vertical-hover) \
		    ] -sticky ns -border 6 -padding 0

		# Scale
		ttk::style element create Horizontal.Scale.trough image $images(scale-horizontal) -border 4 -padding 0

		ttk::style element create Horizontal.Scale.slider \
		    image [list $images(scale-selector) \
		        disabled $images(scale-selector-disabled) \
		        pressed $images(scale-selector-hover) \
		        active $images(scale-selector-hover) \
		    ] -sticky {}

		ttk::style element create Vertical.Scale.trough image $images(scale-vertical) -border 4 -padding 0

		ttk::style element create Vertical.Scale.slider \
		    image [list $images(scale-selector) \
		        disabled $images(scale-selector-disabled) \
		        pressed $images(scale-selector-hover) \
		        active $images(scale-selector-hover) \
		    ] -sticky {}

		# Progressbar
		ttk::style element create Horizontal.Progressbar.trough image $images(scrollbar-horizontal-track) -sticky ew -border 2 -padding 0
		ttk::style element create Horizontal.Progressbar.pbar image $images(scrollbar-horizontal) -sticky ew -border 2 -padding 0
		ttk::style element create Vertical.Progressbar.trough image $images(scrollbar-vertical-track) -sticky ns -border 2 -padding 0
		ttk::style element create Vertical.Progressbar.pbar image $images(scrollbar-vertical) -sticky ns -border 2 -padding 0

		# Entry
		ttk::style element create Entry.field \
		    image [list $images(outline) \
		        {focus hover} $images(outline-focus) \
		        invalid $images(outline-invalid) \
		        disabled $images(outline) \
		        focus $images(outline-focus) \
		        hover $images(outline-hover) \
		    ] -border 5 -padding {8} -sticky news
		    
		# OptionMenu
		ttk::style configure TOptionMenu -padding {8 4 4 4}

		ttk::style element create OptionMenu.button \
		    image [list $images(button) \
		        disabled $images(button) \
		        pressed $images(button) \
		        active $images(button-hover) \
		    ] -border 4 -sticky ewns 

		ttk::style element create OptionMenu.indicator \
		    image [list $images(arrow-down) \
		        active   $images(arrow-down) \
		        pressed  $images(arrow-down) \
		        disabled $images(arrow-down) \
		    ] -width 15 -sticky e

		# Combobox
		ttk::style map TCombobox -selectbackground [list \
		    {!focus} $colours(-selected-background) \
		    {readonly hover} $colours(-selected-background) \
		    {readonly focus} $colours(-selected-background) \
		]
		    
		ttk::style map TCombobox -selectforeground [list \
		    {!focus} $colours(-selected-foreground) \
		    {readonly hover} $colours(-selected-foreground) \
		    {readonly focus} $colours(-selected-foreground) \
		]

		ttk::style element create Combobox.field \
		    image [list $images(outline) \
		        {readonly disabled} $images(button) \
		        {readonly pressed} $images(button) \
		        {readonly focus hover} $images(button-hover) \
		        {readonly focus} $images(button-hover) \
		        {readonly hover} $images(button-hover) \
		        {focus hover} $images(outline-focus) \
		        readonly $images(button) \
		        invalid $images(outline-invalid) \
		        disabled $images(outline) \
		        focus $images(outline-focus) \
		        hover $images(outline-hover) \
		    ] -border 5 -padding {8}
		    
		ttk::style element create Combobox.button \
		    image [list $images(combobutton) \
		         {!readonly focus} $images(combobutton-focus) \
		         {readonly focus} $images(combobutton-hover) \
		         {readonly hover} $images(combobutton-hover)
		    ] -border 5 -padding {2 6 6 6}

		ttk::style element create Combobox.arrow image $images(arrow-down) -width 15 -sticky e

		# Spinbox
		ttk::style element create Spinbox.field \
		    image [list $images(outline) \
		        invalid $images(outline-invalid) \
		        disabled $images(outline) \
		        focus $images(outline-focus) \
		        hover $images(outline-hover) \
		    ] -border 5 -padding {8} -sticky news

		ttk::style element create Spinbox.uparrow \
		    image [list $images(arrow-up) \
		        disabled $images(arrow-up) \
		        pressed $images(arrow-selected-up) \
		        active $images(arrow-selected-up) \
		    ] -border 4 -width 15 -sticky e

		ttk::style element create Spinbox.downarrow \
		    image [list $images(arrow-down) \
		        disabled $images(arrow-down) \
		        pressed $images(arrow-selected-down) \
		        active $images(arrow-selected-down) \
		    ] -border 4 -width 15 -sticky e
		    
		ttk::style element create Spinbox.button \
		    image [list $images(combobutton) \
		         {!readonly focus} $images(combobutton-focus) \
		         {readonly focus} $images(combobutton-hover) \
		         {readonly hover} $images(combobutton-hover) \
		    ] -border 5 -padding {2 6 6 6}

		# Notebook
		ttk::style element create Notebook.client image $images(tab-holder) -border 6

		ttk::style element create Notebook.tab \
		    image [list $images(tab) \
		    	{active selected} $images(selected-tab-hover) \
		        selected $images(selected-tab) \
		        active $images(tab-hover) \
		    ] -border 8 -padding {14 4}

		# Treeview
		ttk::style element create Treeview.field image $images(card) -border 5 -padding 1
		ttk::style element create Treeheading.cell image $images(tree) -border 5 -padding 0 -sticky ewns
		ttk::style element create Treeitem.indicator image [list $images(arrow-right) user2 $images(empty) user1 $images(arrow-down)] -width 26 -sticky {}
		ttk::style configure Treeview -background $colours(-background)
		ttk::style configure Treeview.Item -padding {0 0 0 0}
		ttk::style map Treeview -background [list selected $colours(-selected-background)] -foreground [list selected $colours(-selected-foreground)]

		# Sizegrip
		ttk::style element create Sizegrip.sizegrip image $images(size) -sticky ewns

		# Separator
		ttk::style element create Horizontal.separator image $images(separator)
		ttk::style element create Vertical.separator image $images(separator)
		
		# Card
		ttk::style element create Card.field image $images(card) -border 10 -padding 4 -sticky news 

		# LabelFrame
		ttk::style element create Labelframe.border image $images(card) -border 5 -padding 4 -sticky news
	}
}
