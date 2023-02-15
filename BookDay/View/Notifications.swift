//
//  Notifications.swift
//  BookDay
//
//  Created by Vivian Bacelar on 14/02/23.
//

import SwiftUI
import UserNotifications

struct Notifications: View {
    
    @State private var date = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let endComponents = DateComponents(hour: 23, minute: 59, second: 59)
        return calendar.date(from:endComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        VStack {
            Button("Request Permission"){
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error{
                        print(error.localizedDescription)
                    }
                }
            }
            
            DatePicker ("Horário da Notificação", selection: $date, in: dateRange, displayedComponents: [.hourAndMinute])
            
            Button("Schedule Notification"){
            
                let content = UNMutableNotificationContent()
                content.title = "BookDay"
                content.subtitle = "Time to read"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}
