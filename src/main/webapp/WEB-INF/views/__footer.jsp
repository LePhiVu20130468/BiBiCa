<!-- <%@ include file="_init.jsp" %>.// -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<footer class="section-footer">
  <section class="footer-bottom text-center bg-light border-top py-3">
    <div class="container-fluid">© 2026 — BiBiCa Shop | Website kinh doanh sách.</br>20130468 - Lê Phi Vũ (Cầm trùm nhóm)</br>20130241 - Phạm Thị Nhựt Duy</br>21130413 - Lê Tuấn Kiệt</br>Khoa Công nghệ Thông tin - Trường Đại học Nông Lâm TP.HCM.</div> <!-- container-fluid.// -->
  </section> <!-- footer-bottom.// -->
</footer>
<button id="btn-back-to-top" onclick="scrollToTop()">
  &#8679; </button>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        document.body.classList.add('loaded');
    });

    function changeLanguageSmoothly(url) {
        document.body.classList.remove('loaded');

        setTimeout(function() {
            window.location.href = url;
        }, 400);
    }
</script>

