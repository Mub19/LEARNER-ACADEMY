<%@page import="db.OLSHelper"%>
<%@page import="db.DbConfig"%>
<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />
<div class="card shadow" style="min-height: 88vh;">
	<div class="card-body">
		<h5 class="p-2" style="border-bottom: 2px solid green;">Test Result for Test : </h5>
		<div class="container-fluid">
			<table class="table table-bordered table-striped table-sm ">
				<thead class="table-dark">
					<tr>
						<th>Roll no</th>
						<th>Student Name</th>
						<th>Total</th>
						<th>Correct</th>
						<th>Result</th>
						<th>Submit Date</th>
					</tr>
				</thead>
				<tbody>
					<%
					String tid=request.getParameter("id");
					for (Map<String,String> map : DbConfig.findall("results","tid="+tid)) { 
					%>
					<tr>
						<td><%= map.get("rollno") %></td>
						<td><%= OLSHelper.getStudentName(map.get("rollno")) %></td>
						<td><%= map.get("total") %></td>
						<td><%= map.get("correct") %></td>
						<td><%= map.get("result") %></td>
						<td><%= DbConfig.formatDate(map.get("submitdate")) %></td>								
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />

