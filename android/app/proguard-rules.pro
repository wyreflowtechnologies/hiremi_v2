## Please add these rules to your existing keep rules in order to suppress warnings.
## This is generated automatically by the Android Gradle plugin.
#-dontwarn org.bouncycastle.jsse.BCSSLParameters
#-dontwarn org.bouncycastle.jsse.BCSSLSocket
#-dontwarn org.bouncycastle.jsse.provider.BouncyCastleJsseProvider
#-dontwarn org.conscrypt.Conscrypt$Version
#-dontwarn org.conscrypt.Conscrypt
#-dontwarn org.conscrypt.ConscryptHostnameVerifier
#-dontwarn org.openjsse.javax.net.ssl.SSLParameters
#-dontwarn org.openjsse.javax.net.ssl.SSLSocket
#-dontwarn org.openjsse.net.ssl.OpenJSSE
##-keep class com.paytm.** { *; }
#-keep class com.paytm.routersdk.RouterService
#-keep class com.paytm.routersdk.RouterOrder
#-keep class com.paytm.routersdk.RouterTransactionCallback
#-keep class com.paytm.routersdk.RouterTransactionManager
#-keep class com.paytm.routersdk.model.** { *; }
-keepattributes *Annotation*
-dontwarn com.razorpay.**
-keep class com.razorpay.** {*;}
-optimizations !method/inlining/
-keepclasseswithmembers class * {
  public void onPayment*(...);
}