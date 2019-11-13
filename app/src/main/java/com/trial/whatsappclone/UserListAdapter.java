package com.trial.whatsappclone;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class UserListAdapter extends RecyclerView.Adapter<UserListAdapter.UserListViewHolder> {
    ArrayList<User> contactList;
    public UserListAdapter(ArrayList<User> contactList){
        this.contactList = contactList;
    }

    @NonNull
    @Override
    public UserListViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View layoutView = LayoutInflater.from(parent.getContext()).inflate(R.layout.contact_layout, null, false);
        RecyclerView.LayoutParams lp = new RecyclerView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        layoutView.setLayoutParams(lp);
        UserListViewHolder vh = new UserListViewHolder(layoutView);
        return vh;
    }

    @Override
    public void onBindViewHolder(@NonNull UserListViewHolder holder, int position) {
        holder.name.setText(contactList.get(position).getName());
        holder.number.setText(contactList.get(position).getPhoneNumber());
    }

    @Override
    public int getItemCount() {
        return contactList.size() ;
    }

    public class UserListViewHolder extends RecyclerView.ViewHolder {
        public TextView name, number;
        public UserListViewHolder(View view){
            super(view);
            name = view.findViewById(R.id.name);
            number = view.findViewById(R.id.contact);
        }
    }
}
