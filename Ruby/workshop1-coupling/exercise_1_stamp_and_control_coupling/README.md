# Exercise 1 (Stamp and Control coupling)

## Part 1 (Stamp Coupling)
- Change the order class to have a `#uuid` instance method instead of `#id` instance method
- The order should generate it's own uuid when initialised
- Use the `SecureRandom` library to generate a uuid (`SecureRandom.uuid`)
- You will need to add `require 'securerandom'` to the top of the file to use the `SecureRandom` library
- As you refactor, reduce the number of classes/method that know order implements a `#uuid` method.
- Ideally once you've finished, if we asked you to revert the change, you'd need to touch fewer places

## Part 2 (Control Coulping)
- Use `Device.device_has_paper?` to check whenever printing a tax invoice/customer copy/refund.
- Look at the how `#print_receipt` is being called, does the bar system already know what type of receipt it wants to print?
- By add the paper check to `#print_receipt` we've increase the cyclomatic complexity, can we reduce it by removing the control coupling?

## Running tests
Start off by getting the integration tests to pass. You can run these using the following command:
```sh
make test-integration
```

You can then run the whole suite using the following command:

```sh
make test-all
```

