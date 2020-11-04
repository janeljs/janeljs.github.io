---
title: rss
date: 2020-11-05 00:11:96
category: blog
thumbnail: { thumbnailSrc }
draft: false
---

1. git bash에 npm 명령어 입력 
```bash
npm install gatsby-plugin-feed
```


2. gatsby-config.js에 아래 코드 추가 

```bash
module.exports = {
  siteMetadata: {
    siteUrl: `https://www.example.com`,
  },
  plugins: [`gatsby-plugin-feed`],
}
```

3. gatsby-node.js에 아래 코드 추가
```bash
const { createFilePath } = require(`gatsby-source-filesystem`)

exports.onCreateNode = ({ node, actions, getNode }) => {
  const { createNodeField } = actions
  if (node.internal.type === `MarkdownRemark`) {
    const value = createFilePath({ node, getNode })
    createNodeField({
      name: `slug`,
      node,
      value,
    })
  }
}
```

4. `npm run build`로 빌드하기
- 만약 github action을 통해 배포 자동화를 해놓았다면 push만 진행해도 된다. 


***Source***

[Adding an RSS Feed gatsby official site](https://www.gatsbyjs.com/docs/adding-an-rss-feed/)  
