package com.example.library

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import androidx.recyclerview.widget.GridLayoutManager
import com.example.calculator.R
import com.example.calculator.databinding.FragmentMainScreenBinding


class MainScreenFragment : Fragment(), MealAdapter.MealClickListener {

    lateinit var binding: FragmentMainScreenBinding
    var meals: MutableList<Meal> = mutableListOf()
    lateinit var mealAdapter: MealAdapter

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        binding = FragmentMainScreenBinding.inflate(inflater, container, false)

        meals = mutableListOf<Meal>(
            Meal(getString(R.string.burger), R.drawable.burger),
            Meal(getString(R.string.steak), R.drawable.filletsteak),
            Meal(getString(R.string.pancakes), R.drawable.pancakes),
            Meal(getString(R.string.pizza), R.drawable.pizza),
            Meal(getString(R.string.shawerma), R.drawable.shawerma),
            Meal(getString(R.string.waffles), R.drawable.waffles),
        )

        mealAdapter = MealAdapter(meals, this)

        binding.rvMeals.adapter = mealAdapter
        binding.rvMeals.layoutManager = GridLayoutManager(binding.root.context, 2)
        return binding.root

    }

    override fun onMealClicked(meal: Meal) {
        val action =
            MainScreenFragmentDirections.actionMainScreenFragmentToMealDetailsFragment(meal)
        findNavController().navigate(action)
    }
}