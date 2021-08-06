---
title: Programmers 카펫
date: 2021-08-07 01:08:68
category: search
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42842

## Solution

```py
def solution(brown, yellow):
    width = 0
    length = 0
    if yellow == 1:
        return [3, 3]
    for y in range(1, (yellow // 2) + 1):
        temp = yellow % y
        if temp == 0:
            length = y + 2
            width = yellow / y + 2
            if width * length == brown + yellow:
                return width, length
```

- 다른 사람 풀이

```py
def solution(brown, red):
    for i in range(1, int(red ** (1 / 2)) + 1):
        if red % i == 0:
            if 2 * (i + red // i) == brown - 4:
                return [red // i + 2, i + 2]
```
