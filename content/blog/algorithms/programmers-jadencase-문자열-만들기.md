---
title: Programmers JadenCase 문자열 만들기
date: 2021-07-25 02:07:89
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12951

## Solution

```py
def solution(s):
    words = s.split()
    print(words)
    for i in range(len(words)):
        if words[i][0].isdigit():
            words[i] = words[i][0] + words[i][1:].lower()
        else:
            words[i] = words[i][0].upper() + words[i][1:].lower()
    answer = words[0]
    idx = len(answer)
    word_idx = 1
    while idx < len(s):
        if s[idx] == ' ':
            answer += ' '
            idx += 1
        else:
            answer += str(words[word_idx])
            idx += len(words[word_idx])
            word_idx += 1
    return answer


solution("3people  unFollowed me")
```

- title()이라는 함수가 있었다. But, 아래처럼 풀면 새롭게 추가된 테스트케이스를 통과하지 못한다. 그냥 함수가 있다는 것만 알아두면 될 것 같다.

```py
def Jaden_Case(s):
    return s.title()
```

- 대신 capitalize()를 사용하면 된다.

```py
def solution(s):
    return ' '.join([word.capitalize() for word in s.split(" ")])
```
