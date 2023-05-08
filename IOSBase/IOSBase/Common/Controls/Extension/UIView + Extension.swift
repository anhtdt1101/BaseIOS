//
//  UIView + Extension.swift
//  IOSBase
//
//  Created by Tran Duc Tien Anh on 05/05/2023.
//

import Foundation
import UIKit

extension UIView {
    static var identify: String{
        get{
            return String(describing: self)
        }
    }
}
