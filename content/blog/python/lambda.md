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
💡 lambda 예약어로 만든 함수는 return 명령어가 없어도 결괏값을 돌려준다.


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


#

***Source***
[wikidocs.net/lambda](https://wikidocs.net/24#lambda)