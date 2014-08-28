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
declare module egret {
    /**
    * @class egret.NativeDeviceContext
    * @classdesc
    * @extends egret.HashObject
    */
    class NativeDeviceContext extends HashObject {
        private callback;
        private thisObject;
        /**
        * @method egret.NativeDeviceContext#constructor
        */
        constructor();
        /**
        * @method egret.NativeDeviceContext#executeMainLoop
        * @param callback {Function}
        * @param thisObject {any}
        */
        public executeMainLoop(callback: Function, thisObject: any): void;
        private onEnterFrame(advancedTime);
    }
}
declare module egret_native_external_interface {
    var callBackDic: {};
    function call(functionName: String, ...args: any[]): void;
    function addCallback(functionName: string, listener: Function): void;
    function onRecivedPluginInfo(info: string): void;
    function init(): void;
}
declare module egret_native_sound {
    function play(loop: boolean): void;
    function pause(): void;
    function load(): void;
    function preload(type: any): void;
    function setVolume(value: any): void;
    function getVolume(): any;
    function init(): void;
}
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
declare module egret {
    /**
    * @class egret.NativeRendererContext
    * @classdesc
    * NativeRendererContext 是引擎在Native上的渲染上下文。
    * @extends egret.HashObject
    */
    class NativeRendererContext extends HashObject {
        /**
        * 渲染全部纹理的时间开销
        * @readonly
        * @member egret.NativeRendererContext#renderCost
        */
        public renderCost: number;
        /**
        * 绘制纹理的缩放比率，默认值为1
        * @member egret.NativeRendererContext#texture_scale_factor
        */
        public texture_scale_factor: number;
        /**
        * @method egret.NativeRendererContext#constructor
        */
        constructor();
        /**
        * @method egret.NativeRendererContext#clearScreen
        * @private
        */
        public clearScreen(): void;
        /**
        * 清除Context的渲染区域
        * @method egret.NativeRendererContext#clearRect
        * @param x {number}
        * @param y {number}
        * @param w {number}
        * @param h {numbe}
        */
        public clearRect(x: number, y: number, w: number, h: number): void;
        /**
        * 绘制图片
        * @method egret.NativeRendererContext#drawImage
        * @param texture {Texture}
        * @param sourceX {any}
        * @param sourceY {any}
        * @param sourceWidth {any}
        * @param sourceHeight {any}
        * @param destX {any}
        * @param destY {any}
        * @param destWidth {any}
        * @param destHeigh {any}
        */
        public drawImage(texture: Texture, sourceX: any, sourceY: any, sourceWidth: any, sourceHeight: any, destX: any, destY: any, destWidth: any, destHeight: any): void;
        /**
        * 变换Context的当前渲染矩阵
        * @method egret.NativeRendererContext#setTransform
        * @param matrix {egret.Matrix}
        * @stable A
        */
        public setTransform(matrix: Matrix): void;
        /**
        * 设置渲染alpha
        * @method egret.NativeRendererContext#setAlpha
        * @param value {number}
        * @stable A
        * @param blendMode {egret.BlendMode}
        */
        public setAlpha(value: number, blendMode: string): void;
        /**
        * 设置渲染文本参数
        * @method egret.NativeRendererContext#setupFont
        * @param textField {TextField}
        */
        public setupFont(textField: TextField): void;
        /**
        * 测量文本
        * @method egret.NativeRendererContext#measureText
        * @param text {string}
        * @returns {number}
        */
        public measureText(text: string): number;
        /**
        * 绘制文本
        * @method egret.NativeRendererContext#drawText
        * @param textField {egret.TextField}
        * @param text {string}
        * @param x {number}
        * @param y {number}
        * @param maxWidth {numbe}
        */
        public drawText(textField: TextField, text: string, x: number, y: number, maxWidth: number): void;
        public pushMask(mask: Rectangle): void;
        public popMask(): void;
    }
}
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
declare module egret {
    class NativeTouchContext extends TouchContext {
        constructor();
        public run(): void;
    }
}
declare module egret_native {
    function onTouchesBegin(num: number, ids: any[], xs_array: any[], ys_array: any[]): void;
    function onTouchesMove(num: number, ids: any[], xs_array: any[], ys_array: any[]): void;
    function onTouchesEnd(num: number, ids: any[], xs_array: any[], ys_array: any[]): void;
    function onTouchesCancel(num: number, ids: any[], xs_array: any[], ys_array: any[]): void;
    function executeTouchCallback(num: number, ids: any[], xs_array: any[], ys_array: any[], callback: Function): void;
}
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
declare module egret {
    class PromiseObject {
        private static promiseObjectList;
        public onSuccessFunc: Function;
        public onSuccessThisObject: any;
        public onErrorFunc: Function;
        public onErrorThisObject: any;
        constructor();
        static create(): any;
        private onSuccess();
        private onError(errorcode);
        private destroy();
    }
}
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
declare module egret {
    class NativeNetContext extends NetContext {
        constructor();
        /**
        * @method egret.HTML5NetContext#proceed
        * @param loader {URLLoader}
        */
        public proceed(loader: URLLoader): void;
        private loadSound(loader);
        private loadTexture(loader);
    }
}
