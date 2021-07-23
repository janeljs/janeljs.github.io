---
title: Programmers 소수 찾기
date: 2021-07-24 03:07:21
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12921

## Solution

```py
def solution(n):
    answer = 0
    for i in range(1, n + 1):
        if is_prime(i):
            answer += 1
    return answer


def is_prime(n):
    if n < 2:
        return False

    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False
    return True
```

- 다른 사람 풀이

```py
def solution(n):
    num = set(range(2, n + 1))

    for i in range(2, n + 1):
        if i in num:
            num -= set(range(2 * i, n + 1, i))
    return len(num)
```
