---
title: Programmers 모음 사전
date: 2021-09-05 11:09:94
category: search
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/84512

```py
import sys

vowels = ['A', 'E', 'I', 'O', 'U']
sys.setrecursionlimit(100000)

arr = []


def dfs(v, depth):
    if depth > 5:
        return
    arr.append(v)
    for vowel in vowels:
        dfs(v + vowel, depth + 1)


def solution(word):
    dfs('', 0)
    print(arr)
    for i in range(len(arr)):
        if arr[i] == word:
            return i
```

- 다른 사람 풀이 1

```py
from itertools import product

solution = lambda word: sorted(["".join(c) for i in range(5) for c in product("AEIOU", repeat=i+1)]).index(word) + 1
```

- 다른 사람 풀이 2

```py
def solution(word):
    answer = 0
    for i, n in enumerate(word):
        answer += (5 ** (5 - i) - 1) / (5 - 1) * "AEIOU".index(n) + 1
    return answer
```
