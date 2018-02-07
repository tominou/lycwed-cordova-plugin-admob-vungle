#import "Vungle.h"
#import <Cordova/CDV.h>

#import <VungleSDK/VungleSDK.h>
#import "VungleAdNetworkExtras.h"

@interface VunglePlugin ()

@implementation VunglePlugin

- (void)pluginInitialize {
    NSDictionary* settings = self.commandDelegate.settings;
    NSString* placementId = settings[@"VUNGLE_PLACEMENT_ID"];
    NSLog(@"Vungle mediation plugin init", @"placementId");

    GADRequest *request = [GADRequest request];
    VungleAdNetworkExtras *extras = [[VungleAdNetworkExtras alloc] init];

    NSMutableArray *placements = [[NSMutableArray alloc]initWithObjects:@"placementId", nil];
    extras.allPlacements = placements;
    [request registerAdNetworkExtras:extras];
    [_interstitial loadRequest:request];
}