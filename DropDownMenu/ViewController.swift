//
//  ViewController.swift
//  DropDownMenu
//
//  Created by Youssef Bhl on 24/05/2022.
//

import UIKit
import DropDown

class ViewController: UIViewController {
    
    private let dropDownMenuView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemMint
        return view
    }()
    
    private let dropDownMenuLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "Select Item.."
        label.textColor = .black
        return label
    }()
    
    private let dropDownMenu = DropDown()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(dropDownMenuView)
        dropDownMenuView.addSubview(dropDownMenuLabel)
        setupDropMenu()
        setupConstraints()
        setupGesture()
    }
    
    private func setupDropMenu() {
        dropDownMenu.anchorView = dropDownMenuView
        dropDownMenu.direction = .bottom
        dropDownMenu.dataSource = ["item 1", "item 2", "item 3", "item 4", "item 5", "item 6", "item 7"]
        dropDownMenu.animationEntranceOptions = .beginFromCurrentState
        dropDownMenu.cornerRadius = 5
        dropDownMenu.animationduration = 0.5
        dropDownMenu.selectionAction = {[unowned self] (index: Int, item: String) in
            self.dropDownMenuLabel.text = item
        }
    }
    
    private func setupConstraints() {
        let constraints = [
            dropDownMenuView.widthAnchor.constraint(equalToConstant: 150),
            dropDownMenuView.heightAnchor.constraint(equalToConstant: 50),
            dropDownMenuView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dropDownMenuView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dropDownMenuLabel.centerXAnchor.constraint(equalTo: dropDownMenuView.centerXAnchor),
            dropDownMenuLabel.centerYAnchor.constraint(equalTo: dropDownMenuView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideDropMenu)))
        dropDownMenuView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showDropMenu)))
    }
    
    @objc private func hideDropMenu() {
        dropDownMenu.hide()
    }
    
    @objc private func showDropMenu() {
        dropDownMenu.show()
    }
    

}

