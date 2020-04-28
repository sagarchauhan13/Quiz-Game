//function for timer
var max_time = 20;
var clearinterval;
function countdown_timer(){
    $("#countdown").html('<span><center><h2>Time Remaining:<strong>' + max_time + '</strong>Seconds</h2></center></span>');
    if (max_time == 0) {
        clearInterval(clearinterval)
        $("#question_from_db1").hide();
        $("#question_from_db2").hide();
        $("#countdown").hide();
        $("#result").load("result.php");
    }
    max_time--;
}
$(document).ready(function() {
    $('#feedback').load('check_username.php').show();
    $('#username_input').keyup(function(){
        $.post('check_username.php', { username: form.username.value },
        function(result){
           $('#feedback').html(result).show();
        });
    });
    $("#start").click(function () {
        var checkdata = $('#username_input').val();
        if(checkdata ==''){
            alert("Enter Username First");
        } else {
            $.ajax({
            url: "ajaxdata.php",
            type: "post",
            data:{username_input:checkdata},
            success: function(getdata){
                if(getdata =='user_exist'){
                    alert("Change Your Username");
                } else {
                    console.log(getdata);
                    $('#after_login').html(getdata);
                    $("#before_login").hide();
                    clearinterval = setInterval("countdown_timer()", 1000)
                }
            }
        });
    }
}); 
    //function for next click event
    $(document).on("click","#next",function () {
        if($('input[type=radio][name=answer]:checked').length == 0){
            alert("Please Select Any One Answer");
        } else {
        var user_id     = $('#user_id').val();
        var question_id = $('#question_id').val();
        var answer      = $("input[name='answer']:checked").val();
        $.ajax({
            url: "ajaxdata.php",
            type: "post",
            data: {user_id:user_id, question_id:question_id, answer:answer},
            success: function (getdata) {
//                console.log(getdata);
                $('#after_login').html(getdata);
            }
        });
    }
    });
});