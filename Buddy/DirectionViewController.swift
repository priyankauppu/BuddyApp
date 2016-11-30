//
//  DirectionViewController.swift
//  Buddy
//
//  Created by Priyanka on 11/27/16.
//  Copyright © 2016 Priyanka. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DirectionViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate  {
    
    @IBOutlet weak var mapView: MKMapView!

    //var userLatitude:Double=0.0
    //var userLongitude:Double=0.0
    
    var restaurantLatitude:Double=0.0
    var restaurantLongitude:Double=0.0
    var prefsEmail:String="";
    var displayMessage:String=""
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var message: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        prefsEmail=UserDefaults.standard.value(forKey: "prefsEmail")! as! String
        //print("Direction View Controller**********\(prefsEmail)********\(displayMessage) \(message)*******")
        
        message.text=displayMessage
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
        
        let location:CLLocation=locationManager.location!
        let location_coordinate=location.coordinate
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location_coordinate.latitude,longitude: location_coordinate.longitude), span: span)
        self.mapView.setRegion(region, animated: true)
        mapView.delegate = self
        
        let sourceLocation = CLLocationCoordinate2D(latitude: location_coordinate.latitude, longitude: location_coordinate.longitude)
        let destinationLocation = CLLocationCoordinate2D(latitude: restaurantLatitude, longitude: restaurantLongitude)
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        
        // 4.
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let dropPin = MKPointAnnotation();
        dropPin.coordinate = destinationLocation;
        self.mapView.addAnnotation(dropPin)
        
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .walking
        
        // Calculate the direction
        let directions = MKDirections(request: directionRequest)
        
        
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            
            let route = response.routes[0]
            self.mapView.add((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineWidth = 4.0
        
        return renderer
    }


}
