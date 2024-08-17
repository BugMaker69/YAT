package com.example.library

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.navArgs
import com.example.calculator.databinding.FragmentMealDetailsBinding


class MealDetailsFragment : Fragment() {

    lateinit var binding: FragmentMealDetailsBinding
    private val args: MealDetailsFragmentArgs by navArgs()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        binding= FragmentMealDetailsBinding.inflate(inflater,container,false)

        val meal = args.user

        binding.ivCity.setImageResource(meal.mealImage)
        binding.tvName.text=meal.mealName

        return binding.root

    }

}