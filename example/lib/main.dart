import 'package:flutter/material.dart';
import 'package:target2sell_flutter/target2sell_library.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final target2Sell = Target2Sell(
    config: Target2SellConfiguration(
      customerId: '12345678',
      enableCMP: true,
    ),
  );

  await target2Sell.init();

  runApp(
    App(
      target2Sell: target2Sell,
    ),
  );
}

class App extends StatefulWidget {
  const App({
    required this.target2Sell,
    super.key,
  });

  final Target2Sell target2Sell;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessangerKey =
      GlobalKey<ScaffoldMessengerState>();

  late String _rank;
  late bool _isCMPEnabled;

  @override
  void initState() {
    _rank = widget.target2Sell.getRank();
    _isCMPEnabled = widget.target2Sell.isCMPEnabled;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        scaffoldMessengerKey: _scaffoldMessangerKey,
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Rank: $_rank',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await widget.target2Sell.sendTracking(
                        trackingRequest: Target2SellTrackingRequest(
                          pageType: Target2SellPageType.productListingPage,
                        ),
                      );
                    } catch (e) {
                      _scaffoldMessangerKey.currentState!.showSnackBar(
                        SnackBar(
                          content: Text(
                            e.toString(),
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text('Send Tracking'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_isCMPEnabled) {
                      widget.target2Sell.disableCMP();
                    } else {
                      widget.target2Sell.enableCMP();
                    }

                    setState(() {
                      _isCMPEnabled = !_isCMPEnabled;
                    });
                  },
                  child: _isCMPEnabled
                      ? const Text('Disable CMP')
                      : const Text('Enable CMP'),
                ),
              ],
            ),
          ),
        ),
      );
}
