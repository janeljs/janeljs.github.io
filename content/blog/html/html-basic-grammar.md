---
title: "[html] html에서 잘 쓰이는 태그들(feat. 설문지 폼이랑 자기 소개 만들어보기)"
date: 2020-11-06 22:11:89
category: html
thumbnail: { thumbnailSrc }
draft: false
---
## HTML

- Hyper Text Markup Language (Hyper Text(웹 페이지에서 다른 페이지로 이동할 수 있도록 하는 것) 기능을 가진 문서를 만드는 언어)
- 웹 페이지를 위한 마크업 언어
- 구조를 설계할 때 사용

## 태그 형태

```html
<태그명 속성 = "속성값"> 내용 </태그명>
```

- 닫는 태그가 없는 경우도 있다.
- 태그명 대소문자 구분은 하지 않는다.
- 주석은 `<!—내용—>` **or** `//`으로 표시한다.
- 속성 종류: class, id, style, src

### 가장 큰 범위 설정

- **<html>**
    - HTML 문서
    - 파일의 시작과 끝에 위치
- **<head>**
    - 보이지 않는 문서 내용
    - 메타데이터
        - <meta> 기타 메타데이터 요소
            - e.g 문자 인코딩으로 utf-8 설정
    - css파일 등을 불러올 때 자주 사용
        - 사용자가 처음 볼 때 예쁜 화면이 나오는 게 중요하기 때문
- **<body>**
    - 대부분의 코드
    - 보이는 문서 내용
    - body 코드 마지막 부분에 주로 javascript 코드를 배치한다.
- **<title>**
    - 문서 제목(탭에 표시) - 홈페이지 열었을 때 상단에 아이콘 옆에 있는 것
    - 
- **<link>**
    - 외부 리소스(html, xss, icon 등) 가져오기
    - 한 페이지에서 작업할 때 다른 페이지의 소스가 필요하면 링크를 통해 가져올 수 있다.
- **<style>**
    - CSS를 HTML 내부에 스타일링

### 콘텐츠 구분 (Semantic tag)

영역을 나누는 태그들 

레이아웃 구성할 때 사용된다.

- **<header>**
    - 헤더, 주로 로고, 제목, 검색 부분
- **<main>**
    - 주요 콘텐츠 (문서 1개당 메인 1개)
- **<footer>**
    - 주로 저자, 저작권, 관련 문서 기입
- **<nav>**
    - 페이지 링크 모음, 주로 메뉴, 목차, 색인
- **<aside>**
    - 부가적인 부분. 광고나 기타 링크 등을 포함한 사이드 바
- **<article>**
    - 독립적으로 구분되거나 재사용 가능한 영역. 매거진, 신문 기사, 블로그 포스팅
- **<section>**
    - 한 주제로 묶인 영역, 더 적합한 요소가 없을 때 사용. 제목이 포함됨
- **<hgroup>**
    - 여러 단계의 제목을 묶기

### 자바스크립트

- **<script>**

### 기본적인 영역 구분

- **<div>**
    - 단락 바꿈
    - 밑으로 간다.
- **<span>**
    - 옆으로 간다.

### 텍스트 콘텐츠

- **<p>**
    - 단락
- **<pre>**
    - Preformatted Text
    - 입력한 그대로 공백과 줄바꿈을 유지하여 텍스트 표시
- **<ol>**
    - ordered list
    - 숫자나 알파벳 등 순서가 있는 목록 생성
- **<ul>**
    - unordered list
    - 순서가 필요없는 목록 생성
- **<dl>**
    - definition list
    - 사전처럼 용어를 설명하는 목록 생성
- **<li>**
    - list item
    - <ol>과 <ul> 안에서 항목들을 나열할 때 사용
- **<blockquote>**
    - 인용문

### Inline 텍스트

- **<a>**
    - 링크
    - 하이퍼링크가 걸린다는 뜻에서 html이 된 것
    - 상세페이지 보다가 맨 위로 올리고 싶어서 화살표 누르는 것도 <a>사용한 것
- **<br>**
    - 줄바꿈
    - <div>로 layout을 구성할 수 있는데 <br>로 간격을 조정하면 코드가 더러워질 수 있음

### 멀티미디어

- **<img>**
    - 이미지
- **<audio>**
- **<video>**

### 표 컨텐츠

- **<table>**
- **<tr>**
    - table row
    - 한 줄
- **<th>**
    - table head
    - 진하게 해준다
- **<td>**
    - table data
    - 표 안에 들어가는 데이터를 감싸주는 역할

### 폼 - 회원가입, 새 글 작성

- **<form>**
    - 폼
- **<input>**
    - 로그인 하려고 했을 때 id / pw 등을 적는 곳
- **<textarea>**
- **<select>**
    - 선택
        - checkbox 다중 선택
        - radio 단일 선택
        - dropdown
- **<option>**
- **<button>**
    - 제출 버튼

## 실습 코드

- 설문지 폼

    ```html
    <html>
    <head>
    	<title> My first form </title>
    </head>

    <body>
    <form>
    	
    	<div>
    		<strong> 아이디 </strong>
    		<input type = "text" name = "name" value = "아이디 입력">
    		<!-- type: 입력폼에 클라이언트에게 어떻게 보일지 선택 
    			name: 백엔드에서 받을 때 이름을 지정해주어야 함
    			전송을 했는데 백엔드에서 받지 못했다면 이름 설정했는지 확인해야 한다.
    			value: 실제로 입력폼에 나타나는 값, 초기값 설정하는 역할도 할 수 있다.-->
    	</div>
    	<div>
    		<strong> 비밀번호 </strong>
    		<input type = "password" name = "password" value = "비밀번호 입력">
    		<!-- type이 password면 **** 형태로 출력된다. -->
    	</div>
    	<div>
    		<strong>성별</strong>
    		<input type = "radio" name = "gender" value = "M"> Male
    		<input type = "radio" name = "gender" value = "F"> Female
    		<!-- radio: 단일 선택 -->
    	</div>
    	<div>
    		<strong>마음에 드는 팀 이름</strong>
    		<input type = "checkbox" name = "teamname" value = "Pudding"> Pudding
    		<input type = "checkbox" name = "teamname" value = "Cake"> Cake
    		<input type = "checkbox" name = "teamname" value = "Macaron"> Macaron
    		<!-- checkbox: 복수 선택 -->
    	</div>
    	<div>
    		<strong>생일이 있는 달</strong>
    		<select name "month" id = "month">
    			<option value = "3">March</option>
    			<option value = "4">April</option>
    			<option value = "5">May</option>
    		</select>
    	</div>
    	<div>
    		<button type = "submit">Submit</button>
    	</div>

    </form>
    </body>
    </html>
    ```

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
