//
//  Notifications.swift
//  BookDay
//
//  Created by Vivian Bacelar on 14/02/23.
//

import SwiftUI
import UserNotifications

struct Notifications: View {
    
    @State var alarm: AlarmModel = AlarmModel()
    
    var body: some View {
        
        HStack {
            DatePicker("", selection: $alarm.time, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .onChange(of: alarm.time) { newValue in
                   
                }
            Spacer()
            
            Toggle(alarm.enabled ? "" : "", isOn: $alarm.enabled)
                .onChange(of: alarm.enabled, perform: { enabled in
                    print("troca")
                    enabled ? setAlarm() : cancelAlarm()
                })
                .tint(Color("yellow"))
                .padding()
            
        } .onAppear {
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            print(granted)
        }
    }
}
    
    func setAlarm() {
        print("notificação")
        let content = UNMutableNotificationContent()
        content.title = "BookDay"
        content.body = "Everyday a new page"
        content.sound = UNNotificationSound.default

        
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.hour, .minute], from: alarm.time), repeats: true)
        
        let request = UNNotificationRequest(identifier: alarm.id.uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        { error in
            if error != nil {
                print("Error setting alarm: \(error!)")
            } else {
                print(request)
                print(Date.now)
            }
        }
    }
    
    func cancelAlarm() {
        print("Cancelou alarme!")
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [alarm.id.uuidString])
    }
}
   

//struct Notifications_Previews: PreviewProvider {
//    static var previews: some View {
//        Notifications()
//    }
//}
