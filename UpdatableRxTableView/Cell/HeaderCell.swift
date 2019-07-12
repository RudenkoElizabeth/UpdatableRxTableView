//
//  HeaderCell.swift
//  UpdateableRxTableView
//
//  Created by Elizabeth Rudenko on 29/03/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    func setupTitleLabel(_ text: String?) {
        titleLabel.text = text
    }

    func setupSubtitleLabel(_ text: String?) {
        subtitleLabel.text = text
    }
}
