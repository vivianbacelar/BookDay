//
//  BlueView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 14/02/23.
//

import SwiftUI

struct BlueView: View {
    @Binding  var currentStep: Int
    @State private var currentDate = Date()
    
    var body: some View{
        ZStack{
            Color.corAzul
                .ignoresSafeArea()
           
            VStack{
                Spacer()
                VStack(alignment: .center) {
                    Text("Inform the time you usually read")
                        .font(Font.custom("Raleway", size: 24).weight(.semibold))
                        .multilineTextAlignment(.leading)
                    
//                    Image("testeHora")
//                        .resizable()
//                        .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/25)
//                    
//                    VStack{
//                        
//                        DatePicker ( "", selection: $currentDate, displayedComponents: .hourAndMinute)
//                            .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/25)
//                        
//                        let notificationContent = UNMutableNotificationContent()
//                        notificationContent.title = "Title"
//                        notificationContent.body = "This is a test"
//                        notificationContent.badge = NSNumber(value: 1)
//                        notificationContent.sound = .default
//                        
//                        var datComp = DateComponents()
//                        datComp.hour = $currentDate
//                        datComp.minute = $currentDate
//                        let trigger = UNCalendarNotificationTrigger(dateMatching: datComp, repeats: true)
//                        let request = UNNotificationRequest(identifier: "ID", content: notificationContent, trigger: trigger)
//                        UNUserNotificationCenter.current().add(request) { (error : Error?) in
//                            if let theError = error {
//                                print(theError.localizedDescription)
//                            }
//                        }
//                    }
                    
                    
                    Image("dots3")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/120)
                        .multilineTextAlignment(.leading)
                }.padding(.horizontal, UIScreen.main.bounds.width/4)
                
                HStack(alignment: .bottom){
                    Spacer()
                    
                    Button {
                        self.currentStep += 1
                    } label: {
                        Image("nextButton")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/4.5, height: UIScreen.main.bounds.height/25)
                        
                    }.buttonStyle(.plain)
                    
                }.padding(.horizontal, UIScreen.main.bounds.width/10)
                    .padding(.top, UIScreen.main.bounds.height/4)
                    .padding(.bottom,UIScreen.main.bounds.height/35)
            }
        }
    }
}
