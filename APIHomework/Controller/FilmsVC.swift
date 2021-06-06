//
//  FilmsVC.swift
//  APIHomework
//
//  Created by Анна Ереськина on 02.06.2021.
//

import UIKit

/// Контроллер отображающий список фильмов на сегодня
final class FilmsVC: SpinnerVС {
    
    // MARK: - Dependencies
    
    private let networkService: NetworkServiceProtocol
    private var dataSource = [DetailModel]()
    
    // MARK: - UI
    
    /// Таблица отображающая список фильмов
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier )
        
        return tableView
        
    }()
    
    /// Инициализатор
    /// - Parameter networkService: сервис загрузки данных
    init(networkService: NetworkServiceProtocol) {
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
        loadData()
    }
}

// MARK: - User methods

extension FilmsVC {
    private func setupViews() {
        view.backgroundColor = .lightGray
        view.addSubview(tableView)
        title = "Фильмы сегодня"
    }
    
    private func loadData() {
        startAnimation()
        networkService.loadData { model in
            if let model = model {
                self.dataSource = model.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            self.stopAnimation()
        }
    }
}

// MARK: - UITableViewDataSource

extension FilmsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath)
        (cell as? TableViewCell)?.configure(with: dataSource[indexPath.row])
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension FilmsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailVC(model: dataSource[indexPath.row],
                           networkService: networkService)
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
