import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'my_app.dart';

const apiKey = "g4ra2ety88pf";
const userToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZmx1dHRlciJ9.S-MJpoSwDiqyXpUURgO5wVqJ4vKlIVFLSEyrFYCOE1c";

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final client = StreamChatClient(apiKey, logLevel: Level.INFO);
  await client.connectUser(User(id: "tutorial-flutter"), userToken);
  final channel = client.channel("messaging", id: "flutterdevs");
  await channel.watch();
  runApp(MyApp(client: client, channel: channel));
}
