<%@page import="mybatis.dao.UserDAO"%>
<%@page import="mybatis.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			<div class="page-header flex-wrap">
              <h3 class="mb-0"> ${sessionScope.svo.u_name }님, 안녕하세요!
              </h3>

            </div>