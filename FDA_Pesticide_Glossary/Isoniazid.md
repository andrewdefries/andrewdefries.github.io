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
-2.798159, -0.02582219, -1.238221, 1, 0, 0, 1,
-2.763592, -1.295696, -2.036376, 1, 0.007843138, 0, 1,
-2.755585, -0.8247998, -2.491966, 1, 0.01176471, 0, 1,
-2.749571, 0.2365895, -0.89552, 1, 0.01960784, 0, 1,
-2.600251, -0.03285126, -0.4780499, 1, 0.02352941, 0, 1,
-2.588439, 0.2125939, -0.6969612, 1, 0.03137255, 0, 1,
-2.515322, 0.7676293, -0.263173, 1, 0.03529412, 0, 1,
-2.334388, 0.5091752, -0.8958293, 1, 0.04313726, 0, 1,
-2.333618, -0.5723614, -1.122314, 1, 0.04705882, 0, 1,
-2.220355, -0.3686921, -1.672257, 1, 0.05490196, 0, 1,
-2.199495, 2.149167, -2.567994, 1, 0.05882353, 0, 1,
-2.178609, -1.439228, -2.825027, 1, 0.06666667, 0, 1,
-2.148421, 0.4800436, -0.6711198, 1, 0.07058824, 0, 1,
-2.10362, 1.937925, -1.111651, 1, 0.07843138, 0, 1,
-2.079455, 2.061973, -1.190567, 1, 0.08235294, 0, 1,
-2.027093, 0.6481707, -1.593463, 1, 0.09019608, 0, 1,
-2.014963, -1.345677, -2.312139, 1, 0.09411765, 0, 1,
-2.006153, 1.518933, -1.345138, 1, 0.1019608, 0, 1,
-2.001726, -1.034756, -2.091371, 1, 0.1098039, 0, 1,
-1.958741, 0.5425078, 0.4865071, 1, 0.1137255, 0, 1,
-1.956272, 0.1407827, -1.861068, 1, 0.1215686, 0, 1,
-1.951128, -0.3831635, -3.020654, 1, 0.1254902, 0, 1,
-1.925892, -0.996384, -2.871442, 1, 0.1333333, 0, 1,
-1.925718, -1.429543, -3.483936, 1, 0.1372549, 0, 1,
-1.903994, 0.3310086, -0.3400962, 1, 0.145098, 0, 1,
-1.807147, 0.9331888, -0.5666245, 1, 0.1490196, 0, 1,
-1.801425, 0.9103717, -0.4211799, 1, 0.1568628, 0, 1,
-1.79992, 0.09086638, -0.8686272, 1, 0.1607843, 0, 1,
-1.731088, -1.237624, -2.649434, 1, 0.1686275, 0, 1,
-1.721503, -0.5478714, -2.837626, 1, 0.172549, 0, 1,
-1.718056, 0.1398118, -2.122172, 1, 0.1803922, 0, 1,
-1.714779, 0.6811846, 1.034063, 1, 0.1843137, 0, 1,
-1.711942, -1.144951, -4.299928, 1, 0.1921569, 0, 1,
-1.707581, -0.2865839, -0.5613709, 1, 0.1960784, 0, 1,
-1.707318, -0.7097827, -2.752075, 1, 0.2039216, 0, 1,
-1.703243, -0.1425598, -1.490437, 1, 0.2117647, 0, 1,
-1.689575, 0.9988722, -2.554051, 1, 0.2156863, 0, 1,
-1.674912, 1.779276, -2.429915, 1, 0.2235294, 0, 1,
-1.659694, -0.03136591, -1.38467, 1, 0.227451, 0, 1,
-1.643511, -0.2218721, -2.139043, 1, 0.2352941, 0, 1,
-1.635689, 1.105585, -2.055332, 1, 0.2392157, 0, 1,
-1.6349, 0.4430198, -1.619471, 1, 0.2470588, 0, 1,
-1.629417, -1.011081, -4.323599, 1, 0.2509804, 0, 1,
-1.610919, 0.2744631, -1.367584, 1, 0.2588235, 0, 1,
-1.603101, 0.863015, -1.117428, 1, 0.2627451, 0, 1,
-1.598202, 0.439452, -1.521999, 1, 0.2705882, 0, 1,
-1.59671, -0.02614658, -2.296384, 1, 0.2745098, 0, 1,
-1.530069, -0.3799366, -1.191507, 1, 0.282353, 0, 1,
-1.511941, 0.5004368, -0.9327063, 1, 0.2862745, 0, 1,
-1.495741, 0.1665258, -1.673031, 1, 0.2941177, 0, 1,
-1.474408, 2.043162, 0.9239003, 1, 0.3019608, 0, 1,
-1.47372, -1.959122, -2.716668, 1, 0.3058824, 0, 1,
-1.45663, -0.6829219, -2.013099, 1, 0.3137255, 0, 1,
-1.451416, 1.770188, -2.581933, 1, 0.3176471, 0, 1,
-1.448028, -0.3863043, -1.004096, 1, 0.3254902, 0, 1,
-1.441634, 0.8376403, -0.6368645, 1, 0.3294118, 0, 1,
-1.441021, -0.8420081, -1.184776, 1, 0.3372549, 0, 1,
-1.43162, -0.1264208, -0.8030162, 1, 0.3411765, 0, 1,
-1.423912, 0.4082047, -0.03885656, 1, 0.3490196, 0, 1,
-1.421814, -0.4861283, -0.5486225, 1, 0.3529412, 0, 1,
-1.418486, 1.716375, -1.699586, 1, 0.3607843, 0, 1,
-1.40208, -1.455454, -3.312102, 1, 0.3647059, 0, 1,
-1.401013, 0.75871, -0.2707635, 1, 0.372549, 0, 1,
-1.3938, -1.804621, -3.4762, 1, 0.3764706, 0, 1,
-1.389954, 0.1471996, -3.301736, 1, 0.3843137, 0, 1,
-1.375766, 1.615129, -1.394377, 1, 0.3882353, 0, 1,
-1.368498, 0.2254647, -1.486727, 1, 0.3960784, 0, 1,
-1.34938, 0.1143629, -0.7627617, 1, 0.4039216, 0, 1,
-1.345673, 1.543255, -1.067186, 1, 0.4078431, 0, 1,
-1.340192, 0.9710643, -1.463708, 1, 0.4156863, 0, 1,
-1.325378, 0.5595606, -0.6904885, 1, 0.4196078, 0, 1,
-1.325152, 0.2731204, -1.099088, 1, 0.427451, 0, 1,
-1.324833, -0.2646121, -1.826065, 1, 0.4313726, 0, 1,
-1.321002, -1.220399, -2.086466, 1, 0.4392157, 0, 1,
-1.314812, 0.5860783, -1.391304, 1, 0.4431373, 0, 1,
-1.30894, -0.05946504, 0.2357463, 1, 0.4509804, 0, 1,
-1.307102, -0.9435569, -1.344895, 1, 0.454902, 0, 1,
-1.303078, 0.9812503, -1.849968, 1, 0.4627451, 0, 1,
-1.300393, 0.7522619, -0.9797165, 1, 0.4666667, 0, 1,
-1.295227, -1.163327, -2.347764, 1, 0.4745098, 0, 1,
-1.287823, -0.2824218, -2.137964, 1, 0.4784314, 0, 1,
-1.287709, 0.4525849, -2.522441, 1, 0.4862745, 0, 1,
-1.280223, 0.8504581, 0.04778309, 1, 0.4901961, 0, 1,
-1.276471, -0.7364673, -2.836503, 1, 0.4980392, 0, 1,
-1.276301, -0.293087, -1.506386, 1, 0.5058824, 0, 1,
-1.275889, -1.305389, -2.584109, 1, 0.509804, 0, 1,
-1.266863, 0.3407716, -0.3142426, 1, 0.5176471, 0, 1,
-1.265582, -1.384834, -4.419249, 1, 0.5215687, 0, 1,
-1.256178, -0.8403164, -3.618751, 1, 0.5294118, 0, 1,
-1.252509, 1.276576, -1.376015, 1, 0.5333334, 0, 1,
-1.24934, -0.3524889, -0.6450207, 1, 0.5411765, 0, 1,
-1.24857, -0.1702785, -0.3206016, 1, 0.5450981, 0, 1,
-1.241817, 0.7380863, -1.364797, 1, 0.5529412, 0, 1,
-1.241729, 0.03285928, -1.325569, 1, 0.5568628, 0, 1,
-1.229089, -0.8079965, -1.547329, 1, 0.5647059, 0, 1,
-1.228373, 0.7209476, -0.9415369, 1, 0.5686275, 0, 1,
-1.225469, -2.741095, -1.582037, 1, 0.5764706, 0, 1,
-1.214816, -1.645037, -4.791223, 1, 0.5803922, 0, 1,
-1.209496, 0.3002127, -2.644849, 1, 0.5882353, 0, 1,
-1.20058, -2.433821, -2.165413, 1, 0.5921569, 0, 1,
-1.184837, 1.212453, -1.313949, 1, 0.6, 0, 1,
-1.178193, -0.3023957, -1.561034, 1, 0.6078432, 0, 1,
-1.172748, 1.183378, 0.5895602, 1, 0.6117647, 0, 1,
-1.171003, -1.658324, -1.679596, 1, 0.6196079, 0, 1,
-1.164104, -0.7004288, -1.755021, 1, 0.6235294, 0, 1,
-1.163209, -0.9662846, -0.9744386, 1, 0.6313726, 0, 1,
-1.161734, -0.004726467, -2.040123, 1, 0.6352941, 0, 1,
-1.15008, -1.518559, -2.881886, 1, 0.6431373, 0, 1,
-1.146699, -1.607389, -3.016818, 1, 0.6470588, 0, 1,
-1.131591, 0.8753347, -2.881391, 1, 0.654902, 0, 1,
-1.127987, -0.4555575, -4.216521, 1, 0.6588235, 0, 1,
-1.118278, -0.6112849, -2.861457, 1, 0.6666667, 0, 1,
-1.117287, 2.215509, 0.2466256, 1, 0.6705883, 0, 1,
-1.114012, 1.383184, -1.787896, 1, 0.6784314, 0, 1,
-1.108089, 0.6600077, -1.249362, 1, 0.682353, 0, 1,
-1.104135, -0.9790343, -2.360971, 1, 0.6901961, 0, 1,
-1.099517, 0.9015779, -1.133139, 1, 0.6941177, 0, 1,
-1.097768, 0.4020795, -2.62153, 1, 0.7019608, 0, 1,
-1.088687, 2.573767, -2.483313, 1, 0.7098039, 0, 1,
-1.088625, 1.468116, -1.721644, 1, 0.7137255, 0, 1,
-1.079385, 0.9697936, 0.5108522, 1, 0.7215686, 0, 1,
-1.076996, -0.971558, -1.677239, 1, 0.7254902, 0, 1,
-1.075578, -0.7511273, -2.733124, 1, 0.7333333, 0, 1,
-1.074862, -0.7741105, -1.52955, 1, 0.7372549, 0, 1,
-1.072518, 1.220278, -1.766749, 1, 0.7450981, 0, 1,
-1.066995, 0.74268, -0.203983, 1, 0.7490196, 0, 1,
-1.044607, -0.3418846, 0.1265259, 1, 0.7568628, 0, 1,
-1.043256, -0.385865, -1.828822, 1, 0.7607843, 0, 1,
-1.041949, -1.228472, -2.902647, 1, 0.7686275, 0, 1,
-1.039224, -1.569701, -1.834662, 1, 0.772549, 0, 1,
-1.038988, 0.1747024, -3.508085, 1, 0.7803922, 0, 1,
-1.038421, -0.3697969, -1.83709, 1, 0.7843137, 0, 1,
-1.037649, 0.3236439, 0.0824578, 1, 0.7921569, 0, 1,
-1.036541, 0.8449348, -1.278772, 1, 0.7960784, 0, 1,
-1.036293, -0.3580607, -2.244935, 1, 0.8039216, 0, 1,
-1.029454, -0.129409, -3.091944, 1, 0.8117647, 0, 1,
-1.029371, -0.8535419, -4.097233, 1, 0.8156863, 0, 1,
-1.021376, -0.1695297, -1.473176, 1, 0.8235294, 0, 1,
-1.000436, 0.06209952, -1.873981, 1, 0.827451, 0, 1,
-0.9995281, -0.2053284, -1.349621, 1, 0.8352941, 0, 1,
-0.9992482, 0.7068151, -1.613848, 1, 0.8392157, 0, 1,
-0.9973618, -1.309351, -1.193627, 1, 0.8470588, 0, 1,
-0.9920893, 0.04300835, -2.312898, 1, 0.8509804, 0, 1,
-0.9916369, -0.07683555, -1.373661, 1, 0.8588235, 0, 1,
-0.9900729, 1.538952, -0.03594606, 1, 0.8627451, 0, 1,
-0.9866602, 0.2250769, -1.751909, 1, 0.8705882, 0, 1,
-0.9860713, -0.1275247, -1.881688, 1, 0.8745098, 0, 1,
-0.9800084, 0.4023678, -2.863518, 1, 0.8823529, 0, 1,
-0.9769019, -0.1447033, -1.400867, 1, 0.8862745, 0, 1,
-0.971867, -1.057145, -1.839726, 1, 0.8941177, 0, 1,
-0.9634562, -0.3300845, -2.27084, 1, 0.8980392, 0, 1,
-0.9629225, 0.01314228, -1.715043, 1, 0.9058824, 0, 1,
-0.9597692, 1.044798, -0.5118012, 1, 0.9137255, 0, 1,
-0.9576218, 1.00712, 1.371548, 1, 0.9176471, 0, 1,
-0.951766, 1.211036, -0.2029356, 1, 0.9254902, 0, 1,
-0.9510623, -0.8641565, -3.56176, 1, 0.9294118, 0, 1,
-0.9480014, 0.3022954, -1.522943, 1, 0.9372549, 0, 1,
-0.9478945, -0.7635185, -0.8278154, 1, 0.9411765, 0, 1,
-0.9423571, -1.195117, -2.604356, 1, 0.9490196, 0, 1,
-0.9268528, -1.375121, -2.797718, 1, 0.9529412, 0, 1,
-0.9249166, 0.3663567, -2.584291, 1, 0.9607843, 0, 1,
-0.9156931, -0.01405765, -2.112073, 1, 0.9647059, 0, 1,
-0.9145, -0.07061323, -2.535912, 1, 0.972549, 0, 1,
-0.9016463, -0.1674512, 1.030646, 1, 0.9764706, 0, 1,
-0.8891405, 0.3173516, 0.04751082, 1, 0.9843137, 0, 1,
-0.8865784, 0.5096487, -1.023322, 1, 0.9882353, 0, 1,
-0.870964, -0.5923574, -1.051992, 1, 0.9960784, 0, 1,
-0.867336, 0.6541438, -0.3132825, 0.9960784, 1, 0, 1,
-0.8572717, 1.204637, -0.7920145, 0.9921569, 1, 0, 1,
-0.8484955, -1.410665, -4.052673, 0.9843137, 1, 0, 1,
-0.847652, 0.2637824, -1.587119, 0.9803922, 1, 0, 1,
-0.8465239, 0.9340328, -0.8816494, 0.972549, 1, 0, 1,
-0.8435088, -1.25818, -2.780566, 0.9686275, 1, 0, 1,
-0.8236344, -0.08735949, -1.460107, 0.9607843, 1, 0, 1,
-0.8231588, 0.6815855, -0.710259, 0.9568627, 1, 0, 1,
-0.8158736, -1.044083, -3.072422, 0.9490196, 1, 0, 1,
-0.8151067, -0.3756744, -2.366609, 0.945098, 1, 0, 1,
-0.8140432, 0.1148961, -1.79597, 0.9372549, 1, 0, 1,
-0.8137718, 0.3710576, -1.914812, 0.9333333, 1, 0, 1,
-0.8055875, 1.214804, 0.6830752, 0.9254902, 1, 0, 1,
-0.8036819, 1.479011, 1.095871, 0.9215686, 1, 0, 1,
-0.8012918, -0.1967369, -1.88045, 0.9137255, 1, 0, 1,
-0.7961724, 0.5003483, 0.6525108, 0.9098039, 1, 0, 1,
-0.7959009, 1.266763, -1.440327, 0.9019608, 1, 0, 1,
-0.7913905, 0.7486675, -0.5822644, 0.8941177, 1, 0, 1,
-0.7908314, 0.7183621, -1.508247, 0.8901961, 1, 0, 1,
-0.7868423, -1.234833, -3.01166, 0.8823529, 1, 0, 1,
-0.7863948, -0.3856734, -1.717238, 0.8784314, 1, 0, 1,
-0.784762, 1.61405, -0.5056667, 0.8705882, 1, 0, 1,
-0.7745176, -0.7121419, -1.664463, 0.8666667, 1, 0, 1,
-0.7720621, 0.02219613, -1.829498, 0.8588235, 1, 0, 1,
-0.7640631, -0.5709228, -1.707183, 0.854902, 1, 0, 1,
-0.748388, -2.117657, -0.9655092, 0.8470588, 1, 0, 1,
-0.7466399, -0.1056694, -1.974346, 0.8431373, 1, 0, 1,
-0.7446171, 0.003050181, -1.615296, 0.8352941, 1, 0, 1,
-0.7445944, -0.7174546, -0.210399, 0.8313726, 1, 0, 1,
-0.7388847, 0.2195759, -0.5655001, 0.8235294, 1, 0, 1,
-0.7388635, -1.688875, -4.49221, 0.8196079, 1, 0, 1,
-0.7365384, 2.102872, -2.692533, 0.8117647, 1, 0, 1,
-0.730642, 1.020085, 0.1547073, 0.8078431, 1, 0, 1,
-0.730075, -0.2901209, -0.7984032, 0.8, 1, 0, 1,
-0.7286732, -0.3228236, -2.608299, 0.7921569, 1, 0, 1,
-0.7236506, -0.755661, -2.156452, 0.7882353, 1, 0, 1,
-0.7201242, 0.517005, -3.186558, 0.7803922, 1, 0, 1,
-0.7184388, 0.6373242, 0.9150127, 0.7764706, 1, 0, 1,
-0.7142081, -0.6116716, -2.827741, 0.7686275, 1, 0, 1,
-0.7135505, 2.558417, -0.4607184, 0.7647059, 1, 0, 1,
-0.7125794, 0.7681107, -0.2162438, 0.7568628, 1, 0, 1,
-0.7110987, -1.187212, 0.1927769, 0.7529412, 1, 0, 1,
-0.7109851, 0.2738495, -1.187786, 0.7450981, 1, 0, 1,
-0.7103956, -0.2785087, -2.781414, 0.7411765, 1, 0, 1,
-0.7040747, -0.419249, -1.136647, 0.7333333, 1, 0, 1,
-0.7033622, 0.6987537, -1.225415, 0.7294118, 1, 0, 1,
-0.7030792, -1.031783, -2.570905, 0.7215686, 1, 0, 1,
-0.702273, 0.3365507, -1.318714, 0.7176471, 1, 0, 1,
-0.7009399, 1.082723, -0.3331162, 0.7098039, 1, 0, 1,
-0.6973941, -0.2291592, -1.172557, 0.7058824, 1, 0, 1,
-0.6951421, -1.685116, -3.943495, 0.6980392, 1, 0, 1,
-0.6941695, 0.05542305, -1.954667, 0.6901961, 1, 0, 1,
-0.6920944, -1.408518, -1.796581, 0.6862745, 1, 0, 1,
-0.6887726, 0.07221984, -1.640567, 0.6784314, 1, 0, 1,
-0.6869955, 1.11043, -1.246942, 0.6745098, 1, 0, 1,
-0.6836304, -0.2095922, -3.396723, 0.6666667, 1, 0, 1,
-0.6833268, -0.3041297, -2.004309, 0.6627451, 1, 0, 1,
-0.6818722, 1.361322, -0.6660354, 0.654902, 1, 0, 1,
-0.6741591, -0.7352371, -3.472882, 0.6509804, 1, 0, 1,
-0.6741316, -0.3298136, -2.223974, 0.6431373, 1, 0, 1,
-0.6713873, 0.3414001, -0.9288092, 0.6392157, 1, 0, 1,
-0.6683154, -0.7120879, -1.440269, 0.6313726, 1, 0, 1,
-0.6680362, 0.7659994, -0.03485043, 0.627451, 1, 0, 1,
-0.6661539, 1.549337, -0.3387087, 0.6196079, 1, 0, 1,
-0.6647543, -1.551782, -2.691312, 0.6156863, 1, 0, 1,
-0.6574767, -1.394413, -2.240293, 0.6078432, 1, 0, 1,
-0.6556535, -1.004444, -3.23945, 0.6039216, 1, 0, 1,
-0.6519572, -1.998233, -3.878336, 0.5960785, 1, 0, 1,
-0.6313245, 1.029083, -0.3396576, 0.5882353, 1, 0, 1,
-0.6303509, 0.3566359, -2.533581, 0.5843138, 1, 0, 1,
-0.6296713, 0.1500683, 0.02132528, 0.5764706, 1, 0, 1,
-0.6292899, 0.05097215, -1.526878, 0.572549, 1, 0, 1,
-0.6264484, -0.5920936, -2.264423, 0.5647059, 1, 0, 1,
-0.6256583, 0.785431, -0.3948591, 0.5607843, 1, 0, 1,
-0.6196582, -1.134269, -2.24452, 0.5529412, 1, 0, 1,
-0.6132127, 1.73785, 0.2691045, 0.5490196, 1, 0, 1,
-0.6101947, -0.1154729, -1.805389, 0.5411765, 1, 0, 1,
-0.6085816, 0.1254057, -1.303211, 0.5372549, 1, 0, 1,
-0.6084608, -0.166791, -1.852474, 0.5294118, 1, 0, 1,
-0.6052238, 1.378338, 0.109305, 0.5254902, 1, 0, 1,
-0.6046456, -0.3905333, -3.102843, 0.5176471, 1, 0, 1,
-0.6019104, -0.02115519, -2.941546, 0.5137255, 1, 0, 1,
-0.6006286, 0.1963301, 0.01317387, 0.5058824, 1, 0, 1,
-0.5999652, 0.4005703, -0.115171, 0.5019608, 1, 0, 1,
-0.5998143, 0.377272, -0.9089597, 0.4941176, 1, 0, 1,
-0.5976957, 0.8421778, -0.6423017, 0.4862745, 1, 0, 1,
-0.5909007, 1.396766, -2.177451, 0.4823529, 1, 0, 1,
-0.5896986, 1.007566, -0.938733, 0.4745098, 1, 0, 1,
-0.5829069, 1.588734, 0.2935883, 0.4705882, 1, 0, 1,
-0.5824632, 0.8760531, -0.7205084, 0.4627451, 1, 0, 1,
-0.5770423, 1.257738, -0.1733794, 0.4588235, 1, 0, 1,
-0.5768505, 0.560342, -0.4016323, 0.4509804, 1, 0, 1,
-0.5767828, -1.580745, -2.387226, 0.4470588, 1, 0, 1,
-0.5741411, 0.2478108, -4.416781, 0.4392157, 1, 0, 1,
-0.5725576, 0.4538228, 0.2645147, 0.4352941, 1, 0, 1,
-0.5710767, 0.8826762, -0.3077116, 0.427451, 1, 0, 1,
-0.5708403, -1.460887, -3.503165, 0.4235294, 1, 0, 1,
-0.5656747, 0.1210133, -1.856696, 0.4156863, 1, 0, 1,
-0.5630376, 1.078442, 1.404268, 0.4117647, 1, 0, 1,
-0.5613425, -1.092829, -2.513928, 0.4039216, 1, 0, 1,
-0.557882, 0.9488125, -2.153303, 0.3960784, 1, 0, 1,
-0.5561695, -0.7765278, -3.211706, 0.3921569, 1, 0, 1,
-0.5532337, -0.392702, -2.192871, 0.3843137, 1, 0, 1,
-0.5483578, 0.3949217, -2.016546, 0.3803922, 1, 0, 1,
-0.5452078, -1.436077, -1.81435, 0.372549, 1, 0, 1,
-0.5436676, 0.4986672, -0.6278583, 0.3686275, 1, 0, 1,
-0.5430654, -0.9248462, -2.010399, 0.3607843, 1, 0, 1,
-0.5424328, -0.7284463, -2.11845, 0.3568628, 1, 0, 1,
-0.5393289, 0.1011584, -1.967823, 0.3490196, 1, 0, 1,
-0.538354, 0.2045164, -1.814913, 0.345098, 1, 0, 1,
-0.5366274, 0.2851766, -1.840347, 0.3372549, 1, 0, 1,
-0.5318989, 0.7268138, 0.8631744, 0.3333333, 1, 0, 1,
-0.5296566, -0.9200586, -1.203362, 0.3254902, 1, 0, 1,
-0.5275733, 0.2188575, -0.9961917, 0.3215686, 1, 0, 1,
-0.5270371, -1.376177, -4.383637, 0.3137255, 1, 0, 1,
-0.5247992, 0.5629593, -1.333246, 0.3098039, 1, 0, 1,
-0.5226061, -1.270187, -1.381699, 0.3019608, 1, 0, 1,
-0.5211832, 0.1082531, -0.589013, 0.2941177, 1, 0, 1,
-0.5181072, -0.5445552, -0.9944381, 0.2901961, 1, 0, 1,
-0.5141461, 1.003831, 0.6450021, 0.282353, 1, 0, 1,
-0.5042879, -0.6704662, -2.007534, 0.2784314, 1, 0, 1,
-0.5036529, -1.298399, -3.055199, 0.2705882, 1, 0, 1,
-0.5024678, 0.304545, -2.758936, 0.2666667, 1, 0, 1,
-0.4998505, 0.09110393, -1.671497, 0.2588235, 1, 0, 1,
-0.4949283, -0.6583474, -2.67031, 0.254902, 1, 0, 1,
-0.4941746, -1.735093, -3.257535, 0.2470588, 1, 0, 1,
-0.4930411, -0.2756747, -2.770323, 0.2431373, 1, 0, 1,
-0.4891561, 0.7563462, 0.3789116, 0.2352941, 1, 0, 1,
-0.4891353, -0.2905582, -2.717669, 0.2313726, 1, 0, 1,
-0.4870364, -1.353919, -2.990039, 0.2235294, 1, 0, 1,
-0.4837619, -0.2687097, -2.934793, 0.2196078, 1, 0, 1,
-0.4837153, 1.438388, 0.1873084, 0.2117647, 1, 0, 1,
-0.4766328, 1.176782, 0.4588246, 0.2078431, 1, 0, 1,
-0.4710874, 1.079254, -2.138712, 0.2, 1, 0, 1,
-0.470137, 0.5042787, -0.1869453, 0.1921569, 1, 0, 1,
-0.4697897, -1.071739, -4.433763, 0.1882353, 1, 0, 1,
-0.4688282, -0.3806486, -0.8857912, 0.1803922, 1, 0, 1,
-0.4685648, 0.1461961, 0.2033088, 0.1764706, 1, 0, 1,
-0.4673913, -0.5296177, -2.479604, 0.1686275, 1, 0, 1,
-0.4669302, -1.330589, -1.815329, 0.1647059, 1, 0, 1,
-0.4636722, -1.453257, -2.889778, 0.1568628, 1, 0, 1,
-0.4618216, 0.8976972, -1.138524, 0.1529412, 1, 0, 1,
-0.4599997, 0.227687, -0.2598813, 0.145098, 1, 0, 1,
-0.4598092, -0.9436703, -2.07515, 0.1411765, 1, 0, 1,
-0.4594459, -0.3479689, -2.407788, 0.1333333, 1, 0, 1,
-0.4504046, 0.3928437, -0.3322675, 0.1294118, 1, 0, 1,
-0.4503306, 2.115072, 1.093193, 0.1215686, 1, 0, 1,
-0.4445929, 0.6188614, 0.01961356, 0.1176471, 1, 0, 1,
-0.4380822, 2.775249, 0.2246684, 0.1098039, 1, 0, 1,
-0.4314082, 0.03528061, -0.5643395, 0.1058824, 1, 0, 1,
-0.4310256, 1.073378, 1.156073, 0.09803922, 1, 0, 1,
-0.4243257, -0.4924436, -2.657772, 0.09019608, 1, 0, 1,
-0.4198014, 1.406399, -1.047065, 0.08627451, 1, 0, 1,
-0.4123963, -0.4547202, -3.701735, 0.07843138, 1, 0, 1,
-0.4122089, -0.6862612, -3.789808, 0.07450981, 1, 0, 1,
-0.4118187, -0.8309048, -2.733362, 0.06666667, 1, 0, 1,
-0.411701, -3.484668, -2.16442, 0.0627451, 1, 0, 1,
-0.4117007, -0.5750833, -3.580765, 0.05490196, 1, 0, 1,
-0.4103815, -0.4101949, -2.47762, 0.05098039, 1, 0, 1,
-0.4098316, 1.956259, -0.6894021, 0.04313726, 1, 0, 1,
-0.407476, 0.7259198, 0.2656246, 0.03921569, 1, 0, 1,
-0.4042157, -0.009855303, -0.488868, 0.03137255, 1, 0, 1,
-0.4023713, 1.537214, 1.141775, 0.02745098, 1, 0, 1,
-0.397182, -0.360829, -1.135539, 0.01960784, 1, 0, 1,
-0.3961997, 1.41772, 1.540905, 0.01568628, 1, 0, 1,
-0.3940153, -0.3403249, -2.490204, 0.007843138, 1, 0, 1,
-0.3930575, -0.3089629, -4.848671, 0.003921569, 1, 0, 1,
-0.3890538, -1.593221, -2.018782, 0, 1, 0.003921569, 1,
-0.3866, 0.7826636, -1.234353, 0, 1, 0.01176471, 1,
-0.3800696, -0.1214355, -3.408174, 0, 1, 0.01568628, 1,
-0.378804, 0.7496102, -1.589554, 0, 1, 0.02352941, 1,
-0.377244, -0.08900041, -1.650077, 0, 1, 0.02745098, 1,
-0.3674105, 1.136018, -1.878281, 0, 1, 0.03529412, 1,
-0.3673349, -2.341736, -4.427028, 0, 1, 0.03921569, 1,
-0.3654402, -0.2824453, -1.382852, 0, 1, 0.04705882, 1,
-0.3640458, 0.7558455, 0.09680366, 0, 1, 0.05098039, 1,
-0.3634557, -0.1101956, -1.030182, 0, 1, 0.05882353, 1,
-0.3626548, -0.08915155, -2.452866, 0, 1, 0.0627451, 1,
-0.3610667, 0.2170027, 0.5576314, 0, 1, 0.07058824, 1,
-0.3601208, -0.7542561, -2.016171, 0, 1, 0.07450981, 1,
-0.3593873, -1.641909, -2.412256, 0, 1, 0.08235294, 1,
-0.3581999, -0.6313895, -3.451918, 0, 1, 0.08627451, 1,
-0.3556156, -0.02169319, -2.32111, 0, 1, 0.09411765, 1,
-0.3521268, 0.9836305, 0.1924011, 0, 1, 0.1019608, 1,
-0.3515781, -1.463211, -1.313011, 0, 1, 0.1058824, 1,
-0.3439935, -0.4520082, -1.39912, 0, 1, 0.1137255, 1,
-0.3407847, 0.04514179, -1.017581, 0, 1, 0.1176471, 1,
-0.3283044, -0.05743003, -3.501623, 0, 1, 0.1254902, 1,
-0.3278656, -0.009490639, -1.196485, 0, 1, 0.1294118, 1,
-0.3257759, 0.2827888, -2.115532, 0, 1, 0.1372549, 1,
-0.3195251, 0.8794984, -0.9962801, 0, 1, 0.1411765, 1,
-0.3172267, 0.7843985, 0.1432528, 0, 1, 0.1490196, 1,
-0.3156294, -0.1620266, -3.430525, 0, 1, 0.1529412, 1,
-0.3104637, 0.5685166, -0.5971446, 0, 1, 0.1607843, 1,
-0.3078174, 0.2255632, 0.2852013, 0, 1, 0.1647059, 1,
-0.3048971, 0.1705592, -1.250273, 0, 1, 0.172549, 1,
-0.3008743, -0.004379295, -1.55336, 0, 1, 0.1764706, 1,
-0.2996462, 1.492604, 1.99185, 0, 1, 0.1843137, 1,
-0.2973211, 1.838231, -0.3792059, 0, 1, 0.1882353, 1,
-0.2967025, -0.2139106, -2.142952, 0, 1, 0.1960784, 1,
-0.2940725, -0.4181291, -1.927123, 0, 1, 0.2039216, 1,
-0.2870053, -1.106339, -4.73405, 0, 1, 0.2078431, 1,
-0.2843737, -0.8939418, -1.79627, 0, 1, 0.2156863, 1,
-0.2827103, -0.4193133, -1.188766, 0, 1, 0.2196078, 1,
-0.2820477, -0.0843781, -3.449493, 0, 1, 0.227451, 1,
-0.281578, 0.5260979, -1.086602, 0, 1, 0.2313726, 1,
-0.2803877, 0.4317965, -0.6985583, 0, 1, 0.2392157, 1,
-0.2776497, -0.4222968, -1.502429, 0, 1, 0.2431373, 1,
-0.2747125, 1.416743, -1.154638, 0, 1, 0.2509804, 1,
-0.2707901, -0.2532438, -0.5908408, 0, 1, 0.254902, 1,
-0.2685639, 1.321622, -1.429305, 0, 1, 0.2627451, 1,
-0.2677762, 1.396769, 1.392185, 0, 1, 0.2666667, 1,
-0.2645161, 0.8817644, 0.2528368, 0, 1, 0.2745098, 1,
-0.2535789, 1.328478, -0.7805942, 0, 1, 0.2784314, 1,
-0.2471515, 0.4813877, 1.3985, 0, 1, 0.2862745, 1,
-0.2449013, -1.672143, -2.71901, 0, 1, 0.2901961, 1,
-0.242478, -1.352755, -3.609864, 0, 1, 0.2980392, 1,
-0.2417235, 0.8839467, 0.7632065, 0, 1, 0.3058824, 1,
-0.2380516, -0.7724703, -3.069842, 0, 1, 0.3098039, 1,
-0.2377094, -0.5054242, -1.341534, 0, 1, 0.3176471, 1,
-0.2348122, -0.8983228, -2.689588, 0, 1, 0.3215686, 1,
-0.2267384, 0.4940577, -0.8034387, 0, 1, 0.3294118, 1,
-0.2241856, 0.7051892, -0.6839812, 0, 1, 0.3333333, 1,
-0.221953, -0.2944738, -1.611702, 0, 1, 0.3411765, 1,
-0.2190419, -1.485152, -3.360342, 0, 1, 0.345098, 1,
-0.2189099, -0.1614485, -2.946435, 0, 1, 0.3529412, 1,
-0.2160398, -0.941166, -4.075727, 0, 1, 0.3568628, 1,
-0.2159892, 1.901937, -0.2881865, 0, 1, 0.3647059, 1,
-0.2117151, 0.7766334, -2.979332, 0, 1, 0.3686275, 1,
-0.206018, 0.5218577, -0.513584, 0, 1, 0.3764706, 1,
-0.2050695, 0.04551664, -1.830613, 0, 1, 0.3803922, 1,
-0.2015701, -0.9618543, -3.619323, 0, 1, 0.3882353, 1,
-0.1969332, -0.3201853, -3.155808, 0, 1, 0.3921569, 1,
-0.194636, 0.8689983, -0.4961534, 0, 1, 0.4, 1,
-0.1944739, -1.0895, -3.488487, 0, 1, 0.4078431, 1,
-0.19413, -0.5549355, -1.814723, 0, 1, 0.4117647, 1,
-0.1907736, -0.5580977, -2.07305, 0, 1, 0.4196078, 1,
-0.190241, -0.1198288, -1.587366, 0, 1, 0.4235294, 1,
-0.1891312, -0.9167716, -2.561576, 0, 1, 0.4313726, 1,
-0.188702, 2.244169, -0.8808387, 0, 1, 0.4352941, 1,
-0.1829815, 0.7131782, 0.3197195, 0, 1, 0.4431373, 1,
-0.182625, 0.408357, -1.928157, 0, 1, 0.4470588, 1,
-0.1817057, -0.1790934, -3.080957, 0, 1, 0.454902, 1,
-0.1791351, -0.355828, -4.667795, 0, 1, 0.4588235, 1,
-0.1745867, -0.7776002, -3.801465, 0, 1, 0.4666667, 1,
-0.1743032, -1.356269, -3.950437, 0, 1, 0.4705882, 1,
-0.1682112, -1.676589, -2.151571, 0, 1, 0.4784314, 1,
-0.1681951, 1.091152, 0.7897616, 0, 1, 0.4823529, 1,
-0.1678486, 0.116101, -0.6727763, 0, 1, 0.4901961, 1,
-0.1656346, 0.1943867, 0.5650733, 0, 1, 0.4941176, 1,
-0.1585398, -0.3431787, -2.96993, 0, 1, 0.5019608, 1,
-0.1568192, -0.2439333, -3.177821, 0, 1, 0.509804, 1,
-0.1554105, 0.3688733, -0.1595996, 0, 1, 0.5137255, 1,
-0.1472784, -0.2525447, -1.901275, 0, 1, 0.5215687, 1,
-0.1384721, 1.3967, -0.5554175, 0, 1, 0.5254902, 1,
-0.1376685, 0.152535, -0.9980565, 0, 1, 0.5333334, 1,
-0.134096, 0.4266919, 0.2315161, 0, 1, 0.5372549, 1,
-0.1336916, -0.7629321, -3.934818, 0, 1, 0.5450981, 1,
-0.1302814, 0.3235569, -1.026867, 0, 1, 0.5490196, 1,
-0.1294128, -0.1660088, -3.336357, 0, 1, 0.5568628, 1,
-0.1270023, 0.8014889, -0.283857, 0, 1, 0.5607843, 1,
-0.1238476, 0.239002, -0.07631632, 0, 1, 0.5686275, 1,
-0.1175429, 0.6680946, -1.514986, 0, 1, 0.572549, 1,
-0.1152497, -0.9810251, -0.9119388, 0, 1, 0.5803922, 1,
-0.1147563, -0.3988849, -2.381215, 0, 1, 0.5843138, 1,
-0.1137002, 0.6795205, -0.4024782, 0, 1, 0.5921569, 1,
-0.1120424, -0.1614453, -4.23845, 0, 1, 0.5960785, 1,
-0.1101464, -0.06210998, -1.701497, 0, 1, 0.6039216, 1,
-0.1087738, 0.6586118, -0.8896479, 0, 1, 0.6117647, 1,
-0.1056029, -0.4643292, -0.5601006, 0, 1, 0.6156863, 1,
-0.1055596, 0.4497116, 0.02898647, 0, 1, 0.6235294, 1,
-0.1013456, 1.430518, -1.563544, 0, 1, 0.627451, 1,
-0.1005847, 0.1088298, -1.098462, 0, 1, 0.6352941, 1,
-0.09837437, 0.08447087, 1.140758, 0, 1, 0.6392157, 1,
-0.096595, -0.01753344, -2.879859, 0, 1, 0.6470588, 1,
-0.09544975, -0.4987698, -1.525134, 0, 1, 0.6509804, 1,
-0.09326675, -0.6346674, -2.690793, 0, 1, 0.6588235, 1,
-0.08905949, 2.30807, -0.5612252, 0, 1, 0.6627451, 1,
-0.08389382, 0.3666626, -0.06454426, 0, 1, 0.6705883, 1,
-0.08139607, 0.6272473, 0.5629813, 0, 1, 0.6745098, 1,
-0.07685041, 0.1163213, -0.6655996, 0, 1, 0.682353, 1,
-0.07542717, 1.416887, -1.330165, 0, 1, 0.6862745, 1,
-0.07297308, -0.5318566, -3.737401, 0, 1, 0.6941177, 1,
-0.07232128, -0.4802966, -3.286819, 0, 1, 0.7019608, 1,
-0.07173138, 0.3472918, 0.1865713, 0, 1, 0.7058824, 1,
-0.06770989, 0.002777306, -3.377187, 0, 1, 0.7137255, 1,
-0.06549121, -1.1222, -3.030054, 0, 1, 0.7176471, 1,
-0.064399, 1.47368, -0.2968135, 0, 1, 0.7254902, 1,
-0.06420595, 1.768998, 0.368076, 0, 1, 0.7294118, 1,
-0.06004544, -0.04428956, -1.712921, 0, 1, 0.7372549, 1,
-0.05897809, 2.034851, -0.7511122, 0, 1, 0.7411765, 1,
-0.05632878, -0.7386634, -1.170602, 0, 1, 0.7490196, 1,
-0.0553809, 1.848715, 0.1154943, 0, 1, 0.7529412, 1,
-0.03945608, 0.3782685, -0.2982638, 0, 1, 0.7607843, 1,
-0.03905236, -0.2530207, -4.180007, 0, 1, 0.7647059, 1,
-0.03653076, -1.039969, -3.365786, 0, 1, 0.772549, 1,
-0.03578218, 0.7834339, 0.4186273, 0, 1, 0.7764706, 1,
-0.0317111, 1.0504, -0.397951, 0, 1, 0.7843137, 1,
-0.03143238, -0.222708, -4.270363, 0, 1, 0.7882353, 1,
-0.02859876, -1.271681, -3.296738, 0, 1, 0.7960784, 1,
-0.0278245, 1.508443, 0.2580361, 0, 1, 0.8039216, 1,
-0.02685584, -1.625995, -3.963906, 0, 1, 0.8078431, 1,
-0.02311183, -0.6501366, -1.253962, 0, 1, 0.8156863, 1,
-0.02117006, 0.4852349, 0.1752465, 0, 1, 0.8196079, 1,
-0.02112178, -0.1105333, -1.735689, 0, 1, 0.827451, 1,
-0.01860338, 0.04875308, 0.7340996, 0, 1, 0.8313726, 1,
-0.01497909, -0.06350213, -2.899905, 0, 1, 0.8392157, 1,
-0.01286377, 1.088628, -0.4777299, 0, 1, 0.8431373, 1,
-0.01084777, -0.2162817, -3.6073, 0, 1, 0.8509804, 1,
-0.005735875, 1.664389, 0.8234434, 0, 1, 0.854902, 1,
-0.003350388, 1.713087, 0.537345, 0, 1, 0.8627451, 1,
-0.0005774398, -1.030284, -2.370477, 0, 1, 0.8666667, 1,
0.003021108, 1.851718, -2.491317, 0, 1, 0.8745098, 1,
0.003191421, 0.3049104, 1.174892, 0, 1, 0.8784314, 1,
0.004621283, -0.4380587, 1.64004, 0, 1, 0.8862745, 1,
0.008344205, -1.541038, 3.004262, 0, 1, 0.8901961, 1,
0.008724722, -0.07601672, 2.745425, 0, 1, 0.8980392, 1,
0.01428734, 0.8569499, 1.527878, 0, 1, 0.9058824, 1,
0.01876039, -0.5892087, 2.548834, 0, 1, 0.9098039, 1,
0.02140464, 0.7438141, 1.116153, 0, 1, 0.9176471, 1,
0.02366392, -1.070534, 1.760998, 0, 1, 0.9215686, 1,
0.023718, 0.03569302, -0.07651984, 0, 1, 0.9294118, 1,
0.02634907, 1.681037, -0.9195636, 0, 1, 0.9333333, 1,
0.02736192, -1.345789, 3.537798, 0, 1, 0.9411765, 1,
0.02785206, -0.5705415, 2.345163, 0, 1, 0.945098, 1,
0.03552071, -1.123688, 2.06261, 0, 1, 0.9529412, 1,
0.03831346, -1.112402, 3.576713, 0, 1, 0.9568627, 1,
0.04554945, 1.064925, -0.6211124, 0, 1, 0.9647059, 1,
0.04683098, 2.160786, -1.155419, 0, 1, 0.9686275, 1,
0.04777852, -0.3140773, 3.046676, 0, 1, 0.9764706, 1,
0.04947158, 1.703878, 0.05769875, 0, 1, 0.9803922, 1,
0.05011919, 0.2610155, 0.04713089, 0, 1, 0.9882353, 1,
0.05144178, -0.849417, 2.772691, 0, 1, 0.9921569, 1,
0.05192877, -0.7455987, 4.960519, 0, 1, 1, 1,
0.05248353, -1.997466, 4.421118, 0, 0.9921569, 1, 1,
0.05404429, 2.077419, 1.189971, 0, 0.9882353, 1, 1,
0.05476539, -1.035186, 1.70947, 0, 0.9803922, 1, 1,
0.05707809, -0.0411129, 0.9342508, 0, 0.9764706, 1, 1,
0.05845775, -0.8246738, 2.414522, 0, 0.9686275, 1, 1,
0.06062019, 0.4435505, 0.3852969, 0, 0.9647059, 1, 1,
0.06903844, 0.966942, 0.2663599, 0, 0.9568627, 1, 1,
0.06942074, 1.210891, 0.005325838, 0, 0.9529412, 1, 1,
0.07352188, 0.01545929, 1.124272, 0, 0.945098, 1, 1,
0.07417237, -0.1230833, 3.500518, 0, 0.9411765, 1, 1,
0.07608829, -1.345301, 5.178595, 0, 0.9333333, 1, 1,
0.07682561, -0.84484, 4.275119, 0, 0.9294118, 1, 1,
0.080404, 0.3824634, 0.1808392, 0, 0.9215686, 1, 1,
0.08041576, 1.633595, 0.9132378, 0, 0.9176471, 1, 1,
0.08414517, -0.4142143, 4.157084, 0, 0.9098039, 1, 1,
0.08470441, -1.244875, 3.842934, 0, 0.9058824, 1, 1,
0.08874092, -0.675957, 2.147252, 0, 0.8980392, 1, 1,
0.09483937, -0.5390183, 0.5007208, 0, 0.8901961, 1, 1,
0.09822489, 0.7285973, -0.1974868, 0, 0.8862745, 1, 1,
0.0988858, -1.136386, 2.321953, 0, 0.8784314, 1, 1,
0.09941211, 0.7418593, 0.1486659, 0, 0.8745098, 1, 1,
0.1050686, -1.321557, 3.435889, 0, 0.8666667, 1, 1,
0.1104283, 1.032996, 1.160328, 0, 0.8627451, 1, 1,
0.1154486, -0.2276682, 4.118899, 0, 0.854902, 1, 1,
0.118462, 0.1185276, 1.432339, 0, 0.8509804, 1, 1,
0.1192947, 0.0696066, 1.078608, 0, 0.8431373, 1, 1,
0.1240896, -1.613915, 2.863391, 0, 0.8392157, 1, 1,
0.1246206, 0.4285744, 0.6739342, 0, 0.8313726, 1, 1,
0.1246714, 0.5803596, 2.145637, 0, 0.827451, 1, 1,
0.1258587, -0.7433295, 1.774982, 0, 0.8196079, 1, 1,
0.1261025, 0.07917973, 0.8159032, 0, 0.8156863, 1, 1,
0.1270808, 0.6983567, -0.003600217, 0, 0.8078431, 1, 1,
0.1321995, -0.4639964, 3.9179, 0, 0.8039216, 1, 1,
0.1360058, -0.3516843, 2.695301, 0, 0.7960784, 1, 1,
0.1391286, 1.001822, -0.5696067, 0, 0.7882353, 1, 1,
0.1417573, -0.5367992, 2.869046, 0, 0.7843137, 1, 1,
0.1467352, 0.03460006, 1.815922, 0, 0.7764706, 1, 1,
0.1479549, -0.2074119, 2.772333, 0, 0.772549, 1, 1,
0.1601145, 1.181442, 2.014961, 0, 0.7647059, 1, 1,
0.1618855, -0.05227253, 1.08113, 0, 0.7607843, 1, 1,
0.1636573, -0.8472102, 2.586554, 0, 0.7529412, 1, 1,
0.1639043, -0.3065682, 2.536028, 0, 0.7490196, 1, 1,
0.1695309, 0.8761314, -0.7228011, 0, 0.7411765, 1, 1,
0.1703392, -0.7020538, 2.813265, 0, 0.7372549, 1, 1,
0.1764263, -0.9176203, 1.518969, 0, 0.7294118, 1, 1,
0.1775214, -0.5848769, 2.697452, 0, 0.7254902, 1, 1,
0.1835898, 1.005223, 2.531911, 0, 0.7176471, 1, 1,
0.1840653, -2.059824, 0.712687, 0, 0.7137255, 1, 1,
0.1846291, -0.3839591, 1.413096, 0, 0.7058824, 1, 1,
0.1861492, -1.960984, 4.161903, 0, 0.6980392, 1, 1,
0.1888773, -2.734428, 2.359242, 0, 0.6941177, 1, 1,
0.1900366, 0.9568734, -0.3674253, 0, 0.6862745, 1, 1,
0.1906737, 0.7109228, -1.437801, 0, 0.682353, 1, 1,
0.1909475, -0.6638649, 4.773229, 0, 0.6745098, 1, 1,
0.1919001, 0.8305597, -0.4624124, 0, 0.6705883, 1, 1,
0.1946558, -0.0644962, 4.472952, 0, 0.6627451, 1, 1,
0.1955637, -1.268626, 0.9231535, 0, 0.6588235, 1, 1,
0.1981207, -0.5376468, 2.0999, 0, 0.6509804, 1, 1,
0.2023882, 0.7232634, -0.5761358, 0, 0.6470588, 1, 1,
0.2039679, -0.858364, 2.759866, 0, 0.6392157, 1, 1,
0.2040272, 0.241743, 1.51102, 0, 0.6352941, 1, 1,
0.2040321, -0.2210661, 1.692129, 0, 0.627451, 1, 1,
0.2058638, -0.374056, 2.082576, 0, 0.6235294, 1, 1,
0.2064675, 0.9879615, -0.1623166, 0, 0.6156863, 1, 1,
0.2129488, -0.07560114, 2.549981, 0, 0.6117647, 1, 1,
0.2130562, 0.1907458, -0.7614223, 0, 0.6039216, 1, 1,
0.2159704, -1.703311, 3.580107, 0, 0.5960785, 1, 1,
0.2174211, -0.3395, 4.324889, 0, 0.5921569, 1, 1,
0.2192134, 0.9666767, -1.489484, 0, 0.5843138, 1, 1,
0.2215589, -0.1674189, 1.647647, 0, 0.5803922, 1, 1,
0.2218847, -0.02208437, 0.6969904, 0, 0.572549, 1, 1,
0.2238121, 2.084779, 1.835299, 0, 0.5686275, 1, 1,
0.2258509, 1.483613, -0.9182191, 0, 0.5607843, 1, 1,
0.2285671, -0.768117, 1.725461, 0, 0.5568628, 1, 1,
0.2371207, -0.8915739, 4.034127, 0, 0.5490196, 1, 1,
0.2372723, 0.7155934, -0.6953492, 0, 0.5450981, 1, 1,
0.240669, 0.1618523, 0.6429294, 0, 0.5372549, 1, 1,
0.2408116, -0.152243, 2.493129, 0, 0.5333334, 1, 1,
0.2419237, -0.7089339, 4.562194, 0, 0.5254902, 1, 1,
0.2441725, 0.9273204, -0.5228826, 0, 0.5215687, 1, 1,
0.2461459, 1.64424, 0.4675741, 0, 0.5137255, 1, 1,
0.2505692, 0.7232487, 1.313436, 0, 0.509804, 1, 1,
0.2518364, -1.726742, 4.446117, 0, 0.5019608, 1, 1,
0.2546505, -1.828569, 2.094541, 0, 0.4941176, 1, 1,
0.2551048, 1.459198, -0.3790195, 0, 0.4901961, 1, 1,
0.255278, -0.10616, 3.125432, 0, 0.4823529, 1, 1,
0.2561271, 0.539898, 0.682249, 0, 0.4784314, 1, 1,
0.2582723, -2.315441, 3.731221, 0, 0.4705882, 1, 1,
0.2585098, 1.837123, -1.621107, 0, 0.4666667, 1, 1,
0.2680658, 0.7724836, 1.999907, 0, 0.4588235, 1, 1,
0.2681607, -1.896099, 1.400709, 0, 0.454902, 1, 1,
0.2723353, 0.5951521, -0.1278651, 0, 0.4470588, 1, 1,
0.2810426, -0.05383172, 2.269938, 0, 0.4431373, 1, 1,
0.2812214, -0.9943234, 3.405547, 0, 0.4352941, 1, 1,
0.2827581, 0.3738134, 0.4959594, 0, 0.4313726, 1, 1,
0.2855294, -0.3227566, 3.004804, 0, 0.4235294, 1, 1,
0.2865914, 1.563331, -1.204936, 0, 0.4196078, 1, 1,
0.2905279, 0.7183746, 0.6605176, 0, 0.4117647, 1, 1,
0.2920189, 1.985886, -1.138215, 0, 0.4078431, 1, 1,
0.2922092, -0.577954, 2.137575, 0, 0.4, 1, 1,
0.2951925, 1.108905, 0.2590768, 0, 0.3921569, 1, 1,
0.2955021, 0.9299688, 0.6463366, 0, 0.3882353, 1, 1,
0.3030131, 0.8056062, -0.1654989, 0, 0.3803922, 1, 1,
0.3054076, 2.373587, 0.192886, 0, 0.3764706, 1, 1,
0.3071235, -0.5747595, 2.139793, 0, 0.3686275, 1, 1,
0.307328, -0.6343588, 1.189772, 0, 0.3647059, 1, 1,
0.3093903, 0.8146875, -0.2738461, 0, 0.3568628, 1, 1,
0.3124368, -1.224032, 4.192266, 0, 0.3529412, 1, 1,
0.3139387, 0.5120775, 0.3047068, 0, 0.345098, 1, 1,
0.3152885, -0.5265002, 1.090551, 0, 0.3411765, 1, 1,
0.3158692, 0.02340963, 1.157661, 0, 0.3333333, 1, 1,
0.3165049, -0.06826889, 2.618367, 0, 0.3294118, 1, 1,
0.318434, 1.079886, 0.9427274, 0, 0.3215686, 1, 1,
0.3193446, 0.1617562, 1.811015, 0, 0.3176471, 1, 1,
0.3219409, -0.1795036, 3.592354, 0, 0.3098039, 1, 1,
0.3231294, -1.003572, 2.60012, 0, 0.3058824, 1, 1,
0.3236866, 1.865935, 0.8453553, 0, 0.2980392, 1, 1,
0.3246283, -1.2799, 4.011764, 0, 0.2901961, 1, 1,
0.3268731, 0.03634268, 0.2647471, 0, 0.2862745, 1, 1,
0.3293714, 0.2946073, 1.630116, 0, 0.2784314, 1, 1,
0.3299111, 0.7559981, 0.9735594, 0, 0.2745098, 1, 1,
0.3370358, 0.9951513, 0.215085, 0, 0.2666667, 1, 1,
0.3402451, -0.01386847, 1.784285, 0, 0.2627451, 1, 1,
0.3414647, -0.7027162, 3.412749, 0, 0.254902, 1, 1,
0.3447152, -0.1574422, 2.104224, 0, 0.2509804, 1, 1,
0.3486971, 1.00617, 0.1887358, 0, 0.2431373, 1, 1,
0.3512034, -0.7256362, 2.582164, 0, 0.2392157, 1, 1,
0.3516379, -1.113772, 3.788079, 0, 0.2313726, 1, 1,
0.3582685, -2.04912, 3.652445, 0, 0.227451, 1, 1,
0.3583048, -0.3621943, 4.215749, 0, 0.2196078, 1, 1,
0.35864, 0.7670259, -0.02564468, 0, 0.2156863, 1, 1,
0.3593664, -0.007529062, 2.109416, 0, 0.2078431, 1, 1,
0.3623793, -0.3390127, 3.653876, 0, 0.2039216, 1, 1,
0.3671002, 1.154644, 1.23214, 0, 0.1960784, 1, 1,
0.3685339, 0.6506325, 0.8892764, 0, 0.1882353, 1, 1,
0.371016, 0.7574976, -1.481128, 0, 0.1843137, 1, 1,
0.3720778, -0.9826596, 2.63487, 0, 0.1764706, 1, 1,
0.3790435, 0.871747, -0.7445576, 0, 0.172549, 1, 1,
0.3808002, 1.625412, 0.1422735, 0, 0.1647059, 1, 1,
0.3808058, -0.2449843, 1.84636, 0, 0.1607843, 1, 1,
0.3897487, 0.8952141, 2.215437, 0, 0.1529412, 1, 1,
0.3919303, -0.9503354, 1.742907, 0, 0.1490196, 1, 1,
0.3928912, -0.6629996, 2.55242, 0, 0.1411765, 1, 1,
0.3935661, 1.426113, 0.4328513, 0, 0.1372549, 1, 1,
0.396601, -0.4256455, 2.374277, 0, 0.1294118, 1, 1,
0.3970973, 0.2258202, 0.9679999, 0, 0.1254902, 1, 1,
0.3974887, -2.091137, 0.8269508, 0, 0.1176471, 1, 1,
0.398302, 0.6853424, 0.8162988, 0, 0.1137255, 1, 1,
0.4024227, -0.4493309, 0.6023354, 0, 0.1058824, 1, 1,
0.4059796, 0.59127, -0.1622512, 0, 0.09803922, 1, 1,
0.4066463, 0.9829335, 2.343066, 0, 0.09411765, 1, 1,
0.422504, -0.8222416, 3.110309, 0, 0.08627451, 1, 1,
0.4226609, 0.1614387, 0.7236485, 0, 0.08235294, 1, 1,
0.4232628, -2.70849, 3.800906, 0, 0.07450981, 1, 1,
0.4266491, 0.1320893, 0.5509666, 0, 0.07058824, 1, 1,
0.4292707, 0.5954906, -0.9707644, 0, 0.0627451, 1, 1,
0.4318162, -0.5166786, 4.479884, 0, 0.05882353, 1, 1,
0.4392568, -1.471382, 3.175853, 0, 0.05098039, 1, 1,
0.4405448, -1.055566, 2.845864, 0, 0.04705882, 1, 1,
0.4409699, -1.093769, 2.180109, 0, 0.03921569, 1, 1,
0.4459603, 0.5166993, -0.260103, 0, 0.03529412, 1, 1,
0.4523259, 1.12717, 1.190246, 0, 0.02745098, 1, 1,
0.4562809, -0.6297624, 2.336091, 0, 0.02352941, 1, 1,
0.4583854, -0.5153006, 2.204258, 0, 0.01568628, 1, 1,
0.4602513, -0.7887087, 2.683969, 0, 0.01176471, 1, 1,
0.4679382, 0.1296206, 0.70259, 0, 0.003921569, 1, 1,
0.4684107, 1.011071, -0.4006235, 0.003921569, 0, 1, 1,
0.4692656, 1.162138, 2.532063, 0.007843138, 0, 1, 1,
0.4771125, -1.176051, 2.574294, 0.01568628, 0, 1, 1,
0.4804098, -0.9828256, 2.009203, 0.01960784, 0, 1, 1,
0.4834585, 0.9496855, 0.7307005, 0.02745098, 0, 1, 1,
0.4848612, -0.4604713, 2.936069, 0.03137255, 0, 1, 1,
0.4866549, 1.118587, 0.27595, 0.03921569, 0, 1, 1,
0.4896124, 0.7652255, 0.436269, 0.04313726, 0, 1, 1,
0.4933304, 0.5038401, 1.081747, 0.05098039, 0, 1, 1,
0.4946263, 0.145757, 3.805313, 0.05490196, 0, 1, 1,
0.4988289, 0.4378419, 0.7424693, 0.0627451, 0, 1, 1,
0.5009027, -0.1690767, 1.842385, 0.06666667, 0, 1, 1,
0.5045099, -0.08962272, 1.439075, 0.07450981, 0, 1, 1,
0.5082365, -1.111395, 3.353521, 0.07843138, 0, 1, 1,
0.5093488, -0.6630388, 1.681335, 0.08627451, 0, 1, 1,
0.5103197, 1.769077, -0.9230174, 0.09019608, 0, 1, 1,
0.5129155, 1.249666, 0.3556137, 0.09803922, 0, 1, 1,
0.5146475, 0.3442484, 1.244602, 0.1058824, 0, 1, 1,
0.5168525, 0.1790759, -0.3038243, 0.1098039, 0, 1, 1,
0.518175, -0.474147, 2.202916, 0.1176471, 0, 1, 1,
0.5215296, 3.180648, 1.846953, 0.1215686, 0, 1, 1,
0.5231069, -0.4880033, 2.990662, 0.1294118, 0, 1, 1,
0.5285674, 1.264005, 0.9602212, 0.1333333, 0, 1, 1,
0.5319864, -2.665626, 3.023447, 0.1411765, 0, 1, 1,
0.5373849, 0.7377672, -0.1635595, 0.145098, 0, 1, 1,
0.5384317, -0.4488527, 1.01239, 0.1529412, 0, 1, 1,
0.5389522, -0.8366302, 3.615058, 0.1568628, 0, 1, 1,
0.5406842, -0.4617779, 2.266798, 0.1647059, 0, 1, 1,
0.5429932, 0.4231806, -0.7855206, 0.1686275, 0, 1, 1,
0.5469331, -0.4644713, 2.461106, 0.1764706, 0, 1, 1,
0.5505411, -0.7458058, 2.533612, 0.1803922, 0, 1, 1,
0.552709, 3.191201, -1.455094, 0.1882353, 0, 1, 1,
0.5543903, -0.0003463913, 2.452937, 0.1921569, 0, 1, 1,
0.5569576, 1.991854, 1.267676, 0.2, 0, 1, 1,
0.5587537, -1.386253, 2.032569, 0.2078431, 0, 1, 1,
0.5625383, -0.5844508, 3.983554, 0.2117647, 0, 1, 1,
0.5636896, 0.5111259, 1.174905, 0.2196078, 0, 1, 1,
0.5656688, 1.116556, -0.6167539, 0.2235294, 0, 1, 1,
0.5663192, -1.192468, 2.01535, 0.2313726, 0, 1, 1,
0.5679048, 0.4808641, 1.00636, 0.2352941, 0, 1, 1,
0.5701705, 0.9926546, -0.2651984, 0.2431373, 0, 1, 1,
0.5715601, 0.8422126, 0.2064119, 0.2470588, 0, 1, 1,
0.5777335, -0.06764428, 2.312118, 0.254902, 0, 1, 1,
0.5780785, -0.3800769, 2.169078, 0.2588235, 0, 1, 1,
0.5787434, 0.5994454, 0.1079258, 0.2666667, 0, 1, 1,
0.5801365, -1.55262, 1.409238, 0.2705882, 0, 1, 1,
0.5826645, -0.8634697, 3.868018, 0.2784314, 0, 1, 1,
0.5858575, -2.706518, 2.517691, 0.282353, 0, 1, 1,
0.594429, -2.069631, 2.609913, 0.2901961, 0, 1, 1,
0.5998616, -0.06158651, 2.883856, 0.2941177, 0, 1, 1,
0.6018075, -1.806524, 1.651494, 0.3019608, 0, 1, 1,
0.6071583, 0.3393865, -0.9624792, 0.3098039, 0, 1, 1,
0.6085278, 0.2380646, 1.13043, 0.3137255, 0, 1, 1,
0.6089686, -0.08767106, 1.99894, 0.3215686, 0, 1, 1,
0.6091487, 0.4647418, -0.4203293, 0.3254902, 0, 1, 1,
0.6183164, -0.6858791, 3.772231, 0.3333333, 0, 1, 1,
0.6199236, 0.5380261, 0.4921219, 0.3372549, 0, 1, 1,
0.6223586, 0.06330478, 1.175438, 0.345098, 0, 1, 1,
0.6259874, 0.07863453, 0.7616146, 0.3490196, 0, 1, 1,
0.6310923, 1.105984, 1.1344, 0.3568628, 0, 1, 1,
0.6323622, -0.5247541, 2.380596, 0.3607843, 0, 1, 1,
0.6346586, -1.128649, 3.28332, 0.3686275, 0, 1, 1,
0.6426962, 0.0617722, 4.251737, 0.372549, 0, 1, 1,
0.6433927, -0.07414094, 2.426931, 0.3803922, 0, 1, 1,
0.6504003, -1.716001, 2.273161, 0.3843137, 0, 1, 1,
0.6548855, -1.062034, 2.702161, 0.3921569, 0, 1, 1,
0.6565403, 0.4845172, 0.5379606, 0.3960784, 0, 1, 1,
0.6613054, 0.4667508, -0.0935458, 0.4039216, 0, 1, 1,
0.672043, -1.479689, 3.178763, 0.4117647, 0, 1, 1,
0.67413, -2.682832, 3.094943, 0.4156863, 0, 1, 1,
0.6800273, 0.3580205, 1.796893, 0.4235294, 0, 1, 1,
0.681528, -0.4652099, 3.023103, 0.427451, 0, 1, 1,
0.6861208, 0.6991934, 1.804084, 0.4352941, 0, 1, 1,
0.6993334, -0.22451, 3.608723, 0.4392157, 0, 1, 1,
0.7005183, -0.5958227, 1.255251, 0.4470588, 0, 1, 1,
0.7024684, -0.2591198, 3.617081, 0.4509804, 0, 1, 1,
0.7048325, -2.211628, 1.248197, 0.4588235, 0, 1, 1,
0.7052071, -0.9740041, 2.262945, 0.4627451, 0, 1, 1,
0.7066621, -1.652651, 1.834005, 0.4705882, 0, 1, 1,
0.7084785, -0.6213372, 2.371552, 0.4745098, 0, 1, 1,
0.7090024, -1.114555, 3.270468, 0.4823529, 0, 1, 1,
0.7099689, 2.427974, 0.78254, 0.4862745, 0, 1, 1,
0.7150369, 0.8308469, 1.165814, 0.4941176, 0, 1, 1,
0.7175545, 1.139411, 1.020776, 0.5019608, 0, 1, 1,
0.7225275, -1.559349, 0.514618, 0.5058824, 0, 1, 1,
0.7226881, -1.367991, 2.946039, 0.5137255, 0, 1, 1,
0.7232006, 0.1920787, 1.471318, 0.5176471, 0, 1, 1,
0.7243073, -0.6100568, 2.875683, 0.5254902, 0, 1, 1,
0.7250879, -0.1917632, 0.7878777, 0.5294118, 0, 1, 1,
0.7291712, 1.889819, 0.5593259, 0.5372549, 0, 1, 1,
0.7293835, -1.084975, 0.9794182, 0.5411765, 0, 1, 1,
0.7365843, -0.5554309, 2.036474, 0.5490196, 0, 1, 1,
0.7374315, 0.4330286, 1.289238, 0.5529412, 0, 1, 1,
0.7421908, 0.6548256, 0.1742941, 0.5607843, 0, 1, 1,
0.7464025, 1.039269, 1.01192, 0.5647059, 0, 1, 1,
0.75003, -0.6905907, 3.560213, 0.572549, 0, 1, 1,
0.7528492, -0.05061077, 1.373845, 0.5764706, 0, 1, 1,
0.7554998, -2.012608, 1.171474, 0.5843138, 0, 1, 1,
0.7651538, -0.4042485, 2.271968, 0.5882353, 0, 1, 1,
0.7721498, 0.2737171, 1.181412, 0.5960785, 0, 1, 1,
0.7873452, -1.132989, 2.569994, 0.6039216, 0, 1, 1,
0.7885404, -0.1689514, 2.068412, 0.6078432, 0, 1, 1,
0.7889822, 1.664912, 0.09412844, 0.6156863, 0, 1, 1,
0.7893195, -0.5908891, 0.8802025, 0.6196079, 0, 1, 1,
0.7912639, 2.881585, -1.676606, 0.627451, 0, 1, 1,
0.7985382, -1.114656, 2.007072, 0.6313726, 0, 1, 1,
0.7986443, 0.9603136, -0.03109905, 0.6392157, 0, 1, 1,
0.8017604, -0.004784518, 3.095649, 0.6431373, 0, 1, 1,
0.8050724, -0.8229405, 4.099845, 0.6509804, 0, 1, 1,
0.8108525, 0.9212179, -0.5213797, 0.654902, 0, 1, 1,
0.8117394, 0.1499297, 1.427981, 0.6627451, 0, 1, 1,
0.8141884, 1.675368, 0.5604479, 0.6666667, 0, 1, 1,
0.8184144, -0.8702416, 3.659082, 0.6745098, 0, 1, 1,
0.8219338, -1.08665, 1.450934, 0.6784314, 0, 1, 1,
0.8242117, 0.3467299, 2.580957, 0.6862745, 0, 1, 1,
0.825247, 0.4642598, 0.1390332, 0.6901961, 0, 1, 1,
0.8305776, -1.572634, 3.008249, 0.6980392, 0, 1, 1,
0.8342795, -1.172886, 3.3116, 0.7058824, 0, 1, 1,
0.8364938, -0.1863851, 2.526972, 0.7098039, 0, 1, 1,
0.8389509, -0.2028464, 2.046876, 0.7176471, 0, 1, 1,
0.8405335, 0.001500202, 0.7670792, 0.7215686, 0, 1, 1,
0.8460034, 0.2017379, 1.885224, 0.7294118, 0, 1, 1,
0.8465277, 0.4419605, 0.6947792, 0.7333333, 0, 1, 1,
0.8494145, 0.8602304, 2.669839, 0.7411765, 0, 1, 1,
0.8527221, -0.1966096, 0.1649727, 0.7450981, 0, 1, 1,
0.8539911, 0.6831031, 1.777345, 0.7529412, 0, 1, 1,
0.8542075, 0.8750748, 0.3104731, 0.7568628, 0, 1, 1,
0.8679457, 1.099289, 0.5444294, 0.7647059, 0, 1, 1,
0.8688324, 0.9264187, -0.1112366, 0.7686275, 0, 1, 1,
0.8713081, -1.171057, 0.8594787, 0.7764706, 0, 1, 1,
0.8744045, 1.538575, 1.952476, 0.7803922, 0, 1, 1,
0.8813747, -0.6073703, 1.973701, 0.7882353, 0, 1, 1,
0.8840247, 1.158988, 1.415613, 0.7921569, 0, 1, 1,
0.8860861, -0.6319366, 1.640076, 0.8, 0, 1, 1,
0.887418, -0.6150983, 3.594818, 0.8078431, 0, 1, 1,
0.8896002, 0.9771312, -0.09528621, 0.8117647, 0, 1, 1,
0.8923445, 0.1351481, 0.9534858, 0.8196079, 0, 1, 1,
0.8933613, -0.1686253, 0.4301946, 0.8235294, 0, 1, 1,
0.8985112, -1.680457, 2.374376, 0.8313726, 0, 1, 1,
0.9020913, 0.1400759, 0.121651, 0.8352941, 0, 1, 1,
0.9053239, 0.6371754, -0.0971738, 0.8431373, 0, 1, 1,
0.9065576, 0.492211, 2.200591, 0.8470588, 0, 1, 1,
0.9084733, 0.01855262, 1.501308, 0.854902, 0, 1, 1,
0.9113721, 0.8711687, 1.555797, 0.8588235, 0, 1, 1,
0.9114275, 0.4730035, 0.5428118, 0.8666667, 0, 1, 1,
0.9126943, 1.683122, 2.605203, 0.8705882, 0, 1, 1,
0.9128168, -1.792578, 3.394419, 0.8784314, 0, 1, 1,
0.9148518, 0.03133147, 2.903933, 0.8823529, 0, 1, 1,
0.9164342, -1.172647, 0.8671221, 0.8901961, 0, 1, 1,
0.9200175, -2.086246, 4.54391, 0.8941177, 0, 1, 1,
0.9242625, -0.5053232, 1.890941, 0.9019608, 0, 1, 1,
0.9267482, -0.04764391, 1.652996, 0.9098039, 0, 1, 1,
0.9488119, 1.183412, 0.1925238, 0.9137255, 0, 1, 1,
0.9494799, 2.452582, -0.515455, 0.9215686, 0, 1, 1,
0.9535896, -0.007164809, 1.625176, 0.9254902, 0, 1, 1,
0.9546268, 1.072138, 0.6935452, 0.9333333, 0, 1, 1,
0.9730632, 0.3263087, 1.834036, 0.9372549, 0, 1, 1,
0.973379, -0.09642859, 2.4577, 0.945098, 0, 1, 1,
0.9757742, 0.1424857, 1.107035, 0.9490196, 0, 1, 1,
0.9773329, -0.03405691, 0.1226874, 0.9568627, 0, 1, 1,
0.9809616, 0.4020198, 0.1912466, 0.9607843, 0, 1, 1,
0.9873428, 0.702296, 0.7644763, 0.9686275, 0, 1, 1,
0.9889582, 0.06080079, 0.01454567, 0.972549, 0, 1, 1,
0.9910659, 1.195526, 1.900791, 0.9803922, 0, 1, 1,
1.003722, 0.07732348, 0.7634509, 0.9843137, 0, 1, 1,
1.004852, 0.6832392, 0.5206473, 0.9921569, 0, 1, 1,
1.007791, -1.306212, 3.66637, 0.9960784, 0, 1, 1,
1.007995, -0.4885068, 2.763814, 1, 0, 0.9960784, 1,
1.008344, 0.4276871, 2.753112, 1, 0, 0.9882353, 1,
1.010751, 0.4448253, -0.03584924, 1, 0, 0.9843137, 1,
1.019988, -0.2450741, 1.436906, 1, 0, 0.9764706, 1,
1.02075, 0.05663003, 0.6070576, 1, 0, 0.972549, 1,
1.02348, 1.400118, 2.086256, 1, 0, 0.9647059, 1,
1.023978, -1.431761, 1.087456, 1, 0, 0.9607843, 1,
1.02504, -1.725865, 2.660138, 1, 0, 0.9529412, 1,
1.026652, -0.1080899, 1.454698, 1, 0, 0.9490196, 1,
1.028575, -0.1891052, 0.9168884, 1, 0, 0.9411765, 1,
1.043131, -1.28273, 1.168311, 1, 0, 0.9372549, 1,
1.043885, 0.02130529, 1.058151, 1, 0, 0.9294118, 1,
1.046575, 0.3172265, 2.254293, 1, 0, 0.9254902, 1,
1.056959, -0.1188171, 1.761178, 1, 0, 0.9176471, 1,
1.057277, 1.19489, 0.5768407, 1, 0, 0.9137255, 1,
1.060714, 0.6174403, 1.010922, 1, 0, 0.9058824, 1,
1.06189, 0.5702738, 3.160288, 1, 0, 0.9019608, 1,
1.072073, 0.4590529, 2.531524, 1, 0, 0.8941177, 1,
1.074216, -0.4905028, 2.221887, 1, 0, 0.8862745, 1,
1.078741, 0.2905124, 2.569737, 1, 0, 0.8823529, 1,
1.079793, -1.530929, 3.898319, 1, 0, 0.8745098, 1,
1.083121, 1.076365, 1.372877, 1, 0, 0.8705882, 1,
1.083983, -0.326166, 1.914365, 1, 0, 0.8627451, 1,
1.08644, -3.479561, 3.104933, 1, 0, 0.8588235, 1,
1.094723, -0.1078165, 0.0243865, 1, 0, 0.8509804, 1,
1.105881, 0.3570642, 1.729453, 1, 0, 0.8470588, 1,
1.116687, 0.4604469, 0.4563968, 1, 0, 0.8392157, 1,
1.121179, 1.626945, 0.9213538, 1, 0, 0.8352941, 1,
1.121314, 0.07415871, 0.01483171, 1, 0, 0.827451, 1,
1.123621, -0.0866323, 2.610308, 1, 0, 0.8235294, 1,
1.125895, -0.5499817, 2.362875, 1, 0, 0.8156863, 1,
1.14196, 0.09413689, 2.203796, 1, 0, 0.8117647, 1,
1.142943, 0.2143959, 1.80819, 1, 0, 0.8039216, 1,
1.148734, 1.242621, 0.581714, 1, 0, 0.7960784, 1,
1.149073, -1.102422, 4.494412, 1, 0, 0.7921569, 1,
1.150063, -0.1873197, 1.834851, 1, 0, 0.7843137, 1,
1.172611, 0.8783978, 2.045692, 1, 0, 0.7803922, 1,
1.176697, 0.9129514, -0.3819507, 1, 0, 0.772549, 1,
1.180227, 0.7509831, 2.898934, 1, 0, 0.7686275, 1,
1.183011, -1.329686, 3.531871, 1, 0, 0.7607843, 1,
1.186028, 0.7033474, 1.893384, 1, 0, 0.7568628, 1,
1.187237, 1.756006, 1.40277, 1, 0, 0.7490196, 1,
1.187787, 0.2595692, 2.042125, 1, 0, 0.7450981, 1,
1.205619, 0.5774727, 0.5377769, 1, 0, 0.7372549, 1,
1.207252, -0.143374, 2.339228, 1, 0, 0.7333333, 1,
1.209708, 0.02311468, 1.146777, 1, 0, 0.7254902, 1,
1.214146, 0.01827826, -0.2220078, 1, 0, 0.7215686, 1,
1.214484, 0.1900589, 1.554395, 1, 0, 0.7137255, 1,
1.215735, 3.562445, 1.871768, 1, 0, 0.7098039, 1,
1.224016, -0.9676099, 1.266738, 1, 0, 0.7019608, 1,
1.226594, -0.3469046, 2.746556, 1, 0, 0.6941177, 1,
1.226714, 1.540626, 1.704943, 1, 0, 0.6901961, 1,
1.227478, -0.4048352, 2.343821, 1, 0, 0.682353, 1,
1.230506, -0.4565021, 3.584594, 1, 0, 0.6784314, 1,
1.23881, 0.3802804, 0.6670001, 1, 0, 0.6705883, 1,
1.242185, -2.264721, 1.722317, 1, 0, 0.6666667, 1,
1.242741, -0.5568633, 1.025671, 1, 0, 0.6588235, 1,
1.263185, -1.024992, 2.648571, 1, 0, 0.654902, 1,
1.275247, -0.07885985, 3.196461, 1, 0, 0.6470588, 1,
1.279344, 0.1107628, 1.642476, 1, 0, 0.6431373, 1,
1.287612, -0.1100563, 2.96985, 1, 0, 0.6352941, 1,
1.292178, 1.034699, -0.4568383, 1, 0, 0.6313726, 1,
1.294261, -0.2736128, 1.91877, 1, 0, 0.6235294, 1,
1.322074, 1.788507, -0.4388537, 1, 0, 0.6196079, 1,
1.326663, 1.898944, 0.2085439, 1, 0, 0.6117647, 1,
1.33148, 0.1771533, 2.459284, 1, 0, 0.6078432, 1,
1.331961, 0.4492585, 1.364044, 1, 0, 0.6, 1,
1.339905, -0.6125023, 1.696918, 1, 0, 0.5921569, 1,
1.346217, -0.488919, 1.251979, 1, 0, 0.5882353, 1,
1.355013, 0.2722922, 1.458523, 1, 0, 0.5803922, 1,
1.385787, 1.746824, 0.5474101, 1, 0, 0.5764706, 1,
1.386556, 0.162247, -1.033184, 1, 0, 0.5686275, 1,
1.390725, -0.7970255, 2.503546, 1, 0, 0.5647059, 1,
1.395679, -0.4997476, 2.104405, 1, 0, 0.5568628, 1,
1.396566, 0.3203581, 3.357325, 1, 0, 0.5529412, 1,
1.401348, -0.02097271, 1.988065, 1, 0, 0.5450981, 1,
1.408713, 1.373053, -0.2530922, 1, 0, 0.5411765, 1,
1.415371, -0.8291792, 3.050436, 1, 0, 0.5333334, 1,
1.424237, -0.4715633, 2.099916, 1, 0, 0.5294118, 1,
1.425224, 1.258123, 0.7011215, 1, 0, 0.5215687, 1,
1.426, 0.04400331, 0.1088795, 1, 0, 0.5176471, 1,
1.439208, -0.8364614, 2.615288, 1, 0, 0.509804, 1,
1.43978, 1.535856, 2.387119, 1, 0, 0.5058824, 1,
1.442499, -1.351148, 1.480824, 1, 0, 0.4980392, 1,
1.457377, 1.500455, 1.349961, 1, 0, 0.4901961, 1,
1.470016, 1.393631, 1.085734, 1, 0, 0.4862745, 1,
1.476439, 1.456562, -0.2547016, 1, 0, 0.4784314, 1,
1.478509, -1.020046, 1.747544, 1, 0, 0.4745098, 1,
1.482201, 0.3688204, 2.909708, 1, 0, 0.4666667, 1,
1.484954, -0.3276505, 1.412043, 1, 0, 0.4627451, 1,
1.496739, -0.8358418, 1.213296, 1, 0, 0.454902, 1,
1.540851, -0.3260476, 1.336824, 1, 0, 0.4509804, 1,
1.543542, 0.648527, 0.5922813, 1, 0, 0.4431373, 1,
1.550784, 0.7434945, 2.311038, 1, 0, 0.4392157, 1,
1.558241, -1.507566, 0.8104588, 1, 0, 0.4313726, 1,
1.560041, 1.172742, 1.61382, 1, 0, 0.427451, 1,
1.562384, -1.002624, 2.544118, 1, 0, 0.4196078, 1,
1.563367, 1.540918, 2.039154, 1, 0, 0.4156863, 1,
1.565837, -0.7890072, 1.926398, 1, 0, 0.4078431, 1,
1.568195, -1.15137, 1.71415, 1, 0, 0.4039216, 1,
1.607524, -0.2902252, 2.372272, 1, 0, 0.3960784, 1,
1.610611, -0.8017139, 3.317311, 1, 0, 0.3882353, 1,
1.616048, -0.8154606, 2.188629, 1, 0, 0.3843137, 1,
1.622399, 0.7880774, 0.7658975, 1, 0, 0.3764706, 1,
1.624005, 0.3335592, 0.8938572, 1, 0, 0.372549, 1,
1.626833, 0.2653951, 1.14075, 1, 0, 0.3647059, 1,
1.647827, 0.1972601, 1.660655, 1, 0, 0.3607843, 1,
1.65295, -1.489513, 2.210048, 1, 0, 0.3529412, 1,
1.676929, 0.4701239, 0.01933903, 1, 0, 0.3490196, 1,
1.689996, -0.06177257, 2.167106, 1, 0, 0.3411765, 1,
1.700513, 0.4197357, 1.731482, 1, 0, 0.3372549, 1,
1.722452, -0.6594379, 1.653314, 1, 0, 0.3294118, 1,
1.762254, 1.410829, 0.09326929, 1, 0, 0.3254902, 1,
1.766873, 0.4541892, 1.874729, 1, 0, 0.3176471, 1,
1.768142, -1.141577, 1.218109, 1, 0, 0.3137255, 1,
1.769906, -0.2666093, 2.815944, 1, 0, 0.3058824, 1,
1.772237, -0.4971467, 1.985908, 1, 0, 0.2980392, 1,
1.797854, -1.25112, 1.710693, 1, 0, 0.2941177, 1,
1.79814, 0.4830574, 1.312857, 1, 0, 0.2862745, 1,
1.801915, 2.699754, 0.5648221, 1, 0, 0.282353, 1,
1.803261, 2.61265, -0.7301863, 1, 0, 0.2745098, 1,
1.806512, 1.406985, -0.6684742, 1, 0, 0.2705882, 1,
1.823416, 0.5673528, 1.636704, 1, 0, 0.2627451, 1,
1.854829, -0.3942009, 1.60075, 1, 0, 0.2588235, 1,
1.860663, -0.6174762, 3.470566, 1, 0, 0.2509804, 1,
1.875962, -1.481556, 2.792309, 1, 0, 0.2470588, 1,
1.904208, 1.528389, 0.1829741, 1, 0, 0.2392157, 1,
1.906278, 0.7399571, 1.998801, 1, 0, 0.2352941, 1,
1.908376, 2.062947, 1.25812, 1, 0, 0.227451, 1,
1.908642, 0.3461963, 2.564967, 1, 0, 0.2235294, 1,
1.925016, -0.9008688, 1.699249, 1, 0, 0.2156863, 1,
1.948249, 0.2484879, 2.12032, 1, 0, 0.2117647, 1,
1.958516, 0.209842, 1.46548, 1, 0, 0.2039216, 1,
1.965554, 0.4100124, 1.5343, 1, 0, 0.1960784, 1,
1.967229, 1.321506, 1.166553, 1, 0, 0.1921569, 1,
2.000491, -1.006681, 2.108382, 1, 0, 0.1843137, 1,
2.065806, 1.803222, 2.024804, 1, 0, 0.1803922, 1,
2.109718, 0.4350891, 1.054637, 1, 0, 0.172549, 1,
2.131601, -1.337066, 3.369891, 1, 0, 0.1686275, 1,
2.15485, -0.01837581, 1.717007, 1, 0, 0.1607843, 1,
2.175874, 1.381375, 0.3225587, 1, 0, 0.1568628, 1,
2.219134, -0.5458989, 0.9812967, 1, 0, 0.1490196, 1,
2.222279, -1.097973, 1.410185, 1, 0, 0.145098, 1,
2.230993, -0.1160558, 1.003367, 1, 0, 0.1372549, 1,
2.243803, -0.1691249, 2.273178, 1, 0, 0.1333333, 1,
2.294936, -0.1591316, 0.6309415, 1, 0, 0.1254902, 1,
2.315918, -0.7371973, 0.01048098, 1, 0, 0.1215686, 1,
2.329308, 1.650305, 2.189042, 1, 0, 0.1137255, 1,
2.341736, -0.7584421, 2.250486, 1, 0, 0.1098039, 1,
2.364973, 0.008020995, 1.336656, 1, 0, 0.1019608, 1,
2.371181, -0.26429, 3.214069, 1, 0, 0.09411765, 1,
2.429639, -0.4669244, 1.997025, 1, 0, 0.09019608, 1,
2.440599, -1.077414, 3.296636, 1, 0, 0.08235294, 1,
2.454562, -2.092997, 2.870299, 1, 0, 0.07843138, 1,
2.571021, -0.2137925, 2.839879, 1, 0, 0.07058824, 1,
2.60107, -1.860739, 3.22112, 1, 0, 0.06666667, 1,
2.607809, 2.07196, 0.9548544, 1, 0, 0.05882353, 1,
2.639051, -0.4343835, 2.526489, 1, 0, 0.05490196, 1,
2.64026, 2.252713, 0.9151958, 1, 0, 0.04705882, 1,
2.656214, 0.04662419, 0.5413415, 1, 0, 0.04313726, 1,
2.793285, 0.1427695, 1.438084, 1, 0, 0.03529412, 1,
2.95264, -0.5035687, 3.05497, 1, 0, 0.03137255, 1,
2.972896, 0.6331767, 0.8332217, 1, 0, 0.02352941, 1,
3.007826, 2.426144, 2.68945, 1, 0, 0.01960784, 1,
3.164393, 0.6988138, 0.5434683, 1, 0, 0.01176471, 1,
3.470329, -0.8134109, 1.188224, 1, 0, 0.007843138, 1
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
0.336085, -4.679154, -6.548293, 0, -0.5, 0.5, 0.5,
0.336085, -4.679154, -6.548293, 1, -0.5, 0.5, 0.5,
0.336085, -4.679154, -6.548293, 1, 1.5, 0.5, 0.5,
0.336085, -4.679154, -6.548293, 0, 1.5, 0.5, 0.5
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
-3.860667, 0.03888845, -6.548293, 0, -0.5, 0.5, 0.5,
-3.860667, 0.03888845, -6.548293, 1, -0.5, 0.5, 0.5,
-3.860667, 0.03888845, -6.548293, 1, 1.5, 0.5, 0.5,
-3.860667, 0.03888845, -6.548293, 0, 1.5, 0.5, 0.5
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
-3.860667, -4.679154, 0.1649621, 0, -0.5, 0.5, 0.5,
-3.860667, -4.679154, 0.1649621, 1, -0.5, 0.5, 0.5,
-3.860667, -4.679154, 0.1649621, 1, 1.5, 0.5, 0.5,
-3.860667, -4.679154, 0.1649621, 0, 1.5, 0.5, 0.5
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
-2, -3.590375, -4.99908,
3, -3.590375, -4.99908,
-2, -3.590375, -4.99908,
-2, -3.771838, -5.257282,
-1, -3.590375, -4.99908,
-1, -3.771838, -5.257282,
0, -3.590375, -4.99908,
0, -3.771838, -5.257282,
1, -3.590375, -4.99908,
1, -3.771838, -5.257282,
2, -3.590375, -4.99908,
2, -3.771838, -5.257282,
3, -3.590375, -4.99908,
3, -3.771838, -5.257282
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
-2, -4.134765, -5.773686, 0, -0.5, 0.5, 0.5,
-2, -4.134765, -5.773686, 1, -0.5, 0.5, 0.5,
-2, -4.134765, -5.773686, 1, 1.5, 0.5, 0.5,
-2, -4.134765, -5.773686, 0, 1.5, 0.5, 0.5,
-1, -4.134765, -5.773686, 0, -0.5, 0.5, 0.5,
-1, -4.134765, -5.773686, 1, -0.5, 0.5, 0.5,
-1, -4.134765, -5.773686, 1, 1.5, 0.5, 0.5,
-1, -4.134765, -5.773686, 0, 1.5, 0.5, 0.5,
0, -4.134765, -5.773686, 0, -0.5, 0.5, 0.5,
0, -4.134765, -5.773686, 1, -0.5, 0.5, 0.5,
0, -4.134765, -5.773686, 1, 1.5, 0.5, 0.5,
0, -4.134765, -5.773686, 0, 1.5, 0.5, 0.5,
1, -4.134765, -5.773686, 0, -0.5, 0.5, 0.5,
1, -4.134765, -5.773686, 1, -0.5, 0.5, 0.5,
1, -4.134765, -5.773686, 1, 1.5, 0.5, 0.5,
1, -4.134765, -5.773686, 0, 1.5, 0.5, 0.5,
2, -4.134765, -5.773686, 0, -0.5, 0.5, 0.5,
2, -4.134765, -5.773686, 1, -0.5, 0.5, 0.5,
2, -4.134765, -5.773686, 1, 1.5, 0.5, 0.5,
2, -4.134765, -5.773686, 0, 1.5, 0.5, 0.5,
3, -4.134765, -5.773686, 0, -0.5, 0.5, 0.5,
3, -4.134765, -5.773686, 1, -0.5, 0.5, 0.5,
3, -4.134765, -5.773686, 1, 1.5, 0.5, 0.5,
3, -4.134765, -5.773686, 0, 1.5, 0.5, 0.5
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
-2.892186, -2, -4.99908,
-2.892186, 2, -4.99908,
-2.892186, -2, -4.99908,
-3.0536, -2, -5.257282,
-2.892186, 0, -4.99908,
-3.0536, 0, -5.257282,
-2.892186, 2, -4.99908,
-3.0536, 2, -5.257282
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
-3.376427, -2, -5.773686, 0, -0.5, 0.5, 0.5,
-3.376427, -2, -5.773686, 1, -0.5, 0.5, 0.5,
-3.376427, -2, -5.773686, 1, 1.5, 0.5, 0.5,
-3.376427, -2, -5.773686, 0, 1.5, 0.5, 0.5,
-3.376427, 0, -5.773686, 0, -0.5, 0.5, 0.5,
-3.376427, 0, -5.773686, 1, -0.5, 0.5, 0.5,
-3.376427, 0, -5.773686, 1, 1.5, 0.5, 0.5,
-3.376427, 0, -5.773686, 0, 1.5, 0.5, 0.5,
-3.376427, 2, -5.773686, 0, -0.5, 0.5, 0.5,
-3.376427, 2, -5.773686, 1, -0.5, 0.5, 0.5,
-3.376427, 2, -5.773686, 1, 1.5, 0.5, 0.5,
-3.376427, 2, -5.773686, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-2.892186, -3.590375, -4,
-2.892186, -3.590375, 4,
-2.892186, -3.590375, -4,
-3.0536, -3.771838, -4,
-2.892186, -3.590375, -2,
-3.0536, -3.771838, -2,
-2.892186, -3.590375, 0,
-3.0536, -3.771838, 0,
-2.892186, -3.590375, 2,
-3.0536, -3.771838, 2,
-2.892186, -3.590375, 4,
-3.0536, -3.771838, 4
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
-3.376427, -4.134765, -4, 0, -0.5, 0.5, 0.5,
-3.376427, -4.134765, -4, 1, -0.5, 0.5, 0.5,
-3.376427, -4.134765, -4, 1, 1.5, 0.5, 0.5,
-3.376427, -4.134765, -4, 0, 1.5, 0.5, 0.5,
-3.376427, -4.134765, -2, 0, -0.5, 0.5, 0.5,
-3.376427, -4.134765, -2, 1, -0.5, 0.5, 0.5,
-3.376427, -4.134765, -2, 1, 1.5, 0.5, 0.5,
-3.376427, -4.134765, -2, 0, 1.5, 0.5, 0.5,
-3.376427, -4.134765, 0, 0, -0.5, 0.5, 0.5,
-3.376427, -4.134765, 0, 1, -0.5, 0.5, 0.5,
-3.376427, -4.134765, 0, 1, 1.5, 0.5, 0.5,
-3.376427, -4.134765, 0, 0, 1.5, 0.5, 0.5,
-3.376427, -4.134765, 2, 0, -0.5, 0.5, 0.5,
-3.376427, -4.134765, 2, 1, -0.5, 0.5, 0.5,
-3.376427, -4.134765, 2, 1, 1.5, 0.5, 0.5,
-3.376427, -4.134765, 2, 0, 1.5, 0.5, 0.5,
-3.376427, -4.134765, 4, 0, -0.5, 0.5, 0.5,
-3.376427, -4.134765, 4, 1, -0.5, 0.5, 0.5,
-3.376427, -4.134765, 4, 1, 1.5, 0.5, 0.5,
-3.376427, -4.134765, 4, 0, 1.5, 0.5, 0.5
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
-2.892186, -3.590375, -4.99908,
-2.892186, 3.668152, -4.99908,
-2.892186, -3.590375, 5.329004,
-2.892186, 3.668152, 5.329004,
-2.892186, -3.590375, -4.99908,
-2.892186, -3.590375, 5.329004,
-2.892186, 3.668152, -4.99908,
-2.892186, 3.668152, 5.329004,
-2.892186, -3.590375, -4.99908,
3.564356, -3.590375, -4.99908,
-2.892186, -3.590375, 5.329004,
3.564356, -3.590375, 5.329004,
-2.892186, 3.668152, -4.99908,
3.564356, 3.668152, -4.99908,
-2.892186, 3.668152, 5.329004,
3.564356, 3.668152, 5.329004,
3.564356, -3.590375, -4.99908,
3.564356, 3.668152, -4.99908,
3.564356, -3.590375, 5.329004,
3.564356, 3.668152, 5.329004,
3.564356, -3.590375, -4.99908,
3.564356, -3.590375, 5.329004,
3.564356, 3.668152, -4.99908,
3.564356, 3.668152, 5.329004
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
var radius = 7.571281;
var distance = 33.68549;
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
mvMatrix.translate( -0.336085, -0.03888845, -0.1649621 );
mvMatrix.scale( 1.267895, 1.127807, 0.7926173 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.68549);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Isoniazid<-read.table("Isoniazid.xyz")
```

```
## Error in read.table("Isoniazid.xyz"): no lines available in input
```

```r
x<-Isoniazid$V2
```

```
## Error in eval(expr, envir, enclos): object 'Isoniazid' not found
```

```r
y<-Isoniazid$V3
```

```
## Error in eval(expr, envir, enclos): object 'Isoniazid' not found
```

```r
z<-Isoniazid$V4
```

```
## Error in eval(expr, envir, enclos): object 'Isoniazid' not found
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
-2.798159, -0.02582219, -1.238221, 0, 0, 1, 1, 1,
-2.763592, -1.295696, -2.036376, 1, 0, 0, 1, 1,
-2.755585, -0.8247998, -2.491966, 1, 0, 0, 1, 1,
-2.749571, 0.2365895, -0.89552, 1, 0, 0, 1, 1,
-2.600251, -0.03285126, -0.4780499, 1, 0, 0, 1, 1,
-2.588439, 0.2125939, -0.6969612, 1, 0, 0, 1, 1,
-2.515322, 0.7676293, -0.263173, 0, 0, 0, 1, 1,
-2.334388, 0.5091752, -0.8958293, 0, 0, 0, 1, 1,
-2.333618, -0.5723614, -1.122314, 0, 0, 0, 1, 1,
-2.220355, -0.3686921, -1.672257, 0, 0, 0, 1, 1,
-2.199495, 2.149167, -2.567994, 0, 0, 0, 1, 1,
-2.178609, -1.439228, -2.825027, 0, 0, 0, 1, 1,
-2.148421, 0.4800436, -0.6711198, 0, 0, 0, 1, 1,
-2.10362, 1.937925, -1.111651, 1, 1, 1, 1, 1,
-2.079455, 2.061973, -1.190567, 1, 1, 1, 1, 1,
-2.027093, 0.6481707, -1.593463, 1, 1, 1, 1, 1,
-2.014963, -1.345677, -2.312139, 1, 1, 1, 1, 1,
-2.006153, 1.518933, -1.345138, 1, 1, 1, 1, 1,
-2.001726, -1.034756, -2.091371, 1, 1, 1, 1, 1,
-1.958741, 0.5425078, 0.4865071, 1, 1, 1, 1, 1,
-1.956272, 0.1407827, -1.861068, 1, 1, 1, 1, 1,
-1.951128, -0.3831635, -3.020654, 1, 1, 1, 1, 1,
-1.925892, -0.996384, -2.871442, 1, 1, 1, 1, 1,
-1.925718, -1.429543, -3.483936, 1, 1, 1, 1, 1,
-1.903994, 0.3310086, -0.3400962, 1, 1, 1, 1, 1,
-1.807147, 0.9331888, -0.5666245, 1, 1, 1, 1, 1,
-1.801425, 0.9103717, -0.4211799, 1, 1, 1, 1, 1,
-1.79992, 0.09086638, -0.8686272, 1, 1, 1, 1, 1,
-1.731088, -1.237624, -2.649434, 0, 0, 1, 1, 1,
-1.721503, -0.5478714, -2.837626, 1, 0, 0, 1, 1,
-1.718056, 0.1398118, -2.122172, 1, 0, 0, 1, 1,
-1.714779, 0.6811846, 1.034063, 1, 0, 0, 1, 1,
-1.711942, -1.144951, -4.299928, 1, 0, 0, 1, 1,
-1.707581, -0.2865839, -0.5613709, 1, 0, 0, 1, 1,
-1.707318, -0.7097827, -2.752075, 0, 0, 0, 1, 1,
-1.703243, -0.1425598, -1.490437, 0, 0, 0, 1, 1,
-1.689575, 0.9988722, -2.554051, 0, 0, 0, 1, 1,
-1.674912, 1.779276, -2.429915, 0, 0, 0, 1, 1,
-1.659694, -0.03136591, -1.38467, 0, 0, 0, 1, 1,
-1.643511, -0.2218721, -2.139043, 0, 0, 0, 1, 1,
-1.635689, 1.105585, -2.055332, 0, 0, 0, 1, 1,
-1.6349, 0.4430198, -1.619471, 1, 1, 1, 1, 1,
-1.629417, -1.011081, -4.323599, 1, 1, 1, 1, 1,
-1.610919, 0.2744631, -1.367584, 1, 1, 1, 1, 1,
-1.603101, 0.863015, -1.117428, 1, 1, 1, 1, 1,
-1.598202, 0.439452, -1.521999, 1, 1, 1, 1, 1,
-1.59671, -0.02614658, -2.296384, 1, 1, 1, 1, 1,
-1.530069, -0.3799366, -1.191507, 1, 1, 1, 1, 1,
-1.511941, 0.5004368, -0.9327063, 1, 1, 1, 1, 1,
-1.495741, 0.1665258, -1.673031, 1, 1, 1, 1, 1,
-1.474408, 2.043162, 0.9239003, 1, 1, 1, 1, 1,
-1.47372, -1.959122, -2.716668, 1, 1, 1, 1, 1,
-1.45663, -0.6829219, -2.013099, 1, 1, 1, 1, 1,
-1.451416, 1.770188, -2.581933, 1, 1, 1, 1, 1,
-1.448028, -0.3863043, -1.004096, 1, 1, 1, 1, 1,
-1.441634, 0.8376403, -0.6368645, 1, 1, 1, 1, 1,
-1.441021, -0.8420081, -1.184776, 0, 0, 1, 1, 1,
-1.43162, -0.1264208, -0.8030162, 1, 0, 0, 1, 1,
-1.423912, 0.4082047, -0.03885656, 1, 0, 0, 1, 1,
-1.421814, -0.4861283, -0.5486225, 1, 0, 0, 1, 1,
-1.418486, 1.716375, -1.699586, 1, 0, 0, 1, 1,
-1.40208, -1.455454, -3.312102, 1, 0, 0, 1, 1,
-1.401013, 0.75871, -0.2707635, 0, 0, 0, 1, 1,
-1.3938, -1.804621, -3.4762, 0, 0, 0, 1, 1,
-1.389954, 0.1471996, -3.301736, 0, 0, 0, 1, 1,
-1.375766, 1.615129, -1.394377, 0, 0, 0, 1, 1,
-1.368498, 0.2254647, -1.486727, 0, 0, 0, 1, 1,
-1.34938, 0.1143629, -0.7627617, 0, 0, 0, 1, 1,
-1.345673, 1.543255, -1.067186, 0, 0, 0, 1, 1,
-1.340192, 0.9710643, -1.463708, 1, 1, 1, 1, 1,
-1.325378, 0.5595606, -0.6904885, 1, 1, 1, 1, 1,
-1.325152, 0.2731204, -1.099088, 1, 1, 1, 1, 1,
-1.324833, -0.2646121, -1.826065, 1, 1, 1, 1, 1,
-1.321002, -1.220399, -2.086466, 1, 1, 1, 1, 1,
-1.314812, 0.5860783, -1.391304, 1, 1, 1, 1, 1,
-1.30894, -0.05946504, 0.2357463, 1, 1, 1, 1, 1,
-1.307102, -0.9435569, -1.344895, 1, 1, 1, 1, 1,
-1.303078, 0.9812503, -1.849968, 1, 1, 1, 1, 1,
-1.300393, 0.7522619, -0.9797165, 1, 1, 1, 1, 1,
-1.295227, -1.163327, -2.347764, 1, 1, 1, 1, 1,
-1.287823, -0.2824218, -2.137964, 1, 1, 1, 1, 1,
-1.287709, 0.4525849, -2.522441, 1, 1, 1, 1, 1,
-1.280223, 0.8504581, 0.04778309, 1, 1, 1, 1, 1,
-1.276471, -0.7364673, -2.836503, 1, 1, 1, 1, 1,
-1.276301, -0.293087, -1.506386, 0, 0, 1, 1, 1,
-1.275889, -1.305389, -2.584109, 1, 0, 0, 1, 1,
-1.266863, 0.3407716, -0.3142426, 1, 0, 0, 1, 1,
-1.265582, -1.384834, -4.419249, 1, 0, 0, 1, 1,
-1.256178, -0.8403164, -3.618751, 1, 0, 0, 1, 1,
-1.252509, 1.276576, -1.376015, 1, 0, 0, 1, 1,
-1.24934, -0.3524889, -0.6450207, 0, 0, 0, 1, 1,
-1.24857, -0.1702785, -0.3206016, 0, 0, 0, 1, 1,
-1.241817, 0.7380863, -1.364797, 0, 0, 0, 1, 1,
-1.241729, 0.03285928, -1.325569, 0, 0, 0, 1, 1,
-1.229089, -0.8079965, -1.547329, 0, 0, 0, 1, 1,
-1.228373, 0.7209476, -0.9415369, 0, 0, 0, 1, 1,
-1.225469, -2.741095, -1.582037, 0, 0, 0, 1, 1,
-1.214816, -1.645037, -4.791223, 1, 1, 1, 1, 1,
-1.209496, 0.3002127, -2.644849, 1, 1, 1, 1, 1,
-1.20058, -2.433821, -2.165413, 1, 1, 1, 1, 1,
-1.184837, 1.212453, -1.313949, 1, 1, 1, 1, 1,
-1.178193, -0.3023957, -1.561034, 1, 1, 1, 1, 1,
-1.172748, 1.183378, 0.5895602, 1, 1, 1, 1, 1,
-1.171003, -1.658324, -1.679596, 1, 1, 1, 1, 1,
-1.164104, -0.7004288, -1.755021, 1, 1, 1, 1, 1,
-1.163209, -0.9662846, -0.9744386, 1, 1, 1, 1, 1,
-1.161734, -0.004726467, -2.040123, 1, 1, 1, 1, 1,
-1.15008, -1.518559, -2.881886, 1, 1, 1, 1, 1,
-1.146699, -1.607389, -3.016818, 1, 1, 1, 1, 1,
-1.131591, 0.8753347, -2.881391, 1, 1, 1, 1, 1,
-1.127987, -0.4555575, -4.216521, 1, 1, 1, 1, 1,
-1.118278, -0.6112849, -2.861457, 1, 1, 1, 1, 1,
-1.117287, 2.215509, 0.2466256, 0, 0, 1, 1, 1,
-1.114012, 1.383184, -1.787896, 1, 0, 0, 1, 1,
-1.108089, 0.6600077, -1.249362, 1, 0, 0, 1, 1,
-1.104135, -0.9790343, -2.360971, 1, 0, 0, 1, 1,
-1.099517, 0.9015779, -1.133139, 1, 0, 0, 1, 1,
-1.097768, 0.4020795, -2.62153, 1, 0, 0, 1, 1,
-1.088687, 2.573767, -2.483313, 0, 0, 0, 1, 1,
-1.088625, 1.468116, -1.721644, 0, 0, 0, 1, 1,
-1.079385, 0.9697936, 0.5108522, 0, 0, 0, 1, 1,
-1.076996, -0.971558, -1.677239, 0, 0, 0, 1, 1,
-1.075578, -0.7511273, -2.733124, 0, 0, 0, 1, 1,
-1.074862, -0.7741105, -1.52955, 0, 0, 0, 1, 1,
-1.072518, 1.220278, -1.766749, 0, 0, 0, 1, 1,
-1.066995, 0.74268, -0.203983, 1, 1, 1, 1, 1,
-1.044607, -0.3418846, 0.1265259, 1, 1, 1, 1, 1,
-1.043256, -0.385865, -1.828822, 1, 1, 1, 1, 1,
-1.041949, -1.228472, -2.902647, 1, 1, 1, 1, 1,
-1.039224, -1.569701, -1.834662, 1, 1, 1, 1, 1,
-1.038988, 0.1747024, -3.508085, 1, 1, 1, 1, 1,
-1.038421, -0.3697969, -1.83709, 1, 1, 1, 1, 1,
-1.037649, 0.3236439, 0.0824578, 1, 1, 1, 1, 1,
-1.036541, 0.8449348, -1.278772, 1, 1, 1, 1, 1,
-1.036293, -0.3580607, -2.244935, 1, 1, 1, 1, 1,
-1.029454, -0.129409, -3.091944, 1, 1, 1, 1, 1,
-1.029371, -0.8535419, -4.097233, 1, 1, 1, 1, 1,
-1.021376, -0.1695297, -1.473176, 1, 1, 1, 1, 1,
-1.000436, 0.06209952, -1.873981, 1, 1, 1, 1, 1,
-0.9995281, -0.2053284, -1.349621, 1, 1, 1, 1, 1,
-0.9992482, 0.7068151, -1.613848, 0, 0, 1, 1, 1,
-0.9973618, -1.309351, -1.193627, 1, 0, 0, 1, 1,
-0.9920893, 0.04300835, -2.312898, 1, 0, 0, 1, 1,
-0.9916369, -0.07683555, -1.373661, 1, 0, 0, 1, 1,
-0.9900729, 1.538952, -0.03594606, 1, 0, 0, 1, 1,
-0.9866602, 0.2250769, -1.751909, 1, 0, 0, 1, 1,
-0.9860713, -0.1275247, -1.881688, 0, 0, 0, 1, 1,
-0.9800084, 0.4023678, -2.863518, 0, 0, 0, 1, 1,
-0.9769019, -0.1447033, -1.400867, 0, 0, 0, 1, 1,
-0.971867, -1.057145, -1.839726, 0, 0, 0, 1, 1,
-0.9634562, -0.3300845, -2.27084, 0, 0, 0, 1, 1,
-0.9629225, 0.01314228, -1.715043, 0, 0, 0, 1, 1,
-0.9597692, 1.044798, -0.5118012, 0, 0, 0, 1, 1,
-0.9576218, 1.00712, 1.371548, 1, 1, 1, 1, 1,
-0.951766, 1.211036, -0.2029356, 1, 1, 1, 1, 1,
-0.9510623, -0.8641565, -3.56176, 1, 1, 1, 1, 1,
-0.9480014, 0.3022954, -1.522943, 1, 1, 1, 1, 1,
-0.9478945, -0.7635185, -0.8278154, 1, 1, 1, 1, 1,
-0.9423571, -1.195117, -2.604356, 1, 1, 1, 1, 1,
-0.9268528, -1.375121, -2.797718, 1, 1, 1, 1, 1,
-0.9249166, 0.3663567, -2.584291, 1, 1, 1, 1, 1,
-0.9156931, -0.01405765, -2.112073, 1, 1, 1, 1, 1,
-0.9145, -0.07061323, -2.535912, 1, 1, 1, 1, 1,
-0.9016463, -0.1674512, 1.030646, 1, 1, 1, 1, 1,
-0.8891405, 0.3173516, 0.04751082, 1, 1, 1, 1, 1,
-0.8865784, 0.5096487, -1.023322, 1, 1, 1, 1, 1,
-0.870964, -0.5923574, -1.051992, 1, 1, 1, 1, 1,
-0.867336, 0.6541438, -0.3132825, 1, 1, 1, 1, 1,
-0.8572717, 1.204637, -0.7920145, 0, 0, 1, 1, 1,
-0.8484955, -1.410665, -4.052673, 1, 0, 0, 1, 1,
-0.847652, 0.2637824, -1.587119, 1, 0, 0, 1, 1,
-0.8465239, 0.9340328, -0.8816494, 1, 0, 0, 1, 1,
-0.8435088, -1.25818, -2.780566, 1, 0, 0, 1, 1,
-0.8236344, -0.08735949, -1.460107, 1, 0, 0, 1, 1,
-0.8231588, 0.6815855, -0.710259, 0, 0, 0, 1, 1,
-0.8158736, -1.044083, -3.072422, 0, 0, 0, 1, 1,
-0.8151067, -0.3756744, -2.366609, 0, 0, 0, 1, 1,
-0.8140432, 0.1148961, -1.79597, 0, 0, 0, 1, 1,
-0.8137718, 0.3710576, -1.914812, 0, 0, 0, 1, 1,
-0.8055875, 1.214804, 0.6830752, 0, 0, 0, 1, 1,
-0.8036819, 1.479011, 1.095871, 0, 0, 0, 1, 1,
-0.8012918, -0.1967369, -1.88045, 1, 1, 1, 1, 1,
-0.7961724, 0.5003483, 0.6525108, 1, 1, 1, 1, 1,
-0.7959009, 1.266763, -1.440327, 1, 1, 1, 1, 1,
-0.7913905, 0.7486675, -0.5822644, 1, 1, 1, 1, 1,
-0.7908314, 0.7183621, -1.508247, 1, 1, 1, 1, 1,
-0.7868423, -1.234833, -3.01166, 1, 1, 1, 1, 1,
-0.7863948, -0.3856734, -1.717238, 1, 1, 1, 1, 1,
-0.784762, 1.61405, -0.5056667, 1, 1, 1, 1, 1,
-0.7745176, -0.7121419, -1.664463, 1, 1, 1, 1, 1,
-0.7720621, 0.02219613, -1.829498, 1, 1, 1, 1, 1,
-0.7640631, -0.5709228, -1.707183, 1, 1, 1, 1, 1,
-0.748388, -2.117657, -0.9655092, 1, 1, 1, 1, 1,
-0.7466399, -0.1056694, -1.974346, 1, 1, 1, 1, 1,
-0.7446171, 0.003050181, -1.615296, 1, 1, 1, 1, 1,
-0.7445944, -0.7174546, -0.210399, 1, 1, 1, 1, 1,
-0.7388847, 0.2195759, -0.5655001, 0, 0, 1, 1, 1,
-0.7388635, -1.688875, -4.49221, 1, 0, 0, 1, 1,
-0.7365384, 2.102872, -2.692533, 1, 0, 0, 1, 1,
-0.730642, 1.020085, 0.1547073, 1, 0, 0, 1, 1,
-0.730075, -0.2901209, -0.7984032, 1, 0, 0, 1, 1,
-0.7286732, -0.3228236, -2.608299, 1, 0, 0, 1, 1,
-0.7236506, -0.755661, -2.156452, 0, 0, 0, 1, 1,
-0.7201242, 0.517005, -3.186558, 0, 0, 0, 1, 1,
-0.7184388, 0.6373242, 0.9150127, 0, 0, 0, 1, 1,
-0.7142081, -0.6116716, -2.827741, 0, 0, 0, 1, 1,
-0.7135505, 2.558417, -0.4607184, 0, 0, 0, 1, 1,
-0.7125794, 0.7681107, -0.2162438, 0, 0, 0, 1, 1,
-0.7110987, -1.187212, 0.1927769, 0, 0, 0, 1, 1,
-0.7109851, 0.2738495, -1.187786, 1, 1, 1, 1, 1,
-0.7103956, -0.2785087, -2.781414, 1, 1, 1, 1, 1,
-0.7040747, -0.419249, -1.136647, 1, 1, 1, 1, 1,
-0.7033622, 0.6987537, -1.225415, 1, 1, 1, 1, 1,
-0.7030792, -1.031783, -2.570905, 1, 1, 1, 1, 1,
-0.702273, 0.3365507, -1.318714, 1, 1, 1, 1, 1,
-0.7009399, 1.082723, -0.3331162, 1, 1, 1, 1, 1,
-0.6973941, -0.2291592, -1.172557, 1, 1, 1, 1, 1,
-0.6951421, -1.685116, -3.943495, 1, 1, 1, 1, 1,
-0.6941695, 0.05542305, -1.954667, 1, 1, 1, 1, 1,
-0.6920944, -1.408518, -1.796581, 1, 1, 1, 1, 1,
-0.6887726, 0.07221984, -1.640567, 1, 1, 1, 1, 1,
-0.6869955, 1.11043, -1.246942, 1, 1, 1, 1, 1,
-0.6836304, -0.2095922, -3.396723, 1, 1, 1, 1, 1,
-0.6833268, -0.3041297, -2.004309, 1, 1, 1, 1, 1,
-0.6818722, 1.361322, -0.6660354, 0, 0, 1, 1, 1,
-0.6741591, -0.7352371, -3.472882, 1, 0, 0, 1, 1,
-0.6741316, -0.3298136, -2.223974, 1, 0, 0, 1, 1,
-0.6713873, 0.3414001, -0.9288092, 1, 0, 0, 1, 1,
-0.6683154, -0.7120879, -1.440269, 1, 0, 0, 1, 1,
-0.6680362, 0.7659994, -0.03485043, 1, 0, 0, 1, 1,
-0.6661539, 1.549337, -0.3387087, 0, 0, 0, 1, 1,
-0.6647543, -1.551782, -2.691312, 0, 0, 0, 1, 1,
-0.6574767, -1.394413, -2.240293, 0, 0, 0, 1, 1,
-0.6556535, -1.004444, -3.23945, 0, 0, 0, 1, 1,
-0.6519572, -1.998233, -3.878336, 0, 0, 0, 1, 1,
-0.6313245, 1.029083, -0.3396576, 0, 0, 0, 1, 1,
-0.6303509, 0.3566359, -2.533581, 0, 0, 0, 1, 1,
-0.6296713, 0.1500683, 0.02132528, 1, 1, 1, 1, 1,
-0.6292899, 0.05097215, -1.526878, 1, 1, 1, 1, 1,
-0.6264484, -0.5920936, -2.264423, 1, 1, 1, 1, 1,
-0.6256583, 0.785431, -0.3948591, 1, 1, 1, 1, 1,
-0.6196582, -1.134269, -2.24452, 1, 1, 1, 1, 1,
-0.6132127, 1.73785, 0.2691045, 1, 1, 1, 1, 1,
-0.6101947, -0.1154729, -1.805389, 1, 1, 1, 1, 1,
-0.6085816, 0.1254057, -1.303211, 1, 1, 1, 1, 1,
-0.6084608, -0.166791, -1.852474, 1, 1, 1, 1, 1,
-0.6052238, 1.378338, 0.109305, 1, 1, 1, 1, 1,
-0.6046456, -0.3905333, -3.102843, 1, 1, 1, 1, 1,
-0.6019104, -0.02115519, -2.941546, 1, 1, 1, 1, 1,
-0.6006286, 0.1963301, 0.01317387, 1, 1, 1, 1, 1,
-0.5999652, 0.4005703, -0.115171, 1, 1, 1, 1, 1,
-0.5998143, 0.377272, -0.9089597, 1, 1, 1, 1, 1,
-0.5976957, 0.8421778, -0.6423017, 0, 0, 1, 1, 1,
-0.5909007, 1.396766, -2.177451, 1, 0, 0, 1, 1,
-0.5896986, 1.007566, -0.938733, 1, 0, 0, 1, 1,
-0.5829069, 1.588734, 0.2935883, 1, 0, 0, 1, 1,
-0.5824632, 0.8760531, -0.7205084, 1, 0, 0, 1, 1,
-0.5770423, 1.257738, -0.1733794, 1, 0, 0, 1, 1,
-0.5768505, 0.560342, -0.4016323, 0, 0, 0, 1, 1,
-0.5767828, -1.580745, -2.387226, 0, 0, 0, 1, 1,
-0.5741411, 0.2478108, -4.416781, 0, 0, 0, 1, 1,
-0.5725576, 0.4538228, 0.2645147, 0, 0, 0, 1, 1,
-0.5710767, 0.8826762, -0.3077116, 0, 0, 0, 1, 1,
-0.5708403, -1.460887, -3.503165, 0, 0, 0, 1, 1,
-0.5656747, 0.1210133, -1.856696, 0, 0, 0, 1, 1,
-0.5630376, 1.078442, 1.404268, 1, 1, 1, 1, 1,
-0.5613425, -1.092829, -2.513928, 1, 1, 1, 1, 1,
-0.557882, 0.9488125, -2.153303, 1, 1, 1, 1, 1,
-0.5561695, -0.7765278, -3.211706, 1, 1, 1, 1, 1,
-0.5532337, -0.392702, -2.192871, 1, 1, 1, 1, 1,
-0.5483578, 0.3949217, -2.016546, 1, 1, 1, 1, 1,
-0.5452078, -1.436077, -1.81435, 1, 1, 1, 1, 1,
-0.5436676, 0.4986672, -0.6278583, 1, 1, 1, 1, 1,
-0.5430654, -0.9248462, -2.010399, 1, 1, 1, 1, 1,
-0.5424328, -0.7284463, -2.11845, 1, 1, 1, 1, 1,
-0.5393289, 0.1011584, -1.967823, 1, 1, 1, 1, 1,
-0.538354, 0.2045164, -1.814913, 1, 1, 1, 1, 1,
-0.5366274, 0.2851766, -1.840347, 1, 1, 1, 1, 1,
-0.5318989, 0.7268138, 0.8631744, 1, 1, 1, 1, 1,
-0.5296566, -0.9200586, -1.203362, 1, 1, 1, 1, 1,
-0.5275733, 0.2188575, -0.9961917, 0, 0, 1, 1, 1,
-0.5270371, -1.376177, -4.383637, 1, 0, 0, 1, 1,
-0.5247992, 0.5629593, -1.333246, 1, 0, 0, 1, 1,
-0.5226061, -1.270187, -1.381699, 1, 0, 0, 1, 1,
-0.5211832, 0.1082531, -0.589013, 1, 0, 0, 1, 1,
-0.5181072, -0.5445552, -0.9944381, 1, 0, 0, 1, 1,
-0.5141461, 1.003831, 0.6450021, 0, 0, 0, 1, 1,
-0.5042879, -0.6704662, -2.007534, 0, 0, 0, 1, 1,
-0.5036529, -1.298399, -3.055199, 0, 0, 0, 1, 1,
-0.5024678, 0.304545, -2.758936, 0, 0, 0, 1, 1,
-0.4998505, 0.09110393, -1.671497, 0, 0, 0, 1, 1,
-0.4949283, -0.6583474, -2.67031, 0, 0, 0, 1, 1,
-0.4941746, -1.735093, -3.257535, 0, 0, 0, 1, 1,
-0.4930411, -0.2756747, -2.770323, 1, 1, 1, 1, 1,
-0.4891561, 0.7563462, 0.3789116, 1, 1, 1, 1, 1,
-0.4891353, -0.2905582, -2.717669, 1, 1, 1, 1, 1,
-0.4870364, -1.353919, -2.990039, 1, 1, 1, 1, 1,
-0.4837619, -0.2687097, -2.934793, 1, 1, 1, 1, 1,
-0.4837153, 1.438388, 0.1873084, 1, 1, 1, 1, 1,
-0.4766328, 1.176782, 0.4588246, 1, 1, 1, 1, 1,
-0.4710874, 1.079254, -2.138712, 1, 1, 1, 1, 1,
-0.470137, 0.5042787, -0.1869453, 1, 1, 1, 1, 1,
-0.4697897, -1.071739, -4.433763, 1, 1, 1, 1, 1,
-0.4688282, -0.3806486, -0.8857912, 1, 1, 1, 1, 1,
-0.4685648, 0.1461961, 0.2033088, 1, 1, 1, 1, 1,
-0.4673913, -0.5296177, -2.479604, 1, 1, 1, 1, 1,
-0.4669302, -1.330589, -1.815329, 1, 1, 1, 1, 1,
-0.4636722, -1.453257, -2.889778, 1, 1, 1, 1, 1,
-0.4618216, 0.8976972, -1.138524, 0, 0, 1, 1, 1,
-0.4599997, 0.227687, -0.2598813, 1, 0, 0, 1, 1,
-0.4598092, -0.9436703, -2.07515, 1, 0, 0, 1, 1,
-0.4594459, -0.3479689, -2.407788, 1, 0, 0, 1, 1,
-0.4504046, 0.3928437, -0.3322675, 1, 0, 0, 1, 1,
-0.4503306, 2.115072, 1.093193, 1, 0, 0, 1, 1,
-0.4445929, 0.6188614, 0.01961356, 0, 0, 0, 1, 1,
-0.4380822, 2.775249, 0.2246684, 0, 0, 0, 1, 1,
-0.4314082, 0.03528061, -0.5643395, 0, 0, 0, 1, 1,
-0.4310256, 1.073378, 1.156073, 0, 0, 0, 1, 1,
-0.4243257, -0.4924436, -2.657772, 0, 0, 0, 1, 1,
-0.4198014, 1.406399, -1.047065, 0, 0, 0, 1, 1,
-0.4123963, -0.4547202, -3.701735, 0, 0, 0, 1, 1,
-0.4122089, -0.6862612, -3.789808, 1, 1, 1, 1, 1,
-0.4118187, -0.8309048, -2.733362, 1, 1, 1, 1, 1,
-0.411701, -3.484668, -2.16442, 1, 1, 1, 1, 1,
-0.4117007, -0.5750833, -3.580765, 1, 1, 1, 1, 1,
-0.4103815, -0.4101949, -2.47762, 1, 1, 1, 1, 1,
-0.4098316, 1.956259, -0.6894021, 1, 1, 1, 1, 1,
-0.407476, 0.7259198, 0.2656246, 1, 1, 1, 1, 1,
-0.4042157, -0.009855303, -0.488868, 1, 1, 1, 1, 1,
-0.4023713, 1.537214, 1.141775, 1, 1, 1, 1, 1,
-0.397182, -0.360829, -1.135539, 1, 1, 1, 1, 1,
-0.3961997, 1.41772, 1.540905, 1, 1, 1, 1, 1,
-0.3940153, -0.3403249, -2.490204, 1, 1, 1, 1, 1,
-0.3930575, -0.3089629, -4.848671, 1, 1, 1, 1, 1,
-0.3890538, -1.593221, -2.018782, 1, 1, 1, 1, 1,
-0.3866, 0.7826636, -1.234353, 1, 1, 1, 1, 1,
-0.3800696, -0.1214355, -3.408174, 0, 0, 1, 1, 1,
-0.378804, 0.7496102, -1.589554, 1, 0, 0, 1, 1,
-0.377244, -0.08900041, -1.650077, 1, 0, 0, 1, 1,
-0.3674105, 1.136018, -1.878281, 1, 0, 0, 1, 1,
-0.3673349, -2.341736, -4.427028, 1, 0, 0, 1, 1,
-0.3654402, -0.2824453, -1.382852, 1, 0, 0, 1, 1,
-0.3640458, 0.7558455, 0.09680366, 0, 0, 0, 1, 1,
-0.3634557, -0.1101956, -1.030182, 0, 0, 0, 1, 1,
-0.3626548, -0.08915155, -2.452866, 0, 0, 0, 1, 1,
-0.3610667, 0.2170027, 0.5576314, 0, 0, 0, 1, 1,
-0.3601208, -0.7542561, -2.016171, 0, 0, 0, 1, 1,
-0.3593873, -1.641909, -2.412256, 0, 0, 0, 1, 1,
-0.3581999, -0.6313895, -3.451918, 0, 0, 0, 1, 1,
-0.3556156, -0.02169319, -2.32111, 1, 1, 1, 1, 1,
-0.3521268, 0.9836305, 0.1924011, 1, 1, 1, 1, 1,
-0.3515781, -1.463211, -1.313011, 1, 1, 1, 1, 1,
-0.3439935, -0.4520082, -1.39912, 1, 1, 1, 1, 1,
-0.3407847, 0.04514179, -1.017581, 1, 1, 1, 1, 1,
-0.3283044, -0.05743003, -3.501623, 1, 1, 1, 1, 1,
-0.3278656, -0.009490639, -1.196485, 1, 1, 1, 1, 1,
-0.3257759, 0.2827888, -2.115532, 1, 1, 1, 1, 1,
-0.3195251, 0.8794984, -0.9962801, 1, 1, 1, 1, 1,
-0.3172267, 0.7843985, 0.1432528, 1, 1, 1, 1, 1,
-0.3156294, -0.1620266, -3.430525, 1, 1, 1, 1, 1,
-0.3104637, 0.5685166, -0.5971446, 1, 1, 1, 1, 1,
-0.3078174, 0.2255632, 0.2852013, 1, 1, 1, 1, 1,
-0.3048971, 0.1705592, -1.250273, 1, 1, 1, 1, 1,
-0.3008743, -0.004379295, -1.55336, 1, 1, 1, 1, 1,
-0.2996462, 1.492604, 1.99185, 0, 0, 1, 1, 1,
-0.2973211, 1.838231, -0.3792059, 1, 0, 0, 1, 1,
-0.2967025, -0.2139106, -2.142952, 1, 0, 0, 1, 1,
-0.2940725, -0.4181291, -1.927123, 1, 0, 0, 1, 1,
-0.2870053, -1.106339, -4.73405, 1, 0, 0, 1, 1,
-0.2843737, -0.8939418, -1.79627, 1, 0, 0, 1, 1,
-0.2827103, -0.4193133, -1.188766, 0, 0, 0, 1, 1,
-0.2820477, -0.0843781, -3.449493, 0, 0, 0, 1, 1,
-0.281578, 0.5260979, -1.086602, 0, 0, 0, 1, 1,
-0.2803877, 0.4317965, -0.6985583, 0, 0, 0, 1, 1,
-0.2776497, -0.4222968, -1.502429, 0, 0, 0, 1, 1,
-0.2747125, 1.416743, -1.154638, 0, 0, 0, 1, 1,
-0.2707901, -0.2532438, -0.5908408, 0, 0, 0, 1, 1,
-0.2685639, 1.321622, -1.429305, 1, 1, 1, 1, 1,
-0.2677762, 1.396769, 1.392185, 1, 1, 1, 1, 1,
-0.2645161, 0.8817644, 0.2528368, 1, 1, 1, 1, 1,
-0.2535789, 1.328478, -0.7805942, 1, 1, 1, 1, 1,
-0.2471515, 0.4813877, 1.3985, 1, 1, 1, 1, 1,
-0.2449013, -1.672143, -2.71901, 1, 1, 1, 1, 1,
-0.242478, -1.352755, -3.609864, 1, 1, 1, 1, 1,
-0.2417235, 0.8839467, 0.7632065, 1, 1, 1, 1, 1,
-0.2380516, -0.7724703, -3.069842, 1, 1, 1, 1, 1,
-0.2377094, -0.5054242, -1.341534, 1, 1, 1, 1, 1,
-0.2348122, -0.8983228, -2.689588, 1, 1, 1, 1, 1,
-0.2267384, 0.4940577, -0.8034387, 1, 1, 1, 1, 1,
-0.2241856, 0.7051892, -0.6839812, 1, 1, 1, 1, 1,
-0.221953, -0.2944738, -1.611702, 1, 1, 1, 1, 1,
-0.2190419, -1.485152, -3.360342, 1, 1, 1, 1, 1,
-0.2189099, -0.1614485, -2.946435, 0, 0, 1, 1, 1,
-0.2160398, -0.941166, -4.075727, 1, 0, 0, 1, 1,
-0.2159892, 1.901937, -0.2881865, 1, 0, 0, 1, 1,
-0.2117151, 0.7766334, -2.979332, 1, 0, 0, 1, 1,
-0.206018, 0.5218577, -0.513584, 1, 0, 0, 1, 1,
-0.2050695, 0.04551664, -1.830613, 1, 0, 0, 1, 1,
-0.2015701, -0.9618543, -3.619323, 0, 0, 0, 1, 1,
-0.1969332, -0.3201853, -3.155808, 0, 0, 0, 1, 1,
-0.194636, 0.8689983, -0.4961534, 0, 0, 0, 1, 1,
-0.1944739, -1.0895, -3.488487, 0, 0, 0, 1, 1,
-0.19413, -0.5549355, -1.814723, 0, 0, 0, 1, 1,
-0.1907736, -0.5580977, -2.07305, 0, 0, 0, 1, 1,
-0.190241, -0.1198288, -1.587366, 0, 0, 0, 1, 1,
-0.1891312, -0.9167716, -2.561576, 1, 1, 1, 1, 1,
-0.188702, 2.244169, -0.8808387, 1, 1, 1, 1, 1,
-0.1829815, 0.7131782, 0.3197195, 1, 1, 1, 1, 1,
-0.182625, 0.408357, -1.928157, 1, 1, 1, 1, 1,
-0.1817057, -0.1790934, -3.080957, 1, 1, 1, 1, 1,
-0.1791351, -0.355828, -4.667795, 1, 1, 1, 1, 1,
-0.1745867, -0.7776002, -3.801465, 1, 1, 1, 1, 1,
-0.1743032, -1.356269, -3.950437, 1, 1, 1, 1, 1,
-0.1682112, -1.676589, -2.151571, 1, 1, 1, 1, 1,
-0.1681951, 1.091152, 0.7897616, 1, 1, 1, 1, 1,
-0.1678486, 0.116101, -0.6727763, 1, 1, 1, 1, 1,
-0.1656346, 0.1943867, 0.5650733, 1, 1, 1, 1, 1,
-0.1585398, -0.3431787, -2.96993, 1, 1, 1, 1, 1,
-0.1568192, -0.2439333, -3.177821, 1, 1, 1, 1, 1,
-0.1554105, 0.3688733, -0.1595996, 1, 1, 1, 1, 1,
-0.1472784, -0.2525447, -1.901275, 0, 0, 1, 1, 1,
-0.1384721, 1.3967, -0.5554175, 1, 0, 0, 1, 1,
-0.1376685, 0.152535, -0.9980565, 1, 0, 0, 1, 1,
-0.134096, 0.4266919, 0.2315161, 1, 0, 0, 1, 1,
-0.1336916, -0.7629321, -3.934818, 1, 0, 0, 1, 1,
-0.1302814, 0.3235569, -1.026867, 1, 0, 0, 1, 1,
-0.1294128, -0.1660088, -3.336357, 0, 0, 0, 1, 1,
-0.1270023, 0.8014889, -0.283857, 0, 0, 0, 1, 1,
-0.1238476, 0.239002, -0.07631632, 0, 0, 0, 1, 1,
-0.1175429, 0.6680946, -1.514986, 0, 0, 0, 1, 1,
-0.1152497, -0.9810251, -0.9119388, 0, 0, 0, 1, 1,
-0.1147563, -0.3988849, -2.381215, 0, 0, 0, 1, 1,
-0.1137002, 0.6795205, -0.4024782, 0, 0, 0, 1, 1,
-0.1120424, -0.1614453, -4.23845, 1, 1, 1, 1, 1,
-0.1101464, -0.06210998, -1.701497, 1, 1, 1, 1, 1,
-0.1087738, 0.6586118, -0.8896479, 1, 1, 1, 1, 1,
-0.1056029, -0.4643292, -0.5601006, 1, 1, 1, 1, 1,
-0.1055596, 0.4497116, 0.02898647, 1, 1, 1, 1, 1,
-0.1013456, 1.430518, -1.563544, 1, 1, 1, 1, 1,
-0.1005847, 0.1088298, -1.098462, 1, 1, 1, 1, 1,
-0.09837437, 0.08447087, 1.140758, 1, 1, 1, 1, 1,
-0.096595, -0.01753344, -2.879859, 1, 1, 1, 1, 1,
-0.09544975, -0.4987698, -1.525134, 1, 1, 1, 1, 1,
-0.09326675, -0.6346674, -2.690793, 1, 1, 1, 1, 1,
-0.08905949, 2.30807, -0.5612252, 1, 1, 1, 1, 1,
-0.08389382, 0.3666626, -0.06454426, 1, 1, 1, 1, 1,
-0.08139607, 0.6272473, 0.5629813, 1, 1, 1, 1, 1,
-0.07685041, 0.1163213, -0.6655996, 1, 1, 1, 1, 1,
-0.07542717, 1.416887, -1.330165, 0, 0, 1, 1, 1,
-0.07297308, -0.5318566, -3.737401, 1, 0, 0, 1, 1,
-0.07232128, -0.4802966, -3.286819, 1, 0, 0, 1, 1,
-0.07173138, 0.3472918, 0.1865713, 1, 0, 0, 1, 1,
-0.06770989, 0.002777306, -3.377187, 1, 0, 0, 1, 1,
-0.06549121, -1.1222, -3.030054, 1, 0, 0, 1, 1,
-0.064399, 1.47368, -0.2968135, 0, 0, 0, 1, 1,
-0.06420595, 1.768998, 0.368076, 0, 0, 0, 1, 1,
-0.06004544, -0.04428956, -1.712921, 0, 0, 0, 1, 1,
-0.05897809, 2.034851, -0.7511122, 0, 0, 0, 1, 1,
-0.05632878, -0.7386634, -1.170602, 0, 0, 0, 1, 1,
-0.0553809, 1.848715, 0.1154943, 0, 0, 0, 1, 1,
-0.03945608, 0.3782685, -0.2982638, 0, 0, 0, 1, 1,
-0.03905236, -0.2530207, -4.180007, 1, 1, 1, 1, 1,
-0.03653076, -1.039969, -3.365786, 1, 1, 1, 1, 1,
-0.03578218, 0.7834339, 0.4186273, 1, 1, 1, 1, 1,
-0.0317111, 1.0504, -0.397951, 1, 1, 1, 1, 1,
-0.03143238, -0.222708, -4.270363, 1, 1, 1, 1, 1,
-0.02859876, -1.271681, -3.296738, 1, 1, 1, 1, 1,
-0.0278245, 1.508443, 0.2580361, 1, 1, 1, 1, 1,
-0.02685584, -1.625995, -3.963906, 1, 1, 1, 1, 1,
-0.02311183, -0.6501366, -1.253962, 1, 1, 1, 1, 1,
-0.02117006, 0.4852349, 0.1752465, 1, 1, 1, 1, 1,
-0.02112178, -0.1105333, -1.735689, 1, 1, 1, 1, 1,
-0.01860338, 0.04875308, 0.7340996, 1, 1, 1, 1, 1,
-0.01497909, -0.06350213, -2.899905, 1, 1, 1, 1, 1,
-0.01286377, 1.088628, -0.4777299, 1, 1, 1, 1, 1,
-0.01084777, -0.2162817, -3.6073, 1, 1, 1, 1, 1,
-0.005735875, 1.664389, 0.8234434, 0, 0, 1, 1, 1,
-0.003350388, 1.713087, 0.537345, 1, 0, 0, 1, 1,
-0.0005774398, -1.030284, -2.370477, 1, 0, 0, 1, 1,
0.003021108, 1.851718, -2.491317, 1, 0, 0, 1, 1,
0.003191421, 0.3049104, 1.174892, 1, 0, 0, 1, 1,
0.004621283, -0.4380587, 1.64004, 1, 0, 0, 1, 1,
0.008344205, -1.541038, 3.004262, 0, 0, 0, 1, 1,
0.008724722, -0.07601672, 2.745425, 0, 0, 0, 1, 1,
0.01428734, 0.8569499, 1.527878, 0, 0, 0, 1, 1,
0.01876039, -0.5892087, 2.548834, 0, 0, 0, 1, 1,
0.02140464, 0.7438141, 1.116153, 0, 0, 0, 1, 1,
0.02366392, -1.070534, 1.760998, 0, 0, 0, 1, 1,
0.023718, 0.03569302, -0.07651984, 0, 0, 0, 1, 1,
0.02634907, 1.681037, -0.9195636, 1, 1, 1, 1, 1,
0.02736192, -1.345789, 3.537798, 1, 1, 1, 1, 1,
0.02785206, -0.5705415, 2.345163, 1, 1, 1, 1, 1,
0.03552071, -1.123688, 2.06261, 1, 1, 1, 1, 1,
0.03831346, -1.112402, 3.576713, 1, 1, 1, 1, 1,
0.04554945, 1.064925, -0.6211124, 1, 1, 1, 1, 1,
0.04683098, 2.160786, -1.155419, 1, 1, 1, 1, 1,
0.04777852, -0.3140773, 3.046676, 1, 1, 1, 1, 1,
0.04947158, 1.703878, 0.05769875, 1, 1, 1, 1, 1,
0.05011919, 0.2610155, 0.04713089, 1, 1, 1, 1, 1,
0.05144178, -0.849417, 2.772691, 1, 1, 1, 1, 1,
0.05192877, -0.7455987, 4.960519, 1, 1, 1, 1, 1,
0.05248353, -1.997466, 4.421118, 1, 1, 1, 1, 1,
0.05404429, 2.077419, 1.189971, 1, 1, 1, 1, 1,
0.05476539, -1.035186, 1.70947, 1, 1, 1, 1, 1,
0.05707809, -0.0411129, 0.9342508, 0, 0, 1, 1, 1,
0.05845775, -0.8246738, 2.414522, 1, 0, 0, 1, 1,
0.06062019, 0.4435505, 0.3852969, 1, 0, 0, 1, 1,
0.06903844, 0.966942, 0.2663599, 1, 0, 0, 1, 1,
0.06942074, 1.210891, 0.005325838, 1, 0, 0, 1, 1,
0.07352188, 0.01545929, 1.124272, 1, 0, 0, 1, 1,
0.07417237, -0.1230833, 3.500518, 0, 0, 0, 1, 1,
0.07608829, -1.345301, 5.178595, 0, 0, 0, 1, 1,
0.07682561, -0.84484, 4.275119, 0, 0, 0, 1, 1,
0.080404, 0.3824634, 0.1808392, 0, 0, 0, 1, 1,
0.08041576, 1.633595, 0.9132378, 0, 0, 0, 1, 1,
0.08414517, -0.4142143, 4.157084, 0, 0, 0, 1, 1,
0.08470441, -1.244875, 3.842934, 0, 0, 0, 1, 1,
0.08874092, -0.675957, 2.147252, 1, 1, 1, 1, 1,
0.09483937, -0.5390183, 0.5007208, 1, 1, 1, 1, 1,
0.09822489, 0.7285973, -0.1974868, 1, 1, 1, 1, 1,
0.0988858, -1.136386, 2.321953, 1, 1, 1, 1, 1,
0.09941211, 0.7418593, 0.1486659, 1, 1, 1, 1, 1,
0.1050686, -1.321557, 3.435889, 1, 1, 1, 1, 1,
0.1104283, 1.032996, 1.160328, 1, 1, 1, 1, 1,
0.1154486, -0.2276682, 4.118899, 1, 1, 1, 1, 1,
0.118462, 0.1185276, 1.432339, 1, 1, 1, 1, 1,
0.1192947, 0.0696066, 1.078608, 1, 1, 1, 1, 1,
0.1240896, -1.613915, 2.863391, 1, 1, 1, 1, 1,
0.1246206, 0.4285744, 0.6739342, 1, 1, 1, 1, 1,
0.1246714, 0.5803596, 2.145637, 1, 1, 1, 1, 1,
0.1258587, -0.7433295, 1.774982, 1, 1, 1, 1, 1,
0.1261025, 0.07917973, 0.8159032, 1, 1, 1, 1, 1,
0.1270808, 0.6983567, -0.003600217, 0, 0, 1, 1, 1,
0.1321995, -0.4639964, 3.9179, 1, 0, 0, 1, 1,
0.1360058, -0.3516843, 2.695301, 1, 0, 0, 1, 1,
0.1391286, 1.001822, -0.5696067, 1, 0, 0, 1, 1,
0.1417573, -0.5367992, 2.869046, 1, 0, 0, 1, 1,
0.1467352, 0.03460006, 1.815922, 1, 0, 0, 1, 1,
0.1479549, -0.2074119, 2.772333, 0, 0, 0, 1, 1,
0.1601145, 1.181442, 2.014961, 0, 0, 0, 1, 1,
0.1618855, -0.05227253, 1.08113, 0, 0, 0, 1, 1,
0.1636573, -0.8472102, 2.586554, 0, 0, 0, 1, 1,
0.1639043, -0.3065682, 2.536028, 0, 0, 0, 1, 1,
0.1695309, 0.8761314, -0.7228011, 0, 0, 0, 1, 1,
0.1703392, -0.7020538, 2.813265, 0, 0, 0, 1, 1,
0.1764263, -0.9176203, 1.518969, 1, 1, 1, 1, 1,
0.1775214, -0.5848769, 2.697452, 1, 1, 1, 1, 1,
0.1835898, 1.005223, 2.531911, 1, 1, 1, 1, 1,
0.1840653, -2.059824, 0.712687, 1, 1, 1, 1, 1,
0.1846291, -0.3839591, 1.413096, 1, 1, 1, 1, 1,
0.1861492, -1.960984, 4.161903, 1, 1, 1, 1, 1,
0.1888773, -2.734428, 2.359242, 1, 1, 1, 1, 1,
0.1900366, 0.9568734, -0.3674253, 1, 1, 1, 1, 1,
0.1906737, 0.7109228, -1.437801, 1, 1, 1, 1, 1,
0.1909475, -0.6638649, 4.773229, 1, 1, 1, 1, 1,
0.1919001, 0.8305597, -0.4624124, 1, 1, 1, 1, 1,
0.1946558, -0.0644962, 4.472952, 1, 1, 1, 1, 1,
0.1955637, -1.268626, 0.9231535, 1, 1, 1, 1, 1,
0.1981207, -0.5376468, 2.0999, 1, 1, 1, 1, 1,
0.2023882, 0.7232634, -0.5761358, 1, 1, 1, 1, 1,
0.2039679, -0.858364, 2.759866, 0, 0, 1, 1, 1,
0.2040272, 0.241743, 1.51102, 1, 0, 0, 1, 1,
0.2040321, -0.2210661, 1.692129, 1, 0, 0, 1, 1,
0.2058638, -0.374056, 2.082576, 1, 0, 0, 1, 1,
0.2064675, 0.9879615, -0.1623166, 1, 0, 0, 1, 1,
0.2129488, -0.07560114, 2.549981, 1, 0, 0, 1, 1,
0.2130562, 0.1907458, -0.7614223, 0, 0, 0, 1, 1,
0.2159704, -1.703311, 3.580107, 0, 0, 0, 1, 1,
0.2174211, -0.3395, 4.324889, 0, 0, 0, 1, 1,
0.2192134, 0.9666767, -1.489484, 0, 0, 0, 1, 1,
0.2215589, -0.1674189, 1.647647, 0, 0, 0, 1, 1,
0.2218847, -0.02208437, 0.6969904, 0, 0, 0, 1, 1,
0.2238121, 2.084779, 1.835299, 0, 0, 0, 1, 1,
0.2258509, 1.483613, -0.9182191, 1, 1, 1, 1, 1,
0.2285671, -0.768117, 1.725461, 1, 1, 1, 1, 1,
0.2371207, -0.8915739, 4.034127, 1, 1, 1, 1, 1,
0.2372723, 0.7155934, -0.6953492, 1, 1, 1, 1, 1,
0.240669, 0.1618523, 0.6429294, 1, 1, 1, 1, 1,
0.2408116, -0.152243, 2.493129, 1, 1, 1, 1, 1,
0.2419237, -0.7089339, 4.562194, 1, 1, 1, 1, 1,
0.2441725, 0.9273204, -0.5228826, 1, 1, 1, 1, 1,
0.2461459, 1.64424, 0.4675741, 1, 1, 1, 1, 1,
0.2505692, 0.7232487, 1.313436, 1, 1, 1, 1, 1,
0.2518364, -1.726742, 4.446117, 1, 1, 1, 1, 1,
0.2546505, -1.828569, 2.094541, 1, 1, 1, 1, 1,
0.2551048, 1.459198, -0.3790195, 1, 1, 1, 1, 1,
0.255278, -0.10616, 3.125432, 1, 1, 1, 1, 1,
0.2561271, 0.539898, 0.682249, 1, 1, 1, 1, 1,
0.2582723, -2.315441, 3.731221, 0, 0, 1, 1, 1,
0.2585098, 1.837123, -1.621107, 1, 0, 0, 1, 1,
0.2680658, 0.7724836, 1.999907, 1, 0, 0, 1, 1,
0.2681607, -1.896099, 1.400709, 1, 0, 0, 1, 1,
0.2723353, 0.5951521, -0.1278651, 1, 0, 0, 1, 1,
0.2810426, -0.05383172, 2.269938, 1, 0, 0, 1, 1,
0.2812214, -0.9943234, 3.405547, 0, 0, 0, 1, 1,
0.2827581, 0.3738134, 0.4959594, 0, 0, 0, 1, 1,
0.2855294, -0.3227566, 3.004804, 0, 0, 0, 1, 1,
0.2865914, 1.563331, -1.204936, 0, 0, 0, 1, 1,
0.2905279, 0.7183746, 0.6605176, 0, 0, 0, 1, 1,
0.2920189, 1.985886, -1.138215, 0, 0, 0, 1, 1,
0.2922092, -0.577954, 2.137575, 0, 0, 0, 1, 1,
0.2951925, 1.108905, 0.2590768, 1, 1, 1, 1, 1,
0.2955021, 0.9299688, 0.6463366, 1, 1, 1, 1, 1,
0.3030131, 0.8056062, -0.1654989, 1, 1, 1, 1, 1,
0.3054076, 2.373587, 0.192886, 1, 1, 1, 1, 1,
0.3071235, -0.5747595, 2.139793, 1, 1, 1, 1, 1,
0.307328, -0.6343588, 1.189772, 1, 1, 1, 1, 1,
0.3093903, 0.8146875, -0.2738461, 1, 1, 1, 1, 1,
0.3124368, -1.224032, 4.192266, 1, 1, 1, 1, 1,
0.3139387, 0.5120775, 0.3047068, 1, 1, 1, 1, 1,
0.3152885, -0.5265002, 1.090551, 1, 1, 1, 1, 1,
0.3158692, 0.02340963, 1.157661, 1, 1, 1, 1, 1,
0.3165049, -0.06826889, 2.618367, 1, 1, 1, 1, 1,
0.318434, 1.079886, 0.9427274, 1, 1, 1, 1, 1,
0.3193446, 0.1617562, 1.811015, 1, 1, 1, 1, 1,
0.3219409, -0.1795036, 3.592354, 1, 1, 1, 1, 1,
0.3231294, -1.003572, 2.60012, 0, 0, 1, 1, 1,
0.3236866, 1.865935, 0.8453553, 1, 0, 0, 1, 1,
0.3246283, -1.2799, 4.011764, 1, 0, 0, 1, 1,
0.3268731, 0.03634268, 0.2647471, 1, 0, 0, 1, 1,
0.3293714, 0.2946073, 1.630116, 1, 0, 0, 1, 1,
0.3299111, 0.7559981, 0.9735594, 1, 0, 0, 1, 1,
0.3370358, 0.9951513, 0.215085, 0, 0, 0, 1, 1,
0.3402451, -0.01386847, 1.784285, 0, 0, 0, 1, 1,
0.3414647, -0.7027162, 3.412749, 0, 0, 0, 1, 1,
0.3447152, -0.1574422, 2.104224, 0, 0, 0, 1, 1,
0.3486971, 1.00617, 0.1887358, 0, 0, 0, 1, 1,
0.3512034, -0.7256362, 2.582164, 0, 0, 0, 1, 1,
0.3516379, -1.113772, 3.788079, 0, 0, 0, 1, 1,
0.3582685, -2.04912, 3.652445, 1, 1, 1, 1, 1,
0.3583048, -0.3621943, 4.215749, 1, 1, 1, 1, 1,
0.35864, 0.7670259, -0.02564468, 1, 1, 1, 1, 1,
0.3593664, -0.007529062, 2.109416, 1, 1, 1, 1, 1,
0.3623793, -0.3390127, 3.653876, 1, 1, 1, 1, 1,
0.3671002, 1.154644, 1.23214, 1, 1, 1, 1, 1,
0.3685339, 0.6506325, 0.8892764, 1, 1, 1, 1, 1,
0.371016, 0.7574976, -1.481128, 1, 1, 1, 1, 1,
0.3720778, -0.9826596, 2.63487, 1, 1, 1, 1, 1,
0.3790435, 0.871747, -0.7445576, 1, 1, 1, 1, 1,
0.3808002, 1.625412, 0.1422735, 1, 1, 1, 1, 1,
0.3808058, -0.2449843, 1.84636, 1, 1, 1, 1, 1,
0.3897487, 0.8952141, 2.215437, 1, 1, 1, 1, 1,
0.3919303, -0.9503354, 1.742907, 1, 1, 1, 1, 1,
0.3928912, -0.6629996, 2.55242, 1, 1, 1, 1, 1,
0.3935661, 1.426113, 0.4328513, 0, 0, 1, 1, 1,
0.396601, -0.4256455, 2.374277, 1, 0, 0, 1, 1,
0.3970973, 0.2258202, 0.9679999, 1, 0, 0, 1, 1,
0.3974887, -2.091137, 0.8269508, 1, 0, 0, 1, 1,
0.398302, 0.6853424, 0.8162988, 1, 0, 0, 1, 1,
0.4024227, -0.4493309, 0.6023354, 1, 0, 0, 1, 1,
0.4059796, 0.59127, -0.1622512, 0, 0, 0, 1, 1,
0.4066463, 0.9829335, 2.343066, 0, 0, 0, 1, 1,
0.422504, -0.8222416, 3.110309, 0, 0, 0, 1, 1,
0.4226609, 0.1614387, 0.7236485, 0, 0, 0, 1, 1,
0.4232628, -2.70849, 3.800906, 0, 0, 0, 1, 1,
0.4266491, 0.1320893, 0.5509666, 0, 0, 0, 1, 1,
0.4292707, 0.5954906, -0.9707644, 0, 0, 0, 1, 1,
0.4318162, -0.5166786, 4.479884, 1, 1, 1, 1, 1,
0.4392568, -1.471382, 3.175853, 1, 1, 1, 1, 1,
0.4405448, -1.055566, 2.845864, 1, 1, 1, 1, 1,
0.4409699, -1.093769, 2.180109, 1, 1, 1, 1, 1,
0.4459603, 0.5166993, -0.260103, 1, 1, 1, 1, 1,
0.4523259, 1.12717, 1.190246, 1, 1, 1, 1, 1,
0.4562809, -0.6297624, 2.336091, 1, 1, 1, 1, 1,
0.4583854, -0.5153006, 2.204258, 1, 1, 1, 1, 1,
0.4602513, -0.7887087, 2.683969, 1, 1, 1, 1, 1,
0.4679382, 0.1296206, 0.70259, 1, 1, 1, 1, 1,
0.4684107, 1.011071, -0.4006235, 1, 1, 1, 1, 1,
0.4692656, 1.162138, 2.532063, 1, 1, 1, 1, 1,
0.4771125, -1.176051, 2.574294, 1, 1, 1, 1, 1,
0.4804098, -0.9828256, 2.009203, 1, 1, 1, 1, 1,
0.4834585, 0.9496855, 0.7307005, 1, 1, 1, 1, 1,
0.4848612, -0.4604713, 2.936069, 0, 0, 1, 1, 1,
0.4866549, 1.118587, 0.27595, 1, 0, 0, 1, 1,
0.4896124, 0.7652255, 0.436269, 1, 0, 0, 1, 1,
0.4933304, 0.5038401, 1.081747, 1, 0, 0, 1, 1,
0.4946263, 0.145757, 3.805313, 1, 0, 0, 1, 1,
0.4988289, 0.4378419, 0.7424693, 1, 0, 0, 1, 1,
0.5009027, -0.1690767, 1.842385, 0, 0, 0, 1, 1,
0.5045099, -0.08962272, 1.439075, 0, 0, 0, 1, 1,
0.5082365, -1.111395, 3.353521, 0, 0, 0, 1, 1,
0.5093488, -0.6630388, 1.681335, 0, 0, 0, 1, 1,
0.5103197, 1.769077, -0.9230174, 0, 0, 0, 1, 1,
0.5129155, 1.249666, 0.3556137, 0, 0, 0, 1, 1,
0.5146475, 0.3442484, 1.244602, 0, 0, 0, 1, 1,
0.5168525, 0.1790759, -0.3038243, 1, 1, 1, 1, 1,
0.518175, -0.474147, 2.202916, 1, 1, 1, 1, 1,
0.5215296, 3.180648, 1.846953, 1, 1, 1, 1, 1,
0.5231069, -0.4880033, 2.990662, 1, 1, 1, 1, 1,
0.5285674, 1.264005, 0.9602212, 1, 1, 1, 1, 1,
0.5319864, -2.665626, 3.023447, 1, 1, 1, 1, 1,
0.5373849, 0.7377672, -0.1635595, 1, 1, 1, 1, 1,
0.5384317, -0.4488527, 1.01239, 1, 1, 1, 1, 1,
0.5389522, -0.8366302, 3.615058, 1, 1, 1, 1, 1,
0.5406842, -0.4617779, 2.266798, 1, 1, 1, 1, 1,
0.5429932, 0.4231806, -0.7855206, 1, 1, 1, 1, 1,
0.5469331, -0.4644713, 2.461106, 1, 1, 1, 1, 1,
0.5505411, -0.7458058, 2.533612, 1, 1, 1, 1, 1,
0.552709, 3.191201, -1.455094, 1, 1, 1, 1, 1,
0.5543903, -0.0003463913, 2.452937, 1, 1, 1, 1, 1,
0.5569576, 1.991854, 1.267676, 0, 0, 1, 1, 1,
0.5587537, -1.386253, 2.032569, 1, 0, 0, 1, 1,
0.5625383, -0.5844508, 3.983554, 1, 0, 0, 1, 1,
0.5636896, 0.5111259, 1.174905, 1, 0, 0, 1, 1,
0.5656688, 1.116556, -0.6167539, 1, 0, 0, 1, 1,
0.5663192, -1.192468, 2.01535, 1, 0, 0, 1, 1,
0.5679048, 0.4808641, 1.00636, 0, 0, 0, 1, 1,
0.5701705, 0.9926546, -0.2651984, 0, 0, 0, 1, 1,
0.5715601, 0.8422126, 0.2064119, 0, 0, 0, 1, 1,
0.5777335, -0.06764428, 2.312118, 0, 0, 0, 1, 1,
0.5780785, -0.3800769, 2.169078, 0, 0, 0, 1, 1,
0.5787434, 0.5994454, 0.1079258, 0, 0, 0, 1, 1,
0.5801365, -1.55262, 1.409238, 0, 0, 0, 1, 1,
0.5826645, -0.8634697, 3.868018, 1, 1, 1, 1, 1,
0.5858575, -2.706518, 2.517691, 1, 1, 1, 1, 1,
0.594429, -2.069631, 2.609913, 1, 1, 1, 1, 1,
0.5998616, -0.06158651, 2.883856, 1, 1, 1, 1, 1,
0.6018075, -1.806524, 1.651494, 1, 1, 1, 1, 1,
0.6071583, 0.3393865, -0.9624792, 1, 1, 1, 1, 1,
0.6085278, 0.2380646, 1.13043, 1, 1, 1, 1, 1,
0.6089686, -0.08767106, 1.99894, 1, 1, 1, 1, 1,
0.6091487, 0.4647418, -0.4203293, 1, 1, 1, 1, 1,
0.6183164, -0.6858791, 3.772231, 1, 1, 1, 1, 1,
0.6199236, 0.5380261, 0.4921219, 1, 1, 1, 1, 1,
0.6223586, 0.06330478, 1.175438, 1, 1, 1, 1, 1,
0.6259874, 0.07863453, 0.7616146, 1, 1, 1, 1, 1,
0.6310923, 1.105984, 1.1344, 1, 1, 1, 1, 1,
0.6323622, -0.5247541, 2.380596, 1, 1, 1, 1, 1,
0.6346586, -1.128649, 3.28332, 0, 0, 1, 1, 1,
0.6426962, 0.0617722, 4.251737, 1, 0, 0, 1, 1,
0.6433927, -0.07414094, 2.426931, 1, 0, 0, 1, 1,
0.6504003, -1.716001, 2.273161, 1, 0, 0, 1, 1,
0.6548855, -1.062034, 2.702161, 1, 0, 0, 1, 1,
0.6565403, 0.4845172, 0.5379606, 1, 0, 0, 1, 1,
0.6613054, 0.4667508, -0.0935458, 0, 0, 0, 1, 1,
0.672043, -1.479689, 3.178763, 0, 0, 0, 1, 1,
0.67413, -2.682832, 3.094943, 0, 0, 0, 1, 1,
0.6800273, 0.3580205, 1.796893, 0, 0, 0, 1, 1,
0.681528, -0.4652099, 3.023103, 0, 0, 0, 1, 1,
0.6861208, 0.6991934, 1.804084, 0, 0, 0, 1, 1,
0.6993334, -0.22451, 3.608723, 0, 0, 0, 1, 1,
0.7005183, -0.5958227, 1.255251, 1, 1, 1, 1, 1,
0.7024684, -0.2591198, 3.617081, 1, 1, 1, 1, 1,
0.7048325, -2.211628, 1.248197, 1, 1, 1, 1, 1,
0.7052071, -0.9740041, 2.262945, 1, 1, 1, 1, 1,
0.7066621, -1.652651, 1.834005, 1, 1, 1, 1, 1,
0.7084785, -0.6213372, 2.371552, 1, 1, 1, 1, 1,
0.7090024, -1.114555, 3.270468, 1, 1, 1, 1, 1,
0.7099689, 2.427974, 0.78254, 1, 1, 1, 1, 1,
0.7150369, 0.8308469, 1.165814, 1, 1, 1, 1, 1,
0.7175545, 1.139411, 1.020776, 1, 1, 1, 1, 1,
0.7225275, -1.559349, 0.514618, 1, 1, 1, 1, 1,
0.7226881, -1.367991, 2.946039, 1, 1, 1, 1, 1,
0.7232006, 0.1920787, 1.471318, 1, 1, 1, 1, 1,
0.7243073, -0.6100568, 2.875683, 1, 1, 1, 1, 1,
0.7250879, -0.1917632, 0.7878777, 1, 1, 1, 1, 1,
0.7291712, 1.889819, 0.5593259, 0, 0, 1, 1, 1,
0.7293835, -1.084975, 0.9794182, 1, 0, 0, 1, 1,
0.7365843, -0.5554309, 2.036474, 1, 0, 0, 1, 1,
0.7374315, 0.4330286, 1.289238, 1, 0, 0, 1, 1,
0.7421908, 0.6548256, 0.1742941, 1, 0, 0, 1, 1,
0.7464025, 1.039269, 1.01192, 1, 0, 0, 1, 1,
0.75003, -0.6905907, 3.560213, 0, 0, 0, 1, 1,
0.7528492, -0.05061077, 1.373845, 0, 0, 0, 1, 1,
0.7554998, -2.012608, 1.171474, 0, 0, 0, 1, 1,
0.7651538, -0.4042485, 2.271968, 0, 0, 0, 1, 1,
0.7721498, 0.2737171, 1.181412, 0, 0, 0, 1, 1,
0.7873452, -1.132989, 2.569994, 0, 0, 0, 1, 1,
0.7885404, -0.1689514, 2.068412, 0, 0, 0, 1, 1,
0.7889822, 1.664912, 0.09412844, 1, 1, 1, 1, 1,
0.7893195, -0.5908891, 0.8802025, 1, 1, 1, 1, 1,
0.7912639, 2.881585, -1.676606, 1, 1, 1, 1, 1,
0.7985382, -1.114656, 2.007072, 1, 1, 1, 1, 1,
0.7986443, 0.9603136, -0.03109905, 1, 1, 1, 1, 1,
0.8017604, -0.004784518, 3.095649, 1, 1, 1, 1, 1,
0.8050724, -0.8229405, 4.099845, 1, 1, 1, 1, 1,
0.8108525, 0.9212179, -0.5213797, 1, 1, 1, 1, 1,
0.8117394, 0.1499297, 1.427981, 1, 1, 1, 1, 1,
0.8141884, 1.675368, 0.5604479, 1, 1, 1, 1, 1,
0.8184144, -0.8702416, 3.659082, 1, 1, 1, 1, 1,
0.8219338, -1.08665, 1.450934, 1, 1, 1, 1, 1,
0.8242117, 0.3467299, 2.580957, 1, 1, 1, 1, 1,
0.825247, 0.4642598, 0.1390332, 1, 1, 1, 1, 1,
0.8305776, -1.572634, 3.008249, 1, 1, 1, 1, 1,
0.8342795, -1.172886, 3.3116, 0, 0, 1, 1, 1,
0.8364938, -0.1863851, 2.526972, 1, 0, 0, 1, 1,
0.8389509, -0.2028464, 2.046876, 1, 0, 0, 1, 1,
0.8405335, 0.001500202, 0.7670792, 1, 0, 0, 1, 1,
0.8460034, 0.2017379, 1.885224, 1, 0, 0, 1, 1,
0.8465277, 0.4419605, 0.6947792, 1, 0, 0, 1, 1,
0.8494145, 0.8602304, 2.669839, 0, 0, 0, 1, 1,
0.8527221, -0.1966096, 0.1649727, 0, 0, 0, 1, 1,
0.8539911, 0.6831031, 1.777345, 0, 0, 0, 1, 1,
0.8542075, 0.8750748, 0.3104731, 0, 0, 0, 1, 1,
0.8679457, 1.099289, 0.5444294, 0, 0, 0, 1, 1,
0.8688324, 0.9264187, -0.1112366, 0, 0, 0, 1, 1,
0.8713081, -1.171057, 0.8594787, 0, 0, 0, 1, 1,
0.8744045, 1.538575, 1.952476, 1, 1, 1, 1, 1,
0.8813747, -0.6073703, 1.973701, 1, 1, 1, 1, 1,
0.8840247, 1.158988, 1.415613, 1, 1, 1, 1, 1,
0.8860861, -0.6319366, 1.640076, 1, 1, 1, 1, 1,
0.887418, -0.6150983, 3.594818, 1, 1, 1, 1, 1,
0.8896002, 0.9771312, -0.09528621, 1, 1, 1, 1, 1,
0.8923445, 0.1351481, 0.9534858, 1, 1, 1, 1, 1,
0.8933613, -0.1686253, 0.4301946, 1, 1, 1, 1, 1,
0.8985112, -1.680457, 2.374376, 1, 1, 1, 1, 1,
0.9020913, 0.1400759, 0.121651, 1, 1, 1, 1, 1,
0.9053239, 0.6371754, -0.0971738, 1, 1, 1, 1, 1,
0.9065576, 0.492211, 2.200591, 1, 1, 1, 1, 1,
0.9084733, 0.01855262, 1.501308, 1, 1, 1, 1, 1,
0.9113721, 0.8711687, 1.555797, 1, 1, 1, 1, 1,
0.9114275, 0.4730035, 0.5428118, 1, 1, 1, 1, 1,
0.9126943, 1.683122, 2.605203, 0, 0, 1, 1, 1,
0.9128168, -1.792578, 3.394419, 1, 0, 0, 1, 1,
0.9148518, 0.03133147, 2.903933, 1, 0, 0, 1, 1,
0.9164342, -1.172647, 0.8671221, 1, 0, 0, 1, 1,
0.9200175, -2.086246, 4.54391, 1, 0, 0, 1, 1,
0.9242625, -0.5053232, 1.890941, 1, 0, 0, 1, 1,
0.9267482, -0.04764391, 1.652996, 0, 0, 0, 1, 1,
0.9488119, 1.183412, 0.1925238, 0, 0, 0, 1, 1,
0.9494799, 2.452582, -0.515455, 0, 0, 0, 1, 1,
0.9535896, -0.007164809, 1.625176, 0, 0, 0, 1, 1,
0.9546268, 1.072138, 0.6935452, 0, 0, 0, 1, 1,
0.9730632, 0.3263087, 1.834036, 0, 0, 0, 1, 1,
0.973379, -0.09642859, 2.4577, 0, 0, 0, 1, 1,
0.9757742, 0.1424857, 1.107035, 1, 1, 1, 1, 1,
0.9773329, -0.03405691, 0.1226874, 1, 1, 1, 1, 1,
0.9809616, 0.4020198, 0.1912466, 1, 1, 1, 1, 1,
0.9873428, 0.702296, 0.7644763, 1, 1, 1, 1, 1,
0.9889582, 0.06080079, 0.01454567, 1, 1, 1, 1, 1,
0.9910659, 1.195526, 1.900791, 1, 1, 1, 1, 1,
1.003722, 0.07732348, 0.7634509, 1, 1, 1, 1, 1,
1.004852, 0.6832392, 0.5206473, 1, 1, 1, 1, 1,
1.007791, -1.306212, 3.66637, 1, 1, 1, 1, 1,
1.007995, -0.4885068, 2.763814, 1, 1, 1, 1, 1,
1.008344, 0.4276871, 2.753112, 1, 1, 1, 1, 1,
1.010751, 0.4448253, -0.03584924, 1, 1, 1, 1, 1,
1.019988, -0.2450741, 1.436906, 1, 1, 1, 1, 1,
1.02075, 0.05663003, 0.6070576, 1, 1, 1, 1, 1,
1.02348, 1.400118, 2.086256, 1, 1, 1, 1, 1,
1.023978, -1.431761, 1.087456, 0, 0, 1, 1, 1,
1.02504, -1.725865, 2.660138, 1, 0, 0, 1, 1,
1.026652, -0.1080899, 1.454698, 1, 0, 0, 1, 1,
1.028575, -0.1891052, 0.9168884, 1, 0, 0, 1, 1,
1.043131, -1.28273, 1.168311, 1, 0, 0, 1, 1,
1.043885, 0.02130529, 1.058151, 1, 0, 0, 1, 1,
1.046575, 0.3172265, 2.254293, 0, 0, 0, 1, 1,
1.056959, -0.1188171, 1.761178, 0, 0, 0, 1, 1,
1.057277, 1.19489, 0.5768407, 0, 0, 0, 1, 1,
1.060714, 0.6174403, 1.010922, 0, 0, 0, 1, 1,
1.06189, 0.5702738, 3.160288, 0, 0, 0, 1, 1,
1.072073, 0.4590529, 2.531524, 0, 0, 0, 1, 1,
1.074216, -0.4905028, 2.221887, 0, 0, 0, 1, 1,
1.078741, 0.2905124, 2.569737, 1, 1, 1, 1, 1,
1.079793, -1.530929, 3.898319, 1, 1, 1, 1, 1,
1.083121, 1.076365, 1.372877, 1, 1, 1, 1, 1,
1.083983, -0.326166, 1.914365, 1, 1, 1, 1, 1,
1.08644, -3.479561, 3.104933, 1, 1, 1, 1, 1,
1.094723, -0.1078165, 0.0243865, 1, 1, 1, 1, 1,
1.105881, 0.3570642, 1.729453, 1, 1, 1, 1, 1,
1.116687, 0.4604469, 0.4563968, 1, 1, 1, 1, 1,
1.121179, 1.626945, 0.9213538, 1, 1, 1, 1, 1,
1.121314, 0.07415871, 0.01483171, 1, 1, 1, 1, 1,
1.123621, -0.0866323, 2.610308, 1, 1, 1, 1, 1,
1.125895, -0.5499817, 2.362875, 1, 1, 1, 1, 1,
1.14196, 0.09413689, 2.203796, 1, 1, 1, 1, 1,
1.142943, 0.2143959, 1.80819, 1, 1, 1, 1, 1,
1.148734, 1.242621, 0.581714, 1, 1, 1, 1, 1,
1.149073, -1.102422, 4.494412, 0, 0, 1, 1, 1,
1.150063, -0.1873197, 1.834851, 1, 0, 0, 1, 1,
1.172611, 0.8783978, 2.045692, 1, 0, 0, 1, 1,
1.176697, 0.9129514, -0.3819507, 1, 0, 0, 1, 1,
1.180227, 0.7509831, 2.898934, 1, 0, 0, 1, 1,
1.183011, -1.329686, 3.531871, 1, 0, 0, 1, 1,
1.186028, 0.7033474, 1.893384, 0, 0, 0, 1, 1,
1.187237, 1.756006, 1.40277, 0, 0, 0, 1, 1,
1.187787, 0.2595692, 2.042125, 0, 0, 0, 1, 1,
1.205619, 0.5774727, 0.5377769, 0, 0, 0, 1, 1,
1.207252, -0.143374, 2.339228, 0, 0, 0, 1, 1,
1.209708, 0.02311468, 1.146777, 0, 0, 0, 1, 1,
1.214146, 0.01827826, -0.2220078, 0, 0, 0, 1, 1,
1.214484, 0.1900589, 1.554395, 1, 1, 1, 1, 1,
1.215735, 3.562445, 1.871768, 1, 1, 1, 1, 1,
1.224016, -0.9676099, 1.266738, 1, 1, 1, 1, 1,
1.226594, -0.3469046, 2.746556, 1, 1, 1, 1, 1,
1.226714, 1.540626, 1.704943, 1, 1, 1, 1, 1,
1.227478, -0.4048352, 2.343821, 1, 1, 1, 1, 1,
1.230506, -0.4565021, 3.584594, 1, 1, 1, 1, 1,
1.23881, 0.3802804, 0.6670001, 1, 1, 1, 1, 1,
1.242185, -2.264721, 1.722317, 1, 1, 1, 1, 1,
1.242741, -0.5568633, 1.025671, 1, 1, 1, 1, 1,
1.263185, -1.024992, 2.648571, 1, 1, 1, 1, 1,
1.275247, -0.07885985, 3.196461, 1, 1, 1, 1, 1,
1.279344, 0.1107628, 1.642476, 1, 1, 1, 1, 1,
1.287612, -0.1100563, 2.96985, 1, 1, 1, 1, 1,
1.292178, 1.034699, -0.4568383, 1, 1, 1, 1, 1,
1.294261, -0.2736128, 1.91877, 0, 0, 1, 1, 1,
1.322074, 1.788507, -0.4388537, 1, 0, 0, 1, 1,
1.326663, 1.898944, 0.2085439, 1, 0, 0, 1, 1,
1.33148, 0.1771533, 2.459284, 1, 0, 0, 1, 1,
1.331961, 0.4492585, 1.364044, 1, 0, 0, 1, 1,
1.339905, -0.6125023, 1.696918, 1, 0, 0, 1, 1,
1.346217, -0.488919, 1.251979, 0, 0, 0, 1, 1,
1.355013, 0.2722922, 1.458523, 0, 0, 0, 1, 1,
1.385787, 1.746824, 0.5474101, 0, 0, 0, 1, 1,
1.386556, 0.162247, -1.033184, 0, 0, 0, 1, 1,
1.390725, -0.7970255, 2.503546, 0, 0, 0, 1, 1,
1.395679, -0.4997476, 2.104405, 0, 0, 0, 1, 1,
1.396566, 0.3203581, 3.357325, 0, 0, 0, 1, 1,
1.401348, -0.02097271, 1.988065, 1, 1, 1, 1, 1,
1.408713, 1.373053, -0.2530922, 1, 1, 1, 1, 1,
1.415371, -0.8291792, 3.050436, 1, 1, 1, 1, 1,
1.424237, -0.4715633, 2.099916, 1, 1, 1, 1, 1,
1.425224, 1.258123, 0.7011215, 1, 1, 1, 1, 1,
1.426, 0.04400331, 0.1088795, 1, 1, 1, 1, 1,
1.439208, -0.8364614, 2.615288, 1, 1, 1, 1, 1,
1.43978, 1.535856, 2.387119, 1, 1, 1, 1, 1,
1.442499, -1.351148, 1.480824, 1, 1, 1, 1, 1,
1.457377, 1.500455, 1.349961, 1, 1, 1, 1, 1,
1.470016, 1.393631, 1.085734, 1, 1, 1, 1, 1,
1.476439, 1.456562, -0.2547016, 1, 1, 1, 1, 1,
1.478509, -1.020046, 1.747544, 1, 1, 1, 1, 1,
1.482201, 0.3688204, 2.909708, 1, 1, 1, 1, 1,
1.484954, -0.3276505, 1.412043, 1, 1, 1, 1, 1,
1.496739, -0.8358418, 1.213296, 0, 0, 1, 1, 1,
1.540851, -0.3260476, 1.336824, 1, 0, 0, 1, 1,
1.543542, 0.648527, 0.5922813, 1, 0, 0, 1, 1,
1.550784, 0.7434945, 2.311038, 1, 0, 0, 1, 1,
1.558241, -1.507566, 0.8104588, 1, 0, 0, 1, 1,
1.560041, 1.172742, 1.61382, 1, 0, 0, 1, 1,
1.562384, -1.002624, 2.544118, 0, 0, 0, 1, 1,
1.563367, 1.540918, 2.039154, 0, 0, 0, 1, 1,
1.565837, -0.7890072, 1.926398, 0, 0, 0, 1, 1,
1.568195, -1.15137, 1.71415, 0, 0, 0, 1, 1,
1.607524, -0.2902252, 2.372272, 0, 0, 0, 1, 1,
1.610611, -0.8017139, 3.317311, 0, 0, 0, 1, 1,
1.616048, -0.8154606, 2.188629, 0, 0, 0, 1, 1,
1.622399, 0.7880774, 0.7658975, 1, 1, 1, 1, 1,
1.624005, 0.3335592, 0.8938572, 1, 1, 1, 1, 1,
1.626833, 0.2653951, 1.14075, 1, 1, 1, 1, 1,
1.647827, 0.1972601, 1.660655, 1, 1, 1, 1, 1,
1.65295, -1.489513, 2.210048, 1, 1, 1, 1, 1,
1.676929, 0.4701239, 0.01933903, 1, 1, 1, 1, 1,
1.689996, -0.06177257, 2.167106, 1, 1, 1, 1, 1,
1.700513, 0.4197357, 1.731482, 1, 1, 1, 1, 1,
1.722452, -0.6594379, 1.653314, 1, 1, 1, 1, 1,
1.762254, 1.410829, 0.09326929, 1, 1, 1, 1, 1,
1.766873, 0.4541892, 1.874729, 1, 1, 1, 1, 1,
1.768142, -1.141577, 1.218109, 1, 1, 1, 1, 1,
1.769906, -0.2666093, 2.815944, 1, 1, 1, 1, 1,
1.772237, -0.4971467, 1.985908, 1, 1, 1, 1, 1,
1.797854, -1.25112, 1.710693, 1, 1, 1, 1, 1,
1.79814, 0.4830574, 1.312857, 0, 0, 1, 1, 1,
1.801915, 2.699754, 0.5648221, 1, 0, 0, 1, 1,
1.803261, 2.61265, -0.7301863, 1, 0, 0, 1, 1,
1.806512, 1.406985, -0.6684742, 1, 0, 0, 1, 1,
1.823416, 0.5673528, 1.636704, 1, 0, 0, 1, 1,
1.854829, -0.3942009, 1.60075, 1, 0, 0, 1, 1,
1.860663, -0.6174762, 3.470566, 0, 0, 0, 1, 1,
1.875962, -1.481556, 2.792309, 0, 0, 0, 1, 1,
1.904208, 1.528389, 0.1829741, 0, 0, 0, 1, 1,
1.906278, 0.7399571, 1.998801, 0, 0, 0, 1, 1,
1.908376, 2.062947, 1.25812, 0, 0, 0, 1, 1,
1.908642, 0.3461963, 2.564967, 0, 0, 0, 1, 1,
1.925016, -0.9008688, 1.699249, 0, 0, 0, 1, 1,
1.948249, 0.2484879, 2.12032, 1, 1, 1, 1, 1,
1.958516, 0.209842, 1.46548, 1, 1, 1, 1, 1,
1.965554, 0.4100124, 1.5343, 1, 1, 1, 1, 1,
1.967229, 1.321506, 1.166553, 1, 1, 1, 1, 1,
2.000491, -1.006681, 2.108382, 1, 1, 1, 1, 1,
2.065806, 1.803222, 2.024804, 1, 1, 1, 1, 1,
2.109718, 0.4350891, 1.054637, 1, 1, 1, 1, 1,
2.131601, -1.337066, 3.369891, 1, 1, 1, 1, 1,
2.15485, -0.01837581, 1.717007, 1, 1, 1, 1, 1,
2.175874, 1.381375, 0.3225587, 1, 1, 1, 1, 1,
2.219134, -0.5458989, 0.9812967, 1, 1, 1, 1, 1,
2.222279, -1.097973, 1.410185, 1, 1, 1, 1, 1,
2.230993, -0.1160558, 1.003367, 1, 1, 1, 1, 1,
2.243803, -0.1691249, 2.273178, 1, 1, 1, 1, 1,
2.294936, -0.1591316, 0.6309415, 1, 1, 1, 1, 1,
2.315918, -0.7371973, 0.01048098, 0, 0, 1, 1, 1,
2.329308, 1.650305, 2.189042, 1, 0, 0, 1, 1,
2.341736, -0.7584421, 2.250486, 1, 0, 0, 1, 1,
2.364973, 0.008020995, 1.336656, 1, 0, 0, 1, 1,
2.371181, -0.26429, 3.214069, 1, 0, 0, 1, 1,
2.429639, -0.4669244, 1.997025, 1, 0, 0, 1, 1,
2.440599, -1.077414, 3.296636, 0, 0, 0, 1, 1,
2.454562, -2.092997, 2.870299, 0, 0, 0, 1, 1,
2.571021, -0.2137925, 2.839879, 0, 0, 0, 1, 1,
2.60107, -1.860739, 3.22112, 0, 0, 0, 1, 1,
2.607809, 2.07196, 0.9548544, 0, 0, 0, 1, 1,
2.639051, -0.4343835, 2.526489, 0, 0, 0, 1, 1,
2.64026, 2.252713, 0.9151958, 0, 0, 0, 1, 1,
2.656214, 0.04662419, 0.5413415, 1, 1, 1, 1, 1,
2.793285, 0.1427695, 1.438084, 1, 1, 1, 1, 1,
2.95264, -0.5035687, 3.05497, 1, 1, 1, 1, 1,
2.972896, 0.6331767, 0.8332217, 1, 1, 1, 1, 1,
3.007826, 2.426144, 2.68945, 1, 1, 1, 1, 1,
3.164393, 0.6988138, 0.5434683, 1, 1, 1, 1, 1,
3.470329, -0.8134109, 1.188224, 1, 1, 1, 1, 1
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
var radius = 9.444531;
var distance = 33.17352;
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
mvMatrix.translate( -0.336085, -0.03888845, -0.1649621 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.17352);
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
