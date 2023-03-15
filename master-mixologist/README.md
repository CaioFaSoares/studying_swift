# Master Mixologist

Welcome to Master Mixologist on Exercism's Swift Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

There are three primary types of loop constructs in Swift: while loops, repeat-while loops, and for-in loops.

## while loops

While loops in Swift have the following structure:

```swift
while boolean-expression {
  loop-body
}
```

The loops begin by first evaluating a Boolean expression. If the expression evaluates to `false`, then the body of the loop is skipped and execution begins on the first line following the loop. If the condition evaluates to `true`, then the body of the loop is executed, after which the Boolean expression is evaluated again, repeating this way until the Boolean expression evaluates to false.

```swift
var count = 3
while count > 0 {
  print("\(count)…")
  count -= 1
}
print("Liftoff!")

// prints:
// 3…
// 2…
// 1…
// Liftoff!
```

## repeat-while loops

Repeat-while loops are similar to while loops, however, these loops differ in that the Boolean expression appears, and is evaluated, _after_ the body of the loop is executed. As a result, these loops always execute at least once.

```swift
repeat {
  print("This runs at least once")
} while false
print("Loop done")

// prints:
// This runs at least once
// Loop done
```

## for-in loops

For-in loops are used to iterate over a sequence of values, taking each element in turn, binding it to a variable or constant name of the developer's choosing, then executes a block of code that may refer to the element. When every element of the sequence has been iterated over, the loop exits and execution begins with the first line following the body of the loop.

```swift
let numbers = [3, 10, 7, 11]

for number in numbers {
  print("\(number) / 2 = \(number / 2)")
}
print("Done with numbers")

// prints:
// 3 / 2 = 1
// 10 / 2 = 5
// 7 / 2 = 3
// 11 / 2 = 5
// Done with numbers
```

## Control transfer

Sometimes it is necessary to skip to the next iteration of a loop early, without completing the rest of the statements in the current iteration of the loop. The `continue` keyword can be used for this. When `continue` is executed, the loop jump to the next check to see if the next iteration of the loop can be run, i.e. the `while` in while and repeat-while loops or the check if there's another element in the sequence in for-in loops.

```swift
count = 1
repeat {
  count += 1
  if count == 4 { continue }
  print(count)
} while count !=4 && count < 6
```

prints:

```
2
3
```

rather than:

```
2
3
5
6
```

## Instructions

You are a master mixologist, making tasty drinks for the public to enjoy on their nights out. But you figured that you could make your life easier by writing a bit of code to help you with your job.

## 1. Determine how long it takes to make an order

Different drinks take different amount of time to prepare: `"beer"`, `"soda"`, and `"water"` take 0.5 minutes each, `"shot"`s take 1.0 minutes, `"mixed drink"`s take 1.5 minutes, `"fancy drink"`s take 2.5 minutes and `"frozen drink"`s take 3.0 minutes.

Implement the function `timeToPrepare(drinks: [String]) -> Double` which takes a non-empty array of drinks and returns the total time required to make the order.

```swift
timeToPrepare(drinks: ["beer", "frozen drink", "shot"])
// => 4.5
```

## 2. Replenish your lime wedge supply

One of the first things you need to do when you start your shift is to make sure your little bin of lime wedges is full for the shift ahead. Implement the function `makeWedges(needed: Int, limes: [String]) -> Int`, which takes the number of lime wedges you need to cut and an array representing the supply of whole limes you have on hand. You can get 6 wedges from a "small" lime, 8 wedges from a "medium" lime and 10 from a "large" lime. While you still need more wedges and you still have more limes to cut up, take the first lime out of the array, and subtract the appropriate number of wedges from the amount you need. Keep going until you don't need any more wedges or you run out of limes.

Return the number of limes you cut up.

```swift
makeWedges(needed: 25, limes: ["small", "small", "large", "medium", "small"])
// => 4
```

## 3. Finish up your shift

Congratulations! Your long work day is nearly done and you will soon be going home to work on your new app. But you still have a stream of drink orders to make before you can hand off the orders to the next shift and leave.

Implement the function `finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]]` which takes in the number of minutes left in your shift (guaranteed to be greater than 0), and a non-empty array of drink orders. As long as you still have time left in your shift you are to make the first order in the Array and then remove that order from the array. You can then subtract the amount of time it took to prepare that order, according to your function `timeToPrepare(drinks:)` from the time left on your shift. Your function should return the array of orderes that you have not yet gotten to before the end of your shift.

And good news! If you make all of the orders with time left on your shift you get to go home early!

```swift
finishShift(minutesLeft: 5, remainingOrders: [["beer", "frozen drink", "shot"], ["fancy drink", "soda"], ["beer", "beer", "water"], ["mixed drink", "frozen drink"]])
// => [["beer", "beer", "water"], ["mixed drink", "frozen drink"]]
```

## 4. Track certain orders

In order to make sure the beer and soda stay fresh, you need to track their orders along with the times those orders were placed.

Implement the function `orderTracker(orders: [(drink: String, time: String)]) -> (beer: (first: String, last: String, total: Int)?, soda: (first: String, last: String, total: Int)?)` which, when given a list of orders and times return a pair of optional tuples containing the times of the first and last orders of beer and soda along with the total number of orders of each and `nil` if no orders for those beverages were made. You do not need to track any other drinks.

```swift
orderTracker(orders: [(drink: "beer", time: "10:01"), (drink: "frozen drink", time: "10:02"), (drink: "shot", time: "10:05"), (drink: "fancy drink", time: "10:06"), (drink: "soda", time: "10:09"), (drink: "beer", time: "10:15"), (drink: "beer", time: "10:22"), (drink: "water", time: "10:26"), (drink: "mixed drink", time: "10:28"), (drink: "frozen drink", time: "10:33")]

// => (beer: (first "10:01", last "10:22", total 3), soda: (first "10:09", last "10:09", total 1))
```

## Source

### Created by

- @wneumann