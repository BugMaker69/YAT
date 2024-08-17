package com.example.library

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.DataBindingUtil
import androidx.navigation.NavController
import androidx.navigation.fragment.NavHostFragment
import androidx.navigation.ui.NavigationUI.setupWithNavController
import com.example.calculator.R
import com.example.calculator.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    lateinit var binding: ActivityMainBinding
    lateinit var navController: NavController

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this, R.layout.activity_main)

//        val view:View = binding.root
//        setContentView(view)

        val fragHost = supportFragmentManager.findFragmentById(R.id.nav_host) as NavHostFragment
        navController = fragHost.navController

        setupWithNavController(binding.bottomNavigation, navController)

        binding.bottomNavigation.setOnItemSelectedListener { item->
            when(item.itemId){
                R.id.main->{
                    navController.navigate(R.id.mainScreenFragment)
                    true
                }
                R.id.my_cart->{
                    navController.navigate(R.id.cartFragment)
                    true
                }
                R.id.plan->{
                    navController.navigate(R.id.planFragment)
                    true
                }

                else -> {false}
            }
        }

        binding.floatingActionButton.setOnClickListener {
            val intent = Intent(Intent.ACTION_SEND)
            intent.type = "text/plain"
            intent.putExtra(Intent.EXTRA_EMAIL, "esraa.fathy225@gmail.com")
            intent.putExtra(Intent.EXTRA_TEXT, "How are you?")

            if (intent.resolveActivity(packageManager) != null) {
                startActivity(intent)
            }



        }


    }
}
