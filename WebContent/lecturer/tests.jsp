<%@page import="db.*"%>
<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />
<div class="card shadow" style="min-height: 88vh;">
	<div class="card-body">
		<h5 class="p-2" style="border-bottom: 2px solid green;">Test Management</h5>
		<div class="container-fluid">
    <div class="row">
        <div class="col-sm-8">
            <h5>Created Test</h5>
            <table class="table table-bordered table-sm table-striped">
                <thead>
                    <tr>                        
                        <th>ID</th>
                        <th>Test Name</th>
                        <th>Subject</th>
                        <th>Created On</th>
                        <th>Submit Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Map<String,String> map : DbConfig.findall("tests", "lecid="+session.getAttribute("id").toString())) { %>   
                    <tr>
                        <td><%= map.get("id") %></td>                        
                        <td><%= map.get("tname") %></td>                        
                        <td><%= OLSHelper.getSubName(map.get("subid")) %></td>
                        <td><%= DbConfig.formatDate(map.get("createdate")) %></td>                        
                        <td><%= DbConfig.formatDate(map.get("submitdate")) %></td>                        
                        <td>
                        <a onclick="return confirm('Are you sure to delete this category ?')" 
                        href="../DelTest?id=<%= map.get("id") %>" class="btn btn-sm btn-danger">Delete</a>
                        <a href="questions.jsp?id=<%= map.get("id") %>" class="btn btn-sm btn-success">Questions</a>
                        <a href="results.jsp?id=<%= map.get("id") %>" class="btn btn-sm btn-info">Details</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <div class="col-sm-4">
            <h5>Create New Test</h5>
            <form action="../CreateTest" method="post">
                <div class="form-group">
                    <label>Test Name</label>
                    <input type="text" name="tname" class="form-control">
                </div>
                <div class="form-group">
                    <label>Select Subject</label> <select name="subid"	class="form-control">
							<option><-- Select Subject --></option>
							<% for(Map<String,String> subs : DbConfig.lectsubs(session.getAttribute("id").toString())) { %>
							<option value="<%= subs.get("subid") %>"><%= subs.get("subname") %></option>
							<% } %>
						</select>
                </div> 
                <div class="form-group">
                    <label>Submit Date</label>
                    <input type="date" id="sdate" name="submitdate" class="form-control">
                </div>            
                <button name="add" class="btn btn-primary btn-block">Create Test</button>
            </form>
        </div>
    </div>
</div>
</div>
</div>
<script>
$(function(){
	document.querySelector("#sdate").min=new Date().toISOString().slice(0, -14);
})

</script>
<jsp:include flush="true" page="footer.jsp" />


