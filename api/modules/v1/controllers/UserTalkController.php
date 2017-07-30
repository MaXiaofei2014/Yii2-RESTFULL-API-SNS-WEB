<?php
namespace api\modules\v1\controllers;
use api\models\UserTalk;
use common\models\TalkMedia;
use yii\data\ActiveDataProvider;
class UserTalkController extends BaseController
{
    public $modelClass = 'api\models\UserTalk';

    public function actions()
    {
        $actions = parent::actions();
        // disable the "delete" and "create" actions
        unset($actions['index'], $actions['create'], $actions['view'],$actions['delete']);
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

    /***
     * 返回当前get提交的参数
     *自定义方法访问请看路由规则配置
     */
    public function actionAnother()
    {
        $param=\Yii::$app->request->get('action','another');
        return $param;
    }
    /***
     * 创建一个新的说说
     * */
    public function actionCreate()
    {
        $UserTalk=new UserTalk();
        $UserTalk->load(\Yii::$app->request->post());

        if ( $UserTalk->validate() && $UserTalk->save(false)){
            //说说媒体插入
            $TalkMedia=new TalkMedia();
            $TalkMedia->load(\Yii::$app->request->post());
            if ($TalkMedia->validate() && $TalkMedia->save(false)){
                return  $UserTalk->findOne( $UserTalk->id);
            }
            else{
                return  $TalkMedia->getFirstErrors();
            }
        }
        else{
            return  $UserTalk->getFirstErrors();
        }
    }
    /***
     * 删除一个新的说说
     */
    public function actionDelete(){
        $param=\Yii::$app->request->get();
        $talk_id=(int)$param['id'];

        $TalkModel=UserTalk::findOne($talk_id);
        if ($TalkModel !=null){
            $TalkModel->delete();
        }
        return ;
    }

}



