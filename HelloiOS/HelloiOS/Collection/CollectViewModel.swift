//
//  CollectViewModel.swift
//  HelloiOS
//
//  Created by Christo Kumar on 19/06/22.
//

import Foundation

class CollectViewModel {
    let collectRepo = CollectionRepo()
    func getImages(completion: @escaping(Result<AnimalResponse, NetworkError>)-> Void) {
        collectRepo.getImages(completion: completion)
    }
    
}
