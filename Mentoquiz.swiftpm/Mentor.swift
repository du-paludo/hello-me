import SwiftUI

enum Mentor: CaseIterable {
    case eduardo
    case gabi
    case isoo
    case mari
    case nat
    case naomi
    case jujuba
    case theo
    case afonso
    case munhoz
    case flora
    
    var name: String {
        switch self {
        case .eduardo:
            "Du Paludo"
        case .gabi:
            "Gabi"
        case .isoo:
            "Isoo"
        case .mari:
            "Mari"
        case .nat:
            "Nat"
        case .naomi:
            "Naomi"
        case .jujuba:
            "Jujuba"
        case .theo:
            "Theo"
        case .afonso:
            "Afonso"
        case .munhoz:
            "Munhoz"
        case .flora:
            "Flora"
        }
    }
}
