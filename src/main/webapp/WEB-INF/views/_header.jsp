<%@ include file="_init.jsp" %>
<header class="section-header">
  <section class="header-main border-bottom">
    <div class="container">
    <!-- LPV: Da Ngon Ngu - begin.// -->
    <div class="language-switcher">
        <a href="javascript:void(0)"
           onclick="changeLanguageSmoothly('${pageContext.request.contextPath}/change-lang?lang=vi')"
           class="lang-btn ${sessionScope.lang == 'vi' ? 'active' : ''}">
           Tiếng Việt
        </a>

        <a href="javascript:void(0)"
           onclick="changeLanguageSmoothly('${pageContext.request.contextPath}/change-lang?lang=en')"
           class="lang-btn ${sessionScope.lang == 'en' ? 'active' : ''}">
           English
        </a>
    </div>
        <!-- LPV: Da Ngon Ngu - end.// -->
      <div class="row align-items-center">
        <div class="col-lg-3 py-3">
          <a class="text-body" href="${pageContext.request.contextPath}/">
            <h3>BiBiCa Shop</h3>
          </a>
        </div> <!-- col.// -->
        <div class="col-lg-4 col-xl-5 ${empty sessionScope.currentUser ? 'mb-3 mb-lg-0' : ''}">
          <form action="${pageContext.request.contextPath}/search" method="post" class="search">
            <div class="input-group w-100">
              <fmt:message key="_header.input.placeholder.search" var="search" />
              <input type="text"
                     class="form-control"
                     placeholder="${search}"
                     name="q"
                     value="${requestScope.query}">
              <button class="btn btn-primary" type="submit">
                <i class="bi bi-search"></i>
              </button>
            </div>
          </form>
        </div> <!-- col.// -->
        <div class="col-lg-5 col-xl-4">
          <c:if test="${not empty sessionScope.currentUser}">
            <ul class="nav col-12 col-lg-auto my-2 my-lg-0 justify-content-center justify-content-lg-end text-small">
              <li>
                <a href="${pageContext.request.contextPath}/user" class="nav-link text-body">
                  <i class="bi bi-person d-block text-center fs-3"></i>
                  <fmt:message key="_header.a.taikhoan"/>
                </a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/order" class="nav-link text-body">
                  <i class="bi bi-list-check d-block text-center fs-3"></i>
                  <fmt:message key="_header.a.donhang"/>
                </a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/cart" class="nav-link text-body position-relative">
                  <span class="position-absolute top-0 end-0 mt-2 badge rounded-pill bg-primary" id="total-cart-items-quantity">${sessionScope.totalQuantity != null ? sessionScope.totalQuantity : 0}</span>
                  <i class="bi bi-cart d-block text-center fs-3 position-relative"></i>
                  <fmt:message key="_header.a.cart"/>
                </a>
              </li>
            </ul>
          </c:if>
        </div> <!-- col.// -->
      </div> <!-- row.// -->
    </div> <!-- container.// -->
  </section> <!-- header-main.// -->
</header> <!-- section-header.// -->

<nav class="navbar navbar-main navbar-expand-lg navbar-light border-bottom">
  <div class="container">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
             data-bs-toggle="dropdown" aria-expanded="false">
            <strong><i class="bi bi-list"></i> <fmt:message key="_header.strong.danhmucsanpham"/></strong>
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <c:forEach var="category" items="${requestScope.categories}">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/category?id=${category.id}">
            <c:choose>
                                <c:when test="${empty category.imageName}">
                                  <img width="20" height="20" src="${pageContext.request.contextPath}/img/50px.png"
                                       alt="50px.png">
                                </c:when>
                                <c:otherwise>
                                  <img width="20" height="20" src="${pageContext.request.contextPath}/image/${category.imageName}"
                                       alt="${category.imageName}">
                                </c:otherwise>
                              </c:choose>
            <span class="category-title ms-3">${category.name}</span></a></li>

            <!-- <li><a class="dropdown-item" href="#">Sách khoa học</a></li> .// -->
            <!-- <li><a class="dropdown-item" href="#">Truyện tranh</a></li> .// -->
            <!-- <li><a class="dropdown-item" href="#">Tiểu thuyết</a></li> .// -->
            </c:forEach>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/categoryAll" role="button"><fmt:message key="_header.a.tatcadanhmuc"/></a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/products" role="button"><fmt:message key="_header.a.sanphammoi"/></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><fmt:message key="_header.a.sanphambanchay"/></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><fmt:message key="_header.a.khuyenmai"/></a>
        </li>
      </ul>
      <c:choose>
        <c:when test="${not empty sessionScope.currentUser}">
          <span><fmt:message key="_header.span.hello"/> <strong>${sessionScope.currentUser.fullname}</strong>!</span>
          <a class="btn btn-light ms-2" href="${pageContext.request.contextPath}/signout" role="button">
            <fmt:message key="_header.a.logout"/>
          </a>
        </c:when>
        <c:otherwise>
          <a class="btn btn-light me-2" href="${pageContext.request.contextPath}/signup" role="button">
            <fmt:message key="_header.a.register"/>
          </a>
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/signin" role="button">
            <fmt:message key="_header.a.login" />

          </a>
        </c:otherwise>
      </c:choose>
    </div>
  </div> <!-- container.// -->
</nav> <!-- navbar-main.// -->

<%--<!-- <a class="btn btn-primary" href="${pageContext.request.contextPath}/signin" role="button">.// -->--%>
