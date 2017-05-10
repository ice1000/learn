using UnityEngine;

namespace Assets.Scripts
{
	public class Camera : MonoBehaviour
	{
		public GameObject Player;
		private Vector3 _offset;

		// ReSharper disable once UnusedMember.Local
		// ReSharper disable once ArrangeTypeMemberModifiers
		public void Start()
		{
//			player = gameObject;
			_offset = transform.position - Player.transform.position;
		}

		// ReSharper disable once UnusedMember.Local
		// ReSharper disable once ArrangeTypeMemberModifiers
		public void LateUpdate()
		{
			transform.position = Player.transform.position + _offset;
		}
	}
}
