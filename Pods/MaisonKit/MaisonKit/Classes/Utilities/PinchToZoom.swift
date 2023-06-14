// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import SwiftUI

/// Adapted from https://stackoverflow.com/a/59878898/1027644
class PinchZoomView: UIView {

    weak var delegate: PinchZoomViewDelgate?

    private(set) var scale: CGFloat = 0 {
        didSet {
            self.delegate?.pinchZoomView(self, didChangeScale: self.scale)
        }
    }

    private(set) var anchor: UnitPoint = .center {
        didSet {
            self.delegate?.pinchZoomView(self, didChangeAnchor: self.anchor)
        }
    }

    private(set) var offset: CGSize = .zero {
        didSet {
            self.delegate?.pinchZoomView(self, didChangeOffset: self.offset)
        }
    }

    private(set) var isPinching: Bool = false {
        didSet {
            self.delegate?.pinchZoomView(self, didChangePinching: self.isPinching)
        }
    }

    private var startLocation: CGPoint = .zero
    private var location: CGPoint = .zero
    private var numberOfTouches: Int = 0

    init() {
        super.init(frame: .zero)

        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch(gesture:)))
        pinchGesture.cancelsTouchesInView = false
        self.addGestureRecognizer(pinchGesture)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    @objc private func pinch(gesture: UIPinchGestureRecognizer) {

        switch gesture.state {
        case .began:
            self.isPinching = true
            self.startLocation = gesture.location(in: self)
            self.anchor = UnitPoint(x: self.startLocation.x / self.bounds.width, y: self.startLocation.y / self.bounds.height)
            self.numberOfTouches = gesture.numberOfTouches

        case .changed:
            if gesture.numberOfTouches != self.numberOfTouches {
                // If the number of fingers being used changes, the start location needs to be adjusted to avoid jumping.
                let newLocation = gesture.location(in: self)
                let jumpDifference = CGSize(width: newLocation.x - self.location.x, height: newLocation.y - self.location.y)
                self.startLocation = CGPoint(x: self.startLocation.x + jumpDifference.width, y: self.startLocation.y + jumpDifference.height)

                self.numberOfTouches = gesture.numberOfTouches
            }

            self.scale = gesture.scale < 1 ? 1 : gesture.scale

            self.location = gesture.location(in: self)
            self.offset = CGSize(width: self.location.x - self.startLocation.x, height: self.location.y - self.startLocation.y)

        case .ended, .cancelled, .failed:
            self.isPinching = false
            self.scale = 1.0
            self.anchor = .center
            self.offset = .zero
        default:
            break
        }
    }

}

protocol PinchZoomViewDelgate: AnyObject {
    func pinchZoomView(_ pinchZoomView: PinchZoomView, didChangePinching isPinching: Bool)
    func pinchZoomView(_ pinchZoomView: PinchZoomView, didChangeScale scale: CGFloat)
    func pinchZoomView(_ pinchZoomView: PinchZoomView, didChangeAnchor anchor: UnitPoint)
    func pinchZoomView(_ pinchZoomView: PinchZoomView, didChangeOffset offset: CGSize)
}

struct PinchZoom: UIViewRepresentable {

    @Binding var scale: CGFloat
    @Binding var anchor: UnitPoint
    @Binding var offset: CGSize
    @Binding var isPinching: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> PinchZoomView {
        let pinchZoomView = PinchZoomView()
        pinchZoomView.delegate = context.coordinator
        return pinchZoomView
    }

    func updateUIView(_ pageControl: PinchZoomView, context: Context) { }

    final class Coordinator: NSObject, PinchZoomViewDelgate {
        private var pinchZoom: PinchZoom

        init(_ pinchZoom: PinchZoom) {
            self.pinchZoom = pinchZoom
        }

        func pinchZoomView(_ pinchZoomView: PinchZoomView, didChangePinching isPinching: Bool) {
            self.pinchZoom.isPinching = isPinching
        }

        func pinchZoomView(_ pinchZoomView: PinchZoomView, didChangeScale scale: CGFloat) {
            self.pinchZoom.scale = scale
        }

        func pinchZoomView(_ pinchZoomView: PinchZoomView, didChangeAnchor anchor: UnitPoint) {
            self.pinchZoom.anchor = anchor
        }

        func pinchZoomView(_ pinchZoomView: PinchZoomView, didChangeOffset offset: CGSize) {
            self.pinchZoom.offset = offset
        }
    }
}

struct PinchToZoom: ViewModifier {
    @State var scale: CGFloat = 1.0
    @State var anchor: UnitPoint = .center
    @State var offset: CGSize = .zero
    @State var isPinching: Bool = false

    func body(content: Content) -> some View {
        content
            .scaleEffect(self.scale, anchor: self.anchor)
            .offset(self.offset)
            .animation(self.isPinching ? .none : .spring(), value: self.scale)
            .overlay(PinchZoom(scale: self.$scale, anchor: self.$anchor, offset: self.$offset, isPinching: self.$isPinching))
    }
}

extension View {
    func pinchToZoom() -> some View {
        self.modifier(PinchToZoom())
    }
}
