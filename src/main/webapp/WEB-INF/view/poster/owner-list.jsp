<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>${title}</title>
  <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <link href="${pageContext.request.contextPath}/assets/css/style.css"
        rel="stylesheet">
</head>
<body>
<div id="header"><h1>${title}</h1></div>
<div class="container">
  <jsp:include page="/WEB-INF/view/layouts/nav.jsp"/>
  <form action="${pageContext.request.contextPath}/poster/${poster.id}/owner/add"
        method="post">
    <table class="table-bordered">
      <thead>
      <tr>
        <th>รหัสเจ้าของรูป</th><th>ชื่อเจ้าของรูป</th><th>เบอร์</th><th>Action</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="owner" items="${owners}">
        <tr>
          <td class="center"><a href="${pageContext.request.contextPath}/owner/${owner.id}/update">${owner.code}</a></td>
          <td>${owner.name}</td>
          <td>${owner.phone}</td>
          <td class="center">
            <button type="submit" name="owner" value="${owner.id}">
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