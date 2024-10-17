//
//  UINavigationViewController+Extensions.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24.

//

import UIKit

extension UINavigationController {
    func makeDefaultSettings(){
        self.navigationBar.barTintColor = .black
        self.navigationBar.backgroundColor = .black
        self.navigationBar.tintColor = .black
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationBar.titleTextAttributes = textAttributes
    }
}
