package com.android.camera.fragment.bottom;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.view.View;
import android.view.ViewGroup;
import com.android.camera.Util;
import com.android.camera.animation.AnimationMonitor;
import java.util.ArrayList;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;

public class BeautyMenuAnimator {
    private ChildAnimationsProvider[] mAnimationsProviders = {new ThreeChildAnimationProvider(), new CommonChildAnimationsProvider()};
    private boolean mExpand = true;
    private ViewGroup mViewGroup;

    private interface ChildAnimationsProvider {
        ArrayList<ViewPropertyAnimatorCompat> expandAnimation(ViewGroup viewGroup);

        ArrayList<ViewPropertyAnimatorCompat> shrinkAnimation(ViewGroup viewGroup);
    }

    public static class CommonChildAnimationsProvider implements ChildAnimationsProvider {
        private CubicEaseOutInterpolator mCubicEaseOut = new CubicEaseOutInterpolator();

        public ArrayList<ViewPropertyAnimatorCompat> expandAnimation(ViewGroup viewGroup) {
            int childCount = viewGroup.getChildCount();
            if (childCount <= 0) {
                return null;
            }
            ArrayList<ViewPropertyAnimatorCompat> arrayList = new ArrayList<>();
            arrayList.add(ViewCompat.animate(viewGroup.getChildAt(0)).translationX(0.0f).setDuration(300));
            for (int i = 1; i < childCount; i++) {
                final View childAt = viewGroup.getChildAt(i);
                arrayList.add(ViewCompat.animate(childAt).alpha(1.0f).setDuration(200));
                arrayList.add(ViewCompat.animate(childAt).translationX(0.0f).setDuration(300).setInterpolator(this.mCubicEaseOut).setListener(new ViewPropertyAnimatorListener() {
                    public void onAnimationCancel(View view) {
                        AnimationMonitor.get().animationStop(view);
                    }

                    public void onAnimationEnd(View view) {
                        AnimationMonitor.get().animationStop(view);
                    }

                    public void onAnimationStart(View view) {
                        AnimationMonitor.get().animationStart(view, 300);
                        childAt.setVisibility(0);
                    }
                }));
                childAt.setEnabled(true);
            }
            return arrayList;
        }

        public ArrayList<ViewPropertyAnimatorCompat> shrinkAnimation(ViewGroup viewGroup) {
            int childCount = viewGroup.getChildCount();
            if (childCount <= 0) {
                return null;
            }
            ArrayList<ViewPropertyAnimatorCompat> arrayList = new ArrayList<>();
            View childAt = viewGroup.getChildAt(0);
            arrayList.add(ViewCompat.animate(childAt).translationX((float) (((viewGroup.getWidth() - childAt.getWidth()) / 2) - childAt.getLeft())).setDuration(300));
            for (int i = 1; i < childCount; i++) {
                final View childAt2 = viewGroup.getChildAt(i);
                float width = (float) (((viewGroup.getWidth() - childAt2.getWidth()) / 2) - childAt2.getLeft());
                arrayList.add(ViewCompat.animate(childAt2).alpha(0.0f).setDuration(200));
                arrayList.add(ViewCompat.animate(childAt2).translationX(width).setDuration(300).setInterpolator(this.mCubicEaseOut).setListener(new ViewPropertyAnimatorListener() {
                    public void onAnimationCancel(View view) {
                        AnimationMonitor.get().animationStop(view);
                    }

                    public void onAnimationEnd(View view) {
                        childAt2.setVisibility(4);
                        AnimationMonitor.get().animationStop(view);
                    }

                    public void onAnimationStart(View view) {
                        AnimationMonitor.get().animationStart(view, 300);
                    }
                }));
                childAt2.setEnabled(false);
            }
            return arrayList;
        }
    }

    public static class ThreeChildAnimationProvider implements ChildAnimationsProvider {
        private CubicEaseOutInterpolator mCubicEaseOut = new CubicEaseOutInterpolator();

        public ArrayList<ViewPropertyAnimatorCompat> expandAnimation(ViewGroup viewGroup) {
            if (viewGroup.getChildCount() != 3) {
                return null;
            }
            ArrayList<ViewPropertyAnimatorCompat> arrayList = new ArrayList<>();
            View childAt = viewGroup.getChildAt(0);
            View childAt2 = viewGroup.getChildAt(1);
            View childAt3 = viewGroup.getChildAt(2);
            arrayList.add(ViewCompat.animate(childAt).translationX(0.0f).setDuration(300).setInterpolator(this.mCubicEaseOut));
            AnonymousClass1 r4 = new ViewPropertyAnimatorListener() {
                public void onAnimationCancel(View view) {
                    AnimationMonitor.get().animationStop(view);
                }

                public void onAnimationEnd(View view) {
                    AnimationMonitor.get().animationStop(view);
                }

                public void onAnimationStart(View view) {
                    AnimationMonitor.get().animationStart(view, 300);
                    view.setVisibility(0);
                }
            };
            arrayList.add(ViewCompat.animate(childAt2).setStartDelay(80).alpha(1.0f).setDuration(300).setInterpolator(this.mCubicEaseOut));
            arrayList.add(ViewCompat.animate(childAt2).translationX(0.0f).setDuration(300).setInterpolator(this.mCubicEaseOut).setListener(r4));
            arrayList.add(ViewCompat.animate(childAt3).alpha(1.0f).setDuration(300).setInterpolator(this.mCubicEaseOut));
            arrayList.add(ViewCompat.animate(childAt3).translationX(0.0f).setDuration(300).setInterpolator(this.mCubicEaseOut).setListener(r4));
            childAt.setEnabled(true);
            childAt2.setEnabled(true);
            childAt3.setEnabled(true);
            return arrayList;
        }

        public ArrayList<ViewPropertyAnimatorCompat> shrinkAnimation(ViewGroup viewGroup) {
            if (viewGroup.getChildCount() != 3) {
                return null;
            }
            ArrayList<ViewPropertyAnimatorCompat> arrayList = new ArrayList<>();
            View childAt = viewGroup.getChildAt(0);
            View childAt2 = viewGroup.getChildAt(1);
            View childAt3 = viewGroup.getChildAt(2);
            arrayList.add(ViewCompat.animate(childAt).translationX((float) (((viewGroup.getWidth() - childAt.getWidth()) / 2) - childAt.getLeft())).setDuration(300).setInterpolator(this.mCubicEaseOut));
            AnonymousClass2 r6 = new ViewPropertyAnimatorListener() {
                public void onAnimationCancel(View view) {
                    AnimationMonitor.get().animationStop(view);
                }

                public void onAnimationEnd(View view) {
                    view.setVisibility(4);
                    AnimationMonitor.get().animationStop(view);
                }

                public void onAnimationStart(View view) {
                    AnimationMonitor.get().animationStart(view, 300);
                }
            };
            arrayList.add(ViewCompat.animate(childAt2).setStartDelay(0).alpha(0.0f).setDuration(150).setInterpolator(this.mCubicEaseOut));
            arrayList.add(ViewCompat.animate(childAt2).translationX((float) (((viewGroup.getWidth() - childAt2.getWidth()) / 2) - childAt2.getLeft())).setDuration(300).setInterpolator(this.mCubicEaseOut).setListener(r6));
            arrayList.add(ViewCompat.animate(childAt3).alpha(0.0f).setDuration(300).setInterpolator(this.mCubicEaseOut));
            arrayList.add(ViewCompat.animate(childAt3).translationX((float) (((viewGroup.getWidth() - childAt3.getWidth()) / 2) - childAt3.getLeft())).setDuration(300).setInterpolator(this.mCubicEaseOut).setListener(r6));
            childAt.setEnabled(true);
            childAt2.setEnabled(true);
            childAt3.setEnabled(true);
            return arrayList;
        }
    }

    public BeautyMenuAnimator(ViewGroup viewGroup) {
        this.mViewGroup = viewGroup;
    }

    public static BeautyMenuAnimator animator(ViewGroup viewGroup) {
        return new BeautyMenuAnimator(viewGroup);
    }

    private List<ViewPropertyAnimatorCompat> getChildExpandAnimations() {
        for (ChildAnimationsProvider expandAnimation : this.mAnimationsProviders) {
            ArrayList expandAnimation2 = expandAnimation.expandAnimation(this.mViewGroup);
            if (expandAnimation2 != null) {
                return expandAnimation2;
            }
        }
        return null;
    }

    private List<ViewPropertyAnimatorCompat> getChildShrinkAnimations() {
        for (ChildAnimationsProvider shrinkAnimation : this.mAnimationsProviders) {
            ArrayList shrinkAnimation2 = shrinkAnimation.shrinkAnimation(this.mViewGroup);
            if (shrinkAnimation2 != null) {
                return shrinkAnimation2;
            }
        }
        return null;
    }

    private static void triggerAnimators(List<ViewPropertyAnimatorCompat> list) {
        for (ViewPropertyAnimatorCompat start : list) {
            start.start();
        }
    }

    public void expandAnimate() {
        if (!this.mExpand && getChildCount() > 1) {
            List childExpandAnimations = getChildExpandAnimations();
            if (childExpandAnimations != null) {
                triggerAnimators(childExpandAnimations);
                this.mExpand = true;
            }
        }
    }

    public int getChildCount() {
        return this.mViewGroup.getChildCount();
    }

    public void resetAll() {
        this.mExpand = true;
    }

    public void shrinkAnimate() {
        if (this.mExpand && getChildCount() > 1) {
            List childShrinkAnimations = getChildShrinkAnimations();
            if (childShrinkAnimations != null) {
                triggerAnimators(childShrinkAnimations);
                this.mExpand = false;
            }
        }
    }

    public void shrinkImmediately() {
        if (this.mExpand) {
            int childCount = getChildCount();
            if (childCount > 1) {
                View childAt = this.mViewGroup.getChildAt(0);
                ViewCompat.setTranslationX(childAt, (float) (((this.mViewGroup.getMeasuredWidth() - Util.getChildMeasureWidth(childAt)) / 2) - childAt.getLeft()));
                for (int i = 1; i < childCount; i++) {
                    View childAt2 = this.mViewGroup.getChildAt(i);
                    ViewCompat.setTranslationX(childAt2, (float) (((this.mViewGroup.getMeasuredWidth() - Util.getChildMeasureWidth(childAt2)) / 2) - childAt2.getLeft()));
                    childAt2.setAlpha(0.0f);
                    childAt2.setVisibility(4);
                }
                this.mExpand = false;
            }
        }
    }
}
