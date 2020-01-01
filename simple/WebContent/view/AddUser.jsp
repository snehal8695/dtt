
<!DOCTYPE html>
<%--<%@ page import="Bean.AddUserBean , DAO.AddUserDao , java.util.*"%> --%>

<html dir="ltr" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="../required/assets/images/favicon.png">
<title>User_Details</title>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/select2/dist/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/jquery-minicolors/jquery.minicolors.css">
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/quill/dist/quill.snow.css">
<link href="../required/dist/css/style.min.css" rel="stylesheet">


<link href="../required/dist/css/AddUser.css" rel="stylesheet">
<link href="../required/dist/css/styleborder.css">

<!-- HTML5 Shim and Respond.js IE8 support o2f HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style type="text/css">
.m {
	margin: 600px;
	padding: 0px;
	background: url("../required/assets/images/img1.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	font-family: sans-serif;
}

.grey_color {
	color: #ccc;
	font-size: 14px;
}
</style>
</head>

<body>

	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper">
		

		<div class="page-wrapper">
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-md-12">
						<div class="card" align="center"></div>
					</div>

				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-body"
								style="background: linear-gradient(to bottom left, gray, transparent);">
								<form action="../AddUser" method="post"
									style="margin-left: 120px; text-align: center">
									<fieldset class="col-md-10">
										<legend class="legend_border col-sm-3"
											style="padding-right: 5px;">Add User</legend>
										<div class="form-group row">

											<div class="col-sm-2">
												<label for="name"></label>
											</div>
											<div class="col-sm-8">
												<input type="text" class="form-control"
													placeholder="Full Name" maxlength="30" name="name"
													onkeypress="return alphaOnly(event);"
													style="text-transform: uppercase;" >
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-2">
												<label for="num"></label>
											</div>
											<div class="col-sm-8">
												<input type="text" class="form-control"
													placeholder="PHONE NO. " name="contact" maxlength="10"
													onblur="validateContact()"
													onkeypress="return isNumberKey(event);" >
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-2">
												<label for="email"></label>
											</div>
											<div class="col-sm-8">
												<input type="email" class="form-control" id="UserEmail"
													placeholder="EMAIL" name="email" onkeyup="ValidateEmail()"
													> <span id="lblError" style="color: red"></span>

											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-2">
												<label for="aliesname"></label>
											</div>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="aliesname"
													placeholder="Alies Name" maxlength="10"
													onkeypress="return alphaOnly(event)"
													style="text-transform: uppercase" >
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-2">
												<label for="role"></label>
											</div>
											<div class="col-sm-8">
												<select class="abc" name="role">
													<option value="">Select Role</option>
													<option value="TeamLeader">Team Leader</option>
													<option value="Developer">Developer</option>
													<option value="Tester">Tester</option>
												</select>

											</div>
										</div>
										<div class="border-top">
											<div class="card-body">
												<button class="btn btn-success btn-md"
													style="border-radius: 12px" type="submit">Submit</button>
												<button class="btn btn-warning btn-md"
													style="border-radius: 12px; margin-left: 30px" type="reset"
													class="btn btn-primary" value="Reset">Reset</button>

											</div>
										</div>
									</fieldset>
								</form>
							</div>
						</div>

					</div>

				</div>


				<div class="card">
					<div class="card-body" style="background: gray;">
						<fieldset class="col-md-12">
							<legend class="legend_border col-sm-3"
								style="padding-right: 5px;">User's Datatable</legend>
							<div class="table-responsive">
								<table id="zero_config"
									class="table table-striped table-hover table-bordered ">
									<thead>
										<tr>
											<th>Sr.No</th>
											<th>Role</th>
											<th>Name</th>
											<th>Contact</th>
											<th>Action</th>
										</tr>
									</thead>
								<%--	<%
										int i = 0;
										int pid = 0;
										List<AddUserBean> ls1=new ArrayList<AddUserBean>();
										List<AddUserBean> ls = AddUserDao.getPosition();
										for (AddUserBean obj : ls) {	
									%>
									<tbody>
										<tr>
											<td><%=++i%></td>
											<td><%=obj.getRole() %></td>
											<td><% 
												ls1=AddUserDao.getEmpDetails(obj.getUD_Id());
												for(AddUserBean obj1:ls1)
												{
													
													out.println(obj1.getName());%><br>	
												
												<%} %>
											</td>
											
											<td><% 
												ls1=AddUserDao.getEmpDetails(obj.getUD_Id());
												for(AddUserBean obj1:ls1)
												{
													out.println(obj1.getContact());%><br>	
												
												<%} %>
											</td>
											 <td>
											 <% ls1=AddUserDao.getEmpDetails(obj.getUD_Id());
												for(AddUserBean obj1:ls1)
												{%>
												<button type="button"
													class="btn btn-danger btn-xs mdi mdi-delete-forever"
													onclick="deleteUser(<%=obj.getUD_Id()%>);"
													data-toggle="modal" data-target="#deleteModal"></button>&nbsp;&nbsp;
												<button type="button"
													class="btn btn-success btn-xs mdi mdi-grease-pencil"
													onclick="getUpdateProjectId(<%=obj.getUD_Id()%>);"
													data-toggle="modal" data-target="#myModal1"></button>&nbsp;&nbsp;
												<!--<marquee behavior="scroll" direction="left" id="mymarquee">
												<p>Mail send successfully</p>
												</marquee>-->
												
												<button type="button" 
													class="btn btn-danger  btn-xs mdi mdi-envelop "	
												onclick="UserEmail(<%=obj.getUD_Id()%>);" 
													data-toggle="modal" data-target="#emailModal"></button><br>

											<%} %>
											</td>
										</tr>
										<%
											}
										%> --%>
									</tbody>
								</table>

							</div>
						</fieldset>
					</div>
				</div>

				<!--********Delete Modal view ********* -->
				<div class="modal del" id="deleteModal" role="dialog"></div>

				<!--**********end modal -->
				<!--**********update modal view******* -->
				<div class="modal displayUpdatecontent" id="myModal1" role="dialog"></div>
<!-- Email Modal view -->
					<div class="modal EmailModalContent" id="emailModal" role="dialog"></div>
			</div>
		</div>
	</div>
	<!--**********end modal -->
	<script src="../required/dist/js/Defecttrackingtool.js"></script>

	<script src="../required/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="../required/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="../required/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="../required/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script src="../required/assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<script src="../required/dist/js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="../required/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="../required/dist/js/custom.min.js"></script>
	<!-- This Page JS -->
	<script
		src="../required/assets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
	<script src="../required/dist/js/pages/mask/mask.init.js"></script>
	<script
		src="../required/assets/libs/select2/dist/js/select2.full.min.js"></script>
	<script src="../required/assets/libs/select2/dist/js/select2.min.js"></script>
	<script
		src="../required/assets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
	<script
		src="../required/assets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
	<script
		src="../required/assets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
	<script
		src="../required/assets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
	<script
		src="../required/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script src="../required/assets/libs/quill/dist/quill.min.js"></script>
	<script>
        //***********************************//
        // For select 2
        //***********************************//
        $(".select2").select2();

        /*colorpicker*/
        $('.demo').each(function() {
        //
        // Dear reader, it's actually very easy to initialize MiniColors. For example:
        //
        //  $(selector).minicolors();
        //
        // The way I've done it below is just for the demo, so don't get confused
        // by it. Also, data- attributes aren't supported at this time...they're
        // only used for this demo.
        //
        $(this).minicolors({
                control: $(this).attr('data-control') || 'hue',
                position: $(this).attr('data-position') || 'bottom left',

                change: function(value, opacity) {
                    if (!value) return;
                    if (opacity) value += ', ' + opacity;
                    if (typeof console === 'object') {
                        console.log(value);
                    }
                },
                theme: 'bootstrap'
            });
        

        });
        /*datwpicker*/
        jQuery('.mydatepicker').datepicker();
        jQuery('#datepicker-autoclose').datepicker({
            autoclose: true,
            todayHighlight: true
        });
        var quill = new Quill('#editor', {
            theme: 'snow'
        });

  
        function deleteUser(pid){
			
			 $.ajax({
		 		type: "POST",
		 		url: "../DeleteByIdUser",
		 		data: { PID : pid
		 				},
		 		success:function (response)
		 		{
		  			$(".del").html(response);   			
		 		}		   		
		 	});
		 }
        
        function UserEmail(eid)
        {
    	

        	$.ajax({
        		type:"POST",
        		url:"../EmailUserById",
        		data: {eid:eid},
        		success: function(response){
        			$(".EmailModalContent").html(response);
        		}
        	});
        }
</script>
<script type="text/javascript">
   
   function getUpdateProjectId(id)
   {//alert("hie");
	   $.ajax({
		   
		   type:"POST",
		   url:"../UpdateUserById",
		   data:{uid : id},
		   success: function(response)
		   {
			   $(".displayUpdatecontent").html(response);
		   }
	   });//alert("bye");
   }
   </script>
   </body>

</html>