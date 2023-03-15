import Foundation
// TODO: define the 'remainingMinutesInOven' function  ## Default parameter values
func remainingMinutesInOven(
    elapsedMinutes: Int,
    expectedMinutesInOven: Int = 40
    ) -> Int {
        return (expectedMinutesInOven - elapsedMinutes)
}

// TODO: define the 'preparationTimeInMinutes' function ## Variadic parameters
func preparationTimeInMinutes(layers: String...) -> Int {
    return layers.count * 2
}

// TODO: define the 'quantities' function ## Multiple return values
func quantities(layers: String...) -> (noodles: Int, sauce: Double) {
    var neededNoodles: Int  = 0
    var neededSauce: Double = 0

    for layer in layers {
        if layer == "noodles" {
            neededNoodles += 3
        } else if layer == "sauce" {
            neededSauce += 0.2
        }
    }
    return (noodles: neededNoodles, sauce: neededSauce)
}

// TODO: define the 'toOz' function ## In-out parameters
func toOz(_ ingredients: inout (noodles: Int, sauce: Double)) {
    ingredients.1 *= 33.814
}

// TODO: define the 'redWine' function ## Nested functions
func redWine(layers: String...) -> Bool {

    func countEach(_ targetIngredient: String) -> Int {
        var count = 0
        for layer in layers {
            if targetIngredient == layer {
                count += 1
            }
        }
        return count
    }

    let isWhite = countEach("mozzarella") + countEach("béchamel") + countEach("ricotta")
    let isRed   = countEach("meat") + countEach("sauce")

    if isRed >= isWhite {
        return true
    }

    return false
}
