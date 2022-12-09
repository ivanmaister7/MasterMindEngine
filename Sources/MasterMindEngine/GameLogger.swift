//
//  File.swift
//  
//
//  Created by Master on 25.11.2022.
//

import Foundation

struct GameLogger {
    var gameLogs: [GameLog] = []
    var game: MasterMindEngine // IoC (inversion of control)
    
    mutating func log(action: UserAction) {
        gameLogs.append(GameLog(gameSettings: game.gameSettings,
                                playerState: game.getPlayerState(),
                                lastRequest: game.rowsRequest.last,
                                lastResponce: game.rowsResponce.last,
                                //currentTime: game.gameSettings.startDate.timeIntervalSince(Date()),
                                action: action.rawValue))
    }
}
