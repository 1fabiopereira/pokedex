//
//  Icon.swift
//  Pokedex
//
//  Created by Fabio Pereira on 29/01/22.
//

import UIKit
import SnapKit

enum Shape {
    case Square
    case Round
}

final class Icon: UIView, ViewCodeConfiguration {
    var type: PokemonType? {
        didSet { configureViews() }
    }
    
    var shape: Shape? {
        didSet { configureViews() }
    }
    
    var selected: Bool? {
        didSet { configureViews() }
    }
    
    private lazy var icon: UIImageView = {
        return UIImageView(frame: .zero)
    }()
    
    init(type: PokemonType, selected: Bool = true) {
        super.init(frame: .zero)
        self.type = type
        self.selected = selected
        self.applyViewCode()
    }
    
    init(type: PokemonType, shape: Shape) {
        super.init(frame: .zero)
        self.type = type
        self.shape = shape
        self.selected = true
        self.applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        self.addSubview(icon)
    }
    
    func setupContraints() {
        var size = 50.0
        
        if (self.shape == .Square) {
            size = 25.0
        }
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(size)
            make.width.equalTo(size)
        }
        
        icon.snp.makeConstraints{ make in
            make.height.equalTo(size / 2)
            make.width.equalTo(size / 2)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func configureViews() {
        if let t = self.type {
            icon.image = UIImage(named: t.rawValue, in: Bundle.main, with: nil)
            icon.tintColor = Colors.getColor(type: t)
            
            if (self.selected!) {
                var radius = 25.0
                
                if (self.shape == .Square) {
                    radius = 3.0
                }
                
                self.backgroundColor = Colors.getColor(type: t)
                self.layer.cornerRadius = radius
                
                icon.tintColor = .white
            }
        }
    }
}
