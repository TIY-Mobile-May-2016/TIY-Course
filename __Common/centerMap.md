/// CenterMap Helper Function
    func centerMap(centerCoordinate: CLLocationCoordinate2D) {

        // 1. Create an CoordinateSpan
        let span = MKCoordinateSpan(
            latitudeDelta: 0.1,
            longitudeDelta: 0.1
        )

        // 2. Create the Region

        let region = MKCoordinateRegion(
            center: centerCoordinate,
            span: span
        )

        // 3. Add
        self.mapView.setRegion(region, animated: true)

    }
