---
title: Programmers 올바른 괄호
date: 2021-07-26 03:07:83
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12909

## Solution

```py
def solution(s):
    stack = []
    for p in s:
        if p == '(':
            stack.append(p)
        else:
            if stack:
                if stack[-1] == '(':
                    stack.pop(-1)
            else:
                stack.append(p)
    return len(stack) == 0
```

- 다른 사람 풀이

```py
def is_pair(s):
    x = 0
    for w in s:
        if x < 0:
            break
        x = x+1 if w=="(" else x-1 if w==")" else x
    return x==0
```

- 풀어쓴 코드

```py
def solution(s):
    x = 0
    for w in s:
        if x < 0:
            break
        if w == "(":
            x = x + 1
        elif w == ")":
            x = x - 1
        else:
            continue
    return x == 0
```
