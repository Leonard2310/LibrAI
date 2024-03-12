//
//  CollectablesView.swift
//  GrapesProject
//
//  Created by Salvatore Cangiano on 06/03/24.
//

import SwiftUI

struct CollectablesView: View {
    
    var myData = SharedData()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Last Earned")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 11.0)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(myData.Mice1) {
                            Mouse in
                            VStack{
                                Image(Mouse.mouseImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .mask(Circle())
                                    .frame(width: 130, height: 130)
                                    .padding(.leading, 11.0)
                                    .foregroundStyle(.blue.gradient.shadow(.inner(color: .white.opacity(0.3), radius: 3, x: 1, y: 1)))
                                Text(Mouse.mouseName)
                                    .padding(.leading, 11.0)
                            }
                        }
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(myData.Mice2) {
                            Mouse in
                            VStack{
                                Image(Mouse.mouseImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .mask(Circle())
                                    .frame(width: 130, height: 130)
                                    .padding(.leading, 11.0)
                                    .foregroundStyle(.blue.gradient.shadow(.inner(color: .white.opacity(0.3), radius: 3, x: 1, y: 1)))
                                Text(Mouse.mouseName)
                                    .padding(.leading, 11.0)
                            }
                        }
                    }
                }
                Text("App Challenges")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 11.0)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(myData.ChallengeMice) {
                            Mouse in
                            VStack{
                                ZStack{
                                    Image(Mouse.mouseImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .mask(Circle())
                                        .frame(width: 130, height: 130)
                                        .padding(.leading, 11.0)
                                        .blur(radius: 3)
                                    Label("", systemImage: "lock.fill")
                                        .padding(.leading, 15)
                                }
                                Text(Mouse.mouseName)
                                    .padding(.leading, 11.0)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Collectables")
        }
        
        
        
    }
}

#Preview {
    CollectablesView()
}
