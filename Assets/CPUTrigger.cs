using UnityEngine;
using System.Collections;

public class CPUTrigger : MonoBehaviour {

	public GameObject keyPressSceneController;

	// Use this for initialization
	void Start () {
	
	}

	void OnTriggerEnter(Collider collider) {
		keyPressSceneController.SendMessage ("CPUTriggered");
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
