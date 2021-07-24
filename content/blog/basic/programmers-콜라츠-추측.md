---
title: Programmers 콜라츠 추측
date: 2021-07-25 00:07:48
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12943

## Solution

```py
count = 0


def solution(num):
    global count
    if num == 1:
        return count
    elif num % 2 == 0:
        num /= 2
        count += 1
    else:
        num *= 3
        num += 1
        count += 1
    if num != 1:
        solution(num)

    return count if count <= 500 else -1
```
