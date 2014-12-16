
var spreedlyPaymentFrame = new Spreedly.PaymentFrame("8rLAE4vizuIQyA0zorQHIMrluuM");

function submitPaymentForm() {
  var paymentMethodFields = ['first_name', 'last_name', 'month', 'year']
  for(var i = 0; i < paymentMethodFields.length; i++) {
    var field = paymentMethodFields[i];
    spreedlyPaymentFrame.setParam(field, document.getElementById(field).value)
  }
  spreedlyPaymentFrame.submit();
}

spreedlyPaymentFrame.on('paymentMethod', function(token, pmData) {
  var tokenField = document.getElementById("payment_method_token");
  tokenField.setAttribute("value", token);
  var masterForm = document.getElementById('payment-form');
  masterForm.submit();
});

spreedlyPaymentFrame.on('errors', function(errors) {
  console.log(errors);
  for(var i = 0; i < errors.length; i++) {
    var error = errors[i];
    if(error["attribute"]) {
      spreedlyPaymentFrame.setStyle('input#spf-' + error["attribute"], "border: 1px solid red;");
    }
  }
});

spreedlyPaymentFrame.bind(document.getElementById('spreedly-iframe'));
