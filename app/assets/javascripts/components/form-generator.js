$(function () {
  (function () {

    // cache DOM
    var $element       = $('[data-component="isbn-generator"]');
    var $form          = $element.find('form');
    var $input         = $element.find('input');
    var $submitButton  = $element.find('button');

    var ISBN_SIZE = 12;

    function doRequest (e) {
      e.preventDefault();
      e.stopPropagation();

      if(!$submitButton.hasClass('disabled')) {
        $.post(Routes.isbn_generator_path(), { isbn_number: $input.val() })
        .done(function (data) {
          changeToSuccess(data);
        }).fail(function (data) {
          changeToFailure();
        })
      }
    }

    function changeToSuccess (data) {
      $form.addClass('success');
      $form.find('i.fa').addClass('fa-check');
      $('.response-number').text(data.number);
    }

    function changeToFailure () {
      $form.addClass('failure');
      $form.find('i.fa').addClass('fa-times');
    }

    function clearStatus () {
      $form.removeClass(['success', 'failure']);
      $form.find('i.fa').removeClass(['fa-check', 'fa-times']);
      $('.response-number').text('');
    }

    function filterValue () {
      var value = $input.val().replace(/\D/g,'').substring(0, 12);
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
