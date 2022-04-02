//
//  DevelopersViewController.swift
//  CheckTest
//
//  Created by D D on 30.03.2022.
//

import UIKit

class DevelopersViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var autorsName: [UILabel]!
    @IBOutlet var imageMultipleViews: [UIImageView]! {
        didSet {
            for image in imageMultipleViews {
                image.layer.cornerRadius = image.frame.height / 2
            }
        }
    }
    
    //MARK: - Life cycles methods
    override func viewWillAppear(_ animated: Bool) {
        setupTheme()
    }
}

// MARK: - Design
extension DevelopersViewController {
    private func setupTheme() {
        for name in autorsName {
            name.textColor = Theme.currentTheme.textColor
        }
        
        view.backgroundColor = Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor:Theme.currentTheme.textColor
        ]
    }
}
