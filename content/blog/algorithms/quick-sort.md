---
title: "퀵 정렬(Quick sort)"
date: 2020-10-31 10:10:16
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---
## 퀵 정렬(Quick sort)

💡 **퀵 정렬**은 대부분의 컴퓨터 언어가 채택한 정렬 알고리즘으로 매우 빠르고 평균 시나리오에서 효율적이기 때문에 퀵 정렬이라는 이름이 붙었다.

💡 분할 정복 알고리즘의 대표적인 예 중 하나

## 구현 방법

1. pivot을 정해서, pivot보다 작은 데이터는 왼쪽, 큰 데이터는 오른쪽으로 모으는 함수 작성
2. 왼쪽과 오른쪽은 각각 재귀용법으로 동일 함수를 호출하여 위 작업을 반복
3. 함수는 왼쪽(left) + 기준점(pivot) + 오른쪽(right) 을 반환 

```python
def quick_sort(data):
    left, right = list(), list() # 변수 선언
    pivot = data[0] # 첫 번째 데이터를 pivot으로 선정

		if len(data) <= 1: 
	        return data # 길이가 1이면 바로 반환
    
    for index in range(1, len(data)):
        if pivot > data[index]: # pivot보다 작으면 left에 저장
            left.append(data[index])
        else:
            right.append(data[index]) # pivot보다 크면 right에 저장
    
    return quick_sort(left) + [pivot] + quick_sort(right) 
						# quick_sort 다시 호출해서 반환된 list를 결합
```

위의 코드를 **list comprehension**으로 바꾼다면 조금 더 간결하게 표현할 수 있다.

```python
def quick_sort(data):
		left, right = list(), list()
		pivot = data[0]

		if len(data) < = 1:
				return data
		
		left = [num for num in data[1:] if pivot > num]
		right = [num for num in data[1:] if pivot <= num]

		return qsort(left) + [pivot] + qsort(right)
```

## 시간복잡도

- **평균적인 시나리오일 때** $O(n log n)$
    - depth를 i라고 가정하고 i는 0이 default 값이라고 했을 때
    - 2단계에서는 리스트가 4개로 분할되고, 각 리스트의 길이는 입력된 리스트의 길이 n/4이다.
    - 마찬가지로 3단계에서는 리스트가 8개로 분할되고, 각 리스트의 길이는 n/8 이다.
    - 그러므로 각 단계는 $2^i * n/2^i$ 만큼 피벗과 비교 연산을 수행한다. 즉, $O(n)$만큼의 시간이 소요된다.
    - 단계는 $log n$개 만들어지므로 $O(logn)$만큼의 시간이 소요된다.
    - 따라서 시간 복잡도는 $O(n)*O(logn) = O(nlogn)$이다.

    <br/>

- **최악의 시나리오 일 때 $O(n^2)$**
    - pivot이 가장 크거나 가장 작을 때
    - 즉, 모든 데이터를 비교해야 할 때
        - pivot이 항상 왼쪽 끝에 위치한다면 pivot의 오른쪽에 위치한 데이터를 모두 비교해야 한다.
        - (n-1) + (n-2) + (n-3) + ... + 2 + 1 + 0 이므로 약 $n^2/2$ 만큼 비교 연산 수행
    - 배열이 오름차순이거나 내림차순으로 정렬되어 있는 경우도 최악의 시나리오에 해당된다.

    최악의 시나리오에서는 둘로 나누는 횟수가  $log n$이 아닌 $n$이 된다. 그러므로 $O(n)*O(n) = O(n^2)$가 된다.

    <br/>

💡 보통 알고리즘의 시간 복잡도는 worst case를 기준으로 하지만, 퀵정렬의 경우 **최선의 경우에 가까운 성능을 평균적**으로 보이기 때문에 평균적인 시나리오를 빅 O로 보기도 한다.

#

***Source***

- A Common-Sense Guide to Data Structures and Algorithms

- 패스트캠퍼스 알고리즘 강의

- [fun-coding/Chapter15-quicksort](https://www.fun-coding.org/Chapter15-quicksort.html)

- 윤성우의 열혈 자료구조
