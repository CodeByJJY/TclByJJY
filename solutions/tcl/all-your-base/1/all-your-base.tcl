proc rebase {inputBase digits outputBase} {
#    throw {NOT_IMPLEMENTED} "Implement this procedure."

     if {$inputBase < 2} {error "input base must be >= 2"}
     if {$outputBase < 2} {error "output base must be >= 2"}

     set decimalValue 0
     foreach d $digits {
         if {($d < 0) || ($d >= $inputBase)} {error "all digits must satisfy 0 <= d < input base"}
         # Horner's Method
         set decimalValue [expr {$decimalValue * $inputBase + $d}]
     }

     if {$decimalValue == 0} {return {0}}

     set result {}
     while {$decimalValue > 0} {
         lappend result [expr {$decimalValue % $outputBase}]
         set decimalValue [expr {$decimalValue / $outputBase}]
     }
     return [lreverse $result]
}
