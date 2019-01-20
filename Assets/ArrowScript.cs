using UnityEngine;
using System.Collections;

public class ArrowScript : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void FixedUpdate () {
	
		transform.LookAt (GameObject.Find("CPU").transform.position);

	}
}
