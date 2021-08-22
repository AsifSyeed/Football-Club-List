//
//  ViewController.swift
//  test_section
//
//  Created by BS-236 on 16/8/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var sectionTableView: UITableView!
    
    var clubsModel = [Clubs]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionTableView.delegate = self
        sectionTableView.dataSource = self
        
        initTableData()
        
        sectionTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return clubsModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubsModel[section].clubsName?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = clubsModel[indexPath.section].clubsName?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return clubsModel[section].country
    }
    
    
    func initTableData() {
        clubsModel.append(Clubs.init(country: "Spain", clubsName: ["Real Madrid", "Barcelona", "Atletico Madrid", "Sevilla"]))
        clubsModel.append(Clubs.init(country: "England", clubsName: ["Man Utd", "Man City", "Chelsea", "Arsenal"]))
        clubsModel.append(Clubs.init(country: "Italy", clubsName: ["AC Milan", "Inter Milan", "Juventus", "Roma"]))
        clubsModel.append(Clubs.init(country: "France", clubsName: ["PSG", "Lille", "Olympic Lio", "Monaco"]))
    }
}

