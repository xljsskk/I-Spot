<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
        import="edu.neu.cs5200.ispot.dao.*,edu.neu.cs5200.ispot.model.*,java.util.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Comment Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js">
</script>

	<%
		CommentDAO comment_dao = new CommentDAO();
		InformationDAO info_dao = new InformationDAO();
		
		String idStr1 = request.getParameter("commentid");		
 		String action = request.getParameter("action");

		 if("delete".equals(action))
			{
				
				Integer comment_id = Integer.parseInt(idStr1);
				comment_dao.deleteComment(comment_id);
				%>
				<%-- <script>window.location= "User_Comment.jsp?id=<%= user.getId() %>";</script> --%>
				<% 
			} 
		
		List<Comment> comments = comment_dao.readAllComments();
		 
	
	%>
	<div class="container">		
		<h2>Comments</h2>
		
		<form action="User_Comment.jsp">
		<table class="table table-striped">
			<tr>
				<th>Spot</th>
				<th>Information</th>
				<th>Comment</th>
				<th>&nbsp;</th>
			</tr>

		<%
			for(Comment comment : comments)
			{
		%>	<tr>
				<td><%= comment.getInfo().getSpot().getLocationname() %></td>
				<td><%= comment.getInfo().getContent() %></td>
				<td><%= comment.getContent() %></td>
				<td>
					<a href="User_Comment.jsp?action=delete&commentid=<%= comment.getId() %>" class="btn btn-danger">Delete</a>
				</td>
			</tr>
		<%
			}
		%>
		</table>
		</form>
	</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js">
</script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js">
</script>
</body>
</html>