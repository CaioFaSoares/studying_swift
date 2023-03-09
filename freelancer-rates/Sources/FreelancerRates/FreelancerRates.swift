func dailyRateFrom(hourlyRate: Int) -> Double {
  return Double(8 * hourlyRate)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  let month: Double = 22 * dailyRateFrom(hourlyRate: hourlyRate)
  let price: Double = month * (100 - discount)
  return price.rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  return Double(budget / (dailyRateFrom(hourlyRate: hourlyRate) * 100 - discount)).rounded()
}
