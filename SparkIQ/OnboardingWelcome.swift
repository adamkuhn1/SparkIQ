import SwiftUI

struct OnboardingWelcome: View {
    var body: some View {
        ZStack {
            // Background
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
                    Spacer(minLength: geo.size.height * 0.04)

                    // Logo
                    Image("iqLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: geo.size.height * 0.18)

                    // Title
                    Text("From Experience,\nFor Real Change")
                        .font(.system(size: geo.size.width * 0.10, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal, geo.size.width * 0.05)

                    // Subtitle
                    Text("Developed with university students,\nresearch specialists, and people who’ve\nbeen through it.")
                        .font(.system(size: geo.size.width * 0.045))
                        .foregroundColor(.white.opacity(0.9))
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                        .padding(.horizontal, geo.size.width * 0.08)

                    // Ratings Box
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
                        .font(.system(size: geo.size.width * 0.028, weight: .semibold))
                        .foregroundColor(.white)

                        Rectangle()
                            .frame(width: 1, height: geo.size.height * 0.04)
                            .foregroundColor(.white.opacity(0.6))

                        VStack(alignment: .leading, spacing: 2) {
                            Text("OVER 5K")
                            Text("ACTIVE USERS")
                        }
                        .font(.system(size: geo.size.width * 0.028, weight: .semibold))
                        .foregroundColor(.white)
                    }
                    .padding(.vertical, geo.size.height * 0.02)
                    .padding(.horizontal, geo.size.width * 0.06)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.white.opacity(0.8), lineWidth: 1)
                    )

                    
                    HStack{
                        Image("umichLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geo.size.height * 0.03)

                        
                        Image("cmuLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geo.size.height * 0.15)

                            
                        
                    }
                    .padding(.top, 100.0)
                    
                    // CTA Button
                    Button(action: {
                        // Navigation logic
                    }) {
                        Text("Next →")
                            .font(.system(size: geo.size.width * 0.045, weight: .medium))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, geo.size.height * 0.025)
                            .background(Color.white)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal, geo.size.width * 0.12)

                    // Footer
                    HStack(spacing: 8) {
                        Text("Privacy Policy")
                        Text("·")
                        Text("Terms of Service")
                    }
                    .font(.system(size: geo.size.width * 0.03))
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.bottom, geo.size.height * 0.03)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
    }
}

#Preview {
    OnboardingWelcome()
}
