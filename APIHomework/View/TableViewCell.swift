//
//  TableViewCell.swift
//  APIHomework
//
//  Created by Анна Ереськина on 02.06.2021.
//

import UIKit
import Foundation

/// Ячейка таблицы
final class TableViewCell: UITableViewCell {
    
    static let identifier = "myCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Конфигурируем ячейку
    /// - Parameter model: модель данных
    func configure(with model: DetailModel) {
        textLabel?.text = model.title
    }
    
    private func setupViews() {
        selectionStyle = .none
        backgroundColor = .clear
    }
}
