$(function () {
  (function () {

    // cache DOM
    var $element       = $('[data-component="isbn-validator"]');
    var $form          = $element.find('form');
    var $input         = $element.find('input');
    var $submitButton  = $element.find('button');

    var ISBN_SIZE = 13;

    function doRequest (e) {
      e.preventDefault();

      if(!$submitButton.hasClass('disabled')) {
        $.post(Routes.isbn_validator_path(), { isbn_number: $input.val() })
          .done(function (data) {
             if(data['valid']) {
               changeToSuccess();
             } else {
               changeToFailure();
          }
        })
      }
    }

    function changeToSuccess () {
      $form.addClass('success');
      $form.find('i.fa').addClass('fa-check');
    }

    function changeToFailure () {
      $form.addClass('failure');
      $form.find('i.fa').addClass('fa-times');
    }

    function clearStatus () {
      $form.removeClass(['success', 'failure']);
      $form.find('i.fa').removeClass(['fa-check', 'fa-times']);
    }

    function filterValue () {
      var value = $input.val().replace(/\D/g,'').substring(0, 13);
      $input.val(value);
    }

    function enableOrDisableSubmit () {
      if($input.val().length == ISBN_SIZE) {
        $submitButton.removeClass('disabled')
      } else {
        $submitButton.addClass('disabled')
      }
    }

    // Binds
    $form.on('submit', doRequest)
    $input.on('input', filterValue)
    $input.on('input', clearStatus)
    $input.on('input', enableOrDisableSubmit)
  })();
})
