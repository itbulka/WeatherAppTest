//
//  CityViewCell.swift
//  WeatherAppTest
//
//  Created by Владимир Повальский on 08.10.2022.
//

import UIKit

class CityViewCell: UICollectionViewCell {
    
    static let identifier: String = "CityViewCell"
    
    private var imageWeather: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    private let nameCity: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold, width: .standard)
        return label
    }()
    
    private let temperature: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.hotWeather
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold, width: .standard)
        return label
    }()
    
    private let weatherCondition: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.lightGray
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold, width: .standard)
        return label
    }()
    
    private let buttonLike: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        btn.setImage(Resources.Icons.like, for: .normal)
        btn.tintColor = .systemRed
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        backgroundColor = .white
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 5
        layer.shadowOffset = .zero
        
        
        addView(imageWeather)
        addView(buttonLike)
        addView(temperature)
        addView(nameCity)
        addView(weatherCondition)
        
        constraintLayout()
    }
    
    private func constraintLayout() {
        NSLayoutConstraint.activate([
            imageWeather.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            imageWeather.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            imageWeather.widthAnchor.constraint(equalToConstant: 24),
            imageWeather.heightAnchor.constraint(equalToConstant: 24),
            
            temperature.topAnchor.constraint(equalTo: imageWeather.bottomAnchor, constant: 6),
            temperature.centerXAnchor.constraint(equalTo: imageWeather.centerXAnchor),
            
            
            weatherCondition.leftAnchor.constraint(equalTo: temperature.rightAnchor, constant: 10),
            weatherCondition.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            weatherCondition.bottomAnchor.constraint(equalTo: temperature.bottomAnchor),
            
            nameCity.leftAnchor.constraint(equalTo: temperature.rightAnchor, constant: 10),
            nameCity.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            nameCity.bottomAnchor.constraint(equalTo: weatherCondition.topAnchor, constant: 2),
            
            buttonLike.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            buttonLike.rightAnchor.constraint(equalTo: rightAnchor, constant: -6)
        ])
    }
    
    func configureContent(with weather: WeatherData) {
        imageWeather.image = Resources.Icons.Weather.getIconsForWeather(with: weather.temperature)
        imageWeather.tintColor = Resources.Colors.getColorForWeather(with: weather.temperature)
        nameCity.text = weather.nameCity
        weatherCondition.text = weather.conditionWeather
        temperature.text = "\(weather.temperature)"
        temperature.textColor = Resources.Colors.getColorForWeather(with: weather.temperature)
    }
    
}
