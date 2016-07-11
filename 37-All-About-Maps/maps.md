

```swift
let location = CLLocationCoordinate2D(
  latitude: 36.169941,
  longitude: -115.139830
)

let span = MKCoordinateSpanMake(0.05, 0.05)
let region = MKCoordinateRegion(center: location, span: span)

mapView.setRegion(region, animated: true)

let annotation = MKPointAnnotation()
annotation.coordinate = location
annotation.title = "Las Vegas"
annotation.subtitle = "Nevada"

mapView.addAnnotation(annotation)
```
