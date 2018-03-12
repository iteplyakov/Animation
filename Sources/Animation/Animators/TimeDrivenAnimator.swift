//
//  TimeDrivenAnimator.swift
//  Animation
//
//  Created by Iwan Teplyakov on 12.03.18.
//  Copyright © 2018 Tallium. All rights reserved.
//

import Foundation

extension Double: Transformable {}

final public class TimeDrivenAnimator<I: Interface, A: Animation>: Animator where A.Value == Double {

    private enum State {
        case immediate(delay: TimeInterval, duration: TimeInterval)
        case scheduled(interval: DateInterval, timestamp: Date)
    }
    
    public init(animation: A, interface: I, keyPath: ReferenceWritableKeyPath<I, Double>, duration: TimeInterval, delay: TimeInterval = 0) {
        self.animation = animation
        self.interface = interface
        self.keyPath = keyPath
        state = .immediate(delay: delay, duration: duration)
    }
    
    private var state: State
    
    let animation: A
    
    let interface: I
    
    let keyPath: ReferenceWritableKeyPath<I, Double>

}

// MARK: - Animating

extension TimeDrivenAnimator {
 
    public func animate(frame: Double) {
        switch state {
        case .scheduled(let interval, let timestamp):
            state = .scheduled(
                interval: interval,
                timestamp: .now
            )
            guard interval.start < .now else {
                return
            }
            let minimum = Progress<Double>(
                numerator: -interval.start.timeIntervalSince(timestamp),
                denominator: interval.duration
            )
            let maximum = Progress<Double>(
                numerator: min(interval.duration, -interval.start.timeIntervalSince(.now)),
                denominator: interval.duration
            )
            defer {
                animate(in: minimum..<maximum)
            }
        case .immediate(let delay, let duration):
            state = .scheduled(
                interval: DateInterval(
                    start: .now + delay + frame,
                    duration: duration
                ),
                timestamp: .now
            )
        }
    }
    
    public func validate() -> Bool {
        switch state {
        case .scheduled(let interval, let timestamp):
            return interval.end > timestamp
        default:
            return true
        }
    }
    
}

// MARK: - Constants

private extension Date {
    
    static var now: Date {
        return Date()
    }
    
}
