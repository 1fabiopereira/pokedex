//
//  Badge.swift
//  Pokedex
//
//  Created by Fabio Pereira on 29/01/22.
//

import UIKit
import SnapKit

final class Badge: UIButton, ViewCodeConfiguration {
    weak var delegate: ClickableDelegate?
    
    var type: PokemonType? {
        didSet { configureViews() }
    }

    private lazy var icon: UIImageView = {
        return UIImageView(frame: .zero)
    }()
    
    private lazy var label: UILabel = {
        return UILabel(frame: .zero)
    }()
    
    private lazy var wrapper: UIControl = {
        let control = UIControl(frame: .zero)
        control.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        return control
    }()
    
     init(type: PokemonType) {
        super.init(frame: .zero)
        self.type = type
        self.applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func onClick() {
        print("Internal Click: --> \(self.type!)")
        if delegate?.onClick != nil {
            delegate!.onClick(type: self.type)
        }
    }
}

// MARK: - ViewCodeConfiguration Protocol implementation

extension Badge {
    func buildHierarchy() {
        wrapper.addSubview(icon)
        wrapper.addSubview(label)
        self.addSubview(wrapper)
    }
    
    func setupContraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.greaterThanOrEqualTo(wrapper)
        }
        
        wrapper.snp.makeConstraints{ make in
            make.height.equalTo(15)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }
    
        icon.snp.makeConstraints{ make in
            make.width.equalTo(15)
            make.height.equalTo(15)
        }
        
        label.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(20)
            make.trailing.equalTo(-5)
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
