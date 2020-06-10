(function() {
  $(document).on('turbolinks:load', function() {
    $('select').material_select();
    $('.modal').modal();
    return $(".button-collapse").sideNav();
  });

}).call(this);
