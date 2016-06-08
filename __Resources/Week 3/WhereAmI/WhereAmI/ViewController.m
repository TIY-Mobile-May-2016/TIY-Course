//
//  ViewController.m
//  WhereAmI
//
//  Created by Phil Wright on 6/8/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

// 1. Import MapKit + CoreLocation Frameworks

@import MapKit;
@import CoreLocation;

#import "ViewController.h"

@interface ViewController () <MKMapViewDelegate, CLLocationManagerDelegate>

// Step 2 outlet to mapView
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

// 3. Create an instance of the CLLocationManger

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 4. Initialize the location manager
    self.locationManager = [[CLLocationManager alloc] init];
    
    // 5. IMPORTANT set the delegate to the viewcontroller
    
    self.locationManager.delegate = self;
    
    // 6. Set the accuracy of the location manager
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    //[self.locationManager startUpdatingLocation];
    
    //[self.locationManager startMonitoringSignificantLocationChanges];
    
    [self.locationManager requestWhenInUseAuthorization];
    
}

#pragma mark - Delegate Methods

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    NSLog(@"Authorization changed");
    
    if (status != kCLAuthorizationStatusDenied) {
        [self.locationManager requestLocation];
    }
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"didFail");
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    NSLog(@"didUpdate");
    
    CLLocation *location = [locations firstObject];
    CLLocationCoordinate2D coord = location.coordinate;
    
    NSLog(@"latitude == %2.8f, longitude == %2.8f", coord.latitude, coord.longitude);


    // REGION CODE TO CENTER ON MAP
    MKCoordinateRegion region = MKCoordinateRegionMake(coord, MKCoordinateSpanMake(0.01, 0.01));
    
    [self.mapView setRegion:region animated:YES];
    [self.mapView setShowsUserLocation:YES];

}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
}

@end
