---
title: Programmers 문자열을 정수로 바꾸기
date: 2021-07-24 04:07:91
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12925

## Solution

```py
def solution(s):
    return int(s)
```

- 다른 사람 풀이

```py
def strToInt(str):
    result = 0

    for idx, number in enumerate(str[::-1]):
        if number == '-':
            result *= -1
        else:
            result += int(number) * (10 ** idx)

    return result
```
