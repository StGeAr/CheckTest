//
//  SettingsTableViewController.swift
//  CheckTest
//
//  Created by D D on 30.03.2022.
//

import UIKit


class SettingsViewController: UIViewController {
    
 
    @IBOutlet weak var settingTitle: UILabel!
    @IBOutlet weak var switchTheme: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchTheme.isOn = UserDefaults.standard.bool(forKey: "DarkTheme")
        setupTheme()
    }


    func setupTheme() {
        view.backgroundColor = Theme.currentTheme.backgroundColor
        settingTitle?.textColor = Theme.currentTheme.textColor
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:Theme.currentTheme.textColor]
    }
    
    
    @IBAction func changeAction(_ sender: UISwitch) {
        Theme.currentTheme = sender.isOn ? DarkTheme() : LightTheme()
        setupTheme()
        UserDefaults.standard.set(sender.isOn, forKey: "DarkTheme")
        
    }

}
