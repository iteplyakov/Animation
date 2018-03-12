//
//  Progress.swift
//  Animation
//
//  Created by Iwan Teplyakov on 12.03.18.
//  Copyright © 2018 Tallium. All rights reserved.
//

struct Progress<Magnitude: Transformable> {
    
    init(numerator: Magnitude, denominator: Magnitude) {
        precondition(!denominator.isZero, "Can't form Progress with denominator = 0")
        precondition(numerator.isFinite, "Can't form Progress with numerator = ∞")
        precondition(numerator <= denominator, "Can't form Progress with denominator < numerator")

        let fraction = numerator / denominator
        magnitude = fraction * .greatestFiniteMagnitude
    }
    
    private init(magnitude: Magnitude) {
        self.magnitude = magnitude
    }
    
    private var magnitude: Magnitude
    
    var fraction: Magnitude {
        return magnitude / .greatestFiniteMagnitude
    }
    
}

// MARK: - Strideable

extension Progress: Strideable {
    
    func distance(to other: Progress<Magnitude>) -> Magnitude {
        return other.magnitude - magnitude
    }
    
    func advanced(by n: Magnitude) -> Progress<Magnitude> {
        return Progress(magnitude: magnitude + n)
    }
    
}

// MARK: - Constants

extension Progress {
    
    static var zero: Progress<Magnitude> {
        return Progress(magnitude: 0)
    }
    
    static var half: Progress<Magnitude> {
        return Progress(numerator: .leastNonzeroMagnitude, denominator: .leastNonzeroMagnitude * 2)
    }
    
    static var done: Progress<Magnitude> {
        return Progress(magnitude: .greatestFiniteMagnitude)
    }
    
}
