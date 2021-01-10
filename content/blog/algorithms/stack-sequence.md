---
title: "백준 1874번 스택 수열(Stack sequence)"
date: 2020-11-01 22:11:57
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

## Description

```
스택 (stack)은 기본적인 자료구조 중 하나로, 컴퓨터 프로그램을 작성할 때 자주 이용되는 개념이다. 스택은 자료를 넣는 (push) 입구와 자료를 뽑는 (pop) 입구가 같아 제일 나중에 들어간 자료가 제일 먼저 나오는 (LIFO, Last in First out) 특성을 가지고 있다.

1부터 n까지의 수를 스택에 넣었다가 뽑아 늘어놓음으로써, 하나의 수열을 만들 수 있다. 이때, 스택에 push하는 순서는 반드시 오름차순을 지키도록 한다고 하자. 임의의 수열이 주어졌을 때 스택을 이용해 그 수열을 만들 수 있는지 없는지, 있다면 어떤 순서로 push와 pop 연산을 수행해야 하는지를 알아낼 수 있다. 이를 계산하는 프로그램을 작성하라.
```
## Input
```
첫 줄에 n (1 ≤ n ≤ 100,000)이 주어진다. 둘째 줄부터 n개의 줄에는 수열을 이루는 1이상 n이하의 정수가 하나씩 순서대로 주어진다. 물론 같은 정수가 두 번 나오는 일은 없다.
```

## Output
```
입력된 수열을 만들기 위해 필요한 연산을 한 줄에 한 개씩 출력한다. push연산은 +로, pop 연산은 -로 표현하도록 한다. 불가능한 경우 NO를 출력한다.
```

## Solution


```python
# 내 풀이

n = int(input()) 
s_sq = [] 
stack_list = []
result = []
status = True

for x in range(0, n):
    s_sq.append(int(input()))

def isEmpty():
    if len(stack_list) == 0:
        return True
    
idx = 0
i = 1
while(i <= n):
    if i <= s_sq[idx]:
        stack_list.append(i)
        result.append("+")
        i +=1
    elif i > s_sq[idx]:
        stack_list.pop()
        result.append("-")
        idx += 1
        
stack_list.pop()
result.append("-")

for num in range(0, len(stack_list)-1):
    if s_sq[-1-num] != stack_list[num] :
        result = "NO"
        status = False
        break
        
while(status and not isEmpty()):
    stack_list.pop()
    result.append("-")

if (status):
    print('\n'.join(result))
else:
    print(result)
```


## Feedback

위의 나의 코드는 결과값은 제대로 잘 나오는데 `출력 초과`가 떴고 코드도 총체적 난국이다.
이곳저곳 고쳐보다가 포기했다. 결과는 제대로 나오는데 왜 출력 초과가 뜨는지 모르겠다.
앞으로는 주먹 구구식으로 결과값 나오는데만 집중하지 말고 전체적인 알고리즘을 먼저 수도코드로 작성한 뒤 코드로 구현해야겠다. 실력이 더 성장한다음 다시 풀어봐야지...
- 수도코드 먼저 작성하자
- 반복문 남용하지 말자
- 결과값이 안 나올 때는 전체적인 로직을 봐야지 주먹구구식으로 결과값에만 맞춘 코딩을 하면 안 된다. 

```python
# 다른 사람 풀이 

n = int(input())

count = 1
stack = []
result = []

for i in range(1, n + 1): 
    data = int(input())
    while count <= data: 
        stack.append(count)
        count += 1
        result.append('+')
    if stack[-1] == data: 
        stack.pop()
        result.append('-')
    else: 
        print('NO')
        exit(0)
        
print('\n'.join(result)) 

```

#

***Source***

[백준 1874번 스택 수열](https://www.acmicpc.net/problem/1874)