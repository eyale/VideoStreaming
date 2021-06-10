//
//  DCTools.swift
//  hastee
//
//  Created by dc on 12/20/18.
//  Copyright © 2018 OlDor. All rights reserved.
//

import UIKit

// MARK: - Load from storyboard
protocol StoryboardLoading {
  /**
  * Load an insctance from a storyboard
  * - parameter storyboardName: Storyboard name. By default == self class name.
  * - parameter identifier: Controller storyboard id. If nil, try to instantiate the initial VC;
  * if storyboard has no initial VC or instantiated controller has a different class,
  * try to instantiate a controller with storyboard id == self class name.
  */
  static func loadFromStoryboard(storyboardName: String?, identifier: String?) -> Self

}

// MARK: - Conform to StoryboardLoading
extension StoryboardLoading where Self: UIViewController {

  /**
  * - parameter storyboardName: default value is String(describing: self)
  * - parameter identifier: default value is nil; if the initial VC of the storyboard has a wrong class or not exist, try to use String(describing: self) as an identifier.
  */
  static func loadFromStoryboard(storyboardName: String? = nil, identifier: String? = nil) -> Self {

//  https://stackoverflow.com/questions/39450124/swift-programmatically-navigate-to-another-view-controller-scene/41095699#41095699
    let controllerName = String(describing: self)
    let storyboardName = storyboardName ?? controllerName // ?? nameByRemovingGenericSuffix(controllerName)
    let storyboard = UIStoryboard(name: storyboardName, bundle: nil)

    if let identifier = identifier,
      let result = storyboard.instantiateViewController(withIdentifier: identifier) as? Self {

      return result
    } else if let result = storyboard.instantiateInitialViewController() as? Self {
      return result
    } else if let result = storyboard.instantiateViewController(withClass: self) {
      return result
    }
    // ERROR
    return Self()
  }
}

extension UIViewController: StoryboardLoading {}

#if canImport(UIKit) && !os(watchOS)
public extension UIStoryboard {
    /// SwifterSwift: Get main storyboard for application
    static var main: UIStoryboard? {
        let bundle = Bundle.main
        guard let name = bundle.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String else { return nil }
        return UIStoryboard(name: name, bundle: bundle)
    }

    /// SwifterSwift: Instantiate a UIViewController using its class name
    ///
    /// - Parameter name: UIViewController type
    /// - Returns: The view controller corresponding to specified class name
    func instantiateViewController<T: UIViewController>(withClass name: T.Type) -> T? {
        return instantiateViewController(withIdentifier: String(describing: name)) as? T
    }
}
#endif

