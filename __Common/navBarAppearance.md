UIApplication.sharedApplication().statusBarStyle = .LightContent

UINavigationBar.appearance().barTintColor = UIColor(red: 0.29, green: 0.30, blue: 0.59, alpha: 1.0)

UINavigationBar.appearance().tintColor = UIColor.whiteColor()

if let font = UIFont(name: "Helvetica", size: 22) {
    UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName : font, NSForegroundColorAttributeName : UIColor.whiteColor()]
}
