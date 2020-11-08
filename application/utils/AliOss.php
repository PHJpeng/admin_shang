<?php
/**
 * Created by PhpStorm.
 */

namespace app\utils;

use OSS\Core\OssException;
use OSS\OssClient;
use think\facade\Env;
use think\facade\Log;
use think\Image;

require_once 'aliyun-oss/autoload.php';

class AliOss
{   
    //适配安卓add - 批量导入图片
    public static function uploadFileTwo($mulu,$type,$tmp_name) {
        $type = explode('.',$type);
        try {
            $KeyId = Env::get('oss.OSS_ACCESSKEYID');
            $KeySecret = Env::get('oss.OSS_ACCESSKEYSECRET');
            $EndPoint = Env::get('oss.OSS_SERVERINTERNAL');
            $Bucket = Env::get('oss.OSS_BUCKET');
            //实例化
            $ossClient = new OssClient($KeyId, $KeySecret, $EndPoint);
            //sha1加密 生成文件名 连接后缀
            $fileName = $mulu.'/'.sha1(date('YmdHis', time()) . uniqid()) . '.' . end($type);
            //执行阿里云上传
            $result = $ossClient->uploadFile($Bucket, $fileName, $tmp_name);
            $url_arr = explode('/',$result['info']['url']);
            return $url_arr[3].'/'.$url_arr[4];
        } catch (OssException $e) {
            $arr = ['code'=>0,'msg'=>$e->getMessage(),'data'=>''];
        }
        return $arr;
    }

    /**
     * 上传图片到阿里云
     * @param $mulu
     * @param $file
     * @return array|null|string
     */
    public static function uploadFile($mulu,$file) {
        $tmp_name = $file->getInfo('tmp_name');
        $type = explode('.',$file->getInfo('name'));
        $endName = end($type);
        $endArr = ['HEIC','heic'];
        if(in_array($endName,$endArr)){
            $endName = 'jpg';
        }
        try {
            $KeyId = Env::get('oss.OSS_ACCESSKEYID');
            $KeySecret = Env::get('oss.OSS_ACCESSKEYSECRET');
            $EndPoint = Env::get('oss.OSS_SERVERINTERNAL');
            $Bucket = Env::get('oss.OSS_BUCKET');
            //实例化
            $ossClient = new OssClient($KeyId, $KeySecret, $EndPoint);
            //sha1加密 生成文件名 连接后缀
            $fileName = $mulu.'/'.sha1(date('YmdHis', time()) . uniqid()) . '.' . $endName;
            //执行阿里云上传
            $result = $ossClient->uploadFile($Bucket, $fileName, $tmp_name);
            $url_arr = explode('/',$result['info']['url']);
            return $url_arr[3].'/'.$url_arr[4];
        } catch (OssException $e) {
            $arr = ['code'=>0,'msg'=>$e->getMessage(),'data'=>''];
        }
        return $arr;
    }
}