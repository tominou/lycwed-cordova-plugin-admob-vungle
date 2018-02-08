#import <Cordova/CDV.h>
#import "Vungle.h"

#import <VungleSDK/VungleSDK.h>
#import <GoogleMobileAds/GADExtras.h>

#pragma mark Cordova JS bridge

@implementation VunglePlugin

- (void)pluginInitialize {
    [super pluginInitialize];
    if (self) {
        NSDictionary* settings = self.commandDelegate.settings;
        NSString* rewardvideoId = settings[@"REWARDVIDEO_ID"];
        NSString* interstitialId = settings[@"INTERSTITIAL_ID"];
        NSLog(@"Vungle mediation plugin init");
        NSLog(@"rewardvideoId");
        NSLog(@"interstitialId");

        GADRequest *request = [GADRequest request];
        VungleAdNetworkExtras *extras = [[VungleAdNetworkExtras alloc] init];

        NSMutableArray *placements = [[NSMutableArray alloc]initWithObjects:@"rewardvideoId", @"interstitialId", nil];
        extras.allPlacements = placements;
        [request registerAdNetworkExtras:extras];
        [_interstitial loadRequest:request];

        // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishLaunching:) name:UIApplicationDidFinishLaunchingNotification object:nil];
    }
} @end

// - (void)finishLaunching:(NSNotification *) notification
// {
//     [Vungle configureWithAppID:@"VUNGLE_APP_ID"
//         zoneIDs:@[@"VUNGLE_PLACEMENT_ID"]
//         options:options
//         completion:nil];
// }
