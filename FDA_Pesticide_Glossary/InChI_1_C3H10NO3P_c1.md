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
-3.222832, -0.4977379, -1.51663, 1, 0, 0, 1,
-2.874115, 0.7362806, -1.283258, 1, 0.007843138, 0, 1,
-2.772358, 0.8178059, -2.902507, 1, 0.01176471, 0, 1,
-2.75611, 0.5285108, -1.003962, 1, 0.01960784, 0, 1,
-2.597878, -0.1208846, -1.825449, 1, 0.02352941, 0, 1,
-2.574641, 0.8298904, -0.1055325, 1, 0.03137255, 0, 1,
-2.519916, 1.313755, -1.659641, 1, 0.03529412, 0, 1,
-2.507421, 0.1438686, -1.72095, 1, 0.04313726, 0, 1,
-2.425268, -1.854544, -1.906872, 1, 0.04705882, 0, 1,
-2.34105, -1.519362, -1.605883, 1, 0.05490196, 0, 1,
-2.340906, 1.943156, -0.4701687, 1, 0.05882353, 0, 1,
-2.303426, -0.7866701, -1.483129, 1, 0.06666667, 0, 1,
-2.240037, 0.5282494, -1.297023, 1, 0.07058824, 0, 1,
-2.147956, 0.675845, -1.723113, 1, 0.07843138, 0, 1,
-2.097898, -0.5801684, -0.7740093, 1, 0.08235294, 0, 1,
-2.09556, -1.720585, -2.881177, 1, 0.09019608, 0, 1,
-2.088538, 0.2301187, -3.215122, 1, 0.09411765, 0, 1,
-2.083569, 1.270692, -0.9889211, 1, 0.1019608, 0, 1,
-2.071649, 0.2993276, -2.560987, 1, 0.1098039, 0, 1,
-1.996997, -0.6995434, -2.302522, 1, 0.1137255, 0, 1,
-1.958119, 0.3817635, -1.397253, 1, 0.1215686, 0, 1,
-1.948196, 1.1451, -0.2097235, 1, 0.1254902, 0, 1,
-1.923763, -0.05268335, -2.208734, 1, 0.1333333, 0, 1,
-1.918878, 0.01919103, -0.3410126, 1, 0.1372549, 0, 1,
-1.916685, -0.4031453, -1.63737, 1, 0.145098, 0, 1,
-1.914531, -1.21967, -2.440425, 1, 0.1490196, 0, 1,
-1.908253, 0.1088962, -1.075116, 1, 0.1568628, 0, 1,
-1.907726, 1.237208, -2.61816, 1, 0.1607843, 0, 1,
-1.907104, -1.253806, -3.349912, 1, 0.1686275, 0, 1,
-1.873231, -0.2378775, -0.7090768, 1, 0.172549, 0, 1,
-1.862256, 0.3786763, -0.7270129, 1, 0.1803922, 0, 1,
-1.840737, 1.325963, -1.203863, 1, 0.1843137, 0, 1,
-1.823115, 0.08274415, -1.448453, 1, 0.1921569, 0, 1,
-1.801497, -2.32604, -2.519252, 1, 0.1960784, 0, 1,
-1.788573, -1.128391, -2.110301, 1, 0.2039216, 0, 1,
-1.784354, -1.18958, -3.787207, 1, 0.2117647, 0, 1,
-1.778278, 1.15432, 0.08748241, 1, 0.2156863, 0, 1,
-1.758152, 0.4613574, -1.771929, 1, 0.2235294, 0, 1,
-1.748231, 0.1964523, -2.261988, 1, 0.227451, 0, 1,
-1.736968, 0.9227026, 0.6064088, 1, 0.2352941, 0, 1,
-1.718184, -0.7443401, -2.980944, 1, 0.2392157, 0, 1,
-1.713719, -0.777416, -1.906773, 1, 0.2470588, 0, 1,
-1.702068, -0.1535595, -1.632386, 1, 0.2509804, 0, 1,
-1.701613, 1.110687, 0.1361317, 1, 0.2588235, 0, 1,
-1.701141, 2.818477, -0.2744989, 1, 0.2627451, 0, 1,
-1.688749, -1.619048, -2.63233, 1, 0.2705882, 0, 1,
-1.686821, 0.3566406, -0.668358, 1, 0.2745098, 0, 1,
-1.681015, -0.4024336, -1.485773, 1, 0.282353, 0, 1,
-1.671296, 0.9121523, -0.2514589, 1, 0.2862745, 0, 1,
-1.668032, 0.9826514, -0.8453195, 1, 0.2941177, 0, 1,
-1.650418, 2.308723, -0.5380661, 1, 0.3019608, 0, 1,
-1.64194, 1.199529, -1.339869, 1, 0.3058824, 0, 1,
-1.640876, 0.5314389, -3.07457, 1, 0.3137255, 0, 1,
-1.630526, 0.536185, 0.05787846, 1, 0.3176471, 0, 1,
-1.630433, -0.08525201, -1.748944, 1, 0.3254902, 0, 1,
-1.628924, 1.295968, -1.696126, 1, 0.3294118, 0, 1,
-1.613924, 1.686046, -0.9110419, 1, 0.3372549, 0, 1,
-1.592463, 0.8093622, -3.388873, 1, 0.3411765, 0, 1,
-1.574913, -0.3484257, -0.4459899, 1, 0.3490196, 0, 1,
-1.572812, 0.4454293, -0.2532873, 1, 0.3529412, 0, 1,
-1.571789, 0.7982882, -2.708422, 1, 0.3607843, 0, 1,
-1.55321, 0.8859019, -3.004817, 1, 0.3647059, 0, 1,
-1.520586, 0.2337083, 0.2143115, 1, 0.372549, 0, 1,
-1.509131, 0.8839597, -1.626601, 1, 0.3764706, 0, 1,
-1.508354, -0.4340309, -1.558328, 1, 0.3843137, 0, 1,
-1.504565, -1.255474, -0.2085839, 1, 0.3882353, 0, 1,
-1.502472, 0.3240888, -1.190308, 1, 0.3960784, 0, 1,
-1.480957, 1.85127, -2.211483, 1, 0.4039216, 0, 1,
-1.465842, 0.08937483, -1.729847, 1, 0.4078431, 0, 1,
-1.465412, -0.1259138, -2.866166, 1, 0.4156863, 0, 1,
-1.455916, 0.39413, -1.665864, 1, 0.4196078, 0, 1,
-1.455618, 1.325393, 0.07128341, 1, 0.427451, 0, 1,
-1.454064, 1.90548, -0.5014778, 1, 0.4313726, 0, 1,
-1.4417, 1.843667, -0.5063068, 1, 0.4392157, 0, 1,
-1.441278, 0.3447918, -0.6356232, 1, 0.4431373, 0, 1,
-1.441159, 0.5621944, -2.137276, 1, 0.4509804, 0, 1,
-1.435279, -0.1672098, -0.6032947, 1, 0.454902, 0, 1,
-1.418528, -1.078001, -1.370292, 1, 0.4627451, 0, 1,
-1.414781, 1.90375, -1.236622, 1, 0.4666667, 0, 1,
-1.40828, -2.566222, -1.453543, 1, 0.4745098, 0, 1,
-1.406242, -1.022811, -1.84698, 1, 0.4784314, 0, 1,
-1.405349, 1.727151, 1.007681, 1, 0.4862745, 0, 1,
-1.401916, 0.0187003, -1.783072, 1, 0.4901961, 0, 1,
-1.400234, -0.6796733, -0.3071349, 1, 0.4980392, 0, 1,
-1.399466, -0.5379667, -1.539668, 1, 0.5058824, 0, 1,
-1.373248, 0.2158259, -1.337326, 1, 0.509804, 0, 1,
-1.365331, 0.8719968, -1.857732, 1, 0.5176471, 0, 1,
-1.357192, -0.1528307, -3.07492, 1, 0.5215687, 0, 1,
-1.354876, -1.640941, -1.68694, 1, 0.5294118, 0, 1,
-1.348832, 0.5228451, -1.15325, 1, 0.5333334, 0, 1,
-1.34323, 0.1175012, 0.3643427, 1, 0.5411765, 0, 1,
-1.341243, 0.6097282, -2.789298, 1, 0.5450981, 0, 1,
-1.338273, 0.2720608, -0.8587013, 1, 0.5529412, 0, 1,
-1.335212, 1.590215, -1.724243, 1, 0.5568628, 0, 1,
-1.335063, -0.5241248, -1.690839, 1, 0.5647059, 0, 1,
-1.333531, 1.311262, -0.08847824, 1, 0.5686275, 0, 1,
-1.314211, -0.5617526, -2.221985, 1, 0.5764706, 0, 1,
-1.314023, -0.4523349, -2.157384, 1, 0.5803922, 0, 1,
-1.301472, 0.4891783, -0.1537056, 1, 0.5882353, 0, 1,
-1.300584, 1.11416, -0.08084331, 1, 0.5921569, 0, 1,
-1.298014, -0.2635374, -2.496047, 1, 0.6, 0, 1,
-1.281303, 1.365415, -1.270038, 1, 0.6078432, 0, 1,
-1.281096, 1.611902, -1.710943, 1, 0.6117647, 0, 1,
-1.278133, 0.1747667, -0.6150916, 1, 0.6196079, 0, 1,
-1.266407, -1.084301, -3.281736, 1, 0.6235294, 0, 1,
-1.257879, 2.020935, -0.4806231, 1, 0.6313726, 0, 1,
-1.257318, 0.7943422, -1.202297, 1, 0.6352941, 0, 1,
-1.256675, 1.428433, -1.641679, 1, 0.6431373, 0, 1,
-1.246453, 0.2723396, -0.6255908, 1, 0.6470588, 0, 1,
-1.24643, 0.6598145, -2.16571, 1, 0.654902, 0, 1,
-1.2401, -1.504035, -4.154952, 1, 0.6588235, 0, 1,
-1.234643, 2.530348, 0.4267405, 1, 0.6666667, 0, 1,
-1.233789, -0.9700482, -4.879902, 1, 0.6705883, 0, 1,
-1.227049, -0.6686406, -2.87938, 1, 0.6784314, 0, 1,
-1.224707, 0.2805857, -1.164629, 1, 0.682353, 0, 1,
-1.221194, 0.5646432, -0.451768, 1, 0.6901961, 0, 1,
-1.220465, 0.6642991, -2.14725, 1, 0.6941177, 0, 1,
-1.214964, -0.9024675, -2.650385, 1, 0.7019608, 0, 1,
-1.21142, -1.039576, -2.153011, 1, 0.7098039, 0, 1,
-1.210301, 0.7380114, -0.4048067, 1, 0.7137255, 0, 1,
-1.210114, 0.6419684, -1.817716, 1, 0.7215686, 0, 1,
-1.207395, -0.7011085, -2.971444, 1, 0.7254902, 0, 1,
-1.206359, -1.986197, -3.709663, 1, 0.7333333, 0, 1,
-1.201164, -0.1223058, -2.264696, 1, 0.7372549, 0, 1,
-1.190543, 1.15703, 1.606041, 1, 0.7450981, 0, 1,
-1.188076, 0.1182602, 0.0163945, 1, 0.7490196, 0, 1,
-1.187253, 0.06401701, -1.265734, 1, 0.7568628, 0, 1,
-1.179959, -0.3549545, -3.308987, 1, 0.7607843, 0, 1,
-1.174507, 0.370207, -1.91163, 1, 0.7686275, 0, 1,
-1.157612, -0.5597131, -2.391355, 1, 0.772549, 0, 1,
-1.156609, 0.1367372, -3.677652, 1, 0.7803922, 0, 1,
-1.152688, 0.7374708, 0.2867422, 1, 0.7843137, 0, 1,
-1.149301, 0.5538893, -2.439783, 1, 0.7921569, 0, 1,
-1.149, 1.299496, -3.167844, 1, 0.7960784, 0, 1,
-1.145508, 0.4420314, -2.324272, 1, 0.8039216, 0, 1,
-1.144995, -0.4511846, -2.053053, 1, 0.8117647, 0, 1,
-1.135627, -0.7795055, -3.037603, 1, 0.8156863, 0, 1,
-1.132011, -2.372084, -2.797816, 1, 0.8235294, 0, 1,
-1.122999, -0.9226722, -2.676844, 1, 0.827451, 0, 1,
-1.120674, -0.6086472, -4.043554, 1, 0.8352941, 0, 1,
-1.116111, -2.102555, -2.664099, 1, 0.8392157, 0, 1,
-1.112901, -0.4758514, -1.32905, 1, 0.8470588, 0, 1,
-1.095408, -0.588698, -2.746832, 1, 0.8509804, 0, 1,
-1.092816, 0.06703663, -0.6067255, 1, 0.8588235, 0, 1,
-1.088963, 0.866741, -1.219952, 1, 0.8627451, 0, 1,
-1.081847, 0.1345923, -0.7098167, 1, 0.8705882, 0, 1,
-1.077449, -1.716101, -0.5277689, 1, 0.8745098, 0, 1,
-1.076598, -1.437903, -3.045382, 1, 0.8823529, 0, 1,
-1.075782, -0.9906751, -3.179119, 1, 0.8862745, 0, 1,
-1.07195, -0.5696828, -3.686703, 1, 0.8941177, 0, 1,
-1.068222, 0.4906125, -2.024217, 1, 0.8980392, 0, 1,
-1.063979, 0.06375728, -2.206869, 1, 0.9058824, 0, 1,
-1.059627, -0.5003088, -1.639883, 1, 0.9137255, 0, 1,
-1.058663, 1.368496, -0.8853484, 1, 0.9176471, 0, 1,
-1.05175, -0.8911124, -2.017172, 1, 0.9254902, 0, 1,
-1.050983, 0.1213206, -0.5813132, 1, 0.9294118, 0, 1,
-1.049915, 1.728864, -1.257783, 1, 0.9372549, 0, 1,
-1.046147, -0.06974318, -3.446598, 1, 0.9411765, 0, 1,
-1.029242, 1.180285, 0.3835427, 1, 0.9490196, 0, 1,
-1.023329, -1.000448, -1.649624, 1, 0.9529412, 0, 1,
-1.022838, 1.300854, -2.815661, 1, 0.9607843, 0, 1,
-1.019405, -0.3532628, -1.784398, 1, 0.9647059, 0, 1,
-1.018989, 1.166186, -0.3240241, 1, 0.972549, 0, 1,
-1.015229, 0.3921874, -2.970732, 1, 0.9764706, 0, 1,
-1.014938, -0.3472035, -2.587194, 1, 0.9843137, 0, 1,
-1.008268, -1.118528, -0.2134919, 1, 0.9882353, 0, 1,
-1.005901, -0.6240454, -0.7629355, 1, 0.9960784, 0, 1,
-1.005121, -0.4621745, -2.578342, 0.9960784, 1, 0, 1,
-0.9953386, -0.8884137, -2.721053, 0.9921569, 1, 0, 1,
-0.9946303, -0.7455239, -2.81092, 0.9843137, 1, 0, 1,
-0.9817562, 0.5280086, -0.5322761, 0.9803922, 1, 0, 1,
-0.9661128, -0.8971635, -1.967057, 0.972549, 1, 0, 1,
-0.9659835, -0.2810488, -3.341629, 0.9686275, 1, 0, 1,
-0.9601123, -0.8918986, -2.304454, 0.9607843, 1, 0, 1,
-0.95838, 0.2277944, 0.7706074, 0.9568627, 1, 0, 1,
-0.9582562, 0.02805428, -1.80515, 0.9490196, 1, 0, 1,
-0.9473341, 1.248576, 0.6651582, 0.945098, 1, 0, 1,
-0.9440948, -0.4516262, -1.844505, 0.9372549, 1, 0, 1,
-0.9361305, 0.8492219, -0.8906803, 0.9333333, 1, 0, 1,
-0.9199165, -1.618449, -1.333418, 0.9254902, 1, 0, 1,
-0.90999, -0.06201402, -0.5050583, 0.9215686, 1, 0, 1,
-0.8986829, 1.979601, 0.275856, 0.9137255, 1, 0, 1,
-0.8976724, 0.5907474, -0.6956358, 0.9098039, 1, 0, 1,
-0.8946682, 0.7472397, 0.8467967, 0.9019608, 1, 0, 1,
-0.8941133, 0.1989046, -1.351003, 0.8941177, 1, 0, 1,
-0.8932841, -0.7010965, -1.44165, 0.8901961, 1, 0, 1,
-0.8795691, 2.197071, 0.452868, 0.8823529, 1, 0, 1,
-0.8727788, -1.399168, -4.052045, 0.8784314, 1, 0, 1,
-0.8627641, -0.2174208, -1.913184, 0.8705882, 1, 0, 1,
-0.8599541, -1.002308, -1.016598, 0.8666667, 1, 0, 1,
-0.8517478, 0.3790693, -1.687539, 0.8588235, 1, 0, 1,
-0.8468836, 0.3165352, -1.226016, 0.854902, 1, 0, 1,
-0.8467969, -0.5360821, -3.16651, 0.8470588, 1, 0, 1,
-0.8396497, -1.509652, -1.929749, 0.8431373, 1, 0, 1,
-0.8332143, -0.8079417, -1.320379, 0.8352941, 1, 0, 1,
-0.828682, 1.038887, -1.611585, 0.8313726, 1, 0, 1,
-0.8235075, -1.067019, -1.995719, 0.8235294, 1, 0, 1,
-0.8186095, -1.578354, -2.134089, 0.8196079, 1, 0, 1,
-0.8175648, -0.6129814, -1.472099, 0.8117647, 1, 0, 1,
-0.813111, -0.303458, -2.144957, 0.8078431, 1, 0, 1,
-0.8097908, 1.969123, 0.5613655, 0.8, 1, 0, 1,
-0.8000638, -0.1513849, -1.028751, 0.7921569, 1, 0, 1,
-0.7995744, 0.315013, -2.413961, 0.7882353, 1, 0, 1,
-0.7982449, 0.8395628, -1.999076, 0.7803922, 1, 0, 1,
-0.7977593, -0.6820267, -1.963647, 0.7764706, 1, 0, 1,
-0.7925034, -1.193819, -4.167392, 0.7686275, 1, 0, 1,
-0.7917359, -1.415235, -1.979099, 0.7647059, 1, 0, 1,
-0.7900162, -1.822326, -1.973554, 0.7568628, 1, 0, 1,
-0.789272, -0.4405605, 0.5148739, 0.7529412, 1, 0, 1,
-0.7832807, 0.3533024, -1.861817, 0.7450981, 1, 0, 1,
-0.7823053, -0.5963467, -3.502743, 0.7411765, 1, 0, 1,
-0.7784863, 0.6972383, -0.648065, 0.7333333, 1, 0, 1,
-0.7725877, -0.9428232, -4.078722, 0.7294118, 1, 0, 1,
-0.7686466, 0.2562177, -1.010941, 0.7215686, 1, 0, 1,
-0.7680557, 0.06885567, 0.05164767, 0.7176471, 1, 0, 1,
-0.7668877, 1.352757, -0.8815637, 0.7098039, 1, 0, 1,
-0.762835, 1.398039, -3.228066, 0.7058824, 1, 0, 1,
-0.7612555, 0.5436083, -0.2918143, 0.6980392, 1, 0, 1,
-0.7573469, 0.7225953, -1.564095, 0.6901961, 1, 0, 1,
-0.7484583, 0.5092703, -2.273175, 0.6862745, 1, 0, 1,
-0.7446933, 0.845525, 0.335741, 0.6784314, 1, 0, 1,
-0.7423088, -0.2113927, -1.915282, 0.6745098, 1, 0, 1,
-0.7382421, 0.1122903, -1.263594, 0.6666667, 1, 0, 1,
-0.7376985, -0.2867635, -2.92606, 0.6627451, 1, 0, 1,
-0.7275884, 1.327565, 0.5362035, 0.654902, 1, 0, 1,
-0.7264468, 1.937379, -0.4006899, 0.6509804, 1, 0, 1,
-0.7251202, -0.3289849, -2.539999, 0.6431373, 1, 0, 1,
-0.7242689, -1.28913, -1.523675, 0.6392157, 1, 0, 1,
-0.7233043, 0.2490819, -0.6373599, 0.6313726, 1, 0, 1,
-0.7229265, 0.7200983, -1.5198, 0.627451, 1, 0, 1,
-0.7147232, 0.4127049, 0.9030895, 0.6196079, 1, 0, 1,
-0.7144639, 1.604218, -1.491484, 0.6156863, 1, 0, 1,
-0.7106104, 1.77306, -0.4086995, 0.6078432, 1, 0, 1,
-0.7078128, -1.123286, -1.215377, 0.6039216, 1, 0, 1,
-0.7023667, -1.421482, -3.773396, 0.5960785, 1, 0, 1,
-0.700573, -2.13773, -1.750757, 0.5882353, 1, 0, 1,
-0.698638, 0.7775478, -0.7970055, 0.5843138, 1, 0, 1,
-0.6969671, 0.7827325, 0.1008634, 0.5764706, 1, 0, 1,
-0.6941895, 0.9482538, -0.4508889, 0.572549, 1, 0, 1,
-0.6927286, -0.4398648, -2.869637, 0.5647059, 1, 0, 1,
-0.6895537, 0.2512938, -2.285996, 0.5607843, 1, 0, 1,
-0.6894519, 1.374918, -0.3096615, 0.5529412, 1, 0, 1,
-0.6892577, -0.3651681, -1.846428, 0.5490196, 1, 0, 1,
-0.686327, -0.4565515, -1.509442, 0.5411765, 1, 0, 1,
-0.682659, 1.128874, 1.164039, 0.5372549, 1, 0, 1,
-0.6823536, 3.002259, -1.728761, 0.5294118, 1, 0, 1,
-0.6819288, 0.6691487, -1.570311, 0.5254902, 1, 0, 1,
-0.6813514, -1.081003, -2.567597, 0.5176471, 1, 0, 1,
-0.6799306, 0.7446845, -0.0497842, 0.5137255, 1, 0, 1,
-0.6715725, 0.6091678, -1.533724, 0.5058824, 1, 0, 1,
-0.6686926, 1.484545, 0.4981138, 0.5019608, 1, 0, 1,
-0.6676806, 0.5950965, -1.356483, 0.4941176, 1, 0, 1,
-0.6673513, -1.543251, -2.593403, 0.4862745, 1, 0, 1,
-0.6673132, -0.9733374, -1.764776, 0.4823529, 1, 0, 1,
-0.66469, -1.98576, -4.30033, 0.4745098, 1, 0, 1,
-0.6639791, -0.216453, -2.062612, 0.4705882, 1, 0, 1,
-0.6617542, -0.8330936, -0.5293115, 0.4627451, 1, 0, 1,
-0.6593265, 0.4431994, -0.04998928, 0.4588235, 1, 0, 1,
-0.6591686, 0.05251974, -1.444154, 0.4509804, 1, 0, 1,
-0.6565188, 0.8202532, 0.4577354, 0.4470588, 1, 0, 1,
-0.6562136, -1.067871, -2.654801, 0.4392157, 1, 0, 1,
-0.6533651, 0.08575881, -1.902243, 0.4352941, 1, 0, 1,
-0.6530473, 0.6804683, -0.8957765, 0.427451, 1, 0, 1,
-0.6521047, 0.5936789, -0.8342055, 0.4235294, 1, 0, 1,
-0.6455648, -0.7040594, -2.003937, 0.4156863, 1, 0, 1,
-0.6444978, 0.02111177, -1.338544, 0.4117647, 1, 0, 1,
-0.6429192, 0.3202321, -1.555193, 0.4039216, 1, 0, 1,
-0.6420005, -0.05123197, -1.933233, 0.3960784, 1, 0, 1,
-0.6402128, -0.3817027, -1.25707, 0.3921569, 1, 0, 1,
-0.6399022, -0.1902517, 0.4452681, 0.3843137, 1, 0, 1,
-0.6355318, 0.3260383, -1.908809, 0.3803922, 1, 0, 1,
-0.6301616, -2.147771, -1.745349, 0.372549, 1, 0, 1,
-0.6297085, -0.433253, -0.2838955, 0.3686275, 1, 0, 1,
-0.6263946, 0.77795, -0.3599346, 0.3607843, 1, 0, 1,
-0.6202618, -0.1923929, -1.077051, 0.3568628, 1, 0, 1,
-0.615824, 0.4304195, -2.998611, 0.3490196, 1, 0, 1,
-0.6089212, 1.695616, -0.4482609, 0.345098, 1, 0, 1,
-0.5963126, 0.9736913, -0.7856892, 0.3372549, 1, 0, 1,
-0.5947424, 0.5312089, -0.6729672, 0.3333333, 1, 0, 1,
-0.5940348, 0.107715, -0.5711487, 0.3254902, 1, 0, 1,
-0.5924873, 0.2649553, -0.1292919, 0.3215686, 1, 0, 1,
-0.5903158, -0.1224842, -1.948523, 0.3137255, 1, 0, 1,
-0.5828699, 0.1439614, -0.514075, 0.3098039, 1, 0, 1,
-0.581232, 0.09696724, 0.4238288, 0.3019608, 1, 0, 1,
-0.5766004, 1.074825, -1.868454, 0.2941177, 1, 0, 1,
-0.5757424, -0.03452588, -0.3103182, 0.2901961, 1, 0, 1,
-0.5747691, 1.08117, -0.9305159, 0.282353, 1, 0, 1,
-0.5720549, 0.7057588, -2.326711, 0.2784314, 1, 0, 1,
-0.5712816, -0.5957884, -2.198501, 0.2705882, 1, 0, 1,
-0.568436, 1.853434, -0.2465904, 0.2666667, 1, 0, 1,
-0.56823, -0.7063676, -1.759282, 0.2588235, 1, 0, 1,
-0.5618947, 1.020289, 0.1773735, 0.254902, 1, 0, 1,
-0.5521338, -0.02741864, -0.1022999, 0.2470588, 1, 0, 1,
-0.5519761, -0.910741, -4.554415, 0.2431373, 1, 0, 1,
-0.550902, 0.5706251, -0.2153896, 0.2352941, 1, 0, 1,
-0.5498738, 1.0937, 1.156673, 0.2313726, 1, 0, 1,
-0.5478176, 0.2969618, -1.088732, 0.2235294, 1, 0, 1,
-0.5478171, 1.353979, 0.4477012, 0.2196078, 1, 0, 1,
-0.5452231, 2.234501, -1.272688, 0.2117647, 1, 0, 1,
-0.5421166, 0.2983444, -1.011063, 0.2078431, 1, 0, 1,
-0.5398628, 1.69522, 0.4527135, 0.2, 1, 0, 1,
-0.5355197, 1.680196, 0.110866, 0.1921569, 1, 0, 1,
-0.5346141, -0.01422145, -2.453235, 0.1882353, 1, 0, 1,
-0.5318503, -0.2980361, -0.7895206, 0.1803922, 1, 0, 1,
-0.5229926, -0.9831248, -3.998538, 0.1764706, 1, 0, 1,
-0.5216911, 0.507946, -0.0916779, 0.1686275, 1, 0, 1,
-0.5214518, 0.01153083, -0.3919722, 0.1647059, 1, 0, 1,
-0.5137557, 1.54026, -0.9232321, 0.1568628, 1, 0, 1,
-0.5076694, -0.3611035, -2.404083, 0.1529412, 1, 0, 1,
-0.507093, 0.8021466, -0.8071089, 0.145098, 1, 0, 1,
-0.506352, 0.5571641, -1.860218, 0.1411765, 1, 0, 1,
-0.5063132, -0.1898908, -1.692408, 0.1333333, 1, 0, 1,
-0.5060599, -0.08363395, -0.8071043, 0.1294118, 1, 0, 1,
-0.5038298, -0.8583646, -2.870356, 0.1215686, 1, 0, 1,
-0.4994377, -0.7282795, -3.961213, 0.1176471, 1, 0, 1,
-0.4981053, 0.2623198, -1.127977, 0.1098039, 1, 0, 1,
-0.4976057, 1.032136, -0.492685, 0.1058824, 1, 0, 1,
-0.4928752, 0.6714245, 0.2967941, 0.09803922, 1, 0, 1,
-0.4922947, -1.152735, -3.411772, 0.09019608, 1, 0, 1,
-0.4897778, 1.519429, 1.231106, 0.08627451, 1, 0, 1,
-0.4882414, 1.121722, 0.01226037, 0.07843138, 1, 0, 1,
-0.4828045, -0.2612421, -3.802295, 0.07450981, 1, 0, 1,
-0.4783141, 1.263899, -0.5897699, 0.06666667, 1, 0, 1,
-0.4751888, 0.7775179, -2.294124, 0.0627451, 1, 0, 1,
-0.4727225, 1.230168, -0.271717, 0.05490196, 1, 0, 1,
-0.4707781, -0.4209371, -3.25168, 0.05098039, 1, 0, 1,
-0.4681558, -1.948678, -1.26441, 0.04313726, 1, 0, 1,
-0.4669502, 0.3265463, 0.1618007, 0.03921569, 1, 0, 1,
-0.4657933, -0.1880064, -2.823608, 0.03137255, 1, 0, 1,
-0.4634439, 1.200423, -0.0982423, 0.02745098, 1, 0, 1,
-0.4631864, 1.003986, 0.04071257, 0.01960784, 1, 0, 1,
-0.4631523, -0.3522557, -1.63608, 0.01568628, 1, 0, 1,
-0.4555441, 0.6088749, -0.5610622, 0.007843138, 1, 0, 1,
-0.4547415, -1.370754, -1.446224, 0.003921569, 1, 0, 1,
-0.4543957, 0.2359627, -0.8085425, 0, 1, 0.003921569, 1,
-0.4538895, 0.7589015, -2.044257, 0, 1, 0.01176471, 1,
-0.4529389, 0.7209386, 0.8830861, 0, 1, 0.01568628, 1,
-0.4498166, 0.01305038, -2.514141, 0, 1, 0.02352941, 1,
-0.4483739, -1.193818, -2.391266, 0, 1, 0.02745098, 1,
-0.4479035, 2.962951, 0.2361121, 0, 1, 0.03529412, 1,
-0.4429195, -0.7829693, -3.91612, 0, 1, 0.03921569, 1,
-0.4414766, -1.049645, -4.365188, 0, 1, 0.04705882, 1,
-0.4389433, -0.2188622, -1.072905, 0, 1, 0.05098039, 1,
-0.4362737, 0.8787709, 1.425553, 0, 1, 0.05882353, 1,
-0.4335473, 0.268041, -1.18664, 0, 1, 0.0627451, 1,
-0.4320471, 2.4338, -1.027617, 0, 1, 0.07058824, 1,
-0.4281555, 2.669898, 0.03773525, 0, 1, 0.07450981, 1,
-0.4276417, -0.2162103, -2.654618, 0, 1, 0.08235294, 1,
-0.4247362, 0.321688, -3.580644, 0, 1, 0.08627451, 1,
-0.4177718, 0.468171, -0.5303242, 0, 1, 0.09411765, 1,
-0.4136982, 0.2309973, -3.401762, 0, 1, 0.1019608, 1,
-0.4122077, 0.6155378, 0.2065527, 0, 1, 0.1058824, 1,
-0.4090031, 1.797626, -0.1763119, 0, 1, 0.1137255, 1,
-0.4055501, 0.3619123, -1.532181, 0, 1, 0.1176471, 1,
-0.4003877, 0.6480936, -0.7574902, 0, 1, 0.1254902, 1,
-0.3998047, -0.243829, -2.459929, 0, 1, 0.1294118, 1,
-0.3977407, 1.626124, -1.420425, 0, 1, 0.1372549, 1,
-0.3966848, -0.1317224, -2.735843, 0, 1, 0.1411765, 1,
-0.3924992, -0.4869463, -1.339181, 0, 1, 0.1490196, 1,
-0.3900815, -0.06156927, -0.1541876, 0, 1, 0.1529412, 1,
-0.3898891, 0.362327, 0.01444631, 0, 1, 0.1607843, 1,
-0.3884137, 0.02818323, -0.9971975, 0, 1, 0.1647059, 1,
-0.3875965, -0.8679862, -2.121575, 0, 1, 0.172549, 1,
-0.3857757, 0.1094186, -1.3819, 0, 1, 0.1764706, 1,
-0.3831077, 2.138036, -1.457932, 0, 1, 0.1843137, 1,
-0.3812997, 0.09558503, -1.18771, 0, 1, 0.1882353, 1,
-0.3777351, -0.8965152, -3.205211, 0, 1, 0.1960784, 1,
-0.37542, 2.094804, -0.9967294, 0, 1, 0.2039216, 1,
-0.3741087, 1.451676, 0.002750857, 0, 1, 0.2078431, 1,
-0.3736168, 0.09570578, -0.3090169, 0, 1, 0.2156863, 1,
-0.3714125, -0.9930348, -4.015272, 0, 1, 0.2196078, 1,
-0.3677253, 1.287491, -0.7992373, 0, 1, 0.227451, 1,
-0.3670952, -0.6190796, -0.8885591, 0, 1, 0.2313726, 1,
-0.3655433, 0.6780955, -1.196827, 0, 1, 0.2392157, 1,
-0.363858, -0.1746859, -1.255753, 0, 1, 0.2431373, 1,
-0.3602155, -0.483285, -2.187954, 0, 1, 0.2509804, 1,
-0.3571852, -1.006008, -3.335549, 0, 1, 0.254902, 1,
-0.3535333, 0.2576194, -1.241482, 0, 1, 0.2627451, 1,
-0.3505336, -0.1491965, -0.931876, 0, 1, 0.2666667, 1,
-0.349297, -2.533349, -3.845243, 0, 1, 0.2745098, 1,
-0.3440438, 0.03134571, -1.826623, 0, 1, 0.2784314, 1,
-0.3377764, -0.1884388, -2.559994, 0, 1, 0.2862745, 1,
-0.3366235, 1.684724, -0.5546642, 0, 1, 0.2901961, 1,
-0.3351524, -0.2402035, -2.24038, 0, 1, 0.2980392, 1,
-0.3340688, -0.3320535, -3.154668, 0, 1, 0.3058824, 1,
-0.331471, 1.014113, -0.09265775, 0, 1, 0.3098039, 1,
-0.3309756, 0.7775959, -1.417355, 0, 1, 0.3176471, 1,
-0.323441, -1.38345, -2.402116, 0, 1, 0.3215686, 1,
-0.3178168, 2.167408, -1.034314, 0, 1, 0.3294118, 1,
-0.3146051, -1.422549, -4.131656, 0, 1, 0.3333333, 1,
-0.3138552, 0.01669892, -1.075503, 0, 1, 0.3411765, 1,
-0.3128281, -0.8363504, -2.104635, 0, 1, 0.345098, 1,
-0.3112427, -1.562631, -2.718541, 0, 1, 0.3529412, 1,
-0.3106555, 1.257991, 0.639297, 0, 1, 0.3568628, 1,
-0.3095627, -0.3137611, -0.4146127, 0, 1, 0.3647059, 1,
-0.3062751, -0.6999431, -2.829945, 0, 1, 0.3686275, 1,
-0.3039737, 0.08084393, -3.284906, 0, 1, 0.3764706, 1,
-0.2984065, 1.030624, -1.764801, 0, 1, 0.3803922, 1,
-0.2886092, 0.7143739, 0.2611025, 0, 1, 0.3882353, 1,
-0.2872456, 0.9664621, -1.485353, 0, 1, 0.3921569, 1,
-0.2835206, -1.797783, -2.532694, 0, 1, 0.4, 1,
-0.2809899, -0.5274189, -4.530969, 0, 1, 0.4078431, 1,
-0.2803796, 0.3821013, 0.7032056, 0, 1, 0.4117647, 1,
-0.2664393, 0.3800667, 0.3319238, 0, 1, 0.4196078, 1,
-0.2641064, 0.2399223, -1.49071, 0, 1, 0.4235294, 1,
-0.263316, -1.826993, -3.05878, 0, 1, 0.4313726, 1,
-0.2598036, 1.719946, -0.9463215, 0, 1, 0.4352941, 1,
-0.2590147, -1.356031, -2.246274, 0, 1, 0.4431373, 1,
-0.2579032, -1.29273, -3.097806, 0, 1, 0.4470588, 1,
-0.2551804, -0.04136904, -1.934248, 0, 1, 0.454902, 1,
-0.2516174, -1.18194, -4.177496, 0, 1, 0.4588235, 1,
-0.2503771, -0.3628947, -2.536692, 0, 1, 0.4666667, 1,
-0.2472399, -2.050168, -2.493334, 0, 1, 0.4705882, 1,
-0.2456426, -1.15572, -2.041717, 0, 1, 0.4784314, 1,
-0.244666, -1.615488, -3.193607, 0, 1, 0.4823529, 1,
-0.2374364, -0.3259549, -2.768298, 0, 1, 0.4901961, 1,
-0.2361202, 0.2870702, -0.6252811, 0, 1, 0.4941176, 1,
-0.2322698, 2.021109, -0.601697, 0, 1, 0.5019608, 1,
-0.2309277, 1.714158, -0.4327704, 0, 1, 0.509804, 1,
-0.2228778, 0.8988167, -0.3238268, 0, 1, 0.5137255, 1,
-0.2203374, 0.8808949, -0.8930146, 0, 1, 0.5215687, 1,
-0.2199411, 1.863929, 1.324457, 0, 1, 0.5254902, 1,
-0.2175758, 1.406633, -0.01962275, 0, 1, 0.5333334, 1,
-0.2103471, -0.9030148, -3.318008, 0, 1, 0.5372549, 1,
-0.2094747, -0.5969747, -2.603993, 0, 1, 0.5450981, 1,
-0.2045528, -1.911762, -3.149208, 0, 1, 0.5490196, 1,
-0.2000566, -0.6202736, -4.590685, 0, 1, 0.5568628, 1,
-0.1989562, 0.6880621, -0.7183043, 0, 1, 0.5607843, 1,
-0.1980443, 0.5583699, -0.9529663, 0, 1, 0.5686275, 1,
-0.1888771, 0.7520453, -0.3460957, 0, 1, 0.572549, 1,
-0.1880024, -1.457983, -2.607398, 0, 1, 0.5803922, 1,
-0.1849114, 1.409348, -0.2943107, 0, 1, 0.5843138, 1,
-0.1847956, 2.798955, -0.1804005, 0, 1, 0.5921569, 1,
-0.1837818, 1.303309, -0.6413328, 0, 1, 0.5960785, 1,
-0.1822203, 0.007243615, -1.713946, 0, 1, 0.6039216, 1,
-0.1785749, 0.4793254, -1.67758, 0, 1, 0.6117647, 1,
-0.1780542, -0.3589777, -3.89799, 0, 1, 0.6156863, 1,
-0.1719442, -0.4182464, -2.1524, 0, 1, 0.6235294, 1,
-0.1713783, 0.5819188, 0.6596476, 0, 1, 0.627451, 1,
-0.1627828, 0.03812643, -1.924354, 0, 1, 0.6352941, 1,
-0.1608506, 0.6202136, -0.167911, 0, 1, 0.6392157, 1,
-0.1576954, 0.8928985, -0.2997037, 0, 1, 0.6470588, 1,
-0.1567183, -0.5819195, -3.277378, 0, 1, 0.6509804, 1,
-0.1566482, -0.3483918, -3.447417, 0, 1, 0.6588235, 1,
-0.1544016, 0.5086024, 0.4818791, 0, 1, 0.6627451, 1,
-0.1523321, -0.182204, -2.140952, 0, 1, 0.6705883, 1,
-0.1509636, 2.126482, 0.1751081, 0, 1, 0.6745098, 1,
-0.1501169, 1.122276, 0.2147144, 0, 1, 0.682353, 1,
-0.1492582, 1.062666, -1.384316, 0, 1, 0.6862745, 1,
-0.1481862, -0.6322384, -1.139891, 0, 1, 0.6941177, 1,
-0.146077, -0.3744636, -2.239308, 0, 1, 0.7019608, 1,
-0.1447882, 0.304913, -0.5556493, 0, 1, 0.7058824, 1,
-0.1435724, 0.53805, 0.1041693, 0, 1, 0.7137255, 1,
-0.1364669, -0.6048549, -1.380814, 0, 1, 0.7176471, 1,
-0.1341831, -1.045474, -2.849716, 0, 1, 0.7254902, 1,
-0.1321897, -0.1107242, -0.05758172, 0, 1, 0.7294118, 1,
-0.1290896, -1.435242, -2.605949, 0, 1, 0.7372549, 1,
-0.1282173, -0.3739945, -2.880203, 0, 1, 0.7411765, 1,
-0.1217629, 1.768694, 1.641232, 0, 1, 0.7490196, 1,
-0.1183412, 0.4215836, -0.4331377, 0, 1, 0.7529412, 1,
-0.1149972, -1.290844, -2.62181, 0, 1, 0.7607843, 1,
-0.1127678, 1.859321, -0.2235562, 0, 1, 0.7647059, 1,
-0.1116403, 1.794053, -0.2044514, 0, 1, 0.772549, 1,
-0.1102825, 0.9430869, -0.5723431, 0, 1, 0.7764706, 1,
-0.1100377, 1.28551, 0.5888803, 0, 1, 0.7843137, 1,
-0.1073937, -1.778125, -3.424481, 0, 1, 0.7882353, 1,
-0.1068342, -0.4642481, -3.538352, 0, 1, 0.7960784, 1,
-0.1055904, -1.478587, -1.797148, 0, 1, 0.8039216, 1,
-0.1049456, 0.1342641, -0.8024585, 0, 1, 0.8078431, 1,
-0.1046915, 0.05950557, -0.3186882, 0, 1, 0.8156863, 1,
-0.09836276, 0.1354339, -1.059518, 0, 1, 0.8196079, 1,
-0.09639096, 0.898542, -0.02336035, 0, 1, 0.827451, 1,
-0.09086383, -0.6509455, -3.431396, 0, 1, 0.8313726, 1,
-0.08602043, -0.818353, -2.542855, 0, 1, 0.8392157, 1,
-0.08017125, 0.9716898, 0.1725924, 0, 1, 0.8431373, 1,
-0.07894072, 0.2167663, -1.548612, 0, 1, 0.8509804, 1,
-0.07101744, 1.789991, -0.6661855, 0, 1, 0.854902, 1,
-0.06996416, -0.2477621, -2.471547, 0, 1, 0.8627451, 1,
-0.06757762, -0.3812285, -2.887535, 0, 1, 0.8666667, 1,
-0.06499385, -1.263191, -3.584346, 0, 1, 0.8745098, 1,
-0.06300272, -0.09496445, -1.38794, 0, 1, 0.8784314, 1,
-0.05984373, 0.1445901, 1.614298, 0, 1, 0.8862745, 1,
-0.05941214, -0.634666, -1.903929, 0, 1, 0.8901961, 1,
-0.05767453, 0.1211927, -0.1846972, 0, 1, 0.8980392, 1,
-0.05761009, -1.548215, -2.681634, 0, 1, 0.9058824, 1,
-0.0568324, 0.2093033, 0.792066, 0, 1, 0.9098039, 1,
-0.05476716, -0.13906, -4.666405, 0, 1, 0.9176471, 1,
-0.05382649, -0.07982899, -1.857104, 0, 1, 0.9215686, 1,
-0.05281118, 0.9994814, -0.8476105, 0, 1, 0.9294118, 1,
-0.05169998, -0.1819859, -2.617877, 0, 1, 0.9333333, 1,
-0.04858963, 0.3161523, -0.7674491, 0, 1, 0.9411765, 1,
-0.03625748, 0.6736603, -0.3947167, 0, 1, 0.945098, 1,
-0.03416021, -0.1701176, -2.088331, 0, 1, 0.9529412, 1,
-0.03192903, -2.510288, -3.808293, 0, 1, 0.9568627, 1,
-0.03069813, -1.398348, -3.397484, 0, 1, 0.9647059, 1,
-0.02923076, 0.5368651, -0.02556917, 0, 1, 0.9686275, 1,
-0.02042105, 0.7212777, -0.8063357, 0, 1, 0.9764706, 1,
-0.01925192, -0.07217827, -2.123146, 0, 1, 0.9803922, 1,
-0.01860862, -0.2613541, -3.19238, 0, 1, 0.9882353, 1,
-0.01590802, -1.134609, -2.347947, 0, 1, 0.9921569, 1,
-0.01512486, -1.931165, -3.624802, 0, 1, 1, 1,
-0.01181054, 1.428983, 0.5673525, 0, 0.9921569, 1, 1,
-0.007249478, -0.0449306, -1.972542, 0, 0.9882353, 1, 1,
-0.004089076, 0.8267755, 1.641821, 0, 0.9803922, 1, 1,
-4.586654e-05, -0.6600479, -2.985929, 0, 0.9764706, 1, 1,
0.001277433, -1.069677, 2.089958, 0, 0.9686275, 1, 1,
0.002021684, 0.6309371, -0.932229, 0, 0.9647059, 1, 1,
0.002440502, 0.6285366, 0.348034, 0, 0.9568627, 1, 1,
0.01222666, -0.3800695, 2.519025, 0, 0.9529412, 1, 1,
0.01233938, 1.832209, 0.4665764, 0, 0.945098, 1, 1,
0.01442699, -0.6356433, 3.95306, 0, 0.9411765, 1, 1,
0.0258257, -0.3555771, 4.176254, 0, 0.9333333, 1, 1,
0.03032164, 1.160871, -0.027802, 0, 0.9294118, 1, 1,
0.03203383, -0.4194412, 2.908784, 0, 0.9215686, 1, 1,
0.03265324, -0.2006415, 3.131928, 0, 0.9176471, 1, 1,
0.03315145, -0.3502926, 2.358346, 0, 0.9098039, 1, 1,
0.03341711, 1.684846, 0.9731645, 0, 0.9058824, 1, 1,
0.03349849, 0.9451848, 1.339737, 0, 0.8980392, 1, 1,
0.03517714, 0.7996975, -0.5270226, 0, 0.8901961, 1, 1,
0.03635177, 0.2958066, -0.2444035, 0, 0.8862745, 1, 1,
0.04037165, 2.485805, -0.6741861, 0, 0.8784314, 1, 1,
0.0460889, -2.246555, 1.65973, 0, 0.8745098, 1, 1,
0.04691309, -0.5565053, 2.127166, 0, 0.8666667, 1, 1,
0.05023403, -1.887725, 0.8925001, 0, 0.8627451, 1, 1,
0.05408179, 0.4763045, -0.03510552, 0, 0.854902, 1, 1,
0.0545087, -0.5554639, 2.743425, 0, 0.8509804, 1, 1,
0.05577784, -0.04706907, -0.1054272, 0, 0.8431373, 1, 1,
0.06032495, -1.872453, 2.911939, 0, 0.8392157, 1, 1,
0.06127438, -0.6111816, 2.612406, 0, 0.8313726, 1, 1,
0.06165269, 0.7102169, 0.6272769, 0, 0.827451, 1, 1,
0.06247797, 1.559032, 2.462014, 0, 0.8196079, 1, 1,
0.06311104, -0.693745, 2.999039, 0, 0.8156863, 1, 1,
0.06478929, 0.6812986, 0.5107948, 0, 0.8078431, 1, 1,
0.07322164, 0.5600221, -0.3500215, 0, 0.8039216, 1, 1,
0.07332937, 0.6750139, 0.3956654, 0, 0.7960784, 1, 1,
0.077415, -0.07673007, 1.989207, 0, 0.7882353, 1, 1,
0.08206158, -1.475415, 3.695787, 0, 0.7843137, 1, 1,
0.08244377, -0.03286875, 2.9209, 0, 0.7764706, 1, 1,
0.083308, -0.5487961, 3.116435, 0, 0.772549, 1, 1,
0.08524048, 0.08837684, 1.703196, 0, 0.7647059, 1, 1,
0.09865912, -0.8562886, 2.61748, 0, 0.7607843, 1, 1,
0.09912831, 0.431768, 2.857931, 0, 0.7529412, 1, 1,
0.1052735, 0.9056324, -1.83204, 0, 0.7490196, 1, 1,
0.1059991, -0.9910365, 4.442642, 0, 0.7411765, 1, 1,
0.1067667, -0.5144256, 3.750022, 0, 0.7372549, 1, 1,
0.1108996, 1.605468, 0.7619824, 0, 0.7294118, 1, 1,
0.1176823, -0.2997942, 3.544477, 0, 0.7254902, 1, 1,
0.1188293, 0.1253585, 1.300711, 0, 0.7176471, 1, 1,
0.1216503, -0.09607409, 2.623821, 0, 0.7137255, 1, 1,
0.1224101, -0.8679814, 3.078579, 0, 0.7058824, 1, 1,
0.1251114, 0.1683329, 2.525316, 0, 0.6980392, 1, 1,
0.1369694, -1.834139, 3.54805, 0, 0.6941177, 1, 1,
0.1388316, 0.752234, -1.418572, 0, 0.6862745, 1, 1,
0.1427133, -1.037791, 3.09073, 0, 0.682353, 1, 1,
0.1443433, -1.098238, 2.093677, 0, 0.6745098, 1, 1,
0.1448988, -0.2742679, 2.640084, 0, 0.6705883, 1, 1,
0.146361, 1.0841, 0.03097567, 0, 0.6627451, 1, 1,
0.1500549, -0.0006147512, 1.665882, 0, 0.6588235, 1, 1,
0.1543985, -0.987493, 2.205003, 0, 0.6509804, 1, 1,
0.1566669, 0.09486446, 0.72359, 0, 0.6470588, 1, 1,
0.1572963, 1.01899, 0.2999108, 0, 0.6392157, 1, 1,
0.1575108, 0.03857721, -0.5270819, 0, 0.6352941, 1, 1,
0.1620532, -0.3895537, 1.659612, 0, 0.627451, 1, 1,
0.162192, -1.252056, 3.91697, 0, 0.6235294, 1, 1,
0.1671252, -1.094617, 0.2421668, 0, 0.6156863, 1, 1,
0.1686141, -1.007862, 0.3544706, 0, 0.6117647, 1, 1,
0.1688966, 0.5975261, 1.216403, 0, 0.6039216, 1, 1,
0.169773, 1.39283, 0.3269624, 0, 0.5960785, 1, 1,
0.1719872, 1.392237, 0.2201486, 0, 0.5921569, 1, 1,
0.1770614, -1.552921, 2.831826, 0, 0.5843138, 1, 1,
0.1773208, -0.9005182, 1.849198, 0, 0.5803922, 1, 1,
0.1777423, 0.2801177, 1.279125, 0, 0.572549, 1, 1,
0.1782683, -2.285455, 4.759683, 0, 0.5686275, 1, 1,
0.1808134, 1.503138, -1.228188, 0, 0.5607843, 1, 1,
0.1820198, -1.202454, 3.364267, 0, 0.5568628, 1, 1,
0.1832659, 1.945429, -0.0679767, 0, 0.5490196, 1, 1,
0.1868705, 0.7030458, -1.698414, 0, 0.5450981, 1, 1,
0.1914537, 0.2402904, 1.788382, 0, 0.5372549, 1, 1,
0.19318, 1.156385, -0.1766257, 0, 0.5333334, 1, 1,
0.1959915, -1.596475, 5.411076, 0, 0.5254902, 1, 1,
0.1989323, 0.5324888, -0.6078764, 0, 0.5215687, 1, 1,
0.2005035, 1.753897, -0.558938, 0, 0.5137255, 1, 1,
0.2024133, -0.5676711, 1.737083, 0, 0.509804, 1, 1,
0.2043062, -1.425076, 3.5347, 0, 0.5019608, 1, 1,
0.2078113, -0.9257582, 2.07432, 0, 0.4941176, 1, 1,
0.2082103, 0.05773513, -0.2695854, 0, 0.4901961, 1, 1,
0.2104524, -0.02926799, 2.455732, 0, 0.4823529, 1, 1,
0.2106287, -0.4219481, 2.101587, 0, 0.4784314, 1, 1,
0.2141664, -0.3013692, 2.276231, 0, 0.4705882, 1, 1,
0.2158408, 0.4353213, 1.437162, 0, 0.4666667, 1, 1,
0.2168467, -0.8790591, 2.964863, 0, 0.4588235, 1, 1,
0.2176685, -1.602357, 2.197078, 0, 0.454902, 1, 1,
0.2180291, -0.170922, 2.764415, 0, 0.4470588, 1, 1,
0.2184857, 0.4433971, 0.9217535, 0, 0.4431373, 1, 1,
0.2197753, -0.02346184, 1.550762, 0, 0.4352941, 1, 1,
0.2208536, -1.16574, 0.8620122, 0, 0.4313726, 1, 1,
0.2232514, 1.03389, 0.6438797, 0, 0.4235294, 1, 1,
0.2234633, -1.23362, 3.681808, 0, 0.4196078, 1, 1,
0.2239834, -1.579837, 4.38635, 0, 0.4117647, 1, 1,
0.2243053, -0.3310409, 1.583663, 0, 0.4078431, 1, 1,
0.2246192, 0.09748096, 1.042332, 0, 0.4, 1, 1,
0.2278026, -0.3035553, 1.691973, 0, 0.3921569, 1, 1,
0.2291962, -0.7357325, 4.444884, 0, 0.3882353, 1, 1,
0.2300237, 1.018426, -0.266929, 0, 0.3803922, 1, 1,
0.2322664, 0.8705795, -0.3034418, 0, 0.3764706, 1, 1,
0.2326335, -0.587298, 2.843112, 0, 0.3686275, 1, 1,
0.2361444, -0.5934941, 3.087847, 0, 0.3647059, 1, 1,
0.2409669, 0.7743786, 0.1287048, 0, 0.3568628, 1, 1,
0.2430456, -0.7041957, 1.676553, 0, 0.3529412, 1, 1,
0.2462137, -0.4479964, 2.05147, 0, 0.345098, 1, 1,
0.2464758, -0.7103218, 2.711363, 0, 0.3411765, 1, 1,
0.2494949, -0.4650531, 3.659236, 0, 0.3333333, 1, 1,
0.2528207, -0.2631912, 3.247047, 0, 0.3294118, 1, 1,
0.257366, -0.5798535, 2.979657, 0, 0.3215686, 1, 1,
0.2600478, 0.6368039, 0.0482175, 0, 0.3176471, 1, 1,
0.2623719, -0.5932071, 3.524383, 0, 0.3098039, 1, 1,
0.2649327, -1.156176, 3.545281, 0, 0.3058824, 1, 1,
0.2694358, 0.6299857, 0.191445, 0, 0.2980392, 1, 1,
0.2723435, 0.3963484, 3.675506, 0, 0.2901961, 1, 1,
0.2746552, 1.33054, -0.4005785, 0, 0.2862745, 1, 1,
0.2760264, -1.044645, 4.353043, 0, 0.2784314, 1, 1,
0.2817347, -0.07804906, -0.2046144, 0, 0.2745098, 1, 1,
0.2822409, 0.9529234, 0.6118019, 0, 0.2666667, 1, 1,
0.2846186, 0.1164864, 0.8431678, 0, 0.2627451, 1, 1,
0.2851041, -0.2152329, 4.085717, 0, 0.254902, 1, 1,
0.2875406, -1.776628, 3.892751, 0, 0.2509804, 1, 1,
0.2892245, 0.1096054, -0.5254122, 0, 0.2431373, 1, 1,
0.2894855, 1.237336, 0.78092, 0, 0.2392157, 1, 1,
0.2911841, 2.087767, 0.5147244, 0, 0.2313726, 1, 1,
0.2924307, 1.051474, 0.3099059, 0, 0.227451, 1, 1,
0.2944784, 0.1286984, 2.52875, 0, 0.2196078, 1, 1,
0.2979377, -1.300287, 3.308051, 0, 0.2156863, 1, 1,
0.303948, 1.76042, 1.820723, 0, 0.2078431, 1, 1,
0.3050996, -0.04553878, -0.09439795, 0, 0.2039216, 1, 1,
0.305345, -1.213667, 0.9085062, 0, 0.1960784, 1, 1,
0.3072241, -0.4306246, 1.884484, 0, 0.1882353, 1, 1,
0.3103087, -0.4614386, 1.422327, 0, 0.1843137, 1, 1,
0.3119817, -0.7456111, 1.803674, 0, 0.1764706, 1, 1,
0.3121879, 1.739198, -1.038129, 0, 0.172549, 1, 1,
0.3169046, 0.8476199, 0.0941098, 0, 0.1647059, 1, 1,
0.3176899, -1.224238, 1.650467, 0, 0.1607843, 1, 1,
0.3192408, 1.068225, 0.1158792, 0, 0.1529412, 1, 1,
0.3197501, 1.205272, 0.9659877, 0, 0.1490196, 1, 1,
0.3233437, 0.2362332, 1.58296, 0, 0.1411765, 1, 1,
0.3258227, -0.4216018, 1.538384, 0, 0.1372549, 1, 1,
0.3263514, -0.1216251, 2.046085, 0, 0.1294118, 1, 1,
0.3292444, -1.074982, 3.40193, 0, 0.1254902, 1, 1,
0.3343419, -0.2208955, 2.810803, 0, 0.1176471, 1, 1,
0.3355135, -0.6261067, 2.998104, 0, 0.1137255, 1, 1,
0.335554, 2.090308, -0.5390372, 0, 0.1058824, 1, 1,
0.3455594, 0.7843484, 0.2207353, 0, 0.09803922, 1, 1,
0.3530191, -0.3900613, 2.405542, 0, 0.09411765, 1, 1,
0.3591296, 0.6083959, 0.9626033, 0, 0.08627451, 1, 1,
0.3605944, 0.7718625, 0.5482984, 0, 0.08235294, 1, 1,
0.3622462, -0.2288389, 2.023783, 0, 0.07450981, 1, 1,
0.3628522, 0.06587291, 0.9009541, 0, 0.07058824, 1, 1,
0.3633885, 0.5581093, 2.185705, 0, 0.0627451, 1, 1,
0.3672153, 0.3161492, 1.775277, 0, 0.05882353, 1, 1,
0.368349, -0.8835251, 3.707622, 0, 0.05098039, 1, 1,
0.3731619, 0.3050316, 1.535926, 0, 0.04705882, 1, 1,
0.3746538, -0.3108265, 0.6961513, 0, 0.03921569, 1, 1,
0.3761212, 0.8663864, -0.2685986, 0, 0.03529412, 1, 1,
0.3770086, -0.1268229, 2.213956, 0, 0.02745098, 1, 1,
0.3792278, -0.2343458, 2.595139, 0, 0.02352941, 1, 1,
0.386133, -0.7458573, 2.646607, 0, 0.01568628, 1, 1,
0.3884558, 0.2590625, 1.376814, 0, 0.01176471, 1, 1,
0.3959415, -0.3745838, 1.68587, 0, 0.003921569, 1, 1,
0.4082697, -0.2034786, 2.618387, 0.003921569, 0, 1, 1,
0.4105532, -1.290577, 4.024413, 0.007843138, 0, 1, 1,
0.4123048, 0.5285709, -0.157099, 0.01568628, 0, 1, 1,
0.413473, 1.473912, -0.5132552, 0.01960784, 0, 1, 1,
0.4157716, -1.115005, 3.248896, 0.02745098, 0, 1, 1,
0.4173006, -0.9966836, 2.97499, 0.03137255, 0, 1, 1,
0.4220559, -0.7596818, 2.511978, 0.03921569, 0, 1, 1,
0.4255252, 0.0166817, 1.489595, 0.04313726, 0, 1, 1,
0.4278386, -0.3705999, 2.77456, 0.05098039, 0, 1, 1,
0.4310018, 0.5623457, -0.7833059, 0.05490196, 0, 1, 1,
0.4312843, -0.1589055, 2.695678, 0.0627451, 0, 1, 1,
0.4325885, 0.5710125, 2.012757, 0.06666667, 0, 1, 1,
0.4332896, -0.0278132, 0.9654937, 0.07450981, 0, 1, 1,
0.4334853, 0.5831978, 0.3153451, 0.07843138, 0, 1, 1,
0.4351636, -1.847671, 4.080559, 0.08627451, 0, 1, 1,
0.4353522, 0.4190532, 0.01726768, 0.09019608, 0, 1, 1,
0.4393312, -0.5982805, 1.545719, 0.09803922, 0, 1, 1,
0.44944, -0.7816297, 4.208201, 0.1058824, 0, 1, 1,
0.4530927, -0.8367311, 2.05324, 0.1098039, 0, 1, 1,
0.4548847, -0.8630939, 2.013532, 0.1176471, 0, 1, 1,
0.4566609, 1.093389, 0.3602457, 0.1215686, 0, 1, 1,
0.4592909, 1.143634, 1.025705, 0.1294118, 0, 1, 1,
0.4689541, -0.8392506, 3.747451, 0.1333333, 0, 1, 1,
0.4698052, 1.835638, -0.6491675, 0.1411765, 0, 1, 1,
0.4705212, 2.015384, -0.3390321, 0.145098, 0, 1, 1,
0.473912, -1.126073, 4.24126, 0.1529412, 0, 1, 1,
0.4745679, -0.2176136, 3.190175, 0.1568628, 0, 1, 1,
0.4778652, -0.6998816, 2.387736, 0.1647059, 0, 1, 1,
0.4798925, 0.3397622, 1.183758, 0.1686275, 0, 1, 1,
0.4831409, -0.6358777, 2.292629, 0.1764706, 0, 1, 1,
0.4884495, 2.104681, 2.810035, 0.1803922, 0, 1, 1,
0.4981142, -0.9236529, 3.647013, 0.1882353, 0, 1, 1,
0.4988293, -1.822612, 3.157937, 0.1921569, 0, 1, 1,
0.4999236, -2.119241, 2.075161, 0.2, 0, 1, 1,
0.5000945, -0.9189524, 2.495467, 0.2078431, 0, 1, 1,
0.5008216, 1.00562, 0.7006398, 0.2117647, 0, 1, 1,
0.5038927, 0.939339, 0.8437769, 0.2196078, 0, 1, 1,
0.5039713, -1.230953, 3.120457, 0.2235294, 0, 1, 1,
0.5072497, 0.1649736, 0.615595, 0.2313726, 0, 1, 1,
0.5094599, 0.1936748, 3.260679, 0.2352941, 0, 1, 1,
0.5102557, 0.4876287, 0.4219288, 0.2431373, 0, 1, 1,
0.5112885, -0.1863925, -1.385019, 0.2470588, 0, 1, 1,
0.5116975, -1.0837, 0.4864687, 0.254902, 0, 1, 1,
0.5127183, -1.965112, 1.809931, 0.2588235, 0, 1, 1,
0.5139164, 0.9750637, -0.07930459, 0.2666667, 0, 1, 1,
0.5280151, -0.6153623, 4.274954, 0.2705882, 0, 1, 1,
0.5296869, 0.05749081, 1.142698, 0.2784314, 0, 1, 1,
0.5353308, -1.378255, 3.459145, 0.282353, 0, 1, 1,
0.5444383, -1.247041, 1.996768, 0.2901961, 0, 1, 1,
0.5458241, -0.01875365, 0.6759187, 0.2941177, 0, 1, 1,
0.5475485, 0.5728667, 0.7177181, 0.3019608, 0, 1, 1,
0.5536976, 1.661374, 0.9623338, 0.3098039, 0, 1, 1,
0.5683941, 1.051311, -0.5285778, 0.3137255, 0, 1, 1,
0.5707986, 1.384704, 0.6487987, 0.3215686, 0, 1, 1,
0.5746135, 0.4842699, 1.454519, 0.3254902, 0, 1, 1,
0.5791362, 0.9549225, 0.886852, 0.3333333, 0, 1, 1,
0.5877771, -0.0209092, 1.225286, 0.3372549, 0, 1, 1,
0.589929, 0.3628193, 1.458055, 0.345098, 0, 1, 1,
0.5919176, -0.7423645, 3.190354, 0.3490196, 0, 1, 1,
0.5923483, -0.55454, 1.819962, 0.3568628, 0, 1, 1,
0.5938591, 0.9043823, -0.6577002, 0.3607843, 0, 1, 1,
0.599086, -1.186729, 3.21402, 0.3686275, 0, 1, 1,
0.6020658, 0.3272438, 2.169983, 0.372549, 0, 1, 1,
0.6059327, -0.8621054, 2.421777, 0.3803922, 0, 1, 1,
0.6081803, -0.5463333, 1.851023, 0.3843137, 0, 1, 1,
0.6089014, 0.05318644, 1.944644, 0.3921569, 0, 1, 1,
0.6152059, -0.6447276, 2.228945, 0.3960784, 0, 1, 1,
0.6254582, -3.004865, 2.655771, 0.4039216, 0, 1, 1,
0.6265537, -0.2501624, 2.955379, 0.4117647, 0, 1, 1,
0.6298371, -0.4828567, 0.6459972, 0.4156863, 0, 1, 1,
0.6323318, -0.4700258, 3.454894, 0.4235294, 0, 1, 1,
0.6348798, -0.8914924, 2.775644, 0.427451, 0, 1, 1,
0.6420516, 0.295806, 0.1355827, 0.4352941, 0, 1, 1,
0.6434669, 0.3287724, 1.814947, 0.4392157, 0, 1, 1,
0.6446053, 2.454624, 0.650579, 0.4470588, 0, 1, 1,
0.6454417, 0.4732584, -0.7085161, 0.4509804, 0, 1, 1,
0.6475054, 0.1851483, 1.629896, 0.4588235, 0, 1, 1,
0.6475606, -1.115752, 2.141914, 0.4627451, 0, 1, 1,
0.6508797, 0.009956349, 0.894623, 0.4705882, 0, 1, 1,
0.6566406, -1.961188, 2.877396, 0.4745098, 0, 1, 1,
0.666674, -0.3769171, 2.173805, 0.4823529, 0, 1, 1,
0.6756676, 0.1640266, 0.7048475, 0.4862745, 0, 1, 1,
0.677341, -0.1623546, 0.5273024, 0.4941176, 0, 1, 1,
0.6792164, -0.2646565, 1.98137, 0.5019608, 0, 1, 1,
0.682439, 0.3901741, 2.20134, 0.5058824, 0, 1, 1,
0.6858566, 1.345522, 0.5728309, 0.5137255, 0, 1, 1,
0.6944607, 1.413428, 1.160593, 0.5176471, 0, 1, 1,
0.6973351, 0.475678, 0.357568, 0.5254902, 0, 1, 1,
0.7005337, -0.6099573, 3.461332, 0.5294118, 0, 1, 1,
0.7014855, -1.374244, 3.645741, 0.5372549, 0, 1, 1,
0.7053342, 1.065561, 0.338012, 0.5411765, 0, 1, 1,
0.705964, 2.048615, 2.379159, 0.5490196, 0, 1, 1,
0.7114208, 0.07223652, 1.692024, 0.5529412, 0, 1, 1,
0.7179653, -0.7019773, 1.503496, 0.5607843, 0, 1, 1,
0.7296525, 0.8487796, 0.2696421, 0.5647059, 0, 1, 1,
0.7328528, 0.1890769, 1.895378, 0.572549, 0, 1, 1,
0.7342228, -1.028311, 1.224405, 0.5764706, 0, 1, 1,
0.739301, -1.609068, 1.064577, 0.5843138, 0, 1, 1,
0.7426997, 0.5794466, 1.98518, 0.5882353, 0, 1, 1,
0.751606, -0.8004845, 2.639712, 0.5960785, 0, 1, 1,
0.7534536, 0.1433682, 1.905739, 0.6039216, 0, 1, 1,
0.7557334, 0.07450499, 1.585832, 0.6078432, 0, 1, 1,
0.7574999, -0.2738196, 2.676597, 0.6156863, 0, 1, 1,
0.7605652, -0.2402663, 1.775142, 0.6196079, 0, 1, 1,
0.7605865, 1.372491, -1.986911, 0.627451, 0, 1, 1,
0.7613781, 0.9075782, 0.9322151, 0.6313726, 0, 1, 1,
0.7643237, 0.8093914, -0.8233573, 0.6392157, 0, 1, 1,
0.7645905, 0.3150403, 3.415629, 0.6431373, 0, 1, 1,
0.7663753, -0.8325379, 3.188871, 0.6509804, 0, 1, 1,
0.7689667, -1.083769, 4.022732, 0.654902, 0, 1, 1,
0.7707702, 1.224895, -0.3224772, 0.6627451, 0, 1, 1,
0.7720715, -1.531344, 3.924327, 0.6666667, 0, 1, 1,
0.7732238, -0.9273616, 1.06127, 0.6745098, 0, 1, 1,
0.7765872, -0.9074697, 2.220428, 0.6784314, 0, 1, 1,
0.7810332, 0.08439463, 0.5332203, 0.6862745, 0, 1, 1,
0.7811604, -0.3751479, 2.23125, 0.6901961, 0, 1, 1,
0.7850062, -0.9853349, 2.260595, 0.6980392, 0, 1, 1,
0.7860764, -0.06207163, 2.024088, 0.7058824, 0, 1, 1,
0.7932141, 1.712184, 1.743968, 0.7098039, 0, 1, 1,
0.7941942, -0.657418, 3.356874, 0.7176471, 0, 1, 1,
0.8014036, -1.109095, 0.8905358, 0.7215686, 0, 1, 1,
0.8014969, 0.04943958, 1.994393, 0.7294118, 0, 1, 1,
0.8143031, -0.3707626, 2.069033, 0.7333333, 0, 1, 1,
0.8197778, 1.687567, -1.838655, 0.7411765, 0, 1, 1,
0.8221694, 0.135123, 0.8896035, 0.7450981, 0, 1, 1,
0.8238451, 0.5369254, 2.385925, 0.7529412, 0, 1, 1,
0.8256468, -0.2321078, 2.021242, 0.7568628, 0, 1, 1,
0.8283762, 0.2979132, 1.618649, 0.7647059, 0, 1, 1,
0.835893, 0.3802847, 0.04622152, 0.7686275, 0, 1, 1,
0.8390996, -0.1777365, 0.7536814, 0.7764706, 0, 1, 1,
0.8464679, 0.04177354, 1.111799, 0.7803922, 0, 1, 1,
0.8483372, 0.07397351, 0.8208228, 0.7882353, 0, 1, 1,
0.857888, 0.8408921, 2.402847, 0.7921569, 0, 1, 1,
0.8599945, 0.3245372, 1.214469, 0.8, 0, 1, 1,
0.860379, 1.352962, 0.4713885, 0.8078431, 0, 1, 1,
0.8665752, -1.923393, 1.870445, 0.8117647, 0, 1, 1,
0.8699077, -1.847732, 2.252612, 0.8196079, 0, 1, 1,
0.8717291, -1.978403, 1.624152, 0.8235294, 0, 1, 1,
0.8728568, 1.292508, 1.140416, 0.8313726, 0, 1, 1,
0.8847932, 1.492767, 2.07537, 0.8352941, 0, 1, 1,
0.8867719, -1.197801, -0.4710611, 0.8431373, 0, 1, 1,
0.8904958, 1.059214, 1.150312, 0.8470588, 0, 1, 1,
0.8921352, 2.764582, -0.1192332, 0.854902, 0, 1, 1,
0.907362, -1.16193, 4.116481, 0.8588235, 0, 1, 1,
0.910085, -1.112808, 2.644576, 0.8666667, 0, 1, 1,
0.9118782, -1.688918, 3.10907, 0.8705882, 0, 1, 1,
0.9142278, -0.4043989, 1.749449, 0.8784314, 0, 1, 1,
0.9283171, -0.1014449, 1.68944, 0.8823529, 0, 1, 1,
0.9287526, -0.6779136, 1.8512, 0.8901961, 0, 1, 1,
0.9303924, 1.493836, 0.8860102, 0.8941177, 0, 1, 1,
0.9314327, 1.789823, 2.523169, 0.9019608, 0, 1, 1,
0.9343352, 0.6806548, 0.3135429, 0.9098039, 0, 1, 1,
0.9392504, -0.4406167, 1.098125, 0.9137255, 0, 1, 1,
0.9560722, -0.9167443, 5.053594, 0.9215686, 0, 1, 1,
0.9571137, -0.2597581, 1.778948, 0.9254902, 0, 1, 1,
0.9640235, -1.473763, 3.002486, 0.9333333, 0, 1, 1,
0.9654225, -0.141352, 0.1777691, 0.9372549, 0, 1, 1,
0.9666052, -1.96206, 1.502111, 0.945098, 0, 1, 1,
0.9721233, -1.713362, 2.424851, 0.9490196, 0, 1, 1,
0.9819122, -2.087661, 2.118544, 0.9568627, 0, 1, 1,
0.9839902, 1.705825, -0.1268879, 0.9607843, 0, 1, 1,
0.9870037, 1.501015, 1.176664, 0.9686275, 0, 1, 1,
0.9891939, -0.1871355, 0.8667497, 0.972549, 0, 1, 1,
0.993362, 1.592169, -0.6469288, 0.9803922, 0, 1, 1,
0.9939407, -0.277431, 1.217367, 0.9843137, 0, 1, 1,
0.9943379, -0.2140942, 1.254775, 0.9921569, 0, 1, 1,
1.004643, -0.318374, 1.957602, 0.9960784, 0, 1, 1,
1.007298, 0.8101054, 1.01495, 1, 0, 0.9960784, 1,
1.009934, 1.706213, 1.671428, 1, 0, 0.9882353, 1,
1.015084, -0.2142501, 2.157357, 1, 0, 0.9843137, 1,
1.01661, -2.235343, 2.250643, 1, 0, 0.9764706, 1,
1.022795, -1.026831, 4.105777, 1, 0, 0.972549, 1,
1.037381, 1.738857, -0.1431166, 1, 0, 0.9647059, 1,
1.054616, -0.04912497, 2.069367, 1, 0, 0.9607843, 1,
1.061224, -1.878928, 2.298667, 1, 0, 0.9529412, 1,
1.066492, -1.69436, 0.9677016, 1, 0, 0.9490196, 1,
1.068445, 0.8577668, 0.9093886, 1, 0, 0.9411765, 1,
1.070134, -0.7149836, 1.08145, 1, 0, 0.9372549, 1,
1.071313, 0.08269579, 3.523367, 1, 0, 0.9294118, 1,
1.074859, -0.3280032, 1.362303, 1, 0, 0.9254902, 1,
1.077062, 0.9447682, -1.336587, 1, 0, 0.9176471, 1,
1.081687, 0.6465341, 1.229671, 1, 0, 0.9137255, 1,
1.089345, -0.446122, 1.523154, 1, 0, 0.9058824, 1,
1.092093, -0.2545888, 1.321861, 1, 0, 0.9019608, 1,
1.09358, -0.9107842, 2.327232, 1, 0, 0.8941177, 1,
1.097658, -0.5415876, 0.5357283, 1, 0, 0.8862745, 1,
1.09915, -0.3082578, 3.52949, 1, 0, 0.8823529, 1,
1.099604, -0.7997327, 1.911106, 1, 0, 0.8745098, 1,
1.101473, 0.9413962, 1.576346, 1, 0, 0.8705882, 1,
1.109948, 1.045997, -0.1172981, 1, 0, 0.8627451, 1,
1.110575, -0.3017503, 3.132043, 1, 0, 0.8588235, 1,
1.123865, 0.9871794, 0.5701303, 1, 0, 0.8509804, 1,
1.131812, 0.2478361, 1.019594, 1, 0, 0.8470588, 1,
1.134537, -0.7392635, 3.18174, 1, 0, 0.8392157, 1,
1.136554, 0.07813377, 0.9482113, 1, 0, 0.8352941, 1,
1.13987, 0.1401669, 0.02623971, 1, 0, 0.827451, 1,
1.140077, 0.7084796, 0.9192431, 1, 0, 0.8235294, 1,
1.145119, -0.02796084, 2.846854, 1, 0, 0.8156863, 1,
1.149676, -1.214501, -1.061466, 1, 0, 0.8117647, 1,
1.157287, -2.618733, 4.468022, 1, 0, 0.8039216, 1,
1.159759, -0.6202464, 2.520388, 1, 0, 0.7960784, 1,
1.164496, -0.1491237, 2.472794, 1, 0, 0.7921569, 1,
1.167198, -0.4358404, 2.207893, 1, 0, 0.7843137, 1,
1.168149, -0.8391848, 3.515892, 1, 0, 0.7803922, 1,
1.169152, 0.002491916, 0.07407564, 1, 0, 0.772549, 1,
1.185643, 1.184955, 1.994788, 1, 0, 0.7686275, 1,
1.189402, -0.149018, 3.478984, 1, 0, 0.7607843, 1,
1.193674, -0.6623259, 1.769171, 1, 0, 0.7568628, 1,
1.193793, 0.4196471, 1.334367, 1, 0, 0.7490196, 1,
1.201302, -1.834665, 2.749473, 1, 0, 0.7450981, 1,
1.207913, 0.6767268, 0.3718203, 1, 0, 0.7372549, 1,
1.210879, 0.44849, 2.891295, 1, 0, 0.7333333, 1,
1.21428, -0.4607738, 2.237844, 1, 0, 0.7254902, 1,
1.222006, -0.1292998, 1.075688, 1, 0, 0.7215686, 1,
1.222301, 0.8665622, -0.4377355, 1, 0, 0.7137255, 1,
1.227888, 1.156599, 1.231861, 1, 0, 0.7098039, 1,
1.228051, -0.1464487, 1.602774, 1, 0, 0.7019608, 1,
1.229635, 0.2587191, 1.322495, 1, 0, 0.6941177, 1,
1.229708, 1.860849, 2.290509, 1, 0, 0.6901961, 1,
1.237709, 0.1485773, 1.726015, 1, 0, 0.682353, 1,
1.241896, 1.991735, 1.18263, 1, 0, 0.6784314, 1,
1.246249, -0.5106829, 1.815349, 1, 0, 0.6705883, 1,
1.267188, -0.4058845, 1.332693, 1, 0, 0.6666667, 1,
1.26948, 0.4232844, 1.803319, 1, 0, 0.6588235, 1,
1.272347, 1.057936, 0.4769104, 1, 0, 0.654902, 1,
1.274626, 0.2421035, 0.937305, 1, 0, 0.6470588, 1,
1.278653, -0.2425604, 1.033724, 1, 0, 0.6431373, 1,
1.302641, -1.036542, 2.369516, 1, 0, 0.6352941, 1,
1.303252, 0.917008, -0.4170863, 1, 0, 0.6313726, 1,
1.305198, -0.4135335, 0.2199384, 1, 0, 0.6235294, 1,
1.312079, 0.8048534, 1.001573, 1, 0, 0.6196079, 1,
1.314006, 0.6865547, 1.534814, 1, 0, 0.6117647, 1,
1.315051, 0.3901372, 0.2894133, 1, 0, 0.6078432, 1,
1.320384, -0.5022082, 0.7529373, 1, 0, 0.6, 1,
1.333126, -0.4194814, 2.869781, 1, 0, 0.5921569, 1,
1.341625, 1.301051, 0.175666, 1, 0, 0.5882353, 1,
1.34245, 0.5409024, -0.7789678, 1, 0, 0.5803922, 1,
1.346089, 1.577326, 1.443027, 1, 0, 0.5764706, 1,
1.350083, 1.525785, -0.01542071, 1, 0, 0.5686275, 1,
1.350804, -0.6202736, 2.716213, 1, 0, 0.5647059, 1,
1.351354, -2.480829, 2.45519, 1, 0, 0.5568628, 1,
1.358991, 0.6464127, -0.06937163, 1, 0, 0.5529412, 1,
1.362097, 0.1135763, 2.716535, 1, 0, 0.5450981, 1,
1.377328, 1.335782, 2.363733, 1, 0, 0.5411765, 1,
1.380635, 0.5458038, 0.6715673, 1, 0, 0.5333334, 1,
1.380682, 0.6431278, -0.8253258, 1, 0, 0.5294118, 1,
1.385577, -0.4982266, 3.44756, 1, 0, 0.5215687, 1,
1.398615, -0.2642054, 2.015318, 1, 0, 0.5176471, 1,
1.420511, 0.186, 2.99894, 1, 0, 0.509804, 1,
1.429714, 2.090656, 1.2739, 1, 0, 0.5058824, 1,
1.431259, -0.9784701, 1.747545, 1, 0, 0.4980392, 1,
1.434419, -0.01100926, 2.627783, 1, 0, 0.4901961, 1,
1.437817, 1.497787, 2.231449, 1, 0, 0.4862745, 1,
1.454344, -1.847267, 2.117007, 1, 0, 0.4784314, 1,
1.460963, 0.1641491, 0.7412047, 1, 0, 0.4745098, 1,
1.463887, 0.5280275, 2.674084, 1, 0, 0.4666667, 1,
1.467399, -0.9016486, -0.5954022, 1, 0, 0.4627451, 1,
1.467679, 1.173655, 2.259533, 1, 0, 0.454902, 1,
1.469993, -0.8280888, 1.981752, 1, 0, 0.4509804, 1,
1.472782, 0.8542644, 0.0753338, 1, 0, 0.4431373, 1,
1.502267, 2.367938, 3.065673, 1, 0, 0.4392157, 1,
1.511238, -0.04483049, 0.7744478, 1, 0, 0.4313726, 1,
1.516729, 0.862109, 1.482581, 1, 0, 0.427451, 1,
1.525337, -1.391547, 3.003496, 1, 0, 0.4196078, 1,
1.536362, 0.9299108, 1.915784, 1, 0, 0.4156863, 1,
1.540018, 0.8180425, -0.4376996, 1, 0, 0.4078431, 1,
1.548529, -1.738368, 2.661491, 1, 0, 0.4039216, 1,
1.575379, 0.8374398, 2.451838, 1, 0, 0.3960784, 1,
1.578791, 0.1242374, -0.4479711, 1, 0, 0.3882353, 1,
1.584887, -0.2083418, 1.394294, 1, 0, 0.3843137, 1,
1.590734, 0.3484981, 3.026753, 1, 0, 0.3764706, 1,
1.60175, 0.6266531, 1.47908, 1, 0, 0.372549, 1,
1.603555, 0.8816801, 2.033638, 1, 0, 0.3647059, 1,
1.607143, -1.21789, 3.507166, 1, 0, 0.3607843, 1,
1.611828, 0.9899746, 2.208257, 1, 0, 0.3529412, 1,
1.619488, 1.070106, 2.236954, 1, 0, 0.3490196, 1,
1.630427, 0.1239072, 1.016247, 1, 0, 0.3411765, 1,
1.648731, -0.4339246, 3.692374, 1, 0, 0.3372549, 1,
1.65823, -0.4089076, 4.288951, 1, 0, 0.3294118, 1,
1.661052, -2.657069, 2.260311, 1, 0, 0.3254902, 1,
1.662639, -1.224599, 2.447227, 1, 0, 0.3176471, 1,
1.671054, 0.4593988, 0.8049799, 1, 0, 0.3137255, 1,
1.686809, 0.006261374, 0.3416153, 1, 0, 0.3058824, 1,
1.70628, -1.974024, 3.588157, 1, 0, 0.2980392, 1,
1.708382, -1.609274, 1.731604, 1, 0, 0.2941177, 1,
1.716833, -0.7068447, 1.955041, 1, 0, 0.2862745, 1,
1.741059, -0.3072004, -0.1838168, 1, 0, 0.282353, 1,
1.742012, -0.3800558, 1.105599, 1, 0, 0.2745098, 1,
1.745205, -1.047633, 2.831039, 1, 0, 0.2705882, 1,
1.751004, -1.039607, 2.418907, 1, 0, 0.2627451, 1,
1.752979, -0.729158, 3.457071, 1, 0, 0.2588235, 1,
1.756037, -0.01516226, 1.683393, 1, 0, 0.2509804, 1,
1.756513, 0.5959889, 1.897022, 1, 0, 0.2470588, 1,
1.767818, -0.2155249, 1.812727, 1, 0, 0.2392157, 1,
1.774616, -0.5939271, 2.371144, 1, 0, 0.2352941, 1,
1.805747, -1.113069, 0.7902343, 1, 0, 0.227451, 1,
1.81175, -1.573988, 0.9649912, 1, 0, 0.2235294, 1,
1.814732, -0.3346873, 2.097297, 1, 0, 0.2156863, 1,
1.817214, -0.4536873, 3.134717, 1, 0, 0.2117647, 1,
1.833965, -0.005810204, 2.670667, 1, 0, 0.2039216, 1,
1.846636, -1.005083, 0.2454514, 1, 0, 0.1960784, 1,
1.847506, -1.041387, 4.943715, 1, 0, 0.1921569, 1,
1.868274, -0.885603, 2.168486, 1, 0, 0.1843137, 1,
1.868465, 0.1031689, 0.3124047, 1, 0, 0.1803922, 1,
1.890243, 1.150097, 0.2920549, 1, 0, 0.172549, 1,
1.900499, -0.7054962, 3.401514, 1, 0, 0.1686275, 1,
1.903943, -0.3867066, 2.071208, 1, 0, 0.1607843, 1,
1.904408, 0.2993262, 2.581311, 1, 0, 0.1568628, 1,
1.913465, 0.619048, 0.7047309, 1, 0, 0.1490196, 1,
1.932107, -0.5010152, 2.23005, 1, 0, 0.145098, 1,
1.953089, -2.212974, 3.061825, 1, 0, 0.1372549, 1,
1.970986, 0.5876645, 1.820158, 1, 0, 0.1333333, 1,
1.977724, -0.2619129, 0.6299268, 1, 0, 0.1254902, 1,
2.048656, -1.327324, 4.886612, 1, 0, 0.1215686, 1,
2.091112, 1.582273, 1.644097, 1, 0, 0.1137255, 1,
2.103557, -1.365894, 2.18109, 1, 0, 0.1098039, 1,
2.132599, -0.9426594, 0.8949994, 1, 0, 0.1019608, 1,
2.190006, -0.4824952, 2.086022, 1, 0, 0.09411765, 1,
2.195516, 1.948723, 0.5232744, 1, 0, 0.09019608, 1,
2.251884, 2.362189, 2.011873, 1, 0, 0.08235294, 1,
2.260046, -0.2645957, 3.274912, 1, 0, 0.07843138, 1,
2.294717, -1.654547, 1.412749, 1, 0, 0.07058824, 1,
2.310397, 0.5779638, 0.5544173, 1, 0, 0.06666667, 1,
2.337843, 0.5972293, 1.297298, 1, 0, 0.05882353, 1,
2.362653, -0.6606466, 2.392078, 1, 0, 0.05490196, 1,
2.377895, -0.05379076, 1.780577, 1, 0, 0.04705882, 1,
2.393989, -1.262244, 2.361449, 1, 0, 0.04313726, 1,
2.416785, -1.178076, 2.375171, 1, 0, 0.03529412, 1,
2.467865, 0.4715306, 1.512949, 1, 0, 0.03137255, 1,
2.617754, 1.98471, 1.766886, 1, 0, 0.02352941, 1,
2.692198, -0.4418786, 1.065299, 1, 0, 0.01960784, 1,
2.764613, -1.886205, 1.382614, 1, 0, 0.01176471, 1,
2.808999, 0.4158511, 0.8537018, 1, 0, 0.007843138, 1
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
-0.2069168, -4.023072, -6.624223, 0, -0.5, 0.5, 0.5,
-0.2069168, -4.023072, -6.624223, 1, -0.5, 0.5, 0.5,
-0.2069168, -4.023072, -6.624223, 1, 1.5, 0.5, 0.5,
-0.2069168, -4.023072, -6.624223, 0, 1.5, 0.5, 0.5
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
-4.245228, -0.001302838, -6.624223, 0, -0.5, 0.5, 0.5,
-4.245228, -0.001302838, -6.624223, 1, -0.5, 0.5, 0.5,
-4.245228, -0.001302838, -6.624223, 1, 1.5, 0.5, 0.5,
-4.245228, -0.001302838, -6.624223, 0, 1.5, 0.5, 0.5
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
-4.245228, -4.023072, 0.2655871, 0, -0.5, 0.5, 0.5,
-4.245228, -4.023072, 0.2655871, 1, -0.5, 0.5, 0.5,
-4.245228, -4.023072, 0.2655871, 1, 1.5, 0.5, 0.5,
-4.245228, -4.023072, 0.2655871, 0, 1.5, 0.5, 0.5
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
-3, -3.094972, -5.034266,
2, -3.094972, -5.034266,
-3, -3.094972, -5.034266,
-3, -3.249655, -5.299259,
-2, -3.094972, -5.034266,
-2, -3.249655, -5.299259,
-1, -3.094972, -5.034266,
-1, -3.249655, -5.299259,
0, -3.094972, -5.034266,
0, -3.249655, -5.299259,
1, -3.094972, -5.034266,
1, -3.249655, -5.299259,
2, -3.094972, -5.034266,
2, -3.249655, -5.299259
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
"2"
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
-3, -3.559022, -5.829245, 0, -0.5, 0.5, 0.5,
-3, -3.559022, -5.829245, 1, -0.5, 0.5, 0.5,
-3, -3.559022, -5.829245, 1, 1.5, 0.5, 0.5,
-3, -3.559022, -5.829245, 0, 1.5, 0.5, 0.5,
-2, -3.559022, -5.829245, 0, -0.5, 0.5, 0.5,
-2, -3.559022, -5.829245, 1, -0.5, 0.5, 0.5,
-2, -3.559022, -5.829245, 1, 1.5, 0.5, 0.5,
-2, -3.559022, -5.829245, 0, 1.5, 0.5, 0.5,
-1, -3.559022, -5.829245, 0, -0.5, 0.5, 0.5,
-1, -3.559022, -5.829245, 1, -0.5, 0.5, 0.5,
-1, -3.559022, -5.829245, 1, 1.5, 0.5, 0.5,
-1, -3.559022, -5.829245, 0, 1.5, 0.5, 0.5,
0, -3.559022, -5.829245, 0, -0.5, 0.5, 0.5,
0, -3.559022, -5.829245, 1, -0.5, 0.5, 0.5,
0, -3.559022, -5.829245, 1, 1.5, 0.5, 0.5,
0, -3.559022, -5.829245, 0, 1.5, 0.5, 0.5,
1, -3.559022, -5.829245, 0, -0.5, 0.5, 0.5,
1, -3.559022, -5.829245, 1, -0.5, 0.5, 0.5,
1, -3.559022, -5.829245, 1, 1.5, 0.5, 0.5,
1, -3.559022, -5.829245, 0, 1.5, 0.5, 0.5,
2, -3.559022, -5.829245, 0, -0.5, 0.5, 0.5,
2, -3.559022, -5.829245, 1, -0.5, 0.5, 0.5,
2, -3.559022, -5.829245, 1, 1.5, 0.5, 0.5,
2, -3.559022, -5.829245, 0, 1.5, 0.5, 0.5
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
-3.31331, -3, -5.034266,
-3.31331, 3, -5.034266,
-3.31331, -3, -5.034266,
-3.46863, -3, -5.299259,
-3.31331, -2, -5.034266,
-3.46863, -2, -5.299259,
-3.31331, -1, -5.034266,
-3.46863, -1, -5.299259,
-3.31331, 0, -5.034266,
-3.46863, 0, -5.299259,
-3.31331, 1, -5.034266,
-3.46863, 1, -5.299259,
-3.31331, 2, -5.034266,
-3.46863, 2, -5.299259,
-3.31331, 3, -5.034266,
-3.46863, 3, -5.299259
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
"-3",
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
-3.779269, -3, -5.829245, 0, -0.5, 0.5, 0.5,
-3.779269, -3, -5.829245, 1, -0.5, 0.5, 0.5,
-3.779269, -3, -5.829245, 1, 1.5, 0.5, 0.5,
-3.779269, -3, -5.829245, 0, 1.5, 0.5, 0.5,
-3.779269, -2, -5.829245, 0, -0.5, 0.5, 0.5,
-3.779269, -2, -5.829245, 1, -0.5, 0.5, 0.5,
-3.779269, -2, -5.829245, 1, 1.5, 0.5, 0.5,
-3.779269, -2, -5.829245, 0, 1.5, 0.5, 0.5,
-3.779269, -1, -5.829245, 0, -0.5, 0.5, 0.5,
-3.779269, -1, -5.829245, 1, -0.5, 0.5, 0.5,
-3.779269, -1, -5.829245, 1, 1.5, 0.5, 0.5,
-3.779269, -1, -5.829245, 0, 1.5, 0.5, 0.5,
-3.779269, 0, -5.829245, 0, -0.5, 0.5, 0.5,
-3.779269, 0, -5.829245, 1, -0.5, 0.5, 0.5,
-3.779269, 0, -5.829245, 1, 1.5, 0.5, 0.5,
-3.779269, 0, -5.829245, 0, 1.5, 0.5, 0.5,
-3.779269, 1, -5.829245, 0, -0.5, 0.5, 0.5,
-3.779269, 1, -5.829245, 1, -0.5, 0.5, 0.5,
-3.779269, 1, -5.829245, 1, 1.5, 0.5, 0.5,
-3.779269, 1, -5.829245, 0, 1.5, 0.5, 0.5,
-3.779269, 2, -5.829245, 0, -0.5, 0.5, 0.5,
-3.779269, 2, -5.829245, 1, -0.5, 0.5, 0.5,
-3.779269, 2, -5.829245, 1, 1.5, 0.5, 0.5,
-3.779269, 2, -5.829245, 0, 1.5, 0.5, 0.5,
-3.779269, 3, -5.829245, 0, -0.5, 0.5, 0.5,
-3.779269, 3, -5.829245, 1, -0.5, 0.5, 0.5,
-3.779269, 3, -5.829245, 1, 1.5, 0.5, 0.5,
-3.779269, 3, -5.829245, 0, 1.5, 0.5, 0.5
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
-3.31331, -3.094972, -4,
-3.31331, -3.094972, 4,
-3.31331, -3.094972, -4,
-3.46863, -3.249655, -4,
-3.31331, -3.094972, -2,
-3.46863, -3.249655, -2,
-3.31331, -3.094972, 0,
-3.46863, -3.249655, 0,
-3.31331, -3.094972, 2,
-3.46863, -3.249655, 2,
-3.31331, -3.094972, 4,
-3.46863, -3.249655, 4
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
-3.779269, -3.559022, -4, 0, -0.5, 0.5, 0.5,
-3.779269, -3.559022, -4, 1, -0.5, 0.5, 0.5,
-3.779269, -3.559022, -4, 1, 1.5, 0.5, 0.5,
-3.779269, -3.559022, -4, 0, 1.5, 0.5, 0.5,
-3.779269, -3.559022, -2, 0, -0.5, 0.5, 0.5,
-3.779269, -3.559022, -2, 1, -0.5, 0.5, 0.5,
-3.779269, -3.559022, -2, 1, 1.5, 0.5, 0.5,
-3.779269, -3.559022, -2, 0, 1.5, 0.5, 0.5,
-3.779269, -3.559022, 0, 0, -0.5, 0.5, 0.5,
-3.779269, -3.559022, 0, 1, -0.5, 0.5, 0.5,
-3.779269, -3.559022, 0, 1, 1.5, 0.5, 0.5,
-3.779269, -3.559022, 0, 0, 1.5, 0.5, 0.5,
-3.779269, -3.559022, 2, 0, -0.5, 0.5, 0.5,
-3.779269, -3.559022, 2, 1, -0.5, 0.5, 0.5,
-3.779269, -3.559022, 2, 1, 1.5, 0.5, 0.5,
-3.779269, -3.559022, 2, 0, 1.5, 0.5, 0.5,
-3.779269, -3.559022, 4, 0, -0.5, 0.5, 0.5,
-3.779269, -3.559022, 4, 1, -0.5, 0.5, 0.5,
-3.779269, -3.559022, 4, 1, 1.5, 0.5, 0.5,
-3.779269, -3.559022, 4, 0, 1.5, 0.5, 0.5
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
-3.31331, -3.094972, -5.034266,
-3.31331, 3.092366, -5.034266,
-3.31331, -3.094972, 5.565441,
-3.31331, 3.092366, 5.565441,
-3.31331, -3.094972, -5.034266,
-3.31331, -3.094972, 5.565441,
-3.31331, 3.092366, -5.034266,
-3.31331, 3.092366, 5.565441,
-3.31331, -3.094972, -5.034266,
2.899476, -3.094972, -5.034266,
-3.31331, -3.094972, 5.565441,
2.899476, -3.094972, 5.565441,
-3.31331, 3.092366, -5.034266,
2.899476, 3.092366, -5.034266,
-3.31331, 3.092366, 5.565441,
2.899476, 3.092366, 5.565441,
2.899476, -3.094972, -5.034266,
2.899476, 3.092366, -5.034266,
2.899476, -3.094972, 5.565441,
2.899476, 3.092366, 5.565441,
2.899476, -3.094972, -5.034266,
2.899476, -3.094972, 5.565441,
2.899476, 3.092366, -5.034266,
2.899476, 3.092366, 5.565441
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
var radius = 7.345595;
var distance = 32.68138;
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
mvMatrix.translate( 0.2069168, 0.001302838, -0.2655871 );
mvMatrix.scale( 1.278364, 1.283622, 0.7492849 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.68138);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
InChI_1_C3H10NO3P_c1<-read.table("InChI_1_C3H10NO3P_c1.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-InChI_1_C3H10NO3P_c1$V2
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1_C3H10NO3P_c1' not found
```

```r
y<-InChI_1_C3H10NO3P_c1$V3
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1_C3H10NO3P_c1' not found
```

```r
z<-InChI_1_C3H10NO3P_c1$V4
```

```
## Error in eval(expr, envir, enclos): object 'InChI_1_C3H10NO3P_c1' not found
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
-3.222832, -0.4977379, -1.51663, 0, 0, 1, 1, 1,
-2.874115, 0.7362806, -1.283258, 1, 0, 0, 1, 1,
-2.772358, 0.8178059, -2.902507, 1, 0, 0, 1, 1,
-2.75611, 0.5285108, -1.003962, 1, 0, 0, 1, 1,
-2.597878, -0.1208846, -1.825449, 1, 0, 0, 1, 1,
-2.574641, 0.8298904, -0.1055325, 1, 0, 0, 1, 1,
-2.519916, 1.313755, -1.659641, 0, 0, 0, 1, 1,
-2.507421, 0.1438686, -1.72095, 0, 0, 0, 1, 1,
-2.425268, -1.854544, -1.906872, 0, 0, 0, 1, 1,
-2.34105, -1.519362, -1.605883, 0, 0, 0, 1, 1,
-2.340906, 1.943156, -0.4701687, 0, 0, 0, 1, 1,
-2.303426, -0.7866701, -1.483129, 0, 0, 0, 1, 1,
-2.240037, 0.5282494, -1.297023, 0, 0, 0, 1, 1,
-2.147956, 0.675845, -1.723113, 1, 1, 1, 1, 1,
-2.097898, -0.5801684, -0.7740093, 1, 1, 1, 1, 1,
-2.09556, -1.720585, -2.881177, 1, 1, 1, 1, 1,
-2.088538, 0.2301187, -3.215122, 1, 1, 1, 1, 1,
-2.083569, 1.270692, -0.9889211, 1, 1, 1, 1, 1,
-2.071649, 0.2993276, -2.560987, 1, 1, 1, 1, 1,
-1.996997, -0.6995434, -2.302522, 1, 1, 1, 1, 1,
-1.958119, 0.3817635, -1.397253, 1, 1, 1, 1, 1,
-1.948196, 1.1451, -0.2097235, 1, 1, 1, 1, 1,
-1.923763, -0.05268335, -2.208734, 1, 1, 1, 1, 1,
-1.918878, 0.01919103, -0.3410126, 1, 1, 1, 1, 1,
-1.916685, -0.4031453, -1.63737, 1, 1, 1, 1, 1,
-1.914531, -1.21967, -2.440425, 1, 1, 1, 1, 1,
-1.908253, 0.1088962, -1.075116, 1, 1, 1, 1, 1,
-1.907726, 1.237208, -2.61816, 1, 1, 1, 1, 1,
-1.907104, -1.253806, -3.349912, 0, 0, 1, 1, 1,
-1.873231, -0.2378775, -0.7090768, 1, 0, 0, 1, 1,
-1.862256, 0.3786763, -0.7270129, 1, 0, 0, 1, 1,
-1.840737, 1.325963, -1.203863, 1, 0, 0, 1, 1,
-1.823115, 0.08274415, -1.448453, 1, 0, 0, 1, 1,
-1.801497, -2.32604, -2.519252, 1, 0, 0, 1, 1,
-1.788573, -1.128391, -2.110301, 0, 0, 0, 1, 1,
-1.784354, -1.18958, -3.787207, 0, 0, 0, 1, 1,
-1.778278, 1.15432, 0.08748241, 0, 0, 0, 1, 1,
-1.758152, 0.4613574, -1.771929, 0, 0, 0, 1, 1,
-1.748231, 0.1964523, -2.261988, 0, 0, 0, 1, 1,
-1.736968, 0.9227026, 0.6064088, 0, 0, 0, 1, 1,
-1.718184, -0.7443401, -2.980944, 0, 0, 0, 1, 1,
-1.713719, -0.777416, -1.906773, 1, 1, 1, 1, 1,
-1.702068, -0.1535595, -1.632386, 1, 1, 1, 1, 1,
-1.701613, 1.110687, 0.1361317, 1, 1, 1, 1, 1,
-1.701141, 2.818477, -0.2744989, 1, 1, 1, 1, 1,
-1.688749, -1.619048, -2.63233, 1, 1, 1, 1, 1,
-1.686821, 0.3566406, -0.668358, 1, 1, 1, 1, 1,
-1.681015, -0.4024336, -1.485773, 1, 1, 1, 1, 1,
-1.671296, 0.9121523, -0.2514589, 1, 1, 1, 1, 1,
-1.668032, 0.9826514, -0.8453195, 1, 1, 1, 1, 1,
-1.650418, 2.308723, -0.5380661, 1, 1, 1, 1, 1,
-1.64194, 1.199529, -1.339869, 1, 1, 1, 1, 1,
-1.640876, 0.5314389, -3.07457, 1, 1, 1, 1, 1,
-1.630526, 0.536185, 0.05787846, 1, 1, 1, 1, 1,
-1.630433, -0.08525201, -1.748944, 1, 1, 1, 1, 1,
-1.628924, 1.295968, -1.696126, 1, 1, 1, 1, 1,
-1.613924, 1.686046, -0.9110419, 0, 0, 1, 1, 1,
-1.592463, 0.8093622, -3.388873, 1, 0, 0, 1, 1,
-1.574913, -0.3484257, -0.4459899, 1, 0, 0, 1, 1,
-1.572812, 0.4454293, -0.2532873, 1, 0, 0, 1, 1,
-1.571789, 0.7982882, -2.708422, 1, 0, 0, 1, 1,
-1.55321, 0.8859019, -3.004817, 1, 0, 0, 1, 1,
-1.520586, 0.2337083, 0.2143115, 0, 0, 0, 1, 1,
-1.509131, 0.8839597, -1.626601, 0, 0, 0, 1, 1,
-1.508354, -0.4340309, -1.558328, 0, 0, 0, 1, 1,
-1.504565, -1.255474, -0.2085839, 0, 0, 0, 1, 1,
-1.502472, 0.3240888, -1.190308, 0, 0, 0, 1, 1,
-1.480957, 1.85127, -2.211483, 0, 0, 0, 1, 1,
-1.465842, 0.08937483, -1.729847, 0, 0, 0, 1, 1,
-1.465412, -0.1259138, -2.866166, 1, 1, 1, 1, 1,
-1.455916, 0.39413, -1.665864, 1, 1, 1, 1, 1,
-1.455618, 1.325393, 0.07128341, 1, 1, 1, 1, 1,
-1.454064, 1.90548, -0.5014778, 1, 1, 1, 1, 1,
-1.4417, 1.843667, -0.5063068, 1, 1, 1, 1, 1,
-1.441278, 0.3447918, -0.6356232, 1, 1, 1, 1, 1,
-1.441159, 0.5621944, -2.137276, 1, 1, 1, 1, 1,
-1.435279, -0.1672098, -0.6032947, 1, 1, 1, 1, 1,
-1.418528, -1.078001, -1.370292, 1, 1, 1, 1, 1,
-1.414781, 1.90375, -1.236622, 1, 1, 1, 1, 1,
-1.40828, -2.566222, -1.453543, 1, 1, 1, 1, 1,
-1.406242, -1.022811, -1.84698, 1, 1, 1, 1, 1,
-1.405349, 1.727151, 1.007681, 1, 1, 1, 1, 1,
-1.401916, 0.0187003, -1.783072, 1, 1, 1, 1, 1,
-1.400234, -0.6796733, -0.3071349, 1, 1, 1, 1, 1,
-1.399466, -0.5379667, -1.539668, 0, 0, 1, 1, 1,
-1.373248, 0.2158259, -1.337326, 1, 0, 0, 1, 1,
-1.365331, 0.8719968, -1.857732, 1, 0, 0, 1, 1,
-1.357192, -0.1528307, -3.07492, 1, 0, 0, 1, 1,
-1.354876, -1.640941, -1.68694, 1, 0, 0, 1, 1,
-1.348832, 0.5228451, -1.15325, 1, 0, 0, 1, 1,
-1.34323, 0.1175012, 0.3643427, 0, 0, 0, 1, 1,
-1.341243, 0.6097282, -2.789298, 0, 0, 0, 1, 1,
-1.338273, 0.2720608, -0.8587013, 0, 0, 0, 1, 1,
-1.335212, 1.590215, -1.724243, 0, 0, 0, 1, 1,
-1.335063, -0.5241248, -1.690839, 0, 0, 0, 1, 1,
-1.333531, 1.311262, -0.08847824, 0, 0, 0, 1, 1,
-1.314211, -0.5617526, -2.221985, 0, 0, 0, 1, 1,
-1.314023, -0.4523349, -2.157384, 1, 1, 1, 1, 1,
-1.301472, 0.4891783, -0.1537056, 1, 1, 1, 1, 1,
-1.300584, 1.11416, -0.08084331, 1, 1, 1, 1, 1,
-1.298014, -0.2635374, -2.496047, 1, 1, 1, 1, 1,
-1.281303, 1.365415, -1.270038, 1, 1, 1, 1, 1,
-1.281096, 1.611902, -1.710943, 1, 1, 1, 1, 1,
-1.278133, 0.1747667, -0.6150916, 1, 1, 1, 1, 1,
-1.266407, -1.084301, -3.281736, 1, 1, 1, 1, 1,
-1.257879, 2.020935, -0.4806231, 1, 1, 1, 1, 1,
-1.257318, 0.7943422, -1.202297, 1, 1, 1, 1, 1,
-1.256675, 1.428433, -1.641679, 1, 1, 1, 1, 1,
-1.246453, 0.2723396, -0.6255908, 1, 1, 1, 1, 1,
-1.24643, 0.6598145, -2.16571, 1, 1, 1, 1, 1,
-1.2401, -1.504035, -4.154952, 1, 1, 1, 1, 1,
-1.234643, 2.530348, 0.4267405, 1, 1, 1, 1, 1,
-1.233789, -0.9700482, -4.879902, 0, 0, 1, 1, 1,
-1.227049, -0.6686406, -2.87938, 1, 0, 0, 1, 1,
-1.224707, 0.2805857, -1.164629, 1, 0, 0, 1, 1,
-1.221194, 0.5646432, -0.451768, 1, 0, 0, 1, 1,
-1.220465, 0.6642991, -2.14725, 1, 0, 0, 1, 1,
-1.214964, -0.9024675, -2.650385, 1, 0, 0, 1, 1,
-1.21142, -1.039576, -2.153011, 0, 0, 0, 1, 1,
-1.210301, 0.7380114, -0.4048067, 0, 0, 0, 1, 1,
-1.210114, 0.6419684, -1.817716, 0, 0, 0, 1, 1,
-1.207395, -0.7011085, -2.971444, 0, 0, 0, 1, 1,
-1.206359, -1.986197, -3.709663, 0, 0, 0, 1, 1,
-1.201164, -0.1223058, -2.264696, 0, 0, 0, 1, 1,
-1.190543, 1.15703, 1.606041, 0, 0, 0, 1, 1,
-1.188076, 0.1182602, 0.0163945, 1, 1, 1, 1, 1,
-1.187253, 0.06401701, -1.265734, 1, 1, 1, 1, 1,
-1.179959, -0.3549545, -3.308987, 1, 1, 1, 1, 1,
-1.174507, 0.370207, -1.91163, 1, 1, 1, 1, 1,
-1.157612, -0.5597131, -2.391355, 1, 1, 1, 1, 1,
-1.156609, 0.1367372, -3.677652, 1, 1, 1, 1, 1,
-1.152688, 0.7374708, 0.2867422, 1, 1, 1, 1, 1,
-1.149301, 0.5538893, -2.439783, 1, 1, 1, 1, 1,
-1.149, 1.299496, -3.167844, 1, 1, 1, 1, 1,
-1.145508, 0.4420314, -2.324272, 1, 1, 1, 1, 1,
-1.144995, -0.4511846, -2.053053, 1, 1, 1, 1, 1,
-1.135627, -0.7795055, -3.037603, 1, 1, 1, 1, 1,
-1.132011, -2.372084, -2.797816, 1, 1, 1, 1, 1,
-1.122999, -0.9226722, -2.676844, 1, 1, 1, 1, 1,
-1.120674, -0.6086472, -4.043554, 1, 1, 1, 1, 1,
-1.116111, -2.102555, -2.664099, 0, 0, 1, 1, 1,
-1.112901, -0.4758514, -1.32905, 1, 0, 0, 1, 1,
-1.095408, -0.588698, -2.746832, 1, 0, 0, 1, 1,
-1.092816, 0.06703663, -0.6067255, 1, 0, 0, 1, 1,
-1.088963, 0.866741, -1.219952, 1, 0, 0, 1, 1,
-1.081847, 0.1345923, -0.7098167, 1, 0, 0, 1, 1,
-1.077449, -1.716101, -0.5277689, 0, 0, 0, 1, 1,
-1.076598, -1.437903, -3.045382, 0, 0, 0, 1, 1,
-1.075782, -0.9906751, -3.179119, 0, 0, 0, 1, 1,
-1.07195, -0.5696828, -3.686703, 0, 0, 0, 1, 1,
-1.068222, 0.4906125, -2.024217, 0, 0, 0, 1, 1,
-1.063979, 0.06375728, -2.206869, 0, 0, 0, 1, 1,
-1.059627, -0.5003088, -1.639883, 0, 0, 0, 1, 1,
-1.058663, 1.368496, -0.8853484, 1, 1, 1, 1, 1,
-1.05175, -0.8911124, -2.017172, 1, 1, 1, 1, 1,
-1.050983, 0.1213206, -0.5813132, 1, 1, 1, 1, 1,
-1.049915, 1.728864, -1.257783, 1, 1, 1, 1, 1,
-1.046147, -0.06974318, -3.446598, 1, 1, 1, 1, 1,
-1.029242, 1.180285, 0.3835427, 1, 1, 1, 1, 1,
-1.023329, -1.000448, -1.649624, 1, 1, 1, 1, 1,
-1.022838, 1.300854, -2.815661, 1, 1, 1, 1, 1,
-1.019405, -0.3532628, -1.784398, 1, 1, 1, 1, 1,
-1.018989, 1.166186, -0.3240241, 1, 1, 1, 1, 1,
-1.015229, 0.3921874, -2.970732, 1, 1, 1, 1, 1,
-1.014938, -0.3472035, -2.587194, 1, 1, 1, 1, 1,
-1.008268, -1.118528, -0.2134919, 1, 1, 1, 1, 1,
-1.005901, -0.6240454, -0.7629355, 1, 1, 1, 1, 1,
-1.005121, -0.4621745, -2.578342, 1, 1, 1, 1, 1,
-0.9953386, -0.8884137, -2.721053, 0, 0, 1, 1, 1,
-0.9946303, -0.7455239, -2.81092, 1, 0, 0, 1, 1,
-0.9817562, 0.5280086, -0.5322761, 1, 0, 0, 1, 1,
-0.9661128, -0.8971635, -1.967057, 1, 0, 0, 1, 1,
-0.9659835, -0.2810488, -3.341629, 1, 0, 0, 1, 1,
-0.9601123, -0.8918986, -2.304454, 1, 0, 0, 1, 1,
-0.95838, 0.2277944, 0.7706074, 0, 0, 0, 1, 1,
-0.9582562, 0.02805428, -1.80515, 0, 0, 0, 1, 1,
-0.9473341, 1.248576, 0.6651582, 0, 0, 0, 1, 1,
-0.9440948, -0.4516262, -1.844505, 0, 0, 0, 1, 1,
-0.9361305, 0.8492219, -0.8906803, 0, 0, 0, 1, 1,
-0.9199165, -1.618449, -1.333418, 0, 0, 0, 1, 1,
-0.90999, -0.06201402, -0.5050583, 0, 0, 0, 1, 1,
-0.8986829, 1.979601, 0.275856, 1, 1, 1, 1, 1,
-0.8976724, 0.5907474, -0.6956358, 1, 1, 1, 1, 1,
-0.8946682, 0.7472397, 0.8467967, 1, 1, 1, 1, 1,
-0.8941133, 0.1989046, -1.351003, 1, 1, 1, 1, 1,
-0.8932841, -0.7010965, -1.44165, 1, 1, 1, 1, 1,
-0.8795691, 2.197071, 0.452868, 1, 1, 1, 1, 1,
-0.8727788, -1.399168, -4.052045, 1, 1, 1, 1, 1,
-0.8627641, -0.2174208, -1.913184, 1, 1, 1, 1, 1,
-0.8599541, -1.002308, -1.016598, 1, 1, 1, 1, 1,
-0.8517478, 0.3790693, -1.687539, 1, 1, 1, 1, 1,
-0.8468836, 0.3165352, -1.226016, 1, 1, 1, 1, 1,
-0.8467969, -0.5360821, -3.16651, 1, 1, 1, 1, 1,
-0.8396497, -1.509652, -1.929749, 1, 1, 1, 1, 1,
-0.8332143, -0.8079417, -1.320379, 1, 1, 1, 1, 1,
-0.828682, 1.038887, -1.611585, 1, 1, 1, 1, 1,
-0.8235075, -1.067019, -1.995719, 0, 0, 1, 1, 1,
-0.8186095, -1.578354, -2.134089, 1, 0, 0, 1, 1,
-0.8175648, -0.6129814, -1.472099, 1, 0, 0, 1, 1,
-0.813111, -0.303458, -2.144957, 1, 0, 0, 1, 1,
-0.8097908, 1.969123, 0.5613655, 1, 0, 0, 1, 1,
-0.8000638, -0.1513849, -1.028751, 1, 0, 0, 1, 1,
-0.7995744, 0.315013, -2.413961, 0, 0, 0, 1, 1,
-0.7982449, 0.8395628, -1.999076, 0, 0, 0, 1, 1,
-0.7977593, -0.6820267, -1.963647, 0, 0, 0, 1, 1,
-0.7925034, -1.193819, -4.167392, 0, 0, 0, 1, 1,
-0.7917359, -1.415235, -1.979099, 0, 0, 0, 1, 1,
-0.7900162, -1.822326, -1.973554, 0, 0, 0, 1, 1,
-0.789272, -0.4405605, 0.5148739, 0, 0, 0, 1, 1,
-0.7832807, 0.3533024, -1.861817, 1, 1, 1, 1, 1,
-0.7823053, -0.5963467, -3.502743, 1, 1, 1, 1, 1,
-0.7784863, 0.6972383, -0.648065, 1, 1, 1, 1, 1,
-0.7725877, -0.9428232, -4.078722, 1, 1, 1, 1, 1,
-0.7686466, 0.2562177, -1.010941, 1, 1, 1, 1, 1,
-0.7680557, 0.06885567, 0.05164767, 1, 1, 1, 1, 1,
-0.7668877, 1.352757, -0.8815637, 1, 1, 1, 1, 1,
-0.762835, 1.398039, -3.228066, 1, 1, 1, 1, 1,
-0.7612555, 0.5436083, -0.2918143, 1, 1, 1, 1, 1,
-0.7573469, 0.7225953, -1.564095, 1, 1, 1, 1, 1,
-0.7484583, 0.5092703, -2.273175, 1, 1, 1, 1, 1,
-0.7446933, 0.845525, 0.335741, 1, 1, 1, 1, 1,
-0.7423088, -0.2113927, -1.915282, 1, 1, 1, 1, 1,
-0.7382421, 0.1122903, -1.263594, 1, 1, 1, 1, 1,
-0.7376985, -0.2867635, -2.92606, 1, 1, 1, 1, 1,
-0.7275884, 1.327565, 0.5362035, 0, 0, 1, 1, 1,
-0.7264468, 1.937379, -0.4006899, 1, 0, 0, 1, 1,
-0.7251202, -0.3289849, -2.539999, 1, 0, 0, 1, 1,
-0.7242689, -1.28913, -1.523675, 1, 0, 0, 1, 1,
-0.7233043, 0.2490819, -0.6373599, 1, 0, 0, 1, 1,
-0.7229265, 0.7200983, -1.5198, 1, 0, 0, 1, 1,
-0.7147232, 0.4127049, 0.9030895, 0, 0, 0, 1, 1,
-0.7144639, 1.604218, -1.491484, 0, 0, 0, 1, 1,
-0.7106104, 1.77306, -0.4086995, 0, 0, 0, 1, 1,
-0.7078128, -1.123286, -1.215377, 0, 0, 0, 1, 1,
-0.7023667, -1.421482, -3.773396, 0, 0, 0, 1, 1,
-0.700573, -2.13773, -1.750757, 0, 0, 0, 1, 1,
-0.698638, 0.7775478, -0.7970055, 0, 0, 0, 1, 1,
-0.6969671, 0.7827325, 0.1008634, 1, 1, 1, 1, 1,
-0.6941895, 0.9482538, -0.4508889, 1, 1, 1, 1, 1,
-0.6927286, -0.4398648, -2.869637, 1, 1, 1, 1, 1,
-0.6895537, 0.2512938, -2.285996, 1, 1, 1, 1, 1,
-0.6894519, 1.374918, -0.3096615, 1, 1, 1, 1, 1,
-0.6892577, -0.3651681, -1.846428, 1, 1, 1, 1, 1,
-0.686327, -0.4565515, -1.509442, 1, 1, 1, 1, 1,
-0.682659, 1.128874, 1.164039, 1, 1, 1, 1, 1,
-0.6823536, 3.002259, -1.728761, 1, 1, 1, 1, 1,
-0.6819288, 0.6691487, -1.570311, 1, 1, 1, 1, 1,
-0.6813514, -1.081003, -2.567597, 1, 1, 1, 1, 1,
-0.6799306, 0.7446845, -0.0497842, 1, 1, 1, 1, 1,
-0.6715725, 0.6091678, -1.533724, 1, 1, 1, 1, 1,
-0.6686926, 1.484545, 0.4981138, 1, 1, 1, 1, 1,
-0.6676806, 0.5950965, -1.356483, 1, 1, 1, 1, 1,
-0.6673513, -1.543251, -2.593403, 0, 0, 1, 1, 1,
-0.6673132, -0.9733374, -1.764776, 1, 0, 0, 1, 1,
-0.66469, -1.98576, -4.30033, 1, 0, 0, 1, 1,
-0.6639791, -0.216453, -2.062612, 1, 0, 0, 1, 1,
-0.6617542, -0.8330936, -0.5293115, 1, 0, 0, 1, 1,
-0.6593265, 0.4431994, -0.04998928, 1, 0, 0, 1, 1,
-0.6591686, 0.05251974, -1.444154, 0, 0, 0, 1, 1,
-0.6565188, 0.8202532, 0.4577354, 0, 0, 0, 1, 1,
-0.6562136, -1.067871, -2.654801, 0, 0, 0, 1, 1,
-0.6533651, 0.08575881, -1.902243, 0, 0, 0, 1, 1,
-0.6530473, 0.6804683, -0.8957765, 0, 0, 0, 1, 1,
-0.6521047, 0.5936789, -0.8342055, 0, 0, 0, 1, 1,
-0.6455648, -0.7040594, -2.003937, 0, 0, 0, 1, 1,
-0.6444978, 0.02111177, -1.338544, 1, 1, 1, 1, 1,
-0.6429192, 0.3202321, -1.555193, 1, 1, 1, 1, 1,
-0.6420005, -0.05123197, -1.933233, 1, 1, 1, 1, 1,
-0.6402128, -0.3817027, -1.25707, 1, 1, 1, 1, 1,
-0.6399022, -0.1902517, 0.4452681, 1, 1, 1, 1, 1,
-0.6355318, 0.3260383, -1.908809, 1, 1, 1, 1, 1,
-0.6301616, -2.147771, -1.745349, 1, 1, 1, 1, 1,
-0.6297085, -0.433253, -0.2838955, 1, 1, 1, 1, 1,
-0.6263946, 0.77795, -0.3599346, 1, 1, 1, 1, 1,
-0.6202618, -0.1923929, -1.077051, 1, 1, 1, 1, 1,
-0.615824, 0.4304195, -2.998611, 1, 1, 1, 1, 1,
-0.6089212, 1.695616, -0.4482609, 1, 1, 1, 1, 1,
-0.5963126, 0.9736913, -0.7856892, 1, 1, 1, 1, 1,
-0.5947424, 0.5312089, -0.6729672, 1, 1, 1, 1, 1,
-0.5940348, 0.107715, -0.5711487, 1, 1, 1, 1, 1,
-0.5924873, 0.2649553, -0.1292919, 0, 0, 1, 1, 1,
-0.5903158, -0.1224842, -1.948523, 1, 0, 0, 1, 1,
-0.5828699, 0.1439614, -0.514075, 1, 0, 0, 1, 1,
-0.581232, 0.09696724, 0.4238288, 1, 0, 0, 1, 1,
-0.5766004, 1.074825, -1.868454, 1, 0, 0, 1, 1,
-0.5757424, -0.03452588, -0.3103182, 1, 0, 0, 1, 1,
-0.5747691, 1.08117, -0.9305159, 0, 0, 0, 1, 1,
-0.5720549, 0.7057588, -2.326711, 0, 0, 0, 1, 1,
-0.5712816, -0.5957884, -2.198501, 0, 0, 0, 1, 1,
-0.568436, 1.853434, -0.2465904, 0, 0, 0, 1, 1,
-0.56823, -0.7063676, -1.759282, 0, 0, 0, 1, 1,
-0.5618947, 1.020289, 0.1773735, 0, 0, 0, 1, 1,
-0.5521338, -0.02741864, -0.1022999, 0, 0, 0, 1, 1,
-0.5519761, -0.910741, -4.554415, 1, 1, 1, 1, 1,
-0.550902, 0.5706251, -0.2153896, 1, 1, 1, 1, 1,
-0.5498738, 1.0937, 1.156673, 1, 1, 1, 1, 1,
-0.5478176, 0.2969618, -1.088732, 1, 1, 1, 1, 1,
-0.5478171, 1.353979, 0.4477012, 1, 1, 1, 1, 1,
-0.5452231, 2.234501, -1.272688, 1, 1, 1, 1, 1,
-0.5421166, 0.2983444, -1.011063, 1, 1, 1, 1, 1,
-0.5398628, 1.69522, 0.4527135, 1, 1, 1, 1, 1,
-0.5355197, 1.680196, 0.110866, 1, 1, 1, 1, 1,
-0.5346141, -0.01422145, -2.453235, 1, 1, 1, 1, 1,
-0.5318503, -0.2980361, -0.7895206, 1, 1, 1, 1, 1,
-0.5229926, -0.9831248, -3.998538, 1, 1, 1, 1, 1,
-0.5216911, 0.507946, -0.0916779, 1, 1, 1, 1, 1,
-0.5214518, 0.01153083, -0.3919722, 1, 1, 1, 1, 1,
-0.5137557, 1.54026, -0.9232321, 1, 1, 1, 1, 1,
-0.5076694, -0.3611035, -2.404083, 0, 0, 1, 1, 1,
-0.507093, 0.8021466, -0.8071089, 1, 0, 0, 1, 1,
-0.506352, 0.5571641, -1.860218, 1, 0, 0, 1, 1,
-0.5063132, -0.1898908, -1.692408, 1, 0, 0, 1, 1,
-0.5060599, -0.08363395, -0.8071043, 1, 0, 0, 1, 1,
-0.5038298, -0.8583646, -2.870356, 1, 0, 0, 1, 1,
-0.4994377, -0.7282795, -3.961213, 0, 0, 0, 1, 1,
-0.4981053, 0.2623198, -1.127977, 0, 0, 0, 1, 1,
-0.4976057, 1.032136, -0.492685, 0, 0, 0, 1, 1,
-0.4928752, 0.6714245, 0.2967941, 0, 0, 0, 1, 1,
-0.4922947, -1.152735, -3.411772, 0, 0, 0, 1, 1,
-0.4897778, 1.519429, 1.231106, 0, 0, 0, 1, 1,
-0.4882414, 1.121722, 0.01226037, 0, 0, 0, 1, 1,
-0.4828045, -0.2612421, -3.802295, 1, 1, 1, 1, 1,
-0.4783141, 1.263899, -0.5897699, 1, 1, 1, 1, 1,
-0.4751888, 0.7775179, -2.294124, 1, 1, 1, 1, 1,
-0.4727225, 1.230168, -0.271717, 1, 1, 1, 1, 1,
-0.4707781, -0.4209371, -3.25168, 1, 1, 1, 1, 1,
-0.4681558, -1.948678, -1.26441, 1, 1, 1, 1, 1,
-0.4669502, 0.3265463, 0.1618007, 1, 1, 1, 1, 1,
-0.4657933, -0.1880064, -2.823608, 1, 1, 1, 1, 1,
-0.4634439, 1.200423, -0.0982423, 1, 1, 1, 1, 1,
-0.4631864, 1.003986, 0.04071257, 1, 1, 1, 1, 1,
-0.4631523, -0.3522557, -1.63608, 1, 1, 1, 1, 1,
-0.4555441, 0.6088749, -0.5610622, 1, 1, 1, 1, 1,
-0.4547415, -1.370754, -1.446224, 1, 1, 1, 1, 1,
-0.4543957, 0.2359627, -0.8085425, 1, 1, 1, 1, 1,
-0.4538895, 0.7589015, -2.044257, 1, 1, 1, 1, 1,
-0.4529389, 0.7209386, 0.8830861, 0, 0, 1, 1, 1,
-0.4498166, 0.01305038, -2.514141, 1, 0, 0, 1, 1,
-0.4483739, -1.193818, -2.391266, 1, 0, 0, 1, 1,
-0.4479035, 2.962951, 0.2361121, 1, 0, 0, 1, 1,
-0.4429195, -0.7829693, -3.91612, 1, 0, 0, 1, 1,
-0.4414766, -1.049645, -4.365188, 1, 0, 0, 1, 1,
-0.4389433, -0.2188622, -1.072905, 0, 0, 0, 1, 1,
-0.4362737, 0.8787709, 1.425553, 0, 0, 0, 1, 1,
-0.4335473, 0.268041, -1.18664, 0, 0, 0, 1, 1,
-0.4320471, 2.4338, -1.027617, 0, 0, 0, 1, 1,
-0.4281555, 2.669898, 0.03773525, 0, 0, 0, 1, 1,
-0.4276417, -0.2162103, -2.654618, 0, 0, 0, 1, 1,
-0.4247362, 0.321688, -3.580644, 0, 0, 0, 1, 1,
-0.4177718, 0.468171, -0.5303242, 1, 1, 1, 1, 1,
-0.4136982, 0.2309973, -3.401762, 1, 1, 1, 1, 1,
-0.4122077, 0.6155378, 0.2065527, 1, 1, 1, 1, 1,
-0.4090031, 1.797626, -0.1763119, 1, 1, 1, 1, 1,
-0.4055501, 0.3619123, -1.532181, 1, 1, 1, 1, 1,
-0.4003877, 0.6480936, -0.7574902, 1, 1, 1, 1, 1,
-0.3998047, -0.243829, -2.459929, 1, 1, 1, 1, 1,
-0.3977407, 1.626124, -1.420425, 1, 1, 1, 1, 1,
-0.3966848, -0.1317224, -2.735843, 1, 1, 1, 1, 1,
-0.3924992, -0.4869463, -1.339181, 1, 1, 1, 1, 1,
-0.3900815, -0.06156927, -0.1541876, 1, 1, 1, 1, 1,
-0.3898891, 0.362327, 0.01444631, 1, 1, 1, 1, 1,
-0.3884137, 0.02818323, -0.9971975, 1, 1, 1, 1, 1,
-0.3875965, -0.8679862, -2.121575, 1, 1, 1, 1, 1,
-0.3857757, 0.1094186, -1.3819, 1, 1, 1, 1, 1,
-0.3831077, 2.138036, -1.457932, 0, 0, 1, 1, 1,
-0.3812997, 0.09558503, -1.18771, 1, 0, 0, 1, 1,
-0.3777351, -0.8965152, -3.205211, 1, 0, 0, 1, 1,
-0.37542, 2.094804, -0.9967294, 1, 0, 0, 1, 1,
-0.3741087, 1.451676, 0.002750857, 1, 0, 0, 1, 1,
-0.3736168, 0.09570578, -0.3090169, 1, 0, 0, 1, 1,
-0.3714125, -0.9930348, -4.015272, 0, 0, 0, 1, 1,
-0.3677253, 1.287491, -0.7992373, 0, 0, 0, 1, 1,
-0.3670952, -0.6190796, -0.8885591, 0, 0, 0, 1, 1,
-0.3655433, 0.6780955, -1.196827, 0, 0, 0, 1, 1,
-0.363858, -0.1746859, -1.255753, 0, 0, 0, 1, 1,
-0.3602155, -0.483285, -2.187954, 0, 0, 0, 1, 1,
-0.3571852, -1.006008, -3.335549, 0, 0, 0, 1, 1,
-0.3535333, 0.2576194, -1.241482, 1, 1, 1, 1, 1,
-0.3505336, -0.1491965, -0.931876, 1, 1, 1, 1, 1,
-0.349297, -2.533349, -3.845243, 1, 1, 1, 1, 1,
-0.3440438, 0.03134571, -1.826623, 1, 1, 1, 1, 1,
-0.3377764, -0.1884388, -2.559994, 1, 1, 1, 1, 1,
-0.3366235, 1.684724, -0.5546642, 1, 1, 1, 1, 1,
-0.3351524, -0.2402035, -2.24038, 1, 1, 1, 1, 1,
-0.3340688, -0.3320535, -3.154668, 1, 1, 1, 1, 1,
-0.331471, 1.014113, -0.09265775, 1, 1, 1, 1, 1,
-0.3309756, 0.7775959, -1.417355, 1, 1, 1, 1, 1,
-0.323441, -1.38345, -2.402116, 1, 1, 1, 1, 1,
-0.3178168, 2.167408, -1.034314, 1, 1, 1, 1, 1,
-0.3146051, -1.422549, -4.131656, 1, 1, 1, 1, 1,
-0.3138552, 0.01669892, -1.075503, 1, 1, 1, 1, 1,
-0.3128281, -0.8363504, -2.104635, 1, 1, 1, 1, 1,
-0.3112427, -1.562631, -2.718541, 0, 0, 1, 1, 1,
-0.3106555, 1.257991, 0.639297, 1, 0, 0, 1, 1,
-0.3095627, -0.3137611, -0.4146127, 1, 0, 0, 1, 1,
-0.3062751, -0.6999431, -2.829945, 1, 0, 0, 1, 1,
-0.3039737, 0.08084393, -3.284906, 1, 0, 0, 1, 1,
-0.2984065, 1.030624, -1.764801, 1, 0, 0, 1, 1,
-0.2886092, 0.7143739, 0.2611025, 0, 0, 0, 1, 1,
-0.2872456, 0.9664621, -1.485353, 0, 0, 0, 1, 1,
-0.2835206, -1.797783, -2.532694, 0, 0, 0, 1, 1,
-0.2809899, -0.5274189, -4.530969, 0, 0, 0, 1, 1,
-0.2803796, 0.3821013, 0.7032056, 0, 0, 0, 1, 1,
-0.2664393, 0.3800667, 0.3319238, 0, 0, 0, 1, 1,
-0.2641064, 0.2399223, -1.49071, 0, 0, 0, 1, 1,
-0.263316, -1.826993, -3.05878, 1, 1, 1, 1, 1,
-0.2598036, 1.719946, -0.9463215, 1, 1, 1, 1, 1,
-0.2590147, -1.356031, -2.246274, 1, 1, 1, 1, 1,
-0.2579032, -1.29273, -3.097806, 1, 1, 1, 1, 1,
-0.2551804, -0.04136904, -1.934248, 1, 1, 1, 1, 1,
-0.2516174, -1.18194, -4.177496, 1, 1, 1, 1, 1,
-0.2503771, -0.3628947, -2.536692, 1, 1, 1, 1, 1,
-0.2472399, -2.050168, -2.493334, 1, 1, 1, 1, 1,
-0.2456426, -1.15572, -2.041717, 1, 1, 1, 1, 1,
-0.244666, -1.615488, -3.193607, 1, 1, 1, 1, 1,
-0.2374364, -0.3259549, -2.768298, 1, 1, 1, 1, 1,
-0.2361202, 0.2870702, -0.6252811, 1, 1, 1, 1, 1,
-0.2322698, 2.021109, -0.601697, 1, 1, 1, 1, 1,
-0.2309277, 1.714158, -0.4327704, 1, 1, 1, 1, 1,
-0.2228778, 0.8988167, -0.3238268, 1, 1, 1, 1, 1,
-0.2203374, 0.8808949, -0.8930146, 0, 0, 1, 1, 1,
-0.2199411, 1.863929, 1.324457, 1, 0, 0, 1, 1,
-0.2175758, 1.406633, -0.01962275, 1, 0, 0, 1, 1,
-0.2103471, -0.9030148, -3.318008, 1, 0, 0, 1, 1,
-0.2094747, -0.5969747, -2.603993, 1, 0, 0, 1, 1,
-0.2045528, -1.911762, -3.149208, 1, 0, 0, 1, 1,
-0.2000566, -0.6202736, -4.590685, 0, 0, 0, 1, 1,
-0.1989562, 0.6880621, -0.7183043, 0, 0, 0, 1, 1,
-0.1980443, 0.5583699, -0.9529663, 0, 0, 0, 1, 1,
-0.1888771, 0.7520453, -0.3460957, 0, 0, 0, 1, 1,
-0.1880024, -1.457983, -2.607398, 0, 0, 0, 1, 1,
-0.1849114, 1.409348, -0.2943107, 0, 0, 0, 1, 1,
-0.1847956, 2.798955, -0.1804005, 0, 0, 0, 1, 1,
-0.1837818, 1.303309, -0.6413328, 1, 1, 1, 1, 1,
-0.1822203, 0.007243615, -1.713946, 1, 1, 1, 1, 1,
-0.1785749, 0.4793254, -1.67758, 1, 1, 1, 1, 1,
-0.1780542, -0.3589777, -3.89799, 1, 1, 1, 1, 1,
-0.1719442, -0.4182464, -2.1524, 1, 1, 1, 1, 1,
-0.1713783, 0.5819188, 0.6596476, 1, 1, 1, 1, 1,
-0.1627828, 0.03812643, -1.924354, 1, 1, 1, 1, 1,
-0.1608506, 0.6202136, -0.167911, 1, 1, 1, 1, 1,
-0.1576954, 0.8928985, -0.2997037, 1, 1, 1, 1, 1,
-0.1567183, -0.5819195, -3.277378, 1, 1, 1, 1, 1,
-0.1566482, -0.3483918, -3.447417, 1, 1, 1, 1, 1,
-0.1544016, 0.5086024, 0.4818791, 1, 1, 1, 1, 1,
-0.1523321, -0.182204, -2.140952, 1, 1, 1, 1, 1,
-0.1509636, 2.126482, 0.1751081, 1, 1, 1, 1, 1,
-0.1501169, 1.122276, 0.2147144, 1, 1, 1, 1, 1,
-0.1492582, 1.062666, -1.384316, 0, 0, 1, 1, 1,
-0.1481862, -0.6322384, -1.139891, 1, 0, 0, 1, 1,
-0.146077, -0.3744636, -2.239308, 1, 0, 0, 1, 1,
-0.1447882, 0.304913, -0.5556493, 1, 0, 0, 1, 1,
-0.1435724, 0.53805, 0.1041693, 1, 0, 0, 1, 1,
-0.1364669, -0.6048549, -1.380814, 1, 0, 0, 1, 1,
-0.1341831, -1.045474, -2.849716, 0, 0, 0, 1, 1,
-0.1321897, -0.1107242, -0.05758172, 0, 0, 0, 1, 1,
-0.1290896, -1.435242, -2.605949, 0, 0, 0, 1, 1,
-0.1282173, -0.3739945, -2.880203, 0, 0, 0, 1, 1,
-0.1217629, 1.768694, 1.641232, 0, 0, 0, 1, 1,
-0.1183412, 0.4215836, -0.4331377, 0, 0, 0, 1, 1,
-0.1149972, -1.290844, -2.62181, 0, 0, 0, 1, 1,
-0.1127678, 1.859321, -0.2235562, 1, 1, 1, 1, 1,
-0.1116403, 1.794053, -0.2044514, 1, 1, 1, 1, 1,
-0.1102825, 0.9430869, -0.5723431, 1, 1, 1, 1, 1,
-0.1100377, 1.28551, 0.5888803, 1, 1, 1, 1, 1,
-0.1073937, -1.778125, -3.424481, 1, 1, 1, 1, 1,
-0.1068342, -0.4642481, -3.538352, 1, 1, 1, 1, 1,
-0.1055904, -1.478587, -1.797148, 1, 1, 1, 1, 1,
-0.1049456, 0.1342641, -0.8024585, 1, 1, 1, 1, 1,
-0.1046915, 0.05950557, -0.3186882, 1, 1, 1, 1, 1,
-0.09836276, 0.1354339, -1.059518, 1, 1, 1, 1, 1,
-0.09639096, 0.898542, -0.02336035, 1, 1, 1, 1, 1,
-0.09086383, -0.6509455, -3.431396, 1, 1, 1, 1, 1,
-0.08602043, -0.818353, -2.542855, 1, 1, 1, 1, 1,
-0.08017125, 0.9716898, 0.1725924, 1, 1, 1, 1, 1,
-0.07894072, 0.2167663, -1.548612, 1, 1, 1, 1, 1,
-0.07101744, 1.789991, -0.6661855, 0, 0, 1, 1, 1,
-0.06996416, -0.2477621, -2.471547, 1, 0, 0, 1, 1,
-0.06757762, -0.3812285, -2.887535, 1, 0, 0, 1, 1,
-0.06499385, -1.263191, -3.584346, 1, 0, 0, 1, 1,
-0.06300272, -0.09496445, -1.38794, 1, 0, 0, 1, 1,
-0.05984373, 0.1445901, 1.614298, 1, 0, 0, 1, 1,
-0.05941214, -0.634666, -1.903929, 0, 0, 0, 1, 1,
-0.05767453, 0.1211927, -0.1846972, 0, 0, 0, 1, 1,
-0.05761009, -1.548215, -2.681634, 0, 0, 0, 1, 1,
-0.0568324, 0.2093033, 0.792066, 0, 0, 0, 1, 1,
-0.05476716, -0.13906, -4.666405, 0, 0, 0, 1, 1,
-0.05382649, -0.07982899, -1.857104, 0, 0, 0, 1, 1,
-0.05281118, 0.9994814, -0.8476105, 0, 0, 0, 1, 1,
-0.05169998, -0.1819859, -2.617877, 1, 1, 1, 1, 1,
-0.04858963, 0.3161523, -0.7674491, 1, 1, 1, 1, 1,
-0.03625748, 0.6736603, -0.3947167, 1, 1, 1, 1, 1,
-0.03416021, -0.1701176, -2.088331, 1, 1, 1, 1, 1,
-0.03192903, -2.510288, -3.808293, 1, 1, 1, 1, 1,
-0.03069813, -1.398348, -3.397484, 1, 1, 1, 1, 1,
-0.02923076, 0.5368651, -0.02556917, 1, 1, 1, 1, 1,
-0.02042105, 0.7212777, -0.8063357, 1, 1, 1, 1, 1,
-0.01925192, -0.07217827, -2.123146, 1, 1, 1, 1, 1,
-0.01860862, -0.2613541, -3.19238, 1, 1, 1, 1, 1,
-0.01590802, -1.134609, -2.347947, 1, 1, 1, 1, 1,
-0.01512486, -1.931165, -3.624802, 1, 1, 1, 1, 1,
-0.01181054, 1.428983, 0.5673525, 1, 1, 1, 1, 1,
-0.007249478, -0.0449306, -1.972542, 1, 1, 1, 1, 1,
-0.004089076, 0.8267755, 1.641821, 1, 1, 1, 1, 1,
-4.586654e-05, -0.6600479, -2.985929, 0, 0, 1, 1, 1,
0.001277433, -1.069677, 2.089958, 1, 0, 0, 1, 1,
0.002021684, 0.6309371, -0.932229, 1, 0, 0, 1, 1,
0.002440502, 0.6285366, 0.348034, 1, 0, 0, 1, 1,
0.01222666, -0.3800695, 2.519025, 1, 0, 0, 1, 1,
0.01233938, 1.832209, 0.4665764, 1, 0, 0, 1, 1,
0.01442699, -0.6356433, 3.95306, 0, 0, 0, 1, 1,
0.0258257, -0.3555771, 4.176254, 0, 0, 0, 1, 1,
0.03032164, 1.160871, -0.027802, 0, 0, 0, 1, 1,
0.03203383, -0.4194412, 2.908784, 0, 0, 0, 1, 1,
0.03265324, -0.2006415, 3.131928, 0, 0, 0, 1, 1,
0.03315145, -0.3502926, 2.358346, 0, 0, 0, 1, 1,
0.03341711, 1.684846, 0.9731645, 0, 0, 0, 1, 1,
0.03349849, 0.9451848, 1.339737, 1, 1, 1, 1, 1,
0.03517714, 0.7996975, -0.5270226, 1, 1, 1, 1, 1,
0.03635177, 0.2958066, -0.2444035, 1, 1, 1, 1, 1,
0.04037165, 2.485805, -0.6741861, 1, 1, 1, 1, 1,
0.0460889, -2.246555, 1.65973, 1, 1, 1, 1, 1,
0.04691309, -0.5565053, 2.127166, 1, 1, 1, 1, 1,
0.05023403, -1.887725, 0.8925001, 1, 1, 1, 1, 1,
0.05408179, 0.4763045, -0.03510552, 1, 1, 1, 1, 1,
0.0545087, -0.5554639, 2.743425, 1, 1, 1, 1, 1,
0.05577784, -0.04706907, -0.1054272, 1, 1, 1, 1, 1,
0.06032495, -1.872453, 2.911939, 1, 1, 1, 1, 1,
0.06127438, -0.6111816, 2.612406, 1, 1, 1, 1, 1,
0.06165269, 0.7102169, 0.6272769, 1, 1, 1, 1, 1,
0.06247797, 1.559032, 2.462014, 1, 1, 1, 1, 1,
0.06311104, -0.693745, 2.999039, 1, 1, 1, 1, 1,
0.06478929, 0.6812986, 0.5107948, 0, 0, 1, 1, 1,
0.07322164, 0.5600221, -0.3500215, 1, 0, 0, 1, 1,
0.07332937, 0.6750139, 0.3956654, 1, 0, 0, 1, 1,
0.077415, -0.07673007, 1.989207, 1, 0, 0, 1, 1,
0.08206158, -1.475415, 3.695787, 1, 0, 0, 1, 1,
0.08244377, -0.03286875, 2.9209, 1, 0, 0, 1, 1,
0.083308, -0.5487961, 3.116435, 0, 0, 0, 1, 1,
0.08524048, 0.08837684, 1.703196, 0, 0, 0, 1, 1,
0.09865912, -0.8562886, 2.61748, 0, 0, 0, 1, 1,
0.09912831, 0.431768, 2.857931, 0, 0, 0, 1, 1,
0.1052735, 0.9056324, -1.83204, 0, 0, 0, 1, 1,
0.1059991, -0.9910365, 4.442642, 0, 0, 0, 1, 1,
0.1067667, -0.5144256, 3.750022, 0, 0, 0, 1, 1,
0.1108996, 1.605468, 0.7619824, 1, 1, 1, 1, 1,
0.1176823, -0.2997942, 3.544477, 1, 1, 1, 1, 1,
0.1188293, 0.1253585, 1.300711, 1, 1, 1, 1, 1,
0.1216503, -0.09607409, 2.623821, 1, 1, 1, 1, 1,
0.1224101, -0.8679814, 3.078579, 1, 1, 1, 1, 1,
0.1251114, 0.1683329, 2.525316, 1, 1, 1, 1, 1,
0.1369694, -1.834139, 3.54805, 1, 1, 1, 1, 1,
0.1388316, 0.752234, -1.418572, 1, 1, 1, 1, 1,
0.1427133, -1.037791, 3.09073, 1, 1, 1, 1, 1,
0.1443433, -1.098238, 2.093677, 1, 1, 1, 1, 1,
0.1448988, -0.2742679, 2.640084, 1, 1, 1, 1, 1,
0.146361, 1.0841, 0.03097567, 1, 1, 1, 1, 1,
0.1500549, -0.0006147512, 1.665882, 1, 1, 1, 1, 1,
0.1543985, -0.987493, 2.205003, 1, 1, 1, 1, 1,
0.1566669, 0.09486446, 0.72359, 1, 1, 1, 1, 1,
0.1572963, 1.01899, 0.2999108, 0, 0, 1, 1, 1,
0.1575108, 0.03857721, -0.5270819, 1, 0, 0, 1, 1,
0.1620532, -0.3895537, 1.659612, 1, 0, 0, 1, 1,
0.162192, -1.252056, 3.91697, 1, 0, 0, 1, 1,
0.1671252, -1.094617, 0.2421668, 1, 0, 0, 1, 1,
0.1686141, -1.007862, 0.3544706, 1, 0, 0, 1, 1,
0.1688966, 0.5975261, 1.216403, 0, 0, 0, 1, 1,
0.169773, 1.39283, 0.3269624, 0, 0, 0, 1, 1,
0.1719872, 1.392237, 0.2201486, 0, 0, 0, 1, 1,
0.1770614, -1.552921, 2.831826, 0, 0, 0, 1, 1,
0.1773208, -0.9005182, 1.849198, 0, 0, 0, 1, 1,
0.1777423, 0.2801177, 1.279125, 0, 0, 0, 1, 1,
0.1782683, -2.285455, 4.759683, 0, 0, 0, 1, 1,
0.1808134, 1.503138, -1.228188, 1, 1, 1, 1, 1,
0.1820198, -1.202454, 3.364267, 1, 1, 1, 1, 1,
0.1832659, 1.945429, -0.0679767, 1, 1, 1, 1, 1,
0.1868705, 0.7030458, -1.698414, 1, 1, 1, 1, 1,
0.1914537, 0.2402904, 1.788382, 1, 1, 1, 1, 1,
0.19318, 1.156385, -0.1766257, 1, 1, 1, 1, 1,
0.1959915, -1.596475, 5.411076, 1, 1, 1, 1, 1,
0.1989323, 0.5324888, -0.6078764, 1, 1, 1, 1, 1,
0.2005035, 1.753897, -0.558938, 1, 1, 1, 1, 1,
0.2024133, -0.5676711, 1.737083, 1, 1, 1, 1, 1,
0.2043062, -1.425076, 3.5347, 1, 1, 1, 1, 1,
0.2078113, -0.9257582, 2.07432, 1, 1, 1, 1, 1,
0.2082103, 0.05773513, -0.2695854, 1, 1, 1, 1, 1,
0.2104524, -0.02926799, 2.455732, 1, 1, 1, 1, 1,
0.2106287, -0.4219481, 2.101587, 1, 1, 1, 1, 1,
0.2141664, -0.3013692, 2.276231, 0, 0, 1, 1, 1,
0.2158408, 0.4353213, 1.437162, 1, 0, 0, 1, 1,
0.2168467, -0.8790591, 2.964863, 1, 0, 0, 1, 1,
0.2176685, -1.602357, 2.197078, 1, 0, 0, 1, 1,
0.2180291, -0.170922, 2.764415, 1, 0, 0, 1, 1,
0.2184857, 0.4433971, 0.9217535, 1, 0, 0, 1, 1,
0.2197753, -0.02346184, 1.550762, 0, 0, 0, 1, 1,
0.2208536, -1.16574, 0.8620122, 0, 0, 0, 1, 1,
0.2232514, 1.03389, 0.6438797, 0, 0, 0, 1, 1,
0.2234633, -1.23362, 3.681808, 0, 0, 0, 1, 1,
0.2239834, -1.579837, 4.38635, 0, 0, 0, 1, 1,
0.2243053, -0.3310409, 1.583663, 0, 0, 0, 1, 1,
0.2246192, 0.09748096, 1.042332, 0, 0, 0, 1, 1,
0.2278026, -0.3035553, 1.691973, 1, 1, 1, 1, 1,
0.2291962, -0.7357325, 4.444884, 1, 1, 1, 1, 1,
0.2300237, 1.018426, -0.266929, 1, 1, 1, 1, 1,
0.2322664, 0.8705795, -0.3034418, 1, 1, 1, 1, 1,
0.2326335, -0.587298, 2.843112, 1, 1, 1, 1, 1,
0.2361444, -0.5934941, 3.087847, 1, 1, 1, 1, 1,
0.2409669, 0.7743786, 0.1287048, 1, 1, 1, 1, 1,
0.2430456, -0.7041957, 1.676553, 1, 1, 1, 1, 1,
0.2462137, -0.4479964, 2.05147, 1, 1, 1, 1, 1,
0.2464758, -0.7103218, 2.711363, 1, 1, 1, 1, 1,
0.2494949, -0.4650531, 3.659236, 1, 1, 1, 1, 1,
0.2528207, -0.2631912, 3.247047, 1, 1, 1, 1, 1,
0.257366, -0.5798535, 2.979657, 1, 1, 1, 1, 1,
0.2600478, 0.6368039, 0.0482175, 1, 1, 1, 1, 1,
0.2623719, -0.5932071, 3.524383, 1, 1, 1, 1, 1,
0.2649327, -1.156176, 3.545281, 0, 0, 1, 1, 1,
0.2694358, 0.6299857, 0.191445, 1, 0, 0, 1, 1,
0.2723435, 0.3963484, 3.675506, 1, 0, 0, 1, 1,
0.2746552, 1.33054, -0.4005785, 1, 0, 0, 1, 1,
0.2760264, -1.044645, 4.353043, 1, 0, 0, 1, 1,
0.2817347, -0.07804906, -0.2046144, 1, 0, 0, 1, 1,
0.2822409, 0.9529234, 0.6118019, 0, 0, 0, 1, 1,
0.2846186, 0.1164864, 0.8431678, 0, 0, 0, 1, 1,
0.2851041, -0.2152329, 4.085717, 0, 0, 0, 1, 1,
0.2875406, -1.776628, 3.892751, 0, 0, 0, 1, 1,
0.2892245, 0.1096054, -0.5254122, 0, 0, 0, 1, 1,
0.2894855, 1.237336, 0.78092, 0, 0, 0, 1, 1,
0.2911841, 2.087767, 0.5147244, 0, 0, 0, 1, 1,
0.2924307, 1.051474, 0.3099059, 1, 1, 1, 1, 1,
0.2944784, 0.1286984, 2.52875, 1, 1, 1, 1, 1,
0.2979377, -1.300287, 3.308051, 1, 1, 1, 1, 1,
0.303948, 1.76042, 1.820723, 1, 1, 1, 1, 1,
0.3050996, -0.04553878, -0.09439795, 1, 1, 1, 1, 1,
0.305345, -1.213667, 0.9085062, 1, 1, 1, 1, 1,
0.3072241, -0.4306246, 1.884484, 1, 1, 1, 1, 1,
0.3103087, -0.4614386, 1.422327, 1, 1, 1, 1, 1,
0.3119817, -0.7456111, 1.803674, 1, 1, 1, 1, 1,
0.3121879, 1.739198, -1.038129, 1, 1, 1, 1, 1,
0.3169046, 0.8476199, 0.0941098, 1, 1, 1, 1, 1,
0.3176899, -1.224238, 1.650467, 1, 1, 1, 1, 1,
0.3192408, 1.068225, 0.1158792, 1, 1, 1, 1, 1,
0.3197501, 1.205272, 0.9659877, 1, 1, 1, 1, 1,
0.3233437, 0.2362332, 1.58296, 1, 1, 1, 1, 1,
0.3258227, -0.4216018, 1.538384, 0, 0, 1, 1, 1,
0.3263514, -0.1216251, 2.046085, 1, 0, 0, 1, 1,
0.3292444, -1.074982, 3.40193, 1, 0, 0, 1, 1,
0.3343419, -0.2208955, 2.810803, 1, 0, 0, 1, 1,
0.3355135, -0.6261067, 2.998104, 1, 0, 0, 1, 1,
0.335554, 2.090308, -0.5390372, 1, 0, 0, 1, 1,
0.3455594, 0.7843484, 0.2207353, 0, 0, 0, 1, 1,
0.3530191, -0.3900613, 2.405542, 0, 0, 0, 1, 1,
0.3591296, 0.6083959, 0.9626033, 0, 0, 0, 1, 1,
0.3605944, 0.7718625, 0.5482984, 0, 0, 0, 1, 1,
0.3622462, -0.2288389, 2.023783, 0, 0, 0, 1, 1,
0.3628522, 0.06587291, 0.9009541, 0, 0, 0, 1, 1,
0.3633885, 0.5581093, 2.185705, 0, 0, 0, 1, 1,
0.3672153, 0.3161492, 1.775277, 1, 1, 1, 1, 1,
0.368349, -0.8835251, 3.707622, 1, 1, 1, 1, 1,
0.3731619, 0.3050316, 1.535926, 1, 1, 1, 1, 1,
0.3746538, -0.3108265, 0.6961513, 1, 1, 1, 1, 1,
0.3761212, 0.8663864, -0.2685986, 1, 1, 1, 1, 1,
0.3770086, -0.1268229, 2.213956, 1, 1, 1, 1, 1,
0.3792278, -0.2343458, 2.595139, 1, 1, 1, 1, 1,
0.386133, -0.7458573, 2.646607, 1, 1, 1, 1, 1,
0.3884558, 0.2590625, 1.376814, 1, 1, 1, 1, 1,
0.3959415, -0.3745838, 1.68587, 1, 1, 1, 1, 1,
0.4082697, -0.2034786, 2.618387, 1, 1, 1, 1, 1,
0.4105532, -1.290577, 4.024413, 1, 1, 1, 1, 1,
0.4123048, 0.5285709, -0.157099, 1, 1, 1, 1, 1,
0.413473, 1.473912, -0.5132552, 1, 1, 1, 1, 1,
0.4157716, -1.115005, 3.248896, 1, 1, 1, 1, 1,
0.4173006, -0.9966836, 2.97499, 0, 0, 1, 1, 1,
0.4220559, -0.7596818, 2.511978, 1, 0, 0, 1, 1,
0.4255252, 0.0166817, 1.489595, 1, 0, 0, 1, 1,
0.4278386, -0.3705999, 2.77456, 1, 0, 0, 1, 1,
0.4310018, 0.5623457, -0.7833059, 1, 0, 0, 1, 1,
0.4312843, -0.1589055, 2.695678, 1, 0, 0, 1, 1,
0.4325885, 0.5710125, 2.012757, 0, 0, 0, 1, 1,
0.4332896, -0.0278132, 0.9654937, 0, 0, 0, 1, 1,
0.4334853, 0.5831978, 0.3153451, 0, 0, 0, 1, 1,
0.4351636, -1.847671, 4.080559, 0, 0, 0, 1, 1,
0.4353522, 0.4190532, 0.01726768, 0, 0, 0, 1, 1,
0.4393312, -0.5982805, 1.545719, 0, 0, 0, 1, 1,
0.44944, -0.7816297, 4.208201, 0, 0, 0, 1, 1,
0.4530927, -0.8367311, 2.05324, 1, 1, 1, 1, 1,
0.4548847, -0.8630939, 2.013532, 1, 1, 1, 1, 1,
0.4566609, 1.093389, 0.3602457, 1, 1, 1, 1, 1,
0.4592909, 1.143634, 1.025705, 1, 1, 1, 1, 1,
0.4689541, -0.8392506, 3.747451, 1, 1, 1, 1, 1,
0.4698052, 1.835638, -0.6491675, 1, 1, 1, 1, 1,
0.4705212, 2.015384, -0.3390321, 1, 1, 1, 1, 1,
0.473912, -1.126073, 4.24126, 1, 1, 1, 1, 1,
0.4745679, -0.2176136, 3.190175, 1, 1, 1, 1, 1,
0.4778652, -0.6998816, 2.387736, 1, 1, 1, 1, 1,
0.4798925, 0.3397622, 1.183758, 1, 1, 1, 1, 1,
0.4831409, -0.6358777, 2.292629, 1, 1, 1, 1, 1,
0.4884495, 2.104681, 2.810035, 1, 1, 1, 1, 1,
0.4981142, -0.9236529, 3.647013, 1, 1, 1, 1, 1,
0.4988293, -1.822612, 3.157937, 1, 1, 1, 1, 1,
0.4999236, -2.119241, 2.075161, 0, 0, 1, 1, 1,
0.5000945, -0.9189524, 2.495467, 1, 0, 0, 1, 1,
0.5008216, 1.00562, 0.7006398, 1, 0, 0, 1, 1,
0.5038927, 0.939339, 0.8437769, 1, 0, 0, 1, 1,
0.5039713, -1.230953, 3.120457, 1, 0, 0, 1, 1,
0.5072497, 0.1649736, 0.615595, 1, 0, 0, 1, 1,
0.5094599, 0.1936748, 3.260679, 0, 0, 0, 1, 1,
0.5102557, 0.4876287, 0.4219288, 0, 0, 0, 1, 1,
0.5112885, -0.1863925, -1.385019, 0, 0, 0, 1, 1,
0.5116975, -1.0837, 0.4864687, 0, 0, 0, 1, 1,
0.5127183, -1.965112, 1.809931, 0, 0, 0, 1, 1,
0.5139164, 0.9750637, -0.07930459, 0, 0, 0, 1, 1,
0.5280151, -0.6153623, 4.274954, 0, 0, 0, 1, 1,
0.5296869, 0.05749081, 1.142698, 1, 1, 1, 1, 1,
0.5353308, -1.378255, 3.459145, 1, 1, 1, 1, 1,
0.5444383, -1.247041, 1.996768, 1, 1, 1, 1, 1,
0.5458241, -0.01875365, 0.6759187, 1, 1, 1, 1, 1,
0.5475485, 0.5728667, 0.7177181, 1, 1, 1, 1, 1,
0.5536976, 1.661374, 0.9623338, 1, 1, 1, 1, 1,
0.5683941, 1.051311, -0.5285778, 1, 1, 1, 1, 1,
0.5707986, 1.384704, 0.6487987, 1, 1, 1, 1, 1,
0.5746135, 0.4842699, 1.454519, 1, 1, 1, 1, 1,
0.5791362, 0.9549225, 0.886852, 1, 1, 1, 1, 1,
0.5877771, -0.0209092, 1.225286, 1, 1, 1, 1, 1,
0.589929, 0.3628193, 1.458055, 1, 1, 1, 1, 1,
0.5919176, -0.7423645, 3.190354, 1, 1, 1, 1, 1,
0.5923483, -0.55454, 1.819962, 1, 1, 1, 1, 1,
0.5938591, 0.9043823, -0.6577002, 1, 1, 1, 1, 1,
0.599086, -1.186729, 3.21402, 0, 0, 1, 1, 1,
0.6020658, 0.3272438, 2.169983, 1, 0, 0, 1, 1,
0.6059327, -0.8621054, 2.421777, 1, 0, 0, 1, 1,
0.6081803, -0.5463333, 1.851023, 1, 0, 0, 1, 1,
0.6089014, 0.05318644, 1.944644, 1, 0, 0, 1, 1,
0.6152059, -0.6447276, 2.228945, 1, 0, 0, 1, 1,
0.6254582, -3.004865, 2.655771, 0, 0, 0, 1, 1,
0.6265537, -0.2501624, 2.955379, 0, 0, 0, 1, 1,
0.6298371, -0.4828567, 0.6459972, 0, 0, 0, 1, 1,
0.6323318, -0.4700258, 3.454894, 0, 0, 0, 1, 1,
0.6348798, -0.8914924, 2.775644, 0, 0, 0, 1, 1,
0.6420516, 0.295806, 0.1355827, 0, 0, 0, 1, 1,
0.6434669, 0.3287724, 1.814947, 0, 0, 0, 1, 1,
0.6446053, 2.454624, 0.650579, 1, 1, 1, 1, 1,
0.6454417, 0.4732584, -0.7085161, 1, 1, 1, 1, 1,
0.6475054, 0.1851483, 1.629896, 1, 1, 1, 1, 1,
0.6475606, -1.115752, 2.141914, 1, 1, 1, 1, 1,
0.6508797, 0.009956349, 0.894623, 1, 1, 1, 1, 1,
0.6566406, -1.961188, 2.877396, 1, 1, 1, 1, 1,
0.666674, -0.3769171, 2.173805, 1, 1, 1, 1, 1,
0.6756676, 0.1640266, 0.7048475, 1, 1, 1, 1, 1,
0.677341, -0.1623546, 0.5273024, 1, 1, 1, 1, 1,
0.6792164, -0.2646565, 1.98137, 1, 1, 1, 1, 1,
0.682439, 0.3901741, 2.20134, 1, 1, 1, 1, 1,
0.6858566, 1.345522, 0.5728309, 1, 1, 1, 1, 1,
0.6944607, 1.413428, 1.160593, 1, 1, 1, 1, 1,
0.6973351, 0.475678, 0.357568, 1, 1, 1, 1, 1,
0.7005337, -0.6099573, 3.461332, 1, 1, 1, 1, 1,
0.7014855, -1.374244, 3.645741, 0, 0, 1, 1, 1,
0.7053342, 1.065561, 0.338012, 1, 0, 0, 1, 1,
0.705964, 2.048615, 2.379159, 1, 0, 0, 1, 1,
0.7114208, 0.07223652, 1.692024, 1, 0, 0, 1, 1,
0.7179653, -0.7019773, 1.503496, 1, 0, 0, 1, 1,
0.7296525, 0.8487796, 0.2696421, 1, 0, 0, 1, 1,
0.7328528, 0.1890769, 1.895378, 0, 0, 0, 1, 1,
0.7342228, -1.028311, 1.224405, 0, 0, 0, 1, 1,
0.739301, -1.609068, 1.064577, 0, 0, 0, 1, 1,
0.7426997, 0.5794466, 1.98518, 0, 0, 0, 1, 1,
0.751606, -0.8004845, 2.639712, 0, 0, 0, 1, 1,
0.7534536, 0.1433682, 1.905739, 0, 0, 0, 1, 1,
0.7557334, 0.07450499, 1.585832, 0, 0, 0, 1, 1,
0.7574999, -0.2738196, 2.676597, 1, 1, 1, 1, 1,
0.7605652, -0.2402663, 1.775142, 1, 1, 1, 1, 1,
0.7605865, 1.372491, -1.986911, 1, 1, 1, 1, 1,
0.7613781, 0.9075782, 0.9322151, 1, 1, 1, 1, 1,
0.7643237, 0.8093914, -0.8233573, 1, 1, 1, 1, 1,
0.7645905, 0.3150403, 3.415629, 1, 1, 1, 1, 1,
0.7663753, -0.8325379, 3.188871, 1, 1, 1, 1, 1,
0.7689667, -1.083769, 4.022732, 1, 1, 1, 1, 1,
0.7707702, 1.224895, -0.3224772, 1, 1, 1, 1, 1,
0.7720715, -1.531344, 3.924327, 1, 1, 1, 1, 1,
0.7732238, -0.9273616, 1.06127, 1, 1, 1, 1, 1,
0.7765872, -0.9074697, 2.220428, 1, 1, 1, 1, 1,
0.7810332, 0.08439463, 0.5332203, 1, 1, 1, 1, 1,
0.7811604, -0.3751479, 2.23125, 1, 1, 1, 1, 1,
0.7850062, -0.9853349, 2.260595, 1, 1, 1, 1, 1,
0.7860764, -0.06207163, 2.024088, 0, 0, 1, 1, 1,
0.7932141, 1.712184, 1.743968, 1, 0, 0, 1, 1,
0.7941942, -0.657418, 3.356874, 1, 0, 0, 1, 1,
0.8014036, -1.109095, 0.8905358, 1, 0, 0, 1, 1,
0.8014969, 0.04943958, 1.994393, 1, 0, 0, 1, 1,
0.8143031, -0.3707626, 2.069033, 1, 0, 0, 1, 1,
0.8197778, 1.687567, -1.838655, 0, 0, 0, 1, 1,
0.8221694, 0.135123, 0.8896035, 0, 0, 0, 1, 1,
0.8238451, 0.5369254, 2.385925, 0, 0, 0, 1, 1,
0.8256468, -0.2321078, 2.021242, 0, 0, 0, 1, 1,
0.8283762, 0.2979132, 1.618649, 0, 0, 0, 1, 1,
0.835893, 0.3802847, 0.04622152, 0, 0, 0, 1, 1,
0.8390996, -0.1777365, 0.7536814, 0, 0, 0, 1, 1,
0.8464679, 0.04177354, 1.111799, 1, 1, 1, 1, 1,
0.8483372, 0.07397351, 0.8208228, 1, 1, 1, 1, 1,
0.857888, 0.8408921, 2.402847, 1, 1, 1, 1, 1,
0.8599945, 0.3245372, 1.214469, 1, 1, 1, 1, 1,
0.860379, 1.352962, 0.4713885, 1, 1, 1, 1, 1,
0.8665752, -1.923393, 1.870445, 1, 1, 1, 1, 1,
0.8699077, -1.847732, 2.252612, 1, 1, 1, 1, 1,
0.8717291, -1.978403, 1.624152, 1, 1, 1, 1, 1,
0.8728568, 1.292508, 1.140416, 1, 1, 1, 1, 1,
0.8847932, 1.492767, 2.07537, 1, 1, 1, 1, 1,
0.8867719, -1.197801, -0.4710611, 1, 1, 1, 1, 1,
0.8904958, 1.059214, 1.150312, 1, 1, 1, 1, 1,
0.8921352, 2.764582, -0.1192332, 1, 1, 1, 1, 1,
0.907362, -1.16193, 4.116481, 1, 1, 1, 1, 1,
0.910085, -1.112808, 2.644576, 1, 1, 1, 1, 1,
0.9118782, -1.688918, 3.10907, 0, 0, 1, 1, 1,
0.9142278, -0.4043989, 1.749449, 1, 0, 0, 1, 1,
0.9283171, -0.1014449, 1.68944, 1, 0, 0, 1, 1,
0.9287526, -0.6779136, 1.8512, 1, 0, 0, 1, 1,
0.9303924, 1.493836, 0.8860102, 1, 0, 0, 1, 1,
0.9314327, 1.789823, 2.523169, 1, 0, 0, 1, 1,
0.9343352, 0.6806548, 0.3135429, 0, 0, 0, 1, 1,
0.9392504, -0.4406167, 1.098125, 0, 0, 0, 1, 1,
0.9560722, -0.9167443, 5.053594, 0, 0, 0, 1, 1,
0.9571137, -0.2597581, 1.778948, 0, 0, 0, 1, 1,
0.9640235, -1.473763, 3.002486, 0, 0, 0, 1, 1,
0.9654225, -0.141352, 0.1777691, 0, 0, 0, 1, 1,
0.9666052, -1.96206, 1.502111, 0, 0, 0, 1, 1,
0.9721233, -1.713362, 2.424851, 1, 1, 1, 1, 1,
0.9819122, -2.087661, 2.118544, 1, 1, 1, 1, 1,
0.9839902, 1.705825, -0.1268879, 1, 1, 1, 1, 1,
0.9870037, 1.501015, 1.176664, 1, 1, 1, 1, 1,
0.9891939, -0.1871355, 0.8667497, 1, 1, 1, 1, 1,
0.993362, 1.592169, -0.6469288, 1, 1, 1, 1, 1,
0.9939407, -0.277431, 1.217367, 1, 1, 1, 1, 1,
0.9943379, -0.2140942, 1.254775, 1, 1, 1, 1, 1,
1.004643, -0.318374, 1.957602, 1, 1, 1, 1, 1,
1.007298, 0.8101054, 1.01495, 1, 1, 1, 1, 1,
1.009934, 1.706213, 1.671428, 1, 1, 1, 1, 1,
1.015084, -0.2142501, 2.157357, 1, 1, 1, 1, 1,
1.01661, -2.235343, 2.250643, 1, 1, 1, 1, 1,
1.022795, -1.026831, 4.105777, 1, 1, 1, 1, 1,
1.037381, 1.738857, -0.1431166, 1, 1, 1, 1, 1,
1.054616, -0.04912497, 2.069367, 0, 0, 1, 1, 1,
1.061224, -1.878928, 2.298667, 1, 0, 0, 1, 1,
1.066492, -1.69436, 0.9677016, 1, 0, 0, 1, 1,
1.068445, 0.8577668, 0.9093886, 1, 0, 0, 1, 1,
1.070134, -0.7149836, 1.08145, 1, 0, 0, 1, 1,
1.071313, 0.08269579, 3.523367, 1, 0, 0, 1, 1,
1.074859, -0.3280032, 1.362303, 0, 0, 0, 1, 1,
1.077062, 0.9447682, -1.336587, 0, 0, 0, 1, 1,
1.081687, 0.6465341, 1.229671, 0, 0, 0, 1, 1,
1.089345, -0.446122, 1.523154, 0, 0, 0, 1, 1,
1.092093, -0.2545888, 1.321861, 0, 0, 0, 1, 1,
1.09358, -0.9107842, 2.327232, 0, 0, 0, 1, 1,
1.097658, -0.5415876, 0.5357283, 0, 0, 0, 1, 1,
1.09915, -0.3082578, 3.52949, 1, 1, 1, 1, 1,
1.099604, -0.7997327, 1.911106, 1, 1, 1, 1, 1,
1.101473, 0.9413962, 1.576346, 1, 1, 1, 1, 1,
1.109948, 1.045997, -0.1172981, 1, 1, 1, 1, 1,
1.110575, -0.3017503, 3.132043, 1, 1, 1, 1, 1,
1.123865, 0.9871794, 0.5701303, 1, 1, 1, 1, 1,
1.131812, 0.2478361, 1.019594, 1, 1, 1, 1, 1,
1.134537, -0.7392635, 3.18174, 1, 1, 1, 1, 1,
1.136554, 0.07813377, 0.9482113, 1, 1, 1, 1, 1,
1.13987, 0.1401669, 0.02623971, 1, 1, 1, 1, 1,
1.140077, 0.7084796, 0.9192431, 1, 1, 1, 1, 1,
1.145119, -0.02796084, 2.846854, 1, 1, 1, 1, 1,
1.149676, -1.214501, -1.061466, 1, 1, 1, 1, 1,
1.157287, -2.618733, 4.468022, 1, 1, 1, 1, 1,
1.159759, -0.6202464, 2.520388, 1, 1, 1, 1, 1,
1.164496, -0.1491237, 2.472794, 0, 0, 1, 1, 1,
1.167198, -0.4358404, 2.207893, 1, 0, 0, 1, 1,
1.168149, -0.8391848, 3.515892, 1, 0, 0, 1, 1,
1.169152, 0.002491916, 0.07407564, 1, 0, 0, 1, 1,
1.185643, 1.184955, 1.994788, 1, 0, 0, 1, 1,
1.189402, -0.149018, 3.478984, 1, 0, 0, 1, 1,
1.193674, -0.6623259, 1.769171, 0, 0, 0, 1, 1,
1.193793, 0.4196471, 1.334367, 0, 0, 0, 1, 1,
1.201302, -1.834665, 2.749473, 0, 0, 0, 1, 1,
1.207913, 0.6767268, 0.3718203, 0, 0, 0, 1, 1,
1.210879, 0.44849, 2.891295, 0, 0, 0, 1, 1,
1.21428, -0.4607738, 2.237844, 0, 0, 0, 1, 1,
1.222006, -0.1292998, 1.075688, 0, 0, 0, 1, 1,
1.222301, 0.8665622, -0.4377355, 1, 1, 1, 1, 1,
1.227888, 1.156599, 1.231861, 1, 1, 1, 1, 1,
1.228051, -0.1464487, 1.602774, 1, 1, 1, 1, 1,
1.229635, 0.2587191, 1.322495, 1, 1, 1, 1, 1,
1.229708, 1.860849, 2.290509, 1, 1, 1, 1, 1,
1.237709, 0.1485773, 1.726015, 1, 1, 1, 1, 1,
1.241896, 1.991735, 1.18263, 1, 1, 1, 1, 1,
1.246249, -0.5106829, 1.815349, 1, 1, 1, 1, 1,
1.267188, -0.4058845, 1.332693, 1, 1, 1, 1, 1,
1.26948, 0.4232844, 1.803319, 1, 1, 1, 1, 1,
1.272347, 1.057936, 0.4769104, 1, 1, 1, 1, 1,
1.274626, 0.2421035, 0.937305, 1, 1, 1, 1, 1,
1.278653, -0.2425604, 1.033724, 1, 1, 1, 1, 1,
1.302641, -1.036542, 2.369516, 1, 1, 1, 1, 1,
1.303252, 0.917008, -0.4170863, 1, 1, 1, 1, 1,
1.305198, -0.4135335, 0.2199384, 0, 0, 1, 1, 1,
1.312079, 0.8048534, 1.001573, 1, 0, 0, 1, 1,
1.314006, 0.6865547, 1.534814, 1, 0, 0, 1, 1,
1.315051, 0.3901372, 0.2894133, 1, 0, 0, 1, 1,
1.320384, -0.5022082, 0.7529373, 1, 0, 0, 1, 1,
1.333126, -0.4194814, 2.869781, 1, 0, 0, 1, 1,
1.341625, 1.301051, 0.175666, 0, 0, 0, 1, 1,
1.34245, 0.5409024, -0.7789678, 0, 0, 0, 1, 1,
1.346089, 1.577326, 1.443027, 0, 0, 0, 1, 1,
1.350083, 1.525785, -0.01542071, 0, 0, 0, 1, 1,
1.350804, -0.6202736, 2.716213, 0, 0, 0, 1, 1,
1.351354, -2.480829, 2.45519, 0, 0, 0, 1, 1,
1.358991, 0.6464127, -0.06937163, 0, 0, 0, 1, 1,
1.362097, 0.1135763, 2.716535, 1, 1, 1, 1, 1,
1.377328, 1.335782, 2.363733, 1, 1, 1, 1, 1,
1.380635, 0.5458038, 0.6715673, 1, 1, 1, 1, 1,
1.380682, 0.6431278, -0.8253258, 1, 1, 1, 1, 1,
1.385577, -0.4982266, 3.44756, 1, 1, 1, 1, 1,
1.398615, -0.2642054, 2.015318, 1, 1, 1, 1, 1,
1.420511, 0.186, 2.99894, 1, 1, 1, 1, 1,
1.429714, 2.090656, 1.2739, 1, 1, 1, 1, 1,
1.431259, -0.9784701, 1.747545, 1, 1, 1, 1, 1,
1.434419, -0.01100926, 2.627783, 1, 1, 1, 1, 1,
1.437817, 1.497787, 2.231449, 1, 1, 1, 1, 1,
1.454344, -1.847267, 2.117007, 1, 1, 1, 1, 1,
1.460963, 0.1641491, 0.7412047, 1, 1, 1, 1, 1,
1.463887, 0.5280275, 2.674084, 1, 1, 1, 1, 1,
1.467399, -0.9016486, -0.5954022, 1, 1, 1, 1, 1,
1.467679, 1.173655, 2.259533, 0, 0, 1, 1, 1,
1.469993, -0.8280888, 1.981752, 1, 0, 0, 1, 1,
1.472782, 0.8542644, 0.0753338, 1, 0, 0, 1, 1,
1.502267, 2.367938, 3.065673, 1, 0, 0, 1, 1,
1.511238, -0.04483049, 0.7744478, 1, 0, 0, 1, 1,
1.516729, 0.862109, 1.482581, 1, 0, 0, 1, 1,
1.525337, -1.391547, 3.003496, 0, 0, 0, 1, 1,
1.536362, 0.9299108, 1.915784, 0, 0, 0, 1, 1,
1.540018, 0.8180425, -0.4376996, 0, 0, 0, 1, 1,
1.548529, -1.738368, 2.661491, 0, 0, 0, 1, 1,
1.575379, 0.8374398, 2.451838, 0, 0, 0, 1, 1,
1.578791, 0.1242374, -0.4479711, 0, 0, 0, 1, 1,
1.584887, -0.2083418, 1.394294, 0, 0, 0, 1, 1,
1.590734, 0.3484981, 3.026753, 1, 1, 1, 1, 1,
1.60175, 0.6266531, 1.47908, 1, 1, 1, 1, 1,
1.603555, 0.8816801, 2.033638, 1, 1, 1, 1, 1,
1.607143, -1.21789, 3.507166, 1, 1, 1, 1, 1,
1.611828, 0.9899746, 2.208257, 1, 1, 1, 1, 1,
1.619488, 1.070106, 2.236954, 1, 1, 1, 1, 1,
1.630427, 0.1239072, 1.016247, 1, 1, 1, 1, 1,
1.648731, -0.4339246, 3.692374, 1, 1, 1, 1, 1,
1.65823, -0.4089076, 4.288951, 1, 1, 1, 1, 1,
1.661052, -2.657069, 2.260311, 1, 1, 1, 1, 1,
1.662639, -1.224599, 2.447227, 1, 1, 1, 1, 1,
1.671054, 0.4593988, 0.8049799, 1, 1, 1, 1, 1,
1.686809, 0.006261374, 0.3416153, 1, 1, 1, 1, 1,
1.70628, -1.974024, 3.588157, 1, 1, 1, 1, 1,
1.708382, -1.609274, 1.731604, 1, 1, 1, 1, 1,
1.716833, -0.7068447, 1.955041, 0, 0, 1, 1, 1,
1.741059, -0.3072004, -0.1838168, 1, 0, 0, 1, 1,
1.742012, -0.3800558, 1.105599, 1, 0, 0, 1, 1,
1.745205, -1.047633, 2.831039, 1, 0, 0, 1, 1,
1.751004, -1.039607, 2.418907, 1, 0, 0, 1, 1,
1.752979, -0.729158, 3.457071, 1, 0, 0, 1, 1,
1.756037, -0.01516226, 1.683393, 0, 0, 0, 1, 1,
1.756513, 0.5959889, 1.897022, 0, 0, 0, 1, 1,
1.767818, -0.2155249, 1.812727, 0, 0, 0, 1, 1,
1.774616, -0.5939271, 2.371144, 0, 0, 0, 1, 1,
1.805747, -1.113069, 0.7902343, 0, 0, 0, 1, 1,
1.81175, -1.573988, 0.9649912, 0, 0, 0, 1, 1,
1.814732, -0.3346873, 2.097297, 0, 0, 0, 1, 1,
1.817214, -0.4536873, 3.134717, 1, 1, 1, 1, 1,
1.833965, -0.005810204, 2.670667, 1, 1, 1, 1, 1,
1.846636, -1.005083, 0.2454514, 1, 1, 1, 1, 1,
1.847506, -1.041387, 4.943715, 1, 1, 1, 1, 1,
1.868274, -0.885603, 2.168486, 1, 1, 1, 1, 1,
1.868465, 0.1031689, 0.3124047, 1, 1, 1, 1, 1,
1.890243, 1.150097, 0.2920549, 1, 1, 1, 1, 1,
1.900499, -0.7054962, 3.401514, 1, 1, 1, 1, 1,
1.903943, -0.3867066, 2.071208, 1, 1, 1, 1, 1,
1.904408, 0.2993262, 2.581311, 1, 1, 1, 1, 1,
1.913465, 0.619048, 0.7047309, 1, 1, 1, 1, 1,
1.932107, -0.5010152, 2.23005, 1, 1, 1, 1, 1,
1.953089, -2.212974, 3.061825, 1, 1, 1, 1, 1,
1.970986, 0.5876645, 1.820158, 1, 1, 1, 1, 1,
1.977724, -0.2619129, 0.6299268, 1, 1, 1, 1, 1,
2.048656, -1.327324, 4.886612, 0, 0, 1, 1, 1,
2.091112, 1.582273, 1.644097, 1, 0, 0, 1, 1,
2.103557, -1.365894, 2.18109, 1, 0, 0, 1, 1,
2.132599, -0.9426594, 0.8949994, 1, 0, 0, 1, 1,
2.190006, -0.4824952, 2.086022, 1, 0, 0, 1, 1,
2.195516, 1.948723, 0.5232744, 1, 0, 0, 1, 1,
2.251884, 2.362189, 2.011873, 0, 0, 0, 1, 1,
2.260046, -0.2645957, 3.274912, 0, 0, 0, 1, 1,
2.294717, -1.654547, 1.412749, 0, 0, 0, 1, 1,
2.310397, 0.5779638, 0.5544173, 0, 0, 0, 1, 1,
2.337843, 0.5972293, 1.297298, 0, 0, 0, 1, 1,
2.362653, -0.6606466, 2.392078, 0, 0, 0, 1, 1,
2.377895, -0.05379076, 1.780577, 0, 0, 0, 1, 1,
2.393989, -1.262244, 2.361449, 1, 1, 1, 1, 1,
2.416785, -1.178076, 2.375171, 1, 1, 1, 1, 1,
2.467865, 0.4715306, 1.512949, 1, 1, 1, 1, 1,
2.617754, 1.98471, 1.766886, 1, 1, 1, 1, 1,
2.692198, -0.4418786, 1.065299, 1, 1, 1, 1, 1,
2.764613, -1.886205, 1.382614, 1, 1, 1, 1, 1,
2.808999, 0.4158511, 0.8537018, 1, 1, 1, 1, 1
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
var radius = 9.198205;
var distance = 32.30831;
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
mvMatrix.translate( 0.2069169, 0.001302719, -0.2655871 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.30831);
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
