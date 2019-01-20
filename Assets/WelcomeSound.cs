using UnityEngine;
using System.Collections;

public class WelcomeSound : MonoBehaviour {

	// Use this for initialization
	void Start () {

		GetComponent<AudioSource> ().PlayDelayed (5);
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
