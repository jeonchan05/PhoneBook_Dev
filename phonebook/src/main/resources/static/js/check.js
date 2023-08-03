function pncheck(phonenumber){
    $.ajax({
        url:'/phonebook/pncheck',
        type:'post',
        data:{phonenumber: phonenumber},
        success:function(check){
            if(check == 0){
                $('.pn_ok').css("display","inline-block"); 
                $('.pn_already').css("display", "none");
            } else {
                $('.pn_already').css("display","inline-block");
                $('.pn_ok').css("display", "none");
                $('phonenumber').val('');
            }
        },
        error:function(){
            alert("에러입니다");
        }
    });    	
};
function pwcheck(pw){
    $.ajax({
        url:'/phonebook/pwcheck',
        type:'post',
        data:{pw: pw},
        success:function(check){
            if(check == 0){
                $('.pw_ok').css("display","inline-block"); 
                $('.pw_already').css("display", "none");
            } 
            else {
                $('.pw_already').css("display","inline-block");
                $('.pw_ok').css("display", "none");
                $('pw').val('');
            }
        },
        error:function(){
            alert("에러입니다");
        }
    });    	
};
function namecheck(membernm){
    $.ajax({
        url:'/phonebook/namecheck',
        type:'post',
        data:{membernm: membernm},
        success:function(check){
            if(check == 0){
                $('.nm_ok').css("display","inline-block"); 
                $('.nm_already').css("display", "none");
            } 
            else {
                $('.nm_already').css("display","inline-block");
                $('.nm_ok').css("display", "none");
                $('membernm').val('');
            }
        },
        error:function(){
            alert("에러입니다");
        }
    });    	
};
function addresscheck(address){
    $.ajax({
        url:'/phonebook/addresscheck',
        type:'post',
        data:{address: address},
        success:function(check){
            if(check == 0){
                $('.add_ok').css("display","inline-block"); 
                $('.add_already').css("display", "none");
            } 
            else {
                $('.add_already').css("display","inline-block");
                $('.add_ok').css("display", "none");
                $('address').val('');
            }
        },
        error:function(){
            alert("에러입니다");
        }
    });    	
};

function onlyNumber(obj) {
  obj.value = obj.value.replace(/[^0-9]/g, "");
}
window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        }, false);
      });
    }, false);
    
    