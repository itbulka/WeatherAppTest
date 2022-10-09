//
//  FavoriteCell.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 08.10.2022.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    static let identifier: String = "FavoriteCell"
    
    var delegate: FavoriteViewController?
    
    private var weather: WeatherCD?
    
    private let viewCell: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.shadowColor = Resources.Colors.lightGray.cgColor
        view.layer.shadowRadius = 6
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 1.0
        return view
    }()
    
    private let nameCity: UILabel = {
        let label = UILabel()
        label.text = "Moscow"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold, width: .standard)
        return label
    }()
    
    private let temperature: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.hotWeather
        label.text = "22"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold, width: .standard)
        return label
    }()
    
    private let weatherCondition: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.lightGray
        label.text = "Облачно, ветер: 2 м/с"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold, width: .standard)
        return label
    }()
    
    private let buttonLike: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        btn.setImage(Resources.Icons.like, for: .normal)
        btn.tintColor = .systemRed
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    private func configureCell() {
        contentView.addView(viewCell)
        viewCell.addView(temperature)
        viewCell.addView(nameCity)
        viewCell.addView(weatherCondition)
        viewCell.addView(buttonLike)
        
        buttonLike.addTarget(self, action: #selector(deleteObjectForCoreData), for: .touchDown)
        
        constraintLayout()
    }
    
    private func constraintLayout() {
        NSLayoutConstraint.activate([
            viewCell.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            viewCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            viewCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            viewCell.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
            temperature.leftAnchor.constraint(equalTo: viewCell.leftAnchor, constant: 16),
            temperature.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 16),
            
            nameCity.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 16),
            nameCity.leftAnchor.constraint(equalTo: temperature.rightAnchor, constant: 10),
            
            weatherCondition.topAnchor.constraint(equalTo: nameCity.bottomAnchor, constant: 2),
            weatherCondition.leftAnchor.constraint(equalTo: nameCity.leftAnchor),
            
            buttonLike.rightAnchor.constraint(equalTo: viewCell.rightAnchor, constant: -16),
            buttonLike.centerYAnchor.constraint(equalTo: viewCell.centerYAnchor)
            
        ])
    }
    
    func configureContent(weather: WeatherCD) {
        self.weather = weather
        nameCity.text = weather.name
        temperature.text = "\(weather.temperature)"
        temperature.textColor = Resources.Colors.getColorForWeather(with: weather.temperature)
        weatherCondition.text = "\(weather.conditionWeather ?? "-"), \(weather.wingSpeed) м/с"
    }
    
    @objc private func deleteObjectForCoreData() {
        CoreDataService.shared.deleteObject(objectCD: self.weather)
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.updateData()
            self?.delegate?.reloadTableData()
        }
        
    }
    
}
