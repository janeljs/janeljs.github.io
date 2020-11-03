---
title: "[DS] 스택(Stack)"
date: 2020-11-02 20:11:94
category: datastructures
thumbnail: { thumbnailSrc }
draft: false
---

* 아직 수정중인 게시글입니다.

## 스택(Stack)
가장 나중에 쌓은 데이터를 가장 먼저 빼낼 수 있는 데이터 구조 (LIFO)
- LIFO(Last In, Fisrt Out) 또는 FILO(First In, Last Out)
  - LIFO: 마지막에 넣은 데이터를 가장 먼저 추출하는 데이터 관리 정책
  - FILO: 처음에 넣은 데이터를 가장 마지막에 추출하는 데이터 관리 정책
- 한쪽 끝에서만 자료를 넣거나 뺄 수 있음 
	- 데이터 접근이 제한적



### 주요 함수
  - push(): 데이터를 스택에 넣기
  - pop(): 데이터를 스택에서 꺼내기


### 장점
  - 구조가 단순해서, 구현이 쉽다.
  - 데이터 저장/읽기 속도가 빠르다.

### 단점 (일반적인 스택 구현시) 
  - 데이터 최대 갯수를 미리 정해야 한다. 
    - 파이썬의 경우 재귀 함수는 1000번까지만 호출이 가능함
  - 저장 공간의 낭비가 발생할 수 있음
    - 미리 최대 갯수만큼 저장 공간을 확보해야 함

> 스택은 단순하고 빠른 성능을 위해 사용되므로, 보통 배열 구조를 활용해서 구현하는 것이 일반적임.
> 이 경우, 위에서 열거한 단점이 있을 수 있음

### 구현
```python
stack_list = list()

def push(data):
    stack_list.append(data)

def pop():
    data = stack_list[-1]
    del stack_list[-1]
    return data
```

### 활용
- 컴퓨터 내부의 프로세스 구조의 함수 동작
	- 스택 구조는 프로세스 실행 구조의 가장 기본이다.


```python
# 재귀 함수
def recursive(data):
    if data < 0:
        print ("ended")
    else:
        print(data)
        recursive(data - 1)
        print("returned", data) 
```

5가 data로 주어졌을 때 재귀 함수의 작동 원리를 생각해보면, 

recursive(5)

