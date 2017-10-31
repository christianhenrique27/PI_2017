package com.easyshop.easyshop.activitys.fragmentos;


import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.easyshop.easyshop.R;

/**
 * A simple {@link Fragment} subclass.
 */
public class Carrinho extends Fragment {


    public Carrinho() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_carrinho, container, false);
    }

}
