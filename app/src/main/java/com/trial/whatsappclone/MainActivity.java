package com.trial.whatsappclone;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseException;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.auth.PhoneAuthCredential;
import com.google.firebase.auth.PhoneAuthProvider;

import java.util.concurrent.TimeUnit;

public class MainActivity extends AppCompatActivity {
    private EditText phoneNumber, code;
    private Button verify;
    private PhoneAuthProvider.OnVerificationStateChangedCallbacks callBacks;
    String verifycode;

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        FirebaseApp.initializeApp(this);
        userLoggedIn();
        phoneNumber = findViewById(R.id.phoneNumber);
        code = findViewById(R.id.code);
        verify = findViewById(R.id.verify);
        callBacks = new PhoneAuthProvider.OnVerificationStateChangedCallbacks() {
            @Override
            public void onVerificationCompleted(PhoneAuthCredential phoneAuthCredential) {
                signInWithCredentials(phoneAuthCredential);
            }

            @Override
            public void onVerificationFailed(FirebaseException e) {

            }

            @Override
            public void onCodeSent(@NonNull String s, @NonNull PhoneAuthProvider.ForceResendingToken forceResendingToken) {
                super.onCodeSent(s, forceResendingToken);
                verifycode = s;
                verify.setText("Verify Code");
            }
        };


        verify.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(verifycode!=null){
                    verifyWithCode(verifycode, code.getText().toString());
                }
                else {
                    startVerification();
                }
            }
        });
    }
    private void verifyWithCode(String verifycode, String code ){
        PhoneAuthCredential credential = PhoneAuthProvider.getCredential(verifycode,code);
        signInWithCredentials(credential);
    }

    private void signInWithCredentials(PhoneAuthCredential phoneAuthCredential) {
        FirebaseAuth.getInstance().signInWithCredential(phoneAuthCredential).addOnCompleteListener(this, new OnCompleteListener<AuthResult>() {
            @Override
            public void onComplete(@NonNull Task<AuthResult> task) {
                if(task.isSuccessful())
                    userLoggedIn();
            }
        });
    }

    private void userLoggedIn() {
        FirebaseUser user = FirebaseAuth.getInstance().getCurrentUser();
        if(user!=null){
            startActivity(new Intent(getApplicationContext(), HomePage.class));
            finish();
            return;
        }
    }

    private void startVerification(){
        PhoneAuthProvider.getInstance().verifyPhoneNumber(phoneNumber.getText().toString(),60, TimeUnit.SECONDS,this, callBacks);
    }
}
