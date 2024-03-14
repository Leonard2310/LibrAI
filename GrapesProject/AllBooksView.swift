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
    @State private var sheetvision = false
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
                    ForEach(FilteredBooks) { Book in
                        VStack{
                            Image (Book.cover)
                                .resizable()
                                .frame(width: 115, height: 182)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .onTapGesture {
                                    sheetvision = true
                                }

                            Text (Book.title)
                                .font(.footnote)
                        }
                        .fullScreenCover(isPresented: $sheetvision) {
                            ImmersiveReadingView(Booktest: GrapesProject.book(title: Book.title, lastBackground: Book.lastBackground))
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
