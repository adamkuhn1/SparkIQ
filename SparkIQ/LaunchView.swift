import SwiftUI

struct LaunchView: View {
    let gradient = LinearGradient(
        gradient: Gradient(colors: [Color(red: 40/255, green: 125/255, blue: 235/255), Color(red: 0/255, green: 70/255, blue: 150/255)]),
        startPoint: .top,
        endPoint: .bottom
    )

    var body: some View {
        ZStack {
            gradient
                .ignoresSafeArea()

            VStack(spacing: 12) {
               
                Image("spark-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400)

              
            }
        }
    }
}

#Preview {
    LaunchView()
}
