<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="persistance.DatabaseManager"%>
<%@page import="model.Canzone"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page session="true"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html><html lang='en' class=''>
<head><script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script><script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script><script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/letea/pen/egmazy?limit=all&page=44&q=sketch" />

<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css'><link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:100,400'>
<style class="cp-pen-styles">@import url("https://fonts.googleapis.com/css?family=Roboto");
body {
  margin: 0;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  min-height: 100vh;
  font-family: 'Roboto', sans-serif;
  color: #8D8D8D;
  background: #FAF5FF;
}

.music-player {
  -ms-flex-item-align: center;
      -ms-grid-row-align: center;
      align-self: center;
  margin: auto;
  display: block;
  width: 472px;
  height: 515px;
  border-radius: 6px;
  overflow: hidden;
}

.player-main {
  position: relative;
  width: 100%;
  min-width: 472px;
  padding: 24px;
  box-sizing: border-box;
  background-color: rgba(230, 219, 241, 0.8);
}

.main-current {
  margin-bottom: 36px;
}
.main-current .current-keyvisual {
  position: relative;
  display: inline-block;
}
.main-current .current-keyvisual img {
  position: relative;
  z-index: 2;
  width: 132px;
  height: auto;
  border-radius: 4px;
}
.main-current .current-keyvisual:before {
  content: '';
  display: block;
  position: absolute;
  bottom: 0;
  right: 0;
  z-index: 1;
  width: 95%;
  height: 80%;
  background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/329679/music-player-freebie-photo.png);
  background-size: cover;
  -webkit-filter: blur(35px);
          filter: blur(35px);
}
.main-current .current-info {
  display: inline-block;
  padding: 15px 0 0 24px;
  box-sizing: content-box;
  vertical-align: top;
}
.main-current .current-info h1, .main-current .current-info p {
  margin: auto;
  padding: 0;
}
.main-current .current-info h1 {
  margin-bottom: 13px;
  font-size: 20px;
  color: #26107B;
}
.main-current .current-info p {
  font-size: 12px;
  color: #26107B;
}

.main-control {
  position: relative;
  line-height: 0;
}
.main-control .btn {
  display: inline-block;
  width: 30px;
  height: 25px;
  vertical-align: middle;
  background-size: auto 100%;
  background-repeat: no-repeat;
  background-position: center center;
  cursor: pointer;
  opacity: .75;
}
.main-control .btn:hover {
  opacity: 1;
}
.main-control .btn._previous {
  margin-right: 17px;
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/329679/music-player-freebie-previous.svg");
  background-size: auto 80%;
}
.main-control .btn._pause {
  margin-right: 17px;
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/329679/music-player-freebie-pause.svg");
}
.main-control .btn._next {
  margin-right: 24px;
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/329679/music-player-freebie-next.svg");
  background-size: auto 80%;
}
.main-control .btn._timeline {
  vertical-align: middle;
  height: auto;
  width: auto;
  opacity: 1;
}
.main-control .btn._timeline > span {
  display: inline-block;
  vertical-align: middle;
  font-size: 12px;
  color: #26107B;
}
.main-control .btn._timeline > span.timescope {
  position: relative;
  margin: auto 12px;
  width: 180px;
  height: 3px;
  border-radius: 20px;
}
.main-control .btn._timeline > span.timescope:before, .main-control .btn._timeline > span.timescope:after,
.main-control .btn._timeline > span.timescope .timescope-dot {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 0;
  height: 100%;
  background-color: #26107B;
  cursor: pointer;
  z-index: 1;
}
.main-control .btn._timeline > span.timescope:before {
  width: 100%;
  opacity: .2;
}
.main-control .btn._timeline > span.timescope:after {
  width: 63%;
}
.main-control .btn._timeline > span.timescope .timescope-dot {
  top: -2.5px;
  left: 63%;
  z-index: 3;
  width: 8px;
  height: 8px;
  border-radius: 100%;
}

.player-list {
  margin: auto;
  min-width: 472px;
  padding: 24px;
  background: #fff;
  list-style: none;
}
.player-list li {
  margin-bottom: 18px;
  cursor: pointer;
}
.player-list li .list-cover,
.player-list li .list-info {
  display: inline-block;
  vertical-align: middle;
}
.player-list li .list-cover.list-cover,
.player-list li .list-info.list-cover {
  margin-right: 9px;
  width: 39px;
  height: auto;
  border-radius: 100%;
}
.player-list li .list-cover.list-info .info-title,
.player-list li .list-info.list-info .info-title {
  margin-bottom: 3px;
  font-size: 12px;
  color: #8D8D8D;
}
.player-list li .list-cover.list-info .info-artist,
.player-list li .list-info.list-info .info-artist {
  font-size: 10px;
  color: #cdcdcd;
}
.player-list li:last-child {
  margin-bottom: 0;
}
</style></head><body>
<div class="music-player">
  <div class="player-main">
    <div class="main-current">
      <div class="current-keyvisual">
        <img src="https://static2.greatsong.net/artiste/96x96/luciano-ligabue-999922801.jpg" />
      </div>
      <div class="current-info">
      <% 
      
  	



		
			List<Canzone> item = DatabaseManager.getInstance().getDaoFactory().getCanzoneDao().findCanzone("Urlando contro il cielo");
		
      
      out.print(  "<h1>" + item.get(1).getArtista().getNomeArtista() + " " + item.get(1).getTitolo() +"</h1>");
   
      
      
      
      %>
      </div>
    </div>
    <div class="main-control">
      <div class="btn _previous">
      </div>
      <div class="btn _pause">
      </div>
      <div class="btn _next">
      </div>
      <div class="btn _timeline">
        <span class="current-time">2:32</span>
        <span class="timescope">
          <span class="timescope-dot"></span>
        </span>
        <span class="end-time">4:00</span>
      </div>
    </div>
  </div>
  <ul class="player-list">
    <li>
      <img 
        class="list-cover"
        src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/329679/music-player-freebie-a1.png"
      />
      <div class="list-info">
        <div class="info-title">One Step At A Time</div>
        <div class="info-artist">BEARSON</div>
      </div>
    </li>
    <li>
      <img 
        class="list-cover"
        src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/329679/music-player-freebie-a2.png"
      />
      <div class="list-info">
        <div class="info-title">Sunset Lover</div>
        <div class="info-artist">PETIT BISCUIT</div>
      </div>
    </li>
    <li>
      <img 
        class="list-cover"
        src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/329679/music-player-freebie-a3.png"
      />
      <div class="list-info">
        <div class="info-title">Youth</div>
        <div class="info-artist">TROYE SIVAN</div>
      </div>
    </li>
    <li>
      <img 
        class="list-cover"
        src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/329679/music-player-freebie-a4.png"
      />
      <div class="list-info">
        <div class="info-title">Working Girl</div>
        <div class="info-artist">LITTLE BOOTS</div>
      </div>
    </li>
  </ul>
</div>





</body>
</html>