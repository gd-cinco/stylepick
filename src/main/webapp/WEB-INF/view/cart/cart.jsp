<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

  <!-- CSS here -->
      <link rel="stylesheet" href="${path}/assets/css/bootstrap.min.css">
      <link rel="stylesheet" href="${path}/assets/css/owl.carousel.min.css">
      <link rel="stylesheet" href="${path}/assets/css/flaticon.css">
      <link rel="stylesheet" href="${path}/assets/css/slicknav.css">
      <link rel="stylesheet" href="${path}/assets/css/animate.min.css">
      <link rel="stylesheet" href="${path}/assets/css/magnific-popup.css">
      <link rel="stylesheet" href="${path}/assets/css/fontawesome-all.min.css">
      <link rel="stylesheet" href="${path}/assets/css/themify-icons.css">
      <link rel="stylesheet" href="${path}/assets/css/slick.css">
      <link rel="stylesheet" href="${path}/assets/css/nice-select.css">
      <link rel="stylesheet" href="${path}/assets/css/style.css">
      	<link rel="stylesheet" href="${path}/assets/css/final.css">
      	
</head>
<body>
  <!--================Cart Area =================-->
  <section class="cart_area section_padding">
    <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
           <!--    <tr>
                <th scope="col"><h4>상품</h4></th>
                <th scope="col"><h4>가격</h4></th>
                <th scope="col"><h4>갯수</h4></th>
                <th scope="col"><h4>총합</h4></th>
              </tr> -->
            </thead>
            <tbody>
              <tr>
                <td>
                
                  <div class="media">
                    <div class="d-flex">
                      <img src="${path}/assets/img/arrivel/arrivel_1.png" alt="" /><br>
                    </div>
                    <div class="media-body">
                      <h4>상품 명</h4>
                      <h5>category</h5>
                    </div>
                  </div>
                </td>
                <td>
                <div>
                <h6>옵션명 옵션명 옵션명</h6>
                </div>
                </td>
                <td>
                  <h5>70,000원</h5> <!-- 가격 -->
                </td>
                <td>
                  <div class="product_count">
                    <!-- <input type="text" value="1" min="0" max="10" title="Quantity:"
                      class="input-text qty input-number" />
                    <button
                      class="increase input-number-increment items-count" type="button">
                      <i class="ti-angle-up"></i>
                    </button>
                    <button
                      class="reduced input-number-decrement items-count" type="button">
                      <i class="ti-angle-down"></i>
                    </button> -->
                    <span class="input-number-decrement"> <i class="ti-minus"></i></span>
                    <input class="input-number" type="text" value="1" min="0" max="10">
                    <span class="input-number-increment"> <i class="ti-plus"></i></span>
                  </div>
                </td>
                
                <td>
                  <h5>70,000원</h5>
                </td>
              </tr>
              <!--2번째 상품 나중에 db 추가하면 지우기 -->
              <tr>
                <td>
                  <div class="media">
                    <div class="d-flex">
                      <img src="${path}/item/img/skirt.jpg" alt="" />
                    </div>
                    <div class="media-body">
                      <p>상품 명 2</p>
                    </div>
                  </div>
                </td>
                       <td>
                <div>
                <h6>옵션명 옵션명 옵션명</h6>
                </div>
                </td>
                <td>
                  <h5>70,000원</h5>
                </td>
                <td>
                  <div class="product_count">
                      <span class="input-number-decrement"> <i class="ti-minus"></i></span>
                      <input class="input-number" type="text" value="1" min="0" max="10">
                      <span class="input-number-increment"> <i class="ti-plus"></i></span>
                  </div>
                </td>
             
                <td>
                  <h5>70,000원</h5>
                </td>
              </tr>
                  <!--2번째 상품 나중에 db 추가하면 지우기 end-->
              
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td>
                  <h5>결제 금액</h5>
                </td>
                <td>
                  <h5>140,000원</h5>
                </td>
              </tr>
            </tbody>
          </table>
          <div class="checkout_btn_inner float-right">
            <a class="btn_1" href="#">쇼핑 하기</a>
            <a class="btn_1 checkout_btn_1" href="#">구매</a>
          </div>
        </div>
      </div>
      </div>
  </section>
  <!--================End Cart Area =================-->
<!-- JS here -->

    <!-- All JS Custom Plugins Link Here here -->
    <script src="${path}/assets/js/vendor/modernizr-3.5.0.min.js"></script>
   
    <!-- Jquery, Popper, Bootstrap -->
    <script src="${path}/assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="${path}/assets/js/popper.min.js"></script>
    <script src="${path}/assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="${path}/assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="${path}/assets/js/owl.carousel.min.js"></script>
    <script src="${path}/assets/js/slick.min.js"></script>

    <!-- One Page, Animated-HeadLin -->
    <script src="${path}/assets/js/wow.min.js"></script>
    <script src="${path}/assets/js/animated.headline.js"></script>
    
    <!-- Scrollup, nice-select, sticky -->
    <script src="${path}/assets/js/jquery.scrollUp.min.js"></script>
    <script src="${path}/assets/js/jquery.nice-select.min.js"></script>
    <script src="${path}/assets/js/jquery.sticky.js"></script>
    <script src="${path}/assets/js/jquery.magnific-popup.js"></script>

    <!-- contact js -->
    <script src="${path}/assets/js/contact.js"></script>
    <script src="${path}/assets/js/jquery.form.js"></script>
    <script src="${path}/assets/js/jquery.validate.min.js"></script>
    <script src="${path}/assets/js/mail-script.js"></script>
    <script src="${path}/assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="${path}/assets/js/plugins.js"></script>
    <script src="${path}/assets/js/main.js"></script>
</body>

</html>