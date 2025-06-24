import SwiftUI

struct OnboardingWelcome: View {
    var body: some View {
        // 1. Add a NavigationView to manage the screen flow.
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.yellow]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                RadialGradient(
                    gradient: Gradient(colors: [Color.yellow, Color.clear]),
                    center: .topLeading,
                    startRadius: 68,
                    endRadius: 250
                )
                .ignoresSafeArea()

                GeometryReader { geo in
                    VStack(spacing: geo.size.height * 0.025) {

                        // Logo
                        Image("iqLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geo.size.height * 0.20)
                            .padding(.leading, geo.size.width * 0.05)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        // Title
                        Text("From Experience,\nFor Real Change")
                            .font(.system(size: geo.size.width * 0.11, weight: .regular))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, geo.size.width * 0.05)


                        // Subtitle
                        Text("Developed with university students, research specialists, and people who’ve been through it.")
                            .font(.system(size: geo.size.width * 0.048))
                            .foregroundColor(.white.opacity(0.9))
                            .multilineTextAlignment(.leading)
                            .lineSpacing(5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, geo.size.width * 0.05)

                        // Ratings Box
                        Spacer()
                        HStack(spacing: geo.size.width * 0.05) {
                            HStack(spacing: 6) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.system(size: geo.size.width * 0.055))
                                Text("4.5")
                                    .foregroundColor(.yellow)
                                    .font(.system(size: geo.size.width * 0.055, weight: .bold))
                            }

                            VStack(alignment: .leading, spacing: 2) {
                                Text("AVERAGE")
                                Text("RATING")
                            }
                            .font(.system(size: geo.size.width * 0.03, weight: .semibold))
                            .foregroundColor(.white)

                            Rectangle()
                                .frame(width: 1, height: geo.size.height * 0.04)
                                .foregroundColor(.white.opacity(0.6))

                            VStack(alignment: .leading, spacing: 2) {
                                Text("OVER 5K")
                                Text("ACTIVE USERS")
                            }
                            .font(.system(size: geo.size.width * 0.03, weight: .semibold))
                            .foregroundColor(.white)
                        }
                        .padding(.vertical, geo.size.height * 0.02)
                        .padding(.horizontal, geo.size.width * 0.06)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white.opacity(0.8), lineWidth: 4)
                        )

                        Spacer()

                        // Logos right above CTA
                        HStack(spacing: geo.size.width * 0.05) {
                            Image("umichLogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: geo.size.height * 0.035)

                            Image("cmuLogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: geo.size.height * 0.155)
                        }
                        .padding(.bottom, geo.size.height * 0)
                        .padding(.bottom, -45.0)

                        // 2. Change the Button to a NavigationLink.
                        // This will navigate to the SignInChooserView.
                        NavigationLink(destination: SignInChooserView()) {
                            Text("Next →")
                                .font(.system(size: geo.size.width * 0.045, weight: .medium))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, geo.size.height * 0.025)
                                .background(Color.white)
                                .cornerRadius(16)
                        }
                        .padding(.horizontal, geo.size.width * 0.05)


                        // Footer
                        HStack(spacing: 8) {
                            Text("Privacy Policy")
                            Text("·")
                            Text("Terms of Service")
                        }
                        .font(.system(size: geo.size.width * 0.03))
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.bottom, geo.size.height * 0.02)
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            // 3. Hide the navigation bar so this screen's design doesn't change.
            .navigationBarHidden(true)
        }
        // This makes the back button arrow on the next screen white.
        .tint(.white)
    }
}

#Preview {
    OnboardingWelcome()
}
