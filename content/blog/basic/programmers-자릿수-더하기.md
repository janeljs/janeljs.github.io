---
title: Programmers 자릿수 더하기
date: 2021-07-24 05:07:68
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12931

## Solution

```py
def solution(n):
    return sum(map(int, list(str(n))))
```

- 다른 사람 풀이

```py
def sum_digit(number):
    if number < 10:
        return number;
    return (number % 10) + sum_digit(number // 10)
```
