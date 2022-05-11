//
//  FavoriteViewController.swift
//  a862805181fc4fe9e9a7d51a9b92b170
//
//  Created by furkan on 11.05.2022.
//

import Foundation
import UIKit

class FavoriteViewController: UIViewController {
    
    var favStation = [FavStation]()

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(StationViewCell.self, forCellReuseIdentifier: StationViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Favoriler"
        
        //view.backgroundColor = .systemYellow
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        StationCoreData.shared.getCardInfo { [weak self] result in
            switch result {
            case.success(let fav):
                self?.favStation = fav
                self?.tableView.reloadData()
            case.failure(let error):
                print("Fav get Error: \(error)")
            }
        }
    }
    
}

extension FavoriteViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StationViewCell.identifier, for: indexPath) as? StationViewCell else {
            return UITableViewCell()
        }
        
        // add border and color
        cell.backgroundColor = .systemBackground
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        cell.name.text = favStation[indexPath.row].name
        cell.EUS.text = String(favStation[indexPath.row].eus)
    
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favStation.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return 5
     }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    //MARK: - Delete side
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let name = favStation[indexPath.row].name!
        
        if editingStyle == .delete {
            StationCoreData.shared.deleteCardInfo(name: favStation[indexPath.row].name!) { result in
                switch result {
                case.success(()):
                    print("Deleted favorite")
                    
                    for i in 0..<MockyStations.stations!.count {
                        if MockyStations.stations![i].name == name {
                            MockyStations.stations![i].favorite = false
                        }
                    }
                case.failure(let error):
                    print("Failed delete: \(error)")
                }
            }
            favStation.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}
