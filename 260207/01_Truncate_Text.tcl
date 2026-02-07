package require Tcl 9.0

proc truncate {input} {
#    throw {NOT_IMPLEMENTED} "Implement this procedure."

    return [string range $input 0 4]
}
