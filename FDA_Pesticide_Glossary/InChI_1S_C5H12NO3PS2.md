---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.152398, -0.2081972, -3.3689, 1, 0, 0, 1,
-3.113309, 1.392238, -1.95674, 1, 0.007843138, 0, 1,
-2.84662, 1.545834, -2.482654, 1, 0.01176471, 0, 1,
-2.774196, 0.8955674, -1.72638, 1, 0.01960784, 0, 1,
-2.690824, -1.527462, -1.676648, 1, 0.02352941, 0, 1,
-2.463382, -1.020391, -1.810989, 1, 0.03137255, 0, 1,
-2.45412, -0.5364975, 0.06631793, 1, 0.03529412, 0, 1,
-2.453736, 0.9433439, -1.495661, 1, 0.04313726, 0, 1,
-2.362602, 2.087609, -1.363512, 1, 0.04705882, 0, 1,
-2.280584, -1.886469, -2.778539, 1, 0.05490196, 0, 1,
-2.27108, 0.6393567, -0.4692398, 1, 0.05882353, 0, 1,
-2.245542, 0.5656588, -1.433867, 1, 0.06666667, 0, 1,
-2.2371, -0.7669129, -2.222735, 1, 0.07058824, 0, 1,
-2.152315, 0.1524755, -1.98851, 1, 0.07843138, 0, 1,
-2.13465, -0.3346525, -3.379104, 1, 0.08235294, 0, 1,
-2.131073, 0.150164, -2.06039, 1, 0.09019608, 0, 1,
-2.092839, -0.564317, -2.131216, 1, 0.09411765, 0, 1,
-1.989808, 0.892558, 0.7465965, 1, 0.1019608, 0, 1,
-1.986396, -0.03906538, -1.889317, 1, 0.1098039, 0, 1,
-1.943812, -1.137041, -3.332068, 1, 0.1137255, 0, 1,
-1.940335, -1.688499, -3.610135, 1, 0.1215686, 0, 1,
-1.939879, 1.30895, 0.0437912, 1, 0.1254902, 0, 1,
-1.910026, 0.3910316, -1.8859, 1, 0.1333333, 0, 1,
-1.884242, 0.5712205, -2.813036, 1, 0.1372549, 0, 1,
-1.880571, -0.2091876, -1.233127, 1, 0.145098, 0, 1,
-1.874082, -0.8400855, -2.042431, 1, 0.1490196, 0, 1,
-1.873361, 0.7105699, -1.609097, 1, 0.1568628, 0, 1,
-1.847091, -1.095679, -1.832463, 1, 0.1607843, 0, 1,
-1.821739, -1.488737, -0.2370389, 1, 0.1686275, 0, 1,
-1.816828, -0.5155443, -2.495695, 1, 0.172549, 0, 1,
-1.769629, -0.7647802, -1.674503, 1, 0.1803922, 0, 1,
-1.754409, -0.2553415, -3.330041, 1, 0.1843137, 0, 1,
-1.753936, -0.5934283, -1.440371, 1, 0.1921569, 0, 1,
-1.739546, 1.205258, -0.04330586, 1, 0.1960784, 0, 1,
-1.739409, -0.1579077, -2.467359, 1, 0.2039216, 0, 1,
-1.711681, 2.319745, 0.3299432, 1, 0.2117647, 0, 1,
-1.698388, 0.1048712, -1.25078, 1, 0.2156863, 0, 1,
-1.672937, -1.403337, -3.020042, 1, 0.2235294, 0, 1,
-1.65815, -1.270329, -2.210995, 1, 0.227451, 0, 1,
-1.653163, -1.105595, -1.49158, 1, 0.2352941, 0, 1,
-1.651049, 0.5800796, -1.744468, 1, 0.2392157, 0, 1,
-1.637221, 0.1217409, -0.3770086, 1, 0.2470588, 0, 1,
-1.636673, 1.002743, 0.2054899, 1, 0.2509804, 0, 1,
-1.633318, -0.3357001, -2.30659, 1, 0.2588235, 0, 1,
-1.63041, 1.377159, -0.06981368, 1, 0.2627451, 0, 1,
-1.628685, -0.4908903, -3.030947, 1, 0.2705882, 0, 1,
-1.627578, 2.350155, 0.2540506, 1, 0.2745098, 0, 1,
-1.622375, -0.9463772, -2.640749, 1, 0.282353, 0, 1,
-1.618725, 0.3204291, -2.552169, 1, 0.2862745, 0, 1,
-1.605745, -1.342067, -2.488132, 1, 0.2941177, 0, 1,
-1.601972, -0.2409811, -3.126366, 1, 0.3019608, 0, 1,
-1.586127, 0.4592988, -1.881122, 1, 0.3058824, 0, 1,
-1.571106, 0.1679256, -2.719715, 1, 0.3137255, 0, 1,
-1.553239, -0.1151051, -1.416146, 1, 0.3176471, 0, 1,
-1.543612, -0.1895082, -1.013099, 1, 0.3254902, 0, 1,
-1.538007, -1.051184, -1.596268, 1, 0.3294118, 0, 1,
-1.53347, -0.07853329, -1.66441, 1, 0.3372549, 0, 1,
-1.514134, 0.255408, -2.411157, 1, 0.3411765, 0, 1,
-1.500118, -0.7505332, -2.65855, 1, 0.3490196, 0, 1,
-1.499472, 2.439103, -1.367969, 1, 0.3529412, 0, 1,
-1.482596, -2.305069, -2.833873, 1, 0.3607843, 0, 1,
-1.482249, -1.285008, -2.909298, 1, 0.3647059, 0, 1,
-1.479467, 0.1190716, -0.003116047, 1, 0.372549, 0, 1,
-1.479058, 0.810311, -1.611528, 1, 0.3764706, 0, 1,
-1.478425, -1.443326, -2.469907, 1, 0.3843137, 0, 1,
-1.477594, 1.836585, 1.196137, 1, 0.3882353, 0, 1,
-1.473523, 1.688933, -1.309443, 1, 0.3960784, 0, 1,
-1.470781, 0.3616351, -0.6739272, 1, 0.4039216, 0, 1,
-1.462264, 1.18676, -0.1092699, 1, 0.4078431, 0, 1,
-1.457881, -0.8602536, -1.551363, 1, 0.4156863, 0, 1,
-1.456411, -1.449138, -3.617722, 1, 0.4196078, 0, 1,
-1.447088, -1.096394, -2.239061, 1, 0.427451, 0, 1,
-1.445512, 1.232981, -0.9191182, 1, 0.4313726, 0, 1,
-1.410556, -0.5929434, -3.097298, 1, 0.4392157, 0, 1,
-1.405031, -0.919547, 0.07470006, 1, 0.4431373, 0, 1,
-1.403429, 0.1148287, -1.358084, 1, 0.4509804, 0, 1,
-1.403242, 1.091602, 0.9050894, 1, 0.454902, 0, 1,
-1.40157, 0.0418118, -0.8187635, 1, 0.4627451, 0, 1,
-1.394815, 1.107915, -2.458105, 1, 0.4666667, 0, 1,
-1.390891, -1.319457, -2.654549, 1, 0.4745098, 0, 1,
-1.387714, 1.136404, -2.280825, 1, 0.4784314, 0, 1,
-1.361822, -0.6424636, -2.42691, 1, 0.4862745, 0, 1,
-1.357191, 0.3473111, -0.9388433, 1, 0.4901961, 0, 1,
-1.352921, 1.293228, -2.297893, 1, 0.4980392, 0, 1,
-1.352742, -0.8113419, -0.5172119, 1, 0.5058824, 0, 1,
-1.345049, 0.7149352, -2.895416, 1, 0.509804, 0, 1,
-1.337702, 0.3096883, -1.215594, 1, 0.5176471, 0, 1,
-1.328676, -0.1383057, -1.060041, 1, 0.5215687, 0, 1,
-1.317034, -0.3400768, -2.540825, 1, 0.5294118, 0, 1,
-1.316308, -0.01028626, -0.8651326, 1, 0.5333334, 0, 1,
-1.315955, -0.2424397, -2.249009, 1, 0.5411765, 0, 1,
-1.310065, 0.2722275, -1.805413, 1, 0.5450981, 0, 1,
-1.302122, -1.036909, -1.69086, 1, 0.5529412, 0, 1,
-1.286347, -0.4407614, -2.41021, 1, 0.5568628, 0, 1,
-1.285733, 0.649642, -0.3545914, 1, 0.5647059, 0, 1,
-1.28529, -0.5274054, -0.9031148, 1, 0.5686275, 0, 1,
-1.275481, 0.1698765, -1.527066, 1, 0.5764706, 0, 1,
-1.273109, -0.3163251, -1.378832, 1, 0.5803922, 0, 1,
-1.267283, -0.5611522, -2.39291, 1, 0.5882353, 0, 1,
-1.264833, 0.2788362, -0.3637937, 1, 0.5921569, 0, 1,
-1.260634, 0.5915359, -0.9100452, 1, 0.6, 0, 1,
-1.255885, 1.239138, -2.404451, 1, 0.6078432, 0, 1,
-1.248804, 0.09103512, -1.072187, 1, 0.6117647, 0, 1,
-1.245701, -0.0915181, -1.644052, 1, 0.6196079, 0, 1,
-1.245239, 0.1362321, -2.342785, 1, 0.6235294, 0, 1,
-1.24395, 0.5490151, -0.3847066, 1, 0.6313726, 0, 1,
-1.234633, -0.4703611, -2.479964, 1, 0.6352941, 0, 1,
-1.233643, 0.2572218, -1.086958, 1, 0.6431373, 0, 1,
-1.233288, -1.216347, -2.444493, 1, 0.6470588, 0, 1,
-1.227134, -0.194823, -3.162969, 1, 0.654902, 0, 1,
-1.226423, 1.361374, -0.31878, 1, 0.6588235, 0, 1,
-1.225529, -2.341612, -1.580007, 1, 0.6666667, 0, 1,
-1.215737, -0.8150683, -2.14251, 1, 0.6705883, 0, 1,
-1.215636, 0.8220046, -0.9742841, 1, 0.6784314, 0, 1,
-1.205013, -1.668435, -1.892126, 1, 0.682353, 0, 1,
-1.19912, -1.016231, -3.471521, 1, 0.6901961, 0, 1,
-1.197234, 0.9379388, 0.4268587, 1, 0.6941177, 0, 1,
-1.188622, 1.683171, 1.500688, 1, 0.7019608, 0, 1,
-1.184014, -2.059284, -4.378832, 1, 0.7098039, 0, 1,
-1.173137, 1.88481, 0.05528952, 1, 0.7137255, 0, 1,
-1.169971, -1.619643, -3.448628, 1, 0.7215686, 0, 1,
-1.163844, -0.3994586, -1.096493, 1, 0.7254902, 0, 1,
-1.157142, 0.06936484, -2.259447, 1, 0.7333333, 0, 1,
-1.156411, 0.8166111, -1.744478, 1, 0.7372549, 0, 1,
-1.150095, -0.687683, -0.4264382, 1, 0.7450981, 0, 1,
-1.14612, -0.6754227, -1.671866, 1, 0.7490196, 0, 1,
-1.142545, -0.6032788, -1.290945, 1, 0.7568628, 0, 1,
-1.136541, -0.7468998, -3.241249, 1, 0.7607843, 0, 1,
-1.136026, 0.7891336, -0.7234907, 1, 0.7686275, 0, 1,
-1.133707, 0.9480193, -0.07596427, 1, 0.772549, 0, 1,
-1.12572, 0.6177179, -1.360764, 1, 0.7803922, 0, 1,
-1.110297, -0.8306884, -1.166108, 1, 0.7843137, 0, 1,
-1.108839, -0.1002265, -1.518716, 1, 0.7921569, 0, 1,
-1.105957, 0.9830018, -1.601742, 1, 0.7960784, 0, 1,
-1.088772, -0.2865443, -3.499349, 1, 0.8039216, 0, 1,
-1.086169, 0.130931, -2.717245, 1, 0.8117647, 0, 1,
-1.084764, -2.381747, -0.8430366, 1, 0.8156863, 0, 1,
-1.081003, -4.432686, -3.798225, 1, 0.8235294, 0, 1,
-1.077332, -0.3451943, -3.133012, 1, 0.827451, 0, 1,
-1.070044, 1.225073, 1.16573, 1, 0.8352941, 0, 1,
-1.060393, -0.00585773, -2.644682, 1, 0.8392157, 0, 1,
-1.057945, 0.257936, -2.185748, 1, 0.8470588, 0, 1,
-1.039893, 1.244896, -0.2928233, 1, 0.8509804, 0, 1,
-1.034579, 0.3309082, -1.101932, 1, 0.8588235, 0, 1,
-1.030565, 0.8368872, -0.2037907, 1, 0.8627451, 0, 1,
-1.024343, 0.9332569, -1.601963, 1, 0.8705882, 0, 1,
-1.0204, 0.258737, -0.5282762, 1, 0.8745098, 0, 1,
-1.012113, 0.5761197, 0.5239895, 1, 0.8823529, 0, 1,
-1.007672, 1.220747, -1.555211, 1, 0.8862745, 0, 1,
-1.006417, -0.9571237, -0.7867807, 1, 0.8941177, 0, 1,
-1.002113, -2.762087, -1.829935, 1, 0.8980392, 0, 1,
-0.9928423, -0.4951481, -1.817658, 1, 0.9058824, 0, 1,
-0.9756986, 0.3165142, -2.166481, 1, 0.9137255, 0, 1,
-0.9754228, -0.47922, -2.308988, 1, 0.9176471, 0, 1,
-0.9750192, 0.3989347, -0.8776164, 1, 0.9254902, 0, 1,
-0.9745987, 0.4626764, 1.464098, 1, 0.9294118, 0, 1,
-0.9711176, -0.2829524, -2.695363, 1, 0.9372549, 0, 1,
-0.9682194, -0.8192967, -2.601164, 1, 0.9411765, 0, 1,
-0.9520638, -1.102134, -1.008394, 1, 0.9490196, 0, 1,
-0.9514549, 0.04349571, -0.1780132, 1, 0.9529412, 0, 1,
-0.9468044, -0.7148222, -2.839664, 1, 0.9607843, 0, 1,
-0.940129, 1.204139, -1.135927, 1, 0.9647059, 0, 1,
-0.935305, -1.01291, -3.275962, 1, 0.972549, 0, 1,
-0.9334543, -0.8818227, -3.240424, 1, 0.9764706, 0, 1,
-0.9313898, 0.2065028, 0.009949696, 1, 0.9843137, 0, 1,
-0.9285617, -1.328061, -4.013572, 1, 0.9882353, 0, 1,
-0.9284327, 1.011378, -0.3605213, 1, 0.9960784, 0, 1,
-0.9264051, -0.9611236, -2.333996, 0.9960784, 1, 0, 1,
-0.9255634, -0.3853312, -0.127246, 0.9921569, 1, 0, 1,
-0.9248804, 1.496199, 1.497915, 0.9843137, 1, 0, 1,
-0.9234939, -1.563582, -2.696726, 0.9803922, 1, 0, 1,
-0.9213238, -1.260498, -1.385338, 0.972549, 1, 0, 1,
-0.9190673, 1.484039, -2.540895, 0.9686275, 1, 0, 1,
-0.9181489, 0.7655746, -2.127746, 0.9607843, 1, 0, 1,
-0.9112506, -1.34617, -3.824577, 0.9568627, 1, 0, 1,
-0.9089667, -0.9080796, -0.6979317, 0.9490196, 1, 0, 1,
-0.90398, 0.6734644, -1.676224, 0.945098, 1, 0, 1,
-0.901867, 0.1092186, -1.552247, 0.9372549, 1, 0, 1,
-0.9011943, 0.01759626, 0.4247313, 0.9333333, 1, 0, 1,
-0.8954177, 1.232361, 0.5108959, 0.9254902, 1, 0, 1,
-0.8922216, 0.6623971, -1.202202, 0.9215686, 1, 0, 1,
-0.8895071, 1.758785, -1.573476, 0.9137255, 1, 0, 1,
-0.8885763, -0.6323672, -2.150046, 0.9098039, 1, 0, 1,
-0.8873586, 0.1183746, -2.712428, 0.9019608, 1, 0, 1,
-0.8772286, 1.170036, -0.1758415, 0.8941177, 1, 0, 1,
-0.8692828, 0.6727157, 0.03286282, 0.8901961, 1, 0, 1,
-0.861134, -0.9569231, -2.794948, 0.8823529, 1, 0, 1,
-0.852354, -0.8546844, -3.338335, 0.8784314, 1, 0, 1,
-0.8522769, -0.1433769, -2.153143, 0.8705882, 1, 0, 1,
-0.851548, 0.4598033, -0.2195806, 0.8666667, 1, 0, 1,
-0.8441424, 1.93881, -0.9719916, 0.8588235, 1, 0, 1,
-0.8368804, -0.001357983, -1.627795, 0.854902, 1, 0, 1,
-0.8362165, -0.2241451, -2.638052, 0.8470588, 1, 0, 1,
-0.8301646, 0.4026013, -1.8627, 0.8431373, 1, 0, 1,
-0.8213079, -1.785169, -2.712634, 0.8352941, 1, 0, 1,
-0.8207065, -1.418797, -3.694915, 0.8313726, 1, 0, 1,
-0.8168939, -1.261892, -2.495236, 0.8235294, 1, 0, 1,
-0.8052143, -0.3520824, -2.187965, 0.8196079, 1, 0, 1,
-0.8046807, 1.770261, -0.853983, 0.8117647, 1, 0, 1,
-0.8006107, 0.995628, 0.5349934, 0.8078431, 1, 0, 1,
-0.7967128, 0.5695198, -0.631895, 0.8, 1, 0, 1,
-0.7924305, 0.5750204, 0.850722, 0.7921569, 1, 0, 1,
-0.7897424, 0.5309346, -0.9436249, 0.7882353, 1, 0, 1,
-0.7837744, 0.3007498, -1.687577, 0.7803922, 1, 0, 1,
-0.7775596, -0.5051062, -2.308116, 0.7764706, 1, 0, 1,
-0.7756541, 0.2026023, -0.08206011, 0.7686275, 1, 0, 1,
-0.7753962, 0.1283914, -0.4177286, 0.7647059, 1, 0, 1,
-0.7727888, 0.1367527, -1.81256, 0.7568628, 1, 0, 1,
-0.7726749, 1.545744, 0.421833, 0.7529412, 1, 0, 1,
-0.7701077, -0.2013502, -2.332354, 0.7450981, 1, 0, 1,
-0.7660192, -1.584797, -3.112858, 0.7411765, 1, 0, 1,
-0.7649822, 0.6481812, 0.1040513, 0.7333333, 1, 0, 1,
-0.7624404, 0.5198783, -0.7914094, 0.7294118, 1, 0, 1,
-0.7567606, -0.1763473, -2.44135, 0.7215686, 1, 0, 1,
-0.7554942, -0.5240662, -2.084723, 0.7176471, 1, 0, 1,
-0.755235, 0.1298682, -2.364812, 0.7098039, 1, 0, 1,
-0.7551628, -1.31874, -2.836517, 0.7058824, 1, 0, 1,
-0.7528489, -0.8507369, 0.05486211, 0.6980392, 1, 0, 1,
-0.7490383, 1.052467, -0.8738227, 0.6901961, 1, 0, 1,
-0.7490374, 0.7152987, -0.1697627, 0.6862745, 1, 0, 1,
-0.7487893, 1.66095, -2.398702, 0.6784314, 1, 0, 1,
-0.7476197, -0.1814379, -1.705868, 0.6745098, 1, 0, 1,
-0.7471442, -1.629938, -2.995905, 0.6666667, 1, 0, 1,
-0.7448435, -0.6519307, -1.427208, 0.6627451, 1, 0, 1,
-0.7436935, -0.1925801, -1.377935, 0.654902, 1, 0, 1,
-0.7402233, -0.3851625, -2.160788, 0.6509804, 1, 0, 1,
-0.733036, 1.91415, -1.475073, 0.6431373, 1, 0, 1,
-0.7302726, -1.120585, -3.794757, 0.6392157, 1, 0, 1,
-0.7259747, -0.3073789, -0.1898359, 0.6313726, 1, 0, 1,
-0.7192559, -0.4972347, -2.991608, 0.627451, 1, 0, 1,
-0.7158774, -2.195514, -2.749067, 0.6196079, 1, 0, 1,
-0.7132782, -0.8161698, -0.6477386, 0.6156863, 1, 0, 1,
-0.7127786, -0.7889421, 0.03753991, 0.6078432, 1, 0, 1,
-0.7114754, -0.3021453, -1.607588, 0.6039216, 1, 0, 1,
-0.7095549, -1.202251, -4.646089, 0.5960785, 1, 0, 1,
-0.7067294, 1.028716, -1.398215, 0.5882353, 1, 0, 1,
-0.7002443, -1.405601, -2.526028, 0.5843138, 1, 0, 1,
-0.6955855, -1.988807, -3.136265, 0.5764706, 1, 0, 1,
-0.6935026, 0.1784665, -1.708965, 0.572549, 1, 0, 1,
-0.6930392, -0.1862324, -1.329276, 0.5647059, 1, 0, 1,
-0.68716, -0.4065007, -2.831268, 0.5607843, 1, 0, 1,
-0.6852407, 0.7172559, -1.276714, 0.5529412, 1, 0, 1,
-0.6826827, -0.7118407, -3.47947, 0.5490196, 1, 0, 1,
-0.6765863, -1.420182, -1.932236, 0.5411765, 1, 0, 1,
-0.674257, -1.344803, -3.135052, 0.5372549, 1, 0, 1,
-0.6718357, -0.008165847, -1.223911, 0.5294118, 1, 0, 1,
-0.6698089, 0.0381653, -1.392914, 0.5254902, 1, 0, 1,
-0.6669706, 1.44833, -1.488211, 0.5176471, 1, 0, 1,
-0.6635389, -0.6579817, -4.297273, 0.5137255, 1, 0, 1,
-0.6581581, -0.4732977, -3.638145, 0.5058824, 1, 0, 1,
-0.6568652, 0.6172502, -0.1068098, 0.5019608, 1, 0, 1,
-0.6503488, -0.7210079, -1.704881, 0.4941176, 1, 0, 1,
-0.6458502, -1.438264, -2.379215, 0.4862745, 1, 0, 1,
-0.643546, -1.276841, -3.410816, 0.4823529, 1, 0, 1,
-0.6427358, 0.9436852, -0.4118057, 0.4745098, 1, 0, 1,
-0.6409995, 1.436315, 0.01549295, 0.4705882, 1, 0, 1,
-0.6309372, 0.7957774, -0.5082198, 0.4627451, 1, 0, 1,
-0.6286656, -0.9732618, -3.989075, 0.4588235, 1, 0, 1,
-0.618547, 0.4365415, -0.8154612, 0.4509804, 1, 0, 1,
-0.6134435, 0.5990725, -2.484063, 0.4470588, 1, 0, 1,
-0.6037772, -0.3234919, -2.348098, 0.4392157, 1, 0, 1,
-0.6014832, -0.4993598, -3.479568, 0.4352941, 1, 0, 1,
-0.6002073, -1.631741, -2.377698, 0.427451, 1, 0, 1,
-0.5984553, -0.9263149, -2.97122, 0.4235294, 1, 0, 1,
-0.5914381, 1.221641, -0.6429323, 0.4156863, 1, 0, 1,
-0.5872403, -0.822696, -1.664018, 0.4117647, 1, 0, 1,
-0.5792354, -0.1928321, -0.5239534, 0.4039216, 1, 0, 1,
-0.5744211, 1.384832, 0.6501682, 0.3960784, 1, 0, 1,
-0.5739048, 0.3312152, 0.910701, 0.3921569, 1, 0, 1,
-0.5713825, 1.934296, 0.4862482, 0.3843137, 1, 0, 1,
-0.5687664, -1.145582, -2.374134, 0.3803922, 1, 0, 1,
-0.5667544, -1.307286, -4.683803, 0.372549, 1, 0, 1,
-0.5644733, -0.3118833, -1.015184, 0.3686275, 1, 0, 1,
-0.556805, 0.2349581, 0.02478218, 0.3607843, 1, 0, 1,
-0.5562862, -0.6503609, -2.374021, 0.3568628, 1, 0, 1,
-0.5561613, -0.3776631, -1.013901, 0.3490196, 1, 0, 1,
-0.5558372, -0.1404973, -2.27562, 0.345098, 1, 0, 1,
-0.5522904, -1.400527, -1.974077, 0.3372549, 1, 0, 1,
-0.5505003, 0.1826654, -0.004310133, 0.3333333, 1, 0, 1,
-0.5500694, 0.2499829, -1.15014, 0.3254902, 1, 0, 1,
-0.548312, -0.4383399, -1.018228, 0.3215686, 1, 0, 1,
-0.5394709, 1.244879, -0.6351004, 0.3137255, 1, 0, 1,
-0.5375757, 0.6625488, 2.207061, 0.3098039, 1, 0, 1,
-0.53694, 0.5310013, -1.744206, 0.3019608, 1, 0, 1,
-0.5308841, 1.259586, 1.315495, 0.2941177, 1, 0, 1,
-0.5263216, -1.322236, -2.050654, 0.2901961, 1, 0, 1,
-0.5254979, 0.2200714, -3.371766, 0.282353, 1, 0, 1,
-0.5227845, 0.1641009, 0.2746806, 0.2784314, 1, 0, 1,
-0.5216509, 0.8554902, -1.521045, 0.2705882, 1, 0, 1,
-0.5202261, -1.310403, -1.931929, 0.2666667, 1, 0, 1,
-0.5189018, -1.254886, -1.653019, 0.2588235, 1, 0, 1,
-0.5156463, 0.2130994, -1.361117, 0.254902, 1, 0, 1,
-0.5138789, -0.734742, -2.914729, 0.2470588, 1, 0, 1,
-0.5122329, 0.2623836, -0.7826229, 0.2431373, 1, 0, 1,
-0.5096865, -1.497293, -0.1614152, 0.2352941, 1, 0, 1,
-0.5081095, -0.4424401, -2.031332, 0.2313726, 1, 0, 1,
-0.5080007, -0.7346954, -2.299999, 0.2235294, 1, 0, 1,
-0.502596, 2.354947, 0.1303105, 0.2196078, 1, 0, 1,
-0.5022552, -0.1750623, -3.415057, 0.2117647, 1, 0, 1,
-0.4876781, -0.846896, -2.787989, 0.2078431, 1, 0, 1,
-0.4854235, 0.334762, -0.7297823, 0.2, 1, 0, 1,
-0.4838957, -1.580811, -1.871693, 0.1921569, 1, 0, 1,
-0.4774387, 1.019125, 0.5990718, 0.1882353, 1, 0, 1,
-0.4772041, -1.57387, -1.936558, 0.1803922, 1, 0, 1,
-0.4768404, -0.5735254, -3.339254, 0.1764706, 1, 0, 1,
-0.4750252, 0.6849973, -0.9036908, 0.1686275, 1, 0, 1,
-0.4744965, 1.432415, -0.6373639, 0.1647059, 1, 0, 1,
-0.4729546, 1.074377, 1.4635, 0.1568628, 1, 0, 1,
-0.4728, -1.019923, -3.812141, 0.1529412, 1, 0, 1,
-0.4700851, 1.259682, -0.1675925, 0.145098, 1, 0, 1,
-0.4693174, 0.6776418, -0.3058041, 0.1411765, 1, 0, 1,
-0.4679836, -0.6214668, -1.188199, 0.1333333, 1, 0, 1,
-0.4639819, 0.4505075, 0.1916277, 0.1294118, 1, 0, 1,
-0.4605388, -0.04455727, -3.318174, 0.1215686, 1, 0, 1,
-0.4602066, 0.6433215, -1.016742, 0.1176471, 1, 0, 1,
-0.4591714, 1.739728, -0.6173749, 0.1098039, 1, 0, 1,
-0.4431737, 1.904877, -0.6803502, 0.1058824, 1, 0, 1,
-0.4371092, -1.621005, -3.082908, 0.09803922, 1, 0, 1,
-0.4355631, -0.1123326, -4.323036, 0.09019608, 1, 0, 1,
-0.4338573, -1.03311, -0.8899267, 0.08627451, 1, 0, 1,
-0.4335809, 0.03112053, -1.776174, 0.07843138, 1, 0, 1,
-0.432839, -0.9907287, -3.592202, 0.07450981, 1, 0, 1,
-0.4328051, -0.2542847, -3.45389, 0.06666667, 1, 0, 1,
-0.4270445, -0.4698152, -2.437859, 0.0627451, 1, 0, 1,
-0.4228369, -1.697686, -3.084694, 0.05490196, 1, 0, 1,
-0.4143719, -0.2419167, -1.683424, 0.05098039, 1, 0, 1,
-0.4112246, 1.275169, 0.7498862, 0.04313726, 1, 0, 1,
-0.4051538, 0.984513, 0.1765569, 0.03921569, 1, 0, 1,
-0.4030527, 2.5457, -0.680189, 0.03137255, 1, 0, 1,
-0.4021429, 0.2024911, -0.6359583, 0.02745098, 1, 0, 1,
-0.3959852, -3.110361, -2.377062, 0.01960784, 1, 0, 1,
-0.3859392, 0.911155, 1.287205, 0.01568628, 1, 0, 1,
-0.3788293, -0.2218905, -0.6158469, 0.007843138, 1, 0, 1,
-0.3783089, 0.08618665, -2.234468, 0.003921569, 1, 0, 1,
-0.3723707, -0.2075654, -2.77004, 0, 1, 0.003921569, 1,
-0.3667504, 0.6255242, -0.142958, 0, 1, 0.01176471, 1,
-0.3660269, 1.036578, 1.762631, 0, 1, 0.01568628, 1,
-0.3628287, -0.1682175, -3.601997, 0, 1, 0.02352941, 1,
-0.3563851, 0.223216, -2.622553, 0, 1, 0.02745098, 1,
-0.3488816, -1.527245, -3.218633, 0, 1, 0.03529412, 1,
-0.3485344, 0.09012291, -0.9093729, 0, 1, 0.03921569, 1,
-0.3470717, 0.464248, -1.750319, 0, 1, 0.04705882, 1,
-0.3448117, 0.3350056, -0.8873188, 0, 1, 0.05098039, 1,
-0.3425524, 1.433658, 0.2794195, 0, 1, 0.05882353, 1,
-0.3409686, 0.4626949, -1.188051, 0, 1, 0.0627451, 1,
-0.3338667, -0.1171824, -0.7624773, 0, 1, 0.07058824, 1,
-0.3338446, 0.4158393, -1.502782, 0, 1, 0.07450981, 1,
-0.3314679, -1.070978, -4.311127, 0, 1, 0.08235294, 1,
-0.3281351, 0.4006544, -1.722857, 0, 1, 0.08627451, 1,
-0.3209708, 0.8336125, 0.6443141, 0, 1, 0.09411765, 1,
-0.3200365, 1.028362, -0.7247564, 0, 1, 0.1019608, 1,
-0.3190872, -1.262302, -2.519794, 0, 1, 0.1058824, 1,
-0.3190739, 1.521041, 0.8839459, 0, 1, 0.1137255, 1,
-0.3168206, 0.917954, -0.1032863, 0, 1, 0.1176471, 1,
-0.3155693, 2.608316, -1.812465, 0, 1, 0.1254902, 1,
-0.3148924, -1.261765, -1.928367, 0, 1, 0.1294118, 1,
-0.3140062, 0.02308043, -0.6201752, 0, 1, 0.1372549, 1,
-0.3094805, 0.08431869, -1.537613, 0, 1, 0.1411765, 1,
-0.3079566, 1.508622, -1.812153, 0, 1, 0.1490196, 1,
-0.3067619, -0.9730203, -1.506297, 0, 1, 0.1529412, 1,
-0.3023145, -0.9709916, -3.588483, 0, 1, 0.1607843, 1,
-0.2980554, -0.469496, -2.775755, 0, 1, 0.1647059, 1,
-0.2980553, -0.6348046, -2.943885, 0, 1, 0.172549, 1,
-0.2958417, 0.02399076, -1.914356, 0, 1, 0.1764706, 1,
-0.2929355, 0.6344237, 1.447281, 0, 1, 0.1843137, 1,
-0.2885911, 1.217124, -0.9621209, 0, 1, 0.1882353, 1,
-0.2879357, -0.5046163, -2.053316, 0, 1, 0.1960784, 1,
-0.2863618, -0.2274109, -2.120734, 0, 1, 0.2039216, 1,
-0.2859792, 0.508678, -2.300493, 0, 1, 0.2078431, 1,
-0.2829779, 0.4776568, -0.7249793, 0, 1, 0.2156863, 1,
-0.2763762, -2.952238, -0.8422008, 0, 1, 0.2196078, 1,
-0.2761503, -0.6615771, -2.476963, 0, 1, 0.227451, 1,
-0.2752784, 0.3112475, -0.3326184, 0, 1, 0.2313726, 1,
-0.2750966, 1.230714, -1.210425, 0, 1, 0.2392157, 1,
-0.2746508, -0.9267471, -1.870522, 0, 1, 0.2431373, 1,
-0.2739868, -2.245361, -2.797444, 0, 1, 0.2509804, 1,
-0.2712042, -0.1826966, -0.7983102, 0, 1, 0.254902, 1,
-0.2676499, -0.2100526, -1.240544, 0, 1, 0.2627451, 1,
-0.266895, -1.035296, -2.621912, 0, 1, 0.2666667, 1,
-0.2594894, 2.025048, 0.316582, 0, 1, 0.2745098, 1,
-0.2558304, 0.1918149, -0.9141817, 0, 1, 0.2784314, 1,
-0.2549429, -1.055814, -1.079313, 0, 1, 0.2862745, 1,
-0.2512044, -0.8631949, -2.156156, 0, 1, 0.2901961, 1,
-0.2501417, 2.208854, -1.174468, 0, 1, 0.2980392, 1,
-0.2487618, -0.0794116, -3.79091, 0, 1, 0.3058824, 1,
-0.2463751, 0.2197822, -0.1503537, 0, 1, 0.3098039, 1,
-0.2420445, -0.3208933, -1.913481, 0, 1, 0.3176471, 1,
-0.2388885, -0.4448515, -3.109185, 0, 1, 0.3215686, 1,
-0.2334023, -0.02986077, -0.9867468, 0, 1, 0.3294118, 1,
-0.233367, -2.022723, -2.145508, 0, 1, 0.3333333, 1,
-0.2295195, -1.163297, -4.341795, 0, 1, 0.3411765, 1,
-0.2262395, 0.7227603, -2.13901, 0, 1, 0.345098, 1,
-0.2216222, 0.5720692, 0.7308651, 0, 1, 0.3529412, 1,
-0.221315, 1.200124, 1.330919, 0, 1, 0.3568628, 1,
-0.2204107, -0.2327809, -4.050595, 0, 1, 0.3647059, 1,
-0.2171568, -1.631256, -5.740713, 0, 1, 0.3686275, 1,
-0.2155785, -1.866891, -3.430187, 0, 1, 0.3764706, 1,
-0.2145192, 0.4854162, -0.1168755, 0, 1, 0.3803922, 1,
-0.2135341, 1.139626, -0.8236455, 0, 1, 0.3882353, 1,
-0.2104827, -0.6587957, -3.027409, 0, 1, 0.3921569, 1,
-0.2078736, 0.9370338, -0.7184975, 0, 1, 0.4, 1,
-0.2052319, -0.7304158, -2.712214, 0, 1, 0.4078431, 1,
-0.2047027, 0.566135, 0.05858097, 0, 1, 0.4117647, 1,
-0.1990935, -2.729982, -2.041412, 0, 1, 0.4196078, 1,
-0.1942634, -0.3710141, -3.199446, 0, 1, 0.4235294, 1,
-0.1938558, 0.5142372, -2.101985, 0, 1, 0.4313726, 1,
-0.1909179, 0.7199742, -0.9953665, 0, 1, 0.4352941, 1,
-0.1907562, -0.732975, -5.666717, 0, 1, 0.4431373, 1,
-0.1891068, 0.05648139, -1.850091, 0, 1, 0.4470588, 1,
-0.1879288, -0.3396028, -3.360096, 0, 1, 0.454902, 1,
-0.1852056, 0.1140951, -1.211649, 0, 1, 0.4588235, 1,
-0.1823522, 0.3822948, -0.6670417, 0, 1, 0.4666667, 1,
-0.1769591, -0.04702564, -2.199599, 0, 1, 0.4705882, 1,
-0.1754107, 0.8041555, -2.071909, 0, 1, 0.4784314, 1,
-0.1747831, -0.7044331, -4.792602, 0, 1, 0.4823529, 1,
-0.1720622, 0.2568291, -0.4396262, 0, 1, 0.4901961, 1,
-0.1637994, 0.1576572, -0.9573483, 0, 1, 0.4941176, 1,
-0.1612826, -1.583025, -1.877767, 0, 1, 0.5019608, 1,
-0.1598536, -0.3514315, -4.548599, 0, 1, 0.509804, 1,
-0.1508006, -0.7221725, -3.425168, 0, 1, 0.5137255, 1,
-0.1507743, -1.13324, -3.761208, 0, 1, 0.5215687, 1,
-0.1260276, 0.05977365, -0.1099215, 0, 1, 0.5254902, 1,
-0.1241835, -0.4954401, -1.686939, 0, 1, 0.5333334, 1,
-0.1210092, -0.1069478, -2.599466, 0, 1, 0.5372549, 1,
-0.1187491, 0.4124514, 0.1994083, 0, 1, 0.5450981, 1,
-0.1183777, -0.1248819, -2.881503, 0, 1, 0.5490196, 1,
-0.107157, -0.6952611, -2.02422, 0, 1, 0.5568628, 1,
-0.1047292, -0.2246138, -3.175556, 0, 1, 0.5607843, 1,
-0.1011599, -1.777806, -2.634933, 0, 1, 0.5686275, 1,
-0.1004278, 0.0005217192, -1.4626, 0, 1, 0.572549, 1,
-0.1002185, 1.076386, -0.9536685, 0, 1, 0.5803922, 1,
-0.09831136, -2.058352, -2.579584, 0, 1, 0.5843138, 1,
-0.09723412, -1.95015, -4.018999, 0, 1, 0.5921569, 1,
-0.09359669, -0.6022978, -2.666872, 0, 1, 0.5960785, 1,
-0.09355082, -0.47435, -2.039332, 0, 1, 0.6039216, 1,
-0.09283604, -1.100182, -2.492606, 0, 1, 0.6117647, 1,
-0.08706158, -0.9991288, -2.77175, 0, 1, 0.6156863, 1,
-0.086895, 2.196723, -0.7979682, 0, 1, 0.6235294, 1,
-0.08089527, 0.3528081, 0.7490798, 0, 1, 0.627451, 1,
-0.0783421, 0.8686727, 0.3756126, 0, 1, 0.6352941, 1,
-0.07768432, -0.620407, -3.722862, 0, 1, 0.6392157, 1,
-0.07675367, -1.244765, -3.78168, 0, 1, 0.6470588, 1,
-0.07631807, -0.174876, -3.688792, 0, 1, 0.6509804, 1,
-0.0710348, -0.8923799, -3.319195, 0, 1, 0.6588235, 1,
-0.06901883, 0.9781367, -0.3829996, 0, 1, 0.6627451, 1,
-0.06575389, 0.2198903, -1.202778, 0, 1, 0.6705883, 1,
-0.06527387, -0.1267555, -1.361646, 0, 1, 0.6745098, 1,
-0.0631009, 0.4536338, 1.21, 0, 1, 0.682353, 1,
-0.06309827, -1.118591, -3.426633, 0, 1, 0.6862745, 1,
-0.06291369, -0.7563514, -2.913279, 0, 1, 0.6941177, 1,
-0.0619555, -0.7430485, -3.661245, 0, 1, 0.7019608, 1,
-0.05906174, -1.581293, -2.761812, 0, 1, 0.7058824, 1,
-0.05772198, 0.1799242, -2.085829, 0, 1, 0.7137255, 1,
-0.05765354, -0.01752215, -1.913019, 0, 1, 0.7176471, 1,
-0.05721265, -0.8077275, -2.793271, 0, 1, 0.7254902, 1,
-0.05389525, 0.7013838, -1.855668, 0, 1, 0.7294118, 1,
-0.04794843, 0.3783254, -0.9458505, 0, 1, 0.7372549, 1,
-0.03899264, -0.2417731, -3.183454, 0, 1, 0.7411765, 1,
-0.03659091, 0.2812928, -0.7640858, 0, 1, 0.7490196, 1,
-0.03631748, -0.2580461, -1.949549, 0, 1, 0.7529412, 1,
-0.031847, 1.795777, 0.7298716, 0, 1, 0.7607843, 1,
-0.03051344, 0.1490579, -0.02285504, 0, 1, 0.7647059, 1,
-0.02941073, 0.01539754, -0.3100391, 0, 1, 0.772549, 1,
-0.0271231, 1.699666, 0.07129657, 0, 1, 0.7764706, 1,
-0.02033216, -1.562043, -1.0911, 0, 1, 0.7843137, 1,
-0.01956479, -0.8603966, -1.895334, 0, 1, 0.7882353, 1,
-0.01838026, -0.6244697, -4.389616, 0, 1, 0.7960784, 1,
-0.01806932, -1.680883, -3.495214, 0, 1, 0.8039216, 1,
-0.0162643, -0.7410415, -2.889145, 0, 1, 0.8078431, 1,
-0.009082039, 0.1942712, 0.9748697, 0, 1, 0.8156863, 1,
-0.008079711, 0.3768737, 0.2215309, 0, 1, 0.8196079, 1,
-0.006329556, -0.8132575, -3.679733, 0, 1, 0.827451, 1,
-0.006289955, -1.623807, -3.118647, 0, 1, 0.8313726, 1,
-0.005263423, 0.7337981, -0.09865576, 0, 1, 0.8392157, 1,
-0.004129094, -1.013049, -2.000157, 0, 1, 0.8431373, 1,
-0.003661474, 0.4552811, 0.8672455, 0, 1, 0.8509804, 1,
-0.002090004, -1.001637, -2.738644, 0, 1, 0.854902, 1,
-0.001960108, 0.7445925, -1.193242, 0, 1, 0.8627451, 1,
-0.0007787007, 1.18899, 1.155156, 0, 1, 0.8666667, 1,
0.0006539057, 1.04718, 1.056546, 0, 1, 0.8745098, 1,
0.001115247, 1.871375, -0.1143522, 0, 1, 0.8784314, 1,
0.006547102, -2.076264, 2.983293, 0, 1, 0.8862745, 1,
0.007336331, -1.081082, 2.863056, 0, 1, 0.8901961, 1,
0.009548024, -0.4407781, 3.431681, 0, 1, 0.8980392, 1,
0.01216506, -0.1409797, 2.815086, 0, 1, 0.9058824, 1,
0.01338271, 0.667626, 1.109658, 0, 1, 0.9098039, 1,
0.0155593, 1.474177, -1.86763, 0, 1, 0.9176471, 1,
0.01788915, -0.5379357, 3.129045, 0, 1, 0.9215686, 1,
0.02031974, -1.212973, 3.425696, 0, 1, 0.9294118, 1,
0.02060363, -1.20806, 3.869081, 0, 1, 0.9333333, 1,
0.0274665, -0.3474917, 4.406677, 0, 1, 0.9411765, 1,
0.0322338, -0.8838483, 3.730923, 0, 1, 0.945098, 1,
0.03535219, 1.992218, 0.7075822, 0, 1, 0.9529412, 1,
0.03580429, 0.2546904, -0.009738238, 0, 1, 0.9568627, 1,
0.03749554, -0.271587, 2.4503, 0, 1, 0.9647059, 1,
0.03898441, 2.250526, 2.305104, 0, 1, 0.9686275, 1,
0.04032518, 1.194935, -0.30156, 0, 1, 0.9764706, 1,
0.04395228, 0.7312869, -0.008675703, 0, 1, 0.9803922, 1,
0.05051418, -0.1193891, 1.637533, 0, 1, 0.9882353, 1,
0.05101625, -0.1751505, 3.158531, 0, 1, 0.9921569, 1,
0.06212868, -0.3322119, 2.699239, 0, 1, 1, 1,
0.06362526, -0.4868416, 2.181232, 0, 0.9921569, 1, 1,
0.06377431, -1.018318, 1.80544, 0, 0.9882353, 1, 1,
0.06682365, 0.5161304, 0.5901243, 0, 0.9803922, 1, 1,
0.06692155, -0.03553972, 2.594919, 0, 0.9764706, 1, 1,
0.06948387, -0.112828, 3.050489, 0, 0.9686275, 1, 1,
0.07065301, 0.2445236, 1.38566, 0, 0.9647059, 1, 1,
0.07217319, -0.04610731, 0.4483329, 0, 0.9568627, 1, 1,
0.07522204, 0.6098588, 1.349249, 0, 0.9529412, 1, 1,
0.08057647, 0.6900749, 0.8465267, 0, 0.945098, 1, 1,
0.08470076, 1.199806, -0.5439616, 0, 0.9411765, 1, 1,
0.08623105, 1.759159, 1.494506, 0, 0.9333333, 1, 1,
0.08650431, 0.8113873, -0.6539615, 0, 0.9294118, 1, 1,
0.08858702, 0.1192728, 0.2221677, 0, 0.9215686, 1, 1,
0.09478758, 0.9814711, -0.6672922, 0, 0.9176471, 1, 1,
0.1083018, 0.8099759, 0.8986322, 0, 0.9098039, 1, 1,
0.1085563, -1.462752, 3.739406, 0, 0.9058824, 1, 1,
0.1101178, -1.560199, 3.8852, 0, 0.8980392, 1, 1,
0.1117148, 1.964637, 1.540334, 0, 0.8901961, 1, 1,
0.1133627, -1.133161, 3.539234, 0, 0.8862745, 1, 1,
0.1234884, -0.2980987, 4.30582, 0, 0.8784314, 1, 1,
0.1253225, -0.7966669, 3.361591, 0, 0.8745098, 1, 1,
0.1253513, -0.5274912, 3.767133, 0, 0.8666667, 1, 1,
0.1264495, -0.08718495, 2.556673, 0, 0.8627451, 1, 1,
0.1272831, -0.5986466, 1.365102, 0, 0.854902, 1, 1,
0.1282559, -0.8733516, 4.888876, 0, 0.8509804, 1, 1,
0.1326687, 0.4535146, 0.4258501, 0, 0.8431373, 1, 1,
0.1398724, -0.2263043, 5.116746, 0, 0.8392157, 1, 1,
0.1402835, -1.019051, 2.594149, 0, 0.8313726, 1, 1,
0.1451461, 0.2779782, -1.454558, 0, 0.827451, 1, 1,
0.1473712, -1.00928, 3.083346, 0, 0.8196079, 1, 1,
0.1478591, 1.067816, 0.5757241, 0, 0.8156863, 1, 1,
0.1482349, -1.61747, 1.763897, 0, 0.8078431, 1, 1,
0.1504669, 0.8845549, -1.583744, 0, 0.8039216, 1, 1,
0.1508684, 1.334854, -1.68421, 0, 0.7960784, 1, 1,
0.1562544, 0.2109358, 0.8898465, 0, 0.7882353, 1, 1,
0.1600928, -1.105833, 3.224024, 0, 0.7843137, 1, 1,
0.1606433, -1.268767, 4.76123, 0, 0.7764706, 1, 1,
0.1625064, -1.419, 3.186996, 0, 0.772549, 1, 1,
0.1634931, -0.07443314, 1.201841, 0, 0.7647059, 1, 1,
0.1672676, 0.2548304, 0.7311794, 0, 0.7607843, 1, 1,
0.168651, -1.585612, 0.2352777, 0, 0.7529412, 1, 1,
0.1690113, -1.425589, 3.271117, 0, 0.7490196, 1, 1,
0.1697835, 1.355365, -0.274225, 0, 0.7411765, 1, 1,
0.171354, -0.5024769, 3.201874, 0, 0.7372549, 1, 1,
0.1734253, 1.549278, 0.2985442, 0, 0.7294118, 1, 1,
0.1757017, -0.512916, 3.859037, 0, 0.7254902, 1, 1,
0.1806673, -0.4926147, 2.856178, 0, 0.7176471, 1, 1,
0.1819451, 1.928198, -0.09923732, 0, 0.7137255, 1, 1,
0.1867952, -0.3438428, 2.923107, 0, 0.7058824, 1, 1,
0.1874927, -0.3413494, 3.670589, 0, 0.6980392, 1, 1,
0.1912686, -1.360262, 4.339949, 0, 0.6941177, 1, 1,
0.1945211, 0.1212227, 1.002559, 0, 0.6862745, 1, 1,
0.1962457, -0.8100376, 2.290329, 0, 0.682353, 1, 1,
0.1970128, -0.4858354, 4.287702, 0, 0.6745098, 1, 1,
0.2024532, 0.01529546, 0.8516399, 0, 0.6705883, 1, 1,
0.2088431, 0.2101107, 1.036095, 0, 0.6627451, 1, 1,
0.2092766, -0.2797539, 4.288116, 0, 0.6588235, 1, 1,
0.2181163, -1.504637, 3.629594, 0, 0.6509804, 1, 1,
0.2244877, -1.917214, 1.762556, 0, 0.6470588, 1, 1,
0.226409, 1.072428, 0.6021659, 0, 0.6392157, 1, 1,
0.2271516, -0.9878423, 2.881431, 0, 0.6352941, 1, 1,
0.2278173, 2.29469, 0.4907127, 0, 0.627451, 1, 1,
0.2289048, 1.112897, 0.3706863, 0, 0.6235294, 1, 1,
0.2313811, 1.107837, 0.7831591, 0, 0.6156863, 1, 1,
0.2324118, -0.5096467, 2.846365, 0, 0.6117647, 1, 1,
0.2331426, 0.06230025, 3.265266, 0, 0.6039216, 1, 1,
0.2377591, -0.214288, 2.014626, 0, 0.5960785, 1, 1,
0.2428768, 1.922073, 2.286587, 0, 0.5921569, 1, 1,
0.2506134, 0.7515001, 0.005464, 0, 0.5843138, 1, 1,
0.2519025, -1.264645, 2.480374, 0, 0.5803922, 1, 1,
0.254156, 0.0686091, 1.223353, 0, 0.572549, 1, 1,
0.2545213, -0.7632603, 2.300022, 0, 0.5686275, 1, 1,
0.2564401, -1.325848, 2.961575, 0, 0.5607843, 1, 1,
0.25659, 0.06988101, 1.940389, 0, 0.5568628, 1, 1,
0.260333, -0.8922072, 2.365618, 0, 0.5490196, 1, 1,
0.2614245, 0.4648304, 0.2728971, 0, 0.5450981, 1, 1,
0.2666534, -1.996536, 2.695431, 0, 0.5372549, 1, 1,
0.2732431, 1.610691, -0.2484181, 0, 0.5333334, 1, 1,
0.2764486, -0.6251166, 1.855253, 0, 0.5254902, 1, 1,
0.2775843, 0.6556065, 1.588017, 0, 0.5215687, 1, 1,
0.2811342, -0.1488444, 0.6289989, 0, 0.5137255, 1, 1,
0.2813057, -0.8022407, 2.672497, 0, 0.509804, 1, 1,
0.2827071, -1.15166, 2.860724, 0, 0.5019608, 1, 1,
0.2846103, 0.5542913, 1.462521, 0, 0.4941176, 1, 1,
0.2857891, 0.3751501, -1.569751, 0, 0.4901961, 1, 1,
0.2861611, -0.8039916, 2.366407, 0, 0.4823529, 1, 1,
0.2862822, 0.6142813, 1.283221, 0, 0.4784314, 1, 1,
0.2894718, 0.4094925, 0.4715683, 0, 0.4705882, 1, 1,
0.2898255, 0.2256821, 1.502106, 0, 0.4666667, 1, 1,
0.2898923, -1.334551, 3.605242, 0, 0.4588235, 1, 1,
0.2985541, -0.1985203, 2.615365, 0, 0.454902, 1, 1,
0.2995632, -0.8855337, 1.806147, 0, 0.4470588, 1, 1,
0.305069, -0.7062717, 3.325559, 0, 0.4431373, 1, 1,
0.3054558, 1.316633, 1.162473, 0, 0.4352941, 1, 1,
0.3057452, -0.9137973, 3.295853, 0, 0.4313726, 1, 1,
0.3127832, -1.457824, 3.293154, 0, 0.4235294, 1, 1,
0.3165158, -1.253535, 3.739314, 0, 0.4196078, 1, 1,
0.3180088, 1.352723, -0.466267, 0, 0.4117647, 1, 1,
0.3223656, 1.763385, 1.113511, 0, 0.4078431, 1, 1,
0.3237005, -1.097283, 2.934216, 0, 0.4, 1, 1,
0.3262451, -1.077676, 2.177005, 0, 0.3921569, 1, 1,
0.3264229, -0.665587, 3.253162, 0, 0.3882353, 1, 1,
0.326603, -0.5501692, 3.10454, 0, 0.3803922, 1, 1,
0.3277979, 0.6246698, 0.5370022, 0, 0.3764706, 1, 1,
0.3309729, 0.773292, 0.9268704, 0, 0.3686275, 1, 1,
0.3311624, 1.775684, -1.885483, 0, 0.3647059, 1, 1,
0.3317458, 0.08779218, 0.6721279, 0, 0.3568628, 1, 1,
0.335049, 1.537082, 0.2977218, 0, 0.3529412, 1, 1,
0.3439262, 0.8662415, -1.100821, 0, 0.345098, 1, 1,
0.3466408, 1.736919, -0.1992225, 0, 0.3411765, 1, 1,
0.3524562, 0.2385553, -0.1258154, 0, 0.3333333, 1, 1,
0.3591761, -0.936506, 2.904764, 0, 0.3294118, 1, 1,
0.3602648, 0.7801238, 0.4758903, 0, 0.3215686, 1, 1,
0.3612309, 0.2540069, -0.2011019, 0, 0.3176471, 1, 1,
0.3615712, 0.4997973, 1.292107, 0, 0.3098039, 1, 1,
0.3635141, -0.3401854, 5.336328, 0, 0.3058824, 1, 1,
0.3641938, 1.048794, -1.878199, 0, 0.2980392, 1, 1,
0.3642525, 0.02612087, 1.687208, 0, 0.2901961, 1, 1,
0.3662711, 1.074198, -1.094129, 0, 0.2862745, 1, 1,
0.3684578, -0.4706191, 2.489627, 0, 0.2784314, 1, 1,
0.3712414, 0.2352474, 1.778083, 0, 0.2745098, 1, 1,
0.3773586, 0.1781216, 2.959553, 0, 0.2666667, 1, 1,
0.3802834, -0.8824589, 3.629224, 0, 0.2627451, 1, 1,
0.3828613, 0.6720915, 1.996415, 0, 0.254902, 1, 1,
0.3883102, -0.4153508, 3.598182, 0, 0.2509804, 1, 1,
0.399489, 0.0819148, 1.310931, 0, 0.2431373, 1, 1,
0.4003008, -1.342574, 2.909258, 0, 0.2392157, 1, 1,
0.4049484, 0.6135849, 0.9437056, 0, 0.2313726, 1, 1,
0.4079001, -0.3024564, 1.429843, 0, 0.227451, 1, 1,
0.4112012, -0.2446897, 2.540376, 0, 0.2196078, 1, 1,
0.4165047, 0.1619275, 0.5106718, 0, 0.2156863, 1, 1,
0.4214832, -0.1558893, 1.6051, 0, 0.2078431, 1, 1,
0.4249995, 3.120791, -0.9414049, 0, 0.2039216, 1, 1,
0.4257233, -0.3443161, 2.735463, 0, 0.1960784, 1, 1,
0.4281648, 0.1378945, 1.672933, 0, 0.1882353, 1, 1,
0.4338784, -1.227885, 1.521688, 0, 0.1843137, 1, 1,
0.4385219, -0.3415847, 3.297446, 0, 0.1764706, 1, 1,
0.4399306, 0.3942168, -0.8300871, 0, 0.172549, 1, 1,
0.4404925, 0.5335044, 1.70364, 0, 0.1647059, 1, 1,
0.4413669, -1.331729, 4.270335, 0, 0.1607843, 1, 1,
0.4420387, -0.5928707, 1.681573, 0, 0.1529412, 1, 1,
0.4467173, -0.4977846, 2.828079, 0, 0.1490196, 1, 1,
0.4487135, 0.3406483, 0.7697328, 0, 0.1411765, 1, 1,
0.4520066, -0.1576985, -0.06107249, 0, 0.1372549, 1, 1,
0.4537735, -0.3246695, 2.975112, 0, 0.1294118, 1, 1,
0.454749, -0.7389485, 1.027048, 0, 0.1254902, 1, 1,
0.4570986, -1.037359, 3.870603, 0, 0.1176471, 1, 1,
0.4598196, 1.126895, 0.109289, 0, 0.1137255, 1, 1,
0.4611719, -1.016414, 2.569276, 0, 0.1058824, 1, 1,
0.4636579, 0.3684331, 1.859161, 0, 0.09803922, 1, 1,
0.4661334, -0.3282136, 2.482319, 0, 0.09411765, 1, 1,
0.4677347, -0.8009362, 2.391988, 0, 0.08627451, 1, 1,
0.4684465, 0.1400827, 2.652622, 0, 0.08235294, 1, 1,
0.4697248, 1.173137, 0.2314359, 0, 0.07450981, 1, 1,
0.470773, -0.4660812, 1.579171, 0, 0.07058824, 1, 1,
0.4741167, -3.117376, 3.028052, 0, 0.0627451, 1, 1,
0.4763469, -1.040365, 2.359897, 0, 0.05882353, 1, 1,
0.4782798, 0.209861, 1.598136, 0, 0.05098039, 1, 1,
0.4784299, -0.618638, 3.849961, 0, 0.04705882, 1, 1,
0.4798682, -0.7876188, 0.9354205, 0, 0.03921569, 1, 1,
0.4805644, -0.1638441, 0.7895826, 0, 0.03529412, 1, 1,
0.4862301, 2.071671, -0.3267814, 0, 0.02745098, 1, 1,
0.4909798, -0.07162097, 0.4325014, 0, 0.02352941, 1, 1,
0.4915492, 0.1452844, 2.082829, 0, 0.01568628, 1, 1,
0.4924249, -0.1533617, 2.596524, 0, 0.01176471, 1, 1,
0.4933265, -1.529685, 2.869648, 0, 0.003921569, 1, 1,
0.5006112, -1.643873, 1.477709, 0.003921569, 0, 1, 1,
0.5012805, 1.379766, 0.2403315, 0.007843138, 0, 1, 1,
0.5017846, 2.025091, 0.9207089, 0.01568628, 0, 1, 1,
0.5024081, 0.6710963, 0.6275406, 0.01960784, 0, 1, 1,
0.5117908, 0.1353018, 1.652303, 0.02745098, 0, 1, 1,
0.5146413, 0.5520141, -0.3399771, 0.03137255, 0, 1, 1,
0.5171248, -0.1274526, 0.4775926, 0.03921569, 0, 1, 1,
0.5175952, -1.325458, 1.940479, 0.04313726, 0, 1, 1,
0.519147, 0.7242166, 0.3199105, 0.05098039, 0, 1, 1,
0.5228117, 1.32855, 1.086345, 0.05490196, 0, 1, 1,
0.5230656, 1.214411, 1.009174, 0.0627451, 0, 1, 1,
0.5359699, -0.1550081, 0.8422161, 0.06666667, 0, 1, 1,
0.5360932, -0.938453, 2.313989, 0.07450981, 0, 1, 1,
0.5406079, 0.8971235, -0.3047647, 0.07843138, 0, 1, 1,
0.5415248, -0.2846907, 2.039702, 0.08627451, 0, 1, 1,
0.5419576, 1.511365, -0.7663634, 0.09019608, 0, 1, 1,
0.5460683, 0.2867759, 0.4520164, 0.09803922, 0, 1, 1,
0.547795, -1.890718, 3.827001, 0.1058824, 0, 1, 1,
0.5518874, -0.2543287, 2.956503, 0.1098039, 0, 1, 1,
0.5519842, -0.984581, 5.159705, 0.1176471, 0, 1, 1,
0.5541922, -2.179682, 1.650163, 0.1215686, 0, 1, 1,
0.5572874, -0.1924107, 2.852561, 0.1294118, 0, 1, 1,
0.5634123, -2.549047, 1.341897, 0.1333333, 0, 1, 1,
0.5640225, 0.002827961, 2.249627, 0.1411765, 0, 1, 1,
0.5655214, -1.094755, 2.03379, 0.145098, 0, 1, 1,
0.5695824, 0.8060011, 1.850734, 0.1529412, 0, 1, 1,
0.5707579, -0.4073467, 3.290819, 0.1568628, 0, 1, 1,
0.5714625, 0.9981763, -1.721694, 0.1647059, 0, 1, 1,
0.5724291, 1.680529, 1.319016, 0.1686275, 0, 1, 1,
0.5746948, 0.5418773, 0.437928, 0.1764706, 0, 1, 1,
0.5771924, -0.5059136, 2.319399, 0.1803922, 0, 1, 1,
0.5775529, 0.9061921, 0.1764278, 0.1882353, 0, 1, 1,
0.5777861, -0.7841665, 2.488024, 0.1921569, 0, 1, 1,
0.5820957, -0.6101921, 2.198522, 0.2, 0, 1, 1,
0.5824087, 0.2090021, -0.7707952, 0.2078431, 0, 1, 1,
0.584916, 0.931949, -0.4982678, 0.2117647, 0, 1, 1,
0.5872689, 0.7479504, -0.2321461, 0.2196078, 0, 1, 1,
0.5874956, -0.4574209, 1.737215, 0.2235294, 0, 1, 1,
0.5877607, -0.5563063, 3.341027, 0.2313726, 0, 1, 1,
0.591472, 2.064994, -0.004097938, 0.2352941, 0, 1, 1,
0.5942252, 0.05904804, 1.068101, 0.2431373, 0, 1, 1,
0.595269, -2.357403, 2.639259, 0.2470588, 0, 1, 1,
0.5985638, 2.328291, -0.07321291, 0.254902, 0, 1, 1,
0.6013551, 0.000620336, 1.004315, 0.2588235, 0, 1, 1,
0.6099821, -1.634203, 2.557256, 0.2666667, 0, 1, 1,
0.6104791, -1.075565, 1.076657, 0.2705882, 0, 1, 1,
0.6126851, -0.1850819, 1.507019, 0.2784314, 0, 1, 1,
0.6172005, -0.1738526, 2.327498, 0.282353, 0, 1, 1,
0.6195627, 0.313848, 1.787572, 0.2901961, 0, 1, 1,
0.6209002, -0.532788, 2.873226, 0.2941177, 0, 1, 1,
0.624963, -1.046113, 3.718282, 0.3019608, 0, 1, 1,
0.6270845, 1.060325, 2.4003, 0.3098039, 0, 1, 1,
0.6280349, -0.3185094, 1.905587, 0.3137255, 0, 1, 1,
0.6286176, -0.8345377, 3.637194, 0.3215686, 0, 1, 1,
0.6289321, 0.3927043, 1.056524, 0.3254902, 0, 1, 1,
0.629089, -1.666487, 1.499668, 0.3333333, 0, 1, 1,
0.6324681, 0.7647098, -0.09606411, 0.3372549, 0, 1, 1,
0.6363569, 1.228987, 0.9623499, 0.345098, 0, 1, 1,
0.6466441, 1.771945, 0.7280337, 0.3490196, 0, 1, 1,
0.6482859, 1.690718, -0.3523727, 0.3568628, 0, 1, 1,
0.6491486, 0.335066, -1.000641, 0.3607843, 0, 1, 1,
0.6500169, -0.8537137, 2.156307, 0.3686275, 0, 1, 1,
0.6548572, 0.7305927, -0.6312245, 0.372549, 0, 1, 1,
0.6550192, 0.3584875, 1.506535, 0.3803922, 0, 1, 1,
0.6556498, 0.6289142, 1.664412, 0.3843137, 0, 1, 1,
0.6559106, 0.5528012, 0.3943098, 0.3921569, 0, 1, 1,
0.6589703, -0.1928393, 1.931605, 0.3960784, 0, 1, 1,
0.659394, 0.233303, -0.06075091, 0.4039216, 0, 1, 1,
0.6603185, 1.115136, 1.057585, 0.4117647, 0, 1, 1,
0.6610111, -0.1996931, 3.496407, 0.4156863, 0, 1, 1,
0.6616882, 1.580176, -0.2696834, 0.4235294, 0, 1, 1,
0.6678919, 0.697978, 3.426103, 0.427451, 0, 1, 1,
0.6713182, 0.1598655, 2.496768, 0.4352941, 0, 1, 1,
0.6774347, -0.0927346, 1.41114, 0.4392157, 0, 1, 1,
0.6806539, 0.0194732, 1.630022, 0.4470588, 0, 1, 1,
0.6844178, -1.59735, 0.480199, 0.4509804, 0, 1, 1,
0.6890267, -0.1753281, 0.7692264, 0.4588235, 0, 1, 1,
0.6892205, -0.3603876, 2.263218, 0.4627451, 0, 1, 1,
0.6894423, 0.4726631, 0.6241129, 0.4705882, 0, 1, 1,
0.6910608, 1.081266, 1.627138, 0.4745098, 0, 1, 1,
0.6911943, -0.2374239, 1.194212, 0.4823529, 0, 1, 1,
0.6970953, 0.2011592, -0.9776673, 0.4862745, 0, 1, 1,
0.6975288, 1.401472, 1.169989, 0.4941176, 0, 1, 1,
0.7068855, 0.7055836, -0.5660526, 0.5019608, 0, 1, 1,
0.7088205, 0.06466788, 0.473266, 0.5058824, 0, 1, 1,
0.7129984, 1.065349, -0.1713035, 0.5137255, 0, 1, 1,
0.7161159, 1.230277, 1.358529, 0.5176471, 0, 1, 1,
0.7212633, 0.03039575, 2.112868, 0.5254902, 0, 1, 1,
0.729749, 0.5214522, 0.7458881, 0.5294118, 0, 1, 1,
0.7334337, 0.5104018, 0.6759251, 0.5372549, 0, 1, 1,
0.7370533, -1.377396, 3.568865, 0.5411765, 0, 1, 1,
0.7393719, -1.116796, 3.436428, 0.5490196, 0, 1, 1,
0.743515, 0.2045068, 2.019273, 0.5529412, 0, 1, 1,
0.7489765, 0.5098321, 0.1073134, 0.5607843, 0, 1, 1,
0.7492801, -1.831178, 2.931561, 0.5647059, 0, 1, 1,
0.7515264, 0.8748283, -0.3553553, 0.572549, 0, 1, 1,
0.7547754, -2.006878, 2.890045, 0.5764706, 0, 1, 1,
0.7550161, -0.3739821, 1.862365, 0.5843138, 0, 1, 1,
0.7581788, 0.3356396, 1.839437, 0.5882353, 0, 1, 1,
0.7593101, 0.4763284, -0.6611245, 0.5960785, 0, 1, 1,
0.7599847, 0.1345838, 1.670915, 0.6039216, 0, 1, 1,
0.7639428, -0.2850038, 3.342869, 0.6078432, 0, 1, 1,
0.7684779, -1.583159, 3.518521, 0.6156863, 0, 1, 1,
0.7698728, -0.04577954, 2.904298, 0.6196079, 0, 1, 1,
0.7739431, -0.3462852, 0.8900795, 0.627451, 0, 1, 1,
0.7748502, -0.5849161, 1.723028, 0.6313726, 0, 1, 1,
0.7757486, -0.376131, 1.856797, 0.6392157, 0, 1, 1,
0.7769725, 0.4479757, 1.305503, 0.6431373, 0, 1, 1,
0.7787938, -1.698088, 3.739197, 0.6509804, 0, 1, 1,
0.7826183, 0.7313371, 0.4679231, 0.654902, 0, 1, 1,
0.7830942, 0.04914266, 0.9166773, 0.6627451, 0, 1, 1,
0.7856007, -1.110359, 3.064553, 0.6666667, 0, 1, 1,
0.7873826, 0.6292912, 1.718094, 0.6745098, 0, 1, 1,
0.7903249, -0.7409897, 2.455952, 0.6784314, 0, 1, 1,
0.7969494, 0.3061101, 0.6615185, 0.6862745, 0, 1, 1,
0.8008972, -0.616555, 0.423616, 0.6901961, 0, 1, 1,
0.8071616, -0.1403233, 3.3297, 0.6980392, 0, 1, 1,
0.8081458, 1.405078, -2.074116, 0.7058824, 0, 1, 1,
0.8086343, -0.0953245, 0.05633226, 0.7098039, 0, 1, 1,
0.8114502, 1.312932, 0.2502995, 0.7176471, 0, 1, 1,
0.8207554, -1.293597, 1.623154, 0.7215686, 0, 1, 1,
0.8218712, -1.192206, 3.062827, 0.7294118, 0, 1, 1,
0.8257499, 1.214556, 1.78765, 0.7333333, 0, 1, 1,
0.8297579, -1.007704, 3.510639, 0.7411765, 0, 1, 1,
0.8384451, 0.5128573, 0.7606919, 0.7450981, 0, 1, 1,
0.8385062, -0.7800564, 2.634578, 0.7529412, 0, 1, 1,
0.8407105, -0.1844481, 1.373059, 0.7568628, 0, 1, 1,
0.8415539, 2.828366, -0.545485, 0.7647059, 0, 1, 1,
0.8479568, 1.615332, -0.3063135, 0.7686275, 0, 1, 1,
0.855068, 1.435155, 2.033998, 0.7764706, 0, 1, 1,
0.8550703, -0.9186357, 1.955009, 0.7803922, 0, 1, 1,
0.855922, -0.8241937, 3.060964, 0.7882353, 0, 1, 1,
0.857714, 0.7833337, 0.09019636, 0.7921569, 0, 1, 1,
0.8588341, 1.008016, 0.3694837, 0.8, 0, 1, 1,
0.8610491, -0.2586513, 1.385027, 0.8078431, 0, 1, 1,
0.8615766, 0.7341536, 0.9700212, 0.8117647, 0, 1, 1,
0.864934, 0.822166, 0.6892546, 0.8196079, 0, 1, 1,
0.8663327, -1.151081, 3.774111, 0.8235294, 0, 1, 1,
0.8687638, -0.05202384, -0.1736929, 0.8313726, 0, 1, 1,
0.8702482, 0.1368615, 2.413976, 0.8352941, 0, 1, 1,
0.8753057, -0.06567901, 1.866244, 0.8431373, 0, 1, 1,
0.8782324, -2.164292, 3.400469, 0.8470588, 0, 1, 1,
0.882676, -0.7172764, 2.965839, 0.854902, 0, 1, 1,
0.8948644, 1.179526, 0.6691407, 0.8588235, 0, 1, 1,
0.8982127, -0.02092255, 2.562281, 0.8666667, 0, 1, 1,
0.9023401, -0.06454302, 1.384216, 0.8705882, 0, 1, 1,
0.9025217, 2.135898, 0.3315902, 0.8784314, 0, 1, 1,
0.9063093, 0.4733515, 0.6226417, 0.8823529, 0, 1, 1,
0.9160096, -0.1114066, 1.758425, 0.8901961, 0, 1, 1,
0.916618, -0.288594, 0.03968428, 0.8941177, 0, 1, 1,
0.9176406, -0.1348203, 0.5558782, 0.9019608, 0, 1, 1,
0.9230345, -0.02949054, -0.399068, 0.9098039, 0, 1, 1,
0.9298512, 0.769742, 0.4258227, 0.9137255, 0, 1, 1,
0.9308994, 0.3077315, 1.899117, 0.9215686, 0, 1, 1,
0.9330233, -1.32068, 2.415959, 0.9254902, 0, 1, 1,
0.9349049, 0.2715726, -0.4773712, 0.9333333, 0, 1, 1,
0.9353359, 1.979631, 0.977873, 0.9372549, 0, 1, 1,
0.9370756, -0.9554175, 3.067441, 0.945098, 0, 1, 1,
0.9392909, -0.5674418, 2.763363, 0.9490196, 0, 1, 1,
0.9395458, 0.004280104, 2.224642, 0.9568627, 0, 1, 1,
0.9428452, 1.124191, 1.78897, 0.9607843, 0, 1, 1,
0.9514861, 0.6878318, 1.492691, 0.9686275, 0, 1, 1,
0.9541343, 0.8554273, 0.06410094, 0.972549, 0, 1, 1,
0.9562473, 0.3086293, 0.9826265, 0.9803922, 0, 1, 1,
0.958742, -1.276464, 1.227661, 0.9843137, 0, 1, 1,
0.9614592, -0.9935911, 3.187392, 0.9921569, 0, 1, 1,
0.9643718, 0.8029207, 1.36667, 0.9960784, 0, 1, 1,
0.9697444, 0.3362409, 0.908681, 1, 0, 0.9960784, 1,
0.9822524, -1.437112, 1.935528, 1, 0, 0.9882353, 1,
0.9879689, 0.8720132, 0.01857581, 1, 0, 0.9843137, 1,
1.001163, 0.5966842, 0.1326464, 1, 0, 0.9764706, 1,
1.002547, 0.8236752, -0.08231747, 1, 0, 0.972549, 1,
1.004291, 1.693781, 0.1613729, 1, 0, 0.9647059, 1,
1.0142, -0.763484, 1.419538, 1, 0, 0.9607843, 1,
1.01791, 1.107295, 2.019036, 1, 0, 0.9529412, 1,
1.020163, 0.134271, 1.587271, 1, 0, 0.9490196, 1,
1.021889, 1.197011, 0.9757549, 1, 0, 0.9411765, 1,
1.02817, -1.541642, -0.03385895, 1, 0, 0.9372549, 1,
1.031797, 1.960566, 1.862013, 1, 0, 0.9294118, 1,
1.033856, -0.02540953, 0.2863992, 1, 0, 0.9254902, 1,
1.046948, -0.2945749, 1.326399, 1, 0, 0.9176471, 1,
1.047115, -0.763346, 0.692091, 1, 0, 0.9137255, 1,
1.049107, -0.2710158, 0.9431431, 1, 0, 0.9058824, 1,
1.051262, 0.1189725, 3.307224, 1, 0, 0.9019608, 1,
1.056163, -2.544441, 3.648427, 1, 0, 0.8941177, 1,
1.056653, 0.2556383, 1.650352, 1, 0, 0.8862745, 1,
1.059673, -0.06273836, 1.503993, 1, 0, 0.8823529, 1,
1.071102, 0.2416827, 0.3626119, 1, 0, 0.8745098, 1,
1.074134, -0.6611571, 2.325341, 1, 0, 0.8705882, 1,
1.074798, 0.06007479, 0.4539883, 1, 0, 0.8627451, 1,
1.080274, -1.575404, 2.699514, 1, 0, 0.8588235, 1,
1.089401, 1.438422, -0.1960206, 1, 0, 0.8509804, 1,
1.096163, 1.427763, 0.4488599, 1, 0, 0.8470588, 1,
1.100442, 0.4911037, 0.6243444, 1, 0, 0.8392157, 1,
1.112238, -1.710039, 3.320391, 1, 0, 0.8352941, 1,
1.112405, 1.758286, 0.5556716, 1, 0, 0.827451, 1,
1.113391, 1.381399, -0.2459567, 1, 0, 0.8235294, 1,
1.11389, -0.4983622, 3.046042, 1, 0, 0.8156863, 1,
1.122931, -0.6109735, 2.2061, 1, 0, 0.8117647, 1,
1.139473, 0.7957717, 0.1029874, 1, 0, 0.8039216, 1,
1.139594, 0.03206732, 1.37105, 1, 0, 0.7960784, 1,
1.15031, 2.614748, 1.388088, 1, 0, 0.7921569, 1,
1.150937, -0.2329606, 1.978012, 1, 0, 0.7843137, 1,
1.153544, 0.6757206, 1.497659, 1, 0, 0.7803922, 1,
1.158533, 0.08280484, 1.218046, 1, 0, 0.772549, 1,
1.170711, -0.1854979, 2.410117, 1, 0, 0.7686275, 1,
1.173034, 0.3415678, -0.5240815, 1, 0, 0.7607843, 1,
1.182413, 0.2670862, 0.1196959, 1, 0, 0.7568628, 1,
1.183327, 1.09236, 0.9856793, 1, 0, 0.7490196, 1,
1.183387, -0.1953231, 2.294005, 1, 0, 0.7450981, 1,
1.197307, 0.2823322, -0.1382932, 1, 0, 0.7372549, 1,
1.200179, -0.7018444, 2.15202, 1, 0, 0.7333333, 1,
1.200306, 0.2276004, 1.524249, 1, 0, 0.7254902, 1,
1.203317, -0.4218317, 1.571192, 1, 0, 0.7215686, 1,
1.204806, 1.102131, 1.399032, 1, 0, 0.7137255, 1,
1.207987, 0.04812771, 3.164381, 1, 0, 0.7098039, 1,
1.218666, 0.06839626, 3.001275, 1, 0, 0.7019608, 1,
1.225053, -0.3372267, 1.514056, 1, 0, 0.6941177, 1,
1.229464, -0.06546069, 0.9125095, 1, 0, 0.6901961, 1,
1.231486, 0.004803454, 1.032512, 1, 0, 0.682353, 1,
1.240268, 1.446018, 0.8548936, 1, 0, 0.6784314, 1,
1.240841, 1.405075, 2.406665, 1, 0, 0.6705883, 1,
1.245609, -2.07768, 4.631249, 1, 0, 0.6666667, 1,
1.253431, 2.147389, 0.6799653, 1, 0, 0.6588235, 1,
1.265669, 1.182449, 1.95391, 1, 0, 0.654902, 1,
1.270798, 1.280395, 0.5708634, 1, 0, 0.6470588, 1,
1.27119, -0.8156011, 1.07396, 1, 0, 0.6431373, 1,
1.276801, 1.349501, -0.04477035, 1, 0, 0.6352941, 1,
1.28343, 0.9319406, -1.178565, 1, 0, 0.6313726, 1,
1.288708, 2.8204, -1.953017, 1, 0, 0.6235294, 1,
1.291972, -1.270948, 2.460467, 1, 0, 0.6196079, 1,
1.301528, 0.2190977, 1.466514, 1, 0, 0.6117647, 1,
1.308392, -0.2462475, 1.159011, 1, 0, 0.6078432, 1,
1.314066, 1.135687, 0.1486586, 1, 0, 0.6, 1,
1.338379, -0.1533656, 1.746592, 1, 0, 0.5921569, 1,
1.340156, -0.09619273, 0.3690098, 1, 0, 0.5882353, 1,
1.351818, 0.364206, 1.473734, 1, 0, 0.5803922, 1,
1.372707, 0.2689825, -0.8414664, 1, 0, 0.5764706, 1,
1.373232, -0.2459947, 0.9488025, 1, 0, 0.5686275, 1,
1.377712, -0.2509682, 0.3754131, 1, 0, 0.5647059, 1,
1.380176, -1.069076, 2.820801, 1, 0, 0.5568628, 1,
1.381825, -2.62107, 1.986686, 1, 0, 0.5529412, 1,
1.383443, -1.962878, 3.436841, 1, 0, 0.5450981, 1,
1.386288, -0.2296067, 1.806508, 1, 0, 0.5411765, 1,
1.407718, 0.1287142, 0.7626505, 1, 0, 0.5333334, 1,
1.415076, -0.6900266, 2.52291, 1, 0, 0.5294118, 1,
1.419086, -0.9227219, 2.89416, 1, 0, 0.5215687, 1,
1.429033, 0.3545017, 2.084485, 1, 0, 0.5176471, 1,
1.449241, 0.04147797, 1.232848, 1, 0, 0.509804, 1,
1.457911, -0.7673332, 1.288992, 1, 0, 0.5058824, 1,
1.459951, -1.214737, 2.349702, 1, 0, 0.4980392, 1,
1.465863, -0.6019927, 3.010339, 1, 0, 0.4901961, 1,
1.466876, 2.472874, 0.9315397, 1, 0, 0.4862745, 1,
1.469704, -0.6402677, 3.916083, 1, 0, 0.4784314, 1,
1.470635, -0.0008673642, 2.295172, 1, 0, 0.4745098, 1,
1.481664, 0.1358199, 3.134812, 1, 0, 0.4666667, 1,
1.495806, -2.165692, 2.517723, 1, 0, 0.4627451, 1,
1.503894, -1.752023, 1.955691, 1, 0, 0.454902, 1,
1.5058, -1.365081, 1.771102, 1, 0, 0.4509804, 1,
1.51201, 1.081719, 0.2057179, 1, 0, 0.4431373, 1,
1.51242, 0.06366857, 0.6258035, 1, 0, 0.4392157, 1,
1.520045, 0.08509418, 0.6634783, 1, 0, 0.4313726, 1,
1.527078, 0.9928501, 0.4844067, 1, 0, 0.427451, 1,
1.528548, 0.1695217, 1.299239, 1, 0, 0.4196078, 1,
1.529355, 0.2836351, 1.392516, 1, 0, 0.4156863, 1,
1.535908, -0.9829882, 2.635315, 1, 0, 0.4078431, 1,
1.538886, 1.022795, 2.624669, 1, 0, 0.4039216, 1,
1.552328, -0.1295062, 1.431419, 1, 0, 0.3960784, 1,
1.557172, -0.5763087, 2.424988, 1, 0, 0.3882353, 1,
1.559498, -0.7919099, 2.414863, 1, 0, 0.3843137, 1,
1.582634, -0.7422168, 1.965438, 1, 0, 0.3764706, 1,
1.583969, -1.929974, 2.500694, 1, 0, 0.372549, 1,
1.585859, 1.910098, 0.3131363, 1, 0, 0.3647059, 1,
1.592202, 0.8142285, 0.9291881, 1, 0, 0.3607843, 1,
1.606366, 1.333214, 0.00648981, 1, 0, 0.3529412, 1,
1.60681, 0.3777584, 0.2261703, 1, 0, 0.3490196, 1,
1.61678, -0.9596443, 3.827359, 1, 0, 0.3411765, 1,
1.620906, -0.1136255, 2.727955, 1, 0, 0.3372549, 1,
1.629613, -1.237761, -0.02583286, 1, 0, 0.3294118, 1,
1.647643, -1.55569, 2.544023, 1, 0, 0.3254902, 1,
1.649973, -0.1994114, 2.55121, 1, 0, 0.3176471, 1,
1.652542, 0.03846357, 1.536415, 1, 0, 0.3137255, 1,
1.676624, 0.3940274, 0.3603087, 1, 0, 0.3058824, 1,
1.686164, 1.053895, 0.7511103, 1, 0, 0.2980392, 1,
1.687988, 0.4744303, 1.044659, 1, 0, 0.2941177, 1,
1.69012, 0.9331252, 0.008427718, 1, 0, 0.2862745, 1,
1.714626, -2.122632, 2.965719, 1, 0, 0.282353, 1,
1.720444, 0.06824188, 2.365159, 1, 0, 0.2745098, 1,
1.733213, 0.6403742, 2.651658, 1, 0, 0.2705882, 1,
1.745932, 1.565138, 1.705677, 1, 0, 0.2627451, 1,
1.765978, 0.4297386, 1.712869, 1, 0, 0.2588235, 1,
1.777474, -0.01095161, 0.573777, 1, 0, 0.2509804, 1,
1.777731, 0.4600983, 2.746589, 1, 0, 0.2470588, 1,
1.792097, -1.098938, 2.514468, 1, 0, 0.2392157, 1,
1.801148, -0.9122072, 3.009208, 1, 0, 0.2352941, 1,
1.802679, -0.2518775, 1.706944, 1, 0, 0.227451, 1,
1.808215, -0.4651091, 2.505465, 1, 0, 0.2235294, 1,
1.815871, -1.931733, 1.640339, 1, 0, 0.2156863, 1,
1.818183, -0.1846201, 2.474429, 1, 0, 0.2117647, 1,
1.8547, 0.7531577, 2.187515, 1, 0, 0.2039216, 1,
1.865101, -0.2401054, 0.3557367, 1, 0, 0.1960784, 1,
1.86991, 0.7313704, 1.837372, 1, 0, 0.1921569, 1,
1.896901, 1.280666, 1.500623, 1, 0, 0.1843137, 1,
1.922788, -0.8009127, 2.995939, 1, 0, 0.1803922, 1,
1.933636, -0.1622296, 2.034586, 1, 0, 0.172549, 1,
1.955694, -0.2995489, 1.714449, 1, 0, 0.1686275, 1,
1.961896, 0.976211, 3.377849, 1, 0, 0.1607843, 1,
1.979422, 1.329958, 1.146189, 1, 0, 0.1568628, 1,
1.993621, 0.09362943, 0.4564359, 1, 0, 0.1490196, 1,
2.001737, 1.009816, 2.682262, 1, 0, 0.145098, 1,
2.045172, 0.3035687, 1.153935, 1, 0, 0.1372549, 1,
2.052154, 0.8308092, 1.091032, 1, 0, 0.1333333, 1,
2.067996, -0.862112, 1.494675, 1, 0, 0.1254902, 1,
2.08798, 0.1873138, 1.168545, 1, 0, 0.1215686, 1,
2.111465, 0.766533, 0.5703838, 1, 0, 0.1137255, 1,
2.127107, -2.639519, 1.565047, 1, 0, 0.1098039, 1,
2.143407, -0.31816, 1.387276, 1, 0, 0.1019608, 1,
2.167259, 0.2261285, 1.856768, 1, 0, 0.09411765, 1,
2.192984, -1.610393, 2.505068, 1, 0, 0.09019608, 1,
2.194751, -0.5187094, 3.115123, 1, 0, 0.08235294, 1,
2.230175, -1.621516, 0.7580083, 1, 0, 0.07843138, 1,
2.257606, 0.7834909, 2.367214, 1, 0, 0.07058824, 1,
2.303692, -0.9890761, 2.207809, 1, 0, 0.06666667, 1,
2.3058, -0.4748108, 1.77827, 1, 0, 0.05882353, 1,
2.319907, 0.1346958, 2.119786, 1, 0, 0.05490196, 1,
2.401304, -0.4586991, 1.448161, 1, 0, 0.04705882, 1,
2.464549, 0.5905502, 1.54351, 1, 0, 0.04313726, 1,
2.499796, 0.193555, 2.725015, 1, 0, 0.03529412, 1,
2.736731, 0.04916912, 2.70884, 1, 0, 0.03137255, 1,
2.816553, -1.614958, 0.8294035, 1, 0, 0.02352941, 1,
2.850992, 0.01811508, 1.871958, 1, 0, 0.01960784, 1,
3.128736, -0.3868748, 1.935509, 1, 0, 0.01176471, 1,
3.283744, -0.559727, 2.24916, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.06567311, -5.713001, -7.618271, 0, -0.5, 0.5, 0.5,
0.06567311, -5.713001, -7.618271, 1, -0.5, 0.5, 0.5,
0.06567311, -5.713001, -7.618271, 1, 1.5, 0.5, 0.5,
0.06567311, -5.713001, -7.618271, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.243324, -0.6559476, -7.618271, 0, -0.5, 0.5, 0.5,
-4.243324, -0.6559476, -7.618271, 1, -0.5, 0.5, 0.5,
-4.243324, -0.6559476, -7.618271, 1, 1.5, 0.5, 0.5,
-4.243324, -0.6559476, -7.618271, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.243324, -5.713001, -0.2021925, 0, -0.5, 0.5, 0.5,
-4.243324, -5.713001, -0.2021925, 1, -0.5, 0.5, 0.5,
-4.243324, -5.713001, -0.2021925, 1, 1.5, 0.5, 0.5,
-4.243324, -5.713001, -0.2021925, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -4.545989, -5.906868,
3, -4.545989, -5.906868,
-3, -4.545989, -5.906868,
-3, -4.74049, -6.192102,
-2, -4.545989, -5.906868,
-2, -4.74049, -6.192102,
-1, -4.545989, -5.906868,
-1, -4.74049, -6.192102,
0, -4.545989, -5.906868,
0, -4.74049, -6.192102,
1, -4.545989, -5.906868,
1, -4.74049, -6.192102,
2, -4.545989, -5.906868,
2, -4.74049, -6.192102,
3, -4.545989, -5.906868,
3, -4.74049, -6.192102
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -5.129495, -6.762569, 0, -0.5, 0.5, 0.5,
-3, -5.129495, -6.762569, 1, -0.5, 0.5, 0.5,
-3, -5.129495, -6.762569, 1, 1.5, 0.5, 0.5,
-3, -5.129495, -6.762569, 0, 1.5, 0.5, 0.5,
-2, -5.129495, -6.762569, 0, -0.5, 0.5, 0.5,
-2, -5.129495, -6.762569, 1, -0.5, 0.5, 0.5,
-2, -5.129495, -6.762569, 1, 1.5, 0.5, 0.5,
-2, -5.129495, -6.762569, 0, 1.5, 0.5, 0.5,
-1, -5.129495, -6.762569, 0, -0.5, 0.5, 0.5,
-1, -5.129495, -6.762569, 1, -0.5, 0.5, 0.5,
-1, -5.129495, -6.762569, 1, 1.5, 0.5, 0.5,
-1, -5.129495, -6.762569, 0, 1.5, 0.5, 0.5,
0, -5.129495, -6.762569, 0, -0.5, 0.5, 0.5,
0, -5.129495, -6.762569, 1, -0.5, 0.5, 0.5,
0, -5.129495, -6.762569, 1, 1.5, 0.5, 0.5,
0, -5.129495, -6.762569, 0, 1.5, 0.5, 0.5,
1, -5.129495, -6.762569, 0, -0.5, 0.5, 0.5,
1, -5.129495, -6.762569, 1, -0.5, 0.5, 0.5,
1, -5.129495, -6.762569, 1, 1.5, 0.5, 0.5,
1, -5.129495, -6.762569, 0, 1.5, 0.5, 0.5,
2, -5.129495, -6.762569, 0, -0.5, 0.5, 0.5,
2, -5.129495, -6.762569, 1, -0.5, 0.5, 0.5,
2, -5.129495, -6.762569, 1, 1.5, 0.5, 0.5,
2, -5.129495, -6.762569, 0, 1.5, 0.5, 0.5,
3, -5.129495, -6.762569, 0, -0.5, 0.5, 0.5,
3, -5.129495, -6.762569, 1, -0.5, 0.5, 0.5,
3, -5.129495, -6.762569, 1, 1.5, 0.5, 0.5,
3, -5.129495, -6.762569, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.24894, -4, -5.906868,
-3.24894, 2, -5.906868,
-3.24894, -4, -5.906868,
-3.414671, -4, -6.192102,
-3.24894, -2, -5.906868,
-3.414671, -2, -6.192102,
-3.24894, 0, -5.906868,
-3.414671, 0, -6.192102,
-3.24894, 2, -5.906868,
-3.414671, 2, -6.192102
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-4",
"-2",
"0",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.746132, -4, -6.762569, 0, -0.5, 0.5, 0.5,
-3.746132, -4, -6.762569, 1, -0.5, 0.5, 0.5,
-3.746132, -4, -6.762569, 1, 1.5, 0.5, 0.5,
-3.746132, -4, -6.762569, 0, 1.5, 0.5, 0.5,
-3.746132, -2, -6.762569, 0, -0.5, 0.5, 0.5,
-3.746132, -2, -6.762569, 1, -0.5, 0.5, 0.5,
-3.746132, -2, -6.762569, 1, 1.5, 0.5, 0.5,
-3.746132, -2, -6.762569, 0, 1.5, 0.5, 0.5,
-3.746132, 0, -6.762569, 0, -0.5, 0.5, 0.5,
-3.746132, 0, -6.762569, 1, -0.5, 0.5, 0.5,
-3.746132, 0, -6.762569, 1, 1.5, 0.5, 0.5,
-3.746132, 0, -6.762569, 0, 1.5, 0.5, 0.5,
-3.746132, 2, -6.762569, 0, -0.5, 0.5, 0.5,
-3.746132, 2, -6.762569, 1, -0.5, 0.5, 0.5,
-3.746132, 2, -6.762569, 1, 1.5, 0.5, 0.5,
-3.746132, 2, -6.762569, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.24894, -4.545989, -4,
-3.24894, -4.545989, 4,
-3.24894, -4.545989, -4,
-3.414671, -4.74049, -4,
-3.24894, -4.545989, -2,
-3.414671, -4.74049, -2,
-3.24894, -4.545989, 0,
-3.414671, -4.74049, 0,
-3.24894, -4.545989, 2,
-3.414671, -4.74049, 2,
-3.24894, -4.545989, 4,
-3.414671, -4.74049, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.746132, -5.129495, -4, 0, -0.5, 0.5, 0.5,
-3.746132, -5.129495, -4, 1, -0.5, 0.5, 0.5,
-3.746132, -5.129495, -4, 1, 1.5, 0.5, 0.5,
-3.746132, -5.129495, -4, 0, 1.5, 0.5, 0.5,
-3.746132, -5.129495, -2, 0, -0.5, 0.5, 0.5,
-3.746132, -5.129495, -2, 1, -0.5, 0.5, 0.5,
-3.746132, -5.129495, -2, 1, 1.5, 0.5, 0.5,
-3.746132, -5.129495, -2, 0, 1.5, 0.5, 0.5,
-3.746132, -5.129495, 0, 0, -0.5, 0.5, 0.5,
-3.746132, -5.129495, 0, 1, -0.5, 0.5, 0.5,
-3.746132, -5.129495, 0, 1, 1.5, 0.5, 0.5,
-3.746132, -5.129495, 0, 0, 1.5, 0.5, 0.5,
-3.746132, -5.129495, 2, 0, -0.5, 0.5, 0.5,
-3.746132, -5.129495, 2, 1, -0.5, 0.5, 0.5,
-3.746132, -5.129495, 2, 1, 1.5, 0.5, 0.5,
-3.746132, -5.129495, 2, 0, 1.5, 0.5, 0.5,
-3.746132, -5.129495, 4, 0, -0.5, 0.5, 0.5,
-3.746132, -5.129495, 4, 1, -0.5, 0.5, 0.5,
-3.746132, -5.129495, 4, 1, 1.5, 0.5, 0.5,
-3.746132, -5.129495, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.24894, -4.545989, -5.906868,
-3.24894, 3.234093, -5.906868,
-3.24894, -4.545989, 5.502483,
-3.24894, 3.234093, 5.502483,
-3.24894, -4.545989, -5.906868,
-3.24894, -4.545989, 5.502483,
-3.24894, 3.234093, -5.906868,
-3.24894, 3.234093, 5.502483,
-3.24894, -4.545989, -5.906868,
3.380286, -4.545989, -5.906868,
-3.24894, -4.545989, 5.502483,
3.380286, -4.545989, 5.502483,
-3.24894, 3.234093, -5.906868,
3.380286, 3.234093, -5.906868,
-3.24894, 3.234093, 5.502483,
3.380286, 3.234093, 5.502483,
3.380286, -4.545989, -5.906868,
3.380286, 3.234093, -5.906868,
3.380286, -4.545989, 5.502483,
3.380286, 3.234093, 5.502483,
3.380286, -4.545989, -5.906868,
3.380286, -4.545989, 5.502483,
3.380286, 3.234093, -5.906868,
3.380286, 3.234093, 5.502483
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 8.179662;
var distance = 36.39224;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.06567311, 0.6559476, 0.2021925 );
mvMatrix.scale( 1.334094, 1.13675, 0.7751546 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.39224);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 10);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
InChI_1S_C5H12NO3PS2<-read.table("InChI_1S_C5H12NO3PS2.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1S_C5H12NO3PS2$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C5H12NO3PS2' not found
```

```r
y<-InChI_1S_C5H12NO3PS2$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C5H12NO3PS2' not found
```

```r
z<-InChI_1S_C5H12NO3PS2$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1S_C5H12NO3PS2' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.152398, -0.2081972, -3.3689, 0, 0, 1, 1, 1,
-3.113309, 1.392238, -1.95674, 1, 0, 0, 1, 1,
-2.84662, 1.545834, -2.482654, 1, 0, 0, 1, 1,
-2.774196, 0.8955674, -1.72638, 1, 0, 0, 1, 1,
-2.690824, -1.527462, -1.676648, 1, 0, 0, 1, 1,
-2.463382, -1.020391, -1.810989, 1, 0, 0, 1, 1,
-2.45412, -0.5364975, 0.06631793, 0, 0, 0, 1, 1,
-2.453736, 0.9433439, -1.495661, 0, 0, 0, 1, 1,
-2.362602, 2.087609, -1.363512, 0, 0, 0, 1, 1,
-2.280584, -1.886469, -2.778539, 0, 0, 0, 1, 1,
-2.27108, 0.6393567, -0.4692398, 0, 0, 0, 1, 1,
-2.245542, 0.5656588, -1.433867, 0, 0, 0, 1, 1,
-2.2371, -0.7669129, -2.222735, 0, 0, 0, 1, 1,
-2.152315, 0.1524755, -1.98851, 1, 1, 1, 1, 1,
-2.13465, -0.3346525, -3.379104, 1, 1, 1, 1, 1,
-2.131073, 0.150164, -2.06039, 1, 1, 1, 1, 1,
-2.092839, -0.564317, -2.131216, 1, 1, 1, 1, 1,
-1.989808, 0.892558, 0.7465965, 1, 1, 1, 1, 1,
-1.986396, -0.03906538, -1.889317, 1, 1, 1, 1, 1,
-1.943812, -1.137041, -3.332068, 1, 1, 1, 1, 1,
-1.940335, -1.688499, -3.610135, 1, 1, 1, 1, 1,
-1.939879, 1.30895, 0.0437912, 1, 1, 1, 1, 1,
-1.910026, 0.3910316, -1.8859, 1, 1, 1, 1, 1,
-1.884242, 0.5712205, -2.813036, 1, 1, 1, 1, 1,
-1.880571, -0.2091876, -1.233127, 1, 1, 1, 1, 1,
-1.874082, -0.8400855, -2.042431, 1, 1, 1, 1, 1,
-1.873361, 0.7105699, -1.609097, 1, 1, 1, 1, 1,
-1.847091, -1.095679, -1.832463, 1, 1, 1, 1, 1,
-1.821739, -1.488737, -0.2370389, 0, 0, 1, 1, 1,
-1.816828, -0.5155443, -2.495695, 1, 0, 0, 1, 1,
-1.769629, -0.7647802, -1.674503, 1, 0, 0, 1, 1,
-1.754409, -0.2553415, -3.330041, 1, 0, 0, 1, 1,
-1.753936, -0.5934283, -1.440371, 1, 0, 0, 1, 1,
-1.739546, 1.205258, -0.04330586, 1, 0, 0, 1, 1,
-1.739409, -0.1579077, -2.467359, 0, 0, 0, 1, 1,
-1.711681, 2.319745, 0.3299432, 0, 0, 0, 1, 1,
-1.698388, 0.1048712, -1.25078, 0, 0, 0, 1, 1,
-1.672937, -1.403337, -3.020042, 0, 0, 0, 1, 1,
-1.65815, -1.270329, -2.210995, 0, 0, 0, 1, 1,
-1.653163, -1.105595, -1.49158, 0, 0, 0, 1, 1,
-1.651049, 0.5800796, -1.744468, 0, 0, 0, 1, 1,
-1.637221, 0.1217409, -0.3770086, 1, 1, 1, 1, 1,
-1.636673, 1.002743, 0.2054899, 1, 1, 1, 1, 1,
-1.633318, -0.3357001, -2.30659, 1, 1, 1, 1, 1,
-1.63041, 1.377159, -0.06981368, 1, 1, 1, 1, 1,
-1.628685, -0.4908903, -3.030947, 1, 1, 1, 1, 1,
-1.627578, 2.350155, 0.2540506, 1, 1, 1, 1, 1,
-1.622375, -0.9463772, -2.640749, 1, 1, 1, 1, 1,
-1.618725, 0.3204291, -2.552169, 1, 1, 1, 1, 1,
-1.605745, -1.342067, -2.488132, 1, 1, 1, 1, 1,
-1.601972, -0.2409811, -3.126366, 1, 1, 1, 1, 1,
-1.586127, 0.4592988, -1.881122, 1, 1, 1, 1, 1,
-1.571106, 0.1679256, -2.719715, 1, 1, 1, 1, 1,
-1.553239, -0.1151051, -1.416146, 1, 1, 1, 1, 1,
-1.543612, -0.1895082, -1.013099, 1, 1, 1, 1, 1,
-1.538007, -1.051184, -1.596268, 1, 1, 1, 1, 1,
-1.53347, -0.07853329, -1.66441, 0, 0, 1, 1, 1,
-1.514134, 0.255408, -2.411157, 1, 0, 0, 1, 1,
-1.500118, -0.7505332, -2.65855, 1, 0, 0, 1, 1,
-1.499472, 2.439103, -1.367969, 1, 0, 0, 1, 1,
-1.482596, -2.305069, -2.833873, 1, 0, 0, 1, 1,
-1.482249, -1.285008, -2.909298, 1, 0, 0, 1, 1,
-1.479467, 0.1190716, -0.003116047, 0, 0, 0, 1, 1,
-1.479058, 0.810311, -1.611528, 0, 0, 0, 1, 1,
-1.478425, -1.443326, -2.469907, 0, 0, 0, 1, 1,
-1.477594, 1.836585, 1.196137, 0, 0, 0, 1, 1,
-1.473523, 1.688933, -1.309443, 0, 0, 0, 1, 1,
-1.470781, 0.3616351, -0.6739272, 0, 0, 0, 1, 1,
-1.462264, 1.18676, -0.1092699, 0, 0, 0, 1, 1,
-1.457881, -0.8602536, -1.551363, 1, 1, 1, 1, 1,
-1.456411, -1.449138, -3.617722, 1, 1, 1, 1, 1,
-1.447088, -1.096394, -2.239061, 1, 1, 1, 1, 1,
-1.445512, 1.232981, -0.9191182, 1, 1, 1, 1, 1,
-1.410556, -0.5929434, -3.097298, 1, 1, 1, 1, 1,
-1.405031, -0.919547, 0.07470006, 1, 1, 1, 1, 1,
-1.403429, 0.1148287, -1.358084, 1, 1, 1, 1, 1,
-1.403242, 1.091602, 0.9050894, 1, 1, 1, 1, 1,
-1.40157, 0.0418118, -0.8187635, 1, 1, 1, 1, 1,
-1.394815, 1.107915, -2.458105, 1, 1, 1, 1, 1,
-1.390891, -1.319457, -2.654549, 1, 1, 1, 1, 1,
-1.387714, 1.136404, -2.280825, 1, 1, 1, 1, 1,
-1.361822, -0.6424636, -2.42691, 1, 1, 1, 1, 1,
-1.357191, 0.3473111, -0.9388433, 1, 1, 1, 1, 1,
-1.352921, 1.293228, -2.297893, 1, 1, 1, 1, 1,
-1.352742, -0.8113419, -0.5172119, 0, 0, 1, 1, 1,
-1.345049, 0.7149352, -2.895416, 1, 0, 0, 1, 1,
-1.337702, 0.3096883, -1.215594, 1, 0, 0, 1, 1,
-1.328676, -0.1383057, -1.060041, 1, 0, 0, 1, 1,
-1.317034, -0.3400768, -2.540825, 1, 0, 0, 1, 1,
-1.316308, -0.01028626, -0.8651326, 1, 0, 0, 1, 1,
-1.315955, -0.2424397, -2.249009, 0, 0, 0, 1, 1,
-1.310065, 0.2722275, -1.805413, 0, 0, 0, 1, 1,
-1.302122, -1.036909, -1.69086, 0, 0, 0, 1, 1,
-1.286347, -0.4407614, -2.41021, 0, 0, 0, 1, 1,
-1.285733, 0.649642, -0.3545914, 0, 0, 0, 1, 1,
-1.28529, -0.5274054, -0.9031148, 0, 0, 0, 1, 1,
-1.275481, 0.1698765, -1.527066, 0, 0, 0, 1, 1,
-1.273109, -0.3163251, -1.378832, 1, 1, 1, 1, 1,
-1.267283, -0.5611522, -2.39291, 1, 1, 1, 1, 1,
-1.264833, 0.2788362, -0.3637937, 1, 1, 1, 1, 1,
-1.260634, 0.5915359, -0.9100452, 1, 1, 1, 1, 1,
-1.255885, 1.239138, -2.404451, 1, 1, 1, 1, 1,
-1.248804, 0.09103512, -1.072187, 1, 1, 1, 1, 1,
-1.245701, -0.0915181, -1.644052, 1, 1, 1, 1, 1,
-1.245239, 0.1362321, -2.342785, 1, 1, 1, 1, 1,
-1.24395, 0.5490151, -0.3847066, 1, 1, 1, 1, 1,
-1.234633, -0.4703611, -2.479964, 1, 1, 1, 1, 1,
-1.233643, 0.2572218, -1.086958, 1, 1, 1, 1, 1,
-1.233288, -1.216347, -2.444493, 1, 1, 1, 1, 1,
-1.227134, -0.194823, -3.162969, 1, 1, 1, 1, 1,
-1.226423, 1.361374, -0.31878, 1, 1, 1, 1, 1,
-1.225529, -2.341612, -1.580007, 1, 1, 1, 1, 1,
-1.215737, -0.8150683, -2.14251, 0, 0, 1, 1, 1,
-1.215636, 0.8220046, -0.9742841, 1, 0, 0, 1, 1,
-1.205013, -1.668435, -1.892126, 1, 0, 0, 1, 1,
-1.19912, -1.016231, -3.471521, 1, 0, 0, 1, 1,
-1.197234, 0.9379388, 0.4268587, 1, 0, 0, 1, 1,
-1.188622, 1.683171, 1.500688, 1, 0, 0, 1, 1,
-1.184014, -2.059284, -4.378832, 0, 0, 0, 1, 1,
-1.173137, 1.88481, 0.05528952, 0, 0, 0, 1, 1,
-1.169971, -1.619643, -3.448628, 0, 0, 0, 1, 1,
-1.163844, -0.3994586, -1.096493, 0, 0, 0, 1, 1,
-1.157142, 0.06936484, -2.259447, 0, 0, 0, 1, 1,
-1.156411, 0.8166111, -1.744478, 0, 0, 0, 1, 1,
-1.150095, -0.687683, -0.4264382, 0, 0, 0, 1, 1,
-1.14612, -0.6754227, -1.671866, 1, 1, 1, 1, 1,
-1.142545, -0.6032788, -1.290945, 1, 1, 1, 1, 1,
-1.136541, -0.7468998, -3.241249, 1, 1, 1, 1, 1,
-1.136026, 0.7891336, -0.7234907, 1, 1, 1, 1, 1,
-1.133707, 0.9480193, -0.07596427, 1, 1, 1, 1, 1,
-1.12572, 0.6177179, -1.360764, 1, 1, 1, 1, 1,
-1.110297, -0.8306884, -1.166108, 1, 1, 1, 1, 1,
-1.108839, -0.1002265, -1.518716, 1, 1, 1, 1, 1,
-1.105957, 0.9830018, -1.601742, 1, 1, 1, 1, 1,
-1.088772, -0.2865443, -3.499349, 1, 1, 1, 1, 1,
-1.086169, 0.130931, -2.717245, 1, 1, 1, 1, 1,
-1.084764, -2.381747, -0.8430366, 1, 1, 1, 1, 1,
-1.081003, -4.432686, -3.798225, 1, 1, 1, 1, 1,
-1.077332, -0.3451943, -3.133012, 1, 1, 1, 1, 1,
-1.070044, 1.225073, 1.16573, 1, 1, 1, 1, 1,
-1.060393, -0.00585773, -2.644682, 0, 0, 1, 1, 1,
-1.057945, 0.257936, -2.185748, 1, 0, 0, 1, 1,
-1.039893, 1.244896, -0.2928233, 1, 0, 0, 1, 1,
-1.034579, 0.3309082, -1.101932, 1, 0, 0, 1, 1,
-1.030565, 0.8368872, -0.2037907, 1, 0, 0, 1, 1,
-1.024343, 0.9332569, -1.601963, 1, 0, 0, 1, 1,
-1.0204, 0.258737, -0.5282762, 0, 0, 0, 1, 1,
-1.012113, 0.5761197, 0.5239895, 0, 0, 0, 1, 1,
-1.007672, 1.220747, -1.555211, 0, 0, 0, 1, 1,
-1.006417, -0.9571237, -0.7867807, 0, 0, 0, 1, 1,
-1.002113, -2.762087, -1.829935, 0, 0, 0, 1, 1,
-0.9928423, -0.4951481, -1.817658, 0, 0, 0, 1, 1,
-0.9756986, 0.3165142, -2.166481, 0, 0, 0, 1, 1,
-0.9754228, -0.47922, -2.308988, 1, 1, 1, 1, 1,
-0.9750192, 0.3989347, -0.8776164, 1, 1, 1, 1, 1,
-0.9745987, 0.4626764, 1.464098, 1, 1, 1, 1, 1,
-0.9711176, -0.2829524, -2.695363, 1, 1, 1, 1, 1,
-0.9682194, -0.8192967, -2.601164, 1, 1, 1, 1, 1,
-0.9520638, -1.102134, -1.008394, 1, 1, 1, 1, 1,
-0.9514549, 0.04349571, -0.1780132, 1, 1, 1, 1, 1,
-0.9468044, -0.7148222, -2.839664, 1, 1, 1, 1, 1,
-0.940129, 1.204139, -1.135927, 1, 1, 1, 1, 1,
-0.935305, -1.01291, -3.275962, 1, 1, 1, 1, 1,
-0.9334543, -0.8818227, -3.240424, 1, 1, 1, 1, 1,
-0.9313898, 0.2065028, 0.009949696, 1, 1, 1, 1, 1,
-0.9285617, -1.328061, -4.013572, 1, 1, 1, 1, 1,
-0.9284327, 1.011378, -0.3605213, 1, 1, 1, 1, 1,
-0.9264051, -0.9611236, -2.333996, 1, 1, 1, 1, 1,
-0.9255634, -0.3853312, -0.127246, 0, 0, 1, 1, 1,
-0.9248804, 1.496199, 1.497915, 1, 0, 0, 1, 1,
-0.9234939, -1.563582, -2.696726, 1, 0, 0, 1, 1,
-0.9213238, -1.260498, -1.385338, 1, 0, 0, 1, 1,
-0.9190673, 1.484039, -2.540895, 1, 0, 0, 1, 1,
-0.9181489, 0.7655746, -2.127746, 1, 0, 0, 1, 1,
-0.9112506, -1.34617, -3.824577, 0, 0, 0, 1, 1,
-0.9089667, -0.9080796, -0.6979317, 0, 0, 0, 1, 1,
-0.90398, 0.6734644, -1.676224, 0, 0, 0, 1, 1,
-0.901867, 0.1092186, -1.552247, 0, 0, 0, 1, 1,
-0.9011943, 0.01759626, 0.4247313, 0, 0, 0, 1, 1,
-0.8954177, 1.232361, 0.5108959, 0, 0, 0, 1, 1,
-0.8922216, 0.6623971, -1.202202, 0, 0, 0, 1, 1,
-0.8895071, 1.758785, -1.573476, 1, 1, 1, 1, 1,
-0.8885763, -0.6323672, -2.150046, 1, 1, 1, 1, 1,
-0.8873586, 0.1183746, -2.712428, 1, 1, 1, 1, 1,
-0.8772286, 1.170036, -0.1758415, 1, 1, 1, 1, 1,
-0.8692828, 0.6727157, 0.03286282, 1, 1, 1, 1, 1,
-0.861134, -0.9569231, -2.794948, 1, 1, 1, 1, 1,
-0.852354, -0.8546844, -3.338335, 1, 1, 1, 1, 1,
-0.8522769, -0.1433769, -2.153143, 1, 1, 1, 1, 1,
-0.851548, 0.4598033, -0.2195806, 1, 1, 1, 1, 1,
-0.8441424, 1.93881, -0.9719916, 1, 1, 1, 1, 1,
-0.8368804, -0.001357983, -1.627795, 1, 1, 1, 1, 1,
-0.8362165, -0.2241451, -2.638052, 1, 1, 1, 1, 1,
-0.8301646, 0.4026013, -1.8627, 1, 1, 1, 1, 1,
-0.8213079, -1.785169, -2.712634, 1, 1, 1, 1, 1,
-0.8207065, -1.418797, -3.694915, 1, 1, 1, 1, 1,
-0.8168939, -1.261892, -2.495236, 0, 0, 1, 1, 1,
-0.8052143, -0.3520824, -2.187965, 1, 0, 0, 1, 1,
-0.8046807, 1.770261, -0.853983, 1, 0, 0, 1, 1,
-0.8006107, 0.995628, 0.5349934, 1, 0, 0, 1, 1,
-0.7967128, 0.5695198, -0.631895, 1, 0, 0, 1, 1,
-0.7924305, 0.5750204, 0.850722, 1, 0, 0, 1, 1,
-0.7897424, 0.5309346, -0.9436249, 0, 0, 0, 1, 1,
-0.7837744, 0.3007498, -1.687577, 0, 0, 0, 1, 1,
-0.7775596, -0.5051062, -2.308116, 0, 0, 0, 1, 1,
-0.7756541, 0.2026023, -0.08206011, 0, 0, 0, 1, 1,
-0.7753962, 0.1283914, -0.4177286, 0, 0, 0, 1, 1,
-0.7727888, 0.1367527, -1.81256, 0, 0, 0, 1, 1,
-0.7726749, 1.545744, 0.421833, 0, 0, 0, 1, 1,
-0.7701077, -0.2013502, -2.332354, 1, 1, 1, 1, 1,
-0.7660192, -1.584797, -3.112858, 1, 1, 1, 1, 1,
-0.7649822, 0.6481812, 0.1040513, 1, 1, 1, 1, 1,
-0.7624404, 0.5198783, -0.7914094, 1, 1, 1, 1, 1,
-0.7567606, -0.1763473, -2.44135, 1, 1, 1, 1, 1,
-0.7554942, -0.5240662, -2.084723, 1, 1, 1, 1, 1,
-0.755235, 0.1298682, -2.364812, 1, 1, 1, 1, 1,
-0.7551628, -1.31874, -2.836517, 1, 1, 1, 1, 1,
-0.7528489, -0.8507369, 0.05486211, 1, 1, 1, 1, 1,
-0.7490383, 1.052467, -0.8738227, 1, 1, 1, 1, 1,
-0.7490374, 0.7152987, -0.1697627, 1, 1, 1, 1, 1,
-0.7487893, 1.66095, -2.398702, 1, 1, 1, 1, 1,
-0.7476197, -0.1814379, -1.705868, 1, 1, 1, 1, 1,
-0.7471442, -1.629938, -2.995905, 1, 1, 1, 1, 1,
-0.7448435, -0.6519307, -1.427208, 1, 1, 1, 1, 1,
-0.7436935, -0.1925801, -1.377935, 0, 0, 1, 1, 1,
-0.7402233, -0.3851625, -2.160788, 1, 0, 0, 1, 1,
-0.733036, 1.91415, -1.475073, 1, 0, 0, 1, 1,
-0.7302726, -1.120585, -3.794757, 1, 0, 0, 1, 1,
-0.7259747, -0.3073789, -0.1898359, 1, 0, 0, 1, 1,
-0.7192559, -0.4972347, -2.991608, 1, 0, 0, 1, 1,
-0.7158774, -2.195514, -2.749067, 0, 0, 0, 1, 1,
-0.7132782, -0.8161698, -0.6477386, 0, 0, 0, 1, 1,
-0.7127786, -0.7889421, 0.03753991, 0, 0, 0, 1, 1,
-0.7114754, -0.3021453, -1.607588, 0, 0, 0, 1, 1,
-0.7095549, -1.202251, -4.646089, 0, 0, 0, 1, 1,
-0.7067294, 1.028716, -1.398215, 0, 0, 0, 1, 1,
-0.7002443, -1.405601, -2.526028, 0, 0, 0, 1, 1,
-0.6955855, -1.988807, -3.136265, 1, 1, 1, 1, 1,
-0.6935026, 0.1784665, -1.708965, 1, 1, 1, 1, 1,
-0.6930392, -0.1862324, -1.329276, 1, 1, 1, 1, 1,
-0.68716, -0.4065007, -2.831268, 1, 1, 1, 1, 1,
-0.6852407, 0.7172559, -1.276714, 1, 1, 1, 1, 1,
-0.6826827, -0.7118407, -3.47947, 1, 1, 1, 1, 1,
-0.6765863, -1.420182, -1.932236, 1, 1, 1, 1, 1,
-0.674257, -1.344803, -3.135052, 1, 1, 1, 1, 1,
-0.6718357, -0.008165847, -1.223911, 1, 1, 1, 1, 1,
-0.6698089, 0.0381653, -1.392914, 1, 1, 1, 1, 1,
-0.6669706, 1.44833, -1.488211, 1, 1, 1, 1, 1,
-0.6635389, -0.6579817, -4.297273, 1, 1, 1, 1, 1,
-0.6581581, -0.4732977, -3.638145, 1, 1, 1, 1, 1,
-0.6568652, 0.6172502, -0.1068098, 1, 1, 1, 1, 1,
-0.6503488, -0.7210079, -1.704881, 1, 1, 1, 1, 1,
-0.6458502, -1.438264, -2.379215, 0, 0, 1, 1, 1,
-0.643546, -1.276841, -3.410816, 1, 0, 0, 1, 1,
-0.6427358, 0.9436852, -0.4118057, 1, 0, 0, 1, 1,
-0.6409995, 1.436315, 0.01549295, 1, 0, 0, 1, 1,
-0.6309372, 0.7957774, -0.5082198, 1, 0, 0, 1, 1,
-0.6286656, -0.9732618, -3.989075, 1, 0, 0, 1, 1,
-0.618547, 0.4365415, -0.8154612, 0, 0, 0, 1, 1,
-0.6134435, 0.5990725, -2.484063, 0, 0, 0, 1, 1,
-0.6037772, -0.3234919, -2.348098, 0, 0, 0, 1, 1,
-0.6014832, -0.4993598, -3.479568, 0, 0, 0, 1, 1,
-0.6002073, -1.631741, -2.377698, 0, 0, 0, 1, 1,
-0.5984553, -0.9263149, -2.97122, 0, 0, 0, 1, 1,
-0.5914381, 1.221641, -0.6429323, 0, 0, 0, 1, 1,
-0.5872403, -0.822696, -1.664018, 1, 1, 1, 1, 1,
-0.5792354, -0.1928321, -0.5239534, 1, 1, 1, 1, 1,
-0.5744211, 1.384832, 0.6501682, 1, 1, 1, 1, 1,
-0.5739048, 0.3312152, 0.910701, 1, 1, 1, 1, 1,
-0.5713825, 1.934296, 0.4862482, 1, 1, 1, 1, 1,
-0.5687664, -1.145582, -2.374134, 1, 1, 1, 1, 1,
-0.5667544, -1.307286, -4.683803, 1, 1, 1, 1, 1,
-0.5644733, -0.3118833, -1.015184, 1, 1, 1, 1, 1,
-0.556805, 0.2349581, 0.02478218, 1, 1, 1, 1, 1,
-0.5562862, -0.6503609, -2.374021, 1, 1, 1, 1, 1,
-0.5561613, -0.3776631, -1.013901, 1, 1, 1, 1, 1,
-0.5558372, -0.1404973, -2.27562, 1, 1, 1, 1, 1,
-0.5522904, -1.400527, -1.974077, 1, 1, 1, 1, 1,
-0.5505003, 0.1826654, -0.004310133, 1, 1, 1, 1, 1,
-0.5500694, 0.2499829, -1.15014, 1, 1, 1, 1, 1,
-0.548312, -0.4383399, -1.018228, 0, 0, 1, 1, 1,
-0.5394709, 1.244879, -0.6351004, 1, 0, 0, 1, 1,
-0.5375757, 0.6625488, 2.207061, 1, 0, 0, 1, 1,
-0.53694, 0.5310013, -1.744206, 1, 0, 0, 1, 1,
-0.5308841, 1.259586, 1.315495, 1, 0, 0, 1, 1,
-0.5263216, -1.322236, -2.050654, 1, 0, 0, 1, 1,
-0.5254979, 0.2200714, -3.371766, 0, 0, 0, 1, 1,
-0.5227845, 0.1641009, 0.2746806, 0, 0, 0, 1, 1,
-0.5216509, 0.8554902, -1.521045, 0, 0, 0, 1, 1,
-0.5202261, -1.310403, -1.931929, 0, 0, 0, 1, 1,
-0.5189018, -1.254886, -1.653019, 0, 0, 0, 1, 1,
-0.5156463, 0.2130994, -1.361117, 0, 0, 0, 1, 1,
-0.5138789, -0.734742, -2.914729, 0, 0, 0, 1, 1,
-0.5122329, 0.2623836, -0.7826229, 1, 1, 1, 1, 1,
-0.5096865, -1.497293, -0.1614152, 1, 1, 1, 1, 1,
-0.5081095, -0.4424401, -2.031332, 1, 1, 1, 1, 1,
-0.5080007, -0.7346954, -2.299999, 1, 1, 1, 1, 1,
-0.502596, 2.354947, 0.1303105, 1, 1, 1, 1, 1,
-0.5022552, -0.1750623, -3.415057, 1, 1, 1, 1, 1,
-0.4876781, -0.846896, -2.787989, 1, 1, 1, 1, 1,
-0.4854235, 0.334762, -0.7297823, 1, 1, 1, 1, 1,
-0.4838957, -1.580811, -1.871693, 1, 1, 1, 1, 1,
-0.4774387, 1.019125, 0.5990718, 1, 1, 1, 1, 1,
-0.4772041, -1.57387, -1.936558, 1, 1, 1, 1, 1,
-0.4768404, -0.5735254, -3.339254, 1, 1, 1, 1, 1,
-0.4750252, 0.6849973, -0.9036908, 1, 1, 1, 1, 1,
-0.4744965, 1.432415, -0.6373639, 1, 1, 1, 1, 1,
-0.4729546, 1.074377, 1.4635, 1, 1, 1, 1, 1,
-0.4728, -1.019923, -3.812141, 0, 0, 1, 1, 1,
-0.4700851, 1.259682, -0.1675925, 1, 0, 0, 1, 1,
-0.4693174, 0.6776418, -0.3058041, 1, 0, 0, 1, 1,
-0.4679836, -0.6214668, -1.188199, 1, 0, 0, 1, 1,
-0.4639819, 0.4505075, 0.1916277, 1, 0, 0, 1, 1,
-0.4605388, -0.04455727, -3.318174, 1, 0, 0, 1, 1,
-0.4602066, 0.6433215, -1.016742, 0, 0, 0, 1, 1,
-0.4591714, 1.739728, -0.6173749, 0, 0, 0, 1, 1,
-0.4431737, 1.904877, -0.6803502, 0, 0, 0, 1, 1,
-0.4371092, -1.621005, -3.082908, 0, 0, 0, 1, 1,
-0.4355631, -0.1123326, -4.323036, 0, 0, 0, 1, 1,
-0.4338573, -1.03311, -0.8899267, 0, 0, 0, 1, 1,
-0.4335809, 0.03112053, -1.776174, 0, 0, 0, 1, 1,
-0.432839, -0.9907287, -3.592202, 1, 1, 1, 1, 1,
-0.4328051, -0.2542847, -3.45389, 1, 1, 1, 1, 1,
-0.4270445, -0.4698152, -2.437859, 1, 1, 1, 1, 1,
-0.4228369, -1.697686, -3.084694, 1, 1, 1, 1, 1,
-0.4143719, -0.2419167, -1.683424, 1, 1, 1, 1, 1,
-0.4112246, 1.275169, 0.7498862, 1, 1, 1, 1, 1,
-0.4051538, 0.984513, 0.1765569, 1, 1, 1, 1, 1,
-0.4030527, 2.5457, -0.680189, 1, 1, 1, 1, 1,
-0.4021429, 0.2024911, -0.6359583, 1, 1, 1, 1, 1,
-0.3959852, -3.110361, -2.377062, 1, 1, 1, 1, 1,
-0.3859392, 0.911155, 1.287205, 1, 1, 1, 1, 1,
-0.3788293, -0.2218905, -0.6158469, 1, 1, 1, 1, 1,
-0.3783089, 0.08618665, -2.234468, 1, 1, 1, 1, 1,
-0.3723707, -0.2075654, -2.77004, 1, 1, 1, 1, 1,
-0.3667504, 0.6255242, -0.142958, 1, 1, 1, 1, 1,
-0.3660269, 1.036578, 1.762631, 0, 0, 1, 1, 1,
-0.3628287, -0.1682175, -3.601997, 1, 0, 0, 1, 1,
-0.3563851, 0.223216, -2.622553, 1, 0, 0, 1, 1,
-0.3488816, -1.527245, -3.218633, 1, 0, 0, 1, 1,
-0.3485344, 0.09012291, -0.9093729, 1, 0, 0, 1, 1,
-0.3470717, 0.464248, -1.750319, 1, 0, 0, 1, 1,
-0.3448117, 0.3350056, -0.8873188, 0, 0, 0, 1, 1,
-0.3425524, 1.433658, 0.2794195, 0, 0, 0, 1, 1,
-0.3409686, 0.4626949, -1.188051, 0, 0, 0, 1, 1,
-0.3338667, -0.1171824, -0.7624773, 0, 0, 0, 1, 1,
-0.3338446, 0.4158393, -1.502782, 0, 0, 0, 1, 1,
-0.3314679, -1.070978, -4.311127, 0, 0, 0, 1, 1,
-0.3281351, 0.4006544, -1.722857, 0, 0, 0, 1, 1,
-0.3209708, 0.8336125, 0.6443141, 1, 1, 1, 1, 1,
-0.3200365, 1.028362, -0.7247564, 1, 1, 1, 1, 1,
-0.3190872, -1.262302, -2.519794, 1, 1, 1, 1, 1,
-0.3190739, 1.521041, 0.8839459, 1, 1, 1, 1, 1,
-0.3168206, 0.917954, -0.1032863, 1, 1, 1, 1, 1,
-0.3155693, 2.608316, -1.812465, 1, 1, 1, 1, 1,
-0.3148924, -1.261765, -1.928367, 1, 1, 1, 1, 1,
-0.3140062, 0.02308043, -0.6201752, 1, 1, 1, 1, 1,
-0.3094805, 0.08431869, -1.537613, 1, 1, 1, 1, 1,
-0.3079566, 1.508622, -1.812153, 1, 1, 1, 1, 1,
-0.3067619, -0.9730203, -1.506297, 1, 1, 1, 1, 1,
-0.3023145, -0.9709916, -3.588483, 1, 1, 1, 1, 1,
-0.2980554, -0.469496, -2.775755, 1, 1, 1, 1, 1,
-0.2980553, -0.6348046, -2.943885, 1, 1, 1, 1, 1,
-0.2958417, 0.02399076, -1.914356, 1, 1, 1, 1, 1,
-0.2929355, 0.6344237, 1.447281, 0, 0, 1, 1, 1,
-0.2885911, 1.217124, -0.9621209, 1, 0, 0, 1, 1,
-0.2879357, -0.5046163, -2.053316, 1, 0, 0, 1, 1,
-0.2863618, -0.2274109, -2.120734, 1, 0, 0, 1, 1,
-0.2859792, 0.508678, -2.300493, 1, 0, 0, 1, 1,
-0.2829779, 0.4776568, -0.7249793, 1, 0, 0, 1, 1,
-0.2763762, -2.952238, -0.8422008, 0, 0, 0, 1, 1,
-0.2761503, -0.6615771, -2.476963, 0, 0, 0, 1, 1,
-0.2752784, 0.3112475, -0.3326184, 0, 0, 0, 1, 1,
-0.2750966, 1.230714, -1.210425, 0, 0, 0, 1, 1,
-0.2746508, -0.9267471, -1.870522, 0, 0, 0, 1, 1,
-0.2739868, -2.245361, -2.797444, 0, 0, 0, 1, 1,
-0.2712042, -0.1826966, -0.7983102, 0, 0, 0, 1, 1,
-0.2676499, -0.2100526, -1.240544, 1, 1, 1, 1, 1,
-0.266895, -1.035296, -2.621912, 1, 1, 1, 1, 1,
-0.2594894, 2.025048, 0.316582, 1, 1, 1, 1, 1,
-0.2558304, 0.1918149, -0.9141817, 1, 1, 1, 1, 1,
-0.2549429, -1.055814, -1.079313, 1, 1, 1, 1, 1,
-0.2512044, -0.8631949, -2.156156, 1, 1, 1, 1, 1,
-0.2501417, 2.208854, -1.174468, 1, 1, 1, 1, 1,
-0.2487618, -0.0794116, -3.79091, 1, 1, 1, 1, 1,
-0.2463751, 0.2197822, -0.1503537, 1, 1, 1, 1, 1,
-0.2420445, -0.3208933, -1.913481, 1, 1, 1, 1, 1,
-0.2388885, -0.4448515, -3.109185, 1, 1, 1, 1, 1,
-0.2334023, -0.02986077, -0.9867468, 1, 1, 1, 1, 1,
-0.233367, -2.022723, -2.145508, 1, 1, 1, 1, 1,
-0.2295195, -1.163297, -4.341795, 1, 1, 1, 1, 1,
-0.2262395, 0.7227603, -2.13901, 1, 1, 1, 1, 1,
-0.2216222, 0.5720692, 0.7308651, 0, 0, 1, 1, 1,
-0.221315, 1.200124, 1.330919, 1, 0, 0, 1, 1,
-0.2204107, -0.2327809, -4.050595, 1, 0, 0, 1, 1,
-0.2171568, -1.631256, -5.740713, 1, 0, 0, 1, 1,
-0.2155785, -1.866891, -3.430187, 1, 0, 0, 1, 1,
-0.2145192, 0.4854162, -0.1168755, 1, 0, 0, 1, 1,
-0.2135341, 1.139626, -0.8236455, 0, 0, 0, 1, 1,
-0.2104827, -0.6587957, -3.027409, 0, 0, 0, 1, 1,
-0.2078736, 0.9370338, -0.7184975, 0, 0, 0, 1, 1,
-0.2052319, -0.7304158, -2.712214, 0, 0, 0, 1, 1,
-0.2047027, 0.566135, 0.05858097, 0, 0, 0, 1, 1,
-0.1990935, -2.729982, -2.041412, 0, 0, 0, 1, 1,
-0.1942634, -0.3710141, -3.199446, 0, 0, 0, 1, 1,
-0.1938558, 0.5142372, -2.101985, 1, 1, 1, 1, 1,
-0.1909179, 0.7199742, -0.9953665, 1, 1, 1, 1, 1,
-0.1907562, -0.732975, -5.666717, 1, 1, 1, 1, 1,
-0.1891068, 0.05648139, -1.850091, 1, 1, 1, 1, 1,
-0.1879288, -0.3396028, -3.360096, 1, 1, 1, 1, 1,
-0.1852056, 0.1140951, -1.211649, 1, 1, 1, 1, 1,
-0.1823522, 0.3822948, -0.6670417, 1, 1, 1, 1, 1,
-0.1769591, -0.04702564, -2.199599, 1, 1, 1, 1, 1,
-0.1754107, 0.8041555, -2.071909, 1, 1, 1, 1, 1,
-0.1747831, -0.7044331, -4.792602, 1, 1, 1, 1, 1,
-0.1720622, 0.2568291, -0.4396262, 1, 1, 1, 1, 1,
-0.1637994, 0.1576572, -0.9573483, 1, 1, 1, 1, 1,
-0.1612826, -1.583025, -1.877767, 1, 1, 1, 1, 1,
-0.1598536, -0.3514315, -4.548599, 1, 1, 1, 1, 1,
-0.1508006, -0.7221725, -3.425168, 1, 1, 1, 1, 1,
-0.1507743, -1.13324, -3.761208, 0, 0, 1, 1, 1,
-0.1260276, 0.05977365, -0.1099215, 1, 0, 0, 1, 1,
-0.1241835, -0.4954401, -1.686939, 1, 0, 0, 1, 1,
-0.1210092, -0.1069478, -2.599466, 1, 0, 0, 1, 1,
-0.1187491, 0.4124514, 0.1994083, 1, 0, 0, 1, 1,
-0.1183777, -0.1248819, -2.881503, 1, 0, 0, 1, 1,
-0.107157, -0.6952611, -2.02422, 0, 0, 0, 1, 1,
-0.1047292, -0.2246138, -3.175556, 0, 0, 0, 1, 1,
-0.1011599, -1.777806, -2.634933, 0, 0, 0, 1, 1,
-0.1004278, 0.0005217192, -1.4626, 0, 0, 0, 1, 1,
-0.1002185, 1.076386, -0.9536685, 0, 0, 0, 1, 1,
-0.09831136, -2.058352, -2.579584, 0, 0, 0, 1, 1,
-0.09723412, -1.95015, -4.018999, 0, 0, 0, 1, 1,
-0.09359669, -0.6022978, -2.666872, 1, 1, 1, 1, 1,
-0.09355082, -0.47435, -2.039332, 1, 1, 1, 1, 1,
-0.09283604, -1.100182, -2.492606, 1, 1, 1, 1, 1,
-0.08706158, -0.9991288, -2.77175, 1, 1, 1, 1, 1,
-0.086895, 2.196723, -0.7979682, 1, 1, 1, 1, 1,
-0.08089527, 0.3528081, 0.7490798, 1, 1, 1, 1, 1,
-0.0783421, 0.8686727, 0.3756126, 1, 1, 1, 1, 1,
-0.07768432, -0.620407, -3.722862, 1, 1, 1, 1, 1,
-0.07675367, -1.244765, -3.78168, 1, 1, 1, 1, 1,
-0.07631807, -0.174876, -3.688792, 1, 1, 1, 1, 1,
-0.0710348, -0.8923799, -3.319195, 1, 1, 1, 1, 1,
-0.06901883, 0.9781367, -0.3829996, 1, 1, 1, 1, 1,
-0.06575389, 0.2198903, -1.202778, 1, 1, 1, 1, 1,
-0.06527387, -0.1267555, -1.361646, 1, 1, 1, 1, 1,
-0.0631009, 0.4536338, 1.21, 1, 1, 1, 1, 1,
-0.06309827, -1.118591, -3.426633, 0, 0, 1, 1, 1,
-0.06291369, -0.7563514, -2.913279, 1, 0, 0, 1, 1,
-0.0619555, -0.7430485, -3.661245, 1, 0, 0, 1, 1,
-0.05906174, -1.581293, -2.761812, 1, 0, 0, 1, 1,
-0.05772198, 0.1799242, -2.085829, 1, 0, 0, 1, 1,
-0.05765354, -0.01752215, -1.913019, 1, 0, 0, 1, 1,
-0.05721265, -0.8077275, -2.793271, 0, 0, 0, 1, 1,
-0.05389525, 0.7013838, -1.855668, 0, 0, 0, 1, 1,
-0.04794843, 0.3783254, -0.9458505, 0, 0, 0, 1, 1,
-0.03899264, -0.2417731, -3.183454, 0, 0, 0, 1, 1,
-0.03659091, 0.2812928, -0.7640858, 0, 0, 0, 1, 1,
-0.03631748, -0.2580461, -1.949549, 0, 0, 0, 1, 1,
-0.031847, 1.795777, 0.7298716, 0, 0, 0, 1, 1,
-0.03051344, 0.1490579, -0.02285504, 1, 1, 1, 1, 1,
-0.02941073, 0.01539754, -0.3100391, 1, 1, 1, 1, 1,
-0.0271231, 1.699666, 0.07129657, 1, 1, 1, 1, 1,
-0.02033216, -1.562043, -1.0911, 1, 1, 1, 1, 1,
-0.01956479, -0.8603966, -1.895334, 1, 1, 1, 1, 1,
-0.01838026, -0.6244697, -4.389616, 1, 1, 1, 1, 1,
-0.01806932, -1.680883, -3.495214, 1, 1, 1, 1, 1,
-0.0162643, -0.7410415, -2.889145, 1, 1, 1, 1, 1,
-0.009082039, 0.1942712, 0.9748697, 1, 1, 1, 1, 1,
-0.008079711, 0.3768737, 0.2215309, 1, 1, 1, 1, 1,
-0.006329556, -0.8132575, -3.679733, 1, 1, 1, 1, 1,
-0.006289955, -1.623807, -3.118647, 1, 1, 1, 1, 1,
-0.005263423, 0.7337981, -0.09865576, 1, 1, 1, 1, 1,
-0.004129094, -1.013049, -2.000157, 1, 1, 1, 1, 1,
-0.003661474, 0.4552811, 0.8672455, 1, 1, 1, 1, 1,
-0.002090004, -1.001637, -2.738644, 0, 0, 1, 1, 1,
-0.001960108, 0.7445925, -1.193242, 1, 0, 0, 1, 1,
-0.0007787007, 1.18899, 1.155156, 1, 0, 0, 1, 1,
0.0006539057, 1.04718, 1.056546, 1, 0, 0, 1, 1,
0.001115247, 1.871375, -0.1143522, 1, 0, 0, 1, 1,
0.006547102, -2.076264, 2.983293, 1, 0, 0, 1, 1,
0.007336331, -1.081082, 2.863056, 0, 0, 0, 1, 1,
0.009548024, -0.4407781, 3.431681, 0, 0, 0, 1, 1,
0.01216506, -0.1409797, 2.815086, 0, 0, 0, 1, 1,
0.01338271, 0.667626, 1.109658, 0, 0, 0, 1, 1,
0.0155593, 1.474177, -1.86763, 0, 0, 0, 1, 1,
0.01788915, -0.5379357, 3.129045, 0, 0, 0, 1, 1,
0.02031974, -1.212973, 3.425696, 0, 0, 0, 1, 1,
0.02060363, -1.20806, 3.869081, 1, 1, 1, 1, 1,
0.0274665, -0.3474917, 4.406677, 1, 1, 1, 1, 1,
0.0322338, -0.8838483, 3.730923, 1, 1, 1, 1, 1,
0.03535219, 1.992218, 0.7075822, 1, 1, 1, 1, 1,
0.03580429, 0.2546904, -0.009738238, 1, 1, 1, 1, 1,
0.03749554, -0.271587, 2.4503, 1, 1, 1, 1, 1,
0.03898441, 2.250526, 2.305104, 1, 1, 1, 1, 1,
0.04032518, 1.194935, -0.30156, 1, 1, 1, 1, 1,
0.04395228, 0.7312869, -0.008675703, 1, 1, 1, 1, 1,
0.05051418, -0.1193891, 1.637533, 1, 1, 1, 1, 1,
0.05101625, -0.1751505, 3.158531, 1, 1, 1, 1, 1,
0.06212868, -0.3322119, 2.699239, 1, 1, 1, 1, 1,
0.06362526, -0.4868416, 2.181232, 1, 1, 1, 1, 1,
0.06377431, -1.018318, 1.80544, 1, 1, 1, 1, 1,
0.06682365, 0.5161304, 0.5901243, 1, 1, 1, 1, 1,
0.06692155, -0.03553972, 2.594919, 0, 0, 1, 1, 1,
0.06948387, -0.112828, 3.050489, 1, 0, 0, 1, 1,
0.07065301, 0.2445236, 1.38566, 1, 0, 0, 1, 1,
0.07217319, -0.04610731, 0.4483329, 1, 0, 0, 1, 1,
0.07522204, 0.6098588, 1.349249, 1, 0, 0, 1, 1,
0.08057647, 0.6900749, 0.8465267, 1, 0, 0, 1, 1,
0.08470076, 1.199806, -0.5439616, 0, 0, 0, 1, 1,
0.08623105, 1.759159, 1.494506, 0, 0, 0, 1, 1,
0.08650431, 0.8113873, -0.6539615, 0, 0, 0, 1, 1,
0.08858702, 0.1192728, 0.2221677, 0, 0, 0, 1, 1,
0.09478758, 0.9814711, -0.6672922, 0, 0, 0, 1, 1,
0.1083018, 0.8099759, 0.8986322, 0, 0, 0, 1, 1,
0.1085563, -1.462752, 3.739406, 0, 0, 0, 1, 1,
0.1101178, -1.560199, 3.8852, 1, 1, 1, 1, 1,
0.1117148, 1.964637, 1.540334, 1, 1, 1, 1, 1,
0.1133627, -1.133161, 3.539234, 1, 1, 1, 1, 1,
0.1234884, -0.2980987, 4.30582, 1, 1, 1, 1, 1,
0.1253225, -0.7966669, 3.361591, 1, 1, 1, 1, 1,
0.1253513, -0.5274912, 3.767133, 1, 1, 1, 1, 1,
0.1264495, -0.08718495, 2.556673, 1, 1, 1, 1, 1,
0.1272831, -0.5986466, 1.365102, 1, 1, 1, 1, 1,
0.1282559, -0.8733516, 4.888876, 1, 1, 1, 1, 1,
0.1326687, 0.4535146, 0.4258501, 1, 1, 1, 1, 1,
0.1398724, -0.2263043, 5.116746, 1, 1, 1, 1, 1,
0.1402835, -1.019051, 2.594149, 1, 1, 1, 1, 1,
0.1451461, 0.2779782, -1.454558, 1, 1, 1, 1, 1,
0.1473712, -1.00928, 3.083346, 1, 1, 1, 1, 1,
0.1478591, 1.067816, 0.5757241, 1, 1, 1, 1, 1,
0.1482349, -1.61747, 1.763897, 0, 0, 1, 1, 1,
0.1504669, 0.8845549, -1.583744, 1, 0, 0, 1, 1,
0.1508684, 1.334854, -1.68421, 1, 0, 0, 1, 1,
0.1562544, 0.2109358, 0.8898465, 1, 0, 0, 1, 1,
0.1600928, -1.105833, 3.224024, 1, 0, 0, 1, 1,
0.1606433, -1.268767, 4.76123, 1, 0, 0, 1, 1,
0.1625064, -1.419, 3.186996, 0, 0, 0, 1, 1,
0.1634931, -0.07443314, 1.201841, 0, 0, 0, 1, 1,
0.1672676, 0.2548304, 0.7311794, 0, 0, 0, 1, 1,
0.168651, -1.585612, 0.2352777, 0, 0, 0, 1, 1,
0.1690113, -1.425589, 3.271117, 0, 0, 0, 1, 1,
0.1697835, 1.355365, -0.274225, 0, 0, 0, 1, 1,
0.171354, -0.5024769, 3.201874, 0, 0, 0, 1, 1,
0.1734253, 1.549278, 0.2985442, 1, 1, 1, 1, 1,
0.1757017, -0.512916, 3.859037, 1, 1, 1, 1, 1,
0.1806673, -0.4926147, 2.856178, 1, 1, 1, 1, 1,
0.1819451, 1.928198, -0.09923732, 1, 1, 1, 1, 1,
0.1867952, -0.3438428, 2.923107, 1, 1, 1, 1, 1,
0.1874927, -0.3413494, 3.670589, 1, 1, 1, 1, 1,
0.1912686, -1.360262, 4.339949, 1, 1, 1, 1, 1,
0.1945211, 0.1212227, 1.002559, 1, 1, 1, 1, 1,
0.1962457, -0.8100376, 2.290329, 1, 1, 1, 1, 1,
0.1970128, -0.4858354, 4.287702, 1, 1, 1, 1, 1,
0.2024532, 0.01529546, 0.8516399, 1, 1, 1, 1, 1,
0.2088431, 0.2101107, 1.036095, 1, 1, 1, 1, 1,
0.2092766, -0.2797539, 4.288116, 1, 1, 1, 1, 1,
0.2181163, -1.504637, 3.629594, 1, 1, 1, 1, 1,
0.2244877, -1.917214, 1.762556, 1, 1, 1, 1, 1,
0.226409, 1.072428, 0.6021659, 0, 0, 1, 1, 1,
0.2271516, -0.9878423, 2.881431, 1, 0, 0, 1, 1,
0.2278173, 2.29469, 0.4907127, 1, 0, 0, 1, 1,
0.2289048, 1.112897, 0.3706863, 1, 0, 0, 1, 1,
0.2313811, 1.107837, 0.7831591, 1, 0, 0, 1, 1,
0.2324118, -0.5096467, 2.846365, 1, 0, 0, 1, 1,
0.2331426, 0.06230025, 3.265266, 0, 0, 0, 1, 1,
0.2377591, -0.214288, 2.014626, 0, 0, 0, 1, 1,
0.2428768, 1.922073, 2.286587, 0, 0, 0, 1, 1,
0.2506134, 0.7515001, 0.005464, 0, 0, 0, 1, 1,
0.2519025, -1.264645, 2.480374, 0, 0, 0, 1, 1,
0.254156, 0.0686091, 1.223353, 0, 0, 0, 1, 1,
0.2545213, -0.7632603, 2.300022, 0, 0, 0, 1, 1,
0.2564401, -1.325848, 2.961575, 1, 1, 1, 1, 1,
0.25659, 0.06988101, 1.940389, 1, 1, 1, 1, 1,
0.260333, -0.8922072, 2.365618, 1, 1, 1, 1, 1,
0.2614245, 0.4648304, 0.2728971, 1, 1, 1, 1, 1,
0.2666534, -1.996536, 2.695431, 1, 1, 1, 1, 1,
0.2732431, 1.610691, -0.2484181, 1, 1, 1, 1, 1,
0.2764486, -0.6251166, 1.855253, 1, 1, 1, 1, 1,
0.2775843, 0.6556065, 1.588017, 1, 1, 1, 1, 1,
0.2811342, -0.1488444, 0.6289989, 1, 1, 1, 1, 1,
0.2813057, -0.8022407, 2.672497, 1, 1, 1, 1, 1,
0.2827071, -1.15166, 2.860724, 1, 1, 1, 1, 1,
0.2846103, 0.5542913, 1.462521, 1, 1, 1, 1, 1,
0.2857891, 0.3751501, -1.569751, 1, 1, 1, 1, 1,
0.2861611, -0.8039916, 2.366407, 1, 1, 1, 1, 1,
0.2862822, 0.6142813, 1.283221, 1, 1, 1, 1, 1,
0.2894718, 0.4094925, 0.4715683, 0, 0, 1, 1, 1,
0.2898255, 0.2256821, 1.502106, 1, 0, 0, 1, 1,
0.2898923, -1.334551, 3.605242, 1, 0, 0, 1, 1,
0.2985541, -0.1985203, 2.615365, 1, 0, 0, 1, 1,
0.2995632, -0.8855337, 1.806147, 1, 0, 0, 1, 1,
0.305069, -0.7062717, 3.325559, 1, 0, 0, 1, 1,
0.3054558, 1.316633, 1.162473, 0, 0, 0, 1, 1,
0.3057452, -0.9137973, 3.295853, 0, 0, 0, 1, 1,
0.3127832, -1.457824, 3.293154, 0, 0, 0, 1, 1,
0.3165158, -1.253535, 3.739314, 0, 0, 0, 1, 1,
0.3180088, 1.352723, -0.466267, 0, 0, 0, 1, 1,
0.3223656, 1.763385, 1.113511, 0, 0, 0, 1, 1,
0.3237005, -1.097283, 2.934216, 0, 0, 0, 1, 1,
0.3262451, -1.077676, 2.177005, 1, 1, 1, 1, 1,
0.3264229, -0.665587, 3.253162, 1, 1, 1, 1, 1,
0.326603, -0.5501692, 3.10454, 1, 1, 1, 1, 1,
0.3277979, 0.6246698, 0.5370022, 1, 1, 1, 1, 1,
0.3309729, 0.773292, 0.9268704, 1, 1, 1, 1, 1,
0.3311624, 1.775684, -1.885483, 1, 1, 1, 1, 1,
0.3317458, 0.08779218, 0.6721279, 1, 1, 1, 1, 1,
0.335049, 1.537082, 0.2977218, 1, 1, 1, 1, 1,
0.3439262, 0.8662415, -1.100821, 1, 1, 1, 1, 1,
0.3466408, 1.736919, -0.1992225, 1, 1, 1, 1, 1,
0.3524562, 0.2385553, -0.1258154, 1, 1, 1, 1, 1,
0.3591761, -0.936506, 2.904764, 1, 1, 1, 1, 1,
0.3602648, 0.7801238, 0.4758903, 1, 1, 1, 1, 1,
0.3612309, 0.2540069, -0.2011019, 1, 1, 1, 1, 1,
0.3615712, 0.4997973, 1.292107, 1, 1, 1, 1, 1,
0.3635141, -0.3401854, 5.336328, 0, 0, 1, 1, 1,
0.3641938, 1.048794, -1.878199, 1, 0, 0, 1, 1,
0.3642525, 0.02612087, 1.687208, 1, 0, 0, 1, 1,
0.3662711, 1.074198, -1.094129, 1, 0, 0, 1, 1,
0.3684578, -0.4706191, 2.489627, 1, 0, 0, 1, 1,
0.3712414, 0.2352474, 1.778083, 1, 0, 0, 1, 1,
0.3773586, 0.1781216, 2.959553, 0, 0, 0, 1, 1,
0.3802834, -0.8824589, 3.629224, 0, 0, 0, 1, 1,
0.3828613, 0.6720915, 1.996415, 0, 0, 0, 1, 1,
0.3883102, -0.4153508, 3.598182, 0, 0, 0, 1, 1,
0.399489, 0.0819148, 1.310931, 0, 0, 0, 1, 1,
0.4003008, -1.342574, 2.909258, 0, 0, 0, 1, 1,
0.4049484, 0.6135849, 0.9437056, 0, 0, 0, 1, 1,
0.4079001, -0.3024564, 1.429843, 1, 1, 1, 1, 1,
0.4112012, -0.2446897, 2.540376, 1, 1, 1, 1, 1,
0.4165047, 0.1619275, 0.5106718, 1, 1, 1, 1, 1,
0.4214832, -0.1558893, 1.6051, 1, 1, 1, 1, 1,
0.4249995, 3.120791, -0.9414049, 1, 1, 1, 1, 1,
0.4257233, -0.3443161, 2.735463, 1, 1, 1, 1, 1,
0.4281648, 0.1378945, 1.672933, 1, 1, 1, 1, 1,
0.4338784, -1.227885, 1.521688, 1, 1, 1, 1, 1,
0.4385219, -0.3415847, 3.297446, 1, 1, 1, 1, 1,
0.4399306, 0.3942168, -0.8300871, 1, 1, 1, 1, 1,
0.4404925, 0.5335044, 1.70364, 1, 1, 1, 1, 1,
0.4413669, -1.331729, 4.270335, 1, 1, 1, 1, 1,
0.4420387, -0.5928707, 1.681573, 1, 1, 1, 1, 1,
0.4467173, -0.4977846, 2.828079, 1, 1, 1, 1, 1,
0.4487135, 0.3406483, 0.7697328, 1, 1, 1, 1, 1,
0.4520066, -0.1576985, -0.06107249, 0, 0, 1, 1, 1,
0.4537735, -0.3246695, 2.975112, 1, 0, 0, 1, 1,
0.454749, -0.7389485, 1.027048, 1, 0, 0, 1, 1,
0.4570986, -1.037359, 3.870603, 1, 0, 0, 1, 1,
0.4598196, 1.126895, 0.109289, 1, 0, 0, 1, 1,
0.4611719, -1.016414, 2.569276, 1, 0, 0, 1, 1,
0.4636579, 0.3684331, 1.859161, 0, 0, 0, 1, 1,
0.4661334, -0.3282136, 2.482319, 0, 0, 0, 1, 1,
0.4677347, -0.8009362, 2.391988, 0, 0, 0, 1, 1,
0.4684465, 0.1400827, 2.652622, 0, 0, 0, 1, 1,
0.4697248, 1.173137, 0.2314359, 0, 0, 0, 1, 1,
0.470773, -0.4660812, 1.579171, 0, 0, 0, 1, 1,
0.4741167, -3.117376, 3.028052, 0, 0, 0, 1, 1,
0.4763469, -1.040365, 2.359897, 1, 1, 1, 1, 1,
0.4782798, 0.209861, 1.598136, 1, 1, 1, 1, 1,
0.4784299, -0.618638, 3.849961, 1, 1, 1, 1, 1,
0.4798682, -0.7876188, 0.9354205, 1, 1, 1, 1, 1,
0.4805644, -0.1638441, 0.7895826, 1, 1, 1, 1, 1,
0.4862301, 2.071671, -0.3267814, 1, 1, 1, 1, 1,
0.4909798, -0.07162097, 0.4325014, 1, 1, 1, 1, 1,
0.4915492, 0.1452844, 2.082829, 1, 1, 1, 1, 1,
0.4924249, -0.1533617, 2.596524, 1, 1, 1, 1, 1,
0.4933265, -1.529685, 2.869648, 1, 1, 1, 1, 1,
0.5006112, -1.643873, 1.477709, 1, 1, 1, 1, 1,
0.5012805, 1.379766, 0.2403315, 1, 1, 1, 1, 1,
0.5017846, 2.025091, 0.9207089, 1, 1, 1, 1, 1,
0.5024081, 0.6710963, 0.6275406, 1, 1, 1, 1, 1,
0.5117908, 0.1353018, 1.652303, 1, 1, 1, 1, 1,
0.5146413, 0.5520141, -0.3399771, 0, 0, 1, 1, 1,
0.5171248, -0.1274526, 0.4775926, 1, 0, 0, 1, 1,
0.5175952, -1.325458, 1.940479, 1, 0, 0, 1, 1,
0.519147, 0.7242166, 0.3199105, 1, 0, 0, 1, 1,
0.5228117, 1.32855, 1.086345, 1, 0, 0, 1, 1,
0.5230656, 1.214411, 1.009174, 1, 0, 0, 1, 1,
0.5359699, -0.1550081, 0.8422161, 0, 0, 0, 1, 1,
0.5360932, -0.938453, 2.313989, 0, 0, 0, 1, 1,
0.5406079, 0.8971235, -0.3047647, 0, 0, 0, 1, 1,
0.5415248, -0.2846907, 2.039702, 0, 0, 0, 1, 1,
0.5419576, 1.511365, -0.7663634, 0, 0, 0, 1, 1,
0.5460683, 0.2867759, 0.4520164, 0, 0, 0, 1, 1,
0.547795, -1.890718, 3.827001, 0, 0, 0, 1, 1,
0.5518874, -0.2543287, 2.956503, 1, 1, 1, 1, 1,
0.5519842, -0.984581, 5.159705, 1, 1, 1, 1, 1,
0.5541922, -2.179682, 1.650163, 1, 1, 1, 1, 1,
0.5572874, -0.1924107, 2.852561, 1, 1, 1, 1, 1,
0.5634123, -2.549047, 1.341897, 1, 1, 1, 1, 1,
0.5640225, 0.002827961, 2.249627, 1, 1, 1, 1, 1,
0.5655214, -1.094755, 2.03379, 1, 1, 1, 1, 1,
0.5695824, 0.8060011, 1.850734, 1, 1, 1, 1, 1,
0.5707579, -0.4073467, 3.290819, 1, 1, 1, 1, 1,
0.5714625, 0.9981763, -1.721694, 1, 1, 1, 1, 1,
0.5724291, 1.680529, 1.319016, 1, 1, 1, 1, 1,
0.5746948, 0.5418773, 0.437928, 1, 1, 1, 1, 1,
0.5771924, -0.5059136, 2.319399, 1, 1, 1, 1, 1,
0.5775529, 0.9061921, 0.1764278, 1, 1, 1, 1, 1,
0.5777861, -0.7841665, 2.488024, 1, 1, 1, 1, 1,
0.5820957, -0.6101921, 2.198522, 0, 0, 1, 1, 1,
0.5824087, 0.2090021, -0.7707952, 1, 0, 0, 1, 1,
0.584916, 0.931949, -0.4982678, 1, 0, 0, 1, 1,
0.5872689, 0.7479504, -0.2321461, 1, 0, 0, 1, 1,
0.5874956, -0.4574209, 1.737215, 1, 0, 0, 1, 1,
0.5877607, -0.5563063, 3.341027, 1, 0, 0, 1, 1,
0.591472, 2.064994, -0.004097938, 0, 0, 0, 1, 1,
0.5942252, 0.05904804, 1.068101, 0, 0, 0, 1, 1,
0.595269, -2.357403, 2.639259, 0, 0, 0, 1, 1,
0.5985638, 2.328291, -0.07321291, 0, 0, 0, 1, 1,
0.6013551, 0.000620336, 1.004315, 0, 0, 0, 1, 1,
0.6099821, -1.634203, 2.557256, 0, 0, 0, 1, 1,
0.6104791, -1.075565, 1.076657, 0, 0, 0, 1, 1,
0.6126851, -0.1850819, 1.507019, 1, 1, 1, 1, 1,
0.6172005, -0.1738526, 2.327498, 1, 1, 1, 1, 1,
0.6195627, 0.313848, 1.787572, 1, 1, 1, 1, 1,
0.6209002, -0.532788, 2.873226, 1, 1, 1, 1, 1,
0.624963, -1.046113, 3.718282, 1, 1, 1, 1, 1,
0.6270845, 1.060325, 2.4003, 1, 1, 1, 1, 1,
0.6280349, -0.3185094, 1.905587, 1, 1, 1, 1, 1,
0.6286176, -0.8345377, 3.637194, 1, 1, 1, 1, 1,
0.6289321, 0.3927043, 1.056524, 1, 1, 1, 1, 1,
0.629089, -1.666487, 1.499668, 1, 1, 1, 1, 1,
0.6324681, 0.7647098, -0.09606411, 1, 1, 1, 1, 1,
0.6363569, 1.228987, 0.9623499, 1, 1, 1, 1, 1,
0.6466441, 1.771945, 0.7280337, 1, 1, 1, 1, 1,
0.6482859, 1.690718, -0.3523727, 1, 1, 1, 1, 1,
0.6491486, 0.335066, -1.000641, 1, 1, 1, 1, 1,
0.6500169, -0.8537137, 2.156307, 0, 0, 1, 1, 1,
0.6548572, 0.7305927, -0.6312245, 1, 0, 0, 1, 1,
0.6550192, 0.3584875, 1.506535, 1, 0, 0, 1, 1,
0.6556498, 0.6289142, 1.664412, 1, 0, 0, 1, 1,
0.6559106, 0.5528012, 0.3943098, 1, 0, 0, 1, 1,
0.6589703, -0.1928393, 1.931605, 1, 0, 0, 1, 1,
0.659394, 0.233303, -0.06075091, 0, 0, 0, 1, 1,
0.6603185, 1.115136, 1.057585, 0, 0, 0, 1, 1,
0.6610111, -0.1996931, 3.496407, 0, 0, 0, 1, 1,
0.6616882, 1.580176, -0.2696834, 0, 0, 0, 1, 1,
0.6678919, 0.697978, 3.426103, 0, 0, 0, 1, 1,
0.6713182, 0.1598655, 2.496768, 0, 0, 0, 1, 1,
0.6774347, -0.0927346, 1.41114, 0, 0, 0, 1, 1,
0.6806539, 0.0194732, 1.630022, 1, 1, 1, 1, 1,
0.6844178, -1.59735, 0.480199, 1, 1, 1, 1, 1,
0.6890267, -0.1753281, 0.7692264, 1, 1, 1, 1, 1,
0.6892205, -0.3603876, 2.263218, 1, 1, 1, 1, 1,
0.6894423, 0.4726631, 0.6241129, 1, 1, 1, 1, 1,
0.6910608, 1.081266, 1.627138, 1, 1, 1, 1, 1,
0.6911943, -0.2374239, 1.194212, 1, 1, 1, 1, 1,
0.6970953, 0.2011592, -0.9776673, 1, 1, 1, 1, 1,
0.6975288, 1.401472, 1.169989, 1, 1, 1, 1, 1,
0.7068855, 0.7055836, -0.5660526, 1, 1, 1, 1, 1,
0.7088205, 0.06466788, 0.473266, 1, 1, 1, 1, 1,
0.7129984, 1.065349, -0.1713035, 1, 1, 1, 1, 1,
0.7161159, 1.230277, 1.358529, 1, 1, 1, 1, 1,
0.7212633, 0.03039575, 2.112868, 1, 1, 1, 1, 1,
0.729749, 0.5214522, 0.7458881, 1, 1, 1, 1, 1,
0.7334337, 0.5104018, 0.6759251, 0, 0, 1, 1, 1,
0.7370533, -1.377396, 3.568865, 1, 0, 0, 1, 1,
0.7393719, -1.116796, 3.436428, 1, 0, 0, 1, 1,
0.743515, 0.2045068, 2.019273, 1, 0, 0, 1, 1,
0.7489765, 0.5098321, 0.1073134, 1, 0, 0, 1, 1,
0.7492801, -1.831178, 2.931561, 1, 0, 0, 1, 1,
0.7515264, 0.8748283, -0.3553553, 0, 0, 0, 1, 1,
0.7547754, -2.006878, 2.890045, 0, 0, 0, 1, 1,
0.7550161, -0.3739821, 1.862365, 0, 0, 0, 1, 1,
0.7581788, 0.3356396, 1.839437, 0, 0, 0, 1, 1,
0.7593101, 0.4763284, -0.6611245, 0, 0, 0, 1, 1,
0.7599847, 0.1345838, 1.670915, 0, 0, 0, 1, 1,
0.7639428, -0.2850038, 3.342869, 0, 0, 0, 1, 1,
0.7684779, -1.583159, 3.518521, 1, 1, 1, 1, 1,
0.7698728, -0.04577954, 2.904298, 1, 1, 1, 1, 1,
0.7739431, -0.3462852, 0.8900795, 1, 1, 1, 1, 1,
0.7748502, -0.5849161, 1.723028, 1, 1, 1, 1, 1,
0.7757486, -0.376131, 1.856797, 1, 1, 1, 1, 1,
0.7769725, 0.4479757, 1.305503, 1, 1, 1, 1, 1,
0.7787938, -1.698088, 3.739197, 1, 1, 1, 1, 1,
0.7826183, 0.7313371, 0.4679231, 1, 1, 1, 1, 1,
0.7830942, 0.04914266, 0.9166773, 1, 1, 1, 1, 1,
0.7856007, -1.110359, 3.064553, 1, 1, 1, 1, 1,
0.7873826, 0.6292912, 1.718094, 1, 1, 1, 1, 1,
0.7903249, -0.7409897, 2.455952, 1, 1, 1, 1, 1,
0.7969494, 0.3061101, 0.6615185, 1, 1, 1, 1, 1,
0.8008972, -0.616555, 0.423616, 1, 1, 1, 1, 1,
0.8071616, -0.1403233, 3.3297, 1, 1, 1, 1, 1,
0.8081458, 1.405078, -2.074116, 0, 0, 1, 1, 1,
0.8086343, -0.0953245, 0.05633226, 1, 0, 0, 1, 1,
0.8114502, 1.312932, 0.2502995, 1, 0, 0, 1, 1,
0.8207554, -1.293597, 1.623154, 1, 0, 0, 1, 1,
0.8218712, -1.192206, 3.062827, 1, 0, 0, 1, 1,
0.8257499, 1.214556, 1.78765, 1, 0, 0, 1, 1,
0.8297579, -1.007704, 3.510639, 0, 0, 0, 1, 1,
0.8384451, 0.5128573, 0.7606919, 0, 0, 0, 1, 1,
0.8385062, -0.7800564, 2.634578, 0, 0, 0, 1, 1,
0.8407105, -0.1844481, 1.373059, 0, 0, 0, 1, 1,
0.8415539, 2.828366, -0.545485, 0, 0, 0, 1, 1,
0.8479568, 1.615332, -0.3063135, 0, 0, 0, 1, 1,
0.855068, 1.435155, 2.033998, 0, 0, 0, 1, 1,
0.8550703, -0.9186357, 1.955009, 1, 1, 1, 1, 1,
0.855922, -0.8241937, 3.060964, 1, 1, 1, 1, 1,
0.857714, 0.7833337, 0.09019636, 1, 1, 1, 1, 1,
0.8588341, 1.008016, 0.3694837, 1, 1, 1, 1, 1,
0.8610491, -0.2586513, 1.385027, 1, 1, 1, 1, 1,
0.8615766, 0.7341536, 0.9700212, 1, 1, 1, 1, 1,
0.864934, 0.822166, 0.6892546, 1, 1, 1, 1, 1,
0.8663327, -1.151081, 3.774111, 1, 1, 1, 1, 1,
0.8687638, -0.05202384, -0.1736929, 1, 1, 1, 1, 1,
0.8702482, 0.1368615, 2.413976, 1, 1, 1, 1, 1,
0.8753057, -0.06567901, 1.866244, 1, 1, 1, 1, 1,
0.8782324, -2.164292, 3.400469, 1, 1, 1, 1, 1,
0.882676, -0.7172764, 2.965839, 1, 1, 1, 1, 1,
0.8948644, 1.179526, 0.6691407, 1, 1, 1, 1, 1,
0.8982127, -0.02092255, 2.562281, 1, 1, 1, 1, 1,
0.9023401, -0.06454302, 1.384216, 0, 0, 1, 1, 1,
0.9025217, 2.135898, 0.3315902, 1, 0, 0, 1, 1,
0.9063093, 0.4733515, 0.6226417, 1, 0, 0, 1, 1,
0.9160096, -0.1114066, 1.758425, 1, 0, 0, 1, 1,
0.916618, -0.288594, 0.03968428, 1, 0, 0, 1, 1,
0.9176406, -0.1348203, 0.5558782, 1, 0, 0, 1, 1,
0.9230345, -0.02949054, -0.399068, 0, 0, 0, 1, 1,
0.9298512, 0.769742, 0.4258227, 0, 0, 0, 1, 1,
0.9308994, 0.3077315, 1.899117, 0, 0, 0, 1, 1,
0.9330233, -1.32068, 2.415959, 0, 0, 0, 1, 1,
0.9349049, 0.2715726, -0.4773712, 0, 0, 0, 1, 1,
0.9353359, 1.979631, 0.977873, 0, 0, 0, 1, 1,
0.9370756, -0.9554175, 3.067441, 0, 0, 0, 1, 1,
0.9392909, -0.5674418, 2.763363, 1, 1, 1, 1, 1,
0.9395458, 0.004280104, 2.224642, 1, 1, 1, 1, 1,
0.9428452, 1.124191, 1.78897, 1, 1, 1, 1, 1,
0.9514861, 0.6878318, 1.492691, 1, 1, 1, 1, 1,
0.9541343, 0.8554273, 0.06410094, 1, 1, 1, 1, 1,
0.9562473, 0.3086293, 0.9826265, 1, 1, 1, 1, 1,
0.958742, -1.276464, 1.227661, 1, 1, 1, 1, 1,
0.9614592, -0.9935911, 3.187392, 1, 1, 1, 1, 1,
0.9643718, 0.8029207, 1.36667, 1, 1, 1, 1, 1,
0.9697444, 0.3362409, 0.908681, 1, 1, 1, 1, 1,
0.9822524, -1.437112, 1.935528, 1, 1, 1, 1, 1,
0.9879689, 0.8720132, 0.01857581, 1, 1, 1, 1, 1,
1.001163, 0.5966842, 0.1326464, 1, 1, 1, 1, 1,
1.002547, 0.8236752, -0.08231747, 1, 1, 1, 1, 1,
1.004291, 1.693781, 0.1613729, 1, 1, 1, 1, 1,
1.0142, -0.763484, 1.419538, 0, 0, 1, 1, 1,
1.01791, 1.107295, 2.019036, 1, 0, 0, 1, 1,
1.020163, 0.134271, 1.587271, 1, 0, 0, 1, 1,
1.021889, 1.197011, 0.9757549, 1, 0, 0, 1, 1,
1.02817, -1.541642, -0.03385895, 1, 0, 0, 1, 1,
1.031797, 1.960566, 1.862013, 1, 0, 0, 1, 1,
1.033856, -0.02540953, 0.2863992, 0, 0, 0, 1, 1,
1.046948, -0.2945749, 1.326399, 0, 0, 0, 1, 1,
1.047115, -0.763346, 0.692091, 0, 0, 0, 1, 1,
1.049107, -0.2710158, 0.9431431, 0, 0, 0, 1, 1,
1.051262, 0.1189725, 3.307224, 0, 0, 0, 1, 1,
1.056163, -2.544441, 3.648427, 0, 0, 0, 1, 1,
1.056653, 0.2556383, 1.650352, 0, 0, 0, 1, 1,
1.059673, -0.06273836, 1.503993, 1, 1, 1, 1, 1,
1.071102, 0.2416827, 0.3626119, 1, 1, 1, 1, 1,
1.074134, -0.6611571, 2.325341, 1, 1, 1, 1, 1,
1.074798, 0.06007479, 0.4539883, 1, 1, 1, 1, 1,
1.080274, -1.575404, 2.699514, 1, 1, 1, 1, 1,
1.089401, 1.438422, -0.1960206, 1, 1, 1, 1, 1,
1.096163, 1.427763, 0.4488599, 1, 1, 1, 1, 1,
1.100442, 0.4911037, 0.6243444, 1, 1, 1, 1, 1,
1.112238, -1.710039, 3.320391, 1, 1, 1, 1, 1,
1.112405, 1.758286, 0.5556716, 1, 1, 1, 1, 1,
1.113391, 1.381399, -0.2459567, 1, 1, 1, 1, 1,
1.11389, -0.4983622, 3.046042, 1, 1, 1, 1, 1,
1.122931, -0.6109735, 2.2061, 1, 1, 1, 1, 1,
1.139473, 0.7957717, 0.1029874, 1, 1, 1, 1, 1,
1.139594, 0.03206732, 1.37105, 1, 1, 1, 1, 1,
1.15031, 2.614748, 1.388088, 0, 0, 1, 1, 1,
1.150937, -0.2329606, 1.978012, 1, 0, 0, 1, 1,
1.153544, 0.6757206, 1.497659, 1, 0, 0, 1, 1,
1.158533, 0.08280484, 1.218046, 1, 0, 0, 1, 1,
1.170711, -0.1854979, 2.410117, 1, 0, 0, 1, 1,
1.173034, 0.3415678, -0.5240815, 1, 0, 0, 1, 1,
1.182413, 0.2670862, 0.1196959, 0, 0, 0, 1, 1,
1.183327, 1.09236, 0.9856793, 0, 0, 0, 1, 1,
1.183387, -0.1953231, 2.294005, 0, 0, 0, 1, 1,
1.197307, 0.2823322, -0.1382932, 0, 0, 0, 1, 1,
1.200179, -0.7018444, 2.15202, 0, 0, 0, 1, 1,
1.200306, 0.2276004, 1.524249, 0, 0, 0, 1, 1,
1.203317, -0.4218317, 1.571192, 0, 0, 0, 1, 1,
1.204806, 1.102131, 1.399032, 1, 1, 1, 1, 1,
1.207987, 0.04812771, 3.164381, 1, 1, 1, 1, 1,
1.218666, 0.06839626, 3.001275, 1, 1, 1, 1, 1,
1.225053, -0.3372267, 1.514056, 1, 1, 1, 1, 1,
1.229464, -0.06546069, 0.9125095, 1, 1, 1, 1, 1,
1.231486, 0.004803454, 1.032512, 1, 1, 1, 1, 1,
1.240268, 1.446018, 0.8548936, 1, 1, 1, 1, 1,
1.240841, 1.405075, 2.406665, 1, 1, 1, 1, 1,
1.245609, -2.07768, 4.631249, 1, 1, 1, 1, 1,
1.253431, 2.147389, 0.6799653, 1, 1, 1, 1, 1,
1.265669, 1.182449, 1.95391, 1, 1, 1, 1, 1,
1.270798, 1.280395, 0.5708634, 1, 1, 1, 1, 1,
1.27119, -0.8156011, 1.07396, 1, 1, 1, 1, 1,
1.276801, 1.349501, -0.04477035, 1, 1, 1, 1, 1,
1.28343, 0.9319406, -1.178565, 1, 1, 1, 1, 1,
1.288708, 2.8204, -1.953017, 0, 0, 1, 1, 1,
1.291972, -1.270948, 2.460467, 1, 0, 0, 1, 1,
1.301528, 0.2190977, 1.466514, 1, 0, 0, 1, 1,
1.308392, -0.2462475, 1.159011, 1, 0, 0, 1, 1,
1.314066, 1.135687, 0.1486586, 1, 0, 0, 1, 1,
1.338379, -0.1533656, 1.746592, 1, 0, 0, 1, 1,
1.340156, -0.09619273, 0.3690098, 0, 0, 0, 1, 1,
1.351818, 0.364206, 1.473734, 0, 0, 0, 1, 1,
1.372707, 0.2689825, -0.8414664, 0, 0, 0, 1, 1,
1.373232, -0.2459947, 0.9488025, 0, 0, 0, 1, 1,
1.377712, -0.2509682, 0.3754131, 0, 0, 0, 1, 1,
1.380176, -1.069076, 2.820801, 0, 0, 0, 1, 1,
1.381825, -2.62107, 1.986686, 0, 0, 0, 1, 1,
1.383443, -1.962878, 3.436841, 1, 1, 1, 1, 1,
1.386288, -0.2296067, 1.806508, 1, 1, 1, 1, 1,
1.407718, 0.1287142, 0.7626505, 1, 1, 1, 1, 1,
1.415076, -0.6900266, 2.52291, 1, 1, 1, 1, 1,
1.419086, -0.9227219, 2.89416, 1, 1, 1, 1, 1,
1.429033, 0.3545017, 2.084485, 1, 1, 1, 1, 1,
1.449241, 0.04147797, 1.232848, 1, 1, 1, 1, 1,
1.457911, -0.7673332, 1.288992, 1, 1, 1, 1, 1,
1.459951, -1.214737, 2.349702, 1, 1, 1, 1, 1,
1.465863, -0.6019927, 3.010339, 1, 1, 1, 1, 1,
1.466876, 2.472874, 0.9315397, 1, 1, 1, 1, 1,
1.469704, -0.6402677, 3.916083, 1, 1, 1, 1, 1,
1.470635, -0.0008673642, 2.295172, 1, 1, 1, 1, 1,
1.481664, 0.1358199, 3.134812, 1, 1, 1, 1, 1,
1.495806, -2.165692, 2.517723, 1, 1, 1, 1, 1,
1.503894, -1.752023, 1.955691, 0, 0, 1, 1, 1,
1.5058, -1.365081, 1.771102, 1, 0, 0, 1, 1,
1.51201, 1.081719, 0.2057179, 1, 0, 0, 1, 1,
1.51242, 0.06366857, 0.6258035, 1, 0, 0, 1, 1,
1.520045, 0.08509418, 0.6634783, 1, 0, 0, 1, 1,
1.527078, 0.9928501, 0.4844067, 1, 0, 0, 1, 1,
1.528548, 0.1695217, 1.299239, 0, 0, 0, 1, 1,
1.529355, 0.2836351, 1.392516, 0, 0, 0, 1, 1,
1.535908, -0.9829882, 2.635315, 0, 0, 0, 1, 1,
1.538886, 1.022795, 2.624669, 0, 0, 0, 1, 1,
1.552328, -0.1295062, 1.431419, 0, 0, 0, 1, 1,
1.557172, -0.5763087, 2.424988, 0, 0, 0, 1, 1,
1.559498, -0.7919099, 2.414863, 0, 0, 0, 1, 1,
1.582634, -0.7422168, 1.965438, 1, 1, 1, 1, 1,
1.583969, -1.929974, 2.500694, 1, 1, 1, 1, 1,
1.585859, 1.910098, 0.3131363, 1, 1, 1, 1, 1,
1.592202, 0.8142285, 0.9291881, 1, 1, 1, 1, 1,
1.606366, 1.333214, 0.00648981, 1, 1, 1, 1, 1,
1.60681, 0.3777584, 0.2261703, 1, 1, 1, 1, 1,
1.61678, -0.9596443, 3.827359, 1, 1, 1, 1, 1,
1.620906, -0.1136255, 2.727955, 1, 1, 1, 1, 1,
1.629613, -1.237761, -0.02583286, 1, 1, 1, 1, 1,
1.647643, -1.55569, 2.544023, 1, 1, 1, 1, 1,
1.649973, -0.1994114, 2.55121, 1, 1, 1, 1, 1,
1.652542, 0.03846357, 1.536415, 1, 1, 1, 1, 1,
1.676624, 0.3940274, 0.3603087, 1, 1, 1, 1, 1,
1.686164, 1.053895, 0.7511103, 1, 1, 1, 1, 1,
1.687988, 0.4744303, 1.044659, 1, 1, 1, 1, 1,
1.69012, 0.9331252, 0.008427718, 0, 0, 1, 1, 1,
1.714626, -2.122632, 2.965719, 1, 0, 0, 1, 1,
1.720444, 0.06824188, 2.365159, 1, 0, 0, 1, 1,
1.733213, 0.6403742, 2.651658, 1, 0, 0, 1, 1,
1.745932, 1.565138, 1.705677, 1, 0, 0, 1, 1,
1.765978, 0.4297386, 1.712869, 1, 0, 0, 1, 1,
1.777474, -0.01095161, 0.573777, 0, 0, 0, 1, 1,
1.777731, 0.4600983, 2.746589, 0, 0, 0, 1, 1,
1.792097, -1.098938, 2.514468, 0, 0, 0, 1, 1,
1.801148, -0.9122072, 3.009208, 0, 0, 0, 1, 1,
1.802679, -0.2518775, 1.706944, 0, 0, 0, 1, 1,
1.808215, -0.4651091, 2.505465, 0, 0, 0, 1, 1,
1.815871, -1.931733, 1.640339, 0, 0, 0, 1, 1,
1.818183, -0.1846201, 2.474429, 1, 1, 1, 1, 1,
1.8547, 0.7531577, 2.187515, 1, 1, 1, 1, 1,
1.865101, -0.2401054, 0.3557367, 1, 1, 1, 1, 1,
1.86991, 0.7313704, 1.837372, 1, 1, 1, 1, 1,
1.896901, 1.280666, 1.500623, 1, 1, 1, 1, 1,
1.922788, -0.8009127, 2.995939, 1, 1, 1, 1, 1,
1.933636, -0.1622296, 2.034586, 1, 1, 1, 1, 1,
1.955694, -0.2995489, 1.714449, 1, 1, 1, 1, 1,
1.961896, 0.976211, 3.377849, 1, 1, 1, 1, 1,
1.979422, 1.329958, 1.146189, 1, 1, 1, 1, 1,
1.993621, 0.09362943, 0.4564359, 1, 1, 1, 1, 1,
2.001737, 1.009816, 2.682262, 1, 1, 1, 1, 1,
2.045172, 0.3035687, 1.153935, 1, 1, 1, 1, 1,
2.052154, 0.8308092, 1.091032, 1, 1, 1, 1, 1,
2.067996, -0.862112, 1.494675, 1, 1, 1, 1, 1,
2.08798, 0.1873138, 1.168545, 0, 0, 1, 1, 1,
2.111465, 0.766533, 0.5703838, 1, 0, 0, 1, 1,
2.127107, -2.639519, 1.565047, 1, 0, 0, 1, 1,
2.143407, -0.31816, 1.387276, 1, 0, 0, 1, 1,
2.167259, 0.2261285, 1.856768, 1, 0, 0, 1, 1,
2.192984, -1.610393, 2.505068, 1, 0, 0, 1, 1,
2.194751, -0.5187094, 3.115123, 0, 0, 0, 1, 1,
2.230175, -1.621516, 0.7580083, 0, 0, 0, 1, 1,
2.257606, 0.7834909, 2.367214, 0, 0, 0, 1, 1,
2.303692, -0.9890761, 2.207809, 0, 0, 0, 1, 1,
2.3058, -0.4748108, 1.77827, 0, 0, 0, 1, 1,
2.319907, 0.1346958, 2.119786, 0, 0, 0, 1, 1,
2.401304, -0.4586991, 1.448161, 0, 0, 0, 1, 1,
2.464549, 0.5905502, 1.54351, 1, 1, 1, 1, 1,
2.499796, 0.193555, 2.725015, 1, 1, 1, 1, 1,
2.736731, 0.04916912, 2.70884, 1, 1, 1, 1, 1,
2.816553, -1.614958, 0.8294035, 1, 1, 1, 1, 1,
2.850992, 0.01811508, 1.871958, 1, 1, 1, 1, 1,
3.128736, -0.3868748, 1.935509, 1, 1, 1, 1, 1,
3.283744, -0.559727, 2.24916, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 10.04328;
var distance = 35.27661;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.06567287, 0.6559474, 0.2021925 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.27661);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>