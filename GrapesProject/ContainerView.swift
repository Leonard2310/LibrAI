//
//  ContainerView.swift
//  GrapesProject
//
//  Created by Salvatore Cangiano on 06/03/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            LibraryView().tabItem {Label("Library", systemImage: "books.vertical.fill" )}.tag(1)
            CollectablesView().tabItem { Label("Collectables", systemImage: "trophy.fill") }.tag(2)
        }
    }
}

#Preview {
    TabBar()
}

