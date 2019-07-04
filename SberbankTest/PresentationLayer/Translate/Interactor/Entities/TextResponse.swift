//
//  TextResponce.swift
//  SberbankTest
//
//  Created by Влад Калаев on 04/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation

struct TextResponse: Codable {
    var code: Int
    var lang: String
    var text: [String]
}

enum ResultResponse<ResponseResult,ResponseError> {
    case success(result: ResponseResult)
    case failure(error: ResponseError)
}


enum NetworkError: String, Swift.Error, CaseIterable {
    case couldNotParseJSON
    case invalidData
    case connectionError
    case noSuchElement
    case serverError401
    case serverError402
    case serverError404
    case serverError413
    case serverError422
    case serverError501
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .connectionError:
            return "Проверьте интернет соединение"
        case .couldNotParseJSON:
            return "Невозможно создать JSON объект"
        case .invalidData:
            return "Невалидные данные"
        case .noSuchElement:
            return "Попытка добавить новый элемент провалилась"
        case .serverError401:
            return "Неправильный api ключ"
        case .serverError402:
            return "Api ключ заблокирован"
        case .serverError404:
            return "Превышено суточное ограничение на объем переведенного текста"
        case .serverError413:
            return "Превышен максимально допустимый размер текста"
        case .serverError422:
            return "Текст не может быть переведен"
        case .serverError501:
            return "Заданное направление перевода не поддерживается"
        }
    }
    
    static func getErrorFor(statusCode: Int) -> NetworkError? {
        let errors =  NetworkError.allCases.filter { $0.rawValue == "serverError\(statusCode)" }
        let error = errors.last ?? nil
        return error
    }
}
