<jsp:include flush="true" page="header.jsp" />
<script>
    $(function(){
        $("#role").change(function(){
            if(this.value==="student"){
               $("#id").attr({"placeholder":"Enter roll no"}); 
            }else if(this.value==="lecturer"){
               $("#id").attr({"placeholder":"Enter teacher id"});  
            }else{
               $("#id").attr({"placeholder":"First Select role"});  
            }
        });
        $("#cpwd").blur(function(){
           if(this.value !== $("#pwd").val()){
               $("#error2").html("Password not match");
               $("#error2").removeClass("d-none");
           }else{
               $("#error2").addClass("d-none");
           } 
        });
        $("#id").blur(function(){
           $.ajax({
               url:'Verify',
               data:{'role':$("#role").val(),'id':this.value},
               method:'post',
               success:function(output){
            	   const found=(output.trim()==="Invalid");
	           	   if(found){
                      $("#error3").html("Invalid ID given");
                      $("#error3").removeClass("d-none");
                      $("#btnregister").prop("disabled",true);
                  }
                  else {     
                       $("#uname").val(output);
                       $("#error3").addClass("d-none");
                       $("#btnregister").prop("disabled",false);
                   }
               }
           }); 
        });
    });
</script>
<div class="jumbotron p-3 mb-0 text-center text-white rounded-0"
	style="background-color: #05366f; border-bottom: 1px solid white;">
	<h3>WELCOME TO  LEARNER ACADMEY</h3>
	<h4>Login Page</h4>
</div>
<div class="container" style="min-height: calc(100vh - 126px - 24px);">

	<div class="row">
		<div class="col-sm-5 mt-5 mx-auto card p-4 shadow"
			style="background-color: #7fc6ec5c;">
			
			<form action="Validate" method="post">
				<div class="form-group">
					<label>User ID</label> <input type="text" required name="userid"
						class="form-control form-control-sm">
				</div>
				<div class="form-group">
					<label>Password</label> <input type="password" required name="pwd"
						class="form-control form-control-sm">
				</div>
				<div class="form-group">
					<label>Select Role</label> <select name="role" required
						class="form-control form-control-sm">
						<option value=""><-- Select Role --></option>
						<option value="admin">Coordinator</option>
						<option value="lecturer">Lecturer</option>
						<option value="student">Student</option>
					</select>
				</div>
				<button class="btn btn-primary">Login</button>
				Not Registered
				<button type="button" data-target="#reg" data-toggle="modal"
					class="btn btn-link">Click here to register</button>
				
			</form>
<%
if(session.getAttribute("msg")!=null){
    %>
	<div class="alert text-success mt-2 text-center font-weight-bold">
		<%= session.getAttribute("msg") %>
	</div>
	<%
        session.removeAttribute("msg");
  }
  %>
		</div>
		<div class="modal" id="reg">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="Register" method="post">
						<div class="modal-header">
							<h5>Register Now</h5>
							<button class="close" data-dismiss="modal" type="button">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<select id="role" name="role" required
									class="form-control form-control-sm">
									<option value=""><-- Select Role --></option>
									<option value="lecturer">Lecturer</option>
									<option value="student">Student</option>
								</select>
							</div>
							<div class="form-group">
								<input type="text" id="id" placeholder="First Select role"
									name="id" required class="form-control form-control-sm">
							</div>
							<div id="error"
								class="text-danger font-weight-bold text-center d-none"></div>
							<div class="form-group">
								<input type="text" placeholder="User Name" readonly id="uname"
									name="uname" class="form-control form-control-sm">
							</div>
							<div class="form-group">
								<input type="text" required placeholder="User ID" name="userid"
									class="form-control form-control-sm">
							</div>

							<div class="form-group">
								<input id="pwd" required type="password" placeholder="Password"
									name="pwd" class="form-control form-control-sm">
							</div>
							<div class="form-group">
								<input id="cpwd" required type="password" placeholder="Repeat Password"
									name="cpwd" class="form-control form-control-sm">
							</div>
							<div id="error3"
								class="text-danger font-weight-bold text-center d-none">Invalid Id</div>
						</div>
						<div class="modal-footer">
							<button id="btnregister" disabled class="btn btn-success float-right">Register</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
