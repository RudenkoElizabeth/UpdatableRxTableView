//
//  CustomizableView.swift
//  UpdateableRxTableView
//
//  Created by Elizabeth Rudenko on 29/03/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import UIKit.UIView

class CustomizableView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var gradientEnabled: Bool = false
    @IBInspectable var gradientStartColor: UIColor?
    @IBInspectable var gradientEndColor: UIColor?

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupCornerRadius()
        if gradientEnabled {
            setupGradient()
        }
    }

    private func setupCornerRadius() {
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
    }

    private func setupGradient() {
        guard let startColor = gradientStartColor,
            let endColor = gradientEndColor else { return }
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = bounds
        var colors = [CGColor]()
        colors.append(startColor.cgColor)
        colors.append(endColor.cgColor)
        gradient.colors = colors
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        layer.insertSublayer(gradient, at: 0)
    }
}
