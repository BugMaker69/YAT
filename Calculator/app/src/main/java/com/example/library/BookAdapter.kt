package com.example.library

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.RatingBar
import android.widget.TextView
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.example.calculator.R

class BookAdapter(val list: List<Book>) :
    ListAdapter<Book, BookAdapter.MyViewHolder>(BookItemDiffCallback()) {

    class MyViewHolder(val row: View) : RecyclerView.ViewHolder(row) {
        val titleName = row.findViewById<TextView>(R.id.tv_title)
        val authorName = row.findViewById<TextView>(R.id.tv_author)
        val bookImage = row.findViewById<ImageView>(R.id.iv_book)
        val rate = row.findViewById<RatingBar>(R.id.ratingBar)
    }

    override fun getItemCount() = list.size

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyViewHolder {
        val layout =
            LayoutInflater.from(parent.context).inflate(R.layout.book_item_rv, parent, false)
        return MyViewHolder(layout)
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {
        holder.titleName.text = list[position].title
        holder.authorName.text = list[position].author
        holder.rate.rating = list[position].rating.toFloat()
        holder.bookImage.setImageResource(list[position].image)
    }

}

class BookItemDiffCallback : DiffUtil.ItemCallback<Book>() {
    override fun areItemsTheSame(oldItem: Book, newItem: Book): Boolean {
        return oldItem == newItem
    }

    override fun areContentsTheSame(oldItem: Book, newItem: Book): Boolean {
        return oldItem == newItem
    }
}