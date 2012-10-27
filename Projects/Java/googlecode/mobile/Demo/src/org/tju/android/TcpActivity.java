package org.tju.android;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class TcpActivity extends Activity {

	Button btnConnectToServer;
	
	
	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.tcp);
        
        btnConnectToServer = (Button) this.findViewById(R.id.btnConnectToServer);
        btnConnectToServer.setOnClickListener(getOnClickListener());
	}
	
	
	private OnClickListener getOnClickListener() {
		return new OnClickListener(){
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Button btn = (Button) v;
				String btnTag = btn.getTag().toString();
				if (btnTag.equals("btnConnectToServer")) {
					
				}
			}};
	}

}
