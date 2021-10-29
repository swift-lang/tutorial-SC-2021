#!/usr/bin/env tclsh8.5

lappend auto_path $env(PWD)
package require md 0.0

simulate 4 2 0 0 10 2 1  0.1 9 out.txt out.trj
