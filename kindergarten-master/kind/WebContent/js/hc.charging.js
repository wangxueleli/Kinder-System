$(function () {

  var trArr=new Array();
  $(".span12 .update").click(function () {
      $("#tab tbody tr").each(function () {
          if($(this).children("td:eq(0)").children().children().children().prop("checked")){
            trArr.push($(this));
          }
      });
      if(trArr.length>0) {
          $(".divhidden input:text,textarea").each(function (i, n) {
              $(this).val(trArr[0].children("td").eq(i+1).text());
          });

          $(".page-message").html("第 "+1+" / "+trArr.length+" 条数据");
          $(".divhidden").css("display","block");
      }else {
        alert("请勾选需要修改的数据");
      }
  });

  var index=0;
  $(".divhidden  .pre").click(function () {
    index--;
      if(index<0){
          index=0;
          alert("已经是第一条数据啦")
      }else {
          $(".divhidden input:text,textarea").each(function (i, n) {
              trArr[index+1].children("td").eq(i + 1).text($(this).val());
              $(this).val(trArr[index].children("td").eq(i + 1).text());
          });
          $(".page-message").html("第 "+eval(index+1)+" / "+trArr.length+" 条数据");
      }
  });

    $(".divhidden  .next").click(function () {
        index++;
        if(index>trArr.length){
            index=trArr.length;
            alert("已经是最后一条数据啦")
        }else {
            $(".divhidden input:text,textarea").each(function (i, n) {
                trArr[index-1].children("td").eq(i + 1).text($(this).val());
                $(this).val(trArr[index].children("td").eq(i + 1).text());
            });
            $(".page-message").html("第 "+eval(index+1)+" / "+trArr.length+" 条数据");
        }
    });

    var dataarr=new Array();
    $(".divhidden  .saveall").click(function () {
        $(".divhidden input:text,textarea").each(function (i, n) {
            trArr[index].children("td").eq(i + 1).text($(this).val());
        });
        $(trArr).each(function () {
            var arr=new Array();
            $(this).children("td:gt(1)").each(function () {
                arr.push($(this).text());
            });
            arr.push($(this).children("td:eq(1)").text());
            dataarr.push(arr);
        });
        var json=JSON.stringify(dataarr);
        dataarr=[];
        $.ajax({
            type:"post",
            url:"chargingUpdateServlet",
            data:{"json":json},
            success:function (data) {
                alert(data);
                window.location.href="charging.jsp";
            }
        })
    })
});