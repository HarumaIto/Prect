package com.iruma.prect

import android.app.Activity
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.net.wifi.WifiManager
import android.net.wifi.WifiNetworkSpecifier
import android.net.wifi.WifiNetworkSuggestion
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Log
import androidx.annotation.RequiresApi
import androidx.annotation.UiThread
import io.flutter.plugin.common.MethodChannel

class ConnectAccessPoint(private val channel: MethodChannel) {
    companion object {
        const val DEVICE_SSID = "PrectSettingSSID"
        const val DEVICE_PASSWORD = "2022Prect"
    }

    class ConnectionResult {
        companion object {
            const val SUCCESS: Int = 1
            const val FAILURE: Int = -1
        }
    }

    private lateinit var connectivityManager: ConnectivityManager
    private lateinit var networkCallback: ConnectivityManager.NetworkCallback

    @RequiresApi(Build.VERSION_CODES.Q)
    fun connect(activity: Activity) {
        val specifier = WifiNetworkSpecifier.Builder()
            .setSsid(DEVICE_SSID)
            .setWpa2Passphrase(DEVICE_PASSWORD)
            .build()

        val request = NetworkRequest.Builder()
            .addTransportType(NetworkCapabilities.TRANSPORT_WIFI)
            .setNetworkSpecifier(specifier)
            .build()

        connectivityManager = activity.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager

        val networkCallback = object : ConnectivityManager.NetworkCallback() {
            override fun onAvailable(network: Network) {
                Log.d("android native", "on available")
                connectivityManager.bindProcessToNetwork(network)
                activity.runOnUiThread {
                    channel.invokeMethod("configureAccessPointResult", ConnectionResult.SUCCESS)
                }
            }

            override fun onUnavailable() {
                Log.d("android native", "on unavailable")
                activity.runOnUiThread {
                    channel.invokeMethod("configureAccessPointResult", ConnectionResult.FAILURE)
                }
            }
        }
        connectivityManager.requestNetwork(request, networkCallback)
    }

    // connectを呼び出した場合にはbroadcast receiverの適切な破棄が必要
    fun onDestroyAccessPoint() {
        try {
            connectivityManager.unregisterNetworkCallback(networkCallback)
        } catch (e: Exception) {
            Log.d("android native", "onDestroy: unregisterNetworkCallback: e=$e")
        }
    }
}
