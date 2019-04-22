//
//  DetailViewController.swift
//  Everything App
//
//  Created by Гость on 13/04/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var editStackView: UIStackView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var viewStackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var model: Model!
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if !editing {
            model.title = nameField.text ?? ""
            model.detail = detailTextView.text 
        }
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateStackView(to: view.bounds.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateStackView(to: size)
    }
    
    func setupUI() {
        navigationItem.rightBarButtonItems = [navigationItem.rightBarButtonItem!, editButtonItem]
        if model == nil {
            model = Model(title: "", detail: "", image: nil)
            isEditing = true
        }
        updateUI()
    }
    
    func updateModel() {
        model.title = nameField.text ?? ""
        model.detail = detailTextView.text
        
    }
    
    func updateStackView(to size: CGSize) {
        let isHorizontal = size.height < size.width
        topStackView.axis = isHorizontal ? .horizontal : .vertical
    }
    
    func updateUI() {
        imageView.image = model.image
        if isEditing {
            editStackView.isHidden = false
            viewStackView.isHidden = true
            nameField.text = model.title
            detailTextView.text = model.detail
        } else {
            editStackView.isHidden = true
            viewStackView.isHidden = false
            titleLabel.text = model.title
            detailLabel.text = model.detail
        }
    }
    
    @IBAction func fieldChanged() {
        updateModel()
    }
}
