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
-3.83342, -1.168158, -2.556535, 1, 0, 0, 1,
-3.130591, 0.1830039, -2.000977, 1, 0.007843138, 0, 1,
-3.112878, -1.991404, -2.568183, 1, 0.01176471, 0, 1,
-3.107336, 0.4615218, -1.451318, 1, 0.01960784, 0, 1,
-3.047165, 0.05733351, -1.587429, 1, 0.02352941, 0, 1,
-2.894239, 0.9205285, -0.7328624, 1, 0.03137255, 0, 1,
-2.869054, -0.7124052, 0.2512779, 1, 0.03529412, 0, 1,
-2.816145, -0.4292031, -4.653943, 1, 0.04313726, 0, 1,
-2.783911, -1.113601, -1.0139, 1, 0.04705882, 0, 1,
-2.689506, 0.5713491, -0.4569645, 1, 0.05490196, 0, 1,
-2.630671, -0.03737358, -2.93516, 1, 0.05882353, 0, 1,
-2.619981, -0.9752614, -1.72387, 1, 0.06666667, 0, 1,
-2.59289, 0.8342434, -1.158186, 1, 0.07058824, 0, 1,
-2.575514, -0.9456531, -0.6128317, 1, 0.07843138, 0, 1,
-2.52639, 1.394386, -1.453331, 1, 0.08235294, 0, 1,
-2.518673, 0.9037297, -2.791016, 1, 0.09019608, 0, 1,
-2.462327, -0.6248754, -2.301809, 1, 0.09411765, 0, 1,
-2.360128, 0.3490533, -0.4490643, 1, 0.1019608, 0, 1,
-2.334782, -1.868293, -2.386267, 1, 0.1098039, 0, 1,
-2.290378, -0.1484219, -2.368995, 1, 0.1137255, 0, 1,
-2.276855, 0.5815151, -1.834443, 1, 0.1215686, 0, 1,
-2.273775, -0.3213117, -1.263932, 1, 0.1254902, 0, 1,
-2.269307, -0.1325697, -1.184052, 1, 0.1333333, 0, 1,
-2.204176, 0.8078527, -1.237231, 1, 0.1372549, 0, 1,
-2.197492, 0.1774354, -3.742323, 1, 0.145098, 0, 1,
-2.186244, -0.1069962, -0.8518377, 1, 0.1490196, 0, 1,
-2.136185, -0.9287585, -1.575379, 1, 0.1568628, 0, 1,
-2.08108, -0.6002896, -1.644719, 1, 0.1607843, 0, 1,
-2.078582, 0.5024728, -0.7371195, 1, 0.1686275, 0, 1,
-2.0416, 1.401286, -1.468898, 1, 0.172549, 0, 1,
-2.03059, -0.1810267, -2.616611, 1, 0.1803922, 0, 1,
-2.011659, 1.229494, -0.7086192, 1, 0.1843137, 0, 1,
-1.995191, -0.354178, -1.063507, 1, 0.1921569, 0, 1,
-1.968577, -0.471262, -2.418057, 1, 0.1960784, 0, 1,
-1.957396, -0.226092, -2.137718, 1, 0.2039216, 0, 1,
-1.946623, 1.8661, -0.7025605, 1, 0.2117647, 0, 1,
-1.931037, 0.2158149, -1.052466, 1, 0.2156863, 0, 1,
-1.922145, -0.5064931, -2.910805, 1, 0.2235294, 0, 1,
-1.91944, 1.778127, -0.1385013, 1, 0.227451, 0, 1,
-1.903641, 0.01226591, -3.285427, 1, 0.2352941, 0, 1,
-1.903163, -1.061585, -2.214597, 1, 0.2392157, 0, 1,
-1.901546, -1.08816, -0.4795247, 1, 0.2470588, 0, 1,
-1.901353, -0.3395279, -2.098467, 1, 0.2509804, 0, 1,
-1.900181, -0.202155, -2.519461, 1, 0.2588235, 0, 1,
-1.857619, -0.05734748, 0.03806108, 1, 0.2627451, 0, 1,
-1.855866, -0.9913707, -0.7678384, 1, 0.2705882, 0, 1,
-1.852483, -0.2718066, -2.406728, 1, 0.2745098, 0, 1,
-1.849638, 0.1487487, -0.2100957, 1, 0.282353, 0, 1,
-1.845543, 1.047149, -0.1686057, 1, 0.2862745, 0, 1,
-1.833795, -0.4742014, -2.203408, 1, 0.2941177, 0, 1,
-1.823207, -1.518636, -1.498878, 1, 0.3019608, 0, 1,
-1.8004, 0.8184357, -1.117438, 1, 0.3058824, 0, 1,
-1.772351, 1.710648, 0.01327138, 1, 0.3137255, 0, 1,
-1.769049, -0.5989988, -1.405816, 1, 0.3176471, 0, 1,
-1.76637, -0.7687262, -2.850646, 1, 0.3254902, 0, 1,
-1.738569, 2.041726, -0.3931871, 1, 0.3294118, 0, 1,
-1.736351, 1.315154, -1.891606, 1, 0.3372549, 0, 1,
-1.735762, -0.9431899, -3.10162, 1, 0.3411765, 0, 1,
-1.721349, -1.648771, -3.21839, 1, 0.3490196, 0, 1,
-1.716559, -0.3527521, -1.221762, 1, 0.3529412, 0, 1,
-1.704844, 1.933457, 0.8026364, 1, 0.3607843, 0, 1,
-1.694998, -0.7947885, -2.925415, 1, 0.3647059, 0, 1,
-1.686936, -0.2440526, -0.8347219, 1, 0.372549, 0, 1,
-1.668119, -1.152432, -2.481695, 1, 0.3764706, 0, 1,
-1.663656, -0.5765411, -1.992381, 1, 0.3843137, 0, 1,
-1.658077, -1.994021, -1.288173, 1, 0.3882353, 0, 1,
-1.646688, -0.8847111, -2.775773, 1, 0.3960784, 0, 1,
-1.644649, 0.4424288, -1.27036, 1, 0.4039216, 0, 1,
-1.640732, 0.4218116, -0.2040454, 1, 0.4078431, 0, 1,
-1.629549, 1.04297, -0.6677169, 1, 0.4156863, 0, 1,
-1.619447, -1.006999, -1.717692, 1, 0.4196078, 0, 1,
-1.61841, 1.948969, -1.085772, 1, 0.427451, 0, 1,
-1.613142, -0.6275339, -0.1858694, 1, 0.4313726, 0, 1,
-1.602438, -0.4601357, -1.163616, 1, 0.4392157, 0, 1,
-1.600805, 0.5476362, -1.237104, 1, 0.4431373, 0, 1,
-1.583967, -0.9885591, -2.234583, 1, 0.4509804, 0, 1,
-1.583394, 0.8869014, -2.091172, 1, 0.454902, 0, 1,
-1.581232, -0.6612361, -0.5607962, 1, 0.4627451, 0, 1,
-1.573794, 0.2962304, -0.9363145, 1, 0.4666667, 0, 1,
-1.566318, -0.2008605, -1.295279, 1, 0.4745098, 0, 1,
-1.565763, 1.55581, -1.31788, 1, 0.4784314, 0, 1,
-1.562619, 1.936568, 1.235711, 1, 0.4862745, 0, 1,
-1.554553, 0.1460969, -1.545416, 1, 0.4901961, 0, 1,
-1.550297, -0.4540644, -1.377733, 1, 0.4980392, 0, 1,
-1.545101, -0.6542829, -0.75479, 1, 0.5058824, 0, 1,
-1.54347, -1.586117, -1.355206, 1, 0.509804, 0, 1,
-1.539119, 0.865202, -0.945127, 1, 0.5176471, 0, 1,
-1.534732, 0.03308498, -0.3738646, 1, 0.5215687, 0, 1,
-1.533769, -1.394915, -1.407088, 1, 0.5294118, 0, 1,
-1.53243, 0.1871556, -2.245711, 1, 0.5333334, 0, 1,
-1.524321, 1.45315, 0.1048413, 1, 0.5411765, 0, 1,
-1.524271, -1.183316, -1.92061, 1, 0.5450981, 0, 1,
-1.504457, 1.155711, -2.158118, 1, 0.5529412, 0, 1,
-1.499944, 0.4080598, -0.8918838, 1, 0.5568628, 0, 1,
-1.490716, 1.605445, 1.059316, 1, 0.5647059, 0, 1,
-1.48984, -1.187823, -2.275482, 1, 0.5686275, 0, 1,
-1.470995, -1.661966, -2.14764, 1, 0.5764706, 0, 1,
-1.43838, 0.1484585, -2.24849, 1, 0.5803922, 0, 1,
-1.431733, -0.7619162, -1.73055, 1, 0.5882353, 0, 1,
-1.417987, -0.8807018, -1.713432, 1, 0.5921569, 0, 1,
-1.417706, -0.52189, -1.364296, 1, 0.6, 0, 1,
-1.408663, -0.008488279, -1.379004, 1, 0.6078432, 0, 1,
-1.408555, -0.3420984, -1.697436, 1, 0.6117647, 0, 1,
-1.399127, 0.5369466, -3.357162, 1, 0.6196079, 0, 1,
-1.398937, -1.057364, -3.209632, 1, 0.6235294, 0, 1,
-1.395391, -1.006667, -2.637164, 1, 0.6313726, 0, 1,
-1.394234, 0.1134007, -2.154069, 1, 0.6352941, 0, 1,
-1.391839, 0.5948528, -0.8807302, 1, 0.6431373, 0, 1,
-1.381713, 0.04056276, -1.427915, 1, 0.6470588, 0, 1,
-1.370919, 0.6442133, 0.1435068, 1, 0.654902, 0, 1,
-1.369334, -1.692263, -2.968888, 1, 0.6588235, 0, 1,
-1.358853, -0.5981808, -1.31645, 1, 0.6666667, 0, 1,
-1.357975, 0.4622406, -1.810834, 1, 0.6705883, 0, 1,
-1.350393, -0.6193132, -4.102556, 1, 0.6784314, 0, 1,
-1.338565, 1.350774, 0.841705, 1, 0.682353, 0, 1,
-1.336987, -1.261459, -2.0265, 1, 0.6901961, 0, 1,
-1.333266, -0.2557893, -1.552024, 1, 0.6941177, 0, 1,
-1.331785, -0.8727138, -1.602674, 1, 0.7019608, 0, 1,
-1.330422, -0.02879839, -2.278036, 1, 0.7098039, 0, 1,
-1.317164, -0.3644479, -3.119515, 1, 0.7137255, 0, 1,
-1.313699, -0.1703697, -2.610089, 1, 0.7215686, 0, 1,
-1.310601, 0.4691747, -1.064934, 1, 0.7254902, 0, 1,
-1.30859, -0.87952, -1.050308, 1, 0.7333333, 0, 1,
-1.304264, 0.9529951, -0.2066819, 1, 0.7372549, 0, 1,
-1.294819, 0.7344442, -1.349984, 1, 0.7450981, 0, 1,
-1.29273, -2.428756, -2.111403, 1, 0.7490196, 0, 1,
-1.283315, -2.02383, -2.560325, 1, 0.7568628, 0, 1,
-1.276437, -0.6879197, -3.380388, 1, 0.7607843, 0, 1,
-1.272349, 0.7660881, -1.467849, 1, 0.7686275, 0, 1,
-1.265393, -0.7014718, -1.129063, 1, 0.772549, 0, 1,
-1.245673, 0.3835548, -0.5866446, 1, 0.7803922, 0, 1,
-1.234221, 0.093124, -2.376029, 1, 0.7843137, 0, 1,
-1.229422, -0.8564075, -3.214134, 1, 0.7921569, 0, 1,
-1.222963, -0.348741, -2.836242, 1, 0.7960784, 0, 1,
-1.219197, -0.2783501, -1.579899, 1, 0.8039216, 0, 1,
-1.212958, -1.660094, -3.527512, 1, 0.8117647, 0, 1,
-1.21196, 1.109866, -0.6823657, 1, 0.8156863, 0, 1,
-1.205996, 1.409401, -0.243054, 1, 0.8235294, 0, 1,
-1.197622, -1.274824, -2.285704, 1, 0.827451, 0, 1,
-1.189911, -1.978818, -3.27653, 1, 0.8352941, 0, 1,
-1.188889, 1.28453, 1.623567, 1, 0.8392157, 0, 1,
-1.185142, 0.5368849, -2.08227, 1, 0.8470588, 0, 1,
-1.176785, 1.848367, -1.062425, 1, 0.8509804, 0, 1,
-1.153024, -0.1951617, -1.025216, 1, 0.8588235, 0, 1,
-1.152673, 0.3779923, -2.234233, 1, 0.8627451, 0, 1,
-1.151066, -2.043358, -0.5394852, 1, 0.8705882, 0, 1,
-1.150362, 0.2297419, -3.237191, 1, 0.8745098, 0, 1,
-1.146414, -1.302263, -2.760583, 1, 0.8823529, 0, 1,
-1.143706, 0.9290037, 0.6170616, 1, 0.8862745, 0, 1,
-1.133319, -0.2328642, -1.515179, 1, 0.8941177, 0, 1,
-1.127951, -0.06214967, -3.53844, 1, 0.8980392, 0, 1,
-1.124665, -0.5107921, -3.2054, 1, 0.9058824, 0, 1,
-1.11868, 0.5769988, -0.2540195, 1, 0.9137255, 0, 1,
-1.112505, -0.5587142, -2.161701, 1, 0.9176471, 0, 1,
-1.112367, 0.05085001, -2.341549, 1, 0.9254902, 0, 1,
-1.103483, -1.355019, -4.167084, 1, 0.9294118, 0, 1,
-1.079432, -0.1710639, -2.198387, 1, 0.9372549, 0, 1,
-1.078194, -0.3235205, -2.216827, 1, 0.9411765, 0, 1,
-1.078118, 0.5270408, 0.2810018, 1, 0.9490196, 0, 1,
-1.077714, 0.4538276, -0.9543361, 1, 0.9529412, 0, 1,
-1.065573, 0.403266, -1.621529, 1, 0.9607843, 0, 1,
-1.062119, -1.773668, -2.819591, 1, 0.9647059, 0, 1,
-1.056909, 0.4592882, 0.5069639, 1, 0.972549, 0, 1,
-1.053599, 3.474011, -3.309609, 1, 0.9764706, 0, 1,
-1.0437, 1.295949, -1.089945, 1, 0.9843137, 0, 1,
-1.042363, 0.004409869, -1.364126, 1, 0.9882353, 0, 1,
-1.039634, 0.6904325, -3.079806, 1, 0.9960784, 0, 1,
-1.037735, -1.167584, -3.559517, 0.9960784, 1, 0, 1,
-1.033545, 0.001523468, -1.439602, 0.9921569, 1, 0, 1,
-1.022615, 2.150714, -1.266803, 0.9843137, 1, 0, 1,
-1.010762, 0.0331143, -1.823698, 0.9803922, 1, 0, 1,
-1.00676, 0.8368849, -1.095497, 0.972549, 1, 0, 1,
-0.994897, -0.5402834, -2.304565, 0.9686275, 1, 0, 1,
-0.9907589, -0.4430669, -3.193618, 0.9607843, 1, 0, 1,
-0.9887859, -0.3552547, -1.992844, 0.9568627, 1, 0, 1,
-0.981027, -0.9644338, -2.53557, 0.9490196, 1, 0, 1,
-0.9628874, 0.8400061, -1.263072, 0.945098, 1, 0, 1,
-0.9594533, 0.8608115, -0.1654723, 0.9372549, 1, 0, 1,
-0.9488141, 1.307599, 0.4004712, 0.9333333, 1, 0, 1,
-0.9485892, 1.119426, -0.5267116, 0.9254902, 1, 0, 1,
-0.9467883, 0.5765102, -1.170004, 0.9215686, 1, 0, 1,
-0.9451494, -0.1492031, -1.543123, 0.9137255, 1, 0, 1,
-0.9414988, 2.130065, -0.3295013, 0.9098039, 1, 0, 1,
-0.9391285, 0.2095179, -0.9650149, 0.9019608, 1, 0, 1,
-0.9381722, -0.3219275, -0.9844669, 0.8941177, 1, 0, 1,
-0.9318607, -0.4884397, -2.579605, 0.8901961, 1, 0, 1,
-0.9303511, 0.2237189, -0.7888302, 0.8823529, 1, 0, 1,
-0.9152994, -0.9542471, -1.584443, 0.8784314, 1, 0, 1,
-0.9146346, -1.883064, -1.697414, 0.8705882, 1, 0, 1,
-0.9062939, 2.972812, -0.6919383, 0.8666667, 1, 0, 1,
-0.9018362, -0.665215, -2.477038, 0.8588235, 1, 0, 1,
-0.9017308, 2.175818, -0.6090236, 0.854902, 1, 0, 1,
-0.8915191, -1.330461, -3.869961, 0.8470588, 1, 0, 1,
-0.889221, -0.07503439, -1.900162, 0.8431373, 1, 0, 1,
-0.8879863, -1.413339, -3.469107, 0.8352941, 1, 0, 1,
-0.8824234, -1.464498, -2.747511, 0.8313726, 1, 0, 1,
-0.8686587, -0.03989914, -0.5187256, 0.8235294, 1, 0, 1,
-0.8680832, 0.6996841, -1.372356, 0.8196079, 1, 0, 1,
-0.8676956, -0.1361463, -2.182108, 0.8117647, 1, 0, 1,
-0.8675388, 0.9165537, -0.6694345, 0.8078431, 1, 0, 1,
-0.8632312, -1.69618, -3.37224, 0.8, 1, 0, 1,
-0.858136, 1.062111, -0.6491819, 0.7921569, 1, 0, 1,
-0.8564802, 0.02831119, -1.47683, 0.7882353, 1, 0, 1,
-0.8561566, 0.617433, -1.67229, 0.7803922, 1, 0, 1,
-0.8526788, 0.9092662, -0.5857344, 0.7764706, 1, 0, 1,
-0.850476, 1.386592, -0.8571299, 0.7686275, 1, 0, 1,
-0.8458306, 1.998503, -1.355733, 0.7647059, 1, 0, 1,
-0.8390487, -0.2356365, -2.503151, 0.7568628, 1, 0, 1,
-0.8386469, 0.6902059, -1.29868, 0.7529412, 1, 0, 1,
-0.8384297, 2.348062, -0.3733724, 0.7450981, 1, 0, 1,
-0.8329862, -0.5909098, -1.123285, 0.7411765, 1, 0, 1,
-0.8287109, -0.3258312, -1.531211, 0.7333333, 1, 0, 1,
-0.8048176, -1.018212, -3.07561, 0.7294118, 1, 0, 1,
-0.8024273, -1.665638, -2.600693, 0.7215686, 1, 0, 1,
-0.7973241, -0.0905225, -1.814391, 0.7176471, 1, 0, 1,
-0.7922885, 0.6083674, -1.546018, 0.7098039, 1, 0, 1,
-0.791756, 0.5107063, -1.580435, 0.7058824, 1, 0, 1,
-0.7900415, -0.5103689, -1.61516, 0.6980392, 1, 0, 1,
-0.789388, -2.409077, -2.117918, 0.6901961, 1, 0, 1,
-0.7888585, -0.5120881, -0.9429258, 0.6862745, 1, 0, 1,
-0.7803208, 1.437122, -1.464106, 0.6784314, 1, 0, 1,
-0.7729219, -1.908286, -2.0377, 0.6745098, 1, 0, 1,
-0.7729133, -1.256652, -2.650594, 0.6666667, 1, 0, 1,
-0.7703316, -0.1155301, -1.707305, 0.6627451, 1, 0, 1,
-0.7679445, 1.263226, -0.002616019, 0.654902, 1, 0, 1,
-0.7677738, -2.40809, -2.855678, 0.6509804, 1, 0, 1,
-0.7667409, -0.5777537, -1.935563, 0.6431373, 1, 0, 1,
-0.7649111, 0.4215354, -2.827069, 0.6392157, 1, 0, 1,
-0.7644468, 0.1373846, -0.7515025, 0.6313726, 1, 0, 1,
-0.7610903, -1.400181, -3.815916, 0.627451, 1, 0, 1,
-0.7604147, -0.2906238, -3.37763, 0.6196079, 1, 0, 1,
-0.7602299, 0.8555285, -3.368278, 0.6156863, 1, 0, 1,
-0.7599937, 0.2704163, -0.5086983, 0.6078432, 1, 0, 1,
-0.7597325, 0.9070082, -1.936571, 0.6039216, 1, 0, 1,
-0.7513119, -0.540038, -1.881438, 0.5960785, 1, 0, 1,
-0.7508869, 0.8152276, 0.8300447, 0.5882353, 1, 0, 1,
-0.7485625, -0.4488344, -2.454223, 0.5843138, 1, 0, 1,
-0.7322589, 0.2549527, -1.57137, 0.5764706, 1, 0, 1,
-0.7311931, -2.532877, -3.503623, 0.572549, 1, 0, 1,
-0.7306092, -1.792987, -2.464961, 0.5647059, 1, 0, 1,
-0.7299714, -0.556262, -2.611016, 0.5607843, 1, 0, 1,
-0.7225628, 0.6588537, -1.254061, 0.5529412, 1, 0, 1,
-0.7200109, 1.505611, -1.091464, 0.5490196, 1, 0, 1,
-0.7072269, 0.5177099, -0.9967676, 0.5411765, 1, 0, 1,
-0.7063485, 0.497911, 0.2136939, 0.5372549, 1, 0, 1,
-0.7049909, -0.7797524, -4.071821, 0.5294118, 1, 0, 1,
-0.7040485, 0.8722441, -0.77869, 0.5254902, 1, 0, 1,
-0.702199, -0.2146834, -0.9923506, 0.5176471, 1, 0, 1,
-0.6990975, -0.006732091, -0.177739, 0.5137255, 1, 0, 1,
-0.6929374, -0.0123838, -2.304698, 0.5058824, 1, 0, 1,
-0.6899693, -0.2389649, -2.196808, 0.5019608, 1, 0, 1,
-0.6831925, -0.9601374, -1.569818, 0.4941176, 1, 0, 1,
-0.6828254, -0.9220007, -3.14575, 0.4862745, 1, 0, 1,
-0.6828124, -1.100249, -3.212255, 0.4823529, 1, 0, 1,
-0.6819004, -1.701266, -3.004317, 0.4745098, 1, 0, 1,
-0.6797386, 0.05963942, -1.170043, 0.4705882, 1, 0, 1,
-0.6782593, -1.084473, -2.834411, 0.4627451, 1, 0, 1,
-0.6748433, -0.9897382, -4.205443, 0.4588235, 1, 0, 1,
-0.6748367, -0.8418916, -2.196481, 0.4509804, 1, 0, 1,
-0.6710957, -0.9758345, -2.857708, 0.4470588, 1, 0, 1,
-0.6705967, -0.5336819, -1.445071, 0.4392157, 1, 0, 1,
-0.669322, -0.5181723, -1.91799, 0.4352941, 1, 0, 1,
-0.6673068, -1.37701, -3.235915, 0.427451, 1, 0, 1,
-0.6668776, 1.346218, 1.142818, 0.4235294, 1, 0, 1,
-0.6638911, -0.887286, -1.986047, 0.4156863, 1, 0, 1,
-0.6590945, 0.5299633, -0.4340838, 0.4117647, 1, 0, 1,
-0.6547001, 0.7792965, -0.6865316, 0.4039216, 1, 0, 1,
-0.654637, -0.9468872, -2.827269, 0.3960784, 1, 0, 1,
-0.6380392, 0.2751264, -0.7518514, 0.3921569, 1, 0, 1,
-0.6374989, -1.856779, -3.65929, 0.3843137, 1, 0, 1,
-0.636849, -1.452999, -2.298282, 0.3803922, 1, 0, 1,
-0.6363806, -0.9835804, -0.0678352, 0.372549, 1, 0, 1,
-0.6361105, -0.04696152, -1.98444, 0.3686275, 1, 0, 1,
-0.6332368, 0.238904, -0.27335, 0.3607843, 1, 0, 1,
-0.6320498, -0.8355421, -2.073882, 0.3568628, 1, 0, 1,
-0.6315337, -1.680379, -2.246101, 0.3490196, 1, 0, 1,
-0.6277177, 0.750195, -1.419182, 0.345098, 1, 0, 1,
-0.6276701, 0.03509587, -1.087296, 0.3372549, 1, 0, 1,
-0.6275722, 0.2235958, -0.3546583, 0.3333333, 1, 0, 1,
-0.6265585, 0.2155081, 1.070097, 0.3254902, 1, 0, 1,
-0.6240427, 0.9116686, -1.545207, 0.3215686, 1, 0, 1,
-0.620924, 0.1261631, -1.861357, 0.3137255, 1, 0, 1,
-0.6135963, 0.2981368, -2.92783, 0.3098039, 1, 0, 1,
-0.6089337, 1.460595, -1.625369, 0.3019608, 1, 0, 1,
-0.6080428, 0.202134, -0.1321035, 0.2941177, 1, 0, 1,
-0.600367, 1.119856, -1.500091, 0.2901961, 1, 0, 1,
-0.5940573, 1.886742, -0.865338, 0.282353, 1, 0, 1,
-0.5888259, -0.4343537, -2.500568, 0.2784314, 1, 0, 1,
-0.5881579, 1.713466, -0.4455405, 0.2705882, 1, 0, 1,
-0.5791262, 0.06255534, -1.740418, 0.2666667, 1, 0, 1,
-0.5781466, 1.311865, -1.40735, 0.2588235, 1, 0, 1,
-0.5764697, -0.4848024, -1.949405, 0.254902, 1, 0, 1,
-0.5756735, 2.269186, -0.2620128, 0.2470588, 1, 0, 1,
-0.5738039, 1.126621, 1.161727, 0.2431373, 1, 0, 1,
-0.5665358, -0.55496, -4.86598, 0.2352941, 1, 0, 1,
-0.5602056, -0.8512428, -4.157778, 0.2313726, 1, 0, 1,
-0.5519341, -0.1835523, -1.857598, 0.2235294, 1, 0, 1,
-0.5508592, -0.6251829, -2.799843, 0.2196078, 1, 0, 1,
-0.5471119, 1.587301, 0.6126633, 0.2117647, 1, 0, 1,
-0.5458201, 0.4150338, -1.333835, 0.2078431, 1, 0, 1,
-0.5402955, -0.5578211, -1.728007, 0.2, 1, 0, 1,
-0.5378036, 0.2555374, -0.4595465, 0.1921569, 1, 0, 1,
-0.5364372, 0.6909813, -0.2425171, 0.1882353, 1, 0, 1,
-0.5306464, -1.502694, -0.9607121, 0.1803922, 1, 0, 1,
-0.5290702, 0.6105601, -2.113995, 0.1764706, 1, 0, 1,
-0.5275062, 0.2318471, 0.6249758, 0.1686275, 1, 0, 1,
-0.5243675, 0.1685534, -2.412074, 0.1647059, 1, 0, 1,
-0.5240576, 0.2710191, -0.5528788, 0.1568628, 1, 0, 1,
-0.5122507, -0.3383029, -2.80842, 0.1529412, 1, 0, 1,
-0.5102236, -2.246505, -5.472388, 0.145098, 1, 0, 1,
-0.5055029, 0.8523882, -0.4888612, 0.1411765, 1, 0, 1,
-0.5052592, -0.819653, -2.376846, 0.1333333, 1, 0, 1,
-0.5010673, -1.295992, -3.131394, 0.1294118, 1, 0, 1,
-0.4997416, 0.9194532, -0.484742, 0.1215686, 1, 0, 1,
-0.4973133, 0.01993113, -2.270787, 0.1176471, 1, 0, 1,
-0.4958524, -1.433866, -2.438997, 0.1098039, 1, 0, 1,
-0.495607, 1.456728, 1.075542, 0.1058824, 1, 0, 1,
-0.4942735, -1.070432, -2.914923, 0.09803922, 1, 0, 1,
-0.4902425, 1.130198, 0.5910337, 0.09019608, 1, 0, 1,
-0.489743, -1.102152, -2.986424, 0.08627451, 1, 0, 1,
-0.4820597, -0.6486261, -2.551363, 0.07843138, 1, 0, 1,
-0.4795668, 0.09129402, -2.904588, 0.07450981, 1, 0, 1,
-0.4777465, -0.7704962, -4.312612, 0.06666667, 1, 0, 1,
-0.4729916, 1.220185, -2.995443, 0.0627451, 1, 0, 1,
-0.4634416, 1.910207, -1.863817, 0.05490196, 1, 0, 1,
-0.463003, -1.509237, -3.020997, 0.05098039, 1, 0, 1,
-0.4622235, 0.4773179, 0.09284507, 0.04313726, 1, 0, 1,
-0.4582616, -1.707603, -3.034018, 0.03921569, 1, 0, 1,
-0.4577615, 0.257476, -0.3793094, 0.03137255, 1, 0, 1,
-0.4571685, -1.051687, -4.904647, 0.02745098, 1, 0, 1,
-0.4553854, -0.5585011, -4.598992, 0.01960784, 1, 0, 1,
-0.4516374, -0.814678, -1.377512, 0.01568628, 1, 0, 1,
-0.4458309, -0.0129188, -1.856076, 0.007843138, 1, 0, 1,
-0.437405, -0.3102212, -2.304497, 0.003921569, 1, 0, 1,
-0.4295931, 0.1832936, -1.694419, 0, 1, 0.003921569, 1,
-0.4270495, 0.8585784, -0.7196724, 0, 1, 0.01176471, 1,
-0.424053, -0.240751, -1.765585, 0, 1, 0.01568628, 1,
-0.4229187, 0.04831911, -1.065803, 0, 1, 0.02352941, 1,
-0.4207879, -1.553343, -2.296442, 0, 1, 0.02745098, 1,
-0.4157126, -2.35324, -3.448658, 0, 1, 0.03529412, 1,
-0.4148886, 0.7621766, 0.3043084, 0, 1, 0.03921569, 1,
-0.4136598, 1.960136, -0.3790946, 0, 1, 0.04705882, 1,
-0.4062323, 0.04218078, -0.1184407, 0, 1, 0.05098039, 1,
-0.4032148, 0.6565834, 0.3208158, 0, 1, 0.05882353, 1,
-0.4005427, -0.7396123, -1.434585, 0, 1, 0.0627451, 1,
-0.3985362, -0.8843498, -1.403048, 0, 1, 0.07058824, 1,
-0.394981, -0.7197937, -2.414232, 0, 1, 0.07450981, 1,
-0.3816274, -0.08171099, -1.566952, 0, 1, 0.08235294, 1,
-0.3747063, -0.8286632, -2.602908, 0, 1, 0.08627451, 1,
-0.3715101, 0.999224, -0.9904991, 0, 1, 0.09411765, 1,
-0.370042, 0.5238182, 0.2844594, 0, 1, 0.1019608, 1,
-0.3628762, -1.241243, -2.999887, 0, 1, 0.1058824, 1,
-0.3624131, -0.7811854, -1.47329, 0, 1, 0.1137255, 1,
-0.3606105, -1.274667, -3.220167, 0, 1, 0.1176471, 1,
-0.3586772, 1.56926, 0.7558617, 0, 1, 0.1254902, 1,
-0.3585817, 1.318649, 0.1245731, 0, 1, 0.1294118, 1,
-0.356462, 0.1506644, -1.801409, 0, 1, 0.1372549, 1,
-0.3548856, 0.7845545, -2.320625, 0, 1, 0.1411765, 1,
-0.3532575, 0.4601715, 0.009840577, 0, 1, 0.1490196, 1,
-0.3492583, 0.2870806, 0.4041493, 0, 1, 0.1529412, 1,
-0.3451452, 0.04936703, -1.441822, 0, 1, 0.1607843, 1,
-0.3416938, -1.616549, -4.501082, 0, 1, 0.1647059, 1,
-0.3401029, 1.245162, 0.1723966, 0, 1, 0.172549, 1,
-0.3377024, -0.3210019, -2.51385, 0, 1, 0.1764706, 1,
-0.3368252, 0.1829958, -0.4186667, 0, 1, 0.1843137, 1,
-0.334424, -0.6272545, -1.529952, 0, 1, 0.1882353, 1,
-0.3333349, 1.6413, -0.6325175, 0, 1, 0.1960784, 1,
-0.3308624, 0.2315185, -1.011752, 0, 1, 0.2039216, 1,
-0.3296996, -2.454018, -1.405952, 0, 1, 0.2078431, 1,
-0.3290919, -0.5731843, -4.003004, 0, 1, 0.2156863, 1,
-0.328732, -0.525442, -3.164026, 0, 1, 0.2196078, 1,
-0.3270926, -0.1156639, -0.6857674, 0, 1, 0.227451, 1,
-0.3258059, -0.1878434, -2.091589, 0, 1, 0.2313726, 1,
-0.3227243, 0.05860391, 0.6844599, 0, 1, 0.2392157, 1,
-0.3213456, -1.83021, -1.691152, 0, 1, 0.2431373, 1,
-0.3190051, 0.6121446, -1.341128, 0, 1, 0.2509804, 1,
-0.3182945, -0.5150347, -1.084858, 0, 1, 0.254902, 1,
-0.3164624, 1.681074, -0.2635748, 0, 1, 0.2627451, 1,
-0.3160973, -1.219457, -3.566515, 0, 1, 0.2666667, 1,
-0.3095143, 0.2322016, 1.568297, 0, 1, 0.2745098, 1,
-0.3084792, -1.928109, -4.047439, 0, 1, 0.2784314, 1,
-0.3078642, 0.093911, -0.5447151, 0, 1, 0.2862745, 1,
-0.3069767, 1.007096, -0.7549234, 0, 1, 0.2901961, 1,
-0.3067116, -0.7542481, -2.114389, 0, 1, 0.2980392, 1,
-0.3061904, -0.7558154, -2.359533, 0, 1, 0.3058824, 1,
-0.3058084, -0.4342847, -3.766711, 0, 1, 0.3098039, 1,
-0.3053442, -0.7188353, -1.462256, 0, 1, 0.3176471, 1,
-0.2974395, 2.293723, -0.7103899, 0, 1, 0.3215686, 1,
-0.2964311, -0.6352692, -2.653615, 0, 1, 0.3294118, 1,
-0.2947312, -0.8590938, -1.603709, 0, 1, 0.3333333, 1,
-0.2944901, 0.6111512, -1.5665, 0, 1, 0.3411765, 1,
-0.2929927, 2.233949, 2.197205, 0, 1, 0.345098, 1,
-0.2922037, 0.1211888, -0.8758349, 0, 1, 0.3529412, 1,
-0.2904506, -0.3384914, -1.13706, 0, 1, 0.3568628, 1,
-0.2864845, 0.1904943, -0.9323633, 0, 1, 0.3647059, 1,
-0.2853523, 1.155846, -0.1617293, 0, 1, 0.3686275, 1,
-0.2789538, 0.4818084, -0.3854566, 0, 1, 0.3764706, 1,
-0.2745362, 1.723953, 0.0974615, 0, 1, 0.3803922, 1,
-0.2741061, 0.3017344, -2.636107, 0, 1, 0.3882353, 1,
-0.2733495, 0.08938152, -1.541939, 0, 1, 0.3921569, 1,
-0.2733297, 1.092126, 0.6652295, 0, 1, 0.4, 1,
-0.271557, 2.197958, -0.5470864, 0, 1, 0.4078431, 1,
-0.2704046, -0.6107516, -2.420717, 0, 1, 0.4117647, 1,
-0.2703569, -0.1511795, -2.184021, 0, 1, 0.4196078, 1,
-0.2646613, -1.366999, -4.114342, 0, 1, 0.4235294, 1,
-0.261627, -0.8818697, -3.304872, 0, 1, 0.4313726, 1,
-0.2541026, -1.175652, -4.415827, 0, 1, 0.4352941, 1,
-0.2464808, -1.079092, -2.786501, 0, 1, 0.4431373, 1,
-0.2298541, 0.9997206, -0.4071968, 0, 1, 0.4470588, 1,
-0.2242113, 2.038812, -1.909701, 0, 1, 0.454902, 1,
-0.2197748, -1.099313, -3.482802, 0, 1, 0.4588235, 1,
-0.219354, 0.2811214, -1.183681, 0, 1, 0.4666667, 1,
-0.2163543, 0.5076761, 0.08857185, 0, 1, 0.4705882, 1,
-0.2145028, -0.3733141, -0.9015064, 0, 1, 0.4784314, 1,
-0.2134013, 1.352385, -0.4711655, 0, 1, 0.4823529, 1,
-0.2116904, 0.3712451, 0.6829475, 0, 1, 0.4901961, 1,
-0.2102047, 0.6387397, -0.1208943, 0, 1, 0.4941176, 1,
-0.209713, -1.224527, -1.736222, 0, 1, 0.5019608, 1,
-0.2095233, -0.7169542, -3.457559, 0, 1, 0.509804, 1,
-0.2059933, 0.4382279, 0.932994, 0, 1, 0.5137255, 1,
-0.2030175, -0.3066297, -3.314469, 0, 1, 0.5215687, 1,
-0.2022643, -1.013822, -1.930678, 0, 1, 0.5254902, 1,
-0.1969154, -0.1338605, -3.365969, 0, 1, 0.5333334, 1,
-0.1919781, 0.2261923, -0.6177179, 0, 1, 0.5372549, 1,
-0.1908948, 0.9425924, -0.558325, 0, 1, 0.5450981, 1,
-0.1901463, 0.792917, 1.075892, 0, 1, 0.5490196, 1,
-0.1901132, 0.3440981, 0.5622663, 0, 1, 0.5568628, 1,
-0.1895841, 0.9927235, -1.994864, 0, 1, 0.5607843, 1,
-0.1877345, 1.797568, 0.5923655, 0, 1, 0.5686275, 1,
-0.1817339, 0.2803428, -1.527266, 0, 1, 0.572549, 1,
-0.1808251, -0.7548979, -2.339562, 0, 1, 0.5803922, 1,
-0.1805927, -1.055493, -3.099308, 0, 1, 0.5843138, 1,
-0.1794779, 1.242351, -1.426687, 0, 1, 0.5921569, 1,
-0.1784609, -0.8669007, -3.125802, 0, 1, 0.5960785, 1,
-0.1763233, -0.9080281, -3.794825, 0, 1, 0.6039216, 1,
-0.1720805, -0.2621735, -2.9666, 0, 1, 0.6117647, 1,
-0.1685313, -0.8769729, -4.11461, 0, 1, 0.6156863, 1,
-0.1611265, 1.43144, -0.7802905, 0, 1, 0.6235294, 1,
-0.1608037, -1.052839, -4.281391, 0, 1, 0.627451, 1,
-0.1577098, -0.06775589, -0.6113598, 0, 1, 0.6352941, 1,
-0.1569943, 0.3761737, 0.3223276, 0, 1, 0.6392157, 1,
-0.1554992, 0.8198284, -0.1024629, 0, 1, 0.6470588, 1,
-0.1534857, -1.103695, -4.651448, 0, 1, 0.6509804, 1,
-0.1530168, 0.2404091, 1.030962, 0, 1, 0.6588235, 1,
-0.1507964, -0.3820263, -4.089566, 0, 1, 0.6627451, 1,
-0.1498826, 1.451356, -0.4359465, 0, 1, 0.6705883, 1,
-0.1458068, -0.7899287, -3.757623, 0, 1, 0.6745098, 1,
-0.1446323, -0.403005, -2.971608, 0, 1, 0.682353, 1,
-0.1441237, -0.9017376, -3.056286, 0, 1, 0.6862745, 1,
-0.1386719, 1.090732, -0.3760408, 0, 1, 0.6941177, 1,
-0.1370487, -1.343536, -2.408647, 0, 1, 0.7019608, 1,
-0.13631, -0.07878679, -2.680777, 0, 1, 0.7058824, 1,
-0.130756, -1.184268, -1.355922, 0, 1, 0.7137255, 1,
-0.129962, 0.7119128, -0.3945952, 0, 1, 0.7176471, 1,
-0.1292085, -1.770262, -2.34299, 0, 1, 0.7254902, 1,
-0.1260434, 0.5409285, 1.133791, 0, 1, 0.7294118, 1,
-0.1258847, -1.153572, -4.989202, 0, 1, 0.7372549, 1,
-0.1249055, -0.6475632, -2.532758, 0, 1, 0.7411765, 1,
-0.1179498, -0.7751408, -0.2299381, 0, 1, 0.7490196, 1,
-0.1124704, -0.5231115, -3.3251, 0, 1, 0.7529412, 1,
-0.1121866, -0.5732038, -2.917612, 0, 1, 0.7607843, 1,
-0.1103984, -1.49005, -3.340418, 0, 1, 0.7647059, 1,
-0.1032285, -0.235063, -3.5405, 0, 1, 0.772549, 1,
-0.1000579, -0.4287149, -2.886403, 0, 1, 0.7764706, 1,
-0.09801346, -0.4878002, -1.576447, 0, 1, 0.7843137, 1,
-0.09253298, 0.2168364, -1.550581, 0, 1, 0.7882353, 1,
-0.08951104, -0.3762912, -3.020888, 0, 1, 0.7960784, 1,
-0.08932505, -0.3631351, -2.218164, 0, 1, 0.8039216, 1,
-0.08804876, -0.419242, -1.562773, 0, 1, 0.8078431, 1,
-0.08804128, 0.8952939, -0.5000269, 0, 1, 0.8156863, 1,
-0.08585095, 0.4951708, 1.113713, 0, 1, 0.8196079, 1,
-0.08521356, 1.152481, -0.2676859, 0, 1, 0.827451, 1,
-0.08158746, -0.422514, -3.57158, 0, 1, 0.8313726, 1,
-0.08099617, -0.08464013, -1.907185, 0, 1, 0.8392157, 1,
-0.08033052, 0.9780856, -1.381391, 0, 1, 0.8431373, 1,
-0.07792775, -3.129446, -2.346831, 0, 1, 0.8509804, 1,
-0.07654674, 0.5622913, -2.390226, 0, 1, 0.854902, 1,
-0.07252328, 1.573856, 0.9211046, 0, 1, 0.8627451, 1,
-0.0673677, 0.2488185, -1.057428, 0, 1, 0.8666667, 1,
-0.06516808, -1.03348, -2.991352, 0, 1, 0.8745098, 1,
-0.0646075, 0.3551306, 0.7425959, 0, 1, 0.8784314, 1,
-0.06206901, 1.359404, -0.2079078, 0, 1, 0.8862745, 1,
-0.06174111, -0.07618301, -1.509279, 0, 1, 0.8901961, 1,
-0.05863298, -0.779986, -3.86383, 0, 1, 0.8980392, 1,
-0.05789102, 1.268863, 1.629438, 0, 1, 0.9058824, 1,
-0.05519563, 0.8149641, -1.749961, 0, 1, 0.9098039, 1,
-0.05085956, -0.4153519, -2.985501, 0, 1, 0.9176471, 1,
-0.04838603, -0.3204469, -3.397115, 0, 1, 0.9215686, 1,
-0.04775666, -0.01592272, -1.405875, 0, 1, 0.9294118, 1,
-0.04688314, 2.500671, 0.4168142, 0, 1, 0.9333333, 1,
-0.04363274, -1.527042, -1.701943, 0, 1, 0.9411765, 1,
-0.04153588, -0.3669636, -0.7163876, 0, 1, 0.945098, 1,
-0.04127085, 0.02274243, -0.8227298, 0, 1, 0.9529412, 1,
-0.03959879, 0.4393975, -0.8854603, 0, 1, 0.9568627, 1,
-0.03776931, 0.3544128, -1.269325, 0, 1, 0.9647059, 1,
-0.03128618, -1.184326, -4.756443, 0, 1, 0.9686275, 1,
-0.02558747, -1.285855, -5.251493, 0, 1, 0.9764706, 1,
-0.01744891, 0.9615057, -2.95919, 0, 1, 0.9803922, 1,
-0.01736458, 2.3877, -0.3287585, 0, 1, 0.9882353, 1,
-0.01625764, 0.8598213, 0.407874, 0, 1, 0.9921569, 1,
-0.01001049, -0.72815, -4.470939, 0, 1, 1, 1,
-0.009668827, -0.3013606, -3.810071, 0, 0.9921569, 1, 1,
-0.009351333, -0.1220296, -2.452425, 0, 0.9882353, 1, 1,
-0.006785708, -1.305606, -4.099137, 0, 0.9803922, 1, 1,
-0.002778736, -0.03337969, -1.317793, 0, 0.9764706, 1, 1,
-0.002733658, 0.3411966, 0.3802258, 0, 0.9686275, 1, 1,
-0.002551242, -0.1809015, -4.431891, 0, 0.9647059, 1, 1,
0.0006038755, -0.3351588, 3.055223, 0, 0.9568627, 1, 1,
0.005986478, 0.2409988, -1.171413, 0, 0.9529412, 1, 1,
0.006952363, -0.8053073, 3.995543, 0, 0.945098, 1, 1,
0.007409706, 1.493781, 1.130428, 0, 0.9411765, 1, 1,
0.01432869, 0.1598623, -1.796384, 0, 0.9333333, 1, 1,
0.01935313, -0.2763243, 2.180712, 0, 0.9294118, 1, 1,
0.02033051, -0.1022502, 4.223999, 0, 0.9215686, 1, 1,
0.02108485, 0.7626472, -0.9618458, 0, 0.9176471, 1, 1,
0.02215273, 1.317085, 0.8059385, 0, 0.9098039, 1, 1,
0.02358337, -0.3120592, 4.217999, 0, 0.9058824, 1, 1,
0.02632044, -1.800785, 2.198766, 0, 0.8980392, 1, 1,
0.02850614, -1.318404, 4.346477, 0, 0.8901961, 1, 1,
0.03298364, -1.456425, 2.277178, 0, 0.8862745, 1, 1,
0.03433352, 0.9284968, -1.227515, 0, 0.8784314, 1, 1,
0.03764613, 0.3312372, -0.0332316, 0, 0.8745098, 1, 1,
0.03951942, 0.9756975, -0.01070486, 0, 0.8666667, 1, 1,
0.04137591, 1.370675, 1.060728, 0, 0.8627451, 1, 1,
0.04169891, -0.9748144, 1.483575, 0, 0.854902, 1, 1,
0.04362341, 0.9558395, 0.1461644, 0, 0.8509804, 1, 1,
0.04489979, 0.5012017, -0.149064, 0, 0.8431373, 1, 1,
0.04793959, -0.3226341, 3.553293, 0, 0.8392157, 1, 1,
0.04834065, 1.232981, 0.9145537, 0, 0.8313726, 1, 1,
0.04993252, -1.30502, 3.358742, 0, 0.827451, 1, 1,
0.05239451, -0.5142543, 5.078411, 0, 0.8196079, 1, 1,
0.05918298, -2.075448, 3.925768, 0, 0.8156863, 1, 1,
0.05967486, -1.167628, 2.74909, 0, 0.8078431, 1, 1,
0.05978203, 0.1442163, 1.694809, 0, 0.8039216, 1, 1,
0.06062082, 0.2355151, 1.111963, 0, 0.7960784, 1, 1,
0.06134081, 0.1727499, 0.4467988, 0, 0.7882353, 1, 1,
0.06148285, 0.1532034, -0.4469879, 0, 0.7843137, 1, 1,
0.06264087, 1.281817, 0.4086351, 0, 0.7764706, 1, 1,
0.06285276, -0.0788238, 2.381991, 0, 0.772549, 1, 1,
0.06840461, 0.8100223, 0.6348906, 0, 0.7647059, 1, 1,
0.0714558, -0.7169243, 2.571619, 0, 0.7607843, 1, 1,
0.07324971, 0.1478708, -0.1474386, 0, 0.7529412, 1, 1,
0.07471747, -0.2084268, 1.672725, 0, 0.7490196, 1, 1,
0.07944794, 0.3951522, -0.9510997, 0, 0.7411765, 1, 1,
0.08737819, -1.996862, 2.757077, 0, 0.7372549, 1, 1,
0.09287974, 0.2885105, -0.945004, 0, 0.7294118, 1, 1,
0.09869786, 0.06139086, 2.343051, 0, 0.7254902, 1, 1,
0.09923156, -0.2789236, 0.9766343, 0, 0.7176471, 1, 1,
0.09962014, 0.4248914, 1.298782, 0, 0.7137255, 1, 1,
0.1018261, -0.2436648, 2.288095, 0, 0.7058824, 1, 1,
0.1021182, -1.376567, 2.909697, 0, 0.6980392, 1, 1,
0.1043365, -1.514859, 2.089806, 0, 0.6941177, 1, 1,
0.1044942, 1.814099, 1.564936, 0, 0.6862745, 1, 1,
0.107737, 1.066851, -0.1160745, 0, 0.682353, 1, 1,
0.1100713, -1.130162, 3.992479, 0, 0.6745098, 1, 1,
0.1102958, 0.09032564, -0.488062, 0, 0.6705883, 1, 1,
0.1106881, -0.03453066, 1.119563, 0, 0.6627451, 1, 1,
0.1115672, 0.5329145, -0.2343628, 0, 0.6588235, 1, 1,
0.1116508, -0.3133393, 3.327096, 0, 0.6509804, 1, 1,
0.1128893, -0.4634193, 4.520803, 0, 0.6470588, 1, 1,
0.1132836, 0.444549, 1.265338, 0, 0.6392157, 1, 1,
0.1174395, -1.373516, 4.089285, 0, 0.6352941, 1, 1,
0.1192067, 0.356055, 1.030424, 0, 0.627451, 1, 1,
0.1198324, 1.592778, 1.239537, 0, 0.6235294, 1, 1,
0.1210476, -0.3337891, 3.535281, 0, 0.6156863, 1, 1,
0.1231008, -0.02884028, -0.3634018, 0, 0.6117647, 1, 1,
0.1244441, 0.8910788, 0.5854537, 0, 0.6039216, 1, 1,
0.1257414, -0.7440065, 3.758236, 0, 0.5960785, 1, 1,
0.1271137, 0.03881952, 1.271376, 0, 0.5921569, 1, 1,
0.1327774, 2.069214, 0.8720639, 0, 0.5843138, 1, 1,
0.1363987, 1.692546, -0.3452109, 0, 0.5803922, 1, 1,
0.1369942, -1.958696, 1.327051, 0, 0.572549, 1, 1,
0.1393992, -0.2924583, 2.134907, 0, 0.5686275, 1, 1,
0.1406486, 0.4924652, 0.9673234, 0, 0.5607843, 1, 1,
0.1441739, -1.47211, 2.510861, 0, 0.5568628, 1, 1,
0.1444675, 1.223921, 0.1512275, 0, 0.5490196, 1, 1,
0.1454339, -0.6967936, 1.854019, 0, 0.5450981, 1, 1,
0.1476183, 0.09794533, 2.352893, 0, 0.5372549, 1, 1,
0.1480543, 0.3703882, -0.1268133, 0, 0.5333334, 1, 1,
0.1530163, -0.9163423, 2.8526, 0, 0.5254902, 1, 1,
0.1538012, 1.74197, -0.908257, 0, 0.5215687, 1, 1,
0.1580138, 1.500234, -0.3169722, 0, 0.5137255, 1, 1,
0.1596048, 2.216594, -0.6713632, 0, 0.509804, 1, 1,
0.1631199, 0.8102018, 0.4744546, 0, 0.5019608, 1, 1,
0.1631879, -0.3933421, 2.735169, 0, 0.4941176, 1, 1,
0.1663784, -0.2486295, 4.530578, 0, 0.4901961, 1, 1,
0.1714672, 0.7872262, 0.0163705, 0, 0.4823529, 1, 1,
0.1722215, -0.3657128, 1.796497, 0, 0.4784314, 1, 1,
0.1725982, -0.6793999, 2.346125, 0, 0.4705882, 1, 1,
0.1728432, 0.5771389, -1.061189, 0, 0.4666667, 1, 1,
0.177841, -0.9117134, 3.771534, 0, 0.4588235, 1, 1,
0.1782921, -0.7224125, 3.911572, 0, 0.454902, 1, 1,
0.1826688, -0.7593181, 3.783633, 0, 0.4470588, 1, 1,
0.1842147, -0.5673389, 1.058628, 0, 0.4431373, 1, 1,
0.1879385, 1.763343, 0.6385025, 0, 0.4352941, 1, 1,
0.1929827, -1.212795, 3.059757, 0, 0.4313726, 1, 1,
0.1934621, -1.016579, 2.379348, 0, 0.4235294, 1, 1,
0.1971956, -0.3854857, 3.284832, 0, 0.4196078, 1, 1,
0.1982291, 1.842728, 1.375509, 0, 0.4117647, 1, 1,
0.2030219, -1.386487, 2.141013, 0, 0.4078431, 1, 1,
0.203844, 0.8813777, 0.2545563, 0, 0.4, 1, 1,
0.2053859, 0.5668684, 2.521612, 0, 0.3921569, 1, 1,
0.2074154, 0.4164881, 0.1497596, 0, 0.3882353, 1, 1,
0.2133923, -0.3246016, 1.298374, 0, 0.3803922, 1, 1,
0.2137579, 2.213818, -1.355785, 0, 0.3764706, 1, 1,
0.2142148, -0.6926191, 4.059711, 0, 0.3686275, 1, 1,
0.2254568, 0.3624013, 0.5980048, 0, 0.3647059, 1, 1,
0.2273509, -0.3345092, 1.347567, 0, 0.3568628, 1, 1,
0.2279847, 1.454194, -0.985612, 0, 0.3529412, 1, 1,
0.243084, -1.015689, 1.788803, 0, 0.345098, 1, 1,
0.2445484, -1.422549, 2.56171, 0, 0.3411765, 1, 1,
0.2489164, -1.111297, 2.706588, 0, 0.3333333, 1, 1,
0.2535418, 1.22892, 0.9328647, 0, 0.3294118, 1, 1,
0.2539013, -0.5996008, 2.054128, 0, 0.3215686, 1, 1,
0.2543992, -0.6265701, 2.301801, 0, 0.3176471, 1, 1,
0.2545605, 0.07599661, 0.9697481, 0, 0.3098039, 1, 1,
0.2568416, -0.300537, 2.073611, 0, 0.3058824, 1, 1,
0.2584329, 1.124253, -0.5717447, 0, 0.2980392, 1, 1,
0.2625178, -0.3064328, 2.782258, 0, 0.2901961, 1, 1,
0.2657764, 1.233638, 1.378811, 0, 0.2862745, 1, 1,
0.2797559, 1.486933, 0.6103244, 0, 0.2784314, 1, 1,
0.2897029, -1.456283, 4.647234, 0, 0.2745098, 1, 1,
0.2927954, 0.49788, 0.2658952, 0, 0.2666667, 1, 1,
0.2933711, 0.857603, -1.140188, 0, 0.2627451, 1, 1,
0.3036308, -1.752329, 1.141515, 0, 0.254902, 1, 1,
0.3057137, 1.678237, 1.658682, 0, 0.2509804, 1, 1,
0.3086253, 1.09762, -1.775746, 0, 0.2431373, 1, 1,
0.3088412, 1.040352, -0.7991312, 0, 0.2392157, 1, 1,
0.3119882, 0.3664559, 2.543037, 0, 0.2313726, 1, 1,
0.3146309, 0.9371202, -1.772917, 0, 0.227451, 1, 1,
0.3167116, -0.1487344, 1.856234, 0, 0.2196078, 1, 1,
0.3180893, -1.295042, 2.315424, 0, 0.2156863, 1, 1,
0.318206, 0.2297657, 1.815768, 0, 0.2078431, 1, 1,
0.3197032, 1.438152, -0.6044461, 0, 0.2039216, 1, 1,
0.3211379, 0.9540508, 0.9798155, 0, 0.1960784, 1, 1,
0.3237762, -0.3783072, 2.337129, 0, 0.1882353, 1, 1,
0.3286279, 1.466371, 1.301072, 0, 0.1843137, 1, 1,
0.3324255, -0.651954, 4.18153, 0, 0.1764706, 1, 1,
0.3342079, -0.8230593, 2.227576, 0, 0.172549, 1, 1,
0.3366983, -0.7305312, 1.560957, 0, 0.1647059, 1, 1,
0.3427761, -1.269684, 3.818999, 0, 0.1607843, 1, 1,
0.3492734, -0.5405802, 2.287379, 0, 0.1529412, 1, 1,
0.3580029, -1.095979, 3.322085, 0, 0.1490196, 1, 1,
0.3583789, -2.246686, 3.660501, 0, 0.1411765, 1, 1,
0.3599871, 0.5384513, 2.842977, 0, 0.1372549, 1, 1,
0.3606944, 1.98154, 0.6582131, 0, 0.1294118, 1, 1,
0.3632249, 1.027477, -0.5121505, 0, 0.1254902, 1, 1,
0.3653749, -0.03096145, 0.7573326, 0, 0.1176471, 1, 1,
0.3658814, -0.5713894, 3.105742, 0, 0.1137255, 1, 1,
0.3770582, -2.292135, 2.381158, 0, 0.1058824, 1, 1,
0.377307, -0.840231, 1.91404, 0, 0.09803922, 1, 1,
0.3814406, 0.8127033, 1.281363, 0, 0.09411765, 1, 1,
0.3872052, -0.6461945, 3.153081, 0, 0.08627451, 1, 1,
0.3908198, -1.849752, 2.71358, 0, 0.08235294, 1, 1,
0.3935647, -1.767462, 4.892182, 0, 0.07450981, 1, 1,
0.395414, -0.8986287, 2.742043, 0, 0.07058824, 1, 1,
0.3977004, 0.2268857, 0.7783903, 0, 0.0627451, 1, 1,
0.3998965, -0.09869136, 2.544863, 0, 0.05882353, 1, 1,
0.4013928, -2.008747, 2.960773, 0, 0.05098039, 1, 1,
0.402125, -0.8071365, 3.624647, 0, 0.04705882, 1, 1,
0.4082629, 0.104024, 1.033386, 0, 0.03921569, 1, 1,
0.4089637, -0.8072742, 0.5606616, 0, 0.03529412, 1, 1,
0.4098109, 0.5752663, 0.1032857, 0, 0.02745098, 1, 1,
0.4132192, 0.8144808, 0.8774956, 0, 0.02352941, 1, 1,
0.4226609, -2.60197, 3.467233, 0, 0.01568628, 1, 1,
0.4238203, -0.717078, 2.812092, 0, 0.01176471, 1, 1,
0.4241193, -0.4344566, 0.5595221, 0, 0.003921569, 1, 1,
0.426511, 0.4996201, 0.6550482, 0.003921569, 0, 1, 1,
0.4265637, -1.084566, 4.396117, 0.007843138, 0, 1, 1,
0.4302481, 0.5094386, 0.6732258, 0.01568628, 0, 1, 1,
0.436073, 0.09169634, 1.980778, 0.01960784, 0, 1, 1,
0.4443625, 1.345978, 0.503097, 0.02745098, 0, 1, 1,
0.4452487, 1.077487, 1.769114, 0.03137255, 0, 1, 1,
0.4530973, -0.3955031, 4.529133, 0.03921569, 0, 1, 1,
0.4534021, -0.3747162, 2.067194, 0.04313726, 0, 1, 1,
0.4550824, -0.5753426, 0.5185499, 0.05098039, 0, 1, 1,
0.4564214, 0.4300379, 0.572323, 0.05490196, 0, 1, 1,
0.4581736, -0.3688705, 2.498163, 0.0627451, 0, 1, 1,
0.4589563, 0.2866044, 1.431858, 0.06666667, 0, 1, 1,
0.4613721, 0.6001514, -0.3812995, 0.07450981, 0, 1, 1,
0.4623493, 0.2228335, 0.4704794, 0.07843138, 0, 1, 1,
0.4659844, 0.6171314, 0.1787161, 0.08627451, 0, 1, 1,
0.4713078, 0.4369602, 1.608261, 0.09019608, 0, 1, 1,
0.4789458, 0.4308625, 1.419811, 0.09803922, 0, 1, 1,
0.4799872, 0.7040759, 0.371025, 0.1058824, 0, 1, 1,
0.4805527, -1.016683, 2.335298, 0.1098039, 0, 1, 1,
0.4812868, -1.42469, 5.514094, 0.1176471, 0, 1, 1,
0.4856295, 1.026961, -0.3922975, 0.1215686, 0, 1, 1,
0.4869563, -0.2430148, 2.381144, 0.1294118, 0, 1, 1,
0.4874331, -0.353102, -0.4793668, 0.1333333, 0, 1, 1,
0.4879875, -0.940707, 2.570497, 0.1411765, 0, 1, 1,
0.4911212, 2.618352, 1.885532, 0.145098, 0, 1, 1,
0.4951329, -0.2183325, 3.622866, 0.1529412, 0, 1, 1,
0.4981267, 1.445385, -1.66806, 0.1568628, 0, 1, 1,
0.5064142, -0.02801562, 1.792088, 0.1647059, 0, 1, 1,
0.5066603, 0.2610061, 1.175142, 0.1686275, 0, 1, 1,
0.5083568, -0.3474855, 4.207571, 0.1764706, 0, 1, 1,
0.5131632, 0.03447602, 0.8905292, 0.1803922, 0, 1, 1,
0.515854, 1.240375, 1.99032, 0.1882353, 0, 1, 1,
0.5202023, -0.6672908, 2.677835, 0.1921569, 0, 1, 1,
0.5242934, -0.1084486, 1.595973, 0.2, 0, 1, 1,
0.5269864, -0.3878296, 1.062016, 0.2078431, 0, 1, 1,
0.5274091, -0.1722548, 2.832788, 0.2117647, 0, 1, 1,
0.5280562, -0.4578321, 3.292039, 0.2196078, 0, 1, 1,
0.5285454, -1.597778, 4.433273, 0.2235294, 0, 1, 1,
0.542998, 0.3258422, 1.214744, 0.2313726, 0, 1, 1,
0.5484631, 1.425388, -0.9112329, 0.2352941, 0, 1, 1,
0.5496279, -0.6570667, 2.627775, 0.2431373, 0, 1, 1,
0.55059, -0.3656768, 2.044504, 0.2470588, 0, 1, 1,
0.5520118, -1.447652, 1.713751, 0.254902, 0, 1, 1,
0.5543157, -1.93819, 2.280025, 0.2588235, 0, 1, 1,
0.5554751, -1.333451, 1.088029, 0.2666667, 0, 1, 1,
0.5564094, 0.08152097, 2.611169, 0.2705882, 0, 1, 1,
0.5566075, 1.228853, 3.052963, 0.2784314, 0, 1, 1,
0.5637133, 1.112291, -0.9262363, 0.282353, 0, 1, 1,
0.5646969, 0.2961063, 1.216553, 0.2901961, 0, 1, 1,
0.5685282, -0.1772136, 1.90184, 0.2941177, 0, 1, 1,
0.5719324, 0.1152665, 1.889285, 0.3019608, 0, 1, 1,
0.5783545, 1.1731, 1.445031, 0.3098039, 0, 1, 1,
0.5804244, -0.01681075, 2.524164, 0.3137255, 0, 1, 1,
0.5828198, 0.9629637, 0.933553, 0.3215686, 0, 1, 1,
0.5834641, 1.819121, 0.4136399, 0.3254902, 0, 1, 1,
0.5854287, 0.7324423, 3.276602, 0.3333333, 0, 1, 1,
0.587574, 1.363199, 2.50998, 0.3372549, 0, 1, 1,
0.5970276, 0.6409479, -0.7628027, 0.345098, 0, 1, 1,
0.5991877, 0.3513644, -0.2142631, 0.3490196, 0, 1, 1,
0.6054553, 0.7680292, 0.6311715, 0.3568628, 0, 1, 1,
0.6082187, 0.4846433, 2.621782, 0.3607843, 0, 1, 1,
0.6102427, 2.324347, -0.4014315, 0.3686275, 0, 1, 1,
0.6133415, 0.4995464, 1.301104, 0.372549, 0, 1, 1,
0.6180476, -0.08677547, 2.520098, 0.3803922, 0, 1, 1,
0.6282811, 0.2051997, 0.0581864, 0.3843137, 0, 1, 1,
0.6316702, -1.412266, 2.950055, 0.3921569, 0, 1, 1,
0.6338927, 0.6558538, 2.886257, 0.3960784, 0, 1, 1,
0.634612, -1.425175, 2.191803, 0.4039216, 0, 1, 1,
0.635256, 2.733549, 0.8473904, 0.4117647, 0, 1, 1,
0.6414956, 0.5272005, 1.286603, 0.4156863, 0, 1, 1,
0.6441572, 0.2883947, 3.504186, 0.4235294, 0, 1, 1,
0.6478588, 0.5407813, 3.657902, 0.427451, 0, 1, 1,
0.6696056, 1.25572, 1.063895, 0.4352941, 0, 1, 1,
0.6699828, 0.4620824, 2.813327, 0.4392157, 0, 1, 1,
0.671474, -0.6763474, 1.235929, 0.4470588, 0, 1, 1,
0.6733985, 0.7697212, 2.607144, 0.4509804, 0, 1, 1,
0.6755835, -0.789808, 2.896575, 0.4588235, 0, 1, 1,
0.6841043, 0.9663672, 0.783606, 0.4627451, 0, 1, 1,
0.6843356, -0.6997561, 2.568835, 0.4705882, 0, 1, 1,
0.6859766, -1.431445, 4.03792, 0.4745098, 0, 1, 1,
0.6881396, 0.4902326, 2.53694, 0.4823529, 0, 1, 1,
0.6897712, 0.03170272, 2.771498, 0.4862745, 0, 1, 1,
0.6926659, -0.5272003, -0.002637471, 0.4941176, 0, 1, 1,
0.6963822, -0.6083065, 2.297849, 0.5019608, 0, 1, 1,
0.6969628, 0.2051869, 0.6149638, 0.5058824, 0, 1, 1,
0.7001383, 1.335187, 0.6435508, 0.5137255, 0, 1, 1,
0.7005795, -0.3031071, 0.8046221, 0.5176471, 0, 1, 1,
0.7038963, -0.5293121, 2.923636, 0.5254902, 0, 1, 1,
0.7121454, -2.047592, 3.176478, 0.5294118, 0, 1, 1,
0.712596, 0.3390235, 1.461335, 0.5372549, 0, 1, 1,
0.7216029, -2.82681, 3.004615, 0.5411765, 0, 1, 1,
0.7288415, 0.8992798, -0.6526746, 0.5490196, 0, 1, 1,
0.7351967, 1.48047, -0.2571653, 0.5529412, 0, 1, 1,
0.7381542, -0.6287351, 2.161719, 0.5607843, 0, 1, 1,
0.7394605, 0.3196869, 0.6079661, 0.5647059, 0, 1, 1,
0.7395285, -1.201865, 3.473507, 0.572549, 0, 1, 1,
0.7434245, 1.073356, 0.7701639, 0.5764706, 0, 1, 1,
0.7465508, 0.9157168, 0.3523156, 0.5843138, 0, 1, 1,
0.7503514, -0.1248436, 1.277606, 0.5882353, 0, 1, 1,
0.7553408, 0.9452817, -0.8888249, 0.5960785, 0, 1, 1,
0.7581378, -0.7593254, 2.066051, 0.6039216, 0, 1, 1,
0.7587857, 0.5541887, 0.811412, 0.6078432, 0, 1, 1,
0.7636756, 0.2251218, 1.818825, 0.6156863, 0, 1, 1,
0.7715035, 0.1817616, 0.8549262, 0.6196079, 0, 1, 1,
0.7718658, 0.1694469, 0.3692818, 0.627451, 0, 1, 1,
0.772929, -1.819219, 2.281666, 0.6313726, 0, 1, 1,
0.7746987, -0.2378134, 2.841146, 0.6392157, 0, 1, 1,
0.7797799, 1.112106, 0.1678617, 0.6431373, 0, 1, 1,
0.7806169, -0.4143937, 1.003185, 0.6509804, 0, 1, 1,
0.7835845, 0.3405869, 1.411559, 0.654902, 0, 1, 1,
0.7849429, 1.398367, 1.327025, 0.6627451, 0, 1, 1,
0.787706, 0.07833859, 0.2399126, 0.6666667, 0, 1, 1,
0.7897373, 0.4445292, 2.326747, 0.6745098, 0, 1, 1,
0.7974044, 0.3863105, 2.217748, 0.6784314, 0, 1, 1,
0.8014615, 1.430336, -0.4582795, 0.6862745, 0, 1, 1,
0.8112398, -1.822386, 2.887195, 0.6901961, 0, 1, 1,
0.8131196, -1.363969, 3.701301, 0.6980392, 0, 1, 1,
0.8203199, -0.2170289, 2.998105, 0.7058824, 0, 1, 1,
0.8277552, 1.40204, 0.2024258, 0.7098039, 0, 1, 1,
0.835556, 0.7255386, 1.396014, 0.7176471, 0, 1, 1,
0.842693, 0.9068961, 2.013368, 0.7215686, 0, 1, 1,
0.8438674, -0.6381148, 2.777087, 0.7294118, 0, 1, 1,
0.8486341, 0.7483852, 1.920963, 0.7333333, 0, 1, 1,
0.8559523, -1.128346, 6.324253, 0.7411765, 0, 1, 1,
0.8611138, 0.2402003, 1.490304, 0.7450981, 0, 1, 1,
0.8673442, 0.533708, 1.05653, 0.7529412, 0, 1, 1,
0.8706818, -0.6952156, 1.057152, 0.7568628, 0, 1, 1,
0.8717408, 0.04559071, 1.367201, 0.7647059, 0, 1, 1,
0.8759047, -1.17653, 3.448264, 0.7686275, 0, 1, 1,
0.8775131, 0.5297108, 1.279581, 0.7764706, 0, 1, 1,
0.8811327, 0.7958248, -0.3853677, 0.7803922, 0, 1, 1,
0.8883056, 1.961904, 1.703304, 0.7882353, 0, 1, 1,
0.8904282, -0.692036, 3.09814, 0.7921569, 0, 1, 1,
0.8930525, 0.06831066, 0.3789211, 0.8, 0, 1, 1,
0.8953091, -0.2240641, -0.4839756, 0.8078431, 0, 1, 1,
0.8959474, -1.141298, 2.22345, 0.8117647, 0, 1, 1,
0.9045665, -1.68061, 1.739525, 0.8196079, 0, 1, 1,
0.9052773, 0.7833, 0.8340793, 0.8235294, 0, 1, 1,
0.9096074, -0.1958901, 2.628648, 0.8313726, 0, 1, 1,
0.9108549, -0.5998875, 3.34967, 0.8352941, 0, 1, 1,
0.9126544, -0.2830367, 1.860334, 0.8431373, 0, 1, 1,
0.9140089, 0.1266737, 3.067313, 0.8470588, 0, 1, 1,
0.9251896, 1.656365, -0.4946408, 0.854902, 0, 1, 1,
0.9271299, -0.5905738, 3.198932, 0.8588235, 0, 1, 1,
0.9272689, -0.03679305, 2.210286, 0.8666667, 0, 1, 1,
0.9389676, 0.8031613, 1.204999, 0.8705882, 0, 1, 1,
0.9424231, 1.413728, 1.537443, 0.8784314, 0, 1, 1,
0.9471997, -0.9936242, 2.44778, 0.8823529, 0, 1, 1,
0.9528871, 0.4110549, -0.03581797, 0.8901961, 0, 1, 1,
0.9643754, 0.4580967, 3.407238, 0.8941177, 0, 1, 1,
0.9688908, -0.6606285, 1.001377, 0.9019608, 0, 1, 1,
0.9713456, -1.19583, 3.081104, 0.9098039, 0, 1, 1,
0.981306, 0.7974347, 1.331109, 0.9137255, 0, 1, 1,
0.9820887, -0.1030679, 2.076829, 0.9215686, 0, 1, 1,
0.9833221, -0.1055822, 1.112398, 0.9254902, 0, 1, 1,
0.9871809, -0.7846611, 2.048482, 0.9333333, 0, 1, 1,
0.9914987, 1.134232, 0.7575306, 0.9372549, 0, 1, 1,
0.9929864, -0.04213663, 3.507997, 0.945098, 0, 1, 1,
0.9940453, 0.08177494, 2.42638, 0.9490196, 0, 1, 1,
0.995094, 1.059921, 0.4419711, 0.9568627, 0, 1, 1,
0.9970081, -0.7380682, 2.258338, 0.9607843, 0, 1, 1,
0.9992349, 0.7867828, -0.5283234, 0.9686275, 0, 1, 1,
1.001175, 0.1467667, 1.655177, 0.972549, 0, 1, 1,
1.002644, 1.638044, -0.03149074, 0.9803922, 0, 1, 1,
1.006418, -0.6576267, 4.893332, 0.9843137, 0, 1, 1,
1.008722, 1.295763, 3.061197, 0.9921569, 0, 1, 1,
1.010298, 0.6057206, 1.202596, 0.9960784, 0, 1, 1,
1.015981, 0.7390885, 0.1178825, 1, 0, 0.9960784, 1,
1.02149, -0.09367196, 2.150007, 1, 0, 0.9882353, 1,
1.027526, 0.481453, 3.220661, 1, 0, 0.9843137, 1,
1.027629, -0.1896325, 1.463987, 1, 0, 0.9764706, 1,
1.034248, 0.9867872, 1.36362, 1, 0, 0.972549, 1,
1.036058, -0.09510924, 2.694908, 1, 0, 0.9647059, 1,
1.042405, -0.5304792, 2.563628, 1, 0, 0.9607843, 1,
1.047233, 1.398603, 0.3158777, 1, 0, 0.9529412, 1,
1.051134, 2.115255, 1.127405, 1, 0, 0.9490196, 1,
1.056081, -0.0463354, 0.9996074, 1, 0, 0.9411765, 1,
1.059973, 0.9262373, 0.6212927, 1, 0, 0.9372549, 1,
1.066316, 1.261997, -1.315812, 1, 0, 0.9294118, 1,
1.066384, 1.670294, 0.01703922, 1, 0, 0.9254902, 1,
1.067106, 0.5870973, 2.999259, 1, 0, 0.9176471, 1,
1.067167, 0.7681249, 0.2325834, 1, 0, 0.9137255, 1,
1.067407, 0.92154, 1.046048, 1, 0, 0.9058824, 1,
1.071092, -0.3661893, 0.8804991, 1, 0, 0.9019608, 1,
1.071865, -1.400147, 3.990486, 1, 0, 0.8941177, 1,
1.074311, -1.083879, 1.610791, 1, 0, 0.8862745, 1,
1.079711, 0.9514578, 2.429341, 1, 0, 0.8823529, 1,
1.085037, -0.7156422, 2.492314, 1, 0, 0.8745098, 1,
1.085286, -1.515344, 1.710787, 1, 0, 0.8705882, 1,
1.086624, 0.728655, -0.8270826, 1, 0, 0.8627451, 1,
1.087027, -0.3929517, 1.112733, 1, 0, 0.8588235, 1,
1.102409, -1.032078, 3.144922, 1, 0, 0.8509804, 1,
1.113297, -1.472131, 3.778193, 1, 0, 0.8470588, 1,
1.113889, 0.6724113, 2.599964, 1, 0, 0.8392157, 1,
1.125672, 0.3981815, 2.022877, 1, 0, 0.8352941, 1,
1.133542, -0.9195117, 3.358112, 1, 0, 0.827451, 1,
1.138357, 0.5037318, 2.618186, 1, 0, 0.8235294, 1,
1.146896, -0.8080816, 4.079449, 1, 0, 0.8156863, 1,
1.147292, -2.504563, 2.659364, 1, 0, 0.8117647, 1,
1.152046, 0.5751858, 2.108299, 1, 0, 0.8039216, 1,
1.157818, 0.8868805, 3.253474, 1, 0, 0.7960784, 1,
1.163144, -0.6911963, 2.43536, 1, 0, 0.7921569, 1,
1.166872, -0.4237292, 1.755893, 1, 0, 0.7843137, 1,
1.18244, -1.233867, 1.968295, 1, 0, 0.7803922, 1,
1.182886, -0.7827731, 0.5036643, 1, 0, 0.772549, 1,
1.194572, -1.484409, 2.480018, 1, 0, 0.7686275, 1,
1.195504, -0.5774947, 2.516637, 1, 0, 0.7607843, 1,
1.196071, -2.763912, 2.424543, 1, 0, 0.7568628, 1,
1.198736, -0.7588991, 2.511086, 1, 0, 0.7490196, 1,
1.204281, 1.6541, -0.08920305, 1, 0, 0.7450981, 1,
1.210879, -1.443762, 3.708352, 1, 0, 0.7372549, 1,
1.218485, 1.02398, -0.361056, 1, 0, 0.7333333, 1,
1.22821, -0.876124, -0.296542, 1, 0, 0.7254902, 1,
1.247494, -0.1920799, 2.694117, 1, 0, 0.7215686, 1,
1.250903, -0.1976432, 1.44995, 1, 0, 0.7137255, 1,
1.255289, -1.154475, 1.810405, 1, 0, 0.7098039, 1,
1.2565, -2.923515, 2.965069, 1, 0, 0.7019608, 1,
1.269217, 0.3281189, 2.393688, 1, 0, 0.6941177, 1,
1.276892, -1.784795, 1.768025, 1, 0, 0.6901961, 1,
1.283323, -1.319976, 2.239946, 1, 0, 0.682353, 1,
1.284602, -0.7998312, 2.53199, 1, 0, 0.6784314, 1,
1.287323, -0.06994423, 2.320243, 1, 0, 0.6705883, 1,
1.303257, -0.4691953, 2.183438, 1, 0, 0.6666667, 1,
1.304066, -0.7086893, 2.486331, 1, 0, 0.6588235, 1,
1.307878, 0.6167527, 1.592753, 1, 0, 0.654902, 1,
1.318517, -0.5662519, 2.163746, 1, 0, 0.6470588, 1,
1.318828, 1.776669, 0.4005461, 1, 0, 0.6431373, 1,
1.3261, -0.3745837, 1.536415, 1, 0, 0.6352941, 1,
1.329674, 0.9986828, -0.4871595, 1, 0, 0.6313726, 1,
1.331744, -0.04399903, 1.606993, 1, 0, 0.6235294, 1,
1.339921, 1.438751, 1.925155, 1, 0, 0.6196079, 1,
1.342709, 1.940543, 0.3049701, 1, 0, 0.6117647, 1,
1.345397, -0.2662375, 1.110864, 1, 0, 0.6078432, 1,
1.354645, -0.9182945, 3.023067, 1, 0, 0.6, 1,
1.354745, -0.1624958, -0.2349163, 1, 0, 0.5921569, 1,
1.356615, 0.7234456, 1.162801, 1, 0, 0.5882353, 1,
1.360945, 0.3373605, 1.503797, 1, 0, 0.5803922, 1,
1.390016, 2.166771, 1.17217, 1, 0, 0.5764706, 1,
1.403185, 0.5608872, 1.066754, 1, 0, 0.5686275, 1,
1.407459, -1.025723, 3.480144, 1, 0, 0.5647059, 1,
1.410737, 0.7417519, -0.2659347, 1, 0, 0.5568628, 1,
1.41443, 0.0832846, 1.338946, 1, 0, 0.5529412, 1,
1.417414, -0.008363181, -0.5215809, 1, 0, 0.5450981, 1,
1.419191, 0.5712267, -0.3234591, 1, 0, 0.5411765, 1,
1.423133, 0.1167186, 1.92867, 1, 0, 0.5333334, 1,
1.42887, -0.006738706, 0.6189373, 1, 0, 0.5294118, 1,
1.432116, 1.672163, 1.767309, 1, 0, 0.5215687, 1,
1.446854, -0.4333648, 1.265393, 1, 0, 0.5176471, 1,
1.450138, 0.06486069, 0.8771766, 1, 0, 0.509804, 1,
1.451662, -0.1169885, 1.346874, 1, 0, 0.5058824, 1,
1.455288, -0.8240494, 3.283858, 1, 0, 0.4980392, 1,
1.462891, 0.1671819, 3.483274, 1, 0, 0.4901961, 1,
1.48577, 1.708147, 1.213717, 1, 0, 0.4862745, 1,
1.486701, 0.7081016, 1.680981, 1, 0, 0.4784314, 1,
1.486984, -1.550238, 4.343762, 1, 0, 0.4745098, 1,
1.487304, -0.3611937, 1.821029, 1, 0, 0.4666667, 1,
1.496207, 1.517869, 1.584765, 1, 0, 0.4627451, 1,
1.504065, -0.05679601, 2.464923, 1, 0, 0.454902, 1,
1.505736, 0.2300505, 1.945941, 1, 0, 0.4509804, 1,
1.513058, 0.8939224, 2.479594, 1, 0, 0.4431373, 1,
1.518419, -0.2517343, 0.2402525, 1, 0, 0.4392157, 1,
1.527691, 0.004120333, 2.768789, 1, 0, 0.4313726, 1,
1.535805, -1.290257, 2.541236, 1, 0, 0.427451, 1,
1.540381, 0.02394424, 4.246749, 1, 0, 0.4196078, 1,
1.54135, -0.2646387, 1.239535, 1, 0, 0.4156863, 1,
1.553949, 0.6429645, 0.1304006, 1, 0, 0.4078431, 1,
1.561782, -1.996444, 0.5746441, 1, 0, 0.4039216, 1,
1.563735, 0.7598619, -1.039259, 1, 0, 0.3960784, 1,
1.563831, 1.638587, 1.173037, 1, 0, 0.3882353, 1,
1.578743, -1.394013, 1.599012, 1, 0, 0.3843137, 1,
1.584097, 1.166255, 1.210384, 1, 0, 0.3764706, 1,
1.587631, 0.6326506, 1.031661, 1, 0, 0.372549, 1,
1.595747, 0.8860439, 1.514166, 1, 0, 0.3647059, 1,
1.610528, -0.08692896, 1.326915, 1, 0, 0.3607843, 1,
1.624114, 0.2584986, 1.102972, 1, 0, 0.3529412, 1,
1.635937, -0.02252348, -0.04126601, 1, 0, 0.3490196, 1,
1.643227, -0.344895, 1.110009, 1, 0, 0.3411765, 1,
1.649027, 0.08406449, 0.5460582, 1, 0, 0.3372549, 1,
1.708701, -1.173205, 1.800803, 1, 0, 0.3294118, 1,
1.711004, -1.08989, 3.027721, 1, 0, 0.3254902, 1,
1.711813, 0.3309478, 2.097994, 1, 0, 0.3176471, 1,
1.715066, -0.7732, 2.328771, 1, 0, 0.3137255, 1,
1.724867, -1.621016, 2.658605, 1, 0, 0.3058824, 1,
1.737779, -0.1881012, 2.754281, 1, 0, 0.2980392, 1,
1.74078, 0.4458733, 2.112931, 1, 0, 0.2941177, 1,
1.744575, 2.053488, -1.940061, 1, 0, 0.2862745, 1,
1.747182, 0.9369638, 2.95673, 1, 0, 0.282353, 1,
1.752715, -0.7014838, 0.8904446, 1, 0, 0.2745098, 1,
1.754054, -1.126834, 1.906813, 1, 0, 0.2705882, 1,
1.767632, -0.04081154, 2.477663, 1, 0, 0.2627451, 1,
1.775284, -1.008197, 3.315533, 1, 0, 0.2588235, 1,
1.792109, -0.3825025, 2.176566, 1, 0, 0.2509804, 1,
1.822808, -0.4473126, 2.259954, 1, 0, 0.2470588, 1,
1.872867, -0.8810972, 2.114992, 1, 0, 0.2392157, 1,
1.881112, -0.174602, 0.8887582, 1, 0, 0.2352941, 1,
1.896532, 1.15823, 2.98779, 1, 0, 0.227451, 1,
1.900647, 1.515261, 0.9804293, 1, 0, 0.2235294, 1,
1.91367, -0.6286028, 2.702149, 1, 0, 0.2156863, 1,
1.925279, -1.448051, 3.070233, 1, 0, 0.2117647, 1,
1.952746, -1.006063, 2.581428, 1, 0, 0.2039216, 1,
1.957273, -1.358215, 1.019422, 1, 0, 0.1960784, 1,
1.960443, 0.01693433, 2.089442, 1, 0, 0.1921569, 1,
1.970018, -0.2237713, 1.02325, 1, 0, 0.1843137, 1,
1.997014, -0.9767621, 1.642815, 1, 0, 0.1803922, 1,
2.053968, 0.8573254, 1.414574, 1, 0, 0.172549, 1,
2.103487, -1.402922, 1.318995, 1, 0, 0.1686275, 1,
2.108949, 0.7365002, 0.9771218, 1, 0, 0.1607843, 1,
2.157717, -0.08670423, 2.695743, 1, 0, 0.1568628, 1,
2.158394, -0.5625649, 0.6217479, 1, 0, 0.1490196, 1,
2.173669, -2.097147, 1.035383, 1, 0, 0.145098, 1,
2.176, -0.2228618, 2.388073, 1, 0, 0.1372549, 1,
2.179277, 0.9306192, 1.317578, 1, 0, 0.1333333, 1,
2.243469, -0.6314524, 2.064199, 1, 0, 0.1254902, 1,
2.279721, 1.142705, 1.898887, 1, 0, 0.1215686, 1,
2.291917, 0.2182845, 3.357305, 1, 0, 0.1137255, 1,
2.314317, -0.1992609, 1.772079, 1, 0, 0.1098039, 1,
2.326643, 0.1465407, 1.81032, 1, 0, 0.1019608, 1,
2.385776, -0.7386127, 1.220307, 1, 0, 0.09411765, 1,
2.39411, 1.87542, 0.515634, 1, 0, 0.09019608, 1,
2.464119, 0.1873014, 3.134319, 1, 0, 0.08235294, 1,
2.496676, -0.6240646, -0.02802506, 1, 0, 0.07843138, 1,
2.507178, -0.5163362, 2.663587, 1, 0, 0.07058824, 1,
2.540723, -0.5922093, 1.583464, 1, 0, 0.06666667, 1,
2.575452, 2.016901, 0.8424982, 1, 0, 0.05882353, 1,
2.578741, 0.006029574, 2.663748, 1, 0, 0.05490196, 1,
2.646557, -0.6420882, 0.8346349, 1, 0, 0.04705882, 1,
2.812641, -1.008662, 2.724233, 1, 0, 0.04313726, 1,
2.817686, 1.072222, -0.4809989, 1, 0, 0.03529412, 1,
2.851559, 0.8333613, 0.6961664, 1, 0, 0.03137255, 1,
2.886297, 0.3683423, 1.889732, 1, 0, 0.02352941, 1,
3.008153, 0.7985402, 1.801217, 1, 0, 0.01960784, 1,
3.066998, 0.8315988, 1.47355, 1, 0, 0.01176471, 1,
3.116495, 0.2339658, 0.6731771, 1, 0, 0.007843138, 1
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
-0.3584622, -4.248732, -7.471919, 0, -0.5, 0.5, 0.5,
-0.3584622, -4.248732, -7.471919, 1, -0.5, 0.5, 0.5,
-0.3584622, -4.248732, -7.471919, 1, 1.5, 0.5, 0.5,
-0.3584622, -4.248732, -7.471919, 0, 1.5, 0.5, 0.5
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
-5.01143, 0.1722826, -7.471919, 0, -0.5, 0.5, 0.5,
-5.01143, 0.1722826, -7.471919, 1, -0.5, 0.5, 0.5,
-5.01143, 0.1722826, -7.471919, 1, 1.5, 0.5, 0.5,
-5.01143, 0.1722826, -7.471919, 0, 1.5, 0.5, 0.5
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
-5.01143, -4.248732, 0.4259326, 0, -0.5, 0.5, 0.5,
-5.01143, -4.248732, 0.4259326, 1, -0.5, 0.5, 0.5,
-5.01143, -4.248732, 0.4259326, 1, 1.5, 0.5, 0.5,
-5.01143, -4.248732, 0.4259326, 0, 1.5, 0.5, 0.5
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
-3, -3.228498, -5.649337,
3, -3.228498, -5.649337,
-3, -3.228498, -5.649337,
-3, -3.398537, -5.953101,
-2, -3.228498, -5.649337,
-2, -3.398537, -5.953101,
-1, -3.228498, -5.649337,
-1, -3.398537, -5.953101,
0, -3.228498, -5.649337,
0, -3.398537, -5.953101,
1, -3.228498, -5.649337,
1, -3.398537, -5.953101,
2, -3.228498, -5.649337,
2, -3.398537, -5.953101,
3, -3.228498, -5.649337,
3, -3.398537, -5.953101
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
-3, -3.738615, -6.560628, 0, -0.5, 0.5, 0.5,
-3, -3.738615, -6.560628, 1, -0.5, 0.5, 0.5,
-3, -3.738615, -6.560628, 1, 1.5, 0.5, 0.5,
-3, -3.738615, -6.560628, 0, 1.5, 0.5, 0.5,
-2, -3.738615, -6.560628, 0, -0.5, 0.5, 0.5,
-2, -3.738615, -6.560628, 1, -0.5, 0.5, 0.5,
-2, -3.738615, -6.560628, 1, 1.5, 0.5, 0.5,
-2, -3.738615, -6.560628, 0, 1.5, 0.5, 0.5,
-1, -3.738615, -6.560628, 0, -0.5, 0.5, 0.5,
-1, -3.738615, -6.560628, 1, -0.5, 0.5, 0.5,
-1, -3.738615, -6.560628, 1, 1.5, 0.5, 0.5,
-1, -3.738615, -6.560628, 0, 1.5, 0.5, 0.5,
0, -3.738615, -6.560628, 0, -0.5, 0.5, 0.5,
0, -3.738615, -6.560628, 1, -0.5, 0.5, 0.5,
0, -3.738615, -6.560628, 1, 1.5, 0.5, 0.5,
0, -3.738615, -6.560628, 0, 1.5, 0.5, 0.5,
1, -3.738615, -6.560628, 0, -0.5, 0.5, 0.5,
1, -3.738615, -6.560628, 1, -0.5, 0.5, 0.5,
1, -3.738615, -6.560628, 1, 1.5, 0.5, 0.5,
1, -3.738615, -6.560628, 0, 1.5, 0.5, 0.5,
2, -3.738615, -6.560628, 0, -0.5, 0.5, 0.5,
2, -3.738615, -6.560628, 1, -0.5, 0.5, 0.5,
2, -3.738615, -6.560628, 1, 1.5, 0.5, 0.5,
2, -3.738615, -6.560628, 0, 1.5, 0.5, 0.5,
3, -3.738615, -6.560628, 0, -0.5, 0.5, 0.5,
3, -3.738615, -6.560628, 1, -0.5, 0.5, 0.5,
3, -3.738615, -6.560628, 1, 1.5, 0.5, 0.5,
3, -3.738615, -6.560628, 0, 1.5, 0.5, 0.5
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
-3.937669, -3, -5.649337,
-3.937669, 3, -5.649337,
-3.937669, -3, -5.649337,
-4.116629, -3, -5.953101,
-3.937669, -2, -5.649337,
-4.116629, -2, -5.953101,
-3.937669, -1, -5.649337,
-4.116629, -1, -5.953101,
-3.937669, 0, -5.649337,
-4.116629, 0, -5.953101,
-3.937669, 1, -5.649337,
-4.116629, 1, -5.953101,
-3.937669, 2, -5.649337,
-4.116629, 2, -5.953101,
-3.937669, 3, -5.649337,
-4.116629, 3, -5.953101
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
-4.474549, -3, -6.560628, 0, -0.5, 0.5, 0.5,
-4.474549, -3, -6.560628, 1, -0.5, 0.5, 0.5,
-4.474549, -3, -6.560628, 1, 1.5, 0.5, 0.5,
-4.474549, -3, -6.560628, 0, 1.5, 0.5, 0.5,
-4.474549, -2, -6.560628, 0, -0.5, 0.5, 0.5,
-4.474549, -2, -6.560628, 1, -0.5, 0.5, 0.5,
-4.474549, -2, -6.560628, 1, 1.5, 0.5, 0.5,
-4.474549, -2, -6.560628, 0, 1.5, 0.5, 0.5,
-4.474549, -1, -6.560628, 0, -0.5, 0.5, 0.5,
-4.474549, -1, -6.560628, 1, -0.5, 0.5, 0.5,
-4.474549, -1, -6.560628, 1, 1.5, 0.5, 0.5,
-4.474549, -1, -6.560628, 0, 1.5, 0.5, 0.5,
-4.474549, 0, -6.560628, 0, -0.5, 0.5, 0.5,
-4.474549, 0, -6.560628, 1, -0.5, 0.5, 0.5,
-4.474549, 0, -6.560628, 1, 1.5, 0.5, 0.5,
-4.474549, 0, -6.560628, 0, 1.5, 0.5, 0.5,
-4.474549, 1, -6.560628, 0, -0.5, 0.5, 0.5,
-4.474549, 1, -6.560628, 1, -0.5, 0.5, 0.5,
-4.474549, 1, -6.560628, 1, 1.5, 0.5, 0.5,
-4.474549, 1, -6.560628, 0, 1.5, 0.5, 0.5,
-4.474549, 2, -6.560628, 0, -0.5, 0.5, 0.5,
-4.474549, 2, -6.560628, 1, -0.5, 0.5, 0.5,
-4.474549, 2, -6.560628, 1, 1.5, 0.5, 0.5,
-4.474549, 2, -6.560628, 0, 1.5, 0.5, 0.5,
-4.474549, 3, -6.560628, 0, -0.5, 0.5, 0.5,
-4.474549, 3, -6.560628, 1, -0.5, 0.5, 0.5,
-4.474549, 3, -6.560628, 1, 1.5, 0.5, 0.5,
-4.474549, 3, -6.560628, 0, 1.5, 0.5, 0.5
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
-3.937669, -3.228498, -4,
-3.937669, -3.228498, 6,
-3.937669, -3.228498, -4,
-4.116629, -3.398537, -4,
-3.937669, -3.228498, -2,
-4.116629, -3.398537, -2,
-3.937669, -3.228498, 0,
-4.116629, -3.398537, 0,
-3.937669, -3.228498, 2,
-4.116629, -3.398537, 2,
-3.937669, -3.228498, 4,
-4.116629, -3.398537, 4,
-3.937669, -3.228498, 6,
-4.116629, -3.398537, 6
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
"4",
"6"
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
-4.474549, -3.738615, -4, 0, -0.5, 0.5, 0.5,
-4.474549, -3.738615, -4, 1, -0.5, 0.5, 0.5,
-4.474549, -3.738615, -4, 1, 1.5, 0.5, 0.5,
-4.474549, -3.738615, -4, 0, 1.5, 0.5, 0.5,
-4.474549, -3.738615, -2, 0, -0.5, 0.5, 0.5,
-4.474549, -3.738615, -2, 1, -0.5, 0.5, 0.5,
-4.474549, -3.738615, -2, 1, 1.5, 0.5, 0.5,
-4.474549, -3.738615, -2, 0, 1.5, 0.5, 0.5,
-4.474549, -3.738615, 0, 0, -0.5, 0.5, 0.5,
-4.474549, -3.738615, 0, 1, -0.5, 0.5, 0.5,
-4.474549, -3.738615, 0, 1, 1.5, 0.5, 0.5,
-4.474549, -3.738615, 0, 0, 1.5, 0.5, 0.5,
-4.474549, -3.738615, 2, 0, -0.5, 0.5, 0.5,
-4.474549, -3.738615, 2, 1, -0.5, 0.5, 0.5,
-4.474549, -3.738615, 2, 1, 1.5, 0.5, 0.5,
-4.474549, -3.738615, 2, 0, 1.5, 0.5, 0.5,
-4.474549, -3.738615, 4, 0, -0.5, 0.5, 0.5,
-4.474549, -3.738615, 4, 1, -0.5, 0.5, 0.5,
-4.474549, -3.738615, 4, 1, 1.5, 0.5, 0.5,
-4.474549, -3.738615, 4, 0, 1.5, 0.5, 0.5,
-4.474549, -3.738615, 6, 0, -0.5, 0.5, 0.5,
-4.474549, -3.738615, 6, 1, -0.5, 0.5, 0.5,
-4.474549, -3.738615, 6, 1, 1.5, 0.5, 0.5,
-4.474549, -3.738615, 6, 0, 1.5, 0.5, 0.5
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
-3.937669, -3.228498, -5.649337,
-3.937669, 3.573063, -5.649337,
-3.937669, -3.228498, 6.501203,
-3.937669, 3.573063, 6.501203,
-3.937669, -3.228498, -5.649337,
-3.937669, -3.228498, 6.501203,
-3.937669, 3.573063, -5.649337,
-3.937669, 3.573063, 6.501203,
-3.937669, -3.228498, -5.649337,
3.220744, -3.228498, -5.649337,
-3.937669, -3.228498, 6.501203,
3.220744, -3.228498, 6.501203,
-3.937669, 3.573063, -5.649337,
3.220744, 3.573063, -5.649337,
-3.937669, 3.573063, 6.501203,
3.220744, 3.573063, 6.501203,
3.220744, -3.228498, -5.649337,
3.220744, 3.573063, -5.649337,
3.220744, -3.228498, 6.501203,
3.220744, 3.573063, 6.501203,
3.220744, -3.228498, -5.649337,
3.220744, -3.228498, 6.501203,
3.220744, 3.573063, -5.649337,
3.220744, 3.573063, 6.501203
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
var radius = 8.360501;
var distance = 37.19682;
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
mvMatrix.translate( 0.3584622, -0.1722826, -0.4259326 );
mvMatrix.scale( 1.262785, 1.329039, 0.7439618 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.19682);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Inositols<-read.table("Inositols.xyz")
```

```
## Error in read.table("Inositols.xyz"): no lines available in input
```

```r
x<-Inositols$V2
```

```
## Error in eval(expr, envir, enclos): object 'Inositols' not found
```

```r
y<-Inositols$V3
```

```
## Error in eval(expr, envir, enclos): object 'Inositols' not found
```

```r
z<-Inositols$V4
```

```
## Error in eval(expr, envir, enclos): object 'Inositols' not found
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
-3.83342, -1.168158, -2.556535, 0, 0, 1, 1, 1,
-3.130591, 0.1830039, -2.000977, 1, 0, 0, 1, 1,
-3.112878, -1.991404, -2.568183, 1, 0, 0, 1, 1,
-3.107336, 0.4615218, -1.451318, 1, 0, 0, 1, 1,
-3.047165, 0.05733351, -1.587429, 1, 0, 0, 1, 1,
-2.894239, 0.9205285, -0.7328624, 1, 0, 0, 1, 1,
-2.869054, -0.7124052, 0.2512779, 0, 0, 0, 1, 1,
-2.816145, -0.4292031, -4.653943, 0, 0, 0, 1, 1,
-2.783911, -1.113601, -1.0139, 0, 0, 0, 1, 1,
-2.689506, 0.5713491, -0.4569645, 0, 0, 0, 1, 1,
-2.630671, -0.03737358, -2.93516, 0, 0, 0, 1, 1,
-2.619981, -0.9752614, -1.72387, 0, 0, 0, 1, 1,
-2.59289, 0.8342434, -1.158186, 0, 0, 0, 1, 1,
-2.575514, -0.9456531, -0.6128317, 1, 1, 1, 1, 1,
-2.52639, 1.394386, -1.453331, 1, 1, 1, 1, 1,
-2.518673, 0.9037297, -2.791016, 1, 1, 1, 1, 1,
-2.462327, -0.6248754, -2.301809, 1, 1, 1, 1, 1,
-2.360128, 0.3490533, -0.4490643, 1, 1, 1, 1, 1,
-2.334782, -1.868293, -2.386267, 1, 1, 1, 1, 1,
-2.290378, -0.1484219, -2.368995, 1, 1, 1, 1, 1,
-2.276855, 0.5815151, -1.834443, 1, 1, 1, 1, 1,
-2.273775, -0.3213117, -1.263932, 1, 1, 1, 1, 1,
-2.269307, -0.1325697, -1.184052, 1, 1, 1, 1, 1,
-2.204176, 0.8078527, -1.237231, 1, 1, 1, 1, 1,
-2.197492, 0.1774354, -3.742323, 1, 1, 1, 1, 1,
-2.186244, -0.1069962, -0.8518377, 1, 1, 1, 1, 1,
-2.136185, -0.9287585, -1.575379, 1, 1, 1, 1, 1,
-2.08108, -0.6002896, -1.644719, 1, 1, 1, 1, 1,
-2.078582, 0.5024728, -0.7371195, 0, 0, 1, 1, 1,
-2.0416, 1.401286, -1.468898, 1, 0, 0, 1, 1,
-2.03059, -0.1810267, -2.616611, 1, 0, 0, 1, 1,
-2.011659, 1.229494, -0.7086192, 1, 0, 0, 1, 1,
-1.995191, -0.354178, -1.063507, 1, 0, 0, 1, 1,
-1.968577, -0.471262, -2.418057, 1, 0, 0, 1, 1,
-1.957396, -0.226092, -2.137718, 0, 0, 0, 1, 1,
-1.946623, 1.8661, -0.7025605, 0, 0, 0, 1, 1,
-1.931037, 0.2158149, -1.052466, 0, 0, 0, 1, 1,
-1.922145, -0.5064931, -2.910805, 0, 0, 0, 1, 1,
-1.91944, 1.778127, -0.1385013, 0, 0, 0, 1, 1,
-1.903641, 0.01226591, -3.285427, 0, 0, 0, 1, 1,
-1.903163, -1.061585, -2.214597, 0, 0, 0, 1, 1,
-1.901546, -1.08816, -0.4795247, 1, 1, 1, 1, 1,
-1.901353, -0.3395279, -2.098467, 1, 1, 1, 1, 1,
-1.900181, -0.202155, -2.519461, 1, 1, 1, 1, 1,
-1.857619, -0.05734748, 0.03806108, 1, 1, 1, 1, 1,
-1.855866, -0.9913707, -0.7678384, 1, 1, 1, 1, 1,
-1.852483, -0.2718066, -2.406728, 1, 1, 1, 1, 1,
-1.849638, 0.1487487, -0.2100957, 1, 1, 1, 1, 1,
-1.845543, 1.047149, -0.1686057, 1, 1, 1, 1, 1,
-1.833795, -0.4742014, -2.203408, 1, 1, 1, 1, 1,
-1.823207, -1.518636, -1.498878, 1, 1, 1, 1, 1,
-1.8004, 0.8184357, -1.117438, 1, 1, 1, 1, 1,
-1.772351, 1.710648, 0.01327138, 1, 1, 1, 1, 1,
-1.769049, -0.5989988, -1.405816, 1, 1, 1, 1, 1,
-1.76637, -0.7687262, -2.850646, 1, 1, 1, 1, 1,
-1.738569, 2.041726, -0.3931871, 1, 1, 1, 1, 1,
-1.736351, 1.315154, -1.891606, 0, 0, 1, 1, 1,
-1.735762, -0.9431899, -3.10162, 1, 0, 0, 1, 1,
-1.721349, -1.648771, -3.21839, 1, 0, 0, 1, 1,
-1.716559, -0.3527521, -1.221762, 1, 0, 0, 1, 1,
-1.704844, 1.933457, 0.8026364, 1, 0, 0, 1, 1,
-1.694998, -0.7947885, -2.925415, 1, 0, 0, 1, 1,
-1.686936, -0.2440526, -0.8347219, 0, 0, 0, 1, 1,
-1.668119, -1.152432, -2.481695, 0, 0, 0, 1, 1,
-1.663656, -0.5765411, -1.992381, 0, 0, 0, 1, 1,
-1.658077, -1.994021, -1.288173, 0, 0, 0, 1, 1,
-1.646688, -0.8847111, -2.775773, 0, 0, 0, 1, 1,
-1.644649, 0.4424288, -1.27036, 0, 0, 0, 1, 1,
-1.640732, 0.4218116, -0.2040454, 0, 0, 0, 1, 1,
-1.629549, 1.04297, -0.6677169, 1, 1, 1, 1, 1,
-1.619447, -1.006999, -1.717692, 1, 1, 1, 1, 1,
-1.61841, 1.948969, -1.085772, 1, 1, 1, 1, 1,
-1.613142, -0.6275339, -0.1858694, 1, 1, 1, 1, 1,
-1.602438, -0.4601357, -1.163616, 1, 1, 1, 1, 1,
-1.600805, 0.5476362, -1.237104, 1, 1, 1, 1, 1,
-1.583967, -0.9885591, -2.234583, 1, 1, 1, 1, 1,
-1.583394, 0.8869014, -2.091172, 1, 1, 1, 1, 1,
-1.581232, -0.6612361, -0.5607962, 1, 1, 1, 1, 1,
-1.573794, 0.2962304, -0.9363145, 1, 1, 1, 1, 1,
-1.566318, -0.2008605, -1.295279, 1, 1, 1, 1, 1,
-1.565763, 1.55581, -1.31788, 1, 1, 1, 1, 1,
-1.562619, 1.936568, 1.235711, 1, 1, 1, 1, 1,
-1.554553, 0.1460969, -1.545416, 1, 1, 1, 1, 1,
-1.550297, -0.4540644, -1.377733, 1, 1, 1, 1, 1,
-1.545101, -0.6542829, -0.75479, 0, 0, 1, 1, 1,
-1.54347, -1.586117, -1.355206, 1, 0, 0, 1, 1,
-1.539119, 0.865202, -0.945127, 1, 0, 0, 1, 1,
-1.534732, 0.03308498, -0.3738646, 1, 0, 0, 1, 1,
-1.533769, -1.394915, -1.407088, 1, 0, 0, 1, 1,
-1.53243, 0.1871556, -2.245711, 1, 0, 0, 1, 1,
-1.524321, 1.45315, 0.1048413, 0, 0, 0, 1, 1,
-1.524271, -1.183316, -1.92061, 0, 0, 0, 1, 1,
-1.504457, 1.155711, -2.158118, 0, 0, 0, 1, 1,
-1.499944, 0.4080598, -0.8918838, 0, 0, 0, 1, 1,
-1.490716, 1.605445, 1.059316, 0, 0, 0, 1, 1,
-1.48984, -1.187823, -2.275482, 0, 0, 0, 1, 1,
-1.470995, -1.661966, -2.14764, 0, 0, 0, 1, 1,
-1.43838, 0.1484585, -2.24849, 1, 1, 1, 1, 1,
-1.431733, -0.7619162, -1.73055, 1, 1, 1, 1, 1,
-1.417987, -0.8807018, -1.713432, 1, 1, 1, 1, 1,
-1.417706, -0.52189, -1.364296, 1, 1, 1, 1, 1,
-1.408663, -0.008488279, -1.379004, 1, 1, 1, 1, 1,
-1.408555, -0.3420984, -1.697436, 1, 1, 1, 1, 1,
-1.399127, 0.5369466, -3.357162, 1, 1, 1, 1, 1,
-1.398937, -1.057364, -3.209632, 1, 1, 1, 1, 1,
-1.395391, -1.006667, -2.637164, 1, 1, 1, 1, 1,
-1.394234, 0.1134007, -2.154069, 1, 1, 1, 1, 1,
-1.391839, 0.5948528, -0.8807302, 1, 1, 1, 1, 1,
-1.381713, 0.04056276, -1.427915, 1, 1, 1, 1, 1,
-1.370919, 0.6442133, 0.1435068, 1, 1, 1, 1, 1,
-1.369334, -1.692263, -2.968888, 1, 1, 1, 1, 1,
-1.358853, -0.5981808, -1.31645, 1, 1, 1, 1, 1,
-1.357975, 0.4622406, -1.810834, 0, 0, 1, 1, 1,
-1.350393, -0.6193132, -4.102556, 1, 0, 0, 1, 1,
-1.338565, 1.350774, 0.841705, 1, 0, 0, 1, 1,
-1.336987, -1.261459, -2.0265, 1, 0, 0, 1, 1,
-1.333266, -0.2557893, -1.552024, 1, 0, 0, 1, 1,
-1.331785, -0.8727138, -1.602674, 1, 0, 0, 1, 1,
-1.330422, -0.02879839, -2.278036, 0, 0, 0, 1, 1,
-1.317164, -0.3644479, -3.119515, 0, 0, 0, 1, 1,
-1.313699, -0.1703697, -2.610089, 0, 0, 0, 1, 1,
-1.310601, 0.4691747, -1.064934, 0, 0, 0, 1, 1,
-1.30859, -0.87952, -1.050308, 0, 0, 0, 1, 1,
-1.304264, 0.9529951, -0.2066819, 0, 0, 0, 1, 1,
-1.294819, 0.7344442, -1.349984, 0, 0, 0, 1, 1,
-1.29273, -2.428756, -2.111403, 1, 1, 1, 1, 1,
-1.283315, -2.02383, -2.560325, 1, 1, 1, 1, 1,
-1.276437, -0.6879197, -3.380388, 1, 1, 1, 1, 1,
-1.272349, 0.7660881, -1.467849, 1, 1, 1, 1, 1,
-1.265393, -0.7014718, -1.129063, 1, 1, 1, 1, 1,
-1.245673, 0.3835548, -0.5866446, 1, 1, 1, 1, 1,
-1.234221, 0.093124, -2.376029, 1, 1, 1, 1, 1,
-1.229422, -0.8564075, -3.214134, 1, 1, 1, 1, 1,
-1.222963, -0.348741, -2.836242, 1, 1, 1, 1, 1,
-1.219197, -0.2783501, -1.579899, 1, 1, 1, 1, 1,
-1.212958, -1.660094, -3.527512, 1, 1, 1, 1, 1,
-1.21196, 1.109866, -0.6823657, 1, 1, 1, 1, 1,
-1.205996, 1.409401, -0.243054, 1, 1, 1, 1, 1,
-1.197622, -1.274824, -2.285704, 1, 1, 1, 1, 1,
-1.189911, -1.978818, -3.27653, 1, 1, 1, 1, 1,
-1.188889, 1.28453, 1.623567, 0, 0, 1, 1, 1,
-1.185142, 0.5368849, -2.08227, 1, 0, 0, 1, 1,
-1.176785, 1.848367, -1.062425, 1, 0, 0, 1, 1,
-1.153024, -0.1951617, -1.025216, 1, 0, 0, 1, 1,
-1.152673, 0.3779923, -2.234233, 1, 0, 0, 1, 1,
-1.151066, -2.043358, -0.5394852, 1, 0, 0, 1, 1,
-1.150362, 0.2297419, -3.237191, 0, 0, 0, 1, 1,
-1.146414, -1.302263, -2.760583, 0, 0, 0, 1, 1,
-1.143706, 0.9290037, 0.6170616, 0, 0, 0, 1, 1,
-1.133319, -0.2328642, -1.515179, 0, 0, 0, 1, 1,
-1.127951, -0.06214967, -3.53844, 0, 0, 0, 1, 1,
-1.124665, -0.5107921, -3.2054, 0, 0, 0, 1, 1,
-1.11868, 0.5769988, -0.2540195, 0, 0, 0, 1, 1,
-1.112505, -0.5587142, -2.161701, 1, 1, 1, 1, 1,
-1.112367, 0.05085001, -2.341549, 1, 1, 1, 1, 1,
-1.103483, -1.355019, -4.167084, 1, 1, 1, 1, 1,
-1.079432, -0.1710639, -2.198387, 1, 1, 1, 1, 1,
-1.078194, -0.3235205, -2.216827, 1, 1, 1, 1, 1,
-1.078118, 0.5270408, 0.2810018, 1, 1, 1, 1, 1,
-1.077714, 0.4538276, -0.9543361, 1, 1, 1, 1, 1,
-1.065573, 0.403266, -1.621529, 1, 1, 1, 1, 1,
-1.062119, -1.773668, -2.819591, 1, 1, 1, 1, 1,
-1.056909, 0.4592882, 0.5069639, 1, 1, 1, 1, 1,
-1.053599, 3.474011, -3.309609, 1, 1, 1, 1, 1,
-1.0437, 1.295949, -1.089945, 1, 1, 1, 1, 1,
-1.042363, 0.004409869, -1.364126, 1, 1, 1, 1, 1,
-1.039634, 0.6904325, -3.079806, 1, 1, 1, 1, 1,
-1.037735, -1.167584, -3.559517, 1, 1, 1, 1, 1,
-1.033545, 0.001523468, -1.439602, 0, 0, 1, 1, 1,
-1.022615, 2.150714, -1.266803, 1, 0, 0, 1, 1,
-1.010762, 0.0331143, -1.823698, 1, 0, 0, 1, 1,
-1.00676, 0.8368849, -1.095497, 1, 0, 0, 1, 1,
-0.994897, -0.5402834, -2.304565, 1, 0, 0, 1, 1,
-0.9907589, -0.4430669, -3.193618, 1, 0, 0, 1, 1,
-0.9887859, -0.3552547, -1.992844, 0, 0, 0, 1, 1,
-0.981027, -0.9644338, -2.53557, 0, 0, 0, 1, 1,
-0.9628874, 0.8400061, -1.263072, 0, 0, 0, 1, 1,
-0.9594533, 0.8608115, -0.1654723, 0, 0, 0, 1, 1,
-0.9488141, 1.307599, 0.4004712, 0, 0, 0, 1, 1,
-0.9485892, 1.119426, -0.5267116, 0, 0, 0, 1, 1,
-0.9467883, 0.5765102, -1.170004, 0, 0, 0, 1, 1,
-0.9451494, -0.1492031, -1.543123, 1, 1, 1, 1, 1,
-0.9414988, 2.130065, -0.3295013, 1, 1, 1, 1, 1,
-0.9391285, 0.2095179, -0.9650149, 1, 1, 1, 1, 1,
-0.9381722, -0.3219275, -0.9844669, 1, 1, 1, 1, 1,
-0.9318607, -0.4884397, -2.579605, 1, 1, 1, 1, 1,
-0.9303511, 0.2237189, -0.7888302, 1, 1, 1, 1, 1,
-0.9152994, -0.9542471, -1.584443, 1, 1, 1, 1, 1,
-0.9146346, -1.883064, -1.697414, 1, 1, 1, 1, 1,
-0.9062939, 2.972812, -0.6919383, 1, 1, 1, 1, 1,
-0.9018362, -0.665215, -2.477038, 1, 1, 1, 1, 1,
-0.9017308, 2.175818, -0.6090236, 1, 1, 1, 1, 1,
-0.8915191, -1.330461, -3.869961, 1, 1, 1, 1, 1,
-0.889221, -0.07503439, -1.900162, 1, 1, 1, 1, 1,
-0.8879863, -1.413339, -3.469107, 1, 1, 1, 1, 1,
-0.8824234, -1.464498, -2.747511, 1, 1, 1, 1, 1,
-0.8686587, -0.03989914, -0.5187256, 0, 0, 1, 1, 1,
-0.8680832, 0.6996841, -1.372356, 1, 0, 0, 1, 1,
-0.8676956, -0.1361463, -2.182108, 1, 0, 0, 1, 1,
-0.8675388, 0.9165537, -0.6694345, 1, 0, 0, 1, 1,
-0.8632312, -1.69618, -3.37224, 1, 0, 0, 1, 1,
-0.858136, 1.062111, -0.6491819, 1, 0, 0, 1, 1,
-0.8564802, 0.02831119, -1.47683, 0, 0, 0, 1, 1,
-0.8561566, 0.617433, -1.67229, 0, 0, 0, 1, 1,
-0.8526788, 0.9092662, -0.5857344, 0, 0, 0, 1, 1,
-0.850476, 1.386592, -0.8571299, 0, 0, 0, 1, 1,
-0.8458306, 1.998503, -1.355733, 0, 0, 0, 1, 1,
-0.8390487, -0.2356365, -2.503151, 0, 0, 0, 1, 1,
-0.8386469, 0.6902059, -1.29868, 0, 0, 0, 1, 1,
-0.8384297, 2.348062, -0.3733724, 1, 1, 1, 1, 1,
-0.8329862, -0.5909098, -1.123285, 1, 1, 1, 1, 1,
-0.8287109, -0.3258312, -1.531211, 1, 1, 1, 1, 1,
-0.8048176, -1.018212, -3.07561, 1, 1, 1, 1, 1,
-0.8024273, -1.665638, -2.600693, 1, 1, 1, 1, 1,
-0.7973241, -0.0905225, -1.814391, 1, 1, 1, 1, 1,
-0.7922885, 0.6083674, -1.546018, 1, 1, 1, 1, 1,
-0.791756, 0.5107063, -1.580435, 1, 1, 1, 1, 1,
-0.7900415, -0.5103689, -1.61516, 1, 1, 1, 1, 1,
-0.789388, -2.409077, -2.117918, 1, 1, 1, 1, 1,
-0.7888585, -0.5120881, -0.9429258, 1, 1, 1, 1, 1,
-0.7803208, 1.437122, -1.464106, 1, 1, 1, 1, 1,
-0.7729219, -1.908286, -2.0377, 1, 1, 1, 1, 1,
-0.7729133, -1.256652, -2.650594, 1, 1, 1, 1, 1,
-0.7703316, -0.1155301, -1.707305, 1, 1, 1, 1, 1,
-0.7679445, 1.263226, -0.002616019, 0, 0, 1, 1, 1,
-0.7677738, -2.40809, -2.855678, 1, 0, 0, 1, 1,
-0.7667409, -0.5777537, -1.935563, 1, 0, 0, 1, 1,
-0.7649111, 0.4215354, -2.827069, 1, 0, 0, 1, 1,
-0.7644468, 0.1373846, -0.7515025, 1, 0, 0, 1, 1,
-0.7610903, -1.400181, -3.815916, 1, 0, 0, 1, 1,
-0.7604147, -0.2906238, -3.37763, 0, 0, 0, 1, 1,
-0.7602299, 0.8555285, -3.368278, 0, 0, 0, 1, 1,
-0.7599937, 0.2704163, -0.5086983, 0, 0, 0, 1, 1,
-0.7597325, 0.9070082, -1.936571, 0, 0, 0, 1, 1,
-0.7513119, -0.540038, -1.881438, 0, 0, 0, 1, 1,
-0.7508869, 0.8152276, 0.8300447, 0, 0, 0, 1, 1,
-0.7485625, -0.4488344, -2.454223, 0, 0, 0, 1, 1,
-0.7322589, 0.2549527, -1.57137, 1, 1, 1, 1, 1,
-0.7311931, -2.532877, -3.503623, 1, 1, 1, 1, 1,
-0.7306092, -1.792987, -2.464961, 1, 1, 1, 1, 1,
-0.7299714, -0.556262, -2.611016, 1, 1, 1, 1, 1,
-0.7225628, 0.6588537, -1.254061, 1, 1, 1, 1, 1,
-0.7200109, 1.505611, -1.091464, 1, 1, 1, 1, 1,
-0.7072269, 0.5177099, -0.9967676, 1, 1, 1, 1, 1,
-0.7063485, 0.497911, 0.2136939, 1, 1, 1, 1, 1,
-0.7049909, -0.7797524, -4.071821, 1, 1, 1, 1, 1,
-0.7040485, 0.8722441, -0.77869, 1, 1, 1, 1, 1,
-0.702199, -0.2146834, -0.9923506, 1, 1, 1, 1, 1,
-0.6990975, -0.006732091, -0.177739, 1, 1, 1, 1, 1,
-0.6929374, -0.0123838, -2.304698, 1, 1, 1, 1, 1,
-0.6899693, -0.2389649, -2.196808, 1, 1, 1, 1, 1,
-0.6831925, -0.9601374, -1.569818, 1, 1, 1, 1, 1,
-0.6828254, -0.9220007, -3.14575, 0, 0, 1, 1, 1,
-0.6828124, -1.100249, -3.212255, 1, 0, 0, 1, 1,
-0.6819004, -1.701266, -3.004317, 1, 0, 0, 1, 1,
-0.6797386, 0.05963942, -1.170043, 1, 0, 0, 1, 1,
-0.6782593, -1.084473, -2.834411, 1, 0, 0, 1, 1,
-0.6748433, -0.9897382, -4.205443, 1, 0, 0, 1, 1,
-0.6748367, -0.8418916, -2.196481, 0, 0, 0, 1, 1,
-0.6710957, -0.9758345, -2.857708, 0, 0, 0, 1, 1,
-0.6705967, -0.5336819, -1.445071, 0, 0, 0, 1, 1,
-0.669322, -0.5181723, -1.91799, 0, 0, 0, 1, 1,
-0.6673068, -1.37701, -3.235915, 0, 0, 0, 1, 1,
-0.6668776, 1.346218, 1.142818, 0, 0, 0, 1, 1,
-0.6638911, -0.887286, -1.986047, 0, 0, 0, 1, 1,
-0.6590945, 0.5299633, -0.4340838, 1, 1, 1, 1, 1,
-0.6547001, 0.7792965, -0.6865316, 1, 1, 1, 1, 1,
-0.654637, -0.9468872, -2.827269, 1, 1, 1, 1, 1,
-0.6380392, 0.2751264, -0.7518514, 1, 1, 1, 1, 1,
-0.6374989, -1.856779, -3.65929, 1, 1, 1, 1, 1,
-0.636849, -1.452999, -2.298282, 1, 1, 1, 1, 1,
-0.6363806, -0.9835804, -0.0678352, 1, 1, 1, 1, 1,
-0.6361105, -0.04696152, -1.98444, 1, 1, 1, 1, 1,
-0.6332368, 0.238904, -0.27335, 1, 1, 1, 1, 1,
-0.6320498, -0.8355421, -2.073882, 1, 1, 1, 1, 1,
-0.6315337, -1.680379, -2.246101, 1, 1, 1, 1, 1,
-0.6277177, 0.750195, -1.419182, 1, 1, 1, 1, 1,
-0.6276701, 0.03509587, -1.087296, 1, 1, 1, 1, 1,
-0.6275722, 0.2235958, -0.3546583, 1, 1, 1, 1, 1,
-0.6265585, 0.2155081, 1.070097, 1, 1, 1, 1, 1,
-0.6240427, 0.9116686, -1.545207, 0, 0, 1, 1, 1,
-0.620924, 0.1261631, -1.861357, 1, 0, 0, 1, 1,
-0.6135963, 0.2981368, -2.92783, 1, 0, 0, 1, 1,
-0.6089337, 1.460595, -1.625369, 1, 0, 0, 1, 1,
-0.6080428, 0.202134, -0.1321035, 1, 0, 0, 1, 1,
-0.600367, 1.119856, -1.500091, 1, 0, 0, 1, 1,
-0.5940573, 1.886742, -0.865338, 0, 0, 0, 1, 1,
-0.5888259, -0.4343537, -2.500568, 0, 0, 0, 1, 1,
-0.5881579, 1.713466, -0.4455405, 0, 0, 0, 1, 1,
-0.5791262, 0.06255534, -1.740418, 0, 0, 0, 1, 1,
-0.5781466, 1.311865, -1.40735, 0, 0, 0, 1, 1,
-0.5764697, -0.4848024, -1.949405, 0, 0, 0, 1, 1,
-0.5756735, 2.269186, -0.2620128, 0, 0, 0, 1, 1,
-0.5738039, 1.126621, 1.161727, 1, 1, 1, 1, 1,
-0.5665358, -0.55496, -4.86598, 1, 1, 1, 1, 1,
-0.5602056, -0.8512428, -4.157778, 1, 1, 1, 1, 1,
-0.5519341, -0.1835523, -1.857598, 1, 1, 1, 1, 1,
-0.5508592, -0.6251829, -2.799843, 1, 1, 1, 1, 1,
-0.5471119, 1.587301, 0.6126633, 1, 1, 1, 1, 1,
-0.5458201, 0.4150338, -1.333835, 1, 1, 1, 1, 1,
-0.5402955, -0.5578211, -1.728007, 1, 1, 1, 1, 1,
-0.5378036, 0.2555374, -0.4595465, 1, 1, 1, 1, 1,
-0.5364372, 0.6909813, -0.2425171, 1, 1, 1, 1, 1,
-0.5306464, -1.502694, -0.9607121, 1, 1, 1, 1, 1,
-0.5290702, 0.6105601, -2.113995, 1, 1, 1, 1, 1,
-0.5275062, 0.2318471, 0.6249758, 1, 1, 1, 1, 1,
-0.5243675, 0.1685534, -2.412074, 1, 1, 1, 1, 1,
-0.5240576, 0.2710191, -0.5528788, 1, 1, 1, 1, 1,
-0.5122507, -0.3383029, -2.80842, 0, 0, 1, 1, 1,
-0.5102236, -2.246505, -5.472388, 1, 0, 0, 1, 1,
-0.5055029, 0.8523882, -0.4888612, 1, 0, 0, 1, 1,
-0.5052592, -0.819653, -2.376846, 1, 0, 0, 1, 1,
-0.5010673, -1.295992, -3.131394, 1, 0, 0, 1, 1,
-0.4997416, 0.9194532, -0.484742, 1, 0, 0, 1, 1,
-0.4973133, 0.01993113, -2.270787, 0, 0, 0, 1, 1,
-0.4958524, -1.433866, -2.438997, 0, 0, 0, 1, 1,
-0.495607, 1.456728, 1.075542, 0, 0, 0, 1, 1,
-0.4942735, -1.070432, -2.914923, 0, 0, 0, 1, 1,
-0.4902425, 1.130198, 0.5910337, 0, 0, 0, 1, 1,
-0.489743, -1.102152, -2.986424, 0, 0, 0, 1, 1,
-0.4820597, -0.6486261, -2.551363, 0, 0, 0, 1, 1,
-0.4795668, 0.09129402, -2.904588, 1, 1, 1, 1, 1,
-0.4777465, -0.7704962, -4.312612, 1, 1, 1, 1, 1,
-0.4729916, 1.220185, -2.995443, 1, 1, 1, 1, 1,
-0.4634416, 1.910207, -1.863817, 1, 1, 1, 1, 1,
-0.463003, -1.509237, -3.020997, 1, 1, 1, 1, 1,
-0.4622235, 0.4773179, 0.09284507, 1, 1, 1, 1, 1,
-0.4582616, -1.707603, -3.034018, 1, 1, 1, 1, 1,
-0.4577615, 0.257476, -0.3793094, 1, 1, 1, 1, 1,
-0.4571685, -1.051687, -4.904647, 1, 1, 1, 1, 1,
-0.4553854, -0.5585011, -4.598992, 1, 1, 1, 1, 1,
-0.4516374, -0.814678, -1.377512, 1, 1, 1, 1, 1,
-0.4458309, -0.0129188, -1.856076, 1, 1, 1, 1, 1,
-0.437405, -0.3102212, -2.304497, 1, 1, 1, 1, 1,
-0.4295931, 0.1832936, -1.694419, 1, 1, 1, 1, 1,
-0.4270495, 0.8585784, -0.7196724, 1, 1, 1, 1, 1,
-0.424053, -0.240751, -1.765585, 0, 0, 1, 1, 1,
-0.4229187, 0.04831911, -1.065803, 1, 0, 0, 1, 1,
-0.4207879, -1.553343, -2.296442, 1, 0, 0, 1, 1,
-0.4157126, -2.35324, -3.448658, 1, 0, 0, 1, 1,
-0.4148886, 0.7621766, 0.3043084, 1, 0, 0, 1, 1,
-0.4136598, 1.960136, -0.3790946, 1, 0, 0, 1, 1,
-0.4062323, 0.04218078, -0.1184407, 0, 0, 0, 1, 1,
-0.4032148, 0.6565834, 0.3208158, 0, 0, 0, 1, 1,
-0.4005427, -0.7396123, -1.434585, 0, 0, 0, 1, 1,
-0.3985362, -0.8843498, -1.403048, 0, 0, 0, 1, 1,
-0.394981, -0.7197937, -2.414232, 0, 0, 0, 1, 1,
-0.3816274, -0.08171099, -1.566952, 0, 0, 0, 1, 1,
-0.3747063, -0.8286632, -2.602908, 0, 0, 0, 1, 1,
-0.3715101, 0.999224, -0.9904991, 1, 1, 1, 1, 1,
-0.370042, 0.5238182, 0.2844594, 1, 1, 1, 1, 1,
-0.3628762, -1.241243, -2.999887, 1, 1, 1, 1, 1,
-0.3624131, -0.7811854, -1.47329, 1, 1, 1, 1, 1,
-0.3606105, -1.274667, -3.220167, 1, 1, 1, 1, 1,
-0.3586772, 1.56926, 0.7558617, 1, 1, 1, 1, 1,
-0.3585817, 1.318649, 0.1245731, 1, 1, 1, 1, 1,
-0.356462, 0.1506644, -1.801409, 1, 1, 1, 1, 1,
-0.3548856, 0.7845545, -2.320625, 1, 1, 1, 1, 1,
-0.3532575, 0.4601715, 0.009840577, 1, 1, 1, 1, 1,
-0.3492583, 0.2870806, 0.4041493, 1, 1, 1, 1, 1,
-0.3451452, 0.04936703, -1.441822, 1, 1, 1, 1, 1,
-0.3416938, -1.616549, -4.501082, 1, 1, 1, 1, 1,
-0.3401029, 1.245162, 0.1723966, 1, 1, 1, 1, 1,
-0.3377024, -0.3210019, -2.51385, 1, 1, 1, 1, 1,
-0.3368252, 0.1829958, -0.4186667, 0, 0, 1, 1, 1,
-0.334424, -0.6272545, -1.529952, 1, 0, 0, 1, 1,
-0.3333349, 1.6413, -0.6325175, 1, 0, 0, 1, 1,
-0.3308624, 0.2315185, -1.011752, 1, 0, 0, 1, 1,
-0.3296996, -2.454018, -1.405952, 1, 0, 0, 1, 1,
-0.3290919, -0.5731843, -4.003004, 1, 0, 0, 1, 1,
-0.328732, -0.525442, -3.164026, 0, 0, 0, 1, 1,
-0.3270926, -0.1156639, -0.6857674, 0, 0, 0, 1, 1,
-0.3258059, -0.1878434, -2.091589, 0, 0, 0, 1, 1,
-0.3227243, 0.05860391, 0.6844599, 0, 0, 0, 1, 1,
-0.3213456, -1.83021, -1.691152, 0, 0, 0, 1, 1,
-0.3190051, 0.6121446, -1.341128, 0, 0, 0, 1, 1,
-0.3182945, -0.5150347, -1.084858, 0, 0, 0, 1, 1,
-0.3164624, 1.681074, -0.2635748, 1, 1, 1, 1, 1,
-0.3160973, -1.219457, -3.566515, 1, 1, 1, 1, 1,
-0.3095143, 0.2322016, 1.568297, 1, 1, 1, 1, 1,
-0.3084792, -1.928109, -4.047439, 1, 1, 1, 1, 1,
-0.3078642, 0.093911, -0.5447151, 1, 1, 1, 1, 1,
-0.3069767, 1.007096, -0.7549234, 1, 1, 1, 1, 1,
-0.3067116, -0.7542481, -2.114389, 1, 1, 1, 1, 1,
-0.3061904, -0.7558154, -2.359533, 1, 1, 1, 1, 1,
-0.3058084, -0.4342847, -3.766711, 1, 1, 1, 1, 1,
-0.3053442, -0.7188353, -1.462256, 1, 1, 1, 1, 1,
-0.2974395, 2.293723, -0.7103899, 1, 1, 1, 1, 1,
-0.2964311, -0.6352692, -2.653615, 1, 1, 1, 1, 1,
-0.2947312, -0.8590938, -1.603709, 1, 1, 1, 1, 1,
-0.2944901, 0.6111512, -1.5665, 1, 1, 1, 1, 1,
-0.2929927, 2.233949, 2.197205, 1, 1, 1, 1, 1,
-0.2922037, 0.1211888, -0.8758349, 0, 0, 1, 1, 1,
-0.2904506, -0.3384914, -1.13706, 1, 0, 0, 1, 1,
-0.2864845, 0.1904943, -0.9323633, 1, 0, 0, 1, 1,
-0.2853523, 1.155846, -0.1617293, 1, 0, 0, 1, 1,
-0.2789538, 0.4818084, -0.3854566, 1, 0, 0, 1, 1,
-0.2745362, 1.723953, 0.0974615, 1, 0, 0, 1, 1,
-0.2741061, 0.3017344, -2.636107, 0, 0, 0, 1, 1,
-0.2733495, 0.08938152, -1.541939, 0, 0, 0, 1, 1,
-0.2733297, 1.092126, 0.6652295, 0, 0, 0, 1, 1,
-0.271557, 2.197958, -0.5470864, 0, 0, 0, 1, 1,
-0.2704046, -0.6107516, -2.420717, 0, 0, 0, 1, 1,
-0.2703569, -0.1511795, -2.184021, 0, 0, 0, 1, 1,
-0.2646613, -1.366999, -4.114342, 0, 0, 0, 1, 1,
-0.261627, -0.8818697, -3.304872, 1, 1, 1, 1, 1,
-0.2541026, -1.175652, -4.415827, 1, 1, 1, 1, 1,
-0.2464808, -1.079092, -2.786501, 1, 1, 1, 1, 1,
-0.2298541, 0.9997206, -0.4071968, 1, 1, 1, 1, 1,
-0.2242113, 2.038812, -1.909701, 1, 1, 1, 1, 1,
-0.2197748, -1.099313, -3.482802, 1, 1, 1, 1, 1,
-0.219354, 0.2811214, -1.183681, 1, 1, 1, 1, 1,
-0.2163543, 0.5076761, 0.08857185, 1, 1, 1, 1, 1,
-0.2145028, -0.3733141, -0.9015064, 1, 1, 1, 1, 1,
-0.2134013, 1.352385, -0.4711655, 1, 1, 1, 1, 1,
-0.2116904, 0.3712451, 0.6829475, 1, 1, 1, 1, 1,
-0.2102047, 0.6387397, -0.1208943, 1, 1, 1, 1, 1,
-0.209713, -1.224527, -1.736222, 1, 1, 1, 1, 1,
-0.2095233, -0.7169542, -3.457559, 1, 1, 1, 1, 1,
-0.2059933, 0.4382279, 0.932994, 1, 1, 1, 1, 1,
-0.2030175, -0.3066297, -3.314469, 0, 0, 1, 1, 1,
-0.2022643, -1.013822, -1.930678, 1, 0, 0, 1, 1,
-0.1969154, -0.1338605, -3.365969, 1, 0, 0, 1, 1,
-0.1919781, 0.2261923, -0.6177179, 1, 0, 0, 1, 1,
-0.1908948, 0.9425924, -0.558325, 1, 0, 0, 1, 1,
-0.1901463, 0.792917, 1.075892, 1, 0, 0, 1, 1,
-0.1901132, 0.3440981, 0.5622663, 0, 0, 0, 1, 1,
-0.1895841, 0.9927235, -1.994864, 0, 0, 0, 1, 1,
-0.1877345, 1.797568, 0.5923655, 0, 0, 0, 1, 1,
-0.1817339, 0.2803428, -1.527266, 0, 0, 0, 1, 1,
-0.1808251, -0.7548979, -2.339562, 0, 0, 0, 1, 1,
-0.1805927, -1.055493, -3.099308, 0, 0, 0, 1, 1,
-0.1794779, 1.242351, -1.426687, 0, 0, 0, 1, 1,
-0.1784609, -0.8669007, -3.125802, 1, 1, 1, 1, 1,
-0.1763233, -0.9080281, -3.794825, 1, 1, 1, 1, 1,
-0.1720805, -0.2621735, -2.9666, 1, 1, 1, 1, 1,
-0.1685313, -0.8769729, -4.11461, 1, 1, 1, 1, 1,
-0.1611265, 1.43144, -0.7802905, 1, 1, 1, 1, 1,
-0.1608037, -1.052839, -4.281391, 1, 1, 1, 1, 1,
-0.1577098, -0.06775589, -0.6113598, 1, 1, 1, 1, 1,
-0.1569943, 0.3761737, 0.3223276, 1, 1, 1, 1, 1,
-0.1554992, 0.8198284, -0.1024629, 1, 1, 1, 1, 1,
-0.1534857, -1.103695, -4.651448, 1, 1, 1, 1, 1,
-0.1530168, 0.2404091, 1.030962, 1, 1, 1, 1, 1,
-0.1507964, -0.3820263, -4.089566, 1, 1, 1, 1, 1,
-0.1498826, 1.451356, -0.4359465, 1, 1, 1, 1, 1,
-0.1458068, -0.7899287, -3.757623, 1, 1, 1, 1, 1,
-0.1446323, -0.403005, -2.971608, 1, 1, 1, 1, 1,
-0.1441237, -0.9017376, -3.056286, 0, 0, 1, 1, 1,
-0.1386719, 1.090732, -0.3760408, 1, 0, 0, 1, 1,
-0.1370487, -1.343536, -2.408647, 1, 0, 0, 1, 1,
-0.13631, -0.07878679, -2.680777, 1, 0, 0, 1, 1,
-0.130756, -1.184268, -1.355922, 1, 0, 0, 1, 1,
-0.129962, 0.7119128, -0.3945952, 1, 0, 0, 1, 1,
-0.1292085, -1.770262, -2.34299, 0, 0, 0, 1, 1,
-0.1260434, 0.5409285, 1.133791, 0, 0, 0, 1, 1,
-0.1258847, -1.153572, -4.989202, 0, 0, 0, 1, 1,
-0.1249055, -0.6475632, -2.532758, 0, 0, 0, 1, 1,
-0.1179498, -0.7751408, -0.2299381, 0, 0, 0, 1, 1,
-0.1124704, -0.5231115, -3.3251, 0, 0, 0, 1, 1,
-0.1121866, -0.5732038, -2.917612, 0, 0, 0, 1, 1,
-0.1103984, -1.49005, -3.340418, 1, 1, 1, 1, 1,
-0.1032285, -0.235063, -3.5405, 1, 1, 1, 1, 1,
-0.1000579, -0.4287149, -2.886403, 1, 1, 1, 1, 1,
-0.09801346, -0.4878002, -1.576447, 1, 1, 1, 1, 1,
-0.09253298, 0.2168364, -1.550581, 1, 1, 1, 1, 1,
-0.08951104, -0.3762912, -3.020888, 1, 1, 1, 1, 1,
-0.08932505, -0.3631351, -2.218164, 1, 1, 1, 1, 1,
-0.08804876, -0.419242, -1.562773, 1, 1, 1, 1, 1,
-0.08804128, 0.8952939, -0.5000269, 1, 1, 1, 1, 1,
-0.08585095, 0.4951708, 1.113713, 1, 1, 1, 1, 1,
-0.08521356, 1.152481, -0.2676859, 1, 1, 1, 1, 1,
-0.08158746, -0.422514, -3.57158, 1, 1, 1, 1, 1,
-0.08099617, -0.08464013, -1.907185, 1, 1, 1, 1, 1,
-0.08033052, 0.9780856, -1.381391, 1, 1, 1, 1, 1,
-0.07792775, -3.129446, -2.346831, 1, 1, 1, 1, 1,
-0.07654674, 0.5622913, -2.390226, 0, 0, 1, 1, 1,
-0.07252328, 1.573856, 0.9211046, 1, 0, 0, 1, 1,
-0.0673677, 0.2488185, -1.057428, 1, 0, 0, 1, 1,
-0.06516808, -1.03348, -2.991352, 1, 0, 0, 1, 1,
-0.0646075, 0.3551306, 0.7425959, 1, 0, 0, 1, 1,
-0.06206901, 1.359404, -0.2079078, 1, 0, 0, 1, 1,
-0.06174111, -0.07618301, -1.509279, 0, 0, 0, 1, 1,
-0.05863298, -0.779986, -3.86383, 0, 0, 0, 1, 1,
-0.05789102, 1.268863, 1.629438, 0, 0, 0, 1, 1,
-0.05519563, 0.8149641, -1.749961, 0, 0, 0, 1, 1,
-0.05085956, -0.4153519, -2.985501, 0, 0, 0, 1, 1,
-0.04838603, -0.3204469, -3.397115, 0, 0, 0, 1, 1,
-0.04775666, -0.01592272, -1.405875, 0, 0, 0, 1, 1,
-0.04688314, 2.500671, 0.4168142, 1, 1, 1, 1, 1,
-0.04363274, -1.527042, -1.701943, 1, 1, 1, 1, 1,
-0.04153588, -0.3669636, -0.7163876, 1, 1, 1, 1, 1,
-0.04127085, 0.02274243, -0.8227298, 1, 1, 1, 1, 1,
-0.03959879, 0.4393975, -0.8854603, 1, 1, 1, 1, 1,
-0.03776931, 0.3544128, -1.269325, 1, 1, 1, 1, 1,
-0.03128618, -1.184326, -4.756443, 1, 1, 1, 1, 1,
-0.02558747, -1.285855, -5.251493, 1, 1, 1, 1, 1,
-0.01744891, 0.9615057, -2.95919, 1, 1, 1, 1, 1,
-0.01736458, 2.3877, -0.3287585, 1, 1, 1, 1, 1,
-0.01625764, 0.8598213, 0.407874, 1, 1, 1, 1, 1,
-0.01001049, -0.72815, -4.470939, 1, 1, 1, 1, 1,
-0.009668827, -0.3013606, -3.810071, 1, 1, 1, 1, 1,
-0.009351333, -0.1220296, -2.452425, 1, 1, 1, 1, 1,
-0.006785708, -1.305606, -4.099137, 1, 1, 1, 1, 1,
-0.002778736, -0.03337969, -1.317793, 0, 0, 1, 1, 1,
-0.002733658, 0.3411966, 0.3802258, 1, 0, 0, 1, 1,
-0.002551242, -0.1809015, -4.431891, 1, 0, 0, 1, 1,
0.0006038755, -0.3351588, 3.055223, 1, 0, 0, 1, 1,
0.005986478, 0.2409988, -1.171413, 1, 0, 0, 1, 1,
0.006952363, -0.8053073, 3.995543, 1, 0, 0, 1, 1,
0.007409706, 1.493781, 1.130428, 0, 0, 0, 1, 1,
0.01432869, 0.1598623, -1.796384, 0, 0, 0, 1, 1,
0.01935313, -0.2763243, 2.180712, 0, 0, 0, 1, 1,
0.02033051, -0.1022502, 4.223999, 0, 0, 0, 1, 1,
0.02108485, 0.7626472, -0.9618458, 0, 0, 0, 1, 1,
0.02215273, 1.317085, 0.8059385, 0, 0, 0, 1, 1,
0.02358337, -0.3120592, 4.217999, 0, 0, 0, 1, 1,
0.02632044, -1.800785, 2.198766, 1, 1, 1, 1, 1,
0.02850614, -1.318404, 4.346477, 1, 1, 1, 1, 1,
0.03298364, -1.456425, 2.277178, 1, 1, 1, 1, 1,
0.03433352, 0.9284968, -1.227515, 1, 1, 1, 1, 1,
0.03764613, 0.3312372, -0.0332316, 1, 1, 1, 1, 1,
0.03951942, 0.9756975, -0.01070486, 1, 1, 1, 1, 1,
0.04137591, 1.370675, 1.060728, 1, 1, 1, 1, 1,
0.04169891, -0.9748144, 1.483575, 1, 1, 1, 1, 1,
0.04362341, 0.9558395, 0.1461644, 1, 1, 1, 1, 1,
0.04489979, 0.5012017, -0.149064, 1, 1, 1, 1, 1,
0.04793959, -0.3226341, 3.553293, 1, 1, 1, 1, 1,
0.04834065, 1.232981, 0.9145537, 1, 1, 1, 1, 1,
0.04993252, -1.30502, 3.358742, 1, 1, 1, 1, 1,
0.05239451, -0.5142543, 5.078411, 1, 1, 1, 1, 1,
0.05918298, -2.075448, 3.925768, 1, 1, 1, 1, 1,
0.05967486, -1.167628, 2.74909, 0, 0, 1, 1, 1,
0.05978203, 0.1442163, 1.694809, 1, 0, 0, 1, 1,
0.06062082, 0.2355151, 1.111963, 1, 0, 0, 1, 1,
0.06134081, 0.1727499, 0.4467988, 1, 0, 0, 1, 1,
0.06148285, 0.1532034, -0.4469879, 1, 0, 0, 1, 1,
0.06264087, 1.281817, 0.4086351, 1, 0, 0, 1, 1,
0.06285276, -0.0788238, 2.381991, 0, 0, 0, 1, 1,
0.06840461, 0.8100223, 0.6348906, 0, 0, 0, 1, 1,
0.0714558, -0.7169243, 2.571619, 0, 0, 0, 1, 1,
0.07324971, 0.1478708, -0.1474386, 0, 0, 0, 1, 1,
0.07471747, -0.2084268, 1.672725, 0, 0, 0, 1, 1,
0.07944794, 0.3951522, -0.9510997, 0, 0, 0, 1, 1,
0.08737819, -1.996862, 2.757077, 0, 0, 0, 1, 1,
0.09287974, 0.2885105, -0.945004, 1, 1, 1, 1, 1,
0.09869786, 0.06139086, 2.343051, 1, 1, 1, 1, 1,
0.09923156, -0.2789236, 0.9766343, 1, 1, 1, 1, 1,
0.09962014, 0.4248914, 1.298782, 1, 1, 1, 1, 1,
0.1018261, -0.2436648, 2.288095, 1, 1, 1, 1, 1,
0.1021182, -1.376567, 2.909697, 1, 1, 1, 1, 1,
0.1043365, -1.514859, 2.089806, 1, 1, 1, 1, 1,
0.1044942, 1.814099, 1.564936, 1, 1, 1, 1, 1,
0.107737, 1.066851, -0.1160745, 1, 1, 1, 1, 1,
0.1100713, -1.130162, 3.992479, 1, 1, 1, 1, 1,
0.1102958, 0.09032564, -0.488062, 1, 1, 1, 1, 1,
0.1106881, -0.03453066, 1.119563, 1, 1, 1, 1, 1,
0.1115672, 0.5329145, -0.2343628, 1, 1, 1, 1, 1,
0.1116508, -0.3133393, 3.327096, 1, 1, 1, 1, 1,
0.1128893, -0.4634193, 4.520803, 1, 1, 1, 1, 1,
0.1132836, 0.444549, 1.265338, 0, 0, 1, 1, 1,
0.1174395, -1.373516, 4.089285, 1, 0, 0, 1, 1,
0.1192067, 0.356055, 1.030424, 1, 0, 0, 1, 1,
0.1198324, 1.592778, 1.239537, 1, 0, 0, 1, 1,
0.1210476, -0.3337891, 3.535281, 1, 0, 0, 1, 1,
0.1231008, -0.02884028, -0.3634018, 1, 0, 0, 1, 1,
0.1244441, 0.8910788, 0.5854537, 0, 0, 0, 1, 1,
0.1257414, -0.7440065, 3.758236, 0, 0, 0, 1, 1,
0.1271137, 0.03881952, 1.271376, 0, 0, 0, 1, 1,
0.1327774, 2.069214, 0.8720639, 0, 0, 0, 1, 1,
0.1363987, 1.692546, -0.3452109, 0, 0, 0, 1, 1,
0.1369942, -1.958696, 1.327051, 0, 0, 0, 1, 1,
0.1393992, -0.2924583, 2.134907, 0, 0, 0, 1, 1,
0.1406486, 0.4924652, 0.9673234, 1, 1, 1, 1, 1,
0.1441739, -1.47211, 2.510861, 1, 1, 1, 1, 1,
0.1444675, 1.223921, 0.1512275, 1, 1, 1, 1, 1,
0.1454339, -0.6967936, 1.854019, 1, 1, 1, 1, 1,
0.1476183, 0.09794533, 2.352893, 1, 1, 1, 1, 1,
0.1480543, 0.3703882, -0.1268133, 1, 1, 1, 1, 1,
0.1530163, -0.9163423, 2.8526, 1, 1, 1, 1, 1,
0.1538012, 1.74197, -0.908257, 1, 1, 1, 1, 1,
0.1580138, 1.500234, -0.3169722, 1, 1, 1, 1, 1,
0.1596048, 2.216594, -0.6713632, 1, 1, 1, 1, 1,
0.1631199, 0.8102018, 0.4744546, 1, 1, 1, 1, 1,
0.1631879, -0.3933421, 2.735169, 1, 1, 1, 1, 1,
0.1663784, -0.2486295, 4.530578, 1, 1, 1, 1, 1,
0.1714672, 0.7872262, 0.0163705, 1, 1, 1, 1, 1,
0.1722215, -0.3657128, 1.796497, 1, 1, 1, 1, 1,
0.1725982, -0.6793999, 2.346125, 0, 0, 1, 1, 1,
0.1728432, 0.5771389, -1.061189, 1, 0, 0, 1, 1,
0.177841, -0.9117134, 3.771534, 1, 0, 0, 1, 1,
0.1782921, -0.7224125, 3.911572, 1, 0, 0, 1, 1,
0.1826688, -0.7593181, 3.783633, 1, 0, 0, 1, 1,
0.1842147, -0.5673389, 1.058628, 1, 0, 0, 1, 1,
0.1879385, 1.763343, 0.6385025, 0, 0, 0, 1, 1,
0.1929827, -1.212795, 3.059757, 0, 0, 0, 1, 1,
0.1934621, -1.016579, 2.379348, 0, 0, 0, 1, 1,
0.1971956, -0.3854857, 3.284832, 0, 0, 0, 1, 1,
0.1982291, 1.842728, 1.375509, 0, 0, 0, 1, 1,
0.2030219, -1.386487, 2.141013, 0, 0, 0, 1, 1,
0.203844, 0.8813777, 0.2545563, 0, 0, 0, 1, 1,
0.2053859, 0.5668684, 2.521612, 1, 1, 1, 1, 1,
0.2074154, 0.4164881, 0.1497596, 1, 1, 1, 1, 1,
0.2133923, -0.3246016, 1.298374, 1, 1, 1, 1, 1,
0.2137579, 2.213818, -1.355785, 1, 1, 1, 1, 1,
0.2142148, -0.6926191, 4.059711, 1, 1, 1, 1, 1,
0.2254568, 0.3624013, 0.5980048, 1, 1, 1, 1, 1,
0.2273509, -0.3345092, 1.347567, 1, 1, 1, 1, 1,
0.2279847, 1.454194, -0.985612, 1, 1, 1, 1, 1,
0.243084, -1.015689, 1.788803, 1, 1, 1, 1, 1,
0.2445484, -1.422549, 2.56171, 1, 1, 1, 1, 1,
0.2489164, -1.111297, 2.706588, 1, 1, 1, 1, 1,
0.2535418, 1.22892, 0.9328647, 1, 1, 1, 1, 1,
0.2539013, -0.5996008, 2.054128, 1, 1, 1, 1, 1,
0.2543992, -0.6265701, 2.301801, 1, 1, 1, 1, 1,
0.2545605, 0.07599661, 0.9697481, 1, 1, 1, 1, 1,
0.2568416, -0.300537, 2.073611, 0, 0, 1, 1, 1,
0.2584329, 1.124253, -0.5717447, 1, 0, 0, 1, 1,
0.2625178, -0.3064328, 2.782258, 1, 0, 0, 1, 1,
0.2657764, 1.233638, 1.378811, 1, 0, 0, 1, 1,
0.2797559, 1.486933, 0.6103244, 1, 0, 0, 1, 1,
0.2897029, -1.456283, 4.647234, 1, 0, 0, 1, 1,
0.2927954, 0.49788, 0.2658952, 0, 0, 0, 1, 1,
0.2933711, 0.857603, -1.140188, 0, 0, 0, 1, 1,
0.3036308, -1.752329, 1.141515, 0, 0, 0, 1, 1,
0.3057137, 1.678237, 1.658682, 0, 0, 0, 1, 1,
0.3086253, 1.09762, -1.775746, 0, 0, 0, 1, 1,
0.3088412, 1.040352, -0.7991312, 0, 0, 0, 1, 1,
0.3119882, 0.3664559, 2.543037, 0, 0, 0, 1, 1,
0.3146309, 0.9371202, -1.772917, 1, 1, 1, 1, 1,
0.3167116, -0.1487344, 1.856234, 1, 1, 1, 1, 1,
0.3180893, -1.295042, 2.315424, 1, 1, 1, 1, 1,
0.318206, 0.2297657, 1.815768, 1, 1, 1, 1, 1,
0.3197032, 1.438152, -0.6044461, 1, 1, 1, 1, 1,
0.3211379, 0.9540508, 0.9798155, 1, 1, 1, 1, 1,
0.3237762, -0.3783072, 2.337129, 1, 1, 1, 1, 1,
0.3286279, 1.466371, 1.301072, 1, 1, 1, 1, 1,
0.3324255, -0.651954, 4.18153, 1, 1, 1, 1, 1,
0.3342079, -0.8230593, 2.227576, 1, 1, 1, 1, 1,
0.3366983, -0.7305312, 1.560957, 1, 1, 1, 1, 1,
0.3427761, -1.269684, 3.818999, 1, 1, 1, 1, 1,
0.3492734, -0.5405802, 2.287379, 1, 1, 1, 1, 1,
0.3580029, -1.095979, 3.322085, 1, 1, 1, 1, 1,
0.3583789, -2.246686, 3.660501, 1, 1, 1, 1, 1,
0.3599871, 0.5384513, 2.842977, 0, 0, 1, 1, 1,
0.3606944, 1.98154, 0.6582131, 1, 0, 0, 1, 1,
0.3632249, 1.027477, -0.5121505, 1, 0, 0, 1, 1,
0.3653749, -0.03096145, 0.7573326, 1, 0, 0, 1, 1,
0.3658814, -0.5713894, 3.105742, 1, 0, 0, 1, 1,
0.3770582, -2.292135, 2.381158, 1, 0, 0, 1, 1,
0.377307, -0.840231, 1.91404, 0, 0, 0, 1, 1,
0.3814406, 0.8127033, 1.281363, 0, 0, 0, 1, 1,
0.3872052, -0.6461945, 3.153081, 0, 0, 0, 1, 1,
0.3908198, -1.849752, 2.71358, 0, 0, 0, 1, 1,
0.3935647, -1.767462, 4.892182, 0, 0, 0, 1, 1,
0.395414, -0.8986287, 2.742043, 0, 0, 0, 1, 1,
0.3977004, 0.2268857, 0.7783903, 0, 0, 0, 1, 1,
0.3998965, -0.09869136, 2.544863, 1, 1, 1, 1, 1,
0.4013928, -2.008747, 2.960773, 1, 1, 1, 1, 1,
0.402125, -0.8071365, 3.624647, 1, 1, 1, 1, 1,
0.4082629, 0.104024, 1.033386, 1, 1, 1, 1, 1,
0.4089637, -0.8072742, 0.5606616, 1, 1, 1, 1, 1,
0.4098109, 0.5752663, 0.1032857, 1, 1, 1, 1, 1,
0.4132192, 0.8144808, 0.8774956, 1, 1, 1, 1, 1,
0.4226609, -2.60197, 3.467233, 1, 1, 1, 1, 1,
0.4238203, -0.717078, 2.812092, 1, 1, 1, 1, 1,
0.4241193, -0.4344566, 0.5595221, 1, 1, 1, 1, 1,
0.426511, 0.4996201, 0.6550482, 1, 1, 1, 1, 1,
0.4265637, -1.084566, 4.396117, 1, 1, 1, 1, 1,
0.4302481, 0.5094386, 0.6732258, 1, 1, 1, 1, 1,
0.436073, 0.09169634, 1.980778, 1, 1, 1, 1, 1,
0.4443625, 1.345978, 0.503097, 1, 1, 1, 1, 1,
0.4452487, 1.077487, 1.769114, 0, 0, 1, 1, 1,
0.4530973, -0.3955031, 4.529133, 1, 0, 0, 1, 1,
0.4534021, -0.3747162, 2.067194, 1, 0, 0, 1, 1,
0.4550824, -0.5753426, 0.5185499, 1, 0, 0, 1, 1,
0.4564214, 0.4300379, 0.572323, 1, 0, 0, 1, 1,
0.4581736, -0.3688705, 2.498163, 1, 0, 0, 1, 1,
0.4589563, 0.2866044, 1.431858, 0, 0, 0, 1, 1,
0.4613721, 0.6001514, -0.3812995, 0, 0, 0, 1, 1,
0.4623493, 0.2228335, 0.4704794, 0, 0, 0, 1, 1,
0.4659844, 0.6171314, 0.1787161, 0, 0, 0, 1, 1,
0.4713078, 0.4369602, 1.608261, 0, 0, 0, 1, 1,
0.4789458, 0.4308625, 1.419811, 0, 0, 0, 1, 1,
0.4799872, 0.7040759, 0.371025, 0, 0, 0, 1, 1,
0.4805527, -1.016683, 2.335298, 1, 1, 1, 1, 1,
0.4812868, -1.42469, 5.514094, 1, 1, 1, 1, 1,
0.4856295, 1.026961, -0.3922975, 1, 1, 1, 1, 1,
0.4869563, -0.2430148, 2.381144, 1, 1, 1, 1, 1,
0.4874331, -0.353102, -0.4793668, 1, 1, 1, 1, 1,
0.4879875, -0.940707, 2.570497, 1, 1, 1, 1, 1,
0.4911212, 2.618352, 1.885532, 1, 1, 1, 1, 1,
0.4951329, -0.2183325, 3.622866, 1, 1, 1, 1, 1,
0.4981267, 1.445385, -1.66806, 1, 1, 1, 1, 1,
0.5064142, -0.02801562, 1.792088, 1, 1, 1, 1, 1,
0.5066603, 0.2610061, 1.175142, 1, 1, 1, 1, 1,
0.5083568, -0.3474855, 4.207571, 1, 1, 1, 1, 1,
0.5131632, 0.03447602, 0.8905292, 1, 1, 1, 1, 1,
0.515854, 1.240375, 1.99032, 1, 1, 1, 1, 1,
0.5202023, -0.6672908, 2.677835, 1, 1, 1, 1, 1,
0.5242934, -0.1084486, 1.595973, 0, 0, 1, 1, 1,
0.5269864, -0.3878296, 1.062016, 1, 0, 0, 1, 1,
0.5274091, -0.1722548, 2.832788, 1, 0, 0, 1, 1,
0.5280562, -0.4578321, 3.292039, 1, 0, 0, 1, 1,
0.5285454, -1.597778, 4.433273, 1, 0, 0, 1, 1,
0.542998, 0.3258422, 1.214744, 1, 0, 0, 1, 1,
0.5484631, 1.425388, -0.9112329, 0, 0, 0, 1, 1,
0.5496279, -0.6570667, 2.627775, 0, 0, 0, 1, 1,
0.55059, -0.3656768, 2.044504, 0, 0, 0, 1, 1,
0.5520118, -1.447652, 1.713751, 0, 0, 0, 1, 1,
0.5543157, -1.93819, 2.280025, 0, 0, 0, 1, 1,
0.5554751, -1.333451, 1.088029, 0, 0, 0, 1, 1,
0.5564094, 0.08152097, 2.611169, 0, 0, 0, 1, 1,
0.5566075, 1.228853, 3.052963, 1, 1, 1, 1, 1,
0.5637133, 1.112291, -0.9262363, 1, 1, 1, 1, 1,
0.5646969, 0.2961063, 1.216553, 1, 1, 1, 1, 1,
0.5685282, -0.1772136, 1.90184, 1, 1, 1, 1, 1,
0.5719324, 0.1152665, 1.889285, 1, 1, 1, 1, 1,
0.5783545, 1.1731, 1.445031, 1, 1, 1, 1, 1,
0.5804244, -0.01681075, 2.524164, 1, 1, 1, 1, 1,
0.5828198, 0.9629637, 0.933553, 1, 1, 1, 1, 1,
0.5834641, 1.819121, 0.4136399, 1, 1, 1, 1, 1,
0.5854287, 0.7324423, 3.276602, 1, 1, 1, 1, 1,
0.587574, 1.363199, 2.50998, 1, 1, 1, 1, 1,
0.5970276, 0.6409479, -0.7628027, 1, 1, 1, 1, 1,
0.5991877, 0.3513644, -0.2142631, 1, 1, 1, 1, 1,
0.6054553, 0.7680292, 0.6311715, 1, 1, 1, 1, 1,
0.6082187, 0.4846433, 2.621782, 1, 1, 1, 1, 1,
0.6102427, 2.324347, -0.4014315, 0, 0, 1, 1, 1,
0.6133415, 0.4995464, 1.301104, 1, 0, 0, 1, 1,
0.6180476, -0.08677547, 2.520098, 1, 0, 0, 1, 1,
0.6282811, 0.2051997, 0.0581864, 1, 0, 0, 1, 1,
0.6316702, -1.412266, 2.950055, 1, 0, 0, 1, 1,
0.6338927, 0.6558538, 2.886257, 1, 0, 0, 1, 1,
0.634612, -1.425175, 2.191803, 0, 0, 0, 1, 1,
0.635256, 2.733549, 0.8473904, 0, 0, 0, 1, 1,
0.6414956, 0.5272005, 1.286603, 0, 0, 0, 1, 1,
0.6441572, 0.2883947, 3.504186, 0, 0, 0, 1, 1,
0.6478588, 0.5407813, 3.657902, 0, 0, 0, 1, 1,
0.6696056, 1.25572, 1.063895, 0, 0, 0, 1, 1,
0.6699828, 0.4620824, 2.813327, 0, 0, 0, 1, 1,
0.671474, -0.6763474, 1.235929, 1, 1, 1, 1, 1,
0.6733985, 0.7697212, 2.607144, 1, 1, 1, 1, 1,
0.6755835, -0.789808, 2.896575, 1, 1, 1, 1, 1,
0.6841043, 0.9663672, 0.783606, 1, 1, 1, 1, 1,
0.6843356, -0.6997561, 2.568835, 1, 1, 1, 1, 1,
0.6859766, -1.431445, 4.03792, 1, 1, 1, 1, 1,
0.6881396, 0.4902326, 2.53694, 1, 1, 1, 1, 1,
0.6897712, 0.03170272, 2.771498, 1, 1, 1, 1, 1,
0.6926659, -0.5272003, -0.002637471, 1, 1, 1, 1, 1,
0.6963822, -0.6083065, 2.297849, 1, 1, 1, 1, 1,
0.6969628, 0.2051869, 0.6149638, 1, 1, 1, 1, 1,
0.7001383, 1.335187, 0.6435508, 1, 1, 1, 1, 1,
0.7005795, -0.3031071, 0.8046221, 1, 1, 1, 1, 1,
0.7038963, -0.5293121, 2.923636, 1, 1, 1, 1, 1,
0.7121454, -2.047592, 3.176478, 1, 1, 1, 1, 1,
0.712596, 0.3390235, 1.461335, 0, 0, 1, 1, 1,
0.7216029, -2.82681, 3.004615, 1, 0, 0, 1, 1,
0.7288415, 0.8992798, -0.6526746, 1, 0, 0, 1, 1,
0.7351967, 1.48047, -0.2571653, 1, 0, 0, 1, 1,
0.7381542, -0.6287351, 2.161719, 1, 0, 0, 1, 1,
0.7394605, 0.3196869, 0.6079661, 1, 0, 0, 1, 1,
0.7395285, -1.201865, 3.473507, 0, 0, 0, 1, 1,
0.7434245, 1.073356, 0.7701639, 0, 0, 0, 1, 1,
0.7465508, 0.9157168, 0.3523156, 0, 0, 0, 1, 1,
0.7503514, -0.1248436, 1.277606, 0, 0, 0, 1, 1,
0.7553408, 0.9452817, -0.8888249, 0, 0, 0, 1, 1,
0.7581378, -0.7593254, 2.066051, 0, 0, 0, 1, 1,
0.7587857, 0.5541887, 0.811412, 0, 0, 0, 1, 1,
0.7636756, 0.2251218, 1.818825, 1, 1, 1, 1, 1,
0.7715035, 0.1817616, 0.8549262, 1, 1, 1, 1, 1,
0.7718658, 0.1694469, 0.3692818, 1, 1, 1, 1, 1,
0.772929, -1.819219, 2.281666, 1, 1, 1, 1, 1,
0.7746987, -0.2378134, 2.841146, 1, 1, 1, 1, 1,
0.7797799, 1.112106, 0.1678617, 1, 1, 1, 1, 1,
0.7806169, -0.4143937, 1.003185, 1, 1, 1, 1, 1,
0.7835845, 0.3405869, 1.411559, 1, 1, 1, 1, 1,
0.7849429, 1.398367, 1.327025, 1, 1, 1, 1, 1,
0.787706, 0.07833859, 0.2399126, 1, 1, 1, 1, 1,
0.7897373, 0.4445292, 2.326747, 1, 1, 1, 1, 1,
0.7974044, 0.3863105, 2.217748, 1, 1, 1, 1, 1,
0.8014615, 1.430336, -0.4582795, 1, 1, 1, 1, 1,
0.8112398, -1.822386, 2.887195, 1, 1, 1, 1, 1,
0.8131196, -1.363969, 3.701301, 1, 1, 1, 1, 1,
0.8203199, -0.2170289, 2.998105, 0, 0, 1, 1, 1,
0.8277552, 1.40204, 0.2024258, 1, 0, 0, 1, 1,
0.835556, 0.7255386, 1.396014, 1, 0, 0, 1, 1,
0.842693, 0.9068961, 2.013368, 1, 0, 0, 1, 1,
0.8438674, -0.6381148, 2.777087, 1, 0, 0, 1, 1,
0.8486341, 0.7483852, 1.920963, 1, 0, 0, 1, 1,
0.8559523, -1.128346, 6.324253, 0, 0, 0, 1, 1,
0.8611138, 0.2402003, 1.490304, 0, 0, 0, 1, 1,
0.8673442, 0.533708, 1.05653, 0, 0, 0, 1, 1,
0.8706818, -0.6952156, 1.057152, 0, 0, 0, 1, 1,
0.8717408, 0.04559071, 1.367201, 0, 0, 0, 1, 1,
0.8759047, -1.17653, 3.448264, 0, 0, 0, 1, 1,
0.8775131, 0.5297108, 1.279581, 0, 0, 0, 1, 1,
0.8811327, 0.7958248, -0.3853677, 1, 1, 1, 1, 1,
0.8883056, 1.961904, 1.703304, 1, 1, 1, 1, 1,
0.8904282, -0.692036, 3.09814, 1, 1, 1, 1, 1,
0.8930525, 0.06831066, 0.3789211, 1, 1, 1, 1, 1,
0.8953091, -0.2240641, -0.4839756, 1, 1, 1, 1, 1,
0.8959474, -1.141298, 2.22345, 1, 1, 1, 1, 1,
0.9045665, -1.68061, 1.739525, 1, 1, 1, 1, 1,
0.9052773, 0.7833, 0.8340793, 1, 1, 1, 1, 1,
0.9096074, -0.1958901, 2.628648, 1, 1, 1, 1, 1,
0.9108549, -0.5998875, 3.34967, 1, 1, 1, 1, 1,
0.9126544, -0.2830367, 1.860334, 1, 1, 1, 1, 1,
0.9140089, 0.1266737, 3.067313, 1, 1, 1, 1, 1,
0.9251896, 1.656365, -0.4946408, 1, 1, 1, 1, 1,
0.9271299, -0.5905738, 3.198932, 1, 1, 1, 1, 1,
0.9272689, -0.03679305, 2.210286, 1, 1, 1, 1, 1,
0.9389676, 0.8031613, 1.204999, 0, 0, 1, 1, 1,
0.9424231, 1.413728, 1.537443, 1, 0, 0, 1, 1,
0.9471997, -0.9936242, 2.44778, 1, 0, 0, 1, 1,
0.9528871, 0.4110549, -0.03581797, 1, 0, 0, 1, 1,
0.9643754, 0.4580967, 3.407238, 1, 0, 0, 1, 1,
0.9688908, -0.6606285, 1.001377, 1, 0, 0, 1, 1,
0.9713456, -1.19583, 3.081104, 0, 0, 0, 1, 1,
0.981306, 0.7974347, 1.331109, 0, 0, 0, 1, 1,
0.9820887, -0.1030679, 2.076829, 0, 0, 0, 1, 1,
0.9833221, -0.1055822, 1.112398, 0, 0, 0, 1, 1,
0.9871809, -0.7846611, 2.048482, 0, 0, 0, 1, 1,
0.9914987, 1.134232, 0.7575306, 0, 0, 0, 1, 1,
0.9929864, -0.04213663, 3.507997, 0, 0, 0, 1, 1,
0.9940453, 0.08177494, 2.42638, 1, 1, 1, 1, 1,
0.995094, 1.059921, 0.4419711, 1, 1, 1, 1, 1,
0.9970081, -0.7380682, 2.258338, 1, 1, 1, 1, 1,
0.9992349, 0.7867828, -0.5283234, 1, 1, 1, 1, 1,
1.001175, 0.1467667, 1.655177, 1, 1, 1, 1, 1,
1.002644, 1.638044, -0.03149074, 1, 1, 1, 1, 1,
1.006418, -0.6576267, 4.893332, 1, 1, 1, 1, 1,
1.008722, 1.295763, 3.061197, 1, 1, 1, 1, 1,
1.010298, 0.6057206, 1.202596, 1, 1, 1, 1, 1,
1.015981, 0.7390885, 0.1178825, 1, 1, 1, 1, 1,
1.02149, -0.09367196, 2.150007, 1, 1, 1, 1, 1,
1.027526, 0.481453, 3.220661, 1, 1, 1, 1, 1,
1.027629, -0.1896325, 1.463987, 1, 1, 1, 1, 1,
1.034248, 0.9867872, 1.36362, 1, 1, 1, 1, 1,
1.036058, -0.09510924, 2.694908, 1, 1, 1, 1, 1,
1.042405, -0.5304792, 2.563628, 0, 0, 1, 1, 1,
1.047233, 1.398603, 0.3158777, 1, 0, 0, 1, 1,
1.051134, 2.115255, 1.127405, 1, 0, 0, 1, 1,
1.056081, -0.0463354, 0.9996074, 1, 0, 0, 1, 1,
1.059973, 0.9262373, 0.6212927, 1, 0, 0, 1, 1,
1.066316, 1.261997, -1.315812, 1, 0, 0, 1, 1,
1.066384, 1.670294, 0.01703922, 0, 0, 0, 1, 1,
1.067106, 0.5870973, 2.999259, 0, 0, 0, 1, 1,
1.067167, 0.7681249, 0.2325834, 0, 0, 0, 1, 1,
1.067407, 0.92154, 1.046048, 0, 0, 0, 1, 1,
1.071092, -0.3661893, 0.8804991, 0, 0, 0, 1, 1,
1.071865, -1.400147, 3.990486, 0, 0, 0, 1, 1,
1.074311, -1.083879, 1.610791, 0, 0, 0, 1, 1,
1.079711, 0.9514578, 2.429341, 1, 1, 1, 1, 1,
1.085037, -0.7156422, 2.492314, 1, 1, 1, 1, 1,
1.085286, -1.515344, 1.710787, 1, 1, 1, 1, 1,
1.086624, 0.728655, -0.8270826, 1, 1, 1, 1, 1,
1.087027, -0.3929517, 1.112733, 1, 1, 1, 1, 1,
1.102409, -1.032078, 3.144922, 1, 1, 1, 1, 1,
1.113297, -1.472131, 3.778193, 1, 1, 1, 1, 1,
1.113889, 0.6724113, 2.599964, 1, 1, 1, 1, 1,
1.125672, 0.3981815, 2.022877, 1, 1, 1, 1, 1,
1.133542, -0.9195117, 3.358112, 1, 1, 1, 1, 1,
1.138357, 0.5037318, 2.618186, 1, 1, 1, 1, 1,
1.146896, -0.8080816, 4.079449, 1, 1, 1, 1, 1,
1.147292, -2.504563, 2.659364, 1, 1, 1, 1, 1,
1.152046, 0.5751858, 2.108299, 1, 1, 1, 1, 1,
1.157818, 0.8868805, 3.253474, 1, 1, 1, 1, 1,
1.163144, -0.6911963, 2.43536, 0, 0, 1, 1, 1,
1.166872, -0.4237292, 1.755893, 1, 0, 0, 1, 1,
1.18244, -1.233867, 1.968295, 1, 0, 0, 1, 1,
1.182886, -0.7827731, 0.5036643, 1, 0, 0, 1, 1,
1.194572, -1.484409, 2.480018, 1, 0, 0, 1, 1,
1.195504, -0.5774947, 2.516637, 1, 0, 0, 1, 1,
1.196071, -2.763912, 2.424543, 0, 0, 0, 1, 1,
1.198736, -0.7588991, 2.511086, 0, 0, 0, 1, 1,
1.204281, 1.6541, -0.08920305, 0, 0, 0, 1, 1,
1.210879, -1.443762, 3.708352, 0, 0, 0, 1, 1,
1.218485, 1.02398, -0.361056, 0, 0, 0, 1, 1,
1.22821, -0.876124, -0.296542, 0, 0, 0, 1, 1,
1.247494, -0.1920799, 2.694117, 0, 0, 0, 1, 1,
1.250903, -0.1976432, 1.44995, 1, 1, 1, 1, 1,
1.255289, -1.154475, 1.810405, 1, 1, 1, 1, 1,
1.2565, -2.923515, 2.965069, 1, 1, 1, 1, 1,
1.269217, 0.3281189, 2.393688, 1, 1, 1, 1, 1,
1.276892, -1.784795, 1.768025, 1, 1, 1, 1, 1,
1.283323, -1.319976, 2.239946, 1, 1, 1, 1, 1,
1.284602, -0.7998312, 2.53199, 1, 1, 1, 1, 1,
1.287323, -0.06994423, 2.320243, 1, 1, 1, 1, 1,
1.303257, -0.4691953, 2.183438, 1, 1, 1, 1, 1,
1.304066, -0.7086893, 2.486331, 1, 1, 1, 1, 1,
1.307878, 0.6167527, 1.592753, 1, 1, 1, 1, 1,
1.318517, -0.5662519, 2.163746, 1, 1, 1, 1, 1,
1.318828, 1.776669, 0.4005461, 1, 1, 1, 1, 1,
1.3261, -0.3745837, 1.536415, 1, 1, 1, 1, 1,
1.329674, 0.9986828, -0.4871595, 1, 1, 1, 1, 1,
1.331744, -0.04399903, 1.606993, 0, 0, 1, 1, 1,
1.339921, 1.438751, 1.925155, 1, 0, 0, 1, 1,
1.342709, 1.940543, 0.3049701, 1, 0, 0, 1, 1,
1.345397, -0.2662375, 1.110864, 1, 0, 0, 1, 1,
1.354645, -0.9182945, 3.023067, 1, 0, 0, 1, 1,
1.354745, -0.1624958, -0.2349163, 1, 0, 0, 1, 1,
1.356615, 0.7234456, 1.162801, 0, 0, 0, 1, 1,
1.360945, 0.3373605, 1.503797, 0, 0, 0, 1, 1,
1.390016, 2.166771, 1.17217, 0, 0, 0, 1, 1,
1.403185, 0.5608872, 1.066754, 0, 0, 0, 1, 1,
1.407459, -1.025723, 3.480144, 0, 0, 0, 1, 1,
1.410737, 0.7417519, -0.2659347, 0, 0, 0, 1, 1,
1.41443, 0.0832846, 1.338946, 0, 0, 0, 1, 1,
1.417414, -0.008363181, -0.5215809, 1, 1, 1, 1, 1,
1.419191, 0.5712267, -0.3234591, 1, 1, 1, 1, 1,
1.423133, 0.1167186, 1.92867, 1, 1, 1, 1, 1,
1.42887, -0.006738706, 0.6189373, 1, 1, 1, 1, 1,
1.432116, 1.672163, 1.767309, 1, 1, 1, 1, 1,
1.446854, -0.4333648, 1.265393, 1, 1, 1, 1, 1,
1.450138, 0.06486069, 0.8771766, 1, 1, 1, 1, 1,
1.451662, -0.1169885, 1.346874, 1, 1, 1, 1, 1,
1.455288, -0.8240494, 3.283858, 1, 1, 1, 1, 1,
1.462891, 0.1671819, 3.483274, 1, 1, 1, 1, 1,
1.48577, 1.708147, 1.213717, 1, 1, 1, 1, 1,
1.486701, 0.7081016, 1.680981, 1, 1, 1, 1, 1,
1.486984, -1.550238, 4.343762, 1, 1, 1, 1, 1,
1.487304, -0.3611937, 1.821029, 1, 1, 1, 1, 1,
1.496207, 1.517869, 1.584765, 1, 1, 1, 1, 1,
1.504065, -0.05679601, 2.464923, 0, 0, 1, 1, 1,
1.505736, 0.2300505, 1.945941, 1, 0, 0, 1, 1,
1.513058, 0.8939224, 2.479594, 1, 0, 0, 1, 1,
1.518419, -0.2517343, 0.2402525, 1, 0, 0, 1, 1,
1.527691, 0.004120333, 2.768789, 1, 0, 0, 1, 1,
1.535805, -1.290257, 2.541236, 1, 0, 0, 1, 1,
1.540381, 0.02394424, 4.246749, 0, 0, 0, 1, 1,
1.54135, -0.2646387, 1.239535, 0, 0, 0, 1, 1,
1.553949, 0.6429645, 0.1304006, 0, 0, 0, 1, 1,
1.561782, -1.996444, 0.5746441, 0, 0, 0, 1, 1,
1.563735, 0.7598619, -1.039259, 0, 0, 0, 1, 1,
1.563831, 1.638587, 1.173037, 0, 0, 0, 1, 1,
1.578743, -1.394013, 1.599012, 0, 0, 0, 1, 1,
1.584097, 1.166255, 1.210384, 1, 1, 1, 1, 1,
1.587631, 0.6326506, 1.031661, 1, 1, 1, 1, 1,
1.595747, 0.8860439, 1.514166, 1, 1, 1, 1, 1,
1.610528, -0.08692896, 1.326915, 1, 1, 1, 1, 1,
1.624114, 0.2584986, 1.102972, 1, 1, 1, 1, 1,
1.635937, -0.02252348, -0.04126601, 1, 1, 1, 1, 1,
1.643227, -0.344895, 1.110009, 1, 1, 1, 1, 1,
1.649027, 0.08406449, 0.5460582, 1, 1, 1, 1, 1,
1.708701, -1.173205, 1.800803, 1, 1, 1, 1, 1,
1.711004, -1.08989, 3.027721, 1, 1, 1, 1, 1,
1.711813, 0.3309478, 2.097994, 1, 1, 1, 1, 1,
1.715066, -0.7732, 2.328771, 1, 1, 1, 1, 1,
1.724867, -1.621016, 2.658605, 1, 1, 1, 1, 1,
1.737779, -0.1881012, 2.754281, 1, 1, 1, 1, 1,
1.74078, 0.4458733, 2.112931, 1, 1, 1, 1, 1,
1.744575, 2.053488, -1.940061, 0, 0, 1, 1, 1,
1.747182, 0.9369638, 2.95673, 1, 0, 0, 1, 1,
1.752715, -0.7014838, 0.8904446, 1, 0, 0, 1, 1,
1.754054, -1.126834, 1.906813, 1, 0, 0, 1, 1,
1.767632, -0.04081154, 2.477663, 1, 0, 0, 1, 1,
1.775284, -1.008197, 3.315533, 1, 0, 0, 1, 1,
1.792109, -0.3825025, 2.176566, 0, 0, 0, 1, 1,
1.822808, -0.4473126, 2.259954, 0, 0, 0, 1, 1,
1.872867, -0.8810972, 2.114992, 0, 0, 0, 1, 1,
1.881112, -0.174602, 0.8887582, 0, 0, 0, 1, 1,
1.896532, 1.15823, 2.98779, 0, 0, 0, 1, 1,
1.900647, 1.515261, 0.9804293, 0, 0, 0, 1, 1,
1.91367, -0.6286028, 2.702149, 0, 0, 0, 1, 1,
1.925279, -1.448051, 3.070233, 1, 1, 1, 1, 1,
1.952746, -1.006063, 2.581428, 1, 1, 1, 1, 1,
1.957273, -1.358215, 1.019422, 1, 1, 1, 1, 1,
1.960443, 0.01693433, 2.089442, 1, 1, 1, 1, 1,
1.970018, -0.2237713, 1.02325, 1, 1, 1, 1, 1,
1.997014, -0.9767621, 1.642815, 1, 1, 1, 1, 1,
2.053968, 0.8573254, 1.414574, 1, 1, 1, 1, 1,
2.103487, -1.402922, 1.318995, 1, 1, 1, 1, 1,
2.108949, 0.7365002, 0.9771218, 1, 1, 1, 1, 1,
2.157717, -0.08670423, 2.695743, 1, 1, 1, 1, 1,
2.158394, -0.5625649, 0.6217479, 1, 1, 1, 1, 1,
2.173669, -2.097147, 1.035383, 1, 1, 1, 1, 1,
2.176, -0.2228618, 2.388073, 1, 1, 1, 1, 1,
2.179277, 0.9306192, 1.317578, 1, 1, 1, 1, 1,
2.243469, -0.6314524, 2.064199, 1, 1, 1, 1, 1,
2.279721, 1.142705, 1.898887, 0, 0, 1, 1, 1,
2.291917, 0.2182845, 3.357305, 1, 0, 0, 1, 1,
2.314317, -0.1992609, 1.772079, 1, 0, 0, 1, 1,
2.326643, 0.1465407, 1.81032, 1, 0, 0, 1, 1,
2.385776, -0.7386127, 1.220307, 1, 0, 0, 1, 1,
2.39411, 1.87542, 0.515634, 1, 0, 0, 1, 1,
2.464119, 0.1873014, 3.134319, 0, 0, 0, 1, 1,
2.496676, -0.6240646, -0.02802506, 0, 0, 0, 1, 1,
2.507178, -0.5163362, 2.663587, 0, 0, 0, 1, 1,
2.540723, -0.5922093, 1.583464, 0, 0, 0, 1, 1,
2.575452, 2.016901, 0.8424982, 0, 0, 0, 1, 1,
2.578741, 0.006029574, 2.663748, 0, 0, 0, 1, 1,
2.646557, -0.6420882, 0.8346349, 0, 0, 0, 1, 1,
2.812641, -1.008662, 2.724233, 1, 1, 1, 1, 1,
2.817686, 1.072222, -0.4809989, 1, 1, 1, 1, 1,
2.851559, 0.8333613, 0.6961664, 1, 1, 1, 1, 1,
2.886297, 0.3683423, 1.889732, 1, 1, 1, 1, 1,
3.008153, 0.7985402, 1.801217, 1, 1, 1, 1, 1,
3.066998, 0.8315988, 1.47355, 1, 1, 1, 1, 1,
3.116495, 0.2339658, 0.6731771, 1, 1, 1, 1, 1
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
var radius = 10.20791;
var distance = 35.85486;
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
mvMatrix.translate( 0.3584623, -0.1722827, -0.4259326 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.85486);
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
