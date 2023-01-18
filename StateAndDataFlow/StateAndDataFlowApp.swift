import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
             StarterView()
                .environmentObject(userManager)
        }
    }
}
