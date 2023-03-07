<%
	if (session.getAttribute("msg") != null) {
%>
<div class="alert alert-success text-center font-weight-bold">
	<%=session.getAttribute("msg")%>
</div>
<%
	session.removeAttribute("msg");
}
if (session.getAttribute("error") != null) {
%>
<div class="alert alert-danger text-center font-weight-bold">
	<%=session.getAttribute("error")%>
</div>
<%
	session.removeAttribute("error");
}
%>
