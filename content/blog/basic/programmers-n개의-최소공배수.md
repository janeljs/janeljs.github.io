---
title: Programmers N개의 최소공배수
date: 2021-07-25 01:07:16
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12953

## Solution

```py
def solution(arr):
    answer = 1
    for n in arr:
        answer = lcm(answer, n)
    return answer


def lcm(a, b):
    return a * b / gcd(a, b)


def gcd(a, b):
    if b > a:
        a, b = b, a

    while (b > 0):
        temp = b
        b = a % b
        a = temp
    return a
```

- 다른 사람 풀이
  - gcd 함수가 있었다.

```py
from fractions import gcd


def nlcm(num):
    answer = num[0]
    for n in num:
        answer = n * answer / gcd(n, answer)

    return answer
```
