
$(document).ready(function(){
	$('.search').click(function(){
		var name = $("#name").val();
		if(name.length < 1){
			$('#info').html('<hr>'+'**title required');
		}else{
		console.log(name);
		$.ajax({
			url: '/home/show',
			method: 'post',
			datatype : 'json',
			data : {'name':name},
			success:function(response){
				if(response.campaign !== 'error'){

					// $('#info').html(response.user.id);
					 
					$('#info').html('<hr>'+'Id: '+response.campaign.id+'<br>'+'Type: '+response.campaign.ctype+'<br>'+'Description: '+response.campaign.description+'<br>'+'Title: '+response.campaign.title);
					$('#name').val('');
					
				}else{
					$('#info').html('<hr>'+'**can not found!!');
				}
			},
			error:function(response){
				alert('server error')
			}
		});}
	});
});




// $(document).ready(function(){
// 	$('.search').click(function(){
// 		var name = $("#name").val();

// 		console.log(name);
// 		$.ajax({
// 			url: '/home/show',
// 			method: 'post',
// 			datatype : 'json',
// 			data : {'name':name},
// 			success:function(response){
// 				if(response.user !== 'error'){

// 					// $('#info').html(response.user.id);
					 
// 					$('#info').html('<hr>'+'Id: '+response.user.id+'<br>'+'Name: '+response.user.Name+'<br>'+'Company Name: '+response.user.Company_name+'<br>'+'Number: '+response.user.number+'<br>'+'Username :'+ response.user.username+'<br>'+'Password :'+response.user.password);
// 					// $('#info').html(response.user.username);
// 					// $('#info').html(response.user.password);
// 					$('#name').val('');
					
// 				}else{
// 					$('#info').html('<hr>'+'**can not found!!');
// 				}
// 			},
// 			error:function(response){
// 				alert('server error')
// 			}
// 		});
// 	});
// });

