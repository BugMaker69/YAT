package com.example.library

import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.calculator.R
import com.example.calculator.databinding.ActivityMainBinding

class MainActivity : ComponentActivity() {
    private lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)

        val view: View = binding.root

        setContentView(view)


        val books = mutableListOf<Book>(
            Book("Ahmed Mohamed", "Ahmed@gmail.com", R.drawable.angels, 2.0),
            Book("Mahmoud Mohamed", "Mahmoud@gmail.com", R.drawable.blood, 3.0),
            Book("Mona Ahmed", "Mona@gmail.com", R.drawable.nostra, 2.6),
            Book("Menna Ali", "Menna@gmail.com", R.drawable.humming, 2.1),
            Book("Youssef Mohamed", "Youssef@gmail.com", R.drawable.sword, 4.0),
            Book("Ahmed Mohamed", "Ahmed@gmail.com", R.drawable.spirits, 5.0),
            Book("Mahmoud Ahmed", "Mahmoud@gmail.com", R.drawable.solitude, 1.5),
        )


        val bookAdapter = BookAdapter(books)
        binding.rvBooks.layoutManager = LinearLayoutManager(this)
        binding.rvBooks.adapter = bookAdapter

        binding.toolbar.materialToolbar.setOnMenuItemClickListener {
            when (it.itemId) {
                R.id.notification -> {
                    Toast.makeText(this, R.string.notification_clicked, Toast.LENGTH_SHORT).show()
                    true
                }
                else -> false
            }
        }

        binding.toolbar.materialToolbar.setNavigationOnClickListener {
            binding.drawerLayout.open()
        }

        binding.navigationView.setNavigationItemSelectedListener {
            when (it.itemId) {
                R.id.review -> {
                    Toast.makeText(this, R.string.review_clicked, Toast.LENGTH_SHORT).show()
                    binding.drawerLayout.close()
                    true
                }

                R.id.fav -> {
                    Toast.makeText(this, R.string.fav_clicked, Toast.LENGTH_SHORT).show()
                    binding.drawerLayout.close()
                    true
                }

                R.id.search -> {
                    Toast.makeText(this, R.string.search_clicked, Toast.LENGTH_SHORT).show()
                    binding.drawerLayout.close()
                    true
                }

                R.id.profile -> {
                    Toast.makeText(this, R.string.profile_clicked, Toast.LENGTH_SHORT).show()
                    binding.drawerLayout.close()
                    true
                }

                R.id.settings -> {
                    Toast.makeText(this, R.string.settings_clicked, Toast.LENGTH_SHORT).show()
                    binding.drawerLayout.close()
                    true
                }

                else -> false
            }
        }

    }
}
