<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>
<head>
  <title>BookData</title>

  <style type="text/css">
    .tg {
      border-collapse: collapse;
      border-spacing: 0;
      border-color: #ccc;
    }

    .tg td {
      font-family: Arial, sans-serif;
      font-size: 14px;
      padding: 10px 5px;
      border-style: solid;
      border-width: 1px;
      overflow: hidden;
      word-break: normal;
      border-color: #ccc;
      color: #333;
      background-color: #fff;
    }

    .tg th {
      font-family: Arial, sans-serif;
      font-size: 14px;
      font-weight: normal;
      padding: 10px 5px;
      border-style: solid;
      border-width: 1px;
      overflow: hidden;
      word-break: normal;
      border-color: #ccc;
      color: #333;
      background-color: #f0f0f0;
    }

    .tg .tg-4eph {
      background-color: #f9f9f9
    }
  </style>

</head>
<body>
<h1>Подробное описание</h1>

<table class="tg">
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
    <td><img  src="data:image/jpeg;base64,${image}" width="200" height="300"/></td>
  </tr>
</table>
</body>
</html>