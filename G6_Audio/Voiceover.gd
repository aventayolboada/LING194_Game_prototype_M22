extends PopupDialog

var dict = {
  "nùnì": res://G6_Audio/SoundClipsIDWords/1nuni.wav,
  "iti": res://G6_Audio/SoundClipsIDWords/2iti.wav,
  "kuàntxií": res://G6_Audio/SoundClipsIDWords/3kuantxii.wav,
  "yòò": res://G6_Audio/SoundClipsIDWords/4yoo.wav,
  "txìkuìí": res://G6_Audio/SoundClipsIDWords/5txikuii.wav,
  "ntuchì": res://G6_Audio/SoundClipsIDWords/6ntuchi.wav,
  "ñu'un": res://G6_Audio/SoundClipsIDWords/7ñu'u.wav,
  "shìtà": res://G6_Audio/SoundClipsIDWords/8shita.wav,
  "itùn": res://G6_Audio/SoundClipsIDWords/9itun.wav,
  "tù'un ntá'ví": res://G6_Audio/SoundClipsIDWords/10tu'unnta'vi.wav,
  "txokó": res://G6_Audio/SoundClipsIDWords/11xoko.wav,
  "laa": res://G6_Audio/SoundClipsIDWords/12laa.wav,
  "ntxìvì": res://G6_Audio/SoundClipsIDWords/13ntxivi.wav,
  "txaká": res://G6_Audio/SoundClipsIDWords/14txaka.wav,
  "tù'un": res://G6_Audio/SoundClipsIDWords/18tu'un.wav,
  "yavì": res://G6_Audio/SoundClipsIDWords/19yavi.wav,
  "xìkuaa": res://G6_Audio/SoundClipsIDWords/20xikuaa.wav,
  "yàà": res://G6_Audio/SoundClipsIDWords/21yaa.wav,
  "ya'à": res://G6_Audio/SoundClipsIDWords/22ya'a.wav,
  "sàvì": res://G6_Audio/SoundClipsIDWords/23savi.wav,
  "nìì": res://G6_Audio/SoundClipsIDWords/24nii.wav,
  "ve'e": res://G6_Audio/SoundClipsIDWords/25ve'e.wav,
  "yikìn": res://G6_Audio/SoundClipsIDWords/26yikin.wav,
  "txiki": res://G6_Audio/SoundClipsIDWords/27txiki.wav,
  "yìì": res://G6_Audio/SoundClipsIDWords/28yii.wav,
  "kòò": res://G6_Audio/SoundClipsIDWords/29koo.wav,
  "ñù'mà": res://G6_Audio/SoundClipsIDWords/30ñu'ma.wav,
  "txìnana": res://G6_Audio/SoundClipsIDWords/31txinana.wav,
  "so'va": res://G6_Audio/SoundClipsIDWords/32so'va.wav,
  "kùñu": res://G6_Audio/SoundClipsIDWords/33kuñu.wav,
  "yikì": res://G6_Audio/SoundClipsIDWords/34yiki.wav,
  "txìñùù": res://G6_Audio/SoundClipsIDWords/35txiñuu.wav,
  "yo'o": res://G6_Audio/SoundClipsIDWords/36yo'o.wav,
  "yoso": res://G6_Audio/SoundClipsIDWords/37yoso.wav,
  "nùtxí": res://G6_Audio/SoundClipsIDWords/38nutxi.wav,
  "ñuu": res://G6_Audio/SoundClipsIDWords/40ñuu.wav,
  "tachi": res://G6_Audio/SoundClipsIDWords/41tachi.wav,
  "xoo": res://G6_Audio/SoundClipsIDWords/43xoo.wav,
  "lá'và": res://G6_Audio/SoundClipsIDWords/45la'va.wav,
  "kìsi": res://G6_Audio/SoundClipsIDWords/47kisi.wav,
  "iñu": res://G6_Audio/SoundClipsIDWords/49iñu.wav,
  "tùùn": res://G6_Audio/SoundClipsIDWords/50tuun.wav,
  "leka": res://G6_Audio/SoundClipsIDWords/52leka.wav,
  "txìín": res://G6_Audio/SoundClipsIDWords/53txiin.wav,
  "txìntóò": res://G6_Audio/SoundClipsIDWords/54txintoo.wav,
  "kìì": res://G6_Audio/SoundClipsIDWords/55kii.wav,
  "kaka": res://G6_Audio/SoundClipsIDWords/56kaka.wav,
  "nchishì": res://G6_Audio/SoundClipsIDWords/57nchishi.wav,
  "txìna": res://G6_Audio/SoundClipsIDWords/59txina.wav,
  "sapo": res://G6_Audio/SoundClipsIDWords/60sapo.wav,
  "txìsu'mà": res://G6_Audio/SoundClipsIDWords/61txisu'ma.wav,
  "ntxivi": res://G6_Audio/SoundClipsIDWords/62ntxivi.wav,
  "viko": res://G6_Audio/SoundClipsIDWords/63viko.wav,
  "yivi": res://G6_Audio/SoundClipsIDWords/64yivi.wav,
  "ichi": res://G6_Audio/SoundClipsIDWords/65ichi.wav,
  "kitxi": res://G6_Audio/SoundClipsIDWords/66kitxi.wav,
  "lònchi": res://G6_Audio/SoundClipsIDWords/67lonchi.wav,
  "vìkò": res://G6_Audio/SoundClipsIDWords/68viko.wav,
  "sanii": res://G6_Audio/SoundClipsIDWords/69sanii.wav,
  "txiñuuso'ola'la": res://G6_Audio/SoundClipsIDWords/70txiñuuso'ola'la.wav,
  "yixàn": res://G6_Audio/SoundClipsIDWords/71yixan.wav,
  "ñùñù": res://G6_Audio/SoundClipsIDWords/72ñuñu.wav,
  "isi": res://G6_Audio/SoundClipsIDWords/73isi.wav,
  "txìka": res://G6_Audio/SoundClipsIDWords/74txika.wav,
  "yìtxa": res://G6_Audio/SoundClipsIDWords/77yitxa.wav,
  "lánko": res://G6_Audio/SoundClipsIDWords/78lanko.wav,
  "ntoo": res://G6_Audio/SoundClipsIDWords/79ntoo.wav,
  "ntaki": res://G6_Audio/SoundClipsIDWords/80ntaki.wav
  }
  
func play_voiceover(word):
  $AudioStreamPlayer.stream.loop = false
  $AudioStreamPlayer.play(dict[word])
  
func _input(event, word):
  if event is InputEventMouseButton and word.pressed:
    if event.button_index == BUTTON_RIGHT and event.pressed:
        play_voiceover(word)
        

