//
//  QuestionsViewController.swift
//  CheckTest
//
//  Created by Nikita Yashin on 31.03.2022.
//

import UIKit

class QuestionsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionProgressLine: UIProgressView!
    @IBOutlet weak var button1: UIButton!
    
    //MARK: - Private properties
    private let questions = Question.getQuestion()
    private var questionIndex = 0
    private var answersChosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    //MARK: - Life cycles methods
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in buttons {
       button.layer.cornerRadius = 5
        }
        updateUI()
        setupTheme()
    }
    
    // MARK: - IBActions
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let currentIndex = buttons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[currentIndex]
        answersChosen.append(currentAnswer)
        nextQuestion()
    }
}

//MARK: - Private methods
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

// MARK: - Navigation
extension QuestionsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultsViewController else { return }
        resultVC.answersChosen = answersChosen
    }
}

// MARK: - Design
extension QuestionsViewController {
    func setupTheme() {
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        questionLabel?.textColor = Theme.currentTheme.textColor
        navigationController?.navigationBar.largeTitleTextAttributes = [ NSAttributedString.Key.foregroundColor:Theme.currentTheme.textColor
        ]
    }
}
