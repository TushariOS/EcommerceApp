//
//  ActivityIndicatiorView.swift
//  EcommerceApp
//
//  Created by Tushar Jaunjalkar on 03/07/23.
//

import SwiftUI

struct ActivityIndicatiorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        indicator.color = .white
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
    
    typealias UIViewType = UIActivityIndicatorView
}

struct ActivityIndicatiorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatiorView()
    }
}
