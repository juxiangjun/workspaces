package com.real3d.demos.opengl;

import com.lge.real3d.Real3D;
import com.lge.real3d.Real3DInfo;

import android.app.Activity;
import android.opengl.GLSurfaceView;
import android.os.Bundle;
import android.view.MotionEvent;

public class MainActivity extends Activity {

    private GLSurfaceView glSurfaceView;
    private GLTestRenderer renderer;
    private Real3D mReal3D;
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        glSurfaceView = new GLSurfaceView(this);
        mReal3D = new Real3D(glSurfaceView.getHolder());
        mReal3D.setReal3DInfo(new Real3DInfo(true, Real3D.REAL3D_TYPE_SS, Real3D.REAL3D_ORDER_LR));
        renderer = new GLTestRenderer(this);
        glSurfaceView.setRenderer(renderer);
        glSurfaceView.setRenderMode(GLSurfaceView.RENDERMODE_CONTINUOUSLY);
        setContentView(glSurfaceView);
    }

    @Override
    protected void onResume() {
        super.onResume();
        glSurfaceView.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
        glSurfaceView.onPause();
    }
    
    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (event.getAction() == MotionEvent.ACTION_DOWN) {
            renderer.toggle();
        }
        return super.onTouchEvent(event);
    }
}