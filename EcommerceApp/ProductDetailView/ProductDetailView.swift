//
//  ProductDetailView.swift
//  EcommerceApp
//
//  Created by Tushar Jaunjalkar on 03/07/23.
//

import SwiftUI

struct ProductDetailView: View {
    @Binding var product: Product
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: product.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                Text(product.price.first?.value.stringValue ?? String())
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.secondary)
                Text("Rating: \(product.ratingCount)")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.secondary)
                HStack { Spacer() }
                HStack(spacing: 10) {
                    Button(action: {
                        // Add to cart action
                    }, label: {
                        Text("Add to Cart")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(.darkText))
                            .cornerRadius(8)
                            .padding(.leading, 5)
                    }).frame(height: 25)
                    Button(action: {
                        // Toggle favorite action
                        toggleFavorite()
                    }, label:  {
                        Image(systemName: product.isInWishlist ? "heart.fill" : "heart")
                            .foregroundColor(product.isInWishlist ? .red : .gray)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .padding()
                    })
                    .frame(width: 44, height: 44)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 3)
                }
                .padding(.leading, 5)
            }.padding(.top)
                .padding(.horizontal)
        }
        .navigationBarTitle(product.title, displayMode: .inline)
    }
    
    func toggleFavorite() {
        self.product.isInWishlist.toggle()
    }
}
                                                                                      
