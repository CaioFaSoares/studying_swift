# Lasagna Master

Welcome to Lasagna Master on Exercism's Swift Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Multiple return values

Multiple values can be returned from Swift functions by creating and returning a tuple from the different values.

```swift
func reverseAndLength(_ str: String) -> (reverse: String, length: Int) {
  return (reverse: str.reverse, length: str.count)
}

reverseAndLength("Hello")
// => (reverse: "olleH", length: 5)
```

## Default parameter values

Default parameter values can be supplied for any of a function's parameters by assigning a value to the parameter in the parameter list following the parameter's type annotation. When a default parameter value is specified, the caller of the function can omit that parameter when calling the function and the default value will be used instead.

```swift
func greeting(name: String = "guest", duration: Int = 2) -> String {
  "Welcome, \(name). Enjoy your \(duration) night stay."
}

greeting(name: "Bobo", duration: 7)
// => "Welcome, Bobo. Enjoy your 7 night stay."
greeting(duration: 3)
// => "Welcome, guest. Enjoy your 3 night stay."
greeting(name: "Wynona")
// => "Welcome, Wynona. Enjoy your 2 night stay."
greeting()
// => "Welcome, guest. Enjoy your 2 night stay."
```

## Variadic parameters

_Variadic parameters_ in Swift allow zero or more values of the same type to be passed into a single parameter in a function. This is indicated by appending `...` to the type annotation of the parameter.

These values will be automatically grouped into an array with elements of the same type as the type of the variadic parameter.

```swift
func geometricMean(_ numbers: Double...) -> Double {
  var total = 1.0
  for number in numbers {
      total *= number
  }
  return pow(total, 1.0 / Double(numbers.count))
}

geometricMean(1, 2, 3, 4, 5)
// => 2.605171084697352
```

## In-out parameters

Within the body of a function, parameters are treated as constants, not variables; trying to modify the value of a parameter will raise a compile-time error. If a function wishes to modify the value of a parameter, it must use an _in-out parameter_ to make this mutability explicit.

To use in-out parameters, a programmer must be sure of three things:

1. The function definition must explicitly mark in-out parameters by writing the keyword `inout` between the `:` and the type name in the parameter's type annotation.
2. The value passed in to the in-out parameter must be declared as a variable, not a constant. Similarly it cannot be a literal.
3. The variable name must be preceded by an `&` in the call to the function, explicitly marking it as modifiable.

When this is done, the function will make an internal copy of the in-out parameter, modify it as directed in the body of the function and then copy the modified value back into the variable that was passed in when the function returns.

```swift
func updateVersion(_ record: inout (version: Int, title: String)) {
  record.version += 1
}

var dbRecord = (version: 2, title: "Exercism")
updateVersion(&dbRecord)

// dbRecord is now (3, "Exercism")
```

## Nested functions

Functions may be defined inside of other functions. This is commonly used to create helper functions which are only useful to their enclosing function and so don't need to pollute the outside namespace.

These functions are defined and called just like normal functions, but are not visible outside the enclosing function.

```swift
func makeNumber(_ bits: [Bool]) -> Int {
  func double(_ x: Int) -> Int { 2 * x }
  func add(_ x: Int) -> Int { x + 1 }

  var number = 0
  for bit in bits {
    number = double(number)
    if bit {
      number = add(number)
    }
  }
  return number
}

makeNumber([true, false, true, true])
// => 11
makeNumber([true, true, false, false, false, true, true])
// => 99
```

## Instructions

In this exercise you're going to write some more code to help you cook your brilliant lasagna from your favorite cooking book.

You have five tasks, all related to the time spent cooking the lasagna.

## 1. Allow changing the expected oven time

You want to write an improved `remainingMinutesInOven` function that takes the number of elapsed minutes the lasagna has been in the oven as a parameter and returns how many minutes the lasagna still has to remain in the oven, based on the expected oven time in minutes from the previous task. Previously, you had relied on a constant value, `expectedMinutesInOven` that came from outside the `remainingMinutesInOven` function. That was both a bit too cluttered for your taste and not flexible enough, as it doesn't allow you to change the expected time in the oven.

To clean things up, define the `remainingMinutesInOven` function that takes the number of elapsed minutes the lasagna has been in the oven as a parameter, as well as an `expectedMinutesInOven` parameter that has a default value of 40. Your function should return how many minutes the lasagna still has to remain in the oven, based on the expected oven time in minutes from the previous task.

```swift
remainingMinutesInOven(elapsedMinutes: 30)
// => 10
remainingMinutesInOven(elapsedMinutes: 30, expectedMinutesInOven: 75)
// => 45
```

## 2. Allow differing numbers of layers

You had previously written a `preparationTimeInMinutes` function that takes the number of layers you added to the lasagna as a parameter and returns how many minutes you spent preparing the lasagna, assuming each layer takes you 2 minutes to prepare. However, you are not particularly happy with this function, as you have to count the number of layers in your lasagna yourself before you can call this function, and who has time for all that?

To make things easier for yourself, write a function, `preparationTimeInMinutes` that takes a variadic `String` parameter, `layers`, where you list the different layers in your lasagna. The function will then count the number of layers in your lasagna, and return the amount of preparation time required.

```swift
preparationTimeInMinutes(layers: "sauce", "noodles")
// => 4
preparationTimeInMinutes(layers: "sauce", "noodles", "sauce", "meat", "mozzarella", "noodles", "sauce", "eggplant", "béchamel", "noodles", "sauce", "mozzarella")
// => 24
```

## 3. Compute amounts of noodles and sauce

Before you start to assemble your lasagna, you want to make sure you have enough sauce and noodles to build the lasagna of your dreams. For each noodle layer in your lasagna, you will need 3 noodles. For each sauce layer in your lasagna, you will need 0.2 liters of sauce.

Define the function `quantities` that takes a variadic `String` parameter, `layers`, where you list the different layers in your lasagna. The function will then determine the quantity of noodles and sauce needed to make your meal. The result should be returned in a tuple of type `(noodles: Int, sauce: Double)`.

```swift
quantities(layers: "sauce", "noodles", "sauce", "meat", "mozzarella", "noodles", "sauce", "eggplant", "béchamel", "noodles", "sauce", "mozzarella")
// => (noodles 9, sauce 0.8)
quantities(layers: "sauce", "noodles", "sauce", "noodles", "meat", "noodles", "mozzarella")
// => (noodles 9, sauce 0.4)
```

## 4. Convert liters to fluid ounces in place

Unfortunately, the sauce you have on hand has the volume is listed in fluid ounces instead of liters. To help let you know if you have enough sauce on hand, write a function, `toOz`, that takes an in-out tuple parameter, `(noodles: Int, sauce: Double)`, and converts the quantity of sauce to fluid ounces. Note that there are 33.814 fluid ounces per liter.

```swift
var amount = (noodles: 9, sauce: 0.8)
toOz(&amount)
// => amount is now (noodles: 9, sauce: 27.0512)
```

## 5. Determine the best wine to serve

Finally, you want to know what kind of wine to serve with your lasagna. You've heard that you should serve white wine if there is more mozzarella, ricotta, and béchamel in the lasagna than there is meat and sauce, and red wine otherwise. Write a function `redWine` that takes a variadic `String` parameter, `layers`, where you list the different layers in your lasagna. The function will use five nested functions to determine the number of layers of mozzarella, ricotta, béchamel, sauce, and meat in the lasagna, and compare the numbers of layers to determine if red wine should be served, returning `true` if so and `false` if not.

```swift
redWine(layers: "sauce", "noodles", "sauce", "meat", "mozzarella", "noodles", "sauce", "eggplant", "béchamel", "noodles", "sauce", "mozzarella")
// => true
redWine(layers: "sauce", "noodles", "béchamel", "meat", "mozzarella", "noodles", "ricotta", "eggplant", "béchamel", "noodles", "sauce", "mozzarella")
// => false
```

## Source

### Created by

- @wneumann