func dailyRateFrom(hourlyRate: Int) -> Double {
  return  Double(hourlyRate * 8)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  
  let month = 22 * dailyRateFrom(hourlyRate: hourlyRate)
  let thisDiscount = (month * discount)/100
  let price = month - thisDiscount
  
  return (price).rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  
  let discountedDailyRate: Double = (dailyRateFrom(hourlyRate: hourlyRate) * (100 - discount)/100)
  return (budget/discountedDailyRate).rounded() 

}
