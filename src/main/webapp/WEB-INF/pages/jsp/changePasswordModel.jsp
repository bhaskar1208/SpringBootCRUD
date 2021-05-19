<div class="modal fade" id="passwordChangeModel" role="dialog">
	<div class="modal-dialog">
	  	<div class="modal-content">
		    <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			    <h4 class="modal-title">Change Password</h4>
		    </div>
		    <div class="modal-body">
		      	<form method="post" action="updatePassword">
		      		<div class="row">
		      			<div class="col-md-6 col-sm-12">
				      		<label for="currPass">Email</label>
				      	</div>
				      	<div class="col-md-6 col-sm-12">
				      		<input type="text" name="email" id="email" class="form-control" placeholder="Enter email ID" required>
				      	</div>
				     </div>
				     <br>
		      		<div class="row">
		      			<div class="col-md-6 col-sm-12">
				      		<label for="currPass">Current Password</label>
				      	</div>
				      	<div class="col-md-6 col-sm-12">
				      		<input type="password" name="currPass" id="curPass" class="form-control" placeholder="Enter old password" required>
				      	</div>
				     </div>
				     <br>
				     <div class="row">
		      			<div class="col-md-6 col-sm-12">
				      		<label for="currPass">New Password</label>
				      	</div>
				      	<div class="col-md-6 col-sm-12">
				      		<input type="password" name="newPass" id="newPass" class="form-control" placeholder="Enter new password" required>
				      	</div>
				     </div>
				     <br>
				     <div class="row">
		      			<div class="col-md-6 col-sm-12">
				      		<label for="currPass">Confirm Password</label>
				      	</div>
				      	<div class="col-md-6 col-sm-12">
				      		<input type="password" name="confPass" id="confPass" class="form-control" placeholder="Confirm new password" required>
				      	</div>
				     </div>
				     <br>
				     <div class="row">
				      	<div class="col-md-6 col-md-offset-6">
				      		Show/Hide Password <input type="checkbox" name="showPasswordBox" id="showPasswordBox">
				      	</div>
				     </div>
				     
				     <br>
				     <div class="row">
		      			<div class="col-md-12 col-sm-12">
				      		<center><input type="submit" class="btn btn-success" name="changePasswordBtn" id="changePasswordBtn" value="UPDATE"></center>
				      	</div>
				     </div>
				     
		      	</form>
		    </div>
		    <div class="modal-footer">
		      	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		    </div>
		 </div>
	</div>
</div>