//
//  mabVC.swift
//  tourist
//
//  Created by Tsnim Alqahtani on 18/04/1443 AH.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
  var locationManager: CLLocationManager!
  lazy var mapVC: MKMapView = {
    let map = MKMapView()
    map.translatesAutoresizingMaskIntoConstraints = false
    map.delegate = self
    return map
      
      
  }()
    var locationManager1: CLLocationManager!
    lazy var mapVC1: MKMapView = {
      let map1 = MKMapView()
      map1.translatesAutoresizingMaskIntoConstraints = false
      map1.delegate = self
      return map1
    }()
    var locationManager2: CLLocationManager!
    lazy var mapVC2: MKMapView = {
      let map2 = MKMapView()
      map2.translatesAutoresizingMaskIntoConstraints = false
      map2.delegate = self
      return map2
    }()
    var locationManager3: CLLocationManager!
    lazy var mapVC3: MKMapView = {
      let map3 = MKMapView()
      map3.translatesAutoresizingMaskIntoConstraints = false
      map3.delegate = self
      return map3
    }()
  override func viewDidLoad() {
    super.viewDidLoad()
    if CLLocationManager.locationServicesEnabled(){
      locationManager = CLLocationManager()
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.requestAlwaysAuthorization()
      locationManager.startUpdatingLocation()
    }
      view.backgroundColor = .gray
      let image = UIImage(systemName: "globe")
      tabBarItem = .init(title: "Location", image: image, selectedImage: image)

    view.addSubview(mapVC)
      view.addSubview(mapVC1)
      view.addSubview(mapVC2)
      view.addSubview(mapVC3)

      
    NSLayoutConstraint.activate([
      mapVC.topAnchor.constraint(equalTo: view.topAnchor),
      mapVC.rightAnchor.constraint(equalTo: view.rightAnchor),
      mapVC.leftAnchor.constraint(equalTo: view.leftAnchor), mapVC.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
    
      
    let ts = MKPointAnnotation()
      ts.title = "High City"
      ts.coordinate = CLLocationCoordinate2D(latitude: 18.2181, longitude: 42.5055)
    mapVC.addAnnotation(ts)
      
  
    let ts1 = MKPointAnnotation()
    ts1.title = "Piano"
      ts1.coordinate = CLLocationCoordinate2D(latitude: 18.3181, longitude: 43.5055)
    mapVC.addAnnotation(ts1)
      
      
      let ts2 = MKPointAnnotation()
      ts2.title = "Fog Coffee"
        ts2.coordinate = CLLocationCoordinate2D(latitude: 18.2181, longitude: 44.5056)
      mapVC.addAnnotation(ts2)
      
      let ts3 = MKPointAnnotation()
      ts3.title = "Al sodah"
        ts3.coordinate = CLLocationCoordinate2D(latitude: 18.2181, longitude: 42.5056)
      mapVC.addAnnotation(ts3)
}
}
extension ViewController: MKMapViewDelegate, CLLocationManagerDelegate {
  func locationManager(_ manager:CLLocationManager, didUpdateLocations Locations:[CLLocation]) {
    guard let lastLocation = Locations.last else
    {return}
    let lat = lastLocation.coordinate.latitude
    let long = lastLocation.coordinate.longitude
  }
}


