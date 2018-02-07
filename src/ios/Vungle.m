#import "Vungle.h"
#import <Cordova/CDV.h>
#import <objc/runtime.h>

#import <VungleSDK/VungleSDK.h>
#import "VungleAdNetworkExtras.h"


@interface VunglePlugin ()

@implementation VunglePlugin

- (void)pluginInitialize {

    NSDictionary* settings = self.commandDelegate.settings;
    NSString* rewardvideoId = settings[@"REWARDVIDEO_ID"];
    NSString* interstitialId = settings[@"INTERSTITIAL_ID"];
    NSLog(@"Vungle mediation plugin init", @"rewardvideoId", @"interstitialId");

    GADRequest *request = [GADRequest request];
    VungleAdNetworkExtras *extras = [[VungleAdNetworkExtras alloc] init];

    NSMutableArray *placements = [[NSMutableArray alloc]initWithObjects:@"rewardvideoId", @"interstitialId", nil];
    extras.allPlacements = placements;
    [request registerAdNetworkExtras:extras];
    [_interstitial loadRequest:request];

    // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishLaunching:) name:UIApplicationDidFinishLaunchingNotification object:nil];
}

// - (void)finishLaunching:(NSNotification *) notification
// {
//     [Vungle configureWithAppID:@"VUNGLE_APP_ID"
//         zoneIDs:@[@"VUNGLE_PLACEMENT_ID"]
//         options:options
//         completion:nil];
// }