#import "CDV.h"
#import "CDVPlugin.h"

@interface CDVTabBarUnselected : CDVPlugin
- (void) setColorforUnselected:(CDVInvokedUrlCommand*)command;
- (UIColor*)colorStringToColor:(NSString*)colorStr;
@end
