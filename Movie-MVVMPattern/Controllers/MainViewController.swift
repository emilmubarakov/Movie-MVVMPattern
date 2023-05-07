//
//  ViewController.swift
//  Movie-MVVMPattern
//
//  Created by e.mubarakov on 01.05.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let tableView = UITableView()
    var viewModel: MainViewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .clear
        
        view.backgroundColor = .red
        self.title = "Main View"
        
        configureUI()
        getDataFromViewModel()
    }
    
    func configureUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    func getDataFromViewModel() {
        viewModel.getData()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.nymberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello"
        return cell
    }    
    
}
