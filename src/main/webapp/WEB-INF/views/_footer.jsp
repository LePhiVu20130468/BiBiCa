<%@ include file="_init.jsp" %>
<footer class="section-footer">
  <section class="footer-top py-5 bg-light">
    <div class="container">
      <div class="row">
        <aside class="col-sm-6 col-lg-3">
          <h6 class="pb-2"><fmt:message key="_footer.h6.gioithieu" /></h6>
          <ul class="list-unstyled">
            <li><a href="#"><fmt:message key="_footer.li.a.veshop" /></a></li>
            <li><a href="#"><fmt:message key="_footer.li.a.tuyendung" /></a></li>
            <li><a href="#"><fmt:message key="_footer.li.a.chinhsachthanhtoan" /></a></li>
            <li><a href="#"><fmt:message key="_footer.li.a.chinhsachbaomat" /></a></li>
            <li><a href="#"><fmt:message key="_footer.li.a.giaiquyetkhieunai" /></a></li>
            <li><a href="#"><fmt:message key="_footer.li.a.hoptac" /></a></li>
          </ul>
        </aside>
        <aside class="col-sm-6 col-lg-3">
          <h6 class="pb-2"><fmt:message key="_footer.h6.hotrokhachhang" /></h6>
          <ul class="list-unstyled">
            <li><fmt:message key="_footer.li.tongdai" />: 0329-769-915</li>
            <li>Mail: 20130468@st.hcmuaf.edu.vn</li>
            <li><a href="#"><fmt:message key="_footer.li.a.cauhoithuonggap" /></a></li>
            <li><a href="#"><fmt:message key="_footer.li.a.huongdandathang" /></a></li>
            <li><a href="#"><fmt:message key="_footer.li.a.phuongthucvanchuyen" /></a></li>
            <li><a href="#"><fmt:message key="_footer.li.a.chinhsachdoitra" /></a></li>
          </ul>
        </aside>
        <aside class="col-lg-5">
          <h6 class="pb-2"><fmt:message key="_footer.h6.dangkynhantin" /></h6>
          <form action="#">
            <div class="input-group w-100">
              <fmt:message key="_footer.input.placeholder.inputmail" var="inputmail" />
              <input type="text" class="form-control" placeholder="${inputmail}">
              <button class="btn btn-primary" type="button">
                <fmt:message key="_footer.button.dangky" />
              </button>
            </div>
          </form>
        </aside>
      </div> <!-- row.// -->
    </div> <!-- container.// -->
  </section> <!-- footer-top.// -->

  <section class="footer-bottom text-center bg-light border-top py-3">
    <div class="container-fluid"><fmt:message key="_footer.div.bibicashop" /></br>20130468 - Lê Phi Vũ (Cầm trùm nhóm)</br>20130241 - Phạm Thị Nhựt Duy</br>21130413 - Lê Tuấn Kiệt</br><fmt:message key="_footer.div.nlu" /></div> <!-- container-fluid.// -->
  </section> <!-- footer-bottom.// -->
</footer> <!-- section-footer.// -->
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
    // Lấy nút từ DOM
    let mybutton = document.getElementById("btn-back-to-top");

    // Khi người dùng cuộn xuống 20px từ đầu trang thì hiện nút
    window.onscroll = function() {
      scrollFunction();
    };

    function scrollFunction() {
      if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        mybutton.style.display = "block";
      } else {
        mybutton.style.display = "none";
      }
    }

    // Khi người dùng bấm nút, cuộn lên đầu trang
    function scrollToTop() {
      window.scrollTo({
        top: 0,
        behavior: 'smooth' // Tạo hiệu ứng cuộn mượt (không bị giật cục)
      });
    }
</script>
