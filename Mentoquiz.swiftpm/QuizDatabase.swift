import SwiftUI

@Observable class QuizDatabase {
    private let questions: [Question] = [
        Question(text: "Qual é a sua fruta preferida?", options: [
            Option(text: "Banana", image: "banana", mentorsRelated: [.eduardo]),
            Option(text: "Uva", image: nil, mentorsRelated: [.eduardo]),
            Option(text: "Melancia", image: nil, mentorsRelated: [.eduardo]),
            Option(text: "Torta", image: nil, mentorsRelated: [.eduardo])
        ]),
        Question(text: "Qual é a sua fruta preferida?", options: [
            Option(text: "Banana", image: nil, mentorsRelated: [.eduardo]),
            Option(text: "Uva", image: nil, mentorsRelated: [.eduardo]),
            Option(text: "Melancia", image: nil, mentorsRelated: [.eduardo]),
            Option(text: "Torta", image: nil, mentorsRelated: [.eduardo])
        ]),
    ]
    
    private var mentorPoints: [Mentor : Int] = [:]
    
    private var currentIndex: Int = 0
    
    init() {
        for mentor in Mentor.allCases {
            mentorPoints[mentor] = 0
        }
    }
    
    func restartQuiz() {
        currentIndex = 0
        for mentor in Mentor.allCases {
            mentorPoints[mentor] = 0
        }
    }
    
    func hasFinished() -> Bool {
        return currentIndex >= questions.count
    }
    
    func getHighestScoreMentor() -> Mentor {
        return mentorPoints.max(by: {$0.value < $1.value})?.key ?? .gabi
    }
    
    func getCurrentQuestion() -> Question {
        if currentIndex < questions.count {
            return questions[currentIndex]
        } else {
            return questions[0]
        }
    }
    
    func answerQuestion(mentors: [Mentor]) {
        currentIndex += 1
        for mentor in mentors {
            mentorPoints[mentor]! += 1
        }
    }
}
