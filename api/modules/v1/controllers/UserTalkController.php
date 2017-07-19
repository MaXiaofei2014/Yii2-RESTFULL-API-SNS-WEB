<?php

namespace api\modules\v1\controllers;
use api\models\UserTalk;
use common\models\TalkComment;
use yii\data\ActiveDataProvider;
use yii\db\Query;

use yii\rest\ActiveController;


class UserTalkController extends ActiveController
{
    public $modelClass = 'api\models\UserTalk';

    public function actions()
    {
        $actions = parent::actions();
        // disable the "delete" and "create" actions
        unset($actions['index'], $actions['create'], $actions['view']);
        return $actions;
    }
    /**
     *用户说说列表
     *
     **/
    public function actionIndex()
    {
        $user_id=(int)\Yii::$app->request->get('user_id');
        $query=UserTalk::find()->where(['user_id'=>$user_id]);
        $provider = new ActiveDataProvider([
            'query' =>$query,
            'pagination' => [
                'pageSize' => 6,
            ],
            'sort' => [
                'defaultOrder' => [
                    'id' => SORT_DESC,
                ]
            ],
        ]);

      return $provider;
    }

    /**
     * @return static
     * 说说详情
     */
    public function actionView()
    {
          $param=\Yii::$app->request->get();
          $info=UserTalk::findOne($param['id']);
          return $info;


    }
}



