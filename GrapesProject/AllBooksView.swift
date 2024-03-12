//
//  AllBooksView.swift
//  GrapesProject
//
//  Created by Matteo Nasti on 09/03/24.
//

import SwiftUI

struct AllBooksView: View {
    var Mydata = sharedData
    @State var searchText = ""
    var FilteredBooks: [book] {
        guard !searchText.isEmpty else { return Mydata.Books}
        return Mydata.Books.filter{
            $0.title.localizedCaseInsensitiveContains(searchText)
        }
    }
    var body: some View {
        let columns = [GridItem(.fixed(160)), GridItem(.fixed(160))]
        NavigationStack(){
            //Text("All books")
                //.font(.title3)
            ScrollView(showsIndicators: false){
                
                LazyVGrid(columns: columns){
                    ForEach(FilteredBooks) {
                        Book in
                        VStack{
                            NavigationLink(destination: ImmersiveReadingView()) {
                                Image (Book.cover)
                                    .resizable()
                                //.aspectRatio(contentMode: .fit)
                                    .frame(width: 115, height: 182)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            Text (Book.title)
                                .font(.footnote)
                            
                        }
                        
                    }
                }
            }
            .navigationTitle("All Books")
            .searchable(text: $searchText, prompt: "Search a book")
        }
    }
}

#Preview {
    AllBooksView()
}
