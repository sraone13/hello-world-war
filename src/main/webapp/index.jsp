<html>
<head>
<title>Hello World!</title>
</head>
<body>
	<h1>Sravan app second time</h1>
	<h1> This app is deployed in tomcate</h1>
	<p>
		It is now
		<%= new java.util.Date() %></p>
	<p>
		You are coming from 
		<%= request.getRemoteAddr()  %></p>
</body>
