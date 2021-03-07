import Foundation
import Combine

class QuoteViewModel: ObservableObject {
    private let quoteService = QuoteService()
    
    var cancelable = Set<AnyCancellable>()
    
    @Published var quote = QuoteModel(id: 0, quote: "", author: "")
    
    init() {
        getQuote()
    }
    
    func getQuote() -> Void {
        quoteService.getQuote().sink(
            receiveCompletion: {
                completion in print("quote: \(completion)")
            }, receiveValue: {
                response in self.quote = response
            }).store(in: &cancelable)
    }
}
