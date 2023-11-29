
import UIKit
import SVProgressHUD

/// handle show and hide progress hud
class ProgressHUD {

    class func show() {
        SVProgressHUD.setBackgroundColor(UIColor.white)
        SVProgressHUD.show()
    }

    class func hide() {
        SVProgressHUD.dismiss()

    }
    private class func removeSpinner() {
        SVProgressHUD.dismiss()

    }
}
