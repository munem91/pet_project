import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_project/repositories/crypto_coins/crypto_coins_repositoriy.dart';
import '';
import '../widgets/widgets.dart';

class CryproListScreen extends StatefulWidget {
  const CryproListScreen({super.key});

  @override
  State<CryproListScreen> createState() => _CryproListScreenState();
}

class _CryproListScreenState extends State<CryproListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Curencies List'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, i) {
          const coinName = 'Bitcoin';
          return const CryptoCoinTile(coinName: coinName);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.download),
        onPressed: () {
          CryptoCoinsRepository().getCoinsList();
        },
      ),
    );
  }
}
