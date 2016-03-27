## Questions

- (?) How often does Elm get updated?
- (?) Will we cover...
  - Answered...
    - testing? A: Stage 6!
    - time-traveling debugger? A: It's not yet production-ready (more of a toy). But in next 1 or 2 releases, it will become much more powerful and useful.
    - more complex app w/multiple components, models, views, etc (reusability, modularity)? A: Stage 9!

- (!) I'm still having trouble understanding ports.
  - Just by looking at the code, I don't follow the wiring / data flow.

### Union Types

```Elm
type Action
  = Increment Int
  | Decrement Int
```
`Action` is a union type (in this case, 2 possible values).
`Increment` is a parameterized value constructor (like a function can have parameters).
If a function gets an Increment Action, the int inside of the action is accessible via `case` (like a `switch` in JS) or functions that access inner values (such as a `map`).

### Comparables
A value is a "comparable" if it can be compared to others in some way. Functions and Union Types are not comparables, but Ints, Strings, etc are comparables.

## Actions
User clicks get turned into actions for the `StartApp`'s `update` (Model-View-Update).
HTTP requests get turned into actions.
Pub/sub messages to/from JS code get turned into actions.

## Ports

## Pattern Matching
```Elm
recurse listOfItems =
  case listOfItems of
    [] ->
      -- listOfItems pattern matches an empty list; return empty list
      []
    first :: rest ->
      if predicate first then
        -- return list with current item prepended to list from recursion on the remaining ones
        first :: recurse rest
      else
        -- omit current item and return list returned from recursion
        recurse rest

predicate item =
  if
```

# Other Stuff
- Elm has destructuring
- Lists
  - must contain elements of the same type?
  - are linked lists, so prepending to a list is constant time, but appending is linear
- Ports
  - You can only establish ports in 1 place (likely your Main elm file)?
- Debugging/logging
  - `Debug.log` is like a `console.log` from JS, but with a diff signature
- Use `Html.Lazy` to memoize view functions (that render HTML) to avoid creating new Virtual DOMs when it turns out that the Update didn't give the View a different/novel Model.
