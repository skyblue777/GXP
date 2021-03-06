// var applicationId = squareApplicationId; // <-- Add your application's ID here
// var applicationId = "sq0idp-tZEqfw1QfNH6cY2wUDnegA";
var applicationId = "sq0idp-tZEqfw1QfNH6cY2wUDnegA"
// You can delete this 'if' statement. It's here to notify you that you need
// to provide your application ID.
if (applicationId == '') {
  alert('You need to provide a value for the applicationId variable.');
}

// Initializes the payment form. See the documentation for descriptions of
// each of these parameters.
var paymentForm = new SqPaymentForm({
  applicationId: applicationId,
  inputClass: 'sq-input',
  inputStyles: [
    {
      fontSize: '15px'
    }
  ],
  cardNumber: {
    elementId: 'sq-card-number',
    placeholder: '•••• •••• •••• ••••',
    elementClass: 'required form-control',
  },
  cvv: {
    elementId: 'sq-cvv',
    placeholder: 'CVV'
  },
  expirationDate: {
    elementId: 'sq-expiration-date',
    placeholder: 'MM/YY'
  },
  postalCode: {
    elementId: 'sq-postal-code'
  },
  callbacks: {

    // Called when the SqPaymentForm completes a request to generate a card
    // nonce, even if the request failed because of an error.
    cardNonceResponseReceived: function(errors, nonce, cardData) {
      if (errors) {
        console.log("Encountered errors:");
        var msg = "";
        // This logs all errors encountered during nonce generation to the
        // Javascript console.
        errors.forEach(function(error) {
          console.log('  ' + error.message);
          msg += error.message + "\n"
        });
        
        alert(msg);

      // No errors occurred. Extract the card nonce.
      } else {

        // Delete this line and uncomment the lines below when you're ready
        // to start submitting nonces to your server.
        // alert('Nonce received: ' + nonce);


        /*
          These lines assign the generated card nonce to a hidden input
          field, then submit that field to your server.
          Uncomment them when you're ready to test out submitting nonces.

          You'll also need to set the action attribute of the form element
          at the bottom of this sample, to correspond to the URL you want to
          submit the nonce to.
        */
        document.getElementById('card-nonce').value = nonce;
        document.getElementById('nonce-form').submit();

      }
    },

    unsupportedBrowserDetected: function() {
      // Fill in this callback to alert buyers when their browser is not supported.
    },

    // Fill in these cases to respond to various events that can occur while a
    // buyer is using the payment form.
    inputEventReceived: function(inputEvent) {
      switch (inputEvent.eventType) {
        case 'focusClassAdded':
          // Handle as desired
          break;
        case 'focusClassRemoved':
          // Handle as desired
          break;
        case 'errorClassAdded':
          // Handle as desired
          break;
        case 'errorClassRemoved':
          // Handle as desired
          break;
        case 'cardBrandChanged':
          // Handle as desired
          break;
        case 'postalCodeChanged':
          // Handle as desired
          break;
      }
    },

    paymentFormLoaded: function() {
      // Fill in this callback to perform actions after the payment form is
      // done loading (such as setting the postal code field programmatically).
      // paymentForm.setPostalCode('94103');
    }
  }
});

// This function is called when a buyer clicks the Submit button on the webpage
// to charge their card.
function requestCardNonce(event) {

  // This prevents the Submit button from submitting its associated form.
  // Instead, clicking the Submit button should tell the SqPaymentForm to generate
  // a card nonce, which the next line does.
  event.preventDefault();

  paymentForm.requestCardNonce();
}