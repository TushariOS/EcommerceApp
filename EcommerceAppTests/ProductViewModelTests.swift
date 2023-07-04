//
//  ProductViewModelTests.swift
//  EcommerceAppTests
//
//  Created by Tushar Jaunjalkar on 04/07/23.
//

import XCTest
@testable import EcommerceApp

final class ProductViewModelTests: XCTestCase {
    
    var viewModel: ProductViewModel!
    
    override func setUp() {
        super.setUp()
        
        viewModel = ProductViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testGetProducts() {
        // Prepare an expectation for the asynchronous API call
        let expectation = XCTestExpectation(description: "Get Products")
        
        // Call the getProducts method
        viewModel.getProducts()
        
        // Wait for a certain amount of time for the API call to complete
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Assert that the products array is not empty
            XCTAssertFalse(self.viewModel.products.isEmpty)
            
            // Assert that the product name is not empty
            XCTAssertFalse(self.viewModel.products[0].title.isEmpty)

            // Assert that the product image is not empty
            XCTAssertFalse(self.viewModel.products[0].imageURL.isEmpty)

            // Assert that the product price is not empty
            XCTAssertFalse((self.viewModel.products[0].price.first?.value ?? 0).isZero)

            // Fulfill the expectation
            expectation.fulfill()
        }
    }
}
