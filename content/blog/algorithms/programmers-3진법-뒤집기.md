---
title: Programmers 3진법 뒤집기
date: 2021-07-19 17:07:87
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/68935

## Solution

```py
def solution(n):
    temp = ''
    while n > 0:
        n, mod = divmod(n, 3)
        temp += str(mod)
    return int(temp, 3)
```

- 다른 사람 풀이

```py
def solution(n):
    tmp = ''
    while n:
        tmp += str(n % 3)
        n = n // 3

    answer = int(tmp, 3)
    return answer
```
