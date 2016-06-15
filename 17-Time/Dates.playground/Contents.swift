//: # Working with Dates
//
// https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/DataFormatting/Articles/dfDateFormatting10_4.html#//apple_ref/doc/uid/TP40002369


import UIKit


let dateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"

let today = NSDate()

dateFormatter.dateFormat = "MMM d, yyyy"


print(dateFormatter.stringFromDate(today))



print(today)



