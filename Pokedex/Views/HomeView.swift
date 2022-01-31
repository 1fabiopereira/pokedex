//
//  LoadingView.swift
//  Pokedex
//
//  Created by Fabio Pereira on 29/01/22.
//

import UIKit
import SnapKit

final class HomeView: UIView, ViewCodeConfiguration {
    private lazy var badgeFighting: Badge = {
        return Badge(type: .Fighting)
    }()
    
    private lazy var badgeDark: Badge = {
        return Badge(type: .Dark)
    }()
    
    private lazy var badgeDragon: Badge = {
        return Badge(type: .Dragon)
    }()
    
    private lazy var badgeElectric: Badge = {
        return Badge(type: .Electric)
    }()
    
    private lazy var badgeGrass: Badge = {
        return Badge(type: .Grass)
    }()
    
    private lazy var badgePoison: Badge = {
        return Badge(type: .Poison)
    }()
    
    private lazy var badgePsychic: Badge = {
        return Badge(type: .Psychic)
    }()
    
    private lazy var iconPsychic: Icon = {
        return Icon(type: .Psychic)
    }()
    
    private lazy var iconGrass: Icon = {
        return Icon(type: .Grass)
    }()
    
    private lazy var iconFire: Icon = {
        return Icon(type: .Normal, shape: .Square)
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCodeConfiguration Protocol implementation

extension HomeView {
    func buildHierarchy() {
        self.addSubview(badgeFighting)
        self.addSubview(badgeDark)
        self.addSubview(badgeDragon)
        self.addSubview(badgeElectric)
        self.addSubview(badgeGrass)
        self.addSubview(badgePoison)
        self.addSubview(badgePsychic)
        self.addSubview(iconPsychic)
        self.addSubview(iconGrass)
        self.addSubview(iconFire)
    }
    
    func setupContraints() {
        badgeFighting.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        badgePsychic.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(badgeFighting).multipliedBy(0.9)
        }
        
        badgeDark.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(badgeFighting).multipliedBy(0.8)
        }
        
        badgeDragon.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(badgeFighting).multipliedBy(0.7)
        }
        
        badgeElectric.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(badgeFighting).multipliedBy(0.6)
        }
        
        badgeGrass.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(badgeFighting).multipliedBy(0.5)
        }
        
        badgePoison.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(badgeFighting).multipliedBy(0.4)
        }
        
        iconPsychic.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(badgeFighting).multipliedBy(1.2)
        }

        iconGrass.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(badgeFighting).multipliedBy(1.4)
        }

        iconFire.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(badgeFighting).multipliedBy(1.6)
        }
    }
    
    func configureViews() {
        // Nothing to implement
    }
}
