//
//  Question.swift
//  CheckTest
//
//  Created by Masaie on 27/3/22.
//

import Foundation

struct Question {
    let title: String
    let answers: [Answer]
    let correctAnswer: String
}

struct Answer {
    let title: String
}

extension Question {
    static func getQuestion() -> [Question] {
        var questions: [Question] = []
        
        let titles = DataManager.shared.titles
        let answers = DataManager.shared.answers
        let correctAnswers = DataManager.shared.correctAnswers
        
        for index in 0..<titles.count {
            let question = Question(
                title: titles[index],
                answers: [
                    Answer(title: answers[index][0]),
                    Answer(title: answers[index][1]),
                    Answer(title: answers[index][2])
                ],
                correctAnswer: correctAnswers[index]
            )
            questions.append(question)
        }

        return questions
    }
}
