//
//  AnimationSlice.swift
//  Animation
//
//  Created by Iwan Teplyakov on 12.03.18.
//  Copyright © 2018 Tallium. All rights reserved.
//

import Foundation

struct AnimationSlice<Value, Base: Animation> where Base.Value == Value {
    
    let base: Base
    
    let bounds: Range<Progress<Value>>

}

// MARK: - Transformation

extension AnimationSlice: Transformation {
    
    func transform(value: Value) -> Value {
        let transformed = base.transform(value: value)
        let lowerBound = base.timing.transform(value: bounds.lowerBound.fraction)
        let upperBound = base.timing.transform(value: bounds.upperBound.fraction)
        let interval = upperBound - lowerBound
        let difference = transformed - value
        return value + difference * interval
    }
    
}

