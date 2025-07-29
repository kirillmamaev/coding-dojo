# Exercise 3 (Content Coupling)
- Add `#paid_at` to the `Order` class with stores the timestamp of when the order has been paid.
- An order is now considered paid if that order has a `#paid_at`
- When refactoring, consider if adding more logic around an order being paid (maybe setting a status as well) would impact
classes outside of order.

## Running tests
Start off by getting the integration tests to pass. You can run these using the following command:
```sh
make test-integration
```

You can then run the whole suite using the following command:

```sh
make test-all
```
