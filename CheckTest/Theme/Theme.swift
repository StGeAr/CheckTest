//
//  Theme.swift
//  CheckTest
//
//  Created by D D on 30.03.2022.
//

import UIKit

protocol ThemeProtocol {
    
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    var accentColor:UIColor { get }
}

class Theme {
    static var currentTheme: ThemeProtocol = LightTheme()
}
