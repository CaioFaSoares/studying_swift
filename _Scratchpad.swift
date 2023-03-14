import Foundation

let cart = (x: 11.713, y: 5.6405)

let radius  = sqrt(pow(cart.0, 2) + pow(cart.1, 2))
let phi     = atan2(cart.1, cart.0)
let returnTuple = (radius, phi)

print(returnTuple)
