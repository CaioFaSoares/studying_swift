let point = (556, 0)
switch point {
case (let x, 0):
    print("X was \(x)")
case (0, let y):
    print("Y was \(y)")
case let (x, y):
    print("X was \(x) and Y was \(y)")
}
