//
//  ButtonCell.swift
//  UpdateableRxTableView
//
//  Created by Elizabeth Rudenko on 29/03/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import UIKit

protocol ButtonCellDelegate: class {
    func buttonAction()
}

class ButtonCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    weak var delegate: ButtonCellDelegate?

    func setupTitleLabel(_ text: String?) {
        titleLabel.text = text
    }

    @IBAction func buttonAction() {
        delegate?.buttonAction()
    }
}
