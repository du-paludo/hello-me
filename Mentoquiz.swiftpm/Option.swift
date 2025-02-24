import SwiftUI

class Option: Identifiable {
    let id = UUID()
    let text: String?
    let image: String?
    let mentorsRelated: [Mentor]
    
    init(text: String?, image: String?, mentorsRelated: [Mentor]) {
        self.text = text
        self.image = image
        self.mentorsRelated = mentorsRelated
    }
}
