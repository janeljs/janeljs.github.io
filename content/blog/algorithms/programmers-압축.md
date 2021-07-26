---
title: Programmers 압축
date: 2021-07-27 00:07:86
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/17684

## Solution

```py
def solution(msg):
    dic = {chr(ord('A') + i): i + 1 for i in range(26)}
    answer = []

    while msg:
        idx = 0
        # 현재 입력과 일치하는 가장 긴 문자열 찾기
        while msg[:idx + 1] in dic and idx <= len(msg):
            idx += 1

        key = msg[:idx]

        if key in dic:
            answer.append(dic[key])
            new_key = msg[:idx + 1]
            dic[new_key] = len(dic) + 1
        msg = msg[idx:]
    return answer


print(solution("TOBEORNOTTOBEORTOBEORNOT"))
print(solution("ABABABABABABABAB"))
```
