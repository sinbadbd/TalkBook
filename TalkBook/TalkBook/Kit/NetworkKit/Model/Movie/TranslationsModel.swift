//
//  TranslationsModel.swift
//  MovieStream
//
//  Created by Imran on 20/8/23.
//

 

struct TranslationsModel: Model{
    var iso_3166_1: String?
    var iso_639_1: String?
    var name: String?
    var english_name: String?
    var data: TranslateData?
  
}
struct TranslateData: Model{
    var homepage: String?
    var overview: String?
    var runtime: Int?
    var tagline: String?
    var title: String?
 
}


/*
 {
   "id": 550,
   "translations": [
     {
       "iso_3166_1": "SA",
       "iso_639_1": "ar",
       "name": "العربية",
       "english_name": "Arabic",
       "data": {
         "homepage": "",
         "overview": "إدوارد يتعرض لضغوط حتى يصل به الحال إلى أنه لا يستطيع النوم لفتراتٍ طويلة، لكنه يجد بعض السلام في جلسات العلاج النفسي الجماعي، يتعرف إدوارد على أحد الأشخاص وهو (تايلر ديردن) الذي يحرره من تعلقه بالأشياء الذي تستعبده ،ثم يحرره من خوفه من الناس. يقومان معًا بإنشاء نادي القتال الذي يجذب الكثير من الأفراد المحبطين ،الذين يقومون بإخراج طاقة غضبهم وكرههم للعالم في القتال.",
         "runtime": 0,
         "tagline": "",
         "title": ""
       }
     },
   ]
 }
 */
