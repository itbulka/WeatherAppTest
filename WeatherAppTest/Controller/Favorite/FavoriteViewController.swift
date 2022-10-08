//
//  FavoriteViewController.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 07.10.2022.
//

import UIKit

class FavoriteViewController: BaseViewController {
    
    private let tableFavoriteCities: UITableView = {
        let table = UITableView()
        table.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.identifier)
        table.separatorStyle = .none
        table.allowsSelection = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Resources.Titles.favoriteTitle
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableFavoriteCities.frame = view.bounds
    }


}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.identifier, for: indexPath) as? FavoriteCell else { return UITableViewCell()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func configureUI() {
        super.configureUI()
        tableFavoriteCities.delegate = self
        tableFavoriteCities.dataSource = self
    }
    
    override func addViews() {
        super.addViews()
        view.addView(tableFavoriteCities)
    }
    
    override func layoutConstraints() {
        super.layoutConstraints()
    }
}
