<?php

namespace app\utils;

use think\Exception;
use think\facade\Env;
use think\facade\Log;

class aliyunLogs
{

    private $client;
    private $endpoint;              // 骤创建 project 所属区域匹配的 Endpoint
    private $accessKeyId;           // 阿里云访问秘钥 AccessKeyId
    private $accessKey;             // 阿里云访问秘钥 AccessKeySecret
    private $project;               // 项目名称
    private $logstore;              // 日志库名称


    public function __construct()
    {
        /* 使用 autoloader 类自动加载所有需要的 PHP 模块。注意使用合适的路径指向 autoloader 类所在文件*/
        require_once 'aliyun_log/Log_Autoload.php';
        $this->logConfig();
        $this->client = new \Aliyun_Log_Client($this->endpoint, $this->accessKeyId, $this->accessKey);
    }

    /**
     * 写入日志
     * @param array $contents
     * @param string $topic 主题名称
     * @param string $source 日志的来源
     * @return \Aliyun_Log_Models_PutLogsResponse
     */
    public function set_logs(array $contents, $topic = '', $source = '')
    {
        $logitems = array();
        $logItem = new \Aliyun_Log_Models_LogItem();
        $logItem->setTime(time());
        $logItem->setContents($contents);
        array_push($logitems, $logItem);
        $request = new \Aliyun_Log_Models_PutLogsRequest($this->project, $this->logstore, $topic, $source, $logitems);
        $result = $this->client->putLogs($request);
        return $result;
    }

    /**
     * @param string $project 项目名
     * @param string $logStore logstore名称
     * @param integer $from 开始时间
     * @param integer $to 结束时间
     * @param string $topic 日志的主题名称
     * @param string $query 用户定义的查询
     * @param integer $line 查询返回行号
     * @param nteger $offset 要返回的日志偏移量
     * @param bool $reverse 如果reverse设置为true，查询将首先返回最新日志
     */

    public function querylogs($from, $to, $topic = '', $query = '')
    {
        #查询日志数据
//        $from = time() - 3600;
//        $to = time();
        $result = NULL;
        while (is_null($result) || (!$result->isCompleted())) {
            $request = new \Aliyun_Log_Models_GetLogsRequest($this->project, $this->logstore, $from, $to, $topic, $query, 5, 0, False);
            $result = $this->client->getLogs($request);
        }
    }

    /**
     * 查询日志分布情况询（注意，要查询日志，必须保证已经创建了索引，PHP SDK 不提供该接口，请在控制台创建）
     * @throws \Aliyun_Log_Exception
     */
    public function situation()
    {
        $topic = "";
        $query = '';
        $from = time() - 3600;
        $to = time();
        $res3 = NULL;
        while (is_null($res3) || (!$res3->isCompleted())) {
            $req3 = new \Aliyun_Log_Models_GetHistogramsRequest($this->project, $this->logstore, $from, $to, $topic, $query);
            $res3 = $this->client->getHistograms($req3);
        }
        print_r($res3);
    }

    /**
     * #创建 logstore
     * @throws \Aliyun_Log_Exception
     */
    public function addCreateLogstore()
    {

        $req = new \Aliyun_Log_Models_CreateLogstoreRequest($this->project, $this->logstore, 3, 2);
        $res = $this->client->createLogstore($req);
        #等待 logstore 生效
        sleep(60);
    }

    /**
     * 列出当前 project 下的所有日志库名称
     * @return \Aliyun_Log_Models_ListLogstoresResponse
     */
    public function getLogstoresList()
    {
        $req = new \Aliyun_Log_Models_ListLogstoresRequest($this->project);
        $logstoresList = $this->client->listLogstores($req);
        return $logstoresList;
    }


    /**s
     */
    private function logConfig(): void
    {
        // 骤创建 project 所属区域匹配的 Endpoint
        $this->endpoint = Env::get('logs.endpoint');
        // 阿里云访问秘钥 AccessKeyId
        $this->accessKeyId = Env::get('logs.accessKeyId');
        // 阿里云访问秘钥 AccessKeySecret
        $this->accessKey = Env::get('logs.accessKey');
        // 项目名称
        $this->project = Env::get('logs.project');
        // 日志库名称
        $this->logstore = Env::get('logs.logstore');
    }

}