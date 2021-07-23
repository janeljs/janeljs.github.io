---
title: Programmers 두 정수 사이의 합
date: 2021-07-24 01:07:48
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12912

## Solution

```py
def solution(a, b):
    if a == b:
        return a
    if a > b:
        temp = a
        a = b
        b = temp
    answer = 0
    for n in range(a, b + 1):
        answer += n
    return answer
```

- 다른 사람 풀이

```py
def adder(a, b):
    if a > b: a, b = b, a
    return sum(range(a,b+1))
```
