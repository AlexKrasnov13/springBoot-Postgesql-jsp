<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

<head>
    <title>Books Page</title>

   <%-- <style type="text/css">

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
        .error {
            color: #800000;
        }

        .errorblock {
            color: #000;
            background-color: #ffEEEE;
            border: 3px solid #ff0000;
            padding: 8px;
            margin: 16px;
        }
    </style>--%>
</head>
<body>
<br/>
<br/>
<h1>Список книг</h1>
<c:if test="${!empty listBooks}">
    <table class="table">
        <tr>
            <th width="80">ID</th>
            <th width="120">Название</th>
            <th width="120">Автор</th>
            <th width="100">Редактировать</th>
            <th width="100">Удалить</th>
        </tr>
        <c:forEach items="${listBooks}" var="book">
            <tr>
                <td>${book.id}</td>
                <td><a href="/bookdata/${book.id}" target="_blank">${book.name}</a></td>
                <td>${book.author}</td>
                <td><a href="<c:url value='/edit/${book.id}'/>">Редактировать</a></td>
                <td><a href="<c:url value='/remove/${book.id}'/>">Удалить</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<br>
<br>
<br>
<br>
<h3><span class="badge badge-secondary">Добавить новую книгу</span></h3>

<c:url var="addBook" value="/books/add"/>

<form:form action="${addBook}" modelAttribute="book" enctype="multipart/form-data" cssClass="input-group-addon">
    <td>
    </td>
    <table>
        <c:if test="${!empty book.name}">
            <tr>
                <td>
                    <form:label  path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label cssClass="label-primary" path="name">
                    <spring:message text="Название:"/>
                </form:label>

            </td>
            <td>
                <form:input path="name"/>
            </td>
            <td>
                <form:errors path="name"
                             cssClass="alert-danger" element="div">
                </form:errors>
            </td>
        </tr>
        <tr>
            <td>
                <form:label cssClass="label-primary" path="author">
                    <spring:message text="Автор:"/>
                </form:label>
            </td>
            <td>
                <form:input path="author"/>
            </td>
            <td>
            <form:errors  path="author"
                         cssClass="alert-danger" element="div">
            </form:errors>
            </td>
        </tr>
        <tr>
            <td>
                <form:label cssClass="label-primary" path="info">
                    <spring:message text="Описание книги:"/>
                </form:label>
            </td>
            <td>
                <form:textarea cssClass="label-primary" name="info"  path="info" />
            </td>
            <td>
                 <form:errors path="info"
                         cssClass="alert-danger" element="div">
                 </form:errors>
            </td>
        </tr>
        <tr>
            <td><form:label cssClass="label-primary" path="photoBlob" >Загрузить обложку:</form:label></td>
            <td><input type="file" accept="image/*" name="file" /></td>
            <td><form:errors path="PhotoContentType" cssClass="alert-danger"/> </td>
        </tr>
        <tr>
        <td colspan="2">
            <c:if test="${!empty book.name}">
                <input type="submit"
                       value="<spring:message text="Редактировать"/>"/>
            </c:if>
            <c:if test="${empty book.name}">
                <input type="submit"
                       value="<spring:message text="Добавить книгу"/>"/>
            </c:if>
        </td>
        </tr>
    </table>
</form:form>
</body>
</html>
