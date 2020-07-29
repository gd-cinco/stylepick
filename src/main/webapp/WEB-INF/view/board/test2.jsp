<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
	
</head>
<body>
	<!-- Data Table area Start-->
    <div class="data-table-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="data-table-list">
                        <div class="basic-tb-hd">
                            <h2>공지사항</h2>
                            <p>설명</p>
                        </div>
                        <div class="table-responsive">
                            <table id="data-table-basic" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>작성자</th>
                                        <th>제목</th>
                                        <th>작성일</th>
                                        <th>조회수</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach begin="1" end="50" var="i">
                                		<tr>
                                        <td>${i}</td>
                                        <td>관리자</td>
                                        <td>공지${i}</td>
                                        <td>2020/07/28</td>
                                        <td>0</td>
                                        <td>-</td>
                                    </tr>
                                	</c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
  
</body>
</html>