## Get Started

<p>flutter pub get</p>
<p>flutter pub run build_runner build</p>

<p>Google maps API key</p>
<p>IOS</p>
<p>path: ios/Runner/AppDelegate.swift:</p>

     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GMSServices.provideAPIKey("K E Y")
        GeneratedPluginRegistrant.register(with: self)

<p>android</p>
<p>path: android/app/src/main/AndroidManifest.xml:</p>

        android:icon="@mipmap/ic_launcher">
        <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="K E Y"/>
        <activity
