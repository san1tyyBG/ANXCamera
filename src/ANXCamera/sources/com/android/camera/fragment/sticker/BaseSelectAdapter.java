package com.android.camera.fragment.sticker;

import android.content.Context;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import com.android.camera.R;
import java.util.List;

public abstract class BaseSelectAdapter<T> extends Adapter<BaseSelectHolder> implements OnClickListener {
    protected Context mContext;
    private ItemSelectChangeListener mItemSelectChangeListener;
    protected int mLastSelectedItemPosition = -1;
    protected List<T> mList;
    protected int mSelectedItemPosition = 0;

    public static abstract class BaseSelectHolder extends ViewHolder {
        protected View mIVSelected;

        public BaseSelectHolder(View view) {
            super(view);
            view.setTag(R.id.item_root, this);
            this.mIVSelected = view.findViewById(R.id.iv_selected);
        }

        public abstract void bindView(int i);
    }

    public interface ItemSelectChangeListener {
        boolean onItemSelect(BaseSelectHolder baseSelectHolder, int i, boolean z);
    }

    public BaseSelectAdapter(Context context) {
        this.mContext = context;
    }

    private void setSelected(BaseSelectHolder baseSelectHolder, boolean z) {
        baseSelectHolder.itemView.setSelected(z);
        baseSelectHolder.mIVSelected.setVisibility(z ? 0 : 4);
    }

    /* access modifiers changed from: protected */
    public abstract BaseSelectHolder getHolder(View view);

    public int getItemCount() {
        if (this.mList == null) {
            return 0;
        }
        return this.mList.size();
    }

    public T getItemData(int i) {
        return this.mList.get(i);
    }

    /* access modifiers changed from: protected */
    public abstract int getLayoutId();

    public List<T> getList() {
        return this.mList;
    }

    public int getSelectedItemPosition() {
        return this.mSelectedItemPosition;
    }

    public void initSelectItem(int i) {
        this.mSelectedItemPosition = i;
    }

    public void onBindViewHolder(BaseSelectHolder baseSelectHolder, int i) {
        baseSelectHolder.itemView.setOnClickListener(this);
        setSelected(baseSelectHolder, i == this.mSelectedItemPosition);
        baseSelectHolder.bindView(i);
    }

    public void onBindViewHolder(BaseSelectHolder baseSelectHolder, int i, List<Object> list) {
        if (list == null || list.size() <= 0) {
            super.onBindViewHolder(baseSelectHolder, i, list);
        } else {
            setSelected(baseSelectHolder, i == this.mSelectedItemPosition);
        }
    }

    public void onClick(View view) {
        BaseSelectHolder baseSelectHolder = (BaseSelectHolder) view.getTag(R.id.item_root);
        int adapterPosition = baseSelectHolder.getAdapterPosition();
        if (this.mSelectedItemPosition != adapterPosition) {
            if (this.mItemSelectChangeListener != null && this.mItemSelectChangeListener.onItemSelect(baseSelectHolder, adapterPosition, true)) {
                setSelectedItemPosition(adapterPosition);
            }
        } else if (this.mItemSelectChangeListener != null) {
            this.mItemSelectChangeListener.onItemSelect(baseSelectHolder, adapterPosition, false);
        }
    }

    public BaseSelectHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return getHolder(LayoutInflater.from(this.mContext).inflate(getLayoutId(), viewGroup, false));
    }

    public void setItemSelectChangeListener(ItemSelectChangeListener itemSelectChangeListener) {
        this.mItemSelectChangeListener = itemSelectChangeListener;
    }

    public void setList(List<T> list) {
        this.mList = list;
    }

    public void setSelectedItemPosition(int i) {
        this.mLastSelectedItemPosition = this.mSelectedItemPosition;
        this.mSelectedItemPosition = i;
        notifyItemChanged(this.mLastSelectedItemPosition, Boolean.valueOf(true));
        notifyItemChanged(this.mSelectedItemPosition, Boolean.valueOf(true));
    }
}
