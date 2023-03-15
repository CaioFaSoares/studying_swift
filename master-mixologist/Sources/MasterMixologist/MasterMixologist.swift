func timeToPrepare(drinks: [String]) -> Double { // For in Loops
  var totalTime: Double = 0
  for drink in drinks {
    switch drink {
      case "shot":
        totalTime += 1
      case "mixed drink":
        totalTime += 1.5
      case "fancy drink":
        totalTime += 2.5
      case "frozen drink":
        totalTime += 3
      default:
        totalTime += 0.5
    }
  }
  return totalTime
}

func makeWedges(needed: Int, limes: [String]) -> Int {
  var freshlyCutLimes = 0
  for lime in limes {
    switch lime {
      case "small":
        freshlyCutLimes += 6
      case "medium":
        freshlyCutLimes += 8
      default:
        freshlyCutLimes += 10
    }
  }
  return freshlyCutLimes
}

func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
  /*
  var ordersLeft = remainingOrders
  while minutesLeft > .zero {
    Double(minutesLeft) - timeToPrepare(drinks: ordersLeft.first)
    ordersLeft.removeFirst()
  }
  return ordersLeft
  */

  var arrayOfStandindOrders = remainingOrders
  var actualMinutesLeft = Double(minutesLeft)

  repeat {
    guard let timeForThisTask = timeToPrepare(drinks: arrayOfStandindOrders.first) else { break }
    actualMinutesLeft -= timeForThisTask
    arrayOfStandindOrders.removeFirst()
  } while actualMinutesLeft > 0

  return arrayOfStandindOrders
}

func orderTracker(orders: [(drink: String, time: String)]) -> (
  beer: (first: String, last: String, total: Int)?, soda: (first: String, last: String, total: Int)?
) {
  /*
  func findTarget(od orders: [(drink: String, time: String)], drink targDrink: String) -> (first: String, last: String, total: Int) {
    var timesItRepeated: Int = 0
    var firstTimeItShowedUp: String
    var lastTimeItShowedUp: String

    for order in orders {
      if order.0 == targDrink {
        timesItRepeated += 1
        firstTimeItShowedUp = order.1
        break
      }
    }
    for order in orders {
      if order.0 == targDrink {
        timesItRepeated += 1
        lastTimeItShowedUp = order.1
      }
    }

    return (first: firstTimeItShowedUp, last: lastTimeItShowedUp, total: timesItRepeated)
  }

  return (beer: findTarget(od: orders, drink: "beer"), soda: findTarget(od: orders, drink: "beer"))
  */

  return ((first: "String", last: "String", total: 1),(first: "String", last: "String", total: 2))
}
