---
title: '[css] CSS의 꽃 flexbox 사용하는 법(feat. float bye bye~)'
date: 2020-11-12 14:11:62
category: css
thumbnail: { thumbnailSrc }
draft: false
---

## float

float은 flexbox가 나오기 이전에 항목들을 정렬하는데 사용했었지만, 이제는 flexbox를 통해서 훨씬 더 편하게 웹 페이지를 구성할 수 있다.

- float

  - left
  - center
  - right

  ```css
  /* 오른쪽으로 contact button 보내기 */
  contact-btn {
    float: right;
  }
  #search-bar {
    float: right;
  }
  ```

# flexbox

- flex
  - flex: HTML 항목들을 수평 또는 수직으로 정렬하는 것을 도움

## flexbox axis

- main axis: 정렬되는 방향이 속하는 축
- cross axis: main axis 반대축 (수직<->수평)

## container에 적용할 수 있는 속성값

- display
- flex-direction
  - row: default value: left->right
  - row-reverse: right->left
  - column: top->bottom
  - column-reverse: bottom->top
- flex-wrap

  - nowrap: default value: item들이 한 줄에 꽉 참
  - wrap: 아이템들이 다음 줄로 넘어감
  - wrap-reverse

    ```css
    .parent {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
    }
    ```

- flex-flow
  - flex-direction + flex-wrap
  ```css
  flex-flow: column nowrap;
  ```

### main axis에서 item 배치

- justify-content
  - flex-start: default value: left->right or top->bottom
  - flex-end: right or bottom justified (순서는 그대로)
  - center: 가운데 정렬
  - space-around
  - space-evenly: 같은 간격으로 정렬
  - space-between: 맨 왼쪽과 오른쪽은 화면 모서리에 부착하고 가운데 요소들은 같은 간격으로 정렬

### cross axis에서 item 배치

- align-items
  - center
  - baseline: 텍스트가 baseline에 맞도록 크기가 다른 item들 배치 가능
- align-content

## item에 적용할 수 있는 속성값

- order
  - 0: default value: html에 있는 순서
  - 1,2,3...: 순서 조정 가능
- flex-grow
  - 0: default value
  - `item 1`을 2 `item 2`를 1로 지정해 놓고 화면을 움직이면 2:1의 비율로 늘어난다.
- flex-shrink
  - 0: default value
  - `item 1`을 2 `item 2`를 1로 지정해 놓고 화면을 움직이면 2:1의 비율로 줄어든다.
- flex-basis
  - auto: default value
  - `item 1`을 60% `item 2`를 40%로 지정해 놓으면 창이 커지고 작아질 때 해당 비율로 변한다.
- align-self
  - 아이템별로 아이템 정렬 가능
  - center

#

**_Source_**

- studio mar css
- [codeacademy](https://www.codecademy.com/learn/make-a-website)
- [MDN display](https://developer.mozilla.org/en-US/docs/Web/CSS/display)
- [드림코딩 by 엘리](https://www.youtube.com/watch?v=7neASrWEFEM&feature=emb_logo)
- [complete guide to flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [flexbox practice froggy](https://flexboxfroggy.com/#ko)
