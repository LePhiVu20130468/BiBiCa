<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="contextPath" content="${pageContext.request.contextPath}"/>
<c:if test="${not empty sessionScope.currentUser}">
  <meta name="currentUserId" content="${sessionScope.currentUser.id}"/>
</c:if>
<c:if test="${not empty requestScope.product}">
  <meta name="productId" content="${requestScope.product.id}"/>
</c:if>

<link href="${pageContext.request.contextPath}/img/favicon.svg" rel="shortcut icon" type="image/x-icon">

<!-- Bootstrap v5.0.1 -->
<link href="${pageContext.request.contextPath}/css/bootstrap.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.js" type="text/javascript"></script>

<!-- Bootstrap Icons v1.5.0 -->
<link href="${pageContext.request.contextPath}/css/bootstrap-icons.css" type="text/css" rel="stylesheet">

<!-- Custom Styles -->
<link href="${pageContext.request.contextPath}/css/styles.css" type="text/css" rel="stylesheet">

<!-- Header Script -->
<script src="${pageContext.request.contextPath}/js/header.js" type="module"></script>
<style>
/* Mặc định body sẽ ẩn đi (trong suốt) */
body {
    opacity: 0;
    transition: opacity 0.4s ease-in-out; /* Hiệu ứng chuyển đổi trong 0.4 giây */
}

/* Khi có class 'loaded', body sẽ hiện lên */
body.loaded {
    opacity: 1;
}
/* css change language - begin */
/* Khung bao ngoài */
.language-switcher {
    display: flex;       /* Xếp hàng ngang */
    gap: 10px;           /* Khoảng cách giữa 2 nút (thay cho dấu |) */
    align-items: center;
}

/* Style chung cho nút ngôn ngữ */
.lang-btn {
    text-decoration: none; /* Bỏ gạch chân */
    color: #333;           /* Màu chữ mặc định */
    padding: 5px 12px;     /* Tạo khoảng thở xung quanh chữ */
    border: 1px solid #ccc;/* Viền mỏng (tùy chọn) */
    border-radius: 20px;   /* Bo tròn góc cho đẹp */
    transition: all 0.3s;  /* Hiệu ứng chuyển màu mượt mà */
    font-size: 14px;
}

/* Khi rê chuột vào (Hover) */
.lang-btn:hover {
    background-color: #f0f0f0;
}

.lang-btn.active {
    background-color: #dc3545; /* Màu đỏ */
    color: #ffffff;            /* Chữ màu trắng (để nổi trên nền đỏ) */
    font-weight: bold;         /* Chữ đậm */
    border-color: #dc3545;     /* Viền cùng màu nền */
    cursor: default;           /* Con trỏ chuột không biến thành hình bàn tay (vì đang chọn rồi) */
}
/* css change language - begin */
/* CSS MỚI - ĐẢM BẢO TRÒN VO */
#btn-back-to-top {
  /* 1. BẮT BUỘC CÁC DÒNG NÀY ĐỂ TRÒN */
  width: 50px;        /* Chiều rộng cố định */
  height: 50px;       /* Chiều cao PHẢI BẰNG chiều rộng */
  border-radius: 50%; /* Bo góc 50% -> auto thành hình tròn */
  padding: 0;         /* Reset padding để không bị méo */

  /* 2. Căn giữa mũi tên cho đẹp */
  text-align: center; /* Căn giữa ngang */
  line-height: 50px;  /* Mẹo: line-height bằng height sẽ căn giữa dọc */
  font-size: 22px;    /* Tăng kích thước mũi tên lên xíu cho rõ */

  /* 3. Các thiết lập vị trí và màu sắc (giữ nguyên hoặc sửa tùy ý) */
  display: none;      /* Ẩn mặc định, đợi JS gọi */
  position: fixed;
  bottom: 30px;       /* Cách đáy 30px */
  right: 20px;        /* Cách phải 30px */
  z-index: 99;
  border: none;
  outline: none;
  background-color: #FF5722; /* Tui đổi thử màu cam đậm cho nổi nha */
  color: white;
  cursor: pointer;
  box-shadow: 0 4px 10px rgba(0,0,0,0.3); /* Thêm cái bóng cho nó 3D xíu */
  transition: all 0.3s ease;
}

/* Hiệu ứng khi di chuột vào cho sinh động nè */
#btn-back-to-top:hover {
  background-color: #E64A19;   /* Đổi màu tối hơn chút */
  transform: scale(1.1) translateY(-5px); /* Phóng to nhẹ và bay lên xíu */
  box-shadow: 0 6px 14px rgba(0,0,0,0.4); /* Bóng đậm hơn */
}

/* ========= */
/* 1. Card gọn gàng hơn */
      .cardA {
          height: 100%;
          border: 1px solid #dee2e6;
          display: flex;
          flex-direction: column;
          /* Giảm padding trong HTML từ p-3 xuống p-2 rồi nên không cần chỉnh ở đây */
      }

      /* 2. THU NHỎ ẢNH: Giảm từ 250px xuống 200px */
      .img-wrapA {
          height: 200px; /* Đã giảm chiều cao */
          width: 100%;
          display: flex;
          align-items: center;
          justify-content: center;
          overflow: hidden;
          background: #fff;
          flex-shrink: 0;
          margin-bottom: 0.5rem; /* Thêm chút khoảng cách dưới ảnh */
      }
      .img-wrapA img {
          max-height: 100%;
          max-width: 100%;
          width: auto;
          height: auto;
          object-fit: contain;
      }

      /* 3. Cột nội dung gọn hơn */
      .info-wrap {
          display: flex;
          flex-direction: column;
          height: 100%;
          padding: 0 0.5rem 0.5rem 0.5rem; /* Tinh chỉnh padding nội dung */
      }

      /* 4. Tên sản phẩm nhỏ gọn hơn xíu */
      .titleA {
          display: -webkit-box;
          -webkit-line-clamp: 2;
          -webkit-box-orient: vertical;
          overflow: hidden;
          height: 40px; /* Giảm chiều cao khung tên */
          line-height: 20px;
          margin-bottom: 0.25rem; /* Sát lại gần giá hơn */
          color: #212529;
          font-weight: 600;
          font-size: 0.95rem; /* Giảm cỡ chữ chút xíu cho cân đối */
          text-decoration: none;
      }

      /* 5. ĐÃ SỬA: Khoảng cách nút bấm GẦN HƠN */
      .mt-custom {
          margin-top: 8px; /* Giảm từ 15px xuống 8px cho sát */
          width: 100%;
          padding-top: 8px;
          border-top: 1px solid #f0f0f0;
      }

      /* Tinh chỉnh nút bấm nhỏ gọn */
      .btn-sm-custom {
          padding: 0.25rem 0.5rem;
          font-size: 0.85rem;
      }
</style>
