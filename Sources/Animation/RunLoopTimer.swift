//
//  RunLoopTimer.swift
//  Animation
//
//  Created by Iwan Teplyakov on 12.03.18.
//  Copyright © 2018 Tallium. All rights reserved.
//

import Foundation

public protocol RunLoopTimer {
    
    associatedtype Timestamp: Transformable
    
    typealias Trigger = (Timestamp) -> Void
    
    init(with trigger: @escaping Trigger)
    
    var last: Timestamp { get }
    
    var next: Timestamp { get }
    
    var isTimeAvailable: Bool { get }
    
    func add(to runloop: RunLoop, for mode: RunLoopMode)
    
    func invalidate()
    
}
