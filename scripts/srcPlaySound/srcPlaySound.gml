/// @function                                           scr_playSound
/// @param  {Asset.GMSound}         soundName           The sound asset to play
/// @param  {bool}                  shouldLoop          Should the sound loop ?
/// @param  {bool}                  isRandom            Should the pitch be randomized ?
/// @param  {real}                  pitchMin            Minimum pitch value if isRandom (ex: 0.8)
/// @param  {real}                  pitchMax            Maximum pitch value if isRandom (ex: 1.2)
/// @param  {real}                  fadeInDuration      Fade in duration in ms, 0 for no fade
/// @param  {real}                  volume              Base volume from 0 to 1
/// @returns {Id.SoundInstance}                         The sound instance to manipulate later
/// @description                                        Play a sound with loop, random pitch and fade in options

function srcPlaySound(soundName, shouldLoop, isRandom, pitchMin, pitchMax, fadeInDuration, volume) {
    
    var soundInstance = audio_play_sound(soundName, 1, shouldLoop);
 
    audio_sound_gain(soundInstance, volume, 0);
  
    if (isRandom) {
        var randomPitch = random_range(pitchMin, pitchMax);
        audio_sound_pitch(soundInstance, randomPitch);
    }
    

    if (fadeInDuration > 0) {
        audio_sound_gain(soundInstance, 0, 0);
        audio_sound_gain(soundInstance, volume, fadeInDuration);
    }
    
    return soundInstance;
}