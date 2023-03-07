<%@page import="java.util.Map"%>
<%@page import="db.DbConfig"%>
<jsp:include flush="true" page="header.jsp" />
<div class="card shadow" style="min-height:88vh;">
	<div class="card-body">
	<h5 class="p-2" style="border-bottom:2px solid green;">Lecturer Dashboard</h5>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-6">
            <h5 class="p-2" style="border-bottom:2px solid green;">Lecturer Profile</h5>
            <%
                Map<String,String> map=DbConfig.findSingle("lecturer", "lid="+session.getAttribute("id"));
            %>            
            <table class="table table-bordered">
                <tr>
                    <th>Lecturer ID</th>
                    <th><%= map.get("lid") %></th>
                </tr>
                <tr>
                    <th>Lecturer Name</th>
                    <th><%= map.get("lname") %></th>
                </tr>
                <tr>
                    <th>Gender</th>
                    <th><%= map.get("gender") %></th>
                </tr>
                <tr>
                    <th>City</th>
                    <th><%= map.get("city") %></th>
                </tr>
                <tr>
                    <th>Email ID</th>
                    <th><%= map.get("email") %></th>
                </tr>
            </table>
        </div>
        <div class="col-sm-6 card" style="height:400px;">
            <h5 class="p-2" style="border-bottom:2px solid green;">Notifications</h5>
            <marquee onmouseover="stop()" onmouseout="start()" direction="up" style="height:100%">
                <ol>
                    <% for(Map<String,String> row : DbConfig.allLectmsgs(session.getAttribute("id").toString())) { 
                        String lname=DbConfig.findSingle("lecturer", "lid="+row.get("lid")).get("lname");
                    %>                                                
                    <li>Message from <b><%= lname %></b><br> <%= row.get("msg") %></li>
                    <% } %>
                </ol>
            </marquee>
        </div>        
    </div>
</div>
</div>
</div>
<jsp:include flush="true" page="footer.jsp" />

