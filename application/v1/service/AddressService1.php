<?php
/**
 * Created by PhpStorm.
 */

namespace app\v1\service;


use app\model\AddressModel;
use app\model\CityModel;
use think\Controller;
use think\Db;
use think\Exception;

class AddressService extends Controller
{

    /**
     * 地址列表
     * @param $param
     * @return array|mixed
     */
    public static function addressList($param)
    {
        try{
            $address_m = new AddressModel();
            $user      = json_decode(base64_decode($param['authorization']),true);

            $where[] = ['uid', '=', $user['userid']];
            $field   = 'id,name,mobile,address,address_name,area,is_default';
            $addressList = $address_m->getList($where, $field, 'id asc');

            return ['data'=>$addressList];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 添加地址、编辑地址
     * @param $param
     * @return array|mixed
     */
    public static function editAddress($param)
    {
        try{
            $address_m = new AddressModel();
            $user      = json_decode(base64_decode($param['authorization']),true);

            $editData = [
                'addtime'      => time(),
                'uid'          => $user['userid'],
                'area'         => $param['area'],
                'name'         => $param['name'],
                'mobile'       => $param['mobile'],
                'address'      => $param['address'],
                'address_name' => $param['address_name'],
                'detailed'     => $param['address_name'].$param['address'].$param['area']
            ];

            Db::startTrans();

            if ($param['is_default'] == 1){
                $address_m->edit(['is_default' => 2], ['uid' => $user['userid']]);
            }

            if ($param['type'] == 'add'){
                $editData['addtime'] = time();
                $address_m->add($editData);
            }

            if($param['type'] == 'edit') {
                $address_m->edit($editData, ['id'=>$param['addressId']]);
            }
            Db::commit();
            return ['data'=>[]];
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 删除地址
     * @param $param
     * @return array|mixed
     */
    public static function deleteAddress($param)
    {
        try{
            $address_m = new AddressModel();
            $user      = json_decode(base64_decode($param['authorization']),true);

            if($param['addressId']){
                $where['id'] = $param['addressId'];
            }
            $where['uid'] = $user['userid'];

            $address_m->where($where)->delete();
            return ['data'=>[]];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 获取默认收货地址
     * @param $param
     * @return array|mixed
     */
    public static function getDefaultAddress($param)
    {
        try{
            $address_m = new AddressModel();
            $user      = json_decode(base64_decode($param['authorization']),true);

            $where[] = ['uid', '=', $user['userid']];
            $where[] = ['is_default', '=', AddressModel::DEFAULT_YES];
            $field   = 'id,name,mobile,address,address_name,area,is_default';
            $addressList = $address_m->findOne($where, $field);

            return ['data'=>$addressList];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 获取省列表
     * @param
     * @return array|mixed
     */
    public static function getProvince()
    {
        try{
            $city_m = new CityModel();

            $where[] = ['level', '=', CityModel::LEVEL_ONE];
            $cityList = $city_m->getList($where);

            return ['data'=>$cityList];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }

    /**
     * 根据PID获取下级地址列表
     * @param $param
     * @return array|mixed
     */
    public static function getNextCityList($param)
    {
        try{
            $city_m = new CityModel();

            $where[] = ['level', '=', CityModel::LEVEL_TWO];
            $where[] = ['pid', '=', $param['pid']];
            $cityList = $city_m->getList($where);

            return ['data'=>$cityList];
        }catch (Exception $e){
            return ['msg'=>$e->getMessage()];
        }
    }
}