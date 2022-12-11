import Foundation
import UIKit

public class MasterMindEngine {
    var logger: GameLogger? = nil
    
    var rowsRequest: [RowRequest] = []
    var rowsResponce: [RowResponce] = []
    var rowResult = RowRequest(items: [])
    var lastMoveDate = Date()
    var gameSettings = GameSettings()
    
    var removeRowsRequest: [RowRequest] = []
    var removeRowsResponce: [RowResponce] = []
    
    public init(rowSize: Int, moves: Int, colors: Int, duration: Double, realtime: Bool) {
        gameSettings.prepareGameSettings(rowSize: rowSize, moves: moves, colors: colors, duration: duration, realtimeMode: realtime)
        rowResult.generate(for: gameSettings.availableColors, rowSize: gameSettings.rowSize)
        logger = GameLogger(game: self)
        logger?.log(action: .start)
    }
    
    public convenience init() {
        self.init(rowSize: 4, moves: 8, colors: 6, duration: 15.0, realtime: false)
    }
    
    // перезапуск
    public func resetGame() {
        logger?.log(action: .reset)
        rowsRequest.removeAll()
        rowsResponce.removeAll()
        removeRowsRequest.removeAll()
        removeRowsResponce.removeAll()
        rowResult.generate(for: gameSettings.availableColors, rowSize: gameSettings.rowSize)
        gameSettings.prepareGameSettings(rowSize: gameSettings.rowSize, moves: gameSettings.countMoves, colors: gameSettings.availableColors.count, duration: gameSettings.gameDuration / 60, realtimeMode: gameSettings.realtimeMode)
    }
    
    // сдача гри(фiксується перемога компютера) + перезапуск
    public func resignGame() {
        logger?.log(action: .computerWin)
        logger?.log(action: .resign)
        resetGame()
    }
    
    public func nextMove(for request: RowRequest) { /*-> responceType*/
        let (hasWinner, _) = hasWinner()
        
        if hasWinner {
            logger?.log(action: .hasWinner)
            return
        }
        
        logger?.log(action: .clearMovesHistory)
        removeRowsRequest.removeAll()
        removeRowsResponce.removeAll()
        logger?.log(action: .move)
        rowsRequest.append(request)
        var responce = RowResponce(items: [], resultRow: rowResult)
        responce.proccesRowRequest(for: request)
        rowsResponce.append(responce)
    }
    
    // після завершення гри для аналізу(ходити не можна) або для real-time mode(ходити можна!)
    public func rollbackMove() {
        
        let (isWinner,_) = hasWinner()
        if !isWinner && !gameSettings.realtimeMode { return }
        
        logger?.log(action: .rollback)
        
        guard let elem = rowsRequest.popLast() else { return }
        
        removeRowsRequest.append(elem)
        removeRowsResponce.append(rowsResponce.removeLast())
    }
    
    // після завершення гри для аналізу(ходити не можна) або для real-time mode(ходити можна!)
    public func rollForwardMove() {
        
        let (isWinner,_) = hasWinner()
        if !isWinner && !gameSettings.realtimeMode { return }
        
        logger?.log(action: .rollforward)
        
        guard let elem = removeRowsRequest.popLast() else { return }
        
        rowsRequest.append(elem)
        rowsResponce.append(removeRowsResponce.removeLast())
    }
    
    // немає таймеру і працюють відкатування вперед і назад для ходу
//    public func realtimeModeOn() {
//
//    }
    
    public func hasWinner() -> (Bool, PlayerType?) {
        if rowsRequest.last == rowResult || removeRowsRequest.first == rowResult {
            return (true, .player)
        }
        
        if (rowsRequest.count + removeRowsRequest.count) == gameSettings.countMoves ||
            (getPlayerState().allTimeLeft < 1.0 && !gameSettings.realtimeMode){
            return (true, .computer)
        }
        
        return (false, nil)
    }
    
    public func getAvailableMoves() -> [UIColor] {
       gameSettings.availableColors
    }
    
    public func getGameLogs() -> [GameLog] {
        // логувати:
        // дія гравця, таймери , таймери до початку ходу і після, стан рядків(рядку),
        logger?.gameLogs ?? []
    }
    
    public func getPlayerState() -> PlayerState {
        PlayerState(movesLeft: gameSettings.countMoves - rowsRequest.count,
                    allTimeLeft: gameSettings.realtimeMode ? 0 : gameSettings.gameDuration - Date().timeIntervalSince(gameSettings.startDate),
                    currentMoveTime: Date().timeIntervalSince(lastMoveDate),
                    lastMove: rowsRequest.last,
                    lastAnswer: rowsResponce.last)
    }
    
    public func getCurrentGameSettings() -> GameSettings {
        gameSettings
    }
    
    public func getCurrentGameState() -> GameState {
        return GameState(requestRows: rowsRequest, responceRows: rowsResponce)
    }
}
