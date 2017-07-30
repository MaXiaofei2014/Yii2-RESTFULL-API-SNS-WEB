<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%show_access}}".
 *
 * @property integer $id
 * @property integer $key
 * @property string $value
 */
class ShowAccess extends \yii\db\ActiveRecord
{
    /***
     * 访问权限常量
     */
    const SHOW_ACCESS_SELF =1;
    const SHOW_ACCESS_CLASSMATE =1;
    const SHOW_ACCESS_SCHOOL =1;
    const SHOW_ACCESS_ALL =1;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%show_access}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['key','value'], 'required'],
            [['key'], 'integer'],
            [['value'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'key' => 'Key',
            'value' => 'Value',
        ];
    }
}
