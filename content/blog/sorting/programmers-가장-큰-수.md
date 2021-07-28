---
title: Programmers 가장 큰 수
date: 2021-07-29 03:07:28
category: sorting
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42746

## Solution
```py
def solution(numbers):
    answer = sorted(numbers, key=lambda x:str(x)*3, reverse=True)
    result = ''.join(map(str, answer))
    return str(int(result))
```

- 다른 사람 풀이
```py
import functools

def comparator(a,b):
    t1 = a+b
    t2 = b+a
    #  t1이 크다면 1  // t2가 크다면 -1  //  같으면 0
    return (int(t1) > int(t2)) - (int(t1) < int(t2)) 

def solution(numbers):
    n = [str(x) for x in numbers]
    n = sorted(n, key=functools.cmp_to_key(comparator),reverse=True)
    answer = str(int(''.join(n)))
    return answer
```