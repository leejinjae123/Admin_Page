<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
	<nav class="sidebar sidebar-offcanvas" id="sidebar">
        <div class="text-center sidebar-brand-wrapper d-flex align-items-center">
          <a class="sidebar-brand brand-logo" href="Controller?type=return"><img src="admin/assets/images/logo.svg" alt="logo" /></a>
          <a class="sidebar-brand brand-logo-mini pl-4 pt-3" href="Controller?type=return"><img src="admin/assets/images/logo-mini.svg" alt="logo" /></a>
        </div>
        <ul class="nav">
          <li class="nav-item nav-profile">
            <a href="#" class="nav-link">
              <div class="nav-profile-image">
                <img src="admin/assets/images/faces/face1.jpg" alt="profile" />
                <span class="login-status online"></span>
                <!--change to offline or busy as needed-->
              </div>
              <div class="nav-profile-text d-flex flex-column pr-3">
                <span class="font-weight-medium mb-2">${sessionScope.svo.u_id }</span><!-- 이부분 admin 로그인 아이디와 연결하며 -->
                <span class="font-weight-normal">관리자</span>
              </div>
            </a>
          </li>
	         <li class="nav-item">
	            <a class="nav-link" href="Controller?type=return">
	              <i class="mdi mdi-home menu-icon"></i>
	              <span class="menu-title">메인메뉴</span>
	            </a>
	         </li>
	          <li class="nav-item">
	            <a class="nav-link" href="Controller?type=list">
	              <i class="mdi mdi mdi-file-image menu-icon"></i>
	              <span class="menu-title">상품관리</span>
	            </a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="Controller?type=set">
	              <i class="mdi mdi-settings menu-icon"></i>
	              <span class="menu-title">계정관리</span>
	            </a>
	          </li>
	      <li class="nav-item sidebar-actions">
      <div class="nav-link">
        <div class="mt-4">	
          <ul class="mt-4 pl-0">
            <li><a href="Controller">Sign Out</a></li>
          </ul>
        </div>
      </div>
    </li>
        </ul>
      </nav>
      <div class="container-fluid page-body-wrapper">
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close mdi mdi-close"></i>
          <p class="settings-heading">SIDEBAR SKINS</p>
          <div class="sidebar-bg-options selected" id="sidebar-default-theme">
            <div class="img-ss rounded-circle bg-light border mr-3"></div> Default
          </div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme">
            <div class="img-ss rounded-circle bg-dark border mr-3"></div> Dark
          </div>
          <p class="settings-heading mt-2">HEADER SKINS</p>
          <div class="color-tiles mx-0 px-4">
            <div class="tiles light"></div>
            <div class="tiles dark"></div>
          </div>
        </div>
        <nav class="navbar col-lg-12 col-12 p-lg-0 fixed-top d-flex flex-row">
          <div class="navbar-menu-wrapper d-flex align-items-stretch justify-content-between">
            <a class="navbar-brand brand-logo-mini align-self-center d-lg-none" href="index.html"><img src="admin/assets/images/logo-mini.svg" alt="logo" /></a>
            <button class="navbar-toggler navbar-toggler align-self-center mr-2" type="button" data-toggle="minimize">
              <i class="mdi mdi-menu"></i>
            </button>
            <ul class="navbar-nav navbar-nav-right ml-lg-auto">
              <li class="nav-item nav-profile dropdown border-0">
                <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown">
                  <img class="nav-profile-img mr-2" alt="" src="admin/assets/images/faces/face1.jpg" />
                  <span class="profile-name">${sessionScope.svo.u_id }</span>
                </a>
                <div class="dropdown-menu navbar-dropdown w-100" aria-labelledby="profileDropdown">
                  <a class="dropdown-item" href="Controller">
                    <i class="mdi mdi-logout mr-2 text-primary"></i> Signout </a>
                </div> 
              </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
              <span class="mdi mdi-menu"></span>
            </button>
          </div>
        </nav>
      