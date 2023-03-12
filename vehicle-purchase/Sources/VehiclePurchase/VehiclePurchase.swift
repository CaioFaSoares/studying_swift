func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
  let valueIsAcessible = (100 * monthlyBudget ) / price
        if (valueIsAcessible >= 10) {
            return "Yes! I'm getting a \(vehicle)"

        }
        else if ( valueIsAcessible < 10 && valueIsAcessible >= 1){
            return "I'll have to be frugal if I want a 2020 Indian FTR 1200"
        }
        else {
            return "Darn! No 2011 Bugatti Veyron for me"
        }
}

func licenseType(numberOfWheels wheels: Int) -> String {
  if(wheels == 2) {
    return "You will need a motorcycle license for your vehicle"
  }
  else if(wheels == 8 || wheels == 6){
    return "You will need an automobile license for your vehicle"
  }
  else if(wheels == 18){
    return "You will need a commercial trucking license for your vehicle"
  }
  else {
    return "We do not issue licenses for those types of vehicles"
  }
}

func registrationFee(msrp: Int, yearsOld: Int) -> Int {
  if(yearsOld >= 10){
    return 25
  }
  else if (yearsOld == 0 && msrp > 25000){
    let fee = msrp/100
    return fee
  }
  else if (yearsOld == 0 && msrp <= 25000){
    let fee = 25000/100
    return 250
  }       
  else {
        var msrpValue = Double(msrp)
        for _ in 0...yearsOld{
          msrpValue *= 0.9
        }
        msrpValue /= 100
        return Int(msrpValue)
      }
}
