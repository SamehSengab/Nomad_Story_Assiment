//
//  Network.swift
//  AssessmentApp
//
//  Created by Sameh Sengab on 21/10/2022.
//

import Foundation


typealias networkCompletion<T> = (Result<T,Error>) -> Void

protocol NetworkApiProtocol {
    func request<T: Codable>(
        url: URL?,
        expecting: T.Type,
        completion: @escaping networkCompletion<T>)
}

class NetworkApi: URLSession {
}

extension NetworkApi: NetworkApiProtocol {
    func request<T: Codable>(
        url: URL?,
        expecting: T.Type,
        completion: @escaping networkCompletion<T>) {
            guard let url = url else {
                completion(.failure(CustomError.invalidUrl ))
                return }
            print(url)
            let session = URLSession.shared
            let task = session.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.failure(CustomError.invalidData))
                    }
                    return }
                do {
                    let decoder =  JSONDecoder()
                    let result =  try decoder.decode(expecting, from: data)
                    completion(.success(result))
                } catch DecodingError.dataCorrupted(let context) {
                    print(context)
                    completion(.failure(CustomError.generalError(description: context.debugDescription)))
                } catch DecodingError.keyNotFound(let key, let context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                    completion(.failure(CustomError.generalError(description: context.debugDescription)))
                } catch DecodingError.valueNotFound(let value, let context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                    completion(.failure(CustomError.generalError(description: context.debugDescription)))
                } catch DecodingError.typeMismatch(let type, let context) {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                    completion(.failure(CustomError.generalError(description: context.debugDescription)))
                } catch {
                    completion(.failure(error))
                }

            }
            task.resume()
        }
}

extension URLSession {
    enum CustomError: Error {
        case generalError(description: String)
        case invalidUrl
        case invalidData
    }
}
