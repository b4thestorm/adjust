$(document).ready( function(){
  $('#m').on('click', function(){
 
   $.ajax(window.location.href, {
   type: 'get',
    data: {"monday": $('#m').data("monday")}
    });
  });

});

