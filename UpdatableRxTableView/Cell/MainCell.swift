//
//  MainCell.swift
//  UpdateableRxTableView
//
//  Created by Elizabeth Rudenko on 29/03/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        textField.placeholder = nil
    }

    func setupTitleLabel(_ text: String?) {
        titleLabel.text = text
    }

    func setupTextField(placeholder: String?,
                        keyboardType: UIKeyboardType,
                        isSecureTextEntry: Bool) {
        textField.placeholder = placeholder
        textField.keyboardType = keyboardType
        textField.isSecureTextEntry = isSecureTextEntry
    }
}
