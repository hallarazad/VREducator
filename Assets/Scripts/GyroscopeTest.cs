using UnityEngine;
using System.Collections;
using UnityStandardAssets.CrossPlatformInput;

public class GyroscopeTest : MonoBehaviour
{
	private Gyroscope gyro;

	void Start ()
	{

		Input.backButtonLeavesApp = true;

		/*
		if (SystemInfo.supportsGyroscope) {
			gyro = Input.gyro;
			gyro.enabled = true;
		}
		*/
	}

	void Update() {
		

	}

	void OnGUI()
	{
		/*
		GUILayout.Label ("Gyroscope attitude : " + gyro.attitude);
		GUILayout.Label("Gyroscope gravity : " + gyro.gravity);
		GUILayout.Label("Gyroscope rotationRate : " + gyro.rotationRate);
		GUILayout.Label("Gyroscope rotationRateUnbiased : " + gyro.rotationRateUnbiased);
		GUILayout.Label("Gyroscope updateInterval : " + gyro.updateInterval);
		GUILayout.Label ("Gyroscope userAcceleration : " + gyro.userAcceleration);
		*/
	}
}