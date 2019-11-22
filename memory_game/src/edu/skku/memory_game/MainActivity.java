package edu.skku.memory_game;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.Toast;
import edu.skku.memory_game_fpgalcd_jnidriver.fpgalcdJNIDriver;

class ComparatorMyIntSort implements Comparator<Integer> {

	@Override
	public int compare(Integer o1, Integer o2) {
		if (o1 > o2)
			return -1;
		if (o1 < o2)
			return 1;
		return 0;
	}
}

public class MainActivity extends ActionBarActivity {
	Button start;
	boolean started = false;
	Button reset;
	Button submit;
	ImageButton button1;
	ImageButton button2;
	ImageButton button3;
	ImageButton button4;
	int state[];
	ArrayList<Integer> scoreBoard = new ArrayList<Integer>();
	int input[];
	int clickNum = 0;
	int stage = 0;
	int score = 0;
	// jnidriver list
	fpgalcdJNIDriver lcdDriver = new fpgalcdJNIDriver();
	
	public void generateState(int stage) {
		state = new int[stage];
		for (int i = 0; i < stage; i++) {
			state[i] = (int) (Math.random() * 4) + 1;
		}
	}

	public static int[] convertIntegers(ArrayList<Integer> integers) {
		int[] ret = new int[integers.size()];
		for (int i = 0; i < ret.length; i++) {
			ret[i] = integers.get(i).intValue();
		}
		return ret;
	}

	public void stageReady(int stage) {
		generateState(stage);
		Toast.makeText(getApplicationContext(),
				Arrays.toString(state).replaceAll("[^0-9]", ""),
				Toast.LENGTH_LONG).show();
	}

	private void scoreboardSet() {
		scoreBoard.add(score);
		Collections.sort(scoreBoard);
		Collections.reverse(scoreBoard);
		final String str1 = "1st: " + String.valueOf((int)scoreBoard.get(0));
		String str2 = "2nd: None";
		
		lcdDriver.clear();
		lcdDriver.print1Line(str1);
		if (scoreBoard.size() >= 2) {
			str2 = "2nd: " + String.valueOf((int)scoreBoard.get(1));
			
		}
		lcdDriver.print2Line(str2);
	}

	private boolean startCheck() {
		if (!started) {
			Toast.makeText(getApplicationContext(), "You should start first",
					Toast.LENGTH_LONG).show();
			return false;
		}
		return true;
	}
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		button1 = (ImageButton) findViewById(R.id.ImageButton01);
		button2 = (ImageButton) findViewById(R.id.ImageButton02);
		button3 = (ImageButton) findViewById(R.id.ImageButton03);
		button4 = (ImageButton) findViewById(R.id.ImageButton04);
		start = (Button) findViewById(R.id.start);
		reset = (Button) findViewById(R.id.reset);
		submit = (Button) findViewById(R.id.submit);

		start.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View arg0) {
				if (started)
					return;
				started = true;
				input = new int[++stage];

				stageReady(stage);

			}
		});
		reset.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View arg0) {
				clickNum = 0;
				for (int i = 0; i < stage; i++) {
					input[i] = 0;
				}
				Toast.makeText(getApplicationContext(),
						"Reset complete click again!", Toast.LENGTH_LONG)
						.show();
			}
		});
		button1.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View arg0) {
				// Toast.makeText(getApplicationContext(), "button1",
				// Toast.LENGTH_LONG).show();
				if (!startCheck() || clickNum >= stage)
					return;
				if (clickNum - 1 == stage)
					return;
				input[clickNum++] = 1;
			}
		});

		button2.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View arg0) {
				// Toast.makeText(getApplicationContext(), "button2",
				// Toast.LENGTH_LONG).show();
				if (!startCheck() || clickNum >= stage)
					return;
				if (clickNum - 1 == stage)
					return;
				input[clickNum++] = 2;
			}
		});
		button3.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View arg0) {
				// Toast.makeText(getApplicationContext(), "button3",
				// Toast.LENGTH_LONG).show();
				if (!startCheck() || clickNum >= stage)
					return;
				if (clickNum - 1 == stage)
					return;
				input[clickNum++] = 3;
			}
		});
		button4.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View arg0) {
				// Toast.makeText(getApplicationContext(), "button4",
				// Toast.LENGTH_LONG).show();
				if (!startCheck() || clickNum >= stage)
					return;
				if (clickNum - 1 == stage)
					return;
				input[clickNum++] = 4;
			}
		});
		submit.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View arg0) {
				if (!startCheck())
					return;
				boolean success = false;
				for (int i = 0; i < stage; i++) {
					if (input[i] != state[i]) {
						break;
					}
					if (i == stage - 1) {
						success = true;
					}
				}

				input = null;
				state = null;
				score = stage - 1;
				if (!success) {
					Toast.makeText(getApplicationContext(), "Game Over",
							Toast.LENGTH_LONG).show();
					Toast.makeText(getApplicationContext(),
							"Your final score is " + String.valueOf(score),
							Toast.LENGTH_LONG).show();
					scoreboardSet();
					stage = 0;
					score = 0;
					clickNum = 0;
					started = false;
					return;
				}
				clickNum = 0;
				started = false;
				Toast.makeText(getApplicationContext(),
						"stage clear, click start!", Toast.LENGTH_LONG).show();
			}
		});
	}
	
	@Override
	protected void onResume() {
		lcdDriver.initialize();
		super.onResume();
	}

	@Override
	protected void onPause() {
		lcdDriver.off();
		super.onPause();
	}
}