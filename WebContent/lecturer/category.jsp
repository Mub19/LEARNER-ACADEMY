<%@page import="db.DbConfig"%>
<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />
<div class="card shadow" style="min-height: 88vh;">
	<div class="card-body">
		<h5 class="p-2" style="border-bottom: 2px solid green;">Category Management</h5>
		<div class="container-fluid">
    <div class="row">
        <div class="col-sm-8">
            <h5>Created Categories</h5>
            <table class="table table-bordered table-sm table-striped">
                <thead>
                    <tr>                        
                        <th>Category ID</th>
                        <th>Category Name</th>
                        <th>Operation</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Map<String,String> map : DbConfig.findall("matcat", "lid="+session.getAttribute("id").toString())) { %>   
                    <tr>
                        <td><%= map.get("catid") %></td>                        
                        <td><%= map.get("catname") %></td>                        
                        <td><a onclick="return confirm('Are you sure to delete this category ?')" 
                        href="../DelCat?catid=<%= map.get("catid") %>" class="btn btn-sm btn-danger">Delete</a></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <div class="col-sm-4">
            <h5>Add Category</h5>
            <form action="../CreateCat" method="post">
                <div class="form-group">
                    <label>Category Name</label>
                    <input type="text" name="catname" class="form-control">
                </div>                
                <button name="add" class="btn btn-primary btn-block">Create Category</button>
            </form>
        </div>
    </div>
</div>
</div>
</div>
<jsp:include flush="true" page="footer.jsp" />


