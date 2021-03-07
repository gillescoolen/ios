import Foundation

class QuoteModel: Codable {
    public let id: Int
    public let quote: String
    public let author: String
    
    init(id: Int, quote: String, author: String) {
        self.id = id
        self.quote = quote
        self.author = author
    }
}
