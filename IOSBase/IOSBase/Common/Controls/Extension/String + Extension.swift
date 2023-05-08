//
//  String + Extension.swift
//  IOSBase
//
//  Created by Tran Duc Tien Anh on 05/05/2023.
//

import Foundation

extension String{
    func toClass() -> AnyClass?{
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let result: AnyClass = NSClassFromString("\(nameSpace).\(self)")!
        return result
    }
    
   
}
