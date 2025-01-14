import Foundation
import TikTokOpenSDK
import Photos

@objc(Tiktok)
class Tiktok: UIViewController {

  @objc
  func auth(_ callback: @escaping RCTResponseSenderBlock) {
    let scopes = ["user.info.basic,video.list"]
    let scopesSet = NSOrderedSet(array:scopes)
    let request = TikTokOpenSDKAuthRequest()
    request.permissions = scopesSet
    DispatchQueue.main.async {
        let topViewController = UIApplication.shared.keyWindow?.rootViewController;
        request.send((topViewController)!, completion: { resp -> Void in
        callback([
          ["status": resp.errCode.rawValue, "code": resp.code]
        ])
      })
    }
  }

  @objc
  func share(_ path: String, callback: @escaping RCTResponseSenderBlock) {

  }
}
