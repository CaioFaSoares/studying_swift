func dailyRateFrom(hourlyRate: Int) -> Double {
  return Double(hourlyRate * 8)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  return (22 * dailyRateFrom(hourlyRate: hourlyRate) * (100 - discount)/100).rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  let discountedDailyRate: Double = (dailyRateFrom(hourlyRate: hourlyRate) * (100 - discount)/100)
  return (budget/discountedDailyRate).rounded(.down)
}

/*

budget / daily rate * desconto para saber quantos dias eu tenho

*/
