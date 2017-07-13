<?php
return [
    'charset' => 'utf-8',
    'language' => 'zh-CN',
    'timeZone' => 'Asia/Shanghai',
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
            'cachePath' => '@frontend/runtime/cache2',
        ],
        'redis' => [
            'class' => 'yii\redis\Connection',
            'hostname' => '127.0.0.1',
            'port' => 6379,
            'database' => 0,
        ],
        //格式化
        'formatter' => [
            'dateFormat' => 'yyyy-MM-dd',
            'datetimeFormat' => 'yyyy-MM-dd HH:mm:ss',
        ],
        
    ],
    //这是自己加入的
    'bootstrap' => ['debug'],
    'modules'=>[
        
        'gii' => [
            'class' => 'yii\gii\Module',
            'allowedIPs' => ['127.0.0.1', '::1','192.168.0.*'] // 按需调整这里
        ],
        'debug' => [
            'class' => 'yii\debug\Module',
             'allowedIPs' => ['127.0.0.1', '::1','192.168.0.*'] // 按需调整这里
        ],
    ],
];
