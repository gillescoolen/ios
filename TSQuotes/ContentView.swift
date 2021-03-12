import SwiftUI

struct ContentView: View {
    private var savedViewModel = SavedViewModel()
    
    var body: some View {
        TabView {
            QuoteView()
                .tabItem {
                    Image(systemName: "quote.bubble")
                    Text("Quotes")
                }

            SavedView()
                .tabItem {
                    Image(systemName: "folder")
                    Text("Saved")
                }
        }.environmentObject(savedViewModel)
    }
}
