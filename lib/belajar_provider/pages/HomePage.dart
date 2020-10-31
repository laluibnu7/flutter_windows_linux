import 'package:awesome_card/awesome_card.dart';
import 'package:awesome_card/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/ModelUSer.dart';
import '../provider/BlocUser.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Panggil file BlocUser tadi
    // Untuk dijalankan function fetchDatanya didalam class home ini
    final BlocUser blocUser = Provider.of<BlocUser>(context);
    blocUser.fecthData();
    print("Data : ${blocUser.listUser}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Fecth Data With Provider"),
      ),
      body: blocUser.listUser == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: blocUser.listUser.length,
              itemBuilder: (context, index) {
                final ModelUser data = blocUser.listUser[index];
                return GestureDetector(
                  onTap: () {
                    blocUser.idUser = data.id;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(id: data.id)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: CreditCard(
                      cardNumber: data.phone,
                      cardExpiry: "10/25",
                      cardHolderName: data.name,
                      cvv: "456",
                      bankName: data.company.name,
                      cardType: CardType
                          .masterCard, // Optional if you want to override Card Type
                      showBackSide: false,
                      frontBackground: CardBackgrounds.black,
                      backBackground: CardBackgrounds.white,
                      showShadow: true,
                    ),
                  ),
                );
              },
            ),
    );
  }

  DetailPage({int id}) {}
}
