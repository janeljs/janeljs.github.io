---
title: "[python] lambda() 함수"
date: 2020-11-06 05:11:92
category: python
thumbnail: { thumbnailSrc }
draft: false
---

# lambda() 함수
- 함수를 생성할 때 사용하는 예약어 (=def)
- 함수를 한 줄로 간결하게 만들 때 사용    
💡 lambda 예약어로 만든 함수는 return 명령어가 없어도 결과값을 돌려준다.


## 사용 방법
```python
lambda 매개변수1, 매개변수2, ... : 매개변수를 이용한 표현식
```

## 활용 예시 
- 예시 1 
	```python
	>>> add = lambda a, b: a+b
	>>> result = add(3, 5)
	>>> print(result)
	8
	```
- 예시 2
	```python
	>>> arr = [[1,2,9],[8,5,6],[7,8,9]]
	>>> answer = max(arr, key=lambda x: x[1])[2]
    # 2차원 배열에서 열의 두번째 값이 가장 큰 원소를 찾고,
    # 그 값의 3번째 값 반환
	>>> print(answer)
	9  
	```
- 예시 3
```python
>>> names = ['Jane', 'Jisun', 'Jiseob']
>>> longest_name = max(names, key=lambda x: len(x))
>>> print(longest_name)
Jiseob
```
- 예시 4
```py
>>> keys = [{'key': 5}, {'key': 10}, {'key': 7}, {'key': 8}]
>>> keys
[{'key': 5}, {'key': 10}, {'key': 7}, {'key': 8}]
>>> keys.sort(key = lambda x:x['key'])
>>> keys
[{'key': 5}, {'key': 7}, {'key': 8}, {'key': 10}]
# keys 리스트를 'key'들의 value를 기준으로 정렬
```
- 예시 5
```py
>>> student_tuples = [
...     ('john', 'A', 15),
...     ('jane', 'B', 12),
...     ('dave', 'B', 10),
... ]
>>> sorted(student_tuples, key=lambda student: student[2])   
# 나이를 기준으로 정렬 
[('dave', 'B', 10), ('jane', 'B', 12), ('john', 'A', 15)]
```

#

***Source***  
- [wikidocs.net/lambda](https://wikidocs.net/24#lambda)  
- [docs.python.org/key-functions](https://docs.python.org/3/howto/sorting.html?highlight=sorting#key-functions)