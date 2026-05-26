<%@ include file="_init.jsp" %>
<!DOCTYPE html>
<html lang="vi">

<head>
  <jsp:include page="_meta.jsp"/>
  <title>BiBiCa Shop | <fmt:message key="productsview.title.danhsachsanphammoinhat" /></title>


</head>

<body>
<jsp:include page="_header.jsp"/>

<div class="container">
    <header class="section-heading py-4 d-flex justify-content-between">
      <h3 class="section-title"><fmt:message key="productsview.h3.danhsachsanphammoinhat" /></h3>
      <a class="btn btn-secondary" href="${pageContext.request.contextPath}/categoryAll" role="button" style="height: fit-content;"><fmt:message key="homeview.a.xemtatca" /></a>
    </header> <div class="row item-grid">
      <c:forEach var="product" items="${requestScope.allProduct}">
        <div class="col-xl-3 col-lg-4 col-md-6 mb-4"> <div class="card cardA p-2 h-100">
            <a href="${pageContext.request.contextPath}/product?id=${product.id}" class="img-wrap img-wrapA text-center">
              <c:choose>
                <c:when test="${empty product.imageName}">
                  <img src="${pageContext.request.contextPath}/img/280px.png" alt="default">
                </c:when>
                <c:otherwise>
                  <img src="${pageContext.request.contextPath}/image/${product.imageName}" alt="${product.imageName}">
                </c:otherwise>
              </c:choose>
            </a>

            <figcaption class="info-wrap">

              <a href="${pageContext.request.contextPath}/product?id=${product.id}" class="titleA" title="${product.name}">
                ${product.name}
              </a>

              <div class="mb-2">
                <c:choose>
                  <c:when test="${product.discount == 0}">
                    <span class="price fw-bold">
                      <fmt:formatNumber pattern="#,##0" value="${product.price}"/>₫
                    </span>
                  </c:when>
                  <c:otherwise>
                    <span class="price fw-bold">
                      <fmt:formatNumber pattern="#,##0" value="${product.price * (100 - product.discount) / 100}"/>₫
                    </span>
                    <span class="ms-1 text-muted text-decoration-line-through small">
                      <fmt:formatNumber pattern="#,##0" value="${product.price}"/>₫
                    </span>
                    <span class="badge bg-danger ms-1">
                      -<fmt:formatNumber pattern="#,##0" value="${product.discount}"/>%
                    </span>
                  </c:otherwise>
                </c:choose>
              </div>

              <div class="d-flex justify-content-between align-items-center mt-auto-custom">
                  <button type="button"
                          class="btn btn-outline-danger btn-sm btn-add-wishlist"
                          data-id="${product.id}"
                          data-name="${product.name}"
                          ${requestScope.wishlistMap[product.id] == 1 ? 'disabled' : ''}
                          title="Thêm vào yêu thích">
                      <i class="bi bi-heart${requestScope.wishlistMap[product.id] == 1 ? '-fill' : ''}"></i>
                  </button>

                  <div>
                      <button type="button"
                              class="btn btn-primary btn-sm btn-buy-now"
                              data-id="${product.id}"
                              data-name="${product.name}">
                          Mua ngay
                      </button>

                      <button type="button"
                              class="btn btn-light btn-sm border btn-add-cart"
                              data-id="${product.id}"
                              data-name="${product.name}"
                              title="Thêm vào giỏ hàng">
                          <i class="bi bi-cart-plus"></i>
                      </button>
                  </div>
              </div> </figcaption>
          </div>
        </div> </c:forEach>
    </div> </div>

<jsp:include page="_footer.jsp"/>
<div class="toast-container position-fixed bottom-0 start-0 p-3"></div>
<script src="${pageContext.request.contextPath}/js/home.js" type="module"></script>
</body>
</html>