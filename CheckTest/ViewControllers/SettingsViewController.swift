//
//  SettingsTableViewController.swift
//  CheckTest
//
//  Created by D D on 30.03.2022.
//

import UIKit


class SettingsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var settingTitle: UILabel!
    @IBOutlet weak var switchTheme: UISwitch!
    
    //MARK: - Life cycles methods
    override func viewDidLoad() {
        super.viewDidLoad()
        switchTheme.isOn = UserDefaults.standard.bool(forKey: "DarkTheme")
        setupTheme()
    }

    // MARK: - IBActions
    @IBAction func changeAction(_ sender: UISwitch) {
        Theme.currentTheme = sender.isOn ? DarkTheme() : LightTheme()
        setupTheme()
        UserDefaults.standard.set(sender.isOn, forKey: "DarkTheme")
    }
}

// MARK: - Design
extension SettingsViewController {
    private func setupTheme() {
        view.backgroundColor = Theme.currentTheme.backgroundColor
        settingTitle?.textColor = Theme.currentTheme.textColor
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor:Theme.currentTheme.textColor
        ]
    }
}
