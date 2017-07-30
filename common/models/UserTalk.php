<?php

namespace common\models;
use api\models\User;
use Yii;
use yii\behaviors\TimestampBehavior;
use yii\web\Link;

use yii\helpers\Url;
/**
 * This is the model class for table "{{%user_talk}}".
 *
 * @property integer $id
 * @property integer $user_id
 * @property string $talk_content
 * @property string $talk_media
 * @property string $likes
 * @property integer $show_access
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 */
class UserTalk extends \yii\db\ActiveRecord
{
    /***
     * status
     */
    const ACTIVE_STATUS=1;
    const DELETE_STATUS=2;
    const HIDDEN_STATUS=3;
    /**
     * media type
    */
    const TALK_MEDIA_NONE='none';
    const TALK_MEDIA_PICTURE='picture';
    const TALK_MEDIA_SOUND='mp3';
    const TALK_MEDIA_VIDEO='video';

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user_talk}}';
    }

    public function behaviors()
    {
        return [
           TimestampBehavior::className(),
        ];
    }
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'talk_content'], 'required'],
            [['id', 'user_id', 'show_access', 'status', 'created_at', 'updated_at'], 'integer'],
            ['talk_media','default','value'=>TalkMedia::MEDIA_TYPE_NONE],
            ['show_access','default','value'=>ShowAccess::SHOW_ACCESS_ALL],
            ['status','default','value'=>self::HIDDEN_STATUS],
            [['talk_content', 'likes'], 'string'],
            [['talk_media'], 'string', 'max' => 32],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'talk_content' => 'Talk Content',
            'talk_media' => 'Talk Media',
            'likes' => 'Likes',
            'show_access' => 'Show Access',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }


    /**
     * @return \yii\db\ActiveQuery
     * get user for the talk
     */

    public function getuser()
    {
        return $this->hasOne(User::className(),['id'=>'user_id']);
    }
    /**
     * @return \yii\db\ActiveQuery
     * get media info for the talk
     */
    public function getmedia()
    {
         $media=$this->hasMany(TalkMedia::className(),['talk_id'=>'id']);
         return $media;
    }

    /**
     * @return $this
     * get all  clik  the click users list
     */
    public function getclickuser()
    {

        $click= $this->hasMany(User::className(), ['id' => 'click_user_id'])
            ->viaTable('{{%talk_click}}', ['talk_id' => 'id']);
        return $click;

    }

    /**
     * get click number
     * @return int|string
     */
    public function getcountclick()
    {
        $redis=\Yii::$app->redis;
        $count=$redis->get('talk_click:'.$this->id);
        if ($count>0){
            return $count;
        }
        else{
            $count=TalkClick::find()->where(['talk_id'=>$this->id])->count();
            $redis->set('talk_click:'.$this->id,$count);
        }
        return $count;
    }
    public function getcomment()
    {

       $comment=new \common\models\TalkComment;
       $list=$comment->getCommonList($this->id);
        return $list;
    }
    /**
     * get talk  links
     * @return array
     */
    public function getlinks()
    {

        return [
            Link::REL_SELF => Url::to(['user-talk/view', 'id' => $this->id,'expand'=>'user,media,click,Links'], true),
        ];
    }

    /**
     * extra fields
     * @return array
     */
    public function extraFields()
    {
        return ['user','useralbum','media','clickuser','Links','countclick','comment'];
    }

    /**
     * 删除其他有关 如 评论 点赞人
     *
     */
    public function afterDelete()
    {
        parent::afterDelete();
        //删除评论
        TalkComment::deleteAll(['talk_id'=>$this->id]);
    }
}
