import SwiftUI

// MARK: Onboarding View
struct OnboardingCardView: View {
    
    var onboarding: Onboarding
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            ZStack {
                
//                Image(onboarding.image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .position(CGPoint(x: 380, y: 450))
//                    .padding(EdgeInsets(top: 50, leading: 20, bottom: 0, trailing: 20))
//                    
//                
//                Image("test")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .padding(EdgeInsets(top: 50, leading: 20, bottom: 0, trailing: 20))
//                    
//                
//                Image("moon")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .position(CGPoint(x: 120, y: 60))
//                    .padding(EdgeInsets(top: 50, leading: 20, bottom: 0, trailing: 20))
//                 
//                
//                Image("stars")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .padding(EdgeInsets(top: 50, leading: 20, bottom: 0, trailing: 20))
                   
                
            }
            
            Text(onboarding.title)
                .font(.system(size: 25))
                .foregroundStyle(Color.accentText)
                .fontWeight(.heavy)
                .lineSpacing(5)
                .frame(maxWidth: 270)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .padding([.bottom], 35)
                .padding([.top], 50)

            Text(onboarding.description)
                .font(.system(size: 15))
                .foregroundStyle(Color.accentText)
                .fontWeight(.medium)
                .lineSpacing(5)
                .frame(maxWidth: 300)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
        }
    }
}

