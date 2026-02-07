namespace eval resistorColor {

    variable colorList {black brown red orange yellow green blue violet grey white}
    
    proc colorCode {color} {
#        throw {NOT_IMPLEMENTED} "Implement this procedure."
         variable colorList

         set index [lsearch -exact $colorList $color]
         if {$index == -1} {
             error "Invalid color: $color"
         }
         return $index
    }

    proc colors {} {
#        throw {NOT_IMPLEMENTED} "Implement this procedure."
         variable colorList
         return $colorList
    }
}

#### 배운 내용 ####
### 1. 네임스페이스와 변수 범위 (Namespace & Scope)
#      - namespace eval: 관련 있는 함수와 변수들을 하나의 공간으로 묶어 이름 충돌을 방지함 (모듈화).
#      - variable (Namespace 레벨): 네임스페이스 내의 모든 함수가 공유하는 '거실'의 공용 변수를 선언함.
#      - variable (함수 내부): "거실에 있는 공용 변수를 이 방(함수) 안에서도 쓰겠다"고 명시적으로 연결해주는 과정이 필수임.
### 2. 인자 처리와 args (Procedure Arguments)
#      - args: 개수가 정해지지 않은 가변 인자를 리스트 형태로 싹 다 받는 특별한 예약어.
#      - 명시적 인자: 인자 개수가 확실할 때는 args 대신 이름을 지정(예: color)하는 것이 리스트 처리를 줄여 코드를 더 간결하게 만듦.
### 3. 리스트 검색과 매칭 모드 (lsearch)
##    3.1. 검색 모드
#      - -glob (기본값): *, ? 등을 사용하는 와일드카드 매칭입니다. 그래서 bl*을 넣으면 "bl"로 시작하는 첫 번째 항목의 인덱스를 반환해 버립니다.
#      - -regexp: 정규표현식을 사용합니다.
#      - -exact: 문자열이 완전히 똑같아야만 매칭으로 인정합니다.
##    3.2. 검색 결과 형태
#      - -all: 일치하는 모든 항목의 인덱스를 리스트로 반환합니다. (기본은 첫 번째 것만 반환)
#      - -inline: 인덱스 번호가 아니라, 찾은 항목의 내용(문자열)을 직접 반환합니다.
#      - -not: 검색 조건과 일치하지 않는 항목들을 찾습니다.
#      - -start <index>: 리스트의 처음이 아닌, 특정 위치부터 검색을 시작합니다.
##    3.3. 검색 모드
#      - -integer / -real: 리스트 항목을 문자열이 아닌 숫자나 실수로 취급하여 비교합니다.
### 4. 에러 핸들링과 제어 흐름 (Error & Control Flow)
#      - error: 강제로 실행을 중단하고 에러 메시지와 함께 상태 코드 1을 반환함.
#      - 조기 종료 (Early Exit): if 문으로 예외 상황을 먼저 검사하고 error를 던지면, 굳이 else 문을 쓰지 않아도 이후 코드가 실행되지 않아 코드가 훨씬 깔끔해짐.
### 5. Tcl의 철학: "Everything is a String"
#      - 모든 명령은 명령어 인자1 인자2 구조이며, 띄어쓰기와 중괄호({ })의 위치 하나가 실행 결과에 결정적인 영향을 미침.
