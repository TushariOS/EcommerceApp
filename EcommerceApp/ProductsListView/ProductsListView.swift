//
//  ProductsListView.swift
//  EcommerceApp
//
//  Created by Tushar Jaunjalkar on 03/07/23.
//

import SwiftUI

/// ProductsListView
struct ProductsListView: View {
    
    /// ProductViewModel
    @ObservedObject var viewModel: ProductViewModel
    @State private var hasTitle = true
    
    /// Property Injection
    /// - Parameter viewModel: ProductViewModel
    init(viewModel: ProductViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: proxy.size.width / 2 - 4, maximum: 300), spacing: 8)], spacing: 4, content: {
                        ForEach(0..<viewModel.products.count, id: \.self) { index in
                            NavigationLink(destination: ProductDetailView(product: $viewModel.products[index]).onAppear{
                                self.hasTitle = false
                            }.onDisappear{
                                self.hasTitle = true
                            }, label: {
                                ProductView(product: $viewModel.products[index])
                                    .frame(width: proxy.size.width / 2 - 8)
                            })
                        }
                    })
                }
            }
            .navigationBarTitle(hasTitle ? "Products" : "", displayMode: .inline)
        }
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView(viewModel: ProductViewModel())
    }
}
