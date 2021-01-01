$(function () {
    //获取初始时间
    getTime();
    //创建时间定时器，间隔为1秒
    setInterval(function () {
    //调用时间方法
    getTime();
}, 1000);
    //获取当前时间
    function getTime() {
        var date = new Date();
        var year = date.getFullYear();
        var month = Number(date.getMonth()) + 1 + "月";
        var day = date.getDate()+"日 ";
        var week = date.getDay();
        var hours = date.getHours()+":";
        var minutes = date.getMinutes()+":";
        var seconds = date.getSeconds().toString();
        if (seconds.length <= 1) {
            seconds = '0'+ seconds;
        }
        if (minutes.length <= 2) {
            minutes = '0' + minutes;
        }
        var arr = ['星期日 ','星期一 ','星期二 ','星期三 ','星期四 ','星期五 ','星期六 '];
        if (week == 0) {
            week = arr[0];
        }else if (week == 1) {
            week = arr[1]
        }else if (week == 2) {
            week = arr[2]
        }else if (week == 3) {
            week = arr[3]
        }else if (week == 4) {
            week = arr[4]
        }else if (week == 5) {
            week = arr[5]
        }else if (week == 6) {
            week = arr[6]
        }
        $("#systemTime").html(year + "年" + month + day +week + hours + minutes + seconds+"  ");
    }
});
