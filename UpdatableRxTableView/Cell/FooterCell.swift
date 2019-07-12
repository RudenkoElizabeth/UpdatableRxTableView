//
//  FooterCell.swift
//  UpdateableRxTableView
//
//  Created by Elizabeth Rudenko on 29/03/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import UIKit

protocol FooterCellDelegate: class {
    func chageOprionAction()
}

class FooterCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    weak var delegate: FooterCellDelegate?

    func setupTitleLabel(_ text: String?) {
        titleLabel.text = text
    }

    func setupSubtitleLabel(_ text: String?) {
        subtitleLabel.text = text
    }
    
    @IBAction func chageOprionAction() {
        delegate?.chageOprionAction()
    }
}
