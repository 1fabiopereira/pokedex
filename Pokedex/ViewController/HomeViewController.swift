//
//  LoadingViewController.swift
//  Pokedex
//
//  Created by Fabio Pereira on 29/01/22.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    private let customView: HomeView
    
     init() {
        self.customView = HomeView()
        super.init(nibName: nil, bundle: nil)
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.customView
    }
}
