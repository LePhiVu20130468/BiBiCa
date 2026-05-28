<%@ include file="_init.jsp" %>
<!DOCTYPE html>
<html lang="vi">

<head>
  <jsp:include page="_meta.jsp"/>
  <title>BiBiCa Shop | <fmt:message key="categoryviewall.title.tatcadanhmucsanpham" /></title>
</head>

<body>
<jsp:include page="_header.jsp"/>
<div class="container">
<header class="section-heading py-4 d-flex justify-content-between">
      <h3 class="section-title"><fmt:message key="categoryviewall.h3.tatcadanhmucsanpham" /></h3>
      <a class="btn btn-secondary" href="${pageContext.request.contextPath}/categoryAll" role="button" style="height: fit-content;"><fmt:message key="homeview.a.xemtatca" /></a>
    </header> <!-- section-heading.// -->
<div class="row item-grid">
      <c:forEach var="category" items="${requestScope.categoriesAll}">
        <div class="col-lg-3 col-md-6">
          <div class="card mb-4">
            <div class="card-body">
              <a href="${pageContext.request.contextPath}/category?id=${category.id}" class="stretched-link">
                <div class="d-flex align-items-center">
                  <c:choose>
                    <c:when test="${empty category.imageName}">
                      <img width="50" height="50" src="${pageContext.request.contextPath}/img/50px.png"
                           alt="50px.png">
                    </c:when>
                    <c:otherwise>
                      <img width="50" height="50" src="${pageContext.request.contextPath}/image/${category.imageName}"
                           alt="${category.imageName}">
                    </c:otherwise>
                  </c:choose>
                  <span class="category-title ms-3">${category.name}</span>
                </div>
              </a>
            </div>
          </div>
        </div> <!-- col.// -->
      </c:forEach>
    </div> <!-- row.// -->
</div>

<jsp:include page="_footer.jsp"/>
</body>

</html>