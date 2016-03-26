## Questions

- (?) How often does Elm get updated?
- (?) Will we cover...
  - testing?
  - time-traveling debugger?
  - more complex app w/multiple components, models, views, etc?

### Union Types

```Elm
type Action
  = Increment Int
  | Decrement Int
```
`Action` is a union type (in this case, 2 possible values).
`Increment` is a parameterized value constructor (like a function can have parameters).
If a function gets an Increment Action, the int inside of the action is accessible via `case` (like a `switch` in JS) or functions that access inner values (such as a `map`).

### logging
`Debug.log` is like a `console.log` from JS, but with a return value
