<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPEhtml><html><head><title>${title}</title><link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"></head><body><div id="header"><h1>${title}</h1></div><div class="container">
<jsp:include page="/WEB-INF/view/layouts/nav.jsp"/>
<form action="${pageContext.request.contextPath}/product/${product.id}/shop/add" method="post">
    <table class="table-bordered">
        <thead>
        <tr>
            <th>รหัสร้านค้า</th>
            <th>ชื่อร้านค้า</th>
            <th>ชื่อเจ้าของ</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody><c:forEach var="owner" items="${owners}">
            <tr>
                <td class="center"><a href="${pageContext.request.contextPath}/owner/${owner.id}/update">${owner.code}</a>
                </td>
                <td>${owner.name}</td>
                <td>${owner.owner}</td>
                <td class="center">
                    <button type="submit" name="owner" value="${owner.id}">เพิ่ม</button>
                </td>
            </tr>
        </c:forEach></tbody>
    </table>
</form>
</div>
<jsp:include page="/WEB-INF/view/layouts/footer.jsp"/>
</body></html>