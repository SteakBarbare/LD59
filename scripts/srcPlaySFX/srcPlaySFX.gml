/// @function                                srcPlaySFX(SFXName);
/// @param  {string}  SFXName                Name of the sound to play
/// @description                            Takes a sound name and plays a random sound for the given name

function srcPlaySFX(SFXName){
    
    var randomSFXIndex = 1;
    var maxSFXIndex = 1;
    var soundAsset = asset_get_index("snd" + SFXName + string(maxSFXIndex));
    
    // List the number of corresponding songs
    while(soundAsset > -1){
        maxSFXIndex++;
        soundAsset = asset_get_index("snd" + SFXName + string(maxSFXIndex));
    }
    maxSFXIndex--;
    
    // If none are found, log the error
    // Otherwise, play a random song with the given name
    if(maxSFXIndex == 0){
        show_debug_message("No sound found for the given SFX Name {0}", SFXName);
    }else{
        randomSFXIndex = irandom_range(1, maxSFXIndex);
        audio_play_sound(asset_get_index("snd" + SFXName + string(randomSFXIndex)), 1, false);
    }
}