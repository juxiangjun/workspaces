package org.tju.android;

import android.app.Activity;
import android.app.NotificationManager;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Toast;

public class NotificationActivity extends Activity {

	private NotificationManager mNotificationManager;
	private static int MOOD_NOTIFICATIONS = R.layout.status_bar_notifications;

	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.notifications);
	}
	
	
	private OnClickListener getOnNotifiyClick() {
    	return new OnClickListener(){
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
	                Toast.makeText(NotificationActivity.this, "Here we go.",
	                    Toast.LENGTH_LONG).show();
			}};
    }
}
