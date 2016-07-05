# Introduction to UITabBarController

[Apple TabBarController](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITabBarController_Class/)

Human Interface Guidelines for [Tab Bar Icons](https://developer.apple.com/ios/human-interface-guidelines/graphics/custom-icons/)

@1x = 22x22
@2x = 44x44
@3x = 66x66

In the AppDelegate 

```
if let tabBarController = window?.rootViewController as? UITabBarController {
	let index = tabBarController.selectedIndex
	
	print("The Selected Index is \(index)")
}
```

[NSUserDefaults](https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSUserDefaults_Class/index.html)

# Saving NSUSerDefaults

```
let defaults = NSUserDefaults.standardDefaults()
defaults.setIntegerForKey(index, "kSelectedIndex")

// IMPORTANT
defaults.synchronize()
```


# Loading UserDefaults

```

let index = NSUserDefaults.standardDefaults().integerForKey("kSelectedIndex")
print(index)

```


## Homework Phase I

Create three UISlider objects one for the red, green and blue.

When the slider value changes save the corresponding (red,green or blue) value to the NSUserDefaults.

When the viewDidLoad method of the ViewController is called, change the background color to the saved values.


