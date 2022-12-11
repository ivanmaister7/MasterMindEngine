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
    var gameDuration = 15.0 * 60
    var availableColors: [UIColor] = []
    var startDate = Date()
    public private(set) var realtimeMode = false
    
    init() { }
    
    init(rowSize: Int, moves: Int, colors: Int, duration: Double, realtimeMode: Bool) {
        prepareGameSettings(rowSize: rowSize, moves: moves, colors: colors, duration: duration, realtimeMode: realtimeMode)
    }
    
    public static func == (lhs: GameSettings, rhs: GameSettings) -> Bool {
        lhs.rowSize == rhs.rowSize &&
        lhs.availableColors == rhs.availableColors &&
        lhs.countMoves == rhs.countMoves
    }
    
    public mutating func prepareGameSettings(rowSize: Int, moves: Int, colors: Int, duration: Double, realtimeMode: Bool) {
        // implement checker for negative nums
        self.rowSize = rowSize
        self.countMoves = moves
        self.gameDuration = realtimeMode ? 0 : duration * 60
        self.availableColors = ItemRequest.getAvailableColors(forCount: colors)
        self.startDate = Date()
        self.realtimeMode = realtimeMode
    }
    
    public func getRowSize() -> Int { rowSize }
    
}
