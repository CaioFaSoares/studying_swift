import Foundation

func cartesianToPolar(_ cart: (x: Double, y: Double)) -> (r: Double, phi: Double) {
  let radius = sqrt(pow(cart.0,2)+pow(cart.1,2))
  let phi = atan2(cart.1,cart.0)

  return (radius,phi)
}

func combineRecords(
  production: (toy: String, id: Int, productLead: String), gifts: (Int, [String]) ) -> (id: Int, toy: String, productLead: String, recipients: [String]) {
    let (giftId, recipients) = gifts 
    let (toy, id, productLead) = production
  return (id: id, toy: toy, productLead: productLead, recipients: recipients)
}
