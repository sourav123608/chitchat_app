import 'package:flutter/material.dart';
import 'translations.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:stream_chat_localizations/stream_chat_localizations.dart';

import 'channel_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.client, required this.channel})
      : super(key: key);

  final StreamChatClient client;
  final Channel channel;

  @override
  Widget build(BuildContext context) {
    final themeData = ThemeData(primarySwatch: Colors.red);

    final defaultTheme = StreamChatThemeData.fromTheme(themeData);

    final customTheme = defaultTheme.merge(StreamChatThemeData(
      channelPreviewTheme: StreamChannelPreviewThemeData(
          avatarTheme: StreamAvatarThemeData(
        borderRadius: BorderRadius.circular(8),
      )),
    ));

    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        builder: (context, child) {
          return StreamChat(
            client: client,
            streamChatThemeData: customTheme,
            child: child,
          );
        },
        home: StreamChannel(
          channel: channel,
          child: const ChannelListPage(),
        ),
        locale: const Locale("hi"),
        supportedLocales: const [
          Locale('en'),
          Locale('es'),
          Locale("hi"),
          Locale("fr"),
          Locale("it"),
          Locale("ja"),
          Locale("ko"),
        ],
        localizationsDelegates: const [
          TranslationsDelegate(),
          ...GlobalStreamChatLocalizations.delegates
        ]);
  }
}
