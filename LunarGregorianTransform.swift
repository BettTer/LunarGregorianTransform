//
//  LunarGregorianTransform.swift
//  LunarGregorianTransform
//
//  Created by isee15 on 15/1/17.
//  Copyright (c) 2015年 isee15. All rights reserved.
//

import Foundation
import Timepiece

struct Lunar {
    var isleap = false
    var lunarYear: Int = 0
    var lunarMonth: Int = 0
    var lunarDay: Int = 0
}

struct Solar {
    var solarYear: Int = 0
    var solarMonth: Int = 0
    var solarDay: Int = 0
}

struct LunarMonth {
    
    /// 月份名称
    var monthName: String = ""
    
    /// 该月天数
    var days: Int = 0
    
    /// 是否为闰月
    var isLeapMonth: Bool = false

}

struct SolarMonth {
    
    /// 月份名称
    var monthName: String = ""
    
    /// 该月天数
    var days: Int = 0
}


class LunarGregorianTransform {
    /*
    * |----4位闰月|-------------13位1为30天，0为29天|
    * */
    class var lunar_month_days: [Int] {
        return
        [
                1897, 0x75aa, 0x156a, 0x1096d, 0x95c, 0x14ae, 0xaa4d, 0x1a4c, 0x1b2a, 0x8d55, 0xad4, 0x135a, 0x495d, 0x95c, 0xd49b, 0x149a, 0x1a4a, 0xbaa9, 0x16aa, 0xad4, 0x52da, 0x12b6, 0xe937, 0x936, 0x1496, 0xb64b, 0xd4a, 0xda8, 0x95b5, 0x56c, 0x12ae, 0x492f, 0x92e, 0xcc96, 0x1a94, 0x1d4a, 0xada9, 0xb5a, 0x56c, 0x726e, 0x125c, 0xf92d, 0x192a, 0x1a94, 0xdb4a, 0x16aa, 0xad4, 0x955b, 0x4ba, 0x125a, 0x592b, 0x152a, 0xf695, 0xd94, 0x16aa, 0xaab5, 0x9b4, 0x14b6, 0x6a57, 0xa56, 0x1152a, 0x1d2a, 0xd54, 0xd5aa, 0x156a, 0x96c, 0x94ae, 0x14ae, 0xa4c, 0x7d26, 0x1b2a, 0xeb55, 0xad4, 0x12da, 0xa95d, 0x95a, 0x149a, 0x9a4d, 0x1a4a, 0x11aa5, 0x16a8, 0x16d4, 0xd2da, 0x12b6, 0x936, 0x9497, 0x1496, 0x1564b, 0xd4a, 0xda8, 0xd5b4, 0x156c, 0x12ae, 0xa92f, 0x92e, 0xc96, 0x6d4a, 0x1d4a, 0x10d65, 0xb58, 0x156c, 0xb26d, 0x125c, 0x192c, 0x9a95, 0x1a94, 0x1b4a, 0x4b55, 0xad4, 0xf55b, 0x4ba, 0x125a, 0xb92b, 0x152a, 0x1694, 0x96aa, 0x15aa, 0x12ab5, 0x974, 0x14b6, 0xca57, 0xa56, 0x1526, 0x8e95, 0xd54, 0x15aa, 0x49b5, 0x96c, 0xd4ae, 0x149c, 0x1a4c, 0xbd26, 0x1aa6, 0xb54, 0x6d6a, 0x12da, 0x1695d, 0x95a, 0x149a, 0xda4b, 0x1a4a, 0x1aa4, 0xbb54, 0x16b4, 0xada, 0x495b, 0x936, 0xf497, 0x1496, 0x154a, 0xb6a5, 0xda4, 0x15b4, 0x6ab6, 0x126e, 0x1092f, 0x92e, 0xc96, 0xcd4a, 0x1d4a, 0xd54, 0x956c, 0x155c, 0x125c, 0x792e, 0x192c, 0xfa95, 0x1a94, 0x1b4a, 0xab55, 0xad4, 0x14da, 0x8a5d, 0xa5a, 0x1152b, 0x152a, 0x1694, 0xd6aa, 0x15aa, 0xab4, 0x94ba, 0x14b6, 0xa56, 0x7527, 0xd26, 0xee53, 0xd54, 0x15aa, 0xa9b5, 0x96c, 0x14ae, 0x8a4e, 0x1a2c, 0x11d26, 0x1aa4, 0x1b54, 0xcd6a, 0xada, 0x95c, 0x949d, 0x145a, 0x1a2a, 0x5b25, 0x1aa4, 0xfad2, 0x16b4, 0xaba, 0xa95b, 0x936, 0x1496, 0x9a4b, 0x154a, 0x136a5, 0xda4, 0x15ac, 0xcab6, 0x126e, 0x92e, 0x9497, 0xa96, 0xd4a, 0x6da5, 0xb54, 0xf56a, 0x155c, 0xa5c, 0xb92e, 0x152c, 0x1a94, 0x9d4a, 0x1b2a, 0x16b55, 0xad4, 0x14da, 0xca5d, 0xa5a, 0x151a, 0xba95, 0x1654, 0x16aa, 0x4ad5, 0xab4, 0xf4ba, 0x14b6, 0xa56, 0xb517, 0xd16, 0xe52, 0x96aa, 0xd6a, 0x5b4, 0x34b6, 0x14ae, 0xca2e, 0x1a2c, 0x1d16, 0xad52, 0x1b52, 0xb6a, 0x656d, 0x55c, 0xf45d, 0x145a, 0x1a2a, 0xda95, 0x16a4, 0x1ad2, 0x8ada, 0xaba, 0x1455b, 0x8b6, 0x1456, 0xd52b, 0x152a, 0x1694, 0x96b2, 0x15ac, 0xab6, 0x64b7, 0x8ae, 0xec57, 0xa56, 0xd2a, 0xcd95, 0xb54, 0x156a, 0x8a6d, 0x95c, 0x14ae, 0x4a56, 0x1a54, 0xdd2a, 0x1aaa, 0xb54, 0xb56a, 0x12da, 0x95c, 0x74ab, 0x149a, 0xfa4b, 0x1652, 0x16aa, 0xaad5, 0x5b4, 0x12ba, 0x895b, 0x936, 0x13497, 0xc96, 0xd52, 0xd6aa, 0xd6a, 0x574, 0x92b6, 0x126e, 0x92e, 0x6c96, 0x1c94, 0xfd4a, 0x1b52, 0xb6a, 0xa56d, 0x55c, 0x125c, 0x992d, 0x192a, 0x17a95, 0x1694, 0x16d2, 0xeada, 0xaba, 0x4ba, 0xb25b, 0x1256, 0x152a, 0x7a95, 0x1694, 0x116aa, 0x15aa, 0xab6, 0xa4b7, 0x4ae, 0xa56, 0x952b, 0xd2a, 0xd94, 0x35aa, 0x156a, 0xc96d, 0x95c, 0x14ae, 0xaa4e, 0x1a4c, 0x1d2a, 0x6d55, 0xb54, 0xf55a, 0x12ba, 0x95c, 0xd49d, 0x149a, 0x1a4a, 0x9b29, 0x16aa, 0xad4, 0x32da, 0x12b6, 0xc957, 0x936, 0x1496, 0xb64b, 0xd4a, 0x15a8, 0x76b5, 0x56c, 0x112b6, 0x126e, 0x92e, 0xcc96, 0x1c94, 0x1d4a, 0x8da9, 0xb5a, 0x56c, 0x52ae, 0x125c, 0xd92d, 0x192a, 0x1a94, 0xbb4a, 0x16ca, 0xad4, 0x755b, 0x4ba, 0xf25b, 0x1256, 0x152a, 0xd695, 0xe94, 0x16aa, 0x8ad5, 0x9b6, 0x4b6, 0x5257, 0xa56
        ]
    }

    class var solar_1_1: [Int] {
        return
        [
                1897, 0xed436, 0xed64a, 0xed83f, 0xeda53, 0xedc48, 0xede3d, 0xee050, 0xee244, 0xee439, 0xee64d, 0xee842, 0xeea36, 0xeec4a, 0xeee3e, 0xef052, 0xef246, 0xef43a, 0xef64e, 0xef844, 0xefa37, 0xefc4b, 0xefe41, 0xf0054, 0xf0248, 0xf043c, 0xf0650, 0xf0845, 0xf0a38, 0xf0c4d, 0xf0e42, 0xf1037, 0xf124a, 0xf143e, 0xf1651, 0xf1846, 0xf1a3a, 0xf1c4e, 0xf1e44, 0xf2038, 0xf224b, 0xf243f, 0xf2653, 0xf2848, 0xf2a3b, 0xf2c4f, 0xf2e45, 0xf3039, 0xf324d, 0xf3442, 0xf3636, 0xf384a, 0xf3a3d, 0xf3c51, 0xf3e46, 0xf403b, 0xf424e, 0xf4443, 0xf4638, 0xf484c, 0xf4a3f, 0xf4c52, 0xf4e48, 0xf503c, 0xf524f, 0xf5445, 0xf5639, 0xf584d, 0xf5a42, 0xf5c35, 0xf5e49, 0xf603e, 0xf6251, 0xf6446, 0xf663b, 0xf684f, 0xf6a43, 0xf6c37, 0xf6e4b, 0xf703f, 0xf7252, 0xf7447, 0xf763c, 0xf7850, 0xf7a45, 0xf7c39, 0xf7e4d, 0xf8042, 0xf8254, 0xf8449, 0xf863d, 0xf8851, 0xf8a46, 0xf8c3b, 0xf8e4f, 0xf9044, 0xf9237, 0xf944a, 0xf963f, 0xf9853, 0xf9a47, 0xf9c3c, 0xf9e50, 0xfa045, 0xfa238, 0xfa44c, 0xfa641, 0xfa836, 0xfaa49, 0xfac3d, 0xfae52, 0xfb047, 0xfb23a, 0xfb44e, 0xfb643, 0xfb837, 0xfba4a, 0xfbc3f, 0xfbe53, 0xfc048, 0xfc23c, 0xfc450, 0xfc645, 0xfc839, 0xfca4c, 0xfcc41, 0xfce36, 0xfd04a, 0xfd23d, 0xfd451, 0xfd646, 0xfd83a, 0xfda4d, 0xfdc43, 0xfde37, 0xfe04b, 0xfe23f, 0xfe453, 0xfe648, 0xfe83c, 0xfea4f, 0xfec44, 0xfee38, 0xff04c, 0xff241, 0xff436, 0xff64a, 0xff83e, 0xffa51, 0xffc46, 0xffe3a, 0x10004e, 0x100242, 0x100437, 0x10064b, 0x100841, 0x100a53, 0x100c48, 0x100e3c, 0x10104f, 0x101244, 0x101438, 0x10164c, 0x101842, 0x101a35, 0x101c49, 0x101e3d, 0x102051, 0x102245, 0x10243a, 0x10264e, 0x102843, 0x102a37, 0x102c4b, 0x102e3f, 0x103053, 0x103247, 0x10343b, 0x10364f, 0x103845, 0x103a38, 0x103c4c, 0x103e42, 0x104036, 0x104249, 0x10443d, 0x104651, 0x104846, 0x104a3a, 0x104c4e, 0x104e43, 0x105038, 0x10524a, 0x10543e, 0x105652, 0x105847, 0x105a3b, 0x105c4f, 0x105e45, 0x106039, 0x10624c, 0x106441, 0x106635, 0x106849, 0x106a3d, 0x106c51, 0x106e47, 0x10703c, 0x10724f, 0x107444, 0x107638, 0x10784c, 0x107a3f, 0x107c53, 0x107e48, 0x10803d, 0x108250, 0x108446, 0x10863a, 0x10884e, 0x108a42, 0x108c36, 0x108e4a, 0x10903e, 0x109251, 0x109447, 0x10963b, 0x10984f, 0x109a43, 0x109c37, 0x109e4b, 0x10a041, 0x10a253, 0x10a448, 0x10a63d, 0x10a851, 0x10aa45, 0x10ac39, 0x10ae4d, 0x10b042, 0x10b236, 0x10b44a, 0x10b63e, 0x10b852, 0x10ba47, 0x10bc3b, 0x10be4f, 0x10c044, 0x10c237, 0x10c44b, 0x10c641, 0x10c835, 0x10ca48, 0x10cc3d, 0x10ce50, 0x10d045, 0x10d239, 0x10d44c, 0x10d642, 0x10d837, 0x10da4a, 0x10dc3e, 0x10de52, 0x10e047, 0x10e23a, 0x10e44e, 0x10e643, 0x10e838, 0x10ea4b, 0x10ec41, 0x10ee54, 0x10f049, 0x10f23c, 0x10f450, 0x10f645, 0x10f839, 0x10fa4c, 0x10fc42, 0x10fe37, 0x11004b, 0x11023e, 0x110452, 0x110647, 0x11083b, 0x110a4e, 0x110c43, 0x110e38, 0x11104c, 0x11123f, 0x111435, 0x111648, 0x11183c, 0x111a4f, 0x111c45, 0x111e39, 0x11204d, 0x112242, 0x112436, 0x11264a, 0x11283e, 0x112a51, 0x112c46, 0x112e3b, 0x11304f, 0x113244, 0x113439, 0x11364d, 0x113842, 0x113a54, 0x113c49, 0x113e3d, 0x114051, 0x114246, 0x11443a, 0x11464e, 0x114844, 0x114a37, 0x114c4a, 0x114e3e, 0x115052, 0x115247, 0x11543c, 0x115650, 0x115845, 0x115a38, 0x115c4c, 0x115e41, 0x116054, 0x116248, 0x11643d, 0x116651, 0x116847, 0x116a3a, 0x116c4e, 0x116e43, 0x117037, 0x11724a, 0x11743e, 0x117652, 0x117848, 0x117a3c, 0x117c50, 0x117e45, 0x118039, 0x11824c, 0x118441, 0x118635, 0x118849, 0x118a3d, 0x118c51, 0x118e46, 0x11903b, 0x11924d, 0x119442, 0x119637, 0x11984b, 0x119a3e, 0x119c52, 0x119e48, 0x11a03c, 0x11a24f, 0x11a444, 0x11a638, 0x11a84c, 0x11aa41, 0x11ac35, 0x11ae49, 0x11b03e, 0x11b251, 0x11b446, 0x11b63a, 0x11b84e, 0x11ba42, 0x11bc36, 0x11be4b, 0x11c03f, 0x11c252, 0x11c448, 0x11c63c, 0x11c84f, 0x11ca43, 0x11cc38, 0x11ce4c, 0x11d042, 0x11d235, 0x11d449, 0x11d63d, 0x11d851, 0x11da45, 0x11dc39, 0x11de4d, 0x11e043, 0x11e236, 0x11e44b, 0x11e63f, 0x11e853, 0x11ea47, 0x11ec3b, 0x11ee4f, 0x11f044, 0x11f238, 0x11f44c, 0x11f642, 0x11f836, 0x11fa4a
        ]
    };

    class func GetBitInt(data: Int, length: Int, shift: Int) -> Int {
        return (data & (((1 << length) - 1) << shift)) >> shift;
    }

    //WARNING: Dates before Oct. 1582 are inaccurate
    class func SolarToInt(y: Int, m: Int, d: Int) -> Int {
        let m = (m + 9) % 12;
        let y = y - m / 10;
        return 365 * y + y / 4 - y / 100 + y / 400 + (m * 306 + 5) / 10 + (d - 1);
    }

    class func SolarFromInt(g: Int) -> Solar {
        //var y:Int = (10000*g + 14780)/3652425;
        //int overflow
        var y: Int = Int((1000.0 * Double(g) + 1478.0) / 365242.5);
        var ddd = g - (365 * y + y / 4 - y / 100 + y / 400);
        if (ddd < 0) {
            y = y - 1;
            ddd = g - (365 * y + y / 4 - y / 100 + y / 400);
        }
        let mi = (100 * ddd + 52) / 3060;
        let mm = (mi + 2) % 12 + 1;
        y = y + (mi + 2) / 12;
        let dd = ddd - (mi * 306 + 5) / 10 + 1;
        let solar = Solar(solarYear: y, solarMonth: mm, solarDay: dd)
        return solar;
    }

    class func IsLeapYear(y: Int) -> Bool {
        return ((y % 4 == 0 && y % 100 != 0) || (y % 400 == 0));
    }

    class func LunarToSolar(lunar: Lunar) -> Solar {
        let days = lunar_month_days[lunar.lunarYear - lunar_month_days[0]];
        let leap = GetBitInt(data: days, length: 4, shift: 13);
        var offset = 0;
        var loopend = leap;
        if (!lunar.isleap) {
            if (lunar.lunarMonth <= leap || leap == 0) {
                loopend = lunar.lunarMonth - 1;
            } else {
                loopend = lunar.lunarMonth;
            }
        }
        for i in 0 ..< loopend {
            offset += GetBitInt(data: days, length: 1, shift: 12 - i) == 1 ? 30 : 29;
        }
        offset += lunar.lunarDay;

        let solar11 = LunarGregorianTransform.solar_1_1[lunar.lunarYear - LunarGregorianTransform.solar_1_1[0]];

        let y = GetBitInt(data: solar11, length: 12, shift: 9);
        let m = GetBitInt(data: solar11, length: 4, shift: 5);
        let d = GetBitInt(data: solar11, length: 5, shift: 0);

        return SolarFromInt(g: SolarToInt(y: y, m: m, d: d) + offset - 1);
    }

    class func SolarToLunar(solar: Solar) -> Lunar {
        var lunar = Lunar();
        var index = solar.solarYear - LunarGregorianTransform.solar_1_1[0];
        let data = (solar.solarYear << 9) | (solar.solarMonth << 5) | (solar.solarDay);
        var solar11 = 0;
        if (self.solar_1_1[index] > data) {
            
            index = index - 1;
        }
        solar11 = solar_1_1[index];
        let y = GetBitInt(data: solar11, length: 12, shift: 9);
        let m = GetBitInt(data: solar11, length: 4, shift: 5);
        let d = GetBitInt(data: solar11, length: 5, shift: 0);
        var offset = SolarToInt(y: solar.solarYear, m: solar.solarMonth, d: solar.solarDay) - SolarToInt(y: y, m: m, d: d);

        let days = lunar_month_days[index];
        let leap = GetBitInt(data: days, length: 4, shift: 13);

        let lunarY = index + solar_1_1[0];
        var lunarM = 1;
        var lunarD = 1;
        offset += 1;
        
        for i in 0 ..< 13 {
            let dm = GetBitInt(data: days, length: 1, shift: 12 - i) == 1 ? 30 : 29;
            if (offset > dm) {
                lunarM += 1;
                offset -= dm;
            } else {
                break;
            }
        }
        lunarD = (Int)(offset);
        lunar.lunarYear = lunarY;
        lunar.lunarMonth = lunarM;
        lunar.isleap = false;
        if (leap != 0 && lunarM > leap) {
            lunar.lunarMonth = lunarM - 1;
            if (lunarM == leap + 1) {
                lunar.isleap = true;
            }
        }
        lunar.lunarDay = lunarD;
        return lunar;
    }
    
    ///  获取某个农历年的具体月份信息 [] -> 数组
    class func getLunarYearMonthModel(lunarYear: Int!) -> Array<LunarMonth> {
        
        let leapMonth = self.decideLunarYearIsHaveLeapMonth(lunarYear)
        var lunarMouthList: Array<LunarMonth> = []
        var lunarMouth: LunarMonth = LunarMonth.init(monthName: "?", days: 0, isLeapMonth: false)
        // 判断 大于380为闰年(13个月)
        if leapMonth != 0 {
            
            for monthInListIndex in 0 ..< 13 {
                if monthInListIndex < leapMonth - 1 {// 同名月之前
                    // 实际月份为索引数加1
                    lunarMouth.monthName = self.getLunarMonthName(monthInListIndex + 1)
                    lunarMouth.isLeapMonth = false
                    
                    let dateThisLunarMonthBegin = DataCenter.getDateFromLunar(lunarObj: Lunar.init(isleap: false, lunarYear: lunarYear, lunarMonth: monthInListIndex + 1, lunarDay: 1))
                    let dateThisLunarMonthEnd = DataCenter.getDateFromLunar(lunarObj: Lunar.init(isleap: false, lunarYear: lunarYear, lunarMonth: monthInListIndex + 1 + 1, lunarDay: 1))
                    lunarMouth.days = DataCenter.getDaysBetweenTwoDates(fromDate: dateThisLunarMonthBegin, toDate: dateThisLunarMonthEnd)
                    
                }else if monthInListIndex == leapMonth - 1{// 同名月
                    // 实际月份为索引数加1
                    lunarMouth.monthName = self.getLunarMonthName(monthInListIndex + 1)
                    lunarMouth.isLeapMonth = false
                    
                    let dateThisLunarMonthBegin = DataCenter.getDateFromLunar(lunarObj: Lunar.init(isleap: false, lunarYear: lunarYear, lunarMonth: monthInListIndex + 1, lunarDay: 1))
                    let dateThisLunarMonthEnd = DataCenter.getDateFromLunar(lunarObj: Lunar.init(isleap: true, lunarYear: lunarYear, lunarMonth: monthInListIndex + 1, lunarDay: 1))
                    lunarMouth.days = DataCenter.getDaysBetweenTwoDates(fromDate: dateThisLunarMonthBegin, toDate: dateThisLunarMonthEnd)
                    
                }else if monthInListIndex == leapMonth{// 闰月
                    // 实际月份为索引数
                    lunarMouth.monthName = "闰" + self.getLunarMonthName(monthInListIndex)
                    lunarMouth.isLeapMonth = true
                    
                    let dateThisLunarMonthBegin = DataCenter.getDateFromLunar(lunarObj: Lunar.init(isleap: true, lunarYear: lunarYear, lunarMonth: monthInListIndex, lunarDay: 1))
                    let dateThisLunarMonthEnd = { () -> Date in
                        if monthInListIndex == 12{
                            return DataCenter.getDateFromLunar(lunarObj: Lunar.init(isleap: false, lunarYear: lunarYear + 1, lunarMonth: 1, lunarDay: 1))
                        }else{
                            return DataCenter.getDateFromLunar(lunarObj: Lunar.init(isleap: false, lunarYear: lunarYear, lunarMonth: monthInListIndex + 1, lunarDay: 1))
                        }
                    }()
                    lunarMouth.days = DataCenter.getDaysBetweenTwoDates(fromDate: dateThisLunarMonthBegin, toDate: dateThisLunarMonthEnd)
                    
                }else if monthInListIndex > leapMonth{// 闰月后
                    // 实际月份为索引数
                    lunarMouth.monthName = self.getLunarMonthName(monthInListIndex)
                    lunarMouth.isLeapMonth = false
                    
                    let dateThisLunarMonthBegin = DataCenter.getDateFromLunar(lunarObj: Lunar.init(isleap: false, lunarYear: lunarYear, lunarMonth: monthInListIndex, lunarDay: 1))
                    let dateThisLunarMonthEnd = { () -> Date in
                        if monthInListIndex == 12{
                            return DataCenter.getDateFromLunar(lunarObj: Lunar.init(isleap: false, lunarYear: lunarYear + 1, lunarMonth: 1, lunarDay: 1))
                        }else{
                            return DataCenter.getDateFromLunar(lunarObj: Lunar.init(isleap: false, lunarYear: lunarYear, lunarMonth: monthInListIndex + 1, lunarDay: 1))
                        }
                    }()
                    lunarMouth.days = DataCenter.getDaysBetweenTwoDates(fromDate: dateThisLunarMonthBegin, toDate: dateThisLunarMonthEnd)
                }
                
                lunarMouthList.append(lunarMouth)
            }
        
        }else{// 平年(12个月)
            for monthInListIndex in 0 ..< 12 {
                // 实际月份为索引数 + 1
                lunarMouth.monthName = self.getLunarMonthName(monthInListIndex + 1)
                lunarMouth.isLeapMonth = false
                
                let dateThisLunarMonthBegin = DataCenter.getDateFromLunar(lunarObj: Lunar.init(isleap: false, lunarYear: lunarYear, lunarMonth: monthInListIndex + 1, lunarDay: 1))
                let dateThisLunarMonthEnd = { () -> Date in
                    if monthInListIndex + 1 == 12{
                        return DataCenter.getDateFromLunar(lunarObj: Lunar.init(isleap: false, lunarYear: lunarYear + 1, lunarMonth: 1, lunarDay: 1))
                    }else{
                        return DataCenter.getDateFromLunar(lunarObj: Lunar.init(isleap: false, lunarYear: lunarYear, lunarMonth: monthInListIndex + 1 + 1, lunarDay: 1))
                    }
                }()
                lunarMouth.days = DataCenter.getDaysBetweenTwoDates(fromDate: dateThisLunarMonthBegin, toDate: dateThisLunarMonthEnd)
                lunarMouthList.append(lunarMouth)
            }
        }
        return lunarMouthList
        
    }// funcEnd
    
    
    /// 获取某个公历年的具体月份信息 [] -> 数组
    class func getSolarYearMonthModel(yearWithSoalar: Int) -> Array<SolarMonth> {
        
        var array: Array<SolarMonth> = []
        
        for i in 1 ... 12 {
            var model = SolarMonth.init(monthName: "\(i)" + "月", days: 0)
            
            switch i {
            case 1, 3, 5, 7, 8, 10, 12:
                model.days = 31
                
            case 4, 6, 9, 11:
                model.days = 30
                
            case 2:
                // 是闰年
                if IsLeapYear(y: yearWithSoalar) {
                    model.days = 29
                // 是平年
                }else{
                    model.days = 28
                }
            default:
                printWithMessage("10")
                
               array.append(model)
            }
        }
        return array
    }// funcEnd
    
    /// 根据农历月份获取月份名称汉字 [月份数] -> 字符串
    class func getLunarMonthName(_ month: Int) -> String {
        switch month {
        case 1:
            return "正月"
        case 11:
            return "冬月"
        case 12:
            return "腊月"
        default:
            return month.cn + "月"
        }
    }// funcEnd
    
    /// 判断一个农历年份存在闰月吗?存在则返回月份 不存在则返回0 [年] -> 月份/0
    class func decideLunarYearIsHaveLeapMonth(_ lunarYear: Int) -> Int {
        // Date(A春节)
        let solarADate = DataCenter.getDateFromLunar(lunarObj: Lunar.init(isleap: false, lunarYear: lunarYear, lunarMonth: 1, lunarDay: 1))
        // Date(A1春节)
        let solarA1Date = DataCenter.getDateFromLunar(lunarObj: Lunar.init(isleap: false, lunarYear: lunarYear + 1, lunarMonth: 1, lunarDay: 1))
        
        // 获取A春节到A1春节一整年的天数
        let allDaysCountInAYear = DataCenter.getDaysBetweenTwoDates(fromDate: solarADate, toDate: solarA1Date)
        if allDaysCountInAYear > 380 {
            return GetBitInt(data: lunar_month_days[lunarYear - lunar_month_days[0]], length: 4, shift: 13)
        }else{
            return 0
        }
    }// funcEnd
    
    
    
}
