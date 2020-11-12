---
title: '[css] CSS 기초 2 (float, flex, position)'
date: 2020-11-12 10:11:51
category: css
thumbnail: { thumbnailSrc }
draft: false
---

## float & flex

- float

  ```css
  /* 오른쪽으로 contact button 보내기 */
  contact-btn {
    float: right;
  }
  #search-bar {
    float: right;
  }
  ```

- flex

  - flex: 항목들을 수평으로 배치
  - flex-wrap: 항목들이 화면 밖으로 나가는 것을 방지
  - justify-content: center: 가운데 정렬

  ```css
  .parent {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
  }
  ```

## position

- position: relative: 원래 있던 자리에서 top, left, bottom, right 항목에 설정한 자리로 이동하는 것을 허용

  ```css
  .contact-btn a {
    cursor: pointer;
    margin-right: 30px;
    padding: 8px 18px;
    border: 1px solid #204156;
    position: relative;
  }
  ```

- 버튼을 클릭할 시 위로 2px 이동

  ```css
  .contact-btn a:active {
    top: 2px;
  }
  ```

#

**_Source_**

- 스튜디오 마르 css 세션
- [codeacademy](https://www.codecademy.com/learn/make-a-website)
