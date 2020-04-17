import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTX;
  NewTransaction(this.addTX);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final tileControler = TextEditingController();

  final amounteControler = TextEditingController();

  void SubmitData() {
    final tileSubmit=tileControler.text;
    final amountSubmit= double.parse(amounteControler.text);
    if(tileSubmit.isEmpty||amountSubmit<=0){
      return;
    }
    widget.addTX(tileSubmit,amountSubmit);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Tile'),
              controller: tileControler,
              onSubmitted: (_)=>SubmitData,
//                    onChanged: (value){
//                      TileInput=value;
//                    },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amounteControler,
              keyboardType: TextInputType.number,
onSubmitted: (_)=>SubmitData,
//                    onChanged: (val)=>AmountInput=val,
            ),
            FlatButton(
              onPressed: SubmitData,
              child: Text("Add"),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
