<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Hello Spring MVC</title>
</head>

<body>
<h1>Добро пожаловать в Библиотеку </h1>
<img src="https://godliteratury.ru/wp-content/uploads/2017/01/YElektronnaya-biblioteka-575x363.jpg"/>
<br/>
<br>
<h2><a href="<c:url value="/books"/>" target="_blank">К списку книг</a></h2>
<br/>

</body>
</html>