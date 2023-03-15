import Foundation

func sliceSize(
  diameter: Double?,
  slices: Int?
  ) -> Double? {
  //fatalError("Please implement the sliceSize(diameter:slices:) function")

  /*          ORIGINAL SOLUTION
  guard let validatedDiamenter  = diameter else { return nil }
  guard let validatedSlices     = slices else { return nil }

  if validatedDiamenter <= 0 && validatedDiamenter <= 0 { return nil }

  let areaOfPizza = Double.pi * pow(validatedDiamenter/2, 2)
  return areaOfPizza / Double(validatedSlices)
  */

  //          PRETTIER SOLUTION
  guard let diameter = diameter,
        let slices = slices,
        diameter >= .zero,
        slices > .zero
  else {
    return nil
  }

  return .pi * pow((diameter/2), 2) / Double(slices)

}

func biggestSlice(
  diameterA: String, slicesA: String,
  diameterB: String, slicesB: String
  ) -> String {
  //fatalError("Please implement the biggestSlice(diameterA:slicesA:diameterB:slicesB:) function")

  let sliceA = sliceSize(diameter: Double(diameterA), slices: Int(slicesA))
  let sliceB = sliceSize(diameter: Double(diameterB), slices: Int(slicesB))

  guard sliceA != sliceB else { return "Neither slice is bigger" }
  guard let sliceA = sliceA else { return "Slice B is bigger" }
  guard let sliceB = sliceB else { return "Slice A is bigger" }

  return sliceA > sliceB ? "Slice A is bigger" : "Slice B is bigger"

}
