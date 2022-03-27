//
//  ResultsViewController.swift
//  CheckTest
//
//  Created by Герман Ставицкий on 27.03.2022.
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
    
//    // MARK: - Это то что я планирую принимать
//    let correctAnswers = Question.getCorrectResults()
//    var currentAnswers: [Answer]!
    
    // MARK: - Это костыль, просто создал массивы чтобы проверить работу приложения
    let correctAnswers: [String] =  ["3", "9", "70", "заяц", "лось"]
    let currentAnswers: [String] = ["3", "9", "20", "кошка", "лось"]
    
    // MARK: - Этот геттер я отправлять буду Кириллу
    private var incorrectAnsweredQuestions: [Int] {
        var questionNumber: [Int] = []
        for currentAnswer in currentAnswers {
            if !correctAnswers.contains(currentAnswer) {
                if let index = currentAnswers.firstIndex(of: currentAnswer) {
                    questionNumber.append(index)
                }
            }
        }
        return questionNumber
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResultInfo()
    }
    
//    // MARK: - Navigation
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
