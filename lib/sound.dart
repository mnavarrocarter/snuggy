import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@immutable
class SoundWidget extends StatefulWidget {
  final String title;
  final String asset;

  const SoundWidget({
    required this.title,
    required this.asset,
    super.key
  });

  @override
  State<SoundWidget> createState() => _SoundWidgetState();
}

class _SoundWidgetState extends State<SoundWidget> {
  bool _isActive = false;
  double _volume = 20;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: _onIconPressed,
            child: SvgPicture.asset(
              "assets/icons/${widget.asset}.svg",
              color: _isActive ? Colors.indigo : Colors.black26,
              width: 80,
              height: 80,
            ),
          ),
          Text(widget.title),
          Slider(
            value: _volume,
            onChanged: _isActive ? _onVolumeChanged : null,
            max: 100,
            min: 0,
          )
        ],
      ),
    );
  }

  void _onVolumeChanged(double vol) {
    setState(() {
      _volume = vol;
    });
  }

  void _onIconPressed() {
    setState(() {
      _isActive = !_isActive;
    });
  }
}