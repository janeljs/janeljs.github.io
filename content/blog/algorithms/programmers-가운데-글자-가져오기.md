---
title: Programmers 가운데 글자 가져오기
date: 2021-07-20 14:07:97
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12903

## Solution

```py
def solution(s):
    length = len(s)
    half = length // 2
    if length % 2 == 0:
        return s[(half)-1:half+1]
    else:
        return s[half]
```

- 다른 사람 풀이

```py
def string_middle(str):
    return str[(len(str)-1)//2:len(str)//2+1]
```
