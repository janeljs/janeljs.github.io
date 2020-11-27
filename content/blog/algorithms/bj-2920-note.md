---
title: "백준 2920번 음계(Note)"
date: 2020-11-01 20:11:21
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---
## Description

```
다장조는 c d e f g a b C, 총 8개 음으로 이루어져있다. 이 문제에서 8개 음은 다음과 같이 숫자로 바꾸어 표현한다. c는 1로, d는 2로, ..., C를 8로 바꾼다.

1부터 8까지 차례대로 연주한다면 ascending, 8부터 1까지 차례대로 연주한다면 descending, 둘 다 아니라면 mixed 이다.

연주한 순서가 주어졌을 때, 이것이 ascending인지, descending인지, 아니면 mixed인지 판별하는 프로그램을 작성하시오.
```
## Input
```
첫째 줄에 8개 숫자가 주어진다. 이 숫자는 문제 설명에서 설명한 음이며, 1부터 8까지 숫자가 한 번씩 등장한다.
```

## Output
```
첫째 줄에 ascending, descending, mixed 중 하나를 출력한다.
```

## Solution


```python
# 내 풀이

input_number = input()
result = "undefined" 
arr = []

for i in range(0,8):
    arr.append(input_number[2*i]) 
    
for x in range(0, len(arr)-1):
    if arr[x] < arr[x+1]:
        result = "ascending"  
    else:
        result = "undefined"
        break

if result == "undefined":
    for x in range(0, len(arr)-1):
        if arr[x] > arr[x+1]:
            result = "descending" 
        else:
            result = "mixed"
            break
    
print(result)

```
## Feedback
- 추천 풀이 시간: 15분 
- 소요 시간: 50분  

```python
# 다른 사람 풀이 

a = list(map(int, input().split(' '))) 
# 인덱스를 지정하기보다는 split 사용
# map을 이용해서 int형으로 변환 

ascending = True  # 문자열 대신 boolean 값으로 초기화
descending = True # result 대신 ascending, descending 각각 변수를 선언

for i in range(1, 8):    # 인덱스를 1부터 시작
	if a[i] > a[i - 1]:    # a[i] > a[i - 1]일 때 
		descending = False   # ascending이 아닌 descending 변수 값을 변경
	elif a[i] < a[i - 1]:
		ascending = False

if ascending:
	print('ascending')
elif descending:
	print('descending')
else:
	print('mixed')
```






#

***Source***

[백준 2920번 음계](https://www.acmicpc.net/problem/2920)