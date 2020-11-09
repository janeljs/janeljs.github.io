---
title: "[css] CSS 기초 (사용방법, 선택자, 우선순위)"
date: 2020-11-06 23:11:10
category: css
thumbnail: { thumbnailSrc }
draft: false
---
# CSS
- Cascading Style Sheets
- HTML 문서를 시각적으로 예쁘게 꾸며준다.


## 사용 방법

- inline
	- 직접 쓰기 
	```html
	<div style="..."></div>
	```
- internal
	- `<head>`에 선언 
```html
<head><style type ="text/css"> ... </style></head>
```
- external
	- 외부에서 css 파일을 가져와 적용하기 (가장 많이 쓰는 방법)
    ```html
    <link rel = "stylesheet" type = "text/css" href = "main.css">
    ```
    - rel: 현재 파일과 link되는 파일 사이의 관계를 명시
    - type: 연결되는 파일 타입 명시
    - href: 연결되는 파일 URL 제공

## CSS 기본 형태

- Tag 선택자
- Class 선택자
- Id 선택자

### 선택자 구성 요소 
![selector](./images/selector.png)
- 선택자(selector): 어떤 HTML 요소에 스타일을 입힐 것인지를 선택 
	- e.g. h1
- 속성(property): 무엇을
	- e.g. color
- 속성값(value): 어떻게 바꿀까?
	- e.g. red

### Id vs Class
- id
	- 한 페이지에서 유일
	- 태그 당 한 개의 id만 가진다.
	- 문서 구조를 나눌 때 사용한다.
		e.g. `<div id = "header">`
	- class로 적용된 스타일을 덮어씌울 때 사용한다.
	- 남용하면 좋지 않다.
- class
	- 한 페이지에서 반복해서 사용할 수 있다.
	- 한 태그에 여러개 class를 적용할 수 있다. 
	- 재활용할 수 있는 스타일을 지정할 때 사용한다. 
	```html
	.header {
	  color: #ffffff; 
	}
	```

## CSS 우선순위

1. !important
    - 되도록 안 쓰는게 좋다.
2. Inline 스타일
    - div 안에 바로 style 넣은 것
3. ID로 지정
    ```css
    #special{ color : skyblue;}
    ```
4. class로 지정
    - .클래스 이름 {속성값}
5. 태그로 지정
6. 전체 지정  

💡 특징적이고 구체적인 것일수록 우선순위가 높다.

## CSS 속성

- color : 글씨 색상
- font-size: 폰트 크기
	- em: parent element의 크기가 20px이라면
		- 1em = 20px
		- 0.5em = 10px
- font-family : 글씨체
	```html
	h1 {
	  font-family: Georgia, serif;
	}
	```
- width : 너비
- height : 높이
- margin : 여백 (바깥) = 요소 바깥 여백
- padding : 여백 (안쪽) = 요소 안쪽 여백 
- background-image : 배경
	```css
	.hero {
	  background-image: url("https://content.codecademy.com/projects/make-a-website/lesson-2/bg.jpg");
	  background-size: cover;
	}
	```

## Inline vs Block vs Inline-block
- inline
	- 콘텐츠 만큼만 공간 차지
	- `<span>, <a>, ...`
	- width, height 지정 불가 
	- 다음 형제 요소는 오른 쪽 옆에 붙는다.
	- text-align 적용 가능
- block
	- 부모 너비의 100% 차지
	- 크기 변경 가능
	- `<div>, 대부분의 시맨틱 요소들, ...`
	- width, height 지정 가능
	- 다음 형제 요소는 한 줄 아래 붙음
	- text-align 적용 불가 
- inline-block
	- inline요소에 block 특성(크기 설정 가능)을 추가한 것


#
***Source***
- 스튜디오 마르 css 세션 
- [codeacademy](https://www.codecademy.com/learn/make-a-website)