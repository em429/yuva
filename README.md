# yuva - shopping and recipes tracker optimised for touch devices

### Motivation

This is a 'home inventory dashboard' for tracking items we ran out of and should buy. We used to write everything in chat and it often ended up being a big mess. We forgot items, things got too far back in history, and given that we always buy the same stuff, it didn't make sense to keep repeating them every week anyways.

There is also a recipes section where we can keep track of what can we cook with the ingredients we have right now, and what is missing.

It's optimized for the touchscreen — long-press toggles an item's stock, a tap goes to it's page.

## Setup

Before use, two things must be setup in the `rails console`:

Create the scratchpad:

```ruby
Scratchpad.create
```
This is a single user application, but requires a passcode. Only the first passcode in the db will work! Here's how to create it:

```ruby
Passcode.create(password: 'secret')
```

### Things to keep in mind

For now, the category with `id=1` (the first we add) must be the cooking ingredients one, because when adding recipes, the multi-select filters for those items only — just so we don't end up with detergent on our pizza.

### Screenshots
