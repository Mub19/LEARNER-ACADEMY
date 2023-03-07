<%@page import="db.DbConfig"%>
<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />
<div class="card shadow" style="min-height: 88vh;">
	<div class="card-body">
	<h5 class="p-2" style="border-bottom: 2px solid green;">Assign Subject to Lecturer</h5>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-8">
            <h5>Assigned Subjects to Lecturers</h5>
            <table class="table table-bordered table-sm table-striped">
                <thead>
                    <tr>
                        <th>Lecturer ID</th>
                        <th>Lecturer Name</th>
                        <th>Subject ID</th>
                        <th>Subject Name</th>
                        <th>Operation</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Map<String, String> map : DbConfig.allRecords("lecsub")) {%>                    
                    <tr>
                        <td><%= map.get("lid")%></td>
                        <td>
                            <%
                                Map<String, String> lec = DbConfig.findSingle("lecturer", "lid='" + map.get("lid") + "'");
                            %><%= lec.get("lname")%>
                        </td>
                        <td><%= map.get("subid")%></td>
                        <td>
                            <%
                                Map<String, String> cls = DbConfig.findSingle("subjects", "subid='" + map.get("subid") + "'");
                            %><%= cls.get("subname")%>
                        </td>
                        <td><a onclick="return confirm('Are you sure to delete this assignment?')" 
                               href="../delassign?subid=<%= map.get("subid")%>&lid=<%= map.get("lid")%>" 
                               class="btn btn-sm btn-danger">Delete</a></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <div class="col-sm-4">
            <h5>Assign Subjects</h5>
            <form action="../Assign" method="post">
                <div class="form-group">
                    <label>Select Lecturer</label>
                    <select name="lid" required class="form-control">
                        <option value=""><-- Select Lecturer --></option>
                        <%
                            for (Map<String, String> map : DbConfig.allRecords("lecturer")) {%>                        
                        <option value="<%= map.get("lid")%>"><%= map.get("lname")%></option>
                        <% }%>                        
                    </select>
                </div>
                <div class="form-group">
                    <label>Select Subject</label>
                    <select required name="subid" class="form-control">
                        <option value=""><-- Select Subject --></option>
                        <% for(Map<String,String> map : DbConfig.sublect()){ %>
                        <option value="<%= map.get("subid") %>"><%= map.get("subname") %></option>
                        <% } %>                        
                    </select>
                </div>
                <button class="btn btn-primary btn-block">Assign Subject</button>
            </form>
        </div>
    </div>
</div>
</div>
</div>
<jsp:include flush="true" page="footer.jsp" />

