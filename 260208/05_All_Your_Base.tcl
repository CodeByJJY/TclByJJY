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

##### 배운 내용 #####
### 1. 알고리즘
##   1) Horner's method
#      - 거듭제곱을 직접 계산하지 않고, [현재 합계 $\times$ 진법 $+$ 다음 자릿수]를 반복하여 다항식이나 진법의 값을 구하는 방법.
#      - 하드웨어의 Shift-and-Add과 동일한 원리. 연산량 단축.
### 2. 문법
##   1) lappend
#      - 리스트의 끝에 새로운 원소를 추가합니다.
#      - set과 달리, 변수명 앖에 $를 붙이지 않습니다.
##   2) lreverse
#      - 리스트의 순서를 완전히 뒤집습니다.
#      - 10진수를 다른 진법으로 바꿀 때 나머지는 낮은 자릿수(일의 자리)부터 구해지므로, 최종 결과를 올바른 순서로 출력하기 위해 반드시 필요합니다.
##   3) foreach
#      - 리스트의 각 원소를 하나씩 순회하며 반복 작업을 수행합니다.
#      - foreach (원소 가리키는 문자) $(리스트) {...}
##   4) 변수 참조($) : 변수의 이름을 쓸 때(set, lappend)와, 변수의 값을 꺼낼 때($var)를 잘 구분해야 한다.
##   5) expr에서 정수끼리 나눗셈(/) 연산을 할 때는, 자동으로 몫만 남겨져서 저장된다.
