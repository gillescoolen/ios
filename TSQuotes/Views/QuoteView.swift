import SwiftUI

struct QuoteView: View {
    @ObservedObject private var quoteViewModel = QuoteViewModel()
    @EnvironmentObject private var savedViewModel: SavedViewModel

    var body: some View {
        VStack(alignment: .center) {
            Quote(quote: quoteViewModel.quote)
            
            HStack(alignment: .bottom) {
                Button(action: save) {
                    Text("Save")
                }

                Spacer()
                
                Button(action: refresh) {
                    Text("Refresh")
                }
            }.padding(.top, 20)
            
        }.padding(.horizontal)
    }
    
    private func refresh() -> Void {
        quoteViewModel.getQuote()
    }
    
    private func save() -> Void {
        savedViewModel.save(quoteViewModel.quote)
    }
}

