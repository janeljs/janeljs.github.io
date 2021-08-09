---
title: Programmers 영어 끝말잇기
date: 2021-08-09 11:08:40
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12981

## Solution

```py
def solution(n, words):
    taken = [words[0]]
    score = [0] * n
    score[0] = 1

    for i in range(1, len(words)):
        turn = i % n
        if words[i][0] == words[i - 1][-1] and words[i] not in taken:
            taken.append(words[i])
            score[turn] += 1
        else:
            return [turn + 1, score[turn] + 1]

    return [0, 0]
```

- 다른 사람 풀이

```py
def solution(n, words):
    for p in range(1, len(words)):
        if words[p][0] != words[p - 1][-1] or words[p] in words[:p]:
            return [(p % n) + 1, (p // n) + 1]
    else:
        return [0, 0]
```
