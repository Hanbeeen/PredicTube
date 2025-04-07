<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
   // 로그인한 유저의 이름(닉네임)과 이메일을 세션에서 불러옴
   String userName = (String) session.getAttribute("name");
   String userEmail = (String) session.getAttribute("email");
   
    String url = "jdbc:mysql://localhost:3306/AIdear?useUnicode=true&characterEncoding=UTF-8"; // 여기서 "mydatabase"는 사용하려는 데이터베이스 이름입니다.
    String user = "root"; // 데이터베이스 사용자 이름
    String password = "1234"; // 데이터베이스 비밀번호
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String sql = "SELECT * FROM service where email = ? order by serviceDate desc";
        conn = DriverManager.getConnection(url, user, password);
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,userEmail);
        rs = pstmt.executeQuery();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>AIdear - AI로 예측하는 내 영상의 조회수</title>
<meta content="" name="description">
<meta content="" name="keywords">
<meta name="google-signin-client_id" content="564724173177-dh40pro6lms56et4b672gv2ua84dfooq.apps.googleusercontent.com">
<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
<!-- =======================================================
  * Template Name: Bethany
  * Updated: Aug 30 2023 with Bootstrap v5.3.1
  * Template URL: https://bootstrapmade.com/bethany-free-onepage-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
   <script src="https://accounts.google.com/gsi/client" async defer></script>
   <div id="g_id_onload"
      data-client_id="564724173177-dh40pro6lms56et4b672gv2ua84dfooq.apps.googleusercontent.com"
      data-context="signin" data-ux_mode="popup"
      data-login_uri="http://localhost:8080" data-itp_support="true">
   </div>
   <!-- ======= Header ======= -->
   <header id="header" class="fixed-top d-flex align-items-center">
      <div class="container">
         <div
            class="header-container d-flex align-items-center justify-content-between">
            <div class="logo">
               <h1 class="text-light">
                  <a href="index.jsp"><span>PredicTube</span></a>
               </h1>
               <!-- Uncomment below if you prefer to use an image logo -->
               <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
            </div>

            <nav id="navbar" class="navbar">
               <ul>
                  <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
                  <li><a class="nav-link scrollto" href="#visual">Visual</a></li>
                  <li><a class="nav-link scrollto" href="#keyword">Keyword</a></li>
                  <li><a class="nav-link scrollto" href="#about">About</a></li>
                  <li><a class="nav-link scrollto" href="#services">Services</a></li>
                  <li><a class="nav-link scrollto" href="#testimonials">How to</a></li>
                  <li><a class="nav-link scrollto " href="#portfolio">Dev Process</a></li>
                  <li><a class="nav-link scrollto" href="#team">Team</a></li>
                  <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
                  <li id="log_user">
                    <%
    					if (userName == null) { %>
 						<a href="#" onclick="openGoogleLoginPopup();">
 							<img src="https://developers.google.com/identity/images/btn_google_signin_dark_normal_web.png" alt="Google 로그인">
                  		</a>
                  	<% } else { %>
                  			<div class="user-name"><%=userName%></div>
                  			<!-- 로그아웃 버튼 -->
                  			<a class="logout-btn" href="<%=request.getContextPath()%>/GoogleLogoutServlet">로그아웃</a>
                    <% } %>
<script>
   function openGoogleLoginPopup() {
       var googleLoginURL = "<%=generateGoogleLoginURL()%>";
       var popupWidth = 500;
       var popupHeight = 600;
       var left = (window.innerWidth - popupWidth) / 2;
       var top = (window.innerHeight - popupHeight) / 2;

       // 팝업 창을 중앙에 위치시키고 크기를 조정
       var popup = window.open(googleLoginURL, "_blank", "width=" + popupWidth + ", height=" + popupHeight + ", left=" + left + ", top=" + top);

       // 팝업이 차단되었을 경우 처리
        if (!popup || popup.closed || typeof popup.closed == "undefined") {
            alert("팝업 차단이 활성화되어 있습니다. 팝업 창을 허용해 주세요.");
        } 
       
     // 팝업 창에서 리디렉션되는 URL을 확인하고 팝업을 닫음
        var checkRedirectionInterval = setInterval(function () {
            if (popup.closed) {
                clearInterval(checkRedirectionInterval);
                // 메인 페이지를 새로 고침
                window.location.reload();
            } else {
                // 팝업 창이 닫히지 않았으므로 현재 팝업의 URL을 확인
                try {
                    var popupUrl = popup.location.href;
                    // 구글 로그인 성공 후 리디렉션되는 URL인지 확인
                    if (popupUrl.indexOf("http://localhost:8080/GoogleLogin/GoogleLoginServlet?code=") === 0) {
                        // 구글 로그인 성공 후 리디렉션되는 URL이면 팝업을 닫음
                        popup.close();
                        clearInterval(checkRedirectionInterval);
                     // 메인 페이지를 새로 고침
                        window.location.reload();
                    }
                } catch (error) {
                    // 팝업의 URL을 읽을 수 없는 경우 예외 처리
                }
            }
        }, 1000);
     
   }

</script>
<%!// Google 로그인 URL 생성 함수
   private String generateGoogleLoginURL() {
      String clientId = "224149760852-jmujm1mbr46c9bo4l3748nf074b0bio1.apps.googleusercontent.com"; // 여기에 클라이언트 ID를 설정합니다.
      String redirectUri = "http://localhost:8080/GoogleLogin/GoogleLoginServlet"; // 위에서 설정한 리디렉션 URI와 일치해야 합니다.
      String scope = "email profile openid"; // 필요한 권한 범위를 설정합니다.

      // Google OAuth 2.0 로그인 URL 생성
      String googleLoginURL = "https://accounts.google.com/o/oauth2/auth" + "?client_id=" + clientId
            + "&redirect_uri=" + redirectUri + "&response_type=code" + "&scope=" + scope + "&access_type=offline";

      return googleLoginURL;
   } %>
                  </li>
               </ul>
            </nav>
            <!-- .navbar -->

         </div>
         <!-- End Header Container -->
      </div>
   </header>
   <!-- End Header -->
   <!-- ======= Hero Section ======= -->
   <section id="hero" class="d-flex align-items-center" style="height: 100vh;">
      <div class="container text-center position-relative" id="div1" data-aos="fade-in" data-aos-delay="20" style="margin-top: -230px;">
         <div style="margin-bottom: 30px;">
            <span style="font-size: 80px; color: white;"> PredicTube </span>
         </div>
         <h1>AI 기반 유튜브 영상 성과 예측 웹서비스</h1>
         <div style="margin-bottom: 80px;">
            <span style="font-size: 20px; color: #BFBFBF; font-weight: 800;">
               제목 및 썸네일 텍스트 특성과 사용자 정보 기반 유튜브 영상 성과 예측 AI </span>
         </div>
         <!-- <a href="#about" class="btn-get-started scrollto">시작하기</a> -->
         <button onclick="toggleDisable()" id="btnToggle"
            class="btn-get-started scrollto">시작하기</button>
      </div>
      <div class="disable container text-center position-relative align-items-center justify-content-space-around" id="div2">
         <form action="/GoogleLogin/ServiceServlet" id="div2-form" enctype="multipart/form-data" method="post" target="hidden-iframe" onsubmit="submitForm(event)">
            <div id="input_container">
               <div class="input_box">
               	   <label style="width: 125px;">카테고리</label>
                   <select id="categorySelect" name="category" style="width: 321px; height: 50px; border: 2px solid #009970; border-radius: 20px; padding-left: 20px; margin-bottom: 8px;" required="required">
                     <option value="0">선택 안 함</option>
                     <option value="1">영화 &amp; 애니메이션</option>
                     <option value="2">자동차</option>
                     <option value="10">음악</option>
                     <option value="15">동물(펫 포함)</option>
                     <option value="17">스포츠</option>
                     <option value="19">여행 &amp; 이벤트</option>
                     <option value="20">게임</option>
                     <option value="22">사람 &amp; 블로그</option>
                     <option value="23">코미디</option>
                     <option value="24">엔터테인먼트</option>
                     <option value="25">뉴스 &amp; 정치</option>
                     <option value="26">노하우</option>
                     <option value="27">교육</option>
                     <option value="28">과학 &amp; 기술</option>
                     <option value="29">비상업적</option>
                  </select>
               </div>
               <div style="width: 500px; height: 40px; display: flex; justify-content: flex-start;">
               		<div style="margin-left: 48px;"><p style="color: #009970; font-size: 14px;">[추천 키워드]</p></div>
               		<div id="keyword_box" style="margin-left: 64px; font-size: 14px; color: #009970;"></div>
               </div>
               <div class="input_box">
                  <label style="width: 125px;">제목</label>
                  <input type="text" name="title" style="width: 321px; height: 50px; border: 2px solid #009970; border-radius: 20px; padding-left: 20px; margin-bottom: 8px;" required="required" placeholder="한글 키워드를 포함해 입력" maxlength="40">
               </div>
               <div style="width: 500px; height: 40px;"></div>
               <div class="input_box">
                  <label style="width: 125px;">채널 아이디</label>
                  <input type="text" name="channelID" style="width: 321px; height: 50px; border: 2px solid #009970; border-radius: 20px; padding-left: 20px; margin-bottom: 8px;" required="required" placeholder="구독자수 확인을 위해 채널 아이디를 입력">
               </div>
               <div id="channelID_text"><span>구독자수는 조회수 예측에 사용됩니다</span></div>
               <div class="input_box">
                  <div style="display: flex; align-items: baseline;">
                     <label style="width: 125px;">썸네일</label>
                     <input type="file" required="required" id="imageInput" onchange="showThumbnail(this)" name="file" style="width: 321px; height: 50px;">
                  </div>
               </div>
               <div id="thumbnail_container">
               	<div class="thumbnail_box">
               		<p id="thumbnail_text" style="display: block;">한글 텍스트가 들어간<br>썸네일 업로드</p>
               		<img id="thumbnail" style="max-height: 190px; display: block;">
	            </div>
               	<button type="submit" id="start-btn">시작!</button>
               </div>
            </div>
            <div id="history_container">
               <% if (userName == null) { %>
            	<div id="pleaseLogin">로그인 시 예측 히스토리가 표시됩니다</div>
           	   <% } else { %>
               <div id="table_line">
               <!-- 이 곳에 DB부터 불러온 데이터들 나열 (where email = ~~) -->
                  <table id="dataTable">
                     <thead>
                        <tr>
                           <th rowspan="2">No.</th>
                           <th rowspan="2">Title</th>
                           <th rowspan="2">File</th>
                           <th rowspan="2">Category</th>                          
                           <th colspan="4">Result</th>
                        </tr>
                        <tr>
                        	<th>낮음</th>
                        	<th>보통</th>
                        	<th>높음</th>
                        	<th>최고</th>
                        </tr>
                     </thead>
                     <tbody>
                        <%
        					while (rs.next()) {
        						int id = rs.getInt("id");
            					String title = rs.getString("title");
            					String filename = rs.getString("filename");
            					String category = rs.getString("category");
            					String result = rs.getString("result");

					            // 이미지 파일의 경로
            					String imagePath = "./Images/" + filename;
        					%>
        					<tr>
            					<td><%= id %></td>
            					<td class="limited-text"><%= title %></td>
            					<td class="thumbnail">
            						<%=filename %>
            					    <span>
            							<img src="<%= imagePath %>" alt="이미지" style="display: none;" />
            						</span>
            					</td>
            					<td class="cate_text"><%
                           String cate = "";
                           switch(rs.getString("category")){
                           	  case "0":
                           		  cate = "선택 안 함";
                           		  break;
                              case "1":
                                 cate = "영화 & 애니메이션";
                                 break;
                              case "2":
                                 cate = "자동차";
                                 break;
                              case "10":
                                 cate = "음악";
                                 break;
                              case "15":
                                 cate = "동물(펫포함)";
                                 break;
                              case "17":
                                 cate = "스포츠";
                                 break;
                              case "19":
                                 cate = "여행 & 이벤트";
                                 break;
                              case "20":
                                 cate = "게임";
                                 break;
                              case "22":
                                 cate = "사람 & 블로그";
                                 break;
                              case "23":
                                 cate = "코미디";
                                 break;
                              case "24":
                                 cate = "엔터테인먼트";
                                 break;
                              case "25":
                                 cate = "뉴스";
                                 break;
                              case "26":
                                 cate = "노하우";
                                 break;
                              case "27":
                                 cate = "교육";
                                 break;
                              case "28":
                                 cate = "과학 & 기술";
                                 break;
                              case "29":
                                 cate = "비상업적";
                                 break;
                              default:
                                 cate = "Null";                                 
                                 break;
                           }
                           %>
                           <%=cate %></td>
                           <%String[] results = result.split(",");
                           	 String result1 = String.format("%1.0f%%",Double.parseDouble(results[0]) * 100);
                           	 String result2 = String.format("%1.0f%%",Double.parseDouble(results[1]) * 100);
                           	 String result3 = String.format("%1.0f%%",Double.parseDouble(results[2]) * 100);
                           	 String result4 = String.format("%1.0f%%",Double.parseDouble(results[3]) * 100);
                           	 %>
            					<td id="result1"><%= result1 %></td>
            					<td id="result2"><%= result2 %></td>
            					<td id="result3"><%= result3 %></td>
            					<td id="result4"><%= result4 %></td>
        					</tr>
        					<%
        						}
        					%>
        			
        			<%
                     try {
                     if (rs != null)
                        rs.close();
                     if (pstmt != null)
                        pstmt.close();
                     if (conn != null)
                        conn.close();
                  		} catch (Exception e) {
		                     e.printStackTrace();
        	          }
                  	%>
                     </tbody>
                  </table>
               </div>
               <% } %>
                <div id="predict_container">
                	<div class="predict_box">
                		<div><p id="predict1"></p></div>
                		<div><p id="predict2">시작 버튼을 누르면<br>이 곳에서 조회수를 예측합니다</p><span id="loading-message"></span></div>
                		<div><p id="predict3"></p></div>
                		<div><p id="predict4"></p></div>
                	</div>
                	<% if (userName != null) { %>
                	<div class="login_history"><p>모바일 환경에서는 히스토리가 출력되지 않습니다</p></div>
                	<% } else { %>
                	<div class="login_history"><p>로그인 시 예측 히스토리를 저장할 수 있습니다</p></div>
                	<% } %>
                	<div class="history_image">
                		<p id="history_text">각 히스토리의<br>File에 마우스 오버시<br>미리보기 활성화</p>
                		<div id="imagePopup" style="display: none;">
    		   				<img src="" alt="팝업 이미지" id="popupImage">
			    		</div>
                	</div>
			    </div>
               
            </div>
            <input type="hidden" value="<%=userName%>" name="username">
            <input type="hidden" id="predictedValueInput" name="predicted_value">
            <input type="hidden" id="subCountInput" name="sub_count">   
            
         </form>
         <iframe name="hidden-iframe" style="display:none;"></iframe>
         <!-- JavaScript 함수 수정 -->
         
<script>
	function reloadTable(){
		$('#dataTable').load(window.location.href + ' #dataTable', function() {
			  initializeImagePopup(); // 테이블 리로드 후에 이미지 팝업 초기화
			  maxResultRed();
			});
	   }
	

    function submitForm(event) {
        event.preventDefault();  // 기본 form 제출 동작을 막습니다.
        document.getElementById("predict1").style.display = "none";
        document.getElementById("predict2").style.display = "none";
        document.getElementById("predict3").style.display = "none";
        document.getElementById("predict4").style.display = "none";
        document.getElementById("loading-message").innerText = "예측하는 중";
        let dots = 0;
        let loadingInterval = setInterval(function() {
            if (dots < 3) {
                document.getElementById("loading-message").innerText += ".";
                dots++;
            } else {
                document.getElementById("loading-message").innerText = "예측하는 중";
                dots = 0;
            }
        }, 500); // 0.5초마다 점을 추가하고 초기화합니다.

        // FormData 객체 생성
        let formData = new FormData(document.getElementById("div2-form"));

        // Flask 서버에 POST 요청 보내기
        fetch('http://127.0.0.1:5000/predict', {
            method: 'POST',
            body: formData
        })
        .then(response => response.text())
        .then(data => {
    	// 결과 값을 화면에 출력
    	let numbers = data.split(',');
    	console.log(numbers[0]);
    	console.log(numbers[1]);
    	console.log(numbers[2]);
    	
    	document.getElementById("predict1").style.display = "initial";
    	document.getElementById("predict3").style.display = "initial";
    	document.getElementById("predict4").style.display = "initial";
    	
		if(numbers[2] == 1) {
			document.getElementById("predict1").style.display = "none";
			document.getElementById("predict3").style.display = "none";
			document.getElementById("predict4").style.display = "none";
			document.getElementById("predict2").style.display = "initial";
			document.getElementById("predict2").style.color = "";
			document.getElementById("predict2").style.fontWeight = "";
			document.getElementById("predict2").style.fontSize = "";
			document.getElementById("loading-message").innerText = "";
			clearInterval(loadingInterval);
    		return document.querySelector("#predict2").innerText = "제목과 썸네일에서\n한글 텍스트가 인식되지 않았습니다";
    	}
		if(numbers[2] == 2) {
			document.getElementById("predict1").style.display = "none";
			document.getElementById("predict3").style.display = "none";
			document.getElementById("predict4").style.display = "none";
			document.getElementById("predict2").style.display = "initial";
			document.getElementById("predict2").style.color = "";
			document.getElementById("predict2").style.fontWeight = "";
			document.getElementById("predict2").style.fontSize = "";
			document.getElementById("loading-message").innerText = "";
			clearInterval(loadingInterval);
    		return document.querySelector("#predict2").innerText = "제목에서 한글 텍스트가\n인식되지 않았습니다";
    	}
		if(numbers[2] == 3) {
			document.getElementById("predict1").style.display = "none";
			document.getElementById("predict3").style.display = "none";
			document.getElementById("predict4").style.display = "none";
			document.getElementById("predict2").style.display = "initial";
			document.getElementById("predict2").style.color = "";
			document.getElementById("predict2").style.fontWeight = "";
			document.getElementById("predict2").style.fontSize = "";
			document.getElementById("loading-message").innerText = "";
			clearInterval(loadingInterval);
    		return document.querySelector("#predict2").innerText = "썸네일에서 한글 텍스트가\n인식되지 않았습니다"; 
    	}

    	let resultdata = numbers[0].match(/\d+\.\d+/g);
    	let resultLabels = ["낮음", "보통", "높음", "최고"];
    	let pre_views = {"0":["[0 ~ 5,000]", "[5,000 ~ 31,000]", "[31,000 ~ 210,000]", "[210,000 ~ ]"],
    					 "1":["0 ~ 35,000", "[35,000 ~ 260,000]", "[260,000 ~ 870,000]", "[870,000 ~ ]"],
    					 "2":["[0 ~ 8,600]", "[8,600 ~ 42,000]", "[42,000 ~ 180,000]", "[18,000 ~ ]"],
    					 "10":["[0 ~ 4,700]", "[4,700 ~ 32,000]", "[32,000 ~ 290,000]", "[290,000 ~ ]"],
    					 "15":["[0 ~ 9,800]", "[9,800 ~ 78,000]", "[78,000 ~ 400,000]", "[400,000 ~ ]"],
    					 "17":["[0 ~ 7,400]", "[7,400 ~ 38,000]", "[38,000 ~ 220,000]", "[220,000 ~ ]"],
    					 "19":["[0 ~ 5,100]", "[5,100 ~ 21,000]", "[21,000 ~ 170,000]", "[170,000 ~ ]"],
    					 "20":["[0 ~ 12,000]", "[12,000 ~ 44,000]", "[44,000 ~ 160,000]", "[160,000 ~ ]"],
    					 "22":["[0 ~ 3,200]", "[3,200 ~ 11,000]", "[11,000 ~ 70,000]", "[70,000 ~ ]"],
    					 "23":["[0 ~ 100,000]", "[100,000 ~ 430,000]", "[430,000 ~ 1,100,000]", "[1,100,000 ~ ]"],
    					 "24":["[0 ~ 14,000]", "[14,000 ~ 110,000]", "[110,000 ~ 500,000]", "[500,000 ~ ]"],
    					 "25":["[0 ~ 8,500]", "[8,500 ~ 60,000]", "[60,000 ~ 280,000]", "[280,000 ~ ]"],
    					 "26":["[0 ~ 4,200]", "[4,200 ~ 16,000]", "[16,000 ~ 98,000]", "[98,000 ~ ]"],
    					 "27":["[0 ~ 3,200]", "[3,200 ~ 11,000]", "[11,000 ~ 78,000]", "[78,000 ~ ]"],
    					 "28":["[0 ~ 8,400]", "[8,400 ~ 63,000]", "[63,000 ~ 350,000]", "[350,000 ~ ]"],
    					 "29":["[0 ~ 2,400]", "[2,400 ~ 7,700]", "[7,700 ~ 42,000]", "[42,000 ~ ]"]};
    	const categorySelect = document.getElementById("categorySelect");
    	const selectedValue = categorySelect.value;
    	const selectedPreViews = pre_views[selectedValue];
    	
    	let violence_point = parseInt(numbers[3]) + 1;
    	let racy_point = parseInt(numbers[4]) + 1;
    
    	document.getElementById("predictedValueInput").value = resultdata;
    	document.getElementById("subCountInput").value = numbers[1];
    
    	let resultIndex = 0;
    	let bestResult = parseFloat(resultdata[0]).toFixed(2);
    
 		// 가장 큰 값을 찾기
    	for (let i = 1; i < resultdata.length; i++) {
        	let currentValue = parseFloat(resultdata[i]).toFixed(2);
        	if (currentValue > bestResult) {
            bestResult = currentValue;
            resultIndex = i;
        }
    }
    
    	document.querySelector("#predict1").innerText = "예측 조회수";
    
 		// resultLabels[resultIndex]에 해당하는 요소를 가져옵니다.
    	var targetElement = document.querySelector("#predict2");
    	document.getElementById("predict2").style.display = "initial";

    	// 빨간색과 두꺼운 스타일을 적용합니다.
    	targetElement.style.color = "red";
    	targetElement.style.fontWeight = "bold";
    	targetElement.style.fontSize = "50px";

    	// 텍스트를 설정합니다.
    	targetElement.innerText = resultLabels[resultIndex];
    
    	document.querySelector("#predict3").innerText = selectedPreViews[resultIndex] + "\n 정확도 : " + (bestResult * 100).toFixed(0) + "%";
    	document.querySelector("#predict4").innerText = "폭력성 : " + violence_point + "　선정성 : " + racy_point + "　(총 5단계)";
        // 폼 요소 가져오기
        var form = document.getElementById("div2-form");
          
        // 폼 제출
        form.submit();
        setTimeout(() => {
         reloadTable();
        }, 1000);
        
        document.getElementById("loading-message").innerText = "";
        clearInterval(loadingInterval);
        
       })
        .catch(error => {
        	document.getElementById("loading-message").innerText = "";
        	clearInterval(loadingInterval);
            console.error('Error:', error);
        });
    }
    
    /* JavaScript (jQuery 사용) */
    function initializeImagePopup() {
   $('.thumbnail').hover(function() {
     var imagePath = $(this).find('img').attr('src');
     $('#history_text').hide();
     $('#popupImage').attr('src', imagePath);
     $('#imagePopup').show();
   }, function() {
     $('#imagePopup').hide();
     $('#history_text').show();
   });

   $('#imagePopup').click(function() {
     $(this).hide();
   });
 }
    
 // 페이지 로드 시 이미지 팝업 초기화
    $(document).ready(function() {
    	
    	const selectedValue = $("#categorySelect").val();
        $("#keyword_box").text(keyword_list[selectedValue]);
    	
        initializeImagePopup();
        maxResultRed();
    });
    
    
    document.addEventListener("DOMContentLoaded", function() {
        var rows = document.querySelectorAll("#dataTable tbody tr");
        rows.forEach(function(row) {
            var textCell = row.querySelector("td.limited-text");
            var lineHeight = parseInt(window.getComputedStyle(textCell).lineHeight);
            var maxHeight = 2 * lineHeight; // 두 줄까지의 높이
            var maxTextWidth = 200; // 최대 텍스트 너비 (200px로 수정 가능)

            // 텍스트의 줄 수 계산
            var text = textCell.textContent;
            var textLines = text.split('\n');
            var lineCount = textLines.length;

            // 텍스트 줄 바꿈 활성화
            textCell.style.whiteSpace = "normal";

            // 행의 높이 설정 (두 줄 높이로 고정)
            var newHeight = 2 * lineHeight;
            textCell.style.height = "49px";
            
            // 텍스트가 너무 길면 줄여서 표시
            if (textCell.scrollWidth > maxTextWidth) {
            	textCell.style.width = maxTextWidth + "px";
            	textCell.style.textOverflow = "ellipsis";
            	textCell.style.overflow = "hidden";
            }
        });
    });

     function maxResultRed() {
    	 var tableRows = document.querySelectorAll("#dataTable tbody tr");

    	 tableRows.forEach(function(row) {
    	     var resultCells = row.querySelectorAll("td[id^='result']"); // 'result'로 시작하는 ID를 가진 셀 선택
    	     var results_list = [];

    	     // 결과 셀의 값들을 배열에 저장
    	     resultCells.forEach(function(cell) {
    	    	 results_list.push(parseFloat(cell.textContent));
    	     });

    	     // 가장 큰 값을 찾기 위한 초기화
    	     var maxResult = results_list[0];
    	     var maxIndex = 0;

    	     // 대소 비교를 통해 가장 큰 값을 찾습니다.
    	     for (var i = 1; i < results_list.length; i++) {
    	         if (!isNaN(results_list[i])) {
    	             if (results_list[i] > maxResult) {
    	                 maxResult = results_list[i];
    	                 maxIndex = i;
    	             }
    	         }
    	     }

    	     // 가장 큰 값을 가진 셀에 스타일 적용
    	     resultCells[maxIndex].style.backgroundColor = '#009970';
    	     resultCells[maxIndex].style.color = '#fff';
    	     resultCells[maxIndex].style.border = '1px solid #fff';
    	 });
    }
    
</script>

         <button onclick="toggleDisable()" id="back-btn">메인 화면</button>
      </div>
      <script>
    function toggleDisable() {
       const div1 = document.querySelector('#div1');
       const div2 = document.querySelector('#div2');

       if (div1.style.opacity !== "0") { // div1이 페이드인 상태인 경우
           div1.style.opacity = "0"; // div1 페이드아웃

           setTimeout(() => {
               div1.classList.add('disable');
               div2.classList.remove('disable');
               div2.style.opacity = "0"; // div2 초기 상태를 페이드 아웃 상태로 설정

               setTimeout(() => {
                   div2.style.opacity = "1"; // div2 페이드인
               }, 50);  // 짧은 지연을 주어 div2가 바로 나타나지 않도록 함
           }, 500); // 애니메이션의 지속 시간
       } else { // div2가 페이드인 상태인 경우
           div2.style.opacity = "0"; // div2 페이드아웃

           setTimeout(() => {
               div2.classList.add('disable');
               div1.classList.remove('disable');
               div1.style.opacity = "0"; // div1 초기 상태를 페이드 아웃 상태로 설정

               setTimeout(() => {
                   div1.style.opacity = "1"; // div1 페이드인
               }, 50);  // 짧은 지연을 주어 div1이 바로 나타나지 않도록 함
           }, 500); // 애니메이션의 지속 시간
       }
   }
  	
    function showThumbnail(input) {
     
       // 선택한 파일이 있는지와 그 파일이 이미지 파일인지 확인
    	if (input.files && input.files[0]) {
           let reader = new FileReader();

           reader.onload = function(e) {
               // 이미지 태그를 가져와서 src에 파일의 내용을 설정
               let thumbnail = document.getElementById('thumbnail');
               let thumbnail_text = document.getElementById('thumbnail_text');
               thumbnail.src = e.target.result;

               // 이미지 태그를 보이게 설정
               thumbnail_text.style.display = 'none';
               thumbnail.style.display = 'block';
           };

           reader.readAsDataURL(input.files[0]);
       }
   }
    
    // 추천 키워드 리스트
    let keyword_list = ["로그, 브이, 리뷰, 여행, 방송", "영화, 결말, 포함, 영화리뷰, 애니",
    					"리뷰, 스포츠, 자동차, 승기, 신형", "음악, 커버, 노래, 모음, 팝송",
    					"고양이, 강아지, 동물, 아기, 반려견", "선수, 운동, 루틴, 낚시, 스포츠",
    					"여행, 맛집, 캠핑, 추천, 세계", "게임, 디아블로, 피파, 던파, 아크",
    					"로그, 브이, 다이어트, 여행, 맛집", "방송, 가족, 게임, 크큭, 티비",
    					"방송, 예능, 라임, 모음, 가족", "뉴스, 한국, 김정은, 문재인, 이유",
    					"패션, 리뷰, 추천, 방법, 다이어트", "미술, 역사, 시험, 방법, 과학",
    					"과학, 기술, 리뷰, 사이언스, 방법", "목사, 명상, 스님, 교회, 브라이언"];
    
 	// select 요소 가져오기
    const categorySelect = document.getElementById("categorySelect");

    // select 요소의 값이 변경될 때 실행될 함수 정의
    categorySelect.addEventListener("change", function() {
        // 선택된 옵션 값 가져오기
        const selectedValue = categorySelect.value;

        // switch 문으로 선택된 값 처리
        switch (selectedValue) {
        	case "0":
        		document.getElementById("keyword_box").innerText = keyword_list[0];
        		break;
        	case "1":
        		document.getElementById("keyword_box").innerText = keyword_list[1];
           		break;
        	case "2":
        		document.getElementById("keyword_box").innerText = keyword_list[2];
           		break;
        	case "10":
        		document.getElementById("keyword_box").innerText = keyword_list[3];
           		break;
        	case "15":
        		document.getElementById("keyword_box").innerText = keyword_list[4];
           		break;
        	case "17":
        		document.getElementById("keyword_box").innerText = keyword_list[5];
           		break;
        	case "19":
        		document.getElementById("keyword_box").innerText = keyword_list[6];
           		break;
        	case "20":
        		document.getElementById("keyword_box").innerText = keyword_list[7];
           		break;
        	case "22":
        		document.getElementById("keyword_box").innerText = keyword_list[8];
           		break;
        	case "23":
        		document.getElementById("keyword_box").innerText = keyword_list[9];
           		break;
        	case "24":
        		document.getElementById("keyword_box").innerText = keyword_list[10];
           		break;
        	case "25":
        		document.getElementById("keyword_box").innerText = keyword_list[11];
           		break;
        	case "26":
        		document.getElementById("keyword_box").innerText = keyword_list[12];
           		break;
        	case "27":
        		document.getElementById("keyword_box").innerText = keyword_list[13];
           		break;
        	case "28":
        		document.getElementById("keyword_box").innerText = keyword_list[14];
           		break;
        	case "29":
        		document.getElementById("keyword_box").innerText = keyword_list[15];
           		break;
        	default:
        		document.getElementById("keyword_box").innerText = keyword_list[0];
           		break;
        }
    });

 </script>
 
   </section>
   <!-- End Hero -->

	 <!-- ======= Clients Section ======= -->
      <section id="clients" class="clients">
      	<div class="clientsBackground">
         <div class="container">
            <div class="row">
               <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center" data-aos="zoom-in" data-aos-delay="100">
                  <img src="assets/img/clients/youtube.png" class="img-fluid" alt="">
               </div>

               <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center" data-aos="zoom-in" data-aos-delay="200">
                  <img src="assets/img/clients/Google.png" class="img-fluid" alt="">
               </div>

               <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center" data-aos="zoom-in" data-aos-delay="300">
                  <img src="assets/img/clients/Jupyter.png" class="img-fluid" alt="">
               </div>

               <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center" data-aos="zoom-in" data-aos-delay="400">
                  <img src="assets/img/clients/Github.png" class="img-fluid" alt="">
               </div>

               <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center" data-aos="zoom-in" data-aos-delay="500">
                  <img src="assets/img/clients/Tomcat.png" class="img-fluid" alt="">
               </div>

               <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center" data-aos="zoom-in" data-aos-delay="600">
                  <img src="assets/img/clients/Flask.png" class="img-fluid" alt="">
               </div>
            </div>
         </div>
         </div>
      </section>
      <!-- End Clients Section -->

   <main id="main">

      <!-- ======= Visual Section ======= -->
  <section id="visual" class="d-flex align-items-center" style="height: 100vh;">
     <div id="visualbackground">
      <!-- <span style="color:white; height:100px; font-size: 32px;">조회수 추이</span> -->
      <div class="col-lg-4" style="margin-right: 300px; margin-top: 50px">
        <div class="section-title" data-aos="fade-right">
          <h2 style="color:white">시각화</h2>
          <p style="color:white">각 변수별 조회수 추이 시각화</p>
        </div>
      </div>
      <div id="graphBtn">
       	 <!-- 마우스 오버 이벤트 추가 -->
         <div onmouseover="showCate(1)" class="pointer">제목 글자수</div>
         <div onmouseover="showCate(2)" class="pointer">썸네일 속 텍스트 글자수</div>
         <div onmouseover="showCate(3)" class="pointer">썸네일 속 총 텍스트 면적</div>
         <div onmouseover="showCate(4)" class="pointer">썸네일 속 폰트 크기</div>
         <div onmouseover="showCate(8)" class="pointer">구독자수</div>
         <!-- 클릭 이벤트 추가 -->
         <div onclick="showImage(5)" class="pointer">얼굴 유무</div>
         <div onclick="showImage(6)" class="pointer">폭력성</div>
         <div onclick="showImage(7)" class="pointer">선정성</div>
         <div onclick="showImage(9)" class="pointer">업로드 시간대</div>
      </div>
      <div style="height:100px; width:1500px;">
         <div id="categories">
            <ul class="submenu">
               <!-- 클릭 이벤트 추가 -->
               <li onclick="showImages(1)" class="pointer"> <span>영화<br>&amp;<br>애니메이션</span></li> 
               <li onclick="showImages(2)" class="pointer">자동차</li> 
               <li onclick="showImages(10)" class="pointer">음악</li> 
               <li onclick="showImages(15)" class="pointer">동물</li> 
               <li onclick="showImages(17)" class="pointer">스포츠</li> 
               <li onclick="showImages(19)" class="pointer">여행 <br>&amp;<br> 이벤트</li> 
               <li onclick="showImages(20)" class="pointer">게임</li> 
               <li onclick="showImages(22)" class="pointer">사람 <br>&amp;<br> 블로그</li> 
               <li onclick="showImages(23)" class="pointer">코미디</li> 
               <li onclick="showImages(24)" class="pointer">엔터테인먼트</li> 
               <li onclick="showImages(25)" class="pointer">뉴스 <br>&amp;<br> 정치</li> 
               <li onclick="showImages(26)" class="pointer">노하우</li> 
               <li onclick="showImages(27)" class="pointer">교육</li> 
               <li onclick="showImages(28)" class="pointer">과학</li> 
               <li onclick="showImages(29)" class="pointer">비영리</li> 
            </ul>
         </div>
      </div>
      <div id="imgbox" data-aos="fade-in" data-aos-delay="300">
         <div id="imageContainer">
         </div>
      </div>
   </div>
<script type="text/javascript">
  let previousHoveredDiv = null;
  let selectedCategory = null;
  let categories = document.getElementById('categories');
  let previousClickedCategory = null;
  let clickedCategory = null;
  

	  
	  document.querySelectorAll('#graphBtn div').forEach(function (div) {
	    div.addEventListener('mouseover', function () {
	      changeColorOnHover(this);
	    });
	  });

	  document.querySelectorAll('.submenu li').forEach(function (li) {
	    li.addEventListener('click', function () {
	      changeColorOnClick(this);
	    });
	  });

	  function showCate(num) {
	    let categories = document.getElementById('categories');
	    categories.style.display = 'block';
	    selectedCategory = num; // 선택한 카테고리 번호를 변수에 저장
	    animateCategories(); // 카테고리가 나타날 때 애니메이션 적용
	  }

	  function hideCategories() {
	    animateCategories(false); // 카테고리가 숨겨질 때 애니메이션 적용
	    setTimeout(function () {
	      let categories = document.getElementById('categories');
	      categories.style.display = 'none';
	    }, 1000); // 0.5초 후에 카테고리를 숨깁니다.
	  }

	  function animateCategories(reverse = true) {
	    const submenuItems = document.querySelectorAll('.submenu li');
	    submenuItems.forEach(function (li, index) {
	      setTimeout(function () {
	        li.classList.toggle('animate', reverse);
	      }, reverse ? index * 30 : (submenuItems.length - index) * 30);
	    });
	  }

	  // 마우스 오버 이벤트를 각 div에 연결
	  function changeColorOnHover(divElement) {
	    // 이전에 오버된 div의 색상을 원래대로 되돌림
	    if (previousHoveredDiv) {
	      previousHoveredDiv.style.backgroundColor = ''; // 원래대로 돌리기 위해 빈 문자열로 설정
	      previousHoveredDiv.style.color = '';
	    }
	    // 현재 오버된 div의 색상을 변경
	    divElement.style.backgroundColor = '#009970';
	    divElement.style.color = 'white';
	    // 이전에 오버된 div 변수 갱신
	    previousHoveredDiv = divElement;
	  }

	  // 클릭 이벤트를 각 div에 연결
	  function changeColorOnClick(liElement) {
	    if (clickedCategory !== liElement) {
	      // 클릭한 카테고리가 이전에 클릭한 카테고리와 다를 경우에만 스타일 변경
	      if (clickedCategory) {
	        // 이전에 클릭된 카테고리가 있을 경우 스타일 초기화
	        clickedCategory.style.backgroundColor = '';
	        clickedCategory.style.color = '';
	      }

	      // 현재 클릭한 카테고리의 스타일 변경
	      liElement.style.backgroundColor = '#009970';
	      liElement.style.color = 'white';

	      // 클릭된 카테고리 변수 갱신
	      clickedCategory = liElement;
	    }
	  }

  
  /* categories.style.display = "none";
  document.querySelectorAll('#graphBtn div').forEach(function (div) {
    div.addEventListener('mouseover', function () {
      changeColorOnHover(this);
    });
  });
  document.querySelectorAll('.submenu li').forEach(function (div) {
    div.addEventListener('click', function () {
      changeColorOnClick(this);
    });
  }); */

  document.querySelector('#graphBtn div:nth-child(6)').addEventListener('mouseover', function () {
    hideCategories(); // categories를 숨깁니다.
  });

  document.querySelector('#graphBtn div:nth-child(7)').addEventListener('mouseover', function () {
    hideCategories(); // categories를 숨깁니다.
  });

  document.querySelector('#graphBtn div:nth-child(8)').addEventListener('mouseover', function () {
    hideCategories(); // categories를 숨깁니다.
  });

  document.querySelector('#graphBtn div:nth-child(9)').addEventListener('mouseover', function () {
    hideCategories(); // categories를 숨깁니다.
  });

  /* function showCate(num) {
    let categories = document.getElementById('categories');
    categories.style.display = 'block';
    selectedCategory = num; // 선택한 카테고리 번호를 변수에 저장
  }

  function hideCategories() {
    let categories = document.getElementById('categories');
    categories.style.display = 'none';
  } */

  function showImages(imageNumber) {
	  // 이미지 컨테이너 요소를 가져옴
	  const imageContainer = document.getElementById('imageContainer');

	  // 이미지 컨테이너에 hide 클래스 추가 (애니메이션을 위해)
	  imageContainer.classList.add('hide');

	  // 이미지 컨테이너의 애니메이션이 완료되면 내용을 변경하고 show 클래스를 추가
	  setTimeout(function () {
	    while (imageContainer.firstChild) {
	      imageContainer.removeChild(imageContainer.firstChild);
	    }

	    if (selectedCategory !== null) {
	      // 이미지 파일 이름 생성 (예: 0_1_3.jpg)
	      let imageName = "0_" + selectedCategory + "_" + imageNumber + ".png";

	      // 이미지 요소 생성
	      const image = document.createElement('img');
	      image.style.width = "1000px";

	      // 이미지 소스 설정
	      image.src = "./assets/img/graphs/" + imageName;

	      // 이미지를 추가
	      imageContainer.innerHTML = '';
	      imageContainer.appendChild(image);

	      // 이미지 컨테이너의 애니메이션 클래스 제거 (애니메이션 완료)
	      imageContainer.classList.remove('hide');

	      // 이미지 컨테이너에 show 클래스 추가 (애니메이션을 위해)
	      imageContainer.classList.add('show');
	    }
	  }, 500); // 이미지 컨테이너가 숨겨진 후 0.5초 후에 내용 변경 및 애니메이션 활성화
	}

  /* // 마우스 오버 이벤트를 각 div에 연결
  function changeColorOnHover(divElement) {
    // 이전에 오버된 div의 색상을 원래대로 되돌림
    if (previousHoveredDiv) {
      previousHoveredDiv.style.backgroundColor = ''; // 원래대로 돌리기 위해 빈 문자열로 설정
      previousHoveredDiv.style.color = '';
    }
    // 현재 오버된 div의 색상을 변경
    divElement.style.backgroundColor = '#009970';
    divElement.style.color = 'white';
    // 이전에 오버된 div 변수 갱신
    previousHoveredDiv = divElement;
  }

  // 클릭 이벤트를 각 div에 연결
function changeColorOnClick(liElement) {
  if (clickedCategory !== liElement) {
    // 클릭한 카테고리가 이전에 클릭한 카테고리와 다를 경우에만 스타일 변경
    if (clickedCategory) {
      // 이전에 클릭된 카테고리가 있을 경우 스타일 초기화
      clickedCategory.style.backgroundColor = '';
      clickedCategory.style.color = '';
    }

    // 현재 클릭한 카테고리의 스타일 변경
    liElement.style.backgroundColor = '#009970';
    liElement.style.color = 'white';

    // 클릭된 카테고리 변수 갱신
    clickedCategory = liElement;
  }
} */

function showImage(a) {
	  // 이미지 컨테이너 요소를 가져옴
	  const imageContainer = document.getElementById('imageContainer');

	  // 이미지 컨테이너에 hide 클래스 추가 (애니메이션을 위해)
	  imageContainer.classList.add('hide');

	  // 이미지 컨테이너의 애니메이션이 완료되면 내용을 변경하고 show 클래스를 추가
	  setTimeout(function () {
	    while (imageContainer.firstChild) {
	      imageContainer.removeChild(imageContainer.firstChild);
	    }

	    if (selectedCategory !== null) {
	      // 이미지 파일 이름 생성 (예: 0_1_3.jpg)
	      let imageName = "0_" + a + "_0.png";

	      // 이미지 요소 생성
	      const image = document.createElement('img');
	      image.style.width = "1000px";

	      // 이미지 소스 설정
	      image.src = "./assets/img/graphs/" + imageName;

	      // 이미지를 추가
	      imageContainer.innerHTML = '';
	      imageContainer.appendChild(image);

	      // 이미지 컨테이너의 애니메이션 클래스 제거 (애니메이션 완료)
	      imageContainer.classList.remove('hide');

	      // 이미지 컨테이너에 show 클래스 추가 (애니메이션을 위해)
	      imageContainer.classList.add('show');
	    }
	  }, 500); // 이미지 컨테이너가 숨겨진 후 0.5초 후에 내용 변경 및 애니메이션 활성화
	}

</script>
  </section>

     <!-- ======= Keyword Section ======= -->
	<section id="keyword" class="d-flex align-items-center section-bg" style="height:100vh;">
		<div id="keyword_left">
			<div class="col-lg-4 keywordtitle">
				<div class="" data-aos="fade-right">
					<h2>키워드</h2>
					<p>각 카테고리별 단어 빈도수 랭킹</p>
				</div>
			</div>
			<div id="keywords">
				<div class="btns" data-aos="fade-right">
					<button class="category-btn" data-category="0">전체</button>
					<button class="category-btn" data-category="1">영화 &amp;
						애니메이션</button>
					<button class="category-btn" data-category="2">자동차</button>
					<button class="category-btn" data-category="3">음악</button>
					<button class="category-btn" data-category="4">동물</button>
					<button class="category-btn" data-category="5">스포츠</button>
					<button class="category-btn" data-category="6">여행 &amp;
						이벤트</button>
					<button class="category-btn" data-category="7">게임</button>
					<button class="category-btn" data-category="8">사람 &amp;
						블로그</button>
					<button class="category-btn" data-category="9">코미디</button>
					<button class="category-btn" data-category="10">엔터테인먼트</button>
					<button class="category-btn" data-category="11">뉴스 &amp;
						정치</button>
					<button class="category-btn" data-category="12">노하우</button>
					<button class="category-btn" data-category="13">교육</button>
					<button class="category-btn" data-category="14">과학</button>
					<button class="category-btn" data-category="15">비영리</button>
				</div>
			</div>
		</div> 
		<div id="keyword_right" data-aos="fade-left">
			<div class="nowbtn"></div>
			<div class="rankcontainer">
				<div class="rankings">
					<div class="rankbox">
						<table class="rank_title">
							<tr>
								<td class="header">
									<div>제목</div>
								</td>
							</tr>
							<tr>
								<th class="rank">
									<div class="place">순위</div>
									<div class="word">키워드</div>
									<div class="power">빈도수</div>
								</th>
							</tr>
							<tr>
								<td class="rank">
									<div class="place first">1 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place second">2 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place third">3 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place">4 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place">5 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place">6 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place">7 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place">8 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place">9 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place">10 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
						</table>
					</div>
					<div class="rankbox">
						<table class="rank_thumbnail">
							<tr>
								<td class="header">
									<div>썸네일</div>
								</td>
							</tr>
							<tr>
								<th class="rank">
									<div class="place">순위</div>
									<div class="word">키워드</div>
									<div class="power">빈도수</div>
								</th>
							</tr>
							<tr>
								<td class="rank">
									<div class="place first">1 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place second">2 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place third">3 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place">4 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place">5 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place">6 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place">7 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place">8 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place">9 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
							<tr>
								<td class="rank">
									<div class="place">10 위</div>
									<div class="word"></div>
									<div class="power"></div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', (event) => {
		
		
    const title_data = {
        0: [
            { word: '로그', power: '3923' },
            { word: '브이', power: '3821' },
            { word: '리뷰', power: '3709' },
            { word: '여행', power: '3473' },
            { word: '방송', power: '3372' },
            { word: '추천', power: '2774' },
            { word: '이유', power: '2766' },
            { word: '게임', power: '2658' },
            { word: '방법', power: '2634' },
            { word: '뉴스', power: '2387' },
        ],
        1: [
            { word: '영화', power: '1005' },
            { word: '결말', power: '974' },
            { word: '포함', power: '895' },
            { word: '영화리뷰', power: '636' },
            { word: '애니', power: '511' },
            { word: '보기', power: '400' },
            { word: '드라마', power: '398' },
            { word: '리뷰', power: '376' },
            { word: '애니메이션', power: '239' },
            { word: '추천', power: '231' }
        ],
        2: [
            { word: '리뷰', power: '613' },
            { word: '스포츠', power: '355' },
            { word: '자동차', power: '318' },
            { word: '승기', power: '269' },
            { word: '신형', power: '177' },
            { word: '스턴', power: '130' },
            { word: '가격', power: '113' },
            { word: '현대', power: '108' },
            { word: '하이브리드', power: '108' },
            { word: '기아', power: '99' }
        ],
        3: [
            { word: '음악', power: '885' },
            { word: '커버', power: '361' },
            { word: '노래', power: '357' },
            { word: '모음', power: '336' },
            { word: '팝송', power: '247' },
            { word: '사랑', power: '213' },
            { word: '명상', power: '194' },
            { word: '방송', power: '171' },
            { word: '힐링', power: '170' },
            { word: '뮤비', power: '159' }
        ],
        4: [
            { word: '고양이', power: '375' },
            { word: '강아지', power: '214' },
            { word: '동물', power: '125' },
            { word: '아기', power: '109' },
            { word: '반려견', power: '96' },
            { word: '방송', power: '80' },
            { word: '바오', power: '59' },
            { word: '로그', power: '57' },
            { word: '집사', power: '57' },
            { word: '새끼', power: '55' }
        ],
        5: [
            { word: '선수', power: '911' },
            { word: '운동', power: '820' },
            { word: '루틴', power: '527' },
            { word: '낚시', power: '461' },
            { word: '스포츠', power: '445' },
            { word: '야구', power: '297' },
            { word: '기술', power: '259' },
            { word: '축구', power: '198' },
            { word: '경기', power: '197' },
            { word: '방법', power: '182' }
        ],
        6: [
            { word: '여행', power: '1648' },
            { word: '맛집', power: '813' },
            { word: '캠핑', power: '741' },
            { word: '추천', power: '380' },
            { word: '세계', power: '266' },
            { word: '코스', power: '229' },
            { word: '용품', power: '209' },
            { word: '로그', power: '197' },
            { word: '브이', power: '194' },
            { word: '한국', power: '192' }
        ],
        7: [
            { word: '게임', power: '1575' },
            { word: '디아블로', power: '519' },
            { word: '피파', power: '418' },
            { word: '던파', power: '409' },
            { word: '아크', power: '403' },
            { word: '로스트', power: '392' },
            { word: '서든어택', power: '364' },
            { word: '페이커', power: '328' },
            { word: '리뷰', power: '311' },
            { word: '배그', power: '296' }
        ],
        8: [
            { word: '로그', power: '2910' },
            { word: '브이', power: '2825' },
            { word: '다이어트', power: '994' },
            { word: '여행', power: '919' },
            { word: '맛집', power: '915' },
            { word: '추천', power: '864' },
            { word: '명상', power: '834' },
            { word: '일상', power: '822' },
            { word: '리뷰', power: '761' },
            { word: '먹방', power: '631' }
        ],
        9: [
            { word: '방송', power: '282' },
            { word: '가족', power: '93' },
            { word: '게임', power: '82' },
            { word: '크큭', power: '73' },
            { word: '티비', power: '63' },
            { word: '친구', power: '58' },
            { word: '결혼', power: '56' },
            { word: '브이', power: '55' },
            { word: '로그', power: '53' },
            { word: '시트콤', power: '48' }
        ],
        10: [
            { word: '방송', power: '1942' },
            { word: '예능', power: '523' },
            { word: '라임', power: '503' },
            { word: '모음', power: '464' },
            { word: '가족', power: '459' },
            { word: '이유', power: '443' },
            { word: '드라마', power: '437' },
            { word: '리뷰', power: '406' },
            { word: '임영웅', power: '401' },
            { word: '게임', power: '385' }
        ],
        11: [
            { word: '뉴스', power: '1961' },
            { word: '한국', power: '422' },
            { word: '김정은', power: '357' },
            { word: '문재인', power: '322' },
            { word: '이유', power: '311' },
            { word: '방송', power: '310' },
            { word: '중국', power: '301' },
            { word: '이재명', power: '268' },
            { word: '사건', power: '240' },
            { word: '영상', power: '222' }
        ],
        12: [
            { word: '패션', power: '825' },
            { word: '리뷰', power: '583' },
            { word: '추천', power: '579' },
            { word: '방법', power: '544' },
            { word: '다이어트', power: '464' },
            { word: '명상', power: '420' },
            { word: '요리', power: '357' },
            { word: '중년', power: '352' },
            { word: '제품', power: '340' },
            { word: '운동', power: '339' }
        ],
        13: [
            { word: '미술', power: '1277' },
            { word: '역사', power: '843' },
            { word: '시험', power: '614' },
            { word: '방법', power: '578' },
            { word: '과학', power: '572' },
            { word: '명상', power: '568' },
            { word: '영어', power: '479' },
            { word: '기술', power: '455' },
            { word: '이유', power: '418' },
            { word: '만들기', power: '395' }
        ],
        14: [
            { word: '과학', power: '315' },
            { word: '기술', power: '278' },
            { word: '리뷰', power: '170' },
            { word: '사이언스', power: '147' },
            { word: '방법', power: '119' },
            { word: '이유', power: '89' },
            { word: '우주', power: '82' },
            { word: '제품', power: '73' },
            { word: '배터리', power: '69' },
            { word: '지구', power: '63' }
        ],
        15: [
            { word: '목사', power: '160' },
            { word: '명상', power: '146' },
            { word: '스님', power: '73' },
            { word: '교회', power: '67' },
            { word: '브라이언', power: '38' },
            { word: '영상', power: '37' },
            { word: '예배', power: '36' },
            { word: '역사', power: '36' },
            { word: '방법', power: '34' },
            { word: '마음', power: '33' }
        ]

        // ... 더 많은 카테고리
    };
    
    
    
    const thumbnail_data = {
            0: [
                { word: '이유', power: '1735' },
                { word: '방법', power: '1237' },
                { word: '한국', power: '1228' },
                { word: '기술', power: '1152' },
                { word: '여행', power: '1132' },
                { word: '게임', power: '1132' },
                { word: '사람', power: '1034' },
                { word: '뉴스', power: '1009' },
                { word: '명상', power: '1006' },
                { word: '만원', power: '928' }
            ],
            1: [
                { word: '영화', power: '227' },
                { word: '보기', power: '149' },
                { word: '애니', power: '98' },
                { word: '결말', power: '60' },
                { word: '리뷰', power: '55' },
                { word: '게임', power: '49' },
                { word: '진짜', power: '47' },
                { word: '남자', power: '46' },
                { word: '추천', power: '46' },
                { word: '사랑', power: '44' }
            ],
            2: [
                { word: '스포츠', power: '183' },
                { word: '리뷰', power: '131' },
                { word: '만원', power: '103' },
                { word: '신형', power: '86' },
                { word: '자동차', power: '77' },
                { word: '스턴', power: '77' },
                { word: '승기', power: '66' },
                { word: '하이브리드', power: '52' },
                { word: '로버', power: '52' },
                { word: '현대', power: '51' }
            ],
            3: [
                { word: '음악', power: '265' },
                { word: '사랑', power: '165' },
                { word: '노래', power: '82' },
                { word: '명상', power: '63' },
                { word: '모음', power: '62' },
                { word: '멜로', power: '53' },
                { word: '듣기', power: '46' },
                { word: '이란', power: '45' },
                { word: '차트', power: '45' },
                { word: '송가', power: '44' }
            ],
            4: [
                { word: '동물', power: '113' },
                { word: '고양이', power: '103' },
                { word: '강아지', power: '56' },
                { word: '애니멀', power: '51' },
                { word: '반려', power: '30' },
                { word: '반려견', power: '26' },
                { word: '병원', power: '25' },
                { word: '아기', power: '24' },
                { word: '엄마', power: '21' },
                { word: '입양', power: '19' }
            ],
            5: [
                { word: '선수', power: '387' },
                { word: '운동', power: '324' },
                { word: '스포츠', power: '195' },
                { word: '루틴', power: '184' },
                { word: '야구', power: '182' },
                { word: '낚시', power: '176' },
                { word: '축구', power: '136' },
                { word: '기술', power: '113' },
                { word: '프로', power: '105' },
                { word: '경기', power: '99' }
            ],
            6: [
                { word: '여행', power: '505' },
                { word: '맛집', power: '285' },
                { word: '캠핑', power: '265' },
                { word: '다큐', power: '99' },
                { word: '코스', power: '90' },
                { word: '추천', power: '82' },
                { word: '용품', power: '82' },
                { word: '만원', power: '68' },
                { word: '이유', power: '64' },
                { word: '한국', power: '61' }
            ],
            7: [
                { word: '게임', power: '536' },
                { word: '디아블로', power: '153' },
                { word: '기술', power: '150' },
                { word: '페이', power: '131' },
                { word: '신규', power: '130' },
                { word: '진짜', power: '128' },
                { word: '패치', power: '116' },
                { word: '정리', power: '109' },
                { word: '역대', power: '105' },
                { word: '시즌', power: '103' }
            ],
            8: [
                { word: '명상', power: '342' },
                { word: '로그', power: '301' },
                { word: '이유', power: '300' },
                { word: '브이', power: '286' },
                { word: '방법', power: '279' },
                { word: '여행', power: '255' },
                { word: '맛집', power: '249' },
                { word: '이혼', power: '237' },
                { word: '한국', power: '232' },
                { word: '다이어트', power: '216' }
            ],
            9: [
                { word: '남자', power: '31' },
                { word: '꼬향', power: '31' },
                { word: '달인', power: '28' },
                { word: '아내', power: '24' },
                { word: '게임', power: '24' },
                { word: '남편', power: '22' },
                { word: '친구', power: '21' },
                { word: '가족', power: '21' },
                { word: '영국', power: '20' },
                { word: '몰카', power: '19' }
            ],
            10: [
                { word: '모음', power: '273' },
                { word: '예능', power: '265' },
                { word: '임영웅', power: '256' },
                { word: '이유', power: '252' },
                { word: '게임', power: '229' },
                { word: '라임', power: '197' },
                { word: '사람', power: '185' },
                { word: '한국', power: '182' },
                { word: '사랑', power: '176' },
                { word: '엄마', power: '165' }
            ],
            11: [
                { word: '뉴스', power: '762' },
                { word: '한국', power: '373' },
                { word: '김정은', power: '265' },
                { word: '이유', power: '258' },
                { word: '중국', power: '224' },
                { word: '문재인', power: '221' },
                { word: '이재명', power: '168' },
                { word: '코인', power: '145' },
                { word: '사건', power: '142' },
                { word: '대통령', power: '141' }
            ],
            12: [
                { word: '방법', power: '242' },
                { word: '패션', power: '231' },
                { word: '이유', power: '197' },
                { word: '만원', power: '181' },
                { word: '추천', power: '177' },
                { word: '명상', power: '159' },
                { word: '다이어트', power: '138' },
                { word: '코디', power: '123' },
                { word: '운동', power: '121' },
                { word: '중년', power: '114' }
            ],
            13: [
                { word: '과학', power: '394' },
                { word: '시험', power: '391' },
                { word: '역사', power: '351' },
                { word: '방법', power: '301' },
                { word: '명상', power: '298' },
                { word: '이유', power: '294' },
                { word: '미술', power: '267' },
                { word: '기술', power: '244' },
                { word: '사람', power: '231' },
                { word: '문제', power: '211' }
            ],
            14: [
                { word: '기술', power: '164' },
                { word: '과학', power: '141' },
                { word: '배터리', power: '57' },
                { word: '우주', power: '56' },
                { word: '이유', power: '56' },
                { word: '리뷰', power: '54' },
                { word: '지구', power: '50' },
                { word: '방법', power: '49' },
                { word: '만원', power: '44' },
                { word: '삼성', power: '41' }
            ],
            15: [
                { word: '명상', power: '68' },
                { word: '방법', power: '25' },
                { word: '사람', power: '24' },
                { word: '하나님', power: '23' },
                { word: '마음', power: '22' },
                { word: '역사', power: '21' },
                { word: '아침', power: '20' },
                { word: '사랑', power: '19' },
                { word: '이야기', power: '18' },
                { word: '가족', power: '18' }
            ]
        };
    
    let clickedCategory = null;

    function changeColorOnClick(buttonElement) {
        if (clickedCategory !== buttonElement) {
            if (clickedCategory) {
                clickedCategory.style.backgroundColor = '';
                clickedCategory.style.color = '';
                clickedCategory.style.border = '2px solid #009970';
            }

            buttonElement.style.backgroundColor = '#009970';
            buttonElement.style.color = 'white';
            buttonElement.style.border = '2px solid white';

            clickedCategory = buttonElement;
        }
    }

    function updateContent(button) {
        const category = button.getAttribute('data-category');
        const title_keywords = title_data[category];
        const thumbnail_keywords = thumbnail_data[category];
        const title_tables = document.querySelectorAll('.rank_title');
        const thumbnail_tables = document.querySelectorAll('.rank_thumbnail');
        const nowbtn = document.querySelector('.nowbtn');

        const dataCount = ['104537', '4476', '2061', '3074', '1272', '4661',
        	'3681', '9737', '17509', '1547', '12919', '6814', '7699', '9866', '2108', '921']
        
        nowbtn.innerHTML = '';
        const btnText = document.createTextNode(button.textContent + " (" + dataCount[category] + ")");
        nowbtn.appendChild(btnText);
        

        // Update title tables
        title_tables.forEach((table) => {
            const rows = table.querySelectorAll('.rank');
            rows.forEach((row, i) => {
                if (i === 0) return;
                const cells = row.querySelectorAll('.word, .power');
                cells[0].textContent = title_keywords[i - 1].word;
                cells[1].textContent = title_keywords[i - 1].power;
                // Remove and add the class to trigger the animation
                cells[0].classList.remove('fade-in');
                cells[1].classList.remove('fade-in');
                void cells[0].offsetWidth; // Trigger reflow
                void cells[1].offsetWidth; // Trigger reflow
                cells[0].classList.add('fade-in');
                cells[1].classList.add('fade-in');
                
                nowbtn.classList.remove('fade-in');
                void nowbtn.offsetWidth; // Trigger reflow
                nowbtn.classList.add('fade-in');
            });
        });

        // Update thumbnail tables
        thumbnail_tables.forEach((table) => {
            const rows = table.querySelectorAll('.rank');
            rows.forEach((row, i) => {
                if (i === 0) return;
                const cells = row.querySelectorAll('.word, .power');
                cells[0].textContent = thumbnail_keywords[i - 1].word;
                cells[1].textContent = thumbnail_keywords[i - 1].power;
                // Remove and add the class to trigger the animation
                cells[0].classList.remove('fade-in');
                cells[1].classList.remove('fade-in');
                void cells[0].offsetWidth; // Trigger reflow
                void cells[1].offsetWidth; // Trigger reflow
                cells[0].classList.add('fade-in');
                cells[1].classList.add('fade-in');
            });
        });

    }

    document.querySelectorAll('.category-btn').forEach(button => {
        button.addEventListener('click', () => {
            changeColorOnClick(button);
            updateContent(button);
        });

        button.addEventListener('mouseover', () => {
            button.style.border = '2px solid white';
            button.style.backgroundColor = '#009970';
            button.style.color = 'white';
        });

        button.addEventListener('mouseout', () => {
            if (button !== clickedCategory) {
                button.style.backgroundColor = '';
                button.style.color = '';
                button.style.border = '2px solid #009970';
            }
        });
    });

});
	</script>
</section>
	<section id="about">
      <!-- ======= About Section ======= -->
      <section class="about">
         <div class="container">

            <div class="row content" style="width:2000px;">
               <div class="col-lg-6" data-aos="fade-right" data-aos-delay="100" style="width:650px;">
                  <h2>서비스 요약 설명</h2>
                  <h3>
                     &nbsp;&nbsp;유튜브의 경쟁은 치열하고, 크리에이터들이<br> 더 많은 관심을 받기 위한 방법이 필요합니다.<br>
                     <br> &nbsp;&nbsp;이 서비스는 유튜브 영상 성과를 예측해 크리에이터가<br> 효율적으로 콘텐츠를 제작할
                     수 있도록 도와줍니다.
                  </h3>
               </div>
               <div class="col-lg-6 pt-4 pt-lg-0" data-aos="fade-left" data-aos-delay="200" style="width: 1000px;">
                  <p style="font-size:30px">서비스 진행 개요</p>
                  <ul>
                     <li><i class="ri-check-double-line"></i> 유튜브 API를 통한 유튜브 영상
                        데이터 수집 : 약 10만 개</li>
                     <li><i class="ri-check-double-line"></i> OCR API로 썸네일의 텍스트
                        정보(면적, 길이, 내용, 유해성 등) 추출</li>
                     <li><i class="ri-check-double-line"></i> input 값으로 제목, 썸네일
                        텍스트 정보, 구독자수를, target 값으로 조회수를 넣어서 AI 모델링 및 훈련</li>
                     <li><i class="ri-check-double-line"></i> 사용자의 채널 정보, 제목과 썸네일
                        이미지 등을 입력하면 학습된 모델이 유튜브 영상 성과 예측</li>
                     <li><i class="ri-check-double-line"></i> 부가적으로 썸네일 텍스트 길이,
                        면적 등의 적절한 수치를 분석할 수 있도록 데이터 시각화 자료 제공</li>
                  </ul>
                  <p class="fst-italic">
                     크리에이터가 더 많은 관심을 끌고 성과를 높일 수 있도록 <br> 수 만 건의 데이터 기반으로 학습된
                     모델을 통해 유익한 비전을 제공

                  </p>
               </div>
            </div>

         </div>
      </section>
      <!-- End About Section -->

      <!-- ======= Counts Section ======= -->
      <section id="counts" class="counts">
         <div class="container">

            <div class="row counters">

               <div class="col-lg-3 col-6 text-center">
                  <span data-purecounter-start="0" data-purecounter-end="31975" data-purecounter-duration="1" class="purecounter"></span>
                  <p>채널</p>
               </div>

               <div class="col-lg-3 col-6 text-center">
                  <span data-purecounter-start="0" data-purecounter-end="104537" data-purecounter-duration="1" class="purecounter"></span>
                  <p>영상</p>
               </div>

               <div class="col-lg-3 col-6 text-center">
                  <span data-purecounter-start="0" data-purecounter-end="696753" data-purecounter-duration="1" class="purecounter"></span>
                  <p>평균 조회수</p>
               </div>

               <div class="col-lg-3 col-6 text-center">
                  <span data-purecounter-start="0" data-purecounter-end="935" data-purecounter-duration="1" class="purecounter"></span>
                  <p>평균 댓글수</p>
               </div>

            </div>

         </div>
       
      </section>
      <!-- End Counts Section -->

      <!-- ======= Why Us Section ======= -->
      <section id="why-us" class="why-us">
         <div class="container">

            <div class="row" style="width: 1330px;">
               <div class="col-lg-4 d-flex align-items-stretch" data-aos="fade-right" style="width: 442px;">
                  <div class="content">
                     <h3>사람들의 이목을 끄는 '좋은 영상'은 무엇일까?</h3>
                     <p>
                        &nbsp;&nbsp;우리는 사람들에게 우리를 알리거나 홍보하기 위해 영상을 공유하지만 대부분 사람들의
                        이목을 끌지 못하고 무관심 속에 묻히고 맙니다. <br> <br> &nbsp;&nbsp;그렇다면
                        어떤 영상이 사람들에게 주목받을 수 있을까요?
                     </p>
                     <div class="text-center">
                        <a href="#main" class="more-btn">Learn More <i class="bx bx-chevron-right"></i></a>
                     </div>
                  </div>
               </div>
               <div class="col-lg-8 d-flex align-items-stretch">
                  <div class="icon-boxes d-flex flex-column justify-content-center">
                     <div class="row">
                        <div class="col-xl-4 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
                           <div class="icon-box mt-4 mt-xl-0">
                              <i class="bx bx-receipt"></i>
                              <h4>제목</h4>
                              <p>영상의 주제를 한눈에 나타내는<br> 문장 혹은 단어</p>
                           </div>
                        </div>
                        <div class="col-xl-4 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="200">
                           <div class="icon-box mt-4 mt-xl-0">
                              <i class="bx bx-cube-alt"></i>
                              <h4>썸네일</h4>
                              <p>영상의 내용을 요약할 수 있는 핵심 장면 혹은 이미지</p>
                           </div>
                        </div>
                        <div class="col-xl-4 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="300">
                           <div class="icon-box mt-4 mt-xl-0">
                              <i class="bx bx-images"></i>
                              <h4>카테고리</h4>
                              <p>사용자가 원하는 콘텐츠를 <br> 찾기 쉽게 해주는 분류</p>
                           </div>
                        </div>

                     </div>
                  </div>
                  <!-- End .content-->
               </div>
            </div>

         </div>
      </section>
      <!-- End Why Us Section -->

      <!-- ======= Cta Section ======= -->
      <section id="cta" class="cta">
         <div class="container">

            <div class="text-center" data-aos="zoom-in">
               <h3>서비스의 지향점</h3>
               <p>
                  이 서비스는 유튜브 크리에이터의 성공을 데이터 분석과 AI 모델링을 통해 적극적으로 지원하는 것을 목표로 하고
                  있습니다.<br> 구체적으로는, 크리에이터가 더 효율적으로 콘텐츠를 제작하고 마케팅할 수 있도록 성과 예측
                  모델을 제공합니다.<br> 이를 통해 콘텐츠 제작 프로세스를 최적화하고 영상의 성과를 예측할 수 있어
                  크리에이터가 시장에서 더 나은 경쟁력을 가질 수 있도록 도와줍니다.
               </p>
               <a class="cta-btn" href="#">Call To Action</a>
            </div>

         </div>
      </section>
      <!-- End Cta Section -->
    </section>

      <!-- ======= Services Section ======= -->
      <section id="services" class="services section-bg">
         <div class="container">

            <div class="row">
               <div class="col-lg-4">
                  <div class="section-title" data-aos="fade-right">
                     <h2>Services</h2>
                     <p>PredicTube가 제공하는 다양한 서비스</p>
                  </div>
               </div>
               <div class="col-lg-8">
                  <div class="row">
                     <div class="col-md-6 d-flex align-items-stretch">
                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="100" style="width:410px">
                           <div class="icon">
                              <i class="bx bxl-dribbble"></i>
                           </div>
                           <h4>
                              <a href="">영상 성과 예측</a>
                           </h4>
                           <p>채널 아이디, 제목, 썸네일 이미지를 입력하면<br> PredicTube AI가 영상의 성과를 예측합니다.</p>
                        </div>
                     </div>

                     <div class="col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="200" style="width:410px">
                           <div class="icon">
                              <i class="bx bx-file"></i>
                           </div>
                           <h4>
                              <a href="">썸네일 유해성 평가</a>
                           </h4>
                           <p>Google Cloud Vision API가 첨부된 썸네일 이미지를 분석하여<br> 유해성 수치를 제공합니다.</p>
                        </div>
                     </div>

                     <div class="col-md-6 d-flex align-items-stretch mt-4">
                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="300" style="width:410px">
                           <div class="icon">
                              <i class="bx bx-tachometer"></i>
                           </div>
                           <h4>
                              <a href="">사용자 맞춤 서비스</a>
                           </h4>
                           <p>성과 예측 서비스를 이용했던 기록이 모두 데이터베이스에 저장되어 히스토리를 통해 조회하고 비교할 수 있습니다.</p>
                        </div>
                     </div>

                     <div class="col-md-6 d-flex align-items-stretch mt-4">
                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="400" style="width:410px">
                           <div class="icon">
                              <i class="bx bx-world"></i>
                           </div>
                           <h4>
                              <a href="">데이터 시각화</a>
                           </h4>
                           <p>PredicTube에 학습된 약 10만 개 유튜브 영상들의 다양한 특성<br> 데이터를 바탕으로 각 변수별 조회수 추이를 시각화하여 제공합니다.</p>
                        </div>
                     </div>

                  </div>
               </div>
            </div>

         </div>
      </section>
      <!-- End Services Section -->

	  <!-- ======= HowToUse Section ======= -->
      <section id="testimonials" class="testimonials">
         <div class="container">

            <div class="row">
               <div class="col-lg-4">
                  <div class="section-title" data-aos="fade-right">
                     <h2>How To Use</h2>
                     <p>로그인 절차 및 PredicTube 사용법</p>
                  </div>
               </div>
               <div class="col-lg-8" data-aos="fade-up" data-aos-delay="100">

                  <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
                     <div class="swiper-wrapper">

                        <div class="swiper-slide">
                           <div class="testimonial-item">
                              <p>
                                 <i class="bx bxs-quote-alt-left quote-icon-left"></i> 로그인 <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                              </p>
                              <img src="assets/img/testimonials/testimonials-1.png" class="testimonial-img" alt="">
                              <h3>구글 소셜 로그인</h3>
                              <h4 style="width:250px; text-align:center; margin:30px auto;">구글 소셜 로그인을 통해 개인화된 서비스를 이용할 수 있습니다.</h4>
                           </div>
                        </div>
                        <!-- End testimonial item -->

                        <div class="swiper-slide">
                           <div class="testimonial-item">
                              <p>
                              	<i class="bx bxs-quote-alt-left quote-icon-left"></i> 유튜브 성과 예측 <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                              </p>
                              <img src="assets/img/testimonials/testimonials-2.png" class="testimonial-img" alt="">
                              <h3>PredicTube AI</h3>
                              <h4 style="width:250px; text-align:center; margin:30px auto;">제목과 썸네일, 채널 ID를 입력하면 PredicTube AI가 영상의 성과를 예측해줍니다.</h4>
                           </div>
                        </div>
                        <!-- End testimonial item -->

                        <div class="swiper-slide">
                           <div class="testimonial-item">
                              <p>
                                 <i class="bx bxs-quote-alt-left quote-icon-left"></i> 조건 변경 및 비교 <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                              </p>
                              <img src="assets/img/testimonials/testimonials-3.png" class="testimonial-img" alt="">
                              <h3>히스토리</h3>
                              <h4 style="width:250px; text-align:center; margin:30px auto;">예측 시도했던 데이터들을 비교하며 더 좋은 제목과 썸네일 조건을 분석하고 찾아낼 수 있습니다.</h4>
                           </div>
                        </div>
                        <!-- End testimonial item -->

                        <div class="swiper-slide">
                           <div class="testimonial-item">
                              <p>
                                 <i class="bx bxs-quote-alt-left quote-icon-left"></i> 조건별 분석 <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                              </p>
                              <img src="assets/img/testimonials/testimonials-4.png" class="testimonial-img" alt="">
                              <h3>데이터 시각화</h3>
                              <h4 style="width:250px; text-align:center; margin:30px auto;">그래프로 시각화된 각 변수별, 카테고리별 조회수 추이를 분석하여 제목과 썸네일 특성을 최적화할 수 있습니다.</h4>
                           </div>
                        </div>
                        <!-- End testimonial item -->

                     </div>
                     <div class="swiper-pagination"></div>
                  </div>
               </div>
            </div>

         </div>
      </section>
      <!-- End Testimonials Section -->


      <!-- ======= Develop Section ======= -->
      <section id="portfolio" class="portfolio section-bg">
         <div class="container">

            <div class="section-title" data-aos="fade-left">
               <h2>Develop Process</h2>
               <p>먼저 데이터를 수집하고 전처리합니다. 이후 AI 모델에 데이터를 학습시키고 모델의 성능을 최적화합니다. 마지막으로 데이터 시각화 자료를 가공하여 웹페이지에 삽입합니다.</p>
            </div>

            <div class="row" data-aos="fade-up" data-aos-delay="100">
               <div class="col-lg-12 d-flex justify-content-center">
                  <ul id="portfolio-flters">
                     <li data-filter="*" class="filter-active">All</li>
                     <li data-filter=".filter-collection">Collection</li>
                     <li data-filter=".filter-preprocessing">Preprocessing</li>
                     <li data-filter=".filter-modeling">AI Modeling</li>
                     <li data-filter=".filter-frontend">Web-Frontend</li>
                     <li data-filter=".filter-backend">Web-Backend</li>
                     <li data-filter=".filter-visualization">Visualization</li>
                  </ul>
               </div>
            </div>

            <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">

               <div class="col-lg-4 col-md-6 portfolio-item filter-collection">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/c1.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>데이터 수집</h4>
                        <p>YouTube Data API v3</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/c1.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="collection-1"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.jsp" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="col-lg-4 col-md-6 portfolio-item filter-collection">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/c2.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>데이터셋</h4>
                        <p>약 10만 개의 유튜브 영상 데이터</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/c2.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="collection-2"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.jsp" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="col-lg-4 col-md-6 portfolio-item filter-collection">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/c3.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>데이터 수집 최적화</h4>
                        <p>키워드별, 기간별 수집</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/c3.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="collection-3"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="col-lg-4 col-md-6 portfolio-item filter-collection">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/c4.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>데이터 수집 기록 및 검증</h4>
                        <p>일일 API 사용량 및 수집 데이터량 등</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/c4.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="collection-4"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="col-lg-4 col-md-6 portfolio-item filter-preprocessing">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/p1.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>1차 전처리</h4>
                        <p>수집 데이터 병합 및 필터링</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/p1.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="preprocessing-1"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="col-lg-4 col-md-6 portfolio-item filter-preprocessing">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/p2.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>Vision API</h4>
                        <p>썸네일 특성 분석</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/p2.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="preprocessing-2"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="col-lg-4 col-md-6 portfolio-item filter-preprocessing">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/p3.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>2차 전처리</h4>
                        <p>데이터 수치화 및 가공</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/p3.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="preprocessing-3"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="col-lg-4 col-md-6 portfolio-item filter-modeling">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/m1.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>학습용 데이터 전처리</h4>
                        <p>텍스트 데이터 토큰화</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/m1.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="modeling-1"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="col-lg-4 col-md-6 portfolio-item filter-modeling">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/m2.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>불용어 제거</h4>
                        <p>의미없는 토큰 제거</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/m2.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="modeling-2"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="col-lg-4 col-md-6 portfolio-item filter-modeling">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/m3.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>토큰 사전</h4>
                        <p>제목과 썸네일 텍스트 각각의 토큰 사전을 카테고리별로</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/m3.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="modeling-3"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="col-lg-4 col-md-6 portfolio-item filter-modeling">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/m4.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>벡터화된 토큰 전처리</h4>
                        <p>학습에 사용할 파라미터 값 정의</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/m4.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="modeling-4"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="col-lg-4 col-md-6 portfolio-item filter-modeling">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/m5.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>최종 모델 정의 및 학습</h4>
                        <p>LSTM과 MLP를 연결한 MIMO 모델</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/m5.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="modeling-5"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="col-lg-4 col-md-6 portfolio-item filter-modeling">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/m6.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>모델 성능 평가</h4>
                        <p>Loss와 Accuracy를 기준으로 모델 성능 시각화</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/m6.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="modeling-6"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="col-lg-4 col-md-6 portfolio-item filter-frontend">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/w1.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>JSP</h4>
                        <p>웹페이지 구성</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/w1.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="frontend-1"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>
               
               <div class="col-lg-4 col-md-6 portfolio-item filter-frontend">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/w9.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>CSS</h4>
                        <p>웹페이지 스타일</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/w9.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="frontend-2"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>
               
               <div class="col-lg-4 col-md-6 portfolio-item filter-backend">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/b1.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>Flask-1</h4>
                        <p>입력 파라미터 가공</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/b1.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="backend-1"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>
               
               <div class="col-lg-4 col-md-6 portfolio-item filter-backend">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/b2.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>Flask-2</h4>
                        <p>모델 연결 및 결과값 응답쿼리</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/b2.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="backend-2"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>
               
               <div class="col-lg-4 col-md-6 portfolio-item filter-visualization">
                  <div class="portfolio-wrap">
                     <img src="assets/img/portfolio/v1.png" class="img-fluid" alt="">
                     <div class="portfolio-info">
                        <h4>데이터 시각화</h4>
                        <p>Excel Pivot Table</p>
                        <div class="portfolio-links">
                           <a href="assets/img/portfolio/v1.png" data-gallery="portfolioGallery" class="portfolio-lightbox" title="visualization-1"><i class="bx bx-plus"></i></a>
                           <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                     </div>
                  </div>
               </div>
               
            </div>

         </div>
      </section>
      <!-- End Portfolio Section -->
      
      <!-- ======= Team Section ======= -->
      <section id="team" class="team section-bg">
         <div class="container">

            <div class="row">
               <div class="col-lg-4">
                  <div class="section-title" data-aos="fade-right">
                     <h2>Team</h2>
                     <p>AI.dear의 팀원을 소개합니다.</p>
                  </div>
               </div>
               <div class="col-lg-8">
                  <div class="row">

                     <div class="col-lg-6">
                        <div class="member" data-aos="zoom-in" data-aos-delay="100">
                           <div class="pic">
                              <img src="assets/img/team/team-1.jpg" class="img-fluid" alt="">
                           </div>
                           <div class="member-info">
                              <h4>임한빈</h4>
                              <span>팀장</span>
                              <p>프로젝트 설계 및 총괄<br>데이터 전처리 및 AI 모델링<br>프론트엔드 및 백엔드 보조</p>
                              <div class="social">
                                 <a href=""><i class="ri-twitter-fill"></i></a>
                                 <a href=""><i class="ri-facebook-fill"></i></a>
                                 <a href=""><i class="ri-instagram-fill"></i></a>
                                 <a href=""><i class="ri-linkedin-box-fill"></i></a>
                              </div>
                           </div>
                        </div>
                     </div>

                     <div class="col-lg-6 mt-4 mt-lg-0">
                        <div class="member" data-aos="zoom-in" data-aos-delay="200"  style="height:408.5px">
                           <div class="pic">
                              <img src="assets/img/team/team-2.jpg" class="img-fluid" alt="" style="width:150px; height:150px;">
                           </div>
                           <div class="member-info">
                              <h4>이도현</h4>
                              <span>팀원</span>
                              <p>웹 프론트엔드<br>백엔드 총괄<br>모델 연결 및 파라미터 가공</p>
                              <div class="social">
                                 <a href=""><i class="ri-twitter-fill"></i></a>
                                 <a href=""><i class="ri-facebook-fill"></i></a>
                                 <a href=""><i class="ri-instagram-fill"></i></a>
                                 <a href=""><i class="ri-linkedin-box-fill"></i></a>
                              </div>
                           </div>
                        </div>
                     </div>

                     <div class="col-lg-6 mt-4">
                        <div class="member" data-aos="zoom-in" data-aos-delay="300">
                           <div class="pic">
                              <img src="assets/img/team/team-3.jpg" class="img-fluid" alt="">
                           </div>
                           <div class="member-info">
                              <h4>정충환</h4>
                              <span>팀원</span>
                              <p>웹 프론트엔드 총괄<br>백엔드 보조<br>Vision API</p>
                              <div class="social">
                                 <a href=""><i class="ri-twitter-fill"></i></a>
                                 <a href=""><i class="ri-facebook-fill"></i></a>
                                 <a href=""><i class="ri-instagram-fill"></i></a>
                                 <a href=""><i class="ri-linkedin-box-fill"></i></a>
                              </div>
                           </div>
                        </div>
                     </div>

                     <div class="col-lg-6 mt-4">
                        <div class="member" data-aos="zoom-in" data-aos-delay="400">
                           <div class="pic">
                              <img src="assets/img/team/team-4.jpg" class="img-fluid" alt="">
                           </div>
                           <div class="member-info">
                              <h4>정정훈</h4>
                              <span>팀원</span>
                              <p>데이터 수집 및 전처리<br>데이터 시각화<br>YouTube Data API</p>
                              <div class="social">
                                 <a href=""><i class="ri-twitter-fill"></i></a>
                                 <a href=""><i class="ri-facebook-fill"></i></a>
                                 <a href=""><i class="ri-instagram-fill"></i></a>
                                 <a href=""><i class="ri-linkedin-box-fill"></i></a>
                              </div>
                           </div>
                        </div>
                     </div>

                     <div class="col-lg-6 mt-4">
                        <div class="member" data-aos="zoom-in" data-aos-delay="400"  style="height:408.5px">
                           <div class="pic">
                              <img src="assets/img/team/team-5.jpg" class="img-fluid" alt="">
                           </div>
                           <div class="member-info">
                              <h4>박윤미</h4>
                              <span>팀원</span>
                              <p>데이터 수집 및 전처리<br>프론트엔드 보조<br>데이터 품질 검증</p>
                              <div class="social">
                                 <a href=""><i class="ri-twitter-fill"></i></a>
                                 <a href=""><i class="ri-facebook-fill"></i></a>
                                 <a href=""><i class="ri-instagram-fill"></i></a>
                                 <a href=""><i class="ri-linkedin-box-fill"></i></a>
                              </div>
                           </div>
                        </div>
                     </div>

                  </div>

               </div>
            </div>

         </div>
      </section>
      <!-- End Team Section -->

      <!-- ======= Contact Section ======= -->
      <section id="contact" class="contact section-bg">
         <div class="container">
            <div class="row">
               <div class="col-lg-4" data-aos="fade-right">
                  <div class="section-title">
                     <h2>Contact</h2>
                     <p>PredicTube에 관한 문의</p>
                  </div>
               </div>

               <div class="col-lg-8" data-aos="fade-up" data-aos-delay="100">
                  <iframe style="border: 0; width: 100%; height: 270px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d203.83108431305627!2d126.91361126808825!3d35.17414070989007!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35718cf8f7304273%3A0x7181108ea523ce02!2z6rSR7KO86rWt7KCc7KeB7JeF7KCE66y47ZWZ6rWQ!5e0!3m2!1sko!2skr!4v1694499224406!5m2!1sko!2skr" frameborder="0" allowfullscreen></iframe>
                  <div class="info mt-4">
                     <i class="bi bi-geo-alt"></i>
                     <h4>Location:</h4>
                     <p>광주광역시 북구 중흥동 279-42</p>
                  </div>
                  <div class="row">
                     <div class="col-lg-6 mt-4">
                        <div class="info">
                           <i class="bi bi-envelope"></i>
                           <h4>Email:</h4>
                           <p>gksqls4541@gmail.com</p>
                        </div>
                     </div>
                     <div class="col-lg-6">
                        <div class="info w-100 mt-4">
                           <i class="bi bi-phone"></i>
                           <h4>Call:</h4>
                           <p>+82) 010-7335-3935</p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

         </div>
      </section>
      <!-- End Contact Section -->

   </main>
   <!-- End #main -->
        
   <!-- ======= Footer ======= -->
   <footer id="footer">

      <div class="footer-top">
         <div class="container">
            <div class="row">

               <div class="col-lg-3 col-md-6 footer-contact">
                  <h3>AI.dear</h3>
                  <p>
                     광주광역시<br> 북구 중흥동 279-42<br> 광주국제직업전문학교 <br> <br>
                     <strong>Phone:</strong> 0507-1417-6617<br> <strong>Email:</strong>
                     kukje6123@naver.com<br>
                  </p>
               </div>

               <div class="col-lg-2 col-md-6 footer-links">
                  <h4>Useful Links</h4>
                  <ul>
                     <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
                     <li><i class="bx bx-chevron-right"></i> <a href="#main">Visual</a></li>
                     <li><i class="bx bx-chevron-right"></i> <a href="#about">About</a></li>
                     <li><i class="bx bx-chevron-right"></i> <a href="#services">Services</a></li>
                     <li><i class="bx bx-chevron-right"></i> <a href="#portfolio">Portfolio</a></li>
                     <li><i class="bx bx-chevron-right"></i> <a href="#team">Team</a></li>
                     <li><i class="bx bx-chevron-right"></i> <a href="#contact">Contact</a></li>
                     <!-- <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li> -->
                  </ul>
               </div>
            </div>
         </div>
      </div>

      <div class="container d-md-flex py-4">

         <div class="me-md-auto text-center text-md-start">
            <div class="copyright">
               &copy; Copyright <strong><span>Bethany</span></strong>. All Rights Reserved
            </div>
            <div class="credits">
               <!-- All the links in the footer should remain intact. -->
               <!-- You can delete the links only if you purchased the pro version. -->
               <!-- Licensing information: https://bootstrapmade.com/license/ -->
               <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/bethany-free-onepage-bootstrap-theme/ -->
               Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
            </div>
         </div>
         <div class="social-links text-center text-md-right pt-3 pt-md-0">
            <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
            <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
            <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
            <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
            <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
         </div>
      </div>
   </footer>
   
   <!-- End Footer -->


   <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

   <!-- Vendor JS Files -->
   <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
   <script src="assets/vendor/aos/aos.js"></script>
   <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
   <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
   <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
   <script src="assets/vendor/php-email-form/validate.js"></script>

   <!-- Template Main JS File -->
   <script src="assets/js/main.js"></script>
</body>

</html>