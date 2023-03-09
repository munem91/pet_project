import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_project/features/crypto_list/bloc/crypto_list_bloc.dart';
import '../../../repositories/crypto_coins/crypro_coins.dart';
import '../widgets/widgets.dart';

class CryproListScreen extends StatefulWidget {
  const CryproListScreen({super.key});

  @override
  State<CryproListScreen> createState() => _CryproListScreenState();
}

class _CryproListScreenState extends State<CryproListScreen> {
  final _cryptoListBloc = CryptoListBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crypto Curencies List'),
          centerTitle: true,
        ),
        body: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.coinsList.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, i) {
                  final coin = state.coinsList[i];
                  return CryptoCoinTile(coin: coin);
                },
              );
            }
            if (state is CryptoListLoadingFailure) {
              return Center(
                child: Text(state.exeption?.toString() ?? 'Exeption'),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        )
        // (_cryptoCoinsList == null)
        //     ? const Center(child: CircularProgressIndicator())
        //     : ListView.separated(
        //         padding: const EdgeInsets.only(top: 16),
        //         itemCount: _cryptoCoinsList!.length,
        //         separatorBuilder: (context, index) => Divider(),
        //         itemBuilder: (context, i) {
        //           final coin = _cryptoCoinsList![i];
        //           return CryptoCoinTile(coin: coin);
        //         },
        //       ),
        );
  }
}
