$(function () {

    $(".selectfrom input:text,select").each(function () {
        var key = $(this).prop("name");
        var value = sessionStorage.getItem(key);
        if (key != null && key != "" && value != null) {
            if (key == "priceType") {
                $(this).val(JSON.parse(value)).trigger('change');
            }else if(key == "state"){
                $(this).val([value]).trigger('change');
            }else {
                $(this).prop("value", value);
            }
        }
    });

    $(".selectfrom input:submit").click(function (e) {
        e.preventDefault();
        var href="";
        $(".selectfrom input:text,select").each(function () {
            var key = $(this).prop("name");
            var value;
            if(key=="priceType"){
                var temparr=new Array();
                var regs=$(this).select2("data");
                $(regs).each(function (i,n) {
                    temparr.push(regs[i].id);
                });
                value=JSON.stringify(temparr);
            }else {
                value = $(this).prop("value");
            }
            if (key != null && key != "") {
                if(value != null && value !=""){
                    sessionStorage.setItem(key, value);
                    if(key=="priceType"){
                        $(JSON.parse(value)).each(function (i,n) {
                            href+="&"+key+"="+n;
                        })
                    }else {
                        href+="&"+key+"="+value;
                    }
                }else {
                    href+="&"+key+"=";
                }
            }
        });
        href=href.replace("&","?");
        window.location.href="recordServlet"+href;
    });

    $(".selectfrom input:button").click(function () {
        sessionStorage.clear();
        $(".selectfrom input:text,select").each(function () {
            var key = $(this).prop("name");
            var value = "";
            if (key == "priceType" || key == "state") {
                value = "%";
                $(this).select2("val", "");
                $(this).val([value]).trigger('change');
            }
            if (key != null && key != "" && value != null) $(this).prop("value", value);
        });
    });

    $(".page-a a").click(function () {
        var href = $(this).prop("href");
        $(".selectfrom input:text,select").each(function () {
            var key = $(this).prop("name");
            var value = $(this).prop("value");
            if (value == null) value = "";
            if (key != null && key != "" && value != null) href += "&" + key + "=" + value;
        });
        $(this).prop("href", href);
    });

    var trobj = new Array();
    function tablestate() {
        var oldvalue;
        $(".Utdstate").on({
            dblclick: function () {
                oldvalue = $(this).text();
                $(this).html("<select style='width: 100%;height:auto;'>" +
                    "<option value='已缴费'>已缴费</option>" +
                    "<option value='未交费'>未交费</option>" +
                    "</select>");
                $(this).children("select").val(value).trigger('change');
            }, mouseleave: function () {
                $(this).html($(this).children(0).val());
                if (oldvalue != null && oldvalue != "" && $(this).text() != oldvalue) {
                    oldvalue = "";
                    trobj.push($(this).parent().children("td").eq(0).text());
                    $(this).css("background-color", "#01c0c8");
                }else{
                    oldvalue = "";
                }
            }
        });
    }
    tablestate();

    function tableperson() {
        var oldvalue;
        $(".Utdperson").on({
            dblclick: function () {
                oldvalue = $(this).text();
                $(this).html("<input style='width: 100%;height:auto;' value='admin'>");
            }, mouseleave: function () {
                $(this).html($(this).children(0).val());
                if (oldvalue != null && oldvalue != "" && $(this).text() != oldvalue) {
                    oldvalue = "";
                    trobj.push($(this).parent().children("td").eq(0).text());
                    $(this).css("background-color", "#01c0c8");
                }else{
                    oldvalue = "";
                }
            }
        });
    }
    tableperson();


    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
        return currentdate;
    }

    function tabletime() {
        var oldvalue;
        $(".Utdtime").on({
            dblclick: function () {
                oldvalue = $(this).text();
                var nowtime = getNowFormatDate();
                $(this).html("<input style='width:100%;height:auto' type='text' value='" + nowtime + "'>");
            }, mouseleave: function () {
                $(this).html($(this).children(0).val());
                if (oldvalue != null && oldvalue != "" && $(this).text() != oldvalue) {
                    oldvalue = "";
                    trobj.push($(this).parent().children("td").eq(0).text());
                    $(this).css("background-color", "#01c0c8");
                }else{
                    oldvalue = "";
                }
            }
        });
    }
    tabletime();


    function tabledescription() {
        var oldvalue;
        $(".Utddescription").on({
            dblclick: function () {
                oldvalue = $(this).text();
                $(this).html("<input style='width:100%;height:auto' type='text' value='"+oldvalue+"'>");
            }, mouseleave: function () {
                $(this).html($(this).children(0).val());
                if (oldvalue != null && oldvalue != "" && $(this).text() != oldvalue) {
                    oldvalue = "";
                    trobj.push($(this).parent().children("td").eq(0).text());
                    $(this).css("background-color", "#01c0c8");
                }else{
                    oldvalue = "";
                }
            }
        });
    }
    tabledescription();


    var data = new Array();
    $(".allsave").click(function () {
        if (trobj.length > 0) {
            $.unique(trobj);
            $(trobj).each(function (j, n) {
                $(".aaa").each(function () {
                    if ($(this).text() == n) {
                        var tds = $(this).parent().children("td");
                        var arr = new Array();
                        $(tds).each(function (i, n) {
                            if (i != 0) arr.push($(tds[i]).text());
                        });
                        arr.push($(tds[0]).text());
                        data.push(arr);
                    }
                });
            });
            trobj = [];
            var json = JSON.stringify(data);
            $.ajax({
                type: 'post',
                url: "recordUpdateServlet",
                data: {"json": json},
                async: false,
                success: function (data1) {
                    alert(data1);
                    window.location.href = "recordServlet";
                }
            });
        } else {
            alert("没有改变的值!")
        }
    })
});