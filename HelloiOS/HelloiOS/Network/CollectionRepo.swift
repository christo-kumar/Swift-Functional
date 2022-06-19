//
//  CollectionRepo.swift
//  HelloiOS
//
//  Created by Christo Kumar on 19/06/22.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case decodingError
    case badRequest
    case noData
    case custom(Error)
}

class CollectionRepo {
    func getImages(completion: @escaping(Result<AnimalResponse,NetworkError>)->Void) {
        let urlString = "https://api-dev-scus-demo.azurewebsites.net/api/Animal/GetAnimals"
        guard let url = URL(string: urlString) else {
            completion(.failure(.urlError))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, err in
            if let error = err {
                completion(.failure(.custom(error)))
            } else if ((response as? HTTPURLResponse)?.statusCode != 200) {
                completion(.failure(.badRequest))
            } else {
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                let animals = try? JSONDecoder().decode(AnimalResponse.self, from: data)
                if let animals = animals {
                    completion(.success(animals))
                    return
                } else {
                    completion(.failure(.decodingError))
                }
            }
        }
        task.resume()
    }
}
