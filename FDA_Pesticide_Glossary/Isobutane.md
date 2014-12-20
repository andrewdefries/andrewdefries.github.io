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
-4.154372, -1.87712, -1.042714, 1, 0, 0, 1,
-4.032704, -1.184401, -2.194162, 1, 0.007843138, 0, 1,
-3.533566, 0.9684924, -2.571023, 1, 0.01176471, 0, 1,
-3.261013, -0.7270948, -3.830519, 1, 0.01960784, 0, 1,
-3.163341, -0.3210011, -2.482603, 1, 0.02352941, 0, 1,
-3.075138, 0.3483222, -0.7400366, 1, 0.03137255, 0, 1,
-2.780898, 0.5762067, -1.856832, 1, 0.03529412, 0, 1,
-2.705994, -0.5607418, -0.6342247, 1, 0.04313726, 0, 1,
-2.590683, -0.5107282, -1.924145, 1, 0.04705882, 0, 1,
-2.54103, 0.7009313, -1.777397, 1, 0.05490196, 0, 1,
-2.458061, 0.405782, -3.432023, 1, 0.05882353, 0, 1,
-2.440542, 1.591555, -1.536608, 1, 0.06666667, 0, 1,
-2.369415, 0.3626034, -0.5714577, 1, 0.07058824, 0, 1,
-2.357485, 0.6857253, -1.427335, 1, 0.07843138, 0, 1,
-2.330228, 1.585686, 0.2292751, 1, 0.08235294, 0, 1,
-2.310147, 0.7101564, -2.101748, 1, 0.09019608, 0, 1,
-2.29754, 0.3439741, -3.128175, 1, 0.09411765, 0, 1,
-2.293216, 0.4830782, 0.6781605, 1, 0.1019608, 0, 1,
-2.287465, 0.2805164, -2.390293, 1, 0.1098039, 0, 1,
-2.2863, 2.03763, -0.3143187, 1, 0.1137255, 0, 1,
-2.281788, -1.023128, -1.41516, 1, 0.1215686, 0, 1,
-2.253938, 0.6425815, -2.578248, 1, 0.1254902, 0, 1,
-2.213274, 0.3058698, -2.187663, 1, 0.1333333, 0, 1,
-2.185584, -1.180727, -0.8134797, 1, 0.1372549, 0, 1,
-2.178706, -0.04068688, -3.383074, 1, 0.145098, 0, 1,
-2.176426, -0.4658821, -1.086446, 1, 0.1490196, 0, 1,
-2.129778, -0.09092084, -1.219483, 1, 0.1568628, 0, 1,
-2.118114, -0.6408399, 0.3615491, 1, 0.1607843, 0, 1,
-2.105801, -1.071237, -2.018737, 1, 0.1686275, 0, 1,
-2.075451, -0.9983277, -0.1010758, 1, 0.172549, 0, 1,
-2.071996, -1.538383, -1.832826, 1, 0.1803922, 0, 1,
-2.061531, 2.004749, -1.832654, 1, 0.1843137, 0, 1,
-2.04552, 0.08799437, -0.393371, 1, 0.1921569, 0, 1,
-2.032062, 1.54924, -1.200339, 1, 0.1960784, 0, 1,
-2.023425, 1.174026, -1.422331, 1, 0.2039216, 0, 1,
-1.998633, -1.202404, -0.1780677, 1, 0.2117647, 0, 1,
-1.977726, -0.5945919, -0.9771112, 1, 0.2156863, 0, 1,
-1.964823, 0.4082155, -0.3575279, 1, 0.2235294, 0, 1,
-1.947157, 0.5124382, -3.555212, 1, 0.227451, 0, 1,
-1.88223, 0.0383557, 1.189828, 1, 0.2352941, 0, 1,
-1.82444, -0.7511823, -2.198354, 1, 0.2392157, 0, 1,
-1.791405, -0.1117213, -3.02458, 1, 0.2470588, 0, 1,
-1.779609, 1.525228, -1.472861, 1, 0.2509804, 0, 1,
-1.764979, 1.532033, -0.9471422, 1, 0.2588235, 0, 1,
-1.759205, -2.844895, -2.605458, 1, 0.2627451, 0, 1,
-1.745506, 0.2880144, -2.12588, 1, 0.2705882, 0, 1,
-1.711702, -1.041166, -0.790764, 1, 0.2745098, 0, 1,
-1.699114, 0.1483694, -2.13051, 1, 0.282353, 0, 1,
-1.689428, -1.464218, -3.427834, 1, 0.2862745, 0, 1,
-1.687605, 0.333988, -2.202449, 1, 0.2941177, 0, 1,
-1.687078, -0.2136534, -2.473338, 1, 0.3019608, 0, 1,
-1.684208, 0.01983949, -1.125436, 1, 0.3058824, 0, 1,
-1.681353, -0.04028558, -3.349251, 1, 0.3137255, 0, 1,
-1.679983, -1.634185, -1.605727, 1, 0.3176471, 0, 1,
-1.678278, 0.8093888, -1.794867, 1, 0.3254902, 0, 1,
-1.6197, -0.7989177, -0.6822712, 1, 0.3294118, 0, 1,
-1.611133, 0.2726455, -1.076088, 1, 0.3372549, 0, 1,
-1.610853, 1.456061, -2.056229, 1, 0.3411765, 0, 1,
-1.61003, -0.8329124, -2.605344, 1, 0.3490196, 0, 1,
-1.587154, -0.5620264, -0.7846064, 1, 0.3529412, 0, 1,
-1.583817, -0.8431748, -0.7139412, 1, 0.3607843, 0, 1,
-1.577193, 1.724667, -0.6170052, 1, 0.3647059, 0, 1,
-1.574201, 0.04923157, 0.02075298, 1, 0.372549, 0, 1,
-1.56725, 0.6320266, -2.396584, 1, 0.3764706, 0, 1,
-1.564856, -0.3724744, -2.116211, 1, 0.3843137, 0, 1,
-1.559993, -0.315515, -1.400759, 1, 0.3882353, 0, 1,
-1.545036, -1.198338, -2.312929, 1, 0.3960784, 0, 1,
-1.544447, 0.5078602, -2.815751, 1, 0.4039216, 0, 1,
-1.539025, -1.718735, -3.058855, 1, 0.4078431, 0, 1,
-1.531343, 1.901253, -0.3960277, 1, 0.4156863, 0, 1,
-1.530638, -1.433284, -2.874402, 1, 0.4196078, 0, 1,
-1.526971, 1.392519, -1.367578, 1, 0.427451, 0, 1,
-1.52301, 0.09105163, -1.564921, 1, 0.4313726, 0, 1,
-1.515516, -0.7523158, -3.123139, 1, 0.4392157, 0, 1,
-1.512918, -0.1590611, -2.490983, 1, 0.4431373, 0, 1,
-1.511655, 0.09871607, -1.840769, 1, 0.4509804, 0, 1,
-1.510173, 1.007654, -2.316256, 1, 0.454902, 0, 1,
-1.50882, -0.700853, -2.028506, 1, 0.4627451, 0, 1,
-1.500268, 0.3168034, -1.618948, 1, 0.4666667, 0, 1,
-1.489115, 0.406191, -1.308254, 1, 0.4745098, 0, 1,
-1.488841, -0.1070257, -1.101046, 1, 0.4784314, 0, 1,
-1.486371, -1.801171, -2.947693, 1, 0.4862745, 0, 1,
-1.478485, 1.243277, -1.372681, 1, 0.4901961, 0, 1,
-1.46998, -0.1923561, -2.532477, 1, 0.4980392, 0, 1,
-1.463494, -0.6233374, -2.206297, 1, 0.5058824, 0, 1,
-1.460427, 0.2693098, -1.16742, 1, 0.509804, 0, 1,
-1.452224, -1.566013, -1.815236, 1, 0.5176471, 0, 1,
-1.445433, -0.1572159, -3.662094, 1, 0.5215687, 0, 1,
-1.441224, 1.221933, -0.3552736, 1, 0.5294118, 0, 1,
-1.436417, 0.5375493, -4.417433, 1, 0.5333334, 0, 1,
-1.429557, 0.5164073, -1.546807, 1, 0.5411765, 0, 1,
-1.417016, -0.9501842, -2.63418, 1, 0.5450981, 0, 1,
-1.404222, 1.918867, -0.3224446, 1, 0.5529412, 0, 1,
-1.403832, 1.01352, 0.2432138, 1, 0.5568628, 0, 1,
-1.39753, 0.4591959, -2.986078, 1, 0.5647059, 0, 1,
-1.396661, 2.501729, -0.1332385, 1, 0.5686275, 0, 1,
-1.389262, 1.492799, 0.6703815, 1, 0.5764706, 0, 1,
-1.385404, -0.6915466, -2.083351, 1, 0.5803922, 0, 1,
-1.382842, -0.7278609, -3.261906, 1, 0.5882353, 0, 1,
-1.381563, -1.807111, -4.326394, 1, 0.5921569, 0, 1,
-1.365039, -1.807097, -2.183703, 1, 0.6, 0, 1,
-1.347159, -0.9640346, -2.548617, 1, 0.6078432, 0, 1,
-1.344627, 0.02194679, -2.999655, 1, 0.6117647, 0, 1,
-1.33778, 0.9129298, -0.8037317, 1, 0.6196079, 0, 1,
-1.337067, 1.629879, -3.036525, 1, 0.6235294, 0, 1,
-1.325551, -0.02981374, -2.7878, 1, 0.6313726, 0, 1,
-1.324805, -0.03351288, -1.942744, 1, 0.6352941, 0, 1,
-1.322819, -0.06735846, -0.9288718, 1, 0.6431373, 0, 1,
-1.321798, -0.8121266, -2.650585, 1, 0.6470588, 0, 1,
-1.321266, -1.596237, -3.096166, 1, 0.654902, 0, 1,
-1.302245, 1.178077, -1.933684, 1, 0.6588235, 0, 1,
-1.300889, -1.675759, -2.649469, 1, 0.6666667, 0, 1,
-1.295635, -0.1264846, -0.8215783, 1, 0.6705883, 0, 1,
-1.293039, -0.4685363, -2.198159, 1, 0.6784314, 0, 1,
-1.276751, 0.09887204, -1.350219, 1, 0.682353, 0, 1,
-1.264188, -0.3083047, -0.9962902, 1, 0.6901961, 0, 1,
-1.2598, 0.01508007, -2.511526, 1, 0.6941177, 0, 1,
-1.255076, -0.2486609, -1.705256, 1, 0.7019608, 0, 1,
-1.251817, -1.487428, -2.345839, 1, 0.7098039, 0, 1,
-1.250827, -1.918235, -2.918085, 1, 0.7137255, 0, 1,
-1.244143, -1.875768, -2.515244, 1, 0.7215686, 0, 1,
-1.236601, -0.6512658, -2.745965, 1, 0.7254902, 0, 1,
-1.231397, 0.991317, -1.468423, 1, 0.7333333, 0, 1,
-1.227903, 0.8073858, -0.4397563, 1, 0.7372549, 0, 1,
-1.22757, 0.7249594, -0.3433924, 1, 0.7450981, 0, 1,
-1.225212, -1.347932, -2.011281, 1, 0.7490196, 0, 1,
-1.224685, -0.2628508, -2.958228, 1, 0.7568628, 0, 1,
-1.218106, 0.7160384, -1.177248, 1, 0.7607843, 0, 1,
-1.212292, 0.858675, -0.4264458, 1, 0.7686275, 0, 1,
-1.208693, -0.5495422, -1.8882, 1, 0.772549, 0, 1,
-1.194425, -1.144678, -2.461742, 1, 0.7803922, 0, 1,
-1.186696, 1.686733, -1.394841, 1, 0.7843137, 0, 1,
-1.183811, 0.9072321, 0.6981934, 1, 0.7921569, 0, 1,
-1.176886, -2.182859, -3.26761, 1, 0.7960784, 0, 1,
-1.165234, 1.334954, 0.8672949, 1, 0.8039216, 0, 1,
-1.158611, 0.01485828, -1.489558, 1, 0.8117647, 0, 1,
-1.153683, -0.2186775, -1.838276, 1, 0.8156863, 0, 1,
-1.147584, 0.07543451, -3.097778, 1, 0.8235294, 0, 1,
-1.146513, 0.1423315, -1.751114, 1, 0.827451, 0, 1,
-1.144651, 1.159639, -1.835245, 1, 0.8352941, 0, 1,
-1.139491, -0.2417489, -0.7789782, 1, 0.8392157, 0, 1,
-1.136806, 0.4156156, -1.692137, 1, 0.8470588, 0, 1,
-1.132229, 1.095332, -0.01109375, 1, 0.8509804, 0, 1,
-1.131098, -0.5871093, -2.078777, 1, 0.8588235, 0, 1,
-1.124081, -0.6576165, -1.646173, 1, 0.8627451, 0, 1,
-1.119996, 0.1602471, -2.361286, 1, 0.8705882, 0, 1,
-1.11986, 0.8977196, -0.7508529, 1, 0.8745098, 0, 1,
-1.10976, -1.115996, -2.167192, 1, 0.8823529, 0, 1,
-1.109572, 1.42479, -0.4808509, 1, 0.8862745, 0, 1,
-1.10777, 0.4119394, -1.690459, 1, 0.8941177, 0, 1,
-1.103714, -0.9982715, -1.053098, 1, 0.8980392, 0, 1,
-1.102032, -0.6193955, 0.7848585, 1, 0.9058824, 0, 1,
-1.100628, 1.078337, -1.868802, 1, 0.9137255, 0, 1,
-1.096623, 0.2399372, -0.8047656, 1, 0.9176471, 0, 1,
-1.095723, 0.9400795, -0.06197654, 1, 0.9254902, 0, 1,
-1.093636, -0.2223081, -2.385019, 1, 0.9294118, 0, 1,
-1.088925, -0.5475421, -2.102396, 1, 0.9372549, 0, 1,
-1.088495, 0.4816293, -2.822636, 1, 0.9411765, 0, 1,
-1.087238, -0.2078082, -2.173805, 1, 0.9490196, 0, 1,
-1.077966, 0.1017816, -0.8290437, 1, 0.9529412, 0, 1,
-1.056178, -0.7389107, -1.416561, 1, 0.9607843, 0, 1,
-1.051592, 0.1052811, -3.445453, 1, 0.9647059, 0, 1,
-1.048567, -0.2002069, 0.213521, 1, 0.972549, 0, 1,
-1.045612, -0.1786905, -1.486662, 1, 0.9764706, 0, 1,
-1.043547, -0.1622429, -0.7046046, 1, 0.9843137, 0, 1,
-1.042372, 1.395896, -1.411157, 1, 0.9882353, 0, 1,
-1.041602, -0.4599433, -1.783367, 1, 0.9960784, 0, 1,
-1.03862, -0.5874997, 0.009411018, 0.9960784, 1, 0, 1,
-1.038316, 0.3443233, -1.768819, 0.9921569, 1, 0, 1,
-1.031443, 1.954125, -0.5197283, 0.9843137, 1, 0, 1,
-1.011632, 1.047109, -0.8018022, 0.9803922, 1, 0, 1,
-1.001753, -0.01493349, -0.6022213, 0.972549, 1, 0, 1,
-0.9904019, -0.3848532, -1.175214, 0.9686275, 1, 0, 1,
-0.9900785, 0.461247, -1.992388, 0.9607843, 1, 0, 1,
-0.9888169, -0.2236367, -2.930458, 0.9568627, 1, 0, 1,
-0.9853252, -0.6660606, -4.10516, 0.9490196, 1, 0, 1,
-0.9793621, -0.4824232, -2.103098, 0.945098, 1, 0, 1,
-0.9778209, 0.5660079, -2.115635, 0.9372549, 1, 0, 1,
-0.9773991, -0.08022472, -1.867359, 0.9333333, 1, 0, 1,
-0.9699997, -0.9569056, -1.661247, 0.9254902, 1, 0, 1,
-0.9697152, 0.2854179, -0.9072927, 0.9215686, 1, 0, 1,
-0.9559445, 1.502737, -0.1106304, 0.9137255, 1, 0, 1,
-0.9553729, -0.3191287, -0.437654, 0.9098039, 1, 0, 1,
-0.9552909, -1.454754, -0.7291472, 0.9019608, 1, 0, 1,
-0.9477369, -0.1714806, -1.911224, 0.8941177, 1, 0, 1,
-0.946603, -0.06455158, -1.949687, 0.8901961, 1, 0, 1,
-0.9413236, -0.5687618, -3.603432, 0.8823529, 1, 0, 1,
-0.9405764, -0.6730057, -1.894706, 0.8784314, 1, 0, 1,
-0.9307252, 0.4856263, -1.734215, 0.8705882, 1, 0, 1,
-0.9263743, -0.6316895, -3.333941, 0.8666667, 1, 0, 1,
-0.9206756, -0.8170113, -1.049208, 0.8588235, 1, 0, 1,
-0.9187816, -1.088233, -2.292147, 0.854902, 1, 0, 1,
-0.9178061, -0.0321971, -1.435691, 0.8470588, 1, 0, 1,
-0.9108585, -0.03714038, -3.681787, 0.8431373, 1, 0, 1,
-0.9099054, -0.5019379, -2.726199, 0.8352941, 1, 0, 1,
-0.9052181, 0.07325701, -2.437669, 0.8313726, 1, 0, 1,
-0.9038027, -0.9354412, -2.878599, 0.8235294, 1, 0, 1,
-0.8973982, 0.432448, -0.6539966, 0.8196079, 1, 0, 1,
-0.8902061, -0.3400563, -4.075059, 0.8117647, 1, 0, 1,
-0.8848525, -2.255702, -2.462159, 0.8078431, 1, 0, 1,
-0.8830628, 1.350118, -0.2875177, 0.8, 1, 0, 1,
-0.8771574, -0.680205, -3.926949, 0.7921569, 1, 0, 1,
-0.8751152, 1.093859, 0.6522867, 0.7882353, 1, 0, 1,
-0.8733419, -1.26836, -3.562726, 0.7803922, 1, 0, 1,
-0.8712292, -1.014954, -2.635422, 0.7764706, 1, 0, 1,
-0.8696079, 1.175737, -0.5459665, 0.7686275, 1, 0, 1,
-0.8683633, -1.205034, -3.269875, 0.7647059, 1, 0, 1,
-0.8667115, 1.270128, -0.4033011, 0.7568628, 1, 0, 1,
-0.8622361, -1.612617, -3.356744, 0.7529412, 1, 0, 1,
-0.86217, 2.098187, 0.04570808, 0.7450981, 1, 0, 1,
-0.8602309, -0.3884577, -1.826195, 0.7411765, 1, 0, 1,
-0.8570904, -0.6369698, -2.333623, 0.7333333, 1, 0, 1,
-0.8561974, -0.3206234, -1.829127, 0.7294118, 1, 0, 1,
-0.8561599, 2.000264, 0.06609543, 0.7215686, 1, 0, 1,
-0.845899, 0.628824, -0.6876995, 0.7176471, 1, 0, 1,
-0.8394421, 0.9181214, -1.366885, 0.7098039, 1, 0, 1,
-0.8387109, 2.381221, -1.278153, 0.7058824, 1, 0, 1,
-0.8383102, -1.202774, -3.596833, 0.6980392, 1, 0, 1,
-0.8376339, -0.4478429, -1.250955, 0.6901961, 1, 0, 1,
-0.8366832, -1.186539, -3.908891, 0.6862745, 1, 0, 1,
-0.8297464, -1.014275, -2.020265, 0.6784314, 1, 0, 1,
-0.8245418, -1.632851, -3.256755, 0.6745098, 1, 0, 1,
-0.8236693, 0.6296601, -1.833961, 0.6666667, 1, 0, 1,
-0.8223045, -0.9682782, -3.219429, 0.6627451, 1, 0, 1,
-0.8206069, -0.2817138, -2.109948, 0.654902, 1, 0, 1,
-0.8162401, -0.05797227, -2.522914, 0.6509804, 1, 0, 1,
-0.8155509, 0.9306378, -0.9775115, 0.6431373, 1, 0, 1,
-0.8126678, 1.534621, -0.5093661, 0.6392157, 1, 0, 1,
-0.8068098, 0.338798, -0.625707, 0.6313726, 1, 0, 1,
-0.805733, 1.561071, -1.440725, 0.627451, 1, 0, 1,
-0.7996784, 0.8261651, -0.2992693, 0.6196079, 1, 0, 1,
-0.7990997, 1.43698, 0.2350902, 0.6156863, 1, 0, 1,
-0.7901785, 0.3640428, -1.8532, 0.6078432, 1, 0, 1,
-0.7829784, -1.358337, -3.548337, 0.6039216, 1, 0, 1,
-0.7763382, 1.302849, 0.3893659, 0.5960785, 1, 0, 1,
-0.7758393, 2.288631, -1.000213, 0.5882353, 1, 0, 1,
-0.7737426, -1.282476, -3.658628, 0.5843138, 1, 0, 1,
-0.7723951, -0.22874, -1.722852, 0.5764706, 1, 0, 1,
-0.7665482, 0.08242335, -1.15205, 0.572549, 1, 0, 1,
-0.759997, 1.201902, 0.5065454, 0.5647059, 1, 0, 1,
-0.7500077, -1.682187, -2.1495, 0.5607843, 1, 0, 1,
-0.7476357, 0.5504852, 1.649419, 0.5529412, 1, 0, 1,
-0.7415575, -1.895879, -2.591813, 0.5490196, 1, 0, 1,
-0.7396954, -0.1547308, -1.366809, 0.5411765, 1, 0, 1,
-0.7365821, 0.3967433, -2.404199, 0.5372549, 1, 0, 1,
-0.7354967, 1.387147, -1.423864, 0.5294118, 1, 0, 1,
-0.7335581, -0.5864337, -2.241419, 0.5254902, 1, 0, 1,
-0.7319903, 0.7568561, -2.387762, 0.5176471, 1, 0, 1,
-0.7295222, -0.0719263, -1.170118, 0.5137255, 1, 0, 1,
-0.7211144, -0.3351896, -2.56279, 0.5058824, 1, 0, 1,
-0.7198582, 1.415547, 1.178905, 0.5019608, 1, 0, 1,
-0.7059806, 0.9742024, -0.3189423, 0.4941176, 1, 0, 1,
-0.7049479, 0.4016892, 0.7839007, 0.4862745, 1, 0, 1,
-0.7032163, -0.3290045, -0.6964525, 0.4823529, 1, 0, 1,
-0.700839, 0.3795095, -1.811723, 0.4745098, 1, 0, 1,
-0.6971891, -0.07154891, -3.349668, 0.4705882, 1, 0, 1,
-0.696126, -1.323294, -2.199261, 0.4627451, 1, 0, 1,
-0.6938611, -0.2726959, -2.980855, 0.4588235, 1, 0, 1,
-0.691207, -0.4572746, -2.130424, 0.4509804, 1, 0, 1,
-0.6851166, 0.4125346, -2.707626, 0.4470588, 1, 0, 1,
-0.683825, -0.2288488, -0.07950488, 0.4392157, 1, 0, 1,
-0.6822842, 0.1708523, -0.6573887, 0.4352941, 1, 0, 1,
-0.6703451, 0.06925245, -2.259001, 0.427451, 1, 0, 1,
-0.6585048, 0.696827, 0.01467997, 0.4235294, 1, 0, 1,
-0.6571562, -0.1470769, -1.397637, 0.4156863, 1, 0, 1,
-0.6524293, -0.2947394, -3.059961, 0.4117647, 1, 0, 1,
-0.6455036, 2.057013, 1.480516, 0.4039216, 1, 0, 1,
-0.6451102, 0.8976533, -0.3437848, 0.3960784, 1, 0, 1,
-0.6420332, 0.2140908, -0.02538969, 0.3921569, 1, 0, 1,
-0.641151, 0.959361, 0.04284725, 0.3843137, 1, 0, 1,
-0.6404898, -1.554249, -1.835493, 0.3803922, 1, 0, 1,
-0.6394419, -1.372565, -1.783297, 0.372549, 1, 0, 1,
-0.6371543, -0.5237416, -1.515494, 0.3686275, 1, 0, 1,
-0.6364836, 0.8631101, 0.9321759, 0.3607843, 1, 0, 1,
-0.6344814, 0.1312639, -2.051544, 0.3568628, 1, 0, 1,
-0.6305418, 1.999726, 0.03083633, 0.3490196, 1, 0, 1,
-0.6292542, -0.8978782, -3.685447, 0.345098, 1, 0, 1,
-0.6172242, 0.6854063, -2.113838, 0.3372549, 1, 0, 1,
-0.616869, 0.3295172, -1.324384, 0.3333333, 1, 0, 1,
-0.6152655, -0.4462698, -3.588945, 0.3254902, 1, 0, 1,
-0.610727, 1.973486, -0.4767216, 0.3215686, 1, 0, 1,
-0.6078144, -1.483426, -2.893347, 0.3137255, 1, 0, 1,
-0.6070111, 0.6010341, 0.2255131, 0.3098039, 1, 0, 1,
-0.6044668, -1.524787, -3.607268, 0.3019608, 1, 0, 1,
-0.6034214, -1.079972, -3.445359, 0.2941177, 1, 0, 1,
-0.6003101, -0.3596264, -0.5813805, 0.2901961, 1, 0, 1,
-0.598959, 0.1540326, -0.8972946, 0.282353, 1, 0, 1,
-0.5891703, -0.875026, -2.9476, 0.2784314, 1, 0, 1,
-0.5847268, -0.1853797, -1.28532, 0.2705882, 1, 0, 1,
-0.5843785, -1.978591, -2.397403, 0.2666667, 1, 0, 1,
-0.5843304, -0.7158494, -1.154079, 0.2588235, 1, 0, 1,
-0.5834027, -0.313149, -2.115633, 0.254902, 1, 0, 1,
-0.5832704, -0.9434912, -2.641535, 0.2470588, 1, 0, 1,
-0.5825843, -0.8055754, -2.014583, 0.2431373, 1, 0, 1,
-0.5820569, -0.2234555, -1.672511, 0.2352941, 1, 0, 1,
-0.5804574, -0.7128372, -3.807637, 0.2313726, 1, 0, 1,
-0.5792282, 0.3348761, -1.422196, 0.2235294, 1, 0, 1,
-0.5759459, -0.8685911, -2.279942, 0.2196078, 1, 0, 1,
-0.5690999, -0.2648362, -0.6883886, 0.2117647, 1, 0, 1,
-0.567772, 0.589759, -0.02787338, 0.2078431, 1, 0, 1,
-0.5652817, 0.8975822, -0.3456598, 0.2, 1, 0, 1,
-0.5647827, 1.896047, 0.745945, 0.1921569, 1, 0, 1,
-0.5609282, -0.8785521, -1.856318, 0.1882353, 1, 0, 1,
-0.5601624, -0.5897101, -3.155227, 0.1803922, 1, 0, 1,
-0.5560985, -0.7527553, -3.640153, 0.1764706, 1, 0, 1,
-0.5555307, 2.163372, -0.7202794, 0.1686275, 1, 0, 1,
-0.5550314, 0.5461659, 0.04020897, 0.1647059, 1, 0, 1,
-0.5519548, 0.8722441, -0.768652, 0.1568628, 1, 0, 1,
-0.5480103, 0.3300588, -1.484928, 0.1529412, 1, 0, 1,
-0.5466998, 0.3309177, 0.3458751, 0.145098, 1, 0, 1,
-0.5355198, -2.870287, -3.746971, 0.1411765, 1, 0, 1,
-0.5318336, -1.066242, -1.461461, 0.1333333, 1, 0, 1,
-0.5307061, 0.357306, -0.2762062, 0.1294118, 1, 0, 1,
-0.5304528, 0.1635644, -1.471185, 0.1215686, 1, 0, 1,
-0.5284641, 1.447547, -1.53483, 0.1176471, 1, 0, 1,
-0.5284095, -1.346443, -3.594227, 0.1098039, 1, 0, 1,
-0.5274618, -1.791674, -4.12895, 0.1058824, 1, 0, 1,
-0.5262133, 0.2482296, -1.197911, 0.09803922, 1, 0, 1,
-0.525682, -0.5384062, -0.4952198, 0.09019608, 1, 0, 1,
-0.5220562, 1.005866, -0.09594662, 0.08627451, 1, 0, 1,
-0.5169889, 0.951763, 0.2996648, 0.07843138, 1, 0, 1,
-0.5074337, 0.7433936, -0.5584244, 0.07450981, 1, 0, 1,
-0.5061274, -1.769854, -3.765116, 0.06666667, 1, 0, 1,
-0.5026194, -1.076673, -2.545341, 0.0627451, 1, 0, 1,
-0.5024722, -0.2096593, -2.452629, 0.05490196, 1, 0, 1,
-0.501289, -1.390867, -4.329371, 0.05098039, 1, 0, 1,
-0.4997253, 0.2290026, 0.4523775, 0.04313726, 1, 0, 1,
-0.4937153, 0.1526881, -1.49616, 0.03921569, 1, 0, 1,
-0.4927476, 0.6285787, -0.4405996, 0.03137255, 1, 0, 1,
-0.4880202, -1.063561, -2.085314, 0.02745098, 1, 0, 1,
-0.4857068, 0.04606441, -0.9403533, 0.01960784, 1, 0, 1,
-0.477834, 1.706954, -0.9183159, 0.01568628, 1, 0, 1,
-0.4770323, -0.2237551, -1.300823, 0.007843138, 1, 0, 1,
-0.4751648, 0.8672457, -1.71548, 0.003921569, 1, 0, 1,
-0.4749171, 2.009502, -1.023637, 0, 1, 0.003921569, 1,
-0.4718304, -0.7478156, -1.837407, 0, 1, 0.01176471, 1,
-0.4679362, -0.7130787, -2.152931, 0, 1, 0.01568628, 1,
-0.4611433, 2.805216, 1.30036, 0, 1, 0.02352941, 1,
-0.4544186, 1.201254, -1.780656, 0, 1, 0.02745098, 1,
-0.4542527, -0.7381245, -2.005913, 0, 1, 0.03529412, 1,
-0.4531415, -0.02366588, -2.544808, 0, 1, 0.03921569, 1,
-0.4517788, -0.4389983, -2.601025, 0, 1, 0.04705882, 1,
-0.4514375, 1.307731, 0.639269, 0, 1, 0.05098039, 1,
-0.4498296, -0.805817, -3.951427, 0, 1, 0.05882353, 1,
-0.4477988, 0.814876, 0.06514215, 0, 1, 0.0627451, 1,
-0.4467405, 2.281384, 1.03544, 0, 1, 0.07058824, 1,
-0.4463265, 2.082596, -0.6889122, 0, 1, 0.07450981, 1,
-0.4416126, 0.04899556, -1.746139, 0, 1, 0.08235294, 1,
-0.4413065, -0.0585295, -1.877266, 0, 1, 0.08627451, 1,
-0.4409312, 0.03420402, -1.061509, 0, 1, 0.09411765, 1,
-0.439345, -1.060024, -2.559474, 0, 1, 0.1019608, 1,
-0.4349682, -0.1057327, -0.9965945, 0, 1, 0.1058824, 1,
-0.433709, -0.2715223, -1.356317, 0, 1, 0.1137255, 1,
-0.4300772, -1.643828, -3.306399, 0, 1, 0.1176471, 1,
-0.4277342, -0.1365727, -1.253816, 0, 1, 0.1254902, 1,
-0.4234691, 0.147914, -2.40966, 0, 1, 0.1294118, 1,
-0.4231869, -0.5319341, -4.023757, 0, 1, 0.1372549, 1,
-0.422817, -2.179329, -1.57709, 0, 1, 0.1411765, 1,
-0.4220811, 1.549163, 0.3474437, 0, 1, 0.1490196, 1,
-0.4191769, 0.3033687, -0.4963452, 0, 1, 0.1529412, 1,
-0.418479, -0.961441, -1.811989, 0, 1, 0.1607843, 1,
-0.4152914, -0.4264227, -2.070501, 0, 1, 0.1647059, 1,
-0.4098985, 0.3241397, 0.3145311, 0, 1, 0.172549, 1,
-0.4087697, 2.049913, 0.7817203, 0, 1, 0.1764706, 1,
-0.4055573, -0.6516882, -1.682315, 0, 1, 0.1843137, 1,
-0.4044214, 1.199663, -1.062863, 0, 1, 0.1882353, 1,
-0.3965383, 0.5579292, 0.2472411, 0, 1, 0.1960784, 1,
-0.3901931, -1.326255, -2.309561, 0, 1, 0.2039216, 1,
-0.3897596, -0.008119114, -0.3083201, 0, 1, 0.2078431, 1,
-0.3893343, -0.07572796, -0.5179108, 0, 1, 0.2156863, 1,
-0.3889085, -0.1073584, -0.980104, 0, 1, 0.2196078, 1,
-0.384943, -0.01009347, -0.06891017, 0, 1, 0.227451, 1,
-0.3809244, -0.01162076, -1.550282, 0, 1, 0.2313726, 1,
-0.379315, -0.3195334, -0.8701117, 0, 1, 0.2392157, 1,
-0.3793061, 2.332801, 0.8028592, 0, 1, 0.2431373, 1,
-0.3791535, 0.5892381, 0.4124649, 0, 1, 0.2509804, 1,
-0.375092, -0.5642577, -4.34453, 0, 1, 0.254902, 1,
-0.3733625, -2.410387, -3.718745, 0, 1, 0.2627451, 1,
-0.3655788, 2.090832, -1.011886, 0, 1, 0.2666667, 1,
-0.3649566, -0.4449337, -2.247732, 0, 1, 0.2745098, 1,
-0.3577212, 1.463429, -1.124606, 0, 1, 0.2784314, 1,
-0.3526563, -0.4982366, -1.120462, 0, 1, 0.2862745, 1,
-0.3477918, 0.168098, -0.5535476, 0, 1, 0.2901961, 1,
-0.3460325, -0.6180211, -1.212844, 0, 1, 0.2980392, 1,
-0.3395528, 1.646031, 2.004518, 0, 1, 0.3058824, 1,
-0.3373329, 1.557128, -1.999116, 0, 1, 0.3098039, 1,
-0.335197, -1.575914, -1.646528, 0, 1, 0.3176471, 1,
-0.3341641, 0.09347825, -1.896785, 0, 1, 0.3215686, 1,
-0.3288459, -0.9468858, -3.788608, 0, 1, 0.3294118, 1,
-0.3256673, 0.8022552, 0.7233973, 0, 1, 0.3333333, 1,
-0.3235618, -0.2647526, -3.994788, 0, 1, 0.3411765, 1,
-0.3225535, 1.339489, 1.39941, 0, 1, 0.345098, 1,
-0.321792, 0.593403, -0.8031488, 0, 1, 0.3529412, 1,
-0.321371, 0.3005097, 0.3734072, 0, 1, 0.3568628, 1,
-0.320197, 0.2162974, -0.5556023, 0, 1, 0.3647059, 1,
-0.3197976, 0.4456088, -0.1900246, 0, 1, 0.3686275, 1,
-0.3093379, 0.8066269, -0.1509953, 0, 1, 0.3764706, 1,
-0.3021433, 0.08511035, -0.4164601, 0, 1, 0.3803922, 1,
-0.2934098, 0.01562101, -0.9835439, 0, 1, 0.3882353, 1,
-0.2931576, 1.591599, 0.1614647, 0, 1, 0.3921569, 1,
-0.2919208, -1.226682, -2.469891, 0, 1, 0.4, 1,
-0.2909991, 1.924374, -0.0176535, 0, 1, 0.4078431, 1,
-0.2830844, 0.8316543, -1.876189, 0, 1, 0.4117647, 1,
-0.2825165, 0.08610491, -0.7759172, 0, 1, 0.4196078, 1,
-0.2803678, 0.3060935, 0.102089, 0, 1, 0.4235294, 1,
-0.2802112, 0.5698856, -0.7946385, 0, 1, 0.4313726, 1,
-0.2785759, -1.672543, -2.784041, 0, 1, 0.4352941, 1,
-0.2773806, -0.1504852, -1.352731, 0, 1, 0.4431373, 1,
-0.2759804, 0.186448, -1.045442, 0, 1, 0.4470588, 1,
-0.2746, -0.8198485, -0.976248, 0, 1, 0.454902, 1,
-0.2705586, -0.6475748, -1.922582, 0, 1, 0.4588235, 1,
-0.2686615, -2.334367, -2.061883, 0, 1, 0.4666667, 1,
-0.2659249, 0.4600877, -0.1359041, 0, 1, 0.4705882, 1,
-0.2646561, 1.673856, 0.06316053, 0, 1, 0.4784314, 1,
-0.2646358, -0.9689383, -2.912046, 0, 1, 0.4823529, 1,
-0.2621017, -0.1818668, -1.703166, 0, 1, 0.4901961, 1,
-0.2618326, 0.267904, -0.7741855, 0, 1, 0.4941176, 1,
-0.2616878, 0.4941294, 0.4410535, 0, 1, 0.5019608, 1,
-0.2458847, -0.1319611, -1.703827, 0, 1, 0.509804, 1,
-0.2444871, -0.445363, -2.531284, 0, 1, 0.5137255, 1,
-0.2435936, -1.012786, -3.535487, 0, 1, 0.5215687, 1,
-0.2405606, 1.909069, 1.24299, 0, 1, 0.5254902, 1,
-0.2400967, 1.212029, 1.349663, 0, 1, 0.5333334, 1,
-0.2390663, -0.3792365, -2.514477, 0, 1, 0.5372549, 1,
-0.2381774, 0.6797365, -1.423621, 0, 1, 0.5450981, 1,
-0.2378342, -1.161473, -1.966151, 0, 1, 0.5490196, 1,
-0.2318048, 0.6340476, 0.2127623, 0, 1, 0.5568628, 1,
-0.2317964, -0.132913, -2.970898, 0, 1, 0.5607843, 1,
-0.2293448, -1.113189, -3.18077, 0, 1, 0.5686275, 1,
-0.2259274, 0.2828255, -0.2057694, 0, 1, 0.572549, 1,
-0.2215572, 0.5519648, -0.04771844, 0, 1, 0.5803922, 1,
-0.2199593, 0.3285952, -0.5127163, 0, 1, 0.5843138, 1,
-0.2196234, 0.152427, -2.284457, 0, 1, 0.5921569, 1,
-0.2156332, 0.9155361, -0.6946777, 0, 1, 0.5960785, 1,
-0.2099879, -0.7454684, -3.174582, 0, 1, 0.6039216, 1,
-0.209412, 0.9232035, -1.408264, 0, 1, 0.6117647, 1,
-0.2083764, 0.6464421, -1.636745, 0, 1, 0.6156863, 1,
-0.208079, -0.3562413, -1.124181, 0, 1, 0.6235294, 1,
-0.2045605, -0.357834, -2.510309, 0, 1, 0.627451, 1,
-0.2038717, -1.899186, -1.821849, 0, 1, 0.6352941, 1,
-0.200601, 2.05875, -0.7535534, 0, 1, 0.6392157, 1,
-0.1986547, 1.249655, -0.670289, 0, 1, 0.6470588, 1,
-0.1981166, 0.5524123, -0.9731834, 0, 1, 0.6509804, 1,
-0.1974867, -0.4217362, -1.860844, 0, 1, 0.6588235, 1,
-0.1973877, 0.8326175, 0.2675056, 0, 1, 0.6627451, 1,
-0.1941545, -0.02609076, -3.380553, 0, 1, 0.6705883, 1,
-0.1899188, -1.263301, -3.266603, 0, 1, 0.6745098, 1,
-0.1896923, 0.5730537, 0.4249351, 0, 1, 0.682353, 1,
-0.187188, 0.7092457, -0.7312618, 0, 1, 0.6862745, 1,
-0.1868913, -0.1523558, -1.487995, 0, 1, 0.6941177, 1,
-0.1868828, 1.939879, 0.2380168, 0, 1, 0.7019608, 1,
-0.1859566, -0.441739, -2.508042, 0, 1, 0.7058824, 1,
-0.1777775, 0.8644336, -1.633659, 0, 1, 0.7137255, 1,
-0.17697, 0.7718729, 0.2658708, 0, 1, 0.7176471, 1,
-0.176904, 0.3445063, -1.015508, 0, 1, 0.7254902, 1,
-0.1744907, 0.5018251, 0.0992662, 0, 1, 0.7294118, 1,
-0.1732242, 1.071426, -0.9932159, 0, 1, 0.7372549, 1,
-0.1726257, -0.3090033, -3.095259, 0, 1, 0.7411765, 1,
-0.1693528, -0.3817349, -2.981728, 0, 1, 0.7490196, 1,
-0.1692573, -0.5794733, -4.57394, 0, 1, 0.7529412, 1,
-0.1667206, -0.1542424, -3.043044, 0, 1, 0.7607843, 1,
-0.1608431, -1.121169, -0.3973731, 0, 1, 0.7647059, 1,
-0.1592127, -1.828646, -3.395149, 0, 1, 0.772549, 1,
-0.156867, -0.4375503, -3.052208, 0, 1, 0.7764706, 1,
-0.1565847, -0.9322446, -3.837007, 0, 1, 0.7843137, 1,
-0.1545544, -0.8197045, -3.854194, 0, 1, 0.7882353, 1,
-0.1516506, -1.944418, -2.702873, 0, 1, 0.7960784, 1,
-0.1500388, 0.01872823, -1.003998, 0, 1, 0.8039216, 1,
-0.1485406, 0.89143, -1.690102, 0, 1, 0.8078431, 1,
-0.1475152, 0.2783135, -0.1156829, 0, 1, 0.8156863, 1,
-0.1469857, 0.2667572, -0.1258282, 0, 1, 0.8196079, 1,
-0.1448721, 0.1140386, 0.3840966, 0, 1, 0.827451, 1,
-0.1442845, -0.7093638, -4.946311, 0, 1, 0.8313726, 1,
-0.1434748, 0.12138, -1.620064, 0, 1, 0.8392157, 1,
-0.1430551, -0.5517926, -2.057612, 0, 1, 0.8431373, 1,
-0.1429307, -0.6531726, -3.569567, 0, 1, 0.8509804, 1,
-0.1421953, -0.3522809, -2.538155, 0, 1, 0.854902, 1,
-0.1399263, -1.059896, -4.604372, 0, 1, 0.8627451, 1,
-0.1396936, -2.032174, -2.988716, 0, 1, 0.8666667, 1,
-0.1392215, 0.6022233, 0.8301497, 0, 1, 0.8745098, 1,
-0.1341403, 0.7873231, -1.041089, 0, 1, 0.8784314, 1,
-0.1328886, -1.40763, -2.021101, 0, 1, 0.8862745, 1,
-0.1318678, -1.293623, -2.480964, 0, 1, 0.8901961, 1,
-0.1289207, -0.1712221, -1.129815, 0, 1, 0.8980392, 1,
-0.128875, -0.08388274, -2.9622, 0, 1, 0.9058824, 1,
-0.128371, 0.3311283, 2.029535, 0, 1, 0.9098039, 1,
-0.1243446, 0.07453822, -0.300918, 0, 1, 0.9176471, 1,
-0.1192225, -0.4549498, -2.902922, 0, 1, 0.9215686, 1,
-0.1163326, 1.010212, -0.4433318, 0, 1, 0.9294118, 1,
-0.1113465, -0.4744104, -3.606213, 0, 1, 0.9333333, 1,
-0.1106256, -0.1977784, -4.476187, 0, 1, 0.9411765, 1,
-0.1079939, -0.4463938, -3.736054, 0, 1, 0.945098, 1,
-0.1078108, 0.3803494, -0.7546716, 0, 1, 0.9529412, 1,
-0.09721537, 0.2319814, 0.2736717, 0, 1, 0.9568627, 1,
-0.09395526, 0.8932914, 0.177923, 0, 1, 0.9647059, 1,
-0.09030356, 0.8743465, 0.2278491, 0, 1, 0.9686275, 1,
-0.09005846, 0.8291935, 0.2002312, 0, 1, 0.9764706, 1,
-0.08996427, -1.168308, -2.473819, 0, 1, 0.9803922, 1,
-0.08766855, 0.931283, -1.763765, 0, 1, 0.9882353, 1,
-0.07516111, 1.548491, 1.250804, 0, 1, 0.9921569, 1,
-0.07460833, 0.4348961, -0.09248851, 0, 1, 1, 1,
-0.0720218, -0.7484453, -2.422255, 0, 0.9921569, 1, 1,
-0.07175951, -1.040906, -1.764835, 0, 0.9882353, 1, 1,
-0.06709483, -0.2231039, -4.60886, 0, 0.9803922, 1, 1,
-0.06682955, -0.2501671, -4.289176, 0, 0.9764706, 1, 1,
-0.06091343, -0.601037, -3.818149, 0, 0.9686275, 1, 1,
-0.05919473, -2.197164, -1.63808, 0, 0.9647059, 1, 1,
-0.058761, -1.589218, -3.195805, 0, 0.9568627, 1, 1,
-0.05827494, -0.4970951, -1.241259, 0, 0.9529412, 1, 1,
-0.05482025, -1.787674, -3.000361, 0, 0.945098, 1, 1,
-0.05423973, -0.5307573, -3.514067, 0, 0.9411765, 1, 1,
-0.0541692, 0.1978694, -1.099303, 0, 0.9333333, 1, 1,
-0.04993293, 0.1744414, 0.7582806, 0, 0.9294118, 1, 1,
-0.04691492, 1.379344, 0.3134527, 0, 0.9215686, 1, 1,
-0.04585936, 0.4659595, -1.507104, 0, 0.9176471, 1, 1,
-0.03487581, -0.9901652, -3.748689, 0, 0.9098039, 1, 1,
-0.02864923, 1.224707, -0.4976962, 0, 0.9058824, 1, 1,
-0.02523732, 0.2309188, -0.8256211, 0, 0.8980392, 1, 1,
-0.02506642, 0.349843, -0.80177, 0, 0.8901961, 1, 1,
-0.0246305, -0.0663188, -1.417167, 0, 0.8862745, 1, 1,
-0.02081229, -0.2969269, -3.098932, 0, 0.8784314, 1, 1,
-0.01900342, 1.695991, -0.1663336, 0, 0.8745098, 1, 1,
-0.01897373, -0.5456622, -2.931958, 0, 0.8666667, 1, 1,
-0.009228869, -0.154838, -1.800992, 0, 0.8627451, 1, 1,
-0.008576969, -0.5117912, -2.039297, 0, 0.854902, 1, 1,
-0.004382947, 1.31993, -1.006375, 0, 0.8509804, 1, 1,
-0.004307569, 0.1268045, -0.1387756, 0, 0.8431373, 1, 1,
-0.00261985, 0.3827502, 1.235567, 0, 0.8392157, 1, 1,
0.001007201, 2.171838, 0.1174664, 0, 0.8313726, 1, 1,
0.01119061, -2.129766, 4.02878, 0, 0.827451, 1, 1,
0.01194785, 0.2613004, 1.27518, 0, 0.8196079, 1, 1,
0.01205956, 1.021485, 0.721368, 0, 0.8156863, 1, 1,
0.01680114, -0.6497583, 2.155737, 0, 0.8078431, 1, 1,
0.01986658, 0.7001695, 0.08793677, 0, 0.8039216, 1, 1,
0.02351442, 0.3168401, 0.8833846, 0, 0.7960784, 1, 1,
0.03323007, 1.917454, 2.283807, 0, 0.7882353, 1, 1,
0.03365367, 1.191048, 0.5960694, 0, 0.7843137, 1, 1,
0.0370665, -0.4496857, 2.527531, 0, 0.7764706, 1, 1,
0.03914191, 0.3554892, 0.4460616, 0, 0.772549, 1, 1,
0.04154878, -1.254221, 2.173286, 0, 0.7647059, 1, 1,
0.0438163, 0.3521718, 2.78046, 0, 0.7607843, 1, 1,
0.04522685, -0.1403483, 4.059778, 0, 0.7529412, 1, 1,
0.05041124, -0.2628703, 3.376956, 0, 0.7490196, 1, 1,
0.05156499, 1.163255, -0.1599142, 0, 0.7411765, 1, 1,
0.05278559, -2.951056, 5.030535, 0, 0.7372549, 1, 1,
0.05290632, -0.6137825, 2.231574, 0, 0.7294118, 1, 1,
0.05861635, 0.4421812, -0.4846964, 0, 0.7254902, 1, 1,
0.06680231, -0.4085038, 2.724345, 0, 0.7176471, 1, 1,
0.06767227, 0.5027494, -1.874609, 0, 0.7137255, 1, 1,
0.06914842, -1.373254, 2.906947, 0, 0.7058824, 1, 1,
0.06932415, -0.3128032, 2.179142, 0, 0.6980392, 1, 1,
0.07037202, -2.125773, 1.830246, 0, 0.6941177, 1, 1,
0.07654249, 0.8738915, 0.2071006, 0, 0.6862745, 1, 1,
0.07733715, -0.8488566, 2.896707, 0, 0.682353, 1, 1,
0.081065, -1.785516, 2.718283, 0, 0.6745098, 1, 1,
0.08142044, -0.5354891, 1.925453, 0, 0.6705883, 1, 1,
0.09159842, -0.0639973, 1.018824, 0, 0.6627451, 1, 1,
0.09627803, -0.780239, 2.281775, 0, 0.6588235, 1, 1,
0.1012912, 0.8765927, -0.8731152, 0, 0.6509804, 1, 1,
0.1021536, 1.420038, -1.737446, 0, 0.6470588, 1, 1,
0.1046084, 1.350296, 1.011201, 0, 0.6392157, 1, 1,
0.105947, -0.1707848, 2.11174, 0, 0.6352941, 1, 1,
0.1064862, -0.296091, 3.274463, 0, 0.627451, 1, 1,
0.109373, 0.3568342, 0.8572642, 0, 0.6235294, 1, 1,
0.1208599, 0.3002259, -0.2202762, 0, 0.6156863, 1, 1,
0.1252309, 0.8665173, 0.6403503, 0, 0.6117647, 1, 1,
0.1258828, -0.8306454, 2.71127, 0, 0.6039216, 1, 1,
0.1270678, -0.3651384, 1.576828, 0, 0.5960785, 1, 1,
0.1306197, 0.8051956, -0.3741111, 0, 0.5921569, 1, 1,
0.1317703, 0.5098886, 1.889935, 0, 0.5843138, 1, 1,
0.1320027, -1.225705, 3.230473, 0, 0.5803922, 1, 1,
0.1345173, 0.7183529, -1.765049, 0, 0.572549, 1, 1,
0.1346596, -1.460382, 2.436864, 0, 0.5686275, 1, 1,
0.135028, 0.3106576, -0.07857714, 0, 0.5607843, 1, 1,
0.1355875, -0.4158157, 2.408086, 0, 0.5568628, 1, 1,
0.1364637, -0.256145, 3.087356, 0, 0.5490196, 1, 1,
0.1369806, -0.4048023, 2.030099, 0, 0.5450981, 1, 1,
0.1376094, 1.550527, 0.2494755, 0, 0.5372549, 1, 1,
0.138677, -1.648675, 2.277898, 0, 0.5333334, 1, 1,
0.1401946, -1.011726, 2.943954, 0, 0.5254902, 1, 1,
0.1459679, 0.6836462, -1.008835, 0, 0.5215687, 1, 1,
0.1464313, -0.8580744, 5.053643, 0, 0.5137255, 1, 1,
0.1525115, 0.212317, 0.9248188, 0, 0.509804, 1, 1,
0.1547218, 1.907027, -0.2146137, 0, 0.5019608, 1, 1,
0.1553572, -0.123199, 1.917134, 0, 0.4941176, 1, 1,
0.1571688, -1.788211, 2.424146, 0, 0.4901961, 1, 1,
0.1578956, -0.163203, 2.764668, 0, 0.4823529, 1, 1,
0.1598529, -1.490749, 4.654433, 0, 0.4784314, 1, 1,
0.1622772, 0.09213902, 0.596576, 0, 0.4705882, 1, 1,
0.1631891, -0.2717558, 4.977967, 0, 0.4666667, 1, 1,
0.1644229, -1.663965, 3.228622, 0, 0.4588235, 1, 1,
0.1657867, -1.321698, 2.804828, 0, 0.454902, 1, 1,
0.1692165, 0.8786592, -0.2982853, 0, 0.4470588, 1, 1,
0.1723408, 2.6318, -0.5983904, 0, 0.4431373, 1, 1,
0.1730366, 0.2811787, 0.06342421, 0, 0.4352941, 1, 1,
0.1799025, -0.1856288, 2.317005, 0, 0.4313726, 1, 1,
0.1822394, 1.21685, 0.303163, 0, 0.4235294, 1, 1,
0.1833217, -0.5403222, 2.540549, 0, 0.4196078, 1, 1,
0.1933186, -0.3237256, 3.86709, 0, 0.4117647, 1, 1,
0.1944209, 1.233042, 0.1895768, 0, 0.4078431, 1, 1,
0.1953944, 0.2282346, -1.187316, 0, 0.4, 1, 1,
0.1963029, -1.327864, 3.762239, 0, 0.3921569, 1, 1,
0.2007796, 0.8900357, 0.546822, 0, 0.3882353, 1, 1,
0.2017273, -0.59345, 1.675365, 0, 0.3803922, 1, 1,
0.204709, 1.283528, -0.6189741, 0, 0.3764706, 1, 1,
0.2048061, 0.2939095, 2.192769, 0, 0.3686275, 1, 1,
0.2072204, 0.06474389, 1.545445, 0, 0.3647059, 1, 1,
0.2074406, 0.6498653, 1.433222, 0, 0.3568628, 1, 1,
0.2101616, -0.2108574, 3.245173, 0, 0.3529412, 1, 1,
0.2152355, 0.6672785, -0.4347788, 0, 0.345098, 1, 1,
0.2156072, -0.05879182, 0.935389, 0, 0.3411765, 1, 1,
0.2286005, 0.965963, 0.5534596, 0, 0.3333333, 1, 1,
0.2317592, -0.874298, 3.307817, 0, 0.3294118, 1, 1,
0.2377537, 0.7571449, 0.336691, 0, 0.3215686, 1, 1,
0.2411891, 0.5185978, -0.159174, 0, 0.3176471, 1, 1,
0.2424084, -1.754019, 4.414082, 0, 0.3098039, 1, 1,
0.2554169, -0.4487424, 3.146503, 0, 0.3058824, 1, 1,
0.2560353, 2.842205, 1.40123, 0, 0.2980392, 1, 1,
0.259831, -1.132554, 2.742575, 0, 0.2901961, 1, 1,
0.262237, -0.3402605, 2.167423, 0, 0.2862745, 1, 1,
0.2625899, -0.04789734, 2.149346, 0, 0.2784314, 1, 1,
0.2631479, 1.413553, 0.2395709, 0, 0.2745098, 1, 1,
0.2671593, -0.1340478, 1.148761, 0, 0.2666667, 1, 1,
0.2695038, -0.7706657, 1.952767, 0, 0.2627451, 1, 1,
0.2742637, 0.5745444, 0.1893253, 0, 0.254902, 1, 1,
0.2776012, 1.127134, 0.7066664, 0, 0.2509804, 1, 1,
0.279336, 1.378182, -3.72504, 0, 0.2431373, 1, 1,
0.2798732, 0.2129641, 0.2357213, 0, 0.2392157, 1, 1,
0.2819521, -1.473438, 1.914152, 0, 0.2313726, 1, 1,
0.2842152, 0.1155159, -0.2590021, 0, 0.227451, 1, 1,
0.2882683, 1.139009, 0.5291947, 0, 0.2196078, 1, 1,
0.2884971, -0.3365382, 3.104754, 0, 0.2156863, 1, 1,
0.2894285, -0.1943204, 1.455249, 0, 0.2078431, 1, 1,
0.2905927, 0.3071371, 2.743071, 0, 0.2039216, 1, 1,
0.2932915, -0.5044969, 2.742342, 0, 0.1960784, 1, 1,
0.2989771, -0.9908528, 3.592679, 0, 0.1882353, 1, 1,
0.2998312, -0.4191108, 2.079883, 0, 0.1843137, 1, 1,
0.3024551, -0.05655845, 1.289968, 0, 0.1764706, 1, 1,
0.3078382, 0.04542184, 0.5602962, 0, 0.172549, 1, 1,
0.3092928, -1.210285, 2.880267, 0, 0.1647059, 1, 1,
0.3095055, 1.794363, -0.3257839, 0, 0.1607843, 1, 1,
0.3113204, -1.568149, 4.394552, 0, 0.1529412, 1, 1,
0.3137883, -0.5324425, 1.853274, 0, 0.1490196, 1, 1,
0.3172427, 1.550675, 1.341532, 0, 0.1411765, 1, 1,
0.3211047, -0.3359112, 2.704283, 0, 0.1372549, 1, 1,
0.3216424, 4.099268, 1.94709, 0, 0.1294118, 1, 1,
0.3218744, 0.7349768, 1.685832, 0, 0.1254902, 1, 1,
0.3259345, 0.3203589, -0.9353426, 0, 0.1176471, 1, 1,
0.3330284, 0.03996576, 0.9033927, 0, 0.1137255, 1, 1,
0.3356617, -1.067185, 4.072333, 0, 0.1058824, 1, 1,
0.336333, 0.9232556, 1.457875, 0, 0.09803922, 1, 1,
0.339517, -0.0205072, 3.97368, 0, 0.09411765, 1, 1,
0.3427961, -1.132942, 1.739369, 0, 0.08627451, 1, 1,
0.3440275, -0.67031, 4.449316, 0, 0.08235294, 1, 1,
0.3452157, -0.1075167, 0.1006538, 0, 0.07450981, 1, 1,
0.345467, 0.4191396, 1.394241, 0, 0.07058824, 1, 1,
0.3522016, -1.000551, 3.843906, 0, 0.0627451, 1, 1,
0.3552754, -1.908358, 2.520327, 0, 0.05882353, 1, 1,
0.3558833, 0.3899797, 0.1047228, 0, 0.05098039, 1, 1,
0.3579496, 0.6972199, 1.736538, 0, 0.04705882, 1, 1,
0.3590448, -1.200495, 4.47788, 0, 0.03921569, 1, 1,
0.3617184, 1.13033, 0.2929899, 0, 0.03529412, 1, 1,
0.3646827, 0.400892, 0.5349638, 0, 0.02745098, 1, 1,
0.3712465, 0.9632133, -0.8886375, 0, 0.02352941, 1, 1,
0.3748217, -0.07584711, 1.586137, 0, 0.01568628, 1, 1,
0.3771068, 0.6162216, 0.7879336, 0, 0.01176471, 1, 1,
0.3798229, 0.04434887, 1.528922, 0, 0.003921569, 1, 1,
0.3826528, -0.5265502, 1.504325, 0.003921569, 0, 1, 1,
0.3828073, -0.8860279, 3.373477, 0.007843138, 0, 1, 1,
0.3850061, 1.553952, -0.1853879, 0.01568628, 0, 1, 1,
0.3855863, -2.351549, 1.851061, 0.01960784, 0, 1, 1,
0.3889265, -1.872498, 3.201146, 0.02745098, 0, 1, 1,
0.3944006, 0.4866693, 0.2263816, 0.03137255, 0, 1, 1,
0.3952506, -1.441154, 2.858758, 0.03921569, 0, 1, 1,
0.3956944, 0.1216514, 0.1686695, 0.04313726, 0, 1, 1,
0.4048162, 0.103141, 2.008304, 0.05098039, 0, 1, 1,
0.4060562, -0.4735126, 3.119789, 0.05490196, 0, 1, 1,
0.4082543, -1.001516, 2.704596, 0.0627451, 0, 1, 1,
0.4086811, -0.6090118, 0.6707706, 0.06666667, 0, 1, 1,
0.4141996, -0.03164364, 1.767726, 0.07450981, 0, 1, 1,
0.4156093, 0.4201177, 0.6609349, 0.07843138, 0, 1, 1,
0.4157917, 0.2053114, -0.6449908, 0.08627451, 0, 1, 1,
0.41609, -0.7169701, 4.879278, 0.09019608, 0, 1, 1,
0.4175751, 0.02616148, 0.5946245, 0.09803922, 0, 1, 1,
0.4209994, 0.01222844, 2.370843, 0.1058824, 0, 1, 1,
0.4266791, 0.4380537, 1.69454, 0.1098039, 0, 1, 1,
0.4273149, 0.4832279, 1.293828, 0.1176471, 0, 1, 1,
0.4283975, -0.9590662, 0.2322139, 0.1215686, 0, 1, 1,
0.4291569, -0.9284746, 2.466111, 0.1294118, 0, 1, 1,
0.4320756, 0.3726962, 0.5258551, 0.1333333, 0, 1, 1,
0.4327146, 0.192672, 0.08829936, 0.1411765, 0, 1, 1,
0.443697, 2.070054, 1.761442, 0.145098, 0, 1, 1,
0.4449427, 0.6380669, 2.339042, 0.1529412, 0, 1, 1,
0.4467683, -0.3328644, 2.205274, 0.1568628, 0, 1, 1,
0.4540035, 0.221788, 1.277238, 0.1647059, 0, 1, 1,
0.4558802, -2.483283, 4.8689, 0.1686275, 0, 1, 1,
0.4637419, 0.07405899, 1.870683, 0.1764706, 0, 1, 1,
0.4646064, -1.691788, 2.845434, 0.1803922, 0, 1, 1,
0.4654551, 0.3371446, 1.047471, 0.1882353, 0, 1, 1,
0.4668571, -0.5580643, 2.252693, 0.1921569, 0, 1, 1,
0.4708273, 0.4991473, 1.533993, 0.2, 0, 1, 1,
0.4746774, -0.2155711, 3.464379, 0.2078431, 0, 1, 1,
0.4785149, -0.1735023, 3.536699, 0.2117647, 0, 1, 1,
0.4947016, -1.868836, 3.833087, 0.2196078, 0, 1, 1,
0.4950784, 0.01372962, 2.168649, 0.2235294, 0, 1, 1,
0.5011637, -0.9562001, 3.926562, 0.2313726, 0, 1, 1,
0.5024898, -0.1705971, 2.704817, 0.2352941, 0, 1, 1,
0.5043832, -0.6364588, 1.662451, 0.2431373, 0, 1, 1,
0.5051891, -1.876496, 3.654065, 0.2470588, 0, 1, 1,
0.5068695, 1.340141, -0.1645506, 0.254902, 0, 1, 1,
0.5110143, 0.1264123, 2.950954, 0.2588235, 0, 1, 1,
0.5130013, -0.5109708, 1.903404, 0.2666667, 0, 1, 1,
0.5130361, -0.7410878, 2.288203, 0.2705882, 0, 1, 1,
0.5156651, 0.7807158, 0.2845255, 0.2784314, 0, 1, 1,
0.5172262, 1.002207, 0.05872905, 0.282353, 0, 1, 1,
0.5222908, -0.3386368, 1.288444, 0.2901961, 0, 1, 1,
0.5282704, -0.3432487, 2.430339, 0.2941177, 0, 1, 1,
0.5297784, -0.3106242, 3.122564, 0.3019608, 0, 1, 1,
0.5317456, 0.6488519, 0.140617, 0.3098039, 0, 1, 1,
0.536315, -2.418103, 2.721707, 0.3137255, 0, 1, 1,
0.5452455, -1.087675, 2.05576, 0.3215686, 0, 1, 1,
0.545446, -0.2510899, 3.305943, 0.3254902, 0, 1, 1,
0.5454726, 0.8525912, 0.7805926, 0.3333333, 0, 1, 1,
0.5459902, 0.1514571, 0.5997261, 0.3372549, 0, 1, 1,
0.5576609, 0.4399315, -0.7012513, 0.345098, 0, 1, 1,
0.5588584, -0.252464, 1.009366, 0.3490196, 0, 1, 1,
0.5652694, -0.8445921, 2.516444, 0.3568628, 0, 1, 1,
0.56552, -1.025678, 2.33451, 0.3607843, 0, 1, 1,
0.5686462, 0.6423118, 0.9139481, 0.3686275, 0, 1, 1,
0.5699978, -0.08386779, 0.9167131, 0.372549, 0, 1, 1,
0.5717036, 1.169693, 1.001893, 0.3803922, 0, 1, 1,
0.5725292, 0.4999432, -1.43511, 0.3843137, 0, 1, 1,
0.5729458, -0.6252627, 3.713069, 0.3921569, 0, 1, 1,
0.5734941, 0.02615226, -0.2341225, 0.3960784, 0, 1, 1,
0.5776508, -1.480477, 1.062483, 0.4039216, 0, 1, 1,
0.5801312, -0.3611666, 1.605893, 0.4117647, 0, 1, 1,
0.5804155, 2.369119, -1.557591, 0.4156863, 0, 1, 1,
0.5831625, 0.5695573, 0.5586329, 0.4235294, 0, 1, 1,
0.5882024, -1.175546, 3.581611, 0.427451, 0, 1, 1,
0.5910059, -1.694622, 3.64806, 0.4352941, 0, 1, 1,
0.5952411, 0.3724284, 0.6511865, 0.4392157, 0, 1, 1,
0.5954376, 0.06922012, 0.9593867, 0.4470588, 0, 1, 1,
0.5993735, 2.106061, 0.7970837, 0.4509804, 0, 1, 1,
0.6020527, 1.662068, -0.4328835, 0.4588235, 0, 1, 1,
0.6039635, 0.06141509, 1.529269, 0.4627451, 0, 1, 1,
0.6061526, 0.5779173, 0.885163, 0.4705882, 0, 1, 1,
0.6116347, -0.7828273, 1.659304, 0.4745098, 0, 1, 1,
0.6122452, 2.067858, -0.3768984, 0.4823529, 0, 1, 1,
0.6131893, -0.9652101, 1.003439, 0.4862745, 0, 1, 1,
0.613624, -2.550213, 1.864708, 0.4941176, 0, 1, 1,
0.6160268, -0.1845043, 1.209666, 0.5019608, 0, 1, 1,
0.6196349, 0.2828009, -0.1186208, 0.5058824, 0, 1, 1,
0.6218207, 2.147786, 0.7231622, 0.5137255, 0, 1, 1,
0.6221877, 0.7442899, 1.314506, 0.5176471, 0, 1, 1,
0.6235818, -0.5218834, 1.63568, 0.5254902, 0, 1, 1,
0.6275381, -0.3379792, 0.9410524, 0.5294118, 0, 1, 1,
0.6285043, 0.0008653309, 3.025944, 0.5372549, 0, 1, 1,
0.6293999, -1.874398, 2.817974, 0.5411765, 0, 1, 1,
0.6335916, -1.07225, 2.849094, 0.5490196, 0, 1, 1,
0.6335942, 1.627016, 0.8266859, 0.5529412, 0, 1, 1,
0.6385717, 1.026604, 1.246065, 0.5607843, 0, 1, 1,
0.6496612, 1.251594, -1.215618, 0.5647059, 0, 1, 1,
0.650728, -3.182574, 2.495304, 0.572549, 0, 1, 1,
0.6512427, -1.542125, 3.424774, 0.5764706, 0, 1, 1,
0.6522324, -0.619707, 3.100192, 0.5843138, 0, 1, 1,
0.6550046, -0.7776752, 4.019514, 0.5882353, 0, 1, 1,
0.6580551, -0.3673134, 3.668127, 0.5960785, 0, 1, 1,
0.6640913, -0.2880573, -0.1785009, 0.6039216, 0, 1, 1,
0.6666997, 0.7560483, 0.5823626, 0.6078432, 0, 1, 1,
0.6783715, -1.247556, 2.966654, 0.6156863, 0, 1, 1,
0.678723, 0.3439623, 0.6238927, 0.6196079, 0, 1, 1,
0.679162, 0.4076296, 1.066521, 0.627451, 0, 1, 1,
0.680189, -0.4173506, 2.570349, 0.6313726, 0, 1, 1,
0.6832101, -0.7353587, 2.733108, 0.6392157, 0, 1, 1,
0.6894698, -0.477731, 3.189965, 0.6431373, 0, 1, 1,
0.6898603, 0.3760651, 3.093932, 0.6509804, 0, 1, 1,
0.6898705, 2.307979, 0.476722, 0.654902, 0, 1, 1,
0.6933301, -0.2387125, 1.410406, 0.6627451, 0, 1, 1,
0.6960472, -0.1083487, 3.020401, 0.6666667, 0, 1, 1,
0.7029511, 0.3811957, 0.5941362, 0.6745098, 0, 1, 1,
0.7103757, -0.1682833, 1.164619, 0.6784314, 0, 1, 1,
0.7181818, 0.3312075, 0.3950289, 0.6862745, 0, 1, 1,
0.719319, 2.415972, -0.6483579, 0.6901961, 0, 1, 1,
0.721671, 1.203112, 0.2196549, 0.6980392, 0, 1, 1,
0.7217056, 1.041403, -0.7021845, 0.7058824, 0, 1, 1,
0.7225285, 2.020525, 1.904763, 0.7098039, 0, 1, 1,
0.7307547, 2.303304, 0.8403062, 0.7176471, 0, 1, 1,
0.7326358, 0.2477289, 3.112929, 0.7215686, 0, 1, 1,
0.7358761, 0.03843393, 0.6776645, 0.7294118, 0, 1, 1,
0.7447019, -0.328538, 2.589302, 0.7333333, 0, 1, 1,
0.7460971, 0.4887406, 1.278402, 0.7411765, 0, 1, 1,
0.7466645, 1.231665, -0.8762334, 0.7450981, 0, 1, 1,
0.7475025, 0.8051721, 0.02300342, 0.7529412, 0, 1, 1,
0.7509914, 0.3836202, 1.374062, 0.7568628, 0, 1, 1,
0.7532859, -0.01250601, 0.5932363, 0.7647059, 0, 1, 1,
0.757356, -0.7832729, 2.459691, 0.7686275, 0, 1, 1,
0.7578948, 0.4333138, 1.281507, 0.7764706, 0, 1, 1,
0.7623374, -0.4656303, 3.001111, 0.7803922, 0, 1, 1,
0.7742589, -2.732065, 3.702044, 0.7882353, 0, 1, 1,
0.7751395, 0.4925139, 1.344492, 0.7921569, 0, 1, 1,
0.7756005, -0.4468503, 2.61083, 0.8, 0, 1, 1,
0.7761247, 0.3511186, 0.6629468, 0.8078431, 0, 1, 1,
0.7767879, 1.275886, -1.265068, 0.8117647, 0, 1, 1,
0.786864, 1.417758, 0.07832845, 0.8196079, 0, 1, 1,
0.7964311, 0.6835289, 0.3800135, 0.8235294, 0, 1, 1,
0.7996818, 0.5846172, -0.4195959, 0.8313726, 0, 1, 1,
0.8011742, -1.576362, 2.119212, 0.8352941, 0, 1, 1,
0.8102135, -0.001439662, 0.602189, 0.8431373, 0, 1, 1,
0.8117418, -1.503887, 4.265427, 0.8470588, 0, 1, 1,
0.8147016, 0.3788404, 1.235844, 0.854902, 0, 1, 1,
0.8157687, 0.07537936, 0.5986568, 0.8588235, 0, 1, 1,
0.8189477, -0.5155607, 1.297249, 0.8666667, 0, 1, 1,
0.8204556, 0.2979329, 1.674434, 0.8705882, 0, 1, 1,
0.8205739, -0.7523587, 2.213152, 0.8784314, 0, 1, 1,
0.8207873, 2.661379, 0.02443502, 0.8823529, 0, 1, 1,
0.8311557, -0.6752039, 2.017659, 0.8901961, 0, 1, 1,
0.8375448, 0.7091962, 1.88886, 0.8941177, 0, 1, 1,
0.8399227, 0.4724834, 0.6642698, 0.9019608, 0, 1, 1,
0.843904, 0.6550717, -0.9709308, 0.9098039, 0, 1, 1,
0.8447767, 0.3407798, 3.137364, 0.9137255, 0, 1, 1,
0.8468778, 0.4734581, 3.17807, 0.9215686, 0, 1, 1,
0.8473672, -0.6590278, 1.487869, 0.9254902, 0, 1, 1,
0.8502424, -0.3805318, 1.454204, 0.9333333, 0, 1, 1,
0.8520501, 1.185093, 0.2549246, 0.9372549, 0, 1, 1,
0.8549757, -0.3190916, -0.356934, 0.945098, 0, 1, 1,
0.8595388, 0.149942, 0.2249562, 0.9490196, 0, 1, 1,
0.863125, 1.267332, -1.502892, 0.9568627, 0, 1, 1,
0.8651789, -1.394096, 3.342493, 0.9607843, 0, 1, 1,
0.8654268, 0.7976417, 0.5952353, 0.9686275, 0, 1, 1,
0.8722308, -1.448743, 3.208822, 0.972549, 0, 1, 1,
0.8792978, 0.07537158, 1.948846, 0.9803922, 0, 1, 1,
0.8979374, 0.168211, 0.4539424, 0.9843137, 0, 1, 1,
0.9002108, 1.908331, -2.539517, 0.9921569, 0, 1, 1,
0.9015012, 1.877361, 2.16107, 0.9960784, 0, 1, 1,
0.9046914, 0.8164042, -0.7131993, 1, 0, 0.9960784, 1,
0.9134307, 1.580505, 0.09569442, 1, 0, 0.9882353, 1,
0.9147604, 1.271159, -0.05379513, 1, 0, 0.9843137, 1,
0.920539, -2.024696, 2.986782, 1, 0, 0.9764706, 1,
0.9239811, 0.2588575, 2.341071, 1, 0, 0.972549, 1,
0.924473, -1.737888, 3.237107, 1, 0, 0.9647059, 1,
0.9248852, -1.215611, 2.447652, 1, 0, 0.9607843, 1,
0.9279914, 0.274771, 0.3956264, 1, 0, 0.9529412, 1,
0.94546, 0.3060581, 0.4783679, 1, 0, 0.9490196, 1,
0.9462751, 0.3913038, 0.5354947, 1, 0, 0.9411765, 1,
0.9467904, 0.1703762, 2.515438, 1, 0, 0.9372549, 1,
0.9471717, -0.6764787, 2.315492, 1, 0, 0.9294118, 1,
0.9487102, -0.5213491, 2.728729, 1, 0, 0.9254902, 1,
0.9500823, -0.5586233, 3.250015, 1, 0, 0.9176471, 1,
0.9513477, -0.406485, 1.550525, 1, 0, 0.9137255, 1,
0.9541869, -0.1478063, 2.938345, 1, 0, 0.9058824, 1,
0.959051, -1.144677, 2.949223, 1, 0, 0.9019608, 1,
0.9627721, -0.6681741, 4.536035, 1, 0, 0.8941177, 1,
0.9739326, -1.167295, 1.522393, 1, 0, 0.8862745, 1,
0.9766704, -0.3119138, 1.593037, 1, 0, 0.8823529, 1,
0.9801697, 0.3799921, 0.04189575, 1, 0, 0.8745098, 1,
0.987295, -1.614063, 2.666034, 1, 0, 0.8705882, 1,
0.9884743, 0.9087332, 0.799316, 1, 0, 0.8627451, 1,
0.988727, 0.3580607, -0.07747746, 1, 0, 0.8588235, 1,
0.990338, -0.2086066, 3.01546, 1, 0, 0.8509804, 1,
0.994312, 0.6785899, -0.5182864, 1, 0, 0.8470588, 1,
0.998185, -0.2951124, 0.09037704, 1, 0, 0.8392157, 1,
1.000138, 2.650628, -0.05163167, 1, 0, 0.8352941, 1,
1.008396, -0.7778066, 3.163766, 1, 0, 0.827451, 1,
1.010589, -1.038405, 3.633344, 1, 0, 0.8235294, 1,
1.016507, -0.944786, 2.441079, 1, 0, 0.8156863, 1,
1.028004, 2.231965, 0.6161224, 1, 0, 0.8117647, 1,
1.031454, 0.8205912, 0.7017532, 1, 0, 0.8039216, 1,
1.036252, 0.2806684, 0.8767527, 1, 0, 0.7960784, 1,
1.047214, -1.721659, 2.469146, 1, 0, 0.7921569, 1,
1.05459, -0.2172998, 1.227261, 1, 0, 0.7843137, 1,
1.054696, -0.4661649, 2.023648, 1, 0, 0.7803922, 1,
1.054747, 0.5245163, 2.78976, 1, 0, 0.772549, 1,
1.055145, -0.9665057, 2.680364, 1, 0, 0.7686275, 1,
1.056295, 0.5979778, 2.541683, 1, 0, 0.7607843, 1,
1.057482, -0.02131134, 1.524413, 1, 0, 0.7568628, 1,
1.066509, 0.6561624, 0.4435307, 1, 0, 0.7490196, 1,
1.068493, -1.8068, 3.969081, 1, 0, 0.7450981, 1,
1.08276, 0.2673593, 1.433545, 1, 0, 0.7372549, 1,
1.084037, -1.491631, 2.321615, 1, 0, 0.7333333, 1,
1.085348, 0.1578171, 2.203365, 1, 0, 0.7254902, 1,
1.090585, -0.7715415, 2.756812, 1, 0, 0.7215686, 1,
1.091036, 0.3244078, 2.621325, 1, 0, 0.7137255, 1,
1.093559, -0.3431762, 1.283801, 1, 0, 0.7098039, 1,
1.109285, -0.3926731, 2.251086, 1, 0, 0.7019608, 1,
1.123194, -0.3430613, 1.125022, 1, 0, 0.6941177, 1,
1.125182, -0.7037297, 2.169621, 1, 0, 0.6901961, 1,
1.128278, 0.5047047, 1.092326, 1, 0, 0.682353, 1,
1.130489, 0.8266849, 0.5409799, 1, 0, 0.6784314, 1,
1.135551, -0.6455553, 1.196531, 1, 0, 0.6705883, 1,
1.144394, -1.044843, 3.084279, 1, 0, 0.6666667, 1,
1.149522, 0.790135, 1.54385, 1, 0, 0.6588235, 1,
1.157, 1.550044, 0.09046582, 1, 0, 0.654902, 1,
1.158848, 1.252603, 1.146622, 1, 0, 0.6470588, 1,
1.172494, -1.027844, 1.157859, 1, 0, 0.6431373, 1,
1.188039, -1.0261, 1.914906, 1, 0, 0.6352941, 1,
1.191876, 0.2057833, -0.08112929, 1, 0, 0.6313726, 1,
1.201998, -0.297441, 2.020743, 1, 0, 0.6235294, 1,
1.207941, -0.708739, 1.921205, 1, 0, 0.6196079, 1,
1.210189, -0.2225418, 2.090993, 1, 0, 0.6117647, 1,
1.214961, -0.3856301, 0.1874192, 1, 0, 0.6078432, 1,
1.215102, -1.132784, 0.3780258, 1, 0, 0.6, 1,
1.22404, -0.4128468, 1.300491, 1, 0, 0.5921569, 1,
1.224348, -0.3740208, 1.985734, 1, 0, 0.5882353, 1,
1.224917, -0.5839183, 1.795316, 1, 0, 0.5803922, 1,
1.234038, 1.210917, 0.3286453, 1, 0, 0.5764706, 1,
1.243599, -1.692616, 2.21599, 1, 0, 0.5686275, 1,
1.246562, -0.7695923, 0.8369408, 1, 0, 0.5647059, 1,
1.248517, 1.257081, 1.88746, 1, 0, 0.5568628, 1,
1.250724, 0.6880996, 0.8179772, 1, 0, 0.5529412, 1,
1.266807, -0.8826819, 3.501348, 1, 0, 0.5450981, 1,
1.268977, -0.7834357, 1.197212, 1, 0, 0.5411765, 1,
1.278982, 1.316542, 0.9381801, 1, 0, 0.5333334, 1,
1.284271, -1.378703, 0.9763172, 1, 0, 0.5294118, 1,
1.289345, -0.4493529, 0.5214689, 1, 0, 0.5215687, 1,
1.290267, 0.7647924, 2.86422, 1, 0, 0.5176471, 1,
1.293235, 1.54052, 0.8867321, 1, 0, 0.509804, 1,
1.293316, -1.230655, 1.697472, 1, 0, 0.5058824, 1,
1.315699, 1.231349, 0.1868735, 1, 0, 0.4980392, 1,
1.319246, -2.118676, 1.895794, 1, 0, 0.4901961, 1,
1.327382, -2.328926, 1.589828, 1, 0, 0.4862745, 1,
1.334097, -0.0195167, 1.843179, 1, 0, 0.4784314, 1,
1.336175, 1.718494, 1.308817, 1, 0, 0.4745098, 1,
1.337258, -1.549748, 2.050314, 1, 0, 0.4666667, 1,
1.340326, 1.126104, 1.411103, 1, 0, 0.4627451, 1,
1.350259, 0.7835934, 1.013586, 1, 0, 0.454902, 1,
1.351491, -0.6806231, 1.857972, 1, 0, 0.4509804, 1,
1.358676, 1.960935, 1.01799, 1, 0, 0.4431373, 1,
1.365901, -0.1662992, 0.6885275, 1, 0, 0.4392157, 1,
1.403918, 0.3238246, 1.840484, 1, 0, 0.4313726, 1,
1.404143, 0.1882958, 0.2854497, 1, 0, 0.427451, 1,
1.416669, -0.9095281, 2.126627, 1, 0, 0.4196078, 1,
1.428466, -0.6613393, 0.9100844, 1, 0, 0.4156863, 1,
1.429907, -0.5004882, 2.034154, 1, 0, 0.4078431, 1,
1.448126, -0.07332692, 1.470565, 1, 0, 0.4039216, 1,
1.448689, 0.753262, 1.891063, 1, 0, 0.3960784, 1,
1.452132, 0.2165424, 1.301586, 1, 0, 0.3882353, 1,
1.462636, 1.05193, 2.639774, 1, 0, 0.3843137, 1,
1.490808, 0.6076968, 0.7264223, 1, 0, 0.3764706, 1,
1.546229, -0.9153594, 2.33426, 1, 0, 0.372549, 1,
1.569466, 1.677904, 2.085012, 1, 0, 0.3647059, 1,
1.570343, 0.7439767, 2.81852, 1, 0, 0.3607843, 1,
1.576481, 0.7737338, 0.8311315, 1, 0, 0.3529412, 1,
1.576849, -0.6667119, -0.3092134, 1, 0, 0.3490196, 1,
1.589904, 0.4436387, 2.839604, 1, 0, 0.3411765, 1,
1.590741, -0.8184495, 1.081289, 1, 0, 0.3372549, 1,
1.595477, 1.491905, 2.779584, 1, 0, 0.3294118, 1,
1.597931, -0.4887778, 2.274042, 1, 0, 0.3254902, 1,
1.599264, 0.3887984, 2.219885, 1, 0, 0.3176471, 1,
1.611227, -1.31146, 1.798538, 1, 0, 0.3137255, 1,
1.629375, -2.348429, 2.612155, 1, 0, 0.3058824, 1,
1.629826, -0.9929696, 2.303886, 1, 0, 0.2980392, 1,
1.629974, 0.802632, 1.162, 1, 0, 0.2941177, 1,
1.633682, 0.5495325, 1.209501, 1, 0, 0.2862745, 1,
1.644408, 0.1905632, 1.711313, 1, 0, 0.282353, 1,
1.647988, 0.8467217, 0.5012378, 1, 0, 0.2745098, 1,
1.654185, -0.2478829, 2.096182, 1, 0, 0.2705882, 1,
1.65531, 1.339959, -0.07503779, 1, 0, 0.2627451, 1,
1.664295, -1.087067, 2.611659, 1, 0, 0.2588235, 1,
1.67041, -0.3993837, 1.505862, 1, 0, 0.2509804, 1,
1.683269, -0.3764159, 1.217766, 1, 0, 0.2470588, 1,
1.683666, 0.8021275, 2.923892, 1, 0, 0.2392157, 1,
1.688443, -0.07192986, 0.9351028, 1, 0, 0.2352941, 1,
1.699706, 0.1085906, 2.012731, 1, 0, 0.227451, 1,
1.700337, -1.084335, 0.7157351, 1, 0, 0.2235294, 1,
1.710514, 0.3031792, 3.03855, 1, 0, 0.2156863, 1,
1.73632, -0.8646427, 2.839202, 1, 0, 0.2117647, 1,
1.767917, 0.03227467, 4.296958, 1, 0, 0.2039216, 1,
1.784571, 0.5278316, 3.122898, 1, 0, 0.1960784, 1,
1.78788, -0.787387, 1.174781, 1, 0, 0.1921569, 1,
1.78807, -0.3994743, 2.296648, 1, 0, 0.1843137, 1,
1.809991, -0.9245402, 1.74257, 1, 0, 0.1803922, 1,
1.822707, -0.9478946, 1.769325, 1, 0, 0.172549, 1,
1.835102, -0.4164076, 1.65272, 1, 0, 0.1686275, 1,
1.838837, 0.6670308, 2.94417, 1, 0, 0.1607843, 1,
1.85049, 1.440417, 1.518822, 1, 0, 0.1568628, 1,
1.894974, 0.02223765, 2.106905, 1, 0, 0.1490196, 1,
1.895391, 1.29909, 1.938959, 1, 0, 0.145098, 1,
1.911182, -0.382513, 1.157234, 1, 0, 0.1372549, 1,
1.920779, -0.457321, 1.631542, 1, 0, 0.1333333, 1,
1.939368, 1.172476, 0.8648106, 1, 0, 0.1254902, 1,
1.943828, -1.098587, 3.027894, 1, 0, 0.1215686, 1,
1.956578, 0.2912894, 2.51891, 1, 0, 0.1137255, 1,
1.959544, 1.033612, 1.919941, 1, 0, 0.1098039, 1,
1.965282, -0.3057469, 1.650509, 1, 0, 0.1019608, 1,
1.9675, 0.9646982, 1.445643, 1, 0, 0.09411765, 1,
2.0198, -0.7659471, 2.649951, 1, 0, 0.09019608, 1,
2.025208, 0.8114697, 0.6682953, 1, 0, 0.08235294, 1,
2.03432, 0.8976097, 0.4103455, 1, 0, 0.07843138, 1,
2.051926, -0.3740411, 1.326572, 1, 0, 0.07058824, 1,
2.057124, 0.3582116, 0.878553, 1, 0, 0.06666667, 1,
2.065956, 1.927403, 0.6528947, 1, 0, 0.05882353, 1,
2.149243, 1.783753, 0.6970099, 1, 0, 0.05490196, 1,
2.157642, -0.1993422, 1.505507, 1, 0, 0.04705882, 1,
2.225428, 0.3426996, 1.437648, 1, 0, 0.04313726, 1,
2.421059, 0.2761282, 0.3310684, 1, 0, 0.03529412, 1,
2.437431, 0.6184682, -0.02032066, 1, 0, 0.03137255, 1,
2.463886, -0.5050425, 1.075498, 1, 0, 0.02352941, 1,
2.55786, -0.8851564, 2.250695, 1, 0, 0.01960784, 1,
2.668595, -0.1384781, 1.076908, 1, 0, 0.01176471, 1,
2.729368, -2.088554, 2.392007, 1, 0, 0.007843138, 1
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
-0.7125019, -4.416846, -6.641303, 0, -0.5, 0.5, 0.5,
-0.7125019, -4.416846, -6.641303, 1, -0.5, 0.5, 0.5,
-0.7125019, -4.416846, -6.641303, 1, 1.5, 0.5, 0.5,
-0.7125019, -4.416846, -6.641303, 0, 1.5, 0.5, 0.5
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
-5.321166, 0.4583474, -6.641303, 0, -0.5, 0.5, 0.5,
-5.321166, 0.4583474, -6.641303, 1, -0.5, 0.5, 0.5,
-5.321166, 0.4583474, -6.641303, 1, 1.5, 0.5, 0.5,
-5.321166, 0.4583474, -6.641303, 0, 1.5, 0.5, 0.5
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
-5.321166, -4.416846, 0.05366588, 0, -0.5, 0.5, 0.5,
-5.321166, -4.416846, 0.05366588, 1, -0.5, 0.5, 0.5,
-5.321166, -4.416846, 0.05366588, 1, 1.5, 0.5, 0.5,
-5.321166, -4.416846, 0.05366588, 0, 1.5, 0.5, 0.5
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
-4, -3.291801, -5.09631,
2, -3.291801, -5.09631,
-4, -3.291801, -5.09631,
-4, -3.479309, -5.353809,
-3, -3.291801, -5.09631,
-3, -3.479309, -5.353809,
-2, -3.291801, -5.09631,
-2, -3.479309, -5.353809,
-1, -3.291801, -5.09631,
-1, -3.479309, -5.353809,
0, -3.291801, -5.09631,
0, -3.479309, -5.353809,
1, -3.291801, -5.09631,
1, -3.479309, -5.353809,
2, -3.291801, -5.09631,
2, -3.479309, -5.353809
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
"-4",
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
-4, -3.854323, -5.868807, 0, -0.5, 0.5, 0.5,
-4, -3.854323, -5.868807, 1, -0.5, 0.5, 0.5,
-4, -3.854323, -5.868807, 1, 1.5, 0.5, 0.5,
-4, -3.854323, -5.868807, 0, 1.5, 0.5, 0.5,
-3, -3.854323, -5.868807, 0, -0.5, 0.5, 0.5,
-3, -3.854323, -5.868807, 1, -0.5, 0.5, 0.5,
-3, -3.854323, -5.868807, 1, 1.5, 0.5, 0.5,
-3, -3.854323, -5.868807, 0, 1.5, 0.5, 0.5,
-2, -3.854323, -5.868807, 0, -0.5, 0.5, 0.5,
-2, -3.854323, -5.868807, 1, -0.5, 0.5, 0.5,
-2, -3.854323, -5.868807, 1, 1.5, 0.5, 0.5,
-2, -3.854323, -5.868807, 0, 1.5, 0.5, 0.5,
-1, -3.854323, -5.868807, 0, -0.5, 0.5, 0.5,
-1, -3.854323, -5.868807, 1, -0.5, 0.5, 0.5,
-1, -3.854323, -5.868807, 1, 1.5, 0.5, 0.5,
-1, -3.854323, -5.868807, 0, 1.5, 0.5, 0.5,
0, -3.854323, -5.868807, 0, -0.5, 0.5, 0.5,
0, -3.854323, -5.868807, 1, -0.5, 0.5, 0.5,
0, -3.854323, -5.868807, 1, 1.5, 0.5, 0.5,
0, -3.854323, -5.868807, 0, 1.5, 0.5, 0.5,
1, -3.854323, -5.868807, 0, -0.5, 0.5, 0.5,
1, -3.854323, -5.868807, 1, -0.5, 0.5, 0.5,
1, -3.854323, -5.868807, 1, 1.5, 0.5, 0.5,
1, -3.854323, -5.868807, 0, 1.5, 0.5, 0.5,
2, -3.854323, -5.868807, 0, -0.5, 0.5, 0.5,
2, -3.854323, -5.868807, 1, -0.5, 0.5, 0.5,
2, -3.854323, -5.868807, 1, 1.5, 0.5, 0.5,
2, -3.854323, -5.868807, 0, 1.5, 0.5, 0.5
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
-4.257628, -2, -5.09631,
-4.257628, 4, -5.09631,
-4.257628, -2, -5.09631,
-4.434885, -2, -5.353809,
-4.257628, 0, -5.09631,
-4.434885, 0, -5.353809,
-4.257628, 2, -5.09631,
-4.434885, 2, -5.353809,
-4.257628, 4, -5.09631,
-4.434885, 4, -5.353809
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
"0",
"2",
"4"
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
-4.789397, -2, -5.868807, 0, -0.5, 0.5, 0.5,
-4.789397, -2, -5.868807, 1, -0.5, 0.5, 0.5,
-4.789397, -2, -5.868807, 1, 1.5, 0.5, 0.5,
-4.789397, -2, -5.868807, 0, 1.5, 0.5, 0.5,
-4.789397, 0, -5.868807, 0, -0.5, 0.5, 0.5,
-4.789397, 0, -5.868807, 1, -0.5, 0.5, 0.5,
-4.789397, 0, -5.868807, 1, 1.5, 0.5, 0.5,
-4.789397, 0, -5.868807, 0, 1.5, 0.5, 0.5,
-4.789397, 2, -5.868807, 0, -0.5, 0.5, 0.5,
-4.789397, 2, -5.868807, 1, -0.5, 0.5, 0.5,
-4.789397, 2, -5.868807, 1, 1.5, 0.5, 0.5,
-4.789397, 2, -5.868807, 0, 1.5, 0.5, 0.5,
-4.789397, 4, -5.868807, 0, -0.5, 0.5, 0.5,
-4.789397, 4, -5.868807, 1, -0.5, 0.5, 0.5,
-4.789397, 4, -5.868807, 1, 1.5, 0.5, 0.5,
-4.789397, 4, -5.868807, 0, 1.5, 0.5, 0.5
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
-4.257628, -3.291801, -4,
-4.257628, -3.291801, 4,
-4.257628, -3.291801, -4,
-4.434885, -3.479309, -4,
-4.257628, -3.291801, -2,
-4.434885, -3.479309, -2,
-4.257628, -3.291801, 0,
-4.434885, -3.479309, 0,
-4.257628, -3.291801, 2,
-4.434885, -3.479309, 2,
-4.257628, -3.291801, 4,
-4.434885, -3.479309, 4
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
-4.789397, -3.854323, -4, 0, -0.5, 0.5, 0.5,
-4.789397, -3.854323, -4, 1, -0.5, 0.5, 0.5,
-4.789397, -3.854323, -4, 1, 1.5, 0.5, 0.5,
-4.789397, -3.854323, -4, 0, 1.5, 0.5, 0.5,
-4.789397, -3.854323, -2, 0, -0.5, 0.5, 0.5,
-4.789397, -3.854323, -2, 1, -0.5, 0.5, 0.5,
-4.789397, -3.854323, -2, 1, 1.5, 0.5, 0.5,
-4.789397, -3.854323, -2, 0, 1.5, 0.5, 0.5,
-4.789397, -3.854323, 0, 0, -0.5, 0.5, 0.5,
-4.789397, -3.854323, 0, 1, -0.5, 0.5, 0.5,
-4.789397, -3.854323, 0, 1, 1.5, 0.5, 0.5,
-4.789397, -3.854323, 0, 0, 1.5, 0.5, 0.5,
-4.789397, -3.854323, 2, 0, -0.5, 0.5, 0.5,
-4.789397, -3.854323, 2, 1, -0.5, 0.5, 0.5,
-4.789397, -3.854323, 2, 1, 1.5, 0.5, 0.5,
-4.789397, -3.854323, 2, 0, 1.5, 0.5, 0.5,
-4.789397, -3.854323, 4, 0, -0.5, 0.5, 0.5,
-4.789397, -3.854323, 4, 1, -0.5, 0.5, 0.5,
-4.789397, -3.854323, 4, 1, 1.5, 0.5, 0.5,
-4.789397, -3.854323, 4, 0, 1.5, 0.5, 0.5
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
-4.257628, -3.291801, -5.09631,
-4.257628, 4.208496, -5.09631,
-4.257628, -3.291801, 5.203642,
-4.257628, 4.208496, 5.203642,
-4.257628, -3.291801, -5.09631,
-4.257628, -3.291801, 5.203642,
-4.257628, 4.208496, -5.09631,
-4.257628, 4.208496, 5.203642,
-4.257628, -3.291801, -5.09631,
2.832625, -3.291801, -5.09631,
-4.257628, -3.291801, 5.203642,
2.832625, -3.291801, 5.203642,
-4.257628, 4.208496, -5.09631,
2.832625, 4.208496, -5.09631,
-4.257628, 4.208496, 5.203642,
2.832625, 4.208496, 5.203642,
2.832625, -3.291801, -5.09631,
2.832625, 4.208496, -5.09631,
2.832625, -3.291801, 5.203642,
2.832625, 4.208496, 5.203642,
2.832625, -3.291801, -5.09631,
2.832625, -3.291801, 5.203642,
2.832625, 4.208496, -5.09631,
2.832625, 4.208496, 5.203642
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
var radius = 7.786147;
var distance = 34.64145;
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
mvMatrix.translate( 0.7125019, -0.4583474, -0.05366588 );
mvMatrix.scale( 1.187339, 1.122427, 0.8173372 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.64145);
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
Isobutane<-read.table("Isobutane.xyz")
```

```
## Error in read.table("Isobutane.xyz"): no lines available in input
```

```r
x<-Isobutane$V2
```

```
## Error in eval(expr, envir, enclos): object 'Isobutane' not found
```

```r
y<-Isobutane$V3
```

```
## Error in eval(expr, envir, enclos): object 'Isobutane' not found
```

```r
z<-Isobutane$V4
```

```
## Error in eval(expr, envir, enclos): object 'Isobutane' not found
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
-4.154372, -1.87712, -1.042714, 0, 0, 1, 1, 1,
-4.032704, -1.184401, -2.194162, 1, 0, 0, 1, 1,
-3.533566, 0.9684924, -2.571023, 1, 0, 0, 1, 1,
-3.261013, -0.7270948, -3.830519, 1, 0, 0, 1, 1,
-3.163341, -0.3210011, -2.482603, 1, 0, 0, 1, 1,
-3.075138, 0.3483222, -0.7400366, 1, 0, 0, 1, 1,
-2.780898, 0.5762067, -1.856832, 0, 0, 0, 1, 1,
-2.705994, -0.5607418, -0.6342247, 0, 0, 0, 1, 1,
-2.590683, -0.5107282, -1.924145, 0, 0, 0, 1, 1,
-2.54103, 0.7009313, -1.777397, 0, 0, 0, 1, 1,
-2.458061, 0.405782, -3.432023, 0, 0, 0, 1, 1,
-2.440542, 1.591555, -1.536608, 0, 0, 0, 1, 1,
-2.369415, 0.3626034, -0.5714577, 0, 0, 0, 1, 1,
-2.357485, 0.6857253, -1.427335, 1, 1, 1, 1, 1,
-2.330228, 1.585686, 0.2292751, 1, 1, 1, 1, 1,
-2.310147, 0.7101564, -2.101748, 1, 1, 1, 1, 1,
-2.29754, 0.3439741, -3.128175, 1, 1, 1, 1, 1,
-2.293216, 0.4830782, 0.6781605, 1, 1, 1, 1, 1,
-2.287465, 0.2805164, -2.390293, 1, 1, 1, 1, 1,
-2.2863, 2.03763, -0.3143187, 1, 1, 1, 1, 1,
-2.281788, -1.023128, -1.41516, 1, 1, 1, 1, 1,
-2.253938, 0.6425815, -2.578248, 1, 1, 1, 1, 1,
-2.213274, 0.3058698, -2.187663, 1, 1, 1, 1, 1,
-2.185584, -1.180727, -0.8134797, 1, 1, 1, 1, 1,
-2.178706, -0.04068688, -3.383074, 1, 1, 1, 1, 1,
-2.176426, -0.4658821, -1.086446, 1, 1, 1, 1, 1,
-2.129778, -0.09092084, -1.219483, 1, 1, 1, 1, 1,
-2.118114, -0.6408399, 0.3615491, 1, 1, 1, 1, 1,
-2.105801, -1.071237, -2.018737, 0, 0, 1, 1, 1,
-2.075451, -0.9983277, -0.1010758, 1, 0, 0, 1, 1,
-2.071996, -1.538383, -1.832826, 1, 0, 0, 1, 1,
-2.061531, 2.004749, -1.832654, 1, 0, 0, 1, 1,
-2.04552, 0.08799437, -0.393371, 1, 0, 0, 1, 1,
-2.032062, 1.54924, -1.200339, 1, 0, 0, 1, 1,
-2.023425, 1.174026, -1.422331, 0, 0, 0, 1, 1,
-1.998633, -1.202404, -0.1780677, 0, 0, 0, 1, 1,
-1.977726, -0.5945919, -0.9771112, 0, 0, 0, 1, 1,
-1.964823, 0.4082155, -0.3575279, 0, 0, 0, 1, 1,
-1.947157, 0.5124382, -3.555212, 0, 0, 0, 1, 1,
-1.88223, 0.0383557, 1.189828, 0, 0, 0, 1, 1,
-1.82444, -0.7511823, -2.198354, 0, 0, 0, 1, 1,
-1.791405, -0.1117213, -3.02458, 1, 1, 1, 1, 1,
-1.779609, 1.525228, -1.472861, 1, 1, 1, 1, 1,
-1.764979, 1.532033, -0.9471422, 1, 1, 1, 1, 1,
-1.759205, -2.844895, -2.605458, 1, 1, 1, 1, 1,
-1.745506, 0.2880144, -2.12588, 1, 1, 1, 1, 1,
-1.711702, -1.041166, -0.790764, 1, 1, 1, 1, 1,
-1.699114, 0.1483694, -2.13051, 1, 1, 1, 1, 1,
-1.689428, -1.464218, -3.427834, 1, 1, 1, 1, 1,
-1.687605, 0.333988, -2.202449, 1, 1, 1, 1, 1,
-1.687078, -0.2136534, -2.473338, 1, 1, 1, 1, 1,
-1.684208, 0.01983949, -1.125436, 1, 1, 1, 1, 1,
-1.681353, -0.04028558, -3.349251, 1, 1, 1, 1, 1,
-1.679983, -1.634185, -1.605727, 1, 1, 1, 1, 1,
-1.678278, 0.8093888, -1.794867, 1, 1, 1, 1, 1,
-1.6197, -0.7989177, -0.6822712, 1, 1, 1, 1, 1,
-1.611133, 0.2726455, -1.076088, 0, 0, 1, 1, 1,
-1.610853, 1.456061, -2.056229, 1, 0, 0, 1, 1,
-1.61003, -0.8329124, -2.605344, 1, 0, 0, 1, 1,
-1.587154, -0.5620264, -0.7846064, 1, 0, 0, 1, 1,
-1.583817, -0.8431748, -0.7139412, 1, 0, 0, 1, 1,
-1.577193, 1.724667, -0.6170052, 1, 0, 0, 1, 1,
-1.574201, 0.04923157, 0.02075298, 0, 0, 0, 1, 1,
-1.56725, 0.6320266, -2.396584, 0, 0, 0, 1, 1,
-1.564856, -0.3724744, -2.116211, 0, 0, 0, 1, 1,
-1.559993, -0.315515, -1.400759, 0, 0, 0, 1, 1,
-1.545036, -1.198338, -2.312929, 0, 0, 0, 1, 1,
-1.544447, 0.5078602, -2.815751, 0, 0, 0, 1, 1,
-1.539025, -1.718735, -3.058855, 0, 0, 0, 1, 1,
-1.531343, 1.901253, -0.3960277, 1, 1, 1, 1, 1,
-1.530638, -1.433284, -2.874402, 1, 1, 1, 1, 1,
-1.526971, 1.392519, -1.367578, 1, 1, 1, 1, 1,
-1.52301, 0.09105163, -1.564921, 1, 1, 1, 1, 1,
-1.515516, -0.7523158, -3.123139, 1, 1, 1, 1, 1,
-1.512918, -0.1590611, -2.490983, 1, 1, 1, 1, 1,
-1.511655, 0.09871607, -1.840769, 1, 1, 1, 1, 1,
-1.510173, 1.007654, -2.316256, 1, 1, 1, 1, 1,
-1.50882, -0.700853, -2.028506, 1, 1, 1, 1, 1,
-1.500268, 0.3168034, -1.618948, 1, 1, 1, 1, 1,
-1.489115, 0.406191, -1.308254, 1, 1, 1, 1, 1,
-1.488841, -0.1070257, -1.101046, 1, 1, 1, 1, 1,
-1.486371, -1.801171, -2.947693, 1, 1, 1, 1, 1,
-1.478485, 1.243277, -1.372681, 1, 1, 1, 1, 1,
-1.46998, -0.1923561, -2.532477, 1, 1, 1, 1, 1,
-1.463494, -0.6233374, -2.206297, 0, 0, 1, 1, 1,
-1.460427, 0.2693098, -1.16742, 1, 0, 0, 1, 1,
-1.452224, -1.566013, -1.815236, 1, 0, 0, 1, 1,
-1.445433, -0.1572159, -3.662094, 1, 0, 0, 1, 1,
-1.441224, 1.221933, -0.3552736, 1, 0, 0, 1, 1,
-1.436417, 0.5375493, -4.417433, 1, 0, 0, 1, 1,
-1.429557, 0.5164073, -1.546807, 0, 0, 0, 1, 1,
-1.417016, -0.9501842, -2.63418, 0, 0, 0, 1, 1,
-1.404222, 1.918867, -0.3224446, 0, 0, 0, 1, 1,
-1.403832, 1.01352, 0.2432138, 0, 0, 0, 1, 1,
-1.39753, 0.4591959, -2.986078, 0, 0, 0, 1, 1,
-1.396661, 2.501729, -0.1332385, 0, 0, 0, 1, 1,
-1.389262, 1.492799, 0.6703815, 0, 0, 0, 1, 1,
-1.385404, -0.6915466, -2.083351, 1, 1, 1, 1, 1,
-1.382842, -0.7278609, -3.261906, 1, 1, 1, 1, 1,
-1.381563, -1.807111, -4.326394, 1, 1, 1, 1, 1,
-1.365039, -1.807097, -2.183703, 1, 1, 1, 1, 1,
-1.347159, -0.9640346, -2.548617, 1, 1, 1, 1, 1,
-1.344627, 0.02194679, -2.999655, 1, 1, 1, 1, 1,
-1.33778, 0.9129298, -0.8037317, 1, 1, 1, 1, 1,
-1.337067, 1.629879, -3.036525, 1, 1, 1, 1, 1,
-1.325551, -0.02981374, -2.7878, 1, 1, 1, 1, 1,
-1.324805, -0.03351288, -1.942744, 1, 1, 1, 1, 1,
-1.322819, -0.06735846, -0.9288718, 1, 1, 1, 1, 1,
-1.321798, -0.8121266, -2.650585, 1, 1, 1, 1, 1,
-1.321266, -1.596237, -3.096166, 1, 1, 1, 1, 1,
-1.302245, 1.178077, -1.933684, 1, 1, 1, 1, 1,
-1.300889, -1.675759, -2.649469, 1, 1, 1, 1, 1,
-1.295635, -0.1264846, -0.8215783, 0, 0, 1, 1, 1,
-1.293039, -0.4685363, -2.198159, 1, 0, 0, 1, 1,
-1.276751, 0.09887204, -1.350219, 1, 0, 0, 1, 1,
-1.264188, -0.3083047, -0.9962902, 1, 0, 0, 1, 1,
-1.2598, 0.01508007, -2.511526, 1, 0, 0, 1, 1,
-1.255076, -0.2486609, -1.705256, 1, 0, 0, 1, 1,
-1.251817, -1.487428, -2.345839, 0, 0, 0, 1, 1,
-1.250827, -1.918235, -2.918085, 0, 0, 0, 1, 1,
-1.244143, -1.875768, -2.515244, 0, 0, 0, 1, 1,
-1.236601, -0.6512658, -2.745965, 0, 0, 0, 1, 1,
-1.231397, 0.991317, -1.468423, 0, 0, 0, 1, 1,
-1.227903, 0.8073858, -0.4397563, 0, 0, 0, 1, 1,
-1.22757, 0.7249594, -0.3433924, 0, 0, 0, 1, 1,
-1.225212, -1.347932, -2.011281, 1, 1, 1, 1, 1,
-1.224685, -0.2628508, -2.958228, 1, 1, 1, 1, 1,
-1.218106, 0.7160384, -1.177248, 1, 1, 1, 1, 1,
-1.212292, 0.858675, -0.4264458, 1, 1, 1, 1, 1,
-1.208693, -0.5495422, -1.8882, 1, 1, 1, 1, 1,
-1.194425, -1.144678, -2.461742, 1, 1, 1, 1, 1,
-1.186696, 1.686733, -1.394841, 1, 1, 1, 1, 1,
-1.183811, 0.9072321, 0.6981934, 1, 1, 1, 1, 1,
-1.176886, -2.182859, -3.26761, 1, 1, 1, 1, 1,
-1.165234, 1.334954, 0.8672949, 1, 1, 1, 1, 1,
-1.158611, 0.01485828, -1.489558, 1, 1, 1, 1, 1,
-1.153683, -0.2186775, -1.838276, 1, 1, 1, 1, 1,
-1.147584, 0.07543451, -3.097778, 1, 1, 1, 1, 1,
-1.146513, 0.1423315, -1.751114, 1, 1, 1, 1, 1,
-1.144651, 1.159639, -1.835245, 1, 1, 1, 1, 1,
-1.139491, -0.2417489, -0.7789782, 0, 0, 1, 1, 1,
-1.136806, 0.4156156, -1.692137, 1, 0, 0, 1, 1,
-1.132229, 1.095332, -0.01109375, 1, 0, 0, 1, 1,
-1.131098, -0.5871093, -2.078777, 1, 0, 0, 1, 1,
-1.124081, -0.6576165, -1.646173, 1, 0, 0, 1, 1,
-1.119996, 0.1602471, -2.361286, 1, 0, 0, 1, 1,
-1.11986, 0.8977196, -0.7508529, 0, 0, 0, 1, 1,
-1.10976, -1.115996, -2.167192, 0, 0, 0, 1, 1,
-1.109572, 1.42479, -0.4808509, 0, 0, 0, 1, 1,
-1.10777, 0.4119394, -1.690459, 0, 0, 0, 1, 1,
-1.103714, -0.9982715, -1.053098, 0, 0, 0, 1, 1,
-1.102032, -0.6193955, 0.7848585, 0, 0, 0, 1, 1,
-1.100628, 1.078337, -1.868802, 0, 0, 0, 1, 1,
-1.096623, 0.2399372, -0.8047656, 1, 1, 1, 1, 1,
-1.095723, 0.9400795, -0.06197654, 1, 1, 1, 1, 1,
-1.093636, -0.2223081, -2.385019, 1, 1, 1, 1, 1,
-1.088925, -0.5475421, -2.102396, 1, 1, 1, 1, 1,
-1.088495, 0.4816293, -2.822636, 1, 1, 1, 1, 1,
-1.087238, -0.2078082, -2.173805, 1, 1, 1, 1, 1,
-1.077966, 0.1017816, -0.8290437, 1, 1, 1, 1, 1,
-1.056178, -0.7389107, -1.416561, 1, 1, 1, 1, 1,
-1.051592, 0.1052811, -3.445453, 1, 1, 1, 1, 1,
-1.048567, -0.2002069, 0.213521, 1, 1, 1, 1, 1,
-1.045612, -0.1786905, -1.486662, 1, 1, 1, 1, 1,
-1.043547, -0.1622429, -0.7046046, 1, 1, 1, 1, 1,
-1.042372, 1.395896, -1.411157, 1, 1, 1, 1, 1,
-1.041602, -0.4599433, -1.783367, 1, 1, 1, 1, 1,
-1.03862, -0.5874997, 0.009411018, 1, 1, 1, 1, 1,
-1.038316, 0.3443233, -1.768819, 0, 0, 1, 1, 1,
-1.031443, 1.954125, -0.5197283, 1, 0, 0, 1, 1,
-1.011632, 1.047109, -0.8018022, 1, 0, 0, 1, 1,
-1.001753, -0.01493349, -0.6022213, 1, 0, 0, 1, 1,
-0.9904019, -0.3848532, -1.175214, 1, 0, 0, 1, 1,
-0.9900785, 0.461247, -1.992388, 1, 0, 0, 1, 1,
-0.9888169, -0.2236367, -2.930458, 0, 0, 0, 1, 1,
-0.9853252, -0.6660606, -4.10516, 0, 0, 0, 1, 1,
-0.9793621, -0.4824232, -2.103098, 0, 0, 0, 1, 1,
-0.9778209, 0.5660079, -2.115635, 0, 0, 0, 1, 1,
-0.9773991, -0.08022472, -1.867359, 0, 0, 0, 1, 1,
-0.9699997, -0.9569056, -1.661247, 0, 0, 0, 1, 1,
-0.9697152, 0.2854179, -0.9072927, 0, 0, 0, 1, 1,
-0.9559445, 1.502737, -0.1106304, 1, 1, 1, 1, 1,
-0.9553729, -0.3191287, -0.437654, 1, 1, 1, 1, 1,
-0.9552909, -1.454754, -0.7291472, 1, 1, 1, 1, 1,
-0.9477369, -0.1714806, -1.911224, 1, 1, 1, 1, 1,
-0.946603, -0.06455158, -1.949687, 1, 1, 1, 1, 1,
-0.9413236, -0.5687618, -3.603432, 1, 1, 1, 1, 1,
-0.9405764, -0.6730057, -1.894706, 1, 1, 1, 1, 1,
-0.9307252, 0.4856263, -1.734215, 1, 1, 1, 1, 1,
-0.9263743, -0.6316895, -3.333941, 1, 1, 1, 1, 1,
-0.9206756, -0.8170113, -1.049208, 1, 1, 1, 1, 1,
-0.9187816, -1.088233, -2.292147, 1, 1, 1, 1, 1,
-0.9178061, -0.0321971, -1.435691, 1, 1, 1, 1, 1,
-0.9108585, -0.03714038, -3.681787, 1, 1, 1, 1, 1,
-0.9099054, -0.5019379, -2.726199, 1, 1, 1, 1, 1,
-0.9052181, 0.07325701, -2.437669, 1, 1, 1, 1, 1,
-0.9038027, -0.9354412, -2.878599, 0, 0, 1, 1, 1,
-0.8973982, 0.432448, -0.6539966, 1, 0, 0, 1, 1,
-0.8902061, -0.3400563, -4.075059, 1, 0, 0, 1, 1,
-0.8848525, -2.255702, -2.462159, 1, 0, 0, 1, 1,
-0.8830628, 1.350118, -0.2875177, 1, 0, 0, 1, 1,
-0.8771574, -0.680205, -3.926949, 1, 0, 0, 1, 1,
-0.8751152, 1.093859, 0.6522867, 0, 0, 0, 1, 1,
-0.8733419, -1.26836, -3.562726, 0, 0, 0, 1, 1,
-0.8712292, -1.014954, -2.635422, 0, 0, 0, 1, 1,
-0.8696079, 1.175737, -0.5459665, 0, 0, 0, 1, 1,
-0.8683633, -1.205034, -3.269875, 0, 0, 0, 1, 1,
-0.8667115, 1.270128, -0.4033011, 0, 0, 0, 1, 1,
-0.8622361, -1.612617, -3.356744, 0, 0, 0, 1, 1,
-0.86217, 2.098187, 0.04570808, 1, 1, 1, 1, 1,
-0.8602309, -0.3884577, -1.826195, 1, 1, 1, 1, 1,
-0.8570904, -0.6369698, -2.333623, 1, 1, 1, 1, 1,
-0.8561974, -0.3206234, -1.829127, 1, 1, 1, 1, 1,
-0.8561599, 2.000264, 0.06609543, 1, 1, 1, 1, 1,
-0.845899, 0.628824, -0.6876995, 1, 1, 1, 1, 1,
-0.8394421, 0.9181214, -1.366885, 1, 1, 1, 1, 1,
-0.8387109, 2.381221, -1.278153, 1, 1, 1, 1, 1,
-0.8383102, -1.202774, -3.596833, 1, 1, 1, 1, 1,
-0.8376339, -0.4478429, -1.250955, 1, 1, 1, 1, 1,
-0.8366832, -1.186539, -3.908891, 1, 1, 1, 1, 1,
-0.8297464, -1.014275, -2.020265, 1, 1, 1, 1, 1,
-0.8245418, -1.632851, -3.256755, 1, 1, 1, 1, 1,
-0.8236693, 0.6296601, -1.833961, 1, 1, 1, 1, 1,
-0.8223045, -0.9682782, -3.219429, 1, 1, 1, 1, 1,
-0.8206069, -0.2817138, -2.109948, 0, 0, 1, 1, 1,
-0.8162401, -0.05797227, -2.522914, 1, 0, 0, 1, 1,
-0.8155509, 0.9306378, -0.9775115, 1, 0, 0, 1, 1,
-0.8126678, 1.534621, -0.5093661, 1, 0, 0, 1, 1,
-0.8068098, 0.338798, -0.625707, 1, 0, 0, 1, 1,
-0.805733, 1.561071, -1.440725, 1, 0, 0, 1, 1,
-0.7996784, 0.8261651, -0.2992693, 0, 0, 0, 1, 1,
-0.7990997, 1.43698, 0.2350902, 0, 0, 0, 1, 1,
-0.7901785, 0.3640428, -1.8532, 0, 0, 0, 1, 1,
-0.7829784, -1.358337, -3.548337, 0, 0, 0, 1, 1,
-0.7763382, 1.302849, 0.3893659, 0, 0, 0, 1, 1,
-0.7758393, 2.288631, -1.000213, 0, 0, 0, 1, 1,
-0.7737426, -1.282476, -3.658628, 0, 0, 0, 1, 1,
-0.7723951, -0.22874, -1.722852, 1, 1, 1, 1, 1,
-0.7665482, 0.08242335, -1.15205, 1, 1, 1, 1, 1,
-0.759997, 1.201902, 0.5065454, 1, 1, 1, 1, 1,
-0.7500077, -1.682187, -2.1495, 1, 1, 1, 1, 1,
-0.7476357, 0.5504852, 1.649419, 1, 1, 1, 1, 1,
-0.7415575, -1.895879, -2.591813, 1, 1, 1, 1, 1,
-0.7396954, -0.1547308, -1.366809, 1, 1, 1, 1, 1,
-0.7365821, 0.3967433, -2.404199, 1, 1, 1, 1, 1,
-0.7354967, 1.387147, -1.423864, 1, 1, 1, 1, 1,
-0.7335581, -0.5864337, -2.241419, 1, 1, 1, 1, 1,
-0.7319903, 0.7568561, -2.387762, 1, 1, 1, 1, 1,
-0.7295222, -0.0719263, -1.170118, 1, 1, 1, 1, 1,
-0.7211144, -0.3351896, -2.56279, 1, 1, 1, 1, 1,
-0.7198582, 1.415547, 1.178905, 1, 1, 1, 1, 1,
-0.7059806, 0.9742024, -0.3189423, 1, 1, 1, 1, 1,
-0.7049479, 0.4016892, 0.7839007, 0, 0, 1, 1, 1,
-0.7032163, -0.3290045, -0.6964525, 1, 0, 0, 1, 1,
-0.700839, 0.3795095, -1.811723, 1, 0, 0, 1, 1,
-0.6971891, -0.07154891, -3.349668, 1, 0, 0, 1, 1,
-0.696126, -1.323294, -2.199261, 1, 0, 0, 1, 1,
-0.6938611, -0.2726959, -2.980855, 1, 0, 0, 1, 1,
-0.691207, -0.4572746, -2.130424, 0, 0, 0, 1, 1,
-0.6851166, 0.4125346, -2.707626, 0, 0, 0, 1, 1,
-0.683825, -0.2288488, -0.07950488, 0, 0, 0, 1, 1,
-0.6822842, 0.1708523, -0.6573887, 0, 0, 0, 1, 1,
-0.6703451, 0.06925245, -2.259001, 0, 0, 0, 1, 1,
-0.6585048, 0.696827, 0.01467997, 0, 0, 0, 1, 1,
-0.6571562, -0.1470769, -1.397637, 0, 0, 0, 1, 1,
-0.6524293, -0.2947394, -3.059961, 1, 1, 1, 1, 1,
-0.6455036, 2.057013, 1.480516, 1, 1, 1, 1, 1,
-0.6451102, 0.8976533, -0.3437848, 1, 1, 1, 1, 1,
-0.6420332, 0.2140908, -0.02538969, 1, 1, 1, 1, 1,
-0.641151, 0.959361, 0.04284725, 1, 1, 1, 1, 1,
-0.6404898, -1.554249, -1.835493, 1, 1, 1, 1, 1,
-0.6394419, -1.372565, -1.783297, 1, 1, 1, 1, 1,
-0.6371543, -0.5237416, -1.515494, 1, 1, 1, 1, 1,
-0.6364836, 0.8631101, 0.9321759, 1, 1, 1, 1, 1,
-0.6344814, 0.1312639, -2.051544, 1, 1, 1, 1, 1,
-0.6305418, 1.999726, 0.03083633, 1, 1, 1, 1, 1,
-0.6292542, -0.8978782, -3.685447, 1, 1, 1, 1, 1,
-0.6172242, 0.6854063, -2.113838, 1, 1, 1, 1, 1,
-0.616869, 0.3295172, -1.324384, 1, 1, 1, 1, 1,
-0.6152655, -0.4462698, -3.588945, 1, 1, 1, 1, 1,
-0.610727, 1.973486, -0.4767216, 0, 0, 1, 1, 1,
-0.6078144, -1.483426, -2.893347, 1, 0, 0, 1, 1,
-0.6070111, 0.6010341, 0.2255131, 1, 0, 0, 1, 1,
-0.6044668, -1.524787, -3.607268, 1, 0, 0, 1, 1,
-0.6034214, -1.079972, -3.445359, 1, 0, 0, 1, 1,
-0.6003101, -0.3596264, -0.5813805, 1, 0, 0, 1, 1,
-0.598959, 0.1540326, -0.8972946, 0, 0, 0, 1, 1,
-0.5891703, -0.875026, -2.9476, 0, 0, 0, 1, 1,
-0.5847268, -0.1853797, -1.28532, 0, 0, 0, 1, 1,
-0.5843785, -1.978591, -2.397403, 0, 0, 0, 1, 1,
-0.5843304, -0.7158494, -1.154079, 0, 0, 0, 1, 1,
-0.5834027, -0.313149, -2.115633, 0, 0, 0, 1, 1,
-0.5832704, -0.9434912, -2.641535, 0, 0, 0, 1, 1,
-0.5825843, -0.8055754, -2.014583, 1, 1, 1, 1, 1,
-0.5820569, -0.2234555, -1.672511, 1, 1, 1, 1, 1,
-0.5804574, -0.7128372, -3.807637, 1, 1, 1, 1, 1,
-0.5792282, 0.3348761, -1.422196, 1, 1, 1, 1, 1,
-0.5759459, -0.8685911, -2.279942, 1, 1, 1, 1, 1,
-0.5690999, -0.2648362, -0.6883886, 1, 1, 1, 1, 1,
-0.567772, 0.589759, -0.02787338, 1, 1, 1, 1, 1,
-0.5652817, 0.8975822, -0.3456598, 1, 1, 1, 1, 1,
-0.5647827, 1.896047, 0.745945, 1, 1, 1, 1, 1,
-0.5609282, -0.8785521, -1.856318, 1, 1, 1, 1, 1,
-0.5601624, -0.5897101, -3.155227, 1, 1, 1, 1, 1,
-0.5560985, -0.7527553, -3.640153, 1, 1, 1, 1, 1,
-0.5555307, 2.163372, -0.7202794, 1, 1, 1, 1, 1,
-0.5550314, 0.5461659, 0.04020897, 1, 1, 1, 1, 1,
-0.5519548, 0.8722441, -0.768652, 1, 1, 1, 1, 1,
-0.5480103, 0.3300588, -1.484928, 0, 0, 1, 1, 1,
-0.5466998, 0.3309177, 0.3458751, 1, 0, 0, 1, 1,
-0.5355198, -2.870287, -3.746971, 1, 0, 0, 1, 1,
-0.5318336, -1.066242, -1.461461, 1, 0, 0, 1, 1,
-0.5307061, 0.357306, -0.2762062, 1, 0, 0, 1, 1,
-0.5304528, 0.1635644, -1.471185, 1, 0, 0, 1, 1,
-0.5284641, 1.447547, -1.53483, 0, 0, 0, 1, 1,
-0.5284095, -1.346443, -3.594227, 0, 0, 0, 1, 1,
-0.5274618, -1.791674, -4.12895, 0, 0, 0, 1, 1,
-0.5262133, 0.2482296, -1.197911, 0, 0, 0, 1, 1,
-0.525682, -0.5384062, -0.4952198, 0, 0, 0, 1, 1,
-0.5220562, 1.005866, -0.09594662, 0, 0, 0, 1, 1,
-0.5169889, 0.951763, 0.2996648, 0, 0, 0, 1, 1,
-0.5074337, 0.7433936, -0.5584244, 1, 1, 1, 1, 1,
-0.5061274, -1.769854, -3.765116, 1, 1, 1, 1, 1,
-0.5026194, -1.076673, -2.545341, 1, 1, 1, 1, 1,
-0.5024722, -0.2096593, -2.452629, 1, 1, 1, 1, 1,
-0.501289, -1.390867, -4.329371, 1, 1, 1, 1, 1,
-0.4997253, 0.2290026, 0.4523775, 1, 1, 1, 1, 1,
-0.4937153, 0.1526881, -1.49616, 1, 1, 1, 1, 1,
-0.4927476, 0.6285787, -0.4405996, 1, 1, 1, 1, 1,
-0.4880202, -1.063561, -2.085314, 1, 1, 1, 1, 1,
-0.4857068, 0.04606441, -0.9403533, 1, 1, 1, 1, 1,
-0.477834, 1.706954, -0.9183159, 1, 1, 1, 1, 1,
-0.4770323, -0.2237551, -1.300823, 1, 1, 1, 1, 1,
-0.4751648, 0.8672457, -1.71548, 1, 1, 1, 1, 1,
-0.4749171, 2.009502, -1.023637, 1, 1, 1, 1, 1,
-0.4718304, -0.7478156, -1.837407, 1, 1, 1, 1, 1,
-0.4679362, -0.7130787, -2.152931, 0, 0, 1, 1, 1,
-0.4611433, 2.805216, 1.30036, 1, 0, 0, 1, 1,
-0.4544186, 1.201254, -1.780656, 1, 0, 0, 1, 1,
-0.4542527, -0.7381245, -2.005913, 1, 0, 0, 1, 1,
-0.4531415, -0.02366588, -2.544808, 1, 0, 0, 1, 1,
-0.4517788, -0.4389983, -2.601025, 1, 0, 0, 1, 1,
-0.4514375, 1.307731, 0.639269, 0, 0, 0, 1, 1,
-0.4498296, -0.805817, -3.951427, 0, 0, 0, 1, 1,
-0.4477988, 0.814876, 0.06514215, 0, 0, 0, 1, 1,
-0.4467405, 2.281384, 1.03544, 0, 0, 0, 1, 1,
-0.4463265, 2.082596, -0.6889122, 0, 0, 0, 1, 1,
-0.4416126, 0.04899556, -1.746139, 0, 0, 0, 1, 1,
-0.4413065, -0.0585295, -1.877266, 0, 0, 0, 1, 1,
-0.4409312, 0.03420402, -1.061509, 1, 1, 1, 1, 1,
-0.439345, -1.060024, -2.559474, 1, 1, 1, 1, 1,
-0.4349682, -0.1057327, -0.9965945, 1, 1, 1, 1, 1,
-0.433709, -0.2715223, -1.356317, 1, 1, 1, 1, 1,
-0.4300772, -1.643828, -3.306399, 1, 1, 1, 1, 1,
-0.4277342, -0.1365727, -1.253816, 1, 1, 1, 1, 1,
-0.4234691, 0.147914, -2.40966, 1, 1, 1, 1, 1,
-0.4231869, -0.5319341, -4.023757, 1, 1, 1, 1, 1,
-0.422817, -2.179329, -1.57709, 1, 1, 1, 1, 1,
-0.4220811, 1.549163, 0.3474437, 1, 1, 1, 1, 1,
-0.4191769, 0.3033687, -0.4963452, 1, 1, 1, 1, 1,
-0.418479, -0.961441, -1.811989, 1, 1, 1, 1, 1,
-0.4152914, -0.4264227, -2.070501, 1, 1, 1, 1, 1,
-0.4098985, 0.3241397, 0.3145311, 1, 1, 1, 1, 1,
-0.4087697, 2.049913, 0.7817203, 1, 1, 1, 1, 1,
-0.4055573, -0.6516882, -1.682315, 0, 0, 1, 1, 1,
-0.4044214, 1.199663, -1.062863, 1, 0, 0, 1, 1,
-0.3965383, 0.5579292, 0.2472411, 1, 0, 0, 1, 1,
-0.3901931, -1.326255, -2.309561, 1, 0, 0, 1, 1,
-0.3897596, -0.008119114, -0.3083201, 1, 0, 0, 1, 1,
-0.3893343, -0.07572796, -0.5179108, 1, 0, 0, 1, 1,
-0.3889085, -0.1073584, -0.980104, 0, 0, 0, 1, 1,
-0.384943, -0.01009347, -0.06891017, 0, 0, 0, 1, 1,
-0.3809244, -0.01162076, -1.550282, 0, 0, 0, 1, 1,
-0.379315, -0.3195334, -0.8701117, 0, 0, 0, 1, 1,
-0.3793061, 2.332801, 0.8028592, 0, 0, 0, 1, 1,
-0.3791535, 0.5892381, 0.4124649, 0, 0, 0, 1, 1,
-0.375092, -0.5642577, -4.34453, 0, 0, 0, 1, 1,
-0.3733625, -2.410387, -3.718745, 1, 1, 1, 1, 1,
-0.3655788, 2.090832, -1.011886, 1, 1, 1, 1, 1,
-0.3649566, -0.4449337, -2.247732, 1, 1, 1, 1, 1,
-0.3577212, 1.463429, -1.124606, 1, 1, 1, 1, 1,
-0.3526563, -0.4982366, -1.120462, 1, 1, 1, 1, 1,
-0.3477918, 0.168098, -0.5535476, 1, 1, 1, 1, 1,
-0.3460325, -0.6180211, -1.212844, 1, 1, 1, 1, 1,
-0.3395528, 1.646031, 2.004518, 1, 1, 1, 1, 1,
-0.3373329, 1.557128, -1.999116, 1, 1, 1, 1, 1,
-0.335197, -1.575914, -1.646528, 1, 1, 1, 1, 1,
-0.3341641, 0.09347825, -1.896785, 1, 1, 1, 1, 1,
-0.3288459, -0.9468858, -3.788608, 1, 1, 1, 1, 1,
-0.3256673, 0.8022552, 0.7233973, 1, 1, 1, 1, 1,
-0.3235618, -0.2647526, -3.994788, 1, 1, 1, 1, 1,
-0.3225535, 1.339489, 1.39941, 1, 1, 1, 1, 1,
-0.321792, 0.593403, -0.8031488, 0, 0, 1, 1, 1,
-0.321371, 0.3005097, 0.3734072, 1, 0, 0, 1, 1,
-0.320197, 0.2162974, -0.5556023, 1, 0, 0, 1, 1,
-0.3197976, 0.4456088, -0.1900246, 1, 0, 0, 1, 1,
-0.3093379, 0.8066269, -0.1509953, 1, 0, 0, 1, 1,
-0.3021433, 0.08511035, -0.4164601, 1, 0, 0, 1, 1,
-0.2934098, 0.01562101, -0.9835439, 0, 0, 0, 1, 1,
-0.2931576, 1.591599, 0.1614647, 0, 0, 0, 1, 1,
-0.2919208, -1.226682, -2.469891, 0, 0, 0, 1, 1,
-0.2909991, 1.924374, -0.0176535, 0, 0, 0, 1, 1,
-0.2830844, 0.8316543, -1.876189, 0, 0, 0, 1, 1,
-0.2825165, 0.08610491, -0.7759172, 0, 0, 0, 1, 1,
-0.2803678, 0.3060935, 0.102089, 0, 0, 0, 1, 1,
-0.2802112, 0.5698856, -0.7946385, 1, 1, 1, 1, 1,
-0.2785759, -1.672543, -2.784041, 1, 1, 1, 1, 1,
-0.2773806, -0.1504852, -1.352731, 1, 1, 1, 1, 1,
-0.2759804, 0.186448, -1.045442, 1, 1, 1, 1, 1,
-0.2746, -0.8198485, -0.976248, 1, 1, 1, 1, 1,
-0.2705586, -0.6475748, -1.922582, 1, 1, 1, 1, 1,
-0.2686615, -2.334367, -2.061883, 1, 1, 1, 1, 1,
-0.2659249, 0.4600877, -0.1359041, 1, 1, 1, 1, 1,
-0.2646561, 1.673856, 0.06316053, 1, 1, 1, 1, 1,
-0.2646358, -0.9689383, -2.912046, 1, 1, 1, 1, 1,
-0.2621017, -0.1818668, -1.703166, 1, 1, 1, 1, 1,
-0.2618326, 0.267904, -0.7741855, 1, 1, 1, 1, 1,
-0.2616878, 0.4941294, 0.4410535, 1, 1, 1, 1, 1,
-0.2458847, -0.1319611, -1.703827, 1, 1, 1, 1, 1,
-0.2444871, -0.445363, -2.531284, 1, 1, 1, 1, 1,
-0.2435936, -1.012786, -3.535487, 0, 0, 1, 1, 1,
-0.2405606, 1.909069, 1.24299, 1, 0, 0, 1, 1,
-0.2400967, 1.212029, 1.349663, 1, 0, 0, 1, 1,
-0.2390663, -0.3792365, -2.514477, 1, 0, 0, 1, 1,
-0.2381774, 0.6797365, -1.423621, 1, 0, 0, 1, 1,
-0.2378342, -1.161473, -1.966151, 1, 0, 0, 1, 1,
-0.2318048, 0.6340476, 0.2127623, 0, 0, 0, 1, 1,
-0.2317964, -0.132913, -2.970898, 0, 0, 0, 1, 1,
-0.2293448, -1.113189, -3.18077, 0, 0, 0, 1, 1,
-0.2259274, 0.2828255, -0.2057694, 0, 0, 0, 1, 1,
-0.2215572, 0.5519648, -0.04771844, 0, 0, 0, 1, 1,
-0.2199593, 0.3285952, -0.5127163, 0, 0, 0, 1, 1,
-0.2196234, 0.152427, -2.284457, 0, 0, 0, 1, 1,
-0.2156332, 0.9155361, -0.6946777, 1, 1, 1, 1, 1,
-0.2099879, -0.7454684, -3.174582, 1, 1, 1, 1, 1,
-0.209412, 0.9232035, -1.408264, 1, 1, 1, 1, 1,
-0.2083764, 0.6464421, -1.636745, 1, 1, 1, 1, 1,
-0.208079, -0.3562413, -1.124181, 1, 1, 1, 1, 1,
-0.2045605, -0.357834, -2.510309, 1, 1, 1, 1, 1,
-0.2038717, -1.899186, -1.821849, 1, 1, 1, 1, 1,
-0.200601, 2.05875, -0.7535534, 1, 1, 1, 1, 1,
-0.1986547, 1.249655, -0.670289, 1, 1, 1, 1, 1,
-0.1981166, 0.5524123, -0.9731834, 1, 1, 1, 1, 1,
-0.1974867, -0.4217362, -1.860844, 1, 1, 1, 1, 1,
-0.1973877, 0.8326175, 0.2675056, 1, 1, 1, 1, 1,
-0.1941545, -0.02609076, -3.380553, 1, 1, 1, 1, 1,
-0.1899188, -1.263301, -3.266603, 1, 1, 1, 1, 1,
-0.1896923, 0.5730537, 0.4249351, 1, 1, 1, 1, 1,
-0.187188, 0.7092457, -0.7312618, 0, 0, 1, 1, 1,
-0.1868913, -0.1523558, -1.487995, 1, 0, 0, 1, 1,
-0.1868828, 1.939879, 0.2380168, 1, 0, 0, 1, 1,
-0.1859566, -0.441739, -2.508042, 1, 0, 0, 1, 1,
-0.1777775, 0.8644336, -1.633659, 1, 0, 0, 1, 1,
-0.17697, 0.7718729, 0.2658708, 1, 0, 0, 1, 1,
-0.176904, 0.3445063, -1.015508, 0, 0, 0, 1, 1,
-0.1744907, 0.5018251, 0.0992662, 0, 0, 0, 1, 1,
-0.1732242, 1.071426, -0.9932159, 0, 0, 0, 1, 1,
-0.1726257, -0.3090033, -3.095259, 0, 0, 0, 1, 1,
-0.1693528, -0.3817349, -2.981728, 0, 0, 0, 1, 1,
-0.1692573, -0.5794733, -4.57394, 0, 0, 0, 1, 1,
-0.1667206, -0.1542424, -3.043044, 0, 0, 0, 1, 1,
-0.1608431, -1.121169, -0.3973731, 1, 1, 1, 1, 1,
-0.1592127, -1.828646, -3.395149, 1, 1, 1, 1, 1,
-0.156867, -0.4375503, -3.052208, 1, 1, 1, 1, 1,
-0.1565847, -0.9322446, -3.837007, 1, 1, 1, 1, 1,
-0.1545544, -0.8197045, -3.854194, 1, 1, 1, 1, 1,
-0.1516506, -1.944418, -2.702873, 1, 1, 1, 1, 1,
-0.1500388, 0.01872823, -1.003998, 1, 1, 1, 1, 1,
-0.1485406, 0.89143, -1.690102, 1, 1, 1, 1, 1,
-0.1475152, 0.2783135, -0.1156829, 1, 1, 1, 1, 1,
-0.1469857, 0.2667572, -0.1258282, 1, 1, 1, 1, 1,
-0.1448721, 0.1140386, 0.3840966, 1, 1, 1, 1, 1,
-0.1442845, -0.7093638, -4.946311, 1, 1, 1, 1, 1,
-0.1434748, 0.12138, -1.620064, 1, 1, 1, 1, 1,
-0.1430551, -0.5517926, -2.057612, 1, 1, 1, 1, 1,
-0.1429307, -0.6531726, -3.569567, 1, 1, 1, 1, 1,
-0.1421953, -0.3522809, -2.538155, 0, 0, 1, 1, 1,
-0.1399263, -1.059896, -4.604372, 1, 0, 0, 1, 1,
-0.1396936, -2.032174, -2.988716, 1, 0, 0, 1, 1,
-0.1392215, 0.6022233, 0.8301497, 1, 0, 0, 1, 1,
-0.1341403, 0.7873231, -1.041089, 1, 0, 0, 1, 1,
-0.1328886, -1.40763, -2.021101, 1, 0, 0, 1, 1,
-0.1318678, -1.293623, -2.480964, 0, 0, 0, 1, 1,
-0.1289207, -0.1712221, -1.129815, 0, 0, 0, 1, 1,
-0.128875, -0.08388274, -2.9622, 0, 0, 0, 1, 1,
-0.128371, 0.3311283, 2.029535, 0, 0, 0, 1, 1,
-0.1243446, 0.07453822, -0.300918, 0, 0, 0, 1, 1,
-0.1192225, -0.4549498, -2.902922, 0, 0, 0, 1, 1,
-0.1163326, 1.010212, -0.4433318, 0, 0, 0, 1, 1,
-0.1113465, -0.4744104, -3.606213, 1, 1, 1, 1, 1,
-0.1106256, -0.1977784, -4.476187, 1, 1, 1, 1, 1,
-0.1079939, -0.4463938, -3.736054, 1, 1, 1, 1, 1,
-0.1078108, 0.3803494, -0.7546716, 1, 1, 1, 1, 1,
-0.09721537, 0.2319814, 0.2736717, 1, 1, 1, 1, 1,
-0.09395526, 0.8932914, 0.177923, 1, 1, 1, 1, 1,
-0.09030356, 0.8743465, 0.2278491, 1, 1, 1, 1, 1,
-0.09005846, 0.8291935, 0.2002312, 1, 1, 1, 1, 1,
-0.08996427, -1.168308, -2.473819, 1, 1, 1, 1, 1,
-0.08766855, 0.931283, -1.763765, 1, 1, 1, 1, 1,
-0.07516111, 1.548491, 1.250804, 1, 1, 1, 1, 1,
-0.07460833, 0.4348961, -0.09248851, 1, 1, 1, 1, 1,
-0.0720218, -0.7484453, -2.422255, 1, 1, 1, 1, 1,
-0.07175951, -1.040906, -1.764835, 1, 1, 1, 1, 1,
-0.06709483, -0.2231039, -4.60886, 1, 1, 1, 1, 1,
-0.06682955, -0.2501671, -4.289176, 0, 0, 1, 1, 1,
-0.06091343, -0.601037, -3.818149, 1, 0, 0, 1, 1,
-0.05919473, -2.197164, -1.63808, 1, 0, 0, 1, 1,
-0.058761, -1.589218, -3.195805, 1, 0, 0, 1, 1,
-0.05827494, -0.4970951, -1.241259, 1, 0, 0, 1, 1,
-0.05482025, -1.787674, -3.000361, 1, 0, 0, 1, 1,
-0.05423973, -0.5307573, -3.514067, 0, 0, 0, 1, 1,
-0.0541692, 0.1978694, -1.099303, 0, 0, 0, 1, 1,
-0.04993293, 0.1744414, 0.7582806, 0, 0, 0, 1, 1,
-0.04691492, 1.379344, 0.3134527, 0, 0, 0, 1, 1,
-0.04585936, 0.4659595, -1.507104, 0, 0, 0, 1, 1,
-0.03487581, -0.9901652, -3.748689, 0, 0, 0, 1, 1,
-0.02864923, 1.224707, -0.4976962, 0, 0, 0, 1, 1,
-0.02523732, 0.2309188, -0.8256211, 1, 1, 1, 1, 1,
-0.02506642, 0.349843, -0.80177, 1, 1, 1, 1, 1,
-0.0246305, -0.0663188, -1.417167, 1, 1, 1, 1, 1,
-0.02081229, -0.2969269, -3.098932, 1, 1, 1, 1, 1,
-0.01900342, 1.695991, -0.1663336, 1, 1, 1, 1, 1,
-0.01897373, -0.5456622, -2.931958, 1, 1, 1, 1, 1,
-0.009228869, -0.154838, -1.800992, 1, 1, 1, 1, 1,
-0.008576969, -0.5117912, -2.039297, 1, 1, 1, 1, 1,
-0.004382947, 1.31993, -1.006375, 1, 1, 1, 1, 1,
-0.004307569, 0.1268045, -0.1387756, 1, 1, 1, 1, 1,
-0.00261985, 0.3827502, 1.235567, 1, 1, 1, 1, 1,
0.001007201, 2.171838, 0.1174664, 1, 1, 1, 1, 1,
0.01119061, -2.129766, 4.02878, 1, 1, 1, 1, 1,
0.01194785, 0.2613004, 1.27518, 1, 1, 1, 1, 1,
0.01205956, 1.021485, 0.721368, 1, 1, 1, 1, 1,
0.01680114, -0.6497583, 2.155737, 0, 0, 1, 1, 1,
0.01986658, 0.7001695, 0.08793677, 1, 0, 0, 1, 1,
0.02351442, 0.3168401, 0.8833846, 1, 0, 0, 1, 1,
0.03323007, 1.917454, 2.283807, 1, 0, 0, 1, 1,
0.03365367, 1.191048, 0.5960694, 1, 0, 0, 1, 1,
0.0370665, -0.4496857, 2.527531, 1, 0, 0, 1, 1,
0.03914191, 0.3554892, 0.4460616, 0, 0, 0, 1, 1,
0.04154878, -1.254221, 2.173286, 0, 0, 0, 1, 1,
0.0438163, 0.3521718, 2.78046, 0, 0, 0, 1, 1,
0.04522685, -0.1403483, 4.059778, 0, 0, 0, 1, 1,
0.05041124, -0.2628703, 3.376956, 0, 0, 0, 1, 1,
0.05156499, 1.163255, -0.1599142, 0, 0, 0, 1, 1,
0.05278559, -2.951056, 5.030535, 0, 0, 0, 1, 1,
0.05290632, -0.6137825, 2.231574, 1, 1, 1, 1, 1,
0.05861635, 0.4421812, -0.4846964, 1, 1, 1, 1, 1,
0.06680231, -0.4085038, 2.724345, 1, 1, 1, 1, 1,
0.06767227, 0.5027494, -1.874609, 1, 1, 1, 1, 1,
0.06914842, -1.373254, 2.906947, 1, 1, 1, 1, 1,
0.06932415, -0.3128032, 2.179142, 1, 1, 1, 1, 1,
0.07037202, -2.125773, 1.830246, 1, 1, 1, 1, 1,
0.07654249, 0.8738915, 0.2071006, 1, 1, 1, 1, 1,
0.07733715, -0.8488566, 2.896707, 1, 1, 1, 1, 1,
0.081065, -1.785516, 2.718283, 1, 1, 1, 1, 1,
0.08142044, -0.5354891, 1.925453, 1, 1, 1, 1, 1,
0.09159842, -0.0639973, 1.018824, 1, 1, 1, 1, 1,
0.09627803, -0.780239, 2.281775, 1, 1, 1, 1, 1,
0.1012912, 0.8765927, -0.8731152, 1, 1, 1, 1, 1,
0.1021536, 1.420038, -1.737446, 1, 1, 1, 1, 1,
0.1046084, 1.350296, 1.011201, 0, 0, 1, 1, 1,
0.105947, -0.1707848, 2.11174, 1, 0, 0, 1, 1,
0.1064862, -0.296091, 3.274463, 1, 0, 0, 1, 1,
0.109373, 0.3568342, 0.8572642, 1, 0, 0, 1, 1,
0.1208599, 0.3002259, -0.2202762, 1, 0, 0, 1, 1,
0.1252309, 0.8665173, 0.6403503, 1, 0, 0, 1, 1,
0.1258828, -0.8306454, 2.71127, 0, 0, 0, 1, 1,
0.1270678, -0.3651384, 1.576828, 0, 0, 0, 1, 1,
0.1306197, 0.8051956, -0.3741111, 0, 0, 0, 1, 1,
0.1317703, 0.5098886, 1.889935, 0, 0, 0, 1, 1,
0.1320027, -1.225705, 3.230473, 0, 0, 0, 1, 1,
0.1345173, 0.7183529, -1.765049, 0, 0, 0, 1, 1,
0.1346596, -1.460382, 2.436864, 0, 0, 0, 1, 1,
0.135028, 0.3106576, -0.07857714, 1, 1, 1, 1, 1,
0.1355875, -0.4158157, 2.408086, 1, 1, 1, 1, 1,
0.1364637, -0.256145, 3.087356, 1, 1, 1, 1, 1,
0.1369806, -0.4048023, 2.030099, 1, 1, 1, 1, 1,
0.1376094, 1.550527, 0.2494755, 1, 1, 1, 1, 1,
0.138677, -1.648675, 2.277898, 1, 1, 1, 1, 1,
0.1401946, -1.011726, 2.943954, 1, 1, 1, 1, 1,
0.1459679, 0.6836462, -1.008835, 1, 1, 1, 1, 1,
0.1464313, -0.8580744, 5.053643, 1, 1, 1, 1, 1,
0.1525115, 0.212317, 0.9248188, 1, 1, 1, 1, 1,
0.1547218, 1.907027, -0.2146137, 1, 1, 1, 1, 1,
0.1553572, -0.123199, 1.917134, 1, 1, 1, 1, 1,
0.1571688, -1.788211, 2.424146, 1, 1, 1, 1, 1,
0.1578956, -0.163203, 2.764668, 1, 1, 1, 1, 1,
0.1598529, -1.490749, 4.654433, 1, 1, 1, 1, 1,
0.1622772, 0.09213902, 0.596576, 0, 0, 1, 1, 1,
0.1631891, -0.2717558, 4.977967, 1, 0, 0, 1, 1,
0.1644229, -1.663965, 3.228622, 1, 0, 0, 1, 1,
0.1657867, -1.321698, 2.804828, 1, 0, 0, 1, 1,
0.1692165, 0.8786592, -0.2982853, 1, 0, 0, 1, 1,
0.1723408, 2.6318, -0.5983904, 1, 0, 0, 1, 1,
0.1730366, 0.2811787, 0.06342421, 0, 0, 0, 1, 1,
0.1799025, -0.1856288, 2.317005, 0, 0, 0, 1, 1,
0.1822394, 1.21685, 0.303163, 0, 0, 0, 1, 1,
0.1833217, -0.5403222, 2.540549, 0, 0, 0, 1, 1,
0.1933186, -0.3237256, 3.86709, 0, 0, 0, 1, 1,
0.1944209, 1.233042, 0.1895768, 0, 0, 0, 1, 1,
0.1953944, 0.2282346, -1.187316, 0, 0, 0, 1, 1,
0.1963029, -1.327864, 3.762239, 1, 1, 1, 1, 1,
0.2007796, 0.8900357, 0.546822, 1, 1, 1, 1, 1,
0.2017273, -0.59345, 1.675365, 1, 1, 1, 1, 1,
0.204709, 1.283528, -0.6189741, 1, 1, 1, 1, 1,
0.2048061, 0.2939095, 2.192769, 1, 1, 1, 1, 1,
0.2072204, 0.06474389, 1.545445, 1, 1, 1, 1, 1,
0.2074406, 0.6498653, 1.433222, 1, 1, 1, 1, 1,
0.2101616, -0.2108574, 3.245173, 1, 1, 1, 1, 1,
0.2152355, 0.6672785, -0.4347788, 1, 1, 1, 1, 1,
0.2156072, -0.05879182, 0.935389, 1, 1, 1, 1, 1,
0.2286005, 0.965963, 0.5534596, 1, 1, 1, 1, 1,
0.2317592, -0.874298, 3.307817, 1, 1, 1, 1, 1,
0.2377537, 0.7571449, 0.336691, 1, 1, 1, 1, 1,
0.2411891, 0.5185978, -0.159174, 1, 1, 1, 1, 1,
0.2424084, -1.754019, 4.414082, 1, 1, 1, 1, 1,
0.2554169, -0.4487424, 3.146503, 0, 0, 1, 1, 1,
0.2560353, 2.842205, 1.40123, 1, 0, 0, 1, 1,
0.259831, -1.132554, 2.742575, 1, 0, 0, 1, 1,
0.262237, -0.3402605, 2.167423, 1, 0, 0, 1, 1,
0.2625899, -0.04789734, 2.149346, 1, 0, 0, 1, 1,
0.2631479, 1.413553, 0.2395709, 1, 0, 0, 1, 1,
0.2671593, -0.1340478, 1.148761, 0, 0, 0, 1, 1,
0.2695038, -0.7706657, 1.952767, 0, 0, 0, 1, 1,
0.2742637, 0.5745444, 0.1893253, 0, 0, 0, 1, 1,
0.2776012, 1.127134, 0.7066664, 0, 0, 0, 1, 1,
0.279336, 1.378182, -3.72504, 0, 0, 0, 1, 1,
0.2798732, 0.2129641, 0.2357213, 0, 0, 0, 1, 1,
0.2819521, -1.473438, 1.914152, 0, 0, 0, 1, 1,
0.2842152, 0.1155159, -0.2590021, 1, 1, 1, 1, 1,
0.2882683, 1.139009, 0.5291947, 1, 1, 1, 1, 1,
0.2884971, -0.3365382, 3.104754, 1, 1, 1, 1, 1,
0.2894285, -0.1943204, 1.455249, 1, 1, 1, 1, 1,
0.2905927, 0.3071371, 2.743071, 1, 1, 1, 1, 1,
0.2932915, -0.5044969, 2.742342, 1, 1, 1, 1, 1,
0.2989771, -0.9908528, 3.592679, 1, 1, 1, 1, 1,
0.2998312, -0.4191108, 2.079883, 1, 1, 1, 1, 1,
0.3024551, -0.05655845, 1.289968, 1, 1, 1, 1, 1,
0.3078382, 0.04542184, 0.5602962, 1, 1, 1, 1, 1,
0.3092928, -1.210285, 2.880267, 1, 1, 1, 1, 1,
0.3095055, 1.794363, -0.3257839, 1, 1, 1, 1, 1,
0.3113204, -1.568149, 4.394552, 1, 1, 1, 1, 1,
0.3137883, -0.5324425, 1.853274, 1, 1, 1, 1, 1,
0.3172427, 1.550675, 1.341532, 1, 1, 1, 1, 1,
0.3211047, -0.3359112, 2.704283, 0, 0, 1, 1, 1,
0.3216424, 4.099268, 1.94709, 1, 0, 0, 1, 1,
0.3218744, 0.7349768, 1.685832, 1, 0, 0, 1, 1,
0.3259345, 0.3203589, -0.9353426, 1, 0, 0, 1, 1,
0.3330284, 0.03996576, 0.9033927, 1, 0, 0, 1, 1,
0.3356617, -1.067185, 4.072333, 1, 0, 0, 1, 1,
0.336333, 0.9232556, 1.457875, 0, 0, 0, 1, 1,
0.339517, -0.0205072, 3.97368, 0, 0, 0, 1, 1,
0.3427961, -1.132942, 1.739369, 0, 0, 0, 1, 1,
0.3440275, -0.67031, 4.449316, 0, 0, 0, 1, 1,
0.3452157, -0.1075167, 0.1006538, 0, 0, 0, 1, 1,
0.345467, 0.4191396, 1.394241, 0, 0, 0, 1, 1,
0.3522016, -1.000551, 3.843906, 0, 0, 0, 1, 1,
0.3552754, -1.908358, 2.520327, 1, 1, 1, 1, 1,
0.3558833, 0.3899797, 0.1047228, 1, 1, 1, 1, 1,
0.3579496, 0.6972199, 1.736538, 1, 1, 1, 1, 1,
0.3590448, -1.200495, 4.47788, 1, 1, 1, 1, 1,
0.3617184, 1.13033, 0.2929899, 1, 1, 1, 1, 1,
0.3646827, 0.400892, 0.5349638, 1, 1, 1, 1, 1,
0.3712465, 0.9632133, -0.8886375, 1, 1, 1, 1, 1,
0.3748217, -0.07584711, 1.586137, 1, 1, 1, 1, 1,
0.3771068, 0.6162216, 0.7879336, 1, 1, 1, 1, 1,
0.3798229, 0.04434887, 1.528922, 1, 1, 1, 1, 1,
0.3826528, -0.5265502, 1.504325, 1, 1, 1, 1, 1,
0.3828073, -0.8860279, 3.373477, 1, 1, 1, 1, 1,
0.3850061, 1.553952, -0.1853879, 1, 1, 1, 1, 1,
0.3855863, -2.351549, 1.851061, 1, 1, 1, 1, 1,
0.3889265, -1.872498, 3.201146, 1, 1, 1, 1, 1,
0.3944006, 0.4866693, 0.2263816, 0, 0, 1, 1, 1,
0.3952506, -1.441154, 2.858758, 1, 0, 0, 1, 1,
0.3956944, 0.1216514, 0.1686695, 1, 0, 0, 1, 1,
0.4048162, 0.103141, 2.008304, 1, 0, 0, 1, 1,
0.4060562, -0.4735126, 3.119789, 1, 0, 0, 1, 1,
0.4082543, -1.001516, 2.704596, 1, 0, 0, 1, 1,
0.4086811, -0.6090118, 0.6707706, 0, 0, 0, 1, 1,
0.4141996, -0.03164364, 1.767726, 0, 0, 0, 1, 1,
0.4156093, 0.4201177, 0.6609349, 0, 0, 0, 1, 1,
0.4157917, 0.2053114, -0.6449908, 0, 0, 0, 1, 1,
0.41609, -0.7169701, 4.879278, 0, 0, 0, 1, 1,
0.4175751, 0.02616148, 0.5946245, 0, 0, 0, 1, 1,
0.4209994, 0.01222844, 2.370843, 0, 0, 0, 1, 1,
0.4266791, 0.4380537, 1.69454, 1, 1, 1, 1, 1,
0.4273149, 0.4832279, 1.293828, 1, 1, 1, 1, 1,
0.4283975, -0.9590662, 0.2322139, 1, 1, 1, 1, 1,
0.4291569, -0.9284746, 2.466111, 1, 1, 1, 1, 1,
0.4320756, 0.3726962, 0.5258551, 1, 1, 1, 1, 1,
0.4327146, 0.192672, 0.08829936, 1, 1, 1, 1, 1,
0.443697, 2.070054, 1.761442, 1, 1, 1, 1, 1,
0.4449427, 0.6380669, 2.339042, 1, 1, 1, 1, 1,
0.4467683, -0.3328644, 2.205274, 1, 1, 1, 1, 1,
0.4540035, 0.221788, 1.277238, 1, 1, 1, 1, 1,
0.4558802, -2.483283, 4.8689, 1, 1, 1, 1, 1,
0.4637419, 0.07405899, 1.870683, 1, 1, 1, 1, 1,
0.4646064, -1.691788, 2.845434, 1, 1, 1, 1, 1,
0.4654551, 0.3371446, 1.047471, 1, 1, 1, 1, 1,
0.4668571, -0.5580643, 2.252693, 1, 1, 1, 1, 1,
0.4708273, 0.4991473, 1.533993, 0, 0, 1, 1, 1,
0.4746774, -0.2155711, 3.464379, 1, 0, 0, 1, 1,
0.4785149, -0.1735023, 3.536699, 1, 0, 0, 1, 1,
0.4947016, -1.868836, 3.833087, 1, 0, 0, 1, 1,
0.4950784, 0.01372962, 2.168649, 1, 0, 0, 1, 1,
0.5011637, -0.9562001, 3.926562, 1, 0, 0, 1, 1,
0.5024898, -0.1705971, 2.704817, 0, 0, 0, 1, 1,
0.5043832, -0.6364588, 1.662451, 0, 0, 0, 1, 1,
0.5051891, -1.876496, 3.654065, 0, 0, 0, 1, 1,
0.5068695, 1.340141, -0.1645506, 0, 0, 0, 1, 1,
0.5110143, 0.1264123, 2.950954, 0, 0, 0, 1, 1,
0.5130013, -0.5109708, 1.903404, 0, 0, 0, 1, 1,
0.5130361, -0.7410878, 2.288203, 0, 0, 0, 1, 1,
0.5156651, 0.7807158, 0.2845255, 1, 1, 1, 1, 1,
0.5172262, 1.002207, 0.05872905, 1, 1, 1, 1, 1,
0.5222908, -0.3386368, 1.288444, 1, 1, 1, 1, 1,
0.5282704, -0.3432487, 2.430339, 1, 1, 1, 1, 1,
0.5297784, -0.3106242, 3.122564, 1, 1, 1, 1, 1,
0.5317456, 0.6488519, 0.140617, 1, 1, 1, 1, 1,
0.536315, -2.418103, 2.721707, 1, 1, 1, 1, 1,
0.5452455, -1.087675, 2.05576, 1, 1, 1, 1, 1,
0.545446, -0.2510899, 3.305943, 1, 1, 1, 1, 1,
0.5454726, 0.8525912, 0.7805926, 1, 1, 1, 1, 1,
0.5459902, 0.1514571, 0.5997261, 1, 1, 1, 1, 1,
0.5576609, 0.4399315, -0.7012513, 1, 1, 1, 1, 1,
0.5588584, -0.252464, 1.009366, 1, 1, 1, 1, 1,
0.5652694, -0.8445921, 2.516444, 1, 1, 1, 1, 1,
0.56552, -1.025678, 2.33451, 1, 1, 1, 1, 1,
0.5686462, 0.6423118, 0.9139481, 0, 0, 1, 1, 1,
0.5699978, -0.08386779, 0.9167131, 1, 0, 0, 1, 1,
0.5717036, 1.169693, 1.001893, 1, 0, 0, 1, 1,
0.5725292, 0.4999432, -1.43511, 1, 0, 0, 1, 1,
0.5729458, -0.6252627, 3.713069, 1, 0, 0, 1, 1,
0.5734941, 0.02615226, -0.2341225, 1, 0, 0, 1, 1,
0.5776508, -1.480477, 1.062483, 0, 0, 0, 1, 1,
0.5801312, -0.3611666, 1.605893, 0, 0, 0, 1, 1,
0.5804155, 2.369119, -1.557591, 0, 0, 0, 1, 1,
0.5831625, 0.5695573, 0.5586329, 0, 0, 0, 1, 1,
0.5882024, -1.175546, 3.581611, 0, 0, 0, 1, 1,
0.5910059, -1.694622, 3.64806, 0, 0, 0, 1, 1,
0.5952411, 0.3724284, 0.6511865, 0, 0, 0, 1, 1,
0.5954376, 0.06922012, 0.9593867, 1, 1, 1, 1, 1,
0.5993735, 2.106061, 0.7970837, 1, 1, 1, 1, 1,
0.6020527, 1.662068, -0.4328835, 1, 1, 1, 1, 1,
0.6039635, 0.06141509, 1.529269, 1, 1, 1, 1, 1,
0.6061526, 0.5779173, 0.885163, 1, 1, 1, 1, 1,
0.6116347, -0.7828273, 1.659304, 1, 1, 1, 1, 1,
0.6122452, 2.067858, -0.3768984, 1, 1, 1, 1, 1,
0.6131893, -0.9652101, 1.003439, 1, 1, 1, 1, 1,
0.613624, -2.550213, 1.864708, 1, 1, 1, 1, 1,
0.6160268, -0.1845043, 1.209666, 1, 1, 1, 1, 1,
0.6196349, 0.2828009, -0.1186208, 1, 1, 1, 1, 1,
0.6218207, 2.147786, 0.7231622, 1, 1, 1, 1, 1,
0.6221877, 0.7442899, 1.314506, 1, 1, 1, 1, 1,
0.6235818, -0.5218834, 1.63568, 1, 1, 1, 1, 1,
0.6275381, -0.3379792, 0.9410524, 1, 1, 1, 1, 1,
0.6285043, 0.0008653309, 3.025944, 0, 0, 1, 1, 1,
0.6293999, -1.874398, 2.817974, 1, 0, 0, 1, 1,
0.6335916, -1.07225, 2.849094, 1, 0, 0, 1, 1,
0.6335942, 1.627016, 0.8266859, 1, 0, 0, 1, 1,
0.6385717, 1.026604, 1.246065, 1, 0, 0, 1, 1,
0.6496612, 1.251594, -1.215618, 1, 0, 0, 1, 1,
0.650728, -3.182574, 2.495304, 0, 0, 0, 1, 1,
0.6512427, -1.542125, 3.424774, 0, 0, 0, 1, 1,
0.6522324, -0.619707, 3.100192, 0, 0, 0, 1, 1,
0.6550046, -0.7776752, 4.019514, 0, 0, 0, 1, 1,
0.6580551, -0.3673134, 3.668127, 0, 0, 0, 1, 1,
0.6640913, -0.2880573, -0.1785009, 0, 0, 0, 1, 1,
0.6666997, 0.7560483, 0.5823626, 0, 0, 0, 1, 1,
0.6783715, -1.247556, 2.966654, 1, 1, 1, 1, 1,
0.678723, 0.3439623, 0.6238927, 1, 1, 1, 1, 1,
0.679162, 0.4076296, 1.066521, 1, 1, 1, 1, 1,
0.680189, -0.4173506, 2.570349, 1, 1, 1, 1, 1,
0.6832101, -0.7353587, 2.733108, 1, 1, 1, 1, 1,
0.6894698, -0.477731, 3.189965, 1, 1, 1, 1, 1,
0.6898603, 0.3760651, 3.093932, 1, 1, 1, 1, 1,
0.6898705, 2.307979, 0.476722, 1, 1, 1, 1, 1,
0.6933301, -0.2387125, 1.410406, 1, 1, 1, 1, 1,
0.6960472, -0.1083487, 3.020401, 1, 1, 1, 1, 1,
0.7029511, 0.3811957, 0.5941362, 1, 1, 1, 1, 1,
0.7103757, -0.1682833, 1.164619, 1, 1, 1, 1, 1,
0.7181818, 0.3312075, 0.3950289, 1, 1, 1, 1, 1,
0.719319, 2.415972, -0.6483579, 1, 1, 1, 1, 1,
0.721671, 1.203112, 0.2196549, 1, 1, 1, 1, 1,
0.7217056, 1.041403, -0.7021845, 0, 0, 1, 1, 1,
0.7225285, 2.020525, 1.904763, 1, 0, 0, 1, 1,
0.7307547, 2.303304, 0.8403062, 1, 0, 0, 1, 1,
0.7326358, 0.2477289, 3.112929, 1, 0, 0, 1, 1,
0.7358761, 0.03843393, 0.6776645, 1, 0, 0, 1, 1,
0.7447019, -0.328538, 2.589302, 1, 0, 0, 1, 1,
0.7460971, 0.4887406, 1.278402, 0, 0, 0, 1, 1,
0.7466645, 1.231665, -0.8762334, 0, 0, 0, 1, 1,
0.7475025, 0.8051721, 0.02300342, 0, 0, 0, 1, 1,
0.7509914, 0.3836202, 1.374062, 0, 0, 0, 1, 1,
0.7532859, -0.01250601, 0.5932363, 0, 0, 0, 1, 1,
0.757356, -0.7832729, 2.459691, 0, 0, 0, 1, 1,
0.7578948, 0.4333138, 1.281507, 0, 0, 0, 1, 1,
0.7623374, -0.4656303, 3.001111, 1, 1, 1, 1, 1,
0.7742589, -2.732065, 3.702044, 1, 1, 1, 1, 1,
0.7751395, 0.4925139, 1.344492, 1, 1, 1, 1, 1,
0.7756005, -0.4468503, 2.61083, 1, 1, 1, 1, 1,
0.7761247, 0.3511186, 0.6629468, 1, 1, 1, 1, 1,
0.7767879, 1.275886, -1.265068, 1, 1, 1, 1, 1,
0.786864, 1.417758, 0.07832845, 1, 1, 1, 1, 1,
0.7964311, 0.6835289, 0.3800135, 1, 1, 1, 1, 1,
0.7996818, 0.5846172, -0.4195959, 1, 1, 1, 1, 1,
0.8011742, -1.576362, 2.119212, 1, 1, 1, 1, 1,
0.8102135, -0.001439662, 0.602189, 1, 1, 1, 1, 1,
0.8117418, -1.503887, 4.265427, 1, 1, 1, 1, 1,
0.8147016, 0.3788404, 1.235844, 1, 1, 1, 1, 1,
0.8157687, 0.07537936, 0.5986568, 1, 1, 1, 1, 1,
0.8189477, -0.5155607, 1.297249, 1, 1, 1, 1, 1,
0.8204556, 0.2979329, 1.674434, 0, 0, 1, 1, 1,
0.8205739, -0.7523587, 2.213152, 1, 0, 0, 1, 1,
0.8207873, 2.661379, 0.02443502, 1, 0, 0, 1, 1,
0.8311557, -0.6752039, 2.017659, 1, 0, 0, 1, 1,
0.8375448, 0.7091962, 1.88886, 1, 0, 0, 1, 1,
0.8399227, 0.4724834, 0.6642698, 1, 0, 0, 1, 1,
0.843904, 0.6550717, -0.9709308, 0, 0, 0, 1, 1,
0.8447767, 0.3407798, 3.137364, 0, 0, 0, 1, 1,
0.8468778, 0.4734581, 3.17807, 0, 0, 0, 1, 1,
0.8473672, -0.6590278, 1.487869, 0, 0, 0, 1, 1,
0.8502424, -0.3805318, 1.454204, 0, 0, 0, 1, 1,
0.8520501, 1.185093, 0.2549246, 0, 0, 0, 1, 1,
0.8549757, -0.3190916, -0.356934, 0, 0, 0, 1, 1,
0.8595388, 0.149942, 0.2249562, 1, 1, 1, 1, 1,
0.863125, 1.267332, -1.502892, 1, 1, 1, 1, 1,
0.8651789, -1.394096, 3.342493, 1, 1, 1, 1, 1,
0.8654268, 0.7976417, 0.5952353, 1, 1, 1, 1, 1,
0.8722308, -1.448743, 3.208822, 1, 1, 1, 1, 1,
0.8792978, 0.07537158, 1.948846, 1, 1, 1, 1, 1,
0.8979374, 0.168211, 0.4539424, 1, 1, 1, 1, 1,
0.9002108, 1.908331, -2.539517, 1, 1, 1, 1, 1,
0.9015012, 1.877361, 2.16107, 1, 1, 1, 1, 1,
0.9046914, 0.8164042, -0.7131993, 1, 1, 1, 1, 1,
0.9134307, 1.580505, 0.09569442, 1, 1, 1, 1, 1,
0.9147604, 1.271159, -0.05379513, 1, 1, 1, 1, 1,
0.920539, -2.024696, 2.986782, 1, 1, 1, 1, 1,
0.9239811, 0.2588575, 2.341071, 1, 1, 1, 1, 1,
0.924473, -1.737888, 3.237107, 1, 1, 1, 1, 1,
0.9248852, -1.215611, 2.447652, 0, 0, 1, 1, 1,
0.9279914, 0.274771, 0.3956264, 1, 0, 0, 1, 1,
0.94546, 0.3060581, 0.4783679, 1, 0, 0, 1, 1,
0.9462751, 0.3913038, 0.5354947, 1, 0, 0, 1, 1,
0.9467904, 0.1703762, 2.515438, 1, 0, 0, 1, 1,
0.9471717, -0.6764787, 2.315492, 1, 0, 0, 1, 1,
0.9487102, -0.5213491, 2.728729, 0, 0, 0, 1, 1,
0.9500823, -0.5586233, 3.250015, 0, 0, 0, 1, 1,
0.9513477, -0.406485, 1.550525, 0, 0, 0, 1, 1,
0.9541869, -0.1478063, 2.938345, 0, 0, 0, 1, 1,
0.959051, -1.144677, 2.949223, 0, 0, 0, 1, 1,
0.9627721, -0.6681741, 4.536035, 0, 0, 0, 1, 1,
0.9739326, -1.167295, 1.522393, 0, 0, 0, 1, 1,
0.9766704, -0.3119138, 1.593037, 1, 1, 1, 1, 1,
0.9801697, 0.3799921, 0.04189575, 1, 1, 1, 1, 1,
0.987295, -1.614063, 2.666034, 1, 1, 1, 1, 1,
0.9884743, 0.9087332, 0.799316, 1, 1, 1, 1, 1,
0.988727, 0.3580607, -0.07747746, 1, 1, 1, 1, 1,
0.990338, -0.2086066, 3.01546, 1, 1, 1, 1, 1,
0.994312, 0.6785899, -0.5182864, 1, 1, 1, 1, 1,
0.998185, -0.2951124, 0.09037704, 1, 1, 1, 1, 1,
1.000138, 2.650628, -0.05163167, 1, 1, 1, 1, 1,
1.008396, -0.7778066, 3.163766, 1, 1, 1, 1, 1,
1.010589, -1.038405, 3.633344, 1, 1, 1, 1, 1,
1.016507, -0.944786, 2.441079, 1, 1, 1, 1, 1,
1.028004, 2.231965, 0.6161224, 1, 1, 1, 1, 1,
1.031454, 0.8205912, 0.7017532, 1, 1, 1, 1, 1,
1.036252, 0.2806684, 0.8767527, 1, 1, 1, 1, 1,
1.047214, -1.721659, 2.469146, 0, 0, 1, 1, 1,
1.05459, -0.2172998, 1.227261, 1, 0, 0, 1, 1,
1.054696, -0.4661649, 2.023648, 1, 0, 0, 1, 1,
1.054747, 0.5245163, 2.78976, 1, 0, 0, 1, 1,
1.055145, -0.9665057, 2.680364, 1, 0, 0, 1, 1,
1.056295, 0.5979778, 2.541683, 1, 0, 0, 1, 1,
1.057482, -0.02131134, 1.524413, 0, 0, 0, 1, 1,
1.066509, 0.6561624, 0.4435307, 0, 0, 0, 1, 1,
1.068493, -1.8068, 3.969081, 0, 0, 0, 1, 1,
1.08276, 0.2673593, 1.433545, 0, 0, 0, 1, 1,
1.084037, -1.491631, 2.321615, 0, 0, 0, 1, 1,
1.085348, 0.1578171, 2.203365, 0, 0, 0, 1, 1,
1.090585, -0.7715415, 2.756812, 0, 0, 0, 1, 1,
1.091036, 0.3244078, 2.621325, 1, 1, 1, 1, 1,
1.093559, -0.3431762, 1.283801, 1, 1, 1, 1, 1,
1.109285, -0.3926731, 2.251086, 1, 1, 1, 1, 1,
1.123194, -0.3430613, 1.125022, 1, 1, 1, 1, 1,
1.125182, -0.7037297, 2.169621, 1, 1, 1, 1, 1,
1.128278, 0.5047047, 1.092326, 1, 1, 1, 1, 1,
1.130489, 0.8266849, 0.5409799, 1, 1, 1, 1, 1,
1.135551, -0.6455553, 1.196531, 1, 1, 1, 1, 1,
1.144394, -1.044843, 3.084279, 1, 1, 1, 1, 1,
1.149522, 0.790135, 1.54385, 1, 1, 1, 1, 1,
1.157, 1.550044, 0.09046582, 1, 1, 1, 1, 1,
1.158848, 1.252603, 1.146622, 1, 1, 1, 1, 1,
1.172494, -1.027844, 1.157859, 1, 1, 1, 1, 1,
1.188039, -1.0261, 1.914906, 1, 1, 1, 1, 1,
1.191876, 0.2057833, -0.08112929, 1, 1, 1, 1, 1,
1.201998, -0.297441, 2.020743, 0, 0, 1, 1, 1,
1.207941, -0.708739, 1.921205, 1, 0, 0, 1, 1,
1.210189, -0.2225418, 2.090993, 1, 0, 0, 1, 1,
1.214961, -0.3856301, 0.1874192, 1, 0, 0, 1, 1,
1.215102, -1.132784, 0.3780258, 1, 0, 0, 1, 1,
1.22404, -0.4128468, 1.300491, 1, 0, 0, 1, 1,
1.224348, -0.3740208, 1.985734, 0, 0, 0, 1, 1,
1.224917, -0.5839183, 1.795316, 0, 0, 0, 1, 1,
1.234038, 1.210917, 0.3286453, 0, 0, 0, 1, 1,
1.243599, -1.692616, 2.21599, 0, 0, 0, 1, 1,
1.246562, -0.7695923, 0.8369408, 0, 0, 0, 1, 1,
1.248517, 1.257081, 1.88746, 0, 0, 0, 1, 1,
1.250724, 0.6880996, 0.8179772, 0, 0, 0, 1, 1,
1.266807, -0.8826819, 3.501348, 1, 1, 1, 1, 1,
1.268977, -0.7834357, 1.197212, 1, 1, 1, 1, 1,
1.278982, 1.316542, 0.9381801, 1, 1, 1, 1, 1,
1.284271, -1.378703, 0.9763172, 1, 1, 1, 1, 1,
1.289345, -0.4493529, 0.5214689, 1, 1, 1, 1, 1,
1.290267, 0.7647924, 2.86422, 1, 1, 1, 1, 1,
1.293235, 1.54052, 0.8867321, 1, 1, 1, 1, 1,
1.293316, -1.230655, 1.697472, 1, 1, 1, 1, 1,
1.315699, 1.231349, 0.1868735, 1, 1, 1, 1, 1,
1.319246, -2.118676, 1.895794, 1, 1, 1, 1, 1,
1.327382, -2.328926, 1.589828, 1, 1, 1, 1, 1,
1.334097, -0.0195167, 1.843179, 1, 1, 1, 1, 1,
1.336175, 1.718494, 1.308817, 1, 1, 1, 1, 1,
1.337258, -1.549748, 2.050314, 1, 1, 1, 1, 1,
1.340326, 1.126104, 1.411103, 1, 1, 1, 1, 1,
1.350259, 0.7835934, 1.013586, 0, 0, 1, 1, 1,
1.351491, -0.6806231, 1.857972, 1, 0, 0, 1, 1,
1.358676, 1.960935, 1.01799, 1, 0, 0, 1, 1,
1.365901, -0.1662992, 0.6885275, 1, 0, 0, 1, 1,
1.403918, 0.3238246, 1.840484, 1, 0, 0, 1, 1,
1.404143, 0.1882958, 0.2854497, 1, 0, 0, 1, 1,
1.416669, -0.9095281, 2.126627, 0, 0, 0, 1, 1,
1.428466, -0.6613393, 0.9100844, 0, 0, 0, 1, 1,
1.429907, -0.5004882, 2.034154, 0, 0, 0, 1, 1,
1.448126, -0.07332692, 1.470565, 0, 0, 0, 1, 1,
1.448689, 0.753262, 1.891063, 0, 0, 0, 1, 1,
1.452132, 0.2165424, 1.301586, 0, 0, 0, 1, 1,
1.462636, 1.05193, 2.639774, 0, 0, 0, 1, 1,
1.490808, 0.6076968, 0.7264223, 1, 1, 1, 1, 1,
1.546229, -0.9153594, 2.33426, 1, 1, 1, 1, 1,
1.569466, 1.677904, 2.085012, 1, 1, 1, 1, 1,
1.570343, 0.7439767, 2.81852, 1, 1, 1, 1, 1,
1.576481, 0.7737338, 0.8311315, 1, 1, 1, 1, 1,
1.576849, -0.6667119, -0.3092134, 1, 1, 1, 1, 1,
1.589904, 0.4436387, 2.839604, 1, 1, 1, 1, 1,
1.590741, -0.8184495, 1.081289, 1, 1, 1, 1, 1,
1.595477, 1.491905, 2.779584, 1, 1, 1, 1, 1,
1.597931, -0.4887778, 2.274042, 1, 1, 1, 1, 1,
1.599264, 0.3887984, 2.219885, 1, 1, 1, 1, 1,
1.611227, -1.31146, 1.798538, 1, 1, 1, 1, 1,
1.629375, -2.348429, 2.612155, 1, 1, 1, 1, 1,
1.629826, -0.9929696, 2.303886, 1, 1, 1, 1, 1,
1.629974, 0.802632, 1.162, 1, 1, 1, 1, 1,
1.633682, 0.5495325, 1.209501, 0, 0, 1, 1, 1,
1.644408, 0.1905632, 1.711313, 1, 0, 0, 1, 1,
1.647988, 0.8467217, 0.5012378, 1, 0, 0, 1, 1,
1.654185, -0.2478829, 2.096182, 1, 0, 0, 1, 1,
1.65531, 1.339959, -0.07503779, 1, 0, 0, 1, 1,
1.664295, -1.087067, 2.611659, 1, 0, 0, 1, 1,
1.67041, -0.3993837, 1.505862, 0, 0, 0, 1, 1,
1.683269, -0.3764159, 1.217766, 0, 0, 0, 1, 1,
1.683666, 0.8021275, 2.923892, 0, 0, 0, 1, 1,
1.688443, -0.07192986, 0.9351028, 0, 0, 0, 1, 1,
1.699706, 0.1085906, 2.012731, 0, 0, 0, 1, 1,
1.700337, -1.084335, 0.7157351, 0, 0, 0, 1, 1,
1.710514, 0.3031792, 3.03855, 0, 0, 0, 1, 1,
1.73632, -0.8646427, 2.839202, 1, 1, 1, 1, 1,
1.767917, 0.03227467, 4.296958, 1, 1, 1, 1, 1,
1.784571, 0.5278316, 3.122898, 1, 1, 1, 1, 1,
1.78788, -0.787387, 1.174781, 1, 1, 1, 1, 1,
1.78807, -0.3994743, 2.296648, 1, 1, 1, 1, 1,
1.809991, -0.9245402, 1.74257, 1, 1, 1, 1, 1,
1.822707, -0.9478946, 1.769325, 1, 1, 1, 1, 1,
1.835102, -0.4164076, 1.65272, 1, 1, 1, 1, 1,
1.838837, 0.6670308, 2.94417, 1, 1, 1, 1, 1,
1.85049, 1.440417, 1.518822, 1, 1, 1, 1, 1,
1.894974, 0.02223765, 2.106905, 1, 1, 1, 1, 1,
1.895391, 1.29909, 1.938959, 1, 1, 1, 1, 1,
1.911182, -0.382513, 1.157234, 1, 1, 1, 1, 1,
1.920779, -0.457321, 1.631542, 1, 1, 1, 1, 1,
1.939368, 1.172476, 0.8648106, 1, 1, 1, 1, 1,
1.943828, -1.098587, 3.027894, 0, 0, 1, 1, 1,
1.956578, 0.2912894, 2.51891, 1, 0, 0, 1, 1,
1.959544, 1.033612, 1.919941, 1, 0, 0, 1, 1,
1.965282, -0.3057469, 1.650509, 1, 0, 0, 1, 1,
1.9675, 0.9646982, 1.445643, 1, 0, 0, 1, 1,
2.0198, -0.7659471, 2.649951, 1, 0, 0, 1, 1,
2.025208, 0.8114697, 0.6682953, 0, 0, 0, 1, 1,
2.03432, 0.8976097, 0.4103455, 0, 0, 0, 1, 1,
2.051926, -0.3740411, 1.326572, 0, 0, 0, 1, 1,
2.057124, 0.3582116, 0.878553, 0, 0, 0, 1, 1,
2.065956, 1.927403, 0.6528947, 0, 0, 0, 1, 1,
2.149243, 1.783753, 0.6970099, 0, 0, 0, 1, 1,
2.157642, -0.1993422, 1.505507, 0, 0, 0, 1, 1,
2.225428, 0.3426996, 1.437648, 1, 1, 1, 1, 1,
2.421059, 0.2761282, 0.3310684, 1, 1, 1, 1, 1,
2.437431, 0.6184682, -0.02032066, 1, 1, 1, 1, 1,
2.463886, -0.5050425, 1.075498, 1, 1, 1, 1, 1,
2.55786, -0.8851564, 2.250695, 1, 1, 1, 1, 1,
2.668595, -0.1384781, 1.076908, 1, 1, 1, 1, 1,
2.729368, -2.088554, 2.392007, 1, 1, 1, 1, 1
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
var radius = 9.669249;
var distance = 33.96283;
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
mvMatrix.translate( 0.7125019, -0.4583476, -0.05366588 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.96283);
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
