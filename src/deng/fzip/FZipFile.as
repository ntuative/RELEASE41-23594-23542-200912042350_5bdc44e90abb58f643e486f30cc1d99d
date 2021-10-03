package deng.fzip
{
   import deng.utils.ChecksumUtil;
   import flash.utils.*;
   
   public class FZipFile
   {
      
      public static const const_666:int = 8;
      
      public static const const_1489:int = 10;
      
      public static const const_1155:int = 6;
      
      private static var var_937:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").hasComplexContent();
      
      public static const const_1332:int = 0;
      
      public static const const_1540:int = 1;
      
      public static const const_1398:int = 2;
      
      public static const const_1426:int = 3;
      
      public static const const_1464:int = 4;
      
      public static const const_1439:int = 5;
      
      public static const const_1417:int = 9;
      
      public static const const_1419:int = 7;
       
      
      private var var_170:uint = 0;
      
      private var var_938:uint = 0;
      
      private var var_620:Date;
      
      private var var_1748:int = -1;
      
      private var parseFunc:Function;
      
      private var var_439:Boolean = false;
      
      private var var_2182:int = -1;
      
      private var var_1133:uint = 0;
      
      private var var_1749:String = "";
      
      private var _extraFields:Dictionary;
      
      private var var_746:uint;
      
      private var var_33:ByteArray;
      
      private var var_619:uint;
      
      private var var_1361:Boolean = false;
      
      private var var_2183:int = -1;
      
      private var var_1360:String = "2.0";
      
      private var var_169:Boolean = false;
      
      private var var_1750:Boolean = false;
      
      private var var_323:String;
      
      private var var_525:uint = 0;
      
      private var var_1132:int = 0;
      
      private var var_375:String = "";
      
      private var var_618:int = 8;
      
      private var var_1359:Boolean = false;
      
      public function FZipFile(param1:String = "utf-8")
      {
         parseFunc = parseFileHead;
         super();
         var_323 = param1;
         _extraFields = new Dictionary();
         var_33 = new ByteArray();
         var_33.endian = Endian.BIG_ENDIAN;
      }
      
      public function get sizeUncompressed() : uint
      {
         return var_525;
      }
      
      public function set filename(param1:String) : void
      {
         var_375 = param1;
      }
      
      protected function uncompress() : void
      {
         if(var_169 && false)
         {
            var_33.position = 0;
            if(var_937)
            {
               var_33.uncompress.apply(var_33,["deflate"]);
            }
            else
            {
               var_33.uncompress();
            }
            var_33.position = 0;
            var_169 = false;
         }
      }
      
      public function get filename() : String
      {
         return var_375;
      }
      
      public function get date() : Date
      {
         return var_620;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && parseFunc(param1))
         {
         }
         return parseFunc === parseFileIdle;
      }
      
      private function parseFileContent(param1:IDataInput) : Boolean
      {
         if(var_1359)
         {
            parseFunc = parseFileIdle;
            throw new Error("Data descriptors are not supported.");
         }
         if(var_170 == 0)
         {
            parseFunc = parseFileIdle;
         }
         else
         {
            if(param1.bytesAvailable < var_170)
            {
               return false;
            }
            parseContent(param1);
            parseFunc = parseFileIdle;
         }
         return true;
      }
      
      public function get versionNumber() : String
      {
         return var_1360;
      }
      
      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(var_169)
         {
            uncompress();
         }
         var_33.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = var_33.readUTFBytes(var_33.bytesAvailable);
         }
         else
         {
            _loc3_ = var_33.readMultiByte(var_33.bytesAvailable,param2);
         }
         var_33.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      private function parseFileIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(var_618 === const_666 && !var_1361)
         {
            if(var_937)
            {
               param1.readBytes(var_33,0,var_170);
            }
            else
            {
               if(!var_439)
               {
                  throw new Error("Adler32 checksum not found.");
               }
               var_33.writeByte(120);
               _loc2_ = uint(~var_1748 << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               var_33.writeByte(_loc2_);
               param1.readBytes(var_33,2,var_170);
               var_33.position = var_33.length;
               var_33.writeUnsignedInt(var_746);
            }
            var_169 = true;
         }
         else
         {
            if(var_618 != const_1332)
            {
               throw new Error("Compression method " + var_618 + " is not supported.");
            }
            param1.readBytes(var_33,0,var_170);
            var_169 = false;
         }
         var_33.position = 0;
      }
      
      private function parseFileHead(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if(var_938 + var_1133 > 0)
            {
               parseFunc = parseFileHeadExt;
            }
            else
            {
               parseFunc = parseFileContent;
            }
            return true;
         }
         return false;
      }
      
      public function setContentAsString(param1:String, param2:String = "utf-8") : void
      {
         var_33.length = 0;
         var_33.position = 0;
         var_169 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               var_33.writeUTFBytes(param1);
            }
            else
            {
               var_33.writeMultiByte(param1,param2);
            }
            var_619 = ChecksumUtil.CRC32(var_33);
            var_439 = false;
         }
         compress();
      }
      
      public function set date(param1:Date) : void
      {
         var_620 = param1 != null ? param1 : new Date();
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_1132 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_1132 << 8 | 20);
         param1.writeShort(var_323 == "utf-8" ? 2048 : 0);
         param1.writeShort(const_666);
         var _loc5_:Date = var_620 != null ? var_620 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(var_619);
         param1.writeUnsignedInt(var_170);
         param1.writeUnsignedInt(var_525);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = Endian.LITTLE_ENDIAN;
         if(var_323 == "utf-8")
         {
            _loc8_.writeUTFBytes(var_375);
         }
         else
         {
            _loc8_.writeMultiByte(var_375,var_323);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in _extraFields)
         {
            _loc15_ = _extraFields[_loc10_] as ByteArray;
            if(_loc15_ != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!var_439)
            {
               _loc16_ = var_169;
               if(_loc16_)
               {
                  uncompress();
               }
               var_746 = ChecksumUtil.Adler32(var_33,0,var_33.length);
               var_439 = true;
               if(_loc16_)
               {
                  compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(var_746);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && false)
         {
            if(var_323 == "utf-8")
            {
               _loc8_.writeUTFBytes(var_1749);
            }
            else
            {
               _loc8_.writeMultiByte(var_1749,var_323);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:int = 0;
         if(!param3 && var_170 > 0)
         {
            if(var_937)
            {
               _loc13_ = 0;
               param1.writeBytes(var_33,0,_loc13_);
            }
            else
            {
               _loc13_ = 4294967290;
               param1.writeBytes(var_33,2,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      public function get sizeCompressed() : uint
      {
         return var_170;
      }
      
      protected function compress() : void
      {
         if(!var_169)
         {
            if(false)
            {
               var_33.position = 0;
               var_525 = var_33.length;
               if(var_937)
               {
                  var_33.compress.apply(var_33,["deflate"]);
                  var_170 = var_33.length;
               }
               else
               {
                  var_33.compress();
                  var_170 = -6;
               }
               var_33.position = 0;
               var_169 = true;
            }
            else
            {
               var_170 = 0;
               var_525 = 0;
            }
         }
      }
      
      private function parseFileHeadExt(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= var_938 + var_1133)
         {
            parseHeadExt(param1);
            parseFunc = parseFileContent;
            return true;
         }
         return false;
      }
      
      protected function parseHeadExt(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(var_323 == "utf-8")
         {
            var_375 = param1.readUTFBytes(var_938);
         }
         else
         {
            var_375 = param1.readMultiByte(var_938,var_323);
         }
         var _loc2_:uint = var_1133;
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            _loc4_ = uint(param1.readUnsignedShort());
            if(_loc4_ > _loc2_)
            {
               throw new Error("Parse error in file " + var_375 + ": Extra field data size too big.");
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               var_746 = param1.readUnsignedInt();
               var_439 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _extraFields[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      protected function parseHead(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         var_1132 = _loc2_ >> 8;
         var_1360 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         var_618 = param1.readUnsignedShort();
         var_1361 = (_loc3_ & 1) !== 0;
         var_1359 = (_loc3_ & 8) !== 0;
         var_1750 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            var_323 = "utf-8";
         }
         if(var_618 === const_1155)
         {
            var_2183 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            var_2182 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(var_618 === const_666)
         {
            var_1748 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         var_620 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         var_619 = param1.readUnsignedInt();
         var_170 = param1.readUnsignedInt();
         var_525 = param1.readUnsignedInt();
         var_938 = param1.readUnsignedShort();
         var_1133 = param1.readUnsignedShort();
      }
      
      public function set content(param1:ByteArray) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(var_33,0,param1.length);
            var_619 = ChecksumUtil.CRC32(var_33);
            var_439 = false;
         }
         else
         {
            var_33.length = 0;
            var_33.position = 0;
            var_169 = false;
         }
         compress();
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + var_375 + "\n  date:" + var_620 + "\n  sizeCompressed:" + var_170 + "\n  sizeUncompressed:" + var_525 + "\n  versionHost:" + var_1132 + "\n  versionNumber:" + var_1360 + "\n  compressionMethod:" + var_618 + "\n  encrypted:" + var_1361 + "\n  hasDataDescriptor:" + var_1359 + "\n  hasCompressedPatchedData:" + var_1750 + "\n  filenameEncoding:" + var_323 + "\n  crc32:" + var_619.toString(16) + "\n  adler32:" + var_746.toString(16);
      }
      
      public function get content() : ByteArray
      {
         if(var_169)
         {
            uncompress();
         }
         return var_33;
      }
   }
}
