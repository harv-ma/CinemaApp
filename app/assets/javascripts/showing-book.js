$(document).on('turbolinks:load', () => {

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



/**
 * turbolinks:load must be listened for instead of ready method
 * as rails turbolinks cache the script and stop it from running from 
 * a redirect.
 * 
 * 
 * 
 * JQuery Seat Charts MIT License
 */
$( document ).on('turbolinks:load', function() {
    
    
    var id = $('#seats-partial').data('showing');
    var seatLayout = undefined;
    

    // Ajax get the room layout along with seats taken
    $.ajax({
      url: `/showings/${id}`,
      method: 'POST',
      dataType: 'JSON',
      success: (data) => {
          var unavailableSeats = data.seats;
          seatLayout = data.layout;
          console.log(seatLayout, unavailableSeats);
          setupJqueryChart(seatLayout, unavailableSeats);
          console.log("Success!");
          
        },
        error: (e) => {
            console.log('Error');
          }
      });
});

/**
 * This methods takes a seat number and returns the respective
 * column and row values. As this is what should be stored later.
 * @param {Integer} seatNumber 
 */
function calculateRowCol(seatNumber) {
  var id = undefined;
  var seatNum = String(seatNumber);
  $('.seatCharts-seat').each((index) => {
    if ($(`.seatCharts-seat:eq(${index})`).text() == seatNum) {
        id = $(`.seatCharts-seat:eq(${index})`).attr('id');
        return false;
    }
  });
  return id;
}

function recalculateTotal(sc) {
    var total = 0;
  
    //basically find every selected seat and sum its price
    sc.find('selected').each(function () {
      total += this.data().price;
    });
    
    return total;
}

/**
 * Takes the list of seats from Jquery seat charts,
 * formats them, then tries to book them.
 * @param {Array} seats 
 */
function bookSeats(seats) {
  return new Promise(function (resolve, reject) {
    $.ajax({
      url: `/showings/${id}/book`,
      method: 'POST',
      dataType: 'JSON',
      success: (data) => {





          resolve(data);
        },
        error: (e) => {
            reject(e);
          }
      });
        
    
});
}

/**
 * Render the seat selection chart to the screen, and setup handlers.
 * @param {Array} seatLayout : e.g. ['sss_sss_sss']
 * @param {Array} unavailableSeats : e.g. ['2_7']
 */
function setupJqueryChart(seatLayout, unavailableSeats) {
    var firstSeatLabel = 1;
    var $cart = $('#selected-seats');
    var $counter = $('#counter');
    var $total = $('#total');
    var sc = $('#seat-map').seatCharts({
      map: seatLayout,
      seats: {
          s: {
          price: 12.99,
            classes : 'standard-seat-class', //your custom CSS class
            category: 'Standard'
          },
          d: {
            price   : 12.99,
            classes : 'disabled-seat-class', //your custom CSS class
            category: 'Disabled'
          }         
        
        },
        naming : {
          top : false,
          getLabel : function (character, row, column) {
            return firstSeatLabel++;
          },
        },
        legend : {
          node : $('#legend'),
            items : [
            [ 's', 'available',   'Standard' ],
            [ 'd', 'available',   'Disabled'],
            [ 's', 'unavailable', 'Already Booked']
            ]         
        },
        click: function () {
          if (this.status() == 'available') {
            //let's create a new <li> which we'll add to the cart items
            $('<li>'+this.data().category+' Seat # '+this.settings.label+': <b>$'+this.data().price+'</b> <a href="#" class="cancel-cart-item">[cancel]</a></li>')
              .attr('id', 'cart-item-'+this.settings.id)
              .data('seatId', this.settings.id)
              .appendTo($cart);
            
            /*
            * Lets up<a href="https://www.jqueryscript.net/time-clock/">date</a> the counter and total
            *
            * .find function will not find the current seat, because it will change its stauts only after return
            * 'selected'. This is why we have to add 1 to the length and the current seat price to the total.
            */
            $counter.text(sc.find('selected').length+1);
            $total.text(recalculateTotal(sc)+this.data().price);
            
            return 'selected';
          } else if (this.status() == 'selected') {
              //update the counter
              $counter.text(sc.find('selected').length-1);
              //and total
              $total.text(recalculateTotal(sc)-this.data().price);
              
              //remove the item from our cart
              $('#cart-item-'+this.settings.id).remove();
              
              //seat has been vacated
              return 'available';
          } else if (this.status() == 'unavailable') {
              //seat has been already booked
              return 'unavailable';
          } else {
              return this.style();
          }
        }
      });
  
      //this will handle "[cancel]" link clicks
      $('#selected-seats').on('click', '.cancel-cart-item', function () {
        //let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
        sc.get($(this).parents('li:first').data('seatId')).click();
      });
  
      //let's pretend some seats have already been booked
      sc.get(
        unavailableSeats
        ).status('unavailable');   
                  
}