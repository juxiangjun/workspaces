package org.tju.android;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;


import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.provider.Settings;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.AdapterView.OnItemSelectedListener;

public class GpsActivity extends Activity {
	
	LocationManager locationManager;
	String provider ;
	Location location;
	LocationListener locationListener;
	TextView tv1;
	Criteria criteria;
	Button btnGetLocation;
	Button btnShowMap;
	Button btnShowLocation;
	
	/**
     * Lets the user choose a menu resource.
     */
    Spinner mSpinner;
	
	/**
     * Names corresponding to the different example menu resources.
     */
    private static final String sMenuExampleNames[] = {
        "NETWORK_PROVIDER", "GPS_PROVIDER", "PASSIVE_PROVIDER"
    };
    
    
    void showToast(CharSequence msg) {
        Toast.makeText(this, msg, Toast.LENGTH_SHORT).show();
    }
    
	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.gps);
        mSpinner =(Spinner) this.findViewById(R.id.spinner);
        
        // Create the spinner to allow the user to choose a menu XML
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_spinner_item, sMenuExampleNames); 
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        
        // When programmatically creating views, make sure to set an ID
        // so it will automatically save its instance state
        mSpinner.setAdapter(adapter);
        
        mSpinner.setOnItemSelectedListener(
                new OnItemSelectedListener() {
                    public void onItemSelected(
                            AdapterView<?> parent, View view, int position, long id) {
                        //getCurrentLocation();
                    }

                    public void onNothingSelected(AdapterView<?> parent) {
                        showToast("Spinner1: unselected");
                    }
                });
        
        
        tv1 = (TextView) this.findViewById(R.id.tvLocation);
        btnGetLocation = (Button) this.findViewById(R.id.btnGetLocation);
        btnGetLocation.setOnClickListener(getBtnOnClickListener());
        
        btnShowMap = (Button) this.findViewById(R.id.btnShowMap);
        btnShowMap.setOnClickListener(this.getBtnOnClickListener());
        
        btnShowLocation = (Button) this.findViewById(R.id.btnShowLocation);
        btnShowLocation.setOnClickListener(getBtnOnClickListener());
        
	}
	
	private OnClickListener getBtnOnClickListener() {
		return new OnClickListener() {
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Button btn = (Button) v;
				String btnTag = btn.getTag().toString();
				System.out.println(btnTag);
				
				if(btnTag.equals("btnShowMap")) {
					Intent intent = new Intent();
					intent.setClass(GpsActivity.this, DemoGoogleMaps.class);
					startActivity(intent);
				} 
				
				if (btnTag.equals("btnGetLocation")) {
					getCurrentLocation();
				}
				
				if (btnTag.equals("btnShowLocation")) {
					System.out.println("show Location");
					showLocationOnMap();
				}
			}};
	}
	
	
	private void showLocationOnMap() {
		
		if (location != null) {
			Intent intent = new Intent();
			intent.setClass(GpsActivity.this, DemoCurrentLocation.class);
			double latitude  = location.getLatitude() * 1E6;
			double longitude = location.getLongitude() * 1E6;
			Log.i("App.Latitude", String.valueOf((int)latitude));
			Log.i("App.Longitude",String.valueOf((int)longitude));
			intent.putExtra("latitude", (int)latitude );
			intent.putExtra("longitude",(int) longitude );
			startActivity(intent);
		} else {
			System.out.println("you location data is null.");
			Log.i("App.Warning","you location data is null.");
		}
	}
	
	
	private boolean checkGpsSetting() {
		boolean result = true;
		LocationManager lm = (LocationManager) this.getSystemService(Context.LOCATION_SERVICE);
        if (!lm.isProviderEnabled(android.location.LocationManager.GPS_PROVIDER)) {
        	result = false;
        	Toast.makeText(this, "请开启GPS！", Toast.LENGTH_SHORT).show();
        	Intent intent = new Intent(Settings.ACTION_SETTINGS);
        	startActivityForResult(intent,0); //此为设置完成后返回到获取界面
        }
		return result;
	}
	
	private void getCurrentLocation() {
		
		if (checkGpsSetting()) {
			 // 获取位置管理服务
	        String serviceName = Context.LOCATION_SERVICE;
	        
	        criteria = new Criteria();
	        criteria.setAccuracy(Criteria.ACCURACY_FINE); // 高精度
	        criteria.setAltitudeRequired(false);
	        criteria.setBearingRequired(false);
	        criteria.setCostAllowed(true);
	        criteria.setPowerRequirement(Criteria.POWER_LOW); // 低功耗
	       
	        
	        
	        locationManager = (LocationManager) this.getSystemService(serviceName);
	        provider = locationManager.getBestProvider(criteria, true); // 获取GPS信息
	        
	        String  serviceProvider = mSpinner.getSelectedItem().toString();
	        showToast(serviceProvider);
	        
			if (serviceProvider.equals("GPS_PROVIDER")) {
				location = locationManager.getLastKnownLocation(LocationManager.GPS_PROVIDER);
			}
			
			if (serviceProvider.equals("NETWORK_PROVIDER")) {
				location = locationManager.getLastKnownLocation(LocationManager.NETWORK_PROVIDER);
			}
			
			if (serviceProvider.equals("PASSIVE_PROVIDER")) {
				location = locationManager.getLastKnownLocation(LocationManager.PASSIVE_PROVIDER);
			}
	        // 通过GPS获取位置
	        updateToNewLocation(location);
	        // 设置监听器，自动更新的最小时间为间隔N秒(1秒为1*1000，这样写主要为了方便)或最小位移变化超过N米
	        locationListener = new LocationListener() {
				@Override
				public void onLocationChanged(Location location) {
					// TODO Auto-generated method stub
					Log.i("onLocationChanged", "come in");
					
					//locationManager.removeUpdates(this);
					//locationManager.setTestProviderEnabled(provider, false);
					//location = locationManager.getLastKnownLocation(provider); // 通过GPS获取位置
			        updateToNewLocation(location);
				}

				@Override
				public void onProviderDisabled(String provider) {
					// TODO Auto-generated method stub
					
				}

				@Override
				public void onProviderEnabled(String provider) {
					// TODO Auto-generated method stub
					
				}

				@Override
				public void onStatusChanged(String provider, int status,
						Bundle extras) {
					// TODO Auto-generated method stub
					
				}};
	        locationManager.requestLocationUpdates(provider, 1000, (float) 1000.0, locationListener);
	        
		}
	}

	private void updateToNewLocation(Location location) {
        if (location != null) {
            double latitude = location.getLatitude();
            double longitude= location.getLongitude();
            tv1.setText("维度:" +  latitude+ "\n经度:" + longitude +"\n" + this.geoCode2Addr(String.valueOf(location.getLatitude()), String.valueOf(location.getLongitude())));
        } else {
            tv1.setText("无法获取地理信息\n"+ new java.util.Date().toString());
        } 
		
    }
	
	public static String geoCode2Addr(String latitude, String longitude) {
		String addr = "";
		// 也可以是http://maps.google.cn/maps/geo?output=csv&key=abcdef&q=%s,%s，不过解析出来的是英文地址
		// 密钥可以随便写一个key=abc
		// output=csv,也可以是xml或json，不过使用csv返回的数据最简洁方便解析
		String url = String.format("http://ditu.google.cn/maps/geo?output=csv&key=0krFspqh3fXEDk1xNihp_5g_GVUPGkCGox9z_ow&q=%s,%s",latitude, longitude);
		Log.i("url:", url);
		URL myURL = null;
		URLConnection httpsConn = null;
		try {
			myURL = new URL(url);
		} catch (MalformedURLException e) {
			e.printStackTrace();
			Log.i("can't get the url", "");
			return null;
		}
		try {
			httpsConn = (URLConnection) myURL.openConnection();
			if (httpsConn != null) {
				InputStreamReader insr = new InputStreamReader(httpsConn.getInputStream(), "UTF-8");
				BufferedReader br = new BufferedReader(insr);
				String data = null;
				if ((data = br.readLine()) != null) {
					System.out.println(data);
					String[] retList = data.split(",");
					if (retList.length > 2 && ("200".equals(retList[0]))) {
						addr = retList[2];
						addr = addr.replace("\"", "");
					} else {
						addr = "";
					}
				}
				insr.close();
			}
		} catch (IOException e) {
			Log.i("error:", e.toString());
			e.printStackTrace();
			return null;
		}
		return addr;
	}
	
	private String getLocationToString(Location location) {

		String strReturn = "";

		try {

		/* 当Location存在 */

		if (location != null) {

		//double geoLatitude = (int) gp.getLatitudeE6() / 1E6;
		//double geoLongitude = (int) gp.getLongitudeE6() / 1E6;

		strReturn = String.valueOf(location.getLatitude()) + ","

		+ String.valueOf(location.getLongitude());

		}

		} catch (Exception e) {

		e.printStackTrace();

		}

		return strReturn;

		}

}
