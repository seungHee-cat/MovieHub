<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MovieHub 관리자 페이지</title>
    <link rel="styleSheet" href="./static/css/admin.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
</head>
<body>
    <div class="root">
        <div class="wrap">
            <div class="menu_wrap">
                <div class="icon">
                	<a href="admin_main.do">MovieHub</a>
                </div>
                <div class="menu_inner">
                    <div class="admin_menu">
                    	<div class="movies" onclick="showMoviesTab()">
                            <i class="bi bi-film"></i>영화 목록
                        </div>
                        <div class="users" onclick="showUsersTab()">
                            <i class="bi bi-person-vcard"></i>유저 관리
                        </div>
                        <div class="ratings" onclick="showRatingsTab()">
                            <i class="bi bi-star-half"></i>평점 관리
                        </div>
                        <div class="comments" onclick="showCommentsTab()">
                            <i class="bi bi-clipboard-check-fill"></i>코멘트 관리
                        </div>
                        <div class="replys" onclick="showReplysTab()">
                            <i class="bi bi-wechat"></i>댓글 관리
                        </div>
                    </div>
                </div>
            </div>
            <div class="wrap_right">
                <div class="wrap_right_header">
                    <div class="welcome">
                        관리자님, 환영합니다.
                    </div>
                    <div class="admin_wrap">
                        <div class="admin_login">
                            <div class="admin_name">
                                <i class="bi bi-person-badge-fill"></i>
                                관리자 :
                            </div>
                            &nbsp;
                            <div class="admin_image">admin</div>
                        </div>
                        <div class="admin_logout">
                        	<a href="logout.do">
                        		<div class="logout">Log Out</div>
	                            <div class="logout_icon">
	                                <i class="bi bi-box-arrow-right"></i>
	                            </div>
                        	</a>
                        </div>
                    </div>
                </div>
                <div class="tab_content users_tab">
                	<div class="search_wrap">
                        <form id="usersForm" method="get">
                            <select class="searchCondition" name="searchCondition">
                                <option class="id">아이디</option>
                                <option class="nickname">닉네임</option>
                            </select>
                            <input type="text" class="searchKeyword" name="searchKeyword">
                            <input type="submit" class="searchBtn" value="검색">
                        </form>
                    </div>
                    <div class="wrap_right_inner">
                        <table class="users_wrap">
                            <tr class="users_header">
                                <td class="number">#</td>
                                <td class="users_id">아이디</td>
                                <td class="users_nickname">닉네임</td>
                                <td class="users_email">이메일</td>
                                <td class="comments_number">회원 권한</td>
                                <td class="users_date">가입 날짜</td>
                                <td class="comments_content">계정 삭제</td>
                            </tr>
                            <c:forEach var="user" items="${userList }" varStatus="status">
                            	<tr class="users_data">
	                                <td class="number">${status.index + 1}</td>
	                                <td class="users_id">${user.user_id }</td>
	                                <td class="users_nickname">${user.nickname }</td>
	                                <td class="users_email">${user.email }</td>
	                                <td class="comments_number">${user.auth }</td>
	                                <td class="users_date">
	                                	<fmt:formatDate value="${user.reg_date }" pattern="yyyy.MM.dd." />
	                                </td>
	                                <td class="comments_content">
	                                    <button class="userDeleteBtn" onclick="return deleteUserConfirm('${user.user_id }')">삭제</button>
	                                </td>
                            	</tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="./static/js/admin.js"></script>
</body>
</html>