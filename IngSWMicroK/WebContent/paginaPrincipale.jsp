<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="persistance.DatabaseManager"%>
<%@page import="model.Canzone"%>
<%@page import="model.Artista"%>
<%@page import="persistence.dao.ArtistaDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page session="true"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>--MicroK--MusicStore--</title>
<script src="bootstrap-4.1.3//js/bootstrap.min.js"></script>
 <script src="js/jquery-3.3.1.min.js"></script>

<script type="text/javascript" src="js/prova.js"></script>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/searchbar.css" rel="stylesheet" type="text/css">

<link href="css/simple-sidebar.css" rel="stylesheet">

<link href="css/searchbar.css" rel="stylesheet" type="text/css">


<link rel="stylesheet" type="text/css"
	href="styles/bootstrap-4.1.2/bootstrap.min.css">
	
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="plugins/OwlCarousel2-2.3.4/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="plugins/OwlCarousel2-2.3.4/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="plugins/OwlCarousel2-2.3.4/animate.css">
<link rel="stylesheet" type="text/css" href="styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="styles/responsive.css">

</head>
<body style="background-color: #313947 ; color: white; ">
	<c:if test="${username != null}">
	

 <!-- inizio navbar -->
 <div class="row">
  <nav class="navbar navbar-light bg-light fixed-top">
   <a class="scritta navbar-brand" style="color:#387044" >MicroK</a>
   <div class="container">
    
    <form action="search" method="post" class="form-inline m-auto">
    
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search"  > 
			<button class="btn btn-outline-success my-20 my-sm-10" type="submit">Search</button>
    </form>
    <form class="form-inline m-5" action="">
					<button class="transparentButton" onclick="location.href='carrello.jsp'">
						<i class="fa fa-shopping-cart prefix white-text active"></i>
					</button>
				</form>
    <form>
     <div class="pull-left">
      <ul class="nav navbar-nav">
     
     <p>Benvenuto ${username}</p>
     
   <li><button  type="button"  onclick="location.href='logout?logout=true' " class="btn navbar-btn btn-danger"  value="Log Out">Log Out</button></li>
        
      </ul>
     </div>
    </form>
   </div>
  </nav>
 </div>
 <!-- fine navbar -->
	

<div style="height:150px"></div>

	<div>
		<div class="col-sm-2" style="background-color:#2d3542 ">
			<ul class="sidebar-nav">
				    <li class="sidebar-brand"><a href="#">Home</a></li>
    				<li><a href="profilo.jsp">Profilo</a></li>
    				<li><a href="#Catalogo">Catalogo Musicale</a></li>
    				<li><a href="#Libreria">Libreria</a></li>
			</ul>
		</div>
		
		<div class="col-sm-10">
				   <section id="Catalogo"style="padding-left: 300px ; padding-top:0px">
					    <div class="container">
					    	 <div class="row" id="result2">
						
					 <%/*
					 List<Canzone> categories = DatabaseManager.getInstance().getDaoFactory().getCanzoneDao().findAll();
					 ArtistaDao A=DatabaseManager.getInstance().getDaoFactory().getArtistaDAO();
						    for (Canzone song : categories) {
							     Artista a=A.findByName(song.getArtista().getNomeArtista());
							     out.println("<div class=\"col-sm-3 text-center\">"+"<img class=\"copertina\" alt=\"\" src=\""+a.getPathImage()+"\"><p>" + song.getTitolo() 
							     + " </p><h2>"+ song.getArtista().getNomeArtista() +"</h3>" +"<p>"+song.getGenere()+"</p>"+"<a href=\"addToCart?id=" + (song.getIdCanzone())
							     + "&from=paginaPrincipale.jsp\" >"+"<i class=\"fa fa-shopping-cart\"></i>Add to cart</a></div>");
						       }*/
					  %>
				
					   </div>
					  </div>
					 
					  
					 </section>

<!--  
 <div id="demo">
  <button  type="button"  onclick="prova()" class="btn navbar-btn btn-danger"  value="Log Out">Prova</button>
 </div>
 <div>
 <button onclick="numbers.forEach(myFunction)">Try it</button>
<p>Prova


</p>

<c:forEach items="${listSong}" var="canzone" >
	<p>titolo= ${canzone.titolo}</p>
	<p>Genere= ${canzone.genere}</p>
	<p>Anno= ${canzone.anno}</p>
</c:forEach>


 </div>
 -->
 <section id="Libreria" style="padding-left: 250px">
  <!--  <div class="featured">-->
   <div class="container">
    <div class="row">
     <div class="col">
      <div class="section_title text-center">
      <p id="demo5"></p>
       <h1>PLAYLIST PER GENERE</h1>
      </div>
      <div class="featured_list">
       <div id="jplayer_2" class="jp-jplayer"></div>
       <div id="jp_container_2" class="jp-audio" role="application"
        aria-label="media player">
        <div class="jp-type-playlist">
         <div class="jp-playlist">
          <ul
           class="d-flex flex-row align-items-start justify-content-start flex-wrap">
           <li></li>
          </ul>
         </div>
         <div class="jp-no-solution">
          <span>Update Required</span> To play the media you will need
          to either update your browser to a recent version or update
          your <a href="http://get.adobe.com/flashplayer/"
           target="_blank">Flash plugin</a>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
  <!-- </div> -->
 </section>
 
 
 


	
	</div>
	</div>
	
	 <div id = "lettore">
  
<div class="song" style="background-color: #2d3542">
   <div class="parallax_background parallax-window"></div>
   <div class="container">
    <div class="row">
     <div class="col">
      <div class="song_content">

       <!-- Player -->
       <div class="single_player_container">
        <div
         class="single_player d-flex flex-row align-items-center justify-content-start">
         <div id="jplayer_1" class="jp-jplayer"></div>
         <div id="jp_container_1" class="jp-audio" role="application"
          aria-label="media player">
          <div
           class="jp-gui jp-interface d-flex flex-lg-row flex-column align-items-start justify-content-start">

           <!-- Player Controls -->
           <div
            class="player_controls_box d-flex flex-row align-items-start justify-content-start">
            <div class="order-lg-1 order-2">
             <div class="player_title">Canzone della settimana</div>
             <div
              class="jp-controls-holder player_controls ml-auto d-flex flex-row align-items-start justify-content-start">
              <button class="jp-play player_button" tabindex="0"></button>
              <button class="jp-stop player_button" tabindex="0"></button>
             </div>
            </div>
            <div class="song_image ml-lg-auto order-lg-2 order-1">
             <img src="assets/artists/Caparezza.jpg" alt="">
            </div>
           </div>

           <!-- Progress Bar -->
           <div
            class="player_bars d-flex flex-row align-items-start justify-content-start">
            <div class="player_progress_box">
             <div class="jp-current-time" role="timer" aria-label="time">00:00</div>
             <div class="song_info">
              <div class="jp-artist" aria-label="title">Caparezza</div>
              <div class="jp-title" aria-label="title"></div>
             </div>
             <div class="jp-progress">
              <div class="jp-seek-bar">
               <div>
                <div class="jp-play-bar">
                 <span></span>
                </div>
               </div>
              </div>
             </div>
             <div class="jp-duration ml-auto" role="timer"
              aria-label="duration">02:33</div>
            </div>

            <!-- Volume Controls -->
            <div class="jp-volume-controls ml-lg-auto">
             <div class="mute_button">
              <button class="jp-mute" tabindex="0"></button>
             </div>
             <div
              class="d-flex flex-row align-items-center justify-content-start">
              <div class="jp-volume-bar">
               <div>
                <div class="jp-volume-bar-value"></div>
               </div>
              </div>
             </div>
            </div>
           </div>

          </div>
          <div class="jp-no-solution">
           <span>Update Required</span> To play the media you will need
           to either update your browser to a recent version or update
           your <a href="http://get.adobe.com/flashplayer/"
            target="_blank">Flash plugin</a>
          </div>
         </div>
        </div>
       </div>

      </div>
     </div>
    </div>
   </div>
  </div>
  

  
  </div>
	
</c:if>
				<c:if test="${username == null}">
			<!--  <meta http-equiv="Refresh" content="0; http://192.168.43.197:8080/IngSWMicroK/Home.html"/> -->
				<meta http-equiv="Refresh" content="0; http://locahost:8080/IngSWMicroK/index.html"/>
				</c:if>	
				
			<!-- Bootstrap core JavaScript -->
 <script src="vendor/jquery/jquery.min.js"></script>
 <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 <script src="vendor/jquery/jquery.min.js"></script>
 <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

 <script src="styles/bootstrap-4.1.2/popper.js"></script>
 <script src="styles/bootstrap-4.1.2/bootstrap.min.js"></script>
 <script src="plugins/greensock/TweenMax.min.js"></script>
 <script src="plugins/greensock/TimelineMax.min.js"></script>
 <script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
 <script src="plugins/greensock/animation.gsap.min.js"></script>
 <script src="plugins/greensock/ScrollToPlugin.min.js"></script>
 <script src="plugins/OwlCarousel2-2.3.4/owl.carousel.js"></script>
 <script src="plugins/jPlayer/jquery.jplayer.min.js"></script>
 <script src="plugins/jPlayer/jplayer.playlist.min.js"></script>
 <script src="plugins/easing/easing.js"></script>
 <script src="plugins/progressbar/progressbar.min.js"></script>
 <script src="plugins/parallax-js-master/parallax.min.js"></script>
 <script src="plugins/scrollTo/jquery.scrollTo.min.js"></script>
 <script src="js/custom.js"></script>	
			<script src="js/addCart.js"></script>
				
</body>
<footer>

</footer>

</html>