//
//  Animator.swift
//  Animation
//
//  Created by Iwan Teplyakov on 12.03.18.
//  Copyright © 2018 Tallium. All rights reserved.
//

protocol Animator: Animating {
    
    associatedtype A: Animation where A.Value == Value
    
    associatedtype I: Interface
    
    var animation: A { get }
    
    var interface: I { get }
    
    var keyPath:  ReferenceWritableKeyPath<I, Value> { get }
    
}

extension Animator {
    
    func animate(in range: Range<Progress<Value>>) {
        interface[keyPath: keyPath].apply(transformation: animation[range])
    }
    
}
