// 设置表单位置
function setWrapperPos() {
    var h = $('body').height();
    var lh = $('.form').eq(0).height();
    		
    // 新增 内容宽位置控制
    if( $('body').width() <= 768 ) {
        $('.form').eq(0).css('margin-top', 0);
        //$('.login').eq(0).css('padding-top', (h - lh) / 2 - 10);
        if((h-lh)<50){
            $('.login').eq(0).css('padding-top',(h-lh)/2 -20)
        }
        else{
            $('.login').eq(0).css('padding-top',h*0.1)
        }
    }else{
        $('.form').eq(0).css('padding-top', 40);
        $('.form').eq(0).css('margin-top', (h - lh) / 2 - 50);
    }
}

function setErrorTips(target,content){
    var t = $('div[prop=' + target + ']');
    if (typeof(target) != 'undefined' && target != null && target) {
        t.addClass('is-error');
    }
    $('.error').eq(0).css('display', 'block').find('.error-content').eq(0).html(content);
}

function closeErrorTips(target) {
    var t = $('div[prop=' + target + ']');
    t.removeClass('is-error').find('.error-content').remove();
    $('.error').eq(0).css('display', 'none');
}

function clickLoading(e, src, text,loading){
    if(loading){
        $(e.target).html('').append('<img src="' + src + '" class="loadingImg">').attr('disabled',true);
    }else{
        $(e.target).empty().html(text).attr('disabled',false);
    }
}


function getVerifyCode(e){
    $(e.target).attr('disabled',true);
    var timer = null;
    var count = 60;
    $(e.target).html(count + 's后重新获取');
    timer = setInterval(function(){
        count--;
        $(e.target).html(count + 's后重新获取');
        if(count===0){
            $(e.target).html('获取验证码');
            $(e.target).attr('disabled',false);
            clearInterval(timer);
        }
    },1000)
}