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
-3.810851, -0.04296489, -1.945371, 1, 0, 0, 1,
-3.26639, -1.131961, -1.565204, 1, 0.007843138, 0, 1,
-2.751057, 0.9281893, -0.7747761, 1, 0.01176471, 0, 1,
-2.739184, -0.2317429, -1.879832, 1, 0.01960784, 0, 1,
-2.719721, 0.4920369, -1.825079, 1, 0.02352941, 0, 1,
-2.626362, -1.078389, -1.246775, 1, 0.03137255, 0, 1,
-2.549572, 1.167084, -1.564278, 1, 0.03529412, 0, 1,
-2.517216, -0.9370897, -3.410252, 1, 0.04313726, 0, 1,
-2.462776, 0.03906135, -0.0297935, 1, 0.04705882, 0, 1,
-2.454495, 0.3943811, -1.206154, 1, 0.05490196, 0, 1,
-2.427621, -1.602796, -0.9870846, 1, 0.05882353, 0, 1,
-2.327189, 0.06219709, 0.00124197, 1, 0.06666667, 0, 1,
-2.303586, -0.1381719, -2.2627, 1, 0.07058824, 0, 1,
-2.24619, -1.877722, -4.069336, 1, 0.07843138, 0, 1,
-2.213688, -0.4047684, -0.6614896, 1, 0.08235294, 0, 1,
-2.156786, -1.721222, -1.882709, 1, 0.09019608, 0, 1,
-2.132905, 0.4388478, -0.9951947, 1, 0.09411765, 0, 1,
-2.073618, -0.9602604, 0.03393191, 1, 0.1019608, 0, 1,
-2.059959, -0.7436789, -2.547534, 1, 0.1098039, 0, 1,
-2.007931, 1.400933, 0.5958112, 1, 0.1137255, 0, 1,
-2.007594, -0.7526768, -2.937603, 1, 0.1215686, 0, 1,
-1.955564, -0.287964, -0.3475388, 1, 0.1254902, 0, 1,
-1.947953, 0.3421985, -1.81404, 1, 0.1333333, 0, 1,
-1.933439, 1.785923, -1.499858, 1, 0.1372549, 0, 1,
-1.931344, -0.3096696, -0.6205708, 1, 0.145098, 0, 1,
-1.922088, 0.7581297, -1.556166, 1, 0.1490196, 0, 1,
-1.913762, -0.2276308, -3.013732, 1, 0.1568628, 0, 1,
-1.867694, -0.2026465, -0.7769313, 1, 0.1607843, 0, 1,
-1.86498, -0.6725634, -1.779498, 1, 0.1686275, 0, 1,
-1.859548, -0.06882234, -0.2532404, 1, 0.172549, 0, 1,
-1.856285, 0.3738294, -3.060794, 1, 0.1803922, 0, 1,
-1.854715, 0.03180354, -1.98374, 1, 0.1843137, 0, 1,
-1.826417, 0.3418076, -1.366778, 1, 0.1921569, 0, 1,
-1.7816, -0.4478843, -1.539009, 1, 0.1960784, 0, 1,
-1.781205, -0.9398815, -2.187695, 1, 0.2039216, 0, 1,
-1.773355, -1.369721, -3.064641, 1, 0.2117647, 0, 1,
-1.756607, -0.6353076, -1.851432, 1, 0.2156863, 0, 1,
-1.746821, 0.5039951, -1.782699, 1, 0.2235294, 0, 1,
-1.71722, 0.1817349, -1.192795, 1, 0.227451, 0, 1,
-1.695681, -0.2538314, -1.556741, 1, 0.2352941, 0, 1,
-1.684521, 0.04266841, -1.653947, 1, 0.2392157, 0, 1,
-1.683568, 0.03837245, 0.08318891, 1, 0.2470588, 0, 1,
-1.671582, -0.1042708, -1.096959, 1, 0.2509804, 0, 1,
-1.66513, 0.4086886, -0.4857781, 1, 0.2588235, 0, 1,
-1.664851, -0.219781, -0.7425399, 1, 0.2627451, 0, 1,
-1.650043, -0.2752647, -1.309637, 1, 0.2705882, 0, 1,
-1.64847, 0.09560906, -1.172938, 1, 0.2745098, 0, 1,
-1.63274, -0.1986047, -0.1725161, 1, 0.282353, 0, 1,
-1.632512, -0.3323081, -3.033399, 1, 0.2862745, 0, 1,
-1.622533, -0.9978793, -1.000648, 1, 0.2941177, 0, 1,
-1.618563, 0.7727999, -0.978788, 1, 0.3019608, 0, 1,
-1.612754, -0.2812183, -1.85464, 1, 0.3058824, 0, 1,
-1.6076, -0.2613819, -2.666039, 1, 0.3137255, 0, 1,
-1.588102, -0.1493036, -1.230458, 1, 0.3176471, 0, 1,
-1.577789, -0.9682415, -2.009366, 1, 0.3254902, 0, 1,
-1.574572, 0.6544266, -0.2406294, 1, 0.3294118, 0, 1,
-1.564519, 1.176145, -2.260524, 1, 0.3372549, 0, 1,
-1.562758, -0.8193224, -1.982332, 1, 0.3411765, 0, 1,
-1.559593, 0.4187889, -0.5763826, 1, 0.3490196, 0, 1,
-1.536502, 0.2766671, -2.017658, 1, 0.3529412, 0, 1,
-1.52081, 1.075857, -0.6222094, 1, 0.3607843, 0, 1,
-1.515062, -0.6671305, -2.872338, 1, 0.3647059, 0, 1,
-1.509247, 0.8414593, -0.3748042, 1, 0.372549, 0, 1,
-1.497392, -0.473852, -1.689582, 1, 0.3764706, 0, 1,
-1.494385, -0.1599551, -0.6724112, 1, 0.3843137, 0, 1,
-1.49274, 1.457613, -2.018388, 1, 0.3882353, 0, 1,
-1.486216, 1.807196, 0.5668388, 1, 0.3960784, 0, 1,
-1.483455, 0.7823907, 0.6033461, 1, 0.4039216, 0, 1,
-1.479509, -0.178592, -1.252497, 1, 0.4078431, 0, 1,
-1.477389, -0.8211719, -1.147162, 1, 0.4156863, 0, 1,
-1.476986, -0.1986028, -3.30762, 1, 0.4196078, 0, 1,
-1.462885, 2.177601, -0.7910526, 1, 0.427451, 0, 1,
-1.449527, 0.7658834, 0.8392944, 1, 0.4313726, 0, 1,
-1.447081, 0.3428015, -1.288786, 1, 0.4392157, 0, 1,
-1.44681, -0.9010559, -2.475554, 1, 0.4431373, 0, 1,
-1.440282, -1.848008, -4.423089, 1, 0.4509804, 0, 1,
-1.430996, 0.3329672, -0.3545155, 1, 0.454902, 0, 1,
-1.414881, -0.1447416, -0.8710338, 1, 0.4627451, 0, 1,
-1.405453, 1.360801, 1.431808, 1, 0.4666667, 0, 1,
-1.397002, 0.004823136, -1.927417, 1, 0.4745098, 0, 1,
-1.390575, -0.4495178, -1.245542, 1, 0.4784314, 0, 1,
-1.38656, 0.4909014, 0.5643727, 1, 0.4862745, 0, 1,
-1.385649, 0.6862933, 0.3734142, 1, 0.4901961, 0, 1,
-1.371415, 0.8582361, -1.108095, 1, 0.4980392, 0, 1,
-1.361385, -1.087308, -2.611517, 1, 0.5058824, 0, 1,
-1.358228, -1.230488, -2.494784, 1, 0.509804, 0, 1,
-1.352247, 0.9602526, -1.8464, 1, 0.5176471, 0, 1,
-1.349919, -0.01993718, -1.218529, 1, 0.5215687, 0, 1,
-1.344482, -2.45118, -2.212988, 1, 0.5294118, 0, 1,
-1.327121, 0.02105356, -2.43609, 1, 0.5333334, 0, 1,
-1.323029, 1.446399, -1.463238, 1, 0.5411765, 0, 1,
-1.302346, 2.094, -1.52935, 1, 0.5450981, 0, 1,
-1.300739, -0.7922946, 0.1737777, 1, 0.5529412, 0, 1,
-1.290204, 1.056994, -0.8066705, 1, 0.5568628, 0, 1,
-1.287274, 0.1798086, -3.185052, 1, 0.5647059, 0, 1,
-1.283384, 0.2068729, -1.976363, 1, 0.5686275, 0, 1,
-1.268684, -0.3390204, -2.108752, 1, 0.5764706, 0, 1,
-1.264942, -1.19761, -2.621391, 1, 0.5803922, 0, 1,
-1.263869, -0.2123912, -2.559315, 1, 0.5882353, 0, 1,
-1.262932, 0.4359848, -1.233043, 1, 0.5921569, 0, 1,
-1.262837, -1.377498, -0.5178019, 1, 0.6, 0, 1,
-1.257519, 0.4204102, 0.6014896, 1, 0.6078432, 0, 1,
-1.252429, -1.633742, -3.993896, 1, 0.6117647, 0, 1,
-1.249974, 0.05302673, -1.807249, 1, 0.6196079, 0, 1,
-1.245347, 1.005221, -0.5098426, 1, 0.6235294, 0, 1,
-1.244723, -0.1478758, -3.17044, 1, 0.6313726, 0, 1,
-1.235316, 1.607474, -1.838641, 1, 0.6352941, 0, 1,
-1.230973, -0.6105198, -2.026546, 1, 0.6431373, 0, 1,
-1.227469, -0.5327101, -1.511848, 1, 0.6470588, 0, 1,
-1.226515, -1.430413, -1.341381, 1, 0.654902, 0, 1,
-1.224005, -1.285931, 0.619414, 1, 0.6588235, 0, 1,
-1.215508, 0.373354, -1.128409, 1, 0.6666667, 0, 1,
-1.215295, -0.3728527, -1.790193, 1, 0.6705883, 0, 1,
-1.209512, 0.7517768, 0.2894433, 1, 0.6784314, 0, 1,
-1.208567, -0.2737917, -1.967021, 1, 0.682353, 0, 1,
-1.207519, 0.9877912, -1.469716, 1, 0.6901961, 0, 1,
-1.204434, 0.256928, -0.1577165, 1, 0.6941177, 0, 1,
-1.194852, 0.2837508, -2.293718, 1, 0.7019608, 0, 1,
-1.189694, 0.915251, -2.244256, 1, 0.7098039, 0, 1,
-1.185479, 1.478559, -0.9518495, 1, 0.7137255, 0, 1,
-1.172338, -0.305198, -2.185173, 1, 0.7215686, 0, 1,
-1.169712, -0.3653031, -0.8642658, 1, 0.7254902, 0, 1,
-1.166573, 1.696956, -0.1561936, 1, 0.7333333, 0, 1,
-1.166451, -3.150372, -1.464029, 1, 0.7372549, 0, 1,
-1.155127, 0.1097493, -0.8958822, 1, 0.7450981, 0, 1,
-1.153753, -0.1152046, -1.989441, 1, 0.7490196, 0, 1,
-1.153386, 1.504832, -1.06741, 1, 0.7568628, 0, 1,
-1.153117, 0.8562786, -0.9518688, 1, 0.7607843, 0, 1,
-1.151538, -0.2463512, -1.391803, 1, 0.7686275, 0, 1,
-1.151267, -0.7063853, -0.8235389, 1, 0.772549, 0, 1,
-1.146757, 1.731207, -2.593182, 1, 0.7803922, 0, 1,
-1.140924, 1.805691, -1.50879, 1, 0.7843137, 0, 1,
-1.140423, 0.7461711, 0.7054582, 1, 0.7921569, 0, 1,
-1.139571, 0.6351808, 0.0369207, 1, 0.7960784, 0, 1,
-1.138529, 0.5171628, -0.03969641, 1, 0.8039216, 0, 1,
-1.135259, -1.693465, -2.892067, 1, 0.8117647, 0, 1,
-1.129698, 0.2188365, -3.499598, 1, 0.8156863, 0, 1,
-1.122793, 0.7548761, -1.756699, 1, 0.8235294, 0, 1,
-1.107053, 0.7330396, -1.433573, 1, 0.827451, 0, 1,
-1.0982, 0.6210392, -0.6454299, 1, 0.8352941, 0, 1,
-1.092785, -0.5015534, -0.6246281, 1, 0.8392157, 0, 1,
-1.089006, -0.5757747, -2.227779, 1, 0.8470588, 0, 1,
-1.085478, 0.01850504, -3.533208, 1, 0.8509804, 0, 1,
-1.080207, 0.7758351, -0.718143, 1, 0.8588235, 0, 1,
-1.078165, -1.675014, -3.053247, 1, 0.8627451, 0, 1,
-1.077847, 0.270514, -1.022194, 1, 0.8705882, 0, 1,
-1.071406, -0.7165461, -0.7786765, 1, 0.8745098, 0, 1,
-1.069912, -0.7264705, -2.488911, 1, 0.8823529, 0, 1,
-1.065283, -0.8708895, -1.814818, 1, 0.8862745, 0, 1,
-1.063185, 0.5966904, -1.319206, 1, 0.8941177, 0, 1,
-1.062779, -1.218062, -2.039619, 1, 0.8980392, 0, 1,
-1.062042, 0.3722131, -1.273376, 1, 0.9058824, 0, 1,
-1.055109, -0.2629954, -1.534248, 1, 0.9137255, 0, 1,
-1.053789, -0.2391416, -2.98645, 1, 0.9176471, 0, 1,
-1.053633, 0.4296826, -1.114416, 1, 0.9254902, 0, 1,
-1.052991, -1.646374, -2.478894, 1, 0.9294118, 0, 1,
-1.046676, 0.9977365, -0.5267513, 1, 0.9372549, 0, 1,
-1.044109, 1.117634, 0.1248651, 1, 0.9411765, 0, 1,
-1.04192, -0.07806616, 0.09794112, 1, 0.9490196, 0, 1,
-1.041066, -0.909869, -3.066558, 1, 0.9529412, 0, 1,
-1.040334, 0.3686638, -1.750044, 1, 0.9607843, 0, 1,
-1.029107, -0.9605567, -3.83446, 1, 0.9647059, 0, 1,
-1.022999, 0.6167573, -1.041237, 1, 0.972549, 0, 1,
-1.017965, -1.371283, -1.824714, 1, 0.9764706, 0, 1,
-1.015888, 0.6208299, -1.60961, 1, 0.9843137, 0, 1,
-1.014154, 0.1549067, -1.233104, 1, 0.9882353, 0, 1,
-1.014012, 1.027804, -1.191933, 1, 0.9960784, 0, 1,
-1.009717, -0.1735152, -0.2969035, 0.9960784, 1, 0, 1,
-1.00468, 2.17299, -0.3325717, 0.9921569, 1, 0, 1,
-1.001737, 1.052216, -0.4578217, 0.9843137, 1, 0, 1,
-0.9986565, -0.9065519, -2.257726, 0.9803922, 1, 0, 1,
-0.9960505, 1.162842, -0.5549772, 0.972549, 1, 0, 1,
-0.9953187, 1.018616, -0.5916203, 0.9686275, 1, 0, 1,
-0.9882077, 0.5355904, -2.731201, 0.9607843, 1, 0, 1,
-0.9862741, 1.090955, 1.453024, 0.9568627, 1, 0, 1,
-0.9757267, 0.2410131, 0.001700963, 0.9490196, 1, 0, 1,
-0.9722434, 0.7614583, -0.3577081, 0.945098, 1, 0, 1,
-0.9624568, -0.1910057, 0.03620066, 0.9372549, 1, 0, 1,
-0.9597512, 0.7721959, -1.947817, 0.9333333, 1, 0, 1,
-0.9458361, 1.130645, -1.668331, 0.9254902, 1, 0, 1,
-0.9392924, -1.284449, -3.019981, 0.9215686, 1, 0, 1,
-0.9392269, 0.3977868, 0.1399223, 0.9137255, 1, 0, 1,
-0.9370328, 1.501335, -0.2179669, 0.9098039, 1, 0, 1,
-0.9349449, 0.3726939, -0.6459353, 0.9019608, 1, 0, 1,
-0.9347017, 0.3741725, -0.1044724, 0.8941177, 1, 0, 1,
-0.9338042, 0.3846229, -0.4369045, 0.8901961, 1, 0, 1,
-0.9191675, 0.270338, -3.443047, 0.8823529, 1, 0, 1,
-0.9178779, -0.5485003, -2.366106, 0.8784314, 1, 0, 1,
-0.9164006, 0.2575714, -2.724142, 0.8705882, 1, 0, 1,
-0.9143992, -0.5140129, -2.291518, 0.8666667, 1, 0, 1,
-0.9123783, 0.06582665, -1.405075, 0.8588235, 1, 0, 1,
-0.9092812, 0.2934736, -2.37972, 0.854902, 1, 0, 1,
-0.9080284, 0.6409132, -1.065098, 0.8470588, 1, 0, 1,
-0.9056963, 0.3375701, -1.44154, 0.8431373, 1, 0, 1,
-0.8980623, 0.3490535, -1.643299, 0.8352941, 1, 0, 1,
-0.8970517, 0.4261009, -0.3372625, 0.8313726, 1, 0, 1,
-0.8965569, 1.386757, -1.590678, 0.8235294, 1, 0, 1,
-0.8937009, -0.5946583, -2.528528, 0.8196079, 1, 0, 1,
-0.8936656, 0.9293879, -0.9210743, 0.8117647, 1, 0, 1,
-0.8883809, -0.337907, -1.345237, 0.8078431, 1, 0, 1,
-0.8883268, -0.5931073, -3.425122, 0.8, 1, 0, 1,
-0.8815833, -1.158971, -2.288804, 0.7921569, 1, 0, 1,
-0.8751864, 1.553174, 0.6737908, 0.7882353, 1, 0, 1,
-0.8750647, -0.3016689, -2.560957, 0.7803922, 1, 0, 1,
-0.8728185, -0.2568159, -1.602343, 0.7764706, 1, 0, 1,
-0.8710973, 0.3191623, -3.123828, 0.7686275, 1, 0, 1,
-0.868628, 0.3962694, -2.390537, 0.7647059, 1, 0, 1,
-0.8683455, -0.4050948, -2.671413, 0.7568628, 1, 0, 1,
-0.8652183, 1.125829, 0.04828299, 0.7529412, 1, 0, 1,
-0.8630841, 1.314041, 0.1558034, 0.7450981, 1, 0, 1,
-0.8542619, -0.7978588, -2.593498, 0.7411765, 1, 0, 1,
-0.8529837, -0.30112, -0.9612932, 0.7333333, 1, 0, 1,
-0.8521638, 0.4842935, -0.524684, 0.7294118, 1, 0, 1,
-0.8474737, -0.7200097, -2.671131, 0.7215686, 1, 0, 1,
-0.8463497, -1.150905, -1.424187, 0.7176471, 1, 0, 1,
-0.8451456, 0.6595126, 1.204185, 0.7098039, 1, 0, 1,
-0.8447511, 0.9787901, -1.980445, 0.7058824, 1, 0, 1,
-0.840512, -1.310963, -5.01392, 0.6980392, 1, 0, 1,
-0.8395053, -0.8126715, -4.054349, 0.6901961, 1, 0, 1,
-0.8370606, 1.472053, -1.247233, 0.6862745, 1, 0, 1,
-0.8321304, -0.5651253, -2.091674, 0.6784314, 1, 0, 1,
-0.8284652, -0.8902107, 0.5950589, 0.6745098, 1, 0, 1,
-0.827603, 1.039557, -0.7427061, 0.6666667, 1, 0, 1,
-0.8265257, -1.328987, -0.7848428, 0.6627451, 1, 0, 1,
-0.8264707, 0.8128564, -1.505211, 0.654902, 1, 0, 1,
-0.8233067, 1.503779, -0.8283593, 0.6509804, 1, 0, 1,
-0.8224195, 0.299997, -1.206601, 0.6431373, 1, 0, 1,
-0.8189099, -1.253671, -1.058624, 0.6392157, 1, 0, 1,
-0.8158854, -0.1014184, -1.570788, 0.6313726, 1, 0, 1,
-0.8155532, 1.604345, -0.6918398, 0.627451, 1, 0, 1,
-0.8138724, -1.81744, -2.551043, 0.6196079, 1, 0, 1,
-0.8129878, -0.836716, -1.50352, 0.6156863, 1, 0, 1,
-0.8127521, -0.149227, -0.9972532, 0.6078432, 1, 0, 1,
-0.805367, -0.721997, -3.916628, 0.6039216, 1, 0, 1,
-0.8032805, -0.1247671, -1.340182, 0.5960785, 1, 0, 1,
-0.799994, 0.1625133, -1.170763, 0.5882353, 1, 0, 1,
-0.7944355, -1.079947, -2.614336, 0.5843138, 1, 0, 1,
-0.7849759, 1.885269, -0.3168268, 0.5764706, 1, 0, 1,
-0.7823638, -0.688805, -3.488982, 0.572549, 1, 0, 1,
-0.7706424, 0.8233615, -1.344697, 0.5647059, 1, 0, 1,
-0.7671723, -0.6337096, -1.304347, 0.5607843, 1, 0, 1,
-0.764012, -0.4114053, -1.481729, 0.5529412, 1, 0, 1,
-0.7560765, 1.037018, -0.3068324, 0.5490196, 1, 0, 1,
-0.7524324, 0.6968976, -0.2133076, 0.5411765, 1, 0, 1,
-0.7522509, -1.083649, -1.726324, 0.5372549, 1, 0, 1,
-0.7477488, -0.1860829, -3.701008, 0.5294118, 1, 0, 1,
-0.7477059, 0.5575593, -0.3014107, 0.5254902, 1, 0, 1,
-0.7461455, -0.3478898, -0.4627829, 0.5176471, 1, 0, 1,
-0.745232, 1.743356, -0.3209452, 0.5137255, 1, 0, 1,
-0.7416806, -1.345185, -1.608368, 0.5058824, 1, 0, 1,
-0.7379246, 1.340714, -1.144832, 0.5019608, 1, 0, 1,
-0.7350433, 0.6257122, -2.3903, 0.4941176, 1, 0, 1,
-0.7342601, 0.2722585, -0.8659757, 0.4862745, 1, 0, 1,
-0.7309531, 0.2965722, -2.666712, 0.4823529, 1, 0, 1,
-0.7305424, 1.470376, 0.960637, 0.4745098, 1, 0, 1,
-0.7254385, 0.100721, -2.649798, 0.4705882, 1, 0, 1,
-0.7243562, -1.744446, -1.362469, 0.4627451, 1, 0, 1,
-0.7202917, 1.166158, -2.082541, 0.4588235, 1, 0, 1,
-0.7201368, 1.267815, 0.02265642, 0.4509804, 1, 0, 1,
-0.7114822, 0.07234088, -1.622384, 0.4470588, 1, 0, 1,
-0.7070736, 0.1339008, -0.7865504, 0.4392157, 1, 0, 1,
-0.7052545, 0.3419115, -1.127878, 0.4352941, 1, 0, 1,
-0.7039452, 1.10343, -0.3391125, 0.427451, 1, 0, 1,
-0.7037581, 0.7332316, -1.358402, 0.4235294, 1, 0, 1,
-0.701732, -1.70523, -4.391912, 0.4156863, 1, 0, 1,
-0.7013665, -0.6932948, -1.761347, 0.4117647, 1, 0, 1,
-0.7004256, -0.2545095, -2.896825, 0.4039216, 1, 0, 1,
-0.6947697, 0.2424011, -1.581597, 0.3960784, 1, 0, 1,
-0.6933159, -1.369742, -2.0364, 0.3921569, 1, 0, 1,
-0.6928675, 0.9551719, 0.05263857, 0.3843137, 1, 0, 1,
-0.6924288, 1.034639, 1.738203, 0.3803922, 1, 0, 1,
-0.6913922, 2.019251, -0.9620311, 0.372549, 1, 0, 1,
-0.6875517, -0.5075162, -3.576858, 0.3686275, 1, 0, 1,
-0.6818853, 0.02628511, -1.440504, 0.3607843, 1, 0, 1,
-0.669264, -0.5548801, -2.797424, 0.3568628, 1, 0, 1,
-0.6687587, 1.104768, -2.120301, 0.3490196, 1, 0, 1,
-0.664529, 0.807793, -0.6321791, 0.345098, 1, 0, 1,
-0.663394, 0.02202233, -1.585611, 0.3372549, 1, 0, 1,
-0.6601708, 0.4536512, -0.7743756, 0.3333333, 1, 0, 1,
-0.6534253, 1.419876, -1.272626, 0.3254902, 1, 0, 1,
-0.6469904, 0.7124001, -0.533047, 0.3215686, 1, 0, 1,
-0.6451997, 1.20754, -1.92928, 0.3137255, 1, 0, 1,
-0.6425852, -0.6392748, -1.965223, 0.3098039, 1, 0, 1,
-0.640466, 0.1855085, -2.943612, 0.3019608, 1, 0, 1,
-0.6303106, 2.021095, -1.109571, 0.2941177, 1, 0, 1,
-0.627089, -1.230402, -3.085692, 0.2901961, 1, 0, 1,
-0.6218952, -1.909606, -3.289143, 0.282353, 1, 0, 1,
-0.6181083, -0.8483841, -2.236502, 0.2784314, 1, 0, 1,
-0.6141727, -0.05511524, -1.365597, 0.2705882, 1, 0, 1,
-0.6068652, 1.545054, -0.5487341, 0.2666667, 1, 0, 1,
-0.5999675, -0.3277989, -2.874228, 0.2588235, 1, 0, 1,
-0.5965193, 0.5432829, -0.2428784, 0.254902, 1, 0, 1,
-0.5907526, -0.6416525, -0.684112, 0.2470588, 1, 0, 1,
-0.5879857, 0.5971323, -1.179168, 0.2431373, 1, 0, 1,
-0.5863757, -1.163237, -2.363501, 0.2352941, 1, 0, 1,
-0.584353, -1.113483, -3.179013, 0.2313726, 1, 0, 1,
-0.5817665, 0.05994371, -0.6696695, 0.2235294, 1, 0, 1,
-0.5774171, 0.9321746, -0.3727843, 0.2196078, 1, 0, 1,
-0.5740506, -1.100486, -3.100592, 0.2117647, 1, 0, 1,
-0.5728583, 0.5640078, -2.534824, 0.2078431, 1, 0, 1,
-0.5710413, 0.3521814, -1.473394, 0.2, 1, 0, 1,
-0.5579905, -1.351107, -2.450172, 0.1921569, 1, 0, 1,
-0.555003, 0.7288176, -2.780493, 0.1882353, 1, 0, 1,
-0.554511, -0.1711946, -3.061757, 0.1803922, 1, 0, 1,
-0.5536631, -0.3387219, -3.052885, 0.1764706, 1, 0, 1,
-0.5521133, -0.6315683, -0.1223401, 0.1686275, 1, 0, 1,
-0.5499777, -0.8176705, -2.07457, 0.1647059, 1, 0, 1,
-0.5491117, -0.6199719, -2.816874, 0.1568628, 1, 0, 1,
-0.5475374, -0.284894, -1.22185, 0.1529412, 1, 0, 1,
-0.5469002, 0.8074483, -0.8750032, 0.145098, 1, 0, 1,
-0.546583, -1.396008, -4.138877, 0.1411765, 1, 0, 1,
-0.5411431, -1.50229, -3.014685, 0.1333333, 1, 0, 1,
-0.5411099, 0.3531298, -0.07382881, 0.1294118, 1, 0, 1,
-0.5405701, 0.1354204, -1.338259, 0.1215686, 1, 0, 1,
-0.5383738, 0.5003096, -1.481673, 0.1176471, 1, 0, 1,
-0.5376925, 1.573237, 0.6309879, 0.1098039, 1, 0, 1,
-0.5354496, -1.146294, -2.78028, 0.1058824, 1, 0, 1,
-0.5320466, -0.8663704, -2.659852, 0.09803922, 1, 0, 1,
-0.5314943, -1.224564, -3.770431, 0.09019608, 1, 0, 1,
-0.5181046, 1.785724, -2.048491, 0.08627451, 1, 0, 1,
-0.5125737, 0.9186652, -0.4791248, 0.07843138, 1, 0, 1,
-0.512352, -0.8180763, -2.494756, 0.07450981, 1, 0, 1,
-0.506855, 0.9325544, -1.282642, 0.06666667, 1, 0, 1,
-0.5062084, -0.7822222, -2.636157, 0.0627451, 1, 0, 1,
-0.5043615, -0.1826654, -0.4313339, 0.05490196, 1, 0, 1,
-0.5023487, 0.08679602, -2.282247, 0.05098039, 1, 0, 1,
-0.5021079, -0.4537467, -1.853266, 0.04313726, 1, 0, 1,
-0.4829848, -0.8478054, -3.667341, 0.03921569, 1, 0, 1,
-0.4772623, 0.7482166, 0.8170846, 0.03137255, 1, 0, 1,
-0.4746516, 0.3594253, -0.3395392, 0.02745098, 1, 0, 1,
-0.473382, 0.8872148, 0.8585482, 0.01960784, 1, 0, 1,
-0.4709915, -0.222706, -1.875918, 0.01568628, 1, 0, 1,
-0.4675558, -0.2151428, -3.251083, 0.007843138, 1, 0, 1,
-0.4650167, -1.882359, -4.152376, 0.003921569, 1, 0, 1,
-0.4643873, -0.1370256, -0.7931826, 0, 1, 0.003921569, 1,
-0.4617813, 0.4174393, -0.5278462, 0, 1, 0.01176471, 1,
-0.4598165, 0.1669075, -2.147783, 0, 1, 0.01568628, 1,
-0.4565266, 0.4798239, -0.7967352, 0, 1, 0.02352941, 1,
-0.4481192, 0.008334307, -2.421463, 0, 1, 0.02745098, 1,
-0.4447879, 0.4493311, -1.411681, 0, 1, 0.03529412, 1,
-0.4395967, 0.1577551, -0.4423515, 0, 1, 0.03921569, 1,
-0.4351391, -0.03710394, -2.086404, 0, 1, 0.04705882, 1,
-0.426712, 1.850123, -0.3077917, 0, 1, 0.05098039, 1,
-0.4254893, 0.359991, -1.101514, 0, 1, 0.05882353, 1,
-0.419421, 0.2638144, 0.248958, 0, 1, 0.0627451, 1,
-0.4181523, -4.563123e-05, -1.744204, 0, 1, 0.07058824, 1,
-0.4144334, 0.7418177, -0.04150605, 0, 1, 0.07450981, 1,
-0.4091187, 0.427665, 1.074638, 0, 1, 0.08235294, 1,
-0.4017164, -0.8929233, -2.161407, 0, 1, 0.08627451, 1,
-0.3999925, 0.7018247, -0.6801136, 0, 1, 0.09411765, 1,
-0.3991158, -0.3182781, -3.642903, 0, 1, 0.1019608, 1,
-0.39705, -0.5610664, -1.900921, 0, 1, 0.1058824, 1,
-0.3939724, 0.4582422, -0.8199185, 0, 1, 0.1137255, 1,
-0.3938668, 0.6675797, -3.395686, 0, 1, 0.1176471, 1,
-0.3926712, -0.9836769, -2.272902, 0, 1, 0.1254902, 1,
-0.3896368, 0.4867646, -0.9477166, 0, 1, 0.1294118, 1,
-0.3813478, 1.655576, -1.866995, 0, 1, 0.1372549, 1,
-0.3802492, -1.021615, -2.147011, 0, 1, 0.1411765, 1,
-0.3791921, 0.9254926, 0.5208252, 0, 1, 0.1490196, 1,
-0.3768846, -1.423568, -2.235212, 0, 1, 0.1529412, 1,
-0.374486, -0.3544666, -2.659225, 0, 1, 0.1607843, 1,
-0.373854, 0.9467253, -0.2803352, 0, 1, 0.1647059, 1,
-0.3692026, 0.265459, -0.202766, 0, 1, 0.172549, 1,
-0.3664815, -1.479398, -2.014214, 0, 1, 0.1764706, 1,
-0.3663002, 0.05357006, -1.997041, 0, 1, 0.1843137, 1,
-0.3647681, -1.3534, -3.977043, 0, 1, 0.1882353, 1,
-0.3640281, 0.226437, -0.4523666, 0, 1, 0.1960784, 1,
-0.3638718, -0.7453981, -4.570516, 0, 1, 0.2039216, 1,
-0.3536911, 0.7739093, -0.7056141, 0, 1, 0.2078431, 1,
-0.3472711, -0.6508622, -2.22884, 0, 1, 0.2156863, 1,
-0.3459079, -1.19164, -4.302255, 0, 1, 0.2196078, 1,
-0.3423502, -0.6266452, -2.158017, 0, 1, 0.227451, 1,
-0.3408462, 1.175255, 0.2898108, 0, 1, 0.2313726, 1,
-0.3401131, -0.03390397, -0.7280411, 0, 1, 0.2392157, 1,
-0.3399141, 0.8062678, -1.960289, 0, 1, 0.2431373, 1,
-0.3359956, 0.1528227, -0.09109043, 0, 1, 0.2509804, 1,
-0.3305995, 1.902509, 0.1511724, 0, 1, 0.254902, 1,
-0.3213754, -0.8362241, -2.736586, 0, 1, 0.2627451, 1,
-0.3181519, -0.8176992, -2.496684, 0, 1, 0.2666667, 1,
-0.3128984, 0.9366907, 2.302757, 0, 1, 0.2745098, 1,
-0.3119184, -0.6820129, -0.2094253, 0, 1, 0.2784314, 1,
-0.310979, 1.622982, 0.1395989, 0, 1, 0.2862745, 1,
-0.3073636, -0.007379231, -2.497961, 0, 1, 0.2901961, 1,
-0.3051954, 0.1801499, -2.364099, 0, 1, 0.2980392, 1,
-0.3036449, 0.6516964, -0.9319308, 0, 1, 0.3058824, 1,
-0.300749, -0.2235074, -1.947237, 0, 1, 0.3098039, 1,
-0.2975118, 0.06389861, -0.2431516, 0, 1, 0.3176471, 1,
-0.2916695, 0.7585272, -0.9124793, 0, 1, 0.3215686, 1,
-0.2878809, -1.052242, -3.729416, 0, 1, 0.3294118, 1,
-0.2861384, -1.713804, -3.563713, 0, 1, 0.3333333, 1,
-0.2846015, -2.143369, -2.773342, 0, 1, 0.3411765, 1,
-0.2796957, 0.3164255, -1.271916, 0, 1, 0.345098, 1,
-0.2732838, -1.098029, -2.430419, 0, 1, 0.3529412, 1,
-0.2730122, -0.2355634, -0.9008384, 0, 1, 0.3568628, 1,
-0.2729102, -1.505593, -2.603597, 0, 1, 0.3647059, 1,
-0.2717492, -0.3659933, -3.55704, 0, 1, 0.3686275, 1,
-0.2695222, -0.8212013, -1.327503, 0, 1, 0.3764706, 1,
-0.2674987, 1.333839, -0.5042773, 0, 1, 0.3803922, 1,
-0.2562985, -1.150934, -2.279588, 0, 1, 0.3882353, 1,
-0.2531268, 0.6671705, -0.8972844, 0, 1, 0.3921569, 1,
-0.2477962, 2.030366, 0.3039447, 0, 1, 0.4, 1,
-0.2433455, -0.2581906, -2.366725, 0, 1, 0.4078431, 1,
-0.2372394, -0.7830402, -3.199457, 0, 1, 0.4117647, 1,
-0.2370984, 0.04745651, -0.1014388, 0, 1, 0.4196078, 1,
-0.2362124, 0.1885581, 0.01549297, 0, 1, 0.4235294, 1,
-0.2342523, -0.4423877, -3.565056, 0, 1, 0.4313726, 1,
-0.2334864, 0.6941867, 0.4024473, 0, 1, 0.4352941, 1,
-0.2327258, 1.22941, 0.3580066, 0, 1, 0.4431373, 1,
-0.2297403, 1.768155, -0.006793747, 0, 1, 0.4470588, 1,
-0.2291781, -0.5538662, -3.842327, 0, 1, 0.454902, 1,
-0.2272528, -0.9511976, -3.636505, 0, 1, 0.4588235, 1,
-0.226118, 0.4030098, -0.222525, 0, 1, 0.4666667, 1,
-0.2229062, -0.5625585, -3.275522, 0, 1, 0.4705882, 1,
-0.2174391, -0.3434375, -2.468573, 0, 1, 0.4784314, 1,
-0.2124478, -0.2871641, -1.398138, 0, 1, 0.4823529, 1,
-0.2120296, -1.2339, -2.231346, 0, 1, 0.4901961, 1,
-0.2110898, -1.738379, -2.509817, 0, 1, 0.4941176, 1,
-0.2056386, -0.6559175, -3.696383, 0, 1, 0.5019608, 1,
-0.2011726, -1.386804, -3.846386, 0, 1, 0.509804, 1,
-0.1998609, -0.8057699, -1.795795, 0, 1, 0.5137255, 1,
-0.1987021, -1.717352, -1.972866, 0, 1, 0.5215687, 1,
-0.1986481, 0.2249968, -0.4768929, 0, 1, 0.5254902, 1,
-0.197276, 1.075834, -0.7768042, 0, 1, 0.5333334, 1,
-0.1894269, 0.07633036, 0.7238383, 0, 1, 0.5372549, 1,
-0.1871502, 0.7607872, -1.345803, 0, 1, 0.5450981, 1,
-0.1864544, 0.3244708, -2.052665, 0, 1, 0.5490196, 1,
-0.1845603, -0.3656763, -4.857354, 0, 1, 0.5568628, 1,
-0.1841788, 0.0595121, -1.139205, 0, 1, 0.5607843, 1,
-0.1815192, -0.5990749, -3.038345, 0, 1, 0.5686275, 1,
-0.1779059, 0.2338714, -1.3308, 0, 1, 0.572549, 1,
-0.1749766, 0.7232587, -0.01286258, 0, 1, 0.5803922, 1,
-0.1719212, 1.048342, 0.7343563, 0, 1, 0.5843138, 1,
-0.1639447, 0.4945809, 0.2535626, 0, 1, 0.5921569, 1,
-0.1561233, 0.5645451, 1.632279, 0, 1, 0.5960785, 1,
-0.155505, -0.2566201, -1.792419, 0, 1, 0.6039216, 1,
-0.1542954, 0.2425321, -1.057723, 0, 1, 0.6117647, 1,
-0.1482454, 0.154427, -0.3939815, 0, 1, 0.6156863, 1,
-0.1443832, -0.2898539, -1.581664, 0, 1, 0.6235294, 1,
-0.1415627, -0.4386979, -0.5232385, 0, 1, 0.627451, 1,
-0.1401928, 0.2103279, -0.6924587, 0, 1, 0.6352941, 1,
-0.1401667, 0.3848991, -0.8771245, 0, 1, 0.6392157, 1,
-0.1356565, 1.063888, 0.8063725, 0, 1, 0.6470588, 1,
-0.1331655, 0.5763316, -0.4155053, 0, 1, 0.6509804, 1,
-0.132858, -0.5061234, -1.7427, 0, 1, 0.6588235, 1,
-0.1318764, -0.1395361, -1.921767, 0, 1, 0.6627451, 1,
-0.1289762, 1.296949, 0.4750031, 0, 1, 0.6705883, 1,
-0.1247415, 1.062296, -1.137463, 0, 1, 0.6745098, 1,
-0.1231196, -1.691091, -2.384026, 0, 1, 0.682353, 1,
-0.121256, 0.8064862, 1.157553, 0, 1, 0.6862745, 1,
-0.1195482, 0.2123176, 0.1376335, 0, 1, 0.6941177, 1,
-0.1189018, -1.096497, -3.617212, 0, 1, 0.7019608, 1,
-0.1151432, 1.878492, 0.5136909, 0, 1, 0.7058824, 1,
-0.1097177, 1.134952, 1.639428, 0, 1, 0.7137255, 1,
-0.1091362, 0.01137937, -2.124639, 0, 1, 0.7176471, 1,
-0.1082023, -0.473613, -2.503541, 0, 1, 0.7254902, 1,
-0.1078488, -0.2041119, -2.742864, 0, 1, 0.7294118, 1,
-0.1076985, 0.02977958, -0.5618358, 0, 1, 0.7372549, 1,
-0.1070809, 0.1135528, 0.8357127, 0, 1, 0.7411765, 1,
-0.1067066, -1.090775, -3.416525, 0, 1, 0.7490196, 1,
-0.106632, -1.714113, -4.296874, 0, 1, 0.7529412, 1,
-0.1009886, -0.6039981, -3.303427, 0, 1, 0.7607843, 1,
-0.09840792, -0.06785669, -2.023199, 0, 1, 0.7647059, 1,
-0.09608988, -0.980673, -3.430021, 0, 1, 0.772549, 1,
-0.09140167, -0.3379825, -3.513561, 0, 1, 0.7764706, 1,
-0.09107877, 0.221885, -0.433052, 0, 1, 0.7843137, 1,
-0.08818793, 0.4401785, 0.5195881, 0, 1, 0.7882353, 1,
-0.08802442, -0.002251237, -0.1955578, 0, 1, 0.7960784, 1,
-0.0856663, -1.04215, -2.750871, 0, 1, 0.8039216, 1,
-0.08552533, 0.7882193, 1.615949, 0, 1, 0.8078431, 1,
-0.08130521, 0.2380103, 0.1477127, 0, 1, 0.8156863, 1,
-0.08104314, -0.02114179, -0.9954363, 0, 1, 0.8196079, 1,
-0.07695093, 0.3109884, 0.2812646, 0, 1, 0.827451, 1,
-0.07686184, 1.350882, -0.4821577, 0, 1, 0.8313726, 1,
-0.06813162, -1.490032, -3.226225, 0, 1, 0.8392157, 1,
-0.06705549, -0.3392824, -3.259353, 0, 1, 0.8431373, 1,
-0.06265335, -0.7852703, -5.606818, 0, 1, 0.8509804, 1,
-0.05658446, -0.1252785, -3.363301, 0, 1, 0.854902, 1,
-0.05243095, 0.9625424, -2.06022, 0, 1, 0.8627451, 1,
-0.05170256, -1.437653, -2.68152, 0, 1, 0.8666667, 1,
-0.05054723, -0.6263463, -2.608415, 0, 1, 0.8745098, 1,
-0.04862712, 0.9633122, 0.5550945, 0, 1, 0.8784314, 1,
-0.04370559, 0.5919709, 1.666117, 0, 1, 0.8862745, 1,
-0.04349997, -0.3091622, -3.521564, 0, 1, 0.8901961, 1,
-0.04306532, 2.432991, -1.109611, 0, 1, 0.8980392, 1,
-0.03923766, 0.6544116, -0.3969748, 0, 1, 0.9058824, 1,
-0.03494159, 0.5098107, 1.019226, 0, 1, 0.9098039, 1,
-0.03341556, -1.493843, -3.410186, 0, 1, 0.9176471, 1,
-0.02755876, 1.250697, -0.4608494, 0, 1, 0.9215686, 1,
-0.02720417, 0.7913936, -0.1753258, 0, 1, 0.9294118, 1,
-0.02634513, 0.1862705, 0.3904573, 0, 1, 0.9333333, 1,
-0.02504658, -0.4897355, -1.276289, 0, 1, 0.9411765, 1,
-0.02455305, -0.5778416, -2.278947, 0, 1, 0.945098, 1,
-0.01657805, 0.8040281, -0.6642381, 0, 1, 0.9529412, 1,
-0.0106176, 1.327303, -0.9608924, 0, 1, 0.9568627, 1,
-0.009036215, 1.546821, -2.484134, 0, 1, 0.9647059, 1,
-0.006910554, -0.3672493, -2.524992, 0, 1, 0.9686275, 1,
-0.005032246, -0.5919647, -4.753648, 0, 1, 0.9764706, 1,
-0.004871489, -0.2447685, -3.505181, 0, 1, 0.9803922, 1,
-0.004733953, -1.598512, -4.526308, 0, 1, 0.9882353, 1,
-0.002758567, -1.010594, -3.446227, 0, 1, 0.9921569, 1,
0.0003094056, -1.338079, 2.439118, 0, 1, 1, 1,
0.002572277, -1.834671, 3.114161, 0, 0.9921569, 1, 1,
0.007766028, 0.2337415, -0.2497208, 0, 0.9882353, 1, 1,
0.008100594, 1.620538, 0.7210562, 0, 0.9803922, 1, 1,
0.01530995, 0.703671, -0.468527, 0, 0.9764706, 1, 1,
0.01552634, -0.2623363, 2.912306, 0, 0.9686275, 1, 1,
0.01587735, -0.1578461, 4.517914, 0, 0.9647059, 1, 1,
0.01665465, -2.968476, 4.001233, 0, 0.9568627, 1, 1,
0.0189613, -0.6213454, 1.933437, 0, 0.9529412, 1, 1,
0.02176735, 0.2816699, 0.5695821, 0, 0.945098, 1, 1,
0.02467858, 0.0265593, 0.04708589, 0, 0.9411765, 1, 1,
0.02514081, 0.3727891, 0.3204589, 0, 0.9333333, 1, 1,
0.02638512, 0.3538646, 0.6276618, 0, 0.9294118, 1, 1,
0.02716552, 1.136645, 1.661684, 0, 0.9215686, 1, 1,
0.02927831, 0.5180964, 2.033425, 0, 0.9176471, 1, 1,
0.03856723, 1.439566, 0.08351159, 0, 0.9098039, 1, 1,
0.03995648, 0.4061355, 0.9146661, 0, 0.9058824, 1, 1,
0.0411741, 1.595044, -1.0359, 0, 0.8980392, 1, 1,
0.04208625, 0.1200373, -0.08441673, 0, 0.8901961, 1, 1,
0.04281233, 0.8561118, 1.042922, 0, 0.8862745, 1, 1,
0.04884089, 0.1584654, -0.5398253, 0, 0.8784314, 1, 1,
0.05261584, 0.09138621, 0.02077547, 0, 0.8745098, 1, 1,
0.05304766, -0.1400907, 2.465801, 0, 0.8666667, 1, 1,
0.05307799, 0.06029072, 0.2023394, 0, 0.8627451, 1, 1,
0.05514406, -0.3818317, 2.694838, 0, 0.854902, 1, 1,
0.06179844, -0.1551464, 4.44664, 0, 0.8509804, 1, 1,
0.0639768, -0.5328664, 1.037103, 0, 0.8431373, 1, 1,
0.0647897, 2.129019, 1.962403, 0, 0.8392157, 1, 1,
0.0648123, -0.1909594, 1.217701, 0, 0.8313726, 1, 1,
0.06669728, 0.8359212, 0.6295183, 0, 0.827451, 1, 1,
0.06761102, -1.106223, 1.435928, 0, 0.8196079, 1, 1,
0.06840538, -0.2845654, 3.803671, 0, 0.8156863, 1, 1,
0.06866413, -0.8201274, 2.936003, 0, 0.8078431, 1, 1,
0.07625828, 0.7066723, 0.3356483, 0, 0.8039216, 1, 1,
0.07878179, 1.279152, -1.612586, 0, 0.7960784, 1, 1,
0.07949234, 0.4154244, 0.4037517, 0, 0.7882353, 1, 1,
0.08359689, 0.7155157, -1.743055, 0, 0.7843137, 1, 1,
0.08843181, 1.289785, 0.7078543, 0, 0.7764706, 1, 1,
0.09395795, -1.478574, 3.508649, 0, 0.772549, 1, 1,
0.0958866, 0.8633993, 0.4808531, 0, 0.7647059, 1, 1,
0.09766056, -1.622007, 2.815351, 0, 0.7607843, 1, 1,
0.1010416, 0.7099174, 0.8521505, 0, 0.7529412, 1, 1,
0.1020469, -0.8056284, 5.432872, 0, 0.7490196, 1, 1,
0.1022609, -1.766658, 3.514436, 0, 0.7411765, 1, 1,
0.1066107, 0.3082041, 0.6224353, 0, 0.7372549, 1, 1,
0.1077454, 0.1049319, 0.3875108, 0, 0.7294118, 1, 1,
0.1185391, -0.5122132, 3.968112, 0, 0.7254902, 1, 1,
0.1191219, -0.09497159, 2.6648, 0, 0.7176471, 1, 1,
0.119189, -0.6644188, 3.734098, 0, 0.7137255, 1, 1,
0.1225258, -0.6636437, 2.242672, 0, 0.7058824, 1, 1,
0.1257382, -0.2145448, 3.484218, 0, 0.6980392, 1, 1,
0.1276188, -1.673994, 3.55209, 0, 0.6941177, 1, 1,
0.1313229, 1.084746, 1.781231, 0, 0.6862745, 1, 1,
0.1331318, 0.0862011, 1.690858, 0, 0.682353, 1, 1,
0.1338089, 0.1715112, -0.2823095, 0, 0.6745098, 1, 1,
0.1398164, -0.8476726, 1.727439, 0, 0.6705883, 1, 1,
0.1482875, -0.3859808, 2.851094, 0, 0.6627451, 1, 1,
0.1488516, -1.086778, 3.710674, 0, 0.6588235, 1, 1,
0.1516088, 0.4480119, 0.6931038, 0, 0.6509804, 1, 1,
0.155512, -0.3509366, 3.557729, 0, 0.6470588, 1, 1,
0.1556769, -1.669043, 2.852784, 0, 0.6392157, 1, 1,
0.1617376, 0.588104, 0.5071642, 0, 0.6352941, 1, 1,
0.1721133, 1.491388, -2.055934, 0, 0.627451, 1, 1,
0.1837861, 0.6195271, 0.7283793, 0, 0.6235294, 1, 1,
0.18388, 0.1377741, 1.545767, 0, 0.6156863, 1, 1,
0.1876495, 1.61146, 0.3474236, 0, 0.6117647, 1, 1,
0.1878737, 0.4403912, -0.4943588, 0, 0.6039216, 1, 1,
0.1920919, -1.926145, 1.871147, 0, 0.5960785, 1, 1,
0.1941849, 0.8334991, 0.06045103, 0, 0.5921569, 1, 1,
0.1963321, -1.510467, 2.268308, 0, 0.5843138, 1, 1,
0.1963603, -0.3031438, 3.468601, 0, 0.5803922, 1, 1,
0.1981053, 0.5535167, 1.231211, 0, 0.572549, 1, 1,
0.2005174, -0.5161074, 2.893029, 0, 0.5686275, 1, 1,
0.201275, 0.5615328, 0.7919531, 0, 0.5607843, 1, 1,
0.2015688, 1.070086, 0.7731239, 0, 0.5568628, 1, 1,
0.2017579, -0.808782, 2.42369, 0, 0.5490196, 1, 1,
0.206862, -0.02106468, 2.44071, 0, 0.5450981, 1, 1,
0.2073282, -0.2660539, 0.7966692, 0, 0.5372549, 1, 1,
0.207765, 1.236109, -0.7029749, 0, 0.5333334, 1, 1,
0.2083124, -1.537211, 2.515471, 0, 0.5254902, 1, 1,
0.2123221, -0.3686607, 2.068204, 0, 0.5215687, 1, 1,
0.2154004, -0.217442, 3.905659, 0, 0.5137255, 1, 1,
0.2186127, 1.310626, -0.5412772, 0, 0.509804, 1, 1,
0.2284195, 1.140804, 0.4170934, 0, 0.5019608, 1, 1,
0.2286099, 0.9379013, 0.4386488, 0, 0.4941176, 1, 1,
0.2303992, 0.2721224, -0.1077417, 0, 0.4901961, 1, 1,
0.2329957, 1.678585, 1.47317, 0, 0.4823529, 1, 1,
0.235023, 1.898614, 1.106133, 0, 0.4784314, 1, 1,
0.2351363, -0.2355241, 2.131783, 0, 0.4705882, 1, 1,
0.2355368, 0.6336599, 0.8262956, 0, 0.4666667, 1, 1,
0.2385931, -0.3383443, 0.8951463, 0, 0.4588235, 1, 1,
0.2386678, -0.0002342846, 2.915052, 0, 0.454902, 1, 1,
0.2457167, -0.6325287, 3.560389, 0, 0.4470588, 1, 1,
0.2467198, 1.732825, -1.003366, 0, 0.4431373, 1, 1,
0.2496075, 0.2016641, 2.517725, 0, 0.4352941, 1, 1,
0.2496115, 0.8028125, -1.686178, 0, 0.4313726, 1, 1,
0.2502188, -0.5728581, 2.552006, 0, 0.4235294, 1, 1,
0.2512012, 0.5832961, -0.2718391, 0, 0.4196078, 1, 1,
0.2530399, 0.7972238, -0.4576138, 0, 0.4117647, 1, 1,
0.2547143, -1.981526, 3.487869, 0, 0.4078431, 1, 1,
0.2555086, 1.230131, -0.2470201, 0, 0.4, 1, 1,
0.2581197, -0.8406236, 3.188275, 0, 0.3921569, 1, 1,
0.2611575, 1.035983, -1.089869, 0, 0.3882353, 1, 1,
0.2644243, 0.3766314, 0.785311, 0, 0.3803922, 1, 1,
0.2673102, 0.5532414, 0.7197184, 0, 0.3764706, 1, 1,
0.2705913, 2.059541, -0.1754809, 0, 0.3686275, 1, 1,
0.2726997, -0.06892541, 3.323084, 0, 0.3647059, 1, 1,
0.2732151, 0.5762294, -1.421812, 0, 0.3568628, 1, 1,
0.2756347, 0.4443261, -1.05758, 0, 0.3529412, 1, 1,
0.2757092, -1.394245, 2.9062, 0, 0.345098, 1, 1,
0.2778831, 0.5923597, 0.2591051, 0, 0.3411765, 1, 1,
0.2785617, -0.8539085, 3.578733, 0, 0.3333333, 1, 1,
0.2798976, -1.39591, 3.371836, 0, 0.3294118, 1, 1,
0.2810347, -1.575281, 3.231305, 0, 0.3215686, 1, 1,
0.2830956, 0.2782121, 0.9244073, 0, 0.3176471, 1, 1,
0.2839977, -0.3230821, 1.218671, 0, 0.3098039, 1, 1,
0.2867039, 1.417365, 0.4578265, 0, 0.3058824, 1, 1,
0.2880462, 0.3373488, 0.2660635, 0, 0.2980392, 1, 1,
0.2924692, -0.5460581, 0.9242588, 0, 0.2901961, 1, 1,
0.2944079, -1.641719, 2.414649, 0, 0.2862745, 1, 1,
0.2946483, 0.2520443, 0.05092559, 0, 0.2784314, 1, 1,
0.29794, -2.376213, 3.742481, 0, 0.2745098, 1, 1,
0.2988686, -1.102679, 2.180629, 0, 0.2666667, 1, 1,
0.2989477, 1.570877, -1.211546, 0, 0.2627451, 1, 1,
0.301446, 1.19736, 0.4478035, 0, 0.254902, 1, 1,
0.3046086, 1.400161, 1.58841, 0, 0.2509804, 1, 1,
0.3050636, 0.08572677, -0.6984046, 0, 0.2431373, 1, 1,
0.3066052, -1.022612, 2.710215, 0, 0.2392157, 1, 1,
0.3110008, -1.096135, 3.699741, 0, 0.2313726, 1, 1,
0.3116198, 2.420321, 0.9568941, 0, 0.227451, 1, 1,
0.3167418, -0.6343436, 3.327473, 0, 0.2196078, 1, 1,
0.3172368, 1.65366, -0.2549319, 0, 0.2156863, 1, 1,
0.3206459, 0.8826174, -0.2277573, 0, 0.2078431, 1, 1,
0.321756, -0.607568, 1.681897, 0, 0.2039216, 1, 1,
0.322609, -0.9958012, 4.616784, 0, 0.1960784, 1, 1,
0.3234076, 0.1670806, 0.5771384, 0, 0.1882353, 1, 1,
0.3234555, 0.02951995, 2.465089, 0, 0.1843137, 1, 1,
0.3269189, -2.080233, 1.917646, 0, 0.1764706, 1, 1,
0.3292671, -1.28674, 2.165546, 0, 0.172549, 1, 1,
0.3323212, -0.9259109, 2.978723, 0, 0.1647059, 1, 1,
0.3347298, -0.5300727, 2.278862, 0, 0.1607843, 1, 1,
0.3363894, 0.2632144, -0.4605454, 0, 0.1529412, 1, 1,
0.3365121, -2.038554, 3.431953, 0, 0.1490196, 1, 1,
0.3434387, -0.6919423, 1.702873, 0, 0.1411765, 1, 1,
0.3448249, 0.2539825, 1.498448, 0, 0.1372549, 1, 1,
0.3455261, 0.713408, 0.7499102, 0, 0.1294118, 1, 1,
0.352113, -1.645122, 3.08848, 0, 0.1254902, 1, 1,
0.3528876, 1.134004, 2.878901, 0, 0.1176471, 1, 1,
0.3553767, 0.01593827, 2.776303, 0, 0.1137255, 1, 1,
0.3566047, 0.287831, 1.21129, 0, 0.1058824, 1, 1,
0.3583155, 0.02426285, 0.0795544, 0, 0.09803922, 1, 1,
0.3653046, 0.2860208, 2.363185, 0, 0.09411765, 1, 1,
0.3658753, -1.214784, 1.8144, 0, 0.08627451, 1, 1,
0.3659287, -0.1754102, 4.33867, 0, 0.08235294, 1, 1,
0.3667761, -0.1462101, 1.755581, 0, 0.07450981, 1, 1,
0.3689954, 2.890572, -0.7379144, 0, 0.07058824, 1, 1,
0.3694888, 1.625068, 2.057645, 0, 0.0627451, 1, 1,
0.3741553, 0.6534992, -0.3592595, 0, 0.05882353, 1, 1,
0.3744724, -1.288329, 3.233114, 0, 0.05098039, 1, 1,
0.3774937, 2.136416, 2.438497, 0, 0.04705882, 1, 1,
0.3774987, 1.580281, -1.842997, 0, 0.03921569, 1, 1,
0.3794901, 1.452418, 2.443774, 0, 0.03529412, 1, 1,
0.3801865, -0.07283025, 0.1860071, 0, 0.02745098, 1, 1,
0.3826199, -0.7377743, 1.139732, 0, 0.02352941, 1, 1,
0.3832776, 0.5916718, 1.818706, 0, 0.01568628, 1, 1,
0.3843652, 2.578925, -0.7675309, 0, 0.01176471, 1, 1,
0.3936548, 0.3972698, 1.569457, 0, 0.003921569, 1, 1,
0.3943977, 2.010145, 0.5043691, 0.003921569, 0, 1, 1,
0.4030447, -1.024843, 2.106584, 0.007843138, 0, 1, 1,
0.4039473, -0.2391074, 0.3499586, 0.01568628, 0, 1, 1,
0.4044253, -0.6843469, 3.291514, 0.01960784, 0, 1, 1,
0.4053621, -1.264955, 2.1785, 0.02745098, 0, 1, 1,
0.4086337, -1.192769, 2.70185, 0.03137255, 0, 1, 1,
0.4104528, 0.08685873, 3.763773, 0.03921569, 0, 1, 1,
0.4119323, -1.143839, 3.180278, 0.04313726, 0, 1, 1,
0.4150367, 0.9621006, 1.544616, 0.05098039, 0, 1, 1,
0.4208389, 0.3530692, 0.04933513, 0.05490196, 0, 1, 1,
0.4210605, -0.04012232, 2.193135, 0.0627451, 0, 1, 1,
0.421112, 0.1152943, 0.6398034, 0.06666667, 0, 1, 1,
0.425054, -0.0974894, 1.176771, 0.07450981, 0, 1, 1,
0.4296146, -0.4940898, 2.728022, 0.07843138, 0, 1, 1,
0.439848, -1.59922, 3.198959, 0.08627451, 0, 1, 1,
0.4405887, 0.6342808, 0.7766239, 0.09019608, 0, 1, 1,
0.4431991, 2.693114, -0.1097507, 0.09803922, 0, 1, 1,
0.452462, -1.197568, 4.530969, 0.1058824, 0, 1, 1,
0.454989, -0.173165, 2.566241, 0.1098039, 0, 1, 1,
0.4581005, -1.458917, 2.630982, 0.1176471, 0, 1, 1,
0.4583235, 0.6408803, 0.3694869, 0.1215686, 0, 1, 1,
0.4642695, 0.7417932, 0.8158285, 0.1294118, 0, 1, 1,
0.4650808, -1.144229, 2.99648, 0.1333333, 0, 1, 1,
0.4655096, -1.093522, 3.25279, 0.1411765, 0, 1, 1,
0.4737755, 0.4302745, 0.6926515, 0.145098, 0, 1, 1,
0.4762868, 1.343773, -0.8170412, 0.1529412, 0, 1, 1,
0.481021, -0.7808133, 1.998705, 0.1568628, 0, 1, 1,
0.4857385, -1.043864, 3.721545, 0.1647059, 0, 1, 1,
0.4890995, 0.09487907, 2.077719, 0.1686275, 0, 1, 1,
0.4956108, -1.141947, 3.674433, 0.1764706, 0, 1, 1,
0.4961919, 0.3153168, 0.2028141, 0.1803922, 0, 1, 1,
0.4980415, 0.3210951, -1.311897, 0.1882353, 0, 1, 1,
0.5035612, 0.5322448, 0.8497059, 0.1921569, 0, 1, 1,
0.5040896, -0.2177929, 2.3863, 0.2, 0, 1, 1,
0.5046666, -0.4010836, 1.989607, 0.2078431, 0, 1, 1,
0.5063516, -0.6046306, 3.115838, 0.2117647, 0, 1, 1,
0.5068432, -0.2330191, 1.513173, 0.2196078, 0, 1, 1,
0.5080261, -0.7968187, 2.696121, 0.2235294, 0, 1, 1,
0.5132644, 1.004209, 0.4331149, 0.2313726, 0, 1, 1,
0.5168231, 0.09844458, 0.7140272, 0.2352941, 0, 1, 1,
0.518573, -0.08684182, 0.4001885, 0.2431373, 0, 1, 1,
0.5192291, 0.6783176, 0.09758934, 0.2470588, 0, 1, 1,
0.5209997, -1.092105, 1.806094, 0.254902, 0, 1, 1,
0.5303507, 0.745164, 0.02340325, 0.2588235, 0, 1, 1,
0.530401, 0.06889849, 0.04888364, 0.2666667, 0, 1, 1,
0.530986, -0.7217419, 2.936585, 0.2705882, 0, 1, 1,
0.5340276, 0.2857174, 0.9954529, 0.2784314, 0, 1, 1,
0.5343824, -1.293131, 3.495428, 0.282353, 0, 1, 1,
0.5363474, -0.2474431, 1.488211, 0.2901961, 0, 1, 1,
0.5398329, -1.000329, 1.945362, 0.2941177, 0, 1, 1,
0.5428467, -2.501958, 1.331818, 0.3019608, 0, 1, 1,
0.5433226, -0.02830701, 1.475742, 0.3098039, 0, 1, 1,
0.5443942, 0.6017566, 0.8216996, 0.3137255, 0, 1, 1,
0.5498645, 0.4777989, 1.05968, 0.3215686, 0, 1, 1,
0.5531087, 0.07431936, 1.85113, 0.3254902, 0, 1, 1,
0.5534141, -0.1992579, 1.734083, 0.3333333, 0, 1, 1,
0.5584394, -0.3397112, 2.487428, 0.3372549, 0, 1, 1,
0.5599918, 0.5533802, 0.6565406, 0.345098, 0, 1, 1,
0.5646406, 0.273793, -0.5284311, 0.3490196, 0, 1, 1,
0.5671355, -0.7338879, 1.10279, 0.3568628, 0, 1, 1,
0.5733086, 0.5904604, 1.334382, 0.3607843, 0, 1, 1,
0.5758759, -0.2978357, 0.7013111, 0.3686275, 0, 1, 1,
0.5766804, -1.268841, 4.705832, 0.372549, 0, 1, 1,
0.5775944, 0.6017966, 1.261852, 0.3803922, 0, 1, 1,
0.5797467, -0.4269156, 3.184673, 0.3843137, 0, 1, 1,
0.5805784, 0.01000724, 1.505793, 0.3921569, 0, 1, 1,
0.5880868, 0.03210724, 0.8314078, 0.3960784, 0, 1, 1,
0.5882146, -1.168336, 4.22949, 0.4039216, 0, 1, 1,
0.5897976, 0.8250592, 0.832068, 0.4117647, 0, 1, 1,
0.5926535, 0.5107352, 1.186034, 0.4156863, 0, 1, 1,
0.5999129, 0.2287958, 1.549522, 0.4235294, 0, 1, 1,
0.6001471, 0.3150347, 1.517252, 0.427451, 0, 1, 1,
0.602161, -0.1003999, 2.761715, 0.4352941, 0, 1, 1,
0.6115993, -0.2853568, 2.151089, 0.4392157, 0, 1, 1,
0.6117746, 0.3593332, -1.162943, 0.4470588, 0, 1, 1,
0.6150141, -1.895362, 3.204936, 0.4509804, 0, 1, 1,
0.619314, 1.151751, 1.995402, 0.4588235, 0, 1, 1,
0.6214509, 0.5020558, 1.140791, 0.4627451, 0, 1, 1,
0.6274836, -0.3648564, 2.203415, 0.4705882, 0, 1, 1,
0.6275147, 0.2864283, 0.1601501, 0.4745098, 0, 1, 1,
0.6295857, -0.7259818, 2.588214, 0.4823529, 0, 1, 1,
0.6314883, -0.3677528, 2.521256, 0.4862745, 0, 1, 1,
0.6337941, 0.1496304, 1.192403, 0.4941176, 0, 1, 1,
0.6388948, -0.08907587, 2.154661, 0.5019608, 0, 1, 1,
0.6406148, 1.580981, -0.2139702, 0.5058824, 0, 1, 1,
0.640774, -0.05412812, 2.105011, 0.5137255, 0, 1, 1,
0.6419175, 1.295453, 1.349327, 0.5176471, 0, 1, 1,
0.6531785, -0.8674101, 3.079307, 0.5254902, 0, 1, 1,
0.6539494, -0.3436273, 2.265352, 0.5294118, 0, 1, 1,
0.6581716, -2.072226, 3.746325, 0.5372549, 0, 1, 1,
0.6591378, -0.1852932, 2.650043, 0.5411765, 0, 1, 1,
0.6603161, -1.084137, 3.222807, 0.5490196, 0, 1, 1,
0.6610565, 0.8366354, 2.724545, 0.5529412, 0, 1, 1,
0.6613339, 0.9733897, -1.271896, 0.5607843, 0, 1, 1,
0.6661447, 0.2852869, 0.2668179, 0.5647059, 0, 1, 1,
0.6690916, -2.417608, 2.298794, 0.572549, 0, 1, 1,
0.6867095, 1.935642, 0.1915698, 0.5764706, 0, 1, 1,
0.6888664, 0.8580157, -0.3441958, 0.5843138, 0, 1, 1,
0.6928296, -1.166512, 2.293271, 0.5882353, 0, 1, 1,
0.7012818, -0.2774134, 0.8850297, 0.5960785, 0, 1, 1,
0.7063243, -0.4291221, 2.703056, 0.6039216, 0, 1, 1,
0.7104066, 0.04602426, 1.948139, 0.6078432, 0, 1, 1,
0.711404, -0.7922899, 1.946786, 0.6156863, 0, 1, 1,
0.7117624, 1.59729, -0.1955659, 0.6196079, 0, 1, 1,
0.7143039, 1.46286, -0.6721365, 0.627451, 0, 1, 1,
0.7195467, -0.06081057, 0.08975655, 0.6313726, 0, 1, 1,
0.7209898, 1.255942, -0.2164939, 0.6392157, 0, 1, 1,
0.7212929, 0.1625817, 0.9795405, 0.6431373, 0, 1, 1,
0.7230259, 2.956393, 1.006439, 0.6509804, 0, 1, 1,
0.7305745, -0.9101399, 1.897766, 0.654902, 0, 1, 1,
0.7316985, -1.034459, 1.186472, 0.6627451, 0, 1, 1,
0.7319984, -0.03657525, 1.377867, 0.6666667, 0, 1, 1,
0.7400501, 0.2828556, 0.2383999, 0.6745098, 0, 1, 1,
0.740898, 0.7482214, 1.272234, 0.6784314, 0, 1, 1,
0.7423077, -0.5418411, 2.172891, 0.6862745, 0, 1, 1,
0.7427638, 1.11622, 2.671509, 0.6901961, 0, 1, 1,
0.7472794, 0.273549, 1.739643, 0.6980392, 0, 1, 1,
0.7559376, 0.6996259, 1.527653, 0.7058824, 0, 1, 1,
0.7656227, -0.3711314, 2.651723, 0.7098039, 0, 1, 1,
0.7694243, 0.2489786, 1.543894, 0.7176471, 0, 1, 1,
0.7697698, 0.6493621, 0.308905, 0.7215686, 0, 1, 1,
0.7817687, 1.095491, 0.9538869, 0.7294118, 0, 1, 1,
0.787598, 1.391057, 0.0344492, 0.7333333, 0, 1, 1,
0.7919348, 1.710029, 1.345375, 0.7411765, 0, 1, 1,
0.7931103, -0.3761269, 2.253088, 0.7450981, 0, 1, 1,
0.8050063, 0.4661459, -0.0395473, 0.7529412, 0, 1, 1,
0.8063658, -0.2477926, 0.05312546, 0.7568628, 0, 1, 1,
0.8084672, 0.7206856, 2.190723, 0.7647059, 0, 1, 1,
0.8144206, 0.5553872, 1.039386, 0.7686275, 0, 1, 1,
0.8152511, -0.7756243, 2.288079, 0.7764706, 0, 1, 1,
0.819406, -1.170685, 0.9213065, 0.7803922, 0, 1, 1,
0.820074, 1.912045, 1.214157, 0.7882353, 0, 1, 1,
0.8249155, 0.2588243, 2.437236, 0.7921569, 0, 1, 1,
0.8258901, 0.5878345, -0.1914289, 0.8, 0, 1, 1,
0.8270966, 1.157588, 1.825069, 0.8078431, 0, 1, 1,
0.8290898, -1.17133, 2.274158, 0.8117647, 0, 1, 1,
0.8301927, -0.7946672, 2.830544, 0.8196079, 0, 1, 1,
0.834533, 0.5616709, 0.5663062, 0.8235294, 0, 1, 1,
0.8370037, 0.8992555, 1.164754, 0.8313726, 0, 1, 1,
0.8399406, -0.9058984, 2.261774, 0.8352941, 0, 1, 1,
0.8483442, -1.346383, 3.567445, 0.8431373, 0, 1, 1,
0.8683825, -2.325558, 2.250916, 0.8470588, 0, 1, 1,
0.873003, 0.1531952, 2.114701, 0.854902, 0, 1, 1,
0.8763078, 0.2737893, 0.3145903, 0.8588235, 0, 1, 1,
0.8793231, 1.249263, 1.708565, 0.8666667, 0, 1, 1,
0.8795257, -0.6725153, 1.872205, 0.8705882, 0, 1, 1,
0.8869277, -0.2587782, 1.100602, 0.8784314, 0, 1, 1,
0.8915091, -0.4413121, 3.116475, 0.8823529, 0, 1, 1,
0.8996018, -0.8907878, 1.470929, 0.8901961, 0, 1, 1,
0.9120474, 2.387927, -0.3851298, 0.8941177, 0, 1, 1,
0.918072, 1.130388, 0.9653637, 0.9019608, 0, 1, 1,
0.9198682, -0.1182123, 2.898661, 0.9098039, 0, 1, 1,
0.9264097, -1.647639, 2.695078, 0.9137255, 0, 1, 1,
0.9269897, 0.2452077, 0.6922552, 0.9215686, 0, 1, 1,
0.927875, 0.4360611, 0.5708028, 0.9254902, 0, 1, 1,
0.9293684, 0.5991981, 1.459425, 0.9333333, 0, 1, 1,
0.9304798, 0.185397, 2.119953, 0.9372549, 0, 1, 1,
0.9308599, -1.543046, 1.629702, 0.945098, 0, 1, 1,
0.9372346, 1.621046, 1.965819, 0.9490196, 0, 1, 1,
0.9433731, 1.341468, 0.6908883, 0.9568627, 0, 1, 1,
0.9585215, 1.402, 1.136248, 0.9607843, 0, 1, 1,
0.9655563, 1.864648, 1.669886, 0.9686275, 0, 1, 1,
0.9687511, -0.938302, 2.485376, 0.972549, 0, 1, 1,
0.9698502, 1.078008, 1.163369, 0.9803922, 0, 1, 1,
0.9721372, -0.614748, 0.7846614, 0.9843137, 0, 1, 1,
0.9762582, 0.6427212, 1.490934, 0.9921569, 0, 1, 1,
0.9822246, 2.830836, 1.215205, 0.9960784, 0, 1, 1,
0.9824696, 0.2821825, -0.3693925, 1, 0, 0.9960784, 1,
0.9867733, 0.0841084, 0.913298, 1, 0, 0.9882353, 1,
0.9880979, 0.9143012, 1.095826, 1, 0, 0.9843137, 1,
0.9912991, 1.299829, 1.124486, 1, 0, 0.9764706, 1,
0.9916136, 1.038178, -0.3693151, 1, 0, 0.972549, 1,
0.9930297, -0.3164096, 1.795889, 1, 0, 0.9647059, 1,
0.9932796, -0.1050911, 1.259829, 1, 0, 0.9607843, 1,
0.99441, -1.07946, 3.31906, 1, 0, 0.9529412, 1,
0.9981114, -0.01338563, 2.058254, 1, 0, 0.9490196, 1,
1.001673, 0.3802826, 1.873041, 1, 0, 0.9411765, 1,
1.003081, 0.4484255, -0.0764543, 1, 0, 0.9372549, 1,
1.010705, 0.1920752, 1.003067, 1, 0, 0.9294118, 1,
1.020542, -0.3007403, 2.281527, 1, 0, 0.9254902, 1,
1.021824, 0.9399171, 1.235951, 1, 0, 0.9176471, 1,
1.022739, -0.9076824, 2.617414, 1, 0, 0.9137255, 1,
1.032439, -2.324232, 3.818477, 1, 0, 0.9058824, 1,
1.036876, 2.147365, 1.943624, 1, 0, 0.9019608, 1,
1.036941, -0.2304529, 1.299012, 1, 0, 0.8941177, 1,
1.039776, -0.3350252, 3.505252, 1, 0, 0.8862745, 1,
1.051308, -1.610057, 1.443183, 1, 0, 0.8823529, 1,
1.056289, 0.994608, 2.13311, 1, 0, 0.8745098, 1,
1.063657, -1.076903, 1.734669, 1, 0, 0.8705882, 1,
1.066694, -0.3580466, 2.66444, 1, 0, 0.8627451, 1,
1.07928, 1.043784, 0.1940364, 1, 0, 0.8588235, 1,
1.084154, 1.611855, -1.734837, 1, 0, 0.8509804, 1,
1.095599, -1.458503, 2.922172, 1, 0, 0.8470588, 1,
1.099613, -0.7906958, 1.57708, 1, 0, 0.8392157, 1,
1.103553, 1.099016, -0.2272906, 1, 0, 0.8352941, 1,
1.106923, -0.472776, 2.063422, 1, 0, 0.827451, 1,
1.108238, -2.368384, 1.689792, 1, 0, 0.8235294, 1,
1.108637, 0.72802, 1.089137, 1, 0, 0.8156863, 1,
1.114755, -0.2672996, 1.628585, 1, 0, 0.8117647, 1,
1.119602, 0.1036063, 0.7379235, 1, 0, 0.8039216, 1,
1.123546, -0.7475148, 1.915008, 1, 0, 0.7960784, 1,
1.125732, 0.417305, 1.296822, 1, 0, 0.7921569, 1,
1.145727, 0.9215959, 0.6566225, 1, 0, 0.7843137, 1,
1.149927, -0.1672675, 0.4130463, 1, 0, 0.7803922, 1,
1.15534, -1.730044, 1.46503, 1, 0, 0.772549, 1,
1.157981, -0.7641661, 3.054378, 1, 0, 0.7686275, 1,
1.16252, 0.4434925, 0.6259364, 1, 0, 0.7607843, 1,
1.164475, 0.5550933, 0.2611124, 1, 0, 0.7568628, 1,
1.175753, 0.6573475, 1.065041, 1, 0, 0.7490196, 1,
1.176736, -1.639501, 1.366965, 1, 0, 0.7450981, 1,
1.179383, -0.2034106, 1.171661, 1, 0, 0.7372549, 1,
1.183162, -0.1797333, 2.604093, 1, 0, 0.7333333, 1,
1.184167, -0.1974458, 2.978914, 1, 0, 0.7254902, 1,
1.185049, 1.091963, -1.135753, 1, 0, 0.7215686, 1,
1.185915, 0.9839825, 1.674068, 1, 0, 0.7137255, 1,
1.189387, -0.07658314, 1.822079, 1, 0, 0.7098039, 1,
1.190185, 1.520658, 1.505975, 1, 0, 0.7019608, 1,
1.19649, 1.186868, 1.380215, 1, 0, 0.6941177, 1,
1.200432, 1.188245, 0.6958765, 1, 0, 0.6901961, 1,
1.202767, 0.2311935, 0.780444, 1, 0, 0.682353, 1,
1.205549, -1.023371, 1.831784, 1, 0, 0.6784314, 1,
1.205638, -1.029941, 1.685309, 1, 0, 0.6705883, 1,
1.209662, -0.1108824, 0.354768, 1, 0, 0.6666667, 1,
1.211209, -0.3446356, 1.668967, 1, 0, 0.6588235, 1,
1.221782, -0.9362071, 3.285255, 1, 0, 0.654902, 1,
1.223909, -0.9323047, 2.355394, 1, 0, 0.6470588, 1,
1.226725, -0.9061031, 1.242809, 1, 0, 0.6431373, 1,
1.235822, 0.4549, 2.138459, 1, 0, 0.6352941, 1,
1.23703, 0.8998308, 0.6518987, 1, 0, 0.6313726, 1,
1.240861, -1.042755, 3.00181, 1, 0, 0.6235294, 1,
1.240942, -0.5255531, 0.1950338, 1, 0, 0.6196079, 1,
1.241854, 1.567543, 1.334638, 1, 0, 0.6117647, 1,
1.248527, -0.48932, 2.157508, 1, 0, 0.6078432, 1,
1.252003, -0.009971907, 3.114229, 1, 0, 0.6, 1,
1.271078, -1.377629, 2.797622, 1, 0, 0.5921569, 1,
1.272875, 0.2363082, 1.963891, 1, 0, 0.5882353, 1,
1.281744, 0.2412014, 1.684081, 1, 0, 0.5803922, 1,
1.287008, 0.03933698, 3.060554, 1, 0, 0.5764706, 1,
1.301662, 2.750357, -0.2235855, 1, 0, 0.5686275, 1,
1.312193, 0.7055743, 0.57708, 1, 0, 0.5647059, 1,
1.313684, 0.1114674, 1.166932, 1, 0, 0.5568628, 1,
1.319548, 0.8188441, 0.2658221, 1, 0, 0.5529412, 1,
1.329253, -0.4276235, 1.125358, 1, 0, 0.5450981, 1,
1.345708, -0.09093659, 2.132089, 1, 0, 0.5411765, 1,
1.350806, -0.7114952, 0.90642, 1, 0, 0.5333334, 1,
1.354763, -0.5951257, 2.785043, 1, 0, 0.5294118, 1,
1.356243, 1.513911, -1.19169, 1, 0, 0.5215687, 1,
1.361806, -0.2590921, 1.909639, 1, 0, 0.5176471, 1,
1.365958, 0.4633447, 1.224057, 1, 0, 0.509804, 1,
1.371748, 0.4311028, 0.7945446, 1, 0, 0.5058824, 1,
1.382743, -0.8397515, 3.057135, 1, 0, 0.4980392, 1,
1.38327, 1.242178, 0.264188, 1, 0, 0.4901961, 1,
1.390513, -1.514387, 1.964686, 1, 0, 0.4862745, 1,
1.397049, -1.532861, 3.269267, 1, 0, 0.4784314, 1,
1.398349, 0.6546069, 1.041279, 1, 0, 0.4745098, 1,
1.415532, -0.5548398, 2.686182, 1, 0, 0.4666667, 1,
1.417277, -1.96157, 2.787346, 1, 0, 0.4627451, 1,
1.421158, 0.3402357, -0.6530821, 1, 0, 0.454902, 1,
1.424126, 2.984792, -0.1937972, 1, 0, 0.4509804, 1,
1.426858, -0.6531987, 5.4036, 1, 0, 0.4431373, 1,
1.430262, 1.828755, -0.4216895, 1, 0, 0.4392157, 1,
1.433608, -0.2252399, 2.071164, 1, 0, 0.4313726, 1,
1.442558, -0.3932464, 0.7822378, 1, 0, 0.427451, 1,
1.448897, -0.02657579, -0.2798991, 1, 0, 0.4196078, 1,
1.456463, -0.3591371, 1.90446, 1, 0, 0.4156863, 1,
1.461842, 1.332277, 1.576613, 1, 0, 0.4078431, 1,
1.465346, 1.063211, 0.6448627, 1, 0, 0.4039216, 1,
1.466928, -1.538455, 2.051837, 1, 0, 0.3960784, 1,
1.470126, -0.214438, 3.400403, 1, 0, 0.3882353, 1,
1.484344, -0.5320209, 3.106841, 1, 0, 0.3843137, 1,
1.485769, 0.777276, 1.754356, 1, 0, 0.3764706, 1,
1.488021, -1.185939, 1.451813, 1, 0, 0.372549, 1,
1.503598, -0.1930496, 1.849314, 1, 0, 0.3647059, 1,
1.506384, -0.3529, 1.813855, 1, 0, 0.3607843, 1,
1.512739, -1.013378, 3.332065, 1, 0, 0.3529412, 1,
1.517153, -0.1172695, 1.283929, 1, 0, 0.3490196, 1,
1.526563, -0.27, 1.234493, 1, 0, 0.3411765, 1,
1.536108, -1.072915, 2.650629, 1, 0, 0.3372549, 1,
1.572928, -0.511315, 0.8679436, 1, 0, 0.3294118, 1,
1.580983, 0.4564192, 0.5471401, 1, 0, 0.3254902, 1,
1.603116, -0.00521247, 0.02328587, 1, 0, 0.3176471, 1,
1.617241, -0.9556255, -0.2955469, 1, 0, 0.3137255, 1,
1.632236, 0.3012609, 2.054278, 1, 0, 0.3058824, 1,
1.637223, -1.223898, 1.255526, 1, 0, 0.2980392, 1,
1.637259, 0.6361037, 1.559924, 1, 0, 0.2941177, 1,
1.648772, 1.569933, 0.6481034, 1, 0, 0.2862745, 1,
1.650874, 0.4025027, 1.442193, 1, 0, 0.282353, 1,
1.652766, -0.9617092, 1.210482, 1, 0, 0.2745098, 1,
1.674918, 0.02526649, 1.001744, 1, 0, 0.2705882, 1,
1.69819, -0.1642861, 2.58876, 1, 0, 0.2627451, 1,
1.710371, -0.5911937, 1.563473, 1, 0, 0.2588235, 1,
1.731825, -0.2865283, 1.371297, 1, 0, 0.2509804, 1,
1.741693, -0.4315017, 1.322477, 1, 0, 0.2470588, 1,
1.751964, -1.617296, 0.8247039, 1, 0, 0.2392157, 1,
1.758029, 0.1536042, 1.714056, 1, 0, 0.2352941, 1,
1.763674, -0.1266171, 1.292673, 1, 0, 0.227451, 1,
1.765172, 1.360385, 0.8286467, 1, 0, 0.2235294, 1,
1.823272, -0.2054358, 1.355753, 1, 0, 0.2156863, 1,
1.826527, -1.114359, 1.676008, 1, 0, 0.2117647, 1,
1.833268, 0.6191664, 1.205282, 1, 0, 0.2039216, 1,
1.874771, 1.380118, 1.383756, 1, 0, 0.1960784, 1,
1.885117, 0.3991028, 1.340244, 1, 0, 0.1921569, 1,
1.907229, 1.107741, 0.6852398, 1, 0, 0.1843137, 1,
1.916489, 0.07357397, -0.3814035, 1, 0, 0.1803922, 1,
1.923423, -0.7706373, 0.9308228, 1, 0, 0.172549, 1,
1.924205, 0.8259049, 1.623698, 1, 0, 0.1686275, 1,
1.942464, 0.3492724, 2.258463, 1, 0, 0.1607843, 1,
1.943096, 0.1605218, 3.617491, 1, 0, 0.1568628, 1,
1.988015, 0.5179964, 0.7229801, 1, 0, 0.1490196, 1,
1.993001, -0.7673917, 2.523833, 1, 0, 0.145098, 1,
2.002959, 1.17904, -1.13835, 1, 0, 0.1372549, 1,
2.050817, -0.8411587, 0.7509249, 1, 0, 0.1333333, 1,
2.065974, 0.5954248, 0.4515858, 1, 0, 0.1254902, 1,
2.090135, 0.9620493, 4.247252, 1, 0, 0.1215686, 1,
2.19816, 1.043796, 1.669469, 1, 0, 0.1137255, 1,
2.218482, -0.8561863, 2.551167, 1, 0, 0.1098039, 1,
2.220983, -1.518155, 2.53835, 1, 0, 0.1019608, 1,
2.222001, -0.5812567, 0.9589803, 1, 0, 0.09411765, 1,
2.234984, -0.3429979, 1.801972, 1, 0, 0.09019608, 1,
2.296953, -1.547921, 2.848495, 1, 0, 0.08235294, 1,
2.32097, -0.9466903, 1.285569, 1, 0, 0.07843138, 1,
2.351546, 0.2351511, 0.03696142, 1, 0, 0.07058824, 1,
2.359652, 0.249909, 2.176041, 1, 0, 0.06666667, 1,
2.37399, -0.8728611, 2.519313, 1, 0, 0.05882353, 1,
2.493113, -0.2632803, 2.008008, 1, 0, 0.05490196, 1,
2.499794, 0.9200792, 2.461681, 1, 0, 0.04705882, 1,
2.501578, -0.4459857, 2.545953, 1, 0, 0.04313726, 1,
2.56859, -0.588212, 3.950598, 1, 0, 0.03529412, 1,
2.66423, 0.5059793, 1.841955, 1, 0, 0.03137255, 1,
2.795632, 1.650836, 1.612041, 1, 0, 0.02352941, 1,
2.995699, -0.8075929, 1.224161, 1, 0, 0.01960784, 1,
3.036058, 1.104676, 0.8146753, 1, 0, 0.01176471, 1,
3.063805, 0.339718, 0.1130935, 1, 0, 0.007843138, 1
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
-0.3735229, -4.190282, -7.478045, 0, -0.5, 0.5, 0.5,
-0.3735229, -4.190282, -7.478045, 1, -0.5, 0.5, 0.5,
-0.3735229, -4.190282, -7.478045, 1, 1.5, 0.5, 0.5,
-0.3735229, -4.190282, -7.478045, 0, 1.5, 0.5, 0.5
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
-4.976105, -0.0827899, -7.478045, 0, -0.5, 0.5, 0.5,
-4.976105, -0.0827899, -7.478045, 1, -0.5, 0.5, 0.5,
-4.976105, -0.0827899, -7.478045, 1, 1.5, 0.5, 0.5,
-4.976105, -0.0827899, -7.478045, 0, 1.5, 0.5, 0.5
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
-4.976105, -4.190282, -0.08697295, 0, -0.5, 0.5, 0.5,
-4.976105, -4.190282, -0.08697295, 1, -0.5, 0.5, 0.5,
-4.976105, -4.190282, -0.08697295, 1, 1.5, 0.5, 0.5,
-4.976105, -4.190282, -0.08697295, 0, 1.5, 0.5, 0.5
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
-3, -3.242399, -5.772413,
3, -3.242399, -5.772413,
-3, -3.242399, -5.772413,
-3, -3.400379, -6.056685,
-2, -3.242399, -5.772413,
-2, -3.400379, -6.056685,
-1, -3.242399, -5.772413,
-1, -3.400379, -6.056685,
0, -3.242399, -5.772413,
0, -3.400379, -6.056685,
1, -3.242399, -5.772413,
1, -3.400379, -6.056685,
2, -3.242399, -5.772413,
2, -3.400379, -6.056685,
3, -3.242399, -5.772413,
3, -3.400379, -6.056685
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
-3, -3.71634, -6.625229, 0, -0.5, 0.5, 0.5,
-3, -3.71634, -6.625229, 1, -0.5, 0.5, 0.5,
-3, -3.71634, -6.625229, 1, 1.5, 0.5, 0.5,
-3, -3.71634, -6.625229, 0, 1.5, 0.5, 0.5,
-2, -3.71634, -6.625229, 0, -0.5, 0.5, 0.5,
-2, -3.71634, -6.625229, 1, -0.5, 0.5, 0.5,
-2, -3.71634, -6.625229, 1, 1.5, 0.5, 0.5,
-2, -3.71634, -6.625229, 0, 1.5, 0.5, 0.5,
-1, -3.71634, -6.625229, 0, -0.5, 0.5, 0.5,
-1, -3.71634, -6.625229, 1, -0.5, 0.5, 0.5,
-1, -3.71634, -6.625229, 1, 1.5, 0.5, 0.5,
-1, -3.71634, -6.625229, 0, 1.5, 0.5, 0.5,
0, -3.71634, -6.625229, 0, -0.5, 0.5, 0.5,
0, -3.71634, -6.625229, 1, -0.5, 0.5, 0.5,
0, -3.71634, -6.625229, 1, 1.5, 0.5, 0.5,
0, -3.71634, -6.625229, 0, 1.5, 0.5, 0.5,
1, -3.71634, -6.625229, 0, -0.5, 0.5, 0.5,
1, -3.71634, -6.625229, 1, -0.5, 0.5, 0.5,
1, -3.71634, -6.625229, 1, 1.5, 0.5, 0.5,
1, -3.71634, -6.625229, 0, 1.5, 0.5, 0.5,
2, -3.71634, -6.625229, 0, -0.5, 0.5, 0.5,
2, -3.71634, -6.625229, 1, -0.5, 0.5, 0.5,
2, -3.71634, -6.625229, 1, 1.5, 0.5, 0.5,
2, -3.71634, -6.625229, 0, 1.5, 0.5, 0.5,
3, -3.71634, -6.625229, 0, -0.5, 0.5, 0.5,
3, -3.71634, -6.625229, 1, -0.5, 0.5, 0.5,
3, -3.71634, -6.625229, 1, 1.5, 0.5, 0.5,
3, -3.71634, -6.625229, 0, 1.5, 0.5, 0.5
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
-3.913971, -3, -5.772413,
-3.913971, 2, -5.772413,
-3.913971, -3, -5.772413,
-4.090993, -3, -6.056685,
-3.913971, -2, -5.772413,
-4.090993, -2, -6.056685,
-3.913971, -1, -5.772413,
-4.090993, -1, -6.056685,
-3.913971, 0, -5.772413,
-4.090993, 0, -6.056685,
-3.913971, 1, -5.772413,
-4.090993, 1, -6.056685,
-3.913971, 2, -5.772413,
-4.090993, 2, -6.056685
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
-4.445038, -3, -6.625229, 0, -0.5, 0.5, 0.5,
-4.445038, -3, -6.625229, 1, -0.5, 0.5, 0.5,
-4.445038, -3, -6.625229, 1, 1.5, 0.5, 0.5,
-4.445038, -3, -6.625229, 0, 1.5, 0.5, 0.5,
-4.445038, -2, -6.625229, 0, -0.5, 0.5, 0.5,
-4.445038, -2, -6.625229, 1, -0.5, 0.5, 0.5,
-4.445038, -2, -6.625229, 1, 1.5, 0.5, 0.5,
-4.445038, -2, -6.625229, 0, 1.5, 0.5, 0.5,
-4.445038, -1, -6.625229, 0, -0.5, 0.5, 0.5,
-4.445038, -1, -6.625229, 1, -0.5, 0.5, 0.5,
-4.445038, -1, -6.625229, 1, 1.5, 0.5, 0.5,
-4.445038, -1, -6.625229, 0, 1.5, 0.5, 0.5,
-4.445038, 0, -6.625229, 0, -0.5, 0.5, 0.5,
-4.445038, 0, -6.625229, 1, -0.5, 0.5, 0.5,
-4.445038, 0, -6.625229, 1, 1.5, 0.5, 0.5,
-4.445038, 0, -6.625229, 0, 1.5, 0.5, 0.5,
-4.445038, 1, -6.625229, 0, -0.5, 0.5, 0.5,
-4.445038, 1, -6.625229, 1, -0.5, 0.5, 0.5,
-4.445038, 1, -6.625229, 1, 1.5, 0.5, 0.5,
-4.445038, 1, -6.625229, 0, 1.5, 0.5, 0.5,
-4.445038, 2, -6.625229, 0, -0.5, 0.5, 0.5,
-4.445038, 2, -6.625229, 1, -0.5, 0.5, 0.5,
-4.445038, 2, -6.625229, 1, 1.5, 0.5, 0.5,
-4.445038, 2, -6.625229, 0, 1.5, 0.5, 0.5
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
-3.913971, -3.242399, -4,
-3.913971, -3.242399, 4,
-3.913971, -3.242399, -4,
-4.090993, -3.400379, -4,
-3.913971, -3.242399, -2,
-4.090993, -3.400379, -2,
-3.913971, -3.242399, 0,
-4.090993, -3.400379, 0,
-3.913971, -3.242399, 2,
-4.090993, -3.400379, 2,
-3.913971, -3.242399, 4,
-4.090993, -3.400379, 4
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
-4.445038, -3.71634, -4, 0, -0.5, 0.5, 0.5,
-4.445038, -3.71634, -4, 1, -0.5, 0.5, 0.5,
-4.445038, -3.71634, -4, 1, 1.5, 0.5, 0.5,
-4.445038, -3.71634, -4, 0, 1.5, 0.5, 0.5,
-4.445038, -3.71634, -2, 0, -0.5, 0.5, 0.5,
-4.445038, -3.71634, -2, 1, -0.5, 0.5, 0.5,
-4.445038, -3.71634, -2, 1, 1.5, 0.5, 0.5,
-4.445038, -3.71634, -2, 0, 1.5, 0.5, 0.5,
-4.445038, -3.71634, 0, 0, -0.5, 0.5, 0.5,
-4.445038, -3.71634, 0, 1, -0.5, 0.5, 0.5,
-4.445038, -3.71634, 0, 1, 1.5, 0.5, 0.5,
-4.445038, -3.71634, 0, 0, 1.5, 0.5, 0.5,
-4.445038, -3.71634, 2, 0, -0.5, 0.5, 0.5,
-4.445038, -3.71634, 2, 1, -0.5, 0.5, 0.5,
-4.445038, -3.71634, 2, 1, 1.5, 0.5, 0.5,
-4.445038, -3.71634, 2, 0, 1.5, 0.5, 0.5,
-4.445038, -3.71634, 4, 0, -0.5, 0.5, 0.5,
-4.445038, -3.71634, 4, 1, -0.5, 0.5, 0.5,
-4.445038, -3.71634, 4, 1, 1.5, 0.5, 0.5,
-4.445038, -3.71634, 4, 0, 1.5, 0.5, 0.5
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
-3.913971, -3.242399, -5.772413,
-3.913971, 3.076819, -5.772413,
-3.913971, -3.242399, 5.598467,
-3.913971, 3.076819, 5.598467,
-3.913971, -3.242399, -5.772413,
-3.913971, -3.242399, 5.598467,
-3.913971, 3.076819, -5.772413,
-3.913971, 3.076819, 5.598467,
-3.913971, -3.242399, -5.772413,
3.166925, -3.242399, -5.772413,
-3.913971, -3.242399, 5.598467,
3.166925, -3.242399, 5.598467,
-3.913971, 3.076819, -5.772413,
3.166925, 3.076819, -5.772413,
-3.913971, 3.076819, 5.598467,
3.166925, 3.076819, 5.598467,
3.166925, -3.242399, -5.772413,
3.166925, 3.076819, -5.772413,
3.166925, -3.242399, 5.598467,
3.166925, 3.076819, 5.598467,
3.166925, -3.242399, -5.772413,
3.166925, -3.242399, 5.598467,
3.166925, 3.076819, -5.772413,
3.166925, 3.076819, 5.598467
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
var radius = 7.908837;
var distance = 35.18731;
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
mvMatrix.translate( 0.3735229, 0.0827899, 0.08697295 );
mvMatrix.scale( 1.207642, 1.353204, 0.7520253 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.18731);
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
Isopropyl_phenylacet<-read.table("Isopropyl_phenylacet.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Isopropyl_phenylacet$V2
```

```
## Error in eval(expr, envir, enclos): object 'Isopropyl_phenylacet' not found
```

```r
y<-Isopropyl_phenylacet$V3
```

```
## Error in eval(expr, envir, enclos): object 'Isopropyl_phenylacet' not found
```

```r
z<-Isopropyl_phenylacet$V4
```

```
## Error in eval(expr, envir, enclos): object 'Isopropyl_phenylacet' not found
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
-3.810851, -0.04296489, -1.945371, 0, 0, 1, 1, 1,
-3.26639, -1.131961, -1.565204, 1, 0, 0, 1, 1,
-2.751057, 0.9281893, -0.7747761, 1, 0, 0, 1, 1,
-2.739184, -0.2317429, -1.879832, 1, 0, 0, 1, 1,
-2.719721, 0.4920369, -1.825079, 1, 0, 0, 1, 1,
-2.626362, -1.078389, -1.246775, 1, 0, 0, 1, 1,
-2.549572, 1.167084, -1.564278, 0, 0, 0, 1, 1,
-2.517216, -0.9370897, -3.410252, 0, 0, 0, 1, 1,
-2.462776, 0.03906135, -0.0297935, 0, 0, 0, 1, 1,
-2.454495, 0.3943811, -1.206154, 0, 0, 0, 1, 1,
-2.427621, -1.602796, -0.9870846, 0, 0, 0, 1, 1,
-2.327189, 0.06219709, 0.00124197, 0, 0, 0, 1, 1,
-2.303586, -0.1381719, -2.2627, 0, 0, 0, 1, 1,
-2.24619, -1.877722, -4.069336, 1, 1, 1, 1, 1,
-2.213688, -0.4047684, -0.6614896, 1, 1, 1, 1, 1,
-2.156786, -1.721222, -1.882709, 1, 1, 1, 1, 1,
-2.132905, 0.4388478, -0.9951947, 1, 1, 1, 1, 1,
-2.073618, -0.9602604, 0.03393191, 1, 1, 1, 1, 1,
-2.059959, -0.7436789, -2.547534, 1, 1, 1, 1, 1,
-2.007931, 1.400933, 0.5958112, 1, 1, 1, 1, 1,
-2.007594, -0.7526768, -2.937603, 1, 1, 1, 1, 1,
-1.955564, -0.287964, -0.3475388, 1, 1, 1, 1, 1,
-1.947953, 0.3421985, -1.81404, 1, 1, 1, 1, 1,
-1.933439, 1.785923, -1.499858, 1, 1, 1, 1, 1,
-1.931344, -0.3096696, -0.6205708, 1, 1, 1, 1, 1,
-1.922088, 0.7581297, -1.556166, 1, 1, 1, 1, 1,
-1.913762, -0.2276308, -3.013732, 1, 1, 1, 1, 1,
-1.867694, -0.2026465, -0.7769313, 1, 1, 1, 1, 1,
-1.86498, -0.6725634, -1.779498, 0, 0, 1, 1, 1,
-1.859548, -0.06882234, -0.2532404, 1, 0, 0, 1, 1,
-1.856285, 0.3738294, -3.060794, 1, 0, 0, 1, 1,
-1.854715, 0.03180354, -1.98374, 1, 0, 0, 1, 1,
-1.826417, 0.3418076, -1.366778, 1, 0, 0, 1, 1,
-1.7816, -0.4478843, -1.539009, 1, 0, 0, 1, 1,
-1.781205, -0.9398815, -2.187695, 0, 0, 0, 1, 1,
-1.773355, -1.369721, -3.064641, 0, 0, 0, 1, 1,
-1.756607, -0.6353076, -1.851432, 0, 0, 0, 1, 1,
-1.746821, 0.5039951, -1.782699, 0, 0, 0, 1, 1,
-1.71722, 0.1817349, -1.192795, 0, 0, 0, 1, 1,
-1.695681, -0.2538314, -1.556741, 0, 0, 0, 1, 1,
-1.684521, 0.04266841, -1.653947, 0, 0, 0, 1, 1,
-1.683568, 0.03837245, 0.08318891, 1, 1, 1, 1, 1,
-1.671582, -0.1042708, -1.096959, 1, 1, 1, 1, 1,
-1.66513, 0.4086886, -0.4857781, 1, 1, 1, 1, 1,
-1.664851, -0.219781, -0.7425399, 1, 1, 1, 1, 1,
-1.650043, -0.2752647, -1.309637, 1, 1, 1, 1, 1,
-1.64847, 0.09560906, -1.172938, 1, 1, 1, 1, 1,
-1.63274, -0.1986047, -0.1725161, 1, 1, 1, 1, 1,
-1.632512, -0.3323081, -3.033399, 1, 1, 1, 1, 1,
-1.622533, -0.9978793, -1.000648, 1, 1, 1, 1, 1,
-1.618563, 0.7727999, -0.978788, 1, 1, 1, 1, 1,
-1.612754, -0.2812183, -1.85464, 1, 1, 1, 1, 1,
-1.6076, -0.2613819, -2.666039, 1, 1, 1, 1, 1,
-1.588102, -0.1493036, -1.230458, 1, 1, 1, 1, 1,
-1.577789, -0.9682415, -2.009366, 1, 1, 1, 1, 1,
-1.574572, 0.6544266, -0.2406294, 1, 1, 1, 1, 1,
-1.564519, 1.176145, -2.260524, 0, 0, 1, 1, 1,
-1.562758, -0.8193224, -1.982332, 1, 0, 0, 1, 1,
-1.559593, 0.4187889, -0.5763826, 1, 0, 0, 1, 1,
-1.536502, 0.2766671, -2.017658, 1, 0, 0, 1, 1,
-1.52081, 1.075857, -0.6222094, 1, 0, 0, 1, 1,
-1.515062, -0.6671305, -2.872338, 1, 0, 0, 1, 1,
-1.509247, 0.8414593, -0.3748042, 0, 0, 0, 1, 1,
-1.497392, -0.473852, -1.689582, 0, 0, 0, 1, 1,
-1.494385, -0.1599551, -0.6724112, 0, 0, 0, 1, 1,
-1.49274, 1.457613, -2.018388, 0, 0, 0, 1, 1,
-1.486216, 1.807196, 0.5668388, 0, 0, 0, 1, 1,
-1.483455, 0.7823907, 0.6033461, 0, 0, 0, 1, 1,
-1.479509, -0.178592, -1.252497, 0, 0, 0, 1, 1,
-1.477389, -0.8211719, -1.147162, 1, 1, 1, 1, 1,
-1.476986, -0.1986028, -3.30762, 1, 1, 1, 1, 1,
-1.462885, 2.177601, -0.7910526, 1, 1, 1, 1, 1,
-1.449527, 0.7658834, 0.8392944, 1, 1, 1, 1, 1,
-1.447081, 0.3428015, -1.288786, 1, 1, 1, 1, 1,
-1.44681, -0.9010559, -2.475554, 1, 1, 1, 1, 1,
-1.440282, -1.848008, -4.423089, 1, 1, 1, 1, 1,
-1.430996, 0.3329672, -0.3545155, 1, 1, 1, 1, 1,
-1.414881, -0.1447416, -0.8710338, 1, 1, 1, 1, 1,
-1.405453, 1.360801, 1.431808, 1, 1, 1, 1, 1,
-1.397002, 0.004823136, -1.927417, 1, 1, 1, 1, 1,
-1.390575, -0.4495178, -1.245542, 1, 1, 1, 1, 1,
-1.38656, 0.4909014, 0.5643727, 1, 1, 1, 1, 1,
-1.385649, 0.6862933, 0.3734142, 1, 1, 1, 1, 1,
-1.371415, 0.8582361, -1.108095, 1, 1, 1, 1, 1,
-1.361385, -1.087308, -2.611517, 0, 0, 1, 1, 1,
-1.358228, -1.230488, -2.494784, 1, 0, 0, 1, 1,
-1.352247, 0.9602526, -1.8464, 1, 0, 0, 1, 1,
-1.349919, -0.01993718, -1.218529, 1, 0, 0, 1, 1,
-1.344482, -2.45118, -2.212988, 1, 0, 0, 1, 1,
-1.327121, 0.02105356, -2.43609, 1, 0, 0, 1, 1,
-1.323029, 1.446399, -1.463238, 0, 0, 0, 1, 1,
-1.302346, 2.094, -1.52935, 0, 0, 0, 1, 1,
-1.300739, -0.7922946, 0.1737777, 0, 0, 0, 1, 1,
-1.290204, 1.056994, -0.8066705, 0, 0, 0, 1, 1,
-1.287274, 0.1798086, -3.185052, 0, 0, 0, 1, 1,
-1.283384, 0.2068729, -1.976363, 0, 0, 0, 1, 1,
-1.268684, -0.3390204, -2.108752, 0, 0, 0, 1, 1,
-1.264942, -1.19761, -2.621391, 1, 1, 1, 1, 1,
-1.263869, -0.2123912, -2.559315, 1, 1, 1, 1, 1,
-1.262932, 0.4359848, -1.233043, 1, 1, 1, 1, 1,
-1.262837, -1.377498, -0.5178019, 1, 1, 1, 1, 1,
-1.257519, 0.4204102, 0.6014896, 1, 1, 1, 1, 1,
-1.252429, -1.633742, -3.993896, 1, 1, 1, 1, 1,
-1.249974, 0.05302673, -1.807249, 1, 1, 1, 1, 1,
-1.245347, 1.005221, -0.5098426, 1, 1, 1, 1, 1,
-1.244723, -0.1478758, -3.17044, 1, 1, 1, 1, 1,
-1.235316, 1.607474, -1.838641, 1, 1, 1, 1, 1,
-1.230973, -0.6105198, -2.026546, 1, 1, 1, 1, 1,
-1.227469, -0.5327101, -1.511848, 1, 1, 1, 1, 1,
-1.226515, -1.430413, -1.341381, 1, 1, 1, 1, 1,
-1.224005, -1.285931, 0.619414, 1, 1, 1, 1, 1,
-1.215508, 0.373354, -1.128409, 1, 1, 1, 1, 1,
-1.215295, -0.3728527, -1.790193, 0, 0, 1, 1, 1,
-1.209512, 0.7517768, 0.2894433, 1, 0, 0, 1, 1,
-1.208567, -0.2737917, -1.967021, 1, 0, 0, 1, 1,
-1.207519, 0.9877912, -1.469716, 1, 0, 0, 1, 1,
-1.204434, 0.256928, -0.1577165, 1, 0, 0, 1, 1,
-1.194852, 0.2837508, -2.293718, 1, 0, 0, 1, 1,
-1.189694, 0.915251, -2.244256, 0, 0, 0, 1, 1,
-1.185479, 1.478559, -0.9518495, 0, 0, 0, 1, 1,
-1.172338, -0.305198, -2.185173, 0, 0, 0, 1, 1,
-1.169712, -0.3653031, -0.8642658, 0, 0, 0, 1, 1,
-1.166573, 1.696956, -0.1561936, 0, 0, 0, 1, 1,
-1.166451, -3.150372, -1.464029, 0, 0, 0, 1, 1,
-1.155127, 0.1097493, -0.8958822, 0, 0, 0, 1, 1,
-1.153753, -0.1152046, -1.989441, 1, 1, 1, 1, 1,
-1.153386, 1.504832, -1.06741, 1, 1, 1, 1, 1,
-1.153117, 0.8562786, -0.9518688, 1, 1, 1, 1, 1,
-1.151538, -0.2463512, -1.391803, 1, 1, 1, 1, 1,
-1.151267, -0.7063853, -0.8235389, 1, 1, 1, 1, 1,
-1.146757, 1.731207, -2.593182, 1, 1, 1, 1, 1,
-1.140924, 1.805691, -1.50879, 1, 1, 1, 1, 1,
-1.140423, 0.7461711, 0.7054582, 1, 1, 1, 1, 1,
-1.139571, 0.6351808, 0.0369207, 1, 1, 1, 1, 1,
-1.138529, 0.5171628, -0.03969641, 1, 1, 1, 1, 1,
-1.135259, -1.693465, -2.892067, 1, 1, 1, 1, 1,
-1.129698, 0.2188365, -3.499598, 1, 1, 1, 1, 1,
-1.122793, 0.7548761, -1.756699, 1, 1, 1, 1, 1,
-1.107053, 0.7330396, -1.433573, 1, 1, 1, 1, 1,
-1.0982, 0.6210392, -0.6454299, 1, 1, 1, 1, 1,
-1.092785, -0.5015534, -0.6246281, 0, 0, 1, 1, 1,
-1.089006, -0.5757747, -2.227779, 1, 0, 0, 1, 1,
-1.085478, 0.01850504, -3.533208, 1, 0, 0, 1, 1,
-1.080207, 0.7758351, -0.718143, 1, 0, 0, 1, 1,
-1.078165, -1.675014, -3.053247, 1, 0, 0, 1, 1,
-1.077847, 0.270514, -1.022194, 1, 0, 0, 1, 1,
-1.071406, -0.7165461, -0.7786765, 0, 0, 0, 1, 1,
-1.069912, -0.7264705, -2.488911, 0, 0, 0, 1, 1,
-1.065283, -0.8708895, -1.814818, 0, 0, 0, 1, 1,
-1.063185, 0.5966904, -1.319206, 0, 0, 0, 1, 1,
-1.062779, -1.218062, -2.039619, 0, 0, 0, 1, 1,
-1.062042, 0.3722131, -1.273376, 0, 0, 0, 1, 1,
-1.055109, -0.2629954, -1.534248, 0, 0, 0, 1, 1,
-1.053789, -0.2391416, -2.98645, 1, 1, 1, 1, 1,
-1.053633, 0.4296826, -1.114416, 1, 1, 1, 1, 1,
-1.052991, -1.646374, -2.478894, 1, 1, 1, 1, 1,
-1.046676, 0.9977365, -0.5267513, 1, 1, 1, 1, 1,
-1.044109, 1.117634, 0.1248651, 1, 1, 1, 1, 1,
-1.04192, -0.07806616, 0.09794112, 1, 1, 1, 1, 1,
-1.041066, -0.909869, -3.066558, 1, 1, 1, 1, 1,
-1.040334, 0.3686638, -1.750044, 1, 1, 1, 1, 1,
-1.029107, -0.9605567, -3.83446, 1, 1, 1, 1, 1,
-1.022999, 0.6167573, -1.041237, 1, 1, 1, 1, 1,
-1.017965, -1.371283, -1.824714, 1, 1, 1, 1, 1,
-1.015888, 0.6208299, -1.60961, 1, 1, 1, 1, 1,
-1.014154, 0.1549067, -1.233104, 1, 1, 1, 1, 1,
-1.014012, 1.027804, -1.191933, 1, 1, 1, 1, 1,
-1.009717, -0.1735152, -0.2969035, 1, 1, 1, 1, 1,
-1.00468, 2.17299, -0.3325717, 0, 0, 1, 1, 1,
-1.001737, 1.052216, -0.4578217, 1, 0, 0, 1, 1,
-0.9986565, -0.9065519, -2.257726, 1, 0, 0, 1, 1,
-0.9960505, 1.162842, -0.5549772, 1, 0, 0, 1, 1,
-0.9953187, 1.018616, -0.5916203, 1, 0, 0, 1, 1,
-0.9882077, 0.5355904, -2.731201, 1, 0, 0, 1, 1,
-0.9862741, 1.090955, 1.453024, 0, 0, 0, 1, 1,
-0.9757267, 0.2410131, 0.001700963, 0, 0, 0, 1, 1,
-0.9722434, 0.7614583, -0.3577081, 0, 0, 0, 1, 1,
-0.9624568, -0.1910057, 0.03620066, 0, 0, 0, 1, 1,
-0.9597512, 0.7721959, -1.947817, 0, 0, 0, 1, 1,
-0.9458361, 1.130645, -1.668331, 0, 0, 0, 1, 1,
-0.9392924, -1.284449, -3.019981, 0, 0, 0, 1, 1,
-0.9392269, 0.3977868, 0.1399223, 1, 1, 1, 1, 1,
-0.9370328, 1.501335, -0.2179669, 1, 1, 1, 1, 1,
-0.9349449, 0.3726939, -0.6459353, 1, 1, 1, 1, 1,
-0.9347017, 0.3741725, -0.1044724, 1, 1, 1, 1, 1,
-0.9338042, 0.3846229, -0.4369045, 1, 1, 1, 1, 1,
-0.9191675, 0.270338, -3.443047, 1, 1, 1, 1, 1,
-0.9178779, -0.5485003, -2.366106, 1, 1, 1, 1, 1,
-0.9164006, 0.2575714, -2.724142, 1, 1, 1, 1, 1,
-0.9143992, -0.5140129, -2.291518, 1, 1, 1, 1, 1,
-0.9123783, 0.06582665, -1.405075, 1, 1, 1, 1, 1,
-0.9092812, 0.2934736, -2.37972, 1, 1, 1, 1, 1,
-0.9080284, 0.6409132, -1.065098, 1, 1, 1, 1, 1,
-0.9056963, 0.3375701, -1.44154, 1, 1, 1, 1, 1,
-0.8980623, 0.3490535, -1.643299, 1, 1, 1, 1, 1,
-0.8970517, 0.4261009, -0.3372625, 1, 1, 1, 1, 1,
-0.8965569, 1.386757, -1.590678, 0, 0, 1, 1, 1,
-0.8937009, -0.5946583, -2.528528, 1, 0, 0, 1, 1,
-0.8936656, 0.9293879, -0.9210743, 1, 0, 0, 1, 1,
-0.8883809, -0.337907, -1.345237, 1, 0, 0, 1, 1,
-0.8883268, -0.5931073, -3.425122, 1, 0, 0, 1, 1,
-0.8815833, -1.158971, -2.288804, 1, 0, 0, 1, 1,
-0.8751864, 1.553174, 0.6737908, 0, 0, 0, 1, 1,
-0.8750647, -0.3016689, -2.560957, 0, 0, 0, 1, 1,
-0.8728185, -0.2568159, -1.602343, 0, 0, 0, 1, 1,
-0.8710973, 0.3191623, -3.123828, 0, 0, 0, 1, 1,
-0.868628, 0.3962694, -2.390537, 0, 0, 0, 1, 1,
-0.8683455, -0.4050948, -2.671413, 0, 0, 0, 1, 1,
-0.8652183, 1.125829, 0.04828299, 0, 0, 0, 1, 1,
-0.8630841, 1.314041, 0.1558034, 1, 1, 1, 1, 1,
-0.8542619, -0.7978588, -2.593498, 1, 1, 1, 1, 1,
-0.8529837, -0.30112, -0.9612932, 1, 1, 1, 1, 1,
-0.8521638, 0.4842935, -0.524684, 1, 1, 1, 1, 1,
-0.8474737, -0.7200097, -2.671131, 1, 1, 1, 1, 1,
-0.8463497, -1.150905, -1.424187, 1, 1, 1, 1, 1,
-0.8451456, 0.6595126, 1.204185, 1, 1, 1, 1, 1,
-0.8447511, 0.9787901, -1.980445, 1, 1, 1, 1, 1,
-0.840512, -1.310963, -5.01392, 1, 1, 1, 1, 1,
-0.8395053, -0.8126715, -4.054349, 1, 1, 1, 1, 1,
-0.8370606, 1.472053, -1.247233, 1, 1, 1, 1, 1,
-0.8321304, -0.5651253, -2.091674, 1, 1, 1, 1, 1,
-0.8284652, -0.8902107, 0.5950589, 1, 1, 1, 1, 1,
-0.827603, 1.039557, -0.7427061, 1, 1, 1, 1, 1,
-0.8265257, -1.328987, -0.7848428, 1, 1, 1, 1, 1,
-0.8264707, 0.8128564, -1.505211, 0, 0, 1, 1, 1,
-0.8233067, 1.503779, -0.8283593, 1, 0, 0, 1, 1,
-0.8224195, 0.299997, -1.206601, 1, 0, 0, 1, 1,
-0.8189099, -1.253671, -1.058624, 1, 0, 0, 1, 1,
-0.8158854, -0.1014184, -1.570788, 1, 0, 0, 1, 1,
-0.8155532, 1.604345, -0.6918398, 1, 0, 0, 1, 1,
-0.8138724, -1.81744, -2.551043, 0, 0, 0, 1, 1,
-0.8129878, -0.836716, -1.50352, 0, 0, 0, 1, 1,
-0.8127521, -0.149227, -0.9972532, 0, 0, 0, 1, 1,
-0.805367, -0.721997, -3.916628, 0, 0, 0, 1, 1,
-0.8032805, -0.1247671, -1.340182, 0, 0, 0, 1, 1,
-0.799994, 0.1625133, -1.170763, 0, 0, 0, 1, 1,
-0.7944355, -1.079947, -2.614336, 0, 0, 0, 1, 1,
-0.7849759, 1.885269, -0.3168268, 1, 1, 1, 1, 1,
-0.7823638, -0.688805, -3.488982, 1, 1, 1, 1, 1,
-0.7706424, 0.8233615, -1.344697, 1, 1, 1, 1, 1,
-0.7671723, -0.6337096, -1.304347, 1, 1, 1, 1, 1,
-0.764012, -0.4114053, -1.481729, 1, 1, 1, 1, 1,
-0.7560765, 1.037018, -0.3068324, 1, 1, 1, 1, 1,
-0.7524324, 0.6968976, -0.2133076, 1, 1, 1, 1, 1,
-0.7522509, -1.083649, -1.726324, 1, 1, 1, 1, 1,
-0.7477488, -0.1860829, -3.701008, 1, 1, 1, 1, 1,
-0.7477059, 0.5575593, -0.3014107, 1, 1, 1, 1, 1,
-0.7461455, -0.3478898, -0.4627829, 1, 1, 1, 1, 1,
-0.745232, 1.743356, -0.3209452, 1, 1, 1, 1, 1,
-0.7416806, -1.345185, -1.608368, 1, 1, 1, 1, 1,
-0.7379246, 1.340714, -1.144832, 1, 1, 1, 1, 1,
-0.7350433, 0.6257122, -2.3903, 1, 1, 1, 1, 1,
-0.7342601, 0.2722585, -0.8659757, 0, 0, 1, 1, 1,
-0.7309531, 0.2965722, -2.666712, 1, 0, 0, 1, 1,
-0.7305424, 1.470376, 0.960637, 1, 0, 0, 1, 1,
-0.7254385, 0.100721, -2.649798, 1, 0, 0, 1, 1,
-0.7243562, -1.744446, -1.362469, 1, 0, 0, 1, 1,
-0.7202917, 1.166158, -2.082541, 1, 0, 0, 1, 1,
-0.7201368, 1.267815, 0.02265642, 0, 0, 0, 1, 1,
-0.7114822, 0.07234088, -1.622384, 0, 0, 0, 1, 1,
-0.7070736, 0.1339008, -0.7865504, 0, 0, 0, 1, 1,
-0.7052545, 0.3419115, -1.127878, 0, 0, 0, 1, 1,
-0.7039452, 1.10343, -0.3391125, 0, 0, 0, 1, 1,
-0.7037581, 0.7332316, -1.358402, 0, 0, 0, 1, 1,
-0.701732, -1.70523, -4.391912, 0, 0, 0, 1, 1,
-0.7013665, -0.6932948, -1.761347, 1, 1, 1, 1, 1,
-0.7004256, -0.2545095, -2.896825, 1, 1, 1, 1, 1,
-0.6947697, 0.2424011, -1.581597, 1, 1, 1, 1, 1,
-0.6933159, -1.369742, -2.0364, 1, 1, 1, 1, 1,
-0.6928675, 0.9551719, 0.05263857, 1, 1, 1, 1, 1,
-0.6924288, 1.034639, 1.738203, 1, 1, 1, 1, 1,
-0.6913922, 2.019251, -0.9620311, 1, 1, 1, 1, 1,
-0.6875517, -0.5075162, -3.576858, 1, 1, 1, 1, 1,
-0.6818853, 0.02628511, -1.440504, 1, 1, 1, 1, 1,
-0.669264, -0.5548801, -2.797424, 1, 1, 1, 1, 1,
-0.6687587, 1.104768, -2.120301, 1, 1, 1, 1, 1,
-0.664529, 0.807793, -0.6321791, 1, 1, 1, 1, 1,
-0.663394, 0.02202233, -1.585611, 1, 1, 1, 1, 1,
-0.6601708, 0.4536512, -0.7743756, 1, 1, 1, 1, 1,
-0.6534253, 1.419876, -1.272626, 1, 1, 1, 1, 1,
-0.6469904, 0.7124001, -0.533047, 0, 0, 1, 1, 1,
-0.6451997, 1.20754, -1.92928, 1, 0, 0, 1, 1,
-0.6425852, -0.6392748, -1.965223, 1, 0, 0, 1, 1,
-0.640466, 0.1855085, -2.943612, 1, 0, 0, 1, 1,
-0.6303106, 2.021095, -1.109571, 1, 0, 0, 1, 1,
-0.627089, -1.230402, -3.085692, 1, 0, 0, 1, 1,
-0.6218952, -1.909606, -3.289143, 0, 0, 0, 1, 1,
-0.6181083, -0.8483841, -2.236502, 0, 0, 0, 1, 1,
-0.6141727, -0.05511524, -1.365597, 0, 0, 0, 1, 1,
-0.6068652, 1.545054, -0.5487341, 0, 0, 0, 1, 1,
-0.5999675, -0.3277989, -2.874228, 0, 0, 0, 1, 1,
-0.5965193, 0.5432829, -0.2428784, 0, 0, 0, 1, 1,
-0.5907526, -0.6416525, -0.684112, 0, 0, 0, 1, 1,
-0.5879857, 0.5971323, -1.179168, 1, 1, 1, 1, 1,
-0.5863757, -1.163237, -2.363501, 1, 1, 1, 1, 1,
-0.584353, -1.113483, -3.179013, 1, 1, 1, 1, 1,
-0.5817665, 0.05994371, -0.6696695, 1, 1, 1, 1, 1,
-0.5774171, 0.9321746, -0.3727843, 1, 1, 1, 1, 1,
-0.5740506, -1.100486, -3.100592, 1, 1, 1, 1, 1,
-0.5728583, 0.5640078, -2.534824, 1, 1, 1, 1, 1,
-0.5710413, 0.3521814, -1.473394, 1, 1, 1, 1, 1,
-0.5579905, -1.351107, -2.450172, 1, 1, 1, 1, 1,
-0.555003, 0.7288176, -2.780493, 1, 1, 1, 1, 1,
-0.554511, -0.1711946, -3.061757, 1, 1, 1, 1, 1,
-0.5536631, -0.3387219, -3.052885, 1, 1, 1, 1, 1,
-0.5521133, -0.6315683, -0.1223401, 1, 1, 1, 1, 1,
-0.5499777, -0.8176705, -2.07457, 1, 1, 1, 1, 1,
-0.5491117, -0.6199719, -2.816874, 1, 1, 1, 1, 1,
-0.5475374, -0.284894, -1.22185, 0, 0, 1, 1, 1,
-0.5469002, 0.8074483, -0.8750032, 1, 0, 0, 1, 1,
-0.546583, -1.396008, -4.138877, 1, 0, 0, 1, 1,
-0.5411431, -1.50229, -3.014685, 1, 0, 0, 1, 1,
-0.5411099, 0.3531298, -0.07382881, 1, 0, 0, 1, 1,
-0.5405701, 0.1354204, -1.338259, 1, 0, 0, 1, 1,
-0.5383738, 0.5003096, -1.481673, 0, 0, 0, 1, 1,
-0.5376925, 1.573237, 0.6309879, 0, 0, 0, 1, 1,
-0.5354496, -1.146294, -2.78028, 0, 0, 0, 1, 1,
-0.5320466, -0.8663704, -2.659852, 0, 0, 0, 1, 1,
-0.5314943, -1.224564, -3.770431, 0, 0, 0, 1, 1,
-0.5181046, 1.785724, -2.048491, 0, 0, 0, 1, 1,
-0.5125737, 0.9186652, -0.4791248, 0, 0, 0, 1, 1,
-0.512352, -0.8180763, -2.494756, 1, 1, 1, 1, 1,
-0.506855, 0.9325544, -1.282642, 1, 1, 1, 1, 1,
-0.5062084, -0.7822222, -2.636157, 1, 1, 1, 1, 1,
-0.5043615, -0.1826654, -0.4313339, 1, 1, 1, 1, 1,
-0.5023487, 0.08679602, -2.282247, 1, 1, 1, 1, 1,
-0.5021079, -0.4537467, -1.853266, 1, 1, 1, 1, 1,
-0.4829848, -0.8478054, -3.667341, 1, 1, 1, 1, 1,
-0.4772623, 0.7482166, 0.8170846, 1, 1, 1, 1, 1,
-0.4746516, 0.3594253, -0.3395392, 1, 1, 1, 1, 1,
-0.473382, 0.8872148, 0.8585482, 1, 1, 1, 1, 1,
-0.4709915, -0.222706, -1.875918, 1, 1, 1, 1, 1,
-0.4675558, -0.2151428, -3.251083, 1, 1, 1, 1, 1,
-0.4650167, -1.882359, -4.152376, 1, 1, 1, 1, 1,
-0.4643873, -0.1370256, -0.7931826, 1, 1, 1, 1, 1,
-0.4617813, 0.4174393, -0.5278462, 1, 1, 1, 1, 1,
-0.4598165, 0.1669075, -2.147783, 0, 0, 1, 1, 1,
-0.4565266, 0.4798239, -0.7967352, 1, 0, 0, 1, 1,
-0.4481192, 0.008334307, -2.421463, 1, 0, 0, 1, 1,
-0.4447879, 0.4493311, -1.411681, 1, 0, 0, 1, 1,
-0.4395967, 0.1577551, -0.4423515, 1, 0, 0, 1, 1,
-0.4351391, -0.03710394, -2.086404, 1, 0, 0, 1, 1,
-0.426712, 1.850123, -0.3077917, 0, 0, 0, 1, 1,
-0.4254893, 0.359991, -1.101514, 0, 0, 0, 1, 1,
-0.419421, 0.2638144, 0.248958, 0, 0, 0, 1, 1,
-0.4181523, -4.563123e-05, -1.744204, 0, 0, 0, 1, 1,
-0.4144334, 0.7418177, -0.04150605, 0, 0, 0, 1, 1,
-0.4091187, 0.427665, 1.074638, 0, 0, 0, 1, 1,
-0.4017164, -0.8929233, -2.161407, 0, 0, 0, 1, 1,
-0.3999925, 0.7018247, -0.6801136, 1, 1, 1, 1, 1,
-0.3991158, -0.3182781, -3.642903, 1, 1, 1, 1, 1,
-0.39705, -0.5610664, -1.900921, 1, 1, 1, 1, 1,
-0.3939724, 0.4582422, -0.8199185, 1, 1, 1, 1, 1,
-0.3938668, 0.6675797, -3.395686, 1, 1, 1, 1, 1,
-0.3926712, -0.9836769, -2.272902, 1, 1, 1, 1, 1,
-0.3896368, 0.4867646, -0.9477166, 1, 1, 1, 1, 1,
-0.3813478, 1.655576, -1.866995, 1, 1, 1, 1, 1,
-0.3802492, -1.021615, -2.147011, 1, 1, 1, 1, 1,
-0.3791921, 0.9254926, 0.5208252, 1, 1, 1, 1, 1,
-0.3768846, -1.423568, -2.235212, 1, 1, 1, 1, 1,
-0.374486, -0.3544666, -2.659225, 1, 1, 1, 1, 1,
-0.373854, 0.9467253, -0.2803352, 1, 1, 1, 1, 1,
-0.3692026, 0.265459, -0.202766, 1, 1, 1, 1, 1,
-0.3664815, -1.479398, -2.014214, 1, 1, 1, 1, 1,
-0.3663002, 0.05357006, -1.997041, 0, 0, 1, 1, 1,
-0.3647681, -1.3534, -3.977043, 1, 0, 0, 1, 1,
-0.3640281, 0.226437, -0.4523666, 1, 0, 0, 1, 1,
-0.3638718, -0.7453981, -4.570516, 1, 0, 0, 1, 1,
-0.3536911, 0.7739093, -0.7056141, 1, 0, 0, 1, 1,
-0.3472711, -0.6508622, -2.22884, 1, 0, 0, 1, 1,
-0.3459079, -1.19164, -4.302255, 0, 0, 0, 1, 1,
-0.3423502, -0.6266452, -2.158017, 0, 0, 0, 1, 1,
-0.3408462, 1.175255, 0.2898108, 0, 0, 0, 1, 1,
-0.3401131, -0.03390397, -0.7280411, 0, 0, 0, 1, 1,
-0.3399141, 0.8062678, -1.960289, 0, 0, 0, 1, 1,
-0.3359956, 0.1528227, -0.09109043, 0, 0, 0, 1, 1,
-0.3305995, 1.902509, 0.1511724, 0, 0, 0, 1, 1,
-0.3213754, -0.8362241, -2.736586, 1, 1, 1, 1, 1,
-0.3181519, -0.8176992, -2.496684, 1, 1, 1, 1, 1,
-0.3128984, 0.9366907, 2.302757, 1, 1, 1, 1, 1,
-0.3119184, -0.6820129, -0.2094253, 1, 1, 1, 1, 1,
-0.310979, 1.622982, 0.1395989, 1, 1, 1, 1, 1,
-0.3073636, -0.007379231, -2.497961, 1, 1, 1, 1, 1,
-0.3051954, 0.1801499, -2.364099, 1, 1, 1, 1, 1,
-0.3036449, 0.6516964, -0.9319308, 1, 1, 1, 1, 1,
-0.300749, -0.2235074, -1.947237, 1, 1, 1, 1, 1,
-0.2975118, 0.06389861, -0.2431516, 1, 1, 1, 1, 1,
-0.2916695, 0.7585272, -0.9124793, 1, 1, 1, 1, 1,
-0.2878809, -1.052242, -3.729416, 1, 1, 1, 1, 1,
-0.2861384, -1.713804, -3.563713, 1, 1, 1, 1, 1,
-0.2846015, -2.143369, -2.773342, 1, 1, 1, 1, 1,
-0.2796957, 0.3164255, -1.271916, 1, 1, 1, 1, 1,
-0.2732838, -1.098029, -2.430419, 0, 0, 1, 1, 1,
-0.2730122, -0.2355634, -0.9008384, 1, 0, 0, 1, 1,
-0.2729102, -1.505593, -2.603597, 1, 0, 0, 1, 1,
-0.2717492, -0.3659933, -3.55704, 1, 0, 0, 1, 1,
-0.2695222, -0.8212013, -1.327503, 1, 0, 0, 1, 1,
-0.2674987, 1.333839, -0.5042773, 1, 0, 0, 1, 1,
-0.2562985, -1.150934, -2.279588, 0, 0, 0, 1, 1,
-0.2531268, 0.6671705, -0.8972844, 0, 0, 0, 1, 1,
-0.2477962, 2.030366, 0.3039447, 0, 0, 0, 1, 1,
-0.2433455, -0.2581906, -2.366725, 0, 0, 0, 1, 1,
-0.2372394, -0.7830402, -3.199457, 0, 0, 0, 1, 1,
-0.2370984, 0.04745651, -0.1014388, 0, 0, 0, 1, 1,
-0.2362124, 0.1885581, 0.01549297, 0, 0, 0, 1, 1,
-0.2342523, -0.4423877, -3.565056, 1, 1, 1, 1, 1,
-0.2334864, 0.6941867, 0.4024473, 1, 1, 1, 1, 1,
-0.2327258, 1.22941, 0.3580066, 1, 1, 1, 1, 1,
-0.2297403, 1.768155, -0.006793747, 1, 1, 1, 1, 1,
-0.2291781, -0.5538662, -3.842327, 1, 1, 1, 1, 1,
-0.2272528, -0.9511976, -3.636505, 1, 1, 1, 1, 1,
-0.226118, 0.4030098, -0.222525, 1, 1, 1, 1, 1,
-0.2229062, -0.5625585, -3.275522, 1, 1, 1, 1, 1,
-0.2174391, -0.3434375, -2.468573, 1, 1, 1, 1, 1,
-0.2124478, -0.2871641, -1.398138, 1, 1, 1, 1, 1,
-0.2120296, -1.2339, -2.231346, 1, 1, 1, 1, 1,
-0.2110898, -1.738379, -2.509817, 1, 1, 1, 1, 1,
-0.2056386, -0.6559175, -3.696383, 1, 1, 1, 1, 1,
-0.2011726, -1.386804, -3.846386, 1, 1, 1, 1, 1,
-0.1998609, -0.8057699, -1.795795, 1, 1, 1, 1, 1,
-0.1987021, -1.717352, -1.972866, 0, 0, 1, 1, 1,
-0.1986481, 0.2249968, -0.4768929, 1, 0, 0, 1, 1,
-0.197276, 1.075834, -0.7768042, 1, 0, 0, 1, 1,
-0.1894269, 0.07633036, 0.7238383, 1, 0, 0, 1, 1,
-0.1871502, 0.7607872, -1.345803, 1, 0, 0, 1, 1,
-0.1864544, 0.3244708, -2.052665, 1, 0, 0, 1, 1,
-0.1845603, -0.3656763, -4.857354, 0, 0, 0, 1, 1,
-0.1841788, 0.0595121, -1.139205, 0, 0, 0, 1, 1,
-0.1815192, -0.5990749, -3.038345, 0, 0, 0, 1, 1,
-0.1779059, 0.2338714, -1.3308, 0, 0, 0, 1, 1,
-0.1749766, 0.7232587, -0.01286258, 0, 0, 0, 1, 1,
-0.1719212, 1.048342, 0.7343563, 0, 0, 0, 1, 1,
-0.1639447, 0.4945809, 0.2535626, 0, 0, 0, 1, 1,
-0.1561233, 0.5645451, 1.632279, 1, 1, 1, 1, 1,
-0.155505, -0.2566201, -1.792419, 1, 1, 1, 1, 1,
-0.1542954, 0.2425321, -1.057723, 1, 1, 1, 1, 1,
-0.1482454, 0.154427, -0.3939815, 1, 1, 1, 1, 1,
-0.1443832, -0.2898539, -1.581664, 1, 1, 1, 1, 1,
-0.1415627, -0.4386979, -0.5232385, 1, 1, 1, 1, 1,
-0.1401928, 0.2103279, -0.6924587, 1, 1, 1, 1, 1,
-0.1401667, 0.3848991, -0.8771245, 1, 1, 1, 1, 1,
-0.1356565, 1.063888, 0.8063725, 1, 1, 1, 1, 1,
-0.1331655, 0.5763316, -0.4155053, 1, 1, 1, 1, 1,
-0.132858, -0.5061234, -1.7427, 1, 1, 1, 1, 1,
-0.1318764, -0.1395361, -1.921767, 1, 1, 1, 1, 1,
-0.1289762, 1.296949, 0.4750031, 1, 1, 1, 1, 1,
-0.1247415, 1.062296, -1.137463, 1, 1, 1, 1, 1,
-0.1231196, -1.691091, -2.384026, 1, 1, 1, 1, 1,
-0.121256, 0.8064862, 1.157553, 0, 0, 1, 1, 1,
-0.1195482, 0.2123176, 0.1376335, 1, 0, 0, 1, 1,
-0.1189018, -1.096497, -3.617212, 1, 0, 0, 1, 1,
-0.1151432, 1.878492, 0.5136909, 1, 0, 0, 1, 1,
-0.1097177, 1.134952, 1.639428, 1, 0, 0, 1, 1,
-0.1091362, 0.01137937, -2.124639, 1, 0, 0, 1, 1,
-0.1082023, -0.473613, -2.503541, 0, 0, 0, 1, 1,
-0.1078488, -0.2041119, -2.742864, 0, 0, 0, 1, 1,
-0.1076985, 0.02977958, -0.5618358, 0, 0, 0, 1, 1,
-0.1070809, 0.1135528, 0.8357127, 0, 0, 0, 1, 1,
-0.1067066, -1.090775, -3.416525, 0, 0, 0, 1, 1,
-0.106632, -1.714113, -4.296874, 0, 0, 0, 1, 1,
-0.1009886, -0.6039981, -3.303427, 0, 0, 0, 1, 1,
-0.09840792, -0.06785669, -2.023199, 1, 1, 1, 1, 1,
-0.09608988, -0.980673, -3.430021, 1, 1, 1, 1, 1,
-0.09140167, -0.3379825, -3.513561, 1, 1, 1, 1, 1,
-0.09107877, 0.221885, -0.433052, 1, 1, 1, 1, 1,
-0.08818793, 0.4401785, 0.5195881, 1, 1, 1, 1, 1,
-0.08802442, -0.002251237, -0.1955578, 1, 1, 1, 1, 1,
-0.0856663, -1.04215, -2.750871, 1, 1, 1, 1, 1,
-0.08552533, 0.7882193, 1.615949, 1, 1, 1, 1, 1,
-0.08130521, 0.2380103, 0.1477127, 1, 1, 1, 1, 1,
-0.08104314, -0.02114179, -0.9954363, 1, 1, 1, 1, 1,
-0.07695093, 0.3109884, 0.2812646, 1, 1, 1, 1, 1,
-0.07686184, 1.350882, -0.4821577, 1, 1, 1, 1, 1,
-0.06813162, -1.490032, -3.226225, 1, 1, 1, 1, 1,
-0.06705549, -0.3392824, -3.259353, 1, 1, 1, 1, 1,
-0.06265335, -0.7852703, -5.606818, 1, 1, 1, 1, 1,
-0.05658446, -0.1252785, -3.363301, 0, 0, 1, 1, 1,
-0.05243095, 0.9625424, -2.06022, 1, 0, 0, 1, 1,
-0.05170256, -1.437653, -2.68152, 1, 0, 0, 1, 1,
-0.05054723, -0.6263463, -2.608415, 1, 0, 0, 1, 1,
-0.04862712, 0.9633122, 0.5550945, 1, 0, 0, 1, 1,
-0.04370559, 0.5919709, 1.666117, 1, 0, 0, 1, 1,
-0.04349997, -0.3091622, -3.521564, 0, 0, 0, 1, 1,
-0.04306532, 2.432991, -1.109611, 0, 0, 0, 1, 1,
-0.03923766, 0.6544116, -0.3969748, 0, 0, 0, 1, 1,
-0.03494159, 0.5098107, 1.019226, 0, 0, 0, 1, 1,
-0.03341556, -1.493843, -3.410186, 0, 0, 0, 1, 1,
-0.02755876, 1.250697, -0.4608494, 0, 0, 0, 1, 1,
-0.02720417, 0.7913936, -0.1753258, 0, 0, 0, 1, 1,
-0.02634513, 0.1862705, 0.3904573, 1, 1, 1, 1, 1,
-0.02504658, -0.4897355, -1.276289, 1, 1, 1, 1, 1,
-0.02455305, -0.5778416, -2.278947, 1, 1, 1, 1, 1,
-0.01657805, 0.8040281, -0.6642381, 1, 1, 1, 1, 1,
-0.0106176, 1.327303, -0.9608924, 1, 1, 1, 1, 1,
-0.009036215, 1.546821, -2.484134, 1, 1, 1, 1, 1,
-0.006910554, -0.3672493, -2.524992, 1, 1, 1, 1, 1,
-0.005032246, -0.5919647, -4.753648, 1, 1, 1, 1, 1,
-0.004871489, -0.2447685, -3.505181, 1, 1, 1, 1, 1,
-0.004733953, -1.598512, -4.526308, 1, 1, 1, 1, 1,
-0.002758567, -1.010594, -3.446227, 1, 1, 1, 1, 1,
0.0003094056, -1.338079, 2.439118, 1, 1, 1, 1, 1,
0.002572277, -1.834671, 3.114161, 1, 1, 1, 1, 1,
0.007766028, 0.2337415, -0.2497208, 1, 1, 1, 1, 1,
0.008100594, 1.620538, 0.7210562, 1, 1, 1, 1, 1,
0.01530995, 0.703671, -0.468527, 0, 0, 1, 1, 1,
0.01552634, -0.2623363, 2.912306, 1, 0, 0, 1, 1,
0.01587735, -0.1578461, 4.517914, 1, 0, 0, 1, 1,
0.01665465, -2.968476, 4.001233, 1, 0, 0, 1, 1,
0.0189613, -0.6213454, 1.933437, 1, 0, 0, 1, 1,
0.02176735, 0.2816699, 0.5695821, 1, 0, 0, 1, 1,
0.02467858, 0.0265593, 0.04708589, 0, 0, 0, 1, 1,
0.02514081, 0.3727891, 0.3204589, 0, 0, 0, 1, 1,
0.02638512, 0.3538646, 0.6276618, 0, 0, 0, 1, 1,
0.02716552, 1.136645, 1.661684, 0, 0, 0, 1, 1,
0.02927831, 0.5180964, 2.033425, 0, 0, 0, 1, 1,
0.03856723, 1.439566, 0.08351159, 0, 0, 0, 1, 1,
0.03995648, 0.4061355, 0.9146661, 0, 0, 0, 1, 1,
0.0411741, 1.595044, -1.0359, 1, 1, 1, 1, 1,
0.04208625, 0.1200373, -0.08441673, 1, 1, 1, 1, 1,
0.04281233, 0.8561118, 1.042922, 1, 1, 1, 1, 1,
0.04884089, 0.1584654, -0.5398253, 1, 1, 1, 1, 1,
0.05261584, 0.09138621, 0.02077547, 1, 1, 1, 1, 1,
0.05304766, -0.1400907, 2.465801, 1, 1, 1, 1, 1,
0.05307799, 0.06029072, 0.2023394, 1, 1, 1, 1, 1,
0.05514406, -0.3818317, 2.694838, 1, 1, 1, 1, 1,
0.06179844, -0.1551464, 4.44664, 1, 1, 1, 1, 1,
0.0639768, -0.5328664, 1.037103, 1, 1, 1, 1, 1,
0.0647897, 2.129019, 1.962403, 1, 1, 1, 1, 1,
0.0648123, -0.1909594, 1.217701, 1, 1, 1, 1, 1,
0.06669728, 0.8359212, 0.6295183, 1, 1, 1, 1, 1,
0.06761102, -1.106223, 1.435928, 1, 1, 1, 1, 1,
0.06840538, -0.2845654, 3.803671, 1, 1, 1, 1, 1,
0.06866413, -0.8201274, 2.936003, 0, 0, 1, 1, 1,
0.07625828, 0.7066723, 0.3356483, 1, 0, 0, 1, 1,
0.07878179, 1.279152, -1.612586, 1, 0, 0, 1, 1,
0.07949234, 0.4154244, 0.4037517, 1, 0, 0, 1, 1,
0.08359689, 0.7155157, -1.743055, 1, 0, 0, 1, 1,
0.08843181, 1.289785, 0.7078543, 1, 0, 0, 1, 1,
0.09395795, -1.478574, 3.508649, 0, 0, 0, 1, 1,
0.0958866, 0.8633993, 0.4808531, 0, 0, 0, 1, 1,
0.09766056, -1.622007, 2.815351, 0, 0, 0, 1, 1,
0.1010416, 0.7099174, 0.8521505, 0, 0, 0, 1, 1,
0.1020469, -0.8056284, 5.432872, 0, 0, 0, 1, 1,
0.1022609, -1.766658, 3.514436, 0, 0, 0, 1, 1,
0.1066107, 0.3082041, 0.6224353, 0, 0, 0, 1, 1,
0.1077454, 0.1049319, 0.3875108, 1, 1, 1, 1, 1,
0.1185391, -0.5122132, 3.968112, 1, 1, 1, 1, 1,
0.1191219, -0.09497159, 2.6648, 1, 1, 1, 1, 1,
0.119189, -0.6644188, 3.734098, 1, 1, 1, 1, 1,
0.1225258, -0.6636437, 2.242672, 1, 1, 1, 1, 1,
0.1257382, -0.2145448, 3.484218, 1, 1, 1, 1, 1,
0.1276188, -1.673994, 3.55209, 1, 1, 1, 1, 1,
0.1313229, 1.084746, 1.781231, 1, 1, 1, 1, 1,
0.1331318, 0.0862011, 1.690858, 1, 1, 1, 1, 1,
0.1338089, 0.1715112, -0.2823095, 1, 1, 1, 1, 1,
0.1398164, -0.8476726, 1.727439, 1, 1, 1, 1, 1,
0.1482875, -0.3859808, 2.851094, 1, 1, 1, 1, 1,
0.1488516, -1.086778, 3.710674, 1, 1, 1, 1, 1,
0.1516088, 0.4480119, 0.6931038, 1, 1, 1, 1, 1,
0.155512, -0.3509366, 3.557729, 1, 1, 1, 1, 1,
0.1556769, -1.669043, 2.852784, 0, 0, 1, 1, 1,
0.1617376, 0.588104, 0.5071642, 1, 0, 0, 1, 1,
0.1721133, 1.491388, -2.055934, 1, 0, 0, 1, 1,
0.1837861, 0.6195271, 0.7283793, 1, 0, 0, 1, 1,
0.18388, 0.1377741, 1.545767, 1, 0, 0, 1, 1,
0.1876495, 1.61146, 0.3474236, 1, 0, 0, 1, 1,
0.1878737, 0.4403912, -0.4943588, 0, 0, 0, 1, 1,
0.1920919, -1.926145, 1.871147, 0, 0, 0, 1, 1,
0.1941849, 0.8334991, 0.06045103, 0, 0, 0, 1, 1,
0.1963321, -1.510467, 2.268308, 0, 0, 0, 1, 1,
0.1963603, -0.3031438, 3.468601, 0, 0, 0, 1, 1,
0.1981053, 0.5535167, 1.231211, 0, 0, 0, 1, 1,
0.2005174, -0.5161074, 2.893029, 0, 0, 0, 1, 1,
0.201275, 0.5615328, 0.7919531, 1, 1, 1, 1, 1,
0.2015688, 1.070086, 0.7731239, 1, 1, 1, 1, 1,
0.2017579, -0.808782, 2.42369, 1, 1, 1, 1, 1,
0.206862, -0.02106468, 2.44071, 1, 1, 1, 1, 1,
0.2073282, -0.2660539, 0.7966692, 1, 1, 1, 1, 1,
0.207765, 1.236109, -0.7029749, 1, 1, 1, 1, 1,
0.2083124, -1.537211, 2.515471, 1, 1, 1, 1, 1,
0.2123221, -0.3686607, 2.068204, 1, 1, 1, 1, 1,
0.2154004, -0.217442, 3.905659, 1, 1, 1, 1, 1,
0.2186127, 1.310626, -0.5412772, 1, 1, 1, 1, 1,
0.2284195, 1.140804, 0.4170934, 1, 1, 1, 1, 1,
0.2286099, 0.9379013, 0.4386488, 1, 1, 1, 1, 1,
0.2303992, 0.2721224, -0.1077417, 1, 1, 1, 1, 1,
0.2329957, 1.678585, 1.47317, 1, 1, 1, 1, 1,
0.235023, 1.898614, 1.106133, 1, 1, 1, 1, 1,
0.2351363, -0.2355241, 2.131783, 0, 0, 1, 1, 1,
0.2355368, 0.6336599, 0.8262956, 1, 0, 0, 1, 1,
0.2385931, -0.3383443, 0.8951463, 1, 0, 0, 1, 1,
0.2386678, -0.0002342846, 2.915052, 1, 0, 0, 1, 1,
0.2457167, -0.6325287, 3.560389, 1, 0, 0, 1, 1,
0.2467198, 1.732825, -1.003366, 1, 0, 0, 1, 1,
0.2496075, 0.2016641, 2.517725, 0, 0, 0, 1, 1,
0.2496115, 0.8028125, -1.686178, 0, 0, 0, 1, 1,
0.2502188, -0.5728581, 2.552006, 0, 0, 0, 1, 1,
0.2512012, 0.5832961, -0.2718391, 0, 0, 0, 1, 1,
0.2530399, 0.7972238, -0.4576138, 0, 0, 0, 1, 1,
0.2547143, -1.981526, 3.487869, 0, 0, 0, 1, 1,
0.2555086, 1.230131, -0.2470201, 0, 0, 0, 1, 1,
0.2581197, -0.8406236, 3.188275, 1, 1, 1, 1, 1,
0.2611575, 1.035983, -1.089869, 1, 1, 1, 1, 1,
0.2644243, 0.3766314, 0.785311, 1, 1, 1, 1, 1,
0.2673102, 0.5532414, 0.7197184, 1, 1, 1, 1, 1,
0.2705913, 2.059541, -0.1754809, 1, 1, 1, 1, 1,
0.2726997, -0.06892541, 3.323084, 1, 1, 1, 1, 1,
0.2732151, 0.5762294, -1.421812, 1, 1, 1, 1, 1,
0.2756347, 0.4443261, -1.05758, 1, 1, 1, 1, 1,
0.2757092, -1.394245, 2.9062, 1, 1, 1, 1, 1,
0.2778831, 0.5923597, 0.2591051, 1, 1, 1, 1, 1,
0.2785617, -0.8539085, 3.578733, 1, 1, 1, 1, 1,
0.2798976, -1.39591, 3.371836, 1, 1, 1, 1, 1,
0.2810347, -1.575281, 3.231305, 1, 1, 1, 1, 1,
0.2830956, 0.2782121, 0.9244073, 1, 1, 1, 1, 1,
0.2839977, -0.3230821, 1.218671, 1, 1, 1, 1, 1,
0.2867039, 1.417365, 0.4578265, 0, 0, 1, 1, 1,
0.2880462, 0.3373488, 0.2660635, 1, 0, 0, 1, 1,
0.2924692, -0.5460581, 0.9242588, 1, 0, 0, 1, 1,
0.2944079, -1.641719, 2.414649, 1, 0, 0, 1, 1,
0.2946483, 0.2520443, 0.05092559, 1, 0, 0, 1, 1,
0.29794, -2.376213, 3.742481, 1, 0, 0, 1, 1,
0.2988686, -1.102679, 2.180629, 0, 0, 0, 1, 1,
0.2989477, 1.570877, -1.211546, 0, 0, 0, 1, 1,
0.301446, 1.19736, 0.4478035, 0, 0, 0, 1, 1,
0.3046086, 1.400161, 1.58841, 0, 0, 0, 1, 1,
0.3050636, 0.08572677, -0.6984046, 0, 0, 0, 1, 1,
0.3066052, -1.022612, 2.710215, 0, 0, 0, 1, 1,
0.3110008, -1.096135, 3.699741, 0, 0, 0, 1, 1,
0.3116198, 2.420321, 0.9568941, 1, 1, 1, 1, 1,
0.3167418, -0.6343436, 3.327473, 1, 1, 1, 1, 1,
0.3172368, 1.65366, -0.2549319, 1, 1, 1, 1, 1,
0.3206459, 0.8826174, -0.2277573, 1, 1, 1, 1, 1,
0.321756, -0.607568, 1.681897, 1, 1, 1, 1, 1,
0.322609, -0.9958012, 4.616784, 1, 1, 1, 1, 1,
0.3234076, 0.1670806, 0.5771384, 1, 1, 1, 1, 1,
0.3234555, 0.02951995, 2.465089, 1, 1, 1, 1, 1,
0.3269189, -2.080233, 1.917646, 1, 1, 1, 1, 1,
0.3292671, -1.28674, 2.165546, 1, 1, 1, 1, 1,
0.3323212, -0.9259109, 2.978723, 1, 1, 1, 1, 1,
0.3347298, -0.5300727, 2.278862, 1, 1, 1, 1, 1,
0.3363894, 0.2632144, -0.4605454, 1, 1, 1, 1, 1,
0.3365121, -2.038554, 3.431953, 1, 1, 1, 1, 1,
0.3434387, -0.6919423, 1.702873, 1, 1, 1, 1, 1,
0.3448249, 0.2539825, 1.498448, 0, 0, 1, 1, 1,
0.3455261, 0.713408, 0.7499102, 1, 0, 0, 1, 1,
0.352113, -1.645122, 3.08848, 1, 0, 0, 1, 1,
0.3528876, 1.134004, 2.878901, 1, 0, 0, 1, 1,
0.3553767, 0.01593827, 2.776303, 1, 0, 0, 1, 1,
0.3566047, 0.287831, 1.21129, 1, 0, 0, 1, 1,
0.3583155, 0.02426285, 0.0795544, 0, 0, 0, 1, 1,
0.3653046, 0.2860208, 2.363185, 0, 0, 0, 1, 1,
0.3658753, -1.214784, 1.8144, 0, 0, 0, 1, 1,
0.3659287, -0.1754102, 4.33867, 0, 0, 0, 1, 1,
0.3667761, -0.1462101, 1.755581, 0, 0, 0, 1, 1,
0.3689954, 2.890572, -0.7379144, 0, 0, 0, 1, 1,
0.3694888, 1.625068, 2.057645, 0, 0, 0, 1, 1,
0.3741553, 0.6534992, -0.3592595, 1, 1, 1, 1, 1,
0.3744724, -1.288329, 3.233114, 1, 1, 1, 1, 1,
0.3774937, 2.136416, 2.438497, 1, 1, 1, 1, 1,
0.3774987, 1.580281, -1.842997, 1, 1, 1, 1, 1,
0.3794901, 1.452418, 2.443774, 1, 1, 1, 1, 1,
0.3801865, -0.07283025, 0.1860071, 1, 1, 1, 1, 1,
0.3826199, -0.7377743, 1.139732, 1, 1, 1, 1, 1,
0.3832776, 0.5916718, 1.818706, 1, 1, 1, 1, 1,
0.3843652, 2.578925, -0.7675309, 1, 1, 1, 1, 1,
0.3936548, 0.3972698, 1.569457, 1, 1, 1, 1, 1,
0.3943977, 2.010145, 0.5043691, 1, 1, 1, 1, 1,
0.4030447, -1.024843, 2.106584, 1, 1, 1, 1, 1,
0.4039473, -0.2391074, 0.3499586, 1, 1, 1, 1, 1,
0.4044253, -0.6843469, 3.291514, 1, 1, 1, 1, 1,
0.4053621, -1.264955, 2.1785, 1, 1, 1, 1, 1,
0.4086337, -1.192769, 2.70185, 0, 0, 1, 1, 1,
0.4104528, 0.08685873, 3.763773, 1, 0, 0, 1, 1,
0.4119323, -1.143839, 3.180278, 1, 0, 0, 1, 1,
0.4150367, 0.9621006, 1.544616, 1, 0, 0, 1, 1,
0.4208389, 0.3530692, 0.04933513, 1, 0, 0, 1, 1,
0.4210605, -0.04012232, 2.193135, 1, 0, 0, 1, 1,
0.421112, 0.1152943, 0.6398034, 0, 0, 0, 1, 1,
0.425054, -0.0974894, 1.176771, 0, 0, 0, 1, 1,
0.4296146, -0.4940898, 2.728022, 0, 0, 0, 1, 1,
0.439848, -1.59922, 3.198959, 0, 0, 0, 1, 1,
0.4405887, 0.6342808, 0.7766239, 0, 0, 0, 1, 1,
0.4431991, 2.693114, -0.1097507, 0, 0, 0, 1, 1,
0.452462, -1.197568, 4.530969, 0, 0, 0, 1, 1,
0.454989, -0.173165, 2.566241, 1, 1, 1, 1, 1,
0.4581005, -1.458917, 2.630982, 1, 1, 1, 1, 1,
0.4583235, 0.6408803, 0.3694869, 1, 1, 1, 1, 1,
0.4642695, 0.7417932, 0.8158285, 1, 1, 1, 1, 1,
0.4650808, -1.144229, 2.99648, 1, 1, 1, 1, 1,
0.4655096, -1.093522, 3.25279, 1, 1, 1, 1, 1,
0.4737755, 0.4302745, 0.6926515, 1, 1, 1, 1, 1,
0.4762868, 1.343773, -0.8170412, 1, 1, 1, 1, 1,
0.481021, -0.7808133, 1.998705, 1, 1, 1, 1, 1,
0.4857385, -1.043864, 3.721545, 1, 1, 1, 1, 1,
0.4890995, 0.09487907, 2.077719, 1, 1, 1, 1, 1,
0.4956108, -1.141947, 3.674433, 1, 1, 1, 1, 1,
0.4961919, 0.3153168, 0.2028141, 1, 1, 1, 1, 1,
0.4980415, 0.3210951, -1.311897, 1, 1, 1, 1, 1,
0.5035612, 0.5322448, 0.8497059, 1, 1, 1, 1, 1,
0.5040896, -0.2177929, 2.3863, 0, 0, 1, 1, 1,
0.5046666, -0.4010836, 1.989607, 1, 0, 0, 1, 1,
0.5063516, -0.6046306, 3.115838, 1, 0, 0, 1, 1,
0.5068432, -0.2330191, 1.513173, 1, 0, 0, 1, 1,
0.5080261, -0.7968187, 2.696121, 1, 0, 0, 1, 1,
0.5132644, 1.004209, 0.4331149, 1, 0, 0, 1, 1,
0.5168231, 0.09844458, 0.7140272, 0, 0, 0, 1, 1,
0.518573, -0.08684182, 0.4001885, 0, 0, 0, 1, 1,
0.5192291, 0.6783176, 0.09758934, 0, 0, 0, 1, 1,
0.5209997, -1.092105, 1.806094, 0, 0, 0, 1, 1,
0.5303507, 0.745164, 0.02340325, 0, 0, 0, 1, 1,
0.530401, 0.06889849, 0.04888364, 0, 0, 0, 1, 1,
0.530986, -0.7217419, 2.936585, 0, 0, 0, 1, 1,
0.5340276, 0.2857174, 0.9954529, 1, 1, 1, 1, 1,
0.5343824, -1.293131, 3.495428, 1, 1, 1, 1, 1,
0.5363474, -0.2474431, 1.488211, 1, 1, 1, 1, 1,
0.5398329, -1.000329, 1.945362, 1, 1, 1, 1, 1,
0.5428467, -2.501958, 1.331818, 1, 1, 1, 1, 1,
0.5433226, -0.02830701, 1.475742, 1, 1, 1, 1, 1,
0.5443942, 0.6017566, 0.8216996, 1, 1, 1, 1, 1,
0.5498645, 0.4777989, 1.05968, 1, 1, 1, 1, 1,
0.5531087, 0.07431936, 1.85113, 1, 1, 1, 1, 1,
0.5534141, -0.1992579, 1.734083, 1, 1, 1, 1, 1,
0.5584394, -0.3397112, 2.487428, 1, 1, 1, 1, 1,
0.5599918, 0.5533802, 0.6565406, 1, 1, 1, 1, 1,
0.5646406, 0.273793, -0.5284311, 1, 1, 1, 1, 1,
0.5671355, -0.7338879, 1.10279, 1, 1, 1, 1, 1,
0.5733086, 0.5904604, 1.334382, 1, 1, 1, 1, 1,
0.5758759, -0.2978357, 0.7013111, 0, 0, 1, 1, 1,
0.5766804, -1.268841, 4.705832, 1, 0, 0, 1, 1,
0.5775944, 0.6017966, 1.261852, 1, 0, 0, 1, 1,
0.5797467, -0.4269156, 3.184673, 1, 0, 0, 1, 1,
0.5805784, 0.01000724, 1.505793, 1, 0, 0, 1, 1,
0.5880868, 0.03210724, 0.8314078, 1, 0, 0, 1, 1,
0.5882146, -1.168336, 4.22949, 0, 0, 0, 1, 1,
0.5897976, 0.8250592, 0.832068, 0, 0, 0, 1, 1,
0.5926535, 0.5107352, 1.186034, 0, 0, 0, 1, 1,
0.5999129, 0.2287958, 1.549522, 0, 0, 0, 1, 1,
0.6001471, 0.3150347, 1.517252, 0, 0, 0, 1, 1,
0.602161, -0.1003999, 2.761715, 0, 0, 0, 1, 1,
0.6115993, -0.2853568, 2.151089, 0, 0, 0, 1, 1,
0.6117746, 0.3593332, -1.162943, 1, 1, 1, 1, 1,
0.6150141, -1.895362, 3.204936, 1, 1, 1, 1, 1,
0.619314, 1.151751, 1.995402, 1, 1, 1, 1, 1,
0.6214509, 0.5020558, 1.140791, 1, 1, 1, 1, 1,
0.6274836, -0.3648564, 2.203415, 1, 1, 1, 1, 1,
0.6275147, 0.2864283, 0.1601501, 1, 1, 1, 1, 1,
0.6295857, -0.7259818, 2.588214, 1, 1, 1, 1, 1,
0.6314883, -0.3677528, 2.521256, 1, 1, 1, 1, 1,
0.6337941, 0.1496304, 1.192403, 1, 1, 1, 1, 1,
0.6388948, -0.08907587, 2.154661, 1, 1, 1, 1, 1,
0.6406148, 1.580981, -0.2139702, 1, 1, 1, 1, 1,
0.640774, -0.05412812, 2.105011, 1, 1, 1, 1, 1,
0.6419175, 1.295453, 1.349327, 1, 1, 1, 1, 1,
0.6531785, -0.8674101, 3.079307, 1, 1, 1, 1, 1,
0.6539494, -0.3436273, 2.265352, 1, 1, 1, 1, 1,
0.6581716, -2.072226, 3.746325, 0, 0, 1, 1, 1,
0.6591378, -0.1852932, 2.650043, 1, 0, 0, 1, 1,
0.6603161, -1.084137, 3.222807, 1, 0, 0, 1, 1,
0.6610565, 0.8366354, 2.724545, 1, 0, 0, 1, 1,
0.6613339, 0.9733897, -1.271896, 1, 0, 0, 1, 1,
0.6661447, 0.2852869, 0.2668179, 1, 0, 0, 1, 1,
0.6690916, -2.417608, 2.298794, 0, 0, 0, 1, 1,
0.6867095, 1.935642, 0.1915698, 0, 0, 0, 1, 1,
0.6888664, 0.8580157, -0.3441958, 0, 0, 0, 1, 1,
0.6928296, -1.166512, 2.293271, 0, 0, 0, 1, 1,
0.7012818, -0.2774134, 0.8850297, 0, 0, 0, 1, 1,
0.7063243, -0.4291221, 2.703056, 0, 0, 0, 1, 1,
0.7104066, 0.04602426, 1.948139, 0, 0, 0, 1, 1,
0.711404, -0.7922899, 1.946786, 1, 1, 1, 1, 1,
0.7117624, 1.59729, -0.1955659, 1, 1, 1, 1, 1,
0.7143039, 1.46286, -0.6721365, 1, 1, 1, 1, 1,
0.7195467, -0.06081057, 0.08975655, 1, 1, 1, 1, 1,
0.7209898, 1.255942, -0.2164939, 1, 1, 1, 1, 1,
0.7212929, 0.1625817, 0.9795405, 1, 1, 1, 1, 1,
0.7230259, 2.956393, 1.006439, 1, 1, 1, 1, 1,
0.7305745, -0.9101399, 1.897766, 1, 1, 1, 1, 1,
0.7316985, -1.034459, 1.186472, 1, 1, 1, 1, 1,
0.7319984, -0.03657525, 1.377867, 1, 1, 1, 1, 1,
0.7400501, 0.2828556, 0.2383999, 1, 1, 1, 1, 1,
0.740898, 0.7482214, 1.272234, 1, 1, 1, 1, 1,
0.7423077, -0.5418411, 2.172891, 1, 1, 1, 1, 1,
0.7427638, 1.11622, 2.671509, 1, 1, 1, 1, 1,
0.7472794, 0.273549, 1.739643, 1, 1, 1, 1, 1,
0.7559376, 0.6996259, 1.527653, 0, 0, 1, 1, 1,
0.7656227, -0.3711314, 2.651723, 1, 0, 0, 1, 1,
0.7694243, 0.2489786, 1.543894, 1, 0, 0, 1, 1,
0.7697698, 0.6493621, 0.308905, 1, 0, 0, 1, 1,
0.7817687, 1.095491, 0.9538869, 1, 0, 0, 1, 1,
0.787598, 1.391057, 0.0344492, 1, 0, 0, 1, 1,
0.7919348, 1.710029, 1.345375, 0, 0, 0, 1, 1,
0.7931103, -0.3761269, 2.253088, 0, 0, 0, 1, 1,
0.8050063, 0.4661459, -0.0395473, 0, 0, 0, 1, 1,
0.8063658, -0.2477926, 0.05312546, 0, 0, 0, 1, 1,
0.8084672, 0.7206856, 2.190723, 0, 0, 0, 1, 1,
0.8144206, 0.5553872, 1.039386, 0, 0, 0, 1, 1,
0.8152511, -0.7756243, 2.288079, 0, 0, 0, 1, 1,
0.819406, -1.170685, 0.9213065, 1, 1, 1, 1, 1,
0.820074, 1.912045, 1.214157, 1, 1, 1, 1, 1,
0.8249155, 0.2588243, 2.437236, 1, 1, 1, 1, 1,
0.8258901, 0.5878345, -0.1914289, 1, 1, 1, 1, 1,
0.8270966, 1.157588, 1.825069, 1, 1, 1, 1, 1,
0.8290898, -1.17133, 2.274158, 1, 1, 1, 1, 1,
0.8301927, -0.7946672, 2.830544, 1, 1, 1, 1, 1,
0.834533, 0.5616709, 0.5663062, 1, 1, 1, 1, 1,
0.8370037, 0.8992555, 1.164754, 1, 1, 1, 1, 1,
0.8399406, -0.9058984, 2.261774, 1, 1, 1, 1, 1,
0.8483442, -1.346383, 3.567445, 1, 1, 1, 1, 1,
0.8683825, -2.325558, 2.250916, 1, 1, 1, 1, 1,
0.873003, 0.1531952, 2.114701, 1, 1, 1, 1, 1,
0.8763078, 0.2737893, 0.3145903, 1, 1, 1, 1, 1,
0.8793231, 1.249263, 1.708565, 1, 1, 1, 1, 1,
0.8795257, -0.6725153, 1.872205, 0, 0, 1, 1, 1,
0.8869277, -0.2587782, 1.100602, 1, 0, 0, 1, 1,
0.8915091, -0.4413121, 3.116475, 1, 0, 0, 1, 1,
0.8996018, -0.8907878, 1.470929, 1, 0, 0, 1, 1,
0.9120474, 2.387927, -0.3851298, 1, 0, 0, 1, 1,
0.918072, 1.130388, 0.9653637, 1, 0, 0, 1, 1,
0.9198682, -0.1182123, 2.898661, 0, 0, 0, 1, 1,
0.9264097, -1.647639, 2.695078, 0, 0, 0, 1, 1,
0.9269897, 0.2452077, 0.6922552, 0, 0, 0, 1, 1,
0.927875, 0.4360611, 0.5708028, 0, 0, 0, 1, 1,
0.9293684, 0.5991981, 1.459425, 0, 0, 0, 1, 1,
0.9304798, 0.185397, 2.119953, 0, 0, 0, 1, 1,
0.9308599, -1.543046, 1.629702, 0, 0, 0, 1, 1,
0.9372346, 1.621046, 1.965819, 1, 1, 1, 1, 1,
0.9433731, 1.341468, 0.6908883, 1, 1, 1, 1, 1,
0.9585215, 1.402, 1.136248, 1, 1, 1, 1, 1,
0.9655563, 1.864648, 1.669886, 1, 1, 1, 1, 1,
0.9687511, -0.938302, 2.485376, 1, 1, 1, 1, 1,
0.9698502, 1.078008, 1.163369, 1, 1, 1, 1, 1,
0.9721372, -0.614748, 0.7846614, 1, 1, 1, 1, 1,
0.9762582, 0.6427212, 1.490934, 1, 1, 1, 1, 1,
0.9822246, 2.830836, 1.215205, 1, 1, 1, 1, 1,
0.9824696, 0.2821825, -0.3693925, 1, 1, 1, 1, 1,
0.9867733, 0.0841084, 0.913298, 1, 1, 1, 1, 1,
0.9880979, 0.9143012, 1.095826, 1, 1, 1, 1, 1,
0.9912991, 1.299829, 1.124486, 1, 1, 1, 1, 1,
0.9916136, 1.038178, -0.3693151, 1, 1, 1, 1, 1,
0.9930297, -0.3164096, 1.795889, 1, 1, 1, 1, 1,
0.9932796, -0.1050911, 1.259829, 0, 0, 1, 1, 1,
0.99441, -1.07946, 3.31906, 1, 0, 0, 1, 1,
0.9981114, -0.01338563, 2.058254, 1, 0, 0, 1, 1,
1.001673, 0.3802826, 1.873041, 1, 0, 0, 1, 1,
1.003081, 0.4484255, -0.0764543, 1, 0, 0, 1, 1,
1.010705, 0.1920752, 1.003067, 1, 0, 0, 1, 1,
1.020542, -0.3007403, 2.281527, 0, 0, 0, 1, 1,
1.021824, 0.9399171, 1.235951, 0, 0, 0, 1, 1,
1.022739, -0.9076824, 2.617414, 0, 0, 0, 1, 1,
1.032439, -2.324232, 3.818477, 0, 0, 0, 1, 1,
1.036876, 2.147365, 1.943624, 0, 0, 0, 1, 1,
1.036941, -0.2304529, 1.299012, 0, 0, 0, 1, 1,
1.039776, -0.3350252, 3.505252, 0, 0, 0, 1, 1,
1.051308, -1.610057, 1.443183, 1, 1, 1, 1, 1,
1.056289, 0.994608, 2.13311, 1, 1, 1, 1, 1,
1.063657, -1.076903, 1.734669, 1, 1, 1, 1, 1,
1.066694, -0.3580466, 2.66444, 1, 1, 1, 1, 1,
1.07928, 1.043784, 0.1940364, 1, 1, 1, 1, 1,
1.084154, 1.611855, -1.734837, 1, 1, 1, 1, 1,
1.095599, -1.458503, 2.922172, 1, 1, 1, 1, 1,
1.099613, -0.7906958, 1.57708, 1, 1, 1, 1, 1,
1.103553, 1.099016, -0.2272906, 1, 1, 1, 1, 1,
1.106923, -0.472776, 2.063422, 1, 1, 1, 1, 1,
1.108238, -2.368384, 1.689792, 1, 1, 1, 1, 1,
1.108637, 0.72802, 1.089137, 1, 1, 1, 1, 1,
1.114755, -0.2672996, 1.628585, 1, 1, 1, 1, 1,
1.119602, 0.1036063, 0.7379235, 1, 1, 1, 1, 1,
1.123546, -0.7475148, 1.915008, 1, 1, 1, 1, 1,
1.125732, 0.417305, 1.296822, 0, 0, 1, 1, 1,
1.145727, 0.9215959, 0.6566225, 1, 0, 0, 1, 1,
1.149927, -0.1672675, 0.4130463, 1, 0, 0, 1, 1,
1.15534, -1.730044, 1.46503, 1, 0, 0, 1, 1,
1.157981, -0.7641661, 3.054378, 1, 0, 0, 1, 1,
1.16252, 0.4434925, 0.6259364, 1, 0, 0, 1, 1,
1.164475, 0.5550933, 0.2611124, 0, 0, 0, 1, 1,
1.175753, 0.6573475, 1.065041, 0, 0, 0, 1, 1,
1.176736, -1.639501, 1.366965, 0, 0, 0, 1, 1,
1.179383, -0.2034106, 1.171661, 0, 0, 0, 1, 1,
1.183162, -0.1797333, 2.604093, 0, 0, 0, 1, 1,
1.184167, -0.1974458, 2.978914, 0, 0, 0, 1, 1,
1.185049, 1.091963, -1.135753, 0, 0, 0, 1, 1,
1.185915, 0.9839825, 1.674068, 1, 1, 1, 1, 1,
1.189387, -0.07658314, 1.822079, 1, 1, 1, 1, 1,
1.190185, 1.520658, 1.505975, 1, 1, 1, 1, 1,
1.19649, 1.186868, 1.380215, 1, 1, 1, 1, 1,
1.200432, 1.188245, 0.6958765, 1, 1, 1, 1, 1,
1.202767, 0.2311935, 0.780444, 1, 1, 1, 1, 1,
1.205549, -1.023371, 1.831784, 1, 1, 1, 1, 1,
1.205638, -1.029941, 1.685309, 1, 1, 1, 1, 1,
1.209662, -0.1108824, 0.354768, 1, 1, 1, 1, 1,
1.211209, -0.3446356, 1.668967, 1, 1, 1, 1, 1,
1.221782, -0.9362071, 3.285255, 1, 1, 1, 1, 1,
1.223909, -0.9323047, 2.355394, 1, 1, 1, 1, 1,
1.226725, -0.9061031, 1.242809, 1, 1, 1, 1, 1,
1.235822, 0.4549, 2.138459, 1, 1, 1, 1, 1,
1.23703, 0.8998308, 0.6518987, 1, 1, 1, 1, 1,
1.240861, -1.042755, 3.00181, 0, 0, 1, 1, 1,
1.240942, -0.5255531, 0.1950338, 1, 0, 0, 1, 1,
1.241854, 1.567543, 1.334638, 1, 0, 0, 1, 1,
1.248527, -0.48932, 2.157508, 1, 0, 0, 1, 1,
1.252003, -0.009971907, 3.114229, 1, 0, 0, 1, 1,
1.271078, -1.377629, 2.797622, 1, 0, 0, 1, 1,
1.272875, 0.2363082, 1.963891, 0, 0, 0, 1, 1,
1.281744, 0.2412014, 1.684081, 0, 0, 0, 1, 1,
1.287008, 0.03933698, 3.060554, 0, 0, 0, 1, 1,
1.301662, 2.750357, -0.2235855, 0, 0, 0, 1, 1,
1.312193, 0.7055743, 0.57708, 0, 0, 0, 1, 1,
1.313684, 0.1114674, 1.166932, 0, 0, 0, 1, 1,
1.319548, 0.8188441, 0.2658221, 0, 0, 0, 1, 1,
1.329253, -0.4276235, 1.125358, 1, 1, 1, 1, 1,
1.345708, -0.09093659, 2.132089, 1, 1, 1, 1, 1,
1.350806, -0.7114952, 0.90642, 1, 1, 1, 1, 1,
1.354763, -0.5951257, 2.785043, 1, 1, 1, 1, 1,
1.356243, 1.513911, -1.19169, 1, 1, 1, 1, 1,
1.361806, -0.2590921, 1.909639, 1, 1, 1, 1, 1,
1.365958, 0.4633447, 1.224057, 1, 1, 1, 1, 1,
1.371748, 0.4311028, 0.7945446, 1, 1, 1, 1, 1,
1.382743, -0.8397515, 3.057135, 1, 1, 1, 1, 1,
1.38327, 1.242178, 0.264188, 1, 1, 1, 1, 1,
1.390513, -1.514387, 1.964686, 1, 1, 1, 1, 1,
1.397049, -1.532861, 3.269267, 1, 1, 1, 1, 1,
1.398349, 0.6546069, 1.041279, 1, 1, 1, 1, 1,
1.415532, -0.5548398, 2.686182, 1, 1, 1, 1, 1,
1.417277, -1.96157, 2.787346, 1, 1, 1, 1, 1,
1.421158, 0.3402357, -0.6530821, 0, 0, 1, 1, 1,
1.424126, 2.984792, -0.1937972, 1, 0, 0, 1, 1,
1.426858, -0.6531987, 5.4036, 1, 0, 0, 1, 1,
1.430262, 1.828755, -0.4216895, 1, 0, 0, 1, 1,
1.433608, -0.2252399, 2.071164, 1, 0, 0, 1, 1,
1.442558, -0.3932464, 0.7822378, 1, 0, 0, 1, 1,
1.448897, -0.02657579, -0.2798991, 0, 0, 0, 1, 1,
1.456463, -0.3591371, 1.90446, 0, 0, 0, 1, 1,
1.461842, 1.332277, 1.576613, 0, 0, 0, 1, 1,
1.465346, 1.063211, 0.6448627, 0, 0, 0, 1, 1,
1.466928, -1.538455, 2.051837, 0, 0, 0, 1, 1,
1.470126, -0.214438, 3.400403, 0, 0, 0, 1, 1,
1.484344, -0.5320209, 3.106841, 0, 0, 0, 1, 1,
1.485769, 0.777276, 1.754356, 1, 1, 1, 1, 1,
1.488021, -1.185939, 1.451813, 1, 1, 1, 1, 1,
1.503598, -0.1930496, 1.849314, 1, 1, 1, 1, 1,
1.506384, -0.3529, 1.813855, 1, 1, 1, 1, 1,
1.512739, -1.013378, 3.332065, 1, 1, 1, 1, 1,
1.517153, -0.1172695, 1.283929, 1, 1, 1, 1, 1,
1.526563, -0.27, 1.234493, 1, 1, 1, 1, 1,
1.536108, -1.072915, 2.650629, 1, 1, 1, 1, 1,
1.572928, -0.511315, 0.8679436, 1, 1, 1, 1, 1,
1.580983, 0.4564192, 0.5471401, 1, 1, 1, 1, 1,
1.603116, -0.00521247, 0.02328587, 1, 1, 1, 1, 1,
1.617241, -0.9556255, -0.2955469, 1, 1, 1, 1, 1,
1.632236, 0.3012609, 2.054278, 1, 1, 1, 1, 1,
1.637223, -1.223898, 1.255526, 1, 1, 1, 1, 1,
1.637259, 0.6361037, 1.559924, 1, 1, 1, 1, 1,
1.648772, 1.569933, 0.6481034, 0, 0, 1, 1, 1,
1.650874, 0.4025027, 1.442193, 1, 0, 0, 1, 1,
1.652766, -0.9617092, 1.210482, 1, 0, 0, 1, 1,
1.674918, 0.02526649, 1.001744, 1, 0, 0, 1, 1,
1.69819, -0.1642861, 2.58876, 1, 0, 0, 1, 1,
1.710371, -0.5911937, 1.563473, 1, 0, 0, 1, 1,
1.731825, -0.2865283, 1.371297, 0, 0, 0, 1, 1,
1.741693, -0.4315017, 1.322477, 0, 0, 0, 1, 1,
1.751964, -1.617296, 0.8247039, 0, 0, 0, 1, 1,
1.758029, 0.1536042, 1.714056, 0, 0, 0, 1, 1,
1.763674, -0.1266171, 1.292673, 0, 0, 0, 1, 1,
1.765172, 1.360385, 0.8286467, 0, 0, 0, 1, 1,
1.823272, -0.2054358, 1.355753, 0, 0, 0, 1, 1,
1.826527, -1.114359, 1.676008, 1, 1, 1, 1, 1,
1.833268, 0.6191664, 1.205282, 1, 1, 1, 1, 1,
1.874771, 1.380118, 1.383756, 1, 1, 1, 1, 1,
1.885117, 0.3991028, 1.340244, 1, 1, 1, 1, 1,
1.907229, 1.107741, 0.6852398, 1, 1, 1, 1, 1,
1.916489, 0.07357397, -0.3814035, 1, 1, 1, 1, 1,
1.923423, -0.7706373, 0.9308228, 1, 1, 1, 1, 1,
1.924205, 0.8259049, 1.623698, 1, 1, 1, 1, 1,
1.942464, 0.3492724, 2.258463, 1, 1, 1, 1, 1,
1.943096, 0.1605218, 3.617491, 1, 1, 1, 1, 1,
1.988015, 0.5179964, 0.7229801, 1, 1, 1, 1, 1,
1.993001, -0.7673917, 2.523833, 1, 1, 1, 1, 1,
2.002959, 1.17904, -1.13835, 1, 1, 1, 1, 1,
2.050817, -0.8411587, 0.7509249, 1, 1, 1, 1, 1,
2.065974, 0.5954248, 0.4515858, 1, 1, 1, 1, 1,
2.090135, 0.9620493, 4.247252, 0, 0, 1, 1, 1,
2.19816, 1.043796, 1.669469, 1, 0, 0, 1, 1,
2.218482, -0.8561863, 2.551167, 1, 0, 0, 1, 1,
2.220983, -1.518155, 2.53835, 1, 0, 0, 1, 1,
2.222001, -0.5812567, 0.9589803, 1, 0, 0, 1, 1,
2.234984, -0.3429979, 1.801972, 1, 0, 0, 1, 1,
2.296953, -1.547921, 2.848495, 0, 0, 0, 1, 1,
2.32097, -0.9466903, 1.285569, 0, 0, 0, 1, 1,
2.351546, 0.2351511, 0.03696142, 0, 0, 0, 1, 1,
2.359652, 0.249909, 2.176041, 0, 0, 0, 1, 1,
2.37399, -0.8728611, 2.519313, 0, 0, 0, 1, 1,
2.493113, -0.2632803, 2.008008, 0, 0, 0, 1, 1,
2.499794, 0.9200792, 2.461681, 0, 0, 0, 1, 1,
2.501578, -0.4459857, 2.545953, 1, 1, 1, 1, 1,
2.56859, -0.588212, 3.950598, 1, 1, 1, 1, 1,
2.66423, 0.5059793, 1.841955, 1, 1, 1, 1, 1,
2.795632, 1.650836, 1.612041, 1, 1, 1, 1, 1,
2.995699, -0.8075929, 1.224161, 1, 1, 1, 1, 1,
3.036058, 1.104676, 0.8146753, 1, 1, 1, 1, 1,
3.063805, 0.339718, 0.1130935, 1, 1, 1, 1, 1
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
var radius = 9.761127;
var distance = 34.28555;
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
mvMatrix.translate( 0.3735228, 0.0827899, 0.08697295 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.28555);
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
