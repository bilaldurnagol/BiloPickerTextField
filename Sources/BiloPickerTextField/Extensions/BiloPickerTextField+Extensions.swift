//
//  File.swift
//  
//
//  Created by Bilal Durnagöl on 20.04.2022.
//

import UIKit

extension BiloPickerTextField {
    @IBInspectable var paddingLeft: CGFloat {
        get {
            return rightView?.frame.size.width ?? 0
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    @IBInspectable var paddingRight: CGFloat {
        get {
            return rightView?.frame.size.width ?? 0
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
    @IBInspectable var fieldIcon: UIImage {
        get {
            return UIImage()
        }
        set {
            
            let imageView = UIImageView(frame: CGRect(x: -paddingRight, y: 0, width: 20, height: 20))
            let myView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            myView.addSubview(imageView)
            imageView.image = newValue
            imageView.contentMode = .scaleAspectFit
            rightView = myView
            rightViewMode = .always
        }
    }
}
