<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>${title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
</head>
<body>

<div class="container">
    <center><a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="" width="200px" height="190px"></a>
        <div > <jsp:include page="/WEB-INF/view/layouts/nav.jsp"/></div>
        <div id="header"><h1>${title}</h1>
        </div>
    </center>

    <div id="container">
        <center><i>กรอกข้อมูลในฟอร์ม เครื่องหมายดอกจัน (*) หมายถึงห้ามว่าง</i><br><br>
        <form:form action="${pageContext.request.contextPath}/poster/save "
                   modelAttribute="poster" method="POST">
            <form:hidden path="id"/>
            <table>
                <colgroup>
                    <col style="width: 160px;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                <tr><td><label>รหัสสินค้า:</label></td>
                    <td><form:input path="code"/>
                        <form:errors path="code" cssClass="error"/>
                    </td>
                </tr>
                <tr><td><label>ชื่อสินค้า:</label></td>
                    <td><form:input path="name"/>
                        <form:errors path="name" cssClass="error"/>
                    </td>
                </tr>
                <tr><td><label>ขนาด:</label></td>
                    <td><form:input path="size"/>
                        <form:errors path="size" cssClass="error"/>
                    </td>
                </tr>
                <tr><td><label>ราคา:</label></td>
                    <td><form:input path="price" cssClass="number"/>
                        <form:errors path="price" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <td><label>ประเภทสินค้า</label></td>
                    <td>
                        <form:select path="category.code">
                            <form:option value="" label="-- กรุณาเลือกรายการ --"/>
                            <form:options items="${categories}" itemLabel="name"
                                          itemValue="code"/>
                        </form:select>
                        <form:errors path="category.code" cssClass="error"/>
                    </td>

                </tr>
                <tr>
                    <td><label>เจ้าของสินค้า</label></td>
                    <td>
                        <form:select path="owners.code">
                            <form:option value="" label="-- กรุณาเลือกรายการ --"/>
                            <form:options items="${owner}" itemLabel="name"
                                          itemValue="code"/>
                        </form:select>
                        <form:errors path="owners.code" cssClass="error"/>
                    </td>
                </tr>
                <tr><td><label>รายละเอียด:</label></td>
                    <td><form:textarea path="description"
                                       cols="50" rows="5"></form:textarea>
                        <form:errors path="description" cssClass="error"/>
                    </td>
                </tr>
                <tr><td><label></label></td>
                    <td>
                        <input type="submit" value="บันทึก" class="save"/>
                        <input type="button" value="ลบ"
                               onclick="if((confirm('คุณแน่ใจหรือว่าต้องการลบสินค้านี้?'))) {
                                       window.location.href='${pageContext.request.contextPath}/poster/${poster.id}/delete'; return false; }"
                               class="cancel-button"
                        />
                    </td>
                </tr>
                </tbody>
            </table>
        </form:form>
        </center>
    </div>
</div>
<jsp:include page="/WEB-INF/view/layouts/footer.jsp"/>
</body>
</html>