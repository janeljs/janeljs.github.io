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
  - 매 순간 sum 함수를 실행하는데 O(N)의 시간이 들어 시간 초과가 뜬 거였다.

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

- 클래스를 이용한 풀이

```py
import collections

DUMMY_TRUCK = 0


class Bridge(object):

    def __init__(self, length, weight):
        self._max_length = length
        self._max_weight = weight
        self._queue = collections.deque()
        self._current_weight = 0

    def push(self, truck):
        next_weight = self._current_weight + truck
        if next_weight <= self._max_weight and len(self._queue) < self._max_length:
            self._queue.append(truck)
            self._current_weight = next_weight
            return True
        else:
            return False

    def pop(self):
        item = self._queue.popleft()
        self._current_weight -= item
        return item

    def __len__(self):
        return len(self._queue)

    def __repr__(self):
        return 'Bridge({}/{} : [{}])'.format(self._current_weight, self._max_weight, list(self._queue))


def solution(bridge_length, weight, truck_weights):
    bridge = Bridge(bridge_length, weight)
    trucks = collections.deque(w for w in truck_weights)

    for _ in range(bridge_length):
        bridge.push(DUMMY_TRUCK)

    count = 0
    while trucks:
        bridge.pop()

        if bridge.push(trucks[0]):
            trucks.popleft()
        else:
            bridge.push(DUMMY_TRUCK)

        count += 1

    while bridge:
        bridge.pop()
        count += 1

    return count


def main():
    print(solution(2, 10, [7, 4, 5, 6]), 8)
    print(solution(100, 100, [10]), 101)
    print(solution(100, 100, [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]), 110)


if __name__ == '__main__':
    main()
```
