---
title: Programmers 비밀지도
date: 2021-07-20 13:07:84
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/17681

## Solution

```py
def solution(n, arr1, arr2):
    map = ['' for x in range(n)]

    for i in range(n):
        mark = bin(arr1[i] | arr2[i])[2:]
        if len(mark) < n:
            mark = (n - len(mark))*'0' + mark
        for j in list(mark):
            if int(j) == 1:
                map[i] += '#'
            else:
                map[i] += " "

    return map
```

- 다른 사람 풀이

```py
def solution(n, arr1, arr2):
    answer = []
    for i,j in zip(arr1,arr2):
        a12 = str(bin(i|j)[2:])
        a12=a12.rjust(n,'0')
        a12=a12.replace('1','#')
        a12=a12.replace('0',' ')
        answer.append(a12)
    return answer
```
