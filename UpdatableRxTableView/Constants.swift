//
//  Constants.swift
//  UpdateableRxTableView
//
//  Created by Elizabeth Rudenko on 29/03/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import RxDataSources
import UIKit

class Constants {
    enum CellType: Int {
        case header
        case name
        case email
        case password
        case button
        case option
    }
    enum StateType {
        case signIn
        case signUp
        var cells: [CellType] {
            switch self {
            case .signIn:
                return [ .header,
                         .email,
                         .password,
                         .button,
                         .option ]
            case .signUp:
                return [ .header,
                         .name,
                         .email,
                         .password,
                         .button,
                         .option ]
            }
        }
    }
    static let title: [CellType: String] = [
        .header: "Lorem Ipsum",
        .name: "Name",
        .email: "Email",
        .password: "Password",
    ]
    static let placeholder: [CellType: String] = [
        .name: "Please type full name",
        .email: "Please type email",
        .password: "Please type password",
    ]
    static let subtitleHeader: [StateType: String] = [
        .signIn: "Sign in to continue",
        .signUp: "Sign up to join biggest community"
    ]
    static let buttonTitle: [StateType: String] = [
        .signIn: "Sign in",
        .signUp: "Sign up"
    ]
    static let alertTitle = buttonTitle
    static let alertMessage = "to be continued"
    static let alertAction = "Ok"
    static let optionSubtitle: [StateType: String] = [
        .signIn: "Sign up",
        .signUp: "Sign in"
    ]
    static let optionTitle: [StateType: String] = [
        .signIn: "Don't have an account?",
        .signUp: "Have an account?"
    ]
    static func isSecureTextEntry(_ cellType: CellType) -> Bool {
        switch cellType {
        case .password:
            return true
        default:
            return false
        }
    }
    static func keyboardType(_ cellType: CellType) -> UIKeyboardType {
        switch cellType {
        case .email:
            return .emailAddress
        default:
            return .default
        }
    }
    static func getCellIdentifier(_ cellType: CellType) -> String {
        switch cellType {
        case .header:
            return "HeaderCell"
        case .name, .email, .password:
            return "MainCell"
        case .button:
            return "ButtonCell"
        case .option:
            return "FooterCell"
        }
    }
}

extension Constants.CellType: IdentifiableType {
    var identity: Int { return rawValue }
}
