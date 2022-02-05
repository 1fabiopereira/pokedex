//
//  LoadingViewController.swift
//  Pokedex
//
//  Created by Fabio Pereira on 29/01/22.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {

     init() {
        super.init(nibName: nil, bundle: nil)
        self.view = HomeView()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.navigationController?.hidesBarsOnSwipe = true
    }
}
