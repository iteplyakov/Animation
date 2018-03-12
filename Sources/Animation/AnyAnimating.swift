//
//  AnyAnimating.swift
//  Animation
//
//  Created by Iwan Teplyakov on 12.03.18.
//  Copyright © 2018 Tallium. All rights reserved.
//

struct AnyAnimating<Value: Transformable> {

    init<Base: Animating>(base: Base) where Base.Value == Value {
        handler = (base.animate, base.validate)
    }
    
    private let handler: (animate: (Value) -> Void , validate: () -> Bool)
    
}

// MARK: - Animating

extension AnyAnimating: Animating {

    func animate(frame: Value) {
        handler.animate(frame)
    }
    
    func validate() -> Bool {
        return handler.validate()
    }
    
}
