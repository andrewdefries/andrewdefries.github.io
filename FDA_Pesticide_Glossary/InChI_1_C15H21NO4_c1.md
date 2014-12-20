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
-3.82167, -1.467642, -3.35539, 1, 0, 0, 1,
-3.44077, -1.092279, -1.889355, 1, 0.007843138, 0, 1,
-3.216209, 0.7152095, -0.938698, 1, 0.01176471, 0, 1,
-3.049102, -0.5513636, -2.269, 1, 0.01960784, 0, 1,
-2.867136, -1.016236, -0.6807622, 1, 0.02352941, 0, 1,
-2.864534, -0.8351601, -2.511349, 1, 0.03137255, 0, 1,
-2.695039, 0.2498166, -1.000547, 1, 0.03529412, 0, 1,
-2.663856, -0.3089413, -1.744222, 1, 0.04313726, 0, 1,
-2.662583, -1.156686, -4.240337, 1, 0.04705882, 0, 1,
-2.642446, -0.668596, -2.023332, 1, 0.05490196, 0, 1,
-2.578493, -1.723098, -2.410573, 1, 0.05882353, 0, 1,
-2.54373, -0.008952999, -0.9068944, 1, 0.06666667, 0, 1,
-2.415301, 0.4820034, -1.033715, 1, 0.07058824, 0, 1,
-2.405825, -0.4327082, 0.06145792, 1, 0.07843138, 0, 1,
-2.306286, 0.4817246, -2.188648, 1, 0.08235294, 0, 1,
-2.248269, -0.2863656, -2.349856, 1, 0.09019608, 0, 1,
-2.222079, -0.6862238, -1.887725, 1, 0.09411765, 0, 1,
-2.2201, 0.1745264, -0.9576929, 1, 0.1019608, 0, 1,
-2.134426, -0.5822603, -0.8632646, 1, 0.1098039, 0, 1,
-2.126208, -0.1570966, -1.238701, 1, 0.1137255, 0, 1,
-2.115653, 0.3226349, -1.738589, 1, 0.1215686, 0, 1,
-2.101012, 0.4643801, -1.536209, 1, 0.1254902, 0, 1,
-2.089543, -0.5653087, -2.380178, 1, 0.1333333, 0, 1,
-2.07332, 1.541439, 0.3565221, 1, 0.1372549, 0, 1,
-2.04243, -0.9866694, -2.942887, 1, 0.145098, 0, 1,
-2.03877, -0.549878, -3.469467, 1, 0.1490196, 0, 1,
-2.001638, 1.661651, -1.475466, 1, 0.1568628, 0, 1,
-1.969734, -0.4516152, -2.17013, 1, 0.1607843, 0, 1,
-1.957957, -0.1791137, -1.484309, 1, 0.1686275, 0, 1,
-1.920583, 1.637374, -0.9730874, 1, 0.172549, 0, 1,
-1.90926, 0.3633996, -1.268818, 1, 0.1803922, 0, 1,
-1.890624, -1.125179, -5.379685, 1, 0.1843137, 0, 1,
-1.870095, 1.613048, -1.423067, 1, 0.1921569, 0, 1,
-1.816223, 0.9313899, 0.02685692, 1, 0.1960784, 0, 1,
-1.812663, -0.1077835, -0.5647519, 1, 0.2039216, 0, 1,
-1.805611, -1.058875, -3.77122, 1, 0.2117647, 0, 1,
-1.799312, 0.1763386, -1.601734, 1, 0.2156863, 0, 1,
-1.795236, 0.06981202, -2.871474, 1, 0.2235294, 0, 1,
-1.793587, 0.7030121, 0.4640134, 1, 0.227451, 0, 1,
-1.777621, 0.5156609, -2.267915, 1, 0.2352941, 0, 1,
-1.762933, 0.5556967, -0.3873507, 1, 0.2392157, 0, 1,
-1.732623, 0.1792111, -1.970547, 1, 0.2470588, 0, 1,
-1.727964, -1.825523, -2.145317, 1, 0.2509804, 0, 1,
-1.716105, 1.470782, 1.189811, 1, 0.2588235, 0, 1,
-1.702208, -0.5436454, -2.39261, 1, 0.2627451, 0, 1,
-1.682435, -1.172095, -1.345858, 1, 0.2705882, 0, 1,
-1.678541, 1.178601, -0.3821892, 1, 0.2745098, 0, 1,
-1.673097, -1.183306, -2.905742, 1, 0.282353, 0, 1,
-1.657905, -0.246476, -1.401703, 1, 0.2862745, 0, 1,
-1.656645, -0.9853112, -2.690318, 1, 0.2941177, 0, 1,
-1.656519, 0.8226226, -0.7955556, 1, 0.3019608, 0, 1,
-1.643259, 1.368926, -1.85336, 1, 0.3058824, 0, 1,
-1.62424, 0.9946395, -1.267098, 1, 0.3137255, 0, 1,
-1.621872, -0.1803724, -2.305434, 1, 0.3176471, 0, 1,
-1.613927, -0.02767181, -0.8794652, 1, 0.3254902, 0, 1,
-1.613151, 0.3220402, -1.084347, 1, 0.3294118, 0, 1,
-1.602183, -1.1528, -2.928251, 1, 0.3372549, 0, 1,
-1.572655, 0.5606357, 0.7516725, 1, 0.3411765, 0, 1,
-1.561643, -0.7632163, -3.622672, 1, 0.3490196, 0, 1,
-1.560444, -0.4023367, -0.2629294, 1, 0.3529412, 0, 1,
-1.559757, 0.2485499, -1.410386, 1, 0.3607843, 0, 1,
-1.555049, 0.9782817, -1.753118, 1, 0.3647059, 0, 1,
-1.54883, 0.1293112, -1.397353, 1, 0.372549, 0, 1,
-1.545348, 1.091906, -0.5282916, 1, 0.3764706, 0, 1,
-1.532544, -0.1006299, -1.537291, 1, 0.3843137, 0, 1,
-1.52146, 1.494548, 0.02038622, 1, 0.3882353, 0, 1,
-1.515661, -0.7017869, -2.305182, 1, 0.3960784, 0, 1,
-1.513704, -0.3836353, -3.019699, 1, 0.4039216, 0, 1,
-1.502445, 0.1622467, -1.213483, 1, 0.4078431, 0, 1,
-1.489704, 0.6063493, -3.193248, 1, 0.4156863, 0, 1,
-1.473683, -1.270972, -2.551814, 1, 0.4196078, 0, 1,
-1.446832, -0.5268026, -2.448784, 1, 0.427451, 0, 1,
-1.443416, -0.4417914, -2.325902, 1, 0.4313726, 0, 1,
-1.442185, -2.852414, -4.907533, 1, 0.4392157, 0, 1,
-1.441843, 0.554538, -1.227531, 1, 0.4431373, 0, 1,
-1.433144, 1.538824, -0.8562617, 1, 0.4509804, 0, 1,
-1.431465, 0.9318366, -1.641016, 1, 0.454902, 0, 1,
-1.430508, 0.7132847, -1.885934, 1, 0.4627451, 0, 1,
-1.399579, -0.3552912, -2.143543, 1, 0.4666667, 0, 1,
-1.396687, 1.053695, -2.716686, 1, 0.4745098, 0, 1,
-1.394347, 0.5001485, -1.658341, 1, 0.4784314, 0, 1,
-1.393136, -0.4584033, -2.134488, 1, 0.4862745, 0, 1,
-1.386003, -1.812061, -3.252688, 1, 0.4901961, 0, 1,
-1.374871, -0.9131284, -3.215473, 1, 0.4980392, 0, 1,
-1.351468, -0.993096, -0.3380044, 1, 0.5058824, 0, 1,
-1.350196, -2.657249, -1.064055, 1, 0.509804, 0, 1,
-1.349249, 0.5102491, -2.233587, 1, 0.5176471, 0, 1,
-1.347823, -0.7293329, -2.278239, 1, 0.5215687, 0, 1,
-1.34304, -0.05061959, -2.051406, 1, 0.5294118, 0, 1,
-1.340139, 1.344983, -0.9236032, 1, 0.5333334, 0, 1,
-1.339847, 0.8534225, -1.210986, 1, 0.5411765, 0, 1,
-1.33568, 0.9825715, -2.240826, 1, 0.5450981, 0, 1,
-1.326404, 0.08459513, -2.422867, 1, 0.5529412, 0, 1,
-1.321032, 0.5078459, -0.6391239, 1, 0.5568628, 0, 1,
-1.318889, 1.434558, -2.161086, 1, 0.5647059, 0, 1,
-1.314426, 0.2302708, -2.267385, 1, 0.5686275, 0, 1,
-1.31094, 0.3119342, -2.890378, 1, 0.5764706, 0, 1,
-1.308347, 0.8457039, -0.6447721, 1, 0.5803922, 0, 1,
-1.307772, -1.295521, -3.921613, 1, 0.5882353, 0, 1,
-1.300098, 0.1834209, -1.133618, 1, 0.5921569, 0, 1,
-1.298602, 0.6320739, -2.363163, 1, 0.6, 0, 1,
-1.284007, 1.013099, -1.183414, 1, 0.6078432, 0, 1,
-1.264219, 0.5927723, -0.9739941, 1, 0.6117647, 0, 1,
-1.256905, 1.613188, 0.3552574, 1, 0.6196079, 0, 1,
-1.253584, -0.9320849, -4.345451, 1, 0.6235294, 0, 1,
-1.246317, 0.5430888, -0.07330152, 1, 0.6313726, 0, 1,
-1.240528, 0.2907918, -0.4842815, 1, 0.6352941, 0, 1,
-1.240164, -0.8415559, -2.741016, 1, 0.6431373, 0, 1,
-1.23549, -0.3270345, -1.378842, 1, 0.6470588, 0, 1,
-1.234675, 1.245775, -1.48191, 1, 0.654902, 0, 1,
-1.234135, -1.073715, -2.637518, 1, 0.6588235, 0, 1,
-1.23363, -0.7665929, -1.852315, 1, 0.6666667, 0, 1,
-1.208199, 0.321214, -1.784999, 1, 0.6705883, 0, 1,
-1.206644, 0.02306032, -0.9903269, 1, 0.6784314, 0, 1,
-1.199221, 0.1851747, -1.170008, 1, 0.682353, 0, 1,
-1.194063, 0.1967418, -0.8396206, 1, 0.6901961, 0, 1,
-1.172748, 0.1057768, -2.650827, 1, 0.6941177, 0, 1,
-1.162086, 0.7570854, -2.433852, 1, 0.7019608, 0, 1,
-1.161196, 0.1335341, -1.015469, 1, 0.7098039, 0, 1,
-1.158775, -0.1316082, 0.3793866, 1, 0.7137255, 0, 1,
-1.153941, 0.2963692, 0.224951, 1, 0.7215686, 0, 1,
-1.147934, 1.662827, -1.167893, 1, 0.7254902, 0, 1,
-1.143289, -1.31163, -1.905994, 1, 0.7333333, 0, 1,
-1.138759, -2.301926, -2.365095, 1, 0.7372549, 0, 1,
-1.138425, -0.06210207, -2.075011, 1, 0.7450981, 0, 1,
-1.138005, -0.7321061, -3.490144, 1, 0.7490196, 0, 1,
-1.135461, 0.04424817, 0.1816253, 1, 0.7568628, 0, 1,
-1.134574, -1.18246, -2.422426, 1, 0.7607843, 0, 1,
-1.133044, -0.6413442, -3.132751, 1, 0.7686275, 0, 1,
-1.132614, 2.124668, -0.1483979, 1, 0.772549, 0, 1,
-1.123754, -0.2042035, -1.418021, 1, 0.7803922, 0, 1,
-1.12242, 1.580766, 0.5571308, 1, 0.7843137, 0, 1,
-1.11768, 2.22713, -2.322301, 1, 0.7921569, 0, 1,
-1.111703, 1.624574, -0.09852765, 1, 0.7960784, 0, 1,
-1.105693, 0.5423759, -2.150486, 1, 0.8039216, 0, 1,
-1.102165, -0.5375953, -2.181846, 1, 0.8117647, 0, 1,
-1.092037, -0.521075, -3.063383, 1, 0.8156863, 0, 1,
-1.089292, -0.3677538, -1.742067, 1, 0.8235294, 0, 1,
-1.084448, -1.052199, -1.367948, 1, 0.827451, 0, 1,
-1.082069, -0.2918224, -2.725349, 1, 0.8352941, 0, 1,
-1.066443, -0.727499, -3.834605, 1, 0.8392157, 0, 1,
-1.064359, 0.7014263, -2.006796, 1, 0.8470588, 0, 1,
-1.063518, -1.202336, -1.526269, 1, 0.8509804, 0, 1,
-1.063484, 0.5709713, -1.106455, 1, 0.8588235, 0, 1,
-1.058298, 0.2981269, -2.05745, 1, 0.8627451, 0, 1,
-1.058105, -0.5864103, -2.826101, 1, 0.8705882, 0, 1,
-1.056045, 0.6160353, -1.011725, 1, 0.8745098, 0, 1,
-1.052619, 0.4626758, 1.386742, 1, 0.8823529, 0, 1,
-1.050483, -0.371949, -2.797744, 1, 0.8862745, 0, 1,
-1.050098, -0.5422381, -2.749617, 1, 0.8941177, 0, 1,
-1.04513, -0.04403982, -2.254994, 1, 0.8980392, 0, 1,
-1.038526, 0.4649297, -0.4552337, 1, 0.9058824, 0, 1,
-1.019665, 0.474649, -1.191735, 1, 0.9137255, 0, 1,
-1.016115, 0.7323649, 0.04483467, 1, 0.9176471, 0, 1,
-1.015813, 1.683572, -0.5977585, 1, 0.9254902, 0, 1,
-1.015483, 1.223612, 1.425563, 1, 0.9294118, 0, 1,
-0.9914359, 1.310034, -0.04710459, 1, 0.9372549, 0, 1,
-0.9902234, 0.6284606, -1.331175, 1, 0.9411765, 0, 1,
-0.9820086, 0.9095284, -0.655839, 1, 0.9490196, 0, 1,
-0.9779927, 1.014608, -1.55349, 1, 0.9529412, 0, 1,
-0.9726599, 0.5663325, -1.950294, 1, 0.9607843, 0, 1,
-0.9684734, 0.3399641, -1.755833, 1, 0.9647059, 0, 1,
-0.9615744, -1.05433, -2.531311, 1, 0.972549, 0, 1,
-0.956634, 0.7222978, -2.042188, 1, 0.9764706, 0, 1,
-0.9465674, 0.1866377, -1.854927, 1, 0.9843137, 0, 1,
-0.9413353, -0.6733482, -2.602418, 1, 0.9882353, 0, 1,
-0.9302897, -0.8868225, -1.725555, 1, 0.9960784, 0, 1,
-0.9295639, -0.3967548, -1.540805, 0.9960784, 1, 0, 1,
-0.9234635, 1.816737, -1.587753, 0.9921569, 1, 0, 1,
-0.9220668, -0.2309263, -1.267853, 0.9843137, 1, 0, 1,
-0.9217023, -1.197547, -1.96473, 0.9803922, 1, 0, 1,
-0.9213573, 0.7302148, -1.598395, 0.972549, 1, 0, 1,
-0.9210782, -0.8176752, -2.733381, 0.9686275, 1, 0, 1,
-0.9208907, -1.405317, -2.011902, 0.9607843, 1, 0, 1,
-0.9068503, -0.8437493, -1.668677, 0.9568627, 1, 0, 1,
-0.9024261, -1.189909, -0.1083678, 0.9490196, 1, 0, 1,
-0.9016674, 0.4066381, -1.696295, 0.945098, 1, 0, 1,
-0.8909974, -0.3678528, -2.693256, 0.9372549, 1, 0, 1,
-0.8854961, -1.448108, -1.350455, 0.9333333, 1, 0, 1,
-0.8853754, 0.5966144, -3.120582, 0.9254902, 1, 0, 1,
-0.8825543, -0.09079393, -3.067723, 0.9215686, 1, 0, 1,
-0.8767098, 0.2813083, 1.0207, 0.9137255, 1, 0, 1,
-0.8762427, 0.03389053, -2.116709, 0.9098039, 1, 0, 1,
-0.8756526, 1.392931, -1.990774, 0.9019608, 1, 0, 1,
-0.8751546, 1.297278, 0.0005356477, 0.8941177, 1, 0, 1,
-0.8710778, 0.2388142, -1.777508, 0.8901961, 1, 0, 1,
-0.8633272, -1.003685, -3.425913, 0.8823529, 1, 0, 1,
-0.8627823, 1.395273, 0.3054643, 0.8784314, 1, 0, 1,
-0.8594875, 0.5056185, -0.6801117, 0.8705882, 1, 0, 1,
-0.8551396, 1.090638, 0.4885894, 0.8666667, 1, 0, 1,
-0.8510208, -1.572055, -0.4743448, 0.8588235, 1, 0, 1,
-0.8434477, 0.2152819, -1.724057, 0.854902, 1, 0, 1,
-0.8415403, 0.6685087, 0.2002531, 0.8470588, 1, 0, 1,
-0.83971, -0.05539456, -1.03216, 0.8431373, 1, 0, 1,
-0.8362324, -1.900815, -3.570434, 0.8352941, 1, 0, 1,
-0.8345228, -2.036978, -3.817261, 0.8313726, 1, 0, 1,
-0.8294707, 0.9119854, -0.3760427, 0.8235294, 1, 0, 1,
-0.8266689, -0.6635365, -2.640169, 0.8196079, 1, 0, 1,
-0.8236424, 1.863086, 0.6047619, 0.8117647, 1, 0, 1,
-0.8122517, 1.05476, -0.2957174, 0.8078431, 1, 0, 1,
-0.8114905, 1.43093, -2.023422, 0.8, 1, 0, 1,
-0.8092315, -0.5871161, -4.199009, 0.7921569, 1, 0, 1,
-0.804932, -0.4896644, -2.338415, 0.7882353, 1, 0, 1,
-0.8025078, -1.436691, -1.509932, 0.7803922, 1, 0, 1,
-0.8005596, 0.2159836, 0.09964143, 0.7764706, 1, 0, 1,
-0.7952905, -0.07505343, -2.690384, 0.7686275, 1, 0, 1,
-0.7951932, -0.9147348, -2.863935, 0.7647059, 1, 0, 1,
-0.7946991, 0.5632917, -2.933026, 0.7568628, 1, 0, 1,
-0.7919398, 1.518884, 0.0228626, 0.7529412, 1, 0, 1,
-0.7892388, 0.4367726, -0.7350344, 0.7450981, 1, 0, 1,
-0.7866528, -0.08066909, -1.778327, 0.7411765, 1, 0, 1,
-0.7853524, -0.4366041, -2.282982, 0.7333333, 1, 0, 1,
-0.7786832, -0.9141903, -2.109456, 0.7294118, 1, 0, 1,
-0.7762178, -0.4586886, -0.3787753, 0.7215686, 1, 0, 1,
-0.7735229, -0.209151, -2.2321, 0.7176471, 1, 0, 1,
-0.7726682, 0.1035431, -2.813084, 0.7098039, 1, 0, 1,
-0.7679083, 0.5365681, -0.8215602, 0.7058824, 1, 0, 1,
-0.7636321, -0.3846876, -1.673558, 0.6980392, 1, 0, 1,
-0.7622084, -2.155292, -4.056887, 0.6901961, 1, 0, 1,
-0.7587605, 0.9386508, -1.762832, 0.6862745, 1, 0, 1,
-0.7577366, 2.510803, -1.454196, 0.6784314, 1, 0, 1,
-0.75226, 0.002209026, -1.475985, 0.6745098, 1, 0, 1,
-0.7518689, -1.885089, -2.067636, 0.6666667, 1, 0, 1,
-0.751355, -0.8528985, -2.57908, 0.6627451, 1, 0, 1,
-0.750272, -1.823724, -2.8359, 0.654902, 1, 0, 1,
-0.7473686, -2.006696, -3.664302, 0.6509804, 1, 0, 1,
-0.7466878, 0.4824407, -0.05820033, 0.6431373, 1, 0, 1,
-0.7447655, -0.8194075, -1.860329, 0.6392157, 1, 0, 1,
-0.7399747, 2.610664, -0.06805407, 0.6313726, 1, 0, 1,
-0.7391773, -0.8653762, -2.984222, 0.627451, 1, 0, 1,
-0.7346784, 0.5154437, 0.7331602, 0.6196079, 1, 0, 1,
-0.7323831, 0.4522582, -2.001085, 0.6156863, 1, 0, 1,
-0.7318612, -1.140467, -4.214587, 0.6078432, 1, 0, 1,
-0.7266111, 0.2677746, -1.555081, 0.6039216, 1, 0, 1,
-0.7254267, -1.007327, -3.628195, 0.5960785, 1, 0, 1,
-0.7181669, -0.08851491, -0.1375176, 0.5882353, 1, 0, 1,
-0.716718, 0.9624149, -0.7235391, 0.5843138, 1, 0, 1,
-0.7096987, 0.4759423, -0.2703448, 0.5764706, 1, 0, 1,
-0.7076184, 0.04547391, -2.742618, 0.572549, 1, 0, 1,
-0.7060858, -0.1055982, -1.37383, 0.5647059, 1, 0, 1,
-0.6999374, -0.7708198, -1.998767, 0.5607843, 1, 0, 1,
-0.6992382, -1.024131, -2.622601, 0.5529412, 1, 0, 1,
-0.6978617, 1.641146, 0.3282023, 0.5490196, 1, 0, 1,
-0.6978179, -0.7709506, -2.34544, 0.5411765, 1, 0, 1,
-0.6977107, -2.857977, -3.46258, 0.5372549, 1, 0, 1,
-0.6974779, 1.272054, 0.1472778, 0.5294118, 1, 0, 1,
-0.6914645, 1.48627, -0.2095756, 0.5254902, 1, 0, 1,
-0.6913736, -2.145865, -2.87131, 0.5176471, 1, 0, 1,
-0.684929, 0.0315569, -0.6702983, 0.5137255, 1, 0, 1,
-0.6813594, 0.4525392, -2.521245, 0.5058824, 1, 0, 1,
-0.6749156, 1.597501, 0.3596329, 0.5019608, 1, 0, 1,
-0.6734271, 0.1954238, -2.542239, 0.4941176, 1, 0, 1,
-0.6696983, 0.5072544, 0.7703252, 0.4862745, 1, 0, 1,
-0.6676123, -0.8953832, -2.789572, 0.4823529, 1, 0, 1,
-0.6657714, 0.1661295, -2.202618, 0.4745098, 1, 0, 1,
-0.6638851, -1.489316, -2.381374, 0.4705882, 1, 0, 1,
-0.6541352, -0.4944388, -2.905556, 0.4627451, 1, 0, 1,
-0.6515282, -0.4878031, -4.703284, 0.4588235, 1, 0, 1,
-0.650435, -1.776893, -2.391257, 0.4509804, 1, 0, 1,
-0.6499358, 1.163149, -1.416801, 0.4470588, 1, 0, 1,
-0.6432995, -0.708777, -1.346137, 0.4392157, 1, 0, 1,
-0.6371459, -0.3720321, -3.169445, 0.4352941, 1, 0, 1,
-0.6358686, 0.4400363, -2.346591, 0.427451, 1, 0, 1,
-0.6348333, 0.08836977, -1.974177, 0.4235294, 1, 0, 1,
-0.6325505, 0.186042, -2.132663, 0.4156863, 1, 0, 1,
-0.6302171, -1.056176, -2.665695, 0.4117647, 1, 0, 1,
-0.6278515, 0.3751369, -0.3403994, 0.4039216, 1, 0, 1,
-0.6147225, -0.2305182, -1.370101, 0.3960784, 1, 0, 1,
-0.6128143, 1.586167, -1.977414, 0.3921569, 1, 0, 1,
-0.6122727, 1.330976, 1.518005, 0.3843137, 1, 0, 1,
-0.6094044, 1.154169, 0.8294026, 0.3803922, 1, 0, 1,
-0.6092667, -0.3567536, -1.830653, 0.372549, 1, 0, 1,
-0.6037239, -1.087063, -4.172149, 0.3686275, 1, 0, 1,
-0.6032806, -0.6450272, -2.099217, 0.3607843, 1, 0, 1,
-0.6016602, -0.0931809, -0.1462078, 0.3568628, 1, 0, 1,
-0.5958084, -0.2049648, -2.992611, 0.3490196, 1, 0, 1,
-0.5952628, -0.6089554, -2.715048, 0.345098, 1, 0, 1,
-0.5923856, -1.047024, -2.74736, 0.3372549, 1, 0, 1,
-0.5906615, 0.2220261, -1.580905, 0.3333333, 1, 0, 1,
-0.5892907, -1.802307, -1.756495, 0.3254902, 1, 0, 1,
-0.5823998, -0.4344006, -1.858451, 0.3215686, 1, 0, 1,
-0.5765703, 0.5389324, 0.8502679, 0.3137255, 1, 0, 1,
-0.5733277, 1.832226, 0.0283965, 0.3098039, 1, 0, 1,
-0.568383, 0.4091965, -1.196839, 0.3019608, 1, 0, 1,
-0.5676855, 0.9021156, -0.9216923, 0.2941177, 1, 0, 1,
-0.5658761, 0.6250528, 0.5242889, 0.2901961, 1, 0, 1,
-0.5624439, -0.3588345, -0.3528609, 0.282353, 1, 0, 1,
-0.5608932, -0.5665633, -1.994114, 0.2784314, 1, 0, 1,
-0.5575985, -0.3653908, -3.921819, 0.2705882, 1, 0, 1,
-0.5546244, 0.4346382, -0.6413189, 0.2666667, 1, 0, 1,
-0.5491187, 1.527359, -1.951171, 0.2588235, 1, 0, 1,
-0.5465414, 2.053388, -0.267691, 0.254902, 1, 0, 1,
-0.5465063, -0.6202587, -2.901345, 0.2470588, 1, 0, 1,
-0.5462145, -0.3950357, -4.142936, 0.2431373, 1, 0, 1,
-0.5447777, 0.1976517, -1.174335, 0.2352941, 1, 0, 1,
-0.5444791, -1.497487, -3.066819, 0.2313726, 1, 0, 1,
-0.5429878, 0.3647081, -1.35534, 0.2235294, 1, 0, 1,
-0.54259, -2.34312, -1.237497, 0.2196078, 1, 0, 1,
-0.5422319, 0.7053787, 0.5701806, 0.2117647, 1, 0, 1,
-0.5421774, 1.15016, -0.756228, 0.2078431, 1, 0, 1,
-0.540476, 0.7526608, -1.15095, 0.2, 1, 0, 1,
-0.5384137, 1.163586, 0.2960894, 0.1921569, 1, 0, 1,
-0.5326528, 0.7692487, -0.2185931, 0.1882353, 1, 0, 1,
-0.5323129, -1.67746, -3.081854, 0.1803922, 1, 0, 1,
-0.5317122, 0.6694746, -0.2477438, 0.1764706, 1, 0, 1,
-0.5309758, -0.4396213, -2.867091, 0.1686275, 1, 0, 1,
-0.5285835, -0.1090976, -1.343675, 0.1647059, 1, 0, 1,
-0.5271191, -0.02569816, -0.6811783, 0.1568628, 1, 0, 1,
-0.5232403, -0.1703951, -2.22407, 0.1529412, 1, 0, 1,
-0.5193352, 1.700955, -0.07110906, 0.145098, 1, 0, 1,
-0.5192072, -0.8832839, -2.809482, 0.1411765, 1, 0, 1,
-0.5134555, 0.7356598, -0.7501868, 0.1333333, 1, 0, 1,
-0.5078903, -0.1035442, -2.643121, 0.1294118, 1, 0, 1,
-0.5010014, -0.6166109, -2.064144, 0.1215686, 1, 0, 1,
-0.4997594, -0.8677795, -1.948699, 0.1176471, 1, 0, 1,
-0.4981739, 0.1140135, -0.889788, 0.1098039, 1, 0, 1,
-0.4918605, -0.556066, -2.93141, 0.1058824, 1, 0, 1,
-0.488538, -1.787748, -0.2474144, 0.09803922, 1, 0, 1,
-0.4828814, 0.7545097, 0.00887249, 0.09019608, 1, 0, 1,
-0.4788503, -1.81076, -1.324552, 0.08627451, 1, 0, 1,
-0.4739971, -0.3003957, -2.169902, 0.07843138, 1, 0, 1,
-0.4731465, -0.3441206, -3.543538, 0.07450981, 1, 0, 1,
-0.4730098, 0.2034964, 0.1863156, 0.06666667, 1, 0, 1,
-0.4706714, -0.07866465, -2.142908, 0.0627451, 1, 0, 1,
-0.4659061, -0.6567492, -1.477167, 0.05490196, 1, 0, 1,
-0.4643447, 0.1872304, -1.000484, 0.05098039, 1, 0, 1,
-0.4640157, -0.5519786, -3.659343, 0.04313726, 1, 0, 1,
-0.4637612, 0.7585631, 0.4366681, 0.03921569, 1, 0, 1,
-0.4635222, -0.8295278, -2.26126, 0.03137255, 1, 0, 1,
-0.4626456, 0.09202442, -3.469145, 0.02745098, 1, 0, 1,
-0.4618555, -0.7069238, -2.333237, 0.01960784, 1, 0, 1,
-0.461263, -0.5264897, -4.811809, 0.01568628, 1, 0, 1,
-0.4599168, -0.6526949, -1.245499, 0.007843138, 1, 0, 1,
-0.4577177, 0.6794409, -2.203653, 0.003921569, 1, 0, 1,
-0.4538786, -0.2374893, -2.866011, 0, 1, 0.003921569, 1,
-0.4476291, 0.4438209, -0.2244821, 0, 1, 0.01176471, 1,
-0.4432039, -0.4638341, -1.173173, 0, 1, 0.01568628, 1,
-0.442452, -0.8608229, -1.000914, 0, 1, 0.02352941, 1,
-0.4414302, 2.193957, -1.061192, 0, 1, 0.02745098, 1,
-0.4409762, -0.6402511, -3.482944, 0, 1, 0.03529412, 1,
-0.4311596, 0.2844093, -0.1888428, 0, 1, 0.03921569, 1,
-0.4231711, 0.04664966, -1.666315, 0, 1, 0.04705882, 1,
-0.4213691, 0.4026037, -1.182306, 0, 1, 0.05098039, 1,
-0.41993, -1.192999, -2.726459, 0, 1, 0.05882353, 1,
-0.4177142, 0.09928151, -0.8469452, 0, 1, 0.0627451, 1,
-0.4147703, 0.8491186, 0.3902021, 0, 1, 0.07058824, 1,
-0.4088509, 2.39536, 1.866059, 0, 1, 0.07450981, 1,
-0.4079271, -0.00576344, -2.968263, 0, 1, 0.08235294, 1,
-0.405878, 0.7366499, -2.240716, 0, 1, 0.08627451, 1,
-0.404107, 0.1328853, 0.1869274, 0, 1, 0.09411765, 1,
-0.4011295, -0.4801875, -1.48256, 0, 1, 0.1019608, 1,
-0.3888092, -0.9467878, -0.606905, 0, 1, 0.1058824, 1,
-0.3880675, -0.8682193, -1.977477, 0, 1, 0.1137255, 1,
-0.3851911, 1.023479, 0.4746533, 0, 1, 0.1176471, 1,
-0.3845054, -0.4580884, -2.504504, 0, 1, 0.1254902, 1,
-0.3822924, -0.7912518, -3.81242, 0, 1, 0.1294118, 1,
-0.3819772, 1.599959, -1.33223, 0, 1, 0.1372549, 1,
-0.3802618, 0.6256979, 1.280141, 0, 1, 0.1411765, 1,
-0.3775246, -0.5374959, -1.974536, 0, 1, 0.1490196, 1,
-0.3732657, 0.7695059, -0.7111782, 0, 1, 0.1529412, 1,
-0.3685643, -0.1611497, -2.641073, 0, 1, 0.1607843, 1,
-0.364129, -0.1162679, -1.74771, 0, 1, 0.1647059, 1,
-0.3614339, -0.4370068, -0.8711849, 0, 1, 0.172549, 1,
-0.3613718, -1.04267, -2.761426, 0, 1, 0.1764706, 1,
-0.3590572, 0.8280471, -0.6476389, 0, 1, 0.1843137, 1,
-0.3559034, 1.384539, 0.4677736, 0, 1, 0.1882353, 1,
-0.3486632, -1.113519, -1.101452, 0, 1, 0.1960784, 1,
-0.3481984, 0.5340838, 0.7220341, 0, 1, 0.2039216, 1,
-0.3460965, -0.4246469, -2.398375, 0, 1, 0.2078431, 1,
-0.3453024, 0.5323671, -2.672762, 0, 1, 0.2156863, 1,
-0.3431429, -0.07829294, -0.3899175, 0, 1, 0.2196078, 1,
-0.3419716, 1.432273, -0.7607852, 0, 1, 0.227451, 1,
-0.3412636, -0.9794012, -3.691693, 0, 1, 0.2313726, 1,
-0.3306655, -1.292145, -3.175447, 0, 1, 0.2392157, 1,
-0.3281689, 0.856991, -0.4464863, 0, 1, 0.2431373, 1,
-0.3277202, -0.6428032, -1.983651, 0, 1, 0.2509804, 1,
-0.3235588, 1.083558, -1.726284, 0, 1, 0.254902, 1,
-0.3188441, 0.8918937, -0.3465886, 0, 1, 0.2627451, 1,
-0.3175658, -0.451328, -2.658669, 0, 1, 0.2666667, 1,
-0.315962, -1.090636, -2.337135, 0, 1, 0.2745098, 1,
-0.3101944, 1.667871, 1.790674, 0, 1, 0.2784314, 1,
-0.2984721, 0.08211271, -3.620983, 0, 1, 0.2862745, 1,
-0.2929184, 0.455913, -0.7149795, 0, 1, 0.2901961, 1,
-0.2904334, 0.1748736, -0.7299743, 0, 1, 0.2980392, 1,
-0.2887037, -0.2961848, -1.792096, 0, 1, 0.3058824, 1,
-0.2881517, 0.1437955, -1.027903, 0, 1, 0.3098039, 1,
-0.2864315, 0.3119223, -1.228327, 0, 1, 0.3176471, 1,
-0.2848116, -0.4020852, -1.792099, 0, 1, 0.3215686, 1,
-0.2842521, 0.3114612, 0.8383046, 0, 1, 0.3294118, 1,
-0.2836748, 0.1326917, 0.1485316, 0, 1, 0.3333333, 1,
-0.2824477, 0.2206704, -0.6185986, 0, 1, 0.3411765, 1,
-0.2768181, 1.14332, -0.8258278, 0, 1, 0.345098, 1,
-0.2733737, -0.02506779, -1.875069, 0, 1, 0.3529412, 1,
-0.2731079, 1.398227, 0.6683979, 0, 1, 0.3568628, 1,
-0.2689252, -1.924429, -1.380502, 0, 1, 0.3647059, 1,
-0.2670816, -1.201699, -0.8862324, 0, 1, 0.3686275, 1,
-0.2639383, -2.614897, -4.326804, 0, 1, 0.3764706, 1,
-0.2584657, 0.8053814, -1.179927, 0, 1, 0.3803922, 1,
-0.2572488, 0.1247642, -2.218579, 0, 1, 0.3882353, 1,
-0.2553594, -0.01662394, -1.005796, 0, 1, 0.3921569, 1,
-0.2529809, 0.3313724, 0.4347849, 0, 1, 0.4, 1,
-0.2526274, -0.5848027, -2.9938, 0, 1, 0.4078431, 1,
-0.2517897, 0.02389763, -1.061449, 0, 1, 0.4117647, 1,
-0.2473019, 0.4908406, 0.1547748, 0, 1, 0.4196078, 1,
-0.2468506, 1.353819, -0.6516215, 0, 1, 0.4235294, 1,
-0.2465729, -0.2416626, -1.134554, 0, 1, 0.4313726, 1,
-0.2459874, -1.66683, -2.587823, 0, 1, 0.4352941, 1,
-0.2444355, -0.5680978, -1.728027, 0, 1, 0.4431373, 1,
-0.2440852, -0.3519837, -1.626728, 0, 1, 0.4470588, 1,
-0.2420915, -0.4547037, -3.924391, 0, 1, 0.454902, 1,
-0.2417534, -0.3000865, -0.5883198, 0, 1, 0.4588235, 1,
-0.2413397, 0.4803773, -0.7707804, 0, 1, 0.4666667, 1,
-0.2402376, -0.7857792, -3.835775, 0, 1, 0.4705882, 1,
-0.2381654, 1.334663, -0.2997927, 0, 1, 0.4784314, 1,
-0.2374829, -0.4888835, -2.514673, 0, 1, 0.4823529, 1,
-0.2346241, 0.9505553, 0.4590252, 0, 1, 0.4901961, 1,
-0.2339442, 1.729533, 0.1960028, 0, 1, 0.4941176, 1,
-0.2326174, -0.1293485, -2.032482, 0, 1, 0.5019608, 1,
-0.2302105, 0.7822231, 1.008107, 0, 1, 0.509804, 1,
-0.2275312, -1.073465, -1.557635, 0, 1, 0.5137255, 1,
-0.2215837, 0.4125646, -0.5599942, 0, 1, 0.5215687, 1,
-0.2189843, -0.2402729, -1.389755, 0, 1, 0.5254902, 1,
-0.2174221, 0.6873672, 1.429656, 0, 1, 0.5333334, 1,
-0.2158186, -0.1356957, -3.133808, 0, 1, 0.5372549, 1,
-0.2095814, 0.5109752, -0.03236627, 0, 1, 0.5450981, 1,
-0.2075139, 0.1937358, 1.296913, 0, 1, 0.5490196, 1,
-0.2073594, 0.05634713, -0.6781635, 0, 1, 0.5568628, 1,
-0.2069282, 1.904824, -0.1531195, 0, 1, 0.5607843, 1,
-0.2066929, -0.1680613, -2.85182, 0, 1, 0.5686275, 1,
-0.199161, 0.3807008, -1.940884, 0, 1, 0.572549, 1,
-0.1988441, -1.423663, -3.029754, 0, 1, 0.5803922, 1,
-0.1952305, -1.121218, -1.575727, 0, 1, 0.5843138, 1,
-0.1876031, 0.4795606, -0.7275453, 0, 1, 0.5921569, 1,
-0.1861556, -0.4142339, -2.415664, 0, 1, 0.5960785, 1,
-0.1841146, -0.5804068, -4.889968, 0, 1, 0.6039216, 1,
-0.1839952, -0.4218125, -3.676694, 0, 1, 0.6117647, 1,
-0.183891, -0.5998305, -2.485743, 0, 1, 0.6156863, 1,
-0.1835269, 0.5896533, -2.416378, 0, 1, 0.6235294, 1,
-0.1820914, -1.447961, -3.461338, 0, 1, 0.627451, 1,
-0.1810211, 1.787539, 0.328384, 0, 1, 0.6352941, 1,
-0.1801118, 0.4687974, -1.100821, 0, 1, 0.6392157, 1,
-0.1722274, -0.5280806, -3.608101, 0, 1, 0.6470588, 1,
-0.1664759, -1.745522, -0.08250999, 0, 1, 0.6509804, 1,
-0.1651213, 0.5499862, -0.8007363, 0, 1, 0.6588235, 1,
-0.1617893, 0.1471128, 1.501047, 0, 1, 0.6627451, 1,
-0.161783, -0.02795042, -2.066259, 0, 1, 0.6705883, 1,
-0.1595433, 1.049556, -0.4701934, 0, 1, 0.6745098, 1,
-0.1591875, 1.890107, -0.03277549, 0, 1, 0.682353, 1,
-0.1584115, -0.5815362, -2.923146, 0, 1, 0.6862745, 1,
-0.1582349, -1.791924, -1.270434, 0, 1, 0.6941177, 1,
-0.1580548, 0.02589934, -1.848447, 0, 1, 0.7019608, 1,
-0.1498465, 1.783686, -1.020131, 0, 1, 0.7058824, 1,
-0.1452905, -0.2898802, -2.323606, 0, 1, 0.7137255, 1,
-0.1437436, 0.2681113, -1.150132, 0, 1, 0.7176471, 1,
-0.1414229, -0.8869872, -2.940727, 0, 1, 0.7254902, 1,
-0.1394396, -0.2992292, -1.924478, 0, 1, 0.7294118, 1,
-0.1370948, -0.04123412, -3.004748, 0, 1, 0.7372549, 1,
-0.1367334, -0.2365912, -2.507212, 0, 1, 0.7411765, 1,
-0.1359349, 0.6484054, 1.487862, 0, 1, 0.7490196, 1,
-0.1339933, 1.067168, -0.3247618, 0, 1, 0.7529412, 1,
-0.1328682, 0.9055619, -1.897708, 0, 1, 0.7607843, 1,
-0.1300186, -1.91107, -4.284809, 0, 1, 0.7647059, 1,
-0.1295855, -0.7411013, -3.854355, 0, 1, 0.772549, 1,
-0.1293027, -1.401742, -1.446045, 0, 1, 0.7764706, 1,
-0.1285694, 2.310435, -0.5669507, 0, 1, 0.7843137, 1,
-0.1261929, -2.100839, -2.416545, 0, 1, 0.7882353, 1,
-0.1243751, -0.6706648, -3.661318, 0, 1, 0.7960784, 1,
-0.1212569, 0.09640569, -1.432026, 0, 1, 0.8039216, 1,
-0.1181792, -1.27559, -3.795589, 0, 1, 0.8078431, 1,
-0.1153305, 1.933602, 1.917605, 0, 1, 0.8156863, 1,
-0.1148738, -0.1555142, -2.990442, 0, 1, 0.8196079, 1,
-0.1129541, -0.5511822, -1.845568, 0, 1, 0.827451, 1,
-0.1098889, 0.1867372, -1.106632, 0, 1, 0.8313726, 1,
-0.1097314, 1.142551, 1.627397, 0, 1, 0.8392157, 1,
-0.1091911, -0.5279389, -3.810173, 0, 1, 0.8431373, 1,
-0.1081347, -0.6980645, -3.359552, 0, 1, 0.8509804, 1,
-0.0996924, 1.661031, -0.8736917, 0, 1, 0.854902, 1,
-0.09810962, -0.4099363, -4.09866, 0, 1, 0.8627451, 1,
-0.09324226, 0.02690549, -0.8829126, 0, 1, 0.8666667, 1,
-0.09167179, 0.572517, -0.1475065, 0, 1, 0.8745098, 1,
-0.08844861, 0.7105255, -0.8967775, 0, 1, 0.8784314, 1,
-0.08807709, -0.7345558, -3.063479, 0, 1, 0.8862745, 1,
-0.08799613, 0.766531, -1.773461, 0, 1, 0.8901961, 1,
-0.08023775, 0.4440491, 0.03294461, 0, 1, 0.8980392, 1,
-0.07961287, -0.1924096, -2.891195, 0, 1, 0.9058824, 1,
-0.07392089, 0.8493652, 0.187848, 0, 1, 0.9098039, 1,
-0.07323284, 2.551141, -0.9778074, 0, 1, 0.9176471, 1,
-0.07303927, -0.04316759, -2.582115, 0, 1, 0.9215686, 1,
-0.07206452, -0.5288593, -2.99366, 0, 1, 0.9294118, 1,
-0.06896316, 1.170164, 0.05176529, 0, 1, 0.9333333, 1,
-0.06519658, -0.5012099, -4.059581, 0, 1, 0.9411765, 1,
-0.06270096, 0.1291908, -0.1677952, 0, 1, 0.945098, 1,
-0.06042954, -0.9833239, -2.59251, 0, 1, 0.9529412, 1,
-0.05781276, 0.2877996, -1.463133, 0, 1, 0.9568627, 1,
-0.05375271, -0.1084754, -2.388281, 0, 1, 0.9647059, 1,
-0.05081993, 0.7291014, -0.1202403, 0, 1, 0.9686275, 1,
-0.04707012, 0.5043669, 1.726469, 0, 1, 0.9764706, 1,
-0.04561212, 1.307993, 1.030756, 0, 1, 0.9803922, 1,
-0.0399515, -0.2490417, -4.50724, 0, 1, 0.9882353, 1,
-0.03497864, 0.9226086, -0.1706772, 0, 1, 0.9921569, 1,
-0.03254375, 1.303535, -0.2064716, 0, 1, 1, 1,
-0.03006752, 1.234766, 0.8832589, 0, 0.9921569, 1, 1,
-0.02892661, 1.106688, -0.07592185, 0, 0.9882353, 1, 1,
-0.0152302, -2.260702, -3.097994, 0, 0.9803922, 1, 1,
-0.01430739, 0.02870123, -1.944757, 0, 0.9764706, 1, 1,
-0.006582309, 1.761943, -0.06290076, 0, 0.9686275, 1, 1,
-0.005337084, -0.7354178, -2.02727, 0, 0.9647059, 1, 1,
-0.002246102, 0.2715801, -0.2001072, 0, 0.9568627, 1, 1,
0.002196417, 0.8608906, 1.019529, 0, 0.9529412, 1, 1,
0.00256763, -0.7911968, 3.668698, 0, 0.945098, 1, 1,
0.007870745, 0.4395534, -1.806214, 0, 0.9411765, 1, 1,
0.008490457, -0.1477179, 3.297897, 0, 0.9333333, 1, 1,
0.008790699, 0.8314471, -0.1035802, 0, 0.9294118, 1, 1,
0.01328287, -0.5912911, 3.151034, 0, 0.9215686, 1, 1,
0.01742061, -0.003868644, 0.3827162, 0, 0.9176471, 1, 1,
0.01752423, -1.515274, 5.432495, 0, 0.9098039, 1, 1,
0.01763512, -0.001334107, 2.016879, 0, 0.9058824, 1, 1,
0.01900815, 0.6342874, 0.8968861, 0, 0.8980392, 1, 1,
0.02028999, -0.1962767, 3.729416, 0, 0.8901961, 1, 1,
0.02037159, -0.7795055, 2.421838, 0, 0.8862745, 1, 1,
0.02540805, 0.4315763, 1.225946, 0, 0.8784314, 1, 1,
0.02725154, 0.1075111, 0.3448633, 0, 0.8745098, 1, 1,
0.02769137, 0.2619194, -0.401482, 0, 0.8666667, 1, 1,
0.03026847, 0.6143987, 1.335721, 0, 0.8627451, 1, 1,
0.03177012, 0.9783337, -1.112354, 0, 0.854902, 1, 1,
0.03434843, -0.3912509, 4.644886, 0, 0.8509804, 1, 1,
0.03751582, 0.5204382, 0.8069551, 0, 0.8431373, 1, 1,
0.03954447, 0.69816, -0.2299489, 0, 0.8392157, 1, 1,
0.05310142, 0.7295786, 2.037393, 0, 0.8313726, 1, 1,
0.05512993, 0.2916109, 0.9675743, 0, 0.827451, 1, 1,
0.05755394, 0.7201811, -0.624324, 0, 0.8196079, 1, 1,
0.05766824, 0.7448085, 1.15374, 0, 0.8156863, 1, 1,
0.05823752, 1.288491, -0.2800814, 0, 0.8078431, 1, 1,
0.06147025, 0.3204221, 0.4211481, 0, 0.8039216, 1, 1,
0.06339981, 0.7319258, -0.4048882, 0, 0.7960784, 1, 1,
0.07316539, 0.2796582, 0.8801498, 0, 0.7882353, 1, 1,
0.07324602, 0.4245491, 1.376184, 0, 0.7843137, 1, 1,
0.0736187, 0.3603482, -0.1665908, 0, 0.7764706, 1, 1,
0.08092891, 1.743394, 0.1796579, 0, 0.772549, 1, 1,
0.08303892, -0.6526333, 2.007159, 0, 0.7647059, 1, 1,
0.08599943, -0.1679129, 1.490657, 0, 0.7607843, 1, 1,
0.09847029, 0.376283, 1.645983, 0, 0.7529412, 1, 1,
0.09943662, -0.4969698, 3.299832, 0, 0.7490196, 1, 1,
0.09955991, 0.4704719, 1.103016, 0, 0.7411765, 1, 1,
0.100013, 0.3068879, 0.2761424, 0, 0.7372549, 1, 1,
0.1021182, -2.029213, 4.108024, 0, 0.7294118, 1, 1,
0.1182886, -0.6576495, 3.259064, 0, 0.7254902, 1, 1,
0.1274285, -1.453762, 4.59402, 0, 0.7176471, 1, 1,
0.1287948, -0.5173786, 1.925397, 0, 0.7137255, 1, 1,
0.1311037, 1.265697, -2.169351, 0, 0.7058824, 1, 1,
0.1317374, -0.4659686, 3.346699, 0, 0.6980392, 1, 1,
0.1319943, -2.227638, 2.799844, 0, 0.6941177, 1, 1,
0.1374312, -1.888491, 1.669446, 0, 0.6862745, 1, 1,
0.1375688, 1.539225, -0.2243616, 0, 0.682353, 1, 1,
0.1433519, 1.495105, 0.2143762, 0, 0.6745098, 1, 1,
0.1451158, -0.122124, 2.228095, 0, 0.6705883, 1, 1,
0.1453648, -0.8733687, 2.123877, 0, 0.6627451, 1, 1,
0.1548021, -0.3803619, 0.94196, 0, 0.6588235, 1, 1,
0.1598745, 0.1559642, -0.03884188, 0, 0.6509804, 1, 1,
0.1613027, 0.946894, -0.08174518, 0, 0.6470588, 1, 1,
0.1633746, 0.9794315, 0.4588158, 0, 0.6392157, 1, 1,
0.1648144, 2.394343, -1.572957, 0, 0.6352941, 1, 1,
0.1674994, 0.05144243, 0.775919, 0, 0.627451, 1, 1,
0.167713, -0.253899, 3.192962, 0, 0.6235294, 1, 1,
0.1695693, 0.7284977, -1.488467, 0, 0.6156863, 1, 1,
0.1705189, 0.3969404, 1.819198, 0, 0.6117647, 1, 1,
0.1707021, -1.475507, 4.096224, 0, 0.6039216, 1, 1,
0.1707668, 1.680702, 0.9375044, 0, 0.5960785, 1, 1,
0.1716875, 0.9225668, 0.2690002, 0, 0.5921569, 1, 1,
0.1724603, -1.000345, 2.559799, 0, 0.5843138, 1, 1,
0.1745463, 1.642059, -0.2749977, 0, 0.5803922, 1, 1,
0.1794252, -1.429531, 2.368408, 0, 0.572549, 1, 1,
0.1824968, 1.31514, -0.2586952, 0, 0.5686275, 1, 1,
0.1856086, 0.4463807, -1.265613, 0, 0.5607843, 1, 1,
0.1876519, -0.008520642, 1.841337, 0, 0.5568628, 1, 1,
0.1897716, -0.09997957, 1.702738, 0, 0.5490196, 1, 1,
0.1902193, 0.7544475, 0.8308328, 0, 0.5450981, 1, 1,
0.1927894, -0.263333, 2.379195, 0, 0.5372549, 1, 1,
0.1936448, -0.1904256, -0.6366735, 0, 0.5333334, 1, 1,
0.197068, 0.1050628, 1.026867, 0, 0.5254902, 1, 1,
0.1987309, 0.08462533, 0.6976287, 0, 0.5215687, 1, 1,
0.1998463, 0.3369594, 0.6287733, 0, 0.5137255, 1, 1,
0.2024351, 2.022526, -0.2616429, 0, 0.509804, 1, 1,
0.2137649, -0.9230799, 0.8286632, 0, 0.5019608, 1, 1,
0.2149173, 0.02528186, 1.461654, 0, 0.4941176, 1, 1,
0.2164049, -0.656088, 3.080912, 0, 0.4901961, 1, 1,
0.2181097, -0.05609199, 2.685131, 0, 0.4823529, 1, 1,
0.219251, -2.083638, 1.804801, 0, 0.4784314, 1, 1,
0.2201685, -0.4647915, 2.852564, 0, 0.4705882, 1, 1,
0.2241918, 0.5478987, -1.00232, 0, 0.4666667, 1, 1,
0.2281905, 2.063776, 0.2893929, 0, 0.4588235, 1, 1,
0.2285119, -1.22538, 3.371927, 0, 0.454902, 1, 1,
0.2297874, 0.4076496, 1.069569, 0, 0.4470588, 1, 1,
0.234471, 0.3354733, 0.7023872, 0, 0.4431373, 1, 1,
0.2357213, 2.654985, 1.818133, 0, 0.4352941, 1, 1,
0.2385396, -0.2720598, 1.659913, 0, 0.4313726, 1, 1,
0.2420786, 0.139507, 0.3720658, 0, 0.4235294, 1, 1,
0.2427285, -1.11927, 3.554938, 0, 0.4196078, 1, 1,
0.2428068, -0.4254423, 2.472562, 0, 0.4117647, 1, 1,
0.2438896, 0.8388385, 0.4729195, 0, 0.4078431, 1, 1,
0.2453604, -0.2380932, 2.606518, 0, 0.4, 1, 1,
0.2500051, -0.3913957, 2.769929, 0, 0.3921569, 1, 1,
0.2524067, 1.101659, -1.389014, 0, 0.3882353, 1, 1,
0.2532313, -0.2286553, 2.108875, 0, 0.3803922, 1, 1,
0.2548815, -0.6866648, 2.737999, 0, 0.3764706, 1, 1,
0.2552684, 0.4670123, 0.5514064, 0, 0.3686275, 1, 1,
0.2559307, 0.6671261, 1.315566, 0, 0.3647059, 1, 1,
0.2568801, -0.7460839, 4.487064, 0, 0.3568628, 1, 1,
0.2592536, -0.8478487, 2.434366, 0, 0.3529412, 1, 1,
0.2677703, -0.1564208, 2.03475, 0, 0.345098, 1, 1,
0.267995, -0.08140846, 1.106942, 0, 0.3411765, 1, 1,
0.2702022, -0.4071822, 1.592692, 0, 0.3333333, 1, 1,
0.2703626, 0.03775915, 0.9096277, 0, 0.3294118, 1, 1,
0.2719415, -0.0668383, 1.029307, 0, 0.3215686, 1, 1,
0.2732567, 0.4832993, -0.6322836, 0, 0.3176471, 1, 1,
0.2745304, -0.1868144, 1.858582, 0, 0.3098039, 1, 1,
0.2806626, -2.556767, 1.547194, 0, 0.3058824, 1, 1,
0.2834813, 0.005661774, 1.157585, 0, 0.2980392, 1, 1,
0.2864514, 0.04803075, 2.571296, 0, 0.2901961, 1, 1,
0.2866547, -0.3468883, 2.250858, 0, 0.2862745, 1, 1,
0.2882266, 0.209751, 0.1517751, 0, 0.2784314, 1, 1,
0.2891476, -0.2170353, 2.670503, 0, 0.2745098, 1, 1,
0.2937879, -1.29503, 2.650694, 0, 0.2666667, 1, 1,
0.2970228, 0.4665363, 0.09445878, 0, 0.2627451, 1, 1,
0.2983535, -0.7229324, 3.402765, 0, 0.254902, 1, 1,
0.2984875, 1.96671, 1.049783, 0, 0.2509804, 1, 1,
0.2997539, -0.06327255, 2.633184, 0, 0.2431373, 1, 1,
0.3014328, 0.307022, 2.304856, 0, 0.2392157, 1, 1,
0.3036655, -0.7064808, 2.53743, 0, 0.2313726, 1, 1,
0.309727, -1.039403, 2.249954, 0, 0.227451, 1, 1,
0.3178665, -0.5091508, 2.141962, 0, 0.2196078, 1, 1,
0.3187522, 0.1517422, 1.92361, 0, 0.2156863, 1, 1,
0.3199942, -0.6209762, 5.756622, 0, 0.2078431, 1, 1,
0.3200019, -0.9721348, 3.037991, 0, 0.2039216, 1, 1,
0.3212825, 0.9989501, -0.001934065, 0, 0.1960784, 1, 1,
0.3231725, -0.01639584, 0.4088911, 0, 0.1882353, 1, 1,
0.3240507, 1.064588, 1.219597, 0, 0.1843137, 1, 1,
0.3287373, -0.05581468, 2.210029, 0, 0.1764706, 1, 1,
0.3311558, -0.2503592, 2.02951, 0, 0.172549, 1, 1,
0.3348721, 1.266077, 2.338172, 0, 0.1647059, 1, 1,
0.3350462, 0.353681, 1.682416, 0, 0.1607843, 1, 1,
0.3411, 1.394086, 0.824769, 0, 0.1529412, 1, 1,
0.3458333, 0.4179796, 1.949298, 0, 0.1490196, 1, 1,
0.3474935, 2.319506, 0.2513292, 0, 0.1411765, 1, 1,
0.3478846, -2.955795, 3.307327, 0, 0.1372549, 1, 1,
0.3506452, 1.396314, -0.3122449, 0, 0.1294118, 1, 1,
0.3527816, 1.951363, -0.1144039, 0, 0.1254902, 1, 1,
0.3575627, 1.118414, 1.335303, 0, 0.1176471, 1, 1,
0.3610371, 0.3097696, 0.7753516, 0, 0.1137255, 1, 1,
0.3643323, 1.47068, 2.204282, 0, 0.1058824, 1, 1,
0.3752156, 0.8647094, 2.317168, 0, 0.09803922, 1, 1,
0.3782, 0.8535485, -0.8354237, 0, 0.09411765, 1, 1,
0.3824366, 2.467956, -1.3995, 0, 0.08627451, 1, 1,
0.3874806, 0.2281924, 1.42671, 0, 0.08235294, 1, 1,
0.391427, -1.106996, 2.698636, 0, 0.07450981, 1, 1,
0.3990166, -0.7089139, 2.699829, 0, 0.07058824, 1, 1,
0.400443, -1.046156, 4.643254, 0, 0.0627451, 1, 1,
0.4036989, 2.445788, 0.08619403, 0, 0.05882353, 1, 1,
0.4067474, -1.405742, 2.103148, 0, 0.05098039, 1, 1,
0.4089597, -0.1979586, 2.549932, 0, 0.04705882, 1, 1,
0.4110916, 0.2452825, 1.386036, 0, 0.03921569, 1, 1,
0.4156288, -1.24318, 3.053981, 0, 0.03529412, 1, 1,
0.4164135, 0.8073846, -0.253638, 0, 0.02745098, 1, 1,
0.4165185, 0.8461541, 1.358985, 0, 0.02352941, 1, 1,
0.4189532, -0.9443359, -0.4581201, 0, 0.01568628, 1, 1,
0.4207972, 0.4554529, 1.872252, 0, 0.01176471, 1, 1,
0.4266625, -1.398962, 3.351057, 0, 0.003921569, 1, 1,
0.428926, -0.5531151, 3.867744, 0.003921569, 0, 1, 1,
0.4335663, 0.6857306, 2.607907, 0.007843138, 0, 1, 1,
0.4344791, -0.7971381, 0.4721552, 0.01568628, 0, 1, 1,
0.4351938, -1.253408, 2.580191, 0.01960784, 0, 1, 1,
0.4371676, -0.6085758, 3.881156, 0.02745098, 0, 1, 1,
0.4382389, 1.994294, 1.192802, 0.03137255, 0, 1, 1,
0.4413616, 1.269044, -0.758975, 0.03921569, 0, 1, 1,
0.4430172, 1.352273, -0.4083389, 0.04313726, 0, 1, 1,
0.4473662, -0.0257058, 1.781574, 0.05098039, 0, 1, 1,
0.4503623, -0.3989483, 2.349606, 0.05490196, 0, 1, 1,
0.4510859, -0.6382988, 2.451753, 0.0627451, 0, 1, 1,
0.4515724, -0.8593842, 3.113971, 0.06666667, 0, 1, 1,
0.4540241, 1.359084, -0.5567622, 0.07450981, 0, 1, 1,
0.4543425, -0.4002092, 2.471779, 0.07843138, 0, 1, 1,
0.4549762, -1.422126, 3.8649, 0.08627451, 0, 1, 1,
0.4609599, 0.1348208, 0.3831709, 0.09019608, 0, 1, 1,
0.4639735, 1.732735, -0.5520375, 0.09803922, 0, 1, 1,
0.4650345, 1.09816, 0.4788982, 0.1058824, 0, 1, 1,
0.4714696, -1.403043, 2.317916, 0.1098039, 0, 1, 1,
0.4714784, -0.4400302, 3.053679, 0.1176471, 0, 1, 1,
0.4729508, -0.3740794, 2.582431, 0.1215686, 0, 1, 1,
0.4836497, -0.5473059, 2.37665, 0.1294118, 0, 1, 1,
0.4872976, 2.016036, -0.7046945, 0.1333333, 0, 1, 1,
0.4991022, 0.3546029, 1.29447, 0.1411765, 0, 1, 1,
0.4997212, -0.990429, 4.556099, 0.145098, 0, 1, 1,
0.5119469, 0.08528372, 2.062732, 0.1529412, 0, 1, 1,
0.5206147, 0.3724988, 0.009015267, 0.1568628, 0, 1, 1,
0.5276882, -0.226397, 2.690594, 0.1647059, 0, 1, 1,
0.5302418, -1.619698, 2.851811, 0.1686275, 0, 1, 1,
0.5315432, 0.6544424, 1.93433, 0.1764706, 0, 1, 1,
0.5331746, 0.8410779, -0.2174276, 0.1803922, 0, 1, 1,
0.5360518, 0.08927007, -0.3030176, 0.1882353, 0, 1, 1,
0.5375907, 0.13895, 0.02977123, 0.1921569, 0, 1, 1,
0.5425411, 0.2430625, 2.446868, 0.2, 0, 1, 1,
0.5498495, -1.286902, 2.71447, 0.2078431, 0, 1, 1,
0.5519645, -0.672263, 3.088071, 0.2117647, 0, 1, 1,
0.5545622, 1.040167, -1.387316, 0.2196078, 0, 1, 1,
0.5579542, -0.3475147, 1.27092, 0.2235294, 0, 1, 1,
0.5625381, -0.2306943, 2.492977, 0.2313726, 0, 1, 1,
0.5651793, 0.4671921, -0.351816, 0.2352941, 0, 1, 1,
0.5661775, -0.1753477, 2.589837, 0.2431373, 0, 1, 1,
0.5702542, -0.2605668, 3.07821, 0.2470588, 0, 1, 1,
0.5708658, 1.430488, -0.01487698, 0.254902, 0, 1, 1,
0.5711756, -0.5002412, 1.955629, 0.2588235, 0, 1, 1,
0.5719298, -1.645705, 1.844061, 0.2666667, 0, 1, 1,
0.5735546, 3.398657, 1.017015, 0.2705882, 0, 1, 1,
0.5752436, 2.325664, -0.2903446, 0.2784314, 0, 1, 1,
0.5811006, -1.233774, 2.787001, 0.282353, 0, 1, 1,
0.5833632, 0.08460913, 3.192111, 0.2901961, 0, 1, 1,
0.5840456, -1.500246, 1.127412, 0.2941177, 0, 1, 1,
0.584852, 0.9767613, 0.8740512, 0.3019608, 0, 1, 1,
0.5859832, 0.1656978, 1.750189, 0.3098039, 0, 1, 1,
0.5998464, 1.159002, -0.4388663, 0.3137255, 0, 1, 1,
0.6011438, -0.2185855, -0.01200402, 0.3215686, 0, 1, 1,
0.6042355, -1.272598, 2.642458, 0.3254902, 0, 1, 1,
0.6099431, 0.5327881, -0.02690583, 0.3333333, 0, 1, 1,
0.6102687, 0.4305229, 2.240058, 0.3372549, 0, 1, 1,
0.6103663, -0.565795, 2.962523, 0.345098, 0, 1, 1,
0.6120813, 0.4367398, 1.108137, 0.3490196, 0, 1, 1,
0.6179063, 0.6491016, 0.911074, 0.3568628, 0, 1, 1,
0.6188653, 1.032572, 1.689292, 0.3607843, 0, 1, 1,
0.6202731, 0.2989221, 2.020688, 0.3686275, 0, 1, 1,
0.6250101, 0.3127752, 1.220935, 0.372549, 0, 1, 1,
0.6255699, 0.6133018, 1.463493, 0.3803922, 0, 1, 1,
0.6274668, 1.337472, -0.2986959, 0.3843137, 0, 1, 1,
0.6351687, -0.8569571, 2.897721, 0.3921569, 0, 1, 1,
0.6356433, -0.6165344, 2.534255, 0.3960784, 0, 1, 1,
0.6398796, 0.1785115, 0.7077236, 0.4039216, 0, 1, 1,
0.6445447, -1.90246, 3.031473, 0.4117647, 0, 1, 1,
0.6462424, -0.3241803, 2.725886, 0.4156863, 0, 1, 1,
0.6463434, -0.08282256, 1.015805, 0.4235294, 0, 1, 1,
0.6484293, 0.4103906, 2.624867, 0.427451, 0, 1, 1,
0.6503196, 0.8098765, 2.053281, 0.4352941, 0, 1, 1,
0.651706, -0.6308182, 2.917662, 0.4392157, 0, 1, 1,
0.6543177, -0.014892, 0.4142804, 0.4470588, 0, 1, 1,
0.6592183, -1.612013, 2.375838, 0.4509804, 0, 1, 1,
0.6618457, 1.534559, 0.979562, 0.4588235, 0, 1, 1,
0.6644413, -1.59405, 2.453742, 0.4627451, 0, 1, 1,
0.665787, -0.1138787, 2.388694, 0.4705882, 0, 1, 1,
0.6670533, -1.040448, 2.418218, 0.4745098, 0, 1, 1,
0.667181, -0.1081627, 0.06389281, 0.4823529, 0, 1, 1,
0.6679266, 2.036861, -0.3255485, 0.4862745, 0, 1, 1,
0.6716669, -0.8391774, 3.297459, 0.4941176, 0, 1, 1,
0.6741185, 0.6460522, 0.03951455, 0.5019608, 0, 1, 1,
0.6792156, -0.5369132, 2.011717, 0.5058824, 0, 1, 1,
0.6874933, 0.6038183, 0.05080313, 0.5137255, 0, 1, 1,
0.7012794, -0.5180786, 3.275681, 0.5176471, 0, 1, 1,
0.7062895, -0.175452, 1.195225, 0.5254902, 0, 1, 1,
0.7084218, -0.1678678, 0.8720518, 0.5294118, 0, 1, 1,
0.7107229, -1.826676, 5.403964, 0.5372549, 0, 1, 1,
0.7155634, -1.14402, 1.29366, 0.5411765, 0, 1, 1,
0.7158498, 0.01672761, 1.051833, 0.5490196, 0, 1, 1,
0.7208816, 0.05350162, 1.560215, 0.5529412, 0, 1, 1,
0.7245335, 0.9189222, 3.109773, 0.5607843, 0, 1, 1,
0.7251214, 1.225707, -0.7654787, 0.5647059, 0, 1, 1,
0.7285431, -0.342969, 2.67822, 0.572549, 0, 1, 1,
0.7356657, 0.5731622, -0.5975293, 0.5764706, 0, 1, 1,
0.7374515, 1.697062, 2.06136, 0.5843138, 0, 1, 1,
0.7394407, 0.3793969, 0.7764884, 0.5882353, 0, 1, 1,
0.7420772, -1.021149, 4.630153, 0.5960785, 0, 1, 1,
0.7476687, 1.467631, 1.754595, 0.6039216, 0, 1, 1,
0.7520783, 0.6019661, 2.278915, 0.6078432, 0, 1, 1,
0.7559975, 0.8666945, 0.1674195, 0.6156863, 0, 1, 1,
0.756898, -0.3483635, 2.43551, 0.6196079, 0, 1, 1,
0.7576895, 0.8649432, 2.715584, 0.627451, 0, 1, 1,
0.7607843, -0.07930283, 1.751179, 0.6313726, 0, 1, 1,
0.761233, 0.2652096, 1.609135, 0.6392157, 0, 1, 1,
0.7639844, 1.974975, -0.4798909, 0.6431373, 0, 1, 1,
0.7651712, 0.1040755, 1.500519, 0.6509804, 0, 1, 1,
0.7691048, 0.9472402, 0.9904338, 0.654902, 0, 1, 1,
0.7790949, 0.3553122, -0.1734293, 0.6627451, 0, 1, 1,
0.7883315, 1.798007, -0.09333681, 0.6666667, 0, 1, 1,
0.7887693, -0.6549646, 1.722723, 0.6745098, 0, 1, 1,
0.7890521, -2.121119, 2.683365, 0.6784314, 0, 1, 1,
0.7957376, 0.506936, 2.802054, 0.6862745, 0, 1, 1,
0.8135833, -1.843306, 2.621915, 0.6901961, 0, 1, 1,
0.8160838, 0.6379417, 1.032938, 0.6980392, 0, 1, 1,
0.8195253, 1.550188, 0.3943874, 0.7058824, 0, 1, 1,
0.8217873, 0.5230161, 2.371047, 0.7098039, 0, 1, 1,
0.8285741, 1.44458, 1.108978, 0.7176471, 0, 1, 1,
0.8303271, -1.033617, 1.729546, 0.7215686, 0, 1, 1,
0.8305412, -0.6778219, 2.71459, 0.7294118, 0, 1, 1,
0.8399492, -1.151695, 1.879818, 0.7333333, 0, 1, 1,
0.8402638, 1.258673, 0.4748994, 0.7411765, 0, 1, 1,
0.8431737, 1.973364, -1.154911, 0.7450981, 0, 1, 1,
0.8433457, 0.870301, 1.55002, 0.7529412, 0, 1, 1,
0.8444092, 0.03086777, 0.5847419, 0.7568628, 0, 1, 1,
0.8512176, -0.8254454, 1.859154, 0.7647059, 0, 1, 1,
0.8530999, -0.1278774, 1.59657, 0.7686275, 0, 1, 1,
0.858677, 0.4487465, 1.725845, 0.7764706, 0, 1, 1,
0.8655503, -0.6192198, 2.101543, 0.7803922, 0, 1, 1,
0.8680826, 0.935012, 1.573771, 0.7882353, 0, 1, 1,
0.8732594, -0.07221165, 2.663224, 0.7921569, 0, 1, 1,
0.8743861, -0.1308526, 4.594574, 0.8, 0, 1, 1,
0.8763264, 1.186558, -0.2967594, 0.8078431, 0, 1, 1,
0.8805168, -0.8259193, 2.722946, 0.8117647, 0, 1, 1,
0.8818831, 0.2775963, 0.672131, 0.8196079, 0, 1, 1,
0.8864391, 1.087834, 0.7865923, 0.8235294, 0, 1, 1,
0.8908925, -1.364181, 3.824656, 0.8313726, 0, 1, 1,
0.8996361, -1.457283, 2.53826, 0.8352941, 0, 1, 1,
0.9059515, 0.9242324, 0.5433111, 0.8431373, 0, 1, 1,
0.9064468, -1.172521, 1.623187, 0.8470588, 0, 1, 1,
0.906477, -0.1607285, 2.550431, 0.854902, 0, 1, 1,
0.9068016, -0.9030085, 1.465255, 0.8588235, 0, 1, 1,
0.9137814, -0.4528021, 2.848002, 0.8666667, 0, 1, 1,
0.91483, -1.406687, 3.923822, 0.8705882, 0, 1, 1,
0.9185058, 1.288921, 1.453065, 0.8784314, 0, 1, 1,
0.9194415, 0.249627, 2.145446, 0.8823529, 0, 1, 1,
0.9232014, 0.8712917, -0.249294, 0.8901961, 0, 1, 1,
0.925504, 1.747898, 0.03449071, 0.8941177, 0, 1, 1,
0.9365954, 0.2141062, -0.7835408, 0.9019608, 0, 1, 1,
0.9366112, 2.68428, 1.587275, 0.9098039, 0, 1, 1,
0.9376221, 0.118322, 1.814409, 0.9137255, 0, 1, 1,
0.9408455, -1.718536, 1.726915, 0.9215686, 0, 1, 1,
0.9495017, 0.6086705, 1.234199, 0.9254902, 0, 1, 1,
0.965701, 0.4179593, -0.8007109, 0.9333333, 0, 1, 1,
0.9690456, -0.774508, 2.875702, 0.9372549, 0, 1, 1,
0.9699347, -1.320527, 2.6578, 0.945098, 0, 1, 1,
0.9789281, 1.392445, -0.06124769, 0.9490196, 0, 1, 1,
0.9796098, 0.07147331, 1.48179, 0.9568627, 0, 1, 1,
0.9804439, 0.6855872, 1.250471, 0.9607843, 0, 1, 1,
0.981162, -0.3527457, 1.332817, 0.9686275, 0, 1, 1,
0.9824411, -0.3075796, 3.772959, 0.972549, 0, 1, 1,
0.9832879, 0.03862361, 1.380857, 0.9803922, 0, 1, 1,
0.9870334, -0.942979, 2.909522, 0.9843137, 0, 1, 1,
0.9917282, 0.3476419, 0.4508999, 0.9921569, 0, 1, 1,
0.9949305, 1.455151, 1.193543, 0.9960784, 0, 1, 1,
1.000222, 0.2288825, 2.643369, 1, 0, 0.9960784, 1,
1.000329, -1.78496, 1.148094, 1, 0, 0.9882353, 1,
1.001612, 0.8638098, 1.304069, 1, 0, 0.9843137, 1,
1.009746, -0.6347433, 2.420719, 1, 0, 0.9764706, 1,
1.01295, -0.9302402, 1.29032, 1, 0, 0.972549, 1,
1.013211, 1.368645, 1.324395, 1, 0, 0.9647059, 1,
1.025067, 0.7712666, 1.095236, 1, 0, 0.9607843, 1,
1.028448, -1.001541, 2.042335, 1, 0, 0.9529412, 1,
1.031591, 0.0536562, 1.235078, 1, 0, 0.9490196, 1,
1.039505, -0.2148308, 2.25425, 1, 0, 0.9411765, 1,
1.04485, -0.7659034, 2.56363, 1, 0, 0.9372549, 1,
1.047195, 0.245643, 0.1112922, 1, 0, 0.9294118, 1,
1.049265, -0.2323958, 2.240706, 1, 0, 0.9254902, 1,
1.051971, -0.9241469, 1.62672, 1, 0, 0.9176471, 1,
1.055848, -0.04225287, 0.5539563, 1, 0, 0.9137255, 1,
1.055851, -1.822478, 3.173916, 1, 0, 0.9058824, 1,
1.068367, 0.564677, -0.1948169, 1, 0, 0.9019608, 1,
1.075512, 0.6538331, 1.318703, 1, 0, 0.8941177, 1,
1.079832, 0.6476081, -0.7724171, 1, 0, 0.8862745, 1,
1.082022, -1.278248, 2.081856, 1, 0, 0.8823529, 1,
1.088168, 1.627006, 0.6075954, 1, 0, 0.8745098, 1,
1.091663, -0.596586, -0.7581254, 1, 0, 0.8705882, 1,
1.095309, 0.7762623, 0.2275169, 1, 0, 0.8627451, 1,
1.096004, 2.019776, -0.1573727, 1, 0, 0.8588235, 1,
1.096531, 0.2779223, -0.9277102, 1, 0, 0.8509804, 1,
1.104657, -0.8684317, 2.498388, 1, 0, 0.8470588, 1,
1.122585, -1.118113, 4.878951, 1, 0, 0.8392157, 1,
1.12683, 1.095793, 1.085803, 1, 0, 0.8352941, 1,
1.137499, -0.1146184, -0.1642012, 1, 0, 0.827451, 1,
1.14144, 0.4676674, 1.312593, 1, 0, 0.8235294, 1,
1.143007, 1.173009, 0.3964195, 1, 0, 0.8156863, 1,
1.150259, -2.179147, 2.800493, 1, 0, 0.8117647, 1,
1.151242, 1.355409, 1.322509, 1, 0, 0.8039216, 1,
1.155173, -0.1013488, 1.1345, 1, 0, 0.7960784, 1,
1.158326, -1.395357, 3.693317, 1, 0, 0.7921569, 1,
1.159142, 1.093072, 0.7024999, 1, 0, 0.7843137, 1,
1.160064, -0.6597832, 2.354303, 1, 0, 0.7803922, 1,
1.169252, -0.2421876, 2.687555, 1, 0, 0.772549, 1,
1.175003, 0.5256392, 2.151856, 1, 0, 0.7686275, 1,
1.181655, -0.3429497, 1.456924, 1, 0, 0.7607843, 1,
1.182577, -1.211051, 2.894718, 1, 0, 0.7568628, 1,
1.186271, 0.09542881, 2.660401, 1, 0, 0.7490196, 1,
1.187052, 1.011313, 2.812526, 1, 0, 0.7450981, 1,
1.187771, 0.1652833, 2.499001, 1, 0, 0.7372549, 1,
1.190356, -0.839802, 2.249481, 1, 0, 0.7333333, 1,
1.194016, 2.269737, 0.9103531, 1, 0, 0.7254902, 1,
1.205132, -0.4321288, 2.169623, 1, 0, 0.7215686, 1,
1.205701, -1.923061, 3.024833, 1, 0, 0.7137255, 1,
1.208182, -0.5910977, 0.6639179, 1, 0, 0.7098039, 1,
1.213325, 0.6921283, 1.436484, 1, 0, 0.7019608, 1,
1.215096, 0.1693871, 1.438132, 1, 0, 0.6941177, 1,
1.22276, -1.758189, 1.975747, 1, 0, 0.6901961, 1,
1.223183, -0.1257298, 1.091797, 1, 0, 0.682353, 1,
1.224694, -1.026898, 1.121143, 1, 0, 0.6784314, 1,
1.228489, -0.1903197, 1.38958, 1, 0, 0.6705883, 1,
1.232418, 0.5336889, 0.6368136, 1, 0, 0.6666667, 1,
1.238322, -2.779371, 2.007124, 1, 0, 0.6588235, 1,
1.2422, 0.1532616, 3.200978, 1, 0, 0.654902, 1,
1.256146, 0.7853951, 1.629485, 1, 0, 0.6470588, 1,
1.275321, -0.2001816, 3.014925, 1, 0, 0.6431373, 1,
1.292584, -1.821056, 2.27933, 1, 0, 0.6352941, 1,
1.292951, -0.8139508, 0.5578188, 1, 0, 0.6313726, 1,
1.296639, -0.316388, 2.130888, 1, 0, 0.6235294, 1,
1.299703, -0.8043758, 3.104645, 1, 0, 0.6196079, 1,
1.304926, -0.2532884, 1.254979, 1, 0, 0.6117647, 1,
1.309422, -0.3118712, 2.153435, 1, 0, 0.6078432, 1,
1.311583, 3.188915, 1.198426, 1, 0, 0.6, 1,
1.320617, -0.547331, 2.253982, 1, 0, 0.5921569, 1,
1.325747, -0.7671829, 3.245573, 1, 0, 0.5882353, 1,
1.336702, 1.863959, 0.8384059, 1, 0, 0.5803922, 1,
1.342014, 0.04713747, 0.9440309, 1, 0, 0.5764706, 1,
1.349179, 0.461612, 1.469804, 1, 0, 0.5686275, 1,
1.355785, -0.9184178, 0.5999102, 1, 0, 0.5647059, 1,
1.363677, -0.7408141, 1.864687, 1, 0, 0.5568628, 1,
1.371865, 0.2446292, -0.5345441, 1, 0, 0.5529412, 1,
1.372571, -2.963032, 4.837042, 1, 0, 0.5450981, 1,
1.37389, -0.3858078, 2.476372, 1, 0, 0.5411765, 1,
1.37395, 0.1817618, 3.69423, 1, 0, 0.5333334, 1,
1.377797, 1.044107, 1.005964, 1, 0, 0.5294118, 1,
1.393149, 1.032226, 0.02227542, 1, 0, 0.5215687, 1,
1.398119, 1.227858, -0.2615233, 1, 0, 0.5176471, 1,
1.400093, -0.3741149, 1.379581, 1, 0, 0.509804, 1,
1.401655, 0.2167514, 0.3834949, 1, 0, 0.5058824, 1,
1.402898, 0.3968827, 1.124664, 1, 0, 0.4980392, 1,
1.410683, 1.267249, -0.08865856, 1, 0, 0.4901961, 1,
1.42143, 0.9345805, 1.149496, 1, 0, 0.4862745, 1,
1.429891, 0.02587237, 1.171454, 1, 0, 0.4784314, 1,
1.443619, 0.8316877, 1.732568, 1, 0, 0.4745098, 1,
1.447701, -0.8871324, 2.147951, 1, 0, 0.4666667, 1,
1.459028, 1.126505, 1.493801, 1, 0, 0.4627451, 1,
1.469936, 1.751484, 2.390614, 1, 0, 0.454902, 1,
1.473849, -1.165288, 2.166821, 1, 0, 0.4509804, 1,
1.485245, -0.3535258, 0.1847565, 1, 0, 0.4431373, 1,
1.488264, -1.623034, 1.831653, 1, 0, 0.4392157, 1,
1.502069, -0.8652001, 2.711889, 1, 0, 0.4313726, 1,
1.503196, 0.2055218, -0.6904248, 1, 0, 0.427451, 1,
1.514448, 0.05950473, 0.8810514, 1, 0, 0.4196078, 1,
1.521168, -0.806763, 2.57319, 1, 0, 0.4156863, 1,
1.522093, -0.08793874, 1.555495, 1, 0, 0.4078431, 1,
1.522966, -0.3935716, 3.028663, 1, 0, 0.4039216, 1,
1.526373, -0.6069627, 2.069523, 1, 0, 0.3960784, 1,
1.559511, -0.3300219, 0.2683274, 1, 0, 0.3882353, 1,
1.577788, 0.3002408, 1.34267, 1, 0, 0.3843137, 1,
1.591867, 1.556405, 0.8132816, 1, 0, 0.3764706, 1,
1.604722, -1.031008, 1.682611, 1, 0, 0.372549, 1,
1.613509, -0.2526844, 2.40336, 1, 0, 0.3647059, 1,
1.623787, -2.199244, 2.813547, 1, 0, 0.3607843, 1,
1.62999, 0.8598181, 0.6397187, 1, 0, 0.3529412, 1,
1.652415, -0.6954059, 0.1260084, 1, 0, 0.3490196, 1,
1.664786, -0.5251914, 0.7221482, 1, 0, 0.3411765, 1,
1.676876, -1.873413, 0.7813349, 1, 0, 0.3372549, 1,
1.686947, -0.5515452, 1.751806, 1, 0, 0.3294118, 1,
1.712028, -0.132173, 3.093165, 1, 0, 0.3254902, 1,
1.713969, -1.396869, 1.657497, 1, 0, 0.3176471, 1,
1.724577, 0.7178739, 1.428813, 1, 0, 0.3137255, 1,
1.730481, 0.7260848, 0.5845569, 1, 0, 0.3058824, 1,
1.738618, -1.730756, 3.677814, 1, 0, 0.2980392, 1,
1.751714, -0.9781656, 0.3565082, 1, 0, 0.2941177, 1,
1.752866, -0.901921, 2.493349, 1, 0, 0.2862745, 1,
1.775187, -1.076486, 2.838781, 1, 0, 0.282353, 1,
1.780766, 0.3776398, 1.660894, 1, 0, 0.2745098, 1,
1.782245, -0.5115848, 3.169478, 1, 0, 0.2705882, 1,
1.793663, -0.4575372, 2.043552, 1, 0, 0.2627451, 1,
1.795449, -0.787633, 3.605644, 1, 0, 0.2588235, 1,
1.800233, 0.9577981, 0.1215772, 1, 0, 0.2509804, 1,
1.815642, 0.7950018, 0.09650559, 1, 0, 0.2470588, 1,
1.819668, 0.002252375, 1.968048, 1, 0, 0.2392157, 1,
1.822841, -0.3125343, 2.568706, 1, 0, 0.2352941, 1,
1.835683, -1.017589, 2.631703, 1, 0, 0.227451, 1,
1.859805, 0.5254739, 1.757993, 1, 0, 0.2235294, 1,
1.877176, -0.6332457, 2.166488, 1, 0, 0.2156863, 1,
1.888515, -0.3229007, 0.9986103, 1, 0, 0.2117647, 1,
1.903037, -0.5439182, 0.9742513, 1, 0, 0.2039216, 1,
1.903754, 0.3716323, 1.584554, 1, 0, 0.1960784, 1,
1.905646, -1.312351, 2.20302, 1, 0, 0.1921569, 1,
1.907063, -0.03508106, 0.5451226, 1, 0, 0.1843137, 1,
1.923522, -0.5612837, 2.419986, 1, 0, 0.1803922, 1,
1.941862, 1.752543, 2.848246, 1, 0, 0.172549, 1,
1.952468, 0.03686938, 0.9679303, 1, 0, 0.1686275, 1,
2.017014, -0.4136492, 1.666867, 1, 0, 0.1607843, 1,
2.019726, 1.212874, 2.118925, 1, 0, 0.1568628, 1,
2.025996, 0.6559467, 2.107331, 1, 0, 0.1490196, 1,
2.082752, -0.7394617, 2.93083, 1, 0, 0.145098, 1,
2.099624, -1.171352, 3.382712, 1, 0, 0.1372549, 1,
2.115702, 1.462942, 0.3367688, 1, 0, 0.1333333, 1,
2.117258, 0.1968666, 2.739095, 1, 0, 0.1254902, 1,
2.118799, 1.86369, 0.5368462, 1, 0, 0.1215686, 1,
2.1242, 1.386101, 2.207578, 1, 0, 0.1137255, 1,
2.21929, 0.8271967, -0.615254, 1, 0, 0.1098039, 1,
2.250813, 0.3116925, 1.966117, 1, 0, 0.1019608, 1,
2.263461, 0.04056301, 3.621429, 1, 0, 0.09411765, 1,
2.301557, 0.1943762, 1.029427, 1, 0, 0.09019608, 1,
2.314847, -0.6420283, 3.618965, 1, 0, 0.08235294, 1,
2.328695, -1.524337, 2.803264, 1, 0, 0.07843138, 1,
2.329476, 1.014871, 1.957137, 1, 0, 0.07058824, 1,
2.369243, 1.265314, 2.006387, 1, 0, 0.06666667, 1,
2.391606, 0.06774568, 0.5406228, 1, 0, 0.05882353, 1,
2.397701, 0.02381669, 2.141728, 1, 0, 0.05490196, 1,
2.411489, 0.2273282, 1.932249, 1, 0, 0.04705882, 1,
2.516814, -0.8456165, 1.752365, 1, 0, 0.04313726, 1,
2.540983, -0.3590976, 0.6506174, 1, 0, 0.03529412, 1,
2.739618, -1.415826, 2.057806, 1, 0, 0.03137255, 1,
2.829315, 0.5073559, 2.029471, 1, 0, 0.02352941, 1,
3.022938, 1.862665, 1.738359, 1, 0, 0.01960784, 1,
3.049875, -0.007746194, 2.986714, 1, 0, 0.01176471, 1,
3.114963, -1.490405, 2.768014, 1, 0, 0.007843138, 1
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
-0.3533535, -4.041339, -7.26729, 0, -0.5, 0.5, 0.5,
-0.3533535, -4.041339, -7.26729, 1, -0.5, 0.5, 0.5,
-0.3533535, -4.041339, -7.26729, 1, 1.5, 0.5, 0.5,
-0.3533535, -4.041339, -7.26729, 0, 1.5, 0.5, 0.5
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
-4.997429, 0.2178122, -7.26729, 0, -0.5, 0.5, 0.5,
-4.997429, 0.2178122, -7.26729, 1, -0.5, 0.5, 0.5,
-4.997429, 0.2178122, -7.26729, 1, 1.5, 0.5, 0.5,
-4.997429, 0.2178122, -7.26729, 0, 1.5, 0.5, 0.5
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
-4.997429, -4.041339, 0.1884685, 0, -0.5, 0.5, 0.5,
-4.997429, -4.041339, 0.1884685, 1, -0.5, 0.5, 0.5,
-4.997429, -4.041339, 0.1884685, 1, 1.5, 0.5, 0.5,
-4.997429, -4.041339, 0.1884685, 0, 1.5, 0.5, 0.5
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
-3, -3.058458, -5.54673,
3, -3.058458, -5.54673,
-3, -3.058458, -5.54673,
-3, -3.222271, -5.83349,
-2, -3.058458, -5.54673,
-2, -3.222271, -5.83349,
-1, -3.058458, -5.54673,
-1, -3.222271, -5.83349,
0, -3.058458, -5.54673,
0, -3.222271, -5.83349,
1, -3.058458, -5.54673,
1, -3.222271, -5.83349,
2, -3.058458, -5.54673,
2, -3.222271, -5.83349,
3, -3.058458, -5.54673,
3, -3.222271, -5.83349
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
-3, -3.549898, -6.40701, 0, -0.5, 0.5, 0.5,
-3, -3.549898, -6.40701, 1, -0.5, 0.5, 0.5,
-3, -3.549898, -6.40701, 1, 1.5, 0.5, 0.5,
-3, -3.549898, -6.40701, 0, 1.5, 0.5, 0.5,
-2, -3.549898, -6.40701, 0, -0.5, 0.5, 0.5,
-2, -3.549898, -6.40701, 1, -0.5, 0.5, 0.5,
-2, -3.549898, -6.40701, 1, 1.5, 0.5, 0.5,
-2, -3.549898, -6.40701, 0, 1.5, 0.5, 0.5,
-1, -3.549898, -6.40701, 0, -0.5, 0.5, 0.5,
-1, -3.549898, -6.40701, 1, -0.5, 0.5, 0.5,
-1, -3.549898, -6.40701, 1, 1.5, 0.5, 0.5,
-1, -3.549898, -6.40701, 0, 1.5, 0.5, 0.5,
0, -3.549898, -6.40701, 0, -0.5, 0.5, 0.5,
0, -3.549898, -6.40701, 1, -0.5, 0.5, 0.5,
0, -3.549898, -6.40701, 1, 1.5, 0.5, 0.5,
0, -3.549898, -6.40701, 0, 1.5, 0.5, 0.5,
1, -3.549898, -6.40701, 0, -0.5, 0.5, 0.5,
1, -3.549898, -6.40701, 1, -0.5, 0.5, 0.5,
1, -3.549898, -6.40701, 1, 1.5, 0.5, 0.5,
1, -3.549898, -6.40701, 0, 1.5, 0.5, 0.5,
2, -3.549898, -6.40701, 0, -0.5, 0.5, 0.5,
2, -3.549898, -6.40701, 1, -0.5, 0.5, 0.5,
2, -3.549898, -6.40701, 1, 1.5, 0.5, 0.5,
2, -3.549898, -6.40701, 0, 1.5, 0.5, 0.5,
3, -3.549898, -6.40701, 0, -0.5, 0.5, 0.5,
3, -3.549898, -6.40701, 1, -0.5, 0.5, 0.5,
3, -3.549898, -6.40701, 1, 1.5, 0.5, 0.5,
3, -3.549898, -6.40701, 0, 1.5, 0.5, 0.5
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
-3.925719, -2, -5.54673,
-3.925719, 3, -5.54673,
-3.925719, -2, -5.54673,
-4.104337, -2, -5.83349,
-3.925719, -1, -5.54673,
-4.104337, -1, -5.83349,
-3.925719, 0, -5.54673,
-4.104337, 0, -5.83349,
-3.925719, 1, -5.54673,
-4.104337, 1, -5.83349,
-3.925719, 2, -5.54673,
-4.104337, 2, -5.83349,
-3.925719, 3, -5.54673,
-4.104337, 3, -5.83349
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
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-4.461574, -2, -6.40701, 0, -0.5, 0.5, 0.5,
-4.461574, -2, -6.40701, 1, -0.5, 0.5, 0.5,
-4.461574, -2, -6.40701, 1, 1.5, 0.5, 0.5,
-4.461574, -2, -6.40701, 0, 1.5, 0.5, 0.5,
-4.461574, -1, -6.40701, 0, -0.5, 0.5, 0.5,
-4.461574, -1, -6.40701, 1, -0.5, 0.5, 0.5,
-4.461574, -1, -6.40701, 1, 1.5, 0.5, 0.5,
-4.461574, -1, -6.40701, 0, 1.5, 0.5, 0.5,
-4.461574, 0, -6.40701, 0, -0.5, 0.5, 0.5,
-4.461574, 0, -6.40701, 1, -0.5, 0.5, 0.5,
-4.461574, 0, -6.40701, 1, 1.5, 0.5, 0.5,
-4.461574, 0, -6.40701, 0, 1.5, 0.5, 0.5,
-4.461574, 1, -6.40701, 0, -0.5, 0.5, 0.5,
-4.461574, 1, -6.40701, 1, -0.5, 0.5, 0.5,
-4.461574, 1, -6.40701, 1, 1.5, 0.5, 0.5,
-4.461574, 1, -6.40701, 0, 1.5, 0.5, 0.5,
-4.461574, 2, -6.40701, 0, -0.5, 0.5, 0.5,
-4.461574, 2, -6.40701, 1, -0.5, 0.5, 0.5,
-4.461574, 2, -6.40701, 1, 1.5, 0.5, 0.5,
-4.461574, 2, -6.40701, 0, 1.5, 0.5, 0.5,
-4.461574, 3, -6.40701, 0, -0.5, 0.5, 0.5,
-4.461574, 3, -6.40701, 1, -0.5, 0.5, 0.5,
-4.461574, 3, -6.40701, 1, 1.5, 0.5, 0.5,
-4.461574, 3, -6.40701, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.925719, -3.058458, -4,
-3.925719, -3.058458, 4,
-3.925719, -3.058458, -4,
-4.104337, -3.222271, -4,
-3.925719, -3.058458, -2,
-4.104337, -3.222271, -2,
-3.925719, -3.058458, 0,
-4.104337, -3.222271, 0,
-3.925719, -3.058458, 2,
-4.104337, -3.222271, 2,
-3.925719, -3.058458, 4,
-4.104337, -3.222271, 4
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
-4.461574, -3.549898, -4, 0, -0.5, 0.5, 0.5,
-4.461574, -3.549898, -4, 1, -0.5, 0.5, 0.5,
-4.461574, -3.549898, -4, 1, 1.5, 0.5, 0.5,
-4.461574, -3.549898, -4, 0, 1.5, 0.5, 0.5,
-4.461574, -3.549898, -2, 0, -0.5, 0.5, 0.5,
-4.461574, -3.549898, -2, 1, -0.5, 0.5, 0.5,
-4.461574, -3.549898, -2, 1, 1.5, 0.5, 0.5,
-4.461574, -3.549898, -2, 0, 1.5, 0.5, 0.5,
-4.461574, -3.549898, 0, 0, -0.5, 0.5, 0.5,
-4.461574, -3.549898, 0, 1, -0.5, 0.5, 0.5,
-4.461574, -3.549898, 0, 1, 1.5, 0.5, 0.5,
-4.461574, -3.549898, 0, 0, 1.5, 0.5, 0.5,
-4.461574, -3.549898, 2, 0, -0.5, 0.5, 0.5,
-4.461574, -3.549898, 2, 1, -0.5, 0.5, 0.5,
-4.461574, -3.549898, 2, 1, 1.5, 0.5, 0.5,
-4.461574, -3.549898, 2, 0, 1.5, 0.5, 0.5,
-4.461574, -3.549898, 4, 0, -0.5, 0.5, 0.5,
-4.461574, -3.549898, 4, 1, -0.5, 0.5, 0.5,
-4.461574, -3.549898, 4, 1, 1.5, 0.5, 0.5,
-4.461574, -3.549898, 4, 0, 1.5, 0.5, 0.5
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
-3.925719, -3.058458, -5.54673,
-3.925719, 3.494082, -5.54673,
-3.925719, -3.058458, 5.923667,
-3.925719, 3.494082, 5.923667,
-3.925719, -3.058458, -5.54673,
-3.925719, -3.058458, 5.923667,
-3.925719, 3.494082, -5.54673,
-3.925719, 3.494082, 5.923667,
-3.925719, -3.058458, -5.54673,
3.219012, -3.058458, -5.54673,
-3.925719, -3.058458, 5.923667,
3.219012, -3.058458, 5.923667,
-3.925719, 3.494082, -5.54673,
3.219012, 3.494082, -5.54673,
-3.925719, 3.494082, 5.923667,
3.219012, 3.494082, 5.923667,
3.219012, -3.058458, -5.54673,
3.219012, 3.494082, -5.54673,
3.219012, -3.058458, 5.923667,
3.219012, 3.494082, 5.923667,
3.219012, -3.058458, -5.54673,
3.219012, -3.058458, 5.923667,
3.219012, 3.494082, -5.54673,
3.219012, 3.494082, 5.923667
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
var radius = 8.019545;
var distance = 35.67987;
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
mvMatrix.translate( 0.3533535, -0.2178122, -0.1884685 );
mvMatrix.scale( 1.213606, 1.323287, 0.7559363 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.67987);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
InChI_1_C15H21NO4_c1<-read.table("InChI_1_C15H21NO4_c1.xyz")
```

```
## Error in read.table("InChI_1_C15H21NO4_c1.xyz"): no lines available in input
```

```r
x<-InChI_1_C15H21NO4_c1$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1_C15H21NO4_c1' not found
```

```r
y<-InChI_1_C15H21NO4_c1$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1_C15H21NO4_c1' not found
```

```r
z<-InChI_1_C15H21NO4_c1$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1_C15H21NO4_c1' not found
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
-3.82167, -1.467642, -3.35539, 0, 0, 1, 1, 1,
-3.44077, -1.092279, -1.889355, 1, 0, 0, 1, 1,
-3.216209, 0.7152095, -0.938698, 1, 0, 0, 1, 1,
-3.049102, -0.5513636, -2.269, 1, 0, 0, 1, 1,
-2.867136, -1.016236, -0.6807622, 1, 0, 0, 1, 1,
-2.864534, -0.8351601, -2.511349, 1, 0, 0, 1, 1,
-2.695039, 0.2498166, -1.000547, 0, 0, 0, 1, 1,
-2.663856, -0.3089413, -1.744222, 0, 0, 0, 1, 1,
-2.662583, -1.156686, -4.240337, 0, 0, 0, 1, 1,
-2.642446, -0.668596, -2.023332, 0, 0, 0, 1, 1,
-2.578493, -1.723098, -2.410573, 0, 0, 0, 1, 1,
-2.54373, -0.008952999, -0.9068944, 0, 0, 0, 1, 1,
-2.415301, 0.4820034, -1.033715, 0, 0, 0, 1, 1,
-2.405825, -0.4327082, 0.06145792, 1, 1, 1, 1, 1,
-2.306286, 0.4817246, -2.188648, 1, 1, 1, 1, 1,
-2.248269, -0.2863656, -2.349856, 1, 1, 1, 1, 1,
-2.222079, -0.6862238, -1.887725, 1, 1, 1, 1, 1,
-2.2201, 0.1745264, -0.9576929, 1, 1, 1, 1, 1,
-2.134426, -0.5822603, -0.8632646, 1, 1, 1, 1, 1,
-2.126208, -0.1570966, -1.238701, 1, 1, 1, 1, 1,
-2.115653, 0.3226349, -1.738589, 1, 1, 1, 1, 1,
-2.101012, 0.4643801, -1.536209, 1, 1, 1, 1, 1,
-2.089543, -0.5653087, -2.380178, 1, 1, 1, 1, 1,
-2.07332, 1.541439, 0.3565221, 1, 1, 1, 1, 1,
-2.04243, -0.9866694, -2.942887, 1, 1, 1, 1, 1,
-2.03877, -0.549878, -3.469467, 1, 1, 1, 1, 1,
-2.001638, 1.661651, -1.475466, 1, 1, 1, 1, 1,
-1.969734, -0.4516152, -2.17013, 1, 1, 1, 1, 1,
-1.957957, -0.1791137, -1.484309, 0, 0, 1, 1, 1,
-1.920583, 1.637374, -0.9730874, 1, 0, 0, 1, 1,
-1.90926, 0.3633996, -1.268818, 1, 0, 0, 1, 1,
-1.890624, -1.125179, -5.379685, 1, 0, 0, 1, 1,
-1.870095, 1.613048, -1.423067, 1, 0, 0, 1, 1,
-1.816223, 0.9313899, 0.02685692, 1, 0, 0, 1, 1,
-1.812663, -0.1077835, -0.5647519, 0, 0, 0, 1, 1,
-1.805611, -1.058875, -3.77122, 0, 0, 0, 1, 1,
-1.799312, 0.1763386, -1.601734, 0, 0, 0, 1, 1,
-1.795236, 0.06981202, -2.871474, 0, 0, 0, 1, 1,
-1.793587, 0.7030121, 0.4640134, 0, 0, 0, 1, 1,
-1.777621, 0.5156609, -2.267915, 0, 0, 0, 1, 1,
-1.762933, 0.5556967, -0.3873507, 0, 0, 0, 1, 1,
-1.732623, 0.1792111, -1.970547, 1, 1, 1, 1, 1,
-1.727964, -1.825523, -2.145317, 1, 1, 1, 1, 1,
-1.716105, 1.470782, 1.189811, 1, 1, 1, 1, 1,
-1.702208, -0.5436454, -2.39261, 1, 1, 1, 1, 1,
-1.682435, -1.172095, -1.345858, 1, 1, 1, 1, 1,
-1.678541, 1.178601, -0.3821892, 1, 1, 1, 1, 1,
-1.673097, -1.183306, -2.905742, 1, 1, 1, 1, 1,
-1.657905, -0.246476, -1.401703, 1, 1, 1, 1, 1,
-1.656645, -0.9853112, -2.690318, 1, 1, 1, 1, 1,
-1.656519, 0.8226226, -0.7955556, 1, 1, 1, 1, 1,
-1.643259, 1.368926, -1.85336, 1, 1, 1, 1, 1,
-1.62424, 0.9946395, -1.267098, 1, 1, 1, 1, 1,
-1.621872, -0.1803724, -2.305434, 1, 1, 1, 1, 1,
-1.613927, -0.02767181, -0.8794652, 1, 1, 1, 1, 1,
-1.613151, 0.3220402, -1.084347, 1, 1, 1, 1, 1,
-1.602183, -1.1528, -2.928251, 0, 0, 1, 1, 1,
-1.572655, 0.5606357, 0.7516725, 1, 0, 0, 1, 1,
-1.561643, -0.7632163, -3.622672, 1, 0, 0, 1, 1,
-1.560444, -0.4023367, -0.2629294, 1, 0, 0, 1, 1,
-1.559757, 0.2485499, -1.410386, 1, 0, 0, 1, 1,
-1.555049, 0.9782817, -1.753118, 1, 0, 0, 1, 1,
-1.54883, 0.1293112, -1.397353, 0, 0, 0, 1, 1,
-1.545348, 1.091906, -0.5282916, 0, 0, 0, 1, 1,
-1.532544, -0.1006299, -1.537291, 0, 0, 0, 1, 1,
-1.52146, 1.494548, 0.02038622, 0, 0, 0, 1, 1,
-1.515661, -0.7017869, -2.305182, 0, 0, 0, 1, 1,
-1.513704, -0.3836353, -3.019699, 0, 0, 0, 1, 1,
-1.502445, 0.1622467, -1.213483, 0, 0, 0, 1, 1,
-1.489704, 0.6063493, -3.193248, 1, 1, 1, 1, 1,
-1.473683, -1.270972, -2.551814, 1, 1, 1, 1, 1,
-1.446832, -0.5268026, -2.448784, 1, 1, 1, 1, 1,
-1.443416, -0.4417914, -2.325902, 1, 1, 1, 1, 1,
-1.442185, -2.852414, -4.907533, 1, 1, 1, 1, 1,
-1.441843, 0.554538, -1.227531, 1, 1, 1, 1, 1,
-1.433144, 1.538824, -0.8562617, 1, 1, 1, 1, 1,
-1.431465, 0.9318366, -1.641016, 1, 1, 1, 1, 1,
-1.430508, 0.7132847, -1.885934, 1, 1, 1, 1, 1,
-1.399579, -0.3552912, -2.143543, 1, 1, 1, 1, 1,
-1.396687, 1.053695, -2.716686, 1, 1, 1, 1, 1,
-1.394347, 0.5001485, -1.658341, 1, 1, 1, 1, 1,
-1.393136, -0.4584033, -2.134488, 1, 1, 1, 1, 1,
-1.386003, -1.812061, -3.252688, 1, 1, 1, 1, 1,
-1.374871, -0.9131284, -3.215473, 1, 1, 1, 1, 1,
-1.351468, -0.993096, -0.3380044, 0, 0, 1, 1, 1,
-1.350196, -2.657249, -1.064055, 1, 0, 0, 1, 1,
-1.349249, 0.5102491, -2.233587, 1, 0, 0, 1, 1,
-1.347823, -0.7293329, -2.278239, 1, 0, 0, 1, 1,
-1.34304, -0.05061959, -2.051406, 1, 0, 0, 1, 1,
-1.340139, 1.344983, -0.9236032, 1, 0, 0, 1, 1,
-1.339847, 0.8534225, -1.210986, 0, 0, 0, 1, 1,
-1.33568, 0.9825715, -2.240826, 0, 0, 0, 1, 1,
-1.326404, 0.08459513, -2.422867, 0, 0, 0, 1, 1,
-1.321032, 0.5078459, -0.6391239, 0, 0, 0, 1, 1,
-1.318889, 1.434558, -2.161086, 0, 0, 0, 1, 1,
-1.314426, 0.2302708, -2.267385, 0, 0, 0, 1, 1,
-1.31094, 0.3119342, -2.890378, 0, 0, 0, 1, 1,
-1.308347, 0.8457039, -0.6447721, 1, 1, 1, 1, 1,
-1.307772, -1.295521, -3.921613, 1, 1, 1, 1, 1,
-1.300098, 0.1834209, -1.133618, 1, 1, 1, 1, 1,
-1.298602, 0.6320739, -2.363163, 1, 1, 1, 1, 1,
-1.284007, 1.013099, -1.183414, 1, 1, 1, 1, 1,
-1.264219, 0.5927723, -0.9739941, 1, 1, 1, 1, 1,
-1.256905, 1.613188, 0.3552574, 1, 1, 1, 1, 1,
-1.253584, -0.9320849, -4.345451, 1, 1, 1, 1, 1,
-1.246317, 0.5430888, -0.07330152, 1, 1, 1, 1, 1,
-1.240528, 0.2907918, -0.4842815, 1, 1, 1, 1, 1,
-1.240164, -0.8415559, -2.741016, 1, 1, 1, 1, 1,
-1.23549, -0.3270345, -1.378842, 1, 1, 1, 1, 1,
-1.234675, 1.245775, -1.48191, 1, 1, 1, 1, 1,
-1.234135, -1.073715, -2.637518, 1, 1, 1, 1, 1,
-1.23363, -0.7665929, -1.852315, 1, 1, 1, 1, 1,
-1.208199, 0.321214, -1.784999, 0, 0, 1, 1, 1,
-1.206644, 0.02306032, -0.9903269, 1, 0, 0, 1, 1,
-1.199221, 0.1851747, -1.170008, 1, 0, 0, 1, 1,
-1.194063, 0.1967418, -0.8396206, 1, 0, 0, 1, 1,
-1.172748, 0.1057768, -2.650827, 1, 0, 0, 1, 1,
-1.162086, 0.7570854, -2.433852, 1, 0, 0, 1, 1,
-1.161196, 0.1335341, -1.015469, 0, 0, 0, 1, 1,
-1.158775, -0.1316082, 0.3793866, 0, 0, 0, 1, 1,
-1.153941, 0.2963692, 0.224951, 0, 0, 0, 1, 1,
-1.147934, 1.662827, -1.167893, 0, 0, 0, 1, 1,
-1.143289, -1.31163, -1.905994, 0, 0, 0, 1, 1,
-1.138759, -2.301926, -2.365095, 0, 0, 0, 1, 1,
-1.138425, -0.06210207, -2.075011, 0, 0, 0, 1, 1,
-1.138005, -0.7321061, -3.490144, 1, 1, 1, 1, 1,
-1.135461, 0.04424817, 0.1816253, 1, 1, 1, 1, 1,
-1.134574, -1.18246, -2.422426, 1, 1, 1, 1, 1,
-1.133044, -0.6413442, -3.132751, 1, 1, 1, 1, 1,
-1.132614, 2.124668, -0.1483979, 1, 1, 1, 1, 1,
-1.123754, -0.2042035, -1.418021, 1, 1, 1, 1, 1,
-1.12242, 1.580766, 0.5571308, 1, 1, 1, 1, 1,
-1.11768, 2.22713, -2.322301, 1, 1, 1, 1, 1,
-1.111703, 1.624574, -0.09852765, 1, 1, 1, 1, 1,
-1.105693, 0.5423759, -2.150486, 1, 1, 1, 1, 1,
-1.102165, -0.5375953, -2.181846, 1, 1, 1, 1, 1,
-1.092037, -0.521075, -3.063383, 1, 1, 1, 1, 1,
-1.089292, -0.3677538, -1.742067, 1, 1, 1, 1, 1,
-1.084448, -1.052199, -1.367948, 1, 1, 1, 1, 1,
-1.082069, -0.2918224, -2.725349, 1, 1, 1, 1, 1,
-1.066443, -0.727499, -3.834605, 0, 0, 1, 1, 1,
-1.064359, 0.7014263, -2.006796, 1, 0, 0, 1, 1,
-1.063518, -1.202336, -1.526269, 1, 0, 0, 1, 1,
-1.063484, 0.5709713, -1.106455, 1, 0, 0, 1, 1,
-1.058298, 0.2981269, -2.05745, 1, 0, 0, 1, 1,
-1.058105, -0.5864103, -2.826101, 1, 0, 0, 1, 1,
-1.056045, 0.6160353, -1.011725, 0, 0, 0, 1, 1,
-1.052619, 0.4626758, 1.386742, 0, 0, 0, 1, 1,
-1.050483, -0.371949, -2.797744, 0, 0, 0, 1, 1,
-1.050098, -0.5422381, -2.749617, 0, 0, 0, 1, 1,
-1.04513, -0.04403982, -2.254994, 0, 0, 0, 1, 1,
-1.038526, 0.4649297, -0.4552337, 0, 0, 0, 1, 1,
-1.019665, 0.474649, -1.191735, 0, 0, 0, 1, 1,
-1.016115, 0.7323649, 0.04483467, 1, 1, 1, 1, 1,
-1.015813, 1.683572, -0.5977585, 1, 1, 1, 1, 1,
-1.015483, 1.223612, 1.425563, 1, 1, 1, 1, 1,
-0.9914359, 1.310034, -0.04710459, 1, 1, 1, 1, 1,
-0.9902234, 0.6284606, -1.331175, 1, 1, 1, 1, 1,
-0.9820086, 0.9095284, -0.655839, 1, 1, 1, 1, 1,
-0.9779927, 1.014608, -1.55349, 1, 1, 1, 1, 1,
-0.9726599, 0.5663325, -1.950294, 1, 1, 1, 1, 1,
-0.9684734, 0.3399641, -1.755833, 1, 1, 1, 1, 1,
-0.9615744, -1.05433, -2.531311, 1, 1, 1, 1, 1,
-0.956634, 0.7222978, -2.042188, 1, 1, 1, 1, 1,
-0.9465674, 0.1866377, -1.854927, 1, 1, 1, 1, 1,
-0.9413353, -0.6733482, -2.602418, 1, 1, 1, 1, 1,
-0.9302897, -0.8868225, -1.725555, 1, 1, 1, 1, 1,
-0.9295639, -0.3967548, -1.540805, 1, 1, 1, 1, 1,
-0.9234635, 1.816737, -1.587753, 0, 0, 1, 1, 1,
-0.9220668, -0.2309263, -1.267853, 1, 0, 0, 1, 1,
-0.9217023, -1.197547, -1.96473, 1, 0, 0, 1, 1,
-0.9213573, 0.7302148, -1.598395, 1, 0, 0, 1, 1,
-0.9210782, -0.8176752, -2.733381, 1, 0, 0, 1, 1,
-0.9208907, -1.405317, -2.011902, 1, 0, 0, 1, 1,
-0.9068503, -0.8437493, -1.668677, 0, 0, 0, 1, 1,
-0.9024261, -1.189909, -0.1083678, 0, 0, 0, 1, 1,
-0.9016674, 0.4066381, -1.696295, 0, 0, 0, 1, 1,
-0.8909974, -0.3678528, -2.693256, 0, 0, 0, 1, 1,
-0.8854961, -1.448108, -1.350455, 0, 0, 0, 1, 1,
-0.8853754, 0.5966144, -3.120582, 0, 0, 0, 1, 1,
-0.8825543, -0.09079393, -3.067723, 0, 0, 0, 1, 1,
-0.8767098, 0.2813083, 1.0207, 1, 1, 1, 1, 1,
-0.8762427, 0.03389053, -2.116709, 1, 1, 1, 1, 1,
-0.8756526, 1.392931, -1.990774, 1, 1, 1, 1, 1,
-0.8751546, 1.297278, 0.0005356477, 1, 1, 1, 1, 1,
-0.8710778, 0.2388142, -1.777508, 1, 1, 1, 1, 1,
-0.8633272, -1.003685, -3.425913, 1, 1, 1, 1, 1,
-0.8627823, 1.395273, 0.3054643, 1, 1, 1, 1, 1,
-0.8594875, 0.5056185, -0.6801117, 1, 1, 1, 1, 1,
-0.8551396, 1.090638, 0.4885894, 1, 1, 1, 1, 1,
-0.8510208, -1.572055, -0.4743448, 1, 1, 1, 1, 1,
-0.8434477, 0.2152819, -1.724057, 1, 1, 1, 1, 1,
-0.8415403, 0.6685087, 0.2002531, 1, 1, 1, 1, 1,
-0.83971, -0.05539456, -1.03216, 1, 1, 1, 1, 1,
-0.8362324, -1.900815, -3.570434, 1, 1, 1, 1, 1,
-0.8345228, -2.036978, -3.817261, 1, 1, 1, 1, 1,
-0.8294707, 0.9119854, -0.3760427, 0, 0, 1, 1, 1,
-0.8266689, -0.6635365, -2.640169, 1, 0, 0, 1, 1,
-0.8236424, 1.863086, 0.6047619, 1, 0, 0, 1, 1,
-0.8122517, 1.05476, -0.2957174, 1, 0, 0, 1, 1,
-0.8114905, 1.43093, -2.023422, 1, 0, 0, 1, 1,
-0.8092315, -0.5871161, -4.199009, 1, 0, 0, 1, 1,
-0.804932, -0.4896644, -2.338415, 0, 0, 0, 1, 1,
-0.8025078, -1.436691, -1.509932, 0, 0, 0, 1, 1,
-0.8005596, 0.2159836, 0.09964143, 0, 0, 0, 1, 1,
-0.7952905, -0.07505343, -2.690384, 0, 0, 0, 1, 1,
-0.7951932, -0.9147348, -2.863935, 0, 0, 0, 1, 1,
-0.7946991, 0.5632917, -2.933026, 0, 0, 0, 1, 1,
-0.7919398, 1.518884, 0.0228626, 0, 0, 0, 1, 1,
-0.7892388, 0.4367726, -0.7350344, 1, 1, 1, 1, 1,
-0.7866528, -0.08066909, -1.778327, 1, 1, 1, 1, 1,
-0.7853524, -0.4366041, -2.282982, 1, 1, 1, 1, 1,
-0.7786832, -0.9141903, -2.109456, 1, 1, 1, 1, 1,
-0.7762178, -0.4586886, -0.3787753, 1, 1, 1, 1, 1,
-0.7735229, -0.209151, -2.2321, 1, 1, 1, 1, 1,
-0.7726682, 0.1035431, -2.813084, 1, 1, 1, 1, 1,
-0.7679083, 0.5365681, -0.8215602, 1, 1, 1, 1, 1,
-0.7636321, -0.3846876, -1.673558, 1, 1, 1, 1, 1,
-0.7622084, -2.155292, -4.056887, 1, 1, 1, 1, 1,
-0.7587605, 0.9386508, -1.762832, 1, 1, 1, 1, 1,
-0.7577366, 2.510803, -1.454196, 1, 1, 1, 1, 1,
-0.75226, 0.002209026, -1.475985, 1, 1, 1, 1, 1,
-0.7518689, -1.885089, -2.067636, 1, 1, 1, 1, 1,
-0.751355, -0.8528985, -2.57908, 1, 1, 1, 1, 1,
-0.750272, -1.823724, -2.8359, 0, 0, 1, 1, 1,
-0.7473686, -2.006696, -3.664302, 1, 0, 0, 1, 1,
-0.7466878, 0.4824407, -0.05820033, 1, 0, 0, 1, 1,
-0.7447655, -0.8194075, -1.860329, 1, 0, 0, 1, 1,
-0.7399747, 2.610664, -0.06805407, 1, 0, 0, 1, 1,
-0.7391773, -0.8653762, -2.984222, 1, 0, 0, 1, 1,
-0.7346784, 0.5154437, 0.7331602, 0, 0, 0, 1, 1,
-0.7323831, 0.4522582, -2.001085, 0, 0, 0, 1, 1,
-0.7318612, -1.140467, -4.214587, 0, 0, 0, 1, 1,
-0.7266111, 0.2677746, -1.555081, 0, 0, 0, 1, 1,
-0.7254267, -1.007327, -3.628195, 0, 0, 0, 1, 1,
-0.7181669, -0.08851491, -0.1375176, 0, 0, 0, 1, 1,
-0.716718, 0.9624149, -0.7235391, 0, 0, 0, 1, 1,
-0.7096987, 0.4759423, -0.2703448, 1, 1, 1, 1, 1,
-0.7076184, 0.04547391, -2.742618, 1, 1, 1, 1, 1,
-0.7060858, -0.1055982, -1.37383, 1, 1, 1, 1, 1,
-0.6999374, -0.7708198, -1.998767, 1, 1, 1, 1, 1,
-0.6992382, -1.024131, -2.622601, 1, 1, 1, 1, 1,
-0.6978617, 1.641146, 0.3282023, 1, 1, 1, 1, 1,
-0.6978179, -0.7709506, -2.34544, 1, 1, 1, 1, 1,
-0.6977107, -2.857977, -3.46258, 1, 1, 1, 1, 1,
-0.6974779, 1.272054, 0.1472778, 1, 1, 1, 1, 1,
-0.6914645, 1.48627, -0.2095756, 1, 1, 1, 1, 1,
-0.6913736, -2.145865, -2.87131, 1, 1, 1, 1, 1,
-0.684929, 0.0315569, -0.6702983, 1, 1, 1, 1, 1,
-0.6813594, 0.4525392, -2.521245, 1, 1, 1, 1, 1,
-0.6749156, 1.597501, 0.3596329, 1, 1, 1, 1, 1,
-0.6734271, 0.1954238, -2.542239, 1, 1, 1, 1, 1,
-0.6696983, 0.5072544, 0.7703252, 0, 0, 1, 1, 1,
-0.6676123, -0.8953832, -2.789572, 1, 0, 0, 1, 1,
-0.6657714, 0.1661295, -2.202618, 1, 0, 0, 1, 1,
-0.6638851, -1.489316, -2.381374, 1, 0, 0, 1, 1,
-0.6541352, -0.4944388, -2.905556, 1, 0, 0, 1, 1,
-0.6515282, -0.4878031, -4.703284, 1, 0, 0, 1, 1,
-0.650435, -1.776893, -2.391257, 0, 0, 0, 1, 1,
-0.6499358, 1.163149, -1.416801, 0, 0, 0, 1, 1,
-0.6432995, -0.708777, -1.346137, 0, 0, 0, 1, 1,
-0.6371459, -0.3720321, -3.169445, 0, 0, 0, 1, 1,
-0.6358686, 0.4400363, -2.346591, 0, 0, 0, 1, 1,
-0.6348333, 0.08836977, -1.974177, 0, 0, 0, 1, 1,
-0.6325505, 0.186042, -2.132663, 0, 0, 0, 1, 1,
-0.6302171, -1.056176, -2.665695, 1, 1, 1, 1, 1,
-0.6278515, 0.3751369, -0.3403994, 1, 1, 1, 1, 1,
-0.6147225, -0.2305182, -1.370101, 1, 1, 1, 1, 1,
-0.6128143, 1.586167, -1.977414, 1, 1, 1, 1, 1,
-0.6122727, 1.330976, 1.518005, 1, 1, 1, 1, 1,
-0.6094044, 1.154169, 0.8294026, 1, 1, 1, 1, 1,
-0.6092667, -0.3567536, -1.830653, 1, 1, 1, 1, 1,
-0.6037239, -1.087063, -4.172149, 1, 1, 1, 1, 1,
-0.6032806, -0.6450272, -2.099217, 1, 1, 1, 1, 1,
-0.6016602, -0.0931809, -0.1462078, 1, 1, 1, 1, 1,
-0.5958084, -0.2049648, -2.992611, 1, 1, 1, 1, 1,
-0.5952628, -0.6089554, -2.715048, 1, 1, 1, 1, 1,
-0.5923856, -1.047024, -2.74736, 1, 1, 1, 1, 1,
-0.5906615, 0.2220261, -1.580905, 1, 1, 1, 1, 1,
-0.5892907, -1.802307, -1.756495, 1, 1, 1, 1, 1,
-0.5823998, -0.4344006, -1.858451, 0, 0, 1, 1, 1,
-0.5765703, 0.5389324, 0.8502679, 1, 0, 0, 1, 1,
-0.5733277, 1.832226, 0.0283965, 1, 0, 0, 1, 1,
-0.568383, 0.4091965, -1.196839, 1, 0, 0, 1, 1,
-0.5676855, 0.9021156, -0.9216923, 1, 0, 0, 1, 1,
-0.5658761, 0.6250528, 0.5242889, 1, 0, 0, 1, 1,
-0.5624439, -0.3588345, -0.3528609, 0, 0, 0, 1, 1,
-0.5608932, -0.5665633, -1.994114, 0, 0, 0, 1, 1,
-0.5575985, -0.3653908, -3.921819, 0, 0, 0, 1, 1,
-0.5546244, 0.4346382, -0.6413189, 0, 0, 0, 1, 1,
-0.5491187, 1.527359, -1.951171, 0, 0, 0, 1, 1,
-0.5465414, 2.053388, -0.267691, 0, 0, 0, 1, 1,
-0.5465063, -0.6202587, -2.901345, 0, 0, 0, 1, 1,
-0.5462145, -0.3950357, -4.142936, 1, 1, 1, 1, 1,
-0.5447777, 0.1976517, -1.174335, 1, 1, 1, 1, 1,
-0.5444791, -1.497487, -3.066819, 1, 1, 1, 1, 1,
-0.5429878, 0.3647081, -1.35534, 1, 1, 1, 1, 1,
-0.54259, -2.34312, -1.237497, 1, 1, 1, 1, 1,
-0.5422319, 0.7053787, 0.5701806, 1, 1, 1, 1, 1,
-0.5421774, 1.15016, -0.756228, 1, 1, 1, 1, 1,
-0.540476, 0.7526608, -1.15095, 1, 1, 1, 1, 1,
-0.5384137, 1.163586, 0.2960894, 1, 1, 1, 1, 1,
-0.5326528, 0.7692487, -0.2185931, 1, 1, 1, 1, 1,
-0.5323129, -1.67746, -3.081854, 1, 1, 1, 1, 1,
-0.5317122, 0.6694746, -0.2477438, 1, 1, 1, 1, 1,
-0.5309758, -0.4396213, -2.867091, 1, 1, 1, 1, 1,
-0.5285835, -0.1090976, -1.343675, 1, 1, 1, 1, 1,
-0.5271191, -0.02569816, -0.6811783, 1, 1, 1, 1, 1,
-0.5232403, -0.1703951, -2.22407, 0, 0, 1, 1, 1,
-0.5193352, 1.700955, -0.07110906, 1, 0, 0, 1, 1,
-0.5192072, -0.8832839, -2.809482, 1, 0, 0, 1, 1,
-0.5134555, 0.7356598, -0.7501868, 1, 0, 0, 1, 1,
-0.5078903, -0.1035442, -2.643121, 1, 0, 0, 1, 1,
-0.5010014, -0.6166109, -2.064144, 1, 0, 0, 1, 1,
-0.4997594, -0.8677795, -1.948699, 0, 0, 0, 1, 1,
-0.4981739, 0.1140135, -0.889788, 0, 0, 0, 1, 1,
-0.4918605, -0.556066, -2.93141, 0, 0, 0, 1, 1,
-0.488538, -1.787748, -0.2474144, 0, 0, 0, 1, 1,
-0.4828814, 0.7545097, 0.00887249, 0, 0, 0, 1, 1,
-0.4788503, -1.81076, -1.324552, 0, 0, 0, 1, 1,
-0.4739971, -0.3003957, -2.169902, 0, 0, 0, 1, 1,
-0.4731465, -0.3441206, -3.543538, 1, 1, 1, 1, 1,
-0.4730098, 0.2034964, 0.1863156, 1, 1, 1, 1, 1,
-0.4706714, -0.07866465, -2.142908, 1, 1, 1, 1, 1,
-0.4659061, -0.6567492, -1.477167, 1, 1, 1, 1, 1,
-0.4643447, 0.1872304, -1.000484, 1, 1, 1, 1, 1,
-0.4640157, -0.5519786, -3.659343, 1, 1, 1, 1, 1,
-0.4637612, 0.7585631, 0.4366681, 1, 1, 1, 1, 1,
-0.4635222, -0.8295278, -2.26126, 1, 1, 1, 1, 1,
-0.4626456, 0.09202442, -3.469145, 1, 1, 1, 1, 1,
-0.4618555, -0.7069238, -2.333237, 1, 1, 1, 1, 1,
-0.461263, -0.5264897, -4.811809, 1, 1, 1, 1, 1,
-0.4599168, -0.6526949, -1.245499, 1, 1, 1, 1, 1,
-0.4577177, 0.6794409, -2.203653, 1, 1, 1, 1, 1,
-0.4538786, -0.2374893, -2.866011, 1, 1, 1, 1, 1,
-0.4476291, 0.4438209, -0.2244821, 1, 1, 1, 1, 1,
-0.4432039, -0.4638341, -1.173173, 0, 0, 1, 1, 1,
-0.442452, -0.8608229, -1.000914, 1, 0, 0, 1, 1,
-0.4414302, 2.193957, -1.061192, 1, 0, 0, 1, 1,
-0.4409762, -0.6402511, -3.482944, 1, 0, 0, 1, 1,
-0.4311596, 0.2844093, -0.1888428, 1, 0, 0, 1, 1,
-0.4231711, 0.04664966, -1.666315, 1, 0, 0, 1, 1,
-0.4213691, 0.4026037, -1.182306, 0, 0, 0, 1, 1,
-0.41993, -1.192999, -2.726459, 0, 0, 0, 1, 1,
-0.4177142, 0.09928151, -0.8469452, 0, 0, 0, 1, 1,
-0.4147703, 0.8491186, 0.3902021, 0, 0, 0, 1, 1,
-0.4088509, 2.39536, 1.866059, 0, 0, 0, 1, 1,
-0.4079271, -0.00576344, -2.968263, 0, 0, 0, 1, 1,
-0.405878, 0.7366499, -2.240716, 0, 0, 0, 1, 1,
-0.404107, 0.1328853, 0.1869274, 1, 1, 1, 1, 1,
-0.4011295, -0.4801875, -1.48256, 1, 1, 1, 1, 1,
-0.3888092, -0.9467878, -0.606905, 1, 1, 1, 1, 1,
-0.3880675, -0.8682193, -1.977477, 1, 1, 1, 1, 1,
-0.3851911, 1.023479, 0.4746533, 1, 1, 1, 1, 1,
-0.3845054, -0.4580884, -2.504504, 1, 1, 1, 1, 1,
-0.3822924, -0.7912518, -3.81242, 1, 1, 1, 1, 1,
-0.3819772, 1.599959, -1.33223, 1, 1, 1, 1, 1,
-0.3802618, 0.6256979, 1.280141, 1, 1, 1, 1, 1,
-0.3775246, -0.5374959, -1.974536, 1, 1, 1, 1, 1,
-0.3732657, 0.7695059, -0.7111782, 1, 1, 1, 1, 1,
-0.3685643, -0.1611497, -2.641073, 1, 1, 1, 1, 1,
-0.364129, -0.1162679, -1.74771, 1, 1, 1, 1, 1,
-0.3614339, -0.4370068, -0.8711849, 1, 1, 1, 1, 1,
-0.3613718, -1.04267, -2.761426, 1, 1, 1, 1, 1,
-0.3590572, 0.8280471, -0.6476389, 0, 0, 1, 1, 1,
-0.3559034, 1.384539, 0.4677736, 1, 0, 0, 1, 1,
-0.3486632, -1.113519, -1.101452, 1, 0, 0, 1, 1,
-0.3481984, 0.5340838, 0.7220341, 1, 0, 0, 1, 1,
-0.3460965, -0.4246469, -2.398375, 1, 0, 0, 1, 1,
-0.3453024, 0.5323671, -2.672762, 1, 0, 0, 1, 1,
-0.3431429, -0.07829294, -0.3899175, 0, 0, 0, 1, 1,
-0.3419716, 1.432273, -0.7607852, 0, 0, 0, 1, 1,
-0.3412636, -0.9794012, -3.691693, 0, 0, 0, 1, 1,
-0.3306655, -1.292145, -3.175447, 0, 0, 0, 1, 1,
-0.3281689, 0.856991, -0.4464863, 0, 0, 0, 1, 1,
-0.3277202, -0.6428032, -1.983651, 0, 0, 0, 1, 1,
-0.3235588, 1.083558, -1.726284, 0, 0, 0, 1, 1,
-0.3188441, 0.8918937, -0.3465886, 1, 1, 1, 1, 1,
-0.3175658, -0.451328, -2.658669, 1, 1, 1, 1, 1,
-0.315962, -1.090636, -2.337135, 1, 1, 1, 1, 1,
-0.3101944, 1.667871, 1.790674, 1, 1, 1, 1, 1,
-0.2984721, 0.08211271, -3.620983, 1, 1, 1, 1, 1,
-0.2929184, 0.455913, -0.7149795, 1, 1, 1, 1, 1,
-0.2904334, 0.1748736, -0.7299743, 1, 1, 1, 1, 1,
-0.2887037, -0.2961848, -1.792096, 1, 1, 1, 1, 1,
-0.2881517, 0.1437955, -1.027903, 1, 1, 1, 1, 1,
-0.2864315, 0.3119223, -1.228327, 1, 1, 1, 1, 1,
-0.2848116, -0.4020852, -1.792099, 1, 1, 1, 1, 1,
-0.2842521, 0.3114612, 0.8383046, 1, 1, 1, 1, 1,
-0.2836748, 0.1326917, 0.1485316, 1, 1, 1, 1, 1,
-0.2824477, 0.2206704, -0.6185986, 1, 1, 1, 1, 1,
-0.2768181, 1.14332, -0.8258278, 1, 1, 1, 1, 1,
-0.2733737, -0.02506779, -1.875069, 0, 0, 1, 1, 1,
-0.2731079, 1.398227, 0.6683979, 1, 0, 0, 1, 1,
-0.2689252, -1.924429, -1.380502, 1, 0, 0, 1, 1,
-0.2670816, -1.201699, -0.8862324, 1, 0, 0, 1, 1,
-0.2639383, -2.614897, -4.326804, 1, 0, 0, 1, 1,
-0.2584657, 0.8053814, -1.179927, 1, 0, 0, 1, 1,
-0.2572488, 0.1247642, -2.218579, 0, 0, 0, 1, 1,
-0.2553594, -0.01662394, -1.005796, 0, 0, 0, 1, 1,
-0.2529809, 0.3313724, 0.4347849, 0, 0, 0, 1, 1,
-0.2526274, -0.5848027, -2.9938, 0, 0, 0, 1, 1,
-0.2517897, 0.02389763, -1.061449, 0, 0, 0, 1, 1,
-0.2473019, 0.4908406, 0.1547748, 0, 0, 0, 1, 1,
-0.2468506, 1.353819, -0.6516215, 0, 0, 0, 1, 1,
-0.2465729, -0.2416626, -1.134554, 1, 1, 1, 1, 1,
-0.2459874, -1.66683, -2.587823, 1, 1, 1, 1, 1,
-0.2444355, -0.5680978, -1.728027, 1, 1, 1, 1, 1,
-0.2440852, -0.3519837, -1.626728, 1, 1, 1, 1, 1,
-0.2420915, -0.4547037, -3.924391, 1, 1, 1, 1, 1,
-0.2417534, -0.3000865, -0.5883198, 1, 1, 1, 1, 1,
-0.2413397, 0.4803773, -0.7707804, 1, 1, 1, 1, 1,
-0.2402376, -0.7857792, -3.835775, 1, 1, 1, 1, 1,
-0.2381654, 1.334663, -0.2997927, 1, 1, 1, 1, 1,
-0.2374829, -0.4888835, -2.514673, 1, 1, 1, 1, 1,
-0.2346241, 0.9505553, 0.4590252, 1, 1, 1, 1, 1,
-0.2339442, 1.729533, 0.1960028, 1, 1, 1, 1, 1,
-0.2326174, -0.1293485, -2.032482, 1, 1, 1, 1, 1,
-0.2302105, 0.7822231, 1.008107, 1, 1, 1, 1, 1,
-0.2275312, -1.073465, -1.557635, 1, 1, 1, 1, 1,
-0.2215837, 0.4125646, -0.5599942, 0, 0, 1, 1, 1,
-0.2189843, -0.2402729, -1.389755, 1, 0, 0, 1, 1,
-0.2174221, 0.6873672, 1.429656, 1, 0, 0, 1, 1,
-0.2158186, -0.1356957, -3.133808, 1, 0, 0, 1, 1,
-0.2095814, 0.5109752, -0.03236627, 1, 0, 0, 1, 1,
-0.2075139, 0.1937358, 1.296913, 1, 0, 0, 1, 1,
-0.2073594, 0.05634713, -0.6781635, 0, 0, 0, 1, 1,
-0.2069282, 1.904824, -0.1531195, 0, 0, 0, 1, 1,
-0.2066929, -0.1680613, -2.85182, 0, 0, 0, 1, 1,
-0.199161, 0.3807008, -1.940884, 0, 0, 0, 1, 1,
-0.1988441, -1.423663, -3.029754, 0, 0, 0, 1, 1,
-0.1952305, -1.121218, -1.575727, 0, 0, 0, 1, 1,
-0.1876031, 0.4795606, -0.7275453, 0, 0, 0, 1, 1,
-0.1861556, -0.4142339, -2.415664, 1, 1, 1, 1, 1,
-0.1841146, -0.5804068, -4.889968, 1, 1, 1, 1, 1,
-0.1839952, -0.4218125, -3.676694, 1, 1, 1, 1, 1,
-0.183891, -0.5998305, -2.485743, 1, 1, 1, 1, 1,
-0.1835269, 0.5896533, -2.416378, 1, 1, 1, 1, 1,
-0.1820914, -1.447961, -3.461338, 1, 1, 1, 1, 1,
-0.1810211, 1.787539, 0.328384, 1, 1, 1, 1, 1,
-0.1801118, 0.4687974, -1.100821, 1, 1, 1, 1, 1,
-0.1722274, -0.5280806, -3.608101, 1, 1, 1, 1, 1,
-0.1664759, -1.745522, -0.08250999, 1, 1, 1, 1, 1,
-0.1651213, 0.5499862, -0.8007363, 1, 1, 1, 1, 1,
-0.1617893, 0.1471128, 1.501047, 1, 1, 1, 1, 1,
-0.161783, -0.02795042, -2.066259, 1, 1, 1, 1, 1,
-0.1595433, 1.049556, -0.4701934, 1, 1, 1, 1, 1,
-0.1591875, 1.890107, -0.03277549, 1, 1, 1, 1, 1,
-0.1584115, -0.5815362, -2.923146, 0, 0, 1, 1, 1,
-0.1582349, -1.791924, -1.270434, 1, 0, 0, 1, 1,
-0.1580548, 0.02589934, -1.848447, 1, 0, 0, 1, 1,
-0.1498465, 1.783686, -1.020131, 1, 0, 0, 1, 1,
-0.1452905, -0.2898802, -2.323606, 1, 0, 0, 1, 1,
-0.1437436, 0.2681113, -1.150132, 1, 0, 0, 1, 1,
-0.1414229, -0.8869872, -2.940727, 0, 0, 0, 1, 1,
-0.1394396, -0.2992292, -1.924478, 0, 0, 0, 1, 1,
-0.1370948, -0.04123412, -3.004748, 0, 0, 0, 1, 1,
-0.1367334, -0.2365912, -2.507212, 0, 0, 0, 1, 1,
-0.1359349, 0.6484054, 1.487862, 0, 0, 0, 1, 1,
-0.1339933, 1.067168, -0.3247618, 0, 0, 0, 1, 1,
-0.1328682, 0.9055619, -1.897708, 0, 0, 0, 1, 1,
-0.1300186, -1.91107, -4.284809, 1, 1, 1, 1, 1,
-0.1295855, -0.7411013, -3.854355, 1, 1, 1, 1, 1,
-0.1293027, -1.401742, -1.446045, 1, 1, 1, 1, 1,
-0.1285694, 2.310435, -0.5669507, 1, 1, 1, 1, 1,
-0.1261929, -2.100839, -2.416545, 1, 1, 1, 1, 1,
-0.1243751, -0.6706648, -3.661318, 1, 1, 1, 1, 1,
-0.1212569, 0.09640569, -1.432026, 1, 1, 1, 1, 1,
-0.1181792, -1.27559, -3.795589, 1, 1, 1, 1, 1,
-0.1153305, 1.933602, 1.917605, 1, 1, 1, 1, 1,
-0.1148738, -0.1555142, -2.990442, 1, 1, 1, 1, 1,
-0.1129541, -0.5511822, -1.845568, 1, 1, 1, 1, 1,
-0.1098889, 0.1867372, -1.106632, 1, 1, 1, 1, 1,
-0.1097314, 1.142551, 1.627397, 1, 1, 1, 1, 1,
-0.1091911, -0.5279389, -3.810173, 1, 1, 1, 1, 1,
-0.1081347, -0.6980645, -3.359552, 1, 1, 1, 1, 1,
-0.0996924, 1.661031, -0.8736917, 0, 0, 1, 1, 1,
-0.09810962, -0.4099363, -4.09866, 1, 0, 0, 1, 1,
-0.09324226, 0.02690549, -0.8829126, 1, 0, 0, 1, 1,
-0.09167179, 0.572517, -0.1475065, 1, 0, 0, 1, 1,
-0.08844861, 0.7105255, -0.8967775, 1, 0, 0, 1, 1,
-0.08807709, -0.7345558, -3.063479, 1, 0, 0, 1, 1,
-0.08799613, 0.766531, -1.773461, 0, 0, 0, 1, 1,
-0.08023775, 0.4440491, 0.03294461, 0, 0, 0, 1, 1,
-0.07961287, -0.1924096, -2.891195, 0, 0, 0, 1, 1,
-0.07392089, 0.8493652, 0.187848, 0, 0, 0, 1, 1,
-0.07323284, 2.551141, -0.9778074, 0, 0, 0, 1, 1,
-0.07303927, -0.04316759, -2.582115, 0, 0, 0, 1, 1,
-0.07206452, -0.5288593, -2.99366, 0, 0, 0, 1, 1,
-0.06896316, 1.170164, 0.05176529, 1, 1, 1, 1, 1,
-0.06519658, -0.5012099, -4.059581, 1, 1, 1, 1, 1,
-0.06270096, 0.1291908, -0.1677952, 1, 1, 1, 1, 1,
-0.06042954, -0.9833239, -2.59251, 1, 1, 1, 1, 1,
-0.05781276, 0.2877996, -1.463133, 1, 1, 1, 1, 1,
-0.05375271, -0.1084754, -2.388281, 1, 1, 1, 1, 1,
-0.05081993, 0.7291014, -0.1202403, 1, 1, 1, 1, 1,
-0.04707012, 0.5043669, 1.726469, 1, 1, 1, 1, 1,
-0.04561212, 1.307993, 1.030756, 1, 1, 1, 1, 1,
-0.0399515, -0.2490417, -4.50724, 1, 1, 1, 1, 1,
-0.03497864, 0.9226086, -0.1706772, 1, 1, 1, 1, 1,
-0.03254375, 1.303535, -0.2064716, 1, 1, 1, 1, 1,
-0.03006752, 1.234766, 0.8832589, 1, 1, 1, 1, 1,
-0.02892661, 1.106688, -0.07592185, 1, 1, 1, 1, 1,
-0.0152302, -2.260702, -3.097994, 1, 1, 1, 1, 1,
-0.01430739, 0.02870123, -1.944757, 0, 0, 1, 1, 1,
-0.006582309, 1.761943, -0.06290076, 1, 0, 0, 1, 1,
-0.005337084, -0.7354178, -2.02727, 1, 0, 0, 1, 1,
-0.002246102, 0.2715801, -0.2001072, 1, 0, 0, 1, 1,
0.002196417, 0.8608906, 1.019529, 1, 0, 0, 1, 1,
0.00256763, -0.7911968, 3.668698, 1, 0, 0, 1, 1,
0.007870745, 0.4395534, -1.806214, 0, 0, 0, 1, 1,
0.008490457, -0.1477179, 3.297897, 0, 0, 0, 1, 1,
0.008790699, 0.8314471, -0.1035802, 0, 0, 0, 1, 1,
0.01328287, -0.5912911, 3.151034, 0, 0, 0, 1, 1,
0.01742061, -0.003868644, 0.3827162, 0, 0, 0, 1, 1,
0.01752423, -1.515274, 5.432495, 0, 0, 0, 1, 1,
0.01763512, -0.001334107, 2.016879, 0, 0, 0, 1, 1,
0.01900815, 0.6342874, 0.8968861, 1, 1, 1, 1, 1,
0.02028999, -0.1962767, 3.729416, 1, 1, 1, 1, 1,
0.02037159, -0.7795055, 2.421838, 1, 1, 1, 1, 1,
0.02540805, 0.4315763, 1.225946, 1, 1, 1, 1, 1,
0.02725154, 0.1075111, 0.3448633, 1, 1, 1, 1, 1,
0.02769137, 0.2619194, -0.401482, 1, 1, 1, 1, 1,
0.03026847, 0.6143987, 1.335721, 1, 1, 1, 1, 1,
0.03177012, 0.9783337, -1.112354, 1, 1, 1, 1, 1,
0.03434843, -0.3912509, 4.644886, 1, 1, 1, 1, 1,
0.03751582, 0.5204382, 0.8069551, 1, 1, 1, 1, 1,
0.03954447, 0.69816, -0.2299489, 1, 1, 1, 1, 1,
0.05310142, 0.7295786, 2.037393, 1, 1, 1, 1, 1,
0.05512993, 0.2916109, 0.9675743, 1, 1, 1, 1, 1,
0.05755394, 0.7201811, -0.624324, 1, 1, 1, 1, 1,
0.05766824, 0.7448085, 1.15374, 1, 1, 1, 1, 1,
0.05823752, 1.288491, -0.2800814, 0, 0, 1, 1, 1,
0.06147025, 0.3204221, 0.4211481, 1, 0, 0, 1, 1,
0.06339981, 0.7319258, -0.4048882, 1, 0, 0, 1, 1,
0.07316539, 0.2796582, 0.8801498, 1, 0, 0, 1, 1,
0.07324602, 0.4245491, 1.376184, 1, 0, 0, 1, 1,
0.0736187, 0.3603482, -0.1665908, 1, 0, 0, 1, 1,
0.08092891, 1.743394, 0.1796579, 0, 0, 0, 1, 1,
0.08303892, -0.6526333, 2.007159, 0, 0, 0, 1, 1,
0.08599943, -0.1679129, 1.490657, 0, 0, 0, 1, 1,
0.09847029, 0.376283, 1.645983, 0, 0, 0, 1, 1,
0.09943662, -0.4969698, 3.299832, 0, 0, 0, 1, 1,
0.09955991, 0.4704719, 1.103016, 0, 0, 0, 1, 1,
0.100013, 0.3068879, 0.2761424, 0, 0, 0, 1, 1,
0.1021182, -2.029213, 4.108024, 1, 1, 1, 1, 1,
0.1182886, -0.6576495, 3.259064, 1, 1, 1, 1, 1,
0.1274285, -1.453762, 4.59402, 1, 1, 1, 1, 1,
0.1287948, -0.5173786, 1.925397, 1, 1, 1, 1, 1,
0.1311037, 1.265697, -2.169351, 1, 1, 1, 1, 1,
0.1317374, -0.4659686, 3.346699, 1, 1, 1, 1, 1,
0.1319943, -2.227638, 2.799844, 1, 1, 1, 1, 1,
0.1374312, -1.888491, 1.669446, 1, 1, 1, 1, 1,
0.1375688, 1.539225, -0.2243616, 1, 1, 1, 1, 1,
0.1433519, 1.495105, 0.2143762, 1, 1, 1, 1, 1,
0.1451158, -0.122124, 2.228095, 1, 1, 1, 1, 1,
0.1453648, -0.8733687, 2.123877, 1, 1, 1, 1, 1,
0.1548021, -0.3803619, 0.94196, 1, 1, 1, 1, 1,
0.1598745, 0.1559642, -0.03884188, 1, 1, 1, 1, 1,
0.1613027, 0.946894, -0.08174518, 1, 1, 1, 1, 1,
0.1633746, 0.9794315, 0.4588158, 0, 0, 1, 1, 1,
0.1648144, 2.394343, -1.572957, 1, 0, 0, 1, 1,
0.1674994, 0.05144243, 0.775919, 1, 0, 0, 1, 1,
0.167713, -0.253899, 3.192962, 1, 0, 0, 1, 1,
0.1695693, 0.7284977, -1.488467, 1, 0, 0, 1, 1,
0.1705189, 0.3969404, 1.819198, 1, 0, 0, 1, 1,
0.1707021, -1.475507, 4.096224, 0, 0, 0, 1, 1,
0.1707668, 1.680702, 0.9375044, 0, 0, 0, 1, 1,
0.1716875, 0.9225668, 0.2690002, 0, 0, 0, 1, 1,
0.1724603, -1.000345, 2.559799, 0, 0, 0, 1, 1,
0.1745463, 1.642059, -0.2749977, 0, 0, 0, 1, 1,
0.1794252, -1.429531, 2.368408, 0, 0, 0, 1, 1,
0.1824968, 1.31514, -0.2586952, 0, 0, 0, 1, 1,
0.1856086, 0.4463807, -1.265613, 1, 1, 1, 1, 1,
0.1876519, -0.008520642, 1.841337, 1, 1, 1, 1, 1,
0.1897716, -0.09997957, 1.702738, 1, 1, 1, 1, 1,
0.1902193, 0.7544475, 0.8308328, 1, 1, 1, 1, 1,
0.1927894, -0.263333, 2.379195, 1, 1, 1, 1, 1,
0.1936448, -0.1904256, -0.6366735, 1, 1, 1, 1, 1,
0.197068, 0.1050628, 1.026867, 1, 1, 1, 1, 1,
0.1987309, 0.08462533, 0.6976287, 1, 1, 1, 1, 1,
0.1998463, 0.3369594, 0.6287733, 1, 1, 1, 1, 1,
0.2024351, 2.022526, -0.2616429, 1, 1, 1, 1, 1,
0.2137649, -0.9230799, 0.8286632, 1, 1, 1, 1, 1,
0.2149173, 0.02528186, 1.461654, 1, 1, 1, 1, 1,
0.2164049, -0.656088, 3.080912, 1, 1, 1, 1, 1,
0.2181097, -0.05609199, 2.685131, 1, 1, 1, 1, 1,
0.219251, -2.083638, 1.804801, 1, 1, 1, 1, 1,
0.2201685, -0.4647915, 2.852564, 0, 0, 1, 1, 1,
0.2241918, 0.5478987, -1.00232, 1, 0, 0, 1, 1,
0.2281905, 2.063776, 0.2893929, 1, 0, 0, 1, 1,
0.2285119, -1.22538, 3.371927, 1, 0, 0, 1, 1,
0.2297874, 0.4076496, 1.069569, 1, 0, 0, 1, 1,
0.234471, 0.3354733, 0.7023872, 1, 0, 0, 1, 1,
0.2357213, 2.654985, 1.818133, 0, 0, 0, 1, 1,
0.2385396, -0.2720598, 1.659913, 0, 0, 0, 1, 1,
0.2420786, 0.139507, 0.3720658, 0, 0, 0, 1, 1,
0.2427285, -1.11927, 3.554938, 0, 0, 0, 1, 1,
0.2428068, -0.4254423, 2.472562, 0, 0, 0, 1, 1,
0.2438896, 0.8388385, 0.4729195, 0, 0, 0, 1, 1,
0.2453604, -0.2380932, 2.606518, 0, 0, 0, 1, 1,
0.2500051, -0.3913957, 2.769929, 1, 1, 1, 1, 1,
0.2524067, 1.101659, -1.389014, 1, 1, 1, 1, 1,
0.2532313, -0.2286553, 2.108875, 1, 1, 1, 1, 1,
0.2548815, -0.6866648, 2.737999, 1, 1, 1, 1, 1,
0.2552684, 0.4670123, 0.5514064, 1, 1, 1, 1, 1,
0.2559307, 0.6671261, 1.315566, 1, 1, 1, 1, 1,
0.2568801, -0.7460839, 4.487064, 1, 1, 1, 1, 1,
0.2592536, -0.8478487, 2.434366, 1, 1, 1, 1, 1,
0.2677703, -0.1564208, 2.03475, 1, 1, 1, 1, 1,
0.267995, -0.08140846, 1.106942, 1, 1, 1, 1, 1,
0.2702022, -0.4071822, 1.592692, 1, 1, 1, 1, 1,
0.2703626, 0.03775915, 0.9096277, 1, 1, 1, 1, 1,
0.2719415, -0.0668383, 1.029307, 1, 1, 1, 1, 1,
0.2732567, 0.4832993, -0.6322836, 1, 1, 1, 1, 1,
0.2745304, -0.1868144, 1.858582, 1, 1, 1, 1, 1,
0.2806626, -2.556767, 1.547194, 0, 0, 1, 1, 1,
0.2834813, 0.005661774, 1.157585, 1, 0, 0, 1, 1,
0.2864514, 0.04803075, 2.571296, 1, 0, 0, 1, 1,
0.2866547, -0.3468883, 2.250858, 1, 0, 0, 1, 1,
0.2882266, 0.209751, 0.1517751, 1, 0, 0, 1, 1,
0.2891476, -0.2170353, 2.670503, 1, 0, 0, 1, 1,
0.2937879, -1.29503, 2.650694, 0, 0, 0, 1, 1,
0.2970228, 0.4665363, 0.09445878, 0, 0, 0, 1, 1,
0.2983535, -0.7229324, 3.402765, 0, 0, 0, 1, 1,
0.2984875, 1.96671, 1.049783, 0, 0, 0, 1, 1,
0.2997539, -0.06327255, 2.633184, 0, 0, 0, 1, 1,
0.3014328, 0.307022, 2.304856, 0, 0, 0, 1, 1,
0.3036655, -0.7064808, 2.53743, 0, 0, 0, 1, 1,
0.309727, -1.039403, 2.249954, 1, 1, 1, 1, 1,
0.3178665, -0.5091508, 2.141962, 1, 1, 1, 1, 1,
0.3187522, 0.1517422, 1.92361, 1, 1, 1, 1, 1,
0.3199942, -0.6209762, 5.756622, 1, 1, 1, 1, 1,
0.3200019, -0.9721348, 3.037991, 1, 1, 1, 1, 1,
0.3212825, 0.9989501, -0.001934065, 1, 1, 1, 1, 1,
0.3231725, -0.01639584, 0.4088911, 1, 1, 1, 1, 1,
0.3240507, 1.064588, 1.219597, 1, 1, 1, 1, 1,
0.3287373, -0.05581468, 2.210029, 1, 1, 1, 1, 1,
0.3311558, -0.2503592, 2.02951, 1, 1, 1, 1, 1,
0.3348721, 1.266077, 2.338172, 1, 1, 1, 1, 1,
0.3350462, 0.353681, 1.682416, 1, 1, 1, 1, 1,
0.3411, 1.394086, 0.824769, 1, 1, 1, 1, 1,
0.3458333, 0.4179796, 1.949298, 1, 1, 1, 1, 1,
0.3474935, 2.319506, 0.2513292, 1, 1, 1, 1, 1,
0.3478846, -2.955795, 3.307327, 0, 0, 1, 1, 1,
0.3506452, 1.396314, -0.3122449, 1, 0, 0, 1, 1,
0.3527816, 1.951363, -0.1144039, 1, 0, 0, 1, 1,
0.3575627, 1.118414, 1.335303, 1, 0, 0, 1, 1,
0.3610371, 0.3097696, 0.7753516, 1, 0, 0, 1, 1,
0.3643323, 1.47068, 2.204282, 1, 0, 0, 1, 1,
0.3752156, 0.8647094, 2.317168, 0, 0, 0, 1, 1,
0.3782, 0.8535485, -0.8354237, 0, 0, 0, 1, 1,
0.3824366, 2.467956, -1.3995, 0, 0, 0, 1, 1,
0.3874806, 0.2281924, 1.42671, 0, 0, 0, 1, 1,
0.391427, -1.106996, 2.698636, 0, 0, 0, 1, 1,
0.3990166, -0.7089139, 2.699829, 0, 0, 0, 1, 1,
0.400443, -1.046156, 4.643254, 0, 0, 0, 1, 1,
0.4036989, 2.445788, 0.08619403, 1, 1, 1, 1, 1,
0.4067474, -1.405742, 2.103148, 1, 1, 1, 1, 1,
0.4089597, -0.1979586, 2.549932, 1, 1, 1, 1, 1,
0.4110916, 0.2452825, 1.386036, 1, 1, 1, 1, 1,
0.4156288, -1.24318, 3.053981, 1, 1, 1, 1, 1,
0.4164135, 0.8073846, -0.253638, 1, 1, 1, 1, 1,
0.4165185, 0.8461541, 1.358985, 1, 1, 1, 1, 1,
0.4189532, -0.9443359, -0.4581201, 1, 1, 1, 1, 1,
0.4207972, 0.4554529, 1.872252, 1, 1, 1, 1, 1,
0.4266625, -1.398962, 3.351057, 1, 1, 1, 1, 1,
0.428926, -0.5531151, 3.867744, 1, 1, 1, 1, 1,
0.4335663, 0.6857306, 2.607907, 1, 1, 1, 1, 1,
0.4344791, -0.7971381, 0.4721552, 1, 1, 1, 1, 1,
0.4351938, -1.253408, 2.580191, 1, 1, 1, 1, 1,
0.4371676, -0.6085758, 3.881156, 1, 1, 1, 1, 1,
0.4382389, 1.994294, 1.192802, 0, 0, 1, 1, 1,
0.4413616, 1.269044, -0.758975, 1, 0, 0, 1, 1,
0.4430172, 1.352273, -0.4083389, 1, 0, 0, 1, 1,
0.4473662, -0.0257058, 1.781574, 1, 0, 0, 1, 1,
0.4503623, -0.3989483, 2.349606, 1, 0, 0, 1, 1,
0.4510859, -0.6382988, 2.451753, 1, 0, 0, 1, 1,
0.4515724, -0.8593842, 3.113971, 0, 0, 0, 1, 1,
0.4540241, 1.359084, -0.5567622, 0, 0, 0, 1, 1,
0.4543425, -0.4002092, 2.471779, 0, 0, 0, 1, 1,
0.4549762, -1.422126, 3.8649, 0, 0, 0, 1, 1,
0.4609599, 0.1348208, 0.3831709, 0, 0, 0, 1, 1,
0.4639735, 1.732735, -0.5520375, 0, 0, 0, 1, 1,
0.4650345, 1.09816, 0.4788982, 0, 0, 0, 1, 1,
0.4714696, -1.403043, 2.317916, 1, 1, 1, 1, 1,
0.4714784, -0.4400302, 3.053679, 1, 1, 1, 1, 1,
0.4729508, -0.3740794, 2.582431, 1, 1, 1, 1, 1,
0.4836497, -0.5473059, 2.37665, 1, 1, 1, 1, 1,
0.4872976, 2.016036, -0.7046945, 1, 1, 1, 1, 1,
0.4991022, 0.3546029, 1.29447, 1, 1, 1, 1, 1,
0.4997212, -0.990429, 4.556099, 1, 1, 1, 1, 1,
0.5119469, 0.08528372, 2.062732, 1, 1, 1, 1, 1,
0.5206147, 0.3724988, 0.009015267, 1, 1, 1, 1, 1,
0.5276882, -0.226397, 2.690594, 1, 1, 1, 1, 1,
0.5302418, -1.619698, 2.851811, 1, 1, 1, 1, 1,
0.5315432, 0.6544424, 1.93433, 1, 1, 1, 1, 1,
0.5331746, 0.8410779, -0.2174276, 1, 1, 1, 1, 1,
0.5360518, 0.08927007, -0.3030176, 1, 1, 1, 1, 1,
0.5375907, 0.13895, 0.02977123, 1, 1, 1, 1, 1,
0.5425411, 0.2430625, 2.446868, 0, 0, 1, 1, 1,
0.5498495, -1.286902, 2.71447, 1, 0, 0, 1, 1,
0.5519645, -0.672263, 3.088071, 1, 0, 0, 1, 1,
0.5545622, 1.040167, -1.387316, 1, 0, 0, 1, 1,
0.5579542, -0.3475147, 1.27092, 1, 0, 0, 1, 1,
0.5625381, -0.2306943, 2.492977, 1, 0, 0, 1, 1,
0.5651793, 0.4671921, -0.351816, 0, 0, 0, 1, 1,
0.5661775, -0.1753477, 2.589837, 0, 0, 0, 1, 1,
0.5702542, -0.2605668, 3.07821, 0, 0, 0, 1, 1,
0.5708658, 1.430488, -0.01487698, 0, 0, 0, 1, 1,
0.5711756, -0.5002412, 1.955629, 0, 0, 0, 1, 1,
0.5719298, -1.645705, 1.844061, 0, 0, 0, 1, 1,
0.5735546, 3.398657, 1.017015, 0, 0, 0, 1, 1,
0.5752436, 2.325664, -0.2903446, 1, 1, 1, 1, 1,
0.5811006, -1.233774, 2.787001, 1, 1, 1, 1, 1,
0.5833632, 0.08460913, 3.192111, 1, 1, 1, 1, 1,
0.5840456, -1.500246, 1.127412, 1, 1, 1, 1, 1,
0.584852, 0.9767613, 0.8740512, 1, 1, 1, 1, 1,
0.5859832, 0.1656978, 1.750189, 1, 1, 1, 1, 1,
0.5998464, 1.159002, -0.4388663, 1, 1, 1, 1, 1,
0.6011438, -0.2185855, -0.01200402, 1, 1, 1, 1, 1,
0.6042355, -1.272598, 2.642458, 1, 1, 1, 1, 1,
0.6099431, 0.5327881, -0.02690583, 1, 1, 1, 1, 1,
0.6102687, 0.4305229, 2.240058, 1, 1, 1, 1, 1,
0.6103663, -0.565795, 2.962523, 1, 1, 1, 1, 1,
0.6120813, 0.4367398, 1.108137, 1, 1, 1, 1, 1,
0.6179063, 0.6491016, 0.911074, 1, 1, 1, 1, 1,
0.6188653, 1.032572, 1.689292, 1, 1, 1, 1, 1,
0.6202731, 0.2989221, 2.020688, 0, 0, 1, 1, 1,
0.6250101, 0.3127752, 1.220935, 1, 0, 0, 1, 1,
0.6255699, 0.6133018, 1.463493, 1, 0, 0, 1, 1,
0.6274668, 1.337472, -0.2986959, 1, 0, 0, 1, 1,
0.6351687, -0.8569571, 2.897721, 1, 0, 0, 1, 1,
0.6356433, -0.6165344, 2.534255, 1, 0, 0, 1, 1,
0.6398796, 0.1785115, 0.7077236, 0, 0, 0, 1, 1,
0.6445447, -1.90246, 3.031473, 0, 0, 0, 1, 1,
0.6462424, -0.3241803, 2.725886, 0, 0, 0, 1, 1,
0.6463434, -0.08282256, 1.015805, 0, 0, 0, 1, 1,
0.6484293, 0.4103906, 2.624867, 0, 0, 0, 1, 1,
0.6503196, 0.8098765, 2.053281, 0, 0, 0, 1, 1,
0.651706, -0.6308182, 2.917662, 0, 0, 0, 1, 1,
0.6543177, -0.014892, 0.4142804, 1, 1, 1, 1, 1,
0.6592183, -1.612013, 2.375838, 1, 1, 1, 1, 1,
0.6618457, 1.534559, 0.979562, 1, 1, 1, 1, 1,
0.6644413, -1.59405, 2.453742, 1, 1, 1, 1, 1,
0.665787, -0.1138787, 2.388694, 1, 1, 1, 1, 1,
0.6670533, -1.040448, 2.418218, 1, 1, 1, 1, 1,
0.667181, -0.1081627, 0.06389281, 1, 1, 1, 1, 1,
0.6679266, 2.036861, -0.3255485, 1, 1, 1, 1, 1,
0.6716669, -0.8391774, 3.297459, 1, 1, 1, 1, 1,
0.6741185, 0.6460522, 0.03951455, 1, 1, 1, 1, 1,
0.6792156, -0.5369132, 2.011717, 1, 1, 1, 1, 1,
0.6874933, 0.6038183, 0.05080313, 1, 1, 1, 1, 1,
0.7012794, -0.5180786, 3.275681, 1, 1, 1, 1, 1,
0.7062895, -0.175452, 1.195225, 1, 1, 1, 1, 1,
0.7084218, -0.1678678, 0.8720518, 1, 1, 1, 1, 1,
0.7107229, -1.826676, 5.403964, 0, 0, 1, 1, 1,
0.7155634, -1.14402, 1.29366, 1, 0, 0, 1, 1,
0.7158498, 0.01672761, 1.051833, 1, 0, 0, 1, 1,
0.7208816, 0.05350162, 1.560215, 1, 0, 0, 1, 1,
0.7245335, 0.9189222, 3.109773, 1, 0, 0, 1, 1,
0.7251214, 1.225707, -0.7654787, 1, 0, 0, 1, 1,
0.7285431, -0.342969, 2.67822, 0, 0, 0, 1, 1,
0.7356657, 0.5731622, -0.5975293, 0, 0, 0, 1, 1,
0.7374515, 1.697062, 2.06136, 0, 0, 0, 1, 1,
0.7394407, 0.3793969, 0.7764884, 0, 0, 0, 1, 1,
0.7420772, -1.021149, 4.630153, 0, 0, 0, 1, 1,
0.7476687, 1.467631, 1.754595, 0, 0, 0, 1, 1,
0.7520783, 0.6019661, 2.278915, 0, 0, 0, 1, 1,
0.7559975, 0.8666945, 0.1674195, 1, 1, 1, 1, 1,
0.756898, -0.3483635, 2.43551, 1, 1, 1, 1, 1,
0.7576895, 0.8649432, 2.715584, 1, 1, 1, 1, 1,
0.7607843, -0.07930283, 1.751179, 1, 1, 1, 1, 1,
0.761233, 0.2652096, 1.609135, 1, 1, 1, 1, 1,
0.7639844, 1.974975, -0.4798909, 1, 1, 1, 1, 1,
0.7651712, 0.1040755, 1.500519, 1, 1, 1, 1, 1,
0.7691048, 0.9472402, 0.9904338, 1, 1, 1, 1, 1,
0.7790949, 0.3553122, -0.1734293, 1, 1, 1, 1, 1,
0.7883315, 1.798007, -0.09333681, 1, 1, 1, 1, 1,
0.7887693, -0.6549646, 1.722723, 1, 1, 1, 1, 1,
0.7890521, -2.121119, 2.683365, 1, 1, 1, 1, 1,
0.7957376, 0.506936, 2.802054, 1, 1, 1, 1, 1,
0.8135833, -1.843306, 2.621915, 1, 1, 1, 1, 1,
0.8160838, 0.6379417, 1.032938, 1, 1, 1, 1, 1,
0.8195253, 1.550188, 0.3943874, 0, 0, 1, 1, 1,
0.8217873, 0.5230161, 2.371047, 1, 0, 0, 1, 1,
0.8285741, 1.44458, 1.108978, 1, 0, 0, 1, 1,
0.8303271, -1.033617, 1.729546, 1, 0, 0, 1, 1,
0.8305412, -0.6778219, 2.71459, 1, 0, 0, 1, 1,
0.8399492, -1.151695, 1.879818, 1, 0, 0, 1, 1,
0.8402638, 1.258673, 0.4748994, 0, 0, 0, 1, 1,
0.8431737, 1.973364, -1.154911, 0, 0, 0, 1, 1,
0.8433457, 0.870301, 1.55002, 0, 0, 0, 1, 1,
0.8444092, 0.03086777, 0.5847419, 0, 0, 0, 1, 1,
0.8512176, -0.8254454, 1.859154, 0, 0, 0, 1, 1,
0.8530999, -0.1278774, 1.59657, 0, 0, 0, 1, 1,
0.858677, 0.4487465, 1.725845, 0, 0, 0, 1, 1,
0.8655503, -0.6192198, 2.101543, 1, 1, 1, 1, 1,
0.8680826, 0.935012, 1.573771, 1, 1, 1, 1, 1,
0.8732594, -0.07221165, 2.663224, 1, 1, 1, 1, 1,
0.8743861, -0.1308526, 4.594574, 1, 1, 1, 1, 1,
0.8763264, 1.186558, -0.2967594, 1, 1, 1, 1, 1,
0.8805168, -0.8259193, 2.722946, 1, 1, 1, 1, 1,
0.8818831, 0.2775963, 0.672131, 1, 1, 1, 1, 1,
0.8864391, 1.087834, 0.7865923, 1, 1, 1, 1, 1,
0.8908925, -1.364181, 3.824656, 1, 1, 1, 1, 1,
0.8996361, -1.457283, 2.53826, 1, 1, 1, 1, 1,
0.9059515, 0.9242324, 0.5433111, 1, 1, 1, 1, 1,
0.9064468, -1.172521, 1.623187, 1, 1, 1, 1, 1,
0.906477, -0.1607285, 2.550431, 1, 1, 1, 1, 1,
0.9068016, -0.9030085, 1.465255, 1, 1, 1, 1, 1,
0.9137814, -0.4528021, 2.848002, 1, 1, 1, 1, 1,
0.91483, -1.406687, 3.923822, 0, 0, 1, 1, 1,
0.9185058, 1.288921, 1.453065, 1, 0, 0, 1, 1,
0.9194415, 0.249627, 2.145446, 1, 0, 0, 1, 1,
0.9232014, 0.8712917, -0.249294, 1, 0, 0, 1, 1,
0.925504, 1.747898, 0.03449071, 1, 0, 0, 1, 1,
0.9365954, 0.2141062, -0.7835408, 1, 0, 0, 1, 1,
0.9366112, 2.68428, 1.587275, 0, 0, 0, 1, 1,
0.9376221, 0.118322, 1.814409, 0, 0, 0, 1, 1,
0.9408455, -1.718536, 1.726915, 0, 0, 0, 1, 1,
0.9495017, 0.6086705, 1.234199, 0, 0, 0, 1, 1,
0.965701, 0.4179593, -0.8007109, 0, 0, 0, 1, 1,
0.9690456, -0.774508, 2.875702, 0, 0, 0, 1, 1,
0.9699347, -1.320527, 2.6578, 0, 0, 0, 1, 1,
0.9789281, 1.392445, -0.06124769, 1, 1, 1, 1, 1,
0.9796098, 0.07147331, 1.48179, 1, 1, 1, 1, 1,
0.9804439, 0.6855872, 1.250471, 1, 1, 1, 1, 1,
0.981162, -0.3527457, 1.332817, 1, 1, 1, 1, 1,
0.9824411, -0.3075796, 3.772959, 1, 1, 1, 1, 1,
0.9832879, 0.03862361, 1.380857, 1, 1, 1, 1, 1,
0.9870334, -0.942979, 2.909522, 1, 1, 1, 1, 1,
0.9917282, 0.3476419, 0.4508999, 1, 1, 1, 1, 1,
0.9949305, 1.455151, 1.193543, 1, 1, 1, 1, 1,
1.000222, 0.2288825, 2.643369, 1, 1, 1, 1, 1,
1.000329, -1.78496, 1.148094, 1, 1, 1, 1, 1,
1.001612, 0.8638098, 1.304069, 1, 1, 1, 1, 1,
1.009746, -0.6347433, 2.420719, 1, 1, 1, 1, 1,
1.01295, -0.9302402, 1.29032, 1, 1, 1, 1, 1,
1.013211, 1.368645, 1.324395, 1, 1, 1, 1, 1,
1.025067, 0.7712666, 1.095236, 0, 0, 1, 1, 1,
1.028448, -1.001541, 2.042335, 1, 0, 0, 1, 1,
1.031591, 0.0536562, 1.235078, 1, 0, 0, 1, 1,
1.039505, -0.2148308, 2.25425, 1, 0, 0, 1, 1,
1.04485, -0.7659034, 2.56363, 1, 0, 0, 1, 1,
1.047195, 0.245643, 0.1112922, 1, 0, 0, 1, 1,
1.049265, -0.2323958, 2.240706, 0, 0, 0, 1, 1,
1.051971, -0.9241469, 1.62672, 0, 0, 0, 1, 1,
1.055848, -0.04225287, 0.5539563, 0, 0, 0, 1, 1,
1.055851, -1.822478, 3.173916, 0, 0, 0, 1, 1,
1.068367, 0.564677, -0.1948169, 0, 0, 0, 1, 1,
1.075512, 0.6538331, 1.318703, 0, 0, 0, 1, 1,
1.079832, 0.6476081, -0.7724171, 0, 0, 0, 1, 1,
1.082022, -1.278248, 2.081856, 1, 1, 1, 1, 1,
1.088168, 1.627006, 0.6075954, 1, 1, 1, 1, 1,
1.091663, -0.596586, -0.7581254, 1, 1, 1, 1, 1,
1.095309, 0.7762623, 0.2275169, 1, 1, 1, 1, 1,
1.096004, 2.019776, -0.1573727, 1, 1, 1, 1, 1,
1.096531, 0.2779223, -0.9277102, 1, 1, 1, 1, 1,
1.104657, -0.8684317, 2.498388, 1, 1, 1, 1, 1,
1.122585, -1.118113, 4.878951, 1, 1, 1, 1, 1,
1.12683, 1.095793, 1.085803, 1, 1, 1, 1, 1,
1.137499, -0.1146184, -0.1642012, 1, 1, 1, 1, 1,
1.14144, 0.4676674, 1.312593, 1, 1, 1, 1, 1,
1.143007, 1.173009, 0.3964195, 1, 1, 1, 1, 1,
1.150259, -2.179147, 2.800493, 1, 1, 1, 1, 1,
1.151242, 1.355409, 1.322509, 1, 1, 1, 1, 1,
1.155173, -0.1013488, 1.1345, 1, 1, 1, 1, 1,
1.158326, -1.395357, 3.693317, 0, 0, 1, 1, 1,
1.159142, 1.093072, 0.7024999, 1, 0, 0, 1, 1,
1.160064, -0.6597832, 2.354303, 1, 0, 0, 1, 1,
1.169252, -0.2421876, 2.687555, 1, 0, 0, 1, 1,
1.175003, 0.5256392, 2.151856, 1, 0, 0, 1, 1,
1.181655, -0.3429497, 1.456924, 1, 0, 0, 1, 1,
1.182577, -1.211051, 2.894718, 0, 0, 0, 1, 1,
1.186271, 0.09542881, 2.660401, 0, 0, 0, 1, 1,
1.187052, 1.011313, 2.812526, 0, 0, 0, 1, 1,
1.187771, 0.1652833, 2.499001, 0, 0, 0, 1, 1,
1.190356, -0.839802, 2.249481, 0, 0, 0, 1, 1,
1.194016, 2.269737, 0.9103531, 0, 0, 0, 1, 1,
1.205132, -0.4321288, 2.169623, 0, 0, 0, 1, 1,
1.205701, -1.923061, 3.024833, 1, 1, 1, 1, 1,
1.208182, -0.5910977, 0.6639179, 1, 1, 1, 1, 1,
1.213325, 0.6921283, 1.436484, 1, 1, 1, 1, 1,
1.215096, 0.1693871, 1.438132, 1, 1, 1, 1, 1,
1.22276, -1.758189, 1.975747, 1, 1, 1, 1, 1,
1.223183, -0.1257298, 1.091797, 1, 1, 1, 1, 1,
1.224694, -1.026898, 1.121143, 1, 1, 1, 1, 1,
1.228489, -0.1903197, 1.38958, 1, 1, 1, 1, 1,
1.232418, 0.5336889, 0.6368136, 1, 1, 1, 1, 1,
1.238322, -2.779371, 2.007124, 1, 1, 1, 1, 1,
1.2422, 0.1532616, 3.200978, 1, 1, 1, 1, 1,
1.256146, 0.7853951, 1.629485, 1, 1, 1, 1, 1,
1.275321, -0.2001816, 3.014925, 1, 1, 1, 1, 1,
1.292584, -1.821056, 2.27933, 1, 1, 1, 1, 1,
1.292951, -0.8139508, 0.5578188, 1, 1, 1, 1, 1,
1.296639, -0.316388, 2.130888, 0, 0, 1, 1, 1,
1.299703, -0.8043758, 3.104645, 1, 0, 0, 1, 1,
1.304926, -0.2532884, 1.254979, 1, 0, 0, 1, 1,
1.309422, -0.3118712, 2.153435, 1, 0, 0, 1, 1,
1.311583, 3.188915, 1.198426, 1, 0, 0, 1, 1,
1.320617, -0.547331, 2.253982, 1, 0, 0, 1, 1,
1.325747, -0.7671829, 3.245573, 0, 0, 0, 1, 1,
1.336702, 1.863959, 0.8384059, 0, 0, 0, 1, 1,
1.342014, 0.04713747, 0.9440309, 0, 0, 0, 1, 1,
1.349179, 0.461612, 1.469804, 0, 0, 0, 1, 1,
1.355785, -0.9184178, 0.5999102, 0, 0, 0, 1, 1,
1.363677, -0.7408141, 1.864687, 0, 0, 0, 1, 1,
1.371865, 0.2446292, -0.5345441, 0, 0, 0, 1, 1,
1.372571, -2.963032, 4.837042, 1, 1, 1, 1, 1,
1.37389, -0.3858078, 2.476372, 1, 1, 1, 1, 1,
1.37395, 0.1817618, 3.69423, 1, 1, 1, 1, 1,
1.377797, 1.044107, 1.005964, 1, 1, 1, 1, 1,
1.393149, 1.032226, 0.02227542, 1, 1, 1, 1, 1,
1.398119, 1.227858, -0.2615233, 1, 1, 1, 1, 1,
1.400093, -0.3741149, 1.379581, 1, 1, 1, 1, 1,
1.401655, 0.2167514, 0.3834949, 1, 1, 1, 1, 1,
1.402898, 0.3968827, 1.124664, 1, 1, 1, 1, 1,
1.410683, 1.267249, -0.08865856, 1, 1, 1, 1, 1,
1.42143, 0.9345805, 1.149496, 1, 1, 1, 1, 1,
1.429891, 0.02587237, 1.171454, 1, 1, 1, 1, 1,
1.443619, 0.8316877, 1.732568, 1, 1, 1, 1, 1,
1.447701, -0.8871324, 2.147951, 1, 1, 1, 1, 1,
1.459028, 1.126505, 1.493801, 1, 1, 1, 1, 1,
1.469936, 1.751484, 2.390614, 0, 0, 1, 1, 1,
1.473849, -1.165288, 2.166821, 1, 0, 0, 1, 1,
1.485245, -0.3535258, 0.1847565, 1, 0, 0, 1, 1,
1.488264, -1.623034, 1.831653, 1, 0, 0, 1, 1,
1.502069, -0.8652001, 2.711889, 1, 0, 0, 1, 1,
1.503196, 0.2055218, -0.6904248, 1, 0, 0, 1, 1,
1.514448, 0.05950473, 0.8810514, 0, 0, 0, 1, 1,
1.521168, -0.806763, 2.57319, 0, 0, 0, 1, 1,
1.522093, -0.08793874, 1.555495, 0, 0, 0, 1, 1,
1.522966, -0.3935716, 3.028663, 0, 0, 0, 1, 1,
1.526373, -0.6069627, 2.069523, 0, 0, 0, 1, 1,
1.559511, -0.3300219, 0.2683274, 0, 0, 0, 1, 1,
1.577788, 0.3002408, 1.34267, 0, 0, 0, 1, 1,
1.591867, 1.556405, 0.8132816, 1, 1, 1, 1, 1,
1.604722, -1.031008, 1.682611, 1, 1, 1, 1, 1,
1.613509, -0.2526844, 2.40336, 1, 1, 1, 1, 1,
1.623787, -2.199244, 2.813547, 1, 1, 1, 1, 1,
1.62999, 0.8598181, 0.6397187, 1, 1, 1, 1, 1,
1.652415, -0.6954059, 0.1260084, 1, 1, 1, 1, 1,
1.664786, -0.5251914, 0.7221482, 1, 1, 1, 1, 1,
1.676876, -1.873413, 0.7813349, 1, 1, 1, 1, 1,
1.686947, -0.5515452, 1.751806, 1, 1, 1, 1, 1,
1.712028, -0.132173, 3.093165, 1, 1, 1, 1, 1,
1.713969, -1.396869, 1.657497, 1, 1, 1, 1, 1,
1.724577, 0.7178739, 1.428813, 1, 1, 1, 1, 1,
1.730481, 0.7260848, 0.5845569, 1, 1, 1, 1, 1,
1.738618, -1.730756, 3.677814, 1, 1, 1, 1, 1,
1.751714, -0.9781656, 0.3565082, 1, 1, 1, 1, 1,
1.752866, -0.901921, 2.493349, 0, 0, 1, 1, 1,
1.775187, -1.076486, 2.838781, 1, 0, 0, 1, 1,
1.780766, 0.3776398, 1.660894, 1, 0, 0, 1, 1,
1.782245, -0.5115848, 3.169478, 1, 0, 0, 1, 1,
1.793663, -0.4575372, 2.043552, 1, 0, 0, 1, 1,
1.795449, -0.787633, 3.605644, 1, 0, 0, 1, 1,
1.800233, 0.9577981, 0.1215772, 0, 0, 0, 1, 1,
1.815642, 0.7950018, 0.09650559, 0, 0, 0, 1, 1,
1.819668, 0.002252375, 1.968048, 0, 0, 0, 1, 1,
1.822841, -0.3125343, 2.568706, 0, 0, 0, 1, 1,
1.835683, -1.017589, 2.631703, 0, 0, 0, 1, 1,
1.859805, 0.5254739, 1.757993, 0, 0, 0, 1, 1,
1.877176, -0.6332457, 2.166488, 0, 0, 0, 1, 1,
1.888515, -0.3229007, 0.9986103, 1, 1, 1, 1, 1,
1.903037, -0.5439182, 0.9742513, 1, 1, 1, 1, 1,
1.903754, 0.3716323, 1.584554, 1, 1, 1, 1, 1,
1.905646, -1.312351, 2.20302, 1, 1, 1, 1, 1,
1.907063, -0.03508106, 0.5451226, 1, 1, 1, 1, 1,
1.923522, -0.5612837, 2.419986, 1, 1, 1, 1, 1,
1.941862, 1.752543, 2.848246, 1, 1, 1, 1, 1,
1.952468, 0.03686938, 0.9679303, 1, 1, 1, 1, 1,
2.017014, -0.4136492, 1.666867, 1, 1, 1, 1, 1,
2.019726, 1.212874, 2.118925, 1, 1, 1, 1, 1,
2.025996, 0.6559467, 2.107331, 1, 1, 1, 1, 1,
2.082752, -0.7394617, 2.93083, 1, 1, 1, 1, 1,
2.099624, -1.171352, 3.382712, 1, 1, 1, 1, 1,
2.115702, 1.462942, 0.3367688, 1, 1, 1, 1, 1,
2.117258, 0.1968666, 2.739095, 1, 1, 1, 1, 1,
2.118799, 1.86369, 0.5368462, 0, 0, 1, 1, 1,
2.1242, 1.386101, 2.207578, 1, 0, 0, 1, 1,
2.21929, 0.8271967, -0.615254, 1, 0, 0, 1, 1,
2.250813, 0.3116925, 1.966117, 1, 0, 0, 1, 1,
2.263461, 0.04056301, 3.621429, 1, 0, 0, 1, 1,
2.301557, 0.1943762, 1.029427, 1, 0, 0, 1, 1,
2.314847, -0.6420283, 3.618965, 0, 0, 0, 1, 1,
2.328695, -1.524337, 2.803264, 0, 0, 0, 1, 1,
2.329476, 1.014871, 1.957137, 0, 0, 0, 1, 1,
2.369243, 1.265314, 2.006387, 0, 0, 0, 1, 1,
2.391606, 0.06774568, 0.5406228, 0, 0, 0, 1, 1,
2.397701, 0.02381669, 2.141728, 0, 0, 0, 1, 1,
2.411489, 0.2273282, 1.932249, 0, 0, 0, 1, 1,
2.516814, -0.8456165, 1.752365, 1, 1, 1, 1, 1,
2.540983, -0.3590976, 0.6506174, 1, 1, 1, 1, 1,
2.739618, -1.415826, 2.057806, 1, 1, 1, 1, 1,
2.829315, 0.5073559, 2.029471, 1, 1, 1, 1, 1,
3.022938, 1.862665, 1.738359, 1, 1, 1, 1, 1,
3.049875, -0.007746194, 2.986714, 1, 1, 1, 1, 1,
3.114963, -1.490405, 2.768014, 1, 1, 1, 1, 1
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
var radius = 9.874665;
var distance = 34.68434;
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
mvMatrix.translate( 0.3533535, -0.2178122, -0.1884685 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.68434);
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
