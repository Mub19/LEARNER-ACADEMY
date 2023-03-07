<%@page import="db.DbConfig"%>
<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />

<div class="card shadow" style="min-height: 88vh;">
	<div class="card-body">
		<button class="btn btn-primary btn-sm float-right mb-2"
			data-target="#madd" data-toggle="modal">Upload Material</button>
		<h5 class="p-2" style="border-bottom: 2px solid green;">Material
			Management</h5>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-10">
					<table class="table table-bordered table-sm">
						<thead>
							<tr>
								<th>Material ID</th>
								<th>Subject</th>
								<th>Category</th>
								<th>File Name</th>
								<th>Operation</th>
							</tr>
						</thead>
						<tbody>
							<% for(Map<String,String> map : DbConfig.findall("material", "lid="+session.getAttribute("id").toString())) { %>
							<tr>
								<td><%= map.get("matid") %></td>
								<td><%= DbConfig.findSingle("subjects", "subid="+map.get("subid")).get("subname")%>
								</td>
								<td><%= DbConfig.findSingle("matcat", "catid="+map.get("catid")).get("catname")%>
								</td>
								<td><%= map.get("filename") %></td>
								<td><a href="../content/<%= map.get("filename") %>"
									download class="btn btn-success btn-sm">Download</a> <a
									href="../content/<%= map.get("filename") %>" target="blank"
									class="btn btn-primary btn-sm">View</a> <a
									onclick="return confirm('Are you sure to delete this material ?')"
									href="../DelMat?matid=<%= map.get("matid") %>"
									class="btn btn-danger btn-sm">Delete</a></td>
							</tr>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
</div>
<div id="madd" class="modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="../UploadMat"
				enctype="multipart/form-data">
				<div class="modal-header">
					<h5 class="text-dark">Upload New Material</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Select Subject</label> <select name="subid"
							class="form-control">
							<option><-- Select Subject --></option>
							<% for(Map<String,String> subs : DbConfig.lectsubs(session.getAttribute("id").toString())) { %>
							<option value="<%= subs.get("subid") %>"><%= subs.get("subname") %></option>
							<% } %>
						</select>
					</div>
					<div class="form-group">
						<label>Select Category</label> <select name="catid"
							class="form-control">
							<option><-- Select Category --></option>
							<% for(Map<String,String> map : DbConfig.findall("matcat", "lid="+session.getAttribute("id").toString())) { %>
							<option value="<%= map.get("catid") %>"><%= map.get("catname") %></option>
							<% } %>
						</select>
					</div>
					<div class="form-group">
						<label>Select Material</label> <input type="file" name="material"
							class="form-control-file" accept=".jpg,.pdf,.doc,.docx,.mp4">
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary btn-sm">Upload Material</button>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />