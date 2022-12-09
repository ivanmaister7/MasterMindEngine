    import XCTest
    @testable import MasterMindEngine

    final class RowRequestTests: XCTestCase {

        func test_generate_Ok() {
            let size = 4
            var row = RowRequest(items: [])
            row.generate(for: [UIColor.blue], rowSize: size)
            
            XCTAssertEqual(size, row.items.count)
            XCTAssertEqual(Array(repeating: ItemRequest(color: .blue), count: size),
                           row.items as! [ItemRequest])
        }
        
        func test_generate2_Ok() {
            let size = 4
            let colors: [UIColor] = [.blue, .green, .red, .yellow]
            var row = RowRequest(items: [])
            
            row.generate(for: colors, rowSize: size)
            
            XCTAssertEqual(size, row.items.count)
            for item in row.items {
                XCTAssertTrue(colors.contains(item.color))
            }
        }
        
        func test_generate3_Ok() {
            let size = 4
            let colors: [UIColor] = [.blue, .green, .red, .yellow, .purple, .cyan]
            var row = RowRequest(items: [])
            
            row.generate(for: colors, rowSize: size)
            
            XCTAssertEqual(size, row.items.count)
            for item in row.items {
                XCTAssertTrue(colors.contains(item.color))
            }
        }
    }
