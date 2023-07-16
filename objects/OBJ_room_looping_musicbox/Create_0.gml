 /*audio_play_sound(great_hylia_theme,10,true);*/
audio_stop_sound(all);
var room_music = ds_map_create();
music_volume = 1;

ds_map_add(room_music, RM_Title_Screen, musique_6__main_theme_);
ds_map_add(room_music, RM_TEST_ROOM, musique_4__d__sert_gerudo_);
//ds_map_add(room_music, "apple", castle_theme);

 
 // Initialize the music player object
music_volume = 1;   // set the default volume to maximum (1.0)

// Play the starting music
audio_stop_all()
//sleep(1000);   // Wait for one second
alarm[0] = room_speed * 1;   // Set timer for 1 second
// Handle timer event
if (alarm[0] == 0) {
    // Code to execute after 1 second
}


audio_play_sound(ds_map_find_value(room_music, room), music_volume, true);
