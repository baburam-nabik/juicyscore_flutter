-dontwarn com.google.android.gms.auth.api.credentials.Credential$Builder
-dontwarn com.google.android.gms.auth.api.credentials.Credential
-dontwarn com.google.android.gms.auth.api.credentials.CredentialPickerConfig$Builder
-dontwarn com.google.android.gms.auth.api.credentials.CredentialPickerConfig
-dontwarn com.google.android.gms.auth.api.credentials.CredentialRequest$Builder
-dontwarn com.google.android.gms.auth.api.credentials.CredentialRequest
-dontwarn com.google.android.gms.auth.api.credentials.CredentialRequestResponse
-dontwarn com.google.android.gms.auth.api.credentials.Credentials
-dontwarn com.google.android.gms.auth.api.credentials.CredentialsClient
-dontwarn com.google.android.gms.auth.api.credentials.HintRequest$Builder
-dontwarn com.google.android.gms.auth.api.credentials.HintRequest
-dontwarn proguard.annotation.Keep
-dontwarn proguard.annotation.KeepClassMembers

# Razorpay SDK Proguard Rules
-keep class com.razorpay.** { *; }
-keep class org.json.** { *; }
-dontwarn com.razorpay.**

# Firebase Cloud Messaging
-keep class com.google.firebase.messaging.** { *; }
-dontwarn com.google.firebase.messaging.**

# Firestore
-keep class com.google.firebase.firestore.** { *; }
-dontwarn com.google.firebase.firestore.**

# General Network Calls
-keep class retrofit2.** { *; }
-dontwarn retrofit2.**

# Prevent stripping annotations
-keepattributes *Annotation*
