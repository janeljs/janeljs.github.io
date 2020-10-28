---
title: TIL 1
date: 2020-10-26 16:10:22
category: TIL
thumbnail: { thumbnailSrc }
draft: false
---
# Timeline

`2:00` 도서관 도착

# Goal

**A Common-Sense Guide to Data Structures and Algorithms (Jay Wengrow) 완독**

목표 선정 이유

- 예전에 빌려놨던 책인데 오늘 반납일이라서
- 첫 시작으로 자료구조에 대하여 전반적으로 파악하면 좋을 것 같아서
- 유퀴즈온더블럭을 보는데 송지헌 과장님이 사법고시를 공부하실 때 하루에 300page 가량을 소화하셨다고 해서 나도 308page 가량의 책을 끝내보기로 했다.

# Reflection

# Today I Learned

## 시간복잡도

시간복잡도 = 효율성 = 성능

각 연산이 수행되는데 몇 단계가 필요한지 측정

***Tip!*** steps라는 변수를 추가하여 단계수를 기록하면 시간복잡도 증명 가능

## 빅오표기법

시간이 아닌 알고리즘에 필요한 단계 수만을 고려

**O(n)**

- 선형 시간(linear time)

```python
def is_prome(number):
	for i in range(2, number):
		if number % i == 0:
			return False
	return True
```

```jsx
function hasDuplicateValue(array) {
    var existingNumbers = [];
    for(var i = 0; i < array.length; i++) {
        if(existingNumbers[array[i]] === undefined) {
            existingNumbers[array[i]] = 1;
        } else {
            return true;
        }
    }
    return false;
}
```

✔참고: 자바스크립트 **Strict Equals Operator ( === )**

- `x===y`일 때,
- x와 y의 type과 value가 모두 같아야 true 반환

**O(1)**

- 상수 시간(constant time)

**O(log n)**

- 로그 시간(log time)
- 데이터가 두 배로 증가할 때마다 한 단계씩 늘어나는 알고리즘
    - logarithm = log
        - 지수와 역의 관계

**O(n^2)**

- 이차 시간(quadratic time)

### 연습문제

- if $f(n) = O(g(n))$ and $f(n) = Ω(g(n))$, then we have $(f(n))^2 = Θ(g(n)^2)$ `true`
- if $f(n) = O(g(n))$ and $f(n) = Ω(g(n))$, then we have $f(n) = g(n)$ `false`
- 3498103948 = `Θ(1)`
- log2^n = nlog2 = `Θ(n)`
- 4n^3 + 2n^log n = `Θ(n^log n)`
- log2^(3n^4 - 5n^2 + 4) = `Θ(n^4)`
- T(n) = 2 * T(n-1), T(0) = 1 `T(n) = Θ(2^n)`
- factorial 메소드의 시간복잡도를 구하여라

```java
int factorial(int n) {
	if (n ==1)
		return 1;
	else
		return n * factorial(n-1)
}
```

T(n) = O(1) + (n-1) * O(1) = `O(n)`

🍯 ***Tip!***

> $log n < n < n log n < n^2 < 2^n < 100^n < n! < n^n$

다항함수 < 지수함수 < 팩토리얼 < $n^n$

## 배열

데이터 원소들의 리스트

**읽기**

- O(1) 소요
    - 컴퓨터는 모든 메모리 주소에 한 번에 접근 가능
    - 각 배열에는 메모리의 시작 주소가 저장됨
    - 배열의 인덱스는 0부터 시작

→ 인덱스의 메모리 주소가 1068인 배열이 있다면 인덱스 3에 접근 할 때는 1068+3인 1071 메모리 주소로 바로 가면 된다.

**검색**

- 정렬된 배열일 경우 O(log n) 소요
    - 이진 검색 사용 (아래는 수도코드이다)

    ```java
    Function binary_search(array, value)
    	lower_bound = 0
    	upper_bound = array.length - 1

    	while lower_bound <= upper_bound do
    		midpoint = (upper_bound + lower_bound) / 2 and round off midpoint
    		value_at_mid = array[midpoint]

    		if value < value_at_mid
    			upper_bound = midpoint - 1
    		else if value > value_at_mid
    			lower_bound = midpoint + 1
    		else if value is same with value_at_mid
    			return midpoint

    // 상한선과 하한선이 같아졌는데도 value랑 value_at_mid가 일치하지 않았다면
    // array 안에 value가 없다는 의미

    	return null
    ```

- 정렬되지 않은 배열일 경우 O(n) 소요
    - 한 번에 한 셀씩 값을 발견할 때까지 확인하기 때문 (선형검색)

**삽입**

- 맨 뒤에 삽입하는 경우 O(1)
- 가운데 삽입하고 싶으면 삽입하고 싶은 위치 뒤에 있는 요소를 전부 1칸씩 오른쪽으로 옮긴 뒤 삽입해야 함 → N+1 단계 → O(n)
- 단, 정렬된 배열일 경우 검색 연산 먼저 수행햐야 함

**삭제**

- N단계 → O(n)

➡ 정렬된 배열: 삽입은 다소 느리지만(O(n)) 검색은 훨씬 빠르다(O(log n)).

➡ 정렬되지 않은 배열: 삽입은 빠르지만(O(1)) 검색이 훨씬 느리다(O(n)).

## 집합

중복값을 허용하지 않는 자료구조

**읽기**

- O(1)

**검색**

- O(N)

**삽입**

- 중복값이 있을 경우 삽입 금지
    - 삽입할 값이 집합에 들어있는지 결정해야 함 → 삽입 전 `검색` 필요
    - 맨 뒤에 삽입할 경우 N(검색) + 1(삽입) 필요
    - 맨 앞에 삽입할 경우 N(검색) + N(이동) + 1(삽입) 필요

        → 중복값이 존재해도 되면 배열이 더 효율적

    - 결과적으로 O(N)
- 활용
    - 같은 전화번호가 존재하면 안 되는 전화번호부 관리

**삭제**

- O(N)

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

✔참고: 파이썬 기본 문법

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

➡ 선택 정렬이 버블 정렬보다 두 배 더 빠르다. 

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

➡ $n^2 + 2n  -2$

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

➡ 따라서 무조건 최악의 시나리오만 고려할 것이 아니라 데이터의 수에 따라 가장 효율적인 알고리즘을 선택해야 한다.

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

➡ worstcase의 시간복잡도가 똑같다고 하더라도 최대한 연산 횟수를 줄이는 알고리즘을 짜야 한다.
