//
//  File.swift
//  IOSBase
//
//  Created by Tran Duc Tien Anh on 08/05/2023.
//

import Foundation
import UIKit

class TextField: UITextField{
    @IBOutlet var errorLbl:UILabel?
    @IBOutlet weak var tfDelegate:UITextFieldDelegate?

    var maxLength: Int = 200
    var msgEmpty: String?
    var validChars: String?
    var msgError: String = "" {
        didSet{
            if let lbl = errorLbl{
                lbl.text = msgError
            }
        }
    }
    
    var isAmount: Bool = false
    
    var amount:String {
        let text = self.text ?? ""
        if isAmount {
            let amount = text.removeDotAmount()
            return amount
        }
        return text
    }
    
    override var text: String?{
        didSet{
            if isAmount{
                let text = text ?? ""
                let sText = text.removeDotAmount()
                if sText.isEmpty || sText.double == 0 {
                    super.text = ""
                } else {
                    super.text = sText.amountFormat()
                }
            }
        }
    }
    
    var onEdittingChanged:((TextField)->Void)? {
        didSet {
            addEditingChanged()
        }
    }
    var onDidEndEditing:((TextField)->Void)?
    var onDidBeginEditing:((TextField)->Void)?
    var onShouldChanged:((TextField,NSRange,String,String)->Bool)?

    ///callback when click to return
    var onShouldReturn:((TextField)->Bool)?
    
    
    
}
extension TextField : UITextFieldDelegate {
    func addEditingChanged() {
        addTarget(self, action: #selector(_editingChanged), for: .editingChanged)
    }
    
    @objc private func _editingChanged() {
        if let callBack = onEdittingChanged {
            callBack(self)
        }
    }
    
    
    
}
