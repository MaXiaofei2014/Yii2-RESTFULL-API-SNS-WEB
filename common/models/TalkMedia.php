<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%talk_media}}".
 *
 * @property integer $id
 * @property string $media_type
 * @property integer $talk_id
 * @property string $link
 * @property integer $created_at
 */
class TalkMedia extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    const MEDIA_TYPE_NONE= 'none';
    const MEDIA_TYPE_MP3 ='mp3';
    const MEDIA_TYPE_PICTURE="picture";
    const MEDIA_TYPE_VIDEO="video";
    public static function tableName()
    {
        return '{{%talk_media}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['media_type'], 'required'],
            [['talk_id', 'created_at'], 'integer'],
            [['media_type'], 'string', 'max' => 32],
            [['link'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'media_type' => 'Media Type',
            'talk_id' => 'Talk ID',
            'link' => 'Link',
            'created_at' => 'Created At',
        ];
    }
}
