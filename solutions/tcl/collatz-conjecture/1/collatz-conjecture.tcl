proc steps {integer} {
#    throw {NOT_IMPLEMENTED} "Implement this procedure."

    if {$integer <= 0} {
        error "Only positive integers are allowed"
    }
    set step 0

    while {$integer != 1} {
            # step = step + 1
            incr step
            if {$integer%2} {
                set integer [expr {3*$integer+1}]
            } else {
                set integer [expr {$integer/2}]
            }
        }
    return $step

}
