//
//  LoaderView.swift
//  AppLoader
//
//  Created by Gourav Mandliya on 23/05/26.
//

import UIKit

public final class LoaderView: UIView {

    // MARK: - UI Components

    private let blurView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: effect)
        view.alpha = 0.5
        return view
    }()

    private let activityIndicator: UIActivityIndicatorView = {
        let indicator: UIActivityIndicatorView
        if #available(iOS 13.0, tvOS 13.0, *) {
            indicator = UIActivityIndicatorView(style: .large)
        } else {
            // Fallback on earlier versions
            indicator = UIActivityIndicatorView(style: .whiteLarge)
        }
        indicator.color = .white
        indicator.startAnimating()
        return indicator
    }()

    // MARK: - Init

    public override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupUI() {

        backgroundColor = .clear

        addSubview(blurView)
        addSubview(activityIndicator)

        blurView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor),

            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
