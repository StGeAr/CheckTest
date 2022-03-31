//
//  DevelopersViewController.swift
//  CheckTest
//
//  Created by D D on 30.03.2022.
//

import UIKit

class DevelopersViewController: UIViewController {

   
    @IBOutlet weak var devTitle: UILabel!
    
    @IBOutlet var autorsName: [UILabel]!
    
    @IBOutlet var imageMultipleViews: [UIImageView]! {
        didSet {
            for image in imageMultipleViews {
                image.layer.cornerRadius = image.frame.height / 2
            }
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
        devTitle?.textColor = Theme.currentTheme.textColor
        
        for name in autorsName {
            name.textColor = Theme.currentTheme.textColor
        }
    }
}
