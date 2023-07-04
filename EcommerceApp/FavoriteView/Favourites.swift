//
//  FavoriteView.swift
//  EcommerceApp
//
//  Created by Tushar Jaunjalkar on 04/07/23.
//

import SwiftUI

struct FavouriteView: View {
    
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
            ZStack {
                if viewModel.products.filter{$0.isInWishlist}.isEmpty {
                    Image(systemName: "bookmark.slash.fill")
                        .font(.system(size: 64, weight: .semibold))
                        .foregroundColor(.red)
                        .padding()
                } else {
                    GeometryReader { proxy in
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: proxy.size.width / 2 - 4, maximum: 300), spacing: 8)], spacing: 4, content: {
                                ForEach(0..<$viewModel.products.filter{$0.isInWishlist}.count, id: \.self) { index in
                                    NavigationLink(destination: ProductDetailView(product: $viewModel.products.filter{$0.isInWishlist}[index])
                                        .onAppear{
                                            self.hasTitle = false
                                        }.onDisappear{
                                            self.hasTitle = true
                                        }, label: {
                                            ProductView(product: $viewModel.products.filter{$0.isInWishlist}[index])
                                        })
                                }
                            })
                        }
                    }
                }
            }.navigationBarTitle(hasTitle ? "Favourites" : "", displayMode: .inline)
        }
    }
}

//struct FavoriteView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteView(viewModel: ProductListViewModel())
//    }
//}
