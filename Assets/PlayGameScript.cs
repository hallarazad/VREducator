using UnityEngine;
using System.Collections;
using UnityEngine.SceneManagement;

public class PlayGameScript : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}

	public void PlayLesson() {
		SceneManager.LoadScene ("Lesson1");
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
