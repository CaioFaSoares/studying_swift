import Foundation

func sliceSize(
  diameter: Double?,
  slices: Int?
  ) -> Double? {
  //fatalError("Please implement the sliceSize(diameter:slices:) function")

  guard let validatedDiamenter  = diameter else { return nil }
  guard let validatedSlices     = slices else { return nil }

  if validatedDiamenter <= 0 && validatedDiamenter <= 0 { return nil }

  let areaOfPizza = Double.pi * pow(validatedDiamenter/2, 2)
  return areaOfPizza / Double(validatedSlices)

}

func biggestSlice(
  diameterA: String, slicesA: String,
  diameterB: String, slicesB: String
  ) -> String {
  //fatalError("Please implement the biggestSlice(diameterA:slicesA:diameterB:slicesB:) function")

  let calculatedA = sliceZie(diameter: Double(diameterA), slice: Int(slicesA))
  let calculatedB = sliceZie(diameter: Double(diameterB), slice: Int(slicesB))

  guard sliceA != sliceB else { return "Neither slice is bigger" }
  guard let calculatedA = sliceA else { return "Slice B is bigger" }
  guard let calculatedB = sliceB else { return "Slice A is bigger" }

  return sliceA > sliceB ? "Slice A is bigger" :

}
