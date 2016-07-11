//
//  ViewController.swift
//  MapAnnotationApp
//
//  Created by Phil Wright on 7/10/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPin()
        //addCustomPin()
    }
 
    func addPin() {
        let location = CLLocationCoordinate2D(
            latitude: 36.169949,
            longitude: -115.13983
        )
        
        let annotation = MKPointAnnotation()
    
        annotation.coordinate = location
        annotation.title = "Las Vegas"
        annotation.subtitle = "Nevada"
        
        mapView.addAnnotation(annotation)
        
        centerMapOnLocation(location)
    }
    
    func addCustomPin() {
        let annotation = CustomPointAnnotation()
        
        let location = CLLocationCoordinate2D(
            latitude: 36.1699,
            longitude: -115.139830
        )
        
        annotation.coordinate = location
        annotation.imageName = "map"
        annotation.title = "Las Vegas"
        annotation.subtitle = "Nevada"
        
        mapView.addAnnotation(annotation)
        
    }
    
    func centerMapOnLocation(location: CLLocationCoordinate2D) {
        
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation:MKAnnotation) -> MKAnnotationView?
    {
        if annotation.isKindOfClass(CustomPointAnnotation) {
    
            // 1. Create identifier
            let identifier = "MapPin"
            
            let annotationView = MKAnnotationView(annotation: annotation,reuseIdentifier: identifier)
            
            annotationView.canShowCallout = true
                
            let imageView = UIImageView(frame: CGRectMake(0,0,44,44))
            imageView.image = UIImage(named: "map")
            annotationView.image = imageView.image
            
            return annotationView
        }

        return nil
    }

}

