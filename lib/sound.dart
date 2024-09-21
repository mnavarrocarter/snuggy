import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:audioplayers/audioplayers.dart';

@immutable
class SoundWidget extends StatefulWidget {
  final String title;
  final String asset;
  final double volume;
  final bool playing;

  const SoundWidget({
    required this.title,
    required this.asset,
    this.volume = 0.2,
    this.playing = false,
    super.key
  });

  @override
  State<SoundWidget> createState() => _SoundWidgetState();
}

class _SoundWidgetState extends State<SoundWidget> {
  final AudioPlayer _player = AudioPlayer();
  final ValueNotifier<bool> _playing = ValueNotifier(false);
  final ValueNotifier<double> _volume = ValueNotifier(0.2);

  @override
  void initState() {
    super.initState();
    
    // Register callbacks for AudioPlayer
    _playing.addListener(_startOrStopPlayback);
    _volume.addListener(_changePlaybackVolume);
    
    // Make the player loop
    _player.setReleaseMode(ReleaseMode.loop);
    
    // Initialize the state to the passed widget values
    _playing.value = widget.playing;
    _volume.value = widget.volume;
  }

  @override
  void dispose() {
    _playing.dispose();
    _volume.dispose();
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
            onTap: _onIconTapped,
            child: SvgPicture.asset(
              "assets/icons/${widget.asset}.svg",
              color: _playing.value ? Colors.indigo : Colors.black26,
              width: 62,
              height: 62,
            ),
          ),
          Text(widget.title),
          Slider(
            value: _volume.value,
            onChanged: _playing.value ? _onSliderChange : null,
            max: 1.0,
            min: 0,
          )
        ],
      );
  }

  void _onIconTapped() {
    setState(() {
      _playing.value = !_playing.value;
    });
  }

  void _onSliderChange(double vol) {
    setState(() {
      _volume.value = vol;
    });
  }
  
  void _startOrStopPlayback() {
    if (_playing.value) {
      _player.play(AssetSource("sounds/${widget.asset}.ogg"), volume: _volume.value);
    } else {
      _player.stop();
    }
  }

  void _changePlaybackVolume() {
    _player.setVolume(_volume.value);
  }
}