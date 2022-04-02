//
//  ViewController.swift
//  CheckTest
//
//  Created by Герман Ставицкий on 25.03.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var settingTitle: UILabel!
    @IBOutlet var startButton: UIButton! {
        didSet {
            startButton.layer.cornerRadius = 10
        }
    }

    //MARK: - Life cycles methods
    override func viewWillAppear(_ animated: Bool) {
        setupTheme()
    }
}

// MARK: - Design
extension StartViewController {
    private func setupTheme() {
        view.backgroundColor = Theme.currentTheme.backgroundColor
        settingTitle?.textColor = Theme.currentTheme.textColor
    }
}

// MARK: - Navigation
extension StartViewController {
    @IBAction func unwind(for segue: UIStoryboardSegue) {}
}

