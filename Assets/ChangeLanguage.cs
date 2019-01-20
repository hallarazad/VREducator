using UnityEngine;
using System.Collections;

public class ChangeLanguage : MonoBehaviour {

	Vector3 buttonPosition;


	// Use this for initialization
	void Start () {

		buttonPosition = new Vector3();
	
	}

	public void SwitchLanguage(string language) {

		GameControl.gameControl.AudioLanguage = language;

		buttonPosition = GameObject.Find ("SwitchTo"+language).transform.position;
		transform.position = new Vector3 (transform.position.x, buttonPosition.y, transform.position.z);

		Debug.Log ("Button position: " + GameObject.Find ("SwitchTo"+language).transform.position.ToString());


	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
