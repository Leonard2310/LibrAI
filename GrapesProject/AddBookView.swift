//
//  AddBookView.swift
//  GrapesProject
//
//  Created by Matteo Nasti on 08/03/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            Text("add book")
            .toolbar(){
                Button("Cancel"){
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddBookView()
}
