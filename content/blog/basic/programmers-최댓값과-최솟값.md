---
title: Programmers 최댓값과 최솟값
date: 2021-07-26 00:07:03
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12939

## Solution

```py
def solution(s):
    answer = sorted(list(map(int, s.split(' '))))
    return str(answer[0]) + " " + str(answer[-1])
```
