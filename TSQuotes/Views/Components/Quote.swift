import SwiftUI

struct Quote: View {
    let quote: QuoteModel
    
    var body: some View {
        Text(quote.quote)
            
        HStack(alignment: .center) {
            Spacer()
                
            Text("- \(quote.author)")
                .italic()
        }.padding(.top, 5)
    }
}
