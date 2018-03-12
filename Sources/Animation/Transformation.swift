//
//  Transformation.swift
//  Animation
//
//  Created by Iwan Teplyakov on 12.03.18.
//  Copyright © 2018 Tallium. All rights reserved.
//

public protocol Transformation {
    
    associatedtype Value: Transformable
    
    func transform(value: Value) -> Value
    
}
