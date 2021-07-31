---
title: Programmers 소수 찾기
date: 2021-08-01 02:08:30
category: prime number
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42839

## Solution

```py
from itertools import permutations


def solution(numbers):
    answer = 0
    cards = list(numbers)
    arr = []
    for i in range(1, len(cards) + 1):
        arr += list(map(''.join, permutations(cards, i)))
    arr = set(map(int, arr))
    for i in arr:
        if isprime(i):
            answer += 1
    return answer


def isprime(n):
    if n == 0 or n == 1:
        return False

    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False

    return True
```

- 다른 사람 풀이

```py
from itertools import permutations
def solution(n):
    a = set()
    for i in range(len(n)):
        a |= set(map(int, map("".join, permutations(list(n), i + 1))))
    a -= set(range(0, 2))
    for i in range(2, int(max(a) ** 0.5) + 1):
        a -= set(range(i * 2, max(a) + 1, i))
    return len(a)
```
