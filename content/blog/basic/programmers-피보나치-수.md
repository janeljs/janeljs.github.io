---
title: Programmers 피보나치 수
date: 2021-07-26 00:07:72
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12945

## Solution

```py
def solution(n):
    return fibo(n) % 1234567


def fibo(n):
    curr, next = 0, 1
    for _ in range(n):
        curr, next = next, curr + next
    return curr
```
