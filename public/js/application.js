$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  userLoginListener();


});


var userLoginListener = function() {
  $('#login-link').on('click', function(e){
    e.preventDefault();

  if($('header').children().length == 3){
    $('header').find('form').toggle();
  } else {
  console.log('in user login listener')
  var $loginTarget = $(this)
  var $loginUrl = $(this).attr('href')

  var request = $.ajax({
    url: $loginUrl,
    type: 'GET'
  })

  request.done(function(response) {
      $('header').append(response);
  });

  request.fail(function(response) {
    console.log('ERROR OCCURED IN LOGGIN IN')
  })
}
  })
}