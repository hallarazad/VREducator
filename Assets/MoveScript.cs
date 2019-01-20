using UnityEngine;
using System.Collections;

public class MoveScript : MonoBehaviour {

	public GameObject target;
	float speed = 0.5f;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {

		float Distance = Vector3.Distance (target.transform.position, transform.position);



		float step = speed * Time.deltaTime;

		while (Distance >= 1.0f) {
			transform.position = Vector3.MoveTowards (transform.position, target.transform.position, step);
			Debug.Log (Distance);
			Distance = Vector3.Distance (target.transform.position, transform.position);
		}
	
	}
}
