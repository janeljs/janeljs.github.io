---
title: Programmers 더 맵게
date: 2021-08-01 01:08:74
category: heap
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42626

## Solution

```py
import heapq


def solution(scoville, K):
    answer = 0
    heapq.heapify(scoville)
    while scoville[0] < K:
        heapq.heappush(scoville, heapq.heappop(scoville) + 2 * heapq.heappop(scoville))
        answer += 1
        if len(scoville) == 1 and scoville[0] < K:
            return -1
    return answer
```

- 프로그래머스에 달린 댓글
  > 코드들을 보니 다들 import heapq를 하셨는데 저는 heap을 몰라서..ㅎㅎ queue만 써서 풀었는데도 시간이 heap을 쓴 풀이의 절반 정도 걸리네요. 저는 섞어서 나온 새로운 값, mix들을 별도의 queue에 넣었는데 이게 가장 큰 요인같네요. 나중에 나온 mix값이 먼저 나온 것보다 클 수밖에 없어서 섞는 순서대로 queue에 넣어주면 크기 순서를 신경 쓸 필요가 없어요. 그냥 popleft로 꺼내면 무조건 mix값의 최소입니다

> 준혁님 댓글보고 참고해서 문제풀이해봤는데요 scoville과 mix 두가지 자료를 모두 이용하려면 고려해야하는 경우가 상당히 많아지기 때문에 if문이 너무 많아집니다. 그런데 deque의 popleft하나만으로 연산이 확줄어서 효율성테스트에서 런타임이 절반 가까이 줄어드네요!!
