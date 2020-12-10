$(document).on('turbolinks:load', () => {
    console.log("Showing-index Loaded");
    var slideCount = $('#slider ul li').length;
    var slideWidth = 500;
    var slideHeight = 1000;
    var sliderUlWidth = slideCount * slideWidth;
  
    $('#slider').css({ width: slideWidth, height: slideHeight });
      
        $('#slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });
        
        $('#slider ul li:last-child').prependTo('#slider ul');
  
        setInterval(function () {
            moveRight();
    }, 8000);
  
    function moveLeft() {
        $('#slider ul').animate({
            left: + slideWidth
        }, 200, function () {
            $('#slider ul li:last-child').prependTo('#slider ul');
            $('#slider ul').css('left', '');
        });
    };
  
    function moveRight() {
        $('#slider ul').animate({
            left: - slideWidth
        }, 200, function () {
            $('#slider ul li:first-child').appendTo('#slider ul');
            $('#slider ul').css('left', '');
        });
    };
  
    $('a.control_prev').click(function () {
        moveLeft();
    });

    $('a.control_next').click(function () {
        moveRight();
    });
  });
  