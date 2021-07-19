---
title: Programmers 키패드 누르기
date: 2021-07-19 11:07:60
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/67256

## Solution

```py
def solution(numbers, hand):
    left = '*'
    right = '#'
    answer = ''
    for key in numbers:
        if key == 1 or key == 4 or key == 7:
            answer += 'L'
            left = key
        elif key == 3 or key == 6 or key == 9:
            answer += 'R'
            right = key
        else:
            ld = distance(left, key)
            rd = distance(right, key)
            if ld < rd:
                answer += 'L'
                left = key
            elif ld == rd:
                if hand == "right":
                    answer+= 'R'
                    right = key
                else:
                    answer += 'L'
                    left = key
            else:
                answer+= 'R'
                right = key
    return answer

def distance(x, y):
    position = {
    1: [0, 0], 2: [0, 1], 3: [0, 2],
    4: [1, 0], 5: [1, 1], 6: [1, 2],
    7: [2, 0], 8: [2, 1], 9: [2, 2],
    '*': [3, 0], 0: [3, 1], '#': [3, 2],
    }

    before = position[x]
    after = position[y]

    return abs(after[0]-before[0]) + abs(after[1]-before[1])
```
