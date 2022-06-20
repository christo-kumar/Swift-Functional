//
//  NetRepo.swift
//  HelloiOS
//
//  Created by Christo Kumar on 20/06/22.
//

import Foundation

enum NetError: Error {
    case comman
}

class NetRepo {
    func getPosts() async -> Result<AnimalResponse, NetError> {
        let urlString = "https://api-dev-scus-demo.azurewebsites.net/api/Animal/GetAnimals"
        guard let url = URL(string: urlString) else {
            return .failure(.comman)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let animalResponse = try JSONDecoder().decode(AnimalResponse.self, from: data)
            return .success(animalResponse)
        } catch {}
                
        return .failure(.comman)
    }
}
