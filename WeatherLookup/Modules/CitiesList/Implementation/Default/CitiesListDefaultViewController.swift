//
//  CitiesListDefaultViewController.swift
//  WeatherLookup
//
//  Created by Alexander Smyshlaev on 16/07/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import UIKit

class CitiesListDefaultViewController: UIViewController, CitiesListViewController {
    var presenter: CitiesListPresenter?
    
    private lazy var tableView: UITableView = makeView {
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        $0.rowHeight = 44
        $0.dataSource = self
        $0.delegate = self
        $0.register(cell: UITableViewCell.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Cities"
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
}

extension CitiesListDefaultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.cityCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: UITableViewCell.self, for: indexPath)
        
        if let city = presenter?.cityNameAtIndex(indexPath.row) {
            cell.textLabel?.text = city
        }
        
        return cell
    }
}

extension CitiesListDefaultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter?.didSelectRow(atIndex: indexPath.row)
    }
}
