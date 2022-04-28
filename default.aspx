<%@ Page Language="c#" SmartNavigation="false" 
ValidateRequest="false" EnableEventValidation="false"
EnableViewStateMac="false" EnableViewState="false"
CodeBehind="default.aspx.cs" Async="true" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>
<%@ Import Namespace="System.Collections.Generic" %>

<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="favicon.ico" />
	<style>
		@import url('http://fonts.cdnfonts.com/css/segoe-ui-variable');
		.btn{
			display: flex;
			width: fit-content;
			padding: 5px 20px;
			border: 3px solid white;
			color: white;
			text-decoration: none;
			position: relative;
			z-index: 1;
			margin: 15px;
			font-weight: 600;
    		background: rgba(255, 255, 255, .2);
			transform: skewX(345deg);
		}
		.btn:hover .icon{
			width: 35px;
		}
		.btn .icon {
			letter-spacing: -4px;
			margin: 0 0 0 10px;
			transition: width .5s;
			width: 0;
			overflow: hidden;
		}
		.btn:nth-child(2){
			background: rgba(79, 255, 179, 0.25);
			color: hsl(138deg 100% 50%);
			border: 3px solid hsl(138deg 100% 50%);
		}
		.btn:nth-child(2):before{
			border-color: hsl(138deg 100% 50%);
		}
		.btn:nth-child(3){
			background: rgba(113, 151, 255, 0.25);
			color: #417dff;
			border: 3px solid #417dff;
		}
		.btn:nth-child(3):before{
			border-color: #417dff;
		}
		.btn:before{
			content: '';
			border: 1px solid red;
			width: calc(100% + 5px);
			position: absolute;
			height: calc(100% + 5px);
			top: 3px;
			left: 3px;
			border: 3px solid white;
			border-left: none;
			z-index: 0;
			border-top: none;
		}
		html, body{
			width: 100%;
			height: 100%;
			background: #202020;
			color: white; 
			font-family: 'Segoe UI Variable', sans-serif;
			margin: 0;
			padding: 0;
		}
		.absolute{
			position: absolute;
			top: 0;
			left: 0;
		}
		#content{
			padding: 40px;
		}
		body{			
			font-size: 25px;
		}
		.flex{
			display: flex;
		}
		.start{
			align-items: flex-start;
		}
		.column{
			flex-direction: column;
		}
		.row{
			flex-direction: row;
		}
		.branches{
			height: fit-content;
			width: fit-content;
			padding: 15px;
			margin: 15px;
			z-index: 20;
			border: solid 1px rgb(255 255 255 / 45%);
			border-radius: 5px;
			background: rgba(0, 0, 0, 0.25);
			transition: ease .3s;
			box-shadow: 0px 0px 0px rgb(255 255 255 / 35%);
		}
		.branches:hover{
			box-shadow: 0px 0px 8px 3px rgb(255 255 255 / 35%);
		}
		iframe{
			margin: 30px;
			z-index: 10;
		}
		.app-link{
			text-decoration: none;
			color: white;
			transition: ease .5s;
		}
		.app-link:hover{
			color:#f6f3c6;
		}
	</style>
	<title>Localhost 👽</title>
</head>

<body runat="server" id="bodyDiv">
	<div class="sky">
		<div class="star star-big"></div>
		<div class="star star-small"></div>
	</div>
	<div class="sun">
		<div class="bird"></div>
		<div class="bird"></div>
		<div class="bird"></div>
		<div class="bird"></div>
	</div>
	<div class="front">
		<!-- <iframe src="https://calendar.google.com/calendar/embed?height=500&wkst=2&bgcolor=%23ffffff&ctz=Europe%2FParis&showTz=0&showCalendars=0&showPrint=0&showDate=0&showNav=0&showTitle=0&showTabs=0&mode=WEEK&src=Z3phQGl2YWx1YS5jb20&color=%23039BE5" style="position: absolute; border-width:0" width="700" height="500" frameborder="0" scrolling="no"></iframe> -->
		<div class="left-slope"></div>
		<div class="right-slope"></div>
		<div class="trees">
			<div class="tree tree-mid"></div>
			<div class="tree tree-big"></div>
			<div class="tree tree-mid"></div>
			<div class="tree tree-big"></div>
			<div class="tree tree-mid"></div>
			<div class="tree tree-mid"></div>
			<div class="tree tree-small"></div>
			<div class="tree tree-small"></div>
			<div class="tree tree-mid"></div>
			<div class="tree tree-small"></div>
			<div class="tree tree-small"></div>
			<div class="tree tree-big"></div>
			<div class="tree tree-big"></div>
			<div class="tree tree-mid"></div>
			<div class="tree tree-big"></div>
			<div class="tree tree-mid"></div>
			<div class="tree tree-big"></div>
		</div>
	</div>
	<div class="mountain2">
		<div class="left"></div>
		<div class="right"></div>
	</div>
	<div class="mountain1">
		<div class="left"></div>
		<div class="right"></div>
	</div>

	<div class="flex row absolute" runat="server" id="content">
		<div class="flex column">
		<div class="flex row">
			<div class="flex column branches">
				<div>Cauchies 🐱‍🏍</div>
				<%	
				Dictionary<string, string> items = new Dictionary<string, string>();
				string json = string.Empty;
				using (StreamReader r = new StreamReader("C:/net/config.json"))
				{
					json = r.ReadToEnd();
					var jsonObject = new JavaScriptSerializer();
					items = jsonObject.Deserialize<Dictionary<string, string>>(json);
				}

				var baseDir = "C:\\net";		
				var dirNames = new Regex("D351364", RegexOptions.Compiled | RegexOptions.IgnoreCase);
				var dirsCauchiesFiltered =
				Directory.EnumerateDirectories(baseDir).Where(dir => dirNames.IsMatch(dir)).ToList();
				//DirectoryInfo dir = new DirectoryInfo("c:\\net");
				foreach(string di in dirsCauchiesFiltered){
					var arr = di.Split(new char[]{'_'});
					var version = arr[3];
					%><a target="_blank" class="app-link" href="/<%= di.Split(new char[] {'\\'})[2] %>" ><%= version %></a><%;
				}%>
			</div>
			<div class="flex column branches">
				<div>Main Branches 🐱‍🚀</div><%
				dirNames = new Regex("buyer_demo_V8_\\d{3}_branch", RegexOptions.Compiled | RegexOptions.IgnoreCase);
				var dirsMainFiltered =
				Directory.EnumerateDirectories(baseDir).Where(dir => dirNames.IsMatch(dir)).ToList();
				//DirectoryInfo dir = new DirectoryInfo("c:\\net");
				foreach(string di in dirsMainFiltered){
					var arr = di.Split(new char[]{'_'});
					var version = arr[3];
					%><a target="_blank" class="app-link" href="/<%= di.Split(new char[] {'\\'})[2] %>" ><%= version %></a><%;
				}
				%>
			</div>
			<div class="flex start column branches">
				<div>Other 🐱‍👓</div><%
				dirNames = new Regex("buyer_demo_V8_\\d{3}_D\\d{6}_branch", RegexOptions.Compiled | RegexOptions.IgnoreCase);
				var dirsFiltered =
				Directory.EnumerateDirectories(baseDir).Where(dir => dirNames.IsMatch(dir)).ToList();
				//DirectoryInfo dir = new DirectoryInfo("c:\\net");
				foreach(string di in dirsFiltered){
					if (dirsCauchiesFiltered.Contains(di)) continue;
					var arr = di.Split(new char[]{'_'});
					var dirName = di.Split(new char[] {'\\'})[2];
					var label = dirName.Substring(14, 11);
					if (items.ContainsKey(dirName)){
						label = items[dirName];
					}
					%>
					<a target="_blank" class="app-link" href="/<%= dirName %>" ><%= label %></a><%;
				}
				%>
			</div>
			<div class="useful-links flex column">
				<a class="btn" href="https://docs.google.com/spreadsheets/d/19cBj2qEU_j577IsW1cl8TFmrU0EiyjoJbAm8A7mAhAM/edit#gid=937227506" target="blank">
					<span>Test Environments</span>
					<span class="icon">>></span>
				</a>
				<a class="btn" href="https://docs.google.com/spreadsheets/d/1uBXP2nHJbbaNvbgS2tzSqduYMkeAqZKREAUsvzVKRRM/edit#gid=678834444" target="blank">
					<span>Backlog</span>
					<span class="icon">>></span>
				</a>
				<a class="btn" href="https://project.ivalua.com/page.php/chg/branch_browse?filter_search_string=D351364" target="blank">
					<span>Cauchy Branches</span>
					<span class="icon">>></span>
				</a>
			</div>
		</div>
		<div>
			<!-- <iframe src="https://calendar.google.com/calendar/embed?height=500&wkst=2&bgcolor=%23ffffff&ctz=Europe%2FParis&showTz=0&showCalendars=0&showPrint=0&showDate=0&showNav=0&showTitle=0&showTabs=0&mode=WEEK&src=Z3phQGl2YWx1YS5jb20&color=%23039BE5" style="border-width:0" width="700" height="500" frameborder="0" scrolling="no"></iframe> -->
		</div>
	</div>
		
		<!-- <a class="twitter-timeline" data-lang="fr" data-width="550" data-height="800" data-theme="light" href="https://twitter.com/RERB?ref_src=twsrc%5Etfw">Tweets by RERB</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> -->
	</div>
</body>
</html>
<style>
	:root {
--clr-black: rgba(50, 50, 50, 255);
--clr-sun: rgba(246, 243, 198, 255);
--gradient-bg: linear-gradient(
	180deg,
	rgba(241, 80, 150, 1) 0%,
	rgba(228, 151, 109, 1) 50%
);
--clr-white: rgba(254, 250, 239, 255);
--clr-mountain1: rgba(105, 96, 101, 255);
--clr-mountain2: rgba(140, 138, 160, 255);
}

*,
*::after,
*::before {
margin: 0;
padding: 0;
box-sizing: border-box;
}

body {
min-height: 100vh;
overflow: hidden;
}

.sky {
height: 65vh;
width: 100%;
background: var(--gradient-bg);
}

.front {
display: flex;
position: absolute;
bottom: 0;
height: 50vh;
width: 100%;
z-index: 1;
right: 0;
}

.left-slope,
.right-slope {
flex: 1;
height: 150%;
background-color: var(--clr-black);
}

.left-slope {
transform: skewY(5deg);
}

.right-slope {
transform: skewY(-5deg);
}

.mountain1 > .left,
.mountain1 > .right {
position: absolute;
height: 25vmin;
top: 20vmin;
width: 55vmin;
background-color: var(--clr-mountain1);
}

.mountain1 > .left {
transform-origin: left top;
transform: rotate(35deg);
}

.mountain1 > .right {
right: 0;
transform-origin: right top;
transform: rotate(-35deg);
}

.mountain2 > .left,
.mountain2 > .right {
position: absolute;
height: 10vmin;
top: 25vmin;
width: 90vmin;
background-color: var(--clr-mountain2);
}

.mountain2 > .left {
transform-origin: left top;
transform: rotate(19deg);
}

.mountain2 > .right {
right: 0;
transform-origin: right top;
transform: rotate(-19deg);
}

.sun {
height: 55vmin;
aspect-ratio: 1;
position: absolute;
left: 50%;
top: 40%;
background-color: var(--clr-sun);
border-radius: 50%;
transform: translate(-50%, -40%);
box-shadow: 0 0 0 2.5vmin rgba(246, 243, 198, 0.1),
	0 0 0 5vmin rgba(246, 243, 198, 0.1);
}

.trees {
position: absolute;
width: 100%;
}

.tree {
position: absolute;
bottom: 0;
display: inline-block;
width: 0;
height: 0;
border-style: solid;
border-color: transparent transparent var(--clr-black) transparent;
}

.tree-big {
border-width: 0 10vmin 25vmin 10vmin;
}

.tree-small {
border-width: 0 5vmin 15vmin 5vmin;
}
.tree-mid {
border-width: 0 8vmin 18vmin 8vmin;
}

.tree:nth-child(1) {
left: 1vmin;
}

.tree:nth-child(2) {
left: 7vmin;
}

.tree:nth-child(3) {
left: 30vmin;
transform: translateY(5vmin);
}

.tree:nth-child(4) {
left: 35vmin;
transform: translateY(5vmin);
}

.tree:nth-child(5) {
left: 47vmin;
transform: translateY(5vmin) scaleX(0.8);
}
.tree:nth-child(6) {
left: 70vmin;
transform: translateY(8vmin) scaleX(0.8);
}
.tree:nth-child(7) {
left: 80vmin;
transform: translateY(10vmin);
}
.tree:nth-child(8) {
left: 87vmin;
transform: translateY(10vmin) scaleX(0.6);
}
.tree:nth-child(9) {
left: 110vmin;
transform: translateY(10vmin) scaleX(0.8);
}
.tree:nth-child(10) {
left: 120vmin;
transform: translateY(5vmin) scaleX(0.6);
}
.tree:nth-child(11) {
left: 125vmin;
transform: translateY(7vmin) scaleX(0.6);
}
.tree:nth-child(12) {
left: 135vmin;
transform: translateY(8vmin) scaleX(0.8);
}
.tree:nth-child(13) {
left: 145vmin;
transform: translateY(6vmin) scaleX(0.8);
}
.tree:nth-child(14) {
left: 155vmin;
transform: translateY(3vmin) scaleX(0.8);
}
.tree:nth-child(15) {
left: 158vmin;
transform: translateY(5vmin) scaleX(0.8);
}
.tree:nth-child(16) {
left: 175vmin;
transform: translateY(3vmin) scaleX(0.8);
}
.tree:nth-child(17) {
left: 180vmin;
transform: translateY(5vmin) scaleX(0.8);
}

.star {
position: absolute;
aspect-ratio: 1;
border-radius: 50%;
background-color: transparent;
}

.star-small {
height: 0.5vmin;
box-shadow: 7vmin 6vmin 0 var(--clr-white), 23vmin 12vmin 0 var(--clr-white),
	20vmin 26vmin 0 var(--clr-white), 35vmin 4vmin 0 var(--clr-white),
	45vmin 16vmin 0 var(--clr-white), 54vmin 26vmin 0 var(--clr-white),
	70vmin 7vmin 0 var(--clr-white), 105vmin 2vmin 0 var(--clr-white),
	126vmin 11vmin 0 var(--clr-white), 146vmin 28vmin 0 var(--clr-white),
	185vmin 7vmin 0 var(--clr-white), 165vmin 5vmin 0 var(--clr-white),
	177vmin 26vmin 0 var(--clr-white), 153vmin 17vmin 0 var(--clr-white);
}

.star-big {
height: 0.7vmin;
box-shadow: 8vmin 20vmin 0 var(--clr-white), 34vmin 28vmin 0 var(--clr-white),
	62vmin 36vmin 0 var(--clr-white), 135vmin 37vmin 0 var(--clr-white),
	139vmin 7vmin 0 var(--clr-white), 165vmin 23vmin 0 var(--clr-white);
}

.bird {
position: absolute;
top: 18vmin;
left: 22vmin;
background-color: var(--clr-sun);
height: 5vmin;
aspect-ratio: 1;
border-radius: 50%;
box-shadow: inset 0 1vmin 0 -1px var(--clr-black);
transform: rotate(-20deg) scale(0.7);
}

.bird::after {
content: "";
position: absolute;
top: 0;
left: 100%;
background-color: var(--clr-sun);
height: 5vmin;
aspect-ratio: 1;
border-radius: 50%;
box-shadow: inset 0 1vmin 0 -1px var(--clr-black);
}

.bird:nth-child(1) {
top: 22vmin;
left: 30vmin;
transform: rotate(10deg) scale(0.6);
}

.bird:nth-child(2) {
top: 26vmin;
left: 24vmin;
transform: rotate(-10deg) scale(0.4);
}
.bird:nth-child(3) {
top: 29vmin;
left: 29vmin;
transform: rotate(-10deg) scale(0.4);
}
</style>
