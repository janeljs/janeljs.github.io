---
title: 정렬 알고리즘(Sorting algorithms)
date: 2020-10-28 21:10:53
category: datastructures
thumbnail: { thumbnailSrc }
draft: false
---
## 알고리즘

문제를 해결하는(특정 연산을 풀어나가는) 절차

- 패스쓰루(passthrough): 알고리즘의 주요 단계들을 통과했다는 의미


## 버블 정렬

각 패스쓰루마다 정렬되지 않은 값 중 가장 큰 값에 해당하는 버블을 올바른 위치로 정렬

**연산**

- 비교: (N-1)+(N-2)+ ... + 1
- 교환(swap): 최악의 경우 (N-1)+(N-2)+ ... + 1

**시간복잡도**

$O(N^2)$

**구현**

```python
def bufbble_sort(list):
	unsorted_until_index = len(list) - 1
	sorted = False
	
	while not sorted:
		sorted = True
		for i in range(unsorted_until_index):
			if list[i] > list[i+1]:
				sorted = False
				list[i], list[i+1] = list[i+1], list[i]
		unsorted_until_index = unsorted_until_index - 1
```

💡참고: 파이썬 기본 문법

```python
# 인수 1개: 0부터 n까지
>>> list(range(5))
[0, 1, 2, 3, 4]

# 인수 2개: 시작 숫자에서 끝 숫자 하나 전까지
>>> list(range(5, 10))
[5, 6, 7, 8, 9]
```


## 선택 정렬

**passthrough**

- 배열의 왼쪽부터 오른쪽까지 확인하면서 최솟값 결정
- 최솟값과 passthrough를 시작한 값 교환

전체가 정렬될 때까지 passthrough를 반복

**연산**

- 비교: (N-1)+(N-2)+ ... + 1
    - 버블 정렬과 동일
- 교환(swap): 패스쓰루 당 최대 한 번, 최악의 경우 비교할 때마다 교환을 한 번씩 해야 함
    - 버블 정렬보다 교환 횟수가 훨씬 적다.

💡 선택 정렬이 버블 정렬보다 두 배 더 빠르다. 

**시간복잡도**

$O(N^2)$

- 빅 오 표기법에서는 상수를 무시하기 때문에 버블 정렬과 동일

```java
function selectionSort(array) {
  for(var i = 0; i < array.length; i++) {
    var smallestNumberIndex = i;
    for(var j = i + 1; j < array.length; j++) {
      if(array[j] < array[smallestNumberIndex]) {
        smallestNumberIndex = j;
      }
    }
 
    if(smallestNumberIndex != i) {
      var temp = array[i];
      array[i] = array[smallestNumberIndex];
      array[smallestNumberIndex] = temp;
    }
  }
  return array;
}
```


## 삽입 정렬

**paththrough**

- 인덱스 1의 값을 삭제한 뒤 이 값을 임시 변수에 저장
- 공백 왼 쪽의 값과 임시 변수 값 비교
- 왼쪽에 있는 값이 임시 변수보다 크면 한 칸 오른쪽으로 이동, 같으면 그대로 둠
- 임시변수에 있는 값 현재 공백에 삽입

전체가 정렬될 때까지 passthrough 반복

**연산**

- 비교: 1+2+3+ ... + n-1
    - 최악의 경우 각 passthrough마다 임시 변수 왼쪽의 모든 수를 임시 변수와 비교
- 이동: 1+2+3+ ... + n-1
- 삭제: passthrough 당 한 번 = n-1
- 삽입: n-1

➡ 합: $n^2 + 2n  -2$

**시간복잡도**

$O(n^2)$

- 빅 오 표기법에서는 가장 높은 차수의 n만 고려

```python
def insertion_sort(array):
   for index in range(1, len(array)):

     position = index
     temp_value = array[index]

     while position > 0 and array[position - 1] > temp_value:
         array[position] = array[position - 1]
         position = position - 1

     array[position] = temp_value
```

### ❓ 최악이 아닌 평균적인 시나리오를 고려한다면

**삽입정렬**

- 최악 $n^2$
- 평균 $n^2 / 2$
- 최선 $n$

**선택정렬**

- 최악, 평균, 최선 $n^2 / 2$
    - 특정 시점에 미리 passthrough를 중단할 수 없기 때문

💡 따라서 무조건 최악의 시나리오만 고려할 것이 아니라 데이터의 수에 따라 가장 효율적인 알고리즘을 선택해야 한다.

```jsx
function intersection(first_array, second_array){
    var result = [];

    for (var i = 0; i < first_array.length; i++) {
        for (var j = 0; j < second_array.length; j++) {
            if (first_array[i] == second_array[j]) {
                result.push(first_array[i]);
                break; // 공통된 원소를 발견했다면 그 뒤에 원소들은 비교할 필요 x
            }
        }
    }
    return result;            
}
```

💡 worstcase의 시간복잡도가 똑같다고 하더라도 최대한 연산 횟수를 줄이는 알고리즘을 짜야 한다.
