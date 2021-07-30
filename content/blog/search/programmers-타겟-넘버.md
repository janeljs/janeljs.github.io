---
title: Programmers 타겟 넘버
date: 2021-07-31 02:07:33
category: search
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/43165

## Solution

![image](https://user-images.githubusercontent.com/68000537/127700909-fa265940-acf9-4ecc-9a9d-78438b793be0.png)

```py
def solution(numbers, target):
    parent = [0]
    for n in numbers:
        child = []
        for p in parent:
            child.append(p + n)
            child.append(p - n)
        parent = child
    return parent.count(target)
```

- 다른 사람 풀이

```py
def solution(numbers, target):
    if not numbers and target == 0 :
        return 1
    elif not numbers:
        return 0
    else:
        return solution(numbers[1:], target-numbers[0]) + solution(numbers[1:], target+numbers[0])
```
