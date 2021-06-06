//
//  DetailVC.swift
//  APIHomework
//
//  Created by Анна Ереськина on 02.06.2021.
//
import UIKit
import Foundation

/// Контроллер с детальной информацией
final class DetailVC: SpinnerVС {
    
    // MARK: - Dependencies
    
    private var model: DetailModel
    private var networkService: NetworkServiceProtocol
    
    // MARK: - UI
    
    /// Название фильма
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return label
    }()
    
    /// Постер фильма
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    /// Инициализатор
    /// - Parameters:
    ///   - model: модель данных
    ///   - networkService: сервис загрузки данных
    init(model: DetailModel, networkService: NetworkServiceProtocol) {
        self.model = model
        self.networkService = networkService
        
        super.init(nibName: nil, bundle: nil) // init самого VC
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
        setupData()
    }
}

// MARK: - User methods

extension DetailVC {
    
    private func setupData() {
        titleLabel.text = model.title
        
        startAnimation()
        networkService.loadImage(imageUrl: model.poster.image, completion: { image in
            DispatchQueue.main.async {
                self.imageView.image = image
                self.stopAnimation()
            }
        })
    }
    
    private func setupViews() {
        view.backgroundColor = .lightGray
        view.addSubview(titleLabel)
        view.addSubview(imageView)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
        ])
    }
}
