import 'package:pet_project/features/crypto_coin/crypto_coin.dart';
import 'package:pet_project/features/crypto_list/crypto_list.dart';

final routes = {
  '/': (context) => const CryproListScreen(),
  '/coin': (context) => const CryptoCoinScreen(),
};
