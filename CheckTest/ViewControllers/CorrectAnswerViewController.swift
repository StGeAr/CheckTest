//
//  CorrectAnswerViewController.swift
//  CheckTest
//
//  Created by Кирилл on 30.03.2022.
//

import UIKit

class CorrectAnswerViewController: UITableViewController {

    let someArray = [0, 3, 4]
    var answers: [Int]!
    
    
    let numbers = ["Вопроос П-1", "Вопроос П-2", "Вопроос П-3", "Вопроос П-4"]
    
    let questions = ["Что не входит в состав блока тормозного оборудования (БТО)?", "Какой вентиль включает в работу кран машиниста?", "Какой вентиль включает в работу тормоз от АРС?", "Какой вентиль предназначен для отжатия башмаков токоприёмников?"]
    
    let correctAnswers = ["Вентиль В-7", "В-4", "В-6", "В-1"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(answers ?? "")

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        someArray.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        numbers[section]
            }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showCorrectAnswers", for: indexPath)
        
        
        let question = questions[indexPath.section]
        let correctAnswer = correctAnswers[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            content.text = question
        default:
            content.text = correctAnswer
        }
        
        cell.contentConfiguration = content
                
        return cell
    }


}
