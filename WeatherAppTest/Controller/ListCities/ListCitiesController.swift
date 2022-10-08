//
//  ViewController.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 07.10.2022.
//

import UIKit

class ListCitiesController: BaseViewController {
    
        //MARK: Test data
    
    private let weather: [WeatherData] = [
        WeatherData(nameCity: "Moscow", temperature: 22, conditionWeather: "Облачно"),
        WeatherData(nameCity: "New York", temperature: 16, conditionWeather: "Солнечно"),
        WeatherData(nameCity: "Niznevartovsk", temperature: -12, conditionWeather: "Снегопад"),
        WeatherData(nameCity: "Novosibirsk", temperature: 6, conditionWeather: "Дождь"),
        WeatherData(nameCity: "Sankt-Peterburg", temperature: 10, conditionWeather: "Дождь")
    ]
    
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
        return weather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: CityViewCell.identifier, for: indexPath) as? CityViewCell else { return UICollectionViewCell() }
        collectionCell.configureContent(with: weather[indexPath.row])
        return collectionCell
    }
}
