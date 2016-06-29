/*:
## Forecaster API
*/
import UIKit
import CoreLocation
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let latitude: Double = 0.0
let longitude: Double = 0.0

let apiKey = "34dab86640f64ddcb012ac6e009e7e22"

let urlString = "https://api.forecast.io/forecast/\(apiKey)/\(latitude),\(longitude)"

if let url = NSURL(string: urlString) {
    if let data = NSData(contentsOfURL:url) {
        if let jsonString = NSString(data: data, encoding: NSUTF8StringEncoding) {
            print(jsonString)
        }
    }
}


