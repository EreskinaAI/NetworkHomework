//
//  FilmsResponse.swift
//  APIHomework
//
//  Created by Анна Ереськина on 06.06.2021.
//

import Foundation

// Модель фильмов на сегодня
struct FilmsModel: Decodable {
    /// Общее количество фильмов
    let count: Int
    /// Следующая страница
    let next: String
    /// Предыдущая страница
    let previous: String?
    /// Массив фильмов
    let results: [DetailModel]
}

/// Описание модели информации о фильме
struct DetailModel: Decodable {
    /// идентификатор
    let id: Int
    /// Заголовок
    let title: String
    /// Картинка
    let poster: PosterModel
}

/// Описание модели постера
struct PosterModel: Decodable {
    /// URL картинки
    let image: String
}


