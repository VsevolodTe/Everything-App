//
//  TableViewController.swift
//  Everything App
//
//  Created by Гость on 13/04/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        models = [
            Model(title: "Барабан маленький", detail: "Маленький барабан будет отличным подарком вашим знакомым, отлично украсит ваш офис или квартиру. Имеет красивую роспись, с нанесением этнического орнамента. Изготовлен барабан из бамбука и кожи настоящей обезьяны. Материал: бамбук, кожа обезьяны", image: UIImage(named: "baraban-malenkiy-reznoy_enl-1"))
        ]
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height / 8
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubtitleCellIdentifier")!
        let model = models[indexPath.row]
        
        configure(cell, with: model)
        
        return cell
    }
    
    func configure(_ cell: UITableViewCell, with model: Model) {
        cell.textLabel?.text = model.title
        cell.detailTextLabel?.text = model.detail
        cell.imageView?.image = model.image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ViewSegue" else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let model = models[indexPath.row]
        
        let controller = segue.destination as! ViewController
        controller.model = model
    }
    
}
