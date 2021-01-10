---
title: "[python] 에러: unexpected EOF while parsing"
date: 2020-11-06 00:11:13
category: python
thumbnail: { thumbnailSrc }
draft: false
---


## 에러 종류

- SyntaxError

## 에러 메시지
- SyntaxError: unexpected EOF while parsing



## 발생 이유

- 프로그램 구문이 잘못됐을 때 발생

- 아래 코드 line number 3에서 닫는 괄호를 빼먹어서 발생했다. 
	```python
	queue = []
	num_test = int(input())
	n, m = list(map(int, input().split(" "))
	```

## 해결 방법

철자, 따옴표 여닫기, 괄호 여닫기가 제대로 되었는지 확인






#

***Source***

[모두의 파이썬](https://thebook.io/007026/xa/02_05/)