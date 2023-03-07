<%@page import="db.DbConfig"%>
<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />
<div class="card shadow" style="min-height: 88vh;">
	<div class="card-body">
		<h5 class="p-2" style="border-bottom: 2px solid green;">Lecturer Evaluation</h5>
		<div class="container-fluid">
    <div class="row">
        <div class="col-sm-8">
            <table  class="table table-bordered table-striped ">
                <thead>
                    <tr>
                        <th>Lecturer ID</th>
                        <th>Lecturer Name</th>
                        <th>Evaluation</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <% 
                    String rollno=session.getAttribute("id").toString();
                    for(Map<String,String> map : DbConfig.findall("evaluation", "rollno="+rollno)) { %> 
                    <tr>
                        <td><%= map.get("lid") %></td>
                        <td><%= DbConfig.findSingle("lecturer", "lid="+map.get("lid")).get("lname") %>
                        </td>
                        <td>
                        <%
						for(int i=1;i<=5;i++) { 
						if(i<=Integer.parseInt(map.get("eval"))){
						%> <span class="fa fa-star text-warning"></span> 
						<% } else { %> 
						<span
							class="fa fa-star"></span> <% }
						}%>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <div class="col-sm-4">
            <form action="../eval" method="post">
            <div class="form-group">
                <label>Select Lecturer</label>
                <select name="lid" class="form-control">
                    <option><-- Select Lecturer --></option>
                    <% for(Map<String,String> map : DbConfig.studentlects(rollno)){ %>
                    <option value="<%= map.get("lid") %>"><%= map.get("lname") %></option>
                    <% } %>
                </select>
            </div>
            <div class="form-group">
                <label>Select Evaluation</label>
                <select name="eval" class="form-control">
                    <option><-- Select Evaluation --></option>
                    <option value="5">High</option>
                    <option value="4">Above Average</option>
                    <option value="3">Average</option>
                    <option value="1">Below Average</option>
                </select>
            </div>
                <button class="btn btn-danger">Submit Evaluation</button>
            </form>
        </div>
    </div>
</div>
</div>
</div>
<jsp:include flush="true" page="footer.jsp" />

