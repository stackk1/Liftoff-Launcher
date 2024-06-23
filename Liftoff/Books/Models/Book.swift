

import Foundation

struct Book: Identifiable, Decodable {
    var title = "Test Title"
    var author = "Author"
    var isFavourite = false
    var currentPage = 0
    var rating = 1
    var id = 1
    var content = ["Book Content Placeholder Text PAGE 1", "Book Content Placeholder Text PAGE 2", "Book Content Placeholder Text PAGE 3"]
}
