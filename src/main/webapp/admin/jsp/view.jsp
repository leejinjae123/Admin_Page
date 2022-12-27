
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Breeze admin</title>
    <link rel="stylesheet" href="admin/assets/vendors/mdi/css/materialdesignicons.min.css" />
    <link rel="stylesheet" href="admin/assets/vendors/flag-icon-css/css/flag-icon.min.css" />
    <link rel="stylesheet" href="admin/assets/vendors/css/vendor.bundle.base.css" />
    <link rel="stylesheet" href="admin/assets/css/style.css" />
    <link rel="shortcut icon" href="admin/jsp/index_login.jsp" />
  </head>
  <body>
  	<div class="container-scroller">
	    <jsp:include page="../include_page/login-side.jsp"/>
	    <jsp:include page="../include_page/main_panel_view.jsp"/>
	 </div>
	    <script src="admin/assets/vendors/js/vendor.bundle.base.js"></script>
	    <script src="admin/assets/js/off-canvas.js"></script>
	    <script src="admin/assets/js/hoverable-collapse.js"></script>
	    <script src="admin/assets/js/misc.js"></script>
  </body>
</html>