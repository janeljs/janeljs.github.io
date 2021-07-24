---
title: Programmers x만큼의 간격이 있는 n개의 숫자
date: 2021-07-25 01:07:68
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12954

## Solution

```py
def solution(x, n):
    answer = []

    if x == 0:
        return [0] * n

    last = x * n
    for i in range(x, last, x):
        answer.append(i)
    answer.append(last)

    return answer
```

- 다른 사람 풀이

```py
def number_generator(x, n):
    return [i * x + x for i in range(n)]
```
