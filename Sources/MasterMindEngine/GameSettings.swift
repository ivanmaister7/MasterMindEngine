//
//  GameSettings.swift
//  
//
//  Created by Master on 24.11.2022.
//

import Foundation
import UIKit

public struct GameSettings: Equatable {
    
    var rowSize = 4
    var countMoves = 8
    var availableColors: [UIColor] = []
    var timer: Timer = Timer()
    
    init() { }
    
    init(rowSize: Int, moves: Int, colors: Int) {
        prepareGameSettings(rowSize: rowSize, moves: moves, colors: colors)
    }
    
    public static func == (lhs: GameSettings, rhs: GameSettings) -> Bool {
        lhs.rowSize == rhs.rowSize &&
        lhs.availableColors == rhs.availableColors &&
        lhs.countMoves == rhs.countMoves
    }
    
    public mutating func prepareGameSettings(rowSize: Int, moves: Int, colors: Int) {
        // implement checker for negative nums
        self.rowSize = rowSize
        self.countMoves = moves
        self.availableColors = Item.getAvailableColors(forCount: colors)
    }
}
