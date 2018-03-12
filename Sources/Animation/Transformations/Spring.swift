//
//  Spring.swift
//  Animation
//
//  Created by Iwan Teplyakov on 12.03.18.
//  Copyright © 2018 Tallium. All rights reserved.
//

import Foundation

public struct Spring: Transformation {
    
    public init() {
        // TODO: Make the random spring function from internets more configurable
    }
    
    public func transform(value: Double) -> Double {
        return -0.5 * pow(.e, -6 * value) * (-2 * pow(.e, 6 * value) + sin(12 * value) + 2 * cos(12 * value))
    }
    
}

// MARK - Constants

private extension Double {
    
    static var e: Double {
        return M_E
    }
    
}
