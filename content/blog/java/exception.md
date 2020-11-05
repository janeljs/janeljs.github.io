---
title: IOException
date: 2020-11-05 16:11:06
category: java
thumbnail: { thumbnailSrc }
draft: false
---
### 오류 vs. 예외 
- 오류(error): 시스템 레벨에서 프로그램에 심각한 문제를 야기하여 실행 중인 프로그램을 종료  
- 예외(exception): 실행 중인 프로그램을 비정상적으로 종료시키지만, 개발자가 발생할 수 있는 상황을 미리 예측하여 처리할 수 있음

### 예외 처리(Exception handling)
```java
try { 예외를 처리하길 원하는 실행 코드; }
// 여기서 예외가 발생하면 catch 블록에서 처리, 예외가 발생하지 않는다면 바로 finally 블록으로 이동 

catch (e1) { e1 예외가 발생할 경우에 실행될 코드; } 
catch (e2) { e2 예외가 발생할 경우에 실행될 코드; } 
// 적절한 catch 블록을 찾지 못하면 예외 처리 불가 -> 프로그램 강제 종료 
// 적절한 catch블록을 찾으면 throw 문의 피연산자를 예외 객체의 형식 매개변수로 전달
...
finally { 예외 발생 여부와 상관없이 무조건 실행될 코드; }
```
💡 다른 제어문과는 달리 예외 처리문은 중괄호({})를 생략할 수 없다.

### 예외 클래스(Exception class)

<img src="./images/exception.png" width="70%">

#

***Source***

[tcpschool.com/java/java_exception_intro](http://www.tcpschool.com/java/java_exception_intro)
[tcpschool.com/java/java_exception_class](http://www.tcpschool.com/java/java_exception_class)
