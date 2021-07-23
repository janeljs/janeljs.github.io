---
title: Programmers 수박수박수박수박수박수
date: 2021-07-24 04:07:23
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12922

## Solution

```py
def solution(n):
    answer = ''
    for i in range(n):
        if i % 2 == 0:
            answer += '수'
        else:
            answer += '박'
    return answer
```

- 다른 사람 풀이

```py
def water_melon(n):
    s = "수박" * n
    return s[:n]
```
