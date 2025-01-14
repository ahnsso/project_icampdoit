<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.admin.UsersListTO" %>
<%@ page import="com.exam.admin.AdminUsersDAO" %>
<%@ page import="com.exam.login.SignUpTO" %>
<%@page import="java.util.ArrayList"%>

<%
	UsersListTO ulistTO = (UsersListTO)request.getAttribute( "ulistTO" );

	int cpage = (Integer)request.getAttribute( "cpage" );
	
	int recordPerPage = ulistTO.getRecordPerPage();
	int totalPage = ulistTO.getTotalPage();
	int blockPerPage = ulistTO.getBlockPerPage();
	int startBlock = ulistTO.getStartBlock();
	int endBlock = ulistTO.getEndBlock();
	int totalRecord = ulistTO.getTotalRecord();
	
	ArrayList<SignUpTO> lists = ulistTO.getUsersLists();
	
	StringBuilder sbHtml = new StringBuilder();
	
	for( SignUpTO sto : lists ){
		String name = sto.getName();
		String id = sto.getId();
		String email = sto.getEmail();
		String gen = sto.getGen();
		String birth = sto.getBirth();
		String ucode = sto.getUcode();
		
		sbHtml.append( "<tr>" );
		sbHtml.append( "	<td>" );
		sbHtml.append( "  		<div class=\"d-flex px-2 py-1\">");  
		sbHtml.append( "    		<div class=\"d-flex flex-column justify-content-center\">");
		sbHtml.append( "      			<h6 class=\"mb-0 text-sm\">" + name + "</h6>"); 
		sbHtml.append( "    		</div>");
		sbHtml.append( "  		</div>");
		sbHtml.append( "	</td>");
		sbHtml.append( "	<td>");              
		sbHtml.append( "  		<p class=\"text-xs font-weight-bold mb-0\">" + id + "</p>");
		sbHtml.append( "	</td>");
		sbHtml.append( "	<td>");
		sbHtml.append( "  		<p class=\"text-xs font-weight-bold mb-0\">" + email + "</p>");                 
		sbHtml.append( "	</td>");
		sbHtml.append( "	<td class=\"align-middle text-center text-sm\">");
		sbHtml.append( "		<span>" + birth + "</span>");
		sbHtml.append( "	</td>");
		sbHtml.append( "	<td class=\"align-middle text-center\">");
		sbHtml.append( "  		<span class=\"text-secondary text-xs font-weight-bold\">" + gen + "</span>");
		sbHtml.append( "	</td>");
		sbHtml.append( "	<td class=\"align-middle\">");
		sbHtml.append( "  		<a href='./admin_users_view.do?cpage=" + cpage + "&ucode=" + ucode + "' class=\"text-secondary font-weight-bold text-xs\" data-toggle=\"tooltip\" data-original-title=\"Edit user\">");
		sbHtml.append( "    		Edit");
		sbHtml.append( "  		</a>");
		sbHtml.append( "	</td>");
		sbHtml.append( "</tr>");
	}
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="./resources/bootstrap-5/html/admin/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./resources/bootstrap-5/html/img/logo2.svg">
  <title>I Camp Do It Administrator</title>
   <!-- Font Awesome 이거 추가함 -->
  <script src="https://kit.fontawesome.com/5251502df3.js" crossorigin="anonymous"></script> 
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->
  <link href="./resources/bootstrap-5/html/admin/css/nucleo-icons.css" rel="stylesheet" />
  <link href="./resources/bootstrap-5/html/admin/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
  <link id="pagestyle" href="./resources/bootstrap-5/html/admin/css/material-dashboard.css?v=3.0.4" rel="stylesheet" />
</head>

<body class="g-sidenav-show  bg-gray-200">
	<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 bg-gradient-dark" id="sidenav-main">
		<div class="sidenav-header" style="text-align: center">
			<i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i> 
			<a class="navbar-brand m-0" href="./admin.do" target="_blank"> 
			  <span class="ms-1 font-weight-bold text-white">I CAMP DO IT<br />administer </span>
			</a>
		</div>
		<hr class="horizontal light mt-0 mb-2">
		 <div class="collapse navbar-collapse  w-auto" id="sidenav-collapse-main">
		  <ul class="navbar-nav">		  
	    	<li class="nav-item">
 				<a class="nav-link text-white " href="./admin.do">   
     				<div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
      				 <i class="material-icons opacity-10">dashboard</i>
     				</div>   
				<span class="nav-link-text ms-1">관리자 홈</span>
			  </a>
			</li>						
			<li class="nav-item">
			  <a class="nav-link text-white " href="./admin_users.do">			    
			      <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			        <i class="material-icons opacity-10">person</i>
			      </div>			    
			    <span class="nav-link-text ms-1">회원 관리</span>
			  </a>
			</li>			  
			<li class="nav-item">
			  <a class="nav-link text-white " href="./admin_board.do">			    
			      <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			        <i class="material-icons opacity-10">table_view</i>
			      </div>			    
			    <span class="nav-link-text ms-1">게시판 관리</span>
			  </a>
			</li>
			<li class="nav-item">
			  <a class="nav-link text-white " href="./home.do">			    
			      <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			        <i class="material-icons opacity-10">assignment</i>
			      </div>			    
			    <span class="nav-link-text ms-1">사용자 페이지</span>
			  </a>
			</li>			  			
			<li class="nav-item">
			  <a class="nav-link text-white " href="./logout.do">			    
			      <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			        <i class="material-icons opacity-10">logout</i>
			      </div>			    
			    <span class="nav-link-text ms-1" >Log out</span>
			  </a>
			</li>    
		  </ul>
		 </div>		
	</aside>

  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            
          </ol>
          <h6 class="font-weight-bolder mb-0">회원 관리</h6>
        </nav>
        
      </div>
    </nav>
    <!-- End Navbar -->
    <!-- 회원 테이블 -->
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class="bg-gradient-secondary shadow-primary border-radius-lg pt-4 pb-3">
                <h6 class="text-white text-capitalize ps-3">회원 목록</h6>
              </div>
            </div>
            <div class="card-body px-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">NAME</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"> ID</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">EMAIL</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">BIRTH</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">GENDER</th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                  	<!--  
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">  
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">홍길동</h6> 
                          </div>
                        </div>
                      </td>
                      <td>                 
                        <p class="text-xs font-weight-bold mb-0">TestID</p>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">TestMail@TEST.COM</p>                 
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span>1996-04-02</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold">남</span>
                      </td>
                      <td class="align-middle">
                        <a href="./admin_users_view.do" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                          Edit
                        </a>
                      </td>
                    </tr>
                    -->
                    <%=sbHtml.toString() %>
                  </tbody>
                </table>
              </div>
            </div>
 
          </div>
          
          <!-- 페이징 버튼 -->
          <div class="pagenu">
          <ul class="pagination pagination-info">

<%			
	//페이지 하단의 << 버튼
	if ( startBlock == 1 ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'><i class='fa fa-thin fa-angles-left'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='admin_users.do?cpage="+ (startBlock - blockPerPage) + "'><i class='fa fa-thin fa-angles-left'></i></a></li>");
	}
	//out.println(" &nbsp; ");
	//페이지 하단의 < 버튼 => (cpage-1) 한페이지 앞으로 이동
	if ( cpage == 1 ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'> <i class='fa fa-angle-left'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='admin_users.do?cpage="+ (cpage-1) + "'><i class='fa fa-angle-left'></i></a></li> ");
	}
	//out.println(" &nbsp;&nbsp; ");
	//현재 페이지
	for ( int i=startBlock; i<=endBlock; i++ ) {
		if ( cpage == i ) { 
			out.println(" <li class='page-item active'><a class='page-link' href='#'>" + i + "</a></li> ");
		} else {
			out.println(" <li class='page-item'><a class='page-link' href='admin_users.do?cpage=" + i + "'>" + i + "</a></li> ");
		}
	}
	//out.println(" &nbsp;&nbsp; ");
	//페이지 하단의 > 버튼
	if ( cpage == totalPage ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'><i class='fa fa-angle-right'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='admin_users.do?cpage="+ (cpage+1) + "'><i class='fa fa-angle-right'></i></a></li> ");
	}
	//out.println(" &nbsp; ");
	//페이지 하단의 >> 버튼
	if ( endBlock == totalPage ) {
		out.println(" <li class='page-item'><a class='page-link' href='#'><i class='fa fa-thin fa-angles-right'></i></a></li> ");
	} else {
		out.println(" <li class='page-item'><a class='page-link' href='admin_users.do?cpage="+ (startBlock + blockPerPage) + "'><i class='fa fa-thin fa-angles-right'></i></a></li> ");
	}
	//out.println(" &nbsp; ");

%>	
		   
          </ul>
         </div>           
        </div>
      </div>   
  </main>
  
  <!--   Core JS Files   -->
  <script src="./resources/bootstrap-5/html/admin/js/core/popper.min.js"></script>
  <script src="./resources/bootstrap-5/html/admin/js/core/bootstrap.min.js"></script>
  <script src="./resources/bootstrap-5/html/admin/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="./resources/bootstrap-5/html/admin/js/plugins/smooth-scrollbar.min.js"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- JavaScript files-->  
  <script src="./resources/bootstrap-5/html/vendor/jquery/jquery.min.js"></script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="./resources/bootstrap-5/html/admin/js/material-dashboard.min.js?v=3.0.4"></script>
</body>

</html>