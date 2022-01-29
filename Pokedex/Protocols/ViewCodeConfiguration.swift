//
//  ViewCodeConfiguration.swift
//  Pokedex
//
//  Created by Fabio Pereira on 29/01/22.
//

protocol ViewCodeConfiguration {
    func buildHierarchy()
    func setupContraints()
    func configureViews()
}

extension ViewCodeConfiguration {
    func applyViewCode() {
        buildHierarchy()
        setupContraints()
        configureViews()
    }
}
