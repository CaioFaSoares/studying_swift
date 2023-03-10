# Vexing Vehicle Purchase

Welcome to Vexing Vehicle Purchase on Exercism's Swift Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

There are three primary conditional statements that are used in Swift, `if` statements, `switch` statements, and `guard` statements. The `if` and `switch` statements are similar to those seen in a number of other languages, and `guard` should feel familiar to users of other languages with early exit statements.

## If statement

If statements in Swift are similar to those seen in other languages. E.g.:

```swift
if myValue > 0 {
  print("myValue is positive")
} else {
  print("myValue is not positive")
}
```

With this structure, if the Boolean expression following the `if` evaluates as `true`, the first block of code is run, the second block of code is skipped. And if the Boolean expression evaluates to `false`, the first block of code is skipped, the second block of code is run. In either case, the program continues running at the first line of code following the `if` statement.

There are two variants of this pattern that are available in Swift, the else-if and the no-else variants.

### else-if

In cases where the second block of code would just be another `if` statement, the else-if allows us to clean up the code and remove some indentation from our code by moving the `if` up next to the previous `else` and getting rid of a layer of parentheses.

So if we needed to perform different actions when a string is equal to “apple”, “lemon”, “peach”, or any other string, instead of nesting additional `if` statements inside the else blocks, one can write:

```swift
if str == "apple" {
    print("Let's bake an apple crumble")
} else if str == "lemon" {
    print("Let's bake a lemon meringue pie!")
} else if str == "peach" {
    print("Let's bake a peach pie!")
} else {
    print("Let's buy ice cream.")
}
```

### no-else

And if any if-statement only needs to perform code for one of the cases, the else branch can be left out entirely. So for example, if you are writing software that diagnoses patients and you need to log certain symptoms, like elevated heart rate, instead of writing:

```swift
if heartRate > 100 {
  print("elevated heart rate")
} else {
  ()
}
```

You can drop the else and just write

```swift
if heartRate > 100 {
  print(“elevated heart rate”)
}
```

## switch statements

While the else-if variant of `if` statements cleans things up considerably, there is still a lot of noise in the code from all of the curly braces. This is where the `switch` statement comes into play. In conditional statements with many possible branches, the switch statement shines. Note, however, that `switch` statements do work a bit differently from `if` statements.

Rather than evaluating a Boolean expression and using the value of that expression to choose the code branch that is run, a simple switch statement takes an input value (or expression which it evaluates to obtain the input value) of some type and compares against one or more values of the same type. If a case is found that matches the input value, the corresponding block of code is run.

```swift
switch str {
case "apple":
    print("Let's bake an apple crumble")
case "lemon":
    print("Let's bake a lemon meringue pie!")
case "peach":
    print("Let's bake a peach pie!")
default:
    print("Let's buy ice cream.")
}
```

## guard statements

The `guard` statement in swift is used for early returns from Swift functions when a necessary condition which needs to be met for further processing to continue is not met, e.g.:

```swift
guard myValue = 0 else { return 0 }
let root = myValue.squareRoot()
```

Here, the `guard` checks if the Boolean expression following the `guard` keyword evaluates as true. If it does, then processing continues with the code following the guard statement (here `let root = myValue.squareRoot()`). Otherwise it will execute the code in the else clause. Unlike an `if` statement, a `guard` statement _must_ have an else clause, and unlike the else clause of an if-else, the else clause of a guard _must_ exit the scope of the guard statement. I.e. it must use a control transfer statement such as return, continue, break, or it must throw an error or exit the program.

An example of its use is the sinc function, which is equal to sin(x)/x with sinc(0) defined to be 1, avoiding issues with division by 0. This function can be written in Swift, using a `guard` as:

```swift
func sinc(_ x: Double) -> Double {
    guard x != 0 else { return 1 }
    return sin(x) / x
}

sinc(0)
// => 1
sinc(Double.pi / 2)
// => 0.6366197723675814
```

## Instructions

In this exercise you're going to write some code to help you prepare to buy a new vehicle.

You have three tasks, one to help you determine the price of the vehicle you can afford, one to determine what kind of license you will need to get, and one to help you compute your yearly registration fees.

## 1. Compute whether or not you can afford the monthly payments on a given car

The auto dealers in your town are all running a five year, 0% interest promotion that you would like to take advantage of. Implement the `canIBuy(vehicle:price:monthlyBudget:)` function that takes the name of the vehicle you are looking at, the price of the car, and your monthly budget and returns a string letting you know whether you can afford the car or not, if the monthly payment is within 10% above your monthly budget you will want to return a special reminder to be frugal:

```swift
canIBuy(vehicle: "1974 Ford Pinto", price: 516.32, monthlyBudget: 100.00)
// => "Yes! I'm getting a 1974 Ford Pinto"
canIBuy(vehicle: "2011 Bugatti Veyron", price: 2_250_880.00, monthlyBudget: 10000.00)
// => "Darn! No 2011 Bugatti Veyron for me"
canIBuy(vehicle: "2020 Indian FTR 1200", price: 12_500, monthlyBudget: 200)
// => "I'll have to be frugal if I want a 2020 Indian FTR 1200"
```

## 2. Determine the type of drivers license you will need

Implement the `licenseType(numberOfWheels:)` function that takes the number of wheels on your new vehicle and returns the type of license you will need. Vehicles with 2 or 3 wheels will require a motorcycle license, vehicles with 4 or 6 wheels will require an automobile license, vehicles with 18 wheels require a commercial trucking license, and any other number of wheels returning an failure message:

```swift
licenseType(numberOfWheels: 2)
// => "You will need a motorcycle license for your vehicle"
licenseType(numberOfWheels: 6)
// => "You will need an automobile license for your vehicle"
licenseType(numberOfWheels: 18)
// => "You will need a commercial trucking license for your vehicle"
licenseType(numberOfWheels: 0)
// => "We do not issue licenses for those types of vehicles"
```

## 3. Calculate the registration fees for your new vehicle

The annual registration fee for your new vehicle is based on the following formula:

- For any vehicle 10 years old or older, the fee is a flat \$25.
- For any newer car:
  - Start with a base cost that is either the Manufacturer's Standard Retail Price (MSRP) for the vehicle, or \$25,000 whichever is greater.
  - Then for each year of age, subtract 10% of the base price.
  - Finally, divide that value by 100. Return the nearest integer dollar amount that is less than or equal to this value.

Implement the `registrationFee(msrp:yearsOld:)` function that takes the price of the car and the car's age in years, both as `Int` parameters and returns the registration fee for that car, according to the above formula.

```swift
registrationFee(msrp: 2_250_800, yearsOld: 9)
// => 2250
registrationFee(msrp: 25_000, yearsOld: 3)
// => 175
registrationFee(msrp: 34_000, yearsOld: 30)
// => 25
```

## Source

### Created by

- @wneumann