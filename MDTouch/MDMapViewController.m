//
//  MDMapViewController.m
//  CheckYourPet
//
//  Created by Marco Dinacci on 17/03/2013.
//  Copyright (c) 2013 Oxbridge Animal Services. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "MDMapViewController.h"
#import "MDMapPoint.h"

@interface MDMapViewController ()

@property (strong, nonatomic) MKMapView *mapView;
@property (strong, nonatomic) NSMutableArray *mapPoints;

@end

@implementation MDMapViewController

- (id)initWithMapPoint:(MDMapPoint *)mapPoint
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.mapPoints = [NSMutableArray array];
        [self.mapPoints addObject:mapPoint];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect screenFrame = [[UIScreen mainScreen] applicationFrame];
    self.mapView = [[MKMapView alloc] initWithFrame:screenFrame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    [self setMapPoints:nil];
    [self setMapView:nil];
}

@end
