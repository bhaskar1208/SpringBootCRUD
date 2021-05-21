function deleteUser(uid){
		//alert(uid);
		var conf=confirm("Are you sure to delete user "+uid+" ?");
		if(!conf){
			return false;
		}
		$.ajax({  
            type: "GET",  
            url: "deleteUser/"+uid,  
            contentType: "application/json",  
            dataType: "json",  
            success: function (data) {  
               	alert(data.message); 
               	location.reload();           
            }, 
            failure: function (data) {  
                alert("Failure -> "+data.responseText);  
            },
            error: function (data) {  
                alert("Error ->"+data.responseText);  
            }
        }); 
	}
	function plotToModal(uid,name,email,address,password){
		$("#modelUid").html("");
		$("#modelName").val("");
		$("#modelEmail").val("");
		$("#modelAddress").val("");
		$("#modelPassword").val("");
		$("#modelUid").html(uid);
		$("#modelName").val(name);
		$("#modelEmail").val(email);
		$("#modelAddress").val(address);
		$("#modelPassword").val(password);
	}
	$("#updateBtn").click(function(){
		var uid=$("#modelUid").html();
		var name=$("#modelName").val();
		var email=$("#modelEmail").val();
		var address=$("#modelAddress").val();
		var password=$("#modelPassword").val();
		if(uid=="")
		return false;
		else if(name==""){
			$("#modelName").focus();
			return false;
		}
		else if(email==""){
			$("#modelEmail").focus();
			return false;
		}
		else if(address==""){
			$("#modelAddress").focus();
			return false;
		}
		else if(password==""){
			$("#modelPassword").focus();
			return false;
		}
		else{
			var posting=$.post("updateUser",{uid:uid,name:name,email:email,address:address,password:password});
			posting.done(function(data){
				data=data.trim();
				alert(data);
				$("#closeModal").click();
				location.reload();
			});
			posting.fail(function(data){
				alert("Error->"+data)
			});
		}	
	});