import SwiftUI

struct SignInChooserView: View {
    // This environment variable lets us dismiss the screen to go back.
    @Environment(\.presentationMode) var presentationMode

    let backgroundColor = Color(red: 247/255, green: 247/255, blue: 247/255)
    let brandBlue = Color(red: 0/255, green: 118/255, blue: 255/255)

    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)

            // Main vertical stack for all content
            VStack(spacing: 25) {
                VStack(spacing: 16) {
                    Text("Already have an account?")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary.opacity(0.9))

                    Button("Sign in") {
                        print("Sign In button tapped!")
                    }
                    .buttonStyle(GradientButtonStyle())
                    
                }

                // --- Separator Line ---
                Divider()
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)

                // --- "New to SparkIQ?" Section ---
                VStack(spacing: 16) {
                    Text("New to ")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary.opacity(0.9))
                    +
                    Text("SparkIQ?")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(brandBlue)

                    Button("Get Started") {
                        print("Get Started button tapped!")
                    }
                    .buttonStyle(BorderedButtonStyle(brandColor: brandBlue))
                }
            }
            .padding(.horizontal, 40)
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

// MARK: - Custom Button Styles

// Style for the primary gradient "Sign in" button.
struct GradientButtonStyle: ButtonStyle {
    let gradient = LinearGradient(
        gradient: Gradient(colors: [Color(red: 90/255, green: 165/255, blue: 255/255), Color(red: 0/255, green: 70/255, blue: 150/255)]),
        startPoint: .top,
        endPoint: .bottom
    )

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .foregroundColor(.white)
            .background(gradient)
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

// Style for the secondary bordered "Get Started" button.
struct BorderedButtonStyle: ButtonStyle {
    let brandColor: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .foregroundColor(brandColor)
            .background(.white)
            .clipShape(Capsule())
            .overlay(
                Capsule().stroke(Color.gray.opacity(0.4), lineWidth: 1.5)
            )
            // Make the button slightly transparent when pressed.
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

// MARK: - Preview

#Preview {
    // For the preview to work correctly, we wrap it in a NavigationView
    // so it knows how to display the navigation bar.
    NavigationView {
        SignInChooserView()
    }
}
