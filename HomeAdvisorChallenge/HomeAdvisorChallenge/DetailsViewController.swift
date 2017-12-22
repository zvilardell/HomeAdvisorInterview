//
//  DetailsViewController.swift
//  HomeAdvisorChallenge
//
//  Created by Zach Vilardell on 8/12/17.
//  Copyright © 2017 zvilardell. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var specialtyLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var servicesLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    
    //will be set from ProsViewController when a pro is selected from the list
    var pro: Pro!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //configure navigation bar properties
        setupNavBar()
        
        //configure detail labels
        setupDetails()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupNavBar() {
        //set page title
        navigationItem.title = "Details"
    }
    
    func setupDetails() {
        //configure detail labels with pro data
        nameLabel.text = pro.name
        specialtyLabel.text = pro.specialty
        ratingLabel.text = pro.ratingCount > 0 ? "Rating: \(pro.compositeRating) | \(pro.ratingCount) rating(s)" : "References Available"
        locationLabel.text = pro.location
        servicesLabel.text = pro.services != "" ? pro.services : "Services Not Available"
        overviewTextView.text = pro.overview
    }
    
    override func viewDidLayoutSubviews() {
        //ensure that the overview text view begins with content scrolled to top
        overviewTextView.setContentOffset(CGPoint.zero, animated: false)
    }

    @IBAction func callButtonTapped(_ sender: UIButton) {
        print("phone = \(pro.phone)")
    }
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
        print("email = \(pro.email)")
    }
    
}
