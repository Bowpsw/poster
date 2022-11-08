<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head><title>${title}</title></head>
<body>
<jsp:include page="/WEB-INF/view/layouts/nav.jsp"/>
<center>
    <h1>${title}</h1>
    <div class="container">
        <c:if test="${param.error != null}">ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง</c:if>
        <c:if test="${param.logout != null}">คุณออกจากระบบแล้ว</c:if>
        <form:form action="${pageContext.request.contextPath}/authenticate" method="POST">
            <p>ชื่อผู้ใช้: <input type="text" name="username"/></p>
            <p>รหัสผ่าน: <input type="password" name="password"/></p>
            <input type="submit" value="เข้าสู่ระบบ"/>
        </form:form>

    </div>
</center>
<jsp:include page="/WEB-INF/view/layouts/footer.jsp"/>
</body>
</html>