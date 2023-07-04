//
//  NavigationLazyView.swift
//  EcommerceApp
//
//  Created by Tushar Jaunjalkar on 03/07/23.
//

import SwiftUI

struct NavigationLazyView<T: View>: View {
    let build: () -> T
    
    init(_ build: @autoclosure @escaping () -> T) {
        self.build = build
    }
    
    var body: T {
        build()
    }
}
