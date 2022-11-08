<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>${title}</title>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
</head>
<body>
<h1>${title}</h1>
<div class="container">
    <jsp:include page="/WEB-INF/view/layouts/nav.jsp"/>

    <input type="button" value="เพิ่มสินค้า"
           onclick="window.location.href='${pageContext.request.contextPath}/poster/create'; return false;"
           class="add-button"
    />
    <table class="table-bordered">
        <thead>
        <tr>
            <th>รหัสสินค้า</th>
            <th>ชื่อสินค้า</th>
            <th>ขนาด</th>
            <th>ราคา</th>
            <th>จํานวนเจ้าของรูป</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="poster" items="${posters}">
            <tr><td>
                <a href="${pageContext.request.contextPath}/poster/${poster.id}/update">
                        ${poster.code}</a></td>
                <td>${poster.name}</td>
                <td>${poster.size}</td>
                <td class="number">
                    <fmt:formatNumber type="number" pattern="###,###.00"
                                      value="${poster.price}"/>
                </td>
                <td class="center">${fn:length(poster.owners)}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="/WEB-INF/view/layouts/footer.jsp"/>
</body>
</html>