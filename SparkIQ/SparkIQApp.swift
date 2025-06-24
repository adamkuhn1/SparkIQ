import SwiftUI

@main
struct SparkIQApp: App {
    @State private var isLoading = true

    var body: some Scene {
        WindowGroup {
            // The ONE NavigationView for the whole app
            NavigationView {
                ZStack {
                    // This is guaranteed to animate correctly now
                    // because it's just content, not a NavigationView itself.
                    OnboardingWelcome()
                        .opacity(isLoading ? 0 : 1)

                    if isLoading {
                        LaunchView()
                    }
                }
            }
            // Use .onAppear on the root view
            .onAppear(perform: startLoadingProcess)
            // Tint the back button for the whole app
            .tint(.white)
        }
    }

    func startLoadingProcess() {
        // Run this only once
        guard isLoading else { return }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.easeOut(duration: 0.8)) {
                self.isLoading = false
            }
        }
    }
}
