//
//  ViewController.swift
//  CheckTest
//
//  Created by Герман Ставицкий on 25.03.2022.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var settingTitle: UILabel!
    
    @IBOutlet weak var startButton: UIButton! {
        didSet {
            startButton.layer.cornerRadius = 5
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  }
  
    override func viewWillAppear(_ animated: Bool) {
        setupTheme()
    }
    
    func setupTheme() {
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        settingTitle?.textColor = Theme.currentTheme.textColor
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {}
}

