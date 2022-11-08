<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head><title>${title}</title></head>
<body>
<div id="header"><h1>${title}</h1>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
</div>
<div class="container">
    <jsp:include page="/WEB-INF/view/layouts/nav.jsp"/>
    <div id="container">
        <i>กรอกข้อมูลในฟอร์ม เครื่องหมายดอกจัน (*) หมายถึงห้ามว่าง</i><br><br>
        <form:form action="${pageContext.request.contextPath}/owner/save "
                   modelAttribute="owner" method="POST">
            <form:hidden path="id"/>
            <table>
                <colgroup>
                    <col style="width: 160px;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                <tr><td><label>รหัสเจ้าของรูป:</label></td>
                    <td><form:input path="code"/>
                        <form:errors path="code" cssClass="error"/>
                    </td>
                </tr>
                <tr><td><label>ชื่อเจ้าของรูป:</label></td>
                    <td><form:input path="name"/>
                        <form:errors path="name" cssClass="error"/>
                    </td>
                </tr>
                <tr><td><label>เบอร์:</label></td>
                    <td><form:input path="phone"/>
                        <form:errors path="phone" cssClass="error"/>
                    </td>
                </tr>
<%--                <tr><td><label>เจ้าของร้าน :</label></td>--%>
<%--                    <td><form:input path="owner" cssClass="number"/>--%>
<%--                        <form:errors path="owner" cssClass="error"/>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr><td><label>Latitude :</label></td>--%>
<%--                    <td><form:input path="latitude" cssClass="number"/>--%>
<%--                        <form:errors path="latitude" cssClass="error"/>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr><td><label>Longitude :</label></td>--%>
<%--                    <td><form:input path="longitude" cssClass="number"/>--%>
<%--                        <form:errors path="longitude" cssClass="error"/>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr><td><label>Address :</label></td>--%>
<%--                    <td><form:textarea path="address"  cols="50" rows="5"></form:textarea>--%>
<%--                        <form:errors path="address" cssClass="error"/>--%>
<%--                    </td>--%>
<%--                </tr>--%>
                <tr><td><label></label></td>
                    <td>
                        <input type="submit" value="บันทึก" class="save"/>
                        <input type="button" value="ลบ"
                               onclick="if((confirm('คุณแน่ใจหรือว่าต้องการลบสินค้านี้?'))) {
                                       window.location.href='${pageContext.request.contextPath}/owner/${owner.id}/delete'; return false; }"
                               class="cancel-button"
                        />
                        <c:if test="${owner.id > 0}">
                            <input type="button" value="แสดงสินค้า"
                                   onclick="window.location.href=
                                           '${pageContext.request.contextPath}/owner/${owner.id}/view-posters';
                                           return false;"
                                   class="add-button"
                            />
                        </c:if>
                    </td>
                </tr>
                </tbody>
            </table>
        </form:form>
    </div>
</div>
<jsp:include page="/WEB-INF/view/layouts/footer.jsp"/>
</body>
</html>