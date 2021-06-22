//
//  TipdipViewController.m
//  Tipdip
//
//  Created by Sophia Joy Wang on 6/22/21.
//

#import "TipdipViewController.h"

@interface TipdipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;

@end

@implementation TipdipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onTap:(id)sender {
    NSLog(@"hello");
    [self.view endEditing:true];
}

- (IBAction)labelChanged:(id)sender {
    double bill = [self.billField.text doubleValue];
    double tipArray[] = {0.18, 0.20, 0.25};
    double tipPercentage = tipArray[self.tipPercentageControl.selectedSegmentIndex];
    double tipAmount = bill * tipPercentage;
    double total = bill + tipAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
