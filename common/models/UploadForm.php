<?php
namespace common\models;
use yii\base\Model;
use yii\helpers\FileHelper;
class UploadForm extends Model
{
    const UPLOADS_DIR ='/uploads';
    public $files;

    public function rules()
    {
        return [
            [['files'], 'file', 'skipOnEmpty' => false, 'extensions' => 'png,jpg', 'maxFiles' => 4],
        ];
    }

    public function upload()
    {
        if ($this->validate()) {
            $create_path=$this->getPath();
            foreach ($this->files as $file) {
                $new_file_name =$this->getNewName($file->baseName);//新的名字
                $info=$create_path.$new_file_name.'.'.$file->extension;
                $file->saveAs($info);
                $result[]=$this->getUrl($new_file_name,$file->extension);
            }
            return  $result;
        } else {
            return $this->getFirstErrors();
        }
    }
    //获取新的名字
    protected function getNewName($name)
    {
        $name=random_int(10,99).$name;
        $new_name=mb_substr(md5($name),0,16);
        return $new_name;
    }

    protected function getUrl($file_name,$file_ext){
       $url= \Yii::$app->params['staticServer'].self::UPLOADS_DIR.DIRECTORY_SEPARATOR.date('Ymd').DIRECTORY_SEPARATOR.$file_name.'.'.$file_ext;
        return['static_url'=>$url,'extension'=>$file_ext];
    }

    protected function getPath(){

        $base_path=\Yii::getAlias('@static').self::UPLOADS_DIR;
        $create_path=$base_path.DIRECTORY_SEPARATOR.date('Ymd').DIRECTORY_SEPARATOR;
        FileHelper::createDirectory($create_path);
        return $create_path;
    }
}

