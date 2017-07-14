<?php

namespace api\modules\v1\controllers;
use api\models\UserTalk;
use yii\data\ActiveDataProvider;
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

    public function actionIndex()
    {

        $query=UserTalk::find();
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

    public function actionView()
    {
        $param=\Yii::$app->request->get();
        $info=UserTalk::findOne($param['id']);

        return $info;
    }
}



