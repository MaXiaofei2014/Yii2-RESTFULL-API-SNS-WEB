<?php

namespace common\models;

use Yii;
use yii\helpers\ArrayHelper;
/**
 * This is the model class for table "{{%talk_comment}}".
 *
 * @property integer $id
 * @property integer $talk_id
 * @property integer $parent_id
 * @property integer $user_id
 * @property integer $is_push
 * @property integer $created_at
 */
class TalkComment extends \yii\db\ActiveRecord
{
    public $user_info;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%talk_comment}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['talk_id','parent_id','user_id','content'], 'required'],
            [['talk_id', 'parent_id', 'user_id', 'is_push', 'created_at'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'talk_id' => '说说ID',
            'parent_id' => '上级ID',
            'user_id' => '评论用户ID',
            'is_push' => '是否推送',
            'created_at' => '创建时间',
            'content'=>'评论内容',
            'parent_user_id'=>'回复给谁',
        ];
    }

    /**
     * get the comment for a talk
     *
     * @param $talk_id int 说说ID
     * @return static[]
     */
    public function TalkComment($talk_id)
    {
        $_list=self::findAll(['talk_id'=>$talk_id]);
        $data=$list=[];
        foreach ($_list as $value){
            $data=ArrayHelper::toArray($value);
            $data['user']=$value->user;
            $data['parent_user']=$value->parentuser;
            $list[]=$data;
        }
        return $list;
    }
    /***
     * get the comment user
     */
    public function getuser()
    {
        return  $this->hasOne(\api\models\User::className(),['id'=>'user_id'])->select('username,header_img');
    }
    /***
     * get the reply comment of user
     */
    public function getparentuser()
    {
        return $this->hasOne(\api\models\User::className(),['id'=>'parent_id'])->select('username,header_img');
    }
    /**
     * get complete the comment list
     */
    public static function getCommonList($talk_id)
    {

        $data=self::TalkComment($talk_id);
        return $data;

    }

    /**
     * 组装数据
     */
    public static function Assemble($data)
    {


    }


}
