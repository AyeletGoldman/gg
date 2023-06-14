// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// A convenience struct to model pairs of values
struct Pair<P> {
    let left: P
    let right: P?
}

extension Pair: Equatable where P: Equatable { }

/// A convenience iterator transform a regular iterator into a pairwise iterator.
struct PairIterator<C: IteratorProtocol>: IteratorProtocol {
    private var baseIterator: C
    init(_ iterator: C) {
        baseIterator = iterator
    }

    mutating func next() -> Pair<C.Element>? {
        if let left = baseIterator.next() {
            return Pair(left: left, right: baseIterator.next())
        }
        return nil
    }
}

/// Returns the given sequence as a type-erased sequence of `Pair` values
extension Sequence {
    var pairs: AnySequence<Pair<Self.Element>> {
        return AnySequence({ PairIterator(self.makeIterator()) })
    }
}
