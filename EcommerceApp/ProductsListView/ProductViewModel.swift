//
//  ProductViewModel.swift
//  EcommerceApp
//
//  Created by Tushar Jaunjalkar on 03/07/23.
//

import Foundation

/// ProductViewModel
class ProductViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var productList: ProductList?
    @Published var errorMessage: String = ""
    @Published var products: [Product] = []
    
    /// Get Products
    func getProducts() {
        let urlString = Constant.productListAPI
        guard let  url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                    self?.isLoading = false
                    self?.errorMessage = "Bad Request \(statusCode)"
                    return
                }
                
                guard let data = data else { return }
                do {
                    self?.productList = try JSONDecoder().decode(ProductList.self, from: data)
                    if let product = self?.productList?.products {
                        self?.products = product
                    }
                    print(self?.productList as? Any ?? "")
                } catch {
                    debugPrint("error", error.localizedDescription)
                    self?.errorMessage = error.localizedDescription
                }
                self?.isLoading = false
            }
        }.resume()
    }
    
    func productPrice(product: Product) -> String {
        if let price = product.price.first {
            return price.value.stringValue
        } else {
            return String()
        }
    }
}
