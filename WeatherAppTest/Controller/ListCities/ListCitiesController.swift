//
//  ViewController.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 07.10.2022.
//

import UIKit

class ListCitiesController: BaseViewController {
    
    private let presenter = ListCitiesPresenter()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 30, height: 80)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CityViewCell.self, forCellWithReuseIdentifier: CityViewCell.identifier)
        collection.showsVerticalScrollIndicator = false
        collection.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Resources.Titles.listViewTitle
        presenter.viewController = self
        presenter.getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }
    
    func reloadData() {
        collectionView.reloadData()
    }


}

extension ListCitiesController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    override func addViews() {
        super.addViews()
        view.addView(collectionView)
    }
    
    override func configureUI() {
        super.configureUI()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func layoutConstraints() {
        super.layoutConstraints()
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.weatherData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: CityViewCell.identifier, for: indexPath) as? CityViewCell else { return UICollectionViewCell() }
        let weatherData = presenter.weatherData[indexPath.row]
        let isFavorite = presenter.checkIsFavorite(with: weatherData)
        collectionCell.configureContent(with: weatherData, isFavorite)
        return collectionCell
    }
    
}
