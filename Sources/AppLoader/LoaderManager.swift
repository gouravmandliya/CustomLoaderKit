//
//  LoaderManager.swift
//  AppLoader
//
//  Created by Gourav Mandliya on 23/05/26.
//

import UIKit

@MainActor
public final class LoaderManager {

    // MARK: - Singleton

    public static let shared = LoaderManager()

    // MARK: - Properties

    private var loaderView: LoaderView?

    private init() {}

    // MARK: - Show Loader

    public func show() {

        guard let windowScene = UIApplication.shared.connectedScenes
            .first as? UIWindowScene,

              let window = windowScene.windows.first
        else {
            return
        }

        if self.loaderView != nil {
            return
        }

        let loader = LoaderView(frame: window.bounds)

        loader.alpha = 0

        window.addSubview(loader)

        UIView.animate(withDuration: 0.25) {
            loader.alpha = 1
        }

        self.loaderView = loader
    }

    // MARK: - Hide Loader

    public func hide() {

        guard let loader = self.loaderView else {
            return
        }

        UIView.animate(
            withDuration: 0.25,
            animations: {
                loader.alpha = 0
            },
            completion: { _ in
                loader.removeFromSuperview()
                self.loaderView = nil
            }
        )
    }
}
