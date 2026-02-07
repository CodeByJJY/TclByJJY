#!/usr/bin/env tclsh

proc isLeapYear {year} {
#    throw {NOT_IMPLEMENTED} "Implement this procedure."

    return [expr {($year % 4 == 0 && $year % 100 != 0) || ($year % 400 == 0)}]
}
