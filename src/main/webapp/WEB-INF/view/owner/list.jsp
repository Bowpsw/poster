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

  <input type="button" value="เพิ่มเจ้าของรูปภาพ "
         onclick="window.location.href='${pageContext.request.contextPath}/owner/create'; return false;"
         class="add-button"
  />
  <table class="table-bordered">
    <thead>
    <tr>
      <th>รหัสเจ้าของรูป</th>
      <th>ชื่อเจ้าของ</th>
      <th>เบอร์</th>
<%--      <th>Latitude</th>--%>
<%--      <th>Longitude</th>--%>
      <th>จํานวนรูปภาพ</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="owner" items="${owner}">
      <tr><td>
        <a href="${pageContext.request.contextPath}/owner/${owner.id}/update">
            ${owner.code}</a></td>
        <td>${owner.name}</td>
        <td>${owner.phone}</td>
<%--        <td>${owner.owner}</td>--%>
<%--        <td>${owner.latitude}</td>--%>
<%--        <td>${owner.longitude}</td>--%>
        <td class="center">${fn:length(owner.posters)}</td>

      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<jsp:include page="/WEB-INF/view/layouts/footer.jsp"/>
</body>
</html>