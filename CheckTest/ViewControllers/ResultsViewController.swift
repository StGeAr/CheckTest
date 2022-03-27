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
    
//    let correctAnswers = Question.getCorrectResults()
//    var currentAnswers: [Answer]!
    
    let correctAnswers = ["3", "9", "70", "megan", "лось"]
    let currentAnswers = ["3", "9", "70", "megan", "лось"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResultInfo()
    }
    
//    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
        
    private func updateResultInfo() {
        if currentAnswers == correctAnswers {
            resultTypeLabel.text = "Поздравляем! Вы ответили на все вопросы!"
            resultNumberLabel.text = "Верно \(currentAnswers.count) из \(correctAnswers.count)"
        } else {
            resultTypeLabel.text = "Упс! Вам необходимо повторить теорию!"
            resultNumberLabel.text = "Верно \(currentAnswers.count) из \(correctAnswers.count)"
        }
    }
}
