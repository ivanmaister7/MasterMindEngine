    import XCTest
    @testable import MasterMindEngine

    final class GameSettingsTests: XCTestCase {

        func test_prepareGameSettings_Ok() {
            let settings = GameSettings(rowSize: 5, moves: 7, colors: 5, duration: 15.0, realtimeMode: true)
            var settings2 = GameSettings()
            settings2.prepareGameSettings(rowSize: 5, moves: 7, colors: 5, duration: 15.0, realtimeMode: true)
            
            XCTAssertTrue(settings == settings2)
        }

        func test_prepareGameSettings_Bad() {
            let settings = GameSettings(rowSize: 4, moves: 8, colors: 6, duration: 15.0, realtimeMode: true)
            var settings2 = GameSettings()
            settings2.prepareGameSettings(rowSize: 5, moves: 7, colors: 5, duration: 15.0, realtimeMode: true)
            
            XCTAssertTrue(settings != settings2)
        }

    }
