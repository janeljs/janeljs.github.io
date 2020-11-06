---
title: table
date: 2020-11-06 23:11:94
category: html
thumbnail: { thumbnailSrc }
draft: false
---

### 표 컨텐츠

- **`<table>`**
- **`<tr>`**
    - table row
    - 한 줄
- **`<th>`**
    - table head
    - 진하게 해준다
- **`<td>`**
    - table data
    - 표 안에 들어가는 데이터를 감싸주는 역할

<br/>



- 자기 소개

    ```html
    <html>
    <head>
    	<title> About Jane </title>
    </head>
    <body>

    	<div> 안녕하세요 </div>
    	<div> 저는 책을 좋아하는 개발자 임지선입니다. </div> 
    	<div>
    		<span> 블로그 주소: </span><a href = "https://janeljs.github.io"> Jane's Devlog </a> 
    		<span> 나이: 25 </span>
    	</div>
    	<table border = "1"> 
    		<!-- 두께 1의 표 만들기
    		tr: 열 구분 
    		td: 각각의 데이터 값 -->
    		<tr>
    			<td>학교</td>
    			<td>연세대학교</td>
    		</tr>
    		<tr>
    			<td> 전공</td>
    			<td> 교육학/영어영문학</td>
    		</tr>
    	</table>

    </body>
    </html>
    ```

#

***Source***
- 스튜디오 마르 html 세션 