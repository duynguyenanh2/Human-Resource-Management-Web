$(document).ready(function () {
    password = document.getElementById('password');
    confirmPassword = document.getElementById('repass');

    function validatePassword() {
        if (password.value !== confirmPassword.value) {
            confirmPassword.setCustomValidity("Passwords Don't Match");
        } else {
            confirmPassword.setCustomValidity('');
        }
    }

    password.onchange = validatePassword;
    confirmPassword.onkeyup = validatePassword;
});

function checkUnique(form) {
    userId = $('#id').val();
    userName = $('#username').val();
    url = "user/checkunique";

    params = {id: userId, username: userName};

    $.post(url, params, function (response) {
        if (response === 'OK') {
            form.submit();
        } else if (response === 'Duplicated') {
            alert('This username already exists');
        } else {
            alert('Unknown response');
        }
    }).fail(function () {
        alert('Error connecting to server');
    });

    return false;
}