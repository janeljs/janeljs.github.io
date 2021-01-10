---
title: "[python] 에러: 'list' object is not callable"
date: 2020-11-06 04:11:42
category: python
thumbnail: { thumbnailSrc }
draft: false
---

## 에러 종류

- TypeError

## 에러 메시지
- TypeError: 'list' object is not callable


## 발생 이유

- 함수와 변수명이 중복되었을 때 발생
- python에서 쓰이는 함수를 변수명으로 선언한 뒤, 밑에서 그 함수를 호출하려고 하면 해당 에러가 발생한다.


## 해결 방법

- 에러가 난 함수와 같은 이름의 변수가 있는지 확인

#