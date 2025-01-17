package com.ss.android.ugc.effectmanager.effect.model;

import android.text.TextUtils;
import java.util.ArrayList;
import java.util.List;

public class EffectCategoryModel {
    private List<String> effects = new ArrayList();
    private EffectCategoryIconsModel icon;
    private EffectCategoryIconsModel icon_selected;
    private String id;
    private String key;
    private String name;
    private List<String> tags;
    private String tags_updated_at;

    public boolean checkValued() {
        if (this.icon == null) {
            this.icon = new EffectCategoryIconsModel();
        }
        if (this.icon_selected == null) {
            this.icon_selected = new EffectCategoryIconsModel();
        }
        if (this.effects == null) {
            this.effects = new ArrayList();
        }
        if (this.tags == null) {
            this.tags = new ArrayList();
        }
        return !TextUtils.isEmpty(this.id) && this.icon.checkValued() && this.icon_selected.checkValued();
    }

    public List<String> getEffects() {
        return this.effects;
    }

    public EffectCategoryIconsModel getIcon() {
        return this.icon;
    }

    public EffectCategoryIconsModel getIcon_selected() {
        return this.icon_selected;
    }

    public String getId() {
        return this.id;
    }

    public String getKey() {
        return this.key;
    }

    public String getName() {
        return this.name;
    }

    public List<String> getTags() {
        return this.tags;
    }

    public String getTagsUpdated() {
        return this.tags_updated_at;
    }

    public void setEffects(List<String> list) {
        this.effects = list;
    }

    public void setIcon(EffectCategoryIconsModel effectCategoryIconsModel) {
        this.icon = effectCategoryIconsModel;
    }

    public void setIcon_selected(EffectCategoryIconsModel effectCategoryIconsModel) {
        this.icon_selected = effectCategoryIconsModel;
    }

    public void setId(String str) {
        this.id = str;
    }

    public void setKey(String str) {
        this.key = str;
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setTags(List<String> list) {
        this.tags = list;
    }
}
