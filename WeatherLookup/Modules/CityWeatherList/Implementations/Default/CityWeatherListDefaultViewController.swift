//
//  CityWeatherListDefaultViewController.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 15/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import UIKit

class CityWeatherListDefaultViewController: UIViewController {
    var presenter: CityWeatherListPresenter?
    
    private lazy var tableView: UITableView = makeView {
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        $0.rowHeight = 70
        $0.allowsSelection = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(cell: WeatherTableViewCell.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Weather"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddCityButton))
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        let refreshWeatherControl = UIRefreshControl()
        refreshWeatherControl.addTarget(self, action: #selector(didPullRefreshControl(sender:)), for: .valueChanged)
        tableView.refreshControl = refreshWeatherControl
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter?.viewDidAppear()
    }
    
    @objc private func didPullRefreshControl(sender: UIRefreshControl) {
        presenter?.didPullRefreshControl()
    }
    
    @objc private func didTapAddCityButton() {
        presenter?.showCitiesList()
    }
}

extension CityWeatherListDefaultViewController: CityWeatherListViewController {
    func reloadData() {
        tableView.reloadData()
    }
    
    func endRefreshing() {
        tableView.refreshControl?.endRefreshing()
    }
}

extension CityWeatherListDefaultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.cityCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: WeatherTableViewCell.self, for: indexPath)
        
        if let presenter = presenter {
            let city = presenter.cityNameAtIndex(indexPath.row)
            let weatherData = presenter.weatherDataAtIndex(indexPath.row)
            
            cell.configure(with: .init(cityName: city, weatherData: weatherData))
        }
        
        return cell
    }
}

extension CityWeatherListDefaultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [
            UIContextualAction(style: .destructive, title: "Remove") { [weak self] _, _, completionHandler in
                self?.presenter?.didTapRemoveForRow(atIndex: indexPath.row)
                completionHandler(true)
            }
        ])
    }
}
