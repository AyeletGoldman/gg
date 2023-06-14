// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI

struct ShimmerView: View {
    @State private var isAnimating: Bool
    private let offset: CGFloat
    private let rotationAngle: Angle
    private let linearGradient: LinearGradient
    private let animation: Animation
    private let primaryColor: Color
    private let shimmerColor: Color
    private let size: CGSize
    private let shimmerSize: CGSize

    init(rotationAngle: Angle = Angle(degrees: 70),
         animationSpeed: CGFloat = 0.2,
         primaryColor: Color = .black.opacity(0.2),
         shimmerColor: Color = .white.opacity(0.6),
         size: CGSize = CGSize(width: 350, height: 200)) {
        self.offset = size.width * 2
        self.isAnimating = false
        self.rotationAngle = rotationAngle
        self.linearGradient = LinearGradient(colors: [shimmerColor.opacity(0),
                                                      shimmerColor.opacity(0),
                                                      shimmerColor,
                                                      shimmerColor.opacity(0),
                                                      shimmerColor.opacity(0)],
                                             startPoint: .top,
                                             endPoint: .bottom)
        self.animation = Animation.default.speed(animationSpeed).delay(0).repeatForever(autoreverses: false)
        self.primaryColor = primaryColor
        self.shimmerColor = shimmerColor
        self.size = size
        let shimmerWidth = size.width > size.height ? size.width * 1.5 : size.height * 1.5
        self.shimmerSize = CGSize(width: shimmerWidth,
                                  height: size.width * 1.5)
    }

    var body: some View {
        primaryColor
            .frame(width: size.width, height: size.height)
            .overlay(shimmerLayer())
            .onAppear {
                withAnimation(animation) {
                    isAnimating.toggle()
                }
            }
    }

    private func shimmerLayer() -> some View {
        return Rectangle()
            .fill(linearGradient)
            .frame(width: shimmerSize.width,
                   height: shimmerSize.height)
            .rotationEffect(rotationAngle)
            .offset(x: isAnimating ? offset : -offset)
    }
}

extension View {
    func shimmer(if condition: Bool = true, shouldRedact: Bool = false) -> some View {
        self.overlay {
            if condition {
                GeometryReader { proxy in
                    ShimmerView(primaryColor: .clear, size: .init(width: proxy.size.width, height: proxy.size.height))
                }
            }
        }
    }
}
