---
title: '[css] Inline, Block, Inline-block 비교'
date: 2020-11-12 14:11:63
category: css
thumbnail: { thumbnailSrc }
draft: false
---

## Inline vs Block vs Inline-block

### inline

- 콘텐츠 만큼만 공간 차지
- `<span>, <a>, ...`
- width, height 지정 불가
- 다음 형제 요소는 오른 쪽 옆에 붙는다.
- text-align 적용 가능
- unodered list 아래의 list item에 다음과 같이 적용 가능

```css
display: inline;
```

### block

- 부모 너비의 100% 차지
- 크기 변경 가능
- `<div>, 대부분의 시맨틱 요소들, ...`
- width, height 지정 가능
- 다음 형제 요소는 한 줄 아래 붙음
- text-align 적용 불가

### inline-block

- inline요소에 block 특성(크기 설정 가능)을 추가한 것
- block이지만 한 줄에 여러개가 표시될 수 있음

### display

- span의 display를 block으로 설정해주면 div와 같이 block 형태로 나온다.
