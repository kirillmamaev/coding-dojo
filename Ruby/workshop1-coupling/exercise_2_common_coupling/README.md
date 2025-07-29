# Exercise 2 (Common Coupling)
- Add the ability to have multiple bar systems and be able to report on their unpaid orders individually.
- Turn the class level `@@orders` variable to a private instance level `@orders` and providing interfaces to interact with it
- If you were to change the `OrdersRepo` to save to a db instead of in memory, how would you ensure classes
using the repo were none the wiser

## Running tests
Start off by getting the integration tests to pass. You can run these using the following command:
```sh
make test-integration
```

You can then run the whole suite using the following command:

```sh
make test-all
```
