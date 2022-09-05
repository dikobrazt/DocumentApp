//
// NotificationsDataManager.swift
//

import UserNotifications

public class NotificationsDataManager: Resolvable {

    var notificationSent: Bool {
        get { UserDefaults.standard.bool(forKey: Constants.notificationKey) }
        set { UserDefaults.standard.setValue(true, forKey: Constants.notificationKey) }
    }

    public init() { }

    func sendOnboardingNotification(_ title: String, subtitle: String) {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

        sendLocalNotification(with: title, subtitle: subtitle)
    }

    func sendNotification(_ title: String, subtitle: String) {
        guard !notificationSent else { return }

        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        sendLocalNotification(with: title, subtitle: subtitle)
        notificationSent = true
    }

}

private extension NotificationsDataManager {
    struct Constants {
        static let notificationKey = "notificationKey"
    }

    private func sendLocalNotification(with title: String, subtitle: String) {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

        let date = Date(timeIntervalSinceNow: 1)
        let triggerDate = Calendar.current.dateComponents([.weekday, .hour, .minute, .second, .year], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)

        let content = UNMutableNotificationContent()
        content.title = title
        content.body = subtitle
        content.sound = UNNotificationSound.default

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if error != nil {
                print("something went wrong")
            }
        }
    }
}
