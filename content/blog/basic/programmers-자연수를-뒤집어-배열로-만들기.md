---
title: Programmers 자연수를 뒤집어 배열로 만들기
date: 2021-07-24 05:07:93
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12932

## Solution

```py
def solution(n):
    result = list(map(int, list(str(n))))
    result.reverse()
    return result
```

- 다른 사람 풀이

```py
def digit_reverse(n):
    return list(map(int, reversed(str(n))))
```
