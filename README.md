# yuva - shopping and recipes tracker

Before use, two things must be setup in the `rails console`:

Create the scratchpad:

```ruby
Scratchpad.create
```
This is a single user application, but requires a passcode. Only the first passcode in the db will work! Here's how to create it:

```ruby
Passcode.create(password: 'secret')
```

### Recipes

For now, the category with id=1 (the first we add) must be the cooking ingredients one, because when adding recipes, the multi-select filters for those items only -- just so we don't end up with detergent on our pizza.

