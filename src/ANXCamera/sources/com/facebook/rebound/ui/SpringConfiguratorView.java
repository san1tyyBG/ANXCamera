package com.facebook.rebound.ui;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.AbsListView.LayoutParams;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.Spinner;
import android.widget.TableLayout;
import android.widget.TextView;
import com.facebook.rebound.OrigamiValueConverter;
import com.facebook.rebound.Spring;
import com.facebook.rebound.SpringConfig;
import com.facebook.rebound.SpringConfigRegistry;
import com.facebook.rebound.SpringListener;
import com.facebook.rebound.SpringSystem;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class SpringConfiguratorView extends FrameLayout {
    /* access modifiers changed from: private */
    public static final DecimalFormat DECIMAL_FORMAT = new DecimalFormat("#.#");
    private static final float MAX_FRICTION = 50.0f;
    private static final int MAX_SEEKBAR_VAL = 100000;
    private static final float MAX_TENSION = 200.0f;
    private static final float MIN_FRICTION = 0.0f;
    private static final float MIN_TENSION = 0.0f;
    /* access modifiers changed from: private */
    public TextView mFrictionLabel;
    /* access modifiers changed from: private */
    public SeekBar mFrictionSeekBar;
    /* access modifiers changed from: private */
    public final float mRevealPx;
    private final Spring mRevealerSpring;
    /* access modifiers changed from: private */
    public SpringConfig mSelectedSpringConfig;
    /* access modifiers changed from: private */
    public final List<SpringConfig> mSpringConfigs;
    private Spinner mSpringSelectorSpinner;
    /* access modifiers changed from: private */
    public final float mStashPx;
    /* access modifiers changed from: private */
    public TextView mTensionLabel;
    /* access modifiers changed from: private */
    public SeekBar mTensionSeekBar;
    /* access modifiers changed from: private */
    public final int mTextColor;
    private final SpinnerAdapter spinnerAdapter;
    private final SpringConfigRegistry springConfigRegistry;

    private class OnNubTouchListener implements OnTouchListener {
        private OnNubTouchListener() {
        }

        public boolean onTouch(View view, MotionEvent motionEvent) {
            if (motionEvent.getAction() == 0) {
                SpringConfiguratorView.this.togglePosition();
            }
            return true;
        }
    }

    private class RevealerSpringListener implements SpringListener {
        private RevealerSpringListener() {
        }

        public void onSpringActivate(Spring spring) {
        }

        public void onSpringAtRest(Spring spring) {
        }

        public void onSpringEndStateChange(Spring spring) {
        }

        public void onSpringUpdate(Spring spring) {
            float currentValue = (float) spring.getCurrentValue();
            float access$1300 = SpringConfiguratorView.this.mRevealPx;
            SpringConfiguratorView.this.setTranslationY((currentValue * (SpringConfiguratorView.this.mStashPx - access$1300)) + access$1300);
        }
    }

    private class SeekbarListener implements OnSeekBarChangeListener {
        private SeekbarListener() {
        }

        public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
            if (seekBar == SpringConfiguratorView.this.mTensionSeekBar) {
                float f = ((((float) i) * SpringConfiguratorView.MAX_TENSION) / 100000.0f) + 0.0f;
                double d = (double) f;
                SpringConfiguratorView.this.mSelectedSpringConfig.tension = OrigamiValueConverter.tensionFromOrigamiValue(d);
                String format = SpringConfiguratorView.DECIMAL_FORMAT.format(d);
                TextView access$900 = SpringConfiguratorView.this.mTensionLabel;
                StringBuilder sb = new StringBuilder();
                sb.append("T:");
                sb.append(format);
                access$900.setText(sb.toString());
            }
            if (seekBar == SpringConfiguratorView.this.mFrictionSeekBar) {
                float f2 = ((((float) i) * SpringConfiguratorView.MAX_FRICTION) / 100000.0f) + 0.0f;
                double d2 = (double) f2;
                SpringConfiguratorView.this.mSelectedSpringConfig.friction = OrigamiValueConverter.frictionFromOrigamiValue(d2);
                String format2 = SpringConfiguratorView.DECIMAL_FORMAT.format(d2);
                TextView access$1100 = SpringConfiguratorView.this.mFrictionLabel;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("F:");
                sb2.append(format2);
                access$1100.setText(sb2.toString());
            }
        }

        public void onStartTrackingTouch(SeekBar seekBar) {
        }

        public void onStopTrackingTouch(SeekBar seekBar) {
        }
    }

    private class SpinnerAdapter extends BaseAdapter {
        private final Context mContext;
        private final List<String> mStrings = new ArrayList();

        public SpinnerAdapter(Context context) {
            this.mContext = context;
        }

        public void add(String str) {
            this.mStrings.add(str);
            notifyDataSetChanged();
        }

        public void clear() {
            this.mStrings.clear();
            notifyDataSetChanged();
        }

        public int getCount() {
            return this.mStrings.size();
        }

        public Object getItem(int i) {
            return this.mStrings.get(i);
        }

        public long getItemId(int i) {
            return (long) i;
        }

        public View getView(int i, View view, ViewGroup viewGroup) {
            TextView textView;
            if (view == null) {
                textView = new TextView(this.mContext);
                textView.setLayoutParams(new LayoutParams(-1, -1));
                int dpToPx = Util.dpToPx(12.0f, SpringConfiguratorView.this.getResources());
                textView.setPadding(dpToPx, dpToPx, dpToPx, dpToPx);
                textView.setTextColor(SpringConfiguratorView.this.mTextColor);
            } else {
                textView = (TextView) view;
            }
            textView.setText((CharSequence) this.mStrings.get(i));
            return textView;
        }
    }

    private class SpringSelectedListener implements OnItemSelectedListener {
        private SpringSelectedListener() {
        }

        public void onItemSelected(AdapterView<?> adapterView, View view, int i, long j) {
            SpringConfiguratorView.this.mSelectedSpringConfig = (SpringConfig) SpringConfiguratorView.this.mSpringConfigs.get(i);
            SpringConfiguratorView.this.updateSeekBarsForSpringConfig(SpringConfiguratorView.this.mSelectedSpringConfig);
        }

        public void onNothingSelected(AdapterView<?> adapterView) {
        }
    }

    public SpringConfiguratorView(Context context) {
        this(context, null);
    }

    public SpringConfiguratorView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    @TargetApi(11)
    public SpringConfiguratorView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mSpringConfigs = new ArrayList();
        this.mTextColor = Color.argb(255, 225, 225, 225);
        SpringSystem create = SpringSystem.create();
        this.springConfigRegistry = SpringConfigRegistry.getInstance();
        this.spinnerAdapter = new SpinnerAdapter(context);
        Resources resources = getResources();
        this.mRevealPx = (float) Util.dpToPx(40.0f, resources);
        this.mStashPx = (float) Util.dpToPx(280.0f, resources);
        this.mRevealerSpring = create.createSpring();
        this.mRevealerSpring.setCurrentValue(1.0d).setEndValue(1.0d).addListener(new RevealerSpringListener());
        addView(generateHierarchy(context));
        SeekbarListener seekbarListener = new SeekbarListener();
        this.mTensionSeekBar.setMax(MAX_SEEKBAR_VAL);
        this.mTensionSeekBar.setOnSeekBarChangeListener(seekbarListener);
        this.mFrictionSeekBar.setMax(MAX_SEEKBAR_VAL);
        this.mFrictionSeekBar.setOnSeekBarChangeListener(seekbarListener);
        this.mSpringSelectorSpinner.setAdapter(this.spinnerAdapter);
        this.mSpringSelectorSpinner.setOnItemSelectedListener(new SpringSelectedListener());
        refreshSpringConfigurations();
        setTranslationY(this.mStashPx);
    }

    private View generateHierarchy(Context context) {
        Resources resources = getResources();
        int dpToPx = Util.dpToPx(5.0f, resources);
        int dpToPx2 = Util.dpToPx(10.0f, resources);
        int dpToPx3 = Util.dpToPx(20.0f, resources);
        TableLayout.LayoutParams layoutParams = new TableLayout.LayoutParams(0, -2, 1.0f);
        layoutParams.setMargins(0, 0, dpToPx, 0);
        FrameLayout frameLayout = new FrameLayout(context);
        frameLayout.setLayoutParams(Util.createLayoutParams(-1, Util.dpToPx(300.0f, resources)));
        FrameLayout frameLayout2 = new FrameLayout(context);
        FrameLayout.LayoutParams createMatchParams = Util.createMatchParams();
        createMatchParams.setMargins(0, dpToPx3, 0, 0);
        frameLayout2.setLayoutParams(createMatchParams);
        frameLayout2.setBackgroundColor(Color.argb(100, 0, 0, 0));
        frameLayout.addView(frameLayout2);
        this.mSpringSelectorSpinner = new Spinner(context, 0);
        FrameLayout.LayoutParams createMatchWrapParams = Util.createMatchWrapParams();
        createMatchWrapParams.gravity = 48;
        createMatchWrapParams.setMargins(dpToPx2, dpToPx2, dpToPx2, 0);
        this.mSpringSelectorSpinner.setLayoutParams(createMatchWrapParams);
        frameLayout2.addView(this.mSpringSelectorSpinner);
        LinearLayout linearLayout = new LinearLayout(context);
        FrameLayout.LayoutParams createMatchWrapParams2 = Util.createMatchWrapParams();
        createMatchWrapParams2.setMargins(0, 0, 0, Util.dpToPx(80.0f, resources));
        createMatchWrapParams2.gravity = 80;
        linearLayout.setLayoutParams(createMatchWrapParams2);
        linearLayout.setOrientation(1);
        frameLayout2.addView(linearLayout);
        LinearLayout linearLayout2 = new LinearLayout(context);
        FrameLayout.LayoutParams createMatchWrapParams3 = Util.createMatchWrapParams();
        createMatchWrapParams3.setMargins(dpToPx2, dpToPx2, dpToPx2, dpToPx3);
        linearLayout2.setPadding(dpToPx2, dpToPx2, dpToPx2, dpToPx2);
        linearLayout2.setLayoutParams(createMatchWrapParams3);
        linearLayout2.setOrientation(0);
        linearLayout.addView(linearLayout2);
        this.mTensionSeekBar = new SeekBar(context);
        this.mTensionSeekBar.setLayoutParams(layoutParams);
        linearLayout2.addView(this.mTensionSeekBar);
        this.mTensionLabel = new TextView(getContext());
        this.mTensionLabel.setTextColor(this.mTextColor);
        FrameLayout.LayoutParams createLayoutParams = Util.createLayoutParams(Util.dpToPx(MAX_FRICTION, resources), -1);
        this.mTensionLabel.setGravity(19);
        this.mTensionLabel.setLayoutParams(createLayoutParams);
        this.mTensionLabel.setMaxLines(1);
        linearLayout2.addView(this.mTensionLabel);
        LinearLayout linearLayout3 = new LinearLayout(context);
        FrameLayout.LayoutParams createMatchWrapParams4 = Util.createMatchWrapParams();
        createMatchWrapParams4.setMargins(dpToPx2, dpToPx2, dpToPx2, dpToPx3);
        linearLayout3.setPadding(dpToPx2, dpToPx2, dpToPx2, dpToPx2);
        linearLayout3.setLayoutParams(createMatchWrapParams4);
        linearLayout3.setOrientation(0);
        linearLayout.addView(linearLayout3);
        this.mFrictionSeekBar = new SeekBar(context);
        this.mFrictionSeekBar.setLayoutParams(layoutParams);
        linearLayout3.addView(this.mFrictionSeekBar);
        this.mFrictionLabel = new TextView(getContext());
        this.mFrictionLabel.setTextColor(this.mTextColor);
        FrameLayout.LayoutParams createLayoutParams2 = Util.createLayoutParams(Util.dpToPx(MAX_FRICTION, resources), -1);
        this.mFrictionLabel.setGravity(19);
        this.mFrictionLabel.setLayoutParams(createLayoutParams2);
        this.mFrictionLabel.setMaxLines(1);
        linearLayout3.addView(this.mFrictionLabel);
        View view = new View(context);
        FrameLayout.LayoutParams createLayoutParams3 = Util.createLayoutParams(Util.dpToPx(60.0f, resources), Util.dpToPx(40.0f, resources));
        createLayoutParams3.gravity = 49;
        view.setLayoutParams(createLayoutParams3);
        view.setOnTouchListener(new OnNubTouchListener());
        view.setBackgroundColor(Color.argb(255, 0, 164, 209));
        frameLayout.addView(view);
        return frameLayout;
    }

    /* access modifiers changed from: private */
    public void togglePosition() {
        double endValue = this.mRevealerSpring.getEndValue();
        Spring spring = this.mRevealerSpring;
        double d = 1.0d;
        if (endValue == 1.0d) {
            d = 0.0d;
        }
        spring.setEndValue(d);
    }

    /* access modifiers changed from: private */
    public void updateSeekBarsForSpringConfig(SpringConfig springConfig) {
        int round = Math.round(((((float) OrigamiValueConverter.origamiValueFromTension(springConfig.tension)) - 0.0f) * 100000.0f) / MAX_TENSION);
        int round2 = Math.round(((((float) OrigamiValueConverter.origamiValueFromFriction(springConfig.friction)) - 0.0f) * 100000.0f) / MAX_FRICTION);
        this.mTensionSeekBar.setProgress(round);
        this.mFrictionSeekBar.setProgress(round2);
    }

    public void destroy() {
        ViewGroup viewGroup = (ViewGroup) getParent();
        if (viewGroup != null) {
            viewGroup.removeView(this);
        }
        this.mRevealerSpring.destroy();
    }

    public void refreshSpringConfigurations() {
        Map allSpringConfig = this.springConfigRegistry.getAllSpringConfig();
        this.spinnerAdapter.clear();
        this.mSpringConfigs.clear();
        for (Entry entry : allSpringConfig.entrySet()) {
            if (entry.getKey() != SpringConfig.defaultConfig) {
                this.mSpringConfigs.add(entry.getKey());
                this.spinnerAdapter.add((String) entry.getValue());
            }
        }
        this.mSpringConfigs.add(SpringConfig.defaultConfig);
        this.spinnerAdapter.add((String) allSpringConfig.get(SpringConfig.defaultConfig));
        this.spinnerAdapter.notifyDataSetChanged();
        if (this.mSpringConfigs.size() > 0) {
            this.mSpringSelectorSpinner.setSelection(0);
        }
    }
}
