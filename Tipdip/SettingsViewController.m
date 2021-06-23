//
//  SettingsViewController.m
//  Tipdip
//
//  Created by Sophia Joy Wang on 6/22/21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;

@end

@implementation SettingsViewController

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
    
    for (int index = 0; index < self.tipPercentageControl.numberOfSegments; index++){
        
        if (tipArray[index] == doubleValue){
            self.tipPercentageControl.selectedSegmentIndex = index;
            break;
        }
    }
    NSLog(@"View did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    NSLog(@"View will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    NSLog(@"View did disappear");
}

- (IBAction)changeDefault:(id)sender {
    
    double tipArray[] = {0.18, 0.20, 0.25};
    double tipPercentage = tipArray[self.tipPercentageControl.selectedSegmentIndex];
    
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
