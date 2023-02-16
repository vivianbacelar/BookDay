//
//  GreenView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 14/02/23.
//

import SwiftUI
import UserNotifications

struct GreenView: View {
    @Binding  var currentStep: Int
    
    var body: some View{
        
        ZStack{
            Color.corVerde
                .ignoresSafeArea()

            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("Enable the notification for us to help you keep up with your schedule. Just click on the image!")
                            .font(Font.custom("Raleway", size: 24).weight(.semibold))
                            .multilineTextAlignment(.leading)
                        Image("dots4")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/120)
                            .multilineTextAlignment(.leading)
                    }.padding(.bottom)
                     
                    Rectangle()
                        .foregroundColor(Color.corVerde)
                        .frame(width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.height/10)
                    
                }.padding(.horizontal, UIScreen.main.bounds.width/15)
                    .padding(.bottom, UIScreen.main.bounds.height/2)
                    
                

            }
            .overlay{
                Button {
                    self.currentStep += 1
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("All set!")
                        } else if let error = error{
                            print(error.localizedDescription)
                        }
                    }
                    let content = UNMutableNotificationContent()
                    content.title = "BookDay"
                    content.subtitle = "Time to read"
                    content.sound = UNNotificationSound.default
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    
                    
                    UNUserNotificationCenter.current().add(request)
                } label: {
                    Image("imageVerde")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    //                    .padding(.trailing, UIScreen.main.bounds.width/10)
                    
                }.buttonStyle(.plain)
               
            }
            
            
        }
    }
}
