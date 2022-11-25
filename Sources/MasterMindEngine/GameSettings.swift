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
    var gameDuration = 15.0
    var availableColors: [UIColor] = []
    var startDate = Date()
    
    init() { }
    
    init(rowSize: Int, moves: Int, colors: Int, duration: Double) {
        prepareGameSettings(rowSize: rowSize, moves: moves, colors: colors, duration: duration)
    }
    
    public static func == (lhs: GameSettings, rhs: GameSettings) -> Bool {
        lhs.rowSize == rhs.rowSize &&
        lhs.availableColors == rhs.availableColors &&
        lhs.countMoves == rhs.countMoves
    }
    
    public mutating func prepareGameSettings(rowSize: Int, moves: Int, colors: Int, duration: Double) {
        // implement checker for negative nums
        self.rowSize = rowSize
        self.countMoves = moves
        self.gameDuration = duration
        self.availableColors = ItemRequest.getAvailableColors(forCount: colors)
    }
}
