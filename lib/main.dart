import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: TipMe(),
));

class TipMe extends StatefulWidget {
  const TipMe({Key? key}) : super(key: key);

  @override
  State<TipMe> createState() => _TipMeState();
}

class _TipMeState extends State<TipMe> {
  double _billAmount = 0.0;
  double _tipPercentage = 15.0;

  void _updateTipPercentage(double value) {
    setState(() {
      _tipPercentage = value;
    });
  }

  void _updateBillAmount(String value) {
    setState(() {
      _billAmount = double.tryParse(value) ?? 0.0;
    });
  }

  int _calculateTipAmount (){
    return (_billAmount * (_tipPercentage/100)).toInt();
  }

  int _calculateTotalAmount(){
    return (_billAmount + _calculateTipAmount()).toInt();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TIP ME CALCULATOR'),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20,),

          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "What's your bill amount?",
              border: OutlineInputBorder()
            ),
            onChanged: _updateBillAmount,
          ),

          const SizedBox(height: 20,),

          Text('Tip Percentage: ${_tipPercentage.toStringAsFixed(0)} %',
          style: const TextStyle(
            fontSize: 16
          ),),

          Slider(
              value: _tipPercentage,
              min: 0,
              max: 3,
              onChanged: _updateTipPercentage ),

          const SizedBox(height: 20,),
          
          Text('amount: ${_calculateTotalAmount().toStringAsFixed(2)}')
        ],
      ),
    );
  }
}
