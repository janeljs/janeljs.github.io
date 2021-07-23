---
title: Programmers 서울에서 김서방 찾기
date: 2021-07-24 03:07:12
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12919

## Solution

- Jane이다😆

```py
def solution(seoul):
    for idx, name in enumerate(seoul):
        if name=='Kim':
            return "김서방은 " + str(idx) + "에 있다"
```

- 다른 사람 풀이

```py
def findKim(seoul):
    return "김서방은 {}에 있다".format(seoul.index('Kim'))
```
