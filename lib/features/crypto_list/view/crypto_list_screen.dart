import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_project/repositories/crypto_coins/crypto_coins_repositoriy.dart';
import 'package:pet_project/repositories/crypto_coins/models/crypto_coin.dart';
import '../widgets/widgets.dart';

class CryproListScreen extends StatefulWidget {
  const CryproListScreen({super.key});

  @override
  State<CryproListScreen> createState() => _CryproListScreenState();
}

class _CryproListScreenState extends State<CryproListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Curencies List'),
        centerTitle: true,
      ),
      body: (_cryptoCoinsList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: _cryptoCoinsList!.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinsList![i];
                return CryptoCoinTile(coin: coin);
              },
            ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
    setState(() {});
  }
}
