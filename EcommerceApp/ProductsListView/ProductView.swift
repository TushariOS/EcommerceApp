//
//  ProductView.swift
//  EcommerceApp
//
//  Created by Tushar Jaunjalkar on 03/07/23.
//

import SwiftUI
import Kingfisher
/*
 placeholder: {
     Image("placeholder")
         .resizable()
         .scaledToFit()
 }
 */
struct ProductView: View {
    
    // let product: Product
    @Binding var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            KFImage( URL(string: product.imageURL))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            
            Text(product.title)
                .font(.system(size: 12, weight: .bold))
                .padding(.horizontal, 12)
                .foregroundColor(Color(.label))
            
            Text(product.price.first?.value.stringValue ?? String())
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .foregroundColor(.gray)
                .padding(.bottom, 5)
            
            HStack() {
                Button(action: {
                    // Add to cart action
                }, label: {
                    Text("Add to Cart")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(5)
                })
                .frame(width: 100, height: 44)
                .shadow(radius: 3)
                .padding(.leading, 5)
                
                Spacer()
                
                Button(action: {
                    // Toggle favorite action
                    toggleFavorite(product.id)
                }, label: {
                    Image(systemName: product.isInWishlist ? "heart.fill" : "heart")
                        .foregroundColor(product.isInWishlist ? .red : .gray)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                })
                .frame(width: 44, height: 44)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(radius: 3)
                .padding()
                
            }.padding(.bottom, 5)
        }
        .background(Color.white)
        .cornerRadius(5)
        .shadow(color: .init(.sRGB, white: 0.9, opacity: 1), radius: 4, x: 0.0, y: 2.0)
        .padding(.bottom)
    }
    
    func toggleFavorite(_ productt: String) {
        print(product.title)
        if product.id == productt {
            self.product.isInWishlist.toggle()
        }
    }
}
