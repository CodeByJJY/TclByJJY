proc findAnagrams {subject candidates} {
    set results {}
    # 비교를 위해 기준 단어를 소문자로 바꾸고, 글자 단위로 쪼개 정렬합니다.
    set lowerSubject [string tolower $subject]
    set sortedSubject [lsort [split $lowerSubject ""]]

    foreach candid $candidates {
        set lowerCandid [string tolower $candid]

        # 조건 1: 원래 단어와 똑같은 단어는 애너그램이 아님 (Skip)
        if {$lowerSubject eq $lowerCandid} {
            continue
        }

        # 조건 2: 글자들을 정렬했을 때 내용이 같으면 애너그램!
        set sortedCandid [lsort [split $lowerCandid ""]]
        
        if {$sortedSubject eq $sortedCandid} {
            # 결과는 원래 후보의 대소문자 형태 그대로 저장
            lappend results $candid
        }
    }
    return $results
}