/**
* Copyright (c) 2014,Egret-Labs.org
* All rights reserved.
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*
*     * Redistributions of source code must retain the above copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright
*       notice, this list of conditions and the following disclaimer in the
*       documentation and/or other materials provided with the distribution.
*     * Neither the name of the Egret-Labs.org nor the
*       names of its contributors may be used to endorse or promote products
*       derived from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY EGRET-LABS.ORG AND CONTRIBUTORS "AS IS" AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL EGRET-LABS.ORG AND CONTRIBUTORS BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
/**
* @namespace egret
*/
var egret;
(function (egret) {
    /**
    * @class egret.HashObject
    * @classdesc
    * @implements egret.IHashObject
    */
    var HashObject = (function () {
        /**
        * @method egret.HashObject#constructor
        * @class egret.HashObject
        * @classdesc 哈希对象。引擎内所有对象的基类，为对象实例提供唯一的hashCode值,提高对象比较的性能。
        */
        function HashObject() {
            this._hashCode = HashObject.hashCount++;
        }
        Object.defineProperty(HashObject.prototype, "hashCode", {
            /**
            * 返回此对象唯一的哈希值,用于唯一确定一个对象。hashCode为大于等于1的整数。
            * @member {number} egret.HashObject#hashCode
            */
            get: function () {
                return this._hashCode;
            },
            enumerable: true,
            configurable: true
        });
        HashObject.hashCount = 1;
        return HashObject;
    })();
    egret.HashObject = HashObject;
    HashObject.prototype.__class__ = "egret.HashObject";
})(egret || (egret = {}));
