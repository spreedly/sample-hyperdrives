
var spreedlyPaymentFrame = new Spreedly.PaymentFrame("8rLAE4vizuIQyA0zorQHIMrluuM");

function submitPaymentForm() {
  var paymentMethodFields = ['first_name', 'last_name', 'month', 'year']
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

spreedlyPaymentFrame.bind(document.getElementById('spreedly-iframe'));
