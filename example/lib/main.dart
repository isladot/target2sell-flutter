import 'package:flutter/material.dart';
import 'package:target2sell_flutter/target2sell_flutter.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatefulWidget {
  const App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final Target2Sell target2Sell;

  @override
  void initState() {
    target2Sell = Target2Sell(
      config: Target2SellConfiguration(
        customerId: '12345678',
        enableCMP: true,
      ),
    );

    target2Sell.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Target2Sell Example',
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Rank: ${target2Sell.rank}'),
              ElevatedButton(
                onPressed: () async {
                  await target2Sell.sendTracking(
                    pageId: 1,
                  );
                },
                child: const Text('Send Tracking'),
              ),
              ElevatedButton(
                onPressed: target2Sell.isCMPEnabled
                    ? () => target2Sell.disableCMP()
                    : () => target2Sell.enableCMP(),
                child: target2Sell.isCMPEnabled
                    ? const Text('Disable CMP')
                    : const Text('Enable CMP'),
              ),
            ],
          ),
        ),
      );
}
