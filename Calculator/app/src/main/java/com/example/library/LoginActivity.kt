package com.example.library

import android.content.Intent
import android.os.Bundle
import android.view.View
import androidx.activity.ComponentActivity
import androidx.activity.enableEdgeToEdge
import androidx.databinding.DataBindingUtil
import com.example.calculator.R
import com.example.calculator.databinding.ActivityLoginBinding

class LoginActivity : ComponentActivity() {
    lateinit var binding : ActivityLoginBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

//        binding = ActivityLoginBinding.inflate(layoutInflater)
//        val view: View = binding.root
//        setContentView(view)

        setContentView(R.layout.activity_login)

        binding= DataBindingUtil.setContentView(this, R.layout.activity_login)

        binding.btnLogin.setOnClickListener {
            val intent = Intent(this,MainActivity::class.java)
            //intent.putExtra("title","Cities")
            startActivity(intent)
        }
    }
}
