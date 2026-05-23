//
//  LoaderView.swift
//  AppLoader
//
//  Created by Gourav Mandliya on 23/05/26.
//

import SwiftUI

public struct LoaderView: View {

    // MARK: - Properties

    private let title: String

    // MARK: - Initializer

    public init(title: String = "Loading...") {
        self.title = title
    }

    // MARK: - Body

    public var body: some View {

        ZStack {

            // Background

            Color.black
                .opacity(0.35)
                .ignoresSafeArea()

            // Loader Container

            VStack(spacing: 16) {

                ProgressView()
                    .scaleEffect(1.4)

                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding(24)
            .background(
                Color.black.opacity(0.8)
            )
            .cornerRadius(16)
        }
    }
}
