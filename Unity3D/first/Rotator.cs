using System;
using UnityEngine;

namespace Assets.Scripts
{
	public class Rotator : MonoBehaviour
	{
		// ReSharper disable once UnusedMember.Local
		// ReSharper disable once ArrangeTypeMemberModifiers
		public void Update()
		{
			transform.Rotate(new Vector3(30, 35, 42) * Time.deltaTime);
		}
	}
}
