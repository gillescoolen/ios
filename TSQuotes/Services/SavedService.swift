import Foundation

final class SavedService {
    private let key = "saved"
    
    func read() -> [QuoteModel] {
        var quotes: [QuoteModel] = []
        
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return quotes
        }
                
        if let decoded = try? JSONDecoder().decode([QuoteModel].self, from: data) {
            quotes = decoded
        }
        
        return quotes
    }
    
    func write(_ quotes: [QuoteModel]) -> [QuoteModel] {
        if let encoded = try? JSONEncoder().encode(quotes) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
        
        return quotes
    }
    
    func get(_ quote: QuoteModel) -> QuoteModel? {
        read().first { $0.id == quote.id }
    }
    
    func has(quotes: [QuoteModel], quote: QuoteModel) -> Bool {
        quotes.contains { $0.id == quote.id }
    }
    
    func save(quotes: [QuoteModel], quote: QuoteModel) -> [QuoteModel] {
        if has(quotes: quotes, quote: quote) {
            return quotes
        }
        
        return write(quotes + [quote])
    }
    
    func remove(quotes: [QuoteModel], quote: QuoteModel) -> [QuoteModel] {
        write(quotes.filter { $0.id != quote.id })
    }
}
