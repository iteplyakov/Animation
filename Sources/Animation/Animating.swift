//
//  Animating.swift
//  Animation
//
//  Created by Iwan Teplyakov on 12.03.18.
//  Copyright © 2018 Tallium. All rights reserved.
//

public protocol Animating {
    
    associatedtype Value
    
    func animate(frame: Value)
    
    func validate() -> Bool

}
