---
title: "[html] html로 설문지 만들기(checkbox, radio, select)"
date: 2020-11-06 23:11:09
category: html
thumbnail: { thumbnailSrc }
draft: false
---

## 폼 만들 때 사용되는 태그들

- **`<form>`**
    - 폼
- **`<input>`**
    - 로그인 하려고 했을 때 id / pw 등을 적는 곳
- **`<textarea>`**
	- 여러 줄의 input을 받을 때 사용 
	```html
	<label for="janefeedback">Leave a feedback:</label>
	<textarea id="janefeedback" name="janefeedback" rows="4" cols="50">
	 피드백을 남겨주세요
	  </textarea>
	```
	- 실행 화면 

		<label for="janefeedback">Leave a feedback:</label>
		<textarea id="janefeedback" name="janefeedback" rows="4" cols="50">
		 피드백을 남겨주세요
		</textarea>
- **`선택`**
    - checkbox 다중 선택
    	 - input type을 "checkbox"로 지정 
    - radio 단일 선택
    	- input type을 "radio"로 지정 
    - select 드롭다운 
    	- **`<select>`**, **`<option>`** 태그 사용 
- **`<button>`**
    - 제출 버튼

## 실습 코드

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


#

***Source***
- 스튜디오 마르 html 세션 