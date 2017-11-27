<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

<html>
<head>
  <title>Подробная информрация</title>

</head>
<body>
<h1>Подробное описание</h1>

<table class="table">
  <tr>
    <th width="80">ID</th>
    <th width="120">Название</th>
    <th width="120">Автор</th>
    <th width="120">Описание</th>
    <th width="200">Обложка</th>
  </tr>
  <tr>
    <td>${book.id}</td>
    <td>${book.name}</td>
    <td>${book.author}</td>
    <td>${book.info}</td>
    <td><img class="img-thumbnail" src="data:image/jpeg;base64,${image}" width="100" height="200"/></td>
  </tr>
</table>
</body>
</html>