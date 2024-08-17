package com.example.library

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView.ViewHolder
import com.example.calculator.databinding.CardItemBinding

class MealAdapter(
    val data: List<Meal>,
    val mealClickListener: MealClickListener
) :
    ListAdapter<Meal, MealAdapter.MyViewHolder>(MealItemDiffCallback()) {

    class MyViewHolder(val binding: CardItemBinding) :
        ViewHolder(binding.root) {

        companion object {
            fun from(parent: ViewGroup): MyViewHolder {
                val layoutInflater = LayoutInflater.from(parent.context)
                val binding = CardItemBinding.inflate(layoutInflater, parent, false)
                return MyViewHolder(binding)
            }
        }
    }

    interface MealClickListener {
        fun onMealClicked(meal: Meal)
    }


    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyViewHolder {
        return MyViewHolder.from(parent)
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {
        holder.binding.meal = data[position]
        holder.binding.imageView.setImageResource(data[position].mealImage)
        holder.binding.root.setOnClickListener {
            mealClickListener.onMealClicked(data[position])
        }
    }


    override fun getItemCount() = data.size


}

class MealItemDiffCallback : DiffUtil.ItemCallback<Meal>() {
    override fun areItemsTheSame(oldItem: Meal, newItem: Meal): Boolean {
        return oldItem == newItem
    }

    override fun areContentsTheSame(oldItem: Meal, newItem: Meal): Boolean {
        return oldItem == newItem
    }

}