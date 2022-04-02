//
//  ResultsViewController.swift
//  CheckTest
//
//  Created by Герман Ставицкий on 31.03.2022.
//

import UIKit

class ResultsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var resultTypeLabel: UILabel!
    @IBOutlet var resultNumberLabel: UILabel!
    @IBOutlet var correctAnswersButton: UIButton! {
        didSet {
            correctAnswersButton.isHidden = true
            correctAnswersButton.layer.cornerRadius = 10
        }
    }
    
    //MARK: - Public properties
    var answersChosen: [Answer]!
    
    //MARK: - Private properties
    private var correctAnswers: [String] {
        let questions = Question.getQuestion()
        var answers: [String] = []
        
        for question in questions {
            answers.append(question.correctAnswer)
        }
        return answers
    }
    
    private var incorrectAnsweredQuestionNumbers: [Int] {
        let currentAnswers = answersChosen.map { $0.title }
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

    //MARK: - Life cycles methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResultInfo()
        setupTheme()
    }
}

//MARK: - Private methods
extension ResultsViewController {
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

// MARK: - Navigation
extension ResultsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let navigationVC = segue.destination as? UINavigationController
        else {
            return
        }
        guard
            let correctAnswersVC = navigationVC.topViewController as? RightAnswersViewController
        else {
            return
        }
            correctAnswersVC.incorrectAnsweredQuestionNumbers = incorrectAnsweredQuestionNumbers
    }
}

// MARK: - Design
extension ResultsViewController {
    func setupTheme() {
        view.backgroundColor = Theme.currentTheme.backgroundColor
        resultTypeLabel?.textColor = Theme.currentTheme.textColor
        resultNumberLabel.textColor = Theme.currentTheme.textColor
    }
}
