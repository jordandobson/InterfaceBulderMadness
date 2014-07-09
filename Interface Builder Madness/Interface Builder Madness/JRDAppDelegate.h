//
//  JRDAppDelegate.h
//  Interface Builder Madness
//
//  Created by Jordan Dobson on 7/8/14.
//  Copyright (c) 2014 Jordan Dobson. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface JRDAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property IBOutlet NSTextField *numberField;
@property IBOutlet NSTextField *numberOutput;
@property IBOutlet NSSlider    *numberSlider;
@property IBOutlet NSMatrix    *numberFormat;

@property (nonatomic, strong) NSNumberFormatter *formatter;



@property NSMutableArray *formatStyles;

@end
