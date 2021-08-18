//
//  BaseContractor.swift
//  Base
//
//  Created by Roberto on 31/7/21.
//

public protocol BaseContractor {
    func showProgress()

    func hideProgress()

    func showError(error: String)

    func showMessage(message: String)

}
