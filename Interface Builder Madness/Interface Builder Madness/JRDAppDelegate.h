//
//  JRDAppDelegate.h
//  Interface Builder Madness
//
//  Created by Jordan Dobson on 7/8/14.
//  Copyright (c) 2014 Jordan Dobson. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface JRDAppDelegate : NSObject <NSApplicationDelegate, NSSpeechSynthesizerDelegate>

@property (assign) IBOutlet NSWindow *window;

// TAB 1
@property IBOutlet NSTextField *numberField;
@property IBOutlet NSTextField *numberOutput;
@property IBOutlet NSSlider    *numberSlider;
@property IBOutlet NSMatrix    *numberFormat;

@property (nonatomic, strong) NSNumberFormatter *formatter;


// TAB 2

@property IBOutlet NSTextView           *speakField;
@property IBOutlet NSButton             *startSpeaking;
@property IBOutlet NSButton             *populate1;
@property IBOutlet NSButton             *populate2;
@property IBOutlet NSSegmentedControl   *voiceSelection;

@property          NSSpeechSynthesizer  *synthesizer;

@property          NSString  *voice1;
@property          NSString  *voice2;
@property          NSString  *voice3;

// TAB 3

@property IBOutlet NSTextField *arrayField;
@property IBOutlet NSButton    *recordButton;
@property IBOutlet NSButton    *playButton;
@property IBOutlet NSTextView  *resultField;

@property          NSMutableArray       *theArray;
@property          NSSpeechSynthesizer  *recordSynth;


@end
