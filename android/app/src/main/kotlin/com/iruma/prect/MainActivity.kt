package com.iruma.prect

import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    companion object {
        const val CHANNEL = "com.iruma.prect/native"
        const val METHOD_CONFIGURE_ACCESS_POINT = "configureAccessPoint"
    }

    private lateinit var channel: MethodChannel

    private lateinit var connectAccessPoint: ConnectAccessPoint

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler { methodCall: MethodCall, result: MethodChannel.Result ->
            if (methodCall.method == METHOD_CONFIGURE_ACCESS_POINT) {
                connectAccessPoint = ConnectAccessPoint(channel)
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    connectAccessPoint.connect(this)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    override fun onDestroy() {
        connectAccessPoint.onDestroyAccessPoint()
        super.onDestroy()
    }
}
