//
//  RightAnswersViewController.swift
//  CheckTest
//
//  Created by Кирилл on 27.03.2022.
//

import UIKit

class RightAnswersViewController: UITableViewController {

    //MARK: - Public properties
        var incorrectAnsweredQuestionNumbers: [Int]!
        let questions = Question.getQuestion()
        
        //MARK: - Life cycles methods
        override func numberOfSections(in tableView: UITableView) -> Int {
            incorrectAnsweredQuestionNumbers.count
        }
        
        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            let questionNumber = incorrectAnsweredQuestionNumbers[section] + 1
            return "Вопрос №\(questionNumber)"
        }
            
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            2
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "showCorrectAnswers", for: indexPath)
            
            let question = questions[incorrectAnsweredQuestionNumbers[indexPath.section]]
            
            var content = cell.defaultContentConfiguration()
            
            switch indexPath.row {
            case 0:
                content.text = question.title
            default:
                content.text = "Правильный ответ: \(question.correctAnswer)"
            }
            
            cell.contentConfiguration = content
            
            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
}

