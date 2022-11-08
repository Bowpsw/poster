<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form:form action="${pageContext.request.contextPath}/logout"
           method="POST" name="frmLogout"></form:form>
<style>
    ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #cce4af;
    }

    li {
        float: left;
        color: white;
    }

    li a {
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    /* Change the link color to #111 (black) on hover */
    li a:hover {
        background-color: #7db53c;
    }
    a{
        color: white;
    }
</style>
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav" style="list-style-type: none;">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}">หน้าหลัก</a></th>
                </li>
                <li class="nav-item">
                    <th><a class="nav-link" href="${pageContext.request.contextPath}/poster/list">โปรเตอร์
                    </a>
                </li>
                <security:authorize access="hasRole('MANAGER')">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/owner/list">เจ้าของรูป
                </a>
                </li>
                </security:authorize>
                <security:authorize access="!isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/login">เข้าสู่ระบบ
                        </a>
                    </li>
                </security:authorize>
                <security:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="javascript:frmLogout.submit();">ออกจากระบบ
                        </a>
                    </li>
                </security:authorize>
            </ul>
        </div>
    </div>
</nav>
<hr>

