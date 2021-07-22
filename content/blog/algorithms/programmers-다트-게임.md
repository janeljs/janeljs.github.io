---
title: Programmers 다트 게임
date: 2021-07-22 09:07:92
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/17682

## Solution

```py
def solution(dartResult):
    result = []
    bonus = ['S', 'D', 'T']
    option = ['*', '#']

    dartResult = dartResult.replace('10', 'X')

    for idx in range(len(dartResult)):
        if dartResult[idx] == 'X':
            result.append(calculate(10, dartResult[idx + 1]))
        elif dartResult[idx].isdigit():
            result.append(calculate(int(dartResult[idx]), dartResult[idx + 1]))
        elif dartResult[idx] in option:
            if dartResult[idx] == '*':
                result[-1] *= 2
                if len(result) > 1:
                    result[-2] *= 2
            else:
                result[-1] *= -1

    return sum(result)


def calculate(num, letter):
    if letter == 'S':
        return num ** 1
    if letter == 'D':
        return num ** 2
    return num ** 3
```

- 다른 사람 풀이 1

```py
import re

def solution(dartResult):
    bonus = {'S' : 1, 'D' : 2, 'T' : 3}
    option = {'' : 1, '*' : 2, '#' : -1}
    p = re.compile('(\d+)([SDT])([*#]?)')
    dart = p.findall(dartResult)
    for i in range(len(dart)):
        if dart[i][2] == '*' and i > 0:
            dart[i-1] *= 2
        dart[i] = int(dart[i][0]) ** bonus[dart[i][1]] * option[dart[i][2]]

    answer = sum(dart)
    return answer
```

- 다른 사람 풀이 2

```py
def solution(dartResult):
    point = []
    answer = []
    dartResult = dartResult.replace('10','k')
    point = ['10' if i == 'k' else i for i in dartResult]
    print(point)

    i = -1
    sdt = ['S', 'D', 'T']
    for j in point:
        if j in sdt :
            answer[i] = answer[i] ** (sdt.index(j)+1)
        elif j == '*':
            answer[i] = answer[i] * 2
            if i != 0 :
                answer[i - 1] = answer[i - 1] * 2
        elif j == '#':
            answer[i] = answer[i] * (-1)
        else:
            answer.append(int(j))
            i += 1
    return sum(answer)
```
