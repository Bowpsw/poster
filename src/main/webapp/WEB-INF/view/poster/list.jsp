<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>${title}</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/assets/css/poster/joeblog.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/poster/themify-icons.css" rel="stylesheet"/>
</head>
<body>

<div class="container">
    <jsp:include page="/WEB-INF/view/layouts/nav.jsp"/>
    <security:authorize access="hasRole('OWNER')">
        <br><br>

    </security:authorize>
    <center><h1>${title}</h1></center>
    <center>    <input type="button" value="เพิ่มสินค้า"
                       onclick="window.location.href='${pageContext.request.contextPath}/poster/create'; return false;"
                       class="add-button"
    /></center>

<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>รหัสสินค้า</th>--%>
<%--            <th>ชื่อสินค้า</th>--%>
<%--            <th>ขนาด</th>--%>
<%--            <th>ราคา</th>--%>
<%--            <th>เจ้าของรูป</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<div style="width: 100%">
        <c:forEach var="poster" items="${posters}">
            <center>
                <table style="width: 30% ;float: left">
                    <div class="col-lg-6" >
                        <div class="card text-center mb-5" >
                            <div class="card-header p-0">
                                <div class="blog-media">
                                    <img class="log-fl" src="${pageContext.request.contextPath}/assets/img/${poster.code}.png"style="width:200px ">
                                </div>
                            </div>
                            <div class="card-body px-0">
                                <h5 class="card-title mb-2">
                                        ${poster.name}</h5>
                                <small class="small text-muted">${poster.size}
                                    <span class="px-2">-</span>
                                    <a href="#" class="text-muted">${poster.price}</a>
                                </small>
                            </div>
                                <%--           owner                 --%>
                            <security:authorize access="hasRole('OWNER')">
                            <div class="card-footer p-0 text-center">
                                <a href="${pageContext.request.contextPath}/poster/${poster.id}/update" class="btn btn-outline-dark btn-sm">แก้ไข</a>
                            </div>
                            </security:authorize>
                        </div>
                    </div>
                </table>
            </center>


<%--            <tr><td>--%>
<%--                <a href="${pageContext.request.contextPath}/poster/${poster.id}/update">--%>
<%--                        ${poster.code}</a></td>--%>
<%--                <td>${poster.name}</td>--%>
<%--                <td>${poster.size}</td>--%>
<%--                <td class="number">--%>
<%--                    <fmt:formatNumber type="number" pattern="###,###.00"--%>
<%--                                      value="${poster.price}"/>--%>
<%--                </td>--%>
<%--                <td>${poster.owners.name}</td>--%>
<%--            </tr>--%>
        </c:forEach>
</div>
</div>



<jsp:include page="/WEB-INF/view/layouts/footer.jsp"/>
</body>
</html>