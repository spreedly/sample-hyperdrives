
var spreedlyPaymentFrame = new Spreedly.PaymentFrame("8rLAE4vizuIQyA0zorQHIMrluuM");

function submitPaymentForm() {
  var paymentMethodFields = ['full_name', 'month', 'year']
  for(var i = 0; i < paymentMethodFields.length; i++) {
    var field = paymentMethodFields[i];
    spreedlyPaymentFrame.setParam(field, document.getElementById(field).value)
  }
  spreedlyPaymentFrame.submit();
}

function errorList(array) {
  var list = document.createElement('ul');
  for(var i = 0; i < array.length; i++) {
    var item = document.createElement('li');
    item.appendChild(document.createTextNode(array[i]["message"]));
    list.appendChild(item);
  }
  return list;
}

function fillErrorsDiv(errors) {
  var errorsDiv = document.getElementById("errors");
  while (errorsDiv.firstChild) {
    errorsDiv.removeChild(errorsDiv.firstChild);
  }
  errorsDiv.appendChild(errorList(errors));
}

spreedlyPaymentFrame.on('paymentMethod', function(token, pmData) {
  var tokenField = document.getElementById("payment_method_token");
  tokenField.setAttribute("value", token);
  var masterForm = document.getElementById('payment-form');
  masterForm.submit();
});

spreedlyPaymentFrame.on('errors', function(errors) {
  fillErrorsDiv(errors);
});

spreedlyPaymentFrame.on('config', function(frame) {
  frame.setStyle('body', 'margin: 0px;');
  frame.setStyle('input', 'line-height: 20px;');
  frame.setStyle('.spf-field.spf-number', 'float: left; display: inline-block; margin-right: 1%');
  frame.setStyle('.spf-field.spf-verification_value', 'float: left; display: inline-block; margin-right: 1%;');
  frame.setStyle('label', 'display: block; font-family:"Helvetica Neue",Helvetica,Arial,sans-serif; font-size: 14px; margin-bottom: 0.25em; margin-top: 0.8em;');
  frame.setText('label[for="spf-number"]', 'Card Number');
});

spreedlyPaymentFrame.bind(document.getElementById('spreedly-iframe'));
