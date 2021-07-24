---
title: Programmers 최대공약수와 최소공배수
date: 2021-07-25 00:07:71
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12940

## Solution

```py
def solution(n, m):
    gcd = get_gcd(n, m)
    return gcd, n * m / gcd


def get_gcd(a, b):
    if b > a:
        a, b = b, a
    while b > 0:
        temp = b
        b = a % b
        a = temp
    return a
```

- 다른 사람 풀이

```py
def gcdlcm(a, b):
    c, d = max(a, b), min(a, b)
    t = 1
    while t > 0:
        t = c % d
        c, d = d, t
    answer = [c, int(a*b/c)]

    return answer
```
