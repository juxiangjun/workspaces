package org.tju.android;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.Toast;

public class DemoActivity extends Activity {
	
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        Button btnNotifyInScreen;
        Button btnTcp;
        Button btnUdp;
        Button btnCamera;
        Button btnWifi;
        Button btnGps;
        
        
        btnNotifyInScreen = (Button) this.findViewById(R.id.btnNotifications);
        btnNotifyInScreen.setOnClickListener(this.getBtnOnClick());
        
        btnTcp = (Button) this.findViewById(R.id.btnTcp);
        btnTcp.setOnClickListener(this.getBtnOnClick());
        
        btnUdp = (Button) this.findViewById(R.id.btnUdp);
        btnUdp.setOnClickListener(this.getBtnOnClick());
        
        btnCamera = (Button) this.findViewById(R.id.btnCamera);
        btnCamera.setOnClickListener(this.getBtnOnClick());
        
        btnWifi = (Button) this.findViewById(R.id.btnWifi);
        btnWifi.setOnClickListener(getBtnOnClick());
        
        btnGps = (Button) this.findViewById(R.id.btnGps);
        btnGps.setOnClickListener(getBtnOnClick());
        
    }
    
    private OnClickListener getBtnOnClick() {
    	return new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				//Uri uri = Uri.parse("tel:18621390565");
				//Intent intent = new Intent(Intent.ACTION_CALL, uri);
				Button btn = (Button)v;
				
				CharSequence cs = btn.getTag().toString();
				
				Toast.makeText(DemoActivity.this, cs,
	                    Toast.LENGTH_LONG).show();
				
				Intent intent = new Intent();
				
				boolean gotIntent = false;
				
				if (cs.equals("btnNotifications")) {
					intent.setClass(DemoActivity.this, NotificationActivity.class);
					gotIntent = true;
				}
				
				if (cs.equals("btnGps")) {
					intent.setClass(DemoActivity.this, GpsActivity.class);
					gotIntent = true;
				}
				
				
				if (cs.equals("btnTcp")) {
					intent.setClass(DemoActivity.this, TcpActivity.class);
					gotIntent = true;
				}
				
				
				if (cs.equals("btnUdp")) {
					intent.setClass(DemoActivity.this, UdpActivity.class);
					gotIntent = true;
				}
				
				if (cs.equals("btnWifi")) {
					intent.setClass(DemoActivity.this, WifiActivity.class);
					gotIntent = true;
				}
				
				if (cs.equals("btnCamera"))  {
					intent.setClass(DemoActivity.this, CameraActivity.class);
					gotIntent = true;
				}
				
				if (gotIntent)
					startActivity(intent);
			}
    		
    	};
    }
  
    
    
}