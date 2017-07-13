<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%album_photo}}".
 *
 * @property integer $id
 * @property integer $album_id
 * @property string $image
 * @property integer $created_at
 * @property integer $talk_id
 */
class AlbumPhoto extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%album_photo}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['album_id', 'image', 'created_at'], 'required'],
            [['album_id', 'created_at', 'talk_id'], 'integer'],
            [['image'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'album_id' => 'Album ID',
            'image' => 'Image',
            'created_at' => 'Created At',
            'talk_id' => 'Talk ID',
        ];
    }
}
