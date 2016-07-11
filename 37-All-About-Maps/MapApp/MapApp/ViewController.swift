//
//  ViewController.swift
//  MapApp
//
//  Created by Phil Wright on 7/11/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//


// 1. Add MapKit and CoreLocation Frameworks

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addPin(40.730459, longitude: -111.551152, titleString: "The Adoption Center", subtitleString: "6699 N Landmark Dr")
        
//        self.addPin(40.732895, longitude: -111.383897, titleString: "Rescue Ranch", subtitleString: "6466 N Highview Road")
        
        let latitude = (40.732895 + 40.730459) / 2
        
        let longitude = (-111.551152 + -111.383897) / 2
        
        
        self.addCustomPin()
        
        let location = CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
        
        self.centerMap(location)
        

    }
    
    func addCustomPin() {
        
        let location = CLLocationCoordinate2D(
            latitude: 40.732895,
            longitude: -111.383897
        )
        
        let customAnnotation = CustomMKPointAnnotation()
        
        customAnnotation.coordinate = location
        customAnnotation.title = "My Cool Place"
        customAnnotation.subtitle = "PokeMon Go Rocks!"
        
        self.mapView.addAnnotation(customAnnotation)
        
    }
    
    func addPin(latitude: Double, longitude: Double, titleString: String, subtitleString: String) {
        
        // 2. Create a CLLocationCoordinate2D
        
        let location = CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
        
        // 3. Create an instance of MKPointAnnotation
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = titleString
        annotation.subtitle = subtitleString
        
        // 4. Add to the annotation to the mapView
        self.mapView.addAnnotation(annotation)
    }
    
    /// CenterMap Helper Function
    func centerMap(centerCoordinate: CLLocationCoordinate2D) {
        
        // 1. Create an CoordinateSpan
        let span = MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5
        )
        
        // 2. Create the Region
        
        let region = MKCoordinateRegion(
            center: centerCoordinate,
            span: span
        )
        
        // 3. Add
        self.mapView.setRegion(region, animated: true)
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        // Check to see if the annoation is standard or our CustomMKPointAnnotition
        
        if annotation.isKindOfClass(CustomMKPointAnnotation) {
            
            print("Got a custom MKPointAnnotation!")
            
            // 1. Create identifier
            let identifier = "MapPin"
            
            let annotationView = MKAnnotationView(
                annotation: annotation,
                reuseIdentifier: identifier
            )
            
            annotationView.canShowCallout = true
            
            let imageView = UIImageView(frame: CGRectMake(0,0,44,44))
            imageView.image = UIImage(named: "map")
            
            // Add the image to the annotationView image
            annotationView.image = imageView.image
            
            return annotationView
        }
        
        return nil

    }

}

