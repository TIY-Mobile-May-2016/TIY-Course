//
//  ViewController.m
//  CameraApp
//
//  Created by Phil Wright on 6/2/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "ViewController.h"

// 3. Add UIImagePickerDelegate and UINavigationControllerDelegate
@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

// 1. Add the imagepicker property
@property (strong, nonatomic) UIImagePickerController *pickerController;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) UIImage *currentImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 2 Alloc Memory for the picker and set the delegate to self
    self.pickerController = [[UIImagePickerController alloc] init];
    self.pickerController.delegate = self;
}

- (IBAction)cameraTapped:(UIBarButtonItem *)sender {
    
    NSLog(@"cameraTapped");
    
    // 7. Set the picker controller to Camera for device or Photo Library for Simulator.
    
    self.pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    
    // 6. when the camera button is tapped show the image picker
    [self presentViewController:self.pickerController animated:YES completion:nil];
}

#pragma mark - ImagePicker Delegate Methods


// 5. Implement the delegate methods
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self.pickerController dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
 
    self.currentImage = info[UIImagePickerControllerOriginalImage];
    
    self.imageView.image = self.currentImage;
    
    [self.pickerController dismissViewControllerAnimated:YES completion:nil];
    
}

@end
