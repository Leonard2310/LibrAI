//
//  BackgroundView.swift
//  GrapesProject
//
//  Created by Chiara Cortese on 11/03/24.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color("BackGround_Color"), Color("BackGround_Color")]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
