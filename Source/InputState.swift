import Foundation

/// Input State
///
/// - normal
/// - required
/// - hidden
@objc public enum InputState: Int {

    /// input should be displayed and is not a required field
    case normal

    /// input should be displayed and is a required field
    case required

    /// input should not be displayed
    case hidden
}
