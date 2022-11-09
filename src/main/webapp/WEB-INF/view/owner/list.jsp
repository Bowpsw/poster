<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
  <title>${title}</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
</head>
<body>

<div class="container">
  <center><a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="" width="200px" height="190px"></a>
    <div > <jsp:include page="/WEB-INF/view/layouts/nav.jsp"/></div>
  </center>
  <center><h1>${title}</h1></center>
  <center>  <input type="button" value="เพิ่มเจ้าของรูปภาพ " class="btn btn-outline-secondary"  type="button"
                   onclick="window.location.href='${pageContext.request.contextPath}/owner/create'; return false;"
  /></center>
  <br>
  <center>
    <table class="table-bordered" style="background-color: #cce4af">
      <thead>
      <tr >
        <th style="background-color: #7db53c ">รหัสเจ้าของรูป</th>
        <th style="background-color: #7db53c ">ชื่อเจ้าของ</th>
        <th style="background-color: #7db53c ">เบอร์</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="owner" items="${owners}">
        <tr><td>
          <a href="${pageContext.request.contextPath}/owner/${owner.id}/update" style="color: #436e82">
              ${owner.code}</a></td>
          <td>${owner.name}</td>
          <td>${owner.phone}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </center>
</div>
<br><br>
<jsp:include page="/WEB-INF/view/layouts/footer.jsp"/>
</body>
</html>