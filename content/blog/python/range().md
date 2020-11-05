---
title: "[python] range() 함수"
date: 2020-10-31 10:10:96
category: python
thumbnail: { thumbnailSrc }
draft: false
---
# range() 함수

- 시작 숫자부터 끝 숫자 하나 전까지 지정한 step 만큼 증가한 숫자들의 시퀀스를 반환하는 함수
- for문과 함께 자주 사용

## 사용 방법

```python
range(start, stop, step)
```

**start:** 시작 숫자 / 필수 아님 / 0이 default

**stop:** 끝 숫자 / 입력 필수 / 범위에 포함 안 됨

**step:** step만큼 증가 / 필수 아님 / 1이 default

 

## 활용 예시

```python
>>> x = range(10)
>>> list = []
>>> for n in x:
      list.append(n)
>>> print(list)
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```



```python
>>> x = range(3, 20, 2)
>>> list = []
>>> for n in x:
      list.append(n)
>>> print(list)
[3, 5, 7, 9, 11, 13, 15, 17, 19]
```



#

***Source***

[w3schools](https://www.w3schools.com/python/ref_func_range.asp)