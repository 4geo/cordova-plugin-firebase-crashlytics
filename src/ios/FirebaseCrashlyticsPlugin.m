#import "FirebaseCrashlyticsPlugin.h"

#import <Cordova/CDVAvailability.h>
@import Firebase;

@implementation FirebaseCrashlyticsPlugin

- (void)pluginInitialize {
    if(![FIRApp defaultApp]) {
        [FIRApp configure];
    }
}

- (void)crash:(CDVInvokedUrlCommand *)command {
    assert(NO);
}

- (void)logPriority:(CDVInvokedUrlCommand *)command {
    NSString *message = [command argumentAtIndex:2];
    [FIRCrashlytics.crashlytics log: message];
}

- (void)logException:(CDVInvokedUrlCommand *)command {
    NSString *message = [command argumentAtIndex:0];

    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey: NSLocalizedString(@"Unexpected excerption", nil),
                               NSLocalizedFailureReasonErrorKey: NSLocalizedString(message, nil),
                               NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"", nil)};

    NSError *error = [NSError errorWithDomain:@"uk.co.trssc" code:-1 userInfo:userInfo];
    [FIRCrashlytics.crashlytics recordError:error];
}

- (void)log:(CDVInvokedUrlCommand *)command {
    NSString *message = [command argumentAtIndex:0];
    [FIRCrashlytics.crashlytics log: message];
}

- (void)setString:(CDVInvokedUrlCommand *)command {
    NSString *key = [command argumentAtIndex:0];
    NSString *value = [command argumentAtIndex:1];

    [FIRCrashlytics.crashlytics setCustomValue:value forKey:key];
}

- (void)setInt:(CDVInvokedUrlCommand *)command {
    NSString *key = [command argumentAtIndex:0];
    NSNumber *value = [command argumentAtIndex:1];

    [FIRCrashlytics.crashlytics setCustomValue:value forKey:key];
}

- (void)setBool:(CDVInvokedUrlCommand *)command {
    NSString *key = [command argumentAtIndex:0];
    NSNumber *value = [command argumentAtIndex:1];

    [FIRCrashlytics.crashlytics setCustomValue:value forKey:key];
}

- (void)setDouble:(CDVInvokedUrlCommand *)command {
    NSString *key = [command argumentAtIndex:0];
    NSNumber *value = [command argumentAtIndex:1];

    [FIRCrashlytics.crashlytics setCustomValue:value forKey:key];
}

- (void)setFloat:(CDVInvokedUrlCommand *)command {
    NSString *key = [command argumentAtIndex:0];
    NSNumber *value = [command argumentAtIndex:1];

    [FIRCrashlytics.crashlytics setCustomValue:value forKey:key];
}

- (void)setUserIdentifier:(CDVInvokedUrlCommand *)command {
    NSString *identifier = [command argumentAtIndex:0];

    [FIRCrashlytics.crashlytics setUserID:identifier];
}

@end
