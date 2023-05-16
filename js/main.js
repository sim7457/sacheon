$(function () {
  $(".mid_menu .menu_slick").slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    dots: false,
    arrows: false,
  });
  $(".footer_menu .intro_slick").slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    dots: false,
    arrows: false,
  });
  $("#prev").on("click", function () {
    $(".menu_slick").slick("slickPrev");
  });

  $("#next").on("click", function () {
    $(".menu_slick").slick("slickNext");
  });

  $("#prev_v2").on("click", function () {
    $(".intro_slick").slick("slickPrev");
  });

  $("#next_v2").on("click", function () {
    $(".intro_slick").slick("slickNext");
  });

  $("#openPopup").on("click", function () {
    $("#popup").show(); // 팝업 보이기
  });

  // 팝업 닫기 버튼 클릭 이벤트
  $("#closePopup").on("click", function () {
    $("#popup").hide(); // 팝업 숨기기
  });
});
