//
//  ActivityIndicatorView+SwiftUI.swift
//  SocialNetwork
//
//  Created by Luis Ramirez on 29/03/20.
//  Copyright © 2020 Lramirez. All rights reserved.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorView>) {
        uiView.startAnimating()
    }
}
