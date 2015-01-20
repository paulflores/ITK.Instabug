/**
 * ITKInstabug
 *
 * Created by Your Name
 * Copyright (c) 2015 Your Company. All rights reserved.
 */

#import "ItkInstabugModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import <Instabug/Instabug.h>

@implementation ItkInstabugModule

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"e0f851ff-250f-40cb-bf4d-0f70cd0bcd5b";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"itk.instabug";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)startService:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    
    id instaToken = [args objectForKey:@"token"];
    id buttonTextColor = [args objectForKey:@"buttonTextColor"];
    id buttonBackgroundColor = [args objectForKey:@"buttonBackgroundColor"];
    id headerTextColor = [args objectForKey:@"headerTextColor"];
    id fromTextColor = [args objectForKey:@"fromTextColor"];
    id fromBackgroundColor = [args objectForKey:@"fromBackgroundColor"];
    
    [Instabug startWithToken:instaToken captureSource:IBGCaptureSourceUIKit invocationEvent:IBGInvocationEventShake];
    
    if(buttonTextColor != nil){
        [Instabug setButtonsFontColor:[ItkInstabugModule colorWithHexString:buttonTextColor]];
    }
    
    if(buttonBackgroundColor != nil){
        [Instabug setButtonsColor:[ItkInstabugModule colorWithHexString:buttonBackgroundColor]];
    }
    
    if(headerTextColor != nil){
        [Instabug setHeaderFontColor:[ItkInstabugModule colorWithHexString:headerTextColor]];
    }
    
    if(fromTextColor != nil){
        [Instabug setTextFontColor:[ItkInstabugModule colorWithHexString:fromTextColor]];
    }
    
    if(fromBackgroundColor != nil){
        [Instabug setTextBackgroundColor:[ItkInstabugModule colorWithHexString:fromBackgroundColor]];
    }
    
	// example method
	return @"Instabug Service Started";
}

+ (UIColor *) colorWithHexString: (NSString *) hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

@end
