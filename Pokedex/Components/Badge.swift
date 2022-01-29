//
//  Badge.swift
//  Pokedex
//
//  Created by Fabio Pereira on 29/01/22.
//

import UIKit
import SnapKit

final class Badge: UIView, ViewCodeConfiguration {
    var type: PokemonType? {
        didSet { configureViews() }
    }

    private lazy var icon: UIImageView = {
        return UIImageView(frame: .zero)
    }()
    
    private lazy var label: UILabel = {
        return UILabel(frame: .zero)
    }()
    
     init(type: PokemonType) {
        super.init(frame: .zero)
        self.type = type
        self.applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        self.addSubview(icon)
        self.addSubview(label)
    }
    
    func setupContraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.greaterThanOrEqualTo(75)
        }
    
        icon.snp.makeConstraints{ make in
            make.width.equalTo(15)
            make.height.equalTo(15)
            make.left.equalTo(5)
            make.centerY.equalToSuperview()
        }
        
        label.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leftMargin.equalTo(icon).inset(20)
        }
    }
    
    func configureViews() {
        if let pokemonType = self.type {
            self.backgroundColor = Colors.getColor(type: pokemonType)
            self.layer.cornerRadius = 3
            
            label.text = pokemonType.rawValue
            label.textColor = .white
            label.textAlignment = .center
            label.font = label.font.withSize(12)
            
            icon.image = UIImage(named: pokemonType.rawValue, in: Bundle.main, with: nil)
            icon.tintColor = .white
        }
    }
}
