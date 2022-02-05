//
//  LoadingView.swift
//  Pokedex
//
//  Created by Fabio Pereira on 29/01/22.
//

import UIKit
import SnapKit

final class HomeView: UIView, ViewCodeConfiguration {
    
    lazy var scroll: UIScrollView = {
        return UIScrollView(frame: .zero)
    }()
    
    private lazy var wrapper: UIStackView = {
        return UIStackView(frame: .zero)
    }()
    
    private lazy var pokemon1: Card = {
        return Card(number: "#001", name: "Bulbasaur", types: [.Grass, .Poison], image: "1.png")
    }()
    
    private lazy var pokemon2: Card = {
        return Card(number: "#002", name: "Ivysaur", types: [.Grass, .Poison], image: "2.png")
    }()
    
    private lazy var pokemon3: Card = {
        return Card(number: "#003", name: "Venusaur", types: [.Grass, .Poison], image: "3.png")
    }()
    
    private lazy var pokemon4: Card = {
        return Card(number: "#004", name: "Charmander", types: [.Fire], image: "4.png")
    }()
    
    private lazy var pokemon7: Card = {
        return Card(number: "#007", name: "Squirtle", types: [.Water], image: "7.png")
    }()
    
    private lazy var pokemon16: Card = {
        return Card(number: "#016", name: "Pidgey", types: [.Normal, .Flying], image: "16.png")
    }()
    
    private lazy var pokemon10: Card = {
        return Card(number: "#010", name: "Caterpie", types: [.Bug], image: "10.png")
    }()
    
    private lazy var pokemon41: Card = {
        return Card(number: "#041", name: "Zubat", types: [.Poison, .Flying], image: "41.png")
    }()
    
    private lazy var pokemon54: Card = {
        return Card(number: "#054", name: "Psyduck", types: [.Water], image: "54.png")
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
        wrapper.addArrangedSubview(pokemon1)
        wrapper.addArrangedSubview(pokemon4)
        wrapper.addArrangedSubview(pokemon7)
        wrapper.addArrangedSubview(pokemon10)
        wrapper.addArrangedSubview(pokemon16)
        wrapper.addArrangedSubview(pokemon41)
        wrapper.addArrangedSubview(pokemon54)
        
        scroll.addSubview(wrapper)
        
        self.addSubview(scroll)
    }
    
    func setupContraints() {
        scroll.snp.makeConstraints { make in
            make.width.greaterThanOrEqualToSuperview()
            make.height.greaterThanOrEqualToSuperview()
            
            if #available(iOS 11, *) {
                make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin)
            }
        }
        
        wrapper.snp.makeConstraints{ make in
            make.edges.greaterThanOrEqualToSuperview()
            make.width.greaterThanOrEqualToSuperview()
        }
    }
    
    func configureViews() {
        wrapper.axis = .vertical
        wrapper.spacing = 30
    }
}
