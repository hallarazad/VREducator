using UnityEngine;
using System.Collections;


public class GameControl : MonoBehaviour {

	public string audioLanguage;

	public string AudioLanguage {
		get { 
			return audioLanguage;
		}
		set { 
			audioLanguage = value;
		}
	}

	public static GameControl gameControl;


	void Awake() {
		
		audioLanguage = "english";

		if (gameControl == null) {

			DontDestroyOnLoad (gameObject);

			gameControl = this;


		} else if (gameControl != this) {

			Destroy (gameObject);
		}
	}

	// Use this for initialization
	void Start () {


	
	}

	public static AudioClip SelectAudioClip(AudioClip[] localisedAudioClips, string audioNumber) {

		for (int i = 0; i < localisedAudioClips.Length; i++) {
			if (localisedAudioClips [i].name.EndsWith (audioNumber)) {
				return localisedAudioClips [i];
			}
		}

		return null;
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
