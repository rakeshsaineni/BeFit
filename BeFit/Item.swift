//
//  Item.swift
//  BeFit
//
//  Created by Rakesh Saineni on 2/8/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
