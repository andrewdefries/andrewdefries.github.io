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
-3.046773, 0.8640466, -1.789264, 1, 0, 0, 1,
-2.439419, 0.5612466, -1.796879, 1, 0.007843138, 0, 1,
-2.420379, 1.233776, -0.8363043, 1, 0.01176471, 0, 1,
-2.36981, 0.1122669, -2.136828, 1, 0.01960784, 0, 1,
-2.318374, 0.6184552, -0.5460017, 1, 0.02352941, 0, 1,
-2.29409, -0.6543545, -1.69394, 1, 0.03137255, 0, 1,
-2.287324, 1.25436, -0.6888842, 1, 0.03529412, 0, 1,
-2.210675, -0.3244283, -1.144672, 1, 0.04313726, 0, 1,
-2.158902, 1.584844, -2.358385, 1, 0.04705882, 0, 1,
-2.115493, 0.07461839, -1.320087, 1, 0.05490196, 0, 1,
-2.108449, -0.01104394, -1.264596, 1, 0.05882353, 0, 1,
-2.101624, 0.8960553, -1.628189, 1, 0.06666667, 0, 1,
-2.101137, -2.110734, -2.761379, 1, 0.07058824, 0, 1,
-2.06112, 0.6219587, -0.4739145, 1, 0.07843138, 0, 1,
-1.961587, -0.6560015, -0.5154221, 1, 0.08235294, 0, 1,
-1.960717, 1.310555, -1.124791, 1, 0.09019608, 0, 1,
-1.943771, -0.3866785, -0.8858105, 1, 0.09411765, 0, 1,
-1.943751, -0.6604606, -2.421519, 1, 0.1019608, 0, 1,
-1.94242, 1.554726, -0.04754906, 1, 0.1098039, 0, 1,
-1.937919, 0.1003426, -0.7644765, 1, 0.1137255, 0, 1,
-1.91789, -0.3847563, -1.574314, 1, 0.1215686, 0, 1,
-1.901694, -0.8111567, -2.007478, 1, 0.1254902, 0, 1,
-1.851565, -0.3415978, -0.6096197, 1, 0.1333333, 0, 1,
-1.825575, -0.142354, -2.10244, 1, 0.1372549, 0, 1,
-1.808079, 0.8920787, -1.175717, 1, 0.145098, 0, 1,
-1.775818, -0.07353348, -0.1258448, 1, 0.1490196, 0, 1,
-1.768451, -0.4888435, -0.8972823, 1, 0.1568628, 0, 1,
-1.763474, 0.3645622, -0.3741465, 1, 0.1607843, 0, 1,
-1.759944, -0.2895827, -1.379368, 1, 0.1686275, 0, 1,
-1.754611, -0.8135278, -0.9219726, 1, 0.172549, 0, 1,
-1.747668, -0.5543256, -2.565925, 1, 0.1803922, 0, 1,
-1.745645, -0.8008537, -1.399756, 1, 0.1843137, 0, 1,
-1.728402, 0.004090263, -2.306341, 1, 0.1921569, 0, 1,
-1.714468, -0.1795344, -1.65493, 1, 0.1960784, 0, 1,
-1.709296, -0.6859496, -2.692387, 1, 0.2039216, 0, 1,
-1.69112, 0.3020355, -2.384892, 1, 0.2117647, 0, 1,
-1.684885, -0.5098822, -2.547873, 1, 0.2156863, 0, 1,
-1.678327, 0.2592271, -1.408341, 1, 0.2235294, 0, 1,
-1.674002, -1.424337, -1.62953, 1, 0.227451, 0, 1,
-1.661469, 0.8413778, 0.6050512, 1, 0.2352941, 0, 1,
-1.654946, 1.019564, -1.757406, 1, 0.2392157, 0, 1,
-1.648886, 0.05681892, -0.4615865, 1, 0.2470588, 0, 1,
-1.647806, -0.3393377, -1.87993, 1, 0.2509804, 0, 1,
-1.647684, 0.594502, -2.197095, 1, 0.2588235, 0, 1,
-1.640543, -1.239334, -1.189596, 1, 0.2627451, 0, 1,
-1.632529, -0.6994434, -0.7704383, 1, 0.2705882, 0, 1,
-1.614964, -0.5155788, -0.6884977, 1, 0.2745098, 0, 1,
-1.599996, -0.9580353, -2.760511, 1, 0.282353, 0, 1,
-1.591618, -0.4497958, -1.383889, 1, 0.2862745, 0, 1,
-1.549674, -2.873786, -2.883919, 1, 0.2941177, 0, 1,
-1.541339, 0.8014168, -2.182777, 1, 0.3019608, 0, 1,
-1.522294, 1.67424, -2.943326, 1, 0.3058824, 0, 1,
-1.479892, -0.6743097, -3.326381, 1, 0.3137255, 0, 1,
-1.479305, -2.722114, -1.772562, 1, 0.3176471, 0, 1,
-1.476846, -1.283462, -3.440859, 1, 0.3254902, 0, 1,
-1.476529, 0.4599662, -1.461483, 1, 0.3294118, 0, 1,
-1.46381, 0.7469117, -1.680237, 1, 0.3372549, 0, 1,
-1.448004, -0.4913807, -2.498674, 1, 0.3411765, 0, 1,
-1.447929, -0.9546172, -1.338783, 1, 0.3490196, 0, 1,
-1.446889, -0.910002, -1.161275, 1, 0.3529412, 0, 1,
-1.437739, 0.7765714, -0.203067, 1, 0.3607843, 0, 1,
-1.434212, -2.410828, -1.978675, 1, 0.3647059, 0, 1,
-1.434165, 0.8428577, -0.4732176, 1, 0.372549, 0, 1,
-1.408823, 1.07064, -0.5702209, 1, 0.3764706, 0, 1,
-1.40156, 0.1935469, -0.9413931, 1, 0.3843137, 0, 1,
-1.387995, -0.03953442, -0.6983876, 1, 0.3882353, 0, 1,
-1.38306, 0.01056872, -0.2887009, 1, 0.3960784, 0, 1,
-1.376948, 0.4906361, -3.233007, 1, 0.4039216, 0, 1,
-1.37694, -0.8259924, -4.869796, 1, 0.4078431, 0, 1,
-1.375563, 0.7367797, -1.513333, 1, 0.4156863, 0, 1,
-1.369623, 0.1799738, -0.3743162, 1, 0.4196078, 0, 1,
-1.363041, -0.1773309, 0.3550152, 1, 0.427451, 0, 1,
-1.360021, 2.238743, 0.853548, 1, 0.4313726, 0, 1,
-1.347915, -0.5484191, -1.78792, 1, 0.4392157, 0, 1,
-1.345034, 1.299668, -1.440659, 1, 0.4431373, 0, 1,
-1.340074, 0.0542232, -0.2624474, 1, 0.4509804, 0, 1,
-1.336392, -0.9137251, -1.932864, 1, 0.454902, 0, 1,
-1.323151, -0.4442747, -3.240355, 1, 0.4627451, 0, 1,
-1.316762, -1.030244, -1.273091, 1, 0.4666667, 0, 1,
-1.310505, 0.3704721, -2.010869, 1, 0.4745098, 0, 1,
-1.310239, 0.3880793, -1.903749, 1, 0.4784314, 0, 1,
-1.302532, 0.5611079, -0.9195367, 1, 0.4862745, 0, 1,
-1.298328, 0.08398479, -2.91034, 1, 0.4901961, 0, 1,
-1.295406, 0.6616734, -2.590351, 1, 0.4980392, 0, 1,
-1.295027, 0.328627, -0.05015656, 1, 0.5058824, 0, 1,
-1.292125, 1.97384, -0.4815367, 1, 0.509804, 0, 1,
-1.283978, -0.1365659, -3.151042, 1, 0.5176471, 0, 1,
-1.28131, -1.935773, -2.922503, 1, 0.5215687, 0, 1,
-1.281217, -0.4017448, -3.011771, 1, 0.5294118, 0, 1,
-1.278279, 1.428003, -1.845135, 1, 0.5333334, 0, 1,
-1.277503, 0.2369217, -1.208416, 1, 0.5411765, 0, 1,
-1.273139, 0.1570522, -2.047853, 1, 0.5450981, 0, 1,
-1.27049, -0.6966171, -2.996521, 1, 0.5529412, 0, 1,
-1.253148, -0.3295216, -3.331216, 1, 0.5568628, 0, 1,
-1.25154, 0.6916769, -0.3377769, 1, 0.5647059, 0, 1,
-1.244158, -0.4915951, -3.19663, 1, 0.5686275, 0, 1,
-1.242694, -0.07271861, -1.880384, 1, 0.5764706, 0, 1,
-1.21886, -1.89682, -3.021495, 1, 0.5803922, 0, 1,
-1.215306, 0.474741, -1.922547, 1, 0.5882353, 0, 1,
-1.210265, 0.7677296, 0.9062904, 1, 0.5921569, 0, 1,
-1.206158, 0.9761481, 0.5365813, 1, 0.6, 0, 1,
-1.204977, -2.152075, -2.886482, 1, 0.6078432, 0, 1,
-1.187447, 0.7272006, -1.233107, 1, 0.6117647, 0, 1,
-1.183538, 0.4147276, -0.2163948, 1, 0.6196079, 0, 1,
-1.175609, 1.515738, -2.048625, 1, 0.6235294, 0, 1,
-1.172938, -0.7283234, -0.8932409, 1, 0.6313726, 0, 1,
-1.172904, -0.1090586, -0.1597085, 1, 0.6352941, 0, 1,
-1.165676, 2.435644, -0.9175314, 1, 0.6431373, 0, 1,
-1.160228, -1.041538, -2.36586, 1, 0.6470588, 0, 1,
-1.158969, 0.112781, -1.253617, 1, 0.654902, 0, 1,
-1.146691, 1.307027, -0.4008474, 1, 0.6588235, 0, 1,
-1.146556, -1.83922, -2.274856, 1, 0.6666667, 0, 1,
-1.146272, -0.1103049, -1.003379, 1, 0.6705883, 0, 1,
-1.131772, 0.1830728, -1.331006, 1, 0.6784314, 0, 1,
-1.107667, -0.7175161, -2.082037, 1, 0.682353, 0, 1,
-1.105562, 0.6057995, -0.6238239, 1, 0.6901961, 0, 1,
-1.103852, -0.1364446, -1.424254, 1, 0.6941177, 0, 1,
-1.103264, -0.2747653, -0.5568038, 1, 0.7019608, 0, 1,
-1.102297, -1.1144, -1.266562, 1, 0.7098039, 0, 1,
-1.101991, -0.515775, -1.431418, 1, 0.7137255, 0, 1,
-1.08947, -1.506616, -3.429195, 1, 0.7215686, 0, 1,
-1.085237, 0.1694991, -4.677105, 1, 0.7254902, 0, 1,
-1.081688, -1.419154, -3.091547, 1, 0.7333333, 0, 1,
-1.081361, 1.037602, -1.056107, 1, 0.7372549, 0, 1,
-1.079247, -0.6067957, -0.6279042, 1, 0.7450981, 0, 1,
-1.079243, 0.2017356, -1.242177, 1, 0.7490196, 0, 1,
-1.078518, -1.125262, -3.132099, 1, 0.7568628, 0, 1,
-1.074088, -0.6923414, -3.320335, 1, 0.7607843, 0, 1,
-1.049364, 1.158368, 0.0921169, 1, 0.7686275, 0, 1,
-1.048055, 1.051342, 1.376907, 1, 0.772549, 0, 1,
-1.039508, 0.445892, 0.190434, 1, 0.7803922, 0, 1,
-1.029899, -0.5891306, -2.870681, 1, 0.7843137, 0, 1,
-1.0239, -0.226796, -0.9889125, 1, 0.7921569, 0, 1,
-1.016302, -0.0943233, -2.036515, 1, 0.7960784, 0, 1,
-1.015443, 0.7583995, -2.071693, 1, 0.8039216, 0, 1,
-1.008145, -1.602265, -4.154285, 1, 0.8117647, 0, 1,
-1.005033, -0.8908249, -2.190727, 1, 0.8156863, 0, 1,
-0.9858023, 0.03107378, -1.730164, 1, 0.8235294, 0, 1,
-0.9854382, -0.8521951, -0.07766075, 1, 0.827451, 0, 1,
-0.9840891, 0.8992899, -1.211988, 1, 0.8352941, 0, 1,
-0.9836339, -0.7770781, -3.450647, 1, 0.8392157, 0, 1,
-0.9799894, 0.8437032, -0.3723358, 1, 0.8470588, 0, 1,
-0.975659, 0.8197342, 0.9346343, 1, 0.8509804, 0, 1,
-0.9697859, 0.7521138, 0.1889334, 1, 0.8588235, 0, 1,
-0.9628324, 0.7184193, -0.1830225, 1, 0.8627451, 0, 1,
-0.9615886, -0.2979819, -1.847675, 1, 0.8705882, 0, 1,
-0.9582833, -0.6717583, -2.836095, 1, 0.8745098, 0, 1,
-0.9547131, 0.3578614, -0.5152979, 1, 0.8823529, 0, 1,
-0.9531161, -0.7143785, -1.578644, 1, 0.8862745, 0, 1,
-0.9527094, -1.492504, -2.119844, 1, 0.8941177, 0, 1,
-0.9506736, 2.481861, -1.916044, 1, 0.8980392, 0, 1,
-0.9463491, 0.6402354, -2.459777, 1, 0.9058824, 0, 1,
-0.9457868, -0.6040887, -1.025744, 1, 0.9137255, 0, 1,
-0.9408635, -1.62456, -2.054335, 1, 0.9176471, 0, 1,
-0.93669, -1.684762, -1.786269, 1, 0.9254902, 0, 1,
-0.9327267, 0.1872986, -2.522665, 1, 0.9294118, 0, 1,
-0.9294537, -0.104792, -1.351347, 1, 0.9372549, 0, 1,
-0.928432, 1.619058, -0.471316, 1, 0.9411765, 0, 1,
-0.9279272, -1.68966, -2.701309, 1, 0.9490196, 0, 1,
-0.926634, -1.567724, -2.591219, 1, 0.9529412, 0, 1,
-0.9248434, 0.812719, 0.6587494, 1, 0.9607843, 0, 1,
-0.9233215, -1.560552, -3.208167, 1, 0.9647059, 0, 1,
-0.9226184, -0.7900388, -1.073984, 1, 0.972549, 0, 1,
-0.9056495, 0.4295583, -3.283683, 1, 0.9764706, 0, 1,
-0.9043826, -0.5181832, -1.271634, 1, 0.9843137, 0, 1,
-0.8944013, -1.303626, -1.50407, 1, 0.9882353, 0, 1,
-0.8925112, -0.3689772, -3.47288, 1, 0.9960784, 0, 1,
-0.8915083, 0.419964, -1.931183, 0.9960784, 1, 0, 1,
-0.8880716, 0.921843, -1.431829, 0.9921569, 1, 0, 1,
-0.8839329, -0.8413199, -0.7231373, 0.9843137, 1, 0, 1,
-0.8814563, 0.4712241, -0.403, 0.9803922, 1, 0, 1,
-0.8790138, 0.8724914, -1.803192, 0.972549, 1, 0, 1,
-0.8724085, -1.742859, -3.562463, 0.9686275, 1, 0, 1,
-0.8613327, -1.09619, -1.791151, 0.9607843, 1, 0, 1,
-0.857238, -0.04484093, -1.976117, 0.9568627, 1, 0, 1,
-0.8554865, 1.663383, 0.0362129, 0.9490196, 1, 0, 1,
-0.8478674, 2.208962, 0.9175597, 0.945098, 1, 0, 1,
-0.8477594, 0.9508048, -1.649669, 0.9372549, 1, 0, 1,
-0.8426372, 0.2485663, -0.274675, 0.9333333, 1, 0, 1,
-0.840854, -0.6428155, -3.390244, 0.9254902, 1, 0, 1,
-0.8351108, -2.300091, -1.75379, 0.9215686, 1, 0, 1,
-0.8337291, 0.264651, -0.002427154, 0.9137255, 1, 0, 1,
-0.8280963, 0.6109588, -1.290133, 0.9098039, 1, 0, 1,
-0.8250471, -1.270348, -3.094903, 0.9019608, 1, 0, 1,
-0.8217094, -1.153305, -1.468281, 0.8941177, 1, 0, 1,
-0.8068235, -0.6578951, -1.653256, 0.8901961, 1, 0, 1,
-0.8064235, -1.112154, 0.3149936, 0.8823529, 1, 0, 1,
-0.805697, -1.398826, -2.314056, 0.8784314, 1, 0, 1,
-0.7999323, 1.002333, 1.826548, 0.8705882, 1, 0, 1,
-0.7989245, 0.7247748, 1.055028, 0.8666667, 1, 0, 1,
-0.7847751, 0.8913109, -0.8215563, 0.8588235, 1, 0, 1,
-0.7840614, 0.1634823, 0.07594086, 0.854902, 1, 0, 1,
-0.7833673, 0.4602202, -1.731659, 0.8470588, 1, 0, 1,
-0.7799191, -1.844828, -3.222131, 0.8431373, 1, 0, 1,
-0.779494, -1.1561, -3.758855, 0.8352941, 1, 0, 1,
-0.7790132, -0.2472513, -3.067825, 0.8313726, 1, 0, 1,
-0.7770948, 0.2543077, -0.5490479, 0.8235294, 1, 0, 1,
-0.7724296, -1.613295, -2.815349, 0.8196079, 1, 0, 1,
-0.7696292, 0.7386656, -0.5164324, 0.8117647, 1, 0, 1,
-0.7673089, 1.692787, 0.9787887, 0.8078431, 1, 0, 1,
-0.7642168, 0.8534709, -1.337037, 0.8, 1, 0, 1,
-0.761711, -0.3423757, -2.008863, 0.7921569, 1, 0, 1,
-0.7602816, 1.008133, -0.475319, 0.7882353, 1, 0, 1,
-0.7552084, 1.77327, -1.411484, 0.7803922, 1, 0, 1,
-0.7498298, -0.4117134, -1.709788, 0.7764706, 1, 0, 1,
-0.7449882, 0.6656304, 0.2305899, 0.7686275, 1, 0, 1,
-0.7432826, 1.649319, -0.9291641, 0.7647059, 1, 0, 1,
-0.7424176, -0.9800792, -2.752591, 0.7568628, 1, 0, 1,
-0.7341322, 0.1614626, 0.01683723, 0.7529412, 1, 0, 1,
-0.7321505, -0.6621093, -2.156064, 0.7450981, 1, 0, 1,
-0.7289487, 0.5266287, -0.1706558, 0.7411765, 1, 0, 1,
-0.7279661, -0.4855117, -1.814775, 0.7333333, 1, 0, 1,
-0.7118001, 0.05079202, -1.08199, 0.7294118, 1, 0, 1,
-0.7108265, -0.763401, -3.198379, 0.7215686, 1, 0, 1,
-0.7059421, 1.533398, -0.3791594, 0.7176471, 1, 0, 1,
-0.6997454, 1.48867, 0.1692394, 0.7098039, 1, 0, 1,
-0.6984992, 0.4581728, -2.2177, 0.7058824, 1, 0, 1,
-0.6973584, 0.7118068, -2.570657, 0.6980392, 1, 0, 1,
-0.6944293, 0.01171834, -2.528077, 0.6901961, 1, 0, 1,
-0.6936417, 2.246243, -0.3719559, 0.6862745, 1, 0, 1,
-0.6930457, -1.192002, -1.353805, 0.6784314, 1, 0, 1,
-0.6857322, -0.120914, -3.526579, 0.6745098, 1, 0, 1,
-0.6856253, 0.09115338, 1.193227, 0.6666667, 1, 0, 1,
-0.6834062, -1.348933, -1.702107, 0.6627451, 1, 0, 1,
-0.6832969, 1.027818, 1.119991, 0.654902, 1, 0, 1,
-0.683015, -0.006322329, -2.560935, 0.6509804, 1, 0, 1,
-0.6813087, -0.001562773, -1.635314, 0.6431373, 1, 0, 1,
-0.6808106, 0.02593675, -0.9209705, 0.6392157, 1, 0, 1,
-0.6776615, 0.1461292, -0.1829766, 0.6313726, 1, 0, 1,
-0.6771652, -0.5117791, -2.384892, 0.627451, 1, 0, 1,
-0.6762196, -1.974857, -1.555343, 0.6196079, 1, 0, 1,
-0.67474, -0.4998308, 0.2345538, 0.6156863, 1, 0, 1,
-0.6718567, -0.06338204, -1.734496, 0.6078432, 1, 0, 1,
-0.6714483, -1.054955, -2.979616, 0.6039216, 1, 0, 1,
-0.6710109, -1.466623, -3.154247, 0.5960785, 1, 0, 1,
-0.6697221, 0.8775027, -0.587571, 0.5882353, 1, 0, 1,
-0.6671849, -0.1110161, -1.246692, 0.5843138, 1, 0, 1,
-0.6642948, -0.7960147, -1.842491, 0.5764706, 1, 0, 1,
-0.6641372, -0.6529942, -1.728966, 0.572549, 1, 0, 1,
-0.6582023, -0.1018199, -3.024868, 0.5647059, 1, 0, 1,
-0.6492198, -0.734009, -1.772715, 0.5607843, 1, 0, 1,
-0.6458968, 0.04683458, -1.156121, 0.5529412, 1, 0, 1,
-0.6416048, -0.4877444, -4.338613, 0.5490196, 1, 0, 1,
-0.6414194, -1.039955, -3.260016, 0.5411765, 1, 0, 1,
-0.6305248, 1.844089, -0.2353898, 0.5372549, 1, 0, 1,
-0.6303281, 0.2532774, -3.404017, 0.5294118, 1, 0, 1,
-0.6212863, -0.2403598, -0.6255022, 0.5254902, 1, 0, 1,
-0.6168278, -1.354184, -2.137627, 0.5176471, 1, 0, 1,
-0.6132411, 1.610615, 1.38719, 0.5137255, 1, 0, 1,
-0.6121385, -0.2055483, -2.075003, 0.5058824, 1, 0, 1,
-0.6069831, 1.849161, -0.2509907, 0.5019608, 1, 0, 1,
-0.6054745, -1.051104, -1.775748, 0.4941176, 1, 0, 1,
-0.6036415, 0.03182108, -1.692541, 0.4862745, 1, 0, 1,
-0.6025532, -1.40362, -2.404845, 0.4823529, 1, 0, 1,
-0.6008654, 1.482588, 0.3805452, 0.4745098, 1, 0, 1,
-0.596801, 0.7871332, 0.1231578, 0.4705882, 1, 0, 1,
-0.5917749, 1.99662, -0.8107542, 0.4627451, 1, 0, 1,
-0.5916896, -0.3558167, -2.596334, 0.4588235, 1, 0, 1,
-0.586498, 2.145409, 1.19004, 0.4509804, 1, 0, 1,
-0.585956, -1.519674, -3.686019, 0.4470588, 1, 0, 1,
-0.5854274, 0.8827763, -0.8702085, 0.4392157, 1, 0, 1,
-0.5829986, -0.1958685, -2.103741, 0.4352941, 1, 0, 1,
-0.5816715, -0.9341302, -3.185124, 0.427451, 1, 0, 1,
-0.5789459, 1.149972, -0.5645877, 0.4235294, 1, 0, 1,
-0.5789251, 2.549992, 1.546106, 0.4156863, 1, 0, 1,
-0.5732292, -1.005475, -5.421227, 0.4117647, 1, 0, 1,
-0.5709403, 0.6148781, -0.9962634, 0.4039216, 1, 0, 1,
-0.5689468, 0.6447405, 0.7521347, 0.3960784, 1, 0, 1,
-0.5655476, -0.6331306, -2.578984, 0.3921569, 1, 0, 1,
-0.5536984, 0.1797152, -1.874228, 0.3843137, 1, 0, 1,
-0.5514285, -2.22348, -3.456586, 0.3803922, 1, 0, 1,
-0.5450354, -0.2121003, -1.456767, 0.372549, 1, 0, 1,
-0.5444, -0.4236911, -1.968823, 0.3686275, 1, 0, 1,
-0.5432984, -0.2568164, -2.117466, 0.3607843, 1, 0, 1,
-0.5390863, 0.5849622, -1.014005, 0.3568628, 1, 0, 1,
-0.5386469, 0.4396491, -0.6764191, 0.3490196, 1, 0, 1,
-0.5373079, 0.6525513, -0.828219, 0.345098, 1, 0, 1,
-0.5365688, -0.7557046, -3.90487, 0.3372549, 1, 0, 1,
-0.5356348, -1.593255, -3.984878, 0.3333333, 1, 0, 1,
-0.5338302, 0.009882474, 0.03393035, 0.3254902, 1, 0, 1,
-0.5323245, -0.2601789, -2.803638, 0.3215686, 1, 0, 1,
-0.5262396, -0.275837, -1.772787, 0.3137255, 1, 0, 1,
-0.525753, -0.9782076, -1.986086, 0.3098039, 1, 0, 1,
-0.519092, 0.355482, -0.04609625, 0.3019608, 1, 0, 1,
-0.518523, -0.3961356, -2.475612, 0.2941177, 1, 0, 1,
-0.5151423, 0.8085088, -1.72762, 0.2901961, 1, 0, 1,
-0.513579, 1.902544, -0.537568, 0.282353, 1, 0, 1,
-0.5124797, -0.466484, -3.668791, 0.2784314, 1, 0, 1,
-0.5032028, -1.216594, -2.44633, 0.2705882, 1, 0, 1,
-0.4989021, -0.4100509, -1.99214, 0.2666667, 1, 0, 1,
-0.4975361, -0.8167891, -2.392909, 0.2588235, 1, 0, 1,
-0.4951408, -0.694961, -2.180158, 0.254902, 1, 0, 1,
-0.4880673, 0.6910607, -0.8758811, 0.2470588, 1, 0, 1,
-0.4860475, -0.5001275, -3.586429, 0.2431373, 1, 0, 1,
-0.4838284, -1.652352, -2.433123, 0.2352941, 1, 0, 1,
-0.4776015, -0.2400713, -3.083426, 0.2313726, 1, 0, 1,
-0.4748853, -0.1849152, -2.630188, 0.2235294, 1, 0, 1,
-0.4731175, -0.6857087, -3.002573, 0.2196078, 1, 0, 1,
-0.4726321, -1.030014, -1.94526, 0.2117647, 1, 0, 1,
-0.4722905, -1.794504, -4.522007, 0.2078431, 1, 0, 1,
-0.4649127, -1.185156, -2.230749, 0.2, 1, 0, 1,
-0.4562262, 0.6838136, -0.969557, 0.1921569, 1, 0, 1,
-0.4547094, 0.7254288, -0.7410743, 0.1882353, 1, 0, 1,
-0.4537624, 0.4283222, -0.3174233, 0.1803922, 1, 0, 1,
-0.4524006, -0.2329954, -0.6103388, 0.1764706, 1, 0, 1,
-0.448062, 0.09703293, -0.3110922, 0.1686275, 1, 0, 1,
-0.4425285, 0.6698769, 0.2783948, 0.1647059, 1, 0, 1,
-0.4386096, 0.6027605, -0.3145159, 0.1568628, 1, 0, 1,
-0.4369866, 1.237543, -1.478229, 0.1529412, 1, 0, 1,
-0.4361606, 1.46462, -0.1676525, 0.145098, 1, 0, 1,
-0.4308604, -1.129621, -3.616835, 0.1411765, 1, 0, 1,
-0.4306896, -0.4930865, -2.485053, 0.1333333, 1, 0, 1,
-0.4304169, 0.70331, 0.7973068, 0.1294118, 1, 0, 1,
-0.4286768, 0.734708, 1.354431, 0.1215686, 1, 0, 1,
-0.4281128, -0.7102896, -2.371843, 0.1176471, 1, 0, 1,
-0.4227236, -0.4180469, -4.452531, 0.1098039, 1, 0, 1,
-0.421899, -0.4173094, -2.207276, 0.1058824, 1, 0, 1,
-0.4197766, 1.066765, -1.760227, 0.09803922, 1, 0, 1,
-0.4181529, -1.073555, -4.575256, 0.09019608, 1, 0, 1,
-0.4136275, 0.2331955, -1.167321, 0.08627451, 1, 0, 1,
-0.4084162, 0.5154406, -0.5705189, 0.07843138, 1, 0, 1,
-0.4083175, 0.7451983, 0.06044611, 0.07450981, 1, 0, 1,
-0.3927484, -0.05426508, -1.696807, 0.06666667, 1, 0, 1,
-0.3921154, -0.7547429, -2.018672, 0.0627451, 1, 0, 1,
-0.3809851, 0.7888796, -2.73407, 0.05490196, 1, 0, 1,
-0.3696813, 1.094678, 1.211511, 0.05098039, 1, 0, 1,
-0.3696284, -0.1722901, -1.673177, 0.04313726, 1, 0, 1,
-0.3612582, 0.8647196, -0.6026732, 0.03921569, 1, 0, 1,
-0.3612518, 1.637079, -0.9601769, 0.03137255, 1, 0, 1,
-0.3582285, 0.2875071, -1.726873, 0.02745098, 1, 0, 1,
-0.3563806, 0.3758392, 0.005515281, 0.01960784, 1, 0, 1,
-0.3519077, 1.524891, 0.2911818, 0.01568628, 1, 0, 1,
-0.3509811, 0.807444, 0.08461877, 0.007843138, 1, 0, 1,
-0.349182, -0.9934517, -2.126069, 0.003921569, 1, 0, 1,
-0.3455634, -0.2494217, -1.678611, 0, 1, 0.003921569, 1,
-0.3451245, 1.385502, -0.3859412, 0, 1, 0.01176471, 1,
-0.3439352, -0.004775185, -1.854281, 0, 1, 0.01568628, 1,
-0.3433863, 1.200312, 0.004589858, 0, 1, 0.02352941, 1,
-0.3428554, -1.257793, -2.305359, 0, 1, 0.02745098, 1,
-0.3395877, 0.6838551, 0.02693226, 0, 1, 0.03529412, 1,
-0.3391117, 0.1608581, -0.6219733, 0, 1, 0.03921569, 1,
-0.3379895, 0.7563186, -0.1924794, 0, 1, 0.04705882, 1,
-0.3370779, 1.042286, 0.3016436, 0, 1, 0.05098039, 1,
-0.3353632, 0.3374015, -0.1571295, 0, 1, 0.05882353, 1,
-0.3289625, -2.077905, -3.590392, 0, 1, 0.0627451, 1,
-0.3206538, -0.9404696, -2.549694, 0, 1, 0.07058824, 1,
-0.317527, 0.8497555, -0.4104708, 0, 1, 0.07450981, 1,
-0.3171321, 0.6293105, -1.203906, 0, 1, 0.08235294, 1,
-0.3145622, 0.3980924, -0.4054033, 0, 1, 0.08627451, 1,
-0.3145185, -1.371323, -2.40653, 0, 1, 0.09411765, 1,
-0.3137202, -0.1392872, -2.346065, 0, 1, 0.1019608, 1,
-0.3126586, -1.184287, -4.829194, 0, 1, 0.1058824, 1,
-0.3098623, -0.4049656, -0.8025222, 0, 1, 0.1137255, 1,
-0.3048796, -0.2656274, -2.026062, 0, 1, 0.1176471, 1,
-0.3046187, 2.052783, -0.2745701, 0, 1, 0.1254902, 1,
-0.3032485, 0.8490668, 0.151254, 0, 1, 0.1294118, 1,
-0.2982215, 0.008711689, -2.677625, 0, 1, 0.1372549, 1,
-0.2976706, 0.6665299, 0.04579695, 0, 1, 0.1411765, 1,
-0.2964445, -0.08651717, -3.021245, 0, 1, 0.1490196, 1,
-0.2961772, -0.8787159, -2.532155, 0, 1, 0.1529412, 1,
-0.2932161, -2.126373, -2.970754, 0, 1, 0.1607843, 1,
-0.291915, 0.6610574, -2.192569, 0, 1, 0.1647059, 1,
-0.2900561, 0.9620164, 1.326006, 0, 1, 0.172549, 1,
-0.2894903, 0.8713998, -1.312374, 0, 1, 0.1764706, 1,
-0.2867264, 0.5730069, -1.666589, 0, 1, 0.1843137, 1,
-0.2844525, -0.8204256, -2.790927, 0, 1, 0.1882353, 1,
-0.2827629, -0.2725511, -2.045937, 0, 1, 0.1960784, 1,
-0.2818383, -0.3850372, -2.281055, 0, 1, 0.2039216, 1,
-0.2808414, 0.4950223, -1.331655, 0, 1, 0.2078431, 1,
-0.2807624, 1.017057, -0.560294, 0, 1, 0.2156863, 1,
-0.2727238, -0.959818, -1.444263, 0, 1, 0.2196078, 1,
-0.2726422, -0.6465358, -3.204663, 0, 1, 0.227451, 1,
-0.2690543, -0.4909514, -1.903147, 0, 1, 0.2313726, 1,
-0.265901, 0.2188214, -2.758895, 0, 1, 0.2392157, 1,
-0.2621918, 1.894088, -1.530584, 0, 1, 0.2431373, 1,
-0.2561486, 2.493555, 0.3357689, 0, 1, 0.2509804, 1,
-0.2540821, -0.5887938, -2.806339, 0, 1, 0.254902, 1,
-0.2490407, -0.9990507, -2.726868, 0, 1, 0.2627451, 1,
-0.2449848, -0.8636131, -1.826965, 0, 1, 0.2666667, 1,
-0.2429186, 0.8459507, 0.2586401, 0, 1, 0.2745098, 1,
-0.2423147, 2.545027, 0.2206834, 0, 1, 0.2784314, 1,
-0.2399765, 2.027026, -1.296194, 0, 1, 0.2862745, 1,
-0.2391474, 0.9837334, -0.4803976, 0, 1, 0.2901961, 1,
-0.2383036, -0.187941, -3.078602, 0, 1, 0.2980392, 1,
-0.2369479, -0.4409318, -1.522911, 0, 1, 0.3058824, 1,
-0.2348137, 1.190081, -0.6740763, 0, 1, 0.3098039, 1,
-0.2326992, 2.96992, -0.2127478, 0, 1, 0.3176471, 1,
-0.226828, 0.02775054, -1.230481, 0, 1, 0.3215686, 1,
-0.2221164, 0.1669581, -1.273753, 0, 1, 0.3294118, 1,
-0.2151988, 0.7997435, -0.9630665, 0, 1, 0.3333333, 1,
-0.214793, -0.8749763, -3.43478, 0, 1, 0.3411765, 1,
-0.2145248, 1.180287, 1.096634, 0, 1, 0.345098, 1,
-0.2142964, -0.8032194, -1.850191, 0, 1, 0.3529412, 1,
-0.2116689, 0.0440531, -0.9684162, 0, 1, 0.3568628, 1,
-0.2109534, -1.147248, -1.283913, 0, 1, 0.3647059, 1,
-0.2107415, 0.9847395, -0.2474254, 0, 1, 0.3686275, 1,
-0.207845, 1.372629, -2.28265, 0, 1, 0.3764706, 1,
-0.2041069, 0.9384125, -1.220296, 0, 1, 0.3803922, 1,
-0.2032987, 0.3757974, 0.9670501, 0, 1, 0.3882353, 1,
-0.2017767, -0.469399, -2.155972, 0, 1, 0.3921569, 1,
-0.2008988, 1.317011, 0.5279046, 0, 1, 0.4, 1,
-0.1989884, -0.5064346, -3.058876, 0, 1, 0.4078431, 1,
-0.1985663, -0.3388139, -1.692385, 0, 1, 0.4117647, 1,
-0.1968284, 1.187471, -0.1058807, 0, 1, 0.4196078, 1,
-0.1956115, -0.7728821, -3.167758, 0, 1, 0.4235294, 1,
-0.1919223, -0.0003043536, -0.3106897, 0, 1, 0.4313726, 1,
-0.1866274, 1.286613, -0.5335099, 0, 1, 0.4352941, 1,
-0.1862679, -0.0798813, -1.996431, 0, 1, 0.4431373, 1,
-0.185137, 0.6690814, -1.202428, 0, 1, 0.4470588, 1,
-0.1838552, 1.224961, -1.804344, 0, 1, 0.454902, 1,
-0.1791958, -0.5218721, -3.985718, 0, 1, 0.4588235, 1,
-0.1771463, 0.1697976, -1.487946, 0, 1, 0.4666667, 1,
-0.1766787, 2.386751, -1.851302, 0, 1, 0.4705882, 1,
-0.1756459, -0.620702, -3.728362, 0, 1, 0.4784314, 1,
-0.173242, 0.7132419, -1.691149, 0, 1, 0.4823529, 1,
-0.1703902, -1.07381, -4.323861, 0, 1, 0.4901961, 1,
-0.1681266, 0.02946908, -0.8462391, 0, 1, 0.4941176, 1,
-0.1679884, 0.2797225, -1.714787, 0, 1, 0.5019608, 1,
-0.1674892, -1.424663, -5.23887, 0, 1, 0.509804, 1,
-0.1638358, -0.1915314, -2.842016, 0, 1, 0.5137255, 1,
-0.1614647, -0.958122, -2.297769, 0, 1, 0.5215687, 1,
-0.1516802, -0.1402568, -1.613388, 0, 1, 0.5254902, 1,
-0.1462175, 0.3564702, 1.728845, 0, 1, 0.5333334, 1,
-0.1460562, 1.748306, -1.077519, 0, 1, 0.5372549, 1,
-0.1439061, -0.7058926, -3.887557, 0, 1, 0.5450981, 1,
-0.1427715, 0.4788228, -1.55403, 0, 1, 0.5490196, 1,
-0.1421961, -1.39068, -2.033321, 0, 1, 0.5568628, 1,
-0.1417477, -1.833349, -3.026855, 0, 1, 0.5607843, 1,
-0.1415048, 1.269447, 1.702742, 0, 1, 0.5686275, 1,
-0.1342463, 1.521513, -0.2573388, 0, 1, 0.572549, 1,
-0.1295281, -1.025491, -1.493623, 0, 1, 0.5803922, 1,
-0.1289746, -0.4741905, -4.434606, 0, 1, 0.5843138, 1,
-0.1282294, -1.25185, -2.504012, 0, 1, 0.5921569, 1,
-0.1265659, -0.3215018, -1.261879, 0, 1, 0.5960785, 1,
-0.1262534, 0.7110673, 1.806968, 0, 1, 0.6039216, 1,
-0.1250975, -1.491164, -3.886497, 0, 1, 0.6117647, 1,
-0.1222047, 0.4471744, -0.2317543, 0, 1, 0.6156863, 1,
-0.1201079, 2.118493, 0.7439987, 0, 1, 0.6235294, 1,
-0.1143089, 0.3433448, -1.749094, 0, 1, 0.627451, 1,
-0.1082402, -0.6626718, -4.0825, 0, 1, 0.6352941, 1,
-0.1055738, -0.2623009, -2.499043, 0, 1, 0.6392157, 1,
-0.09362954, -1.397149, -2.67431, 0, 1, 0.6470588, 1,
-0.09040219, -1.552555, -3.998353, 0, 1, 0.6509804, 1,
-0.08882202, 1.21166, 1.303177, 0, 1, 0.6588235, 1,
-0.08693583, 0.848583, 0.4416628, 0, 1, 0.6627451, 1,
-0.08672998, 0.7134557, -0.2707097, 0, 1, 0.6705883, 1,
-0.08528394, 0.2618084, 0.4580016, 0, 1, 0.6745098, 1,
-0.08462206, -0.3621186, -2.771991, 0, 1, 0.682353, 1,
-0.08432183, -1.293218, -2.35886, 0, 1, 0.6862745, 1,
-0.08162032, 0.2000429, -0.4059054, 0, 1, 0.6941177, 1,
-0.08153966, 0.3024677, 0.2356063, 0, 1, 0.7019608, 1,
-0.07630767, 0.6497536, 0.6601379, 0, 1, 0.7058824, 1,
-0.07247274, -2.016955, -1.63043, 0, 1, 0.7137255, 1,
-0.06992693, -0.7303718, -2.63372, 0, 1, 0.7176471, 1,
-0.06707032, 0.1671298, -0.1886909, 0, 1, 0.7254902, 1,
-0.0636524, -0.7043914, -2.886577, 0, 1, 0.7294118, 1,
-0.06211665, 1.09275, -1.437801, 0, 1, 0.7372549, 1,
-0.05833391, 0.1441758, -0.6468288, 0, 1, 0.7411765, 1,
-0.04927567, -0.4287367, -1.86842, 0, 1, 0.7490196, 1,
-0.04435883, -0.4634533, -2.437487, 0, 1, 0.7529412, 1,
-0.03555796, 0.5302086, 0.7503425, 0, 1, 0.7607843, 1,
-0.03073696, -0.871707, -2.428874, 0, 1, 0.7647059, 1,
-0.02619986, -0.3135911, -2.929872, 0, 1, 0.772549, 1,
-0.02453214, 0.8165217, 1.084294, 0, 1, 0.7764706, 1,
-0.02323581, -1.809882, -1.395348, 0, 1, 0.7843137, 1,
-0.02155796, 1.10489, 1.141345, 0, 1, 0.7882353, 1,
-0.01618701, 0.2713956, 0.8705454, 0, 1, 0.7960784, 1,
-0.01518391, 0.07226246, 2.790064, 0, 1, 0.8039216, 1,
-0.01417986, -1.24355, -1.917365, 0, 1, 0.8078431, 1,
-0.01053021, -0.7596814, -2.44135, 0, 1, 0.8156863, 1,
-0.01015312, -0.569699, -4.185214, 0, 1, 0.8196079, 1,
-0.008405135, -0.414568, -2.306332, 0, 1, 0.827451, 1,
-0.003218423, -0.5910603, -3.891023, 0, 1, 0.8313726, 1,
0.0002246962, 0.5393248, -0.7864285, 0, 1, 0.8392157, 1,
0.0009591164, -0.8382469, 2.927505, 0, 1, 0.8431373, 1,
0.005781288, 0.5441185, 1.884313, 0, 1, 0.8509804, 1,
0.008289416, -0.4084171, 1.899991, 0, 1, 0.854902, 1,
0.01028335, -0.252278, 2.679061, 0, 1, 0.8627451, 1,
0.01310734, 0.6133381, 1.4797, 0, 1, 0.8666667, 1,
0.01651792, -0.9992657, 4.646395, 0, 1, 0.8745098, 1,
0.01688546, 0.1010236, 1.782679, 0, 1, 0.8784314, 1,
0.0182091, -0.4801027, 2.578851, 0, 1, 0.8862745, 1,
0.01899459, 1.731155, 0.2200966, 0, 1, 0.8901961, 1,
0.02518022, -0.8722779, 2.275767, 0, 1, 0.8980392, 1,
0.02786733, 0.5383529, 0.1541369, 0, 1, 0.9058824, 1,
0.03343828, 0.9332834, -0.3813721, 0, 1, 0.9098039, 1,
0.03349277, 1.317665, 0.2407526, 0, 1, 0.9176471, 1,
0.03504453, -0.3902613, 2.410968, 0, 1, 0.9215686, 1,
0.03525323, -0.6198968, 3.206976, 0, 1, 0.9294118, 1,
0.03941787, -0.5452704, 4.478975, 0, 1, 0.9333333, 1,
0.0441931, -0.327639, 4.398954, 0, 1, 0.9411765, 1,
0.0496323, -1.84565, 3.585327, 0, 1, 0.945098, 1,
0.05208169, -0.9720823, 4.329348, 0, 1, 0.9529412, 1,
0.05246303, -0.9664006, 2.828373, 0, 1, 0.9568627, 1,
0.05516163, -0.3658009, 3.485012, 0, 1, 0.9647059, 1,
0.05563965, 0.4034954, 0.7399309, 0, 1, 0.9686275, 1,
0.06158432, 1.459626, 0.4926434, 0, 1, 0.9764706, 1,
0.0648376, -1.475613, 3.98361, 0, 1, 0.9803922, 1,
0.06761094, 1.844857, -0.2522257, 0, 1, 0.9882353, 1,
0.07240649, -0.3238787, 4.509587, 0, 1, 0.9921569, 1,
0.07363781, 1.738205, 1.059463, 0, 1, 1, 1,
0.07541786, -0.239338, 3.759234, 0, 0.9921569, 1, 1,
0.07728275, -0.1574211, 2.699091, 0, 0.9882353, 1, 1,
0.07784052, -1.414604, 4.980571, 0, 0.9803922, 1, 1,
0.07834343, 0.7763715, -0.4338742, 0, 0.9764706, 1, 1,
0.08115033, -0.4073397, 3.56573, 0, 0.9686275, 1, 1,
0.08457021, 1.048953, -0.318863, 0, 0.9647059, 1, 1,
0.08686344, 1.201035, 0.5670676, 0, 0.9568627, 1, 1,
0.08731835, -0.9125092, 3.278296, 0, 0.9529412, 1, 1,
0.08756027, 1.19651, -0.790419, 0, 0.945098, 1, 1,
0.09031554, -0.987202, 4.429172, 0, 0.9411765, 1, 1,
0.09515353, -0.2279501, 3.725882, 0, 0.9333333, 1, 1,
0.09726264, -0.8362978, 3.052779, 0, 0.9294118, 1, 1,
0.1075059, 0.1543864, 2.248354, 0, 0.9215686, 1, 1,
0.1078513, 0.7561854, -1.148234, 0, 0.9176471, 1, 1,
0.1097782, -1.090238, 3.161925, 0, 0.9098039, 1, 1,
0.1103286, -0.5360112, 3.141593, 0, 0.9058824, 1, 1,
0.1114582, -1.559241, 2.249391, 0, 0.8980392, 1, 1,
0.1122354, -0.9693713, 0.7012417, 0, 0.8901961, 1, 1,
0.113676, -1.240139, 2.660327, 0, 0.8862745, 1, 1,
0.1150085, -0.6122195, 2.419497, 0, 0.8784314, 1, 1,
0.1153748, 0.2117322, 0.7773299, 0, 0.8745098, 1, 1,
0.1161006, -0.2098095, 2.577426, 0, 0.8666667, 1, 1,
0.1179738, 0.06975385, 1.569336, 0, 0.8627451, 1, 1,
0.1234238, -0.5219213, 3.60755, 0, 0.854902, 1, 1,
0.1251439, 0.8978662, 1.796924, 0, 0.8509804, 1, 1,
0.1263019, 0.1623078, 0.5382569, 0, 0.8431373, 1, 1,
0.1266008, -0.8697914, 2.287161, 0, 0.8392157, 1, 1,
0.1310002, -0.9212493, 3.252535, 0, 0.8313726, 1, 1,
0.1314699, -0.5124737, 3.399483, 0, 0.827451, 1, 1,
0.1319705, -0.9640136, 3.156957, 0, 0.8196079, 1, 1,
0.1337612, 0.5982195, 1.271399, 0, 0.8156863, 1, 1,
0.1363362, 0.912196, -1.471193, 0, 0.8078431, 1, 1,
0.1398241, -0.3145355, 3.319631, 0, 0.8039216, 1, 1,
0.1406994, 0.1616461, -0.243083, 0, 0.7960784, 1, 1,
0.149426, -0.7222989, 2.28666, 0, 0.7882353, 1, 1,
0.1550754, 1.977567, -0.447018, 0, 0.7843137, 1, 1,
0.1577224, -0.4412875, 2.823826, 0, 0.7764706, 1, 1,
0.1586376, -2.622211, 5.407835, 0, 0.772549, 1, 1,
0.1611381, 1.155154, -0.5601246, 0, 0.7647059, 1, 1,
0.1666338, -1.120625, 1.963169, 0, 0.7607843, 1, 1,
0.1669375, -0.8912715, 1.920737, 0, 0.7529412, 1, 1,
0.1696573, 0.2549089, 0.1750581, 0, 0.7490196, 1, 1,
0.1754205, -1.909401, 3.982253, 0, 0.7411765, 1, 1,
0.1785565, -0.3574582, 4.847028, 0, 0.7372549, 1, 1,
0.1812122, 0.04563908, 2.782701, 0, 0.7294118, 1, 1,
0.1828822, -1.818561, 3.738728, 0, 0.7254902, 1, 1,
0.1851839, -0.5005646, 3.65274, 0, 0.7176471, 1, 1,
0.1861829, 0.4468132, -0.5301165, 0, 0.7137255, 1, 1,
0.1865827, -0.01894262, 2.607103, 0, 0.7058824, 1, 1,
0.2042249, 0.03239873, 0.8948992, 0, 0.6980392, 1, 1,
0.210086, 0.3590878, -1.161899, 0, 0.6941177, 1, 1,
0.2140151, 0.3989325, 1.753343, 0, 0.6862745, 1, 1,
0.2143611, 0.6440496, -0.04841391, 0, 0.682353, 1, 1,
0.2160958, 0.7461961, 0.06268933, 0, 0.6745098, 1, 1,
0.2179242, 0.07648023, 2.038836, 0, 0.6705883, 1, 1,
0.2200308, -0.6850445, 1.326366, 0, 0.6627451, 1, 1,
0.2201501, 1.908581, 0.3913684, 0, 0.6588235, 1, 1,
0.2205257, -0.3307233, 2.312563, 0, 0.6509804, 1, 1,
0.2208952, -1.005525, 2.865733, 0, 0.6470588, 1, 1,
0.2230012, 0.7566897, -0.1287614, 0, 0.6392157, 1, 1,
0.227092, -1.906643, 2.415601, 0, 0.6352941, 1, 1,
0.2368077, 0.224854, 0.6387705, 0, 0.627451, 1, 1,
0.2387937, 0.3128106, 0.1614491, 0, 0.6235294, 1, 1,
0.2402911, 0.5216358, -0.3540193, 0, 0.6156863, 1, 1,
0.2429368, -2.055381, 2.27427, 0, 0.6117647, 1, 1,
0.2440739, -0.529222, 3.399539, 0, 0.6039216, 1, 1,
0.2486864, 0.8434086, -0.4186187, 0, 0.5960785, 1, 1,
0.2515547, 0.1416894, -0.3809914, 0, 0.5921569, 1, 1,
0.2535659, 0.9909317, 0.700039, 0, 0.5843138, 1, 1,
0.2537615, 0.6199097, 0.5364357, 0, 0.5803922, 1, 1,
0.2546304, -0.858595, 3.392366, 0, 0.572549, 1, 1,
0.2568624, 1.562751, -0.6860743, 0, 0.5686275, 1, 1,
0.2645379, -0.1993147, 2.223826, 0, 0.5607843, 1, 1,
0.2713535, 1.303813, -2.540294, 0, 0.5568628, 1, 1,
0.2774209, -0.4972802, 1.952673, 0, 0.5490196, 1, 1,
0.284378, -0.2222212, 3.188443, 0, 0.5450981, 1, 1,
0.2846873, -0.6239589, 2.608833, 0, 0.5372549, 1, 1,
0.2867611, -0.03331814, 0.6480746, 0, 0.5333334, 1, 1,
0.2885771, -1.31378, 2.262988, 0, 0.5254902, 1, 1,
0.2888369, -1.471219, 2.884995, 0, 0.5215687, 1, 1,
0.2914678, -0.1751193, 2.213768, 0, 0.5137255, 1, 1,
0.2915042, 0.05157554, 2.725665, 0, 0.509804, 1, 1,
0.2951319, 1.166671, -0.8892931, 0, 0.5019608, 1, 1,
0.2954597, 0.4813423, 0.7437276, 0, 0.4941176, 1, 1,
0.3004959, 0.9514096, 2.162985, 0, 0.4901961, 1, 1,
0.3007876, 1.007435, 1.266529, 0, 0.4823529, 1, 1,
0.3008462, -0.5041377, 2.862463, 0, 0.4784314, 1, 1,
0.3022043, -0.08861871, 1.644007, 0, 0.4705882, 1, 1,
0.3024567, -0.1630129, 2.553275, 0, 0.4666667, 1, 1,
0.3032392, 0.6877673, 0.954484, 0, 0.4588235, 1, 1,
0.304209, 1.053678, 1.503857, 0, 0.454902, 1, 1,
0.3117983, -0.877801, 3.819937, 0, 0.4470588, 1, 1,
0.318487, 0.148522, 3.066534, 0, 0.4431373, 1, 1,
0.3218807, 0.8954268, -0.6945338, 0, 0.4352941, 1, 1,
0.3235602, -1.656766, 4.057138, 0, 0.4313726, 1, 1,
0.3246067, -0.8022591, 1.706927, 0, 0.4235294, 1, 1,
0.3248622, -0.4081492, 1.741638, 0, 0.4196078, 1, 1,
0.3254732, 0.5210787, -1.213553, 0, 0.4117647, 1, 1,
0.3265966, -0.5883498, 2.568663, 0, 0.4078431, 1, 1,
0.3274088, -0.1219936, 1.815629, 0, 0.4, 1, 1,
0.3276545, 2.208262, 1.43808, 0, 0.3921569, 1, 1,
0.329381, -1.341581, 2.321641, 0, 0.3882353, 1, 1,
0.3318024, -0.02647883, 0.5564339, 0, 0.3803922, 1, 1,
0.3323895, 0.6126766, 1.086499, 0, 0.3764706, 1, 1,
0.3334907, 1.795626, 1.339321, 0, 0.3686275, 1, 1,
0.3339302, -2.203555, 1.725735, 0, 0.3647059, 1, 1,
0.335815, 0.8092675, -1.048982, 0, 0.3568628, 1, 1,
0.3396073, 0.1234511, 0.6355799, 0, 0.3529412, 1, 1,
0.3409124, -0.09987962, 1.515124, 0, 0.345098, 1, 1,
0.3426782, 0.7142775, 1.029142, 0, 0.3411765, 1, 1,
0.3442718, -0.005135376, 1.450905, 0, 0.3333333, 1, 1,
0.3449513, -0.03885156, -0.08198158, 0, 0.3294118, 1, 1,
0.346625, -0.1199994, -0.01991369, 0, 0.3215686, 1, 1,
0.34859, -0.7324681, 4.132394, 0, 0.3176471, 1, 1,
0.3506411, -0.545873, 2.45337, 0, 0.3098039, 1, 1,
0.354648, 0.2133676, -0.3568631, 0, 0.3058824, 1, 1,
0.355115, -1.686877, 2.452692, 0, 0.2980392, 1, 1,
0.358746, 0.7800363, -0.4240598, 0, 0.2901961, 1, 1,
0.3593937, -1.45224, 1.725609, 0, 0.2862745, 1, 1,
0.360664, -1.268391, 2.065305, 0, 0.2784314, 1, 1,
0.3607683, -0.9424231, 1.379087, 0, 0.2745098, 1, 1,
0.3631428, 1.196388, 2.558325, 0, 0.2666667, 1, 1,
0.3634479, -1.463107, 2.977116, 0, 0.2627451, 1, 1,
0.3687258, -0.8948715, 3.206148, 0, 0.254902, 1, 1,
0.3720412, -0.5213652, 2.241104, 0, 0.2509804, 1, 1,
0.3735126, 0.3946123, 1.084244, 0, 0.2431373, 1, 1,
0.3751288, 1.747027, -0.2819772, 0, 0.2392157, 1, 1,
0.3809904, -1.675197, 2.585778, 0, 0.2313726, 1, 1,
0.3887559, -0.1258319, 1.845951, 0, 0.227451, 1, 1,
0.3890482, 0.6434397, 3.006544, 0, 0.2196078, 1, 1,
0.3897789, -1.919399, 2.430775, 0, 0.2156863, 1, 1,
0.3909494, -0.1585754, 2.127848, 0, 0.2078431, 1, 1,
0.3921558, -0.083372, 0.3075475, 0, 0.2039216, 1, 1,
0.3949463, -0.3164223, 3.699335, 0, 0.1960784, 1, 1,
0.3974827, 0.2156061, 1.291489, 0, 0.1882353, 1, 1,
0.4051595, 0.5771709, 0.2271114, 0, 0.1843137, 1, 1,
0.4061668, -1.694542, 2.032809, 0, 0.1764706, 1, 1,
0.4078327, -1.104695, 2.768404, 0, 0.172549, 1, 1,
0.4103398, -1.11216, 4.207059, 0, 0.1647059, 1, 1,
0.4115299, -0.3981558, 1.691976, 0, 0.1607843, 1, 1,
0.411737, 1.187009, -1.302972, 0, 0.1529412, 1, 1,
0.4122738, -0.8839135, 2.674707, 0, 0.1490196, 1, 1,
0.4137554, 1.889025, 0.6417147, 0, 0.1411765, 1, 1,
0.417219, -1.655313, 2.850567, 0, 0.1372549, 1, 1,
0.4177741, 0.2629255, 0.6668976, 0, 0.1294118, 1, 1,
0.4179747, -2.175324, 2.94838, 0, 0.1254902, 1, 1,
0.4188038, -1.208212, 1.829067, 0, 0.1176471, 1, 1,
0.4217376, 1.517166, 0.493523, 0, 0.1137255, 1, 1,
0.4250648, 0.2059538, 0.1829747, 0, 0.1058824, 1, 1,
0.4253955, 0.6197009, -0.1718522, 0, 0.09803922, 1, 1,
0.4258957, -0.5698171, 3.269362, 0, 0.09411765, 1, 1,
0.4263468, -0.3387499, 1.382938, 0, 0.08627451, 1, 1,
0.4290688, -0.7213819, 3.043774, 0, 0.08235294, 1, 1,
0.4305741, 0.4599531, -0.06202818, 0, 0.07450981, 1, 1,
0.4317926, 0.111763, 0.4230507, 0, 0.07058824, 1, 1,
0.4383877, -1.442983, 2.161402, 0, 0.0627451, 1, 1,
0.4421636, -0.5672859, 2.372957, 0, 0.05882353, 1, 1,
0.4429961, 0.2679818, 1.403759, 0, 0.05098039, 1, 1,
0.4432508, 1.356687, -0.003855796, 0, 0.04705882, 1, 1,
0.4441494, 0.465078, -1.335078, 0, 0.03921569, 1, 1,
0.4471695, 0.6338363, 0.5033837, 0, 0.03529412, 1, 1,
0.4511755, 0.2737371, 0.7819204, 0, 0.02745098, 1, 1,
0.4558148, 1.370936, 0.7765257, 0, 0.02352941, 1, 1,
0.4587394, -1.898884, 2.505134, 0, 0.01568628, 1, 1,
0.4655649, -0.8527574, 2.843793, 0, 0.01176471, 1, 1,
0.467096, -0.2212867, 0.3203269, 0, 0.003921569, 1, 1,
0.473336, -1.54776, 0.694944, 0.003921569, 0, 1, 1,
0.4757853, -1.351069, 2.665501, 0.007843138, 0, 1, 1,
0.4766333, 1.496646, 0.6535273, 0.01568628, 0, 1, 1,
0.477102, 0.6906258, 2.383574, 0.01960784, 0, 1, 1,
0.4844198, 1.511628, 0.960331, 0.02745098, 0, 1, 1,
0.4869407, -0.1613814, 2.293444, 0.03137255, 0, 1, 1,
0.4897567, 1.980497, -0.8390927, 0.03921569, 0, 1, 1,
0.4926987, 1.083937, 0.7823214, 0.04313726, 0, 1, 1,
0.4937096, -2.106546, 1.550006, 0.05098039, 0, 1, 1,
0.4983876, 0.5365669, -0.271189, 0.05490196, 0, 1, 1,
0.5009289, -0.5555214, 1.888403, 0.0627451, 0, 1, 1,
0.5036919, -0.2539643, 0.6071109, 0.06666667, 0, 1, 1,
0.506127, -1.357259, 4.684052, 0.07450981, 0, 1, 1,
0.509477, 0.08268673, 1.46787, 0.07843138, 0, 1, 1,
0.5110544, -0.4490364, 2.088573, 0.08627451, 0, 1, 1,
0.5147102, 2.450949, 0.3131757, 0.09019608, 0, 1, 1,
0.515922, -0.8405966, 3.185718, 0.09803922, 0, 1, 1,
0.5172603, 0.9175495, 0.5000762, 0.1058824, 0, 1, 1,
0.5204847, -1.139936, 2.508396, 0.1098039, 0, 1, 1,
0.5208392, 0.5339678, 0.8187671, 0.1176471, 0, 1, 1,
0.5245684, 2.095577, 0.2035566, 0.1215686, 0, 1, 1,
0.5311916, 0.6388871, 0.8165835, 0.1294118, 0, 1, 1,
0.5317843, 0.486589, 1.13826, 0.1333333, 0, 1, 1,
0.533927, -0.1583129, 3.08293, 0.1411765, 0, 1, 1,
0.5353767, -0.4101539, 0.8187302, 0.145098, 0, 1, 1,
0.5355681, 1.86516, 1.759539, 0.1529412, 0, 1, 1,
0.5378437, 0.7949625, 1.538629, 0.1568628, 0, 1, 1,
0.539214, -0.2352681, 2.720162, 0.1647059, 0, 1, 1,
0.5426896, -0.7970636, 2.161814, 0.1686275, 0, 1, 1,
0.54305, -0.4386947, 3.770647, 0.1764706, 0, 1, 1,
0.5456997, 0.746365, 2.079159, 0.1803922, 0, 1, 1,
0.5496148, 0.6550007, 0.581188, 0.1882353, 0, 1, 1,
0.559636, -0.3435562, 2.23347, 0.1921569, 0, 1, 1,
0.5651922, -0.04309904, 3.682845, 0.2, 0, 1, 1,
0.5670789, 0.2085043, 1.532491, 0.2078431, 0, 1, 1,
0.5687962, 0.05279232, 1.737371, 0.2117647, 0, 1, 1,
0.5692023, -0.2933409, 3.107397, 0.2196078, 0, 1, 1,
0.5714654, 0.6339615, 1.772486, 0.2235294, 0, 1, 1,
0.5726449, 0.227826, -0.1951464, 0.2313726, 0, 1, 1,
0.5731481, 1.094177, 0.6875203, 0.2352941, 0, 1, 1,
0.5739639, 1.491213, 0.6374264, 0.2431373, 0, 1, 1,
0.574229, 1.370356, 1.250209, 0.2470588, 0, 1, 1,
0.5758846, 0.001737526, 2.206235, 0.254902, 0, 1, 1,
0.5760404, -1.35923, 3.604187, 0.2588235, 0, 1, 1,
0.5818859, -0.4931616, 3.989642, 0.2666667, 0, 1, 1,
0.5843598, -0.6606193, 3.445289, 0.2705882, 0, 1, 1,
0.5864835, 1.064978, -0.6338589, 0.2784314, 0, 1, 1,
0.5887152, -1.612509, 3.372731, 0.282353, 0, 1, 1,
0.5905922, -1.01871, 2.947522, 0.2901961, 0, 1, 1,
0.6111072, 2.411403, 1.126021, 0.2941177, 0, 1, 1,
0.6180991, -0.5257258, 1.651603, 0.3019608, 0, 1, 1,
0.6248896, 0.8629367, 0.3724084, 0.3098039, 0, 1, 1,
0.6307297, 0.9540043, 1.357138, 0.3137255, 0, 1, 1,
0.6323395, 0.6096607, 0.7464312, 0.3215686, 0, 1, 1,
0.6351407, -0.4535724, 3.001078, 0.3254902, 0, 1, 1,
0.6385134, -1.278611, 1.962762, 0.3333333, 0, 1, 1,
0.6406628, -0.9557797, 1.386964, 0.3372549, 0, 1, 1,
0.6428312, -0.8708285, 3.03401, 0.345098, 0, 1, 1,
0.6444995, 0.949077, 0.0750685, 0.3490196, 0, 1, 1,
0.6459801, 1.58628, -0.98421, 0.3568628, 0, 1, 1,
0.6462101, 0.7632648, -0.6905227, 0.3607843, 0, 1, 1,
0.6558884, 0.3222891, 0.4602696, 0.3686275, 0, 1, 1,
0.6560321, -0.3429018, 4.3416, 0.372549, 0, 1, 1,
0.657806, 0.09042457, 1.17007, 0.3803922, 0, 1, 1,
0.6662315, 1.101858, 0.4597282, 0.3843137, 0, 1, 1,
0.668122, -0.1225089, 0.2143188, 0.3921569, 0, 1, 1,
0.6699722, -0.6656139, 2.057543, 0.3960784, 0, 1, 1,
0.6704603, 0.5468881, 2.606083, 0.4039216, 0, 1, 1,
0.6719792, 0.7892659, -0.2133257, 0.4117647, 0, 1, 1,
0.6739349, 0.2017583, 1.218488, 0.4156863, 0, 1, 1,
0.6743579, 0.1676827, 0.8230947, 0.4235294, 0, 1, 1,
0.6797181, 0.4623185, 1.056774, 0.427451, 0, 1, 1,
0.6818157, -1.172999, 3.054354, 0.4352941, 0, 1, 1,
0.6825786, -0.8202564, 3.289608, 0.4392157, 0, 1, 1,
0.685524, 0.8212602, -0.4812881, 0.4470588, 0, 1, 1,
0.6856371, 1.253897, 1.650171, 0.4509804, 0, 1, 1,
0.6865916, 0.616123, 2.722431, 0.4588235, 0, 1, 1,
0.6878785, 3.634061, -0.1244285, 0.4627451, 0, 1, 1,
0.6934521, 0.07214003, 1.259339, 0.4705882, 0, 1, 1,
0.6940481, 1.503796, 1.558375, 0.4745098, 0, 1, 1,
0.6954556, -0.1372614, 1.509133, 0.4823529, 0, 1, 1,
0.695557, 0.6042399, 1.965397, 0.4862745, 0, 1, 1,
0.695805, -1.093913, 1.228736, 0.4941176, 0, 1, 1,
0.6982663, -0.4366008, 3.048675, 0.5019608, 0, 1, 1,
0.6983258, 1.451963, 1.786241, 0.5058824, 0, 1, 1,
0.7009085, 0.5717418, -0.9355052, 0.5137255, 0, 1, 1,
0.7045748, 0.1965356, 1.440815, 0.5176471, 0, 1, 1,
0.7064021, -1.016505, 0.09801859, 0.5254902, 0, 1, 1,
0.7070174, -0.6243333, 1.904887, 0.5294118, 0, 1, 1,
0.7101017, -0.1954021, 2.709046, 0.5372549, 0, 1, 1,
0.7135418, -0.4878423, 1.256865, 0.5411765, 0, 1, 1,
0.7136494, 0.5965953, 0.4192243, 0.5490196, 0, 1, 1,
0.7167419, 0.3142512, 0.5999545, 0.5529412, 0, 1, 1,
0.719964, -0.9740925, 0.853888, 0.5607843, 0, 1, 1,
0.7204174, 0.4349062, 1.815354, 0.5647059, 0, 1, 1,
0.724573, -0.6030999, 4.427516, 0.572549, 0, 1, 1,
0.7272658, 1.296753, -0.009928762, 0.5764706, 0, 1, 1,
0.7275709, 0.4521936, 0.7129005, 0.5843138, 0, 1, 1,
0.7409975, -2.240376, 2.520908, 0.5882353, 0, 1, 1,
0.7418641, -0.2724335, 1.130758, 0.5960785, 0, 1, 1,
0.7440077, 2.625071, -0.1265549, 0.6039216, 0, 1, 1,
0.7516862, -1.523982, 3.215057, 0.6078432, 0, 1, 1,
0.752605, 2.283163, 0.669318, 0.6156863, 0, 1, 1,
0.7547074, 0.05324163, 0.3581213, 0.6196079, 0, 1, 1,
0.7549734, -0.6586408, 2.273231, 0.627451, 0, 1, 1,
0.7602619, 1.150484, 1.015852, 0.6313726, 0, 1, 1,
0.7621414, 0.8220537, -0.002548094, 0.6392157, 0, 1, 1,
0.7623782, -0.8988554, 2.566439, 0.6431373, 0, 1, 1,
0.7634216, -0.8623135, 4.150982, 0.6509804, 0, 1, 1,
0.7642707, 1.153095, 0.894608, 0.654902, 0, 1, 1,
0.7646615, 1.081183, -0.7166249, 0.6627451, 0, 1, 1,
0.7652894, -0.03075225, 2.311358, 0.6666667, 0, 1, 1,
0.7683184, 0.2641557, 0.3955554, 0.6745098, 0, 1, 1,
0.7697906, 1.178115, -0.9982867, 0.6784314, 0, 1, 1,
0.7702841, 1.073897, 0.5231871, 0.6862745, 0, 1, 1,
0.7723938, 0.7251974, 1.888288, 0.6901961, 0, 1, 1,
0.7770292, 0.4183524, 2.913773, 0.6980392, 0, 1, 1,
0.7802281, 0.7469484, 1.390939, 0.7058824, 0, 1, 1,
0.7832667, 1.630739, 1.153155, 0.7098039, 0, 1, 1,
0.7832968, -0.2237401, 1.417099, 0.7176471, 0, 1, 1,
0.783324, 0.8883703, 0.9088765, 0.7215686, 0, 1, 1,
0.78415, -0.6945394, 2.012634, 0.7294118, 0, 1, 1,
0.7873724, -0.502771, 0.944527, 0.7333333, 0, 1, 1,
0.7874311, 0.1361589, 1.217624, 0.7411765, 0, 1, 1,
0.7934285, -0.5972801, 0.7924424, 0.7450981, 0, 1, 1,
0.7954301, -0.6075985, 1.957194, 0.7529412, 0, 1, 1,
0.7968301, 0.846231, 0.153219, 0.7568628, 0, 1, 1,
0.8009997, -1.900908, 3.434842, 0.7647059, 0, 1, 1,
0.8033196, 0.06082052, 1.820934, 0.7686275, 0, 1, 1,
0.8096281, 2.189662, 2.055138, 0.7764706, 0, 1, 1,
0.8149196, 1.22356, 0.5721346, 0.7803922, 0, 1, 1,
0.8154839, 0.5607417, 2.014013, 0.7882353, 0, 1, 1,
0.8156005, -0.2389511, 1.787701, 0.7921569, 0, 1, 1,
0.8157481, 2.918531, 0.09280512, 0.8, 0, 1, 1,
0.8165097, 0.5140844, 2.17219, 0.8078431, 0, 1, 1,
0.8218458, 0.8779026, -1.169451, 0.8117647, 0, 1, 1,
0.8238907, -0.3786441, 2.471712, 0.8196079, 0, 1, 1,
0.8327031, -0.8744318, 2.329844, 0.8235294, 0, 1, 1,
0.8351025, -1.711816, 4.700564, 0.8313726, 0, 1, 1,
0.8359959, -0.644643, 3.042864, 0.8352941, 0, 1, 1,
0.8369287, -0.9809123, 2.593997, 0.8431373, 0, 1, 1,
0.8370422, -1.983383, 3.478599, 0.8470588, 0, 1, 1,
0.8433148, -1.336957, 3.621129, 0.854902, 0, 1, 1,
0.8465027, -0.7086064, 2.767405, 0.8588235, 0, 1, 1,
0.8470473, -0.6374425, 1.073596, 0.8666667, 0, 1, 1,
0.8488183, -1.299065, 1.480447, 0.8705882, 0, 1, 1,
0.8497643, -0.3967146, 2.113146, 0.8784314, 0, 1, 1,
0.8505929, -1.335539, 3.446684, 0.8823529, 0, 1, 1,
0.8510659, 2.151573, 1.660684, 0.8901961, 0, 1, 1,
0.8526794, 1.422384, 0.7240015, 0.8941177, 0, 1, 1,
0.8647369, -0.3431807, 3.286876, 0.9019608, 0, 1, 1,
0.8664595, 0.8919195, 0.8484815, 0.9098039, 0, 1, 1,
0.8710944, 0.6661131, 0.6128076, 0.9137255, 0, 1, 1,
0.8725286, 0.3266478, 1.176779, 0.9215686, 0, 1, 1,
0.8785098, -0.2958088, 1.802408, 0.9254902, 0, 1, 1,
0.8812129, -1.54926, 1.665047, 0.9333333, 0, 1, 1,
0.8818524, 1.464214, 0.5931073, 0.9372549, 0, 1, 1,
0.8828353, -0.4668829, 1.758078, 0.945098, 0, 1, 1,
0.8886755, 2.455583, 0.02394971, 0.9490196, 0, 1, 1,
0.8911827, -0.9394774, 1.769607, 0.9568627, 0, 1, 1,
0.893245, 0.8000731, -0.04245176, 0.9607843, 0, 1, 1,
0.8935297, 1.65207, 1.883842, 0.9686275, 0, 1, 1,
0.8962778, -0.426731, 0.173927, 0.972549, 0, 1, 1,
0.8977856, -0.132439, 2.084523, 0.9803922, 0, 1, 1,
0.9054844, 0.275062, 1.764186, 0.9843137, 0, 1, 1,
0.9095401, 0.8206016, -0.5128213, 0.9921569, 0, 1, 1,
0.9128903, 0.5555522, 0.3056647, 0.9960784, 0, 1, 1,
0.91615, 1.312865, -1.215119, 1, 0, 0.9960784, 1,
0.926375, -0.6404717, 2.393181, 1, 0, 0.9882353, 1,
0.9335486, 0.2823253, 1.865449, 1, 0, 0.9843137, 1,
0.9350519, 0.3188885, 0.5216289, 1, 0, 0.9764706, 1,
0.9412912, -1.097533, 3.22301, 1, 0, 0.972549, 1,
0.9426972, 0.6448667, 1.450416, 1, 0, 0.9647059, 1,
0.9480098, 1.75185, 0.3508263, 1, 0, 0.9607843, 1,
0.9522282, 1.408916, 0.1248824, 1, 0, 0.9529412, 1,
0.9527183, 0.6683158, 2.471558, 1, 0, 0.9490196, 1,
0.9531934, 0.5166018, 1.135817, 1, 0, 0.9411765, 1,
0.9607029, -1.242985, 3.046898, 1, 0, 0.9372549, 1,
0.968905, -2.135527, 2.81834, 1, 0, 0.9294118, 1,
0.9776349, 0.3245257, 2.598172, 1, 0, 0.9254902, 1,
0.9796154, 0.6888824, 1.520826, 1, 0, 0.9176471, 1,
0.9797832, -0.5490276, 1.381336, 1, 0, 0.9137255, 1,
0.980212, -0.01024799, 1.721363, 1, 0, 0.9058824, 1,
0.9804056, 0.7660104, 0.9263382, 1, 0, 0.9019608, 1,
0.9811435, -0.2581152, 1.629003, 1, 0, 0.8941177, 1,
0.9886089, -1.378332, 3.337296, 1, 0, 0.8862745, 1,
0.9921896, 0.5409125, 0.3043276, 1, 0, 0.8823529, 1,
1.000869, 0.010043, 0.5750433, 1, 0, 0.8745098, 1,
1.009731, -0.299206, 2.199347, 1, 0, 0.8705882, 1,
1.010865, -0.2987295, 1.648951, 1, 0, 0.8627451, 1,
1.011505, -1.709032, 3.200799, 1, 0, 0.8588235, 1,
1.023264, 1.548122, 1.704962, 1, 0, 0.8509804, 1,
1.03385, 1.272075, 0.6074247, 1, 0, 0.8470588, 1,
1.039378, -2.740263, 2.898533, 1, 0, 0.8392157, 1,
1.043567, 0.8342603, 0.1827442, 1, 0, 0.8352941, 1,
1.044926, -1.857931, 1.841456, 1, 0, 0.827451, 1,
1.046004, -1.391276, 1.668771, 1, 0, 0.8235294, 1,
1.048255, 0.004668281, 1.791425, 1, 0, 0.8156863, 1,
1.048298, 0.8118867, 1.325357, 1, 0, 0.8117647, 1,
1.058801, -0.502196, 1.697436, 1, 0, 0.8039216, 1,
1.06145, 2.812396, 1.477393, 1, 0, 0.7960784, 1,
1.069327, 1.092788, 0.5117425, 1, 0, 0.7921569, 1,
1.071428, -2.581608, 5.118909, 1, 0, 0.7843137, 1,
1.075532, 0.7863067, 1.201026, 1, 0, 0.7803922, 1,
1.075946, 0.4544213, 1.034889, 1, 0, 0.772549, 1,
1.076052, 1.497492, -1.008429, 1, 0, 0.7686275, 1,
1.081305, -0.9401957, 1.874393, 1, 0, 0.7607843, 1,
1.084222, 0.4235504, 0.4796152, 1, 0, 0.7568628, 1,
1.086432, 0.3319258, 2.643831, 1, 0, 0.7490196, 1,
1.089302, 0.02256998, -0.1475188, 1, 0, 0.7450981, 1,
1.089524, 1.442834, -0.05159998, 1, 0, 0.7372549, 1,
1.095266, -0.230504, 1.530649, 1, 0, 0.7333333, 1,
1.095666, -0.4625311, 1.359779, 1, 0, 0.7254902, 1,
1.116002, -0.1077722, 1.726942, 1, 0, 0.7215686, 1,
1.119301, 0.3923802, 0.3732873, 1, 0, 0.7137255, 1,
1.128897, -0.09973752, 1.928154, 1, 0, 0.7098039, 1,
1.129951, -0.4454573, 1.036852, 1, 0, 0.7019608, 1,
1.135386, 1.867473, 0.5640897, 1, 0, 0.6941177, 1,
1.13911, -2.200741, 2.469385, 1, 0, 0.6901961, 1,
1.139699, 0.6138238, 1.792476, 1, 0, 0.682353, 1,
1.141737, 1.617457, 0.2514516, 1, 0, 0.6784314, 1,
1.143054, -0.5609521, 1.40117, 1, 0, 0.6705883, 1,
1.150766, 1.082203, 0.5740121, 1, 0, 0.6666667, 1,
1.151981, 0.3060308, 1.712963, 1, 0, 0.6588235, 1,
1.161686, -2.826393, 2.556494, 1, 0, 0.654902, 1,
1.164974, 1.276076, 0.3471958, 1, 0, 0.6470588, 1,
1.194772, -2.021285, 2.55576, 1, 0, 0.6431373, 1,
1.207777, 0.1832024, 2.65511, 1, 0, 0.6352941, 1,
1.217361, 0.4469349, 1.904585, 1, 0, 0.6313726, 1,
1.223689, 1.384106, -0.0347366, 1, 0, 0.6235294, 1,
1.225001, -0.6971875, 2.460613, 1, 0, 0.6196079, 1,
1.228377, 1.60678, 1.138923, 1, 0, 0.6117647, 1,
1.2288, -0.7418028, 1.555688, 1, 0, 0.6078432, 1,
1.23939, -0.2962177, 0.5148165, 1, 0, 0.6, 1,
1.243829, -0.5241448, 3.12857, 1, 0, 0.5921569, 1,
1.245963, -1.079036, 2.659288, 1, 0, 0.5882353, 1,
1.26357, -0.1893899, 2.314872, 1, 0, 0.5803922, 1,
1.268896, -0.3230295, 2.718868, 1, 0, 0.5764706, 1,
1.282713, 0.3092684, 1.736433, 1, 0, 0.5686275, 1,
1.288336, -1.12217, 2.042471, 1, 0, 0.5647059, 1,
1.313068, -1.710506, 2.508848, 1, 0, 0.5568628, 1,
1.317197, -0.9906893, 1.103708, 1, 0, 0.5529412, 1,
1.349111, 0.6888061, 0.5092884, 1, 0, 0.5450981, 1,
1.349998, 0.3975523, 0.350212, 1, 0, 0.5411765, 1,
1.354284, -1.096211, 2.921359, 1, 0, 0.5333334, 1,
1.369731, -0.1407636, 0.2460863, 1, 0, 0.5294118, 1,
1.378123, 1.297285, 0.989415, 1, 0, 0.5215687, 1,
1.382336, -0.3864175, 1.210822, 1, 0, 0.5176471, 1,
1.38252, 0.2928736, 2.002401, 1, 0, 0.509804, 1,
1.383705, 0.5923058, 0.5024847, 1, 0, 0.5058824, 1,
1.400648, -0.1808508, 0.662894, 1, 0, 0.4980392, 1,
1.410202, -0.2091277, 2.336177, 1, 0, 0.4901961, 1,
1.446734, -0.7010226, 1.263875, 1, 0, 0.4862745, 1,
1.447356, 0.7125575, 1.958997, 1, 0, 0.4784314, 1,
1.45584, 0.9274381, 0.7480622, 1, 0, 0.4745098, 1,
1.467335, 0.1241182, 1.145955, 1, 0, 0.4666667, 1,
1.469229, 2.377825, 1.670186, 1, 0, 0.4627451, 1,
1.476031, -0.2117393, 1.935912, 1, 0, 0.454902, 1,
1.476095, 1.234104, 1.628404, 1, 0, 0.4509804, 1,
1.47763, 2.596265, 0.2769005, 1, 0, 0.4431373, 1,
1.490838, -0.4684694, 1.981593, 1, 0, 0.4392157, 1,
1.491035, 0.4405818, 0.1633489, 1, 0, 0.4313726, 1,
1.503303, -0.3259061, 0.05117844, 1, 0, 0.427451, 1,
1.510868, -0.1752654, 1.681676, 1, 0, 0.4196078, 1,
1.512672, -1.18004, 3.173922, 1, 0, 0.4156863, 1,
1.534261, -0.6047153, 0.6390067, 1, 0, 0.4078431, 1,
1.537585, -1.198597, 0.5687496, 1, 0, 0.4039216, 1,
1.544274, -0.3515314, 1.656685, 1, 0, 0.3960784, 1,
1.548103, -1.345999, 2.966096, 1, 0, 0.3882353, 1,
1.571118, 0.5550049, 0.4469506, 1, 0, 0.3843137, 1,
1.573413, 0.6028177, 1.07391, 1, 0, 0.3764706, 1,
1.599219, 0.1381459, 1.235992, 1, 0, 0.372549, 1,
1.602882, 1.16069, -0.8430016, 1, 0, 0.3647059, 1,
1.608789, -1.839496, 3.644903, 1, 0, 0.3607843, 1,
1.613615, -0.7655049, 2.938782, 1, 0, 0.3529412, 1,
1.625532, 0.7301587, 0.00568248, 1, 0, 0.3490196, 1,
1.632122, -0.8378481, 2.647222, 1, 0, 0.3411765, 1,
1.632679, -0.3099806, 2.897596, 1, 0, 0.3372549, 1,
1.662564, 0.2451457, 0.9129276, 1, 0, 0.3294118, 1,
1.667502, 0.7406241, 0.9278075, 1, 0, 0.3254902, 1,
1.674702, -0.6554682, 3.565527, 1, 0, 0.3176471, 1,
1.675889, -0.8824162, 1.603888, 1, 0, 0.3137255, 1,
1.675984, 0.6819267, -0.3688489, 1, 0, 0.3058824, 1,
1.679169, 1.527361, -0.6550781, 1, 0, 0.2980392, 1,
1.681523, 0.641699, 2.591797, 1, 0, 0.2941177, 1,
1.699769, -0.2239721, 0.1222902, 1, 0, 0.2862745, 1,
1.731497, -0.2310752, 0.2010813, 1, 0, 0.282353, 1,
1.740964, -1.239315, 2.171942, 1, 0, 0.2745098, 1,
1.750493, -1.032677, 3.501707, 1, 0, 0.2705882, 1,
1.758366, -0.6151174, 1.059007, 1, 0, 0.2627451, 1,
1.761524, 2.564396, 1.834939, 1, 0, 0.2588235, 1,
1.762089, 1.561309, 0.06867811, 1, 0, 0.2509804, 1,
1.78722, -0.4981205, 3.269522, 1, 0, 0.2470588, 1,
1.813884, 1.295169, 0.7784075, 1, 0, 0.2392157, 1,
1.816323, 0.7998773, 1.751302, 1, 0, 0.2352941, 1,
1.839902, 1.157582, 0.7665274, 1, 0, 0.227451, 1,
1.859018, 1.227122, -0.3887702, 1, 0, 0.2235294, 1,
1.865018, -0.5945933, 1.449903, 1, 0, 0.2156863, 1,
1.870657, 1.040149, 2.482481, 1, 0, 0.2117647, 1,
1.878722, -0.1756618, 2.905877, 1, 0, 0.2039216, 1,
1.888019, 1.412617, 1.370242, 1, 0, 0.1960784, 1,
1.892775, 0.8836327, -0.01748163, 1, 0, 0.1921569, 1,
1.914126, 2.150966, -0.9235345, 1, 0, 0.1843137, 1,
1.933942, -1.647053, 2.210567, 1, 0, 0.1803922, 1,
2.021185, 1.972593, 1.814219, 1, 0, 0.172549, 1,
2.031885, -0.7629519, 2.974318, 1, 0, 0.1686275, 1,
2.054793, -1.270389, 2.280596, 1, 0, 0.1607843, 1,
2.074396, 0.3564149, 1.07574, 1, 0, 0.1568628, 1,
2.076913, 0.5375805, -0.4360482, 1, 0, 0.1490196, 1,
2.077998, -0.003687079, 3.76516, 1, 0, 0.145098, 1,
2.079171, -0.3136593, 1.34764, 1, 0, 0.1372549, 1,
2.109797, 0.6349013, 0.7172894, 1, 0, 0.1333333, 1,
2.146922, 0.6458189, 1.196903, 1, 0, 0.1254902, 1,
2.162388, 0.9866333, 0.9118756, 1, 0, 0.1215686, 1,
2.223403, 0.8265008, 4.478334, 1, 0, 0.1137255, 1,
2.238339, 0.1056978, 0.8932622, 1, 0, 0.1098039, 1,
2.250582, -1.50098, 1.804331, 1, 0, 0.1019608, 1,
2.25106, 0.3785017, 1.925138, 1, 0, 0.09411765, 1,
2.255279, 0.006988458, 1.054471, 1, 0, 0.09019608, 1,
2.278404, 1.087598, 1.06952, 1, 0, 0.08235294, 1,
2.290685, 0.6502925, 0.4875236, 1, 0, 0.07843138, 1,
2.299562, -1.023655, 1.802046, 1, 0, 0.07058824, 1,
2.306785, -0.4990777, 1.539631, 1, 0, 0.06666667, 1,
2.311541, -0.7648028, 2.756859, 1, 0, 0.05882353, 1,
2.316694, 1.416168, 1.076956, 1, 0, 0.05490196, 1,
2.327242, 0.2115476, 0.203475, 1, 0, 0.04705882, 1,
2.344858, -1.334184, 2.616406, 1, 0, 0.04313726, 1,
2.485738, -2.724673, 3.464655, 1, 0, 0.03529412, 1,
2.493021, 0.659763, 1.537947, 1, 0, 0.03137255, 1,
2.757507, 0.8311802, 0.7105678, 1, 0, 0.02352941, 1,
2.969996, 1.109544, 0.4912789, 1, 0, 0.01960784, 1,
3.417114, -0.2996962, 3.665107, 1, 0, 0.01176471, 1,
3.755711, -0.1002042, 1.81629, 1, 0, 0.007843138, 1
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
0.3544693, -3.976866, -7.256753, 0, -0.5, 0.5, 0.5,
0.3544693, -3.976866, -7.256753, 1, -0.5, 0.5, 0.5,
0.3544693, -3.976866, -7.256753, 1, 1.5, 0.5, 0.5,
0.3544693, -3.976866, -7.256753, 0, 1.5, 0.5, 0.5
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
-4.199794, 0.3801373, -7.256753, 0, -0.5, 0.5, 0.5,
-4.199794, 0.3801373, -7.256753, 1, -0.5, 0.5, 0.5,
-4.199794, 0.3801373, -7.256753, 1, 1.5, 0.5, 0.5,
-4.199794, 0.3801373, -7.256753, 0, 1.5, 0.5, 0.5
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
-4.199794, -3.976866, -0.006696224, 0, -0.5, 0.5, 0.5,
-4.199794, -3.976866, -0.006696224, 1, -0.5, 0.5, 0.5,
-4.199794, -3.976866, -0.006696224, 1, 1.5, 0.5, 0.5,
-4.199794, -3.976866, -0.006696224, 0, 1.5, 0.5, 0.5
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
-3, -2.971404, -5.583663,
3, -2.971404, -5.583663,
-3, -2.971404, -5.583663,
-3, -3.138981, -5.862511,
-2, -2.971404, -5.583663,
-2, -3.138981, -5.862511,
-1, -2.971404, -5.583663,
-1, -3.138981, -5.862511,
0, -2.971404, -5.583663,
0, -3.138981, -5.862511,
1, -2.971404, -5.583663,
1, -3.138981, -5.862511,
2, -2.971404, -5.583663,
2, -3.138981, -5.862511,
3, -2.971404, -5.583663,
3, -3.138981, -5.862511
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
-3, -3.474135, -6.420208, 0, -0.5, 0.5, 0.5,
-3, -3.474135, -6.420208, 1, -0.5, 0.5, 0.5,
-3, -3.474135, -6.420208, 1, 1.5, 0.5, 0.5,
-3, -3.474135, -6.420208, 0, 1.5, 0.5, 0.5,
-2, -3.474135, -6.420208, 0, -0.5, 0.5, 0.5,
-2, -3.474135, -6.420208, 1, -0.5, 0.5, 0.5,
-2, -3.474135, -6.420208, 1, 1.5, 0.5, 0.5,
-2, -3.474135, -6.420208, 0, 1.5, 0.5, 0.5,
-1, -3.474135, -6.420208, 0, -0.5, 0.5, 0.5,
-1, -3.474135, -6.420208, 1, -0.5, 0.5, 0.5,
-1, -3.474135, -6.420208, 1, 1.5, 0.5, 0.5,
-1, -3.474135, -6.420208, 0, 1.5, 0.5, 0.5,
0, -3.474135, -6.420208, 0, -0.5, 0.5, 0.5,
0, -3.474135, -6.420208, 1, -0.5, 0.5, 0.5,
0, -3.474135, -6.420208, 1, 1.5, 0.5, 0.5,
0, -3.474135, -6.420208, 0, 1.5, 0.5, 0.5,
1, -3.474135, -6.420208, 0, -0.5, 0.5, 0.5,
1, -3.474135, -6.420208, 1, -0.5, 0.5, 0.5,
1, -3.474135, -6.420208, 1, 1.5, 0.5, 0.5,
1, -3.474135, -6.420208, 0, 1.5, 0.5, 0.5,
2, -3.474135, -6.420208, 0, -0.5, 0.5, 0.5,
2, -3.474135, -6.420208, 1, -0.5, 0.5, 0.5,
2, -3.474135, -6.420208, 1, 1.5, 0.5, 0.5,
2, -3.474135, -6.420208, 0, 1.5, 0.5, 0.5,
3, -3.474135, -6.420208, 0, -0.5, 0.5, 0.5,
3, -3.474135, -6.420208, 1, -0.5, 0.5, 0.5,
3, -3.474135, -6.420208, 1, 1.5, 0.5, 0.5,
3, -3.474135, -6.420208, 0, 1.5, 0.5, 0.5
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
-3.14881, -2, -5.583663,
-3.14881, 3, -5.583663,
-3.14881, -2, -5.583663,
-3.323974, -2, -5.862511,
-3.14881, -1, -5.583663,
-3.323974, -1, -5.862511,
-3.14881, 0, -5.583663,
-3.323974, 0, -5.862511,
-3.14881, 1, -5.583663,
-3.323974, 1, -5.862511,
-3.14881, 2, -5.583663,
-3.323974, 2, -5.862511,
-3.14881, 3, -5.583663,
-3.323974, 3, -5.862511
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
-3.674302, -2, -6.420208, 0, -0.5, 0.5, 0.5,
-3.674302, -2, -6.420208, 1, -0.5, 0.5, 0.5,
-3.674302, -2, -6.420208, 1, 1.5, 0.5, 0.5,
-3.674302, -2, -6.420208, 0, 1.5, 0.5, 0.5,
-3.674302, -1, -6.420208, 0, -0.5, 0.5, 0.5,
-3.674302, -1, -6.420208, 1, -0.5, 0.5, 0.5,
-3.674302, -1, -6.420208, 1, 1.5, 0.5, 0.5,
-3.674302, -1, -6.420208, 0, 1.5, 0.5, 0.5,
-3.674302, 0, -6.420208, 0, -0.5, 0.5, 0.5,
-3.674302, 0, -6.420208, 1, -0.5, 0.5, 0.5,
-3.674302, 0, -6.420208, 1, 1.5, 0.5, 0.5,
-3.674302, 0, -6.420208, 0, 1.5, 0.5, 0.5,
-3.674302, 1, -6.420208, 0, -0.5, 0.5, 0.5,
-3.674302, 1, -6.420208, 1, -0.5, 0.5, 0.5,
-3.674302, 1, -6.420208, 1, 1.5, 0.5, 0.5,
-3.674302, 1, -6.420208, 0, 1.5, 0.5, 0.5,
-3.674302, 2, -6.420208, 0, -0.5, 0.5, 0.5,
-3.674302, 2, -6.420208, 1, -0.5, 0.5, 0.5,
-3.674302, 2, -6.420208, 1, 1.5, 0.5, 0.5,
-3.674302, 2, -6.420208, 0, 1.5, 0.5, 0.5,
-3.674302, 3, -6.420208, 0, -0.5, 0.5, 0.5,
-3.674302, 3, -6.420208, 1, -0.5, 0.5, 0.5,
-3.674302, 3, -6.420208, 1, 1.5, 0.5, 0.5,
-3.674302, 3, -6.420208, 0, 1.5, 0.5, 0.5
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
-3.14881, -2.971404, -4,
-3.14881, -2.971404, 4,
-3.14881, -2.971404, -4,
-3.323974, -3.138981, -4,
-3.14881, -2.971404, -2,
-3.323974, -3.138981, -2,
-3.14881, -2.971404, 0,
-3.323974, -3.138981, 0,
-3.14881, -2.971404, 2,
-3.323974, -3.138981, 2,
-3.14881, -2.971404, 4,
-3.323974, -3.138981, 4
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
-3.674302, -3.474135, -4, 0, -0.5, 0.5, 0.5,
-3.674302, -3.474135, -4, 1, -0.5, 0.5, 0.5,
-3.674302, -3.474135, -4, 1, 1.5, 0.5, 0.5,
-3.674302, -3.474135, -4, 0, 1.5, 0.5, 0.5,
-3.674302, -3.474135, -2, 0, -0.5, 0.5, 0.5,
-3.674302, -3.474135, -2, 1, -0.5, 0.5, 0.5,
-3.674302, -3.474135, -2, 1, 1.5, 0.5, 0.5,
-3.674302, -3.474135, -2, 0, 1.5, 0.5, 0.5,
-3.674302, -3.474135, 0, 0, -0.5, 0.5, 0.5,
-3.674302, -3.474135, 0, 1, -0.5, 0.5, 0.5,
-3.674302, -3.474135, 0, 1, 1.5, 0.5, 0.5,
-3.674302, -3.474135, 0, 0, 1.5, 0.5, 0.5,
-3.674302, -3.474135, 2, 0, -0.5, 0.5, 0.5,
-3.674302, -3.474135, 2, 1, -0.5, 0.5, 0.5,
-3.674302, -3.474135, 2, 1, 1.5, 0.5, 0.5,
-3.674302, -3.474135, 2, 0, 1.5, 0.5, 0.5,
-3.674302, -3.474135, 4, 0, -0.5, 0.5, 0.5,
-3.674302, -3.474135, 4, 1, -0.5, 0.5, 0.5,
-3.674302, -3.474135, 4, 1, 1.5, 0.5, 0.5,
-3.674302, -3.474135, 4, 0, 1.5, 0.5, 0.5
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
-3.14881, -2.971404, -5.583663,
-3.14881, 3.731678, -5.583663,
-3.14881, -2.971404, 5.570271,
-3.14881, 3.731678, 5.570271,
-3.14881, -2.971404, -5.583663,
-3.14881, -2.971404, 5.570271,
-3.14881, 3.731678, -5.583663,
-3.14881, 3.731678, 5.570271,
-3.14881, -2.971404, -5.583663,
3.857749, -2.971404, -5.583663,
-3.14881, -2.971404, 5.570271,
3.857749, -2.971404, 5.570271,
-3.14881, 3.731678, -5.583663,
3.857749, 3.731678, -5.583663,
-3.14881, 3.731678, 5.570271,
3.857749, 3.731678, 5.570271,
3.857749, -2.971404, -5.583663,
3.857749, 3.731678, -5.583663,
3.857749, -2.971404, 5.570271,
3.857749, 3.731678, 5.570271,
3.857749, -2.971404, -5.583663,
3.857749, -2.971404, 5.570271,
3.857749, 3.731678, -5.583663,
3.857749, 3.731678, 5.570271
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
var radius = 7.891962;
var distance = 35.11223;
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
mvMatrix.translate( -0.3544693, -0.3801373, 0.006696224 );
mvMatrix.scale( 1.217851, 1.272988, 0.7650166 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.11223);
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
Isoxathion<-read.table("Isoxathion.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Isoxathion$V2
```

```
## Error in eval(expr, envir, enclos): object 'Isoxathion' not found
```

```r
y<-Isoxathion$V3
```

```
## Error in eval(expr, envir, enclos): object 'Isoxathion' not found
```

```r
z<-Isoxathion$V4
```

```
## Error in eval(expr, envir, enclos): object 'Isoxathion' not found
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
-3.046773, 0.8640466, -1.789264, 0, 0, 1, 1, 1,
-2.439419, 0.5612466, -1.796879, 1, 0, 0, 1, 1,
-2.420379, 1.233776, -0.8363043, 1, 0, 0, 1, 1,
-2.36981, 0.1122669, -2.136828, 1, 0, 0, 1, 1,
-2.318374, 0.6184552, -0.5460017, 1, 0, 0, 1, 1,
-2.29409, -0.6543545, -1.69394, 1, 0, 0, 1, 1,
-2.287324, 1.25436, -0.6888842, 0, 0, 0, 1, 1,
-2.210675, -0.3244283, -1.144672, 0, 0, 0, 1, 1,
-2.158902, 1.584844, -2.358385, 0, 0, 0, 1, 1,
-2.115493, 0.07461839, -1.320087, 0, 0, 0, 1, 1,
-2.108449, -0.01104394, -1.264596, 0, 0, 0, 1, 1,
-2.101624, 0.8960553, -1.628189, 0, 0, 0, 1, 1,
-2.101137, -2.110734, -2.761379, 0, 0, 0, 1, 1,
-2.06112, 0.6219587, -0.4739145, 1, 1, 1, 1, 1,
-1.961587, -0.6560015, -0.5154221, 1, 1, 1, 1, 1,
-1.960717, 1.310555, -1.124791, 1, 1, 1, 1, 1,
-1.943771, -0.3866785, -0.8858105, 1, 1, 1, 1, 1,
-1.943751, -0.6604606, -2.421519, 1, 1, 1, 1, 1,
-1.94242, 1.554726, -0.04754906, 1, 1, 1, 1, 1,
-1.937919, 0.1003426, -0.7644765, 1, 1, 1, 1, 1,
-1.91789, -0.3847563, -1.574314, 1, 1, 1, 1, 1,
-1.901694, -0.8111567, -2.007478, 1, 1, 1, 1, 1,
-1.851565, -0.3415978, -0.6096197, 1, 1, 1, 1, 1,
-1.825575, -0.142354, -2.10244, 1, 1, 1, 1, 1,
-1.808079, 0.8920787, -1.175717, 1, 1, 1, 1, 1,
-1.775818, -0.07353348, -0.1258448, 1, 1, 1, 1, 1,
-1.768451, -0.4888435, -0.8972823, 1, 1, 1, 1, 1,
-1.763474, 0.3645622, -0.3741465, 1, 1, 1, 1, 1,
-1.759944, -0.2895827, -1.379368, 0, 0, 1, 1, 1,
-1.754611, -0.8135278, -0.9219726, 1, 0, 0, 1, 1,
-1.747668, -0.5543256, -2.565925, 1, 0, 0, 1, 1,
-1.745645, -0.8008537, -1.399756, 1, 0, 0, 1, 1,
-1.728402, 0.004090263, -2.306341, 1, 0, 0, 1, 1,
-1.714468, -0.1795344, -1.65493, 1, 0, 0, 1, 1,
-1.709296, -0.6859496, -2.692387, 0, 0, 0, 1, 1,
-1.69112, 0.3020355, -2.384892, 0, 0, 0, 1, 1,
-1.684885, -0.5098822, -2.547873, 0, 0, 0, 1, 1,
-1.678327, 0.2592271, -1.408341, 0, 0, 0, 1, 1,
-1.674002, -1.424337, -1.62953, 0, 0, 0, 1, 1,
-1.661469, 0.8413778, 0.6050512, 0, 0, 0, 1, 1,
-1.654946, 1.019564, -1.757406, 0, 0, 0, 1, 1,
-1.648886, 0.05681892, -0.4615865, 1, 1, 1, 1, 1,
-1.647806, -0.3393377, -1.87993, 1, 1, 1, 1, 1,
-1.647684, 0.594502, -2.197095, 1, 1, 1, 1, 1,
-1.640543, -1.239334, -1.189596, 1, 1, 1, 1, 1,
-1.632529, -0.6994434, -0.7704383, 1, 1, 1, 1, 1,
-1.614964, -0.5155788, -0.6884977, 1, 1, 1, 1, 1,
-1.599996, -0.9580353, -2.760511, 1, 1, 1, 1, 1,
-1.591618, -0.4497958, -1.383889, 1, 1, 1, 1, 1,
-1.549674, -2.873786, -2.883919, 1, 1, 1, 1, 1,
-1.541339, 0.8014168, -2.182777, 1, 1, 1, 1, 1,
-1.522294, 1.67424, -2.943326, 1, 1, 1, 1, 1,
-1.479892, -0.6743097, -3.326381, 1, 1, 1, 1, 1,
-1.479305, -2.722114, -1.772562, 1, 1, 1, 1, 1,
-1.476846, -1.283462, -3.440859, 1, 1, 1, 1, 1,
-1.476529, 0.4599662, -1.461483, 1, 1, 1, 1, 1,
-1.46381, 0.7469117, -1.680237, 0, 0, 1, 1, 1,
-1.448004, -0.4913807, -2.498674, 1, 0, 0, 1, 1,
-1.447929, -0.9546172, -1.338783, 1, 0, 0, 1, 1,
-1.446889, -0.910002, -1.161275, 1, 0, 0, 1, 1,
-1.437739, 0.7765714, -0.203067, 1, 0, 0, 1, 1,
-1.434212, -2.410828, -1.978675, 1, 0, 0, 1, 1,
-1.434165, 0.8428577, -0.4732176, 0, 0, 0, 1, 1,
-1.408823, 1.07064, -0.5702209, 0, 0, 0, 1, 1,
-1.40156, 0.1935469, -0.9413931, 0, 0, 0, 1, 1,
-1.387995, -0.03953442, -0.6983876, 0, 0, 0, 1, 1,
-1.38306, 0.01056872, -0.2887009, 0, 0, 0, 1, 1,
-1.376948, 0.4906361, -3.233007, 0, 0, 0, 1, 1,
-1.37694, -0.8259924, -4.869796, 0, 0, 0, 1, 1,
-1.375563, 0.7367797, -1.513333, 1, 1, 1, 1, 1,
-1.369623, 0.1799738, -0.3743162, 1, 1, 1, 1, 1,
-1.363041, -0.1773309, 0.3550152, 1, 1, 1, 1, 1,
-1.360021, 2.238743, 0.853548, 1, 1, 1, 1, 1,
-1.347915, -0.5484191, -1.78792, 1, 1, 1, 1, 1,
-1.345034, 1.299668, -1.440659, 1, 1, 1, 1, 1,
-1.340074, 0.0542232, -0.2624474, 1, 1, 1, 1, 1,
-1.336392, -0.9137251, -1.932864, 1, 1, 1, 1, 1,
-1.323151, -0.4442747, -3.240355, 1, 1, 1, 1, 1,
-1.316762, -1.030244, -1.273091, 1, 1, 1, 1, 1,
-1.310505, 0.3704721, -2.010869, 1, 1, 1, 1, 1,
-1.310239, 0.3880793, -1.903749, 1, 1, 1, 1, 1,
-1.302532, 0.5611079, -0.9195367, 1, 1, 1, 1, 1,
-1.298328, 0.08398479, -2.91034, 1, 1, 1, 1, 1,
-1.295406, 0.6616734, -2.590351, 1, 1, 1, 1, 1,
-1.295027, 0.328627, -0.05015656, 0, 0, 1, 1, 1,
-1.292125, 1.97384, -0.4815367, 1, 0, 0, 1, 1,
-1.283978, -0.1365659, -3.151042, 1, 0, 0, 1, 1,
-1.28131, -1.935773, -2.922503, 1, 0, 0, 1, 1,
-1.281217, -0.4017448, -3.011771, 1, 0, 0, 1, 1,
-1.278279, 1.428003, -1.845135, 1, 0, 0, 1, 1,
-1.277503, 0.2369217, -1.208416, 0, 0, 0, 1, 1,
-1.273139, 0.1570522, -2.047853, 0, 0, 0, 1, 1,
-1.27049, -0.6966171, -2.996521, 0, 0, 0, 1, 1,
-1.253148, -0.3295216, -3.331216, 0, 0, 0, 1, 1,
-1.25154, 0.6916769, -0.3377769, 0, 0, 0, 1, 1,
-1.244158, -0.4915951, -3.19663, 0, 0, 0, 1, 1,
-1.242694, -0.07271861, -1.880384, 0, 0, 0, 1, 1,
-1.21886, -1.89682, -3.021495, 1, 1, 1, 1, 1,
-1.215306, 0.474741, -1.922547, 1, 1, 1, 1, 1,
-1.210265, 0.7677296, 0.9062904, 1, 1, 1, 1, 1,
-1.206158, 0.9761481, 0.5365813, 1, 1, 1, 1, 1,
-1.204977, -2.152075, -2.886482, 1, 1, 1, 1, 1,
-1.187447, 0.7272006, -1.233107, 1, 1, 1, 1, 1,
-1.183538, 0.4147276, -0.2163948, 1, 1, 1, 1, 1,
-1.175609, 1.515738, -2.048625, 1, 1, 1, 1, 1,
-1.172938, -0.7283234, -0.8932409, 1, 1, 1, 1, 1,
-1.172904, -0.1090586, -0.1597085, 1, 1, 1, 1, 1,
-1.165676, 2.435644, -0.9175314, 1, 1, 1, 1, 1,
-1.160228, -1.041538, -2.36586, 1, 1, 1, 1, 1,
-1.158969, 0.112781, -1.253617, 1, 1, 1, 1, 1,
-1.146691, 1.307027, -0.4008474, 1, 1, 1, 1, 1,
-1.146556, -1.83922, -2.274856, 1, 1, 1, 1, 1,
-1.146272, -0.1103049, -1.003379, 0, 0, 1, 1, 1,
-1.131772, 0.1830728, -1.331006, 1, 0, 0, 1, 1,
-1.107667, -0.7175161, -2.082037, 1, 0, 0, 1, 1,
-1.105562, 0.6057995, -0.6238239, 1, 0, 0, 1, 1,
-1.103852, -0.1364446, -1.424254, 1, 0, 0, 1, 1,
-1.103264, -0.2747653, -0.5568038, 1, 0, 0, 1, 1,
-1.102297, -1.1144, -1.266562, 0, 0, 0, 1, 1,
-1.101991, -0.515775, -1.431418, 0, 0, 0, 1, 1,
-1.08947, -1.506616, -3.429195, 0, 0, 0, 1, 1,
-1.085237, 0.1694991, -4.677105, 0, 0, 0, 1, 1,
-1.081688, -1.419154, -3.091547, 0, 0, 0, 1, 1,
-1.081361, 1.037602, -1.056107, 0, 0, 0, 1, 1,
-1.079247, -0.6067957, -0.6279042, 0, 0, 0, 1, 1,
-1.079243, 0.2017356, -1.242177, 1, 1, 1, 1, 1,
-1.078518, -1.125262, -3.132099, 1, 1, 1, 1, 1,
-1.074088, -0.6923414, -3.320335, 1, 1, 1, 1, 1,
-1.049364, 1.158368, 0.0921169, 1, 1, 1, 1, 1,
-1.048055, 1.051342, 1.376907, 1, 1, 1, 1, 1,
-1.039508, 0.445892, 0.190434, 1, 1, 1, 1, 1,
-1.029899, -0.5891306, -2.870681, 1, 1, 1, 1, 1,
-1.0239, -0.226796, -0.9889125, 1, 1, 1, 1, 1,
-1.016302, -0.0943233, -2.036515, 1, 1, 1, 1, 1,
-1.015443, 0.7583995, -2.071693, 1, 1, 1, 1, 1,
-1.008145, -1.602265, -4.154285, 1, 1, 1, 1, 1,
-1.005033, -0.8908249, -2.190727, 1, 1, 1, 1, 1,
-0.9858023, 0.03107378, -1.730164, 1, 1, 1, 1, 1,
-0.9854382, -0.8521951, -0.07766075, 1, 1, 1, 1, 1,
-0.9840891, 0.8992899, -1.211988, 1, 1, 1, 1, 1,
-0.9836339, -0.7770781, -3.450647, 0, 0, 1, 1, 1,
-0.9799894, 0.8437032, -0.3723358, 1, 0, 0, 1, 1,
-0.975659, 0.8197342, 0.9346343, 1, 0, 0, 1, 1,
-0.9697859, 0.7521138, 0.1889334, 1, 0, 0, 1, 1,
-0.9628324, 0.7184193, -0.1830225, 1, 0, 0, 1, 1,
-0.9615886, -0.2979819, -1.847675, 1, 0, 0, 1, 1,
-0.9582833, -0.6717583, -2.836095, 0, 0, 0, 1, 1,
-0.9547131, 0.3578614, -0.5152979, 0, 0, 0, 1, 1,
-0.9531161, -0.7143785, -1.578644, 0, 0, 0, 1, 1,
-0.9527094, -1.492504, -2.119844, 0, 0, 0, 1, 1,
-0.9506736, 2.481861, -1.916044, 0, 0, 0, 1, 1,
-0.9463491, 0.6402354, -2.459777, 0, 0, 0, 1, 1,
-0.9457868, -0.6040887, -1.025744, 0, 0, 0, 1, 1,
-0.9408635, -1.62456, -2.054335, 1, 1, 1, 1, 1,
-0.93669, -1.684762, -1.786269, 1, 1, 1, 1, 1,
-0.9327267, 0.1872986, -2.522665, 1, 1, 1, 1, 1,
-0.9294537, -0.104792, -1.351347, 1, 1, 1, 1, 1,
-0.928432, 1.619058, -0.471316, 1, 1, 1, 1, 1,
-0.9279272, -1.68966, -2.701309, 1, 1, 1, 1, 1,
-0.926634, -1.567724, -2.591219, 1, 1, 1, 1, 1,
-0.9248434, 0.812719, 0.6587494, 1, 1, 1, 1, 1,
-0.9233215, -1.560552, -3.208167, 1, 1, 1, 1, 1,
-0.9226184, -0.7900388, -1.073984, 1, 1, 1, 1, 1,
-0.9056495, 0.4295583, -3.283683, 1, 1, 1, 1, 1,
-0.9043826, -0.5181832, -1.271634, 1, 1, 1, 1, 1,
-0.8944013, -1.303626, -1.50407, 1, 1, 1, 1, 1,
-0.8925112, -0.3689772, -3.47288, 1, 1, 1, 1, 1,
-0.8915083, 0.419964, -1.931183, 1, 1, 1, 1, 1,
-0.8880716, 0.921843, -1.431829, 0, 0, 1, 1, 1,
-0.8839329, -0.8413199, -0.7231373, 1, 0, 0, 1, 1,
-0.8814563, 0.4712241, -0.403, 1, 0, 0, 1, 1,
-0.8790138, 0.8724914, -1.803192, 1, 0, 0, 1, 1,
-0.8724085, -1.742859, -3.562463, 1, 0, 0, 1, 1,
-0.8613327, -1.09619, -1.791151, 1, 0, 0, 1, 1,
-0.857238, -0.04484093, -1.976117, 0, 0, 0, 1, 1,
-0.8554865, 1.663383, 0.0362129, 0, 0, 0, 1, 1,
-0.8478674, 2.208962, 0.9175597, 0, 0, 0, 1, 1,
-0.8477594, 0.9508048, -1.649669, 0, 0, 0, 1, 1,
-0.8426372, 0.2485663, -0.274675, 0, 0, 0, 1, 1,
-0.840854, -0.6428155, -3.390244, 0, 0, 0, 1, 1,
-0.8351108, -2.300091, -1.75379, 0, 0, 0, 1, 1,
-0.8337291, 0.264651, -0.002427154, 1, 1, 1, 1, 1,
-0.8280963, 0.6109588, -1.290133, 1, 1, 1, 1, 1,
-0.8250471, -1.270348, -3.094903, 1, 1, 1, 1, 1,
-0.8217094, -1.153305, -1.468281, 1, 1, 1, 1, 1,
-0.8068235, -0.6578951, -1.653256, 1, 1, 1, 1, 1,
-0.8064235, -1.112154, 0.3149936, 1, 1, 1, 1, 1,
-0.805697, -1.398826, -2.314056, 1, 1, 1, 1, 1,
-0.7999323, 1.002333, 1.826548, 1, 1, 1, 1, 1,
-0.7989245, 0.7247748, 1.055028, 1, 1, 1, 1, 1,
-0.7847751, 0.8913109, -0.8215563, 1, 1, 1, 1, 1,
-0.7840614, 0.1634823, 0.07594086, 1, 1, 1, 1, 1,
-0.7833673, 0.4602202, -1.731659, 1, 1, 1, 1, 1,
-0.7799191, -1.844828, -3.222131, 1, 1, 1, 1, 1,
-0.779494, -1.1561, -3.758855, 1, 1, 1, 1, 1,
-0.7790132, -0.2472513, -3.067825, 1, 1, 1, 1, 1,
-0.7770948, 0.2543077, -0.5490479, 0, 0, 1, 1, 1,
-0.7724296, -1.613295, -2.815349, 1, 0, 0, 1, 1,
-0.7696292, 0.7386656, -0.5164324, 1, 0, 0, 1, 1,
-0.7673089, 1.692787, 0.9787887, 1, 0, 0, 1, 1,
-0.7642168, 0.8534709, -1.337037, 1, 0, 0, 1, 1,
-0.761711, -0.3423757, -2.008863, 1, 0, 0, 1, 1,
-0.7602816, 1.008133, -0.475319, 0, 0, 0, 1, 1,
-0.7552084, 1.77327, -1.411484, 0, 0, 0, 1, 1,
-0.7498298, -0.4117134, -1.709788, 0, 0, 0, 1, 1,
-0.7449882, 0.6656304, 0.2305899, 0, 0, 0, 1, 1,
-0.7432826, 1.649319, -0.9291641, 0, 0, 0, 1, 1,
-0.7424176, -0.9800792, -2.752591, 0, 0, 0, 1, 1,
-0.7341322, 0.1614626, 0.01683723, 0, 0, 0, 1, 1,
-0.7321505, -0.6621093, -2.156064, 1, 1, 1, 1, 1,
-0.7289487, 0.5266287, -0.1706558, 1, 1, 1, 1, 1,
-0.7279661, -0.4855117, -1.814775, 1, 1, 1, 1, 1,
-0.7118001, 0.05079202, -1.08199, 1, 1, 1, 1, 1,
-0.7108265, -0.763401, -3.198379, 1, 1, 1, 1, 1,
-0.7059421, 1.533398, -0.3791594, 1, 1, 1, 1, 1,
-0.6997454, 1.48867, 0.1692394, 1, 1, 1, 1, 1,
-0.6984992, 0.4581728, -2.2177, 1, 1, 1, 1, 1,
-0.6973584, 0.7118068, -2.570657, 1, 1, 1, 1, 1,
-0.6944293, 0.01171834, -2.528077, 1, 1, 1, 1, 1,
-0.6936417, 2.246243, -0.3719559, 1, 1, 1, 1, 1,
-0.6930457, -1.192002, -1.353805, 1, 1, 1, 1, 1,
-0.6857322, -0.120914, -3.526579, 1, 1, 1, 1, 1,
-0.6856253, 0.09115338, 1.193227, 1, 1, 1, 1, 1,
-0.6834062, -1.348933, -1.702107, 1, 1, 1, 1, 1,
-0.6832969, 1.027818, 1.119991, 0, 0, 1, 1, 1,
-0.683015, -0.006322329, -2.560935, 1, 0, 0, 1, 1,
-0.6813087, -0.001562773, -1.635314, 1, 0, 0, 1, 1,
-0.6808106, 0.02593675, -0.9209705, 1, 0, 0, 1, 1,
-0.6776615, 0.1461292, -0.1829766, 1, 0, 0, 1, 1,
-0.6771652, -0.5117791, -2.384892, 1, 0, 0, 1, 1,
-0.6762196, -1.974857, -1.555343, 0, 0, 0, 1, 1,
-0.67474, -0.4998308, 0.2345538, 0, 0, 0, 1, 1,
-0.6718567, -0.06338204, -1.734496, 0, 0, 0, 1, 1,
-0.6714483, -1.054955, -2.979616, 0, 0, 0, 1, 1,
-0.6710109, -1.466623, -3.154247, 0, 0, 0, 1, 1,
-0.6697221, 0.8775027, -0.587571, 0, 0, 0, 1, 1,
-0.6671849, -0.1110161, -1.246692, 0, 0, 0, 1, 1,
-0.6642948, -0.7960147, -1.842491, 1, 1, 1, 1, 1,
-0.6641372, -0.6529942, -1.728966, 1, 1, 1, 1, 1,
-0.6582023, -0.1018199, -3.024868, 1, 1, 1, 1, 1,
-0.6492198, -0.734009, -1.772715, 1, 1, 1, 1, 1,
-0.6458968, 0.04683458, -1.156121, 1, 1, 1, 1, 1,
-0.6416048, -0.4877444, -4.338613, 1, 1, 1, 1, 1,
-0.6414194, -1.039955, -3.260016, 1, 1, 1, 1, 1,
-0.6305248, 1.844089, -0.2353898, 1, 1, 1, 1, 1,
-0.6303281, 0.2532774, -3.404017, 1, 1, 1, 1, 1,
-0.6212863, -0.2403598, -0.6255022, 1, 1, 1, 1, 1,
-0.6168278, -1.354184, -2.137627, 1, 1, 1, 1, 1,
-0.6132411, 1.610615, 1.38719, 1, 1, 1, 1, 1,
-0.6121385, -0.2055483, -2.075003, 1, 1, 1, 1, 1,
-0.6069831, 1.849161, -0.2509907, 1, 1, 1, 1, 1,
-0.6054745, -1.051104, -1.775748, 1, 1, 1, 1, 1,
-0.6036415, 0.03182108, -1.692541, 0, 0, 1, 1, 1,
-0.6025532, -1.40362, -2.404845, 1, 0, 0, 1, 1,
-0.6008654, 1.482588, 0.3805452, 1, 0, 0, 1, 1,
-0.596801, 0.7871332, 0.1231578, 1, 0, 0, 1, 1,
-0.5917749, 1.99662, -0.8107542, 1, 0, 0, 1, 1,
-0.5916896, -0.3558167, -2.596334, 1, 0, 0, 1, 1,
-0.586498, 2.145409, 1.19004, 0, 0, 0, 1, 1,
-0.585956, -1.519674, -3.686019, 0, 0, 0, 1, 1,
-0.5854274, 0.8827763, -0.8702085, 0, 0, 0, 1, 1,
-0.5829986, -0.1958685, -2.103741, 0, 0, 0, 1, 1,
-0.5816715, -0.9341302, -3.185124, 0, 0, 0, 1, 1,
-0.5789459, 1.149972, -0.5645877, 0, 0, 0, 1, 1,
-0.5789251, 2.549992, 1.546106, 0, 0, 0, 1, 1,
-0.5732292, -1.005475, -5.421227, 1, 1, 1, 1, 1,
-0.5709403, 0.6148781, -0.9962634, 1, 1, 1, 1, 1,
-0.5689468, 0.6447405, 0.7521347, 1, 1, 1, 1, 1,
-0.5655476, -0.6331306, -2.578984, 1, 1, 1, 1, 1,
-0.5536984, 0.1797152, -1.874228, 1, 1, 1, 1, 1,
-0.5514285, -2.22348, -3.456586, 1, 1, 1, 1, 1,
-0.5450354, -0.2121003, -1.456767, 1, 1, 1, 1, 1,
-0.5444, -0.4236911, -1.968823, 1, 1, 1, 1, 1,
-0.5432984, -0.2568164, -2.117466, 1, 1, 1, 1, 1,
-0.5390863, 0.5849622, -1.014005, 1, 1, 1, 1, 1,
-0.5386469, 0.4396491, -0.6764191, 1, 1, 1, 1, 1,
-0.5373079, 0.6525513, -0.828219, 1, 1, 1, 1, 1,
-0.5365688, -0.7557046, -3.90487, 1, 1, 1, 1, 1,
-0.5356348, -1.593255, -3.984878, 1, 1, 1, 1, 1,
-0.5338302, 0.009882474, 0.03393035, 1, 1, 1, 1, 1,
-0.5323245, -0.2601789, -2.803638, 0, 0, 1, 1, 1,
-0.5262396, -0.275837, -1.772787, 1, 0, 0, 1, 1,
-0.525753, -0.9782076, -1.986086, 1, 0, 0, 1, 1,
-0.519092, 0.355482, -0.04609625, 1, 0, 0, 1, 1,
-0.518523, -0.3961356, -2.475612, 1, 0, 0, 1, 1,
-0.5151423, 0.8085088, -1.72762, 1, 0, 0, 1, 1,
-0.513579, 1.902544, -0.537568, 0, 0, 0, 1, 1,
-0.5124797, -0.466484, -3.668791, 0, 0, 0, 1, 1,
-0.5032028, -1.216594, -2.44633, 0, 0, 0, 1, 1,
-0.4989021, -0.4100509, -1.99214, 0, 0, 0, 1, 1,
-0.4975361, -0.8167891, -2.392909, 0, 0, 0, 1, 1,
-0.4951408, -0.694961, -2.180158, 0, 0, 0, 1, 1,
-0.4880673, 0.6910607, -0.8758811, 0, 0, 0, 1, 1,
-0.4860475, -0.5001275, -3.586429, 1, 1, 1, 1, 1,
-0.4838284, -1.652352, -2.433123, 1, 1, 1, 1, 1,
-0.4776015, -0.2400713, -3.083426, 1, 1, 1, 1, 1,
-0.4748853, -0.1849152, -2.630188, 1, 1, 1, 1, 1,
-0.4731175, -0.6857087, -3.002573, 1, 1, 1, 1, 1,
-0.4726321, -1.030014, -1.94526, 1, 1, 1, 1, 1,
-0.4722905, -1.794504, -4.522007, 1, 1, 1, 1, 1,
-0.4649127, -1.185156, -2.230749, 1, 1, 1, 1, 1,
-0.4562262, 0.6838136, -0.969557, 1, 1, 1, 1, 1,
-0.4547094, 0.7254288, -0.7410743, 1, 1, 1, 1, 1,
-0.4537624, 0.4283222, -0.3174233, 1, 1, 1, 1, 1,
-0.4524006, -0.2329954, -0.6103388, 1, 1, 1, 1, 1,
-0.448062, 0.09703293, -0.3110922, 1, 1, 1, 1, 1,
-0.4425285, 0.6698769, 0.2783948, 1, 1, 1, 1, 1,
-0.4386096, 0.6027605, -0.3145159, 1, 1, 1, 1, 1,
-0.4369866, 1.237543, -1.478229, 0, 0, 1, 1, 1,
-0.4361606, 1.46462, -0.1676525, 1, 0, 0, 1, 1,
-0.4308604, -1.129621, -3.616835, 1, 0, 0, 1, 1,
-0.4306896, -0.4930865, -2.485053, 1, 0, 0, 1, 1,
-0.4304169, 0.70331, 0.7973068, 1, 0, 0, 1, 1,
-0.4286768, 0.734708, 1.354431, 1, 0, 0, 1, 1,
-0.4281128, -0.7102896, -2.371843, 0, 0, 0, 1, 1,
-0.4227236, -0.4180469, -4.452531, 0, 0, 0, 1, 1,
-0.421899, -0.4173094, -2.207276, 0, 0, 0, 1, 1,
-0.4197766, 1.066765, -1.760227, 0, 0, 0, 1, 1,
-0.4181529, -1.073555, -4.575256, 0, 0, 0, 1, 1,
-0.4136275, 0.2331955, -1.167321, 0, 0, 0, 1, 1,
-0.4084162, 0.5154406, -0.5705189, 0, 0, 0, 1, 1,
-0.4083175, 0.7451983, 0.06044611, 1, 1, 1, 1, 1,
-0.3927484, -0.05426508, -1.696807, 1, 1, 1, 1, 1,
-0.3921154, -0.7547429, -2.018672, 1, 1, 1, 1, 1,
-0.3809851, 0.7888796, -2.73407, 1, 1, 1, 1, 1,
-0.3696813, 1.094678, 1.211511, 1, 1, 1, 1, 1,
-0.3696284, -0.1722901, -1.673177, 1, 1, 1, 1, 1,
-0.3612582, 0.8647196, -0.6026732, 1, 1, 1, 1, 1,
-0.3612518, 1.637079, -0.9601769, 1, 1, 1, 1, 1,
-0.3582285, 0.2875071, -1.726873, 1, 1, 1, 1, 1,
-0.3563806, 0.3758392, 0.005515281, 1, 1, 1, 1, 1,
-0.3519077, 1.524891, 0.2911818, 1, 1, 1, 1, 1,
-0.3509811, 0.807444, 0.08461877, 1, 1, 1, 1, 1,
-0.349182, -0.9934517, -2.126069, 1, 1, 1, 1, 1,
-0.3455634, -0.2494217, -1.678611, 1, 1, 1, 1, 1,
-0.3451245, 1.385502, -0.3859412, 1, 1, 1, 1, 1,
-0.3439352, -0.004775185, -1.854281, 0, 0, 1, 1, 1,
-0.3433863, 1.200312, 0.004589858, 1, 0, 0, 1, 1,
-0.3428554, -1.257793, -2.305359, 1, 0, 0, 1, 1,
-0.3395877, 0.6838551, 0.02693226, 1, 0, 0, 1, 1,
-0.3391117, 0.1608581, -0.6219733, 1, 0, 0, 1, 1,
-0.3379895, 0.7563186, -0.1924794, 1, 0, 0, 1, 1,
-0.3370779, 1.042286, 0.3016436, 0, 0, 0, 1, 1,
-0.3353632, 0.3374015, -0.1571295, 0, 0, 0, 1, 1,
-0.3289625, -2.077905, -3.590392, 0, 0, 0, 1, 1,
-0.3206538, -0.9404696, -2.549694, 0, 0, 0, 1, 1,
-0.317527, 0.8497555, -0.4104708, 0, 0, 0, 1, 1,
-0.3171321, 0.6293105, -1.203906, 0, 0, 0, 1, 1,
-0.3145622, 0.3980924, -0.4054033, 0, 0, 0, 1, 1,
-0.3145185, -1.371323, -2.40653, 1, 1, 1, 1, 1,
-0.3137202, -0.1392872, -2.346065, 1, 1, 1, 1, 1,
-0.3126586, -1.184287, -4.829194, 1, 1, 1, 1, 1,
-0.3098623, -0.4049656, -0.8025222, 1, 1, 1, 1, 1,
-0.3048796, -0.2656274, -2.026062, 1, 1, 1, 1, 1,
-0.3046187, 2.052783, -0.2745701, 1, 1, 1, 1, 1,
-0.3032485, 0.8490668, 0.151254, 1, 1, 1, 1, 1,
-0.2982215, 0.008711689, -2.677625, 1, 1, 1, 1, 1,
-0.2976706, 0.6665299, 0.04579695, 1, 1, 1, 1, 1,
-0.2964445, -0.08651717, -3.021245, 1, 1, 1, 1, 1,
-0.2961772, -0.8787159, -2.532155, 1, 1, 1, 1, 1,
-0.2932161, -2.126373, -2.970754, 1, 1, 1, 1, 1,
-0.291915, 0.6610574, -2.192569, 1, 1, 1, 1, 1,
-0.2900561, 0.9620164, 1.326006, 1, 1, 1, 1, 1,
-0.2894903, 0.8713998, -1.312374, 1, 1, 1, 1, 1,
-0.2867264, 0.5730069, -1.666589, 0, 0, 1, 1, 1,
-0.2844525, -0.8204256, -2.790927, 1, 0, 0, 1, 1,
-0.2827629, -0.2725511, -2.045937, 1, 0, 0, 1, 1,
-0.2818383, -0.3850372, -2.281055, 1, 0, 0, 1, 1,
-0.2808414, 0.4950223, -1.331655, 1, 0, 0, 1, 1,
-0.2807624, 1.017057, -0.560294, 1, 0, 0, 1, 1,
-0.2727238, -0.959818, -1.444263, 0, 0, 0, 1, 1,
-0.2726422, -0.6465358, -3.204663, 0, 0, 0, 1, 1,
-0.2690543, -0.4909514, -1.903147, 0, 0, 0, 1, 1,
-0.265901, 0.2188214, -2.758895, 0, 0, 0, 1, 1,
-0.2621918, 1.894088, -1.530584, 0, 0, 0, 1, 1,
-0.2561486, 2.493555, 0.3357689, 0, 0, 0, 1, 1,
-0.2540821, -0.5887938, -2.806339, 0, 0, 0, 1, 1,
-0.2490407, -0.9990507, -2.726868, 1, 1, 1, 1, 1,
-0.2449848, -0.8636131, -1.826965, 1, 1, 1, 1, 1,
-0.2429186, 0.8459507, 0.2586401, 1, 1, 1, 1, 1,
-0.2423147, 2.545027, 0.2206834, 1, 1, 1, 1, 1,
-0.2399765, 2.027026, -1.296194, 1, 1, 1, 1, 1,
-0.2391474, 0.9837334, -0.4803976, 1, 1, 1, 1, 1,
-0.2383036, -0.187941, -3.078602, 1, 1, 1, 1, 1,
-0.2369479, -0.4409318, -1.522911, 1, 1, 1, 1, 1,
-0.2348137, 1.190081, -0.6740763, 1, 1, 1, 1, 1,
-0.2326992, 2.96992, -0.2127478, 1, 1, 1, 1, 1,
-0.226828, 0.02775054, -1.230481, 1, 1, 1, 1, 1,
-0.2221164, 0.1669581, -1.273753, 1, 1, 1, 1, 1,
-0.2151988, 0.7997435, -0.9630665, 1, 1, 1, 1, 1,
-0.214793, -0.8749763, -3.43478, 1, 1, 1, 1, 1,
-0.2145248, 1.180287, 1.096634, 1, 1, 1, 1, 1,
-0.2142964, -0.8032194, -1.850191, 0, 0, 1, 1, 1,
-0.2116689, 0.0440531, -0.9684162, 1, 0, 0, 1, 1,
-0.2109534, -1.147248, -1.283913, 1, 0, 0, 1, 1,
-0.2107415, 0.9847395, -0.2474254, 1, 0, 0, 1, 1,
-0.207845, 1.372629, -2.28265, 1, 0, 0, 1, 1,
-0.2041069, 0.9384125, -1.220296, 1, 0, 0, 1, 1,
-0.2032987, 0.3757974, 0.9670501, 0, 0, 0, 1, 1,
-0.2017767, -0.469399, -2.155972, 0, 0, 0, 1, 1,
-0.2008988, 1.317011, 0.5279046, 0, 0, 0, 1, 1,
-0.1989884, -0.5064346, -3.058876, 0, 0, 0, 1, 1,
-0.1985663, -0.3388139, -1.692385, 0, 0, 0, 1, 1,
-0.1968284, 1.187471, -0.1058807, 0, 0, 0, 1, 1,
-0.1956115, -0.7728821, -3.167758, 0, 0, 0, 1, 1,
-0.1919223, -0.0003043536, -0.3106897, 1, 1, 1, 1, 1,
-0.1866274, 1.286613, -0.5335099, 1, 1, 1, 1, 1,
-0.1862679, -0.0798813, -1.996431, 1, 1, 1, 1, 1,
-0.185137, 0.6690814, -1.202428, 1, 1, 1, 1, 1,
-0.1838552, 1.224961, -1.804344, 1, 1, 1, 1, 1,
-0.1791958, -0.5218721, -3.985718, 1, 1, 1, 1, 1,
-0.1771463, 0.1697976, -1.487946, 1, 1, 1, 1, 1,
-0.1766787, 2.386751, -1.851302, 1, 1, 1, 1, 1,
-0.1756459, -0.620702, -3.728362, 1, 1, 1, 1, 1,
-0.173242, 0.7132419, -1.691149, 1, 1, 1, 1, 1,
-0.1703902, -1.07381, -4.323861, 1, 1, 1, 1, 1,
-0.1681266, 0.02946908, -0.8462391, 1, 1, 1, 1, 1,
-0.1679884, 0.2797225, -1.714787, 1, 1, 1, 1, 1,
-0.1674892, -1.424663, -5.23887, 1, 1, 1, 1, 1,
-0.1638358, -0.1915314, -2.842016, 1, 1, 1, 1, 1,
-0.1614647, -0.958122, -2.297769, 0, 0, 1, 1, 1,
-0.1516802, -0.1402568, -1.613388, 1, 0, 0, 1, 1,
-0.1462175, 0.3564702, 1.728845, 1, 0, 0, 1, 1,
-0.1460562, 1.748306, -1.077519, 1, 0, 0, 1, 1,
-0.1439061, -0.7058926, -3.887557, 1, 0, 0, 1, 1,
-0.1427715, 0.4788228, -1.55403, 1, 0, 0, 1, 1,
-0.1421961, -1.39068, -2.033321, 0, 0, 0, 1, 1,
-0.1417477, -1.833349, -3.026855, 0, 0, 0, 1, 1,
-0.1415048, 1.269447, 1.702742, 0, 0, 0, 1, 1,
-0.1342463, 1.521513, -0.2573388, 0, 0, 0, 1, 1,
-0.1295281, -1.025491, -1.493623, 0, 0, 0, 1, 1,
-0.1289746, -0.4741905, -4.434606, 0, 0, 0, 1, 1,
-0.1282294, -1.25185, -2.504012, 0, 0, 0, 1, 1,
-0.1265659, -0.3215018, -1.261879, 1, 1, 1, 1, 1,
-0.1262534, 0.7110673, 1.806968, 1, 1, 1, 1, 1,
-0.1250975, -1.491164, -3.886497, 1, 1, 1, 1, 1,
-0.1222047, 0.4471744, -0.2317543, 1, 1, 1, 1, 1,
-0.1201079, 2.118493, 0.7439987, 1, 1, 1, 1, 1,
-0.1143089, 0.3433448, -1.749094, 1, 1, 1, 1, 1,
-0.1082402, -0.6626718, -4.0825, 1, 1, 1, 1, 1,
-0.1055738, -0.2623009, -2.499043, 1, 1, 1, 1, 1,
-0.09362954, -1.397149, -2.67431, 1, 1, 1, 1, 1,
-0.09040219, -1.552555, -3.998353, 1, 1, 1, 1, 1,
-0.08882202, 1.21166, 1.303177, 1, 1, 1, 1, 1,
-0.08693583, 0.848583, 0.4416628, 1, 1, 1, 1, 1,
-0.08672998, 0.7134557, -0.2707097, 1, 1, 1, 1, 1,
-0.08528394, 0.2618084, 0.4580016, 1, 1, 1, 1, 1,
-0.08462206, -0.3621186, -2.771991, 1, 1, 1, 1, 1,
-0.08432183, -1.293218, -2.35886, 0, 0, 1, 1, 1,
-0.08162032, 0.2000429, -0.4059054, 1, 0, 0, 1, 1,
-0.08153966, 0.3024677, 0.2356063, 1, 0, 0, 1, 1,
-0.07630767, 0.6497536, 0.6601379, 1, 0, 0, 1, 1,
-0.07247274, -2.016955, -1.63043, 1, 0, 0, 1, 1,
-0.06992693, -0.7303718, -2.63372, 1, 0, 0, 1, 1,
-0.06707032, 0.1671298, -0.1886909, 0, 0, 0, 1, 1,
-0.0636524, -0.7043914, -2.886577, 0, 0, 0, 1, 1,
-0.06211665, 1.09275, -1.437801, 0, 0, 0, 1, 1,
-0.05833391, 0.1441758, -0.6468288, 0, 0, 0, 1, 1,
-0.04927567, -0.4287367, -1.86842, 0, 0, 0, 1, 1,
-0.04435883, -0.4634533, -2.437487, 0, 0, 0, 1, 1,
-0.03555796, 0.5302086, 0.7503425, 0, 0, 0, 1, 1,
-0.03073696, -0.871707, -2.428874, 1, 1, 1, 1, 1,
-0.02619986, -0.3135911, -2.929872, 1, 1, 1, 1, 1,
-0.02453214, 0.8165217, 1.084294, 1, 1, 1, 1, 1,
-0.02323581, -1.809882, -1.395348, 1, 1, 1, 1, 1,
-0.02155796, 1.10489, 1.141345, 1, 1, 1, 1, 1,
-0.01618701, 0.2713956, 0.8705454, 1, 1, 1, 1, 1,
-0.01518391, 0.07226246, 2.790064, 1, 1, 1, 1, 1,
-0.01417986, -1.24355, -1.917365, 1, 1, 1, 1, 1,
-0.01053021, -0.7596814, -2.44135, 1, 1, 1, 1, 1,
-0.01015312, -0.569699, -4.185214, 1, 1, 1, 1, 1,
-0.008405135, -0.414568, -2.306332, 1, 1, 1, 1, 1,
-0.003218423, -0.5910603, -3.891023, 1, 1, 1, 1, 1,
0.0002246962, 0.5393248, -0.7864285, 1, 1, 1, 1, 1,
0.0009591164, -0.8382469, 2.927505, 1, 1, 1, 1, 1,
0.005781288, 0.5441185, 1.884313, 1, 1, 1, 1, 1,
0.008289416, -0.4084171, 1.899991, 0, 0, 1, 1, 1,
0.01028335, -0.252278, 2.679061, 1, 0, 0, 1, 1,
0.01310734, 0.6133381, 1.4797, 1, 0, 0, 1, 1,
0.01651792, -0.9992657, 4.646395, 1, 0, 0, 1, 1,
0.01688546, 0.1010236, 1.782679, 1, 0, 0, 1, 1,
0.0182091, -0.4801027, 2.578851, 1, 0, 0, 1, 1,
0.01899459, 1.731155, 0.2200966, 0, 0, 0, 1, 1,
0.02518022, -0.8722779, 2.275767, 0, 0, 0, 1, 1,
0.02786733, 0.5383529, 0.1541369, 0, 0, 0, 1, 1,
0.03343828, 0.9332834, -0.3813721, 0, 0, 0, 1, 1,
0.03349277, 1.317665, 0.2407526, 0, 0, 0, 1, 1,
0.03504453, -0.3902613, 2.410968, 0, 0, 0, 1, 1,
0.03525323, -0.6198968, 3.206976, 0, 0, 0, 1, 1,
0.03941787, -0.5452704, 4.478975, 1, 1, 1, 1, 1,
0.0441931, -0.327639, 4.398954, 1, 1, 1, 1, 1,
0.0496323, -1.84565, 3.585327, 1, 1, 1, 1, 1,
0.05208169, -0.9720823, 4.329348, 1, 1, 1, 1, 1,
0.05246303, -0.9664006, 2.828373, 1, 1, 1, 1, 1,
0.05516163, -0.3658009, 3.485012, 1, 1, 1, 1, 1,
0.05563965, 0.4034954, 0.7399309, 1, 1, 1, 1, 1,
0.06158432, 1.459626, 0.4926434, 1, 1, 1, 1, 1,
0.0648376, -1.475613, 3.98361, 1, 1, 1, 1, 1,
0.06761094, 1.844857, -0.2522257, 1, 1, 1, 1, 1,
0.07240649, -0.3238787, 4.509587, 1, 1, 1, 1, 1,
0.07363781, 1.738205, 1.059463, 1, 1, 1, 1, 1,
0.07541786, -0.239338, 3.759234, 1, 1, 1, 1, 1,
0.07728275, -0.1574211, 2.699091, 1, 1, 1, 1, 1,
0.07784052, -1.414604, 4.980571, 1, 1, 1, 1, 1,
0.07834343, 0.7763715, -0.4338742, 0, 0, 1, 1, 1,
0.08115033, -0.4073397, 3.56573, 1, 0, 0, 1, 1,
0.08457021, 1.048953, -0.318863, 1, 0, 0, 1, 1,
0.08686344, 1.201035, 0.5670676, 1, 0, 0, 1, 1,
0.08731835, -0.9125092, 3.278296, 1, 0, 0, 1, 1,
0.08756027, 1.19651, -0.790419, 1, 0, 0, 1, 1,
0.09031554, -0.987202, 4.429172, 0, 0, 0, 1, 1,
0.09515353, -0.2279501, 3.725882, 0, 0, 0, 1, 1,
0.09726264, -0.8362978, 3.052779, 0, 0, 0, 1, 1,
0.1075059, 0.1543864, 2.248354, 0, 0, 0, 1, 1,
0.1078513, 0.7561854, -1.148234, 0, 0, 0, 1, 1,
0.1097782, -1.090238, 3.161925, 0, 0, 0, 1, 1,
0.1103286, -0.5360112, 3.141593, 0, 0, 0, 1, 1,
0.1114582, -1.559241, 2.249391, 1, 1, 1, 1, 1,
0.1122354, -0.9693713, 0.7012417, 1, 1, 1, 1, 1,
0.113676, -1.240139, 2.660327, 1, 1, 1, 1, 1,
0.1150085, -0.6122195, 2.419497, 1, 1, 1, 1, 1,
0.1153748, 0.2117322, 0.7773299, 1, 1, 1, 1, 1,
0.1161006, -0.2098095, 2.577426, 1, 1, 1, 1, 1,
0.1179738, 0.06975385, 1.569336, 1, 1, 1, 1, 1,
0.1234238, -0.5219213, 3.60755, 1, 1, 1, 1, 1,
0.1251439, 0.8978662, 1.796924, 1, 1, 1, 1, 1,
0.1263019, 0.1623078, 0.5382569, 1, 1, 1, 1, 1,
0.1266008, -0.8697914, 2.287161, 1, 1, 1, 1, 1,
0.1310002, -0.9212493, 3.252535, 1, 1, 1, 1, 1,
0.1314699, -0.5124737, 3.399483, 1, 1, 1, 1, 1,
0.1319705, -0.9640136, 3.156957, 1, 1, 1, 1, 1,
0.1337612, 0.5982195, 1.271399, 1, 1, 1, 1, 1,
0.1363362, 0.912196, -1.471193, 0, 0, 1, 1, 1,
0.1398241, -0.3145355, 3.319631, 1, 0, 0, 1, 1,
0.1406994, 0.1616461, -0.243083, 1, 0, 0, 1, 1,
0.149426, -0.7222989, 2.28666, 1, 0, 0, 1, 1,
0.1550754, 1.977567, -0.447018, 1, 0, 0, 1, 1,
0.1577224, -0.4412875, 2.823826, 1, 0, 0, 1, 1,
0.1586376, -2.622211, 5.407835, 0, 0, 0, 1, 1,
0.1611381, 1.155154, -0.5601246, 0, 0, 0, 1, 1,
0.1666338, -1.120625, 1.963169, 0, 0, 0, 1, 1,
0.1669375, -0.8912715, 1.920737, 0, 0, 0, 1, 1,
0.1696573, 0.2549089, 0.1750581, 0, 0, 0, 1, 1,
0.1754205, -1.909401, 3.982253, 0, 0, 0, 1, 1,
0.1785565, -0.3574582, 4.847028, 0, 0, 0, 1, 1,
0.1812122, 0.04563908, 2.782701, 1, 1, 1, 1, 1,
0.1828822, -1.818561, 3.738728, 1, 1, 1, 1, 1,
0.1851839, -0.5005646, 3.65274, 1, 1, 1, 1, 1,
0.1861829, 0.4468132, -0.5301165, 1, 1, 1, 1, 1,
0.1865827, -0.01894262, 2.607103, 1, 1, 1, 1, 1,
0.2042249, 0.03239873, 0.8948992, 1, 1, 1, 1, 1,
0.210086, 0.3590878, -1.161899, 1, 1, 1, 1, 1,
0.2140151, 0.3989325, 1.753343, 1, 1, 1, 1, 1,
0.2143611, 0.6440496, -0.04841391, 1, 1, 1, 1, 1,
0.2160958, 0.7461961, 0.06268933, 1, 1, 1, 1, 1,
0.2179242, 0.07648023, 2.038836, 1, 1, 1, 1, 1,
0.2200308, -0.6850445, 1.326366, 1, 1, 1, 1, 1,
0.2201501, 1.908581, 0.3913684, 1, 1, 1, 1, 1,
0.2205257, -0.3307233, 2.312563, 1, 1, 1, 1, 1,
0.2208952, -1.005525, 2.865733, 1, 1, 1, 1, 1,
0.2230012, 0.7566897, -0.1287614, 0, 0, 1, 1, 1,
0.227092, -1.906643, 2.415601, 1, 0, 0, 1, 1,
0.2368077, 0.224854, 0.6387705, 1, 0, 0, 1, 1,
0.2387937, 0.3128106, 0.1614491, 1, 0, 0, 1, 1,
0.2402911, 0.5216358, -0.3540193, 1, 0, 0, 1, 1,
0.2429368, -2.055381, 2.27427, 1, 0, 0, 1, 1,
0.2440739, -0.529222, 3.399539, 0, 0, 0, 1, 1,
0.2486864, 0.8434086, -0.4186187, 0, 0, 0, 1, 1,
0.2515547, 0.1416894, -0.3809914, 0, 0, 0, 1, 1,
0.2535659, 0.9909317, 0.700039, 0, 0, 0, 1, 1,
0.2537615, 0.6199097, 0.5364357, 0, 0, 0, 1, 1,
0.2546304, -0.858595, 3.392366, 0, 0, 0, 1, 1,
0.2568624, 1.562751, -0.6860743, 0, 0, 0, 1, 1,
0.2645379, -0.1993147, 2.223826, 1, 1, 1, 1, 1,
0.2713535, 1.303813, -2.540294, 1, 1, 1, 1, 1,
0.2774209, -0.4972802, 1.952673, 1, 1, 1, 1, 1,
0.284378, -0.2222212, 3.188443, 1, 1, 1, 1, 1,
0.2846873, -0.6239589, 2.608833, 1, 1, 1, 1, 1,
0.2867611, -0.03331814, 0.6480746, 1, 1, 1, 1, 1,
0.2885771, -1.31378, 2.262988, 1, 1, 1, 1, 1,
0.2888369, -1.471219, 2.884995, 1, 1, 1, 1, 1,
0.2914678, -0.1751193, 2.213768, 1, 1, 1, 1, 1,
0.2915042, 0.05157554, 2.725665, 1, 1, 1, 1, 1,
0.2951319, 1.166671, -0.8892931, 1, 1, 1, 1, 1,
0.2954597, 0.4813423, 0.7437276, 1, 1, 1, 1, 1,
0.3004959, 0.9514096, 2.162985, 1, 1, 1, 1, 1,
0.3007876, 1.007435, 1.266529, 1, 1, 1, 1, 1,
0.3008462, -0.5041377, 2.862463, 1, 1, 1, 1, 1,
0.3022043, -0.08861871, 1.644007, 0, 0, 1, 1, 1,
0.3024567, -0.1630129, 2.553275, 1, 0, 0, 1, 1,
0.3032392, 0.6877673, 0.954484, 1, 0, 0, 1, 1,
0.304209, 1.053678, 1.503857, 1, 0, 0, 1, 1,
0.3117983, -0.877801, 3.819937, 1, 0, 0, 1, 1,
0.318487, 0.148522, 3.066534, 1, 0, 0, 1, 1,
0.3218807, 0.8954268, -0.6945338, 0, 0, 0, 1, 1,
0.3235602, -1.656766, 4.057138, 0, 0, 0, 1, 1,
0.3246067, -0.8022591, 1.706927, 0, 0, 0, 1, 1,
0.3248622, -0.4081492, 1.741638, 0, 0, 0, 1, 1,
0.3254732, 0.5210787, -1.213553, 0, 0, 0, 1, 1,
0.3265966, -0.5883498, 2.568663, 0, 0, 0, 1, 1,
0.3274088, -0.1219936, 1.815629, 0, 0, 0, 1, 1,
0.3276545, 2.208262, 1.43808, 1, 1, 1, 1, 1,
0.329381, -1.341581, 2.321641, 1, 1, 1, 1, 1,
0.3318024, -0.02647883, 0.5564339, 1, 1, 1, 1, 1,
0.3323895, 0.6126766, 1.086499, 1, 1, 1, 1, 1,
0.3334907, 1.795626, 1.339321, 1, 1, 1, 1, 1,
0.3339302, -2.203555, 1.725735, 1, 1, 1, 1, 1,
0.335815, 0.8092675, -1.048982, 1, 1, 1, 1, 1,
0.3396073, 0.1234511, 0.6355799, 1, 1, 1, 1, 1,
0.3409124, -0.09987962, 1.515124, 1, 1, 1, 1, 1,
0.3426782, 0.7142775, 1.029142, 1, 1, 1, 1, 1,
0.3442718, -0.005135376, 1.450905, 1, 1, 1, 1, 1,
0.3449513, -0.03885156, -0.08198158, 1, 1, 1, 1, 1,
0.346625, -0.1199994, -0.01991369, 1, 1, 1, 1, 1,
0.34859, -0.7324681, 4.132394, 1, 1, 1, 1, 1,
0.3506411, -0.545873, 2.45337, 1, 1, 1, 1, 1,
0.354648, 0.2133676, -0.3568631, 0, 0, 1, 1, 1,
0.355115, -1.686877, 2.452692, 1, 0, 0, 1, 1,
0.358746, 0.7800363, -0.4240598, 1, 0, 0, 1, 1,
0.3593937, -1.45224, 1.725609, 1, 0, 0, 1, 1,
0.360664, -1.268391, 2.065305, 1, 0, 0, 1, 1,
0.3607683, -0.9424231, 1.379087, 1, 0, 0, 1, 1,
0.3631428, 1.196388, 2.558325, 0, 0, 0, 1, 1,
0.3634479, -1.463107, 2.977116, 0, 0, 0, 1, 1,
0.3687258, -0.8948715, 3.206148, 0, 0, 0, 1, 1,
0.3720412, -0.5213652, 2.241104, 0, 0, 0, 1, 1,
0.3735126, 0.3946123, 1.084244, 0, 0, 0, 1, 1,
0.3751288, 1.747027, -0.2819772, 0, 0, 0, 1, 1,
0.3809904, -1.675197, 2.585778, 0, 0, 0, 1, 1,
0.3887559, -0.1258319, 1.845951, 1, 1, 1, 1, 1,
0.3890482, 0.6434397, 3.006544, 1, 1, 1, 1, 1,
0.3897789, -1.919399, 2.430775, 1, 1, 1, 1, 1,
0.3909494, -0.1585754, 2.127848, 1, 1, 1, 1, 1,
0.3921558, -0.083372, 0.3075475, 1, 1, 1, 1, 1,
0.3949463, -0.3164223, 3.699335, 1, 1, 1, 1, 1,
0.3974827, 0.2156061, 1.291489, 1, 1, 1, 1, 1,
0.4051595, 0.5771709, 0.2271114, 1, 1, 1, 1, 1,
0.4061668, -1.694542, 2.032809, 1, 1, 1, 1, 1,
0.4078327, -1.104695, 2.768404, 1, 1, 1, 1, 1,
0.4103398, -1.11216, 4.207059, 1, 1, 1, 1, 1,
0.4115299, -0.3981558, 1.691976, 1, 1, 1, 1, 1,
0.411737, 1.187009, -1.302972, 1, 1, 1, 1, 1,
0.4122738, -0.8839135, 2.674707, 1, 1, 1, 1, 1,
0.4137554, 1.889025, 0.6417147, 1, 1, 1, 1, 1,
0.417219, -1.655313, 2.850567, 0, 0, 1, 1, 1,
0.4177741, 0.2629255, 0.6668976, 1, 0, 0, 1, 1,
0.4179747, -2.175324, 2.94838, 1, 0, 0, 1, 1,
0.4188038, -1.208212, 1.829067, 1, 0, 0, 1, 1,
0.4217376, 1.517166, 0.493523, 1, 0, 0, 1, 1,
0.4250648, 0.2059538, 0.1829747, 1, 0, 0, 1, 1,
0.4253955, 0.6197009, -0.1718522, 0, 0, 0, 1, 1,
0.4258957, -0.5698171, 3.269362, 0, 0, 0, 1, 1,
0.4263468, -0.3387499, 1.382938, 0, 0, 0, 1, 1,
0.4290688, -0.7213819, 3.043774, 0, 0, 0, 1, 1,
0.4305741, 0.4599531, -0.06202818, 0, 0, 0, 1, 1,
0.4317926, 0.111763, 0.4230507, 0, 0, 0, 1, 1,
0.4383877, -1.442983, 2.161402, 0, 0, 0, 1, 1,
0.4421636, -0.5672859, 2.372957, 1, 1, 1, 1, 1,
0.4429961, 0.2679818, 1.403759, 1, 1, 1, 1, 1,
0.4432508, 1.356687, -0.003855796, 1, 1, 1, 1, 1,
0.4441494, 0.465078, -1.335078, 1, 1, 1, 1, 1,
0.4471695, 0.6338363, 0.5033837, 1, 1, 1, 1, 1,
0.4511755, 0.2737371, 0.7819204, 1, 1, 1, 1, 1,
0.4558148, 1.370936, 0.7765257, 1, 1, 1, 1, 1,
0.4587394, -1.898884, 2.505134, 1, 1, 1, 1, 1,
0.4655649, -0.8527574, 2.843793, 1, 1, 1, 1, 1,
0.467096, -0.2212867, 0.3203269, 1, 1, 1, 1, 1,
0.473336, -1.54776, 0.694944, 1, 1, 1, 1, 1,
0.4757853, -1.351069, 2.665501, 1, 1, 1, 1, 1,
0.4766333, 1.496646, 0.6535273, 1, 1, 1, 1, 1,
0.477102, 0.6906258, 2.383574, 1, 1, 1, 1, 1,
0.4844198, 1.511628, 0.960331, 1, 1, 1, 1, 1,
0.4869407, -0.1613814, 2.293444, 0, 0, 1, 1, 1,
0.4897567, 1.980497, -0.8390927, 1, 0, 0, 1, 1,
0.4926987, 1.083937, 0.7823214, 1, 0, 0, 1, 1,
0.4937096, -2.106546, 1.550006, 1, 0, 0, 1, 1,
0.4983876, 0.5365669, -0.271189, 1, 0, 0, 1, 1,
0.5009289, -0.5555214, 1.888403, 1, 0, 0, 1, 1,
0.5036919, -0.2539643, 0.6071109, 0, 0, 0, 1, 1,
0.506127, -1.357259, 4.684052, 0, 0, 0, 1, 1,
0.509477, 0.08268673, 1.46787, 0, 0, 0, 1, 1,
0.5110544, -0.4490364, 2.088573, 0, 0, 0, 1, 1,
0.5147102, 2.450949, 0.3131757, 0, 0, 0, 1, 1,
0.515922, -0.8405966, 3.185718, 0, 0, 0, 1, 1,
0.5172603, 0.9175495, 0.5000762, 0, 0, 0, 1, 1,
0.5204847, -1.139936, 2.508396, 1, 1, 1, 1, 1,
0.5208392, 0.5339678, 0.8187671, 1, 1, 1, 1, 1,
0.5245684, 2.095577, 0.2035566, 1, 1, 1, 1, 1,
0.5311916, 0.6388871, 0.8165835, 1, 1, 1, 1, 1,
0.5317843, 0.486589, 1.13826, 1, 1, 1, 1, 1,
0.533927, -0.1583129, 3.08293, 1, 1, 1, 1, 1,
0.5353767, -0.4101539, 0.8187302, 1, 1, 1, 1, 1,
0.5355681, 1.86516, 1.759539, 1, 1, 1, 1, 1,
0.5378437, 0.7949625, 1.538629, 1, 1, 1, 1, 1,
0.539214, -0.2352681, 2.720162, 1, 1, 1, 1, 1,
0.5426896, -0.7970636, 2.161814, 1, 1, 1, 1, 1,
0.54305, -0.4386947, 3.770647, 1, 1, 1, 1, 1,
0.5456997, 0.746365, 2.079159, 1, 1, 1, 1, 1,
0.5496148, 0.6550007, 0.581188, 1, 1, 1, 1, 1,
0.559636, -0.3435562, 2.23347, 1, 1, 1, 1, 1,
0.5651922, -0.04309904, 3.682845, 0, 0, 1, 1, 1,
0.5670789, 0.2085043, 1.532491, 1, 0, 0, 1, 1,
0.5687962, 0.05279232, 1.737371, 1, 0, 0, 1, 1,
0.5692023, -0.2933409, 3.107397, 1, 0, 0, 1, 1,
0.5714654, 0.6339615, 1.772486, 1, 0, 0, 1, 1,
0.5726449, 0.227826, -0.1951464, 1, 0, 0, 1, 1,
0.5731481, 1.094177, 0.6875203, 0, 0, 0, 1, 1,
0.5739639, 1.491213, 0.6374264, 0, 0, 0, 1, 1,
0.574229, 1.370356, 1.250209, 0, 0, 0, 1, 1,
0.5758846, 0.001737526, 2.206235, 0, 0, 0, 1, 1,
0.5760404, -1.35923, 3.604187, 0, 0, 0, 1, 1,
0.5818859, -0.4931616, 3.989642, 0, 0, 0, 1, 1,
0.5843598, -0.6606193, 3.445289, 0, 0, 0, 1, 1,
0.5864835, 1.064978, -0.6338589, 1, 1, 1, 1, 1,
0.5887152, -1.612509, 3.372731, 1, 1, 1, 1, 1,
0.5905922, -1.01871, 2.947522, 1, 1, 1, 1, 1,
0.6111072, 2.411403, 1.126021, 1, 1, 1, 1, 1,
0.6180991, -0.5257258, 1.651603, 1, 1, 1, 1, 1,
0.6248896, 0.8629367, 0.3724084, 1, 1, 1, 1, 1,
0.6307297, 0.9540043, 1.357138, 1, 1, 1, 1, 1,
0.6323395, 0.6096607, 0.7464312, 1, 1, 1, 1, 1,
0.6351407, -0.4535724, 3.001078, 1, 1, 1, 1, 1,
0.6385134, -1.278611, 1.962762, 1, 1, 1, 1, 1,
0.6406628, -0.9557797, 1.386964, 1, 1, 1, 1, 1,
0.6428312, -0.8708285, 3.03401, 1, 1, 1, 1, 1,
0.6444995, 0.949077, 0.0750685, 1, 1, 1, 1, 1,
0.6459801, 1.58628, -0.98421, 1, 1, 1, 1, 1,
0.6462101, 0.7632648, -0.6905227, 1, 1, 1, 1, 1,
0.6558884, 0.3222891, 0.4602696, 0, 0, 1, 1, 1,
0.6560321, -0.3429018, 4.3416, 1, 0, 0, 1, 1,
0.657806, 0.09042457, 1.17007, 1, 0, 0, 1, 1,
0.6662315, 1.101858, 0.4597282, 1, 0, 0, 1, 1,
0.668122, -0.1225089, 0.2143188, 1, 0, 0, 1, 1,
0.6699722, -0.6656139, 2.057543, 1, 0, 0, 1, 1,
0.6704603, 0.5468881, 2.606083, 0, 0, 0, 1, 1,
0.6719792, 0.7892659, -0.2133257, 0, 0, 0, 1, 1,
0.6739349, 0.2017583, 1.218488, 0, 0, 0, 1, 1,
0.6743579, 0.1676827, 0.8230947, 0, 0, 0, 1, 1,
0.6797181, 0.4623185, 1.056774, 0, 0, 0, 1, 1,
0.6818157, -1.172999, 3.054354, 0, 0, 0, 1, 1,
0.6825786, -0.8202564, 3.289608, 0, 0, 0, 1, 1,
0.685524, 0.8212602, -0.4812881, 1, 1, 1, 1, 1,
0.6856371, 1.253897, 1.650171, 1, 1, 1, 1, 1,
0.6865916, 0.616123, 2.722431, 1, 1, 1, 1, 1,
0.6878785, 3.634061, -0.1244285, 1, 1, 1, 1, 1,
0.6934521, 0.07214003, 1.259339, 1, 1, 1, 1, 1,
0.6940481, 1.503796, 1.558375, 1, 1, 1, 1, 1,
0.6954556, -0.1372614, 1.509133, 1, 1, 1, 1, 1,
0.695557, 0.6042399, 1.965397, 1, 1, 1, 1, 1,
0.695805, -1.093913, 1.228736, 1, 1, 1, 1, 1,
0.6982663, -0.4366008, 3.048675, 1, 1, 1, 1, 1,
0.6983258, 1.451963, 1.786241, 1, 1, 1, 1, 1,
0.7009085, 0.5717418, -0.9355052, 1, 1, 1, 1, 1,
0.7045748, 0.1965356, 1.440815, 1, 1, 1, 1, 1,
0.7064021, -1.016505, 0.09801859, 1, 1, 1, 1, 1,
0.7070174, -0.6243333, 1.904887, 1, 1, 1, 1, 1,
0.7101017, -0.1954021, 2.709046, 0, 0, 1, 1, 1,
0.7135418, -0.4878423, 1.256865, 1, 0, 0, 1, 1,
0.7136494, 0.5965953, 0.4192243, 1, 0, 0, 1, 1,
0.7167419, 0.3142512, 0.5999545, 1, 0, 0, 1, 1,
0.719964, -0.9740925, 0.853888, 1, 0, 0, 1, 1,
0.7204174, 0.4349062, 1.815354, 1, 0, 0, 1, 1,
0.724573, -0.6030999, 4.427516, 0, 0, 0, 1, 1,
0.7272658, 1.296753, -0.009928762, 0, 0, 0, 1, 1,
0.7275709, 0.4521936, 0.7129005, 0, 0, 0, 1, 1,
0.7409975, -2.240376, 2.520908, 0, 0, 0, 1, 1,
0.7418641, -0.2724335, 1.130758, 0, 0, 0, 1, 1,
0.7440077, 2.625071, -0.1265549, 0, 0, 0, 1, 1,
0.7516862, -1.523982, 3.215057, 0, 0, 0, 1, 1,
0.752605, 2.283163, 0.669318, 1, 1, 1, 1, 1,
0.7547074, 0.05324163, 0.3581213, 1, 1, 1, 1, 1,
0.7549734, -0.6586408, 2.273231, 1, 1, 1, 1, 1,
0.7602619, 1.150484, 1.015852, 1, 1, 1, 1, 1,
0.7621414, 0.8220537, -0.002548094, 1, 1, 1, 1, 1,
0.7623782, -0.8988554, 2.566439, 1, 1, 1, 1, 1,
0.7634216, -0.8623135, 4.150982, 1, 1, 1, 1, 1,
0.7642707, 1.153095, 0.894608, 1, 1, 1, 1, 1,
0.7646615, 1.081183, -0.7166249, 1, 1, 1, 1, 1,
0.7652894, -0.03075225, 2.311358, 1, 1, 1, 1, 1,
0.7683184, 0.2641557, 0.3955554, 1, 1, 1, 1, 1,
0.7697906, 1.178115, -0.9982867, 1, 1, 1, 1, 1,
0.7702841, 1.073897, 0.5231871, 1, 1, 1, 1, 1,
0.7723938, 0.7251974, 1.888288, 1, 1, 1, 1, 1,
0.7770292, 0.4183524, 2.913773, 1, 1, 1, 1, 1,
0.7802281, 0.7469484, 1.390939, 0, 0, 1, 1, 1,
0.7832667, 1.630739, 1.153155, 1, 0, 0, 1, 1,
0.7832968, -0.2237401, 1.417099, 1, 0, 0, 1, 1,
0.783324, 0.8883703, 0.9088765, 1, 0, 0, 1, 1,
0.78415, -0.6945394, 2.012634, 1, 0, 0, 1, 1,
0.7873724, -0.502771, 0.944527, 1, 0, 0, 1, 1,
0.7874311, 0.1361589, 1.217624, 0, 0, 0, 1, 1,
0.7934285, -0.5972801, 0.7924424, 0, 0, 0, 1, 1,
0.7954301, -0.6075985, 1.957194, 0, 0, 0, 1, 1,
0.7968301, 0.846231, 0.153219, 0, 0, 0, 1, 1,
0.8009997, -1.900908, 3.434842, 0, 0, 0, 1, 1,
0.8033196, 0.06082052, 1.820934, 0, 0, 0, 1, 1,
0.8096281, 2.189662, 2.055138, 0, 0, 0, 1, 1,
0.8149196, 1.22356, 0.5721346, 1, 1, 1, 1, 1,
0.8154839, 0.5607417, 2.014013, 1, 1, 1, 1, 1,
0.8156005, -0.2389511, 1.787701, 1, 1, 1, 1, 1,
0.8157481, 2.918531, 0.09280512, 1, 1, 1, 1, 1,
0.8165097, 0.5140844, 2.17219, 1, 1, 1, 1, 1,
0.8218458, 0.8779026, -1.169451, 1, 1, 1, 1, 1,
0.8238907, -0.3786441, 2.471712, 1, 1, 1, 1, 1,
0.8327031, -0.8744318, 2.329844, 1, 1, 1, 1, 1,
0.8351025, -1.711816, 4.700564, 1, 1, 1, 1, 1,
0.8359959, -0.644643, 3.042864, 1, 1, 1, 1, 1,
0.8369287, -0.9809123, 2.593997, 1, 1, 1, 1, 1,
0.8370422, -1.983383, 3.478599, 1, 1, 1, 1, 1,
0.8433148, -1.336957, 3.621129, 1, 1, 1, 1, 1,
0.8465027, -0.7086064, 2.767405, 1, 1, 1, 1, 1,
0.8470473, -0.6374425, 1.073596, 1, 1, 1, 1, 1,
0.8488183, -1.299065, 1.480447, 0, 0, 1, 1, 1,
0.8497643, -0.3967146, 2.113146, 1, 0, 0, 1, 1,
0.8505929, -1.335539, 3.446684, 1, 0, 0, 1, 1,
0.8510659, 2.151573, 1.660684, 1, 0, 0, 1, 1,
0.8526794, 1.422384, 0.7240015, 1, 0, 0, 1, 1,
0.8647369, -0.3431807, 3.286876, 1, 0, 0, 1, 1,
0.8664595, 0.8919195, 0.8484815, 0, 0, 0, 1, 1,
0.8710944, 0.6661131, 0.6128076, 0, 0, 0, 1, 1,
0.8725286, 0.3266478, 1.176779, 0, 0, 0, 1, 1,
0.8785098, -0.2958088, 1.802408, 0, 0, 0, 1, 1,
0.8812129, -1.54926, 1.665047, 0, 0, 0, 1, 1,
0.8818524, 1.464214, 0.5931073, 0, 0, 0, 1, 1,
0.8828353, -0.4668829, 1.758078, 0, 0, 0, 1, 1,
0.8886755, 2.455583, 0.02394971, 1, 1, 1, 1, 1,
0.8911827, -0.9394774, 1.769607, 1, 1, 1, 1, 1,
0.893245, 0.8000731, -0.04245176, 1, 1, 1, 1, 1,
0.8935297, 1.65207, 1.883842, 1, 1, 1, 1, 1,
0.8962778, -0.426731, 0.173927, 1, 1, 1, 1, 1,
0.8977856, -0.132439, 2.084523, 1, 1, 1, 1, 1,
0.9054844, 0.275062, 1.764186, 1, 1, 1, 1, 1,
0.9095401, 0.8206016, -0.5128213, 1, 1, 1, 1, 1,
0.9128903, 0.5555522, 0.3056647, 1, 1, 1, 1, 1,
0.91615, 1.312865, -1.215119, 1, 1, 1, 1, 1,
0.926375, -0.6404717, 2.393181, 1, 1, 1, 1, 1,
0.9335486, 0.2823253, 1.865449, 1, 1, 1, 1, 1,
0.9350519, 0.3188885, 0.5216289, 1, 1, 1, 1, 1,
0.9412912, -1.097533, 3.22301, 1, 1, 1, 1, 1,
0.9426972, 0.6448667, 1.450416, 1, 1, 1, 1, 1,
0.9480098, 1.75185, 0.3508263, 0, 0, 1, 1, 1,
0.9522282, 1.408916, 0.1248824, 1, 0, 0, 1, 1,
0.9527183, 0.6683158, 2.471558, 1, 0, 0, 1, 1,
0.9531934, 0.5166018, 1.135817, 1, 0, 0, 1, 1,
0.9607029, -1.242985, 3.046898, 1, 0, 0, 1, 1,
0.968905, -2.135527, 2.81834, 1, 0, 0, 1, 1,
0.9776349, 0.3245257, 2.598172, 0, 0, 0, 1, 1,
0.9796154, 0.6888824, 1.520826, 0, 0, 0, 1, 1,
0.9797832, -0.5490276, 1.381336, 0, 0, 0, 1, 1,
0.980212, -0.01024799, 1.721363, 0, 0, 0, 1, 1,
0.9804056, 0.7660104, 0.9263382, 0, 0, 0, 1, 1,
0.9811435, -0.2581152, 1.629003, 0, 0, 0, 1, 1,
0.9886089, -1.378332, 3.337296, 0, 0, 0, 1, 1,
0.9921896, 0.5409125, 0.3043276, 1, 1, 1, 1, 1,
1.000869, 0.010043, 0.5750433, 1, 1, 1, 1, 1,
1.009731, -0.299206, 2.199347, 1, 1, 1, 1, 1,
1.010865, -0.2987295, 1.648951, 1, 1, 1, 1, 1,
1.011505, -1.709032, 3.200799, 1, 1, 1, 1, 1,
1.023264, 1.548122, 1.704962, 1, 1, 1, 1, 1,
1.03385, 1.272075, 0.6074247, 1, 1, 1, 1, 1,
1.039378, -2.740263, 2.898533, 1, 1, 1, 1, 1,
1.043567, 0.8342603, 0.1827442, 1, 1, 1, 1, 1,
1.044926, -1.857931, 1.841456, 1, 1, 1, 1, 1,
1.046004, -1.391276, 1.668771, 1, 1, 1, 1, 1,
1.048255, 0.004668281, 1.791425, 1, 1, 1, 1, 1,
1.048298, 0.8118867, 1.325357, 1, 1, 1, 1, 1,
1.058801, -0.502196, 1.697436, 1, 1, 1, 1, 1,
1.06145, 2.812396, 1.477393, 1, 1, 1, 1, 1,
1.069327, 1.092788, 0.5117425, 0, 0, 1, 1, 1,
1.071428, -2.581608, 5.118909, 1, 0, 0, 1, 1,
1.075532, 0.7863067, 1.201026, 1, 0, 0, 1, 1,
1.075946, 0.4544213, 1.034889, 1, 0, 0, 1, 1,
1.076052, 1.497492, -1.008429, 1, 0, 0, 1, 1,
1.081305, -0.9401957, 1.874393, 1, 0, 0, 1, 1,
1.084222, 0.4235504, 0.4796152, 0, 0, 0, 1, 1,
1.086432, 0.3319258, 2.643831, 0, 0, 0, 1, 1,
1.089302, 0.02256998, -0.1475188, 0, 0, 0, 1, 1,
1.089524, 1.442834, -0.05159998, 0, 0, 0, 1, 1,
1.095266, -0.230504, 1.530649, 0, 0, 0, 1, 1,
1.095666, -0.4625311, 1.359779, 0, 0, 0, 1, 1,
1.116002, -0.1077722, 1.726942, 0, 0, 0, 1, 1,
1.119301, 0.3923802, 0.3732873, 1, 1, 1, 1, 1,
1.128897, -0.09973752, 1.928154, 1, 1, 1, 1, 1,
1.129951, -0.4454573, 1.036852, 1, 1, 1, 1, 1,
1.135386, 1.867473, 0.5640897, 1, 1, 1, 1, 1,
1.13911, -2.200741, 2.469385, 1, 1, 1, 1, 1,
1.139699, 0.6138238, 1.792476, 1, 1, 1, 1, 1,
1.141737, 1.617457, 0.2514516, 1, 1, 1, 1, 1,
1.143054, -0.5609521, 1.40117, 1, 1, 1, 1, 1,
1.150766, 1.082203, 0.5740121, 1, 1, 1, 1, 1,
1.151981, 0.3060308, 1.712963, 1, 1, 1, 1, 1,
1.161686, -2.826393, 2.556494, 1, 1, 1, 1, 1,
1.164974, 1.276076, 0.3471958, 1, 1, 1, 1, 1,
1.194772, -2.021285, 2.55576, 1, 1, 1, 1, 1,
1.207777, 0.1832024, 2.65511, 1, 1, 1, 1, 1,
1.217361, 0.4469349, 1.904585, 1, 1, 1, 1, 1,
1.223689, 1.384106, -0.0347366, 0, 0, 1, 1, 1,
1.225001, -0.6971875, 2.460613, 1, 0, 0, 1, 1,
1.228377, 1.60678, 1.138923, 1, 0, 0, 1, 1,
1.2288, -0.7418028, 1.555688, 1, 0, 0, 1, 1,
1.23939, -0.2962177, 0.5148165, 1, 0, 0, 1, 1,
1.243829, -0.5241448, 3.12857, 1, 0, 0, 1, 1,
1.245963, -1.079036, 2.659288, 0, 0, 0, 1, 1,
1.26357, -0.1893899, 2.314872, 0, 0, 0, 1, 1,
1.268896, -0.3230295, 2.718868, 0, 0, 0, 1, 1,
1.282713, 0.3092684, 1.736433, 0, 0, 0, 1, 1,
1.288336, -1.12217, 2.042471, 0, 0, 0, 1, 1,
1.313068, -1.710506, 2.508848, 0, 0, 0, 1, 1,
1.317197, -0.9906893, 1.103708, 0, 0, 0, 1, 1,
1.349111, 0.6888061, 0.5092884, 1, 1, 1, 1, 1,
1.349998, 0.3975523, 0.350212, 1, 1, 1, 1, 1,
1.354284, -1.096211, 2.921359, 1, 1, 1, 1, 1,
1.369731, -0.1407636, 0.2460863, 1, 1, 1, 1, 1,
1.378123, 1.297285, 0.989415, 1, 1, 1, 1, 1,
1.382336, -0.3864175, 1.210822, 1, 1, 1, 1, 1,
1.38252, 0.2928736, 2.002401, 1, 1, 1, 1, 1,
1.383705, 0.5923058, 0.5024847, 1, 1, 1, 1, 1,
1.400648, -0.1808508, 0.662894, 1, 1, 1, 1, 1,
1.410202, -0.2091277, 2.336177, 1, 1, 1, 1, 1,
1.446734, -0.7010226, 1.263875, 1, 1, 1, 1, 1,
1.447356, 0.7125575, 1.958997, 1, 1, 1, 1, 1,
1.45584, 0.9274381, 0.7480622, 1, 1, 1, 1, 1,
1.467335, 0.1241182, 1.145955, 1, 1, 1, 1, 1,
1.469229, 2.377825, 1.670186, 1, 1, 1, 1, 1,
1.476031, -0.2117393, 1.935912, 0, 0, 1, 1, 1,
1.476095, 1.234104, 1.628404, 1, 0, 0, 1, 1,
1.47763, 2.596265, 0.2769005, 1, 0, 0, 1, 1,
1.490838, -0.4684694, 1.981593, 1, 0, 0, 1, 1,
1.491035, 0.4405818, 0.1633489, 1, 0, 0, 1, 1,
1.503303, -0.3259061, 0.05117844, 1, 0, 0, 1, 1,
1.510868, -0.1752654, 1.681676, 0, 0, 0, 1, 1,
1.512672, -1.18004, 3.173922, 0, 0, 0, 1, 1,
1.534261, -0.6047153, 0.6390067, 0, 0, 0, 1, 1,
1.537585, -1.198597, 0.5687496, 0, 0, 0, 1, 1,
1.544274, -0.3515314, 1.656685, 0, 0, 0, 1, 1,
1.548103, -1.345999, 2.966096, 0, 0, 0, 1, 1,
1.571118, 0.5550049, 0.4469506, 0, 0, 0, 1, 1,
1.573413, 0.6028177, 1.07391, 1, 1, 1, 1, 1,
1.599219, 0.1381459, 1.235992, 1, 1, 1, 1, 1,
1.602882, 1.16069, -0.8430016, 1, 1, 1, 1, 1,
1.608789, -1.839496, 3.644903, 1, 1, 1, 1, 1,
1.613615, -0.7655049, 2.938782, 1, 1, 1, 1, 1,
1.625532, 0.7301587, 0.00568248, 1, 1, 1, 1, 1,
1.632122, -0.8378481, 2.647222, 1, 1, 1, 1, 1,
1.632679, -0.3099806, 2.897596, 1, 1, 1, 1, 1,
1.662564, 0.2451457, 0.9129276, 1, 1, 1, 1, 1,
1.667502, 0.7406241, 0.9278075, 1, 1, 1, 1, 1,
1.674702, -0.6554682, 3.565527, 1, 1, 1, 1, 1,
1.675889, -0.8824162, 1.603888, 1, 1, 1, 1, 1,
1.675984, 0.6819267, -0.3688489, 1, 1, 1, 1, 1,
1.679169, 1.527361, -0.6550781, 1, 1, 1, 1, 1,
1.681523, 0.641699, 2.591797, 1, 1, 1, 1, 1,
1.699769, -0.2239721, 0.1222902, 0, 0, 1, 1, 1,
1.731497, -0.2310752, 0.2010813, 1, 0, 0, 1, 1,
1.740964, -1.239315, 2.171942, 1, 0, 0, 1, 1,
1.750493, -1.032677, 3.501707, 1, 0, 0, 1, 1,
1.758366, -0.6151174, 1.059007, 1, 0, 0, 1, 1,
1.761524, 2.564396, 1.834939, 1, 0, 0, 1, 1,
1.762089, 1.561309, 0.06867811, 0, 0, 0, 1, 1,
1.78722, -0.4981205, 3.269522, 0, 0, 0, 1, 1,
1.813884, 1.295169, 0.7784075, 0, 0, 0, 1, 1,
1.816323, 0.7998773, 1.751302, 0, 0, 0, 1, 1,
1.839902, 1.157582, 0.7665274, 0, 0, 0, 1, 1,
1.859018, 1.227122, -0.3887702, 0, 0, 0, 1, 1,
1.865018, -0.5945933, 1.449903, 0, 0, 0, 1, 1,
1.870657, 1.040149, 2.482481, 1, 1, 1, 1, 1,
1.878722, -0.1756618, 2.905877, 1, 1, 1, 1, 1,
1.888019, 1.412617, 1.370242, 1, 1, 1, 1, 1,
1.892775, 0.8836327, -0.01748163, 1, 1, 1, 1, 1,
1.914126, 2.150966, -0.9235345, 1, 1, 1, 1, 1,
1.933942, -1.647053, 2.210567, 1, 1, 1, 1, 1,
2.021185, 1.972593, 1.814219, 1, 1, 1, 1, 1,
2.031885, -0.7629519, 2.974318, 1, 1, 1, 1, 1,
2.054793, -1.270389, 2.280596, 1, 1, 1, 1, 1,
2.074396, 0.3564149, 1.07574, 1, 1, 1, 1, 1,
2.076913, 0.5375805, -0.4360482, 1, 1, 1, 1, 1,
2.077998, -0.003687079, 3.76516, 1, 1, 1, 1, 1,
2.079171, -0.3136593, 1.34764, 1, 1, 1, 1, 1,
2.109797, 0.6349013, 0.7172894, 1, 1, 1, 1, 1,
2.146922, 0.6458189, 1.196903, 1, 1, 1, 1, 1,
2.162388, 0.9866333, 0.9118756, 0, 0, 1, 1, 1,
2.223403, 0.8265008, 4.478334, 1, 0, 0, 1, 1,
2.238339, 0.1056978, 0.8932622, 1, 0, 0, 1, 1,
2.250582, -1.50098, 1.804331, 1, 0, 0, 1, 1,
2.25106, 0.3785017, 1.925138, 1, 0, 0, 1, 1,
2.255279, 0.006988458, 1.054471, 1, 0, 0, 1, 1,
2.278404, 1.087598, 1.06952, 0, 0, 0, 1, 1,
2.290685, 0.6502925, 0.4875236, 0, 0, 0, 1, 1,
2.299562, -1.023655, 1.802046, 0, 0, 0, 1, 1,
2.306785, -0.4990777, 1.539631, 0, 0, 0, 1, 1,
2.311541, -0.7648028, 2.756859, 0, 0, 0, 1, 1,
2.316694, 1.416168, 1.076956, 0, 0, 0, 1, 1,
2.327242, 0.2115476, 0.203475, 0, 0, 0, 1, 1,
2.344858, -1.334184, 2.616406, 1, 1, 1, 1, 1,
2.485738, -2.724673, 3.464655, 1, 1, 1, 1, 1,
2.493021, 0.659763, 1.537947, 1, 1, 1, 1, 1,
2.757507, 0.8311802, 0.7105678, 1, 1, 1, 1, 1,
2.969996, 1.109544, 0.4912789, 1, 1, 1, 1, 1,
3.417114, -0.2996962, 3.665107, 1, 1, 1, 1, 1,
3.755711, -0.1002042, 1.81629, 1, 1, 1, 1, 1
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
var radius = 9.753037;
var distance = 34.25713;
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
mvMatrix.translate( -0.3544693, -0.3801373, 0.006696224 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.25713);
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