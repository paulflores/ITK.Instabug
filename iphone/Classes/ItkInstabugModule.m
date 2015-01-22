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
/*
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
*/

#pragma Public APIs

//Method: startService #params args #return id
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
        [Instabug setButtonsFontColor:(UIColor *)[[TiUtils colorValue:buttonTextColor] _color]];
    }
    
    if(buttonBackgroundColor != nil){
        [Instabug setButtonsColor:(UIColor *)[[TiUtils colorValue:buttonBackgroundColor] _color]];
    }
    
    if(headerTextColor != nil){
        [Instabug setHeaderFontColor:(UIColor *)[[TiUtils colorValue:headerTextColor] _color]];
    }
    
    if(fromTextColor != nil){
        [Instabug setTextFontColor:(UIColor *)[[TiUtils colorValue:fromTextColor] _color]];
    }
    
    if(fromBackgroundColor != nil){
        [Instabug setTextBackgroundColor:(UIColor *)[[TiUtils colorValue:fromBackgroundColor] _color]];
    }
    
    // example method
    return @"Instabug Service Started";
}


//Theme Color Customizations

//Method: setHeaderColor #params value #return void
-(void)setHeaderColor:(id)value{
    ENSURE_SINGLE_ARG(value, NSString);
    [Instabug setHeaderColor:(UIColor *)[[TiUtils colorValue:value] _color]];
}

//Method: setHeaderFontColor #params value #return void
-(void)setHeaderFontColor: (id)value{
    ENSURE_SINGLE_ARG(value, NSString);
    [Instabug setButtonsFontColor:(UIColor *)[[TiUtils colorValue:value] _color]];
}

//Method: setButtonsColor #params value #return void
-(void)setButtonsColor: (id)value{
    ENSURE_SINGLE_ARG(value, NSString);
    [Instabug setButtonsColor:(UIColor *)[[TiUtils colorValue:value] _color]];
}

//Method: setButtonsFontColor #params value #return void
-(void)setButtonsFontColor: (id)value{
    ENSURE_SINGLE_ARG(value, NSString);
    [Instabug setHeaderFontColor:(UIColor *)[[TiUtils colorValue:value] _color]];
}

//Method: setTextBackgroundColor #params value #return void
-(void)setTextBackgroundColor: (id)value{
    ENSURE_SINGLE_ARG(value, NSString);
    [Instabug setTextFontColor:(UIColor *)[[TiUtils colorValue:value] _color]];
}

//Method: setTextFontColor #params value #return void
-(void)setTextFontColor: (id)value{
    ENSURE_SINGLE_ARG(value, NSString);
    [Instabug setTextBackgroundColor:(UIColor *)[[TiUtils colorValue:value] _color]];
}

//Instabug Defaults

//Method: setDefaultEmail #params value #return void
-(void)setDefaultEmail: (id)value{
    ENSURE_SINGLE_ARG(value, NSString);
    [Instabug setDefaultEmail:value];
}

//Feedback Alert Customization

//Method: setFeedbackHeaderText #params value #return void
-(void)setFeedbackHeaderText:(id)value{
    ENSURE_SINGLE_ARG(value, NSString);
    [Instabug setFeedbackHeaderText:value];
}

//Method: setFeedbackSentAlertText #params value #return void
-(void)setFeedbackSentAlertText:(id)value{
    ENSURE_SINGLE_ARG(value, NSString);
    [Instabug setFeedbackSentAlertText:value];
}

//Method: setFeedbackSentAlertTitle #params value #return void
-(void)setFeedbackSentAlertTitle:(id)value{
    ENSURE_SINGLE_ARG(value, NSString);
    [Instabug setFeedbackSentAlertTitle:value];
}

//Custom Log

//Method: IBGLog #params value #return void
-(void)IBGLog:(id)value{
    ENSURE_SINGLE_ARG(value, NSString);
    IBGLog(value);
}

//Method: setUserData #params value #return void
-(void)setUserData:(id)value{
    ENSURE_SINGLE_ARG(value, NSString);
    [Instabug setUserData:value];
}

//Method: attachFileAtLocation #params value #return void
-(void)attachFileAtLocation:(id)value{
    ENSURE_SINGLE_ARG(value, NSString);
    [Instabug attachFileAtLocation:value];
}

//Direct Invocation

//Method: invoke #params value #return void

-(void)invoke:(id)value{
    [Instabug invoke];
}

//Method: invokeBugReporter #params value #return void
-(void)invokeBugReporter:(id)value{
    [Instabug invokeBugReporter];
}

//Method: invokeFeedbackSender #params value #return void
-(void)invokeFeedbackSender:(id)value{
    [Instabug invokeFeedbackSender];
}

//Method: invokeFeedbackSenderViaEmail #params value #return void
-(void)invokeFeedbackSenderViaEmail:(id)value{
    [Instabug invokeFeedbackSenderViaEmail];
}

//Method: setiPhoneShakingThreshold #params value #return void
-(void)setiPhoneShakingThreshold:(id)value{
    [Instabug setiPhoneShakingThreshold:[value doubleValue]];
}

//Method: setiPadShakingThreshold #params value #return void
-(void)setiPadShakingThreshold:(id)value{
    [Instabug setiPadShakingThreshold:[value doubleValue]];
}

//Locale

//Method: setLocale #params value #return void
-(void) setLocale:(id)value{
    [Instabug setLocale:(IBGLocale)value];
}

//Prop: IBGLocaleArabic
//Prop: IBGLocaleChineseSimplified
//Prop: IBGLocaleChineseTraditional
//Prop: IBGLocaleEnglish
//Prop: IBGLocaleFinnish
//Prop: IBGLocaleFrench
//Prop: IBGLocaleGerman
//Prop: IBGLocaleItalian
//Prop: IBGLocaleJapanese
//Prop: IBGLocaleKorean
//Prop: IBGLocalePolish
//Prop: IBGLocalePortuguese
//Prop: IBGLocalePortugueseBrazil
//Prop: IBGLocaleRussian
//Prop: IBGLocaleSlovenian
//Prop: IBGLocaleSpanish
//Prop: IBGLocaleSwedish
//Prop: IBGLocaleTurkish

@end
