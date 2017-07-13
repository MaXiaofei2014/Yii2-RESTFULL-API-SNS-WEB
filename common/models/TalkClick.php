<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%talk_click}}".
 *
 * @property integer $id
 * @property integer $click_user_id
 * @property integer $talk_id
 *
 * @property User $clickUser
 */
class TalkClick extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%talk_click}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'click_user_id', 'talk_id'], 'required'],
            [['id', 'click_user_id', 'talk_id'], 'integer'],
            [['click_user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['click_user_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'click_user_id' => '点赞人',
            'talk_id' => '说说ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClickUser()
    {
        return $this->hasOne(User::className(), ['id' => 'click_user_id']);
    }
}
