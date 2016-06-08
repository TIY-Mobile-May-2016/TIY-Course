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
    
    [self startUpdatingLocation];

}

// Initializaed the LocationManager and requests authorization
-(void)startUpdatingLocation {
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
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
    
    [self centerMapWithCoordiate:coord];
    
}

#pragma mark - Helper Methods

-(void)centerMapWithCoordiate:(CLLocationCoordinate2D)center {
    // REGION CODE TO CENTER ON MAP
    MKCoordinateRegion region = MKCoordinateRegionMake(center, MKCoordinateSpanMake(0.60, 0.60));

    [self.mapView setRegion:region animated:YES];
    [self.mapView setShowsUserLocation:YES];
}


@end
