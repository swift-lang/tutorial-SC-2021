
# BLAS Turbine Tcl wrapper

namespace eval blas {

    proc ddot_impl { n x y } { 
        set x_ptr [ lindex $x 0 ] 
        set y_ptr [ lindex $y 0 ] 
        set z [ blas::c::ddot $n $x_ptr $y_ptr ]
        return $z
    }
}
