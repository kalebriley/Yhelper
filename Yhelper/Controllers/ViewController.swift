//
//  ViewController.swift
//  Yhelper
//
//  Created by Kaleb Riley on 8/1/20.
//  Copyright © 2020 tyko9. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dragIndicatorView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchResultsLabel: UILabel!
    
    var mainViewModel: MainViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.searchResultsLabel.text = "Search Results \(self.mainViewModel?.businesses.count ?? 0)"
                self.loadAnnotations()
                self.tableView.reloadData()
            }
            
        }
    }
    
    let locationManager = CLLocationManager()
    var location: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BusinessTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        style()
        setupLocation()
    
    }
    
    func style() {
        dragIndicatorView.layer.cornerRadius = 4
        containerView.layer.cornerRadius = 4
    }
    
    func setupLocation() {
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func requestData() {
        guard let location = location else { return }
        Network.shared.request(target: BusinessTarget.search(term: nil, long: String(location.coordinate.longitude), lat: String(location.coordinate.latitude))) { (result: Result<BusinessResponse, Error>) in
            switch result {
            case .success(let businesses):
                self.mainViewModel = MainViewModel(response: businesses)
            case .failure(_):
                print("failure")
                
            }
        }
    }
    
    func loadAnnotations() {
        guard let businesses = mainViewModel?.businesses else { return }
        for business in businesses {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: business.coordinate.latitude, longitude: business.coordinate.longitude)
            map.addAnnotation(annotation)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel?.businesses.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let business = mainViewModel?.businesses[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BusinessTableViewCell
        cell.configure(business: business)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        self.location = location

        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        self.map.setRegion(region, animated: true)
        
        requestData()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
}

