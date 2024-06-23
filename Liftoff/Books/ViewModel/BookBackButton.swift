

import Foundation
import SwiftUI

struct CustomBackButton: View {
    var book: Book
    let label: String
    
    var body: some View {
        Button(action: {
            // TODO: back button action here
        })
        {
            HStack {
                Image(systemName: "chevron.left")
                Image("cover\(book.id)")
                Text(book.title)
            }
        }
    }
}
