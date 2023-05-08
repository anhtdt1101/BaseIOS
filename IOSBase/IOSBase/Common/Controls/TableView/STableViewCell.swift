//
//  STableViewCell.swift
//  IOSBase
//
//  Created by Tran Duc Tien Anh on 05/05/2023.
//

import Foundation
import UIKit

protocol TableViewCellDelegate: AnyObject{
    
}

class STableViewCell: UITableViewCell{

    var indexPath: IndexPath!
    weak var delegate: TableViewCellDelegate?
    var data: Any? {
        didSet{
            if let data = data{
                setData(data, indexPath)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    class func heightOf(_ data: Any) -> CGFloat{
        return 44.0
    }
    
    func setData(_ data: Any){
        
    }
    
    func setData(_ data:Any, _ idx: IndexPath){
        setData(data)
    }
}

