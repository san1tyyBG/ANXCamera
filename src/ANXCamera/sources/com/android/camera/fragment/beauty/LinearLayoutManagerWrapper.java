package com.android.camera.fragment.beauty;

import android.content.Context;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView.Recycler;
import android.support.v7.widget.RecyclerView.State;
import android.util.AttributeSet;
import com.android.camera.log.Log;

public class LinearLayoutManagerWrapper extends LinearLayoutManager {
    private String mRecycleViewFrom;

    public LinearLayoutManagerWrapper(Context context, int i, boolean z, String str) {
        super(context, i, z);
        this.mRecycleViewFrom = str;
    }

    public LinearLayoutManagerWrapper(Context context, AttributeSet attributeSet, int i, int i2, String str) {
        super(context, attributeSet, i, i2);
        this.mRecycleViewFrom = str;
    }

    public LinearLayoutManagerWrapper(Context context, String str) {
        super(context);
        this.mRecycleViewFrom = str;
    }

    public void onLayoutChildren(Recycler recycler, State state) {
        try {
            super.onLayoutChildren(recycler, state);
        } catch (IndexOutOfBoundsException e) {
            StringBuilder sb = new StringBuilder();
            sb.append("IndexOutOfBoundsException from bussiness:");
            sb.append(this.mRecycleViewFrom);
            Log.i("LinearLayoutManagerWrapper", sb.toString());
        }
    }
}
