<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/insert" method="post">
    id: <input type="text" name="id">
    pwd: <input type="text" name="password">
    <button type="submit">제출</button>
</form>
</body>
</html>
