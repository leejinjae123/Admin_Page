<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${cnt eq 0 }">{"msg":"사용가능","color":"#2fb380"}</c:if> 
<c:if test="${cnt ne 0 }">{"msg":"사용불가","color":"#dc3545"}</c:if>
