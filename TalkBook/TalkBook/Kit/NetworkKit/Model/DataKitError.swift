//
//  DataKitError.swift
//  NetworkKit
//
//  Created by Imran on 5/8/23.
//

 

public enum TransactionStatus: String {
    case pending
    case failed
}

public struct DataKitError: Error {
    public enum ErrorScope: String {
        case local
        case global
        case illegalState
        case undertermined
    }
    
    public enum StatusCode: Int {
        case success = 200
        case created = 201
        case invalidInput = 400
        case invalidRefreshToken = 410
        case unAuthorized = 401
        case forbidden = 403
        case notFound = 404
        case updateRequired = 426
        case noInternet
        case serverError
        case timeOut
        case unknown
    }
    
    public private (set) var title: String?
    public var message: String?
    public private (set) var statusCode: StatusCode
    public private (set) var scope: ErrorScope
    public private (set) var transactionStatus: TransactionStatus?
    public private (set) var localErrorMessage: String?
    public var options: [String: Any]?
    public var dictionary: [String: Any]?
}

// -------------------------------------
// MARK: - Detail Implementation
// --------------------------------------

extension DataKitError {
    public init() {
        title = "something_went_wrong"
        message = "app_had_error"
        statusCode = .unknown
        scope = .get(for: statusCode)
    }
    
    /*
    public init(_ json: JSON) {
//        title = json["error"]["title"].string ?? "something_went_wrong"
//        message = json["error"]["message"].string ?? "app_had_error"
        message = json["status_message"].string ?? "something_went_wrong"
        transactionStatus = TransactionStatus(rawValue: json["error"]["status"].stringValue)
        localErrorMessage = json["error"]["error"].string
        options = json["error"].dictionaryObject
        let status = StatusCode(rawValue: json["statusCode"].intValue) ?? .unknown
        if status == .unknown {
            if let code = json["status_code"].int {
                if (500...599).contains(code) { statusCode = .serverError }
                else { statusCode = .unknown }
            } else { statusCode = .timeOut }
        } else { statusCode = status }
        scope = .get(for: statusCode)
        dictionary = json.dictionaryObject
    }*/
}

extension DataKitError {
    public static func illegalState() -> DataKitError {
        var error = DataKitError()
        error.scope = .illegalState
        return error
    }
    
    static func noInternet() -> DataKitError {
        var error = DataKitError()
        error.scope = .global
        error.statusCode = .noInternet
        error.title = "No internet"
        error.message = "Please check your connection"
        return error
    }
    
    static func requestTimeOut() -> DataKitError {
        var error = DataKitError()
        error.scope = .global
        error.statusCode = .timeOut
        error.title = "Request timeout"
        error.message = "We may wrong but please check your connection"
        return error
    }
    
    public static func invalidData() -> DataKitError {
        var error = DataKitError()
        error.scope = .local
        error.title = "Invalid Response"
        error.message = "Can't read the server response"
        return error
    }
    
    public static func invalidInput() -> DataKitError {
        var error = DataKitError()
        error.scope = .local
        error.title = "Invalid Input"
        error.message = "Can't go further with wrong or missing parameters"
        return error
    }
    
    public static func maintenance() -> DataKitError {
        var error = DataKitError()
        error.scope = .global
        error.title = "app_had_error"
        return error
    }
    
    public static func authorizationFailed() -> DataKitError {
        var error = DataKitError()
        error.scope = .global
        error.title = "Authorisation expired"
        error.message = "Please login again. We are sorry for inconvenience."
        return error
    }
    
    public func description() -> String {
        return "\(title),\n\(message),\n\(self.scope.rawValue)"
    }
}

extension DataKitError.ErrorScope {
    static func get(for statusCode: DataKitError.StatusCode) -> DataKitError.ErrorScope {
        if [DataKitError.StatusCode.unAuthorized, .invalidRefreshToken, .serverError, .timeOut, .noInternet, .updateRequired].contains(statusCode) {
            return .global
        } else if statusCode == .unknown { return .undertermined }
        else { return .local }
    }
}
