<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head><title>${title}</title></head>
<body>
<center><a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="" width="200px" height="190px"></a>
    <div > <jsp:include page="/WEB-INF/view/layouts/nav.jsp"/></div>
</center>
<center>

    <h1>${title}</h1>
    <div class="container">
        <c:if test="${param.error != null}">ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง</c:if>
        <c:if test="${param.logout != null}">คุณออกจากระบบแล้ว</c:if>
        <form:form action="${pageContext.request.contextPath}/authenticate" method="POST">
            <p>ชื่อผู้ใช้: <input type="text" name="username" class="form-control form-control-lg"/></p>
            <p>รหัสผ่าน: <input type="password" name="password"  class="form-control form-control-lg"/></p>
            <input class="btn btn-primary btn-lg btn-block" type="submit" value="เข้าสู่ระบบ"/>
        </form:form>

    </div>

</center>

<jsp:include page="/WEB-INF/view/layouts/footer.jsp"/>
</body>
</html>

