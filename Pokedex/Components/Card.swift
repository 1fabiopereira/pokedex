//
//  Pokemon.swift
//  Pokedex
//
//  Created by Fabio Pereira on 05/02/22.
//

import UIKit
import SnapKit

final class Card: UIControl, ViewCodeConfiguration {
    
    var number: String? {
        didSet { configureViews() }
    }
    
    var name: String? {
        didSet { configureViews() }
    }
    
    var types: [PokemonType]? {
        didSet { configureViews() }
    }
    
    var image: String? {
        didSet { configureViews() }
    }

    private lazy var wrapper: UIView = {
        return UIView(frame: .zero)
    }()
    
    private lazy var lblNumber: UILabel = {
        return UILabel(frame: .zero)
    }()
    
    private lazy var lblName: UILabel = {
        return UILabel(frame: .zero)
    }()
    
    private lazy var badges: UIStackView = {
        return UIStackView(frame: .zero)
    }()
    
    private lazy var pokemon: UIImageView = {
        return UIImageView(frame: .zero)
    }()
    
    private lazy var dots: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = UIImage(named: "Dots", in: Bundle.main, with: nil)
        return image
    }()
    
    private lazy var pokeball: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = UIImage(named: "Pokeball", in: Bundle.main, with: nil)
        return image
    }()
    
    init (number: String, name: String, types: [PokemonType], image: String) {
        super.init(frame: .zero)
        self.number = number
        self.name = name
        self.types = types
        self.image = image
        self.applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCodeConfiguration Protocol implementation

extension Card {
    func buildHierarchy() {
        wrapper.addSubview(dots)
        wrapper.addSubview(pokeball)
        wrapper.addSubview(lblNumber)
        wrapper.addSubview(lblName)
        wrapper.addSubview(badges)
        wrapper.addSubview(pokemon)
        self.addSubview(wrapper)
    }
    
    func setupContraints() {
        self.snp.makeConstraints{ make in
            make.height.equalTo(115)
            make.width.greaterThanOrEqualTo(wrapper)
        }
        
        wrapper.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
        
        lblNumber.snp.makeConstraints{ make in
            make.leading.equalTo(20)
            make.top.equalTo(20)
        }
        
        lblName.snp.makeConstraints{ make in
            make.leading.equalTo(20)
            make.top.equalTo(lblNumber).inset(15)
        }
        
        badges.snp.makeConstraints{ make in
            make.leading.equalTo(20)
            make.top.equalTo(lblName).inset(35)
        }
        
        pokemon.snp.makeConstraints { make in
            make.trailing.equalTo(-10)
            make.top.equalTo(-25)
            make.height.lessThanOrEqualTo(130)
            make.width.lessThanOrEqualTo(130)
        }
        
        dots.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.leading.equalTo(90)
        }
        
        pokeball.snp.makeConstraints { make in
            make.trailing.equalTo(0)
        }
    }
    
    func configureViews() {
        if types!.count > 0 {
            wrapper.backgroundColor = Colors.getColor(type: types![0]).withAlphaComponent(0.85)
            wrapper.layer.cornerRadius = 10
            
            badges.axis = .horizontal
            badges.spacing = 5
            
            for t in types! {
                let badge = Badge(type: t)
                badges.addArrangedSubview(badge)
            }
        }
        
        if number != nil {
            lblNumber.text = number
            lblNumber.textColor = .black.withAlphaComponent(0.6)
            lblNumber.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        }
        
        if name != nil {
            lblName.text = name
            lblName.textColor = .white
            lblName.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        }
        
        if image != nil {
            let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(image!)")
            let data = try? Data(contentsOf: url!)
            pokemon.image = UIImage(data: data!)
        }
    }
}
