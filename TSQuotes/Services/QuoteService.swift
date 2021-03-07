import Foundation
import Combine

final class QuoteService {
    private let api = ApiService()
    
    func getQuote() -> AnyPublisher<QuoteModel, Error> {
        api.fetch(api.getURL());
    }
}
