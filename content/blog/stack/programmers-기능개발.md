---
title: Programmers 기능개발
date: 2021-07-30 03:07:73
category: stack
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42586

## Solution

```py
from collections import Counter


def solution(progresses, speeds):
    deploy = []

    day = 0
    while progresses:
        if progresses[0] + day * speeds[0] >= 100:
            deploy.append(day)
            progresses.pop(0)
            speeds.pop(0)
            continue
        day += 1
    return list(Counter(deploy).values())


print(solution([93, 30, 55], [1, 30, 5]))
print(solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1]))
print(solution([20, 99, 93, 30, 55, 10], [5, 10, 1, 1, 30, 5]))
```

- 다른 사람 풀이 1

```py
def solution(progresses, speeds):
    Q=[]
    for p, s in zip(progresses, speeds):
        if len(Q)==0 or Q[-1][0]<-((p-100)//s):
            Q.append([-((p-100)//s),1])
        else:
            Q[-1][1]+=1
    return [q[1] for q in Q]
```

- 다른 사람 풀이 2

```py
from math import ceil

def solution(progresses, speeds):
    daysLeft = list(map(lambda x: (ceil((100 - progresses[x]) / speeds[x])), range(len(progresses))))
    count = 1
    retList = []

    for i in range(len(daysLeft)):
        try:
            if daysLeft[i] < daysLeft[i + 1]:
                retList.append(count)
                count = 1
            else:
                daysLeft[i + 1] = daysLeft[i]
                count += 1
        except IndexError:
            retList.append(count)

    return retList
```
