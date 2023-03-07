<%@page import="db.DbConfig"%>
<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />

<div class="card shadow" style="min-height: 88vh;">
	<div class="card-body">
		<button class="btn btn-primary btn-sm float-right mb-2"
			data-target="#madd" data-toggle="modal">Add New</button>
		<h5 class="p-2" style="border-bottom: 2px solid green;">Questions for Test </h5>

					<table class="table table-bordered table-sm">
						<thead>
							<tr>
								<th>ID</th>
								<th>Questions</th>
								<th>Choices</th>
								<th>Answer</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<% for(Map<String,String> map : DbConfig.findall("questions", "tid="+request.getParameter("id"))) { %>
							<tr>
								<td><%= map.get("id") %></td>
								<td><%= map.get("descr") %></td>
								<td>
								<ol style="list-style-type:upper-alpha;margin-left:20px;">
									<li><%= map.get("ch1") %></li>
									<li><%= map.get("ch2") %></li>
									<li><%= map.get("ch3") %></li>
									<li><%= map.get("ch4") %></li>
								</ol>
								</td>
								<td><%= map.get("ans") %></td>
								<td><a
									onclick="return confirm('Are you sure to delete this question ?')"
									href="../DelQues?id=<%= map.get("id") %>&tid=<%= request.getParameter("id") %>"
									class="btn btn-danger btn-sm">Delete</a></td>
							</tr>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
<div id="madd" class="modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="../AddQuestion">
				<div class="modal-header">
					<h5 class="text-dark">Add New Question</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
				<input type="hidden" name="tid" value="${param.id }">
					<div class="form-group">
						<label>Question</label> <input type="text" name="descr"
							class="form-control">
					</div>
					<div class="form-group">
						<label>Choice A</label> <input type="text" name="ch1"
							class="form-control">
					</div>
					<div class="form-group">
						<label>Choice B</label> <input type="text" name="ch2"
							class="form-control">
					</div>
					<div class="form-group">
						<label>Choice C</label> <input type="text" name="ch3"
							class="form-control">
					</div>
					<div class="form-group">
						<label>Choice D</label> <input type="text" name="ch4"
							class="form-control">
					</div>
					<div class="form-group">
						<label>Correct Answer</label> <select name="ans"
							class="form-control">
							<option>A</option>
							<option>B</option>
							<option>C</option>
							<option>D</option>
							</select>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary btn-sm">Save Question</button>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />