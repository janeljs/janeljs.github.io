---
title: Programmers 다리를 지나는 트럭
date: 2021-08-06 23:08:30
category: stack
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42583

## Solution

- 시간 초과 판정을 받았다.

```py
from collections import deque


def solution(bridge_length, weight, truck_weights):
    answer = 0
    truck_weights = deque(truck_weights)
    truck_crossing_bridge = deque([0] * bridge_length)
    while truck_crossing_bridge:
        answer += 1
        truck_crossing_bridge.popleft()
        if truck_weights:
            if sum(truck_crossing_bridge) + truck_weights[0] <= weight:
                truck_crossing_bridge.append(truck_weights.popleft())
            else:
                truck_crossing_bridge.append(0)
    return answer
```

- 2차 시도

```py
from collections import deque


def solution(bridge_length, weight, truck_weights):
    answer = 0
    truck_weights = deque(truck_weights)
    truck_crossing_bridge = deque([0] * bridge_length)
    tcb_weight = 0
    while truck_crossing_bridge:
        answer += 1
        tcb_weight -= truck_crossing_bridge.popleft()
        if truck_weights:
            if tcb_weight + truck_weights[0] <= weight:
                temp = truck_weights.popleft()
                tcb_weight += temp
                truck_crossing_bridge.append(temp)
            else:
                truck_crossing_bridge.append(0)
    return answer
```
