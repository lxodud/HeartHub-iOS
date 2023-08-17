//
//  NetworkError.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/17.
//

import Foundation

enum NetworkError: Error {
    case transportError
    case serverError
    case missingData
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .transportError:
            return NSLocalizedString("transport error", comment: "transport error")
        case .serverError:
            return NSLocalizedString("server error", comment: "server error")
        case .missingData:
            return NSLocalizedString("missing data", comment: "missing data")
        }
    }
}
