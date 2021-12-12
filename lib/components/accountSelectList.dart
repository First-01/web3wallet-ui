import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web3wallet_sdk/plugin/index.dart';
import 'package:web3wallet_sdk/storage/types/keyPairData.dart';
import 'package:web3wallet_ui/components/addressIcon.dart';
import 'package:web3wallet_ui/utils/format.dart';
import 'package:web3wallet_ui/utils/index.dart';

class AccountSelectList extends StatelessWidget {
  AccountSelectList(this.plugin, this.list);

  final Web3WalletPlugin plugin;
  final List<KeyPairData>? list;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list!.map((i) {
        return ListTile(
          leading: AddressIcon(i.address, svg: i.icon),
          title: Text(UI.accountName(context, i)),
          subtitle: Text(Fmt.address(i.address)!),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => Navigator.of(context).pop(i),
        );
      }).toList(),
    );
  }
}
