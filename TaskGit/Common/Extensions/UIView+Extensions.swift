//
//  UIView+Extensions.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24.

//

import UIKit

protocol ReusableView : class {  static var reuseIdentifier : String {get} }
extension ReusableView where Self : UIView {
    static var reuseIdentifier : String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}

protocol NibLoadableView : class { static var nibName : String {get} }
extension NibLoadableView where Self : UIView {
    static var nibName : String {
        return String(describing: self).components(separatedBy: ".").last!
    }
    static func loadNib() -> Self {
        let bundle = Bundle(for:Self.self)
        let nib = UINib(nibName: Self.nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! Self
    }
}
