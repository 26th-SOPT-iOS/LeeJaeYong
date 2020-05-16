//
//  FormTextField.swift
//  iOS_secondAssignment
//
//  Created by 이재용 on 2020/04/28.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit
@IBDesignable
class FormTextField: UITextField {

    @IBInspectable var inset: CGFloat = 0
    
    override func textRect(forBounds bounds: CGRect) -> CGRect { //text 이게 없으면 그냥 보여질 때 맨 앞에서 쓰인다.
        return bounds.inset(by: UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset))
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect { //placeholder
        return bounds.inset(by: UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset))
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect { //the rect in which editable text can be displayed
        return bounds.inset(by: UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)) // 이게 없으면 편집되는 textfield가 새로 만들어진 rect내에서 쓰이지 않는다.
    }

}
