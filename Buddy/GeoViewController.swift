//
//  GeoViewController.swift
//  Buddy
//
//  Created by Priyanka on 11/27/16.
//  Copyright © 2016 Priyanka. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class GeoViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var location:CLLocation=CLLocation()
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderValue: UILabel!

    @IBOutlet weak var knn: UITextField!
    
    
    @IBOutlet weak var picker: UIPickerView!
     var pickerData=["All","Chinese","Coffee", "Indian","Italian", "Mexican"]
    var selectedPickerData="Coffee"
    //fencing related declarations
    // Array of annotations - modified when the points are changed.
    var annotations = [MKPointAnnotation]()
    // Current polygon displayed in the overlay.
    var polygon: MKPolygon?
    
    var radius = 500

    var prefsEmail:String="";
    var prefsName:String="";
    //webservice declarations
    var urll = "http://localhost:3000";
    let para:NSMutableDictionary = NSMutableDictionary();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prefsEmail=UserDefaults.standard.value(forKey: "prefsEmail")! as! String
        prefsName=UserDefaults.standard.value(forKey: "prefsName")! as! String
        //print("GEO VIEW CONTROLLER**********\(prefsName)***************")
        
        // Do any additional setup after loading the view.
        //SideBar related
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        self.picker.delegate=self
        self.picker.dataSource=self
        self.mapView.delegate = self
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
        
        location=locationManager.location!
        let location_coordinate=location.coordinate
        
        let span = MKCoordinateSpanMake(0.04, 0.04)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location_coordinate.latitude,longitude: location_coordinate.longitude), span: span)
        self.mapView.setRegion(region, animated: true)
        
        drawCircle(location:location,radius: radius)
        addLongPressGesture()

        

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
    
    
    func drawCircle(location:CLLocation,radius: Int){
        
        let location_coordinate=location.coordinate
        
        //let span = MKCoordinateSpanMake(0.05, 0.05)
        //let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location_coordinate.latitude,longitude: location_coordinate.longitude), span: span)
        //self.mapView.setRegion(region, animated: false)
        
        self.mapView.removeOverlays(self.mapView.overlays)
        self.addRadiusCircle(location: location,radius: Double(radius))
        
        //adding the webservice for range query
        para.setValue(location_coordinate.latitude, forKey: "latitude");
        para.setValue(location_coordinate.longitude, forKey: "longitude");
        para.setValue("Coffee", forKey: "cuisine");
        para.setValue(radius, forKey: "radius");
        
        let jsonData = try! JSONSerialization.data(withJSONObject: para, options: JSONSerialization.WritingOptions());
        let request:NSMutableURLRequest=NSMutableURLRequest();
        let session = URLSession.shared
        let url = urll+"/range";
        request.url=NSURL(string:url) as URL?
        request.httpMethod = "POST";
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
        request.httpBody = jsonData;
        print("Sending",request)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    if let response :NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? NSDictionary
                    {
                        let resResult : [Dictionary<String, AnyObject>] = response["result"] as! [Dictionary<String, AnyObject>];
                        if(resResult.isEmpty)
                        {
                            DispatchQueue.main.async(execute: {
                                self.knn.text = "Sorry no data Found.";
                            })
                        }
                        else{
                            print(resResult.count)
                            for anItem in resResult {
                                // print(anItem)
                                
                                var latitude:Float=0
                                var longitude:Float=0
                                var name:String=""
                                
                                if let x = anItem["latitude"] as? String {
                                    latitude=Float(x)!
                                }
                                
                                if let y = anItem["longitude"] as? String {
                                    longitude=Float(y)!
                                }
                                
                                if let z=anItem["name"] as? String{
                                    name=String(z)
                                    //print(name)
                                }
                                
                                //Adding annotation
                                let location = CLLocationCoordinate2DMake(CLLocationDegrees(latitude),CLLocationDegrees(longitude));
                                let dropPin = MKPointAnnotation();
                                dropPin.coordinate = location;
                                dropPin.title = name;
                                
                                self.mapView.addAnnotation(dropPin)
                            }
                        }
                    }//do
                } catch {
                    print("error in JSONSerialization")
                }
            }
        })
        task.resume()
    }

    func addRadiusCircle(location: CLLocation, radius: Double){
        // self.mapView.delegate = self
        let circle = MKCircle(center: location.coordinate, radius:CLLocationDistance(radius))
        mapView.add(circle)
    }
    
    //MapView Delegate methods
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay.isKind(of: MKCircle.self){
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.fillColor = UIColor.red.withAlphaComponent(0.1)
            circleRenderer.strokeColor = UIColor.blue
            circleRenderer.lineWidth = 2
            return circleRenderer
        }
        // return MKOverlayRenderer(overlay: overlay)
        
        if overlay is MKPolygon {
            let polygonView = MKPolygonRenderer(overlay: overlay)
            polygonView.fillColor = UIColor.red.withAlphaComponent(0.1)
            polygonView.strokeColor = UIColor.black
            polygonView.lineWidth = 1
            return polygonView
        }
        return MKOverlayRenderer(overlay: overlay)
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //For myLocation do nothing
        if annotation is MKUserLocation { return nil }
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            pinView?.isDraggable = true
            pinView?.calloutOffset = CGPoint(x: -5, y: 5)
            
            
            let deleteButton = UIButton()
            deleteButton.frame.size.width = 44
            deleteButton.frame.size.height = 44
            deleteButton.backgroundColor = UIColor.red
            deleteButton.setImage(UIImage(named: "next"), for: .normal)
            
            pinView?.leftCalloutAccessoryView = deleteButton
            
        }
        else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.leftCalloutAccessoryView {
            performSegue(withIdentifier: "buddiesGoingSegue", sender: view)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "buddiesGoingSegue" )
        {
            let next = segue.destination as! UINavigationController
            let nextController = next.topViewController as! BuddiesGoingTableViewController
            
            let restaurant:String=(sender as! MKAnnotationView).annotation!.title!!
            nextController.restaurant=restaurant
            let selectedValue = selectedPickerData
            nextController.cuisine=selectedValue
            
            nextController.prefsEmail = prefsEmail
            
            let latitude:Double=(sender as! MKAnnotationView).annotation!.coordinate.latitude
            nextController.restaurantLatitude=latitude
            let longitude:Double=(sender as! MKAnnotationView).annotation!.coordinate.longitude
            nextController.restaurantLongitude=longitude
            
           // let location_coordinate=location.coordinate
            //nextController.userLatitude=location_coordinate.latitude
            //nextController.userLongitude=location_coordinate.longitude
            
            
        }
    }
    
    
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        radius = Int(sender.value)
        sliderValue.text = "\(radius) m"
        print ("Priyanka\(radius)")
        
        //CALL TO WEB SERVICE FOR RANGE
        
        //Remove annotations
        mapView.removeAnnotations(mapView.annotations)
        annotations=[]
        
        
        drawCircle(location: location,radius: radius)
    }
    
    
    //Fencing Related Functions
    func addLongPressGesture() {
        let longPressRecogniser = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPressRecogniser.minimumPressDuration = 0.25
        mapView.addGestureRecognizer(longPressRecogniser)
    }
    
    func handleLongPress(gestureRecognizer: UIGestureRecognizer) {
        
        guard gestureRecognizer.state == .began else {
            return
        }
        
        let touchPoint = gestureRecognizer.location(in: self.mapView)
        let touchMapCoordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        
        let annotation = MKPointAnnotation()
        
        // The annotation must have a title in order for it to be selectable.
        annotation.title = "Point \(annotations.count)"
        annotation.coordinate = touchMapCoordinate
        mapView.addAnnotation(annotation)
        
        // Add the new annotation to the list.
        annotations.append(annotation)
        
        // Redraw the overlay.
        updateOverlay()
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        // The map view retains a reference to the same annotations in the array.
        // The annotation in the array is automatically updated when the pin is moved.
        updateOverlay()
    }
    
    func updateOverlay() {
        // Remove existing overlay.
        if let polygon = self.polygon {
            mapView.remove(polygon)
        }
        
        self.polygon = nil
        
        if annotations.count < 3 {
            print("Not enough coordinates")
            return
        }
        
        
        
        // Create coordinates for new overlay.
        let coordinates = annotations.map({ $0.coordinate })
        
        // Sort the coordinates to create a path surrounding the points.
        // Remove this if you only want to draw lines between the points.
        let hull = sortConvex(input: coordinates)
        //  let hull=coordinates
        var polyCoordinates=[Float]() //Array to hold longitude, latitude of the fence
        
        
        
        //Web services to the fence
        
        // polyCoordinates=[-118.278481, 34.0274086, -118.287064, 34.0260391, -118.280716, 34.0159569, -118.278481, 34.0274086]
        //adding the webservice for range query
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
        self.mapView.removeOverlays(self.mapView.overlays)
        
        
        for i in hull{
            //Adding annotation
            let loc = CLLocationCoordinate2DMake(CLLocationDegrees(i.latitude),CLLocationDegrees(i.longitude));
            let dropPin = MKPointAnnotation();
            dropPin.coordinate = loc;
            
            self.mapView.addAnnotation(dropPin)
            
            polyCoordinates.append(Float(i.longitude))
            polyCoordinates.append(Float(i.latitude))
        }
        print(polyCoordinates)
        
        let polygon = MKPolygon(coordinates: hull, count: hull.count)
        mapView.add(polygon)
        
        self.polygon = polygon
        
        para.setValue("Coffee", forKey: "cuisine");
        //para.setValue(radius, forKey: "radius");
        para.setValue(polyCoordinates, forKey: "polyCoordinates");
        
        let jsonData = try! JSONSerialization.data(withJSONObject: para, options: JSONSerialization.WritingOptions());
        let request:NSMutableURLRequest=NSMutableURLRequest();
        let session = URLSession.shared
        let url = urll+"/fence";
        request.url=NSURL(string:url) as URL?
        request.httpMethod = "POST";
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
        request.httpBody = jsonData;
        print("Sending",request)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    if let response :NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? NSDictionary
                    {
                        let resResult : [Dictionary<String, AnyObject>] = response["result"] as! [Dictionary<String, AnyObject>];
                        if(resResult.isEmpty)
                        {
                            DispatchQueue.main.async(execute: {
                                self.knn.text = "Sorry no data Found.";
                            })
                        }
                        else{
                            print(resResult.count)
                            for anItem in resResult {
                                // print(anItem)
                                
                                var latitude:Float=0
                                var longitude:Float=0
                                var name:String=""
                                
                                if let x = anItem["latitude"] as? String {
                                    latitude=Float(x)!
                                }
                                
                                if let y = anItem["longitude"] as? String {
                                    longitude=Float(y)!
                                }
                                
                                if let z=anItem["name"] as? String{
                                    name=String(z)
                                    print(name)
                                }
                                
                                //Adding annotation
                                let location = CLLocationCoordinate2DMake(CLLocationDegrees(latitude),CLLocationDegrees(longitude));
                                let dropPin = MKPointAnnotation();
                                dropPin.coordinate = location;
                                dropPin.title = name;
                               
                                
                                
                                self.mapView.addAnnotation(dropPin)
                            }
                        }
                    }//do
                } catch {
                    print("error in JSONSerialization")
                }
            }
        })
        task.resume()
        
        
        
    }
    
    func sortConvex(input: [CLLocationCoordinate2D]) -> [CLLocationCoordinate2D] {
        // X = longitude
        // Y = latitude
        
        // 2D cross product of OA and OB vectors, i.e. z-component of their 3D cross product.
        // Returns a positive value, if OAB makes a counter-clockwise turn,
        // negative for clockwise turn, and zero if the points are collinear.
        func cross(P: CLLocationCoordinate2D, _ A: CLLocationCoordinate2D, _ B: CLLocationCoordinate2D) -> Double {
            let part1 = (A.longitude - P.longitude) * (B.latitude - P.latitude)
            let part2 = (A.latitude - P.latitude) * (B.longitude - P.longitude)
            return part1 - part2;
        }
        
        // Sort points lexicographically
        let points = input.sorted() {
            $0.longitude == $1.longitude ? $0.latitude < $1.latitude : $0.longitude < $1.longitude
        }
        
        // Build the lower hull
        var lower: [CLLocationCoordinate2D] = []
        for p in points {
            while lower.count >= 2 && cross(P: p, lower[lower.count-2], lower[lower.count-1]) <= 0 {
                lower.removeLast()
            }
            lower.append(p)
        }
        
        // Build upper hull
        var upper: [CLLocationCoordinate2D] = []
        for p in points.reversed() {
            while upper.count >= 2 && cross(P: p, upper[upper.count-2], upper[upper.count-1]) <= 0 {
                upper.removeLast()
            }
            upper.append(p)
        }
        
        // Last point of upper list is omitted because it is repeated at the
        // beginning of the lower list.
        upper.removeLast()
        
        // Concatenation of the lower and upper hulls gives the convex hull.
        return (upper + lower)
    }
    
    //Knn related
    
    @IBAction func knnChanged(_ sender: UITextField) {
        //print("Priyanka 1 \(knn.text)")
        
        let k:Int = Int(self.knn.text!)!
        if(k != 0){
            plotKnn(location:location,k:k)}
    }
    
    
    func plotKnn(location:CLLocation,k:Int){
        //CALL TO WEB SERVICE FOR KNN
        //adding the webservice for range query
        let location_coordinate=location.coordinate
        
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
        self.mapView.removeOverlays(self.mapView.overlays)
        
        
        para.setValue(location_coordinate.latitude, forKey: "latitude");
        para.setValue(location_coordinate.longitude, forKey: "longitude");
        para.setValue("Coffee", forKey: "cuisine");
        para.setValue(radius, forKey: "radius");
        para.setValue(k, forKey: "knn");
        
        let jsonData = try! JSONSerialization.data(withJSONObject: para, options: JSONSerialization.WritingOptions());
        let request:NSMutableURLRequest=NSMutableURLRequest();
        let session = URLSession.shared
        let url = urll+"/knn";
        request.url=NSURL(string:url) as URL?
        request.httpMethod = "POST";
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
        request.httpBody = jsonData;
        print("Sending",request)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    if let response :NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? NSDictionary
                    {
                        let resResult : [Dictionary<String, AnyObject>] = response["result"] as! [Dictionary<String, AnyObject>];
                        if(resResult.isEmpty)
                        {
                            DispatchQueue.main.async(execute: {
                                self.knn.text = "Sorry no data Found.";
                            })
                        }
                        else{
                            print(resResult.count)
                            for anItem in resResult {
                                // print(anItem)
                                
                                var latitude:Float=0
                                var longitude:Float=0
                                var name:String=""
                                
                                if let x = anItem["latitude"] as? String {
                                    latitude=Float(x)!
                                }
                                
                                if let y = anItem["longitude"] as? String {
                                    longitude=Float(y)!
                                }
                                
                                if let z=anItem["name"] as? String{
                                    name=String(z)
                                    //print(name)
                                }
                                
                                //Adding annotation
                                let location = CLLocationCoordinate2DMake(CLLocationDegrees(latitude),CLLocationDegrees(longitude));
                                let dropPin = MKPointAnnotation();
                                dropPin.coordinate = location;
                                dropPin.title = name;
                                //dropPin.image=
                                
                                self.mapView.addAnnotation(dropPin)
                            }
                        }
                    }//do
                } catch {
                    print("error in JSONSerialization")
                }
            }
        })
        task.resume()
        
    }
    
    
    

    
    
    //Picker Related functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPickerData=pickerData[row]
        print(pickerData[row])
    }
    


}
