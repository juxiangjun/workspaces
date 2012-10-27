package org.tju.android;

import java.util.List;

import android.graphics.drawable.Drawable;
import android.os.Bundle;

import com.google.android.maps.GeoPoint;
import com.google.android.maps.MapActivity;
import com.google.android.maps.MapView;
import com.google.android.maps.Overlay;
import com.google.android.maps.OverlayItem;


public class DemoGoogleMaps extends MapActivity {

	
	@Override
	public void onCreate(Bundle savedInstanceState) {
	    super.onCreate(savedInstanceState);
	    setContentView(R.layout.map);
	    
	    MapView mapView = (MapView) findViewById(R.id.mapview);
	    mapView.setBuiltInZoomControls(true);
	    
	    List<Overlay> mapOverlays = mapView.getOverlays();
	    Drawable drawable = this.getResources().getDrawable(R.drawable.androidmarker);
	    DemoItemizedOverlay itemizedOverlay = new DemoItemizedOverlay(drawable, this);
	    
	  //紐約
        GeoPoint point=new GeoPoint(40750000,-73980000);  
        OverlayItem overlayitem=new OverlayItem(point, "", "");
        itemizedOverlay.addOverlay(overlayitem);
        //北京
        GeoPoint point2=new GeoPoint(39900000,116400000);  
        OverlayItem overlayitem2=new OverlayItem(point2, "", "");
        itemizedOverlay.addOverlay(overlayitem2);
        
        //台北
        GeoPoint point3 = new GeoPoint(25030000, 121500000);  
        OverlayItem overlayitem3 = new OverlayItem(point3, "", "");
        itemizedOverlay.addOverlay(overlayitem3);
        
        //香港
        GeoPoint point4=new GeoPoint(22280000,114100000);  
        OverlayItem overlayitem4=new OverlayItem(point4, "", "");
        itemizedOverlay.addOverlay(overlayitem4);
        
        //大阪
        GeoPoint point5=new GeoPoint(35010000,135700000);  
        OverlayItem overlayitem5=new OverlayItem(point5, "", "");
        itemizedOverlay.addOverlay(overlayitem5);
        
        //巴黎
        GeoPoint point6=new GeoPoint(23500000,48850000);  
        OverlayItem overlayitem6=new OverlayItem(point6, "", "");
        itemizedOverlay.addOverlay(overlayitem6);
        
	    mapOverlays.add(itemizedOverlay);
	}
	
	@Override
	protected boolean isRouteDisplayed() {
		// TODO Auto-generated method stub
		return false;
	}

}
