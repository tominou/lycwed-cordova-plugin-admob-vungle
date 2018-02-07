package com.lycwed.cordova.vungle;

import org.apache.cordova.api.CordovaPlugin;
import com.vungle.mediation.VungleAdapter;
import com.vungle.mediation.VungleExtrasBuilder;

public class Vungle extends CordovaPlugin {
    private static final String LOG_TAG = "Vungle mediation plugin init";

    @Override
    protected void pluginInitialize() {
        super.pluginInitialize();

        String placementId = new String();
        placementId = preferences.getString("VUNGLE_PLACEMENT_ID", "");
        Log.v(LOG_TAG, placementId);

        String[] placements = new String[1];
        placements[0] = placementId;

        Bundle extras = new VungleExtrasBuilder(placements).build();
        AdRequest request =  new AdRequest.Builder()
            .addNetworkExtrasBundle(VungleAdapter.class, extras)
            .build();
    }
}