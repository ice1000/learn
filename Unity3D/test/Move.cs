using UnityEngine;

namespace Assets.Scripts
{
	public class Move : MonoBehaviour
	{
		private Rigidbody _body;
		public float Speed = 1;
		private int _score;
		public TextMesh ScoreText;

		void Start()
		{
			_body = GetComponent<Rigidbody>();
			print("Unity start!");
			ShowScore();
		}

		void FixedUpdate()
		{
			_body.AddForce(new Vector3(Input.GetAxis("Horizontal"), 0.0F, Input.GetAxis("Vertical")) * Speed);
		}

		public void OnTriggerEnter(Collider c)
		{
			if (c.tag.Equals("Food"))
			{
				Destroy(c.gameObject);
				_score++;
				ShowScore();
			}
		}

		private void ShowScore()
		{
			ScoreText.text = "score = " + _score;
			if (_score >= 8) ScoreText.text += "\nYou win!";
		}
	}
}
