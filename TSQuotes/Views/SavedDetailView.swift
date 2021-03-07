import SwiftUI

struct SavedDetailView: View {
    let quote: QuoteModel
    
    @EnvironmentObject private var savedViewModel: SavedViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(alignment: .center) {
            Quote(quote: quote)
            
            HStack(alignment: .bottom) {
                Button(action: remove) {
                    Text("Remove")
                }
            }.padding(.top, 20)
            
        }.padding(.horizontal)
    }
    
    private func remove() -> Void {
        savedViewModel.remove(quote)
        self.presentation.wrappedValue.dismiss()
    }
}

