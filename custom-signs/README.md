# Cal's Custom Sign Shop

Welcome to Cal's Custom Sign Shop on Exercism's Swift Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Strings in Swift are a collection of characters, where characters are, more or less, a single printable element. So strings in Swift are able to contain Unicode characters and emoji.

Strings are easily created in Swift through string literals. String literals are similar to those seen in many other programming languages, characters enclosed between a pair of double quotation marks (`"`). Certain characters use a special notation inside of strings so they can be properly represented, such as the newline character which is written as `\n` inside strings or the double-quote character which is written as `\"` inside of a string so the compiler knows it isn't the double-quote which ends the string.

An empty string is represented by two double quotation marks with nothing between them.

```swift
let hello = "Hello, World!"
let sausage = "Weißwurst is a tasty sausage."
var fam = "This is my family: 👨‍👩‍👦‍👦, this is our dog: 🐶"
var empty = ""
```

Character literals in Swift look just like string literals, however, only one character is allowed between the quotation marks. Since the two literals look the same, Swift will default to inferring that characters are strings unless the type is specified by an explicit annotation or the context can tell the compiler otherwise.

```swift
let aString = "A"
// Swift infers this to be a String

var aChar: Character = "A"
// Swift now knows to make this a Character

let badChar: Character = "Too many characters"
// Error: Cannot convert value of type 'String' to specified type 'Character'
```

## Building strings from smaller parts

Strings can be concatenated using the `+` operator, and mutable strings can have other strings appended onto them using the `+=` mutating operator.

```swift
"honey" + "comb"
// => "honeycomb"

fam += ", this is our cat: 🐱"
// => "This is my family: 👨‍👩‍👦‍👦, this is our dog: 🐶, this is our cat: 🐱"
```

Note that only strings can be concatenated with strings. In order to use concatenation with a character, one must convert it to a String first

```swift
let question: Character = "?"
let areYouHappy = "Happy" + question
// Error: Cannot convert value of type 'Character' to expected argument type 'String'

let areYouHappy = "Happy" + String(question)
// => "Happy?"
```

## String Interpolation

The most common way to build up strings in Swift is _string interpolation_. To insert a value into a string using string interpolation, you place an expression or value in parentheses which are preceded by a backslash character.

```swift
let radius = 5.0
let interp = "The area of a circle with radius \(radius) is \(Double.pi * radius * radius)"
// => "The area of a circle with radius 5.0 is 78.53981633974483"
```

## String and Character equality

Strings and Characters can be compared for equality (or lack thereof) using the `==` operator (or `!=` for not-equal).

```swift
let hi = "Hello"
hi == "Hello."
// => true

let period: Character = "."
period != ";"
// => true
```

## String and Character properties

Strings and characters have a few different _properties_ which can be queried to get information about the string or character. These are queried by placing a ._propertyName_ after the string or character in question. For example, one can check to see if a string is empty by querying its `isEmpty` property, and the count of characters in a string can be retrieved using its `count` property.

Character properties are mostly based on the type of character it is. For example, one can check to see if a character `isNumber`, `isLetter`, `isUppercase`, etc.

```swift
empty.isEmpty
// => true
fam.count
// => 60
```

## Instructions

In this exercise you'll be writing code to help a sign company create custom messages for their signs.

## 1. Create a set of useful strings

Define the following constant strings which will be used to create signs:

- `birthday`: This holds the value "Birthday"
- `valentine`: This holds the value "Valentine's Day"
- `anniversary`: This holds the string "Anniversary"

## 2. Create a set of useful characters

Define the following constant characters which will be used to create signs:

- `space`: This holds the value " " (a single space)
- `exclamation`: This holds the value "!"

## 3. Combine phrases to build up messages

Implement the function `buildSign(for: String, name: String) -> String`. This function takes one of the three strings you defined in the first task as the `for` parameter and a String holding someone's name as the `name` parameter and uses concatenation as well as the characters defined in task #2 to build up a phrase for a sign.

```swift
buildSign(for: birthday, name: "Otto")
// => "Happy Birthday Otto!"

buildSign(for: anniversary, name: "Valentina")
// => "Happy Anniversary Valentina!"
```

## 4. Build a graduation sign

Implement the function `graduationFor(name: String, year: Int) -> String` which takes a name as a string parameter and a year as a integer parameter and uses string interpolation to create a phrase for a sign that uses a newline to separate the two lines of the message.

```swift
graduationFor(name: "Padma", year: 2020)
// => "Congratulations Padma!\nClass of 2020"
```

## 5. Compute the cost of a sign

Implement the function `costOf(sign: String) -> Int` which takes a string that holds the contents of the sign and returns the cost to create the sign, which is 2 dollars for each character in the sign plus a base price of 20 dollars.

```swift
costOf(sign: "Happy Birthday Grandma!")
// => 66
```

## Source

### Created by

- @wneumann