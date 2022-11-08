<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>${title}</title>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/poster/joeblog.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/poster/themify-icons.css" rel="stylesheet"/>
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
            <th>เจ้าของรูป</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="poster" items="${posters}">
        <center>
            <table>
            <div class="col-lg-6">
                <div class="card text-center mb-5">
                    <div class="card-header p-0">
                        <div class="blog-media">
                            <img class="log-fl" src="${pageContext.request.contextPath}/assets/img/${poster.code}.png"style="width:50% ">
                        </div>
                    </div>
                    <div class="card-body px-0">
                        <h5 class="card-title mb-2">${poster.name}</h5>
                        <small class="small text-muted">January 19 2019
                            <span class="px-2">-</span>
                            <a href="#" class="text-muted">64 Comments</a>
                        </small>
                    </div>

                    <div class="card-footer p-0 text-center">
                        <a href="single-post.html" class="btn btn-outline-dark btn-sm">READ MORE</a>
                    </div>
                </div>
            </div>
            </table>
        </center>





            <tr><td>
                <a href="${pageContext.request.contextPath}/poster/${poster.id}/update">
                        ${poster.code}</a></td>
                <td>${poster.name}</td>
                <td>${poster.size}</td>
                <td class="number">
                    <fmt:formatNumber type="number" pattern="###,###.00"
                                      value="${poster.price}"/>
                </td>
                <td>${poster.owners.name}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="/WEB-INF/view/layouts/footer.jsp"/>
</body>
</html>