package org.tju.android;

import java.util.List;

import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.Log;

import com.google.android.maps.GeoPoint;
import com.google.android.maps.MapActivity;
import com.google.android.maps.MapView;
import com.google.android.maps.Overlay;
import com.google.android.maps.OverlayItem;

public class DemoCurrentLocation extends MapActivity {
	
	GeoPoint gp ;
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
	    super.onCreate(savedInstanceState);
	    setContentView(R.layout.current_location_map);
	    Log.i("app.demo", "create a intent to accept the parameters value.");
	    Intent intent = this.getIntent();
	    int latitude = intent.getIntExtra("latitude", 0);
	    int longitude = intent.getIntExtra("longitude", 0);
	    
	    if (latitude != 0 && longitude != 0) {
	    	gp = new GeoPoint(latitude, longitude);
	    }
	    
	    if (gp != null) {
	    	
	    	MapView mapView = (MapView) findViewById(R.id.mvCurrent);
		    mapView.setBuiltInZoomControls(true);
		    List<Overlay> mapOverlays = mapView.getOverlays();
		    Drawable drawable = this.getResources().getDrawable(R.drawable.androidmarker);
		    
		    DemoItemizedOverlay itemizedOverlay = new DemoItemizedOverlay(drawable, this);
		    
		    OverlayItem overlayitem=new OverlayItem(this.gp, "", "");
		    itemizedOverlay.addOverlay(overlayitem);
		    System.out.println(itemizedOverlay.size());
		    mapOverlays.add(itemizedOverlay);
        
	    } else {
	    	Log.i("App.Error", "the GeoPoint is null.");
	    }
        
	}

	@Override
	protected boolean isRouteDisplayed() {
		// TODO Auto-generated method stub
		return false;
	}

}
