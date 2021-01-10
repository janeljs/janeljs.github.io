---
title: '[html] html 태그를 빠른 시간 안에 작성하는 법(feat. Emmet)'
date: 2020-11-12 14:11:51
category: html
thumbnail: { thumbnailSrc }
draft: false
---

## HTML 양식 작성

- `!` + `tab`

## div 태그 작성

- `div` + `tab`
- `div.` + `tab` : class
  - `.class`
- `div#` + `tab` : id

## 부모, 형제, 자식 노드

- `div>ul>li` + `tab` : 부모-자식-자식
- `div>ul+ol` + `tab` :부모-자식-형제
- `ul>li*5` + `tab`: list item 5개가 만들어짐
- `^` : 부모 노드에 삽입
- e.g. `div>(header>ul>li*2>a)+footer>p`

## 텍스트 입력

- `p{text}` + `tab`

## 자동 숫자 할당

- `p.class${item $*5}` + `tab` : p태그 안의 class 이름에 숫자를 넣고, item 숫자 할당
- e.g. `div.container>div.item.item${$}\*10` + `tab`

## 더미용 텍스트 만들기

- `p>lorem` + `tab`
- `p>lorem5` + `tab` : 5개의 단어만 생성

#

**_Source_**

- [드림코딩 by 엘리](https://www.youtube.com/watch?v=m7wsrVQsVjI&feature=emb_logo)
