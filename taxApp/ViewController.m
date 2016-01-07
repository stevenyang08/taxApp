//
//  ViewController.m
//  taxApp
//
//  Created by Steven Yang on 1/6/16.
//  Copyright © 2016 Steven Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *onCalculateButtonTapped;
@property double caTax;
@property double chiTax;
@property double nyTax;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *taxRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *taxRate;



@end

@implementation ViewController
@synthesize resultLabel, priceTextField;



- (void)viewDidLoad {
    [super viewDidLoad];
    self.caTax = 0.075;
    self.chiTax = 0.0925;
    self.nyTax = 0.045;
    NSString *percent = @"%";
    if(self.segmentedControl.selectedSegmentIndex == 0) {
        double caTaxPercent = 100 * self.caTax;
        self.taxRate.text = [NSString stringWithFormat:@"%.2f" @"%@", caTaxPercent, percent];
    }
    else if(self.segmentedControl.selectedSegmentIndex == 1) {
        double chiTaxPercent = 100 * self.chiTax;
        self.taxRate.text = [NSString stringWithFormat:@"%.2f" @"%@", chiTaxPercent, percent];
    }
    else if(self.segmentedControl.selectedSegmentIndex == 2) {
        double nyTaxPercent = 100 * self.nyTax;
        self.taxRate.text = [NSString stringWithFormat:@"%.2f" @"%@", nyTaxPercent, percent];
    }

}

- (IBAction)calculate:(id)sender {

    NSString *result = priceTextField.text;
    int taxFieldNum = result.intValue;
    
    if(self.segmentedControl.selectedSegmentIndex == 0) {
        double caResult = taxFieldNum * self.caTax;
        self.resultLabel.text = [NSString stringWithFormat:@"%.2f", caResult];
    }
    else if(self.segmentedControl.selectedSegmentIndex == 1) {
        
        double chiResult = taxFieldNum * self.chiTax;
        NSString* chiTaxResult = [NSString stringWithFormat:@"%.2f", chiResult];
        resultLabel.text = chiTaxResult;
    }
    else if(self.segmentedControl.selectedSegmentIndex == 2) {
        
        double nyResult = taxFieldNum * self.nyTax;
        NSString* nyTaxResult = [NSString stringWithFormat:@"%.2f", nyResult];
        resultLabel.text = nyTaxResult;
    }
    
}



@end
