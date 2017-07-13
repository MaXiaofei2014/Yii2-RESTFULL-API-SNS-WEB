<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\ArticleSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Articles';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="article-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Article', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
           
            [
            'attribute' => 'title',
            'value' => function($model){
            return mb_substr($model['title'],0,20,'utf8');
            }
            ],
            
            [
                'attribute' => 'desc',
                'value' => function($model){
                     return mb_substr($model['desc'],0,20,'utf8');
                  }
            ],
           
            [
                'attribute' => 'content',
                'value' => function($model){
                return mb_substr($model['content'],0,20,'utf8');
                }
            ],
            
            'created_at:datetime',
            'updated_at:datetime',
           
            [   
                 'header' => '操作', 
                 'headerOptions' => ['width' => '210'],
                 'class' => 'yii\grid\ActionColumn',
            ],
            
        ],
    ]); ?>
</div>
