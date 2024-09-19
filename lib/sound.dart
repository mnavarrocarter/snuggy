import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:audioplayers/audioplayers.dart';

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
  final AudioPlayer _player = AudioPlayer();
  bool _isActive = false;
  double _volume = 20;

  @override
  void initState() {
    super.initState();
    _player.setReleaseMode(ReleaseMode.loop);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: _onIconPressed,
            child: SvgPicture.asset(
              "assets/icons/${widget.asset}.svg",
              color: _isActive ? Colors.indigo : Colors.black26,
              width: 62,
              height: 62,
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
      );
  }

  void _onVolumeChanged(double vol) {
    setState(() {
      _volume = vol;
      _player.setVolume(vol / 100);
    });
  }

  void _onIconPressed() {
    setState(() {
      _isActive = !_isActive;

      if (_isActive) {
        _player.play(AssetSource("sounds/${widget.asset}.ogg"), volume: _volume / 100);
      } else {
        _player.stop();
      }
    });
  }
}