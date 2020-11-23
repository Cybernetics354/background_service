package com.example.background_service

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import androidx.core.app.NotificationCompat

object Notifications {
    const val NOTIFICATION_ID_BACKGROUND_SERVICE = 1

    private const val CHANNEL_ID_BACKGROUND_SERVICE = "background_service"

    fun createNotificationChannels(context: Context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID_BACKGROUND_SERVICE,
                "Background Service",
                NotificationManager.IMPORTANCE_DEFAULT
            )
            val manager =
                context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            manager.createNotificationChannel(channel)
        }
    }

    fun buildForegroundNotification(context: Context): Notification {
        return NotificationCompat
            .Builder(context, CHANNEL_ID_BACKGROUND_SERVICE)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .setVisibility(Notification.VISIBILITY_SECRET)
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentTitle("Background Service")
            .setContentText("Keeps app process on foreground.")
            .build()
        // builder.setContent(remoteViews);
        // builder.setPriority(NotificationCompat.PRIORITY_LOW);
        // builder.setVisibility(Notification.VISIBILITY_SECRET);
        // return NotificationCompat
        //     .Builder(context, CHANNEL_ID_BACKGROUND_SERVICE)
        //     .build()
        // return builder.build();
    }
}