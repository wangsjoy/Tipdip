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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSLog(@"View will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = [defaults doubleForKey:@"default_tip_percentage"];
    
    double tipArray[] = {0.18, 0.20, 0.25};
    bool reload;
    for (int index = 0; index < self.tipPercentageControl.numberOfSegments; index++){
        if (tipArray[index] == doubleValue){
            if (self.tipPercentageControl.selectedSegmentIndex == index){
                reload = false;
            } else {
                reload = true;
            }
            self.tipPercentageControl.selectedSegmentIndex = index;
            
            break;
        }
    };
    
    //recalculate bill
    if (self.billField.text.length > 0 && reload){
        //recalculate bill based on new value
        double bill = [self.billField.text doubleValue];
        double tipAmount = bill * tipArray[self.tipPercentageControl.selectedSegmentIndex];
        double total = bill + tipAmount;
        //edit text labels
        self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
        self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    }
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

}


- (IBAction)onTap:(id)sender {
    NSLog(@"hello");
    [self.view endEditing:true];
}

- (IBAction)labelChanged:(id)sender {
    //calculate bill
    double bill = [self.billField.text doubleValue];
    
    //calculate tip percentage based on selection in controller
    double tipArray[] = {0.18, 0.20, 0.25};
    double tipPercentage = tipArray[self.tipPercentageControl.selectedSegmentIndex];
    
    //calculate tip amount and total bill
    double tipAmount = bill * tipPercentage;
    double total = bill + tipAmount;
    
    //edit text labels
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    
    //update the default value for tip percentage if changed
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:tipPercentage forKey:@"default_tip_percentage"];
    [defaults synchronize];
    NSLog(@"Changed");
    
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
