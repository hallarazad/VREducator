using UnityEngine;
using System.Collections;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class KeyPressSceneControl : MonoBehaviour {

	public int level = 0;

	public Canvas keyboardCanvas;
	public Canvas scancodeCanvas;

	public GameObject generatedScancode;
	public GameObject interrupt;

	private AudioClip[] localisedAudioClips;

	public AudioSource instructionsAudioSource;

	public GameObject player;

	public GameObject arrowPointer;
	GameObject pointerLookAt;

	public GameObject PlayerText;

	bool showDirection;

	string[] audioSeq;


	// Use this for initialization
	IEnumerator Start () {



		//load the localised voice instructions
		//GameControl gameControl = new GameControl ();
		localisedAudioClips =  Resources.LoadAll<AudioClip> ("LocalisedAudio/"+GameControl.gameControl.AudioLanguage+"/KeyPressScene");

		//wait for 1 second
		yield return new WaitForSeconds (1);

		audioSeq = new string[] { "player_FreezeWalking", "01", "02", "player_UnfreezeWalking" };
		StartCoroutine (PlayMultipleVoiceInstructions (audioSeq));




	
	}

	public void ChangeAudioLanguage(string Language) {
		localisedAudioClips =  Resources.LoadAll<AudioClip> ("LocalisedAudio/"+Language+"/KeyPressScene");
	}

	void SetPointerLookAt(GameObject directionObj) {

		pointerLookAt = directionObj;
	}



	//player position freeze and unfreeze
	public void FreezePosition() {

		PlayerText.GetComponent<MeshRenderer> ().enabled = false;

		UnityStandardAssets.Characters.FirstPerson.FirstPersonController fps = player.GetComponent<UnityStandardAssets.Characters.FirstPerson.FirstPersonController> ();

	}

	public void ShowKeyboardCanvas() {
		keyboardCanvas.enabled = true;
	}

	public void HideKeyboardCanvas() {
		keyboardCanvas.enabled = false;
	}

	public void ShowScancodeCanvas() {
		if (level == 1) {
			scancodeCanvas.enabled = true;
		}

	}

	public void HideScancodeCanvas() {
		scancodeCanvas.enabled = false;
	}

	//generate scan code if it is not generated
	public void ShowGeneratedScancode() {
		if (level == 0 && !instructionsAudioSource.isPlaying) {

			ShowCanvas ("ScancodeCanvas");

			generatedScancode.SetActive (true);
			level = Levels.LEVEL_SCANCODE;

			audioSeq = new string[] {"player_FreezeWalking", "05", "03", "04", "player_UnfreezeWalking"};

			StartCoroutine( PlayMultipleVoiceInstructions (audioSeq) );
		}
	}

	//method to play multiple voice instructions
	IEnumerator PlayMultipleVoiceInstructions(string[] audioNumbers) {

		for (int i = 0; i < audioNumbers.Length; i++) {

			Debug.Log ("Sequence: " + audioNumbers [i]);

			if (audioNumbers [i].Contains ("wait")) {

				//Debug.Log ("String: " + audioNumbers [i].Substring (audioNumbers [i].LastIndexOf ('_')));

				//parse the string to int
				yield return new WaitForSeconds (int.Parse (audioNumbers [i].Substring (audioNumbers [i].LastIndexOf ('_') + 1)));

				continue;
			
			} else if (audioNumbers [i].Contains ("call")) {

				SendMessage (audioNumbers [i].Substring (audioNumbers [i].LastIndexOf ('_') + 1), SendMessageOptions.DontRequireReceiver);
				continue;
			
			} else if (audioNumbers [i].Contains ("player")) {

				if (audioNumbers [i].Contains ("Freeze")) {
					PlayerText.GetComponent<MeshRenderer> ().enabled = true;
				} else if(audioNumbers [i].Contains ("Unfreeze")) {
					PlayerText.GetComponent<MeshRenderer> ().enabled = false;
				}


				player.SendMessage (audioNumbers [i].Substring (audioNumbers [i].LastIndexOf ('_') + 1), SendMessageOptions.DontRequireReceiver);
			
			} else {

				Debug.Log (instructionsAudioSource.clip);

				instructionsAudioSource.clip = GameControl.SelectAudioClip (localisedAudioClips, audioNumbers [i]);
				instructionsAudioSource.Play ();
				yield return new WaitForSeconds (instructionsAudioSource.clip.length);
			}
		}


	}

	//method to play any sound
	public void PlayVoiceInstruction(string audioNumber) {
		if (!instructionsAudioSource.isPlaying) {
			StartCoroutine (PlaySound (audioNumber));
		}
	}

	//coroutine to play any sound
	IEnumerator PlaySound(string audioNumber) {

		instructionsAudioSource.clip = GameControl.SelectAudioClip(localisedAudioClips, audioNumber);
		instructionsAudioSource.Play ();
		yield return new WaitForSeconds (instructionsAudioSource.clip.length);


	}

	public void PickUpScancode() {

		if (!instructionsAudioSource.isPlaying) {


			HideCanvas ("ScancodeCanvas");

			//stop all other coroutines
			StopAllCoroutines ();

			audioSeq = new string[] { "05" };
			StartCoroutine (PlayMultipleVoiceInstructions (audioSeq));

			//change the level to Keyboard Controller and hide the scancode canvas
			level = Levels.LEVEL_KEYBOARD_CONTROLLER;
			scancodeCanvas.enabled = false;

			//change parent of scancode to Head
			GameObject head = GameObject.Find ("Head");
			generatedScancode.transform.parent = head.transform;

			//set new rotation and position of scancode
			generatedScancode.transform.rotation = head.transform.rotation;
			generatedScancode.transform.position = new Vector3 (player.transform.position.x + 0.3f, player.transform.position.y - 0.5f, player.transform.position.z - 1);

			//show arrow pointer
			ShowPointer ();

			SetPointerLookAt (GameObject.Find ("KeyboardControllerBoard"));

		}
	}

	public void PickUpInterrupt() {

		if (!instructionsAudioSource.isPlaying) {


			HideCanvas ("InterruptCanvas");

			//Destroy(GameObject.Find("InterruptCanvas"));

			//stop all other coroutines
			StopAllCoroutines ();

			//audioSeq = new string[] { "10" };
			//StartCoroutine (PlayMultipleVoiceInstructions (audioSeq));

			//change the level to Keyboard Controller and hide the scancode canvas
			level = Levels.LEVEL_CPU;
			//interruptCanvas.enabled = false;

			//change parent of interrupt to Head
			GameObject head = GameObject.Find ("Head");
			interrupt.transform.parent = head.transform;

			//set new rotation and position of interrupt
			interrupt.transform.rotation = head.transform.rotation;
			//set the interrupt position so it fits the head view
			interrupt.transform.localPosition = new Vector3 (-0.01f, -0.8f, 1.1f);

			//show arrow pointer
			ShowPointer ();

			SetPointerLookAt (GameObject.Find ("CPU"));

		}
	}

	void ShowPointer() {
		showDirection = true;

		//show arrow pointer mesh
		GameObject.Find("ArrowPointer").GetComponent<MeshRenderer> ().enabled = true;
	}

	void HidePointer() {
		showDirection = false;

		//hide arrow pointer mesh
		GameObject.Find("ArrowPointer").GetComponent<MeshRenderer> ().enabled = false;
	}
	
	// Update is called once per frame
	void Update () {

		if (showDirection) {
			arrowPointer.transform.LookAt (pointerLookAt.transform.position);
		}
		
	}

	public void ShowCanvas(string canvas) {
		GameObject.Find (canvas).GetComponent<Canvas> ().enabled = true;
	}

	public void HideCanvas(string canvas) {
		GameObject.Find (canvas).GetComponent<Canvas> ().enabled = false;
	}


	public void KeyboardControllerTriggered() {
		if (level == Levels.LEVEL_KEYBOARD_CONTROLLER) {
			level = Levels.LEVEL_INTERRUPT;

			Destroy (generatedScancode);


			audioSeq = new string[] {"call_HidePointer", "player_FreezeWalking", "05", "08", "09", "player_UnfreezeWalking", "call_GenerateInterrupt", "call_ShowPointer", "10"};
			StartCoroutine( PlayMultipleVoiceInstructions (audioSeq) );

			SetPointerLookAt (GameObject.Find ("CPU"));

		}
	}

	public void CPUTriggered() {
		if (level == Levels.LEVEL_CPU) {
			level = Levels.LEVEL_OS;

			Destroy (interrupt);

			audioSeq = new string[] {"call_HidePointer", "player_FreezeWalking", "13", "12", "14", "15", "player_UnfreezeWalking", "call_ShowPointer"};
			StartCoroutine( PlayMultipleVoiceInstructions (audioSeq) );

			SetPointerLookAt (GameObject.Find ("OSBoard"));
		}
	}

	public void OSTriggered() {
		if (level == Levels.LEVEL_OS) {
			level = Levels.LEVEL_OUTPUT;

			audioSeq = new string[] {"call_HidePointer", "player_FreezeWalking", "17", "18", "call_AddInputLetterToWindow", "19", "20", "22", "player_UnfreezeWalking", "call_ShowPointer"};
			StartCoroutine( PlayMultipleVoiceInstructions (audioSeq) );

			SetPointerLookAt (GameObject.Find ("OSBoard"));
		}
	}

	public void AddInputLetterToWindow() {
		//hide the blank word so word with letter is shown
		GameObject.Find ("MSWordBlank").GetComponent<SpriteRenderer> ().enabled = false;
	}

	public void GenerateInterrupt() {
		interrupt.SetActive (true);

	}

	public void ExitLesson() {
		SceneManager.LoadScene ("TitleScene");
	}

}
