//
//  Linear.swift
//  Animation
//
//  Created by Iwan Teplyakov on 12.03.18.
//  Copyright © 2018 Tallium. All rights reserved.
//

public struct Linear<Value: Transformable>: Transformation {
    
    public init() {}
    
    public func transform(value: Value) -> Value {
        return value
    }
    
}
