func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
    
    let pricePerMonthToBeMet = price / 5 * 12
    let frugalBudget = monthlyBudget * 1.1

    if frugalBudget > pricePerMonthToBeMet && monthlyBudget < pricePerMonthToBeMet {
        return("You'd have to be frugal to get a" + vehicle)
    } else if monthlyBudget > pricePerMonthToBeMet {
        return("Great, you can afford" + vehicle)
    } else {
        return("Sorry, but no " + vehicle + "to you...")
    }
    
}

func licenseType(numberOfWheels wheels: Int) -> String {
  fatalError("Please implement licenseType(numberOfWheels:) function")
}

func registrationFee(msrp: Int, yearsOld: Int) -> Int {
  fatalError("Please implement registrationFee(msrp:yearsOld:) function")
}
