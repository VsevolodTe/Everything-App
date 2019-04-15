//
//  ViewController.swift
//  Everything App
//
//  Created by Гость on 13/04/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var model: Model!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateStackView(to: view.bounds.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateStackView(to: size)
    }
    
    func updateStackView(to size: CGSize) {
        let isHorizontal = size.height < size.width
        topStackView.axis = isHorizontal ? .horizontal : .vertical
    }
    
    func updateUI() {
        imageView.image = model.image
        titleLabel.text = model.title
        detailLabel.text = model.detail
    }
}
