//
//  ProsViewController.swift
//  HomeAdvisorChallenge
//
//  Created by Zach Vilardell on 8/12/17.
//  Copyright © 2017 zvilardell. All rights reserved.
//

import UIKit

class ProsViewController: UIViewController {
    
    @IBOutlet weak var prosTableView: UITableView!
    
    //data for all pros sorted alphabetically
    var searchedPros: [Pro] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configure navigation bar properties
        setupNavBar()
        
        //configure table view properties
        setupTableView()
        
        //populate table view appropriately
        loadSortedData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupNavBar() {
        //set page title
        navigationItem.title = "Pros"
        
        //configure search bar
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search Pros"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    func setupTableView() {
        //ensure that we only display populated cells
        prosTableView.tableFooterView = UIView(frame: CGRect.zero)
        
        //table view cells adjust height automatically when name label wraps
        prosTableView.estimatedRowHeight = 72
        prosTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func loadSortedData() {
        //sort pro data alphabetically, populate table with sorted data
        searchedPros = DataStore.sharedInstance.allSortedPros
        prosTableView.reloadData()
    }

}

extension ProsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedPros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProTableViewCell", for: indexPath) as! ProTableViewCell
        let pro = searchedPros[indexPath.row]
        
        //configure this cell with the appropriate pro's data
        cell.configure(pro: pro)
        
        return cell
    }
}

extension ProsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //clear row selection
        tableView.deselectRow(at: indexPath, animated: false)
        
        //present the DetailsViewController for the selected pro
        //(Note: I rarely use storyboard segues anymore as I find them to be too rigid/cumbersome in larger projects)
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsVC.pro = searchedPros[indexPath.row]
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension ProsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //filter displayed pros based on search bar text
        if let searchText = searchController.searchBar.text {
            if searchText == "" {
                loadSortedData()
            } else {
                searchedPros = DataStore.sharedInstance.allSortedPros.filter { pro in
                    pro.name.lowercased().contains(searchText.lowercased())
                }
                prosTableView.reloadData()
            }
        }
    }
}

