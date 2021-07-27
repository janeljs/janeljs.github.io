---
title: Programmers 스킬트리
date: 2021-07-28 03:07:41
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/49993

## Solution

```py
def solution(skill, skill_trees):
    answer = len(skill_trees)

    for s in skill_trees:
        idx = 0
        for i in range(len(s)):
            if s[i] not in skill:
                continue
            if s[i] == skill[idx]:
                idx += 1
            else:
                answer -= 1
                break
    return answer
```

- 다른 사람 풀이

```py
def solution(skill, skill_trees):
    answer = 0

    for skills in skill_trees:
        skill_list = list(skill)

        for s in skills:
            if s in skill:
                if s != skill_list.pop(0):
                    break
        else:
            answer += 1

    return answer
```
