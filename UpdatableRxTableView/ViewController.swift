//
//  ViewController.swift
//  UpdateableRxTableView
//
//  Created by Elizabeth Rudenko on 29/03/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var state = Variable(Constants.StateType.signIn)
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        typealias Section = AnimatableSectionModel<Int, Constants.CellType>
        let rxDataSource = RxTableViewSectionedAnimatedDataSource<Section>(
            configureCell: { [weak self] _, _, _, item in
                let cellType = Constants.CellType(rawValue: item.rawValue)!
                let cell = self?.setupCell(cellType)
                return cell!
        })
        rxDataSource.animationConfiguration = AnimationConfiguration(insertAnimation: .fade,
                                                                     reloadAnimation: .fade,
                                                                     deleteAnimation: .fade)
        state.asObservable()
            .map { $0.cells }
            .map { [Section(model: 0, items: $0)]  }
            .bind(to: tableView.rx.items(dataSource: rxDataSource))
            .disposed(by: disposeBag)


    }

    private func setupCell(_ cellType: Constants.CellType) -> UITableViewCell {
        switch cellType {
        case .header:
            return setupHeaderCell()
        case .email, .name, .password:
            return setupMainCell(cellType)
        case .button:
            return setupButtonCell()
        case .option:
            return setupFooterCell()
        }
    }

    private func setupHeaderCell() -> HeaderCell {
        let identifier = Constants.getCellIdentifier(.header)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! HeaderCell
        cell.setupTitleLabel(Constants.title[.header])
        state.asObservable()
            .subscribe(onNext:{ newState in
                cell.setupSubtitleLabel(Constants.subtitleHeader[newState])
            })
            .disposed(by: disposeBag)
        return cell
    }

    private func setupMainCell(_ cellType: Constants.CellType) -> MainCell {
        let identifier = Constants.getCellIdentifier(cellType)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! MainCell
        cell.setupTitleLabel(Constants.title[cellType])
        cell.setupTextField(placeholder: Constants.placeholder[cellType],
                            keyboardType: Constants.keyboardType(cellType),
                            isSecureTextEntry: Constants.isSecureTextEntry(cellType))
        return cell
    }

    private func setupButtonCell() -> ButtonCell {
        let identifier = Constants.getCellIdentifier(.button)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! ButtonCell
        cell.delegate = self
        state.asObservable()
            .subscribe(onNext:{ newState in
                cell.setupTitleLabel(Constants.buttonTitle[newState])
            })
            .disposed(by: disposeBag)
        return cell
    }

    private func setupFooterCell() -> FooterCell {
        let identifier = Constants.getCellIdentifier(.option)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! FooterCell
        state.asObservable()
            .subscribe(onNext:{ newState in
                cell.setupTitleLabel(Constants.optionTitle[newState])
                cell.setupSubtitleLabel(Constants.optionSubtitle[newState])
            })
            .disposed(by: disposeBag)
        cell.delegate = self
        return cell
    }
}

extension ViewController: ButtonCellDelegate {
    func buttonAction() {
        let alert = UIAlertController(title: Constants.alertTitle[state.value],
                                      message: Constants.alertMessage,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.alertAction,
                                      style: .default))
        present(alert, animated: true)
    }
}

extension ViewController: FooterCellDelegate {
    func chageOprionAction() {
        switch state.value {
        case .signIn:
            state.value = .signUp
        case .signUp:
            state.value = .signIn
        }
    }
}
