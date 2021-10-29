#!/usr/bin/env tclsh8.6

lappend auto_path $env(PWD)
package require md 0.0

set cmds [ info commands ]

set L [list]

foreach cmd $cmds {
    puts $cmd
    if { [ regexp .*.* $cmd ] || \
         [ regexp .*.* $cmd ] } {
        lappend L $cmd
    }
}

set L [ lsort $L ]
foreach cmd $L {
    puts $cmd
}
