//
//  ViewController.m
//  mepossdktest_objc
//
//  Created by Daniel Gallegos Ibarra on 3/3/17.
//  Copyright © 2017 Unique Secure. All rights reserved.
//

#import "ViewController.h"
#import <meposconnect/meposconnect.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldIP;

@end

@implementation ViewController

MePOS *mepos;
NSInteger colorIndex = 0;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)connectMePOS:(UIButton *)sender {
    mepos = [[MePOS alloc] init];
    [[mepos getConnectionManager] setConnectionIPAddressWithIPAddress:self.textFieldIP.text];
    
}

- (IBAction)changeLed:(UIButton *)sender {
    [self rotateColor];
    [mepos setCosmeticLedColWithColour:colorIndex];
}

- (IBAction)printReceipt:(UIButton *)sender {
    [mepos printWithReceipt:[self buildReceipt] callback:self];
}

- (void)rotateColor {
    colorIndex += 1;
    if (colorIndex > 7) {
        colorIndex = 0;
    }
}

- (MePOSReceipt *) buildReceipt {
    MePOSReceipt *r = [[MePOSReceipt alloc] init];
    MePOSReceiptTextLine *rcpt = [[MePOSReceiptTextLine alloc] init];
    
    [rcpt setTextWithText:@"RECEIPT" style:MePOS.TEXT_STYLE_BOLD size:MePOS.TEXT_SIZE_NORMAL position:MePOS.TEXT_POSITION_CENTER];
    [r addLineWithLine:rcpt];
    
    NSBundle* myBundle = [NSBundle mainBundle];
    NSURL* fileUrl = [myBundle URLForResource:@"ic_launcher_bmp" withExtension:@"bmp"];
    CIImage* image = [CIImage imageWithContentsOfURL:fileUrl];
    [r addLineWithLine:[[MePOSReceiptImageLine alloc] initWithImage:image]];
    
    [r addLineWithLine:[[MePOSReceiptFeedLine alloc] initWithLines:1]];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"Company name: Skyfox Digital" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"Email daniel.gallegos@skyfoxdigital.com" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"Telephone 5559537111" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"Job title: Software developer" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"Country : Mexico" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"VAT" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    [r addLineWithLine:[[MePOSReceiptFeedLine alloc] initWithLines:1]];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"VAT" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    [r addLineWithLine:[[MePOSReceiptSingleCharLine alloc] initWithChr:@"-"]];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"User's name    Terminal    Time stamp" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    [r addLineWithLine:[[MePOSReceiptSingleCharLine alloc] initWithChr:@"-"]];

    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"Daniel Gallegos" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];

    [r addLineWithLine:[[MePOSReceiptSingleCharLine alloc] initWithChr:@"-"]];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"Order No.                   Table No." style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];

    [r addLineWithLine:[[MePOSReceiptSingleCharLine alloc] initWithChr:@"-"]];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"1 Corona                      3.60" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"1 Soup of the day             4.55" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"1 Sirlon                     12.00" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];

    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"            price override/discount here" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];

    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"-Sirlon variants here  +Variant price here" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"-Sirlon edited ingredients/stock here" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"-Sirlon notes here" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"1 Sorbet                      5.00" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    [r addLineWithLine:[[MePOSReceiptFeedLine alloc] initWithLines:1]];

    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"Service charge % set percentage" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    [r addLineWithLine:[[MePOSReceiptSingleCharLine alloc] initWithChr:@"-"]];

    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"Total items in basquet        4" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_CENTER];
    [r addLineWithLine:rcpt];
    
    [r addLineWithLine:[[MePOSReceiptFeedLine alloc] initWithLines:1]];

    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"Total top category 1      Sum of all drinks" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"Total top category 1      Sum of all food" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    rcpt = [[MePOSReceiptTextLine alloc] init];
    [rcpt setTextWithText:@"Total                        20.65" style:MePOS.TEXT_STYLE_NONE size:MePOS.TEXT_STYLE_NONE position:MePOS.TEXT_POSITION_LEFT];
    [r addLineWithLine:rcpt];
    
    [r addLineWithLine:[[MePOSReceiptSingleCharLine alloc] initWithChr:@"-"]];

    [r addLineWithLine:[[MePOSReceiptFeedLine alloc] initWithLines:1]];
    
    [r addLineWithLine:[[MePOSReceiptBarcodeLine alloc] initWithType:MePOS.BARCODE_TYPE_CODE39 data:@"R0926031274"]];

    [r addLineWithLine:[[MePOSReceiptFeedLine alloc] initWithLines:1]];

    [r addLineWithLine:[[MePOSReceiptSingleCharLine alloc] initWithChr:@"-"]];

    return r;
}

-(void)onPrinterStartedWithIpAddress:(NSString *)ipAddress {
    
}


-(void)onPrinterCompletedWithIpAddress:(NSString *)ipAddress {

}

-(void)onPrinterErrorWithError:(enum MePOSError)error {

}

@end
