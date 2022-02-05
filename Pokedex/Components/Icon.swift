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

final class Icon: UIControl, ViewCodeConfiguration {
    
    weak var delegate: ClickableDelegate?
    
    var type: PokemonType? {
        didSet { configureViews() }
    }
    
    var shape: Shape? {
        didSet { configureViews() }
    }
    
    override var isSelected: Bool {
        didSet { configureViews() }
    }
    
    private lazy var icon: UIImageView = {
        return UIImageView(frame: .zero)
    }()
    
    init(type: PokemonType, selected: Bool = true) {
        super.init(frame: .zero)
        self.type = type
        self.isSelected = selected
        self.applyViewCode()
        self.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    
    init(type: PokemonType, shape: Shape) {
        super.init(frame: .zero)
        self.type = type
        self.shape = shape
        self.isSelected = true
        self.applyViewCode()
        self.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onClick() -> Void {
        self.pressed()
        self.isSelected = !self.isSelected
        
        if delegate?.onClick != nil {
            delegate!.onClick(type: self.type)
        }
    }
    
    private func pressed() -> Void {
        let presssed = 0.5
        let normal = 1.0
        
        self.alpha = presssed
        self.icon.alpha = presssed
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.alpha = normal
            self.icon.alpha = normal
        })
    }
}

// MARK: - ViewCodeConfiguration Protocol implementation

extension Icon {
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
            self.backgroundColor = .none
            icon.image = UIImage(named: t.rawValue, in: Bundle.main, with: nil)
            icon.tintColor = Colors.getColor(type: t)
            
            if (self.isSelected) {
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
