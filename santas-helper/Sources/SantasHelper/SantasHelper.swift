import Foundation

func cartesianToPolar(_ cart: (x: Double, y: Double)) -> (r: Double, phi: Double) {
  //fatalError("Please implement the cartesianToPolar(_:) function.")
  let radius      = sqrt(pow(cart.0, 2) + pow(cart.1, 2))
  let phi         = atan2(cart.1, cart.0)

  return (radius, phi)
}

func combineRecords(
  production: (toy: String, id: Int, productLead: String),
  gifts: (Int, [String])
) -> (id: Int, toy: String, productLead: String, recipients: [String]) {
  //fatalError("Please implement the combineRecords(production:gifts:) function.")
  return (production.1, production.0, production.2, gifts.1)
}
