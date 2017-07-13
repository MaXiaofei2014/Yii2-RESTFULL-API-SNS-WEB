<?php
namespace api\models;
use common\models\User as CUser;
use yii\web\Link;
use yii\helpers\Url;
class User extends CUser{



    public function fields()
    {
        return ['id','username','header_img','cover_img','links'];
    }

    public function getlinks()
    {

        return [
            Link::REL_SELF => Url::to(['user/view', 'id' => $this->id], true),
        ];
    }
}