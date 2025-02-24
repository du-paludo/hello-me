import SwiftUI

enum Mentor: CaseIterable {
    case eduardo
    case gabi
    
    var name: String {
        switch self {
        case .eduardo:
            "Du Paludo"
        case .gabi:
            "Gabi"
        }
    }
}
