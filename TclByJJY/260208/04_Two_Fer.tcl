proc two-fer {{name "you"}} {
#    throw {NOT_IMPLEMENTED} "Implement this procedure."
     return "One for $name, one for me."
}

### 배운 내용 ###
# 1.  지금 작성하신 proc two-fer {name}은 "무조건 인자를 1개 넣어야 한다"는 뜻이라서, 인자 없이 호출되면 함수 내부의 if 문에 도달하기도 전에 "wrong # args" 에러를 내며 뻗어버립니다.
# 2.  함수를 정의할 때 인자 부분을 {이름 기본값} 형태로 감싸주면, 인자가 들어오지 않았을 때 자동으로 해당 값을 사용합니다.
