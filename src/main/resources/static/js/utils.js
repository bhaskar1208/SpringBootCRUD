//Login page password box show/hide
function showHidePassword(){
	var elem=$("#password");
	var eye=$("#eye");
	if(elem.attr("type")=="password"){
		elem.attr("type","text");
		eye.removeClass("fa-eye-slash").addClass("fa-eye");
	}
	else{
		elem.attr("type","password");
		eye.removeClass("fa-eye").addClass("fa-eye-slash");
	}
}

//To check new password and confirm password
$("#changePasswordBtn").click(function(){
	var newPass=$("#newPass").val();
	var confPass=$("#confPass").val();
	if(newPass!=confPass){
		$("#confPass").val("");
		$("#confPass").focus();
		return false;
	}
});

//Update password page password box show/hide
$("#showPasswordBox").click(function(){
	if(this.checked){
		$("#curPass").attr("type","text");
		$("#newPass").attr("type","text");
		$("#confPass").attr("type","text");
	}
	else{
		$("#curPass").attr("type","password");
		$("#newPass").attr("type","password");
		$("#confPass").attr("type","password");
	}
});

//Registration page password box show/hide
$("#regShowHidePasswordBox").click(function(){
	if(this.checked){
		$("#password").attr("type","text");
	}
	else{
		$("#password").attr("type","password");
	}
});

function validate(pass,id){
	var pattern = /^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%&]).*$/;
	if(!pattern.test(pass)){
		$("#invalidTxt").html("Password must contain atleast one lower case,upper case ,number and special character ! ");
		$("#"+id).attr("disabled","disabled");
		return false;
	}
	else{
		$("#invalidTxt").html("");
		$("#"+id).removeAttr("disabled");
	}
}