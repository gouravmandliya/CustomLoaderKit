//
//  UIViewController+Loader.swift
//  AppLoader
//
//  Created by Gourav Mandliya on 23/05/26.
//

import UIKit

public extension UIViewController {

    func showLoader() {
        LoaderManager.shared.show()
    }

    func hideLoader() {
        LoaderManager.shared.hide()
    }
}
