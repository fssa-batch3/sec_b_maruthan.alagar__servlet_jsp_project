<%@ page isErrorPage="true"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isErrorPage="true"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<link rel="icon" type="image/x-icon" href="https://iili.io/J9AdFF1.png">
<meta charset="utf-8">

<title>500 Internal Server Error :(</title>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	outline: none;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	height: 100vh;
	background-color: rgba(235, 231, 228, 255);
}

#error-page {
	position: absolute;
	top: 10%;
	left: 15%;
	right: 15%;
	bottom: 10%;
	display: flex;
	align-items: center;
	justify-content: center;
	background: rgba(235, 231, 228, 255);
}

#error-page .content {
	max-width: 600px;
	text-align: center;
}

.content h2.header {
	font-size: 18vw;
	line-height: 1em;
	position: relative;
}

.content h2.header:after {
	position: absolute;
	content: attr(data-text);
	top: 0;
	left: 0;
	right: 0;
	background-color: black;
	background-size: 400%;
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.content h4 {
	font-size: 1.5em;
	margin-bottom: 20px;
	text-transform: uppercase;
	color: #000;
	font-size: 2em;
	max-width: 600px;
	position: relative;
}

.content h4:after {
	position: absolute;
	content: attr(data-text);
	top: 0;
	left: 0;
	right: 0;
	text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.4);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.content p {
	font-size: 1.2em;
	color: #0d0d0d;
}

.content .btns {
	margin: 25px 0;
	display: inline-flex;
}

.content .btns a {
	display: inline-block;
	margin: 0 10px;
	text-decoration: none;
	border: 2px solid lightblue;
	color: #lightblue;
	font-weight: 500;
	padding: 10px 25px;
	border-radius: 25px;
	text-transform: uppercase;
	transition: all 0.3s ease;
}

.content .btns a:hover {
	background: lightblue;
	color: #black;
}
#logo_div{
display:flex;
}
</style>

</head>
<body>
	<div id="error-page">
		<div class="content">
			<h2 class="header" data-text="500">500</h2>
			<div id="logo_div">
			<img class="logo" src="https://iili.io/J9AdFF1.png" alt="logo" width="110px">
			<h4 data-text="Opps! Page not found">Oops! Internal Server Error</h4>
			<img class="logo" src="https://iili.io/J9AdFF1.png" alt="logo" width="110px">
			</div>
			<p>Sorry, we're experiencing technical difficulties. Please try again later.</p>
			<div class="btns">
				<a href="<%=request.getContextPath()%>/login.jsp">Return to
					Login</a>
				<%--  <a href="<%=request.getContextPath()%>">report problem</a> --%>
			</div>
		</div>
	</div>
</body>
</html>