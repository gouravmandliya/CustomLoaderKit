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

    @State
    private var shouldShowLoader = false

    // MARK: - Initializer

    public init(title: String = "Loading...") {
        self.title = title
    }

    // MARK: - Body

    public var body: some View {

        ZStack {

            if shouldShowLoader {

                // Native Blur Background

                Rectangle()
                    .fill(.ultraThinMaterial)
                    .ignoresSafeArea()

                // Native Loader Container

                VStack(spacing: 14) {

                    ProgressView()

                    Text(title)
                        .font(.subheadline)
                        .foregroundStyle(.primary)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 18,
                        style: .continuous
                    )
                )
                .shadow(radius: 8)
                .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.2), value: shouldShowLoader)

        // Artificial Delay

        .task {

            try? await Task.sleep(
                nanoseconds: 500
            )

            shouldShowLoader = true
        }
    }
}
