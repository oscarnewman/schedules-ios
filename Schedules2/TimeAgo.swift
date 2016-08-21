// borrowed fom https://gist.githubusercontent.com/arnaudlamy/dbba08f7dd82cabd191f05d4546871e0/raw/4a3fc56800f671c761d6d8b9dcf4df0e8060ee5f/timeago.swift
import Foundation

func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
    let calendar = NSCalendar.currentCalendar()
    let now = NSDate()
    let earliest = now.earlierDate(date)
    let latest = (earliest == now) ? date : now
    let components:NSDateComponents = calendar.components([NSCalendarUnit.Minute , NSCalendarUnit.Hour , NSCalendarUnit.Day , NSCalendarUnit.WeekOfYear , NSCalendarUnit.Month , NSCalendarUnit.Year , NSCalendarUnit.Second], fromDate: earliest, toDate: latest, options: NSCalendarOptions())
    
    if (components.year >= 2) {
        return String.localizedStringWithFormat(NSLocalizedString("%d years ago", comment: ""), components.year)
    } else if (components.year >= 1){
        if (numericDates){
            return NSLocalizedString("1 year ago", comment: "")
        } else {
            return NSLocalizedString("Last year", comment: "")
        }
    } else if (components.month >= 2) {
        return String.localizedStringWithFormat(NSLocalizedString("%d months ago", comment: ""), components.month)
    } else if (components.month >= 1){
        if (numericDates){
            return NSLocalizedString("1 month ago", comment: "")
        } else {
            return NSLocalizedString("Last month", comment: "")
        }
    } else if (components.weekOfYear >= 2) {
        return String.localizedStringWithFormat(NSLocalizedString("%d weeks ago", comment: ""), components.weekOfYear)
    } else if (components.weekOfYear >= 1){
        if (numericDates){
            return NSLocalizedString("1 week ago", comment: "")
        } else {
            return NSLocalizedString("Last week", comment: "")
        }
    } else if (components.day >= 2) {
        return String.localizedStringWithFormat(NSLocalizedString("%d days ago", comment: ""), components.day)
    } else if (components.day >= 1){
        if (numericDates){
            return NSLocalizedString("1 day ago", comment: "")
        } else {
            return NSLocalizedString("Yesterday", comment: "")
        }
    } else if (components.hour >= 2) {
        return String.localizedStringWithFormat(NSLocalizedString("%d hours ago", comment: ""), components.hour)
    } else if (components.hour >= 1){
        if (numericDates){
            return NSLocalizedString("1 hours ago", comment: "")
        } else {
            return NSLocalizedString("An hour ago", comment: "")
        }
    } else if (components.minute >= 2) {
        return String.localizedStringWithFormat(NSLocalizedString("%d minutes ago", comment: ""), components.minute)
    } else if (components.minute >= 1){
        if (numericDates){
            return NSLocalizedString("1 minute ago", comment: "")
        } else {
            return NSLocalizedString("A minute ago", comment: "")
        }
    } else if (components.second >= 3) {
        return String.localizedStringWithFormat(NSLocalizedString("%d seconds ago", comment: ""), components.second)
    } else {
        return NSLocalizedString("Just now", comment: "")
    }
}