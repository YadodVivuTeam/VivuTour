var passwordInput = document.getElementById("password");

passwordInput.addEventListener("input", function () {
    var password = this.value;
    var errorMessage = document.getElementById("password-error");

    if (password.length < 8) {
        errorMessage.textContent = "Password must be at least 8 characters long.";
        passwordInput.setCustomValidity("Password must be at least 8 characters long.");
    } else {
        errorMessage.textContent = "";
        passwordInput.setCustomValidity("");
    }
});

