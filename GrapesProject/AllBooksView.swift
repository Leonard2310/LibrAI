//
//  AllBooksView.swift
//  GrapesProject
//
//  Created by Matteo Nasti on 09/03/24.
//

import SwiftUI

struct AllBooksView: View {
    var Mydata = sharedData
    @State private var sheetvision2 = false
    @State var searchText = ""
   // var book : book
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
                        Button(action: {
                            self.sheetvision2.toggle()
                        }) {
                            VStack{
                                //  NavigationLink(destination: CollectablesView()) {
                                Image (Book.cover)
                                    .resizable()
                                //.aspectRatio(contentMode: .fit)
                                    .frame(width: 115, height: 182)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                // }
                                Text (Book.title)
                                    .font(.footnote)
                                    .foregroundColor(.black)
                                
                            }
                            .fullScreenCover(isPresented: $sheetvision2) {
                                ImmersiveReadingView(Booktest: book(title: Book.title, lastBackground: Book.lastBackground))
                            }
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
