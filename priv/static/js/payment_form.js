var spreedlyPaymentFrame = new Spreedly.PaymentFrame();

spreedlyPaymentFrame.on('token', function(token) {
  var tokenField = document.getElementById("payment_method_token");
  tokenField.setAttribute("value", token);
  var masterForm = document.getElementById('payment-form');
  masterForm.submit();
});

spreedlyPaymentFrame.on('error', function(message) {
  console.log(message);
});

spreedlyPaymentFrame.bind(document.getElementById('spreedly-iframe'));

