//
//  JRDAppDelegate.m
//  Interface Builder Madness
//
//  Created by Jordan Dobson on 7/8/14.
//  Copyright (c) 2014 Jordan Dobson. All rights reserved.
//

#import "JRDAppDelegate.h"

@implementation JRDAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

    // Init Formatter & Get Selected row in Index
    
    self.formatter = [[NSNumberFormatter alloc] init];

    [[self numberFormat] selectCellAtRow: 0 column: 0];
    [[self numberFormat] sendAction];
}

-(IBAction)sliderChanged:(id)sender {

    NSNumber *sliderNumber    = [NSNumber numberWithInteger:_numberSlider.integerValue];
    NSString *convertedString = [self.formatter stringFromNumber:sliderNumber];

    if(sliderNumber != NULL){
        _numberOutput.stringValue = convertedString;
    }
}

-(IBAction)numberFieldChanged:(id)sender {

    NSNumber *fieldNumber    = [NSNumber numberWithInteger:_numberField.integerValue];
    NSString *convertedField = [self.formatter stringFromNumber:fieldNumber];

    if(convertedField != NULL){
        _numberOutput.stringValue = convertedField;
    }
}

-(IBAction)radioChange:(id)sender {

    NSInteger selectedRow   = _numberFormat.selectedRow;
    NSNumber  *pulledNumber = [self.formatter numberFromString:_numberOutput.stringValue];

    switch (selectedRow) {
        case 1:
            self.formatter.numberStyle = NSNumberFormatterScientificStyle;
            break;
        case 2:
            self.formatter.numberStyle = NSNumberFormatterDecimalStyle;
            break;
        default:
            self.formatter.numberStyle = NSNumberFormatterSpellOutStyle;
            break;
    }

    if(pulledNumber != NULL){
        _numberOutput.stringValue = [self.formatter stringFromNumber:pulledNumber];
    }
}



@end




//    NSLog(@"%@", @(selectedRow));

//    _numberOutput.stringValue = [NSString stringWithFormat: @"%ld", (long)selectedRow];

//+ (NSString *)localizedStringFromNumber:(NSNumber *)num numberStyle:(NSNumberFormatterStyle)nstyle NS_AVAILABLE(10_6, 4_0);

// Attributes of an NSNumberFormatter

//- (NSNumberFormatterStyle)numberStyle;
//- (void)setNumberStyle:(NSNumberFormatterStyle)style;


                                                                                // These all provide the same result
                                                                                // [self numberOutput].stringValue = sliderValue;
                                                                                // self.numberOutput.stringValue   = sliderValue;
                                                                                // _numberOutput.stringValue       = sliderValue;
