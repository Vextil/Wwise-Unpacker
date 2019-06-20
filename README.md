# Wwise-Unpacker
Unpack game audio Wwise files (pck, bnk)

**This guide is for Windows-64bit only!** I'll be using the game Life is Strange **as an example**.

Here's the archive structure:

* Wwise Unpacker
  * MP3 (Unpacked MP3s)
  * OGG (Unpacked OGGs)
  * Game Files (PCK and BNK files)
  * Tools (Tools used for the unpacking process)
  * Unpack to MP3.bat
  * Unpack to OGG.bat
  
Now we have to find the audio files to unpack. Life is Strange uses Wwise audio so files are packaged in either .PCK or .BNK containers. 
You can just search for *.PCK or *.BNK but I prefer the following method: go to the game folder (C:/Program Files (x86)/Steam/steamapps/common/Life Is Strange) and search for "WwiseAudio" which will show you the audio folder for each chapter.

Inside each folder you will find the following types of files which are quite self explanatory:

* Music
* Ambiance
* Cutscene
* Sfx
* Voice files are inside "English(US)" in each folder, they start with "VO_" (Voice-over).

Keep in mind these are containers, inside each there could be either one or hundreds of audio files. Some of the largest VO containers have **over 500!** Fortunately they are all properly labeled with episode, character, location, action and mood after unpacking. 
For example: *VO_E2_2A.STM_15~Cue_E2_2A_Diner_ChloePuzzle02Happy_IGE_Chloe_200.ogg*

Find any containers you want to decode and copy them to the "Game Files" folder inside Wwise Unpacker (they can be either PCK or BNK, the unpacker handles it), then simply open "Unpack to MP3.bat" or "Unpack to OGG.bat" depending on which you like and it will do all the work for you. 
Once finished you can find all decoded files inside the "MP3" or "OGG" folder respectively.

**Things you should know about the decoder:**

* Depending on the number and size of the files it can take a while, let it run until you see the ASCII tornado.
* The decoder will offer to delete files in "Game Files" so you don't accidentally decode the same files again.
* Sometimes there can be filename conflicts while decoding (multiple files with the same name), just type "r" and hit enter on the command window when prompted. This will rename the files so you can keep all of them.
* When decoding MP3 files are first unpacked as OGG and then converted with FFmpeg and the LAME MP3 encoder. If you want the best quality possible don't use MP3, unpack it as OGG.
* The unpacker can be used for any game that uses Wwise audio, not only Life is Strange.

**I unpacked to .OGG for the best quality, how do I even open these files?**

You'll need a player that supports the format! Personally I use "foobar2000" but feel free to search around and find what's best for you.

---

If you end up doing something with the audio (videos for example) let me know, I really enjoy looking at other people's work. Hope this helped someone!
