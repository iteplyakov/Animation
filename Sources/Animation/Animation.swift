//
//  Animation.swift
//  Animation
//
//  Created by Iwan Teplyakov on 12.03.18.
//  Copyright © 2018 Tallium. All rights reserved.
//

public protocol Animation: Transformation {
    
    associatedtype TimingCurve: Transformation where TimingCurve.Value == Value
    
    var timing: TimingCurve { get }
    
}

extension Animation {
    
    subscript(bounds: Range<Progress<Value>>) -> AnimationSlice<Value, Self> {
        return AnimationSlice(base: self, bounds: bounds)
    }
    
}
