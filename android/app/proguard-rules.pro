# ML Kit Text Recognition - Keep all text recognizer options
-keep class com.google.mlkit.vision.text.** { *; }
-keep class com.google.mlkit.vision.text.chinese.** { *; }
-keep class com.google.mlkit.vision.text.japanese.** { *; }
-keep class com.google.mlkit.vision.text.korean.** { *; }
-keepclassmembers class com.google.mlkit.vision.text.** { *; }

# Keep builders
-keep class **.Builder { *; }