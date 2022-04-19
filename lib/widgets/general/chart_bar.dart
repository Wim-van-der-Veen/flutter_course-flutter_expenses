import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String _value;
  final String _label;
  final double _percentage;

  const ChartBar(this._label, this._percentage, this._value, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text(_value)),
        const SizedBox(height: 4),
        SizedBox(
          width: 20,
          height: 60,
          //decoration: const BoxDecoration(color: Colors.pink),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                ),
              ),
              FractionallySizedBox(
                alignment: Alignment.bottomCenter,
                widthFactor: 1,
                heightFactor: _percentage,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(_label),
      ],
    );
  }
}
