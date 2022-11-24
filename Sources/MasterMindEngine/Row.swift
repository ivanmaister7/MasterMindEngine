//
//  Row.swift
//  
//
//  Created by Master on 24.11.2022.
//

import Foundation

struct Row {
    let items: [Item]
    
    static func generate(for settings: GameSettings) -> Row {
        // implement real generator
        Row(items: [Item(color: .blue),
                    Item(color: .red),
                    Item(color: .green),
                    Item(color: .blue)])
    }
}
