    
   
</body>
   <script src="./assets/js/custom.js"></script>  
   <script>
    function validateRegEmail()
      {   
      var email_id= document.getElementById("email1").value;    
      $.ajax({   
            url: "./cfc/register.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"getEmailData",
            email:email_id              
            },
            success: function(data)
            {
                  console.log(data);            
                  if(data.RECORDCOUNT==1)
                  {
                  $('.email_alert').text('Email Already Exists!!');
                  $('#r_btn').prop('disabled', true);
                  }
                  else{
                  $('.email_alert').text(" ");
                  $('#r_btn').prop('disabled', false);
                  }                         
            }         
      });       
      }
      function validateRegUsername()
      {   
      var u_name= document.getElementById("username1").value;    
      $.ajax({   
            url: "./cfc/register.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"getNameData",
            uname:u_name             
            },
            success: function(data)
            {
                  console.log(data);            
                  if(data.RECORDCOUNT==1)
                  {
                  $('.username_alert').text('Username Already Exists!!');
                  $('#r_btn').prop('disabled', true);
                  }
                  else{
                  $('.username_alert').text(" ");
                  $('#r_btn').prop('disabled', false);
                  }                         
            }         
      });       
      } 
       const editData = (id) => {
        $.ajax({
            url: "cfc/userdata.cfc",
            type: "post", 
            dataType: "json",
            data: {
                method: "getContact",
                id
            },
            success: function (data){
                if(data && data.length){  
                    $('#tit1').val(data[0].title);  
                    $('#f1').val(data[0].fname);
                    $('#lastName').val(data[0].lname);   
                    $('#gend1').val(data[0].gender);
                    $('#dob').val(data[0].dob); 
                    $('#ad1').val(data[0].address);
                    $('#st1').val(data[0].street);
                    $('#email1').val(data[0].email); 
                    $('#phone1').val(data[0].phone); 
                    $('#id').val(data[0].id);  
                    $('#old_image').val(data[0].image);                                                                            
                    $('#exampleModalCenter').modal('show');
                }
            }
        });
      }
    function validateEmail()
    {   
        var email_id= document.getElementById("email1").value;    
        $.ajax({   
            url: "./cfc/userdata.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"getEmailData",
            email:email_id              
            },
            success: function(data)
            {
                console.log(data);            
                if(data.RECORDCOUNT==1)
                {
                    $('.email_alert').text('Email Already Exists!!');
                    $('#s_btn').prop('disabled', true);
                }
                else{
                    $('.email_alert').text(" ");
                    $('#s_btn').prop('disabled', false);
                }                         
            }         
        });       
   }
    function validatePhone()
    {   
        var phone_id= document.getElementById("phone1").value;    
        $.ajax({   
            url: "./cfc/userdata.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"getPhoneData",
            phone:phone_id              
            },
            success: function(data)
            {
                console.log(data);            
                if(data.RECORDCOUNT != 0)
                {
                    $('.phone_alert').text('Phone Number Already Exists!!');
                    $('#s_btn').prop('disabled', true);
                }
                else{
                    $('.phone_alert').text(" ");
                    $('#s_btn').prop('disabled', false);
                }                         
            }         
        });       
   }    
   </script>
</html>