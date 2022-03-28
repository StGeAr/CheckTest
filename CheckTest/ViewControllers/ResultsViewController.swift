//
//  ResultsViewController.swift
//  CheckTest
//
//  Created by Герман Ставицкий on 28.03.2022.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var resultTypeLabel: UILabel!
    @IBOutlet var resultNumberLabel: UILabel!
    @IBOutlet var correctAnswersButton: UIButton! {
        didSet {
            correctAnswersButton.isHidden = true
        }
    }

    var answersChosen: [Answer]!
    var correctAnswers: [String] {
        let questions = Question.getQuestion()
        var answers: [String] = []
        for index in 0..<questions.count {
            answers.append(questions[index].correctAnswer)
        }
        return answers
    }
    
    // MARK: - Этот геттер я отправлять буду Кириллу
//    private var incorrectAnsweredQuestions: [Int] {
//        let currentAnswers = answersChosen.map { $0.title }
//        var questionNumber: [Int] = []
//        for currentAnswer in currentAnswers {
//            if !correctAnswers.contains(currentAnswer) {
//                if let index = currentAnswers.firstIndex(of: currentAnswer) {
//                    questionNumber.append(index)
//                }
//            }
//        }
//        return questionNumber
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResultInfo()
    }

    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard
//            let navigationVC = segue.destination as? UINavigationController
//        else {
//            return
//        }
//        guard
//            let correctAnswersVC = navigationVC.topViewController as? RightAnswersViewController
//        else {
//            return
//        }
//            correctAnswersVC.answers = incorrectAnsweredQuestions
//    }

    private func updateResultInfo() {
        let currentAnswers = answersChosen.compactMap { $0.title }
        if currentAnswers == correctAnswers {
            resultTypeLabel.text = "Поздравляем! Вы ответили на все вопросы!"
            resultNumberLabel.text = "Верно \(currentAnswers.count) из \(correctAnswers.count)"
        } else {
            var answers: [String] = []

            for currentAnswer in currentAnswers {
                if correctAnswers.contains(currentAnswer) {
                    answers.append(currentAnswer)
                }
            }

            resultTypeLabel.text = "Упс! Вам необходимо повторить теорию!"
            resultNumberLabel.text = "Верно \(answers.count) из \(correctAnswers.count)"
            correctAnswersButton.isHidden = false
        }
    }
}
