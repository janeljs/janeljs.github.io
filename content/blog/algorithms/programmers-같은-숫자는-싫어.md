---
title: Programmers 같은 숫자는 싫어
date: 2021-07-22 10:07:92
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12906

## Solution

- 1차 풀이: 17번 테케 통과 실패

```py
def solution(arr):
    if len(arr)==1:
        return arr
    result = []
    for i in range(len(arr)-1):
        if arr[i] != arr[i+1]:
            result.append(arr[i])
    if arr[-1] != result[-1]:
        result.append(arr[-1])
    return result
```

- 2차 풀이

```py
def solution(arr):
   if len(arr) == 1:
       return arr
   result = []
   for i in range(len(arr) - 1):
       if arr[i] != arr[i + 1]:
           result.append(arr[i])
   if len(result) == 0:
       result.append(arr[-1])
   elif arr[-1] != result[-1]:
       result.append(arr[-1])
   return result
```

- 다른 사람 풀이

```py
def no_continuous(s):
    a = []
    for i in s:
        if a[-1:] == [i]: continue
        a.append(i)
    return a

print( no_continuous( "133303" ))
```

아래와 같이 빈 배열이더라도 에러가 뜨지 않는다.

```py
a = []
print(a[-1:])
```
