//
//  Schedule.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/22.
//

import SwiftUI

struct Schedule: Hashable{
    var name: String = ""
    var startAt: String
    var endAt: String
    var startAtToDate: Date {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withFullDate, .withTime, .withDashSeparatorInDate, .withColonSeparatorInTime]
        return dateFormatter.date(from: startAt)!
    }
    var endAtToDate: Date? {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withFullDate, .withTime, .withDashSeparatorInDate, .withColonSeparatorInTime]
        return dateFormatter.date(from: endAt)
    }
    var allDay: Bool
    var memo: String = ""
    var notification: Bool
    var repeatString : String
    var complete: Bool
    
    init(name: String, startAt: String, endAt: String, allDay: Bool, memo: String, notification: Bool, repeatString: String, complete: Bool) {
        self.name = name
        self.startAt = startAt
        self.endAt = endAt
        self.allDay = allDay
        self.memo = memo
        self.notification = notification
        self.repeatString = repeatString
        self.complete = complete
    }
    
    func isSameDate(as date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(startAtToDate, inSameDayAs: date)
    }
}



// {
//"name" : "밥먹기",
//"startAt" : "2023-03-17T19:11:00",
//"endAt" : "2023-03-17T19:11:00",
//"allDay" : "true",
//"memo" : "오늘 저녁은 고기!",
//"notification" : "true",
//"repeat" : "repeat process", // 구체적인 반복 방법 작성
//"complete" : "false"
//}

