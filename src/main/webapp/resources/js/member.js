/**
 * 
 */

var idCheck = 0;
var pwdCheck = 0;
var pwdCheckConfirm = 0;
var nameCheck = 0;
var emailCheck = 0;
var authCode;
var emailAuthCheck = 0;

function checkId() {
	var id = $('#id').val();
	var idValid = /^[a-z0-9\-\_]{5,20}$/g;
	
	$('#id_ok').css("display", "none");
	$('#id_already').css("display", "none");
	$('#id_validation').css("display", "none");
	$('#id_must').css("display", "none");
	
	if (id == '') {
		$('#id_must').css("display", "block");
		$('#id').focus();
		idCheck = 0;
		
		return idCheck;
	}
	
	if (!idValid.test(id)) {
		$('#id_validation').css("display", "block");
		$('#id').focus();
		idCheck = 0;
		
		return idCheck;
	}
	
	$.ajax({
		url: 'join/id_check',
		type: 'get',
		data: {id: id},
		success: function(idCheckValue) {
			if (idCheckValue == 1) {
				$('#id_already').css("display", "none");
				$('#id_ok').css("display", "block");
				idCheck = 1;
			} else {
				$('#id_ok').css("display", "none");
				$('#id_already').css("display", "block");
				$('#id').focus();
				idCheck = 0;
			}
		},
		error: function(error) {
			alert("error : " + error);
		}
	});
	
	return idCheck;
};

function checkPwd() {
	var pwd = $('#pwd').val();
	var pwdValid = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-])[a-zA-Z0-9~!@#$%^&*_-]{8,16}$/;
	
	$('#pwd_ok').css("display", "none");
	$('#pwd_validation').css("display", "none");
	$('#pwd_must').css("display", "none");
	
	if (pwd == '') {
		$('#pwd_must').css("display", "block");
		$('#pwd').focus();
		pwdCheck = 0;
		
		return pwdCheck;
	}
	
	if (!pwdValid.test(pwd)) {
		$('#pwd_validation').css("display", "block");
		$('#pwd').focus();
		pwdCheck = 0;
		
		return pwdCheck;
	} else {
		$('#pwd_ok').css("display", "block");
		pwdCheck = 1;
		
		return pwdCheck;
	}
};

function checkPwdConfirm() {
	var pwd = $('#pwd').val();
	var pwdConfirm = $('#pwd_confirm').val();
	
	$('#pwd_confirm_ok').css("display", "none");
	$('#pwd_confirm_fail').css("display", "none");
	$('#pwd_confirm_must').css("display", "none");
	
	if (pwd == '') {
		$('#pwd_confirm_must').css("display", "block");
		$('#pwd_confirm').focus();
		pwdCheckConfirm = 0;
		
		return pwdCheckConfirm;
	}
	
	if (pwd == pwdConfirm) {
		$('#pwd_confirm_ok').css("display", "block");
		pwdCheckConfirm = 1;
		
		return pwdCheckConfirm;
	} else {
		$('#pwd_confirm_fail').css("display", "block");
		$('#pwd_confirm').focus();
		pwdCheckConfirm = 0;
		
		return pwdCheckConfirm;
	}
};

function checkName() {
	var name = $('#name').val();
	var nameValid = /^[가-힣a-zA-Z]+$/g;
	
	$('#name_must').css("display", "none");
	$('#name_validation').css("display", "none");
	
	if (name == '') {
		$('#name_must').css("display", "block");
		$('#name').focus();
		nameCheck = 0;
		
		return nameCheck;
	}
	
	if (!nameValid.test(name)) {
		$('#name_validation').css("display", "block");
		$('#name').focus();
		nameCheck = 0;
		
		return nameCheck;
	} else {
		nameCheck = 1;
		
		return nameCheck;
	}
}

function checkEmail() {
	var email = $('#email').val();
	var emailValid = /^[0-9a-zA-Z-_.]([0-9a-zA-Z-_.])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	console.log('입력한 이메일 주소' + email);
	
	$('#email_transfer').css("display", "none");
	$('#email_validation').css("display", "none");
	$('#email_must').css("display", "none");
	
	if (email == '') {
		$('#email_must').css("display", "block");
		$('#email').focus();
		emailCheck = 0;	
	}
	
	if (!emailValid.test(email)) {
		$('#email_validation').css("display", "block");
		$('#email').focus();
		emailCheck = 0;
		
		return emailCheck;
	} else {
		emailCheck = 1;
		
		return emailCheck;
	}

}

$('#email_auth').click(function () {
	var email = $('#email').val();
	authCode = null;

	if (checkEmail() != 1) {
		return ;
	}
	
	$.ajax({
		url: 'join/email_auth',
		type: 'get',
		data: {email: email},
		success: function(data) {
			$('#email').attr('readonly', true);
			$('#email_auth_input').removeAttr('disabled');
			$('#email_transfer').css("display", "block");
			authCode = data;
		},
		error: function(error) {
			alert("error : " + error);
		}
	});
});

function checkEmailAuth() {
	$('#email_confirm_fail').css("display", "none");
	
	if (emailAuthCheck == 0) {
		$('#email_confirm_must').css("display", "block");
		$('#email_auth_input').focus();
		
		return emailAuthCheck;
	} else {
		return emailAuthCheck;
	}
}

$('#email_auth_button').click(function () {
	var inputCode = $('#email_auth_input').val();
	
	$('#email_confirm_ok').css("display", "none");
	$('#email_confirm_fail').css("display", "none");
	$('#email_confirm_must').css("display", "none");
	
	if (inputCode == authCode) {
		$('#email_confirm_ok').css("display", "block");
		emailAuthCheck = 1;
		
		if ($('#change_password') != null) {
			$('#change_password').css("display", "block");
		}
		
		return emailAuthCheck;
	} else {
		$('#email_confirm_fail').css("display", "block");
		$('#email_auth_input').focus();
		emailAuthCheck = 0;
		
		return emailAuthCheck;
	}
});

$('#join_submit_button').click(function () {
	checkId();
	checkPwd();
	checkPwdConfirm();
	checkName();
	checkEmail();
	checkEmailAuth();
	
	if (checkId() != 1) {
		$('#id').focus();
		
		return ;
	}
	
	if (checkPwd() != 1) {
		$('#pwd').focus();
		
		return ;
	}
	
	if (checkPwdConfirm() != 1) {
		$('#pwd_confirm').focus();
		
		return ;
	}
	
	if (checkName() != 1) {
		$('#name').focus();
		
		return ;
	}
	
	if (checkEmail() != 1) {
		$('#email').focus();
		
		return ;
	}
	
	if (checkEmailAuth() != 1) {
		$('#email_auth_input').focus();
		
		return ;
	}

	joinForm.submit();
});

function checkEmailFind() {
	var email = $('#email').val();
	console.log('입력한 이메일 주소' + email);
	
	$('#email_validation').css("display", "none");
	$('#email_must').css("display", "none");
	$('#email_transfer').css("display", "none");
	
	if (email == '') {
		$('#email_must').css("display", "block");
		$('#email').focus();
		emailCheck = 0;
		
		return emailCheck;
	}
	
	emailCheck = 1;
		
	return emailCheck;
}

$('#email_auth_find').click(function () {
	var id = $('#id').val();
	var name = $('#name').val();
	var email = $('#email').val();
	authCode = null;
	
	if (checkEmailFind() != 1) {
		return ;
	}
	
	$.ajax({
		url: 'join/email_auth_find',
		type: 'get',
		data: {id: id, name: name, email: email},
		success: function(data) {
			$('#email').attr('readonly', true);
			$('#email_auth_input').removeAttr('disabled');
			$('#email_transfer').css("display", "block");
			
			if (data != null && data != "") {
				authCode = data;
			}
		},
		error: function(error) {
			alert("error : " + error);
		}
	});
});

$('#find_id_button').click(function () {
	checkName();
	checkEmailFind();
	checkEmailAuth();
	
	if (checkName() != 1) {
		$('#name').focus();
		
		return ;
	}
	
	if (checkEmailFind() != 1) {
		$('#email').focus();
		
		return ;
	}
	
	if (checkEmailAuth() != 1) {
		$('#email_auth_input').focus();
		
		return ;
	}

	findIdForm.submit();
});

$('#find_password_button').click(function () {
	checkEmailAuth();
	
	if (checkEmailAuth() != 1) {
		$('#email_auth_input').focus();
		
		return ;
	}

	findPasswordForm.submit();
});

$('#change_password_button').click(function () {
	checkPwd();
	checkPwdConfirm();
	
	if (checkPwd() != 1) {
		$('#pwd').focus();
		
		return ;
	}
	
	if (checkPwdConfirm() != 1) {
		$('#pwd_confirm').focus();
		
		return ;
	}

	findPasswordChangeForm.submit();
});