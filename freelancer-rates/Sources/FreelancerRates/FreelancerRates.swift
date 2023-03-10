func dailyRateFrom(hourlyRate: Int) -> Double {
  return Double(8 * hourlyRate)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  return (22 * dailyRateFrom(hourlyRate: hourlyRate) * 100 - discount)
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  return Double(budget / (dailyRateFrom(hourlyRate: hourlyRate) * 100 - discount))
}
