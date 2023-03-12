// Define the 'Nucleotide' enum, its `init`, and its `complementOfDNA` method

enum Nucleotide {
    case A, C, G, T, U


    func complementOfDNA() -> Nucleotide? {
        switch self {
        case .A:
            return .A
        case .C:
            return .C
        case .G:
            return .G
        case .T:
            return .T
        default:
            return nil
        }
    }

    init(Nucleotide: String) {
        
    }

}