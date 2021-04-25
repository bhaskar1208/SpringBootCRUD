function searchUserById(){
	var id=$("#searchId").val();
	if(id=="")
	$("#searchId").focus();	
	$.ajax({  
        type: "GET",  
        url: "searchAction/"+id,  
        contentType: "application/json",  
        dataType: "json",  
        success: function (data) {  
        	let uid=data.uid;
        	let name=data.name;
        	let email=data.email;
        	let address=data.address;
           	alert(uid+" "+name+" "+email+" "+address);   
        }, 
        failure: function (data) {  
            alert("Failure -> "+data.responseText);  
        },
        error: function (data) {  
            alert("Error ->"+data.responseText);  
        }
    }); 
	return false;
}