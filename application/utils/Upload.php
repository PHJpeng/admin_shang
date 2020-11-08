<?php
/**
 * Created by PhpStorm.
 */

namespace app\utils;


use think\facade\App;
use think\Image;


class Upload
{
    /**
     * 上传文件的主处理方法
     * @return mixed
     */

    public static function upFile($file)
    {
        //先把上传文件放到本地服务器，然后移动到远端服务器
//        $file=request()->file('file');
        if(empty($file)){
            return ['msg'=>'数据为空'];
        }
        $rootPath = App::getRootPath();
        $filepath=$rootPath . 'public/uploads/';
        $info = $file->move($filepath);
        $filename = $info->getSaveName();
        //得到本地视频路径
        //$path=$filepath.$filename;
        return $filename;
    }
}