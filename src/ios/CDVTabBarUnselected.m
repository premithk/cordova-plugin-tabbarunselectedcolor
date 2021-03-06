#import "CDVTabBarUnselected.h"
#import "UIImage+Overlay.h"

@implementation CDVTabBarUnselected

#ifndef __IPHONE_3_0
@synthesize webView;
#endif

- (void)setColorforUnselected:(CDVInvokedUrlCommand*)command
{
    NSString* callbackId = [command callbackId];
    NSString* color = [[command arguments] objectAtIndex:0];
    UITabBarController *tabBarController = (UITabBarController *)self.viewController.tabBarController;
    if (tabBarController == nil)
    {
        CDVPluginResult* presult = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_ERROR
                               messageAsString:@"Error"];
        [self.commandDelegate sendPluginResult:presult callbackId:callbackId];
        NSLog(@"Error- No Tab Controller Found"); 
    }
    else
    {
        UITabBar *tabBar = tabBarController.tabBar;
        if (tabBar == nil)
            NSLog(@"Error- No Tab Bar Found"); 
        UIColor * unselectedColor = [self colorStringToColor:color];
        for(UITabBarItem *item in tabBar.items) {
            item.image = [[item.selectedImage imageWithColor:unselectedColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
    }
}

- (void) setBottomPadding:(CDVInvokedUrlCommand*)command
{
    NSString* callbackId = [command callbackId];
    NSString* padding = [[command arguments] objectAtIndex:0];
    CGFloat  verticaloffset = [padding floatValue];
    CGFloat  verticaloffsetn = verticaloffset * -1;
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0.0, verticaloffsetn)];
}

- (UIColor*)colorStringToColor:(NSString*)hexString
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}



- (void) disableScrollforKeyboard:(CDVInvokedUrlCommand*)command 
{
    if (!command.arguments || ![command.arguments count]){
      return;
    }
    id value = [command.arguments objectAtIndex:0];
    if (value != [NSNull null]) {
       BOOL disableScroll = [value boolValue];
       if (disableScroll) {
            self.webView.scrollView.scrollEnabled = NO;
        }
      else {
            self.webView.scrollView.scrollEnabled = YES;
        }

    }
}


@end



