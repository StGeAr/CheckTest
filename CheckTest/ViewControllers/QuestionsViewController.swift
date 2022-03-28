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
    @IBOutlet var questionProgressLine: UIProgressView!
    
    private let questions = Question.getQuestion()
    private var questionIndex = 0
    private var answersChosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultsViewController else { return }
        resultVC.answersChosen = answersChosen
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let currentIndex = buttons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[currentIndex]
        answersChosen.append(currentAnswer)
        nextQuestion()
    }
}

extension QuestionsViewController {
    private func updateUI() {
        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.title
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionProgressLine.setProgress(totalProgress, animated: true)
        showCurrentAnswers(with: currentAnswers)
    }

    private func showCurrentAnswers(with answers: [Answer]) {
        for (button, answer) in zip(buttons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }

    private func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
            return
        }
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}
