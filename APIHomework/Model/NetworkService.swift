//
//  NetworkService.swift
//  APIHomework
//
//  Created by Анна Ереськина on 04.06.2021.
//
import UIKit
import Foundation

/// Cервис загрузки данных
final class NetworkService {
    /// Сессия
    private let session: URLSession = .shared
    /// Декодер данных
    private let decoder = JSONDecoder()
}

// MARK: - NetworkServiceProtocol

extension NetworkService: NetworkServiceProtocol {
    
    func loadData(completion: @escaping ((FilmsModel?) -> Void)) {
        
        guard let url = URL(string: "https://kudago.com/public-api/v1.2/movies/?page_size=60") else {
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { (data, _, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                let dataModel = try self.decoder.decode(FilmsModel.self, from: data)
                completion(dataModel)
            } catch {
                completion(nil)
            }
        }.resume()
    }
    
    func loadImage(imageUrl: String, completion: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: imageUrl) else {
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        
        session.dataTask(with: request) { (data, _, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
}
