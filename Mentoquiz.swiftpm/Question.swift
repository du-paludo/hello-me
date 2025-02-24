import SwiftUI

class Question {
    let text: String
    let options: [Option]
    
    init(text: String, options: [Option]) {
        self.text = text
        self.options = options
    }
}
