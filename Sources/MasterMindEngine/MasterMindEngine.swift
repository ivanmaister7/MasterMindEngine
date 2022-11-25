import Foundation

public class MasterMindEngine {
    var logger: GameLogger? = nil
    
    var rowsRequest: [Row] = []
    var rowsResponce: [Row] = []
    var rowResult: RowRequest = RowRequest(items: [])
    var lastMoveDate = Date()
    var gameSettings = GameSettings()
    
    init(rowSize: Int, moves: Int, colors: Int, duration: Double) {
        gameSettings.prepareGameSettings(rowSize: rowSize, moves: moves, colors: colors, duration: duration)
        rowResult.generate(for: gameSettings.availableColors,
                           rowSize: gameSettings.rowSize)
        logger = GameLogger(game: self)
    }
    
    convenience init() {
        self.init(rowSize: 4, moves: 8, colors: 6, duration: 15.0)
    }
    
    // перезапуск
    public func resetGame() {
        rowsRequest.removeAll()
        rowsResponce.removeAll()
        
        logger?.log(action: .reset)
    }
    
    // сдача гри(фiксується перемога компютера) + перезапуск
    public func resignGame() {
        
    }
    
    public func nextMove(/*..*/) /*-> responceType*/ {
        
    }
    
    // після завершення гри для аналізу(ходити не можна) або для real-time mode(ходити можна!)
    public func rollbackMove() /*-> responceType*/ {

    }
    
    // після завершення гри для аналізу(ходити не можна) або для real-time mode(ходити можна!)
    public func rollForwardMove() /*-> responceType*/ {
        
    }
    
    // немає таймеру і працюють відкатування вперед і назад для ходу
    public func realtimeModeOn() {
        
    }
    
    public func hasWinner() /*-> responceType*/ {
        
    }
    
    public func getAvailableMoves() /*-> responceType*/ {
        
    }
    
    public func getGameLogs() -> [GameLog] {
        // логувати:
        // дія гравця, таймери , таймери до початку ходу і після, стан рядків(рядку),
        logger?.gameLogs ?? []
    }
    
    public func getPlayerState() -> PlayerState {
        PlayerState(movesLeft: gameSettings.countMoves - rowsRequest.count,
                    allTimeLeft: gameSettings.gameDuration - gameSettings.startDate.timeIntervalSince(Date()),
                    currentMoveTime: lastMoveDate.timeIntervalSince(Date()),
                    lastMove: rowsRequest.last,
                    lastAnswer: rowsResponce.last)
    }
    
    public func getCurrentGameState() -> GameSettings {
        gameSettings
    }
}
