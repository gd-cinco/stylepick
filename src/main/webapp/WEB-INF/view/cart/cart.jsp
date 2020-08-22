<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
  <meta charset="utf-8">

  
   
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
            
            <c:set var="tot" value="${0}"/>
            <c:forEach items="${cart.itemSetList}" var="itemSet" varStatus="stat">
              <tr>
                <td>
                  <div class="media">
                    <div class="d-flex" style="width=350px; height:250px;">
                    <img src="../item/img/${itemSet.item.pictureUrl }"  id="img"><br>
                    </div>
                      
                    <div class="media-body" style="inline-block">
                      <h4>${itemSet.item.item_name }</h4>
                    </div>
                </div>
                </td>
                <td>
                <div>
                <h6>${itemSet.item_option}</h6> <!--옵션-->
                </div>
                </td>
                <td>
                  <h5>${itemSet.item.price }원</h5> <!-- 가격 -->
                </td>
                <td>
                 <div>
				${itemSet.quantity}개
                  </div>
                </td>
                
                <td>
                  <h5>
                
                  ${itemSet.quantity * itemSet.item.price }  </h5> 
             </td>
             <td>
             <c:set var="tot" value="${tot +(itemSet.quantity * itemSet.item.price)}" />
               <a href="cartDelete.shop?index=${stat.index }">취소</a>
             </td>
              </tr>
   </c:forEach>
              
              <tr>
                <td></td>
                <td></td>
                <td></td>
              
                <td>
                  <h5>결제 금액</h5>
                </td>
                <td>
                  <h5>${tot }원</h5>
                </td>
                <td></td>
              </tr>
            </tbody>
          </table>
          <div class="checkout_btn_inner float-right">
            <a class="btn_1" href="../item/list.shop">쇼핑 하기</a>
            <a class="btn_1 checkout_btn_1" href="../cart/checkout.shop">주문하기</a>
          </div>
        </div>
      </div>
      </div>
  </section>
  <!--================End Cart Area =================-->
<!-- JS here -->


</body>

</html>