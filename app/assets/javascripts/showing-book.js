/**
 * turbolinks:load must be listened for instead of ready method
 * as rails turbolinks cache the script and stop it from running from 
 * a redirect.
 * 
 * 
 * 
 * JQuery Seat Charts MIT License
 */

var sc = null;
var seats = [];

$( document ).on('turbolinks:load', function() {
  console.log("Showing-show Loaded");
    
    // Select the container we setup to contain the seat chart
    var id = $('#seats-partial').data('showing');
    var seatLayout = undefined;
    
    

    // Ajax get the room layout along with seats taken
    $.ajax({
      url: `/showings/${id}`,
      method: 'POST',
      dataType: 'JSON',
      success: (data) => {
          // Setup layout and unavailable seats
          var unavailableSeats = data.seats;
          seatLayout = data.layout;
          // Setup the Jquery seat chart
          setupJqueryChart(seatLayout, unavailableSeats);
          
          // Setup make booking button
          $('#make-booking').on('click', async function() {
            // hide alerts
            $('#alerts').css( {'display': 'none'} );
            // disable button
            $('#make-booking').text( 'Please Wait...' );
            $('#make-booking').addClass('disabled');
            $('#make-booking').prop('disabled', true);
            
            // wait until we have a response from server if we successfully booked the seats or not
            let outcome = await bookSeats(id);

            
            if (outcome != undefined) {
              // If successful hide the seat form and display success message
              $('.booking-form').css({'display': 'none'});
              $('#alerts').removeClass( 'alert-danger' );
              $('#alerts').addClass( 'booking-success' );
              $('#alerts p').text( 'Booking successful!' );
              $('#alerts span').text( 'You will be redirected to your booking momentarily.' );
              $('#alerts').css( {'display': 'block'} );
              
              // Redirect after 5secs to booking page
              setTimeout(
                function() 
                {
                  window.location.href = `/bookings/${outcome}`; // redirect to booking confirmation page with details
                }, 5000);

            } else {
              // If unsuccessful display alert message
              $('#alerts').css( {'display': 'block'} );
              $('#alerts').addClass( 'alert-danger' );
              $('#alerts').removeClass( 'booking-success' );
              $('#alerts p').text( 'Unable to make booking!' );
              $('#make-booking').text( 'Book' );
              $('#make-booking').removeClass('disabled');
              $('#make-booking').prop('disabled', false);
            }

          });
        },
        error: (e) => {
           console.log("Error");
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

/**
 * Updates the price total.
 * @param {Integer} sc 
 */
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
function bookSeats(id) {

  return new Promise(function (resolve, reject) {
    // Post to the server trying to make a booking for the showing with "id"
    $.ajax({
      url: `/showings/${id}/book`,
      method: 'POST',
      dataType: 'JSON',
      data: {
        seats: seats
      },
      success: (data) => {
        // If it succeedds resolve with the data being the booking_id
          resolve(data.booking_id);
        },
        error: (e) => {
          console.log("ERROR: Unable to book seats!");
          // if unsuccessful reject with error code
          reject(e);
        }
      });
    }).catch (() => { console.log("ERROR: Unable to book seats!"); });
}

/**
 * Render the seat selection chart to the screen, and setup handlers.
 * @param {Array} seatLayout : e.g. ['sss_sss_sss']
 * @param {Array} unavailableSeats : e.g. ['2_7']
 */
function setupJqueryChart(seatLayout, unavailableSeats) {
    var firstSeatLabel = 1;
    var $counter = $('#counter');
    var $total = $('#total');
    sc = $('#seat-map').seatCharts({
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
          node : $('#legend'), // Our seat types
            items : [
            [ 's', 'available',   'Standard' ],
            [ 'd', 'available',   'Disabled'],
            [ 's', 'unavailable', 'Already Booked']
            ]         
        },
        click: function () {
          if (this.status() == 'available') {
            // add the seat to the seat list
            seats.push(
                 [this.settings.label,
                 this.settings.row + 1,
                 this.settings.column + 1]
            );
            
            // update total
            $counter.text(sc.find('selected').length+1);
            $total.text(recalculateTotal(sc)+this.data().price);
            
            return 'selected';
          } else if (this.status() == 'selected') {
            // Remove seat: find seat by id and remove it
            for (var z = 0; z < seats.length; z++) {
              if (seats[z][0] == parseInt(this.settings.label)) {
                seats.splice(z, 1);
                break;
              }
            }


              // update total
              $total.text(recalculateTotal(sc)-this.data().price);
              
              return 'available';
          } else if (this.status() == 'unavailable') {
              //seat has been already booked
              return 'unavailable';
          } else {
              return this.style();
          }
        }
      });
      
      // set the seats that are unavailable as taken, i.e. not clickable and different colour
      sc.get(
        unavailableSeats
        ).status('unavailable');   
                  
}