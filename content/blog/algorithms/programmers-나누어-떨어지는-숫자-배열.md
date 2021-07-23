---
title: Programmers 나누어 떨어지는 숫자 배열
date: 2021-07-24 01:07:21
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12910

## Solution

```py
def solution(arr, divisor):
    answer = []
    for n in arr:
        if n % divisor == 0:
            answer.append(n)
    return sorted(answer) if answer else [-1]
```

- 다른 사람 풀이

```py
def solution(arr, divisor): return sorted([n for n in arr if n % divisor == 0]) or [-1]
```
