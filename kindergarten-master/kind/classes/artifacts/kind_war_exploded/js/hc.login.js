$(function () {
    var mess = "";
    $("#E-send").click(function (e) {
        e.preventDefault();
        if (mess == "" || /用户名或/.test(mess)) {
            var mail = $("#E-mail").val();
            var name = $("#loginname").val();
            $.ajax({
                type: "post",
                url: "emailServlet",
                data: {"mail": mail, "name": name},
                success: function (response) {
                    mess = response;
                    alert(mess);
                }
            });
        } else if (/已将密码/.test(mess)) {
            alert("请勿重复发送!")
        }
    });
});