<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>หน้าหลัก</title>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/></head>
<body>
<h1>KBM POSTER GALLERY</h1>
<div class="container">
    <jsp:include page="/WEB-INF/view/layouts/nav.jsp"/>
</div>
<div>
    <img class="Lhome" src="${pageContext.request.contextPath}/assets/img/KBM%20(2).png"style="width:50% ">
</div>
<center>
<div><jsp:include  page="/WEB-INF/view/layouts/footer.jsp"/></div>
    </center>
</body>
</html>