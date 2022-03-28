//
//  QuestionViewController.swift
//  CheckTest
//
//  Created by Nikita Yashin on 27.03.2022.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var questionLabel: UILabel!
    
    private let questions = Question.getQuestion()
    private var questionIndex = 0
//    private var answersChosen: [Answer] = []
    private var answersChosen = [
        "БУСТ",
        "К-18",
        "К-9",
        "К-22",
        "Независимая",
        "жопа",
        "Вилка",
        "1/15 и 1/6",
        "Менее 650В",
        "Маневровый"
    ]
    
    private var currentAnswer: [Answer] {
        questions[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultsViewController else { return }
        resultVC.currentAnswers = answersChosen
    }
    
//    @IBAction func answerButtonPressed(_ sender: UIButton) {
//        guard let currentIndex = buttons.firstIndex(of: sender) else { return }
//        let currentAnswer = currentAnswers[currentIndex]
//        answerChosen.append(currentAnswer)
//        nextQuestion()
//
//    }
//}
//
//extension QuestionsViewController {
//    private func updateUI() {
//        let currentQuestion  = questions[questionIndex]
//        questionLabel.text = currentQuestion.title
//        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
//        showCurrentAnswers()
//    }
//
//    private func showCurrentAnswers(with answers: currentAnswer) {
//        for (button, answer) in zip(buttons, answers) {
//            button.setTitle(answer.title, for: .normal)
//        }
//    }
//
//    private func nextQuestion() {
//        questionIndex += 1
//        if questionIndex < questions.count {
//            updateUI()
//            return
//        }
//        performSegue(withIdentifier: "showResult", sender: nil)
//    }
}
