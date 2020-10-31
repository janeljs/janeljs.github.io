---
title: "[python] 컴프리헨션(Comprehension)"
date: 2020-10-30 13:10:81
category: python
thumbnail: { thumbnailSrc }
draft: false
---
# Python comprehension

다른 Sequence로 부터 새로운 Sequence (Iterable Object)를 만들 수 있는 기능

## List comprehension

### 사용 방법

```python
[출력표현식 for 요소 in 입력Sequence [if 조건식]]
```

- 입력 Sequence는 반복이 가능한 데이터 Sequence 혹은 컬렉션
- if 조건식 입력은 optional하다.

### 활용 예시

- 종류가 다른 데이터에서 정수 리스트만 가져오기

    ```python
    mylist = [5, 9.9, False, 'Love', 15, 100, True]
    int_data = [x for x in mylist if type(x)==int]
    print(int_data)
    ```

    ```powershell
    # Result
    [5, 15, 100]
    ```

- 응용하기

    ```python
    mylist = [5, 9.9, False, 'Love', 15, 100, True]
    int_data = [x for x in mylist if type(x)==int]
    int_square_data = [y * y for y in mylist if type(y)==int]
    boolean_data = [z for z in mylist if type(z)==bool]
    print(int_data)
    print(int_square_data)
    print(boolean_data)
    ```

    ```powershell
    # Result
    [5, 15, 100]
    [25, 225, 10000]
    [False, True]
    ```

- List comprehension을 사용해서 1~20까지의 숫자 중 3으로 나누어 떨어지는 수만 출력하기

    ```python
    answer = [x for x in range(1, 21) if x % 3 == 0]
    print(answer)
    ```

    ```powershell
    # Result
    [3, 6, 9, 12, 15, 18]
    ```

- List comprehension을 사용해서 1~20까지의 숫자 중 3 또는 7로 나누어 떨어지지 않는 수만 출력하기

    ```python
    answer = [x for x in range(1, 21) if (x % 3 != 0 and x % 7 != 0)]
    print(answer)
    ```

    ```powershell
    # Result
    [1, 2, 4, 5, 8, 10, 11, 13, 16, 17, 19, 20]
    ```

## Set comprehension

### 사용 방법

```python
{출력표현식 for 요소 in 입력Sequence [if 조건식]}
```

- 입력 Sequence로부터 조건에 맞는 새로운 Set 컬렉션 반환
- if 조건식 입력은 optional하다.

### 활용 예시

```python
int_data = [1, 1, 2, 2, 2, 3, 3, 4, 6, 7, 8, 8, 9]
data_set = {num for num in int_data}
print(data_set)

data_set_under_condition = {num for num in int_data if num > 3}
print(data_set_under_condition)

square_data_set = {num * num for num in int_data if num > 3}
print(square_data_set)
```

```powershell
# Result
{1, 2, 3, 4, 6, 7, 8, 9} # 집합 출력
{4, 6, 7, 8, 9} # 조건에 맞는 집합 출력
{64, 36, 16, 49, 81} # 제곱된 수로 구성된 집합 출력
```

## Dictionary comprehension

### 사용 방법

```python
{Key:Value for 요소 in 입력Sequence [if 조건식]}
```

- 입력 Sequence로부터 조건에 맞는 새로운 Set 컬렉션 반환
- if 조건식 입력은 optional하다.

### 활용 예시

```python
id_name = {1: 'Dave', 2: 'David', 3: 'Anthony', 4: 'Jane'}
print(id_name.items())

# 아이디가 2이상인 데이터를 이름:아이디 형식으로 새로운 set 만들기
name_id = {val:key for key,val in id_name.items() if key > 2}
print(name_id)

# key 해싱 (2n-1)
name_id = {key * 2 - 1:val for key,val in id_name.items()}
print(name_id)
```

```powershell
# Result
dict_items([(1, 'Dave'), (2, 'David'), (3, 'Anthony'), (4, 'Jane')])
{'Anthony': 3, 'Jane': 4}
{1: 'Dave', 3: 'David', 5: 'Anthony', 7: 'Jane'}
```
#

***Source***

[https://www.fun-coding.org/PL&OOP5-2.html](https://www.fun-coding.org/PL&OOP5-2.html)
