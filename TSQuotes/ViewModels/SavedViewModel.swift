import Foundation
import Combine

class SavedViewModel: ObservableObject {
    private let savedService = SavedService()
    
    @Published var quotes = [QuoteModel]()
    
    init() {
        quotes = savedService.read()
    }
    
    func save(_ quote: QuoteModel) {
        quotes = savedService.save(quotes: quotes, quote: quote)
    }
    
    func remove(_ quote: QuoteModel) {
        quotes = savedService.remove(quotes: quotes, quote: quote)
    }
}
