//
//  ViewController.m
//  Calcadoo
//
//  Created by Michał Tubis on 01.06.2015.
//  Copyright (c) 2015 Mike Tubis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *profileView;
@property (weak, nonatomic) IBOutlet UITextField *scoreField;
@property (weak, nonatomic) IBOutlet UITextField *maxField;

@property NSArray *profiles;

@end

@implementation ViewController


- (IBAction)scoreField:(id)sender {
}

- (IBAction)maxField:(id)sender {
}


- (IBAction)calculate:(id)sender {
    
    // grab content of text field and set integers
    NSString *score = [self.scoreField text];
    NSString *max = [self.maxField text];
    
    NSNumberFormatter *nf = [[NSNumberFormatter alloc]init];
    [nf setNumberStyle:NSNumberFormatterDecimalStyle];
    
    double scoreValue = [[nf numberFromString:score] doubleValue];
    double maxValue = [[nf numberFromString:max] doubleValue];
    double result = (scoreValue * 100)/maxValue;
    long roundedResult = lroundf(result);
    long roundedMax = lroundf(maxValue);
    
    NSLog(@"%ld", roundedResult);
    
    
    // set messages
    
    NSString *one = [NSString stringWithFormat: @"Your score is %ld%%, your mark is 1", roundedResult];
    NSString *two = [NSString stringWithFormat: @"Your score is %ld%%, your mark is 2", roundedResult];
    NSString *three = [NSString stringWithFormat: @"Your score is %ld%%, your mark is 3", roundedResult];
    NSString *four = [NSString stringWithFormat: @"Your score is %ld%%, your mark is 4", roundedResult];
    NSString *five = [NSString stringWithFormat: @"Your score is %ld%%, your mark is 5", roundedResult];
    
    // calculate the mark
    
    if (roundedResult > 0 && roundedResult < 30){
        UIAlertView *oneAlert = [[UIAlertView alloc]initWithTitle:@"Failed!" message:one delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [oneAlert show];}
    if (roundedResult >= 30 && roundedResult < 50) {
        UIAlertView *twoAlert = [[UIAlertView alloc]initWithTitle:@"Passed!" message:two delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [twoAlert show];}
    if (roundedResult >= 50 && roundedResult < 75){
        UIAlertView *threeAlert = [[UIAlertView alloc]initWithTitle:@"Passed!" message:three delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [threeAlert show];}
    if (roundedResult >= 75 && roundedResult < 90){
        UIAlertView *fourAlert = [[UIAlertView alloc]initWithTitle:@"Passed!" message:four delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [fourAlert show];}
    if (roundedResult >= 90 && roundedResult <= 100){
        UIAlertView *fiveAlert = [[UIAlertView alloc]initWithTitle:@"Passed!" message:five delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [fiveAlert show];}
    if (roundedResult <= 0 || roundedResult > 100 || [max isEqualToString: @"0"] || [score isEqualToString: @"0"]){
        UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Error!" message:@"Please try again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [errorAlert show];}
    
    NSString *jedynka = [NSString stringWithFormat:@"  0   - %ld     1", roundedMax*29/100];
    NSString *dwojka = [NSString stringWithFormat: @"  %ld - %ld    2", roundedMax*30/100, roundedMax*49/100];
    NSString *trojka = [NSString stringWithFormat: @"  %ld - %ld    3", roundedMax*50/100, roundedMax*74/100];
    NSString *czworka = [NSString stringWithFormat:@"  %ld - %ld   4",roundedMax*75/100, roundedMax*89/100];
    NSString *piatka = [NSString stringWithFormat: @"  %ld - %ld   5", roundedMax*90/100, roundedMax];
    
    [self.label1 setText:jedynka];
    [self.label2 setText:dwojka];
    [self.label3 setText:trojka];
    [self.label4 setText:czworka];
    [self.label5 setText:piatka];
}

// dismiss keyboard when hit "return"
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.scoreField resignFirstResponder];
    [self.maxField resignFirstResponder];
    return YES;
}

// dismiss keyboard when no text fields are active
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
