//
//  OnboardingView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 14/02/23.
//

import SwiftUI


struct OnboardingView: View {
    
    @State private var currentStep = 1
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        
        TabView(selection: $currentStep) {
            IceView(currentStep: $currentStep)
                .tag(1)
            PinkView(currentStep: $currentStep)
                .tag(2)
            PurpleView(currentStep: $currentStep)
                .tag(3)
            GreenView(currentStep: $currentStep)
                .tag(5)
            BlueView(currentStep: $currentStep)
                .tag(4)
            YellowView(currentStep: $currentStep, shouldShowOnboarding: $shouldShowOnboarding)
                .tag(6)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .edgesIgnoringSafeArea(.all)
        
       

    }
}





//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//    }
//}
