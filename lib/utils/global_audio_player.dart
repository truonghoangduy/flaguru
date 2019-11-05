import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../models/SettingsHandler.dart';

class GlobalAudioPlayer with WidgetsBindingObserver {
  AudioCache _cache = AudioCache(prefix: 'audio/');
  AudioPlayer _musicPlayer;
  AudioPlayer _soundPlayer;

  SettingsHandler _settings;

  bool _isResumed = true;
  bool _isPlaying = false;

  GlobalAudioPlayer(this._settings) {
    WidgetsBinding.instance.addObserver(this);
  }

//  final _musicNames = ['elevate.mp3'];
//  final _soundNames = ['right.m4a', 'wrong.mp3', ];
//
//  Future loadAllAudio() async {
//    await _cache.loadAll([..._musicNames, ..._soundNames]);
//  }

  Future playMusic() async {
    if (!_settings.isMusicEnabled) return;
    if (_musicPlayer == null)
      _musicPlayer = await _cache.loop('elevate.mp3')
        ..setVolume(0.2);
    else
      _musicPlayer.resume();
  }

  Future playSoundRight() async {
    if (soundMuted) return;
    _soundPlayer?.stop();
    _soundPlayer = await _cache.play('right.m4a')
      ..setVolume(0.8);
  }

  Future playSoundWrong() async {
    if (soundMuted) return;
    _soundPlayer?.stop();
    _soundPlayer = await _cache.play('wrong.mp3');
  }

  Future playSoundResult() async {
    if (soundMuted) return;
    _soundPlayer = await _cache.play('result.mp3')
      ..setVolume(0.5);
  }

  Future playSoundScore() async {
    if (soundMuted) return;
    _soundPlayer = await _cache.play('result.mp3');
  }

  Future playSoundLetsGo() async {
    if (soundMuted) return;
    _soundPlayer = await _cache.play('okletsgo.mp3')
      ..setVolume(0.6);
  }

  Future playSoundTick() async {
    if (soundMuted) return;
    _soundPlayer = await _cache.play('tick.mp3')
      ..setVolume(0.6);
  }

  bool get soundMuted => !_settings.isSoundEnabled || !_isResumed;

  void pauseMusic() {
    _musicPlayer?.pause();
  }

  void pauseSound() {
    _soundPlayer?.pause();
  }

  void stopAll() {
    _soundPlayer?.stop();
    _musicPlayer?.stop();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      pauseMusic();
      pauseSound();
      _isResumed = false;
      if (_soundPlayer?.state == AudioPlayerState.PLAYING) _isPlaying = true;
//      print(_soundPlayer.state);
    } else {
      _isResumed = true;
      if (_settings.isMusicEnabled) {
        _musicPlayer?.resume();
      }
      if (_settings.isSoundEnabled && _isPlaying) {
        _soundPlayer?.resume();
        _isPlaying = false;
      }
    }

    super.didChangeAppLifecycleState(state);
  }
}

GlobalAudioPlayer audioPlayer;
