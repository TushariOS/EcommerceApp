//
//  BottomTabBar.swift
//  EcommerceApp
//
//  Created by Tushar Jaunjalkar on 04/07/23.
//

import SwiftUI

struct BottomTabBar: View {
    
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                VStack {
                    ActivityIndicatiorView()
                    Text("Loading")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding()
                .background(Color.black)
                .cornerRadius(8)
            } else {
                ZStack {
                    if !viewModel.errorMessage.isEmpty {
                        VStack(spacing: 5) {
                            Image(systemName: "xmark.octagon.fill")
                                .font(.system(size: 64, weight: .semibold))
                                .foregroundColor(.red)
                            Text(viewModel.errorMessage)
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.red)
                        }//.foregroundColor(.brown)
                    }
                    else {
                        TabView {
                            ProductsListView(viewModel: viewModel)
                                .tabItem {
                                    Image(systemName: "house.fill")
                                    Text("Products")
                                }
                            FavouriteView(viewModel: viewModel)
                                .tabItem {
                                    Image(systemName: "heart.fill")
                                    Text("Favourites")
                                }
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.getProducts()
        }
    }
}

struct BottomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBar()
    }
}
