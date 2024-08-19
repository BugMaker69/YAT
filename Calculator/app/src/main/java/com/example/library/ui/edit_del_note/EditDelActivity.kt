package com.example.library.ui.edit_del_note

import android.app.AlertDialog
import android.content.Intent
import android.os.Bundle
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.viewModels
import androidx.databinding.DataBindingUtil
import com.example.calculator.R
import com.example.calculator.databinding.ActivityEditDelBinding
import com.example.notesapp.data.models.Note
import com.example.notesapp.ui.main.view.MainActivity
import com.example.notesapp.ui.main.view_model.MainViewModel

class EditDelActivity : ComponentActivity() {

    private lateinit var binding: ActivityEditDelBinding
    val viewModel: MainViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_edit_del)
        binding = DataBindingUtil.setContentView(this, R.layout.activity_edit_del)

        val noteId = intent.getIntExtra("noteId", 0)
        val noteTitle = intent.getStringExtra("noteTitle")
        val noteDescription = intent.getStringExtra("noteDescription")

        binding.etTitle.setText(noteTitle)
        binding.etNote.setText(noteDescription)

        binding.btnDel.setOnClickListener {

            val builder: AlertDialog.Builder = AlertDialog.Builder(this)
            builder
//                .setMessage("Do you want to delete this note")
                .setTitle("Do you want to delete this note")
                .setPositiveButton("Ok") { dialog, which ->
                    viewModel.delNote(
                        Note(
                            noteId,
                            noteTitle.toString(),
                            noteDescription.toString()
                        )
                    )
                    val intent = Intent(this, MainActivity::class.java)
                    startActivity(intent)
                    finish()
                    Toast.makeText(this, "Deleted Successfully", Toast.LENGTH_SHORT).show()
                }
                .setNegativeButton("Cancel") { dialog, which ->
                    dialog.dismiss()
                }

            val dialog: AlertDialog = builder.create()
            dialog.show()


        }

        binding.btEdit.setOnClickListener {
            if (!binding.etTitle.text.isNullOrEmpty() &&
                !binding.etNote.text.isNullOrEmpty()
            ) {
                viewModel.updateNote(
                    Note(noteId, binding.etTitle.text.toString(), binding.etNote.text.toString())
                )
                val intent = Intent(this, MainActivity::class.java)
                startActivity(intent)
                finish()
                Toast.makeText(this, "Edited Successfully", Toast.LENGTH_SHORT).show()
            }
        }
    }
}
