package edu.skku.memory_game;

import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.Toast;

public class MainActivity extends ActionBarActivity {
	Button start;
	Button reset;
	ImageButton button1;
	ImageButton button2;
	ImageButton button3;
	ImageButton button4;
	boolean[] state;
	
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
		
		button1.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				Toast.makeText(getApplicationContext(), "button1", Toast.LENGTH_LONG).show();
				
			}
		});
		
		button2.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				
				
			}
		});
	}
}
