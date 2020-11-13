---
title: '[css] CSS 포지션 (Position)'
date: 2020-11-12 10:11:51
category: css
thumbnail: { thumbnailSrc }
draft: false
---

## position

### static, absolute, relative

- position: static

  - 기본값
  - html에 정의된 순서대로 보여줌

- position: absolute
  - 아이템과 가장 가까이에 있는 부모 중에 기본값이 static이 아닌 부모를 기준으로 이동
  - 주변에 함께 있던 아이템들의 재배치가 일어남
- position: relative

  - 원래 있던 자리에서 top, left, bottom, right 항목에 설정한 자리로 이동하는 것을 허용

  ```css
  .contact-btn a {
    cursor: pointer;
    margin-right: 30px;
    padding: 8px 18px;
    border: 1px solid #204156;
    position: relative;
  }
  ```

  - top: 버튼을 클릭할 시 위로 지정한 픽셀만큼 이동

  ```css
  .contact-btn a:active {
    top: 2px;
  }
  ```

### fixed, sticky

- position: fixed
  - class에서 벗어나 웹 페이지 안에서 움직임
- position: sticky
  - scroll이 되어도 원래 있던 자리에 고정

#

**_Source_**

- 스튜디오 마르 css 세션
- [드림코딩 by 엘리](https://www.youtube.com/watch?v=jWh3IbgMUPI&feature=emb_logo)
- [codeacademy](https://www.codecademy.com/learn/make-a-website)
- [MDN position](https://developer.mozilla.org/en-US/docs/Web/CSS/position)
