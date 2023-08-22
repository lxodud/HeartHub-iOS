//
//  ImageProvider.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/21.
//

import Foundation

final class ImageProvider {
    static let shared = ImageProvider()
    
    func fetch(
        from url: URL,
        queue: DispatchQueue = DispatchQueue.global(),
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        queue.async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(ImageProviderError.missingImageData))
                return
            }
            
            completion(.success(imageData))
        }
    }
}
