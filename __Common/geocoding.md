func geocoding(location: String, completion: (Double, Double) -> ()) {
    CLGeocoder().geocodeAddressString(location) {

        (placemarks, error) in

        if placemarks?.count > 0 {
            let placemark = placemarks?[0]
            let location = placemark!.location
            let coordinate = location?.coordinate
            completion((coordinate?.latitude)!, (coordinate?.longitude)!)
        }
    }
}
