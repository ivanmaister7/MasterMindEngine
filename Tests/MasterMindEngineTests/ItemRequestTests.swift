    import XCTest
    @testable import MasterMindEngine

    final class ItemRequestTests: XCTestCase {

        func test_getAvailableColors_Size_Ok() {
            let size = 5
            let colors = ItemRequest.getAvailableColors(forCount: size)
            
            XCTAssertEqual(size, colors.count)
        }
        
        func test_getAvailableColors_Empty_Ok() {
            let colors = ItemRequest.getAvailableColors(forCount: 0)
            
            XCTAssertTrue(colors.isEmpty)
        }
        
        func test_getAvailableColors_Elements1_Ok() {
            let colors = ItemRequest.getAvailableColors(forCount: 1)
            
            XCTAssertEqual(1, colors.count)
            XCTAssertEqual([.blue], colors)
        }
        
        func test_getAvailableColors_Elements5_Ok() {
            let colors = ItemRequest.getAvailableColors(forCount: 5)
            
            XCTAssertEqual(5, colors.count)
            XCTAssertEqual([.blue, .red, .yellow, .green, .brown], colors)
        }
    }
