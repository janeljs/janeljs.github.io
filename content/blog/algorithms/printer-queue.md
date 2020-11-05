---
title: 백준 1966번 프린터 큐(Printer queue)
date: 2020-11-03 00:11:53
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

## Description

```
여러분도 알다시피 여러분의 프린터 기기는 여러분이 인쇄하고자 하는 문서를 인쇄 명령을 받은 ‘순서대로’, 즉 먼저 요청된 것을 먼저 인쇄한다. 여러 개의 문서가 쌓인다면 Queue 자료구조에 쌓여서 FIFO - First In First Out - 에 따라 인쇄가 되게 된다. 하지만 상근이는 새로운 프린터기 내부 소프트웨어를 개발하였는데, 이 프린터기는 다음과 같은 조건에 따라 인쇄를 하게 된다.

현재 Queue의 가장 앞에 있는 문서의 ‘중요도’를 확인한다.
나머지 문서들 중 현재 문서보다 중요도가 높은 문서가 하나라도 있다면, 이 문서를 인쇄하지 않고 Queue의 가장 뒤에 재배치 한다. 그렇지 않다면 바로 인쇄를 한다.
예를 들어 Queue에 4개의 문서(A B C D)가 있고, 중요도가 2 1 4 3 라면 C를 인쇄하고, 다음으로 D를 인쇄하고 A, B를 인쇄하게 된다.

여러분이 할 일은, 현재 Queue에 있는 문서의 수와 중요도가 주어졌을 때, 어떤 한 문서가 몇 번째로 인쇄되는지 알아내는 것이다. 예를 들어 위의 예에서 C문서는 1번째로, A문서는 3번째로 인쇄되게 된다.
```
## Input
```
첫 줄에 test case의 수가 주어진다. 각 test case에 대해서 문서의 수 N(100이하)와 몇 번째로 인쇄되었는지 궁금한 문서가 현재 Queue의 어떤 위치에 있는지를 알려주는 M(0이상 N미만)이 주어진다. 다음줄에 N개 문서의 중요도가 주어지는데, 중요도는 1 이상 9 이하이다. 중요도가 같은 문서가 여러 개 있을 수도 있다. 위의 예는 N=4, M=0(A문서가 궁금하다면), 중요도는 2 1 4 3이 된다.
```

## Output
```
각 test case에 대해 문서가 몇 번째로 인쇄되는지 출력한다.
```

## Solution


```python
# 내 풀이

num_test = int(input())
for i in range(num_test):
    n, m = map(int, input().split(" "))
    queue = list(map(int, input().split(" ")))
    time = 0
    
    while(True):
        out = True
        p = 0
        while(p < len(queue)):
            if queue[0] < queue[p]:
                out = False
                break
            p += 1
            out = True
        
        if(out):
            time +=1
            queue.remove(queue[0])
            if m == 0 :
                print(time)
                break
            m = m-1
        else:
            temp = queue[0]
            queue.remove(queue[0])
            queue.append(temp)
            if m == 0:
                m = len(queue) - 1
            else:
                m = m-1

```
## Feedback
- 난이도 easy인데도 푸는데 정말 오래걸렸다. 그래도 포기하지 않고 풀어내니 뿌듯하다.
- python 기본 문법 및 자료구조를 더 공부해 적극적으로 활용해야겠다. 

```python
# 다른 사람 풀이

test_case = int(input())
for _ in range(test_case):
	n, m = list(map(int, input().split(' ')))
	queue = list(map(int, input().split(' ')))
	queue = [(i, idx) for idx, i in enumerate(queue)]
	count = 0
	while True:
		if queue[0][0] == max(queue, key=lambda x: x[0])[0]:
			count += 1
		if queue[0][1] == m:
			print(count)
			break
		else:
			queue.pop(0)
		else:
			queue.append(queue.pop(0))

```

#

***Source***

[프린터 큐](https://www.acmicpc.net/problem/1966)
