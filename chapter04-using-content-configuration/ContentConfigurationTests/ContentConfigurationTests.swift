import XCTest
@testable import chapter04_using_content_configuration

final class ContentConfigurationTests: XCTestCase {
    @MainActor func testInitialConfigurationAndReuseUpdateTheVisibleLabel() throws {
        let view = MyContentView(configuration: MyContentConfiguration(name: "First"))
        let label = try XCTUnwrap(view.subviews.compactMap { $0 as? UILabel }.first)
        XCTAssertEqual(label.text, "First")
        view.configuration = MyContentConfiguration(name: "Second")
        XCTAssertEqual(label.text, "Second")
        view.configuration = UIListContentConfiguration.cell()
        XCTAssertNil(label.text)
    }

    @MainActor func testContentFitsNarrowWidthAndLargeTextWithoutTruncation() throws {
        let traits = UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge)
        traits.performAsCurrent {
            let view = MyContentView(configuration: MyContentConfiguration(name: "A long item name that must wrap on a narrow screen"))
            let label = view.subviews.compactMap { $0 as? UILabel }.first!
            XCTAssertEqual(label.numberOfLines, 0)
            XCTAssertTrue(label.adjustsFontForContentSizeCategory)
            let size = view.systemLayoutSizeFitting(CGSize(width: 160, height: 0), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
            XCTAssertEqual(size.width, 160, accuracy: 0.5)
            XCTAssertGreaterThan(size.height, label.font.lineHeight)
        }
    }
}
