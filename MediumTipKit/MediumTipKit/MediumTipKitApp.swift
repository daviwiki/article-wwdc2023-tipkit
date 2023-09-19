
import SwiftUI
import TipKit

@main
struct MediumTipKitApp: App {
    var body: some Scene {
        WindowGroup {
            ChatView()
        }
        .environmentObject(TipViewModel())
    }
    
    init() {
        // TipKit: Initialize TipKit at application start up
        try? Tips.configure()
    }
}
