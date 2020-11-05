---
title: "[python] map() 함수"
date: 2020-11-06 00:11:75
category: python
thumbnail: { thumbnailSrc }
draft: false
---

# map() 함수
- 리스트의 요소를 지정된 함수로 처리해주는 함수
- 원본 리스트를 변경하지 않고 새 리스트를 생성함 
- map이 반환하는 map object는 iterator라서 변수 여러개에 저장하는 unpacking이 가능하다. 

## 사용 방법
```python
list(map(함수, 리스트))
tuple(map(함수, 튜플))
```

## 활용 예시 
- 예시 1 
	```python
	>>> a = [1.3, 2.2, 3, 4.9]
	>>> a = list(map(int, a))
	>>> a
	[1, 2, 3, 4]
	```
- 예시 2
	```python
	data_list = list(map(int, input().split(' ')))
	# 받은 input을 ' ' 구분자로 나눈 뒤 int로 변환하여 리스트에 저장 
	```
- 예시 3
	```python
	n, m = map(int, input().split())
	```
	- 위의 코드를 풀어 쓰면 아래와 같다. 
	```python
	data = input().split()    
	map = map(int, x)        
	n, m = map  # 맵 객체는 변수 여러 개에 저장할 수 있다 
	```

#

***Source***  
- [파이썬 코딩 도장](https://dojang.io/mod/page/view.php?id=2286)