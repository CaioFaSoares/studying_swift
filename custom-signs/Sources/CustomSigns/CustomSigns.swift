// TODO: define the 'birthday' String constant
let birthday: String = "Birthday"
// TODO: define the 'valentine' String constant
let valentine: String = "Valentine's Day"
// TODO: define the 'anniversary' String constant
let anniversary: String = "Anniversary"
// TODO: define the 'space' Character constant
let space: Character = " "
// TODO: define the 'exclamation' Character constant
let exclamation: Character = "!"

func buildSign(for occasion: String, name: String) -> String {
  let message = "Happy \(occasion) \(name)!"
  return message
}

func graduationFor(name: String, year: Int) -> String {
  let message = "Congratulations \(name)!\nClass of \(year)"
  return message
}

func costOf(sign: String) -> Int {
  let str = "\(sign)"
  let len = str.count 
  let price = 20 + 2*(len)
  return price
}
