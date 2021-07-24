---
title: Programmers 직사각형 별찍기
date: 2021-07-25 01:07:23
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12969

## Solution

```py
a, b = map(int, input().strip().split(' '))
for _ in range(b):
    for _ in range(a):
        print('*', end='')
    print()
```

- 다른 사람 풀이

```py
a, b = map(int, input().strip().split(' '))
answer = ('*'*a +'\n')*b
```
