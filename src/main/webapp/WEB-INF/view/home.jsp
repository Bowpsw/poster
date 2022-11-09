<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>หน้าหลัก</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>

<body>

<div class="container">
    <center><a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="" width="200px" height="190px"></a>
   <div > <jsp:include page="/WEB-INF/view/layouts/nav.jsp"/></div>

        <h1>KBM POSTER GALLERY</h1>
    </center>
</div>
<center>
<div>
    <img class="Lhome" src="${pageContext.request.contextPath}/assets/img/pa.png"alt="" width="100%" height="120%">
</div>
</center>
<center>
    <div><jsp:include  page="/WEB-INF/view/layouts/footer.jsp"/></div>
</center>

</body>
</html>