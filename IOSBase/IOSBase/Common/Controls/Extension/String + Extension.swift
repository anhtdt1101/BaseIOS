//
//  String + Extension.swift
//  IOSBase
//
//  Created by Tran Duc Tien Anh on 05/05/2023.
//

import Foundation

extension String{
    var int:Int {
        return Int(self) ?? 0
    }
    var double:Double {
        return Double(self) ?? 0
    }
    
    func toClass() -> AnyClass?{
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let result: AnyClass = NSClassFromString("\(nameSpace).\(self)")!
        return result
    }
    
    func removeDotAmount() -> String {
        let rslt = self.replacingOccurrences(of: ".", with: "")
        return rslt
    }
    
    func amountFormat() -> String {
        let rslt = self.formatAmountVND()
        return rslt
    }
    
    func formatAmountVND() -> String {
        let inputNumber = NSNumber(value: Double(self) ?? 0.0)
        let formatter = NumberFormatter()
        formatter.currencySymbol = ""
        formatter.currencyGroupingSeparator = "."
        formatter.locale = Locale(identifier: "vi_VN")
        formatter.numberStyle = .currency
        formatter.positiveFormat = "#,##0¤"
        return formatter.string(from: inputNumber) ?? ""
    }
}
