List<Map<String, dynamic>> databse = [
  {
    "class": "Bug",
    "solutions": [
      "Check if all dependencies are correctly configured in pubspec.yaml.",
      "Run 'flutter clean' and then 'flutter pub get' to refresh dependencies.",
      "Check the logs using 'flutter run' or 'flutter logs' for more details."
    ]
  },
  {
    "class": "112",
    "solutions": [
      "Ensure you are running the app in debug mode, not release mode.",
      "Restart the IDE and try running 'flutter clean'.",
      "Check if you have unsaved changes before triggering hot reload."
    ]
  },
  {
    "class": "bu31g",
    "solutions": [
      "Ensure you are calling setState() inside a StatefulWidget.",
      "Check if the widget tree is being rebuilt properly.",
      "Use a state management solution like Provider or Riverpod if needed."
    ]
  },
  {
    "class": "bu13431g",
    "solutions": [
      "Check if the API endpoint uses a valid SSL certificate.",
      "Try allowing insecure certificates for testing by setting HttpClient().badCertificateCallback.",
      "Use an HTTP package like Dio that handles SSL errors better."
    ]
  }
];
