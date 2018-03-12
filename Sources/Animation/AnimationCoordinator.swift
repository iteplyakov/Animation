//
//  AnimationCoordinator.swift
//  Animation
//
//  Created by Iwan Teplyakov on 12.03.18.
//  Copyright © 2018 Tallium. All rights reserved.
//

final public class AnimationCoordinator<Value, Timer: RunLoopTimer> where Timer.Timestamp == Value {
    
    public init() {
        animators = []
    }
    
    lazy public private(set) var timer = Timer { [weak self] (timestamp) in
        self?.validate()
        self?.coordinate()
    }
    
    private var animators: [AnyAnimating<Value>]
    
    private func coordinate() {
        for animator in animators where timer.isTimeAvailable {
            animator.animate(frame: timer.next - timer.last)
        }
    }
    
    private func validate() {
        animators = animators.filter { $0.validate() }
    }

    public func add<Animator: Animating>(animator: Animator) where Animator.Value == Value {
        animators.append(AnyAnimating(base: animator))
    }
    
    public func remove<Animator: Animating>(animator: Animator) where Animator.Value == Value {
        // FIXME: After my poor type erasure, AnyAnimating can't identify its base
    }
    
}
