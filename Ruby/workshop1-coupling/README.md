# Coupling Workshop Exercises

## Source
 <https://github.com/bettercaring/uplift-workshop>

## Setup

This exercise uses Ruby 3.4.2 so you may need to install the correct ruby version (this can be quite slow on some machines):

### Install asdf if you haven't

```sh
brew install asdf
```

### Setup Ruby

```sh
make install
```

## Context
The code describes a bar system where users can create orders and saves them to a repository.
The system also allows orders to be paid. The system also connects to a printer to allow for
the printing of tax invoices, customer copies and refunds. Finally, the system can also report
on unpaid orders.

Each exercise will have a corresponding integration test which is failing. The goal is to get that integration test
passing, then to fix the failing unit tests. Ideally your refactoring should mean that making a similar
change in the future should break fewer tests.
