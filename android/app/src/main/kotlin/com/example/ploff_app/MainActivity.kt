package com.example.ploff_app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    MapKitFactory.setLocale("uz_Cryl_UZ")
    MapKitFactory.setApiKey("f1c2b594-8aa5-402d-9859-76bd424bf197") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}
