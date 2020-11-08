<?php
/**
 * Created by PhpStorm.
 */

namespace app\v1\service;


use app\model\AdsenseModel;
use app\model\BooksModel;
use app\model\CategoryModel;
use app\model\ShopCateModel;
use app\model\ShopModel;
use app\model\GoodsModel;
use app\model\UserCollectModel;
use app\model\ShareModel;
use app\model\ShareRewardLogModel;
use app\model\UsersBooksModel;
use app\model\UsersBookSourceRecordModel;
use app\model\UsersBookSourceTakingModel;
use app\model\UsersReadProgressModel;
use app\utils\NewAliyunLosg;
use think\Controller;
use think\Db;
use think\Exception;
use think\facade\Cache;
use think\facade\Env;

class TransactionService extends Controller
{

    /**
 * 商品分类
 * @param
 * @return array|mixed
 */
    public static function category()
    {
        try{
            $category_m = new CategoryModel();
            $category_key = 'category';
            $categoryCache = Cache::store('redis')->get("categoryCache:".$category_key);
            if(!$categoryCache){

                $where[] = ['cate_status', '=', 1];
                $where[] = ['pid', '=', 0];
                $topClass = $category_m->getList($where);
                $topId = array_column($topClass, 'id');

                $where_second[] = ['pid', 'in', $topId];
                $where_second[] = ['cate_status', '=', CategoryModel::DEL_NO];
                $secondClass = $category_m->getList($where_second);

                $scat = $returnArr = [];
                foreach ($secondClass as $key => $val) {
                    $scat[$val['pid']][] = $val;
                }

                foreach ($topClass as $k => $v) {
                    if (!empty($scat[$v['id']])) {
                        $returnArr[$v['id']]['list'] = $scat[$v['id']];
                    }
                }
                $cateList = ['top' => $topClass, 'all' => $returnArr];
                Cache::store('redis')->set("categoryCache:".$category_key,json_encode($cateList),60*60*24);
            }else{
                $cateList = json_decode($categoryCache,true);
            }
            return ['data' => $cateList['top']];
        }catch (Exception $e){
            return ['msg'=>'网络异常，请稍后再试'];
        }
    }

    /**
     * 商家列表
     * @param $param
     * @return array|mixed
     */
    public static function merchant($param)
    {
        try{
//            $shop_m = new ShopModel();
            $start = ((int)$param['page'] - 1) * (int)$param['length'];
            if ($param['title']) {
                $where[] = ['status', '=', ShopModel::DEL_NO];
                $where[] = ['shop_name', 'like', '%'.$param['title'].'%'];
            } else {
                $where[] = ['status', '=', ShopModel::DEL_NO];
                $where[] = ['shop_type', '=', $param['type']];
            }
            $shopArr = DB::table('ss_shop')
                ->where($where)
                ->limit($start, $param['length'])
                ->select();

            foreach ($shopArr as $k => $v) {
                $shopArr[$k]['show_type'] = $v['type'] ? $v['type'] : rand(1, 3);
                $shopArr[$k]['shop_logo'] = $v['shop_logo'] ? Env::get('oss.READ_URL').$v['shop_logo'] : '';
                $shopArr[$k]['shop_img1'] = $v['shop_img1'] ? Env::get('oss.READ_URL').$v['shop_img1'] : '';
                $shopArr[$k]['shop_img2'] = $v['shop_img2'] ? Env::get('oss.READ_URL').$v['shop_img2'] : '';
//                $img = DB::table('ss_admin_upload')->where(['id' => $v['shop_logo']])->value('path');
//                $img1 = DB::table('ss_admin_upload')->where(['id' => $v['shop_img1']])->value('path');
//                $img2 = DB::table('ss_admin_upload')->where(['id' => $v['shop_img2']])->value('path');
//
//                $shopArr[$k]['shop_logo'] = isset($img) ? Env::get('oss.READ_URL').$img : '';
//                $shopArr[$k]['shop_img1'] = isset($img1) ? Env::get('oss.READ_URL').$img1 : '';
//                $shopArr[$k]['shop_img2'] = isset($img2) ? Env::get('oss.READ_URL').$img2 : '';
            }

            return ['data' => $shopArr];
        }catch (Exception $e){
            return ['msg'=>'网络异常，请稍后再试'];
        }
    }

    /**
     * 商家详情/新闻详情
     * @param $param
     * @return array|mixed
     */
    public static function news($param)
    {
        try{
            $info = Db::table('ss_shop')
                ->where(['id' => $param['shopid']])
                ->find();

            $info['ctime'] = date('Y-m-d H:i:s', $info['create_time']);
            return ['data' => $info];
        }catch (Exception $e){
            return ['msg'=>'网络异常，请稍后再试'];
        }
    }

    /**
     * 商家分类
     * @param
     * @return array|mixed
     */
    public static function shopCate()
    {
        try{
            $shopcate_m = new ShopCateModel();
            $shopcate_key = 'shopcate';
            $shopcateCache = Cache::store('redis')->get("categoryCache:".$shopcate_key);
            if(!$shopcateCache){

                $where[]  = ['status', '=', ShopCateModel::DEL_NO];
                $shopcate = $shopcate_m->getList($where);

                Cache::store('redis')->set("categoryCache:".$shopcate_key,json_encode($shopcate),60*60*24);
            }else{
                $shopcate = json_decode($shopcateCache,true);
            }
            return ['data' => $shopcate];
        }catch (Exception $e){
            return ['msg'=>'网络异常，请稍后再试'];
        }
    }
    /**
     * 商品列表，推荐商品，搜索商品
     * @param $param
     * @return array|mixed
     */
    public static function goods($param)
    {
        try{
            $goods_m = new GoodsModel();
            $category_m = new CategoryModel();
            $category_key = 'category';
            $categoryCache = Cache::store('redis')->get("categoryCache:".$category_key);
            if(!$categoryCache){

                $where[] = ['cate_status', '=', 1];
                $where[] = ['pid', '=', 0];
                $topClass = $category_m->getList($where);
                $topId = array_column($topClass, 'id');

                $where_second[] = ['pid', 'in', $topId];
                $where_second[] = ['cate_status', '=', CategoryModel::DEL_NO];
                $secondClass = $category_m->getList($where_second);

                $scat = $returnArr = [];
                foreach ($secondClass as $key => $val) {
                    $scat[$val['pid']][] = $val;
                }

                foreach ($topClass as $k => $v) {
                    if (!empty($scat[$v['id']])) {
                        $returnArr[$v['id']]['list'] = $scat[$v['id']];
                    }
                }
                $cateList = ['top' => $topClass, 'all' => $returnArr];
                Cache::store('redis')->set("categoryCache:".$category_key,json_encode($cateList),60*60*24);
            }else{
                $cateList = json_decode($categoryCache,true);
            }

            $start = ((int)$param['page'] - 1) * (int)$param['length'];
            switch ($param['type']) {
                case 1:
                    $where['is_hot'] = GoodsModel::IS_HOT;
                    $where['status'] = GoodsModel::DEL_NO;
                    $goodsArr = $goods_m->getList($where, '', [], $start, $param['length']);
                    break;
                case 2:
                    $where['status'] = GoodsModel::DEL_NO;
                    if ($param['cate'] && isset($cateList['all'][$param['cate']]['list'])) {
                        $cateList = array_column($cateList['all'][$param['cate']]['list'], 'id');
                        $goodsArr = DB::table('ss_goods')
                            ->where($where)
                            ->whereIn('cate', $cateList)
                            ->limit($start, $param['length'])
                            ->select();
                    } else {
                        $goodsArr = $goods_m->getList($where, '', [], $start, $param['length']);
                    }
                    break;
                case 3:
                    $where[] = ['status', '=', GoodsModel::DEL_NO];
                    $where[] = ['title', 'like', '%' . $param['keyword'] . '%'];
                    $goodsArr = $goods_m->getList($where, '', [], $start, $param['length']);
                    break;
            }


            foreach ($goodsArr as $k => $v) {
                $goodsArr[$k]['icon'] = $v['icon'] ? Env::get('oss.READ_URL').$v['icon'] : '';
//                $img = DB::table('ss_admin_upload')->where(['id' => $v['icon']])->value('path');
//                if ($v['icon']) {
//                    $goodsArr[$k]['icon'] = isset($img) ? Env::get('oss.READ_URL').$img : '';
//                } else {
//                    $goodsArr[$k]['icon'] = ShopModel::DEFAULT_IMG;
//                }
            }

            return ['data' => $goodsArr];
        }catch (Exception $e){
            return ['msg'=>'网络异常，请稍后再试'];
        }
    }

    /**
     * 商品详情
     * @param $param
     * @return array|mixed
     */
    public static function goodInfo($param)
    {
        try{
            $goods_m = new GoodsModel();
            $goods = $goods_m->findOne(['id'=>$param['goodid']]);

            $goods['isCollect'] = 2;
            if ($param['authorization']) {
                $user = json_decode(base64_decode($param['authorization']),true);
                $collect_m = new UserCollectModel();
                //查看是否已经收藏
                $where['userid'] = $user['userid'];
                $where['goodid'] = $param['goodid'];
                $where['status'] = 1;
                $collect = $collect_m->findOne($where);
                if ($collect) {
                    $goods['isCollect'] = 1;
                }
            }

            if ($goods['cover_img']) {
                $cover_imgs = explode(',',$goods['cover_img']);
                $cover_imgs = array_filter($cover_imgs);
                for ($i=0;$i<count($cover_imgs);$i++){
//                    $img = DB::table('ss_admin_upload')->where(['id' => $cover_imgs[$i]])->value('path');
//                    $image = isset($img) ? Env::get('oss.READ_URL').$img : '';
//                    $banner[$i] = $image;
                    $banner[$i] = $cover_imgs[$i] ? Env::get('oss.READ_URL').$cover_imgs[$i] : '';
                }

                $goods['cover_img'] = $banner;
            }

            if ($goods['icon']) {
                $goods['icon'] = $goods['icon'] ? Env::get('oss.READ_URL').$goods['icon'] : '';
//                $img = DB::table('ss_admin_upload')->where(['id' => $goods['icon']])->value('path');
//                $image = isset($img) ? Env::get('oss.READ_URL').$img : '';
//                $goods['icon'] = $image;
            }

            return['data' => $goods];
        }catch (Exception $e){
            return ['msg'=>'网络异常，请稍后再试'];
        }
    }

    /**
     * 收藏商品
     * @param $param
     * @return array|mixed
     */
    public static function collectGoods($param)
    {
        try{
            $usercollect_m = new UserCollectModel();
            $user          = json_decode(base64_decode($param['authorization']),true);

            $isCollect = $usercollect_m->findOne(['userid'=>$user['userid'], 'goodid'=>$param['goodid'], 'status' => 1]);
            if ($isCollect || $isCollect['status'] == 2) {
                $editData['status'] = 2;
                $usercollect_m->edit($editData, ['userid'=>$user['userid'], 'goodid'=>$param['goodid']]);
            } elseif (!$isCollect) {

                $data = [
                    'userid' => $user['userid'],
                    'goodid' => $param['goodid'],
                    'status' => 1,
                    'create_time' => time()
                ];
                $usercollect_m->add($data);
            } else {
                $editData['status'] = 2;
                $usercollect_m->edit($editData, ['userid'=>$user['userid'], 'goodid'=>$param['goodid']]);
            }

            return ['data'=>[]];
        } catch (\Exception $e) {

            return ['msg'=>$e->getMessage()];
        }
    }
}