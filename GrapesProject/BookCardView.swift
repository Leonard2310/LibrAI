import SwiftUI

struct BookCardView: View {
    
    var Mydata = sharedData
    var book: book
    @State private var sheetvision = false
    var body: some View {
        ZStack{
            //Image(Background della view)
            Image (book.lastBackground)
                .resizable()
                .blur(radius: 0.8)
                //.padding(.top, 5.0)
                .aspectRatio(contentMode: .fill)
                .frame(width: 330, height: 190)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                
                //.padding(.leading, 31.0)
            Rectangle()
                .fill(LinearGradient(colors: [Color.clear, Color.black.opacity(1.0)], startPoint: .leading, endPoint: .trailing))
                .frame(width: 330, height: 190)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                //.padding(.leading, 31.0)
                
    
            HStack{
                Button(action: {
                    self.sheetvision.toggle()
                }) {
                    ZStack {
                        Image(book.cover)
                            .resizable()
                            .frame(width: 90, height: 140)
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                        Image("bookBase")
                            .resizable()
                            .frame(width: 90, height: 140)
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                            .blendMode(/*@START_MENU_TOKEN@*/.plusDarker/*@END_MENU_TOKEN@*/)
                        
                        Image(systemName: "play.circle")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .shadow(radius: 2)
                        
                    }
                            
                    } .fullScreenCover(isPresented: $sheetvision) {
                        ImmersiveReadingView(Booktest: GrapesProject.book(title: book.title, lastBackground: book.lastBackground))
                    
                }
                VStack (alignment: .leading){
                    VStack (alignment: .leading){
                        Text(book.title)
                            .font(.title3)
                            .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        
                        Text(book.author)
                            .foregroundColor(Color.white)
                    }
                    
                    ProgressView(value: 0.5)
                        .frame(width: 200.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: .white))
                    
                    
                }
            }
        }
        .padding(.top, 35.0)
    }
}

#Preview {
    BookCardView(book: book(title: "A Game Of Thrones", cover: "GoT-I&F",author: "George R. R. Martin", lastBackground: "GoT_Background"))
}
