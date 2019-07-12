import Foundation

/// Checkout API Environment
///
/// - live
/// - sandbox
@objc public enum Environment: Int, RawRepresentable {

    /// live environment used for production using
    case live

    /// sandbox environment used for development
    case sandbox
    
    public typealias RawValue = String
    
    public var rawValue: RawValue {
        switch self {
        case .live:
            return "live"
        case .sandbox:
            return "sandbox"
        }
    }
    
    public init?(rawValue: RawValue) {
        switch rawValue {
        case "live":
            self = .live
        case "sandbox":
            self = .sandbox
        default:
            self = .sandbox
        }
    }

    var urlApi: String {
        switch self {
        case .live:
            return "https://api2.checkout.com/v2/"
        case .sandbox:
            return "https://sandbox.checkout.com/api2/v2/"
        }
    }

    var urlPaymentApi: String {
        switch self {
        case .live:
            return "https://api.checkout.com/"
        case .sandbox:
            return "https://sandbox.checkout.com/api2/"
        }
    }
}
