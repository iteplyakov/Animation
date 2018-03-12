//
//  Transformable.swift
//  Animation
//
//  Created by Iwan Teplyakov on 12.03.18.
//  Copyright © 2018 Tallium. All rights reserved.
//

public protocol Transformable: FloatingPoint {}

extension Transformable {
    
    mutating func apply<T>(transformation: T) where T: Transformation, T.Value == Self {
        self = transformation.transform(value: self)
    }
    
}
