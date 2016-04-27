# Localize

Example: 

Your swift strings file:

```swift
import Lozalize

enum AppStrings: String, Localizable {
    case Name
    
    enum Menu: String, Localizable {
        static let parent: LocalizeParent = AppStrings.self
        
        case Home
        case Profile
        
        enum Settings: String, Localizable {
            static let parent: LocalizeParent = Menu.self
            
            case Notifications
            case About
        }
    }
    
    static var parent: LocalizeParent = nil
}
```

So in your app you can call:

```swift
let about = AppStrings.Menu.Settings.About.localized 
```

which will look in you `Localizable.strings` for the key `"app-strings.menu.settings.about"`.
