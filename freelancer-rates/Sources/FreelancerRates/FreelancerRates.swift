import Foundation
func dailyRateFrom(hourlyRate: Int) -> Double {
  return Double(hourlyRate * 8)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  return Double(22 * dailyRateFrom(hourlyRate: hourlyRate) * (100 - discount )/100).rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  let discountDailyRate:Double = dailyRateFrom(hourlyRate:hourlyRate) * (100-discount)/100
  var a = Double(floor(budget/discountDailyRate))
  return a
}

