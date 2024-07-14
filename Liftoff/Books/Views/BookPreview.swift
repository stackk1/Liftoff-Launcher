

import SwiftUI

struct BookPreview: View {
    
    @EnvironmentObject var model: BookModel
    var book:Book
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(color: .black, radius: 15, x: -5, y: 15)
            
            
            VStack(alignment: .leading){
                HStack {
                    Text(book.title)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    if book.isFavourite {
                        Image(systemName: "star.fill")
                        .foregroundColor(.yellow)}
                        
                }
                .padding(.top)
                Text(book.author)
                    .font(.caption)
                Image("cover\(book.id)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment:.center)
                    .padding(.bottom)                
            }
            .padding(.horizontal)
            .foregroundColor(.black)
            
        }
        .padding()
    }
}

struct BookPreview_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookPreview(book:model.books[1])
    }
}
