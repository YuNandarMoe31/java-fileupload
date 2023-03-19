<%@page import="com.jdc.upload.Sale"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>File Upload</title>
</head>
<style>
body {
	margin: 0;
	min-height: 100vh;
	padding: 4rem;
}

table {
	width: 80%;
	border-collapse: collapse;
}

table, tr, td, th {
	border: 1px solid gray;
}

.photos {
	margin-top: 1rem;
	display: flex;
	flex-wrap: wrap;
}

.photos img {
	margin-right: 1rem;
	margin-bottom: 1rem;
	width: 280px;
}
</style>
<body>
	<h1>FileUpload</h1>
	<form method="post" enctype="multipart/form-data" action="upload">
		<label>Select File</label> <input type="file" name="uploadFile" />
		<button type="submit">Upload</button>
	</form>
	<%
	@SuppressWarnings("unchecked")
	List<Sale> list = (List<Sale>) request.getAttribute("");

	if (null != list && list.isEmpty()) {
	%>
	<table>
		<thead>
			<tr>
				<th>Category</th>
				<th>Product</th>
				<th>Price</th>
				<th>Count</th>
				<th>Total</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Sale s : list) {
			%>
			<tr>
				<td><%=s.getCategory()%></td>
				<td><%=s.getProduct()%></td>
				<td><%=s.getPrice()%></td>
				<td><%=s.getCount()%></td>
				<td><%=s.getTotal()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	}
	%>
	<hr />
	<h3>Image Upload</h3>

	<form action="image-upload" enctype="multipart/form-data" method="post">
		<label>Photo</label> <input type="file" accept="image/*"
			multiple="multiple" name="imageFile" />
		<button type="submit">Upload</button>
	</form>

	<div class="photos">
		<%
		if (null != request.getAttribute("photos")) {
			@SuppressWarnings("unchecked")
			List<String> photos = (List<String>) request.getAttribute("photos");

			for (String photo : photos) {
		%>
			<img src="<%= getImagePath(photo) %>">
	
		<%
		}
		}
		%>
	</div>

	<%!String getImagePath(String image) {
		return getServletContext().getContextPath().concat("/images/").concat(image);
	}%>
	
	<hr />
	
	<h3>Download Demo</h3>
	
	<a href="download">Download File</a>
</body>
</html>