<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="vi_VN"/>

<c:if test="${empty sessionScope.lang}">
    <c:set var="lang" value="vi" scope="session"/>
</c:if>

<fmt:setLocale value="${sessionScope.lang}" />
<fmt:setBundle basename="messages" />