
package com.reactlibrary.sm_contact;

import android.content.Intent;
import android.provider.ContactsContract;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;

public class SMOSmContactModule extends ReactContextBaseJavaModule{

  private final ReactApplicationContext reactContext;

  public SMOSmContactModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "SMOSmContact";
  }
  
  
  @ReactMethod
  public void addContact(ReadableMap params, Callback callback){
    // addContact 实现, 返回参数用WritableMap封装, 调用callback.invoke(WritableMap)
    String photo = "";
    String name = "";
    String email = "";
    if (params.hasKey("phone")) {
        photo = params.getString("phone");
    }
    if (params.hasKey("name")) {
      name = params.getString("name");
    }
    if (params.hasKey("email")) {
      email = params.getString("email");
    }

    Intent intent = new Intent(Intent.ACTION_INSERT);
    intent.setType("vnd.android.cursor.dir/person");
    intent.setType("vnd.android.cursor.dir/contact");
    intent.setType("vnd.android.cursor.dir/raw_contact");
    intent.putExtra(ContactsContract.Intents.Insert.NAME, name);
    intent.putExtra(ContactsContract.Intents.Insert.PHONE, photo);
    intent.putExtra(ContactsContract.Intents.Insert.EMAIL, email);

    getCurrentActivity().startActivity(intent);
  }
}