<?php

namespace common\models;
use Yii;
use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "yii_article".
 *
 * @property integer $id
 * @property string $title
 * @property string $desc
 * @property string $content
 * @property string $created_at
 * @property string $updated_at
 */
class Article extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%article}}';
    }
    public function behaviors(){
       return [
            'class' =>TimestampBehavior::className(),
       ];
        
    }
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'desc', 'content'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     * 
     */
    public function attributeLabels()
    {
        return [
            'id' => '名称',
            'title' => '标题',
            'desc' => '简述',
            'content' => '内容',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
        ];
    }
}
