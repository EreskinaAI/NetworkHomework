//
//  NetworkServiceProtocol.swift
//  APIHomework
//
//  Created by Анна Ереськина on 06.06.2021.
//

import UIKit
import Foundation

/// Интерфейс сервиса загрузки данных из интернета
protocol NetworkServiceProtocol {
    
    /// Загрузить список фильмов
    /// - Parameter completion: список фильмов/nil
    func loadData(completion: @escaping ((FilmsModel?) -> Void))
    
    /// Загрузить картинку
    /// - Parameters:
    ///   - imageUrl: адрес картинки
    ///   - completion: картинка/nil
    func loadImage(imageUrl: String, completion: @escaping (UIImage?) -> Void)
}
