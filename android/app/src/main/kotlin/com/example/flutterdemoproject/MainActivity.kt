package com.example.flutterdemoproject

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import org.devio.flutter.splashscreen.SplashScreen

class MainActivity: FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        SplashScreen.show(this, true)
        //    SplashScreen.show(this, R.style.SplashScreenTheme)
        super.onCreate(savedInstanceState)
    }
}
