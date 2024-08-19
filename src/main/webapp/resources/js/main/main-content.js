/*
$(document).ready(function () {
    var images = [
        "../../resources/img/main_adv/검사무료체험.png",
        "../../resources/img/main_adv/디지털유닛.png",
        "../../resources/img/main_adv/반도체설계.png",
        "../../resources/img/main_adv/아카데미훈련생모집.png",
        "../../resources/img/main_adv/이력서서비스.png",
        "../../resources/img/main_adv/채용지원서비스.png"
    ];

    var index = 0;

    function changeImage() {
        var $img = $(".main-adv > img");
        $img.removeClass('fade-in').addClass('fade-out'); // 현재 이미지를 페이드 아웃

        setTimeout(function () {
            index = (index + 1) % images.length;
            $img.attr("src", images[index]);
            $img.removeClass('fade-out').addClass('fade-in'); // 새로운 이미지를 페이드 인
        }, 700);
    }

    setInterval(changeImage, 3000); // 3초마다 이미지 변경
});*/
