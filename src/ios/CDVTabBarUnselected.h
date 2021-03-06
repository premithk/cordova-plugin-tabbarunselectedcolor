#import "CDV.h"
#import "CDVPlugin.h"

@interface CDVTabBarUnselected : CDVPlugin
- (void) setColorforUnselected:(CDVInvokedUrlCommand*)command;
- (void) setBottomPadding:(CDVInvokedUrlCommand*)command;
- (UIColor*)colorStringToColor:(NSString*)colorStr;
- (void) disableScrollforKeyboard:(CDVInvokedUrlCommand*)command;
@end
