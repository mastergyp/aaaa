#import "AaaaPlugin.h"
#if __has_include(<aaaa/aaaa-Swift.h>)
#import <aaaa/aaaa-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "aaaa-Swift.h"
#endif

@implementation AaaaPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAaaaPlugin registerWithRegistrar:registrar];
}
@end
