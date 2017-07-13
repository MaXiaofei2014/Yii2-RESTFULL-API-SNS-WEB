<?php
namespace frontend\controllers;
use yii\web\Controller;
use api\models\UserTalk;

class UserTalkController extends Controller
{
    
    
    
    public function actionIndex(){
        $model=UserTalk::find()->where(['id'=>1])->one();
       echo $model->user->username;
        return $this->render('index');
        
    }
    
}
   

