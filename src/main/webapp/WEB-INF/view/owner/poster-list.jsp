<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link href="${pageContext.request.contextPath}/assets/css/style.css"
          rel="stylesheet">
</head>
<body>

<div class="container">
    <center><a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="" width="200px" height="190px"></a>
        <div > <jsp:include page="/WEB-INF/view/layouts/nav.jsp"/></div>
        <div id="header"><h1>${title}</h1></div>
    </center>
    <form action="${pageContext.request.contextPath}/owner/${owners.id}/poster/add"
          method="post">
        <table class="table-bordered">
            <thead>
            <tr>
                <th>รหัสสินค้า</th>
                <th>ชื่อสินค้า</th>
                <th>ขนาด</th>
                <th>ราคา</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="poster" items="${poster}">
                <tr>
                    <td class="center"><a href="${pageContext.request.contextPath}/owner/${poster.id}/update">${poster.code}</a>
                    </td>
                    <td>${poster.name}</td>
                    <td>${poster.size}</td>
                    <td>${poster.price}</td>
                    <td class="center">
                        <button  type="submit" name="poster" value="${poster.id}">
                            เพิ่ม </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>
</div>
<jsp:include page="/WEB-INF/view/layouts/footer.jsp"/>
</body>
</html>