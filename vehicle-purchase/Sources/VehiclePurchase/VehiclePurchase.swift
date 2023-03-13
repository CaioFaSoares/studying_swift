func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {

    let vehicleMonthlyPrice: Double = price / (12 * 5)

    if vehicleMonthlyPrice <= monthlyBudget * 1.1 && vehicleMonthlyPrice > monthlyBudget {
        return "I'll have to be frugal if I want a \(vehicle)"
    } else if vehicleMonthlyPrice <= monthlyBudget {
        return "Yes! I'm getting a \(vehicle)"
    } else {
        return "Darn! No \(vehicle) for me"
    }

}

func licenseType(numberOfWheels wheels: Int) -> String {

    switch wheels {
        case 2...3:
        return "You will need a motorcycle license for your vehicle"
        case 4...6:
        return "You will need an automobile license for your vehicle"
        case 18:
        return "You will need a commercial trucking license for your vehicle"
        default:
        return "We do not issue licenses for those types of vehicles"
    }

}

func registrationFee(msrp: Int, yearsOld: Int) -> Int {

    let flatFee     = 25
    let baseCost    = 25000
    var price       = 0

    if yearsOld >= 10 {
        return flatFee
    }

    if msrp > baseCost {
        price = msrp
    } else {
        price = baseCost
    }

    return (price - ((Int(Double(price) * 0.1))*yearsOld))/100

}
