---
title: Gatsby 블로그에 Google Analytics 플러그인 추가하는 법
date: 2020-11-03 14:11:51
category: blog
thumbnail: { thumbnailSrc }
draft: false
---

## 따라해보자! Follow me 😎

1. 구글 애널리틱스 계정 만들기
2. 속성에 내 블로그의 이름과 주소 추가하기
3. gatsby gtag 플러그인 설치하기
4. 내 Google Analytics 사이트에서 dashboard 확인하기 

## gatsby-plugin-gtag 플러그인 설치
1. git bash에서 npm 명령어 실행 

```bash
npm install --save gatsby-plugin-gtag
```
2. `gatsby-config.js` 파일에 아래 코드 추가해주기 

```js
module.exports = {
  plugins: [
    {
      resolve: `gatsby-plugin-gtag`,
      options: {
        trackingId: `UA-XXXXXXXX-X`, // 측정 ID
        head: false, // head에 tracking script를 넣고 싶다면 true로 변경 
        anonymize: true,
      },
    },
  ],
}
```

#

***Source***

[Adding Analytics](https://www.gatsbyjs.com/docs/adding-analytics/)