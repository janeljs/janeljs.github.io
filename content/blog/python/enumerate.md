---
title: "[python] enumerate() 함수"
date: 2020-11-06 04:11:02
category: python
thumbnail: { thumbnailSrc }
draft: false
---

# enumerate() 함수
- 순서가 있는 자료형(리스트, 튜플, 문자열)을 입력으로 받아 인덱스 값을 포함하는 enumerate 객체를 반환하는 함수
- enumerate는 "열거하다"라는 뜻

## 활용 예시
- 예시 1 (for문과 함께 사용)
	```python
	>>> for i, name in enumerate(['jisun', 'jane', 'jiseon']):
	...	    print(i, name)

	0 jisun
	1 jane
	2 jiseon
	```
- 예시 2 (리스트를 입력으로 받아 인덱스 값을 포함하는 튜플로 구성된 리스트 반환)
	```python
	data_list = [(i, idx) for idx, i in enumerate(data_list)]
	```






#

***Source***
- [wikidocs.net/enumerate](https://wikidocs.net/32#enumerate)