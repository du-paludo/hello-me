import SwiftUI

@Observable class QuizDatabase {
    private let questions: [Question] = [
        Question(text: "Qual é a sua fruta preferida?", options: [
            Option(text: "Não gosto de fruta", image: "no-fruits", mentorsRelated: [.nat, .theo]),
            Option(text: "Tâmara", image: "tamara", mentorsRelated: [.isoo]),
            Option(text: "Abacate", image: "abacate", mentorsRelated: [.flora, .naomi, .gabi]),
            Option(text: "Limão", image: "limão", mentorsRelated: [.mari, .jujuba, .afonso, .munhoz, .eduardo])
        ]),
        Question(text: "Qual seu espírito animal?", options: [
            Option(text: "Macaco de Gibraltar", image: "mg", mentorsRelated: [.isoo, .afonso, .theo, .eduardo]),
            Option(text: "Onça-pintada", image: "op", mentorsRelated: [.mari, .gabi]),
            Option(text: "Pangolin", image: "pan", mentorsRelated: [.nat, .munhoz, .flora, .naomi]),
            Option(text: "𝘈𝘦𝘥𝘦𝘴 𝘢𝘦𝘨𝘺𝘱𝘵𝘪", image: "aa", mentorsRelated: [.jujuba])
        ]),
        Question(text: "Qual seu objeto da Ada favorito?", options: [
            Option(text: "Caneta de giz (tá seca)", image: "caneta", mentorsRelated: [.afonso, .munhoz, .gabi]),
            Option(text: "Monolito", image: "monolito", mentorsRelated: [.jujuba, .theo]),
            Option(text: "Cafeteira", image: "caf", mentorsRelated: [.isoo, .mari]),
            Option(text: "Cadeiras Ergonômicas", image: "cadeiras", mentorsRelated: [.nat, .flora, .naomi, .eduardo])
        ]),
        Question(text: "Se você pudesse mudar de nome, para qual seria?", options: [
            Option(text: "Dadeshkeliani", image: nil, mentorsRelated: [.nat, .jujuba, .afonso, .theo]),
            Option(text: "Ambroży", image: nil, mentorsRelated: [.mari, .munhoz, .gabi]),
            Option(text: "João", image: nil, mentorsRelated: [.isoo, .eduardo]),
            Option(text: "Binder Jr.", image: nil, mentorsRelated: [.flora, .naomi])
        ]),
        Question(text: "Se você fosse um dispositivo apple, qual você seria?", options: [
            Option(text: "Airtag", image: "airtag", mentorsRelated: [.nat, .munhoz, .gabi]),
            Option(text: "Cabo lightning", image: "lightning", mentorsRelated: [.mari]),
            Option(text: "Magsafe", image: "magsafe", mentorsRelated: [.isoo, .eduardo]),
            Option(text: "Galaxy", image: "galaxy", mentorsRelated: [.jujuba, .afonso, .flora, .theo, .naomi])
        ]),
        Question(text: "Que horas você seria?", options: [
            Option(text: "3:00", image: nil, mentorsRelated: [.munhoz, .eduardo]),
            Option(text: "10:25", image: nil, mentorsRelated: [.mari, .flora, .theo]),
            Option(text: "17:53", image: nil, mentorsRelated: [.isoo, .naomi, .gabi]),
            Option(text: "23:99", image: nil, mentorsRelated: [.nat, .jujuba, .afonso])
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
