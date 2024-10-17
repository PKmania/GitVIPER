//
//  Utils.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24.

//

import Foundation
import UIKit

class Utils {

    class func makeViewCircular(view : UIView , borderWidth : CGFloat , borderColor : UIColor){
        
        view.layer.borderWidth = borderWidth
        view.layer.masksToBounds = false
        view.layer.borderColor = borderColor.cgColor
        view.layer.cornerRadius = view.frame.size.width / 2
        view.clipsToBounds = true
    }
    
    class func createCardView(view : UIView , backgroundColor : UIColor , borderColor : UIColor , borderWidth : CGFloat , cornerRadius : CGFloat){
        view.backgroundColor = backgroundColor
        view.layer.borderColor = borderColor.cgColor
        view.layer.borderWidth = borderWidth
        view.layer.cornerRadius = cornerRadius
    }

    class func log(_ message: Any, _ file: String = #file, _ line: Int = #line, _ function: String = #function) {
        print("[\(file):\(line)] \(function) - \(message)")
    }
    
}
