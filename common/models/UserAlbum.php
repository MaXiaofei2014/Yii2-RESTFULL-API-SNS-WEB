<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%user_album}}".
 *
 * @property integer $id
 * @property string $album_name
 * @property string $album_desc
 * @property string $index_img
 * @property integer $count
 * @property integer $user_id
 * @property string $show_access
 * @property string $key
 */
class UserAlbum extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     *
     */
    const  ALBUM_TALK_KEY ='talk';
    public static function tableName()
    {
        return '{{%user_album}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['album_name'], 'required'],
            [['count', 'user_id'], 'integer'],
            [['album_name', 'album_desc', 'index_img'], 'string', 'max' => 255],
            [['show_access', 'key'], 'string', 'max' => 32],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'album_name' => '相册名字',
            'album_desc' => '相册描述',
            'index_img' => '封面图',
            'count' => '总数',
            'user_id' => 'User ID',
            'show_access' => 'Show Access',
            'key' => 'Key',
        ];
    }
}
