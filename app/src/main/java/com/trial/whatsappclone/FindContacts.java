package com.trial.whatsappclone;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.database.Cursor;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.widget.LinearLayout;

import java.util.ArrayList;

public class FindContacts extends AppCompatActivity {
    private RecyclerView userList;
    private RecyclerView.Adapter userListAdapter;
    private RecyclerView.LayoutManager userListLayoutManager;
    ArrayList<User> contactList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_find_contacts);
        contactList = new ArrayList<>();
        initRecyclerView();
        getContacts();
    }
    private void getContacts(){
        Cursor phones = getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, null, null,
                null, null);
        while (phones.moveToNext()){
            String name = phones.getString(phones.getColumnIndex(ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME));
            String number = phones.getString(phones.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER));
            User contact = new User(name, number);
            contactList.add(contact);
            userListAdapter.notifyDataSetChanged();
        }
    }
    private void initRecyclerView() {
        userList = (RecyclerView) findViewById(R.id.contactslist);
        userList.setNestedScrollingEnabled(false);
        userList.setHasFixedSize(false);
        userListLayoutManager = new LinearLayoutManager(getApplicationContext(), LinearLayout.VERTICAL, false);
        userList.setLayoutManager(userListLayoutManager);
        userListAdapter = new UserListAdapter(contactList);
        userList.setAdapter(userListAdapter);
    }
}
