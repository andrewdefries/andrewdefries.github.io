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
-4.179638, 0.6869279, -2.336922, 1, 0, 0, 1,
-3.121624, -1.043165, -3.133217, 1, 0.007843138, 0, 1,
-3.0839, -2.544499, -2.011759, 1, 0.01176471, 0, 1,
-2.801338, 0.8069481, -0.4329935, 1, 0.01960784, 0, 1,
-2.738973, -0.1590401, -0.8655071, 1, 0.02352941, 0, 1,
-2.634578, -0.6305838, -1.254053, 1, 0.03137255, 0, 1,
-2.594925, 1.533887, -1.218331, 1, 0.03529412, 0, 1,
-2.532723, 1.178285, -1.12062, 1, 0.04313726, 0, 1,
-2.360662, -2.077438, -3.113514, 1, 0.04705882, 0, 1,
-2.327564, 0.2770704, -1.172364, 1, 0.05490196, 0, 1,
-2.237588, -0.693732, -1.25746, 1, 0.05882353, 0, 1,
-2.201688, 0.2086029, -2.730604, 1, 0.06666667, 0, 1,
-2.142649, -0.8795803, -3.109322, 1, 0.07058824, 0, 1,
-2.049754, 0.2440137, -1.125068, 1, 0.07843138, 0, 1,
-2.010096, -0.8764181, -2.125527, 1, 0.08235294, 0, 1,
-1.998821, 1.120967, -1.282364, 1, 0.09019608, 0, 1,
-1.996377, -0.1770096, -0.5392036, 1, 0.09411765, 0, 1,
-1.996358, 1.787398, -0.01322801, 1, 0.1019608, 0, 1,
-1.995659, -0.2797819, -0.3548063, 1, 0.1098039, 0, 1,
-1.94421, -0.3871923, -1.019784, 1, 0.1137255, 0, 1,
-1.942685, -0.9196852, -2.666959, 1, 0.1215686, 0, 1,
-1.941091, 1.575377, 0.408836, 1, 0.1254902, 0, 1,
-1.935558, -1.300075, -1.737505, 1, 0.1333333, 0, 1,
-1.91955, 0.3210622, -1.475712, 1, 0.1372549, 0, 1,
-1.898383, 1.524519, -0.4275826, 1, 0.145098, 0, 1,
-1.861805, -0.5202917, -1.967878, 1, 0.1490196, 0, 1,
-1.851425, -0.7928911, -3.224749, 1, 0.1568628, 0, 1,
-1.844905, 0.9169358, -1.27087, 1, 0.1607843, 0, 1,
-1.811388, -2.3018, -0.7738686, 1, 0.1686275, 0, 1,
-1.800343, -0.3298661, -0.7357811, 1, 0.172549, 0, 1,
-1.774783, -0.8015148, -3.079386, 1, 0.1803922, 0, 1,
-1.759878, -1.200737, -1.630432, 1, 0.1843137, 0, 1,
-1.756909, -0.06220126, 0.5040426, 1, 0.1921569, 0, 1,
-1.743639, 0.5933152, -1.441143, 1, 0.1960784, 0, 1,
-1.731685, 0.6064726, -0.8942385, 1, 0.2039216, 0, 1,
-1.698284, 0.7429979, -0.8408382, 1, 0.2117647, 0, 1,
-1.695251, 0.4660982, -1.842143, 1, 0.2156863, 0, 1,
-1.683944, 0.9572233, -0.5129794, 1, 0.2235294, 0, 1,
-1.67958, 1.779068, -0.2959193, 1, 0.227451, 0, 1,
-1.63331, -2.002927, -1.997802, 1, 0.2352941, 0, 1,
-1.63044, -0.3832951, -2.22991, 1, 0.2392157, 0, 1,
-1.621975, -0.8525415, -2.618625, 1, 0.2470588, 0, 1,
-1.620786, -1.124342, -4.080727, 1, 0.2509804, 0, 1,
-1.588194, 1.138931, -1.539418, 1, 0.2588235, 0, 1,
-1.572566, 0.3771514, -2.719087, 1, 0.2627451, 0, 1,
-1.57108, 0.3528084, -2.659462, 1, 0.2705882, 0, 1,
-1.570757, 1.273048, -1.512784, 1, 0.2745098, 0, 1,
-1.5507, -0.5828465, -3.156524, 1, 0.282353, 0, 1,
-1.539219, -0.3605331, -1.601237, 1, 0.2862745, 0, 1,
-1.538809, 2.091193, -1.350307, 1, 0.2941177, 0, 1,
-1.519039, 0.05970157, -2.429352, 1, 0.3019608, 0, 1,
-1.518076, 0.2614384, -1.079608, 1, 0.3058824, 0, 1,
-1.507954, -1.561247, -0.5739285, 1, 0.3137255, 0, 1,
-1.507076, 0.2193469, -4.02574, 1, 0.3176471, 0, 1,
-1.503255, -1.489075, -1.435636, 1, 0.3254902, 0, 1,
-1.49874, -0.9060676, -3.470933, 1, 0.3294118, 0, 1,
-1.497927, -1.733621, -3.262123, 1, 0.3372549, 0, 1,
-1.489848, -0.8435122, -2.917346, 1, 0.3411765, 0, 1,
-1.472506, 1.407791, -1.146789, 1, 0.3490196, 0, 1,
-1.468069, -0.4618616, -1.397591, 1, 0.3529412, 0, 1,
-1.466332, 0.9643452, -0.1851713, 1, 0.3607843, 0, 1,
-1.464795, -0.05260343, -2.709434, 1, 0.3647059, 0, 1,
-1.443884, 0.3552064, -1.869351, 1, 0.372549, 0, 1,
-1.440645, -1.310036, -3.589203, 1, 0.3764706, 0, 1,
-1.434332, 0.275717, -1.329328, 1, 0.3843137, 0, 1,
-1.42093, 0.04557858, -2.2978, 1, 0.3882353, 0, 1,
-1.41881, -2.100362, -2.416884, 1, 0.3960784, 0, 1,
-1.418407, 0.4916463, -1.274912, 1, 0.4039216, 0, 1,
-1.408794, -0.02219172, -2.616871, 1, 0.4078431, 0, 1,
-1.398107, 0.5712966, -1.353377, 1, 0.4156863, 0, 1,
-1.380987, 0.1029503, -1.762345, 1, 0.4196078, 0, 1,
-1.368502, 1.040539, 1.014386, 1, 0.427451, 0, 1,
-1.363662, -0.2046329, -2.060392, 1, 0.4313726, 0, 1,
-1.352749, 0.6947195, -1.342306, 1, 0.4392157, 0, 1,
-1.343138, -1.946057, -2.975125, 1, 0.4431373, 0, 1,
-1.322608, -1.501516, -2.020892, 1, 0.4509804, 0, 1,
-1.316537, -1.453859, -2.018865, 1, 0.454902, 0, 1,
-1.313331, 0.2921296, -0.680897, 1, 0.4627451, 0, 1,
-1.297738, 1.74613, -0.2016567, 1, 0.4666667, 0, 1,
-1.293344, 0.0277852, -2.153898, 1, 0.4745098, 0, 1,
-1.287908, 0.2217237, 0.7514847, 1, 0.4784314, 0, 1,
-1.282565, 0.451448, -1.371278, 1, 0.4862745, 0, 1,
-1.281985, -0.8663681, -1.994354, 1, 0.4901961, 0, 1,
-1.274053, 0.2771493, 0.1606268, 1, 0.4980392, 0, 1,
-1.262329, 0.416626, -0.241565, 1, 0.5058824, 0, 1,
-1.249549, -0.7566609, -2.469341, 1, 0.509804, 0, 1,
-1.249282, 0.8308533, -0.01679701, 1, 0.5176471, 0, 1,
-1.236324, 0.2383286, 0.1099572, 1, 0.5215687, 0, 1,
-1.233741, -1.272329, -2.616397, 1, 0.5294118, 0, 1,
-1.232831, -2.006348, -2.804308, 1, 0.5333334, 0, 1,
-1.229697, 2.037147, -0.5804127, 1, 0.5411765, 0, 1,
-1.225532, 0.8336895, 0.02441659, 1, 0.5450981, 0, 1,
-1.223108, 0.3336053, 0.843778, 1, 0.5529412, 0, 1,
-1.21999, 1.529413, 0.6372074, 1, 0.5568628, 0, 1,
-1.198835, 0.1939949, -1.39416, 1, 0.5647059, 0, 1,
-1.195955, 0.4333031, -2.779012, 1, 0.5686275, 0, 1,
-1.188046, -0.6067588, -1.61116, 1, 0.5764706, 0, 1,
-1.186456, 1.276373, -1.907047, 1, 0.5803922, 0, 1,
-1.175215, -1.363934, -1.443149, 1, 0.5882353, 0, 1,
-1.160431, 0.08497621, -2.727791, 1, 0.5921569, 0, 1,
-1.159637, -0.1848525, 0.3725131, 1, 0.6, 0, 1,
-1.157801, -0.9539133, -3.107018, 1, 0.6078432, 0, 1,
-1.156686, 0.1695846, -1.900343, 1, 0.6117647, 0, 1,
-1.152918, -0.4368019, -1.131783, 1, 0.6196079, 0, 1,
-1.150549, 1.611355, -2.750428, 1, 0.6235294, 0, 1,
-1.137003, -0.501132, -1.241154, 1, 0.6313726, 0, 1,
-1.135694, -0.1685899, -0.6547845, 1, 0.6352941, 0, 1,
-1.132281, 0.4833582, -2.094015, 1, 0.6431373, 0, 1,
-1.116881, -0.2824314, -1.830614, 1, 0.6470588, 0, 1,
-1.111533, 0.7453256, -1.307959, 1, 0.654902, 0, 1,
-1.105556, -1.188558, -1.731221, 1, 0.6588235, 0, 1,
-1.100928, -0.5566983, -0.9472173, 1, 0.6666667, 0, 1,
-1.097879, 0.6542422, -1.447882, 1, 0.6705883, 0, 1,
-1.096556, -0.6358587, -3.225316, 1, 0.6784314, 0, 1,
-1.095676, 0.1723169, -2.063851, 1, 0.682353, 0, 1,
-1.08649, 0.3830048, -0.4652327, 1, 0.6901961, 0, 1,
-1.084234, 0.9904129, -1.568838, 1, 0.6941177, 0, 1,
-1.081453, -0.22785, -1.751709, 1, 0.7019608, 0, 1,
-1.068883, -0.578433, -2.11615, 1, 0.7098039, 0, 1,
-1.064616, -1.172271, -2.92228, 1, 0.7137255, 0, 1,
-1.063692, -0.3942673, -1.442584, 1, 0.7215686, 0, 1,
-1.060564, 1.301013, -1.143061, 1, 0.7254902, 0, 1,
-1.059345, -2.046603, -2.359389, 1, 0.7333333, 0, 1,
-1.059044, 1.079972, -1.533751, 1, 0.7372549, 0, 1,
-1.053336, 0.3483827, -1.587365, 1, 0.7450981, 0, 1,
-1.046346, 0.5697371, -1.449719, 1, 0.7490196, 0, 1,
-1.040222, -1.465763, -1.840063, 1, 0.7568628, 0, 1,
-1.039492, -0.7917112, -2.046548, 1, 0.7607843, 0, 1,
-1.038578, 0.322423, -1.398123, 1, 0.7686275, 0, 1,
-1.006409, -0.01822622, -1.145115, 1, 0.772549, 0, 1,
-1.006324, -0.5733961, -2.806164, 1, 0.7803922, 0, 1,
-1.002982, -2.13824, -1.777064, 1, 0.7843137, 0, 1,
-1.002318, 0.8812718, 0.81333, 1, 0.7921569, 0, 1,
-0.9987434, -0.3835912, -2.415913, 1, 0.7960784, 0, 1,
-0.9966382, 0.3662027, -0.848007, 1, 0.8039216, 0, 1,
-0.9909136, -0.2922983, -1.423337, 1, 0.8117647, 0, 1,
-0.9877689, 0.1784848, -2.143132, 1, 0.8156863, 0, 1,
-0.9851328, -0.2424162, -0.5391185, 1, 0.8235294, 0, 1,
-0.9835521, -1.572663, -3.112309, 1, 0.827451, 0, 1,
-0.9815139, -2.031781, -2.092433, 1, 0.8352941, 0, 1,
-0.9777455, -0.2825793, -0.8616547, 1, 0.8392157, 0, 1,
-0.9696448, 0.4705298, -1.609597, 1, 0.8470588, 0, 1,
-0.9672068, 0.7827895, 0.4407723, 1, 0.8509804, 0, 1,
-0.9654156, 1.60491, -0.2418162, 1, 0.8588235, 0, 1,
-0.9548234, -0.669841, -1.861721, 1, 0.8627451, 0, 1,
-0.9460032, -0.3976851, -3.060384, 1, 0.8705882, 0, 1,
-0.9389417, -0.1419853, -1.801179, 1, 0.8745098, 0, 1,
-0.9339983, -0.3810259, -1.983827, 1, 0.8823529, 0, 1,
-0.9338539, -0.760209, -1.366581, 1, 0.8862745, 0, 1,
-0.9301443, 0.7034587, 0.9766393, 1, 0.8941177, 0, 1,
-0.9299097, -0.249722, -1.368233, 1, 0.8980392, 0, 1,
-0.9291806, 0.8795283, 1.316774, 1, 0.9058824, 0, 1,
-0.9281678, -0.3997386, -2.43042, 1, 0.9137255, 0, 1,
-0.9278415, -0.4452114, -1.258905, 1, 0.9176471, 0, 1,
-0.9234329, -1.631051, -3.120634, 1, 0.9254902, 0, 1,
-0.919143, 0.7214614, -0.3340429, 1, 0.9294118, 0, 1,
-0.9185396, 0.4757755, -2.150042, 1, 0.9372549, 0, 1,
-0.9182039, -0.0422472, -0.1983496, 1, 0.9411765, 0, 1,
-0.9143276, -1.530181, -3.053088, 1, 0.9490196, 0, 1,
-0.9141289, -1.608604, -1.963802, 1, 0.9529412, 0, 1,
-0.9138002, 0.5239819, -0.7718828, 1, 0.9607843, 0, 1,
-0.912993, -0.5830706, -1.94847, 1, 0.9647059, 0, 1,
-0.9114747, 0.1994808, -2.022669, 1, 0.972549, 0, 1,
-0.9041622, 1.018449, -1.002183, 1, 0.9764706, 0, 1,
-0.9033369, -0.9013804, -2.349995, 1, 0.9843137, 0, 1,
-0.8991882, -0.2183166, -3.578528, 1, 0.9882353, 0, 1,
-0.8985692, 0.1429687, -3.561904, 1, 0.9960784, 0, 1,
-0.8978159, -0.3635435, -0.8072531, 0.9960784, 1, 0, 1,
-0.8878533, -0.8747013, -3.010469, 0.9921569, 1, 0, 1,
-0.8871434, 0.4610215, -0.3673352, 0.9843137, 1, 0, 1,
-0.8847356, 0.2395225, -2.535069, 0.9803922, 1, 0, 1,
-0.8789026, -1.158636, -1.838955, 0.972549, 1, 0, 1,
-0.8777224, 1.296637, -0.4442908, 0.9686275, 1, 0, 1,
-0.874362, 1.286954, -1.205544, 0.9607843, 1, 0, 1,
-0.8737246, 1.311825, -0.4365505, 0.9568627, 1, 0, 1,
-0.8687911, -0.7668801, -1.67575, 0.9490196, 1, 0, 1,
-0.8684614, -1.127146, -1.569501, 0.945098, 1, 0, 1,
-0.8670975, -0.4822686, -1.889459, 0.9372549, 1, 0, 1,
-0.8666459, -0.3795778, -2.599149, 0.9333333, 1, 0, 1,
-0.859809, 0.5161131, -0.4334923, 0.9254902, 1, 0, 1,
-0.8591858, 1.930288, -2.046773, 0.9215686, 1, 0, 1,
-0.8565911, 0.3237163, -2.020361, 0.9137255, 1, 0, 1,
-0.8350795, -0.2758298, -0.9392422, 0.9098039, 1, 0, 1,
-0.8320501, -1.096058, -3.535596, 0.9019608, 1, 0, 1,
-0.8273649, -0.971876, -3.697688, 0.8941177, 1, 0, 1,
-0.8235252, 1.767985, -1.59896, 0.8901961, 1, 0, 1,
-0.8226485, 1.167352, 0.2154336, 0.8823529, 1, 0, 1,
-0.8189256, -1.485852, -3.41543, 0.8784314, 1, 0, 1,
-0.8168276, -0.7276273, -2.654729, 0.8705882, 1, 0, 1,
-0.8135081, -0.09743475, -1.558533, 0.8666667, 1, 0, 1,
-0.8077285, -0.4000279, -0.6483533, 0.8588235, 1, 0, 1,
-0.8075602, -0.2613441, -3.470009, 0.854902, 1, 0, 1,
-0.8030678, 0.3763658, -1.556159, 0.8470588, 1, 0, 1,
-0.7949353, 0.4405988, -2.830896, 0.8431373, 1, 0, 1,
-0.7925453, -0.1612869, -1.163831, 0.8352941, 1, 0, 1,
-0.7923645, 0.3683957, -2.025522, 0.8313726, 1, 0, 1,
-0.7909575, -1.8319, -2.574101, 0.8235294, 1, 0, 1,
-0.7866282, 1.137877, -1.70002, 0.8196079, 1, 0, 1,
-0.7829217, -0.07716812, -1.737341, 0.8117647, 1, 0, 1,
-0.779565, 1.524391, 0.8502805, 0.8078431, 1, 0, 1,
-0.7756413, -0.4379647, -1.976219, 0.8, 1, 0, 1,
-0.7716912, 0.6089274, -0.01817323, 0.7921569, 1, 0, 1,
-0.7680736, 1.928287, 0.1258344, 0.7882353, 1, 0, 1,
-0.7666552, -0.3825163, -2.390523, 0.7803922, 1, 0, 1,
-0.7659278, -0.9997463, -1.00231, 0.7764706, 1, 0, 1,
-0.7597021, 2.035941, 1.112098, 0.7686275, 1, 0, 1,
-0.7546349, 0.4043951, 0.1577386, 0.7647059, 1, 0, 1,
-0.7505006, 1.241473, 0.08957064, 0.7568628, 1, 0, 1,
-0.750309, 0.7613069, -0.4150183, 0.7529412, 1, 0, 1,
-0.7499841, -1.229628, -2.676837, 0.7450981, 1, 0, 1,
-0.744432, 1.560119, -0.680223, 0.7411765, 1, 0, 1,
-0.7438273, 0.7061255, -0.6943393, 0.7333333, 1, 0, 1,
-0.7397093, 1.11147, 0.235764, 0.7294118, 1, 0, 1,
-0.7392775, -0.1677353, -1.862387, 0.7215686, 1, 0, 1,
-0.7371969, 0.9778939, -1.9258, 0.7176471, 1, 0, 1,
-0.7362772, -1.187669, -1.8561, 0.7098039, 1, 0, 1,
-0.7335027, -1.675588, -2.101032, 0.7058824, 1, 0, 1,
-0.7329956, -0.9434574, -2.391583, 0.6980392, 1, 0, 1,
-0.7300736, -0.4473916, -1.179503, 0.6901961, 1, 0, 1,
-0.7300515, -0.2819892, -3.003483, 0.6862745, 1, 0, 1,
-0.7127984, 0.07786551, -2.405839, 0.6784314, 1, 0, 1,
-0.7041727, -0.9045501, -1.679798, 0.6745098, 1, 0, 1,
-0.7036676, -1.190489, -2.146647, 0.6666667, 1, 0, 1,
-0.7034826, -0.3549905, -2.669669, 0.6627451, 1, 0, 1,
-0.7016665, 0.4945922, -0.4430972, 0.654902, 1, 0, 1,
-0.6932553, 0.4528484, 0.1809344, 0.6509804, 1, 0, 1,
-0.6929805, 1.025164, 0.2506111, 0.6431373, 1, 0, 1,
-0.691491, -0.3042204, -1.220145, 0.6392157, 1, 0, 1,
-0.6912717, 0.5202118, -2.228608, 0.6313726, 1, 0, 1,
-0.6873988, 0.2877723, -1.443434, 0.627451, 1, 0, 1,
-0.686337, 0.2284409, -1.730016, 0.6196079, 1, 0, 1,
-0.6851773, 1.133923, -1.09033, 0.6156863, 1, 0, 1,
-0.6780904, 0.2303634, 0.2897674, 0.6078432, 1, 0, 1,
-0.6766586, -0.2133681, -1.50649, 0.6039216, 1, 0, 1,
-0.6744381, -1.026161, -2.130642, 0.5960785, 1, 0, 1,
-0.6723465, -0.4057599, -2.028469, 0.5882353, 1, 0, 1,
-0.6666815, -0.9322547, -3.016976, 0.5843138, 1, 0, 1,
-0.663568, -0.07371965, -2.892018, 0.5764706, 1, 0, 1,
-0.6614838, -1.640641, -3.788918, 0.572549, 1, 0, 1,
-0.65943, 1.980576, 0.07658511, 0.5647059, 1, 0, 1,
-0.6592897, 1.754769, -0.2304767, 0.5607843, 1, 0, 1,
-0.6573392, 0.8820432, -0.3790221, 0.5529412, 1, 0, 1,
-0.65698, -1.245918, -2.678934, 0.5490196, 1, 0, 1,
-0.6568208, -0.1351606, -3.040851, 0.5411765, 1, 0, 1,
-0.6562572, 0.571169, -0.1642865, 0.5372549, 1, 0, 1,
-0.6495342, -1.476322, 0.269664, 0.5294118, 1, 0, 1,
-0.646189, 0.4710242, 1.554214, 0.5254902, 1, 0, 1,
-0.6343286, 0.9355837, 0.07004059, 0.5176471, 1, 0, 1,
-0.633123, 0.9989526, -2.232856, 0.5137255, 1, 0, 1,
-0.6328144, -0.4524607, -1.307012, 0.5058824, 1, 0, 1,
-0.6320161, 0.6427774, -1.64816, 0.5019608, 1, 0, 1,
-0.6281859, -0.8638566, -3.810606, 0.4941176, 1, 0, 1,
-0.6238644, -0.1343588, -2.420938, 0.4862745, 1, 0, 1,
-0.6125059, 0.8012865, -0.01351809, 0.4823529, 1, 0, 1,
-0.6083353, -0.2684237, -2.672557, 0.4745098, 1, 0, 1,
-0.6017107, -1.622292, -0.6062296, 0.4705882, 1, 0, 1,
-0.5994461, -1.042546, -3.415867, 0.4627451, 1, 0, 1,
-0.589038, 0.9214815, -0.8474494, 0.4588235, 1, 0, 1,
-0.587566, -0.8403152, -3.681599, 0.4509804, 1, 0, 1,
-0.5840428, 1.395933, -0.8739224, 0.4470588, 1, 0, 1,
-0.5839213, 0.5645859, 0.1310506, 0.4392157, 1, 0, 1,
-0.5828102, 1.125189, -0.4140561, 0.4352941, 1, 0, 1,
-0.5811828, 1.13536, -0.2675712, 0.427451, 1, 0, 1,
-0.5751984, -0.8087171, -2.579466, 0.4235294, 1, 0, 1,
-0.5736145, 0.6388665, -1.277446, 0.4156863, 1, 0, 1,
-0.5723513, 1.18689, -0.8660726, 0.4117647, 1, 0, 1,
-0.5713585, -0.2075425, -1.609293, 0.4039216, 1, 0, 1,
-0.5706477, 1.552918, -0.1014786, 0.3960784, 1, 0, 1,
-0.568357, 0.4881984, -0.7410922, 0.3921569, 1, 0, 1,
-0.5671143, 0.08368818, -1.917161, 0.3843137, 1, 0, 1,
-0.565836, 0.009019641, -2.556339, 0.3803922, 1, 0, 1,
-0.5630441, 0.7716786, 0.4095495, 0.372549, 1, 0, 1,
-0.5607925, -0.6095889, -2.246719, 0.3686275, 1, 0, 1,
-0.5497226, 0.4766594, -3.04846, 0.3607843, 1, 0, 1,
-0.5446615, 0.7314834, -0.7550669, 0.3568628, 1, 0, 1,
-0.5439638, 0.0784722, -1.811831, 0.3490196, 1, 0, 1,
-0.5369084, -0.3171918, -2.603378, 0.345098, 1, 0, 1,
-0.5362095, 0.04112427, -1.985203, 0.3372549, 1, 0, 1,
-0.5348431, 0.3141771, 1.313812, 0.3333333, 1, 0, 1,
-0.5326618, -0.7039344, -3.589195, 0.3254902, 1, 0, 1,
-0.5318497, -1.47203, -0.4661317, 0.3215686, 1, 0, 1,
-0.5249043, 0.3249234, -0.2372087, 0.3137255, 1, 0, 1,
-0.5195785, -0.4992092, -2.325151, 0.3098039, 1, 0, 1,
-0.5167153, 0.7134359, -1.651127, 0.3019608, 1, 0, 1,
-0.511853, 1.365321, -1.269868, 0.2941177, 1, 0, 1,
-0.508499, 0.5476817, 0.6466447, 0.2901961, 1, 0, 1,
-0.5071886, 0.137573, -2.789863, 0.282353, 1, 0, 1,
-0.4996148, -0.2378584, -2.406946, 0.2784314, 1, 0, 1,
-0.4994849, 0.08730343, -0.09728821, 0.2705882, 1, 0, 1,
-0.4988645, -1.192377, -2.951888, 0.2666667, 1, 0, 1,
-0.494777, 0.9553213, -0.968229, 0.2588235, 1, 0, 1,
-0.4861023, -0.9156666, -2.890266, 0.254902, 1, 0, 1,
-0.48149, -0.6694263, -2.323655, 0.2470588, 1, 0, 1,
-0.4811821, 1.669874, -0.6555791, 0.2431373, 1, 0, 1,
-0.4786902, 1.290448, -1.495319, 0.2352941, 1, 0, 1,
-0.4690312, 1.984863, -0.2676459, 0.2313726, 1, 0, 1,
-0.4658706, 1.598454, -0.2648143, 0.2235294, 1, 0, 1,
-0.465475, 0.6420637, -1.465381, 0.2196078, 1, 0, 1,
-0.4576307, -1.678427, -0.8944784, 0.2117647, 1, 0, 1,
-0.4518415, -0.3797012, -2.587386, 0.2078431, 1, 0, 1,
-0.4513167, -0.6002861, -2.763173, 0.2, 1, 0, 1,
-0.4471767, -1.867473, -4.038521, 0.1921569, 1, 0, 1,
-0.4426429, -0.1166579, -2.856416, 0.1882353, 1, 0, 1,
-0.4405012, 0.5462385, 0.7809765, 0.1803922, 1, 0, 1,
-0.436906, -0.4410614, -3.439666, 0.1764706, 1, 0, 1,
-0.4320045, -0.1862451, -2.237756, 0.1686275, 1, 0, 1,
-0.4318335, -0.1642778, -2.709931, 0.1647059, 1, 0, 1,
-0.430329, 0.9884111, 0.5668781, 0.1568628, 1, 0, 1,
-0.4280183, -0.3754675, -3.204416, 0.1529412, 1, 0, 1,
-0.4248761, -0.3790347, -2.339536, 0.145098, 1, 0, 1,
-0.4183259, 0.1960735, -1.830036, 0.1411765, 1, 0, 1,
-0.4163608, 0.8921672, -0.9421123, 0.1333333, 1, 0, 1,
-0.4147803, 1.671284, 0.3765658, 0.1294118, 1, 0, 1,
-0.4142086, -0.2742625, -3.425223, 0.1215686, 1, 0, 1,
-0.4139904, -1.043189, -4.632555, 0.1176471, 1, 0, 1,
-0.4122925, 0.8119657, 0.5104388, 0.1098039, 1, 0, 1,
-0.4107791, -0.2741493, -3.74179, 0.1058824, 1, 0, 1,
-0.4090634, -0.6068789, -3.906691, 0.09803922, 1, 0, 1,
-0.4074431, 0.224534, -0.3580319, 0.09019608, 1, 0, 1,
-0.4032898, -0.3848403, -3.003419, 0.08627451, 1, 0, 1,
-0.3969017, -1.143311, -2.588457, 0.07843138, 1, 0, 1,
-0.396339, 0.6832021, -0.3264141, 0.07450981, 1, 0, 1,
-0.3898028, -0.1003691, -1.555218, 0.06666667, 1, 0, 1,
-0.3876503, 0.01383557, -1.13782, 0.0627451, 1, 0, 1,
-0.3861017, 0.5772504, -2.120028, 0.05490196, 1, 0, 1,
-0.3823085, 0.3175987, -1.267827, 0.05098039, 1, 0, 1,
-0.3814915, 0.2527273, -0.5119591, 0.04313726, 1, 0, 1,
-0.3812907, 1.766372, -0.4310628, 0.03921569, 1, 0, 1,
-0.3804381, 0.9372203, -1.610986, 0.03137255, 1, 0, 1,
-0.3802305, 0.2719726, -2.231768, 0.02745098, 1, 0, 1,
-0.3800748, -0.09420279, 0.1874085, 0.01960784, 1, 0, 1,
-0.3800217, 1.573062, 0.8115647, 0.01568628, 1, 0, 1,
-0.3770098, -0.7672072, -2.596289, 0.007843138, 1, 0, 1,
-0.3760761, 0.3227118, -1.659925, 0.003921569, 1, 0, 1,
-0.3746094, -0.3776196, 0.2345783, 0, 1, 0.003921569, 1,
-0.3694097, 0.7705496, 0.9914784, 0, 1, 0.01176471, 1,
-0.3694049, 0.09045029, -0.3230579, 0, 1, 0.01568628, 1,
-0.3672168, 0.12739, -1.220201, 0, 1, 0.02352941, 1,
-0.3611622, 0.6074591, -1.062901, 0, 1, 0.02745098, 1,
-0.3594623, -1.233047, -4.075119, 0, 1, 0.03529412, 1,
-0.3567853, 1.514862, -0.4894356, 0, 1, 0.03921569, 1,
-0.3552137, 0.1769419, -0.8886331, 0, 1, 0.04705882, 1,
-0.3541154, -0.4854451, -2.541603, 0, 1, 0.05098039, 1,
-0.352812, 0.5816736, -0.2210346, 0, 1, 0.05882353, 1,
-0.3527631, -0.8611432, -2.704262, 0, 1, 0.0627451, 1,
-0.3518833, -0.4254438, -1.253897, 0, 1, 0.07058824, 1,
-0.3494186, -1.017784, -2.28409, 0, 1, 0.07450981, 1,
-0.345422, 0.9948773, 0.7324213, 0, 1, 0.08235294, 1,
-0.3442002, 0.1883373, -1.905247, 0, 1, 0.08627451, 1,
-0.342237, 1.343386, 0.286389, 0, 1, 0.09411765, 1,
-0.3422291, 0.451917, 1.153437, 0, 1, 0.1019608, 1,
-0.3422011, -0.4656115, -1.321028, 0, 1, 0.1058824, 1,
-0.3419056, 0.7431847, 0.3627776, 0, 1, 0.1137255, 1,
-0.3373826, 0.476404, -1.802572, 0, 1, 0.1176471, 1,
-0.3363862, 2.569289, 0.3500889, 0, 1, 0.1254902, 1,
-0.3134904, -0.6925097, -5.843173, 0, 1, 0.1294118, 1,
-0.3122809, -0.7308532, -2.773352, 0, 1, 0.1372549, 1,
-0.3102063, 0.8824723, -0.6393216, 0, 1, 0.1411765, 1,
-0.309178, -0.03375801, -2.002145, 0, 1, 0.1490196, 1,
-0.3045094, 0.7721927, -0.858838, 0, 1, 0.1529412, 1,
-0.30319, -1.157743, -2.487499, 0, 1, 0.1607843, 1,
-0.3020163, 1.285783, -0.7970966, 0, 1, 0.1647059, 1,
-0.2957892, -0.08572554, -2.95691, 0, 1, 0.172549, 1,
-0.2948138, 0.4620412, -1.431301, 0, 1, 0.1764706, 1,
-0.2939662, 0.1554978, -0.06792875, 0, 1, 0.1843137, 1,
-0.2920409, -0.3231353, -2.143298, 0, 1, 0.1882353, 1,
-0.2907596, -0.6715428, -2.777546, 0, 1, 0.1960784, 1,
-0.2849713, 0.4496927, -0.8341252, 0, 1, 0.2039216, 1,
-0.2790011, 0.2130811, 0.09424363, 0, 1, 0.2078431, 1,
-0.2786447, -0.6973898, -3.249915, 0, 1, 0.2156863, 1,
-0.2781375, -1.543322, -3.536837, 0, 1, 0.2196078, 1,
-0.2774774, 1.351214, -0.1285701, 0, 1, 0.227451, 1,
-0.2764612, -0.06503371, 0.6004158, 0, 1, 0.2313726, 1,
-0.2745843, -0.0483428, -0.7673225, 0, 1, 0.2392157, 1,
-0.2743732, 0.0798052, -1.822362, 0, 1, 0.2431373, 1,
-0.2741232, -0.5883687, -2.589763, 0, 1, 0.2509804, 1,
-0.264692, 0.07954138, -2.773036, 0, 1, 0.254902, 1,
-0.2642077, 0.3970507, -1.384819, 0, 1, 0.2627451, 1,
-0.2575337, 0.05819941, -4.010708, 0, 1, 0.2666667, 1,
-0.2564665, 0.2823907, -0.2167418, 0, 1, 0.2745098, 1,
-0.2558113, -0.2386179, -2.402184, 0, 1, 0.2784314, 1,
-0.2535414, -0.5237952, -3.250419, 0, 1, 0.2862745, 1,
-0.2507206, -0.4096062, -2.770485, 0, 1, 0.2901961, 1,
-0.2446162, 0.0717446, -2.097137, 0, 1, 0.2980392, 1,
-0.2405872, 0.4428903, -2.390358, 0, 1, 0.3058824, 1,
-0.2380297, 0.3013328, -0.05051015, 0, 1, 0.3098039, 1,
-0.2371318, 1.412092, -0.2240073, 0, 1, 0.3176471, 1,
-0.2364587, -0.3300681, -2.773213, 0, 1, 0.3215686, 1,
-0.2307917, -0.08832247, -2.16278, 0, 1, 0.3294118, 1,
-0.2307119, -1.709843, -2.248657, 0, 1, 0.3333333, 1,
-0.2286633, 0.9077979, 0.6127611, 0, 1, 0.3411765, 1,
-0.228343, 0.003291526, -1.645983, 0, 1, 0.345098, 1,
-0.2276951, 1.350317, 1.57542, 0, 1, 0.3529412, 1,
-0.2269844, -1.061188, -3.499671, 0, 1, 0.3568628, 1,
-0.2237543, -0.3590258, -3.706728, 0, 1, 0.3647059, 1,
-0.2236825, -0.8829448, -2.776467, 0, 1, 0.3686275, 1,
-0.2231674, 0.5677584, -3.665297, 0, 1, 0.3764706, 1,
-0.222271, 1.236297, -0.06313173, 0, 1, 0.3803922, 1,
-0.2219948, -0.5360429, -1.429091, 0, 1, 0.3882353, 1,
-0.2212977, 0.1043008, -0.5253464, 0, 1, 0.3921569, 1,
-0.2165789, 0.6114663, 0.2486872, 0, 1, 0.4, 1,
-0.2162016, 1.195487, -1.105515, 0, 1, 0.4078431, 1,
-0.215561, -1.379323, -2.703588, 0, 1, 0.4117647, 1,
-0.2152639, 1.339308, -0.4555764, 0, 1, 0.4196078, 1,
-0.214808, -0.1786228, -1.273474, 0, 1, 0.4235294, 1,
-0.2100552, 0.5701348, -0.7145754, 0, 1, 0.4313726, 1,
-0.203635, 0.5620553, -0.6828487, 0, 1, 0.4352941, 1,
-0.2024103, -1.728303, -3.984221, 0, 1, 0.4431373, 1,
-0.2007299, -0.9938498, -3.222177, 0, 1, 0.4470588, 1,
-0.1999535, -0.3392379, -1.655329, 0, 1, 0.454902, 1,
-0.199505, -0.2646924, -3.370859, 0, 1, 0.4588235, 1,
-0.1990931, 0.3453405, -1.221609, 0, 1, 0.4666667, 1,
-0.1985374, -0.2542201, -2.995859, 0, 1, 0.4705882, 1,
-0.1928772, -0.982729, -3.70316, 0, 1, 0.4784314, 1,
-0.1913457, -0.2156472, -2.993397, 0, 1, 0.4823529, 1,
-0.1884858, 1.084527, -0.6476753, 0, 1, 0.4901961, 1,
-0.1843224, 0.9550622, 0.7440028, 0, 1, 0.4941176, 1,
-0.180547, -0.7471852, -2.655649, 0, 1, 0.5019608, 1,
-0.1741625, 0.6965995, -0.5216722, 0, 1, 0.509804, 1,
-0.1694603, -1.653541, -3.748287, 0, 1, 0.5137255, 1,
-0.1679176, 0.2031345, -0.9908404, 0, 1, 0.5215687, 1,
-0.1647743, -0.2473459, -2.441905, 0, 1, 0.5254902, 1,
-0.1578206, 0.5069013, -0.3186107, 0, 1, 0.5333334, 1,
-0.1577026, 0.03623113, -1.713144, 0, 1, 0.5372549, 1,
-0.1511199, -0.30582, -3.58488, 0, 1, 0.5450981, 1,
-0.1504578, 0.5376425, -0.6321151, 0, 1, 0.5490196, 1,
-0.1486764, -0.2872065, -2.757769, 0, 1, 0.5568628, 1,
-0.1463782, 0.9808918, 0.9624987, 0, 1, 0.5607843, 1,
-0.1453676, -0.1779263, -2.364398, 0, 1, 0.5686275, 1,
-0.1437691, -1.560181, -4.454019, 0, 1, 0.572549, 1,
-0.1405214, -0.7020673, -2.314623, 0, 1, 0.5803922, 1,
-0.1381976, -0.4954603, -1.435565, 0, 1, 0.5843138, 1,
-0.1379215, -1.553805, -3.493227, 0, 1, 0.5921569, 1,
-0.137857, 0.1913548, 0.1229014, 0, 1, 0.5960785, 1,
-0.1374554, -0.1609385, -3.220822, 0, 1, 0.6039216, 1,
-0.1357501, 1.22072, -0.06563793, 0, 1, 0.6117647, 1,
-0.1347209, 2.412409, -0.3685751, 0, 1, 0.6156863, 1,
-0.1337491, 0.8316959, -1.244394, 0, 1, 0.6235294, 1,
-0.1281751, -0.4008753, -3.49604, 0, 1, 0.627451, 1,
-0.1241407, 1.489153, 0.313103, 0, 1, 0.6352941, 1,
-0.1236099, -2.149095, -1.923823, 0, 1, 0.6392157, 1,
-0.1182351, 2.041156, -0.6994575, 0, 1, 0.6470588, 1,
-0.117302, -0.6356295, -3.750731, 0, 1, 0.6509804, 1,
-0.1117386, -0.4921952, -2.373348, 0, 1, 0.6588235, 1,
-0.1045926, -0.5253813, -3.36775, 0, 1, 0.6627451, 1,
-0.104304, -0.2758472, -3.697736, 0, 1, 0.6705883, 1,
-0.1036202, 0.615629, -1.549022, 0, 1, 0.6745098, 1,
-0.1035855, -0.7755615, -3.526788, 0, 1, 0.682353, 1,
-0.1024625, -0.5386502, -4.213412, 0, 1, 0.6862745, 1,
-0.1016452, -0.9918783, -3.408884, 0, 1, 0.6941177, 1,
-0.09973563, 0.60027, -0.9890335, 0, 1, 0.7019608, 1,
-0.09962215, 1.846667, -0.8829092, 0, 1, 0.7058824, 1,
-0.09715363, -0.9415346, -0.8058025, 0, 1, 0.7137255, 1,
-0.0968808, 0.5679175, -1.020975, 0, 1, 0.7176471, 1,
-0.0962531, 0.6642988, -0.1190906, 0, 1, 0.7254902, 1,
-0.09238806, -0.2433406, -2.3222, 0, 1, 0.7294118, 1,
-0.0921237, -1.855244, -2.928136, 0, 1, 0.7372549, 1,
-0.0919783, -1.06842, -3.370512, 0, 1, 0.7411765, 1,
-0.09109433, -0.2683152, -3.385753, 0, 1, 0.7490196, 1,
-0.08574914, -2.042284, -3.21159, 0, 1, 0.7529412, 1,
-0.08227136, 0.346342, 0.6908444, 0, 1, 0.7607843, 1,
-0.07577081, -2.809262, -1.337426, 0, 1, 0.7647059, 1,
-0.07513344, 0.1807772, -2.408991, 0, 1, 0.772549, 1,
-0.06803064, 0.4987357, 0.1438528, 0, 1, 0.7764706, 1,
-0.06380641, 0.1077811, -1.400502, 0, 1, 0.7843137, 1,
-0.06292167, -1.063113, -2.480208, 0, 1, 0.7882353, 1,
-0.06262597, 0.877125, -2.36255, 0, 1, 0.7960784, 1,
-0.06255542, -1.207087, -4.387898, 0, 1, 0.8039216, 1,
-0.06173664, -0.2478721, -2.584131, 0, 1, 0.8078431, 1,
-0.04816357, 0.5190317, -2.449603, 0, 1, 0.8156863, 1,
-0.04358647, 0.5354168, 0.1034277, 0, 1, 0.8196079, 1,
-0.0424768, -2.36043, -3.540924, 0, 1, 0.827451, 1,
-0.04125539, -1.833219, -1.598665, 0, 1, 0.8313726, 1,
-0.03594175, 1.300931, -0.8234183, 0, 1, 0.8392157, 1,
-0.03250853, 0.3623725, -0.7487234, 0, 1, 0.8431373, 1,
-0.03135616, -1.18398, -2.025051, 0, 1, 0.8509804, 1,
-0.03050405, -0.4240519, -3.659746, 0, 1, 0.854902, 1,
-0.027556, -0.3587771, -3.911843, 0, 1, 0.8627451, 1,
-0.02027735, 0.5888895, 0.1202132, 0, 1, 0.8666667, 1,
-0.01949559, 2.03199, 1.082285, 0, 1, 0.8745098, 1,
-0.01879093, 0.4581057, 1.183954, 0, 1, 0.8784314, 1,
-0.01846942, 1.717801, -0.6924192, 0, 1, 0.8862745, 1,
-0.01475426, 0.775121, 1.352517, 0, 1, 0.8901961, 1,
-0.01373584, 0.6451024, 0.4300787, 0, 1, 0.8980392, 1,
-0.01364754, -0.5765285, -2.573365, 0, 1, 0.9058824, 1,
-0.01291859, 0.4895675, -0.134165, 0, 1, 0.9098039, 1,
-0.01153425, -0.2388324, -3.619475, 0, 1, 0.9176471, 1,
-0.008862139, -0.8263889, -2.912309, 0, 1, 0.9215686, 1,
-0.001585391, -0.6865177, -5.183844, 0, 1, 0.9294118, 1,
0.001587369, 0.9412422, -2.26005, 0, 1, 0.9333333, 1,
0.007212936, 1.512794, 0.8630022, 0, 1, 0.9411765, 1,
0.01169241, -1.845946, 2.100269, 0, 1, 0.945098, 1,
0.01745548, 0.4232362, 0.482659, 0, 1, 0.9529412, 1,
0.0183884, -1.163781, 1.850269, 0, 1, 0.9568627, 1,
0.02056239, 0.7126387, 2.247793, 0, 1, 0.9647059, 1,
0.02815219, -2.573884, 3.070591, 0, 1, 0.9686275, 1,
0.03362755, 0.704178, -0.3096566, 0, 1, 0.9764706, 1,
0.0354778, 0.5356559, -0.8344082, 0, 1, 0.9803922, 1,
0.03623285, -0.4661324, 2.974803, 0, 1, 0.9882353, 1,
0.04377032, -0.5792815, 1.793635, 0, 1, 0.9921569, 1,
0.04396251, 0.7948326, -1.820835, 0, 1, 1, 1,
0.04637638, -0.3544968, 3.689542, 0, 0.9921569, 1, 1,
0.05014342, 0.1782957, -0.8307566, 0, 0.9882353, 1, 1,
0.05392293, 1.08989, 0.5654141, 0, 0.9803922, 1, 1,
0.05472694, -0.3524361, 3.396848, 0, 0.9764706, 1, 1,
0.05704134, -2.97365, 1.718495, 0, 0.9686275, 1, 1,
0.06269288, 0.4697102, 2.392743, 0, 0.9647059, 1, 1,
0.06273945, -0.8938435, 2.287894, 0, 0.9568627, 1, 1,
0.06747327, 1.593352, 0.3210009, 0, 0.9529412, 1, 1,
0.06867897, 0.9111121, -0.1703691, 0, 0.945098, 1, 1,
0.07525569, 0.4283281, 1.332224, 0, 0.9411765, 1, 1,
0.07811972, 0.2832053, -1.147239, 0, 0.9333333, 1, 1,
0.079427, 0.6529826, 1.124257, 0, 0.9294118, 1, 1,
0.08225885, 0.6654145, -0.4008555, 0, 0.9215686, 1, 1,
0.08636323, 0.7773046, 0.734837, 0, 0.9176471, 1, 1,
0.08782995, 1.348377, -0.9052358, 0, 0.9098039, 1, 1,
0.08972479, -0.2599562, 1.600946, 0, 0.9058824, 1, 1,
0.08994903, -0.4387573, 2.820971, 0, 0.8980392, 1, 1,
0.09552167, -0.01859034, 2.041574, 0, 0.8901961, 1, 1,
0.09939076, -0.1878415, 3.210267, 0, 0.8862745, 1, 1,
0.1037491, -0.759418, 2.834579, 0, 0.8784314, 1, 1,
0.1042986, -0.174941, 3.190463, 0, 0.8745098, 1, 1,
0.1064519, -0.3043459, 2.681052, 0, 0.8666667, 1, 1,
0.1151927, 0.3818608, 0.2784895, 0, 0.8627451, 1, 1,
0.1163053, -0.08484935, 2.537778, 0, 0.854902, 1, 1,
0.1186844, 0.6934662, -0.7423095, 0, 0.8509804, 1, 1,
0.1222992, 2.414501, 0.2969305, 0, 0.8431373, 1, 1,
0.1234518, -0.2312459, 3.233681, 0, 0.8392157, 1, 1,
0.1248798, -0.5856432, 4.508976, 0, 0.8313726, 1, 1,
0.1277879, -0.5083206, 2.574754, 0, 0.827451, 1, 1,
0.139336, -1.115265, 3.397701, 0, 0.8196079, 1, 1,
0.1424106, -1.03289, 2.316155, 0, 0.8156863, 1, 1,
0.1443961, -2.044323, 3.329126, 0, 0.8078431, 1, 1,
0.1448704, -2.431011, 2.337169, 0, 0.8039216, 1, 1,
0.1471326, -0.4736089, 0.9118774, 0, 0.7960784, 1, 1,
0.147757, 0.01478824, 3.088418, 0, 0.7882353, 1, 1,
0.1503416, 0.003120704, 4.210823, 0, 0.7843137, 1, 1,
0.1542498, -0.04967942, -0.4433198, 0, 0.7764706, 1, 1,
0.1632835, 0.1636336, 2.296373, 0, 0.772549, 1, 1,
0.1668959, 0.4665898, 0.5548579, 0, 0.7647059, 1, 1,
0.1684889, 0.3866216, -0.2657666, 0, 0.7607843, 1, 1,
0.1697834, 0.3280946, 2.232588, 0, 0.7529412, 1, 1,
0.1709244, -1.774807, 2.781076, 0, 0.7490196, 1, 1,
0.1713986, -0.4982433, 3.157992, 0, 0.7411765, 1, 1,
0.1732304, 2.030544, -0.1129783, 0, 0.7372549, 1, 1,
0.1747261, -1.5387, 4.093746, 0, 0.7294118, 1, 1,
0.1758543, 0.6566473, 1.683454, 0, 0.7254902, 1, 1,
0.1767846, 1.862533, -1.424851, 0, 0.7176471, 1, 1,
0.1830191, -0.1009676, 3.14789, 0, 0.7137255, 1, 1,
0.1878885, 0.5606737, 0.5630064, 0, 0.7058824, 1, 1,
0.1880668, 1.576263, -0.417249, 0, 0.6980392, 1, 1,
0.1892585, -1.118303, 5.515234, 0, 0.6941177, 1, 1,
0.1896873, -0.1645433, 3.062253, 0, 0.6862745, 1, 1,
0.1898179, -1.377449, 2.957357, 0, 0.682353, 1, 1,
0.1914139, 1.07258, 0.9085553, 0, 0.6745098, 1, 1,
0.1938284, -1.511361, 1.244636, 0, 0.6705883, 1, 1,
0.1945756, -1.151885, 0.7161958, 0, 0.6627451, 1, 1,
0.1954608, 0.4562953, 0.2696457, 0, 0.6588235, 1, 1,
0.198965, -1.138653, 5.072227, 0, 0.6509804, 1, 1,
0.1992985, 1.878152, -0.1346291, 0, 0.6470588, 1, 1,
0.2047415, 0.7953235, 1.047955, 0, 0.6392157, 1, 1,
0.2052092, 0.01119307, 1.036968, 0, 0.6352941, 1, 1,
0.2061084, -0.1438444, 1.750327, 0, 0.627451, 1, 1,
0.2073519, -0.8254138, 4.744384, 0, 0.6235294, 1, 1,
0.2108514, 2.20664, -0.8826684, 0, 0.6156863, 1, 1,
0.2112417, 0.2149588, 0.6086007, 0, 0.6117647, 1, 1,
0.2117586, -0.5951501, 2.959309, 0, 0.6039216, 1, 1,
0.2119399, -0.5395015, 2.068996, 0, 0.5960785, 1, 1,
0.2128199, -0.7838874, 3.666925, 0, 0.5921569, 1, 1,
0.2139627, -0.7665302, 3.367646, 0, 0.5843138, 1, 1,
0.2150339, -1.935671, 3.377125, 0, 0.5803922, 1, 1,
0.2151839, -0.1166508, 3.411419, 0, 0.572549, 1, 1,
0.2164806, -0.7329482, 3.093054, 0, 0.5686275, 1, 1,
0.2181407, 0.8764178, 0.4348767, 0, 0.5607843, 1, 1,
0.2203064, -0.2159932, 3.11783, 0, 0.5568628, 1, 1,
0.223611, -0.8138421, 3.063653, 0, 0.5490196, 1, 1,
0.2263531, 0.6330217, -0.001722418, 0, 0.5450981, 1, 1,
0.228948, 0.2174059, -0.1348754, 0, 0.5372549, 1, 1,
0.2313627, -0.4435745, 2.343682, 0, 0.5333334, 1, 1,
0.2325, -0.6706167, 3.973659, 0, 0.5254902, 1, 1,
0.2329389, 0.7015433, -1.383882, 0, 0.5215687, 1, 1,
0.2331402, 0.02064018, 0.3980431, 0, 0.5137255, 1, 1,
0.2383332, 1.546203, 1.180844, 0, 0.509804, 1, 1,
0.2404861, -0.7677254, 2.181608, 0, 0.5019608, 1, 1,
0.2474975, -0.4156705, 2.551162, 0, 0.4941176, 1, 1,
0.2481893, -0.2605182, 4.199302, 0, 0.4901961, 1, 1,
0.2499028, -0.1612407, 1.094944, 0, 0.4823529, 1, 1,
0.250221, 0.9731656, 0.449121, 0, 0.4784314, 1, 1,
0.2509335, 2.344075, 0.3752818, 0, 0.4705882, 1, 1,
0.2544165, -0.1609811, 1.854763, 0, 0.4666667, 1, 1,
0.2575138, -0.761888, 2.667416, 0, 0.4588235, 1, 1,
0.2588037, 0.2472018, 2.231239, 0, 0.454902, 1, 1,
0.2679299, 0.5886045, -1.364771, 0, 0.4470588, 1, 1,
0.2713316, 0.420865, 0.4021264, 0, 0.4431373, 1, 1,
0.2715795, -2.165426, 3.583065, 0, 0.4352941, 1, 1,
0.2728778, -1.250632, 3.066057, 0, 0.4313726, 1, 1,
0.2742886, 0.3625776, -1.793631, 0, 0.4235294, 1, 1,
0.2743509, -0.1917124, 1.646463, 0, 0.4196078, 1, 1,
0.2746389, -0.541878, 3.794377, 0, 0.4117647, 1, 1,
0.278672, -0.2352628, 2.911252, 0, 0.4078431, 1, 1,
0.2823017, 1.103646, -0.544023, 0, 0.4, 1, 1,
0.2829929, -0.3850383, 2.355428, 0, 0.3921569, 1, 1,
0.2830655, 1.84688, 0.9904145, 0, 0.3882353, 1, 1,
0.2851644, -0.2152773, 3.854949, 0, 0.3803922, 1, 1,
0.2899359, -1.08991, 3.249752, 0, 0.3764706, 1, 1,
0.2911271, 0.8095765, -0.8653458, 0, 0.3686275, 1, 1,
0.292916, 0.1409735, 1.918873, 0, 0.3647059, 1, 1,
0.2936662, 1.071735, 0.494877, 0, 0.3568628, 1, 1,
0.2969797, 0.8009466, 0.9431519, 0, 0.3529412, 1, 1,
0.2999417, -0.3041207, 2.347189, 0, 0.345098, 1, 1,
0.3106752, 0.2919201, 1.468641, 0, 0.3411765, 1, 1,
0.3227595, 1.316195, 2.270988, 0, 0.3333333, 1, 1,
0.3249482, -0.4268881, 2.702427, 0, 0.3294118, 1, 1,
0.3271395, 0.7924753, 0.9565977, 0, 0.3215686, 1, 1,
0.327911, -0.2894494, 4.074989, 0, 0.3176471, 1, 1,
0.327954, 0.0008264207, 1.920215, 0, 0.3098039, 1, 1,
0.3283754, 0.9196002, -0.7743488, 0, 0.3058824, 1, 1,
0.3314091, -0.6161478, 1.853227, 0, 0.2980392, 1, 1,
0.3328359, 2.055281, -0.2133887, 0, 0.2901961, 1, 1,
0.3342087, -2.210521, 2.208732, 0, 0.2862745, 1, 1,
0.338585, -0.1903368, 3.341504, 0, 0.2784314, 1, 1,
0.3470793, -0.7633817, 1.916811, 0, 0.2745098, 1, 1,
0.3541065, -0.4133452, 3.028057, 0, 0.2666667, 1, 1,
0.3565013, 1.309696, -0.03650389, 0, 0.2627451, 1, 1,
0.3568704, -1.03308, 5.156169, 0, 0.254902, 1, 1,
0.3575138, 1.00699, 1.631512, 0, 0.2509804, 1, 1,
0.3592287, -0.575891, 2.095461, 0, 0.2431373, 1, 1,
0.3635421, -1.516991, 1.939555, 0, 0.2392157, 1, 1,
0.3640977, -0.2917525, 3.068495, 0, 0.2313726, 1, 1,
0.3667461, -1.17308, 1.034763, 0, 0.227451, 1, 1,
0.3719413, -1.469175, 2.777458, 0, 0.2196078, 1, 1,
0.3720545, -0.9879858, 3.567795, 0, 0.2156863, 1, 1,
0.3733839, 0.2930926, 0.8867834, 0, 0.2078431, 1, 1,
0.3778512, -0.1319332, 1.403635, 0, 0.2039216, 1, 1,
0.3790522, 1.562725, 1.495661, 0, 0.1960784, 1, 1,
0.3812586, 0.6944526, 1.23561, 0, 0.1882353, 1, 1,
0.382083, -0.08738303, 1.930643, 0, 0.1843137, 1, 1,
0.3891531, 0.1670929, 1.947879, 0, 0.1764706, 1, 1,
0.3894451, -0.502403, 1.902189, 0, 0.172549, 1, 1,
0.3946852, 0.05925746, 1.651075, 0, 0.1647059, 1, 1,
0.3950129, 0.5612461, -0.1035853, 0, 0.1607843, 1, 1,
0.3953201, -0.9546539, 2.18964, 0, 0.1529412, 1, 1,
0.3957846, 0.274083, -0.2252904, 0, 0.1490196, 1, 1,
0.3963748, -0.1512413, 3.324738, 0, 0.1411765, 1, 1,
0.3967067, -0.1819274, 1.587917, 0, 0.1372549, 1, 1,
0.3998324, 0.02832041, 1.572461, 0, 0.1294118, 1, 1,
0.4009696, -0.2578207, 2.618919, 0, 0.1254902, 1, 1,
0.4020227, -0.04665794, 1.787323, 0, 0.1176471, 1, 1,
0.4027122, 0.5987159, 0.8328993, 0, 0.1137255, 1, 1,
0.4037714, 1.855519, 0.139851, 0, 0.1058824, 1, 1,
0.4085805, 0.03137378, 3.216255, 0, 0.09803922, 1, 1,
0.4114551, -0.2027979, 2.47984, 0, 0.09411765, 1, 1,
0.4129606, -0.5771122, 2.007916, 0, 0.08627451, 1, 1,
0.4158972, 0.5084074, 0.6836928, 0, 0.08235294, 1, 1,
0.4176734, -0.5033455, 3.399042, 0, 0.07450981, 1, 1,
0.4181843, -0.01613345, 3.036443, 0, 0.07058824, 1, 1,
0.4228221, -0.6816584, 1.970484, 0, 0.0627451, 1, 1,
0.4272299, -0.1432143, 3.915507, 0, 0.05882353, 1, 1,
0.4290427, 0.5503993, 1.688281, 0, 0.05098039, 1, 1,
0.4307955, 0.02248755, 2.26648, 0, 0.04705882, 1, 1,
0.4308606, -1.284214, 1.629163, 0, 0.03921569, 1, 1,
0.4320568, 1.202654, 2.238287, 0, 0.03529412, 1, 1,
0.4336328, 1.061578, 1.744423, 0, 0.02745098, 1, 1,
0.4336732, 2.31502, -0.4867349, 0, 0.02352941, 1, 1,
0.438107, 0.5999796, -1.515088, 0, 0.01568628, 1, 1,
0.4468482, -0.588635, 3.89184, 0, 0.01176471, 1, 1,
0.4469169, -0.4108099, 1.422973, 0, 0.003921569, 1, 1,
0.4484037, -0.7269799, 2.819831, 0.003921569, 0, 1, 1,
0.4505139, 1.291918, 0.5907867, 0.007843138, 0, 1, 1,
0.4538071, -0.01753616, 2.586839, 0.01568628, 0, 1, 1,
0.468333, -0.7200435, 2.181125, 0.01960784, 0, 1, 1,
0.472151, -0.2403832, 2.255693, 0.02745098, 0, 1, 1,
0.4739842, -1.40142, 2.810251, 0.03137255, 0, 1, 1,
0.4753689, 1.43709, -1.663875, 0.03921569, 0, 1, 1,
0.4758254, -0.8654056, 2.722801, 0.04313726, 0, 1, 1,
0.477947, -0.8330711, 2.227004, 0.05098039, 0, 1, 1,
0.4796566, 1.895198, 1.060705, 0.05490196, 0, 1, 1,
0.4806786, 1.121962, 0.2453083, 0.0627451, 0, 1, 1,
0.4810375, -1.371965, 2.778818, 0.06666667, 0, 1, 1,
0.4942133, 0.8989272, 0.181668, 0.07450981, 0, 1, 1,
0.4977435, -0.7462384, 2.294014, 0.07843138, 0, 1, 1,
0.5013893, 0.06383976, 0.8989918, 0.08627451, 0, 1, 1,
0.506453, 1.251227, 0.1046213, 0.09019608, 0, 1, 1,
0.5114125, 0.2118839, 2.283937, 0.09803922, 0, 1, 1,
0.5131775, -0.2515566, 1.996736, 0.1058824, 0, 1, 1,
0.5152897, 0.5039431, 0.6135188, 0.1098039, 0, 1, 1,
0.5160131, -0.5310103, 1.456662, 0.1176471, 0, 1, 1,
0.5162114, 2.030985, 0.07286258, 0.1215686, 0, 1, 1,
0.5186586, -0.0542765, 0.2270556, 0.1294118, 0, 1, 1,
0.5234082, -0.3767758, 1.268858, 0.1333333, 0, 1, 1,
0.5258287, 0.7435281, -0.1033825, 0.1411765, 0, 1, 1,
0.5265949, -0.6614407, 3.47788, 0.145098, 0, 1, 1,
0.5268797, 1.243245, -1.412629, 0.1529412, 0, 1, 1,
0.5271133, 0.6462952, 1.742455, 0.1568628, 0, 1, 1,
0.5272391, -1.051587, 1.4474, 0.1647059, 0, 1, 1,
0.528559, 0.02871349, 1.780038, 0.1686275, 0, 1, 1,
0.5286101, -0.0205403, 1.421181, 0.1764706, 0, 1, 1,
0.5287269, 1.298495, 0.892394, 0.1803922, 0, 1, 1,
0.5293144, 0.4493288, -0.431057, 0.1882353, 0, 1, 1,
0.5296407, 1.675621, 2.286209, 0.1921569, 0, 1, 1,
0.5336431, -0.891224, 2.159357, 0.2, 0, 1, 1,
0.5345615, 0.6022466, 1.484385, 0.2078431, 0, 1, 1,
0.538165, -1.790543, 2.361076, 0.2117647, 0, 1, 1,
0.5433253, 1.570863, 1.048441, 0.2196078, 0, 1, 1,
0.547562, 0.7456163, -0.5493917, 0.2235294, 0, 1, 1,
0.550757, -1.425141, 1.031391, 0.2313726, 0, 1, 1,
0.5518818, 1.994713, 1.134426, 0.2352941, 0, 1, 1,
0.5670584, -0.4510723, 2.731715, 0.2431373, 0, 1, 1,
0.5687303, 0.41883, 1.52736, 0.2470588, 0, 1, 1,
0.5717065, -0.4802625, 2.773918, 0.254902, 0, 1, 1,
0.5779808, -0.5101317, 1.689384, 0.2588235, 0, 1, 1,
0.5821501, -0.2235008, 0.8161619, 0.2666667, 0, 1, 1,
0.5876152, 0.2919389, 1.350939, 0.2705882, 0, 1, 1,
0.5913806, -0.6761037, 2.190415, 0.2784314, 0, 1, 1,
0.5919581, 0.2074688, 2.227862, 0.282353, 0, 1, 1,
0.6019064, 0.4621562, -0.02577558, 0.2901961, 0, 1, 1,
0.6034603, 0.6537501, 0.493907, 0.2941177, 0, 1, 1,
0.6075238, 1.109917, -0.01904106, 0.3019608, 0, 1, 1,
0.6078003, -0.02327043, 2.328334, 0.3098039, 0, 1, 1,
0.6084443, 0.4327829, 0.9698538, 0.3137255, 0, 1, 1,
0.61323, 1.298295, 0.1778935, 0.3215686, 0, 1, 1,
0.6143624, 0.005974967, 1.941129, 0.3254902, 0, 1, 1,
0.6231351, 1.003965, -0.439068, 0.3333333, 0, 1, 1,
0.6270791, -1.211634, 2.496533, 0.3372549, 0, 1, 1,
0.6348448, 0.9132107, 0.5154077, 0.345098, 0, 1, 1,
0.6366754, -1.049589, 2.804822, 0.3490196, 0, 1, 1,
0.6399373, -0.4107208, 1.243515, 0.3568628, 0, 1, 1,
0.6435084, -0.5115372, 1.986596, 0.3607843, 0, 1, 1,
0.6537548, -1.599055, 3.848372, 0.3686275, 0, 1, 1,
0.6538701, 0.01758792, 0.5725958, 0.372549, 0, 1, 1,
0.6651284, -0.06578059, 3.069129, 0.3803922, 0, 1, 1,
0.6653592, -2.016891, 4.106944, 0.3843137, 0, 1, 1,
0.6779632, 0.6587398, 0.3765908, 0.3921569, 0, 1, 1,
0.6857893, -0.3179408, 3.660138, 0.3960784, 0, 1, 1,
0.6861003, -1.548706, 3.02148, 0.4039216, 0, 1, 1,
0.6977572, 0.02790819, 1.983626, 0.4117647, 0, 1, 1,
0.7070503, 0.03842993, 2.110276, 0.4156863, 0, 1, 1,
0.7077542, -0.5142012, 0.9813545, 0.4235294, 0, 1, 1,
0.7078032, -1.843331, 3.141943, 0.427451, 0, 1, 1,
0.7128299, 0.05515137, 1.635702, 0.4352941, 0, 1, 1,
0.7130306, -1.040303, 1.378367, 0.4392157, 0, 1, 1,
0.714667, -0.7135494, 3.250908, 0.4470588, 0, 1, 1,
0.7178732, -1.862583, 1.972961, 0.4509804, 0, 1, 1,
0.7182683, -2.144043, 3.571952, 0.4588235, 0, 1, 1,
0.7212904, 1.968213, -0.533863, 0.4627451, 0, 1, 1,
0.7256138, -0.3117212, 1.218035, 0.4705882, 0, 1, 1,
0.7279521, 0.6293622, 2.710602, 0.4745098, 0, 1, 1,
0.7335911, 0.3695547, 1.138562, 0.4823529, 0, 1, 1,
0.7344147, -0.7967972, 3.149743, 0.4862745, 0, 1, 1,
0.7351967, -1.17297, 3.042201, 0.4941176, 0, 1, 1,
0.7367918, 1.174977, -0.4276099, 0.5019608, 0, 1, 1,
0.7378621, -2.137841, 2.654577, 0.5058824, 0, 1, 1,
0.7490118, -0.2194984, 2.091801, 0.5137255, 0, 1, 1,
0.7509031, 0.4528018, 1.643753, 0.5176471, 0, 1, 1,
0.7573612, -0.6540308, 0.7785161, 0.5254902, 0, 1, 1,
0.759041, -1.097989, 4.455723, 0.5294118, 0, 1, 1,
0.7616756, -0.8511217, 0.8084979, 0.5372549, 0, 1, 1,
0.7683721, 0.6506467, 0.05282327, 0.5411765, 0, 1, 1,
0.768849, 0.3489915, 0.08779854, 0.5490196, 0, 1, 1,
0.7718014, 0.8553088, -1.5864, 0.5529412, 0, 1, 1,
0.7735412, -0.3325099, 3.142148, 0.5607843, 0, 1, 1,
0.7737188, -1.18673, 1.47859, 0.5647059, 0, 1, 1,
0.7741536, 1.028406, -1.107048, 0.572549, 0, 1, 1,
0.7782015, 0.4999923, 1.26407, 0.5764706, 0, 1, 1,
0.778909, 0.6180525, 1.288996, 0.5843138, 0, 1, 1,
0.7805594, -0.1772117, 2.301508, 0.5882353, 0, 1, 1,
0.7837815, -0.1128506, 1.430089, 0.5960785, 0, 1, 1,
0.7878174, -2.517626, 3.368844, 0.6039216, 0, 1, 1,
0.7880304, 1.498914, 1.583156, 0.6078432, 0, 1, 1,
0.7891124, 2.034025, 1.126555, 0.6156863, 0, 1, 1,
0.7916565, -0.8039391, 3.394728, 0.6196079, 0, 1, 1,
0.7932235, -0.5727313, 2.842326, 0.627451, 0, 1, 1,
0.797982, -0.9802205, 3.864675, 0.6313726, 0, 1, 1,
0.7984569, 1.195309, 1.796503, 0.6392157, 0, 1, 1,
0.8019914, -0.9032636, 0.6463706, 0.6431373, 0, 1, 1,
0.804561, 2.254137, 1.290526, 0.6509804, 0, 1, 1,
0.8072832, -0.5309508, 3.090022, 0.654902, 0, 1, 1,
0.8089594, 0.4881767, 1.620744, 0.6627451, 0, 1, 1,
0.8125049, 0.264042, 2.551582, 0.6666667, 0, 1, 1,
0.8127394, -0.141092, -0.1546754, 0.6745098, 0, 1, 1,
0.8179927, 0.7303867, -0.2283022, 0.6784314, 0, 1, 1,
0.8193317, 1.350275, 2.181644, 0.6862745, 0, 1, 1,
0.8247607, -1.660647, 4.076794, 0.6901961, 0, 1, 1,
0.8316587, -0.6394328, 4.543765, 0.6980392, 0, 1, 1,
0.8390611, -0.03781895, 3.590055, 0.7058824, 0, 1, 1,
0.8414086, -0.6625087, 2.211727, 0.7098039, 0, 1, 1,
0.8426086, 0.6832073, 3.258638, 0.7176471, 0, 1, 1,
0.8445295, -1.647027, 3.525822, 0.7215686, 0, 1, 1,
0.8457891, -0.4656172, 1.701263, 0.7294118, 0, 1, 1,
0.8466399, 1.507363, -0.2435694, 0.7333333, 0, 1, 1,
0.8555942, -1.067032, 0.9425704, 0.7411765, 0, 1, 1,
0.8561924, 1.490795, -0.2160774, 0.7450981, 0, 1, 1,
0.8587207, -0.07682441, 2.237493, 0.7529412, 0, 1, 1,
0.8606304, 0.2141739, 0.6811523, 0.7568628, 0, 1, 1,
0.8608056, 0.2952158, -0.03374237, 0.7647059, 0, 1, 1,
0.864526, -1.719904, 0.2927969, 0.7686275, 0, 1, 1,
0.866336, 0.384027, 1.124392, 0.7764706, 0, 1, 1,
0.8669242, 0.4810207, 0.1265831, 0.7803922, 0, 1, 1,
0.876772, -1.027972, 1.096216, 0.7882353, 0, 1, 1,
0.8775471, 0.1765893, 1.643797, 0.7921569, 0, 1, 1,
0.8816252, 0.9271364, -0.9319795, 0.8, 0, 1, 1,
0.8845488, 0.3052897, 1.627915, 0.8078431, 0, 1, 1,
0.8855482, -0.9413064, 3.812127, 0.8117647, 0, 1, 1,
0.8889769, 0.6990174, 0.6260895, 0.8196079, 0, 1, 1,
0.8964404, 0.03512836, 2.187604, 0.8235294, 0, 1, 1,
0.8971152, -0.2842854, 0.5056245, 0.8313726, 0, 1, 1,
0.8979114, -0.006202284, 1.775482, 0.8352941, 0, 1, 1,
0.9087894, 0.8085724, 1.033954, 0.8431373, 0, 1, 1,
0.9175458, -0.2786736, 0.7920851, 0.8470588, 0, 1, 1,
0.9183316, -0.7005392, 2.266832, 0.854902, 0, 1, 1,
0.920847, 2.197639, 1.240937, 0.8588235, 0, 1, 1,
0.9208971, -0.3346336, 2.68839, 0.8666667, 0, 1, 1,
0.9232241, -0.828724, 1.986289, 0.8705882, 0, 1, 1,
0.9233112, -0.2748298, 3.957629, 0.8784314, 0, 1, 1,
0.9307147, -1.119087, 2.567867, 0.8823529, 0, 1, 1,
0.9307249, -0.3192232, 2.660363, 0.8901961, 0, 1, 1,
0.9340068, -0.6091607, 3.614198, 0.8941177, 0, 1, 1,
0.9347597, 0.5159857, 1.064337, 0.9019608, 0, 1, 1,
0.9381046, 0.1539701, 1.736605, 0.9098039, 0, 1, 1,
0.9384486, 0.9111707, 1.503063, 0.9137255, 0, 1, 1,
0.9415241, 0.5623446, 1.271718, 0.9215686, 0, 1, 1,
0.9428002, 0.1866622, 2.136786, 0.9254902, 0, 1, 1,
0.9513483, 0.4461644, 0.2896225, 0.9333333, 0, 1, 1,
0.9559569, -0.02543524, 0.7279676, 0.9372549, 0, 1, 1,
0.9571401, 0.003726945, 0.9476124, 0.945098, 0, 1, 1,
0.9596134, -0.1971781, 1.276638, 0.9490196, 0, 1, 1,
0.9608827, -0.6388187, 1.423195, 0.9568627, 0, 1, 1,
0.9610281, -0.208229, 1.609779, 0.9607843, 0, 1, 1,
0.9657114, 0.03451569, 1.421693, 0.9686275, 0, 1, 1,
0.9753336, -1.458618, 3.422127, 0.972549, 0, 1, 1,
0.979184, -1.259775, 1.453895, 0.9803922, 0, 1, 1,
0.979886, -0.4610434, 2.239728, 0.9843137, 0, 1, 1,
0.9828242, -0.4554798, 1.91541, 0.9921569, 0, 1, 1,
0.9869126, -0.8681746, 2.742451, 0.9960784, 0, 1, 1,
0.9924161, 0.7517005, 1.852743, 1, 0, 0.9960784, 1,
0.9992789, -0.9192085, 1.499125, 1, 0, 0.9882353, 1,
1.005777, -0.02416045, 1.282352, 1, 0, 0.9843137, 1,
1.011621, 1.105239, 1.38244, 1, 0, 0.9764706, 1,
1.014637, -0.5088019, 1.278849, 1, 0, 0.972549, 1,
1.015916, 1.385955, 0.5339407, 1, 0, 0.9647059, 1,
1.017154, 1.294397, 0.2600886, 1, 0, 0.9607843, 1,
1.017613, 0.2241966, 0.922381, 1, 0, 0.9529412, 1,
1.022186, 0.05319615, 1.513425, 1, 0, 0.9490196, 1,
1.039406, 1.631479, 0.5368511, 1, 0, 0.9411765, 1,
1.040252, 0.6164721, 1.803588, 1, 0, 0.9372549, 1,
1.044553, -0.2691285, 1.470044, 1, 0, 0.9294118, 1,
1.045945, 1.493159, -0.9405985, 1, 0, 0.9254902, 1,
1.052753, -0.3065905, 0.8298729, 1, 0, 0.9176471, 1,
1.053455, 0.4209947, 1.459804, 1, 0, 0.9137255, 1,
1.064681, -0.1907642, 1.567131, 1, 0, 0.9058824, 1,
1.065036, -0.03873863, 1.951627, 1, 0, 0.9019608, 1,
1.066235, -1.454993, 0.8836027, 1, 0, 0.8941177, 1,
1.070188, -1.750102, 2.066601, 1, 0, 0.8862745, 1,
1.072878, -0.1742598, 1.030832, 1, 0, 0.8823529, 1,
1.076294, -0.6214297, 0.2043961, 1, 0, 0.8745098, 1,
1.078543, -0.7916361, 2.495144, 1, 0, 0.8705882, 1,
1.080953, 0.03043409, 1.361018, 1, 0, 0.8627451, 1,
1.081968, 0.3007205, 0.6493749, 1, 0, 0.8588235, 1,
1.082008, 0.01493603, 2.165053, 1, 0, 0.8509804, 1,
1.084924, -0.7721813, -0.2648729, 1, 0, 0.8470588, 1,
1.08495, 0.1727883, 1.518241, 1, 0, 0.8392157, 1,
1.087889, -0.2847081, 1.131308, 1, 0, 0.8352941, 1,
1.088542, -0.5125594, 2.513668, 1, 0, 0.827451, 1,
1.09277, 3.721866, 1.743807, 1, 0, 0.8235294, 1,
1.094962, 1.453284, -0.1533469, 1, 0, 0.8156863, 1,
1.097873, 1.826315, 1.468368, 1, 0, 0.8117647, 1,
1.110529, 0.3715427, -0.4893648, 1, 0, 0.8039216, 1,
1.111973, 0.6066035, 1.422788, 1, 0, 0.7960784, 1,
1.123824, -1.543602, 2.289033, 1, 0, 0.7921569, 1,
1.124873, -0.8600055, 1.932081, 1, 0, 0.7843137, 1,
1.125332, -0.9875872, 0.9502788, 1, 0, 0.7803922, 1,
1.12784, 0.6814617, 2.946903, 1, 0, 0.772549, 1,
1.128602, -2.486843, 2.459818, 1, 0, 0.7686275, 1,
1.136628, 0.2382533, 1.185256, 1, 0, 0.7607843, 1,
1.137088, 0.5823868, 0.8005907, 1, 0, 0.7568628, 1,
1.137179, -0.1908647, 0.8497501, 1, 0, 0.7490196, 1,
1.141869, -0.4020787, 3.280921, 1, 0, 0.7450981, 1,
1.144547, 0.144679, 1.736556, 1, 0, 0.7372549, 1,
1.146857, -0.6639557, 0.7460529, 1, 0, 0.7333333, 1,
1.147157, 0.613714, 2.560543, 1, 0, 0.7254902, 1,
1.149259, -0.2950898, 1.730309, 1, 0, 0.7215686, 1,
1.155738, -1.667703, 2.622195, 1, 0, 0.7137255, 1,
1.156592, 1.129493, 1.544525, 1, 0, 0.7098039, 1,
1.158841, -1.101871, 2.293324, 1, 0, 0.7019608, 1,
1.160404, 1.68772, 2.868071, 1, 0, 0.6941177, 1,
1.165674, -0.6370162, 2.332935, 1, 0, 0.6901961, 1,
1.166999, -2.122895, 1.155607, 1, 0, 0.682353, 1,
1.197416, -1.540818, 4.15033, 1, 0, 0.6784314, 1,
1.203303, 1.088776, -0.2847829, 1, 0, 0.6705883, 1,
1.206525, 0.04849994, 1.15076, 1, 0, 0.6666667, 1,
1.208263, 0.1057439, 1.830302, 1, 0, 0.6588235, 1,
1.2179, 0.2238846, 2.658902, 1, 0, 0.654902, 1,
1.221013, -0.195963, 2.360868, 1, 0, 0.6470588, 1,
1.231552, -0.5285722, 2.064872, 1, 0, 0.6431373, 1,
1.232181, 0.3084871, -0.08821571, 1, 0, 0.6352941, 1,
1.235351, 0.4687431, -0.3029228, 1, 0, 0.6313726, 1,
1.237584, 1.731003, 2.20742, 1, 0, 0.6235294, 1,
1.243605, 0.2508761, 3.472175, 1, 0, 0.6196079, 1,
1.257064, 1.292918, 0.119316, 1, 0, 0.6117647, 1,
1.260126, 1.42405, 1.998176, 1, 0, 0.6078432, 1,
1.260967, -0.2838238, 2.186499, 1, 0, 0.6, 1,
1.261857, 0.2713168, 0.6273133, 1, 0, 0.5921569, 1,
1.262333, 0.4258012, 1.197709, 1, 0, 0.5882353, 1,
1.270116, -1.155716, 2.654679, 1, 0, 0.5803922, 1,
1.280815, -0.251244, 1.814448, 1, 0, 0.5764706, 1,
1.284742, 0.2454989, 1.689217, 1, 0, 0.5686275, 1,
1.30625, 1.04851, 2.237829, 1, 0, 0.5647059, 1,
1.318097, -0.1862932, 2.175324, 1, 0, 0.5568628, 1,
1.328994, 0.1327237, 2.927131, 1, 0, 0.5529412, 1,
1.339459, 0.03199977, 0.8079244, 1, 0, 0.5450981, 1,
1.355217, -0.506878, 2.37213, 1, 0, 0.5411765, 1,
1.355558, -0.019582, 3.585257, 1, 0, 0.5333334, 1,
1.370398, -0.7418748, 1.92251, 1, 0, 0.5294118, 1,
1.377169, 0.7703261, 1.337828, 1, 0, 0.5215687, 1,
1.393813, -0.5010763, 1.70909, 1, 0, 0.5176471, 1,
1.3992, -1.099195, 1.778266, 1, 0, 0.509804, 1,
1.408421, -0.5976667, 2.105211, 1, 0, 0.5058824, 1,
1.432229, 0.6632468, 3.492773, 1, 0, 0.4980392, 1,
1.439092, -1.059154, 1.875343, 1, 0, 0.4901961, 1,
1.446938, 0.18292, 0.9190577, 1, 0, 0.4862745, 1,
1.45601, 1.468203, 1.946393, 1, 0, 0.4784314, 1,
1.466906, 0.2598672, 1.220654, 1, 0, 0.4745098, 1,
1.490329, -0.954946, 3.913264, 1, 0, 0.4666667, 1,
1.504362, 0.02029107, 3.061874, 1, 0, 0.4627451, 1,
1.520159, 0.1039407, 0.9649449, 1, 0, 0.454902, 1,
1.520588, 0.5504267, 1.87227, 1, 0, 0.4509804, 1,
1.521229, -0.695264, 3.390789, 1, 0, 0.4431373, 1,
1.522924, 0.4931234, 2.32148, 1, 0, 0.4392157, 1,
1.539941, -0.3148079, 0.3292966, 1, 0, 0.4313726, 1,
1.544011, -0.4102013, 0.5986412, 1, 0, 0.427451, 1,
1.55002, -2.053679, 1.778431, 1, 0, 0.4196078, 1,
1.562885, -0.9168234, 3.438236, 1, 0, 0.4156863, 1,
1.570222, -0.5023214, 1.893292, 1, 0, 0.4078431, 1,
1.577022, -0.2265085, 2.783462, 1, 0, 0.4039216, 1,
1.597383, 1.402405, 0.7166703, 1, 0, 0.3960784, 1,
1.617212, 0.7653061, 1.422904, 1, 0, 0.3882353, 1,
1.638955, 0.929064, 1.959532, 1, 0, 0.3843137, 1,
1.649989, 0.5105836, 2.407926, 1, 0, 0.3764706, 1,
1.658479, -0.6004712, 1.178849, 1, 0, 0.372549, 1,
1.659203, 2.282336, 0.7688168, 1, 0, 0.3647059, 1,
1.661629, -1.175256, 2.310294, 1, 0, 0.3607843, 1,
1.679846, 1.933859, 0.6332781, 1, 0, 0.3529412, 1,
1.693444, -0.2201879, 2.128498, 1, 0, 0.3490196, 1,
1.697196, 1.388208, -0.7190484, 1, 0, 0.3411765, 1,
1.709307, -1.475382, 1.81087, 1, 0, 0.3372549, 1,
1.712765, -0.908844, 2.290371, 1, 0, 0.3294118, 1,
1.715803, 0.08920771, 1.742199, 1, 0, 0.3254902, 1,
1.718355, 0.977135, 2.912774, 1, 0, 0.3176471, 1,
1.720437, 0.4964718, 3.120817, 1, 0, 0.3137255, 1,
1.723803, -0.960561, 1.603684, 1, 0, 0.3058824, 1,
1.744585, 0.7794441, 0.4372342, 1, 0, 0.2980392, 1,
1.74925, -0.5422732, 2.344044, 1, 0, 0.2941177, 1,
1.770777, 0.05349565, 2.300702, 1, 0, 0.2862745, 1,
1.778979, 0.5805627, 1.84392, 1, 0, 0.282353, 1,
1.782649, -2.307585, 3.067151, 1, 0, 0.2745098, 1,
1.787891, 0.05159897, 1.292184, 1, 0, 0.2705882, 1,
1.796813, -1.879078, 2.245301, 1, 0, 0.2627451, 1,
1.839298, 0.04134552, 1.044404, 1, 0, 0.2588235, 1,
1.843088, 0.3469097, 2.544343, 1, 0, 0.2509804, 1,
1.848244, -0.1148224, 0.2131504, 1, 0, 0.2470588, 1,
1.856311, -0.2106535, 2.435351, 1, 0, 0.2392157, 1,
1.86912, -1.404448, 2.030871, 1, 0, 0.2352941, 1,
1.872732, 0.7817947, 0.6793141, 1, 0, 0.227451, 1,
1.896517, -1.528105, 2.446719, 1, 0, 0.2235294, 1,
1.897109, -0.9317241, 2.442245, 1, 0, 0.2156863, 1,
1.902606, -0.4919665, 1.272682, 1, 0, 0.2117647, 1,
1.902633, 0.2103645, 2.576694, 1, 0, 0.2039216, 1,
1.908119, 0.6867699, 2.655775, 1, 0, 0.1960784, 1,
1.916814, -0.763283, 3.31461, 1, 0, 0.1921569, 1,
1.919716, -1.811482, 1.721519, 1, 0, 0.1843137, 1,
1.926401, 1.71657, 0.8960422, 1, 0, 0.1803922, 1,
1.92906, -0.2380446, 2.680801, 1, 0, 0.172549, 1,
1.951875, -0.3771194, 1.689904, 1, 0, 0.1686275, 1,
1.965445, 0.4842478, 2.444062, 1, 0, 0.1607843, 1,
1.977508, 1.768395, 0.6922245, 1, 0, 0.1568628, 1,
2.007704, -0.5389768, 4.031063, 1, 0, 0.1490196, 1,
2.007964, 0.3621469, 1.813757, 1, 0, 0.145098, 1,
2.012886, -0.9931154, 3.330175, 1, 0, 0.1372549, 1,
2.026269, 1.339159, 0.7557359, 1, 0, 0.1333333, 1,
2.030106, 0.4828028, 2.332075, 1, 0, 0.1254902, 1,
2.045511, 0.0004275326, 2.06752, 1, 0, 0.1215686, 1,
2.052137, 0.8392594, 0.9389773, 1, 0, 0.1137255, 1,
2.077432, -1.307997, 0.5989419, 1, 0, 0.1098039, 1,
2.174402, -0.6540326, 2.596524, 1, 0, 0.1019608, 1,
2.177565, -1.559689, 2.360367, 1, 0, 0.09411765, 1,
2.189016, -1.084607, 1.446191, 1, 0, 0.09019608, 1,
2.259023, -0.1546341, 1.010553, 1, 0, 0.08235294, 1,
2.260224, -0.03643584, 2.248812, 1, 0, 0.07843138, 1,
2.292982, 1.292205, 2.089314, 1, 0, 0.07058824, 1,
2.295925, 0.7649154, 1.65945, 1, 0, 0.06666667, 1,
2.305996, 0.7710549, 1.703458, 1, 0, 0.05882353, 1,
2.319401, 0.6993907, 0.1937756, 1, 0, 0.05490196, 1,
2.398544, -0.7419153, 2.687008, 1, 0, 0.04705882, 1,
2.482689, -0.5837821, 2.545628, 1, 0, 0.04313726, 1,
2.616713, 0.5912674, 1.188793, 1, 0, 0.03529412, 1,
2.658409, -1.930078, 2.643189, 1, 0, 0.03137255, 1,
2.723619, -0.1210092, -0.3471211, 1, 0, 0.02352941, 1,
2.76047, 1.138724, 1.153227, 1, 0, 0.01960784, 1,
2.875041, -0.01296647, 2.090311, 1, 0, 0.01176471, 1,
2.995189, -1.05157, 1.653641, 1, 0, 0.007843138, 1
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
-0.5922248, -4.10854, -7.768423, 0, -0.5, 0.5, 0.5,
-0.5922248, -4.10854, -7.768423, 1, -0.5, 0.5, 0.5,
-0.5922248, -4.10854, -7.768423, 1, 1.5, 0.5, 0.5,
-0.5922248, -4.10854, -7.768423, 0, 1.5, 0.5, 0.5
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
-5.395772, 0.3741081, -7.768423, 0, -0.5, 0.5, 0.5,
-5.395772, 0.3741081, -7.768423, 1, -0.5, 0.5, 0.5,
-5.395772, 0.3741081, -7.768423, 1, 1.5, 0.5, 0.5,
-5.395772, 0.3741081, -7.768423, 0, 1.5, 0.5, 0.5
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
-5.395772, -4.10854, -0.1639695, 0, -0.5, 0.5, 0.5,
-5.395772, -4.10854, -0.1639695, 1, -0.5, 0.5, 0.5,
-5.395772, -4.10854, -0.1639695, 1, 1.5, 0.5, 0.5,
-5.395772, -4.10854, -0.1639695, 0, 1.5, 0.5, 0.5
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
-4, -3.074083, -6.013549,
2, -3.074083, -6.013549,
-4, -3.074083, -6.013549,
-4, -3.246493, -6.306027,
-2, -3.074083, -6.013549,
-2, -3.246493, -6.306027,
0, -3.074083, -6.013549,
0, -3.246493, -6.306027,
2, -3.074083, -6.013549,
2, -3.246493, -6.306027
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
"-2",
"0",
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
-4, -3.591312, -6.890985, 0, -0.5, 0.5, 0.5,
-4, -3.591312, -6.890985, 1, -0.5, 0.5, 0.5,
-4, -3.591312, -6.890985, 1, 1.5, 0.5, 0.5,
-4, -3.591312, -6.890985, 0, 1.5, 0.5, 0.5,
-2, -3.591312, -6.890985, 0, -0.5, 0.5, 0.5,
-2, -3.591312, -6.890985, 1, -0.5, 0.5, 0.5,
-2, -3.591312, -6.890985, 1, 1.5, 0.5, 0.5,
-2, -3.591312, -6.890985, 0, 1.5, 0.5, 0.5,
0, -3.591312, -6.890985, 0, -0.5, 0.5, 0.5,
0, -3.591312, -6.890985, 1, -0.5, 0.5, 0.5,
0, -3.591312, -6.890985, 1, 1.5, 0.5, 0.5,
0, -3.591312, -6.890985, 0, 1.5, 0.5, 0.5,
2, -3.591312, -6.890985, 0, -0.5, 0.5, 0.5,
2, -3.591312, -6.890985, 1, -0.5, 0.5, 0.5,
2, -3.591312, -6.890985, 1, 1.5, 0.5, 0.5,
2, -3.591312, -6.890985, 0, 1.5, 0.5, 0.5
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
-4.287261, -2, -6.013549,
-4.287261, 3, -6.013549,
-4.287261, -2, -6.013549,
-4.472013, -2, -6.306027,
-4.287261, -1, -6.013549,
-4.472013, -1, -6.306027,
-4.287261, 0, -6.013549,
-4.472013, 0, -6.306027,
-4.287261, 1, -6.013549,
-4.472013, 1, -6.306027,
-4.287261, 2, -6.013549,
-4.472013, 2, -6.306027,
-4.287261, 3, -6.013549,
-4.472013, 3, -6.306027
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
-4.841516, -2, -6.890985, 0, -0.5, 0.5, 0.5,
-4.841516, -2, -6.890985, 1, -0.5, 0.5, 0.5,
-4.841516, -2, -6.890985, 1, 1.5, 0.5, 0.5,
-4.841516, -2, -6.890985, 0, 1.5, 0.5, 0.5,
-4.841516, -1, -6.890985, 0, -0.5, 0.5, 0.5,
-4.841516, -1, -6.890985, 1, -0.5, 0.5, 0.5,
-4.841516, -1, -6.890985, 1, 1.5, 0.5, 0.5,
-4.841516, -1, -6.890985, 0, 1.5, 0.5, 0.5,
-4.841516, 0, -6.890985, 0, -0.5, 0.5, 0.5,
-4.841516, 0, -6.890985, 1, -0.5, 0.5, 0.5,
-4.841516, 0, -6.890985, 1, 1.5, 0.5, 0.5,
-4.841516, 0, -6.890985, 0, 1.5, 0.5, 0.5,
-4.841516, 1, -6.890985, 0, -0.5, 0.5, 0.5,
-4.841516, 1, -6.890985, 1, -0.5, 0.5, 0.5,
-4.841516, 1, -6.890985, 1, 1.5, 0.5, 0.5,
-4.841516, 1, -6.890985, 0, 1.5, 0.5, 0.5,
-4.841516, 2, -6.890985, 0, -0.5, 0.5, 0.5,
-4.841516, 2, -6.890985, 1, -0.5, 0.5, 0.5,
-4.841516, 2, -6.890985, 1, 1.5, 0.5, 0.5,
-4.841516, 2, -6.890985, 0, 1.5, 0.5, 0.5,
-4.841516, 3, -6.890985, 0, -0.5, 0.5, 0.5,
-4.841516, 3, -6.890985, 1, -0.5, 0.5, 0.5,
-4.841516, 3, -6.890985, 1, 1.5, 0.5, 0.5,
-4.841516, 3, -6.890985, 0, 1.5, 0.5, 0.5
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
-4.287261, -3.074083, -4,
-4.287261, -3.074083, 4,
-4.287261, -3.074083, -4,
-4.472013, -3.246493, -4,
-4.287261, -3.074083, -2,
-4.472013, -3.246493, -2,
-4.287261, -3.074083, 0,
-4.472013, -3.246493, 0,
-4.287261, -3.074083, 2,
-4.472013, -3.246493, 2,
-4.287261, -3.074083, 4,
-4.472013, -3.246493, 4
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
-4.841516, -3.591312, -4, 0, -0.5, 0.5, 0.5,
-4.841516, -3.591312, -4, 1, -0.5, 0.5, 0.5,
-4.841516, -3.591312, -4, 1, 1.5, 0.5, 0.5,
-4.841516, -3.591312, -4, 0, 1.5, 0.5, 0.5,
-4.841516, -3.591312, -2, 0, -0.5, 0.5, 0.5,
-4.841516, -3.591312, -2, 1, -0.5, 0.5, 0.5,
-4.841516, -3.591312, -2, 1, 1.5, 0.5, 0.5,
-4.841516, -3.591312, -2, 0, 1.5, 0.5, 0.5,
-4.841516, -3.591312, 0, 0, -0.5, 0.5, 0.5,
-4.841516, -3.591312, 0, 1, -0.5, 0.5, 0.5,
-4.841516, -3.591312, 0, 1, 1.5, 0.5, 0.5,
-4.841516, -3.591312, 0, 0, 1.5, 0.5, 0.5,
-4.841516, -3.591312, 2, 0, -0.5, 0.5, 0.5,
-4.841516, -3.591312, 2, 1, -0.5, 0.5, 0.5,
-4.841516, -3.591312, 2, 1, 1.5, 0.5, 0.5,
-4.841516, -3.591312, 2, 0, 1.5, 0.5, 0.5,
-4.841516, -3.591312, 4, 0, -0.5, 0.5, 0.5,
-4.841516, -3.591312, 4, 1, -0.5, 0.5, 0.5,
-4.841516, -3.591312, 4, 1, 1.5, 0.5, 0.5,
-4.841516, -3.591312, 4, 0, 1.5, 0.5, 0.5
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
-4.287261, -3.074083, -6.013549,
-4.287261, 3.822299, -6.013549,
-4.287261, -3.074083, 5.68561,
-4.287261, 3.822299, 5.68561,
-4.287261, -3.074083, -6.013549,
-4.287261, -3.074083, 5.68561,
-4.287261, 3.822299, -6.013549,
-4.287261, 3.822299, 5.68561,
-4.287261, -3.074083, -6.013549,
3.102811, -3.074083, -6.013549,
-4.287261, -3.074083, 5.68561,
3.102811, -3.074083, 5.68561,
-4.287261, 3.822299, -6.013549,
3.102811, 3.822299, -6.013549,
-4.287261, 3.822299, 5.68561,
3.102811, 3.822299, 5.68561,
3.102811, -3.074083, -6.013549,
3.102811, 3.822299, -6.013549,
3.102811, -3.074083, 5.68561,
3.102811, 3.822299, 5.68561,
3.102811, -3.074083, -6.013549,
3.102811, -3.074083, 5.68561,
3.102811, 3.822299, -6.013549,
3.102811, 3.822299, 5.68561
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
var radius = 8.255892;
var distance = 36.7314;
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
mvMatrix.translate( 0.5922248, -0.3741081, 0.1639695 );
mvMatrix.scale( 1.207895, 1.294364, 0.7629978 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.7314);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Jasmolin_II<-read.table("Jasmolin_II.xyz")
```

```
## Error in read.table("Jasmolin_II.xyz"): no lines available in input
```

```r
x<-Jasmolin_II$V2
```

```
## Error in eval(expr, envir, enclos): object 'Jasmolin_II' not found
```

```r
y<-Jasmolin_II$V3
```

```
## Error in eval(expr, envir, enclos): object 'Jasmolin_II' not found
```

```r
z<-Jasmolin_II$V4
```

```
## Error in eval(expr, envir, enclos): object 'Jasmolin_II' not found
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
-4.179638, 0.6869279, -2.336922, 0, 0, 1, 1, 1,
-3.121624, -1.043165, -3.133217, 1, 0, 0, 1, 1,
-3.0839, -2.544499, -2.011759, 1, 0, 0, 1, 1,
-2.801338, 0.8069481, -0.4329935, 1, 0, 0, 1, 1,
-2.738973, -0.1590401, -0.8655071, 1, 0, 0, 1, 1,
-2.634578, -0.6305838, -1.254053, 1, 0, 0, 1, 1,
-2.594925, 1.533887, -1.218331, 0, 0, 0, 1, 1,
-2.532723, 1.178285, -1.12062, 0, 0, 0, 1, 1,
-2.360662, -2.077438, -3.113514, 0, 0, 0, 1, 1,
-2.327564, 0.2770704, -1.172364, 0, 0, 0, 1, 1,
-2.237588, -0.693732, -1.25746, 0, 0, 0, 1, 1,
-2.201688, 0.2086029, -2.730604, 0, 0, 0, 1, 1,
-2.142649, -0.8795803, -3.109322, 0, 0, 0, 1, 1,
-2.049754, 0.2440137, -1.125068, 1, 1, 1, 1, 1,
-2.010096, -0.8764181, -2.125527, 1, 1, 1, 1, 1,
-1.998821, 1.120967, -1.282364, 1, 1, 1, 1, 1,
-1.996377, -0.1770096, -0.5392036, 1, 1, 1, 1, 1,
-1.996358, 1.787398, -0.01322801, 1, 1, 1, 1, 1,
-1.995659, -0.2797819, -0.3548063, 1, 1, 1, 1, 1,
-1.94421, -0.3871923, -1.019784, 1, 1, 1, 1, 1,
-1.942685, -0.9196852, -2.666959, 1, 1, 1, 1, 1,
-1.941091, 1.575377, 0.408836, 1, 1, 1, 1, 1,
-1.935558, -1.300075, -1.737505, 1, 1, 1, 1, 1,
-1.91955, 0.3210622, -1.475712, 1, 1, 1, 1, 1,
-1.898383, 1.524519, -0.4275826, 1, 1, 1, 1, 1,
-1.861805, -0.5202917, -1.967878, 1, 1, 1, 1, 1,
-1.851425, -0.7928911, -3.224749, 1, 1, 1, 1, 1,
-1.844905, 0.9169358, -1.27087, 1, 1, 1, 1, 1,
-1.811388, -2.3018, -0.7738686, 0, 0, 1, 1, 1,
-1.800343, -0.3298661, -0.7357811, 1, 0, 0, 1, 1,
-1.774783, -0.8015148, -3.079386, 1, 0, 0, 1, 1,
-1.759878, -1.200737, -1.630432, 1, 0, 0, 1, 1,
-1.756909, -0.06220126, 0.5040426, 1, 0, 0, 1, 1,
-1.743639, 0.5933152, -1.441143, 1, 0, 0, 1, 1,
-1.731685, 0.6064726, -0.8942385, 0, 0, 0, 1, 1,
-1.698284, 0.7429979, -0.8408382, 0, 0, 0, 1, 1,
-1.695251, 0.4660982, -1.842143, 0, 0, 0, 1, 1,
-1.683944, 0.9572233, -0.5129794, 0, 0, 0, 1, 1,
-1.67958, 1.779068, -0.2959193, 0, 0, 0, 1, 1,
-1.63331, -2.002927, -1.997802, 0, 0, 0, 1, 1,
-1.63044, -0.3832951, -2.22991, 0, 0, 0, 1, 1,
-1.621975, -0.8525415, -2.618625, 1, 1, 1, 1, 1,
-1.620786, -1.124342, -4.080727, 1, 1, 1, 1, 1,
-1.588194, 1.138931, -1.539418, 1, 1, 1, 1, 1,
-1.572566, 0.3771514, -2.719087, 1, 1, 1, 1, 1,
-1.57108, 0.3528084, -2.659462, 1, 1, 1, 1, 1,
-1.570757, 1.273048, -1.512784, 1, 1, 1, 1, 1,
-1.5507, -0.5828465, -3.156524, 1, 1, 1, 1, 1,
-1.539219, -0.3605331, -1.601237, 1, 1, 1, 1, 1,
-1.538809, 2.091193, -1.350307, 1, 1, 1, 1, 1,
-1.519039, 0.05970157, -2.429352, 1, 1, 1, 1, 1,
-1.518076, 0.2614384, -1.079608, 1, 1, 1, 1, 1,
-1.507954, -1.561247, -0.5739285, 1, 1, 1, 1, 1,
-1.507076, 0.2193469, -4.02574, 1, 1, 1, 1, 1,
-1.503255, -1.489075, -1.435636, 1, 1, 1, 1, 1,
-1.49874, -0.9060676, -3.470933, 1, 1, 1, 1, 1,
-1.497927, -1.733621, -3.262123, 0, 0, 1, 1, 1,
-1.489848, -0.8435122, -2.917346, 1, 0, 0, 1, 1,
-1.472506, 1.407791, -1.146789, 1, 0, 0, 1, 1,
-1.468069, -0.4618616, -1.397591, 1, 0, 0, 1, 1,
-1.466332, 0.9643452, -0.1851713, 1, 0, 0, 1, 1,
-1.464795, -0.05260343, -2.709434, 1, 0, 0, 1, 1,
-1.443884, 0.3552064, -1.869351, 0, 0, 0, 1, 1,
-1.440645, -1.310036, -3.589203, 0, 0, 0, 1, 1,
-1.434332, 0.275717, -1.329328, 0, 0, 0, 1, 1,
-1.42093, 0.04557858, -2.2978, 0, 0, 0, 1, 1,
-1.41881, -2.100362, -2.416884, 0, 0, 0, 1, 1,
-1.418407, 0.4916463, -1.274912, 0, 0, 0, 1, 1,
-1.408794, -0.02219172, -2.616871, 0, 0, 0, 1, 1,
-1.398107, 0.5712966, -1.353377, 1, 1, 1, 1, 1,
-1.380987, 0.1029503, -1.762345, 1, 1, 1, 1, 1,
-1.368502, 1.040539, 1.014386, 1, 1, 1, 1, 1,
-1.363662, -0.2046329, -2.060392, 1, 1, 1, 1, 1,
-1.352749, 0.6947195, -1.342306, 1, 1, 1, 1, 1,
-1.343138, -1.946057, -2.975125, 1, 1, 1, 1, 1,
-1.322608, -1.501516, -2.020892, 1, 1, 1, 1, 1,
-1.316537, -1.453859, -2.018865, 1, 1, 1, 1, 1,
-1.313331, 0.2921296, -0.680897, 1, 1, 1, 1, 1,
-1.297738, 1.74613, -0.2016567, 1, 1, 1, 1, 1,
-1.293344, 0.0277852, -2.153898, 1, 1, 1, 1, 1,
-1.287908, 0.2217237, 0.7514847, 1, 1, 1, 1, 1,
-1.282565, 0.451448, -1.371278, 1, 1, 1, 1, 1,
-1.281985, -0.8663681, -1.994354, 1, 1, 1, 1, 1,
-1.274053, 0.2771493, 0.1606268, 1, 1, 1, 1, 1,
-1.262329, 0.416626, -0.241565, 0, 0, 1, 1, 1,
-1.249549, -0.7566609, -2.469341, 1, 0, 0, 1, 1,
-1.249282, 0.8308533, -0.01679701, 1, 0, 0, 1, 1,
-1.236324, 0.2383286, 0.1099572, 1, 0, 0, 1, 1,
-1.233741, -1.272329, -2.616397, 1, 0, 0, 1, 1,
-1.232831, -2.006348, -2.804308, 1, 0, 0, 1, 1,
-1.229697, 2.037147, -0.5804127, 0, 0, 0, 1, 1,
-1.225532, 0.8336895, 0.02441659, 0, 0, 0, 1, 1,
-1.223108, 0.3336053, 0.843778, 0, 0, 0, 1, 1,
-1.21999, 1.529413, 0.6372074, 0, 0, 0, 1, 1,
-1.198835, 0.1939949, -1.39416, 0, 0, 0, 1, 1,
-1.195955, 0.4333031, -2.779012, 0, 0, 0, 1, 1,
-1.188046, -0.6067588, -1.61116, 0, 0, 0, 1, 1,
-1.186456, 1.276373, -1.907047, 1, 1, 1, 1, 1,
-1.175215, -1.363934, -1.443149, 1, 1, 1, 1, 1,
-1.160431, 0.08497621, -2.727791, 1, 1, 1, 1, 1,
-1.159637, -0.1848525, 0.3725131, 1, 1, 1, 1, 1,
-1.157801, -0.9539133, -3.107018, 1, 1, 1, 1, 1,
-1.156686, 0.1695846, -1.900343, 1, 1, 1, 1, 1,
-1.152918, -0.4368019, -1.131783, 1, 1, 1, 1, 1,
-1.150549, 1.611355, -2.750428, 1, 1, 1, 1, 1,
-1.137003, -0.501132, -1.241154, 1, 1, 1, 1, 1,
-1.135694, -0.1685899, -0.6547845, 1, 1, 1, 1, 1,
-1.132281, 0.4833582, -2.094015, 1, 1, 1, 1, 1,
-1.116881, -0.2824314, -1.830614, 1, 1, 1, 1, 1,
-1.111533, 0.7453256, -1.307959, 1, 1, 1, 1, 1,
-1.105556, -1.188558, -1.731221, 1, 1, 1, 1, 1,
-1.100928, -0.5566983, -0.9472173, 1, 1, 1, 1, 1,
-1.097879, 0.6542422, -1.447882, 0, 0, 1, 1, 1,
-1.096556, -0.6358587, -3.225316, 1, 0, 0, 1, 1,
-1.095676, 0.1723169, -2.063851, 1, 0, 0, 1, 1,
-1.08649, 0.3830048, -0.4652327, 1, 0, 0, 1, 1,
-1.084234, 0.9904129, -1.568838, 1, 0, 0, 1, 1,
-1.081453, -0.22785, -1.751709, 1, 0, 0, 1, 1,
-1.068883, -0.578433, -2.11615, 0, 0, 0, 1, 1,
-1.064616, -1.172271, -2.92228, 0, 0, 0, 1, 1,
-1.063692, -0.3942673, -1.442584, 0, 0, 0, 1, 1,
-1.060564, 1.301013, -1.143061, 0, 0, 0, 1, 1,
-1.059345, -2.046603, -2.359389, 0, 0, 0, 1, 1,
-1.059044, 1.079972, -1.533751, 0, 0, 0, 1, 1,
-1.053336, 0.3483827, -1.587365, 0, 0, 0, 1, 1,
-1.046346, 0.5697371, -1.449719, 1, 1, 1, 1, 1,
-1.040222, -1.465763, -1.840063, 1, 1, 1, 1, 1,
-1.039492, -0.7917112, -2.046548, 1, 1, 1, 1, 1,
-1.038578, 0.322423, -1.398123, 1, 1, 1, 1, 1,
-1.006409, -0.01822622, -1.145115, 1, 1, 1, 1, 1,
-1.006324, -0.5733961, -2.806164, 1, 1, 1, 1, 1,
-1.002982, -2.13824, -1.777064, 1, 1, 1, 1, 1,
-1.002318, 0.8812718, 0.81333, 1, 1, 1, 1, 1,
-0.9987434, -0.3835912, -2.415913, 1, 1, 1, 1, 1,
-0.9966382, 0.3662027, -0.848007, 1, 1, 1, 1, 1,
-0.9909136, -0.2922983, -1.423337, 1, 1, 1, 1, 1,
-0.9877689, 0.1784848, -2.143132, 1, 1, 1, 1, 1,
-0.9851328, -0.2424162, -0.5391185, 1, 1, 1, 1, 1,
-0.9835521, -1.572663, -3.112309, 1, 1, 1, 1, 1,
-0.9815139, -2.031781, -2.092433, 1, 1, 1, 1, 1,
-0.9777455, -0.2825793, -0.8616547, 0, 0, 1, 1, 1,
-0.9696448, 0.4705298, -1.609597, 1, 0, 0, 1, 1,
-0.9672068, 0.7827895, 0.4407723, 1, 0, 0, 1, 1,
-0.9654156, 1.60491, -0.2418162, 1, 0, 0, 1, 1,
-0.9548234, -0.669841, -1.861721, 1, 0, 0, 1, 1,
-0.9460032, -0.3976851, -3.060384, 1, 0, 0, 1, 1,
-0.9389417, -0.1419853, -1.801179, 0, 0, 0, 1, 1,
-0.9339983, -0.3810259, -1.983827, 0, 0, 0, 1, 1,
-0.9338539, -0.760209, -1.366581, 0, 0, 0, 1, 1,
-0.9301443, 0.7034587, 0.9766393, 0, 0, 0, 1, 1,
-0.9299097, -0.249722, -1.368233, 0, 0, 0, 1, 1,
-0.9291806, 0.8795283, 1.316774, 0, 0, 0, 1, 1,
-0.9281678, -0.3997386, -2.43042, 0, 0, 0, 1, 1,
-0.9278415, -0.4452114, -1.258905, 1, 1, 1, 1, 1,
-0.9234329, -1.631051, -3.120634, 1, 1, 1, 1, 1,
-0.919143, 0.7214614, -0.3340429, 1, 1, 1, 1, 1,
-0.9185396, 0.4757755, -2.150042, 1, 1, 1, 1, 1,
-0.9182039, -0.0422472, -0.1983496, 1, 1, 1, 1, 1,
-0.9143276, -1.530181, -3.053088, 1, 1, 1, 1, 1,
-0.9141289, -1.608604, -1.963802, 1, 1, 1, 1, 1,
-0.9138002, 0.5239819, -0.7718828, 1, 1, 1, 1, 1,
-0.912993, -0.5830706, -1.94847, 1, 1, 1, 1, 1,
-0.9114747, 0.1994808, -2.022669, 1, 1, 1, 1, 1,
-0.9041622, 1.018449, -1.002183, 1, 1, 1, 1, 1,
-0.9033369, -0.9013804, -2.349995, 1, 1, 1, 1, 1,
-0.8991882, -0.2183166, -3.578528, 1, 1, 1, 1, 1,
-0.8985692, 0.1429687, -3.561904, 1, 1, 1, 1, 1,
-0.8978159, -0.3635435, -0.8072531, 1, 1, 1, 1, 1,
-0.8878533, -0.8747013, -3.010469, 0, 0, 1, 1, 1,
-0.8871434, 0.4610215, -0.3673352, 1, 0, 0, 1, 1,
-0.8847356, 0.2395225, -2.535069, 1, 0, 0, 1, 1,
-0.8789026, -1.158636, -1.838955, 1, 0, 0, 1, 1,
-0.8777224, 1.296637, -0.4442908, 1, 0, 0, 1, 1,
-0.874362, 1.286954, -1.205544, 1, 0, 0, 1, 1,
-0.8737246, 1.311825, -0.4365505, 0, 0, 0, 1, 1,
-0.8687911, -0.7668801, -1.67575, 0, 0, 0, 1, 1,
-0.8684614, -1.127146, -1.569501, 0, 0, 0, 1, 1,
-0.8670975, -0.4822686, -1.889459, 0, 0, 0, 1, 1,
-0.8666459, -0.3795778, -2.599149, 0, 0, 0, 1, 1,
-0.859809, 0.5161131, -0.4334923, 0, 0, 0, 1, 1,
-0.8591858, 1.930288, -2.046773, 0, 0, 0, 1, 1,
-0.8565911, 0.3237163, -2.020361, 1, 1, 1, 1, 1,
-0.8350795, -0.2758298, -0.9392422, 1, 1, 1, 1, 1,
-0.8320501, -1.096058, -3.535596, 1, 1, 1, 1, 1,
-0.8273649, -0.971876, -3.697688, 1, 1, 1, 1, 1,
-0.8235252, 1.767985, -1.59896, 1, 1, 1, 1, 1,
-0.8226485, 1.167352, 0.2154336, 1, 1, 1, 1, 1,
-0.8189256, -1.485852, -3.41543, 1, 1, 1, 1, 1,
-0.8168276, -0.7276273, -2.654729, 1, 1, 1, 1, 1,
-0.8135081, -0.09743475, -1.558533, 1, 1, 1, 1, 1,
-0.8077285, -0.4000279, -0.6483533, 1, 1, 1, 1, 1,
-0.8075602, -0.2613441, -3.470009, 1, 1, 1, 1, 1,
-0.8030678, 0.3763658, -1.556159, 1, 1, 1, 1, 1,
-0.7949353, 0.4405988, -2.830896, 1, 1, 1, 1, 1,
-0.7925453, -0.1612869, -1.163831, 1, 1, 1, 1, 1,
-0.7923645, 0.3683957, -2.025522, 1, 1, 1, 1, 1,
-0.7909575, -1.8319, -2.574101, 0, 0, 1, 1, 1,
-0.7866282, 1.137877, -1.70002, 1, 0, 0, 1, 1,
-0.7829217, -0.07716812, -1.737341, 1, 0, 0, 1, 1,
-0.779565, 1.524391, 0.8502805, 1, 0, 0, 1, 1,
-0.7756413, -0.4379647, -1.976219, 1, 0, 0, 1, 1,
-0.7716912, 0.6089274, -0.01817323, 1, 0, 0, 1, 1,
-0.7680736, 1.928287, 0.1258344, 0, 0, 0, 1, 1,
-0.7666552, -0.3825163, -2.390523, 0, 0, 0, 1, 1,
-0.7659278, -0.9997463, -1.00231, 0, 0, 0, 1, 1,
-0.7597021, 2.035941, 1.112098, 0, 0, 0, 1, 1,
-0.7546349, 0.4043951, 0.1577386, 0, 0, 0, 1, 1,
-0.7505006, 1.241473, 0.08957064, 0, 0, 0, 1, 1,
-0.750309, 0.7613069, -0.4150183, 0, 0, 0, 1, 1,
-0.7499841, -1.229628, -2.676837, 1, 1, 1, 1, 1,
-0.744432, 1.560119, -0.680223, 1, 1, 1, 1, 1,
-0.7438273, 0.7061255, -0.6943393, 1, 1, 1, 1, 1,
-0.7397093, 1.11147, 0.235764, 1, 1, 1, 1, 1,
-0.7392775, -0.1677353, -1.862387, 1, 1, 1, 1, 1,
-0.7371969, 0.9778939, -1.9258, 1, 1, 1, 1, 1,
-0.7362772, -1.187669, -1.8561, 1, 1, 1, 1, 1,
-0.7335027, -1.675588, -2.101032, 1, 1, 1, 1, 1,
-0.7329956, -0.9434574, -2.391583, 1, 1, 1, 1, 1,
-0.7300736, -0.4473916, -1.179503, 1, 1, 1, 1, 1,
-0.7300515, -0.2819892, -3.003483, 1, 1, 1, 1, 1,
-0.7127984, 0.07786551, -2.405839, 1, 1, 1, 1, 1,
-0.7041727, -0.9045501, -1.679798, 1, 1, 1, 1, 1,
-0.7036676, -1.190489, -2.146647, 1, 1, 1, 1, 1,
-0.7034826, -0.3549905, -2.669669, 1, 1, 1, 1, 1,
-0.7016665, 0.4945922, -0.4430972, 0, 0, 1, 1, 1,
-0.6932553, 0.4528484, 0.1809344, 1, 0, 0, 1, 1,
-0.6929805, 1.025164, 0.2506111, 1, 0, 0, 1, 1,
-0.691491, -0.3042204, -1.220145, 1, 0, 0, 1, 1,
-0.6912717, 0.5202118, -2.228608, 1, 0, 0, 1, 1,
-0.6873988, 0.2877723, -1.443434, 1, 0, 0, 1, 1,
-0.686337, 0.2284409, -1.730016, 0, 0, 0, 1, 1,
-0.6851773, 1.133923, -1.09033, 0, 0, 0, 1, 1,
-0.6780904, 0.2303634, 0.2897674, 0, 0, 0, 1, 1,
-0.6766586, -0.2133681, -1.50649, 0, 0, 0, 1, 1,
-0.6744381, -1.026161, -2.130642, 0, 0, 0, 1, 1,
-0.6723465, -0.4057599, -2.028469, 0, 0, 0, 1, 1,
-0.6666815, -0.9322547, -3.016976, 0, 0, 0, 1, 1,
-0.663568, -0.07371965, -2.892018, 1, 1, 1, 1, 1,
-0.6614838, -1.640641, -3.788918, 1, 1, 1, 1, 1,
-0.65943, 1.980576, 0.07658511, 1, 1, 1, 1, 1,
-0.6592897, 1.754769, -0.2304767, 1, 1, 1, 1, 1,
-0.6573392, 0.8820432, -0.3790221, 1, 1, 1, 1, 1,
-0.65698, -1.245918, -2.678934, 1, 1, 1, 1, 1,
-0.6568208, -0.1351606, -3.040851, 1, 1, 1, 1, 1,
-0.6562572, 0.571169, -0.1642865, 1, 1, 1, 1, 1,
-0.6495342, -1.476322, 0.269664, 1, 1, 1, 1, 1,
-0.646189, 0.4710242, 1.554214, 1, 1, 1, 1, 1,
-0.6343286, 0.9355837, 0.07004059, 1, 1, 1, 1, 1,
-0.633123, 0.9989526, -2.232856, 1, 1, 1, 1, 1,
-0.6328144, -0.4524607, -1.307012, 1, 1, 1, 1, 1,
-0.6320161, 0.6427774, -1.64816, 1, 1, 1, 1, 1,
-0.6281859, -0.8638566, -3.810606, 1, 1, 1, 1, 1,
-0.6238644, -0.1343588, -2.420938, 0, 0, 1, 1, 1,
-0.6125059, 0.8012865, -0.01351809, 1, 0, 0, 1, 1,
-0.6083353, -0.2684237, -2.672557, 1, 0, 0, 1, 1,
-0.6017107, -1.622292, -0.6062296, 1, 0, 0, 1, 1,
-0.5994461, -1.042546, -3.415867, 1, 0, 0, 1, 1,
-0.589038, 0.9214815, -0.8474494, 1, 0, 0, 1, 1,
-0.587566, -0.8403152, -3.681599, 0, 0, 0, 1, 1,
-0.5840428, 1.395933, -0.8739224, 0, 0, 0, 1, 1,
-0.5839213, 0.5645859, 0.1310506, 0, 0, 0, 1, 1,
-0.5828102, 1.125189, -0.4140561, 0, 0, 0, 1, 1,
-0.5811828, 1.13536, -0.2675712, 0, 0, 0, 1, 1,
-0.5751984, -0.8087171, -2.579466, 0, 0, 0, 1, 1,
-0.5736145, 0.6388665, -1.277446, 0, 0, 0, 1, 1,
-0.5723513, 1.18689, -0.8660726, 1, 1, 1, 1, 1,
-0.5713585, -0.2075425, -1.609293, 1, 1, 1, 1, 1,
-0.5706477, 1.552918, -0.1014786, 1, 1, 1, 1, 1,
-0.568357, 0.4881984, -0.7410922, 1, 1, 1, 1, 1,
-0.5671143, 0.08368818, -1.917161, 1, 1, 1, 1, 1,
-0.565836, 0.009019641, -2.556339, 1, 1, 1, 1, 1,
-0.5630441, 0.7716786, 0.4095495, 1, 1, 1, 1, 1,
-0.5607925, -0.6095889, -2.246719, 1, 1, 1, 1, 1,
-0.5497226, 0.4766594, -3.04846, 1, 1, 1, 1, 1,
-0.5446615, 0.7314834, -0.7550669, 1, 1, 1, 1, 1,
-0.5439638, 0.0784722, -1.811831, 1, 1, 1, 1, 1,
-0.5369084, -0.3171918, -2.603378, 1, 1, 1, 1, 1,
-0.5362095, 0.04112427, -1.985203, 1, 1, 1, 1, 1,
-0.5348431, 0.3141771, 1.313812, 1, 1, 1, 1, 1,
-0.5326618, -0.7039344, -3.589195, 1, 1, 1, 1, 1,
-0.5318497, -1.47203, -0.4661317, 0, 0, 1, 1, 1,
-0.5249043, 0.3249234, -0.2372087, 1, 0, 0, 1, 1,
-0.5195785, -0.4992092, -2.325151, 1, 0, 0, 1, 1,
-0.5167153, 0.7134359, -1.651127, 1, 0, 0, 1, 1,
-0.511853, 1.365321, -1.269868, 1, 0, 0, 1, 1,
-0.508499, 0.5476817, 0.6466447, 1, 0, 0, 1, 1,
-0.5071886, 0.137573, -2.789863, 0, 0, 0, 1, 1,
-0.4996148, -0.2378584, -2.406946, 0, 0, 0, 1, 1,
-0.4994849, 0.08730343, -0.09728821, 0, 0, 0, 1, 1,
-0.4988645, -1.192377, -2.951888, 0, 0, 0, 1, 1,
-0.494777, 0.9553213, -0.968229, 0, 0, 0, 1, 1,
-0.4861023, -0.9156666, -2.890266, 0, 0, 0, 1, 1,
-0.48149, -0.6694263, -2.323655, 0, 0, 0, 1, 1,
-0.4811821, 1.669874, -0.6555791, 1, 1, 1, 1, 1,
-0.4786902, 1.290448, -1.495319, 1, 1, 1, 1, 1,
-0.4690312, 1.984863, -0.2676459, 1, 1, 1, 1, 1,
-0.4658706, 1.598454, -0.2648143, 1, 1, 1, 1, 1,
-0.465475, 0.6420637, -1.465381, 1, 1, 1, 1, 1,
-0.4576307, -1.678427, -0.8944784, 1, 1, 1, 1, 1,
-0.4518415, -0.3797012, -2.587386, 1, 1, 1, 1, 1,
-0.4513167, -0.6002861, -2.763173, 1, 1, 1, 1, 1,
-0.4471767, -1.867473, -4.038521, 1, 1, 1, 1, 1,
-0.4426429, -0.1166579, -2.856416, 1, 1, 1, 1, 1,
-0.4405012, 0.5462385, 0.7809765, 1, 1, 1, 1, 1,
-0.436906, -0.4410614, -3.439666, 1, 1, 1, 1, 1,
-0.4320045, -0.1862451, -2.237756, 1, 1, 1, 1, 1,
-0.4318335, -0.1642778, -2.709931, 1, 1, 1, 1, 1,
-0.430329, 0.9884111, 0.5668781, 1, 1, 1, 1, 1,
-0.4280183, -0.3754675, -3.204416, 0, 0, 1, 1, 1,
-0.4248761, -0.3790347, -2.339536, 1, 0, 0, 1, 1,
-0.4183259, 0.1960735, -1.830036, 1, 0, 0, 1, 1,
-0.4163608, 0.8921672, -0.9421123, 1, 0, 0, 1, 1,
-0.4147803, 1.671284, 0.3765658, 1, 0, 0, 1, 1,
-0.4142086, -0.2742625, -3.425223, 1, 0, 0, 1, 1,
-0.4139904, -1.043189, -4.632555, 0, 0, 0, 1, 1,
-0.4122925, 0.8119657, 0.5104388, 0, 0, 0, 1, 1,
-0.4107791, -0.2741493, -3.74179, 0, 0, 0, 1, 1,
-0.4090634, -0.6068789, -3.906691, 0, 0, 0, 1, 1,
-0.4074431, 0.224534, -0.3580319, 0, 0, 0, 1, 1,
-0.4032898, -0.3848403, -3.003419, 0, 0, 0, 1, 1,
-0.3969017, -1.143311, -2.588457, 0, 0, 0, 1, 1,
-0.396339, 0.6832021, -0.3264141, 1, 1, 1, 1, 1,
-0.3898028, -0.1003691, -1.555218, 1, 1, 1, 1, 1,
-0.3876503, 0.01383557, -1.13782, 1, 1, 1, 1, 1,
-0.3861017, 0.5772504, -2.120028, 1, 1, 1, 1, 1,
-0.3823085, 0.3175987, -1.267827, 1, 1, 1, 1, 1,
-0.3814915, 0.2527273, -0.5119591, 1, 1, 1, 1, 1,
-0.3812907, 1.766372, -0.4310628, 1, 1, 1, 1, 1,
-0.3804381, 0.9372203, -1.610986, 1, 1, 1, 1, 1,
-0.3802305, 0.2719726, -2.231768, 1, 1, 1, 1, 1,
-0.3800748, -0.09420279, 0.1874085, 1, 1, 1, 1, 1,
-0.3800217, 1.573062, 0.8115647, 1, 1, 1, 1, 1,
-0.3770098, -0.7672072, -2.596289, 1, 1, 1, 1, 1,
-0.3760761, 0.3227118, -1.659925, 1, 1, 1, 1, 1,
-0.3746094, -0.3776196, 0.2345783, 1, 1, 1, 1, 1,
-0.3694097, 0.7705496, 0.9914784, 1, 1, 1, 1, 1,
-0.3694049, 0.09045029, -0.3230579, 0, 0, 1, 1, 1,
-0.3672168, 0.12739, -1.220201, 1, 0, 0, 1, 1,
-0.3611622, 0.6074591, -1.062901, 1, 0, 0, 1, 1,
-0.3594623, -1.233047, -4.075119, 1, 0, 0, 1, 1,
-0.3567853, 1.514862, -0.4894356, 1, 0, 0, 1, 1,
-0.3552137, 0.1769419, -0.8886331, 1, 0, 0, 1, 1,
-0.3541154, -0.4854451, -2.541603, 0, 0, 0, 1, 1,
-0.352812, 0.5816736, -0.2210346, 0, 0, 0, 1, 1,
-0.3527631, -0.8611432, -2.704262, 0, 0, 0, 1, 1,
-0.3518833, -0.4254438, -1.253897, 0, 0, 0, 1, 1,
-0.3494186, -1.017784, -2.28409, 0, 0, 0, 1, 1,
-0.345422, 0.9948773, 0.7324213, 0, 0, 0, 1, 1,
-0.3442002, 0.1883373, -1.905247, 0, 0, 0, 1, 1,
-0.342237, 1.343386, 0.286389, 1, 1, 1, 1, 1,
-0.3422291, 0.451917, 1.153437, 1, 1, 1, 1, 1,
-0.3422011, -0.4656115, -1.321028, 1, 1, 1, 1, 1,
-0.3419056, 0.7431847, 0.3627776, 1, 1, 1, 1, 1,
-0.3373826, 0.476404, -1.802572, 1, 1, 1, 1, 1,
-0.3363862, 2.569289, 0.3500889, 1, 1, 1, 1, 1,
-0.3134904, -0.6925097, -5.843173, 1, 1, 1, 1, 1,
-0.3122809, -0.7308532, -2.773352, 1, 1, 1, 1, 1,
-0.3102063, 0.8824723, -0.6393216, 1, 1, 1, 1, 1,
-0.309178, -0.03375801, -2.002145, 1, 1, 1, 1, 1,
-0.3045094, 0.7721927, -0.858838, 1, 1, 1, 1, 1,
-0.30319, -1.157743, -2.487499, 1, 1, 1, 1, 1,
-0.3020163, 1.285783, -0.7970966, 1, 1, 1, 1, 1,
-0.2957892, -0.08572554, -2.95691, 1, 1, 1, 1, 1,
-0.2948138, 0.4620412, -1.431301, 1, 1, 1, 1, 1,
-0.2939662, 0.1554978, -0.06792875, 0, 0, 1, 1, 1,
-0.2920409, -0.3231353, -2.143298, 1, 0, 0, 1, 1,
-0.2907596, -0.6715428, -2.777546, 1, 0, 0, 1, 1,
-0.2849713, 0.4496927, -0.8341252, 1, 0, 0, 1, 1,
-0.2790011, 0.2130811, 0.09424363, 1, 0, 0, 1, 1,
-0.2786447, -0.6973898, -3.249915, 1, 0, 0, 1, 1,
-0.2781375, -1.543322, -3.536837, 0, 0, 0, 1, 1,
-0.2774774, 1.351214, -0.1285701, 0, 0, 0, 1, 1,
-0.2764612, -0.06503371, 0.6004158, 0, 0, 0, 1, 1,
-0.2745843, -0.0483428, -0.7673225, 0, 0, 0, 1, 1,
-0.2743732, 0.0798052, -1.822362, 0, 0, 0, 1, 1,
-0.2741232, -0.5883687, -2.589763, 0, 0, 0, 1, 1,
-0.264692, 0.07954138, -2.773036, 0, 0, 0, 1, 1,
-0.2642077, 0.3970507, -1.384819, 1, 1, 1, 1, 1,
-0.2575337, 0.05819941, -4.010708, 1, 1, 1, 1, 1,
-0.2564665, 0.2823907, -0.2167418, 1, 1, 1, 1, 1,
-0.2558113, -0.2386179, -2.402184, 1, 1, 1, 1, 1,
-0.2535414, -0.5237952, -3.250419, 1, 1, 1, 1, 1,
-0.2507206, -0.4096062, -2.770485, 1, 1, 1, 1, 1,
-0.2446162, 0.0717446, -2.097137, 1, 1, 1, 1, 1,
-0.2405872, 0.4428903, -2.390358, 1, 1, 1, 1, 1,
-0.2380297, 0.3013328, -0.05051015, 1, 1, 1, 1, 1,
-0.2371318, 1.412092, -0.2240073, 1, 1, 1, 1, 1,
-0.2364587, -0.3300681, -2.773213, 1, 1, 1, 1, 1,
-0.2307917, -0.08832247, -2.16278, 1, 1, 1, 1, 1,
-0.2307119, -1.709843, -2.248657, 1, 1, 1, 1, 1,
-0.2286633, 0.9077979, 0.6127611, 1, 1, 1, 1, 1,
-0.228343, 0.003291526, -1.645983, 1, 1, 1, 1, 1,
-0.2276951, 1.350317, 1.57542, 0, 0, 1, 1, 1,
-0.2269844, -1.061188, -3.499671, 1, 0, 0, 1, 1,
-0.2237543, -0.3590258, -3.706728, 1, 0, 0, 1, 1,
-0.2236825, -0.8829448, -2.776467, 1, 0, 0, 1, 1,
-0.2231674, 0.5677584, -3.665297, 1, 0, 0, 1, 1,
-0.222271, 1.236297, -0.06313173, 1, 0, 0, 1, 1,
-0.2219948, -0.5360429, -1.429091, 0, 0, 0, 1, 1,
-0.2212977, 0.1043008, -0.5253464, 0, 0, 0, 1, 1,
-0.2165789, 0.6114663, 0.2486872, 0, 0, 0, 1, 1,
-0.2162016, 1.195487, -1.105515, 0, 0, 0, 1, 1,
-0.215561, -1.379323, -2.703588, 0, 0, 0, 1, 1,
-0.2152639, 1.339308, -0.4555764, 0, 0, 0, 1, 1,
-0.214808, -0.1786228, -1.273474, 0, 0, 0, 1, 1,
-0.2100552, 0.5701348, -0.7145754, 1, 1, 1, 1, 1,
-0.203635, 0.5620553, -0.6828487, 1, 1, 1, 1, 1,
-0.2024103, -1.728303, -3.984221, 1, 1, 1, 1, 1,
-0.2007299, -0.9938498, -3.222177, 1, 1, 1, 1, 1,
-0.1999535, -0.3392379, -1.655329, 1, 1, 1, 1, 1,
-0.199505, -0.2646924, -3.370859, 1, 1, 1, 1, 1,
-0.1990931, 0.3453405, -1.221609, 1, 1, 1, 1, 1,
-0.1985374, -0.2542201, -2.995859, 1, 1, 1, 1, 1,
-0.1928772, -0.982729, -3.70316, 1, 1, 1, 1, 1,
-0.1913457, -0.2156472, -2.993397, 1, 1, 1, 1, 1,
-0.1884858, 1.084527, -0.6476753, 1, 1, 1, 1, 1,
-0.1843224, 0.9550622, 0.7440028, 1, 1, 1, 1, 1,
-0.180547, -0.7471852, -2.655649, 1, 1, 1, 1, 1,
-0.1741625, 0.6965995, -0.5216722, 1, 1, 1, 1, 1,
-0.1694603, -1.653541, -3.748287, 1, 1, 1, 1, 1,
-0.1679176, 0.2031345, -0.9908404, 0, 0, 1, 1, 1,
-0.1647743, -0.2473459, -2.441905, 1, 0, 0, 1, 1,
-0.1578206, 0.5069013, -0.3186107, 1, 0, 0, 1, 1,
-0.1577026, 0.03623113, -1.713144, 1, 0, 0, 1, 1,
-0.1511199, -0.30582, -3.58488, 1, 0, 0, 1, 1,
-0.1504578, 0.5376425, -0.6321151, 1, 0, 0, 1, 1,
-0.1486764, -0.2872065, -2.757769, 0, 0, 0, 1, 1,
-0.1463782, 0.9808918, 0.9624987, 0, 0, 0, 1, 1,
-0.1453676, -0.1779263, -2.364398, 0, 0, 0, 1, 1,
-0.1437691, -1.560181, -4.454019, 0, 0, 0, 1, 1,
-0.1405214, -0.7020673, -2.314623, 0, 0, 0, 1, 1,
-0.1381976, -0.4954603, -1.435565, 0, 0, 0, 1, 1,
-0.1379215, -1.553805, -3.493227, 0, 0, 0, 1, 1,
-0.137857, 0.1913548, 0.1229014, 1, 1, 1, 1, 1,
-0.1374554, -0.1609385, -3.220822, 1, 1, 1, 1, 1,
-0.1357501, 1.22072, -0.06563793, 1, 1, 1, 1, 1,
-0.1347209, 2.412409, -0.3685751, 1, 1, 1, 1, 1,
-0.1337491, 0.8316959, -1.244394, 1, 1, 1, 1, 1,
-0.1281751, -0.4008753, -3.49604, 1, 1, 1, 1, 1,
-0.1241407, 1.489153, 0.313103, 1, 1, 1, 1, 1,
-0.1236099, -2.149095, -1.923823, 1, 1, 1, 1, 1,
-0.1182351, 2.041156, -0.6994575, 1, 1, 1, 1, 1,
-0.117302, -0.6356295, -3.750731, 1, 1, 1, 1, 1,
-0.1117386, -0.4921952, -2.373348, 1, 1, 1, 1, 1,
-0.1045926, -0.5253813, -3.36775, 1, 1, 1, 1, 1,
-0.104304, -0.2758472, -3.697736, 1, 1, 1, 1, 1,
-0.1036202, 0.615629, -1.549022, 1, 1, 1, 1, 1,
-0.1035855, -0.7755615, -3.526788, 1, 1, 1, 1, 1,
-0.1024625, -0.5386502, -4.213412, 0, 0, 1, 1, 1,
-0.1016452, -0.9918783, -3.408884, 1, 0, 0, 1, 1,
-0.09973563, 0.60027, -0.9890335, 1, 0, 0, 1, 1,
-0.09962215, 1.846667, -0.8829092, 1, 0, 0, 1, 1,
-0.09715363, -0.9415346, -0.8058025, 1, 0, 0, 1, 1,
-0.0968808, 0.5679175, -1.020975, 1, 0, 0, 1, 1,
-0.0962531, 0.6642988, -0.1190906, 0, 0, 0, 1, 1,
-0.09238806, -0.2433406, -2.3222, 0, 0, 0, 1, 1,
-0.0921237, -1.855244, -2.928136, 0, 0, 0, 1, 1,
-0.0919783, -1.06842, -3.370512, 0, 0, 0, 1, 1,
-0.09109433, -0.2683152, -3.385753, 0, 0, 0, 1, 1,
-0.08574914, -2.042284, -3.21159, 0, 0, 0, 1, 1,
-0.08227136, 0.346342, 0.6908444, 0, 0, 0, 1, 1,
-0.07577081, -2.809262, -1.337426, 1, 1, 1, 1, 1,
-0.07513344, 0.1807772, -2.408991, 1, 1, 1, 1, 1,
-0.06803064, 0.4987357, 0.1438528, 1, 1, 1, 1, 1,
-0.06380641, 0.1077811, -1.400502, 1, 1, 1, 1, 1,
-0.06292167, -1.063113, -2.480208, 1, 1, 1, 1, 1,
-0.06262597, 0.877125, -2.36255, 1, 1, 1, 1, 1,
-0.06255542, -1.207087, -4.387898, 1, 1, 1, 1, 1,
-0.06173664, -0.2478721, -2.584131, 1, 1, 1, 1, 1,
-0.04816357, 0.5190317, -2.449603, 1, 1, 1, 1, 1,
-0.04358647, 0.5354168, 0.1034277, 1, 1, 1, 1, 1,
-0.0424768, -2.36043, -3.540924, 1, 1, 1, 1, 1,
-0.04125539, -1.833219, -1.598665, 1, 1, 1, 1, 1,
-0.03594175, 1.300931, -0.8234183, 1, 1, 1, 1, 1,
-0.03250853, 0.3623725, -0.7487234, 1, 1, 1, 1, 1,
-0.03135616, -1.18398, -2.025051, 1, 1, 1, 1, 1,
-0.03050405, -0.4240519, -3.659746, 0, 0, 1, 1, 1,
-0.027556, -0.3587771, -3.911843, 1, 0, 0, 1, 1,
-0.02027735, 0.5888895, 0.1202132, 1, 0, 0, 1, 1,
-0.01949559, 2.03199, 1.082285, 1, 0, 0, 1, 1,
-0.01879093, 0.4581057, 1.183954, 1, 0, 0, 1, 1,
-0.01846942, 1.717801, -0.6924192, 1, 0, 0, 1, 1,
-0.01475426, 0.775121, 1.352517, 0, 0, 0, 1, 1,
-0.01373584, 0.6451024, 0.4300787, 0, 0, 0, 1, 1,
-0.01364754, -0.5765285, -2.573365, 0, 0, 0, 1, 1,
-0.01291859, 0.4895675, -0.134165, 0, 0, 0, 1, 1,
-0.01153425, -0.2388324, -3.619475, 0, 0, 0, 1, 1,
-0.008862139, -0.8263889, -2.912309, 0, 0, 0, 1, 1,
-0.001585391, -0.6865177, -5.183844, 0, 0, 0, 1, 1,
0.001587369, 0.9412422, -2.26005, 1, 1, 1, 1, 1,
0.007212936, 1.512794, 0.8630022, 1, 1, 1, 1, 1,
0.01169241, -1.845946, 2.100269, 1, 1, 1, 1, 1,
0.01745548, 0.4232362, 0.482659, 1, 1, 1, 1, 1,
0.0183884, -1.163781, 1.850269, 1, 1, 1, 1, 1,
0.02056239, 0.7126387, 2.247793, 1, 1, 1, 1, 1,
0.02815219, -2.573884, 3.070591, 1, 1, 1, 1, 1,
0.03362755, 0.704178, -0.3096566, 1, 1, 1, 1, 1,
0.0354778, 0.5356559, -0.8344082, 1, 1, 1, 1, 1,
0.03623285, -0.4661324, 2.974803, 1, 1, 1, 1, 1,
0.04377032, -0.5792815, 1.793635, 1, 1, 1, 1, 1,
0.04396251, 0.7948326, -1.820835, 1, 1, 1, 1, 1,
0.04637638, -0.3544968, 3.689542, 1, 1, 1, 1, 1,
0.05014342, 0.1782957, -0.8307566, 1, 1, 1, 1, 1,
0.05392293, 1.08989, 0.5654141, 1, 1, 1, 1, 1,
0.05472694, -0.3524361, 3.396848, 0, 0, 1, 1, 1,
0.05704134, -2.97365, 1.718495, 1, 0, 0, 1, 1,
0.06269288, 0.4697102, 2.392743, 1, 0, 0, 1, 1,
0.06273945, -0.8938435, 2.287894, 1, 0, 0, 1, 1,
0.06747327, 1.593352, 0.3210009, 1, 0, 0, 1, 1,
0.06867897, 0.9111121, -0.1703691, 1, 0, 0, 1, 1,
0.07525569, 0.4283281, 1.332224, 0, 0, 0, 1, 1,
0.07811972, 0.2832053, -1.147239, 0, 0, 0, 1, 1,
0.079427, 0.6529826, 1.124257, 0, 0, 0, 1, 1,
0.08225885, 0.6654145, -0.4008555, 0, 0, 0, 1, 1,
0.08636323, 0.7773046, 0.734837, 0, 0, 0, 1, 1,
0.08782995, 1.348377, -0.9052358, 0, 0, 0, 1, 1,
0.08972479, -0.2599562, 1.600946, 0, 0, 0, 1, 1,
0.08994903, -0.4387573, 2.820971, 1, 1, 1, 1, 1,
0.09552167, -0.01859034, 2.041574, 1, 1, 1, 1, 1,
0.09939076, -0.1878415, 3.210267, 1, 1, 1, 1, 1,
0.1037491, -0.759418, 2.834579, 1, 1, 1, 1, 1,
0.1042986, -0.174941, 3.190463, 1, 1, 1, 1, 1,
0.1064519, -0.3043459, 2.681052, 1, 1, 1, 1, 1,
0.1151927, 0.3818608, 0.2784895, 1, 1, 1, 1, 1,
0.1163053, -0.08484935, 2.537778, 1, 1, 1, 1, 1,
0.1186844, 0.6934662, -0.7423095, 1, 1, 1, 1, 1,
0.1222992, 2.414501, 0.2969305, 1, 1, 1, 1, 1,
0.1234518, -0.2312459, 3.233681, 1, 1, 1, 1, 1,
0.1248798, -0.5856432, 4.508976, 1, 1, 1, 1, 1,
0.1277879, -0.5083206, 2.574754, 1, 1, 1, 1, 1,
0.139336, -1.115265, 3.397701, 1, 1, 1, 1, 1,
0.1424106, -1.03289, 2.316155, 1, 1, 1, 1, 1,
0.1443961, -2.044323, 3.329126, 0, 0, 1, 1, 1,
0.1448704, -2.431011, 2.337169, 1, 0, 0, 1, 1,
0.1471326, -0.4736089, 0.9118774, 1, 0, 0, 1, 1,
0.147757, 0.01478824, 3.088418, 1, 0, 0, 1, 1,
0.1503416, 0.003120704, 4.210823, 1, 0, 0, 1, 1,
0.1542498, -0.04967942, -0.4433198, 1, 0, 0, 1, 1,
0.1632835, 0.1636336, 2.296373, 0, 0, 0, 1, 1,
0.1668959, 0.4665898, 0.5548579, 0, 0, 0, 1, 1,
0.1684889, 0.3866216, -0.2657666, 0, 0, 0, 1, 1,
0.1697834, 0.3280946, 2.232588, 0, 0, 0, 1, 1,
0.1709244, -1.774807, 2.781076, 0, 0, 0, 1, 1,
0.1713986, -0.4982433, 3.157992, 0, 0, 0, 1, 1,
0.1732304, 2.030544, -0.1129783, 0, 0, 0, 1, 1,
0.1747261, -1.5387, 4.093746, 1, 1, 1, 1, 1,
0.1758543, 0.6566473, 1.683454, 1, 1, 1, 1, 1,
0.1767846, 1.862533, -1.424851, 1, 1, 1, 1, 1,
0.1830191, -0.1009676, 3.14789, 1, 1, 1, 1, 1,
0.1878885, 0.5606737, 0.5630064, 1, 1, 1, 1, 1,
0.1880668, 1.576263, -0.417249, 1, 1, 1, 1, 1,
0.1892585, -1.118303, 5.515234, 1, 1, 1, 1, 1,
0.1896873, -0.1645433, 3.062253, 1, 1, 1, 1, 1,
0.1898179, -1.377449, 2.957357, 1, 1, 1, 1, 1,
0.1914139, 1.07258, 0.9085553, 1, 1, 1, 1, 1,
0.1938284, -1.511361, 1.244636, 1, 1, 1, 1, 1,
0.1945756, -1.151885, 0.7161958, 1, 1, 1, 1, 1,
0.1954608, 0.4562953, 0.2696457, 1, 1, 1, 1, 1,
0.198965, -1.138653, 5.072227, 1, 1, 1, 1, 1,
0.1992985, 1.878152, -0.1346291, 1, 1, 1, 1, 1,
0.2047415, 0.7953235, 1.047955, 0, 0, 1, 1, 1,
0.2052092, 0.01119307, 1.036968, 1, 0, 0, 1, 1,
0.2061084, -0.1438444, 1.750327, 1, 0, 0, 1, 1,
0.2073519, -0.8254138, 4.744384, 1, 0, 0, 1, 1,
0.2108514, 2.20664, -0.8826684, 1, 0, 0, 1, 1,
0.2112417, 0.2149588, 0.6086007, 1, 0, 0, 1, 1,
0.2117586, -0.5951501, 2.959309, 0, 0, 0, 1, 1,
0.2119399, -0.5395015, 2.068996, 0, 0, 0, 1, 1,
0.2128199, -0.7838874, 3.666925, 0, 0, 0, 1, 1,
0.2139627, -0.7665302, 3.367646, 0, 0, 0, 1, 1,
0.2150339, -1.935671, 3.377125, 0, 0, 0, 1, 1,
0.2151839, -0.1166508, 3.411419, 0, 0, 0, 1, 1,
0.2164806, -0.7329482, 3.093054, 0, 0, 0, 1, 1,
0.2181407, 0.8764178, 0.4348767, 1, 1, 1, 1, 1,
0.2203064, -0.2159932, 3.11783, 1, 1, 1, 1, 1,
0.223611, -0.8138421, 3.063653, 1, 1, 1, 1, 1,
0.2263531, 0.6330217, -0.001722418, 1, 1, 1, 1, 1,
0.228948, 0.2174059, -0.1348754, 1, 1, 1, 1, 1,
0.2313627, -0.4435745, 2.343682, 1, 1, 1, 1, 1,
0.2325, -0.6706167, 3.973659, 1, 1, 1, 1, 1,
0.2329389, 0.7015433, -1.383882, 1, 1, 1, 1, 1,
0.2331402, 0.02064018, 0.3980431, 1, 1, 1, 1, 1,
0.2383332, 1.546203, 1.180844, 1, 1, 1, 1, 1,
0.2404861, -0.7677254, 2.181608, 1, 1, 1, 1, 1,
0.2474975, -0.4156705, 2.551162, 1, 1, 1, 1, 1,
0.2481893, -0.2605182, 4.199302, 1, 1, 1, 1, 1,
0.2499028, -0.1612407, 1.094944, 1, 1, 1, 1, 1,
0.250221, 0.9731656, 0.449121, 1, 1, 1, 1, 1,
0.2509335, 2.344075, 0.3752818, 0, 0, 1, 1, 1,
0.2544165, -0.1609811, 1.854763, 1, 0, 0, 1, 1,
0.2575138, -0.761888, 2.667416, 1, 0, 0, 1, 1,
0.2588037, 0.2472018, 2.231239, 1, 0, 0, 1, 1,
0.2679299, 0.5886045, -1.364771, 1, 0, 0, 1, 1,
0.2713316, 0.420865, 0.4021264, 1, 0, 0, 1, 1,
0.2715795, -2.165426, 3.583065, 0, 0, 0, 1, 1,
0.2728778, -1.250632, 3.066057, 0, 0, 0, 1, 1,
0.2742886, 0.3625776, -1.793631, 0, 0, 0, 1, 1,
0.2743509, -0.1917124, 1.646463, 0, 0, 0, 1, 1,
0.2746389, -0.541878, 3.794377, 0, 0, 0, 1, 1,
0.278672, -0.2352628, 2.911252, 0, 0, 0, 1, 1,
0.2823017, 1.103646, -0.544023, 0, 0, 0, 1, 1,
0.2829929, -0.3850383, 2.355428, 1, 1, 1, 1, 1,
0.2830655, 1.84688, 0.9904145, 1, 1, 1, 1, 1,
0.2851644, -0.2152773, 3.854949, 1, 1, 1, 1, 1,
0.2899359, -1.08991, 3.249752, 1, 1, 1, 1, 1,
0.2911271, 0.8095765, -0.8653458, 1, 1, 1, 1, 1,
0.292916, 0.1409735, 1.918873, 1, 1, 1, 1, 1,
0.2936662, 1.071735, 0.494877, 1, 1, 1, 1, 1,
0.2969797, 0.8009466, 0.9431519, 1, 1, 1, 1, 1,
0.2999417, -0.3041207, 2.347189, 1, 1, 1, 1, 1,
0.3106752, 0.2919201, 1.468641, 1, 1, 1, 1, 1,
0.3227595, 1.316195, 2.270988, 1, 1, 1, 1, 1,
0.3249482, -0.4268881, 2.702427, 1, 1, 1, 1, 1,
0.3271395, 0.7924753, 0.9565977, 1, 1, 1, 1, 1,
0.327911, -0.2894494, 4.074989, 1, 1, 1, 1, 1,
0.327954, 0.0008264207, 1.920215, 1, 1, 1, 1, 1,
0.3283754, 0.9196002, -0.7743488, 0, 0, 1, 1, 1,
0.3314091, -0.6161478, 1.853227, 1, 0, 0, 1, 1,
0.3328359, 2.055281, -0.2133887, 1, 0, 0, 1, 1,
0.3342087, -2.210521, 2.208732, 1, 0, 0, 1, 1,
0.338585, -0.1903368, 3.341504, 1, 0, 0, 1, 1,
0.3470793, -0.7633817, 1.916811, 1, 0, 0, 1, 1,
0.3541065, -0.4133452, 3.028057, 0, 0, 0, 1, 1,
0.3565013, 1.309696, -0.03650389, 0, 0, 0, 1, 1,
0.3568704, -1.03308, 5.156169, 0, 0, 0, 1, 1,
0.3575138, 1.00699, 1.631512, 0, 0, 0, 1, 1,
0.3592287, -0.575891, 2.095461, 0, 0, 0, 1, 1,
0.3635421, -1.516991, 1.939555, 0, 0, 0, 1, 1,
0.3640977, -0.2917525, 3.068495, 0, 0, 0, 1, 1,
0.3667461, -1.17308, 1.034763, 1, 1, 1, 1, 1,
0.3719413, -1.469175, 2.777458, 1, 1, 1, 1, 1,
0.3720545, -0.9879858, 3.567795, 1, 1, 1, 1, 1,
0.3733839, 0.2930926, 0.8867834, 1, 1, 1, 1, 1,
0.3778512, -0.1319332, 1.403635, 1, 1, 1, 1, 1,
0.3790522, 1.562725, 1.495661, 1, 1, 1, 1, 1,
0.3812586, 0.6944526, 1.23561, 1, 1, 1, 1, 1,
0.382083, -0.08738303, 1.930643, 1, 1, 1, 1, 1,
0.3891531, 0.1670929, 1.947879, 1, 1, 1, 1, 1,
0.3894451, -0.502403, 1.902189, 1, 1, 1, 1, 1,
0.3946852, 0.05925746, 1.651075, 1, 1, 1, 1, 1,
0.3950129, 0.5612461, -0.1035853, 1, 1, 1, 1, 1,
0.3953201, -0.9546539, 2.18964, 1, 1, 1, 1, 1,
0.3957846, 0.274083, -0.2252904, 1, 1, 1, 1, 1,
0.3963748, -0.1512413, 3.324738, 1, 1, 1, 1, 1,
0.3967067, -0.1819274, 1.587917, 0, 0, 1, 1, 1,
0.3998324, 0.02832041, 1.572461, 1, 0, 0, 1, 1,
0.4009696, -0.2578207, 2.618919, 1, 0, 0, 1, 1,
0.4020227, -0.04665794, 1.787323, 1, 0, 0, 1, 1,
0.4027122, 0.5987159, 0.8328993, 1, 0, 0, 1, 1,
0.4037714, 1.855519, 0.139851, 1, 0, 0, 1, 1,
0.4085805, 0.03137378, 3.216255, 0, 0, 0, 1, 1,
0.4114551, -0.2027979, 2.47984, 0, 0, 0, 1, 1,
0.4129606, -0.5771122, 2.007916, 0, 0, 0, 1, 1,
0.4158972, 0.5084074, 0.6836928, 0, 0, 0, 1, 1,
0.4176734, -0.5033455, 3.399042, 0, 0, 0, 1, 1,
0.4181843, -0.01613345, 3.036443, 0, 0, 0, 1, 1,
0.4228221, -0.6816584, 1.970484, 0, 0, 0, 1, 1,
0.4272299, -0.1432143, 3.915507, 1, 1, 1, 1, 1,
0.4290427, 0.5503993, 1.688281, 1, 1, 1, 1, 1,
0.4307955, 0.02248755, 2.26648, 1, 1, 1, 1, 1,
0.4308606, -1.284214, 1.629163, 1, 1, 1, 1, 1,
0.4320568, 1.202654, 2.238287, 1, 1, 1, 1, 1,
0.4336328, 1.061578, 1.744423, 1, 1, 1, 1, 1,
0.4336732, 2.31502, -0.4867349, 1, 1, 1, 1, 1,
0.438107, 0.5999796, -1.515088, 1, 1, 1, 1, 1,
0.4468482, -0.588635, 3.89184, 1, 1, 1, 1, 1,
0.4469169, -0.4108099, 1.422973, 1, 1, 1, 1, 1,
0.4484037, -0.7269799, 2.819831, 1, 1, 1, 1, 1,
0.4505139, 1.291918, 0.5907867, 1, 1, 1, 1, 1,
0.4538071, -0.01753616, 2.586839, 1, 1, 1, 1, 1,
0.468333, -0.7200435, 2.181125, 1, 1, 1, 1, 1,
0.472151, -0.2403832, 2.255693, 1, 1, 1, 1, 1,
0.4739842, -1.40142, 2.810251, 0, 0, 1, 1, 1,
0.4753689, 1.43709, -1.663875, 1, 0, 0, 1, 1,
0.4758254, -0.8654056, 2.722801, 1, 0, 0, 1, 1,
0.477947, -0.8330711, 2.227004, 1, 0, 0, 1, 1,
0.4796566, 1.895198, 1.060705, 1, 0, 0, 1, 1,
0.4806786, 1.121962, 0.2453083, 1, 0, 0, 1, 1,
0.4810375, -1.371965, 2.778818, 0, 0, 0, 1, 1,
0.4942133, 0.8989272, 0.181668, 0, 0, 0, 1, 1,
0.4977435, -0.7462384, 2.294014, 0, 0, 0, 1, 1,
0.5013893, 0.06383976, 0.8989918, 0, 0, 0, 1, 1,
0.506453, 1.251227, 0.1046213, 0, 0, 0, 1, 1,
0.5114125, 0.2118839, 2.283937, 0, 0, 0, 1, 1,
0.5131775, -0.2515566, 1.996736, 0, 0, 0, 1, 1,
0.5152897, 0.5039431, 0.6135188, 1, 1, 1, 1, 1,
0.5160131, -0.5310103, 1.456662, 1, 1, 1, 1, 1,
0.5162114, 2.030985, 0.07286258, 1, 1, 1, 1, 1,
0.5186586, -0.0542765, 0.2270556, 1, 1, 1, 1, 1,
0.5234082, -0.3767758, 1.268858, 1, 1, 1, 1, 1,
0.5258287, 0.7435281, -0.1033825, 1, 1, 1, 1, 1,
0.5265949, -0.6614407, 3.47788, 1, 1, 1, 1, 1,
0.5268797, 1.243245, -1.412629, 1, 1, 1, 1, 1,
0.5271133, 0.6462952, 1.742455, 1, 1, 1, 1, 1,
0.5272391, -1.051587, 1.4474, 1, 1, 1, 1, 1,
0.528559, 0.02871349, 1.780038, 1, 1, 1, 1, 1,
0.5286101, -0.0205403, 1.421181, 1, 1, 1, 1, 1,
0.5287269, 1.298495, 0.892394, 1, 1, 1, 1, 1,
0.5293144, 0.4493288, -0.431057, 1, 1, 1, 1, 1,
0.5296407, 1.675621, 2.286209, 1, 1, 1, 1, 1,
0.5336431, -0.891224, 2.159357, 0, 0, 1, 1, 1,
0.5345615, 0.6022466, 1.484385, 1, 0, 0, 1, 1,
0.538165, -1.790543, 2.361076, 1, 0, 0, 1, 1,
0.5433253, 1.570863, 1.048441, 1, 0, 0, 1, 1,
0.547562, 0.7456163, -0.5493917, 1, 0, 0, 1, 1,
0.550757, -1.425141, 1.031391, 1, 0, 0, 1, 1,
0.5518818, 1.994713, 1.134426, 0, 0, 0, 1, 1,
0.5670584, -0.4510723, 2.731715, 0, 0, 0, 1, 1,
0.5687303, 0.41883, 1.52736, 0, 0, 0, 1, 1,
0.5717065, -0.4802625, 2.773918, 0, 0, 0, 1, 1,
0.5779808, -0.5101317, 1.689384, 0, 0, 0, 1, 1,
0.5821501, -0.2235008, 0.8161619, 0, 0, 0, 1, 1,
0.5876152, 0.2919389, 1.350939, 0, 0, 0, 1, 1,
0.5913806, -0.6761037, 2.190415, 1, 1, 1, 1, 1,
0.5919581, 0.2074688, 2.227862, 1, 1, 1, 1, 1,
0.6019064, 0.4621562, -0.02577558, 1, 1, 1, 1, 1,
0.6034603, 0.6537501, 0.493907, 1, 1, 1, 1, 1,
0.6075238, 1.109917, -0.01904106, 1, 1, 1, 1, 1,
0.6078003, -0.02327043, 2.328334, 1, 1, 1, 1, 1,
0.6084443, 0.4327829, 0.9698538, 1, 1, 1, 1, 1,
0.61323, 1.298295, 0.1778935, 1, 1, 1, 1, 1,
0.6143624, 0.005974967, 1.941129, 1, 1, 1, 1, 1,
0.6231351, 1.003965, -0.439068, 1, 1, 1, 1, 1,
0.6270791, -1.211634, 2.496533, 1, 1, 1, 1, 1,
0.6348448, 0.9132107, 0.5154077, 1, 1, 1, 1, 1,
0.6366754, -1.049589, 2.804822, 1, 1, 1, 1, 1,
0.6399373, -0.4107208, 1.243515, 1, 1, 1, 1, 1,
0.6435084, -0.5115372, 1.986596, 1, 1, 1, 1, 1,
0.6537548, -1.599055, 3.848372, 0, 0, 1, 1, 1,
0.6538701, 0.01758792, 0.5725958, 1, 0, 0, 1, 1,
0.6651284, -0.06578059, 3.069129, 1, 0, 0, 1, 1,
0.6653592, -2.016891, 4.106944, 1, 0, 0, 1, 1,
0.6779632, 0.6587398, 0.3765908, 1, 0, 0, 1, 1,
0.6857893, -0.3179408, 3.660138, 1, 0, 0, 1, 1,
0.6861003, -1.548706, 3.02148, 0, 0, 0, 1, 1,
0.6977572, 0.02790819, 1.983626, 0, 0, 0, 1, 1,
0.7070503, 0.03842993, 2.110276, 0, 0, 0, 1, 1,
0.7077542, -0.5142012, 0.9813545, 0, 0, 0, 1, 1,
0.7078032, -1.843331, 3.141943, 0, 0, 0, 1, 1,
0.7128299, 0.05515137, 1.635702, 0, 0, 0, 1, 1,
0.7130306, -1.040303, 1.378367, 0, 0, 0, 1, 1,
0.714667, -0.7135494, 3.250908, 1, 1, 1, 1, 1,
0.7178732, -1.862583, 1.972961, 1, 1, 1, 1, 1,
0.7182683, -2.144043, 3.571952, 1, 1, 1, 1, 1,
0.7212904, 1.968213, -0.533863, 1, 1, 1, 1, 1,
0.7256138, -0.3117212, 1.218035, 1, 1, 1, 1, 1,
0.7279521, 0.6293622, 2.710602, 1, 1, 1, 1, 1,
0.7335911, 0.3695547, 1.138562, 1, 1, 1, 1, 1,
0.7344147, -0.7967972, 3.149743, 1, 1, 1, 1, 1,
0.7351967, -1.17297, 3.042201, 1, 1, 1, 1, 1,
0.7367918, 1.174977, -0.4276099, 1, 1, 1, 1, 1,
0.7378621, -2.137841, 2.654577, 1, 1, 1, 1, 1,
0.7490118, -0.2194984, 2.091801, 1, 1, 1, 1, 1,
0.7509031, 0.4528018, 1.643753, 1, 1, 1, 1, 1,
0.7573612, -0.6540308, 0.7785161, 1, 1, 1, 1, 1,
0.759041, -1.097989, 4.455723, 1, 1, 1, 1, 1,
0.7616756, -0.8511217, 0.8084979, 0, 0, 1, 1, 1,
0.7683721, 0.6506467, 0.05282327, 1, 0, 0, 1, 1,
0.768849, 0.3489915, 0.08779854, 1, 0, 0, 1, 1,
0.7718014, 0.8553088, -1.5864, 1, 0, 0, 1, 1,
0.7735412, -0.3325099, 3.142148, 1, 0, 0, 1, 1,
0.7737188, -1.18673, 1.47859, 1, 0, 0, 1, 1,
0.7741536, 1.028406, -1.107048, 0, 0, 0, 1, 1,
0.7782015, 0.4999923, 1.26407, 0, 0, 0, 1, 1,
0.778909, 0.6180525, 1.288996, 0, 0, 0, 1, 1,
0.7805594, -0.1772117, 2.301508, 0, 0, 0, 1, 1,
0.7837815, -0.1128506, 1.430089, 0, 0, 0, 1, 1,
0.7878174, -2.517626, 3.368844, 0, 0, 0, 1, 1,
0.7880304, 1.498914, 1.583156, 0, 0, 0, 1, 1,
0.7891124, 2.034025, 1.126555, 1, 1, 1, 1, 1,
0.7916565, -0.8039391, 3.394728, 1, 1, 1, 1, 1,
0.7932235, -0.5727313, 2.842326, 1, 1, 1, 1, 1,
0.797982, -0.9802205, 3.864675, 1, 1, 1, 1, 1,
0.7984569, 1.195309, 1.796503, 1, 1, 1, 1, 1,
0.8019914, -0.9032636, 0.6463706, 1, 1, 1, 1, 1,
0.804561, 2.254137, 1.290526, 1, 1, 1, 1, 1,
0.8072832, -0.5309508, 3.090022, 1, 1, 1, 1, 1,
0.8089594, 0.4881767, 1.620744, 1, 1, 1, 1, 1,
0.8125049, 0.264042, 2.551582, 1, 1, 1, 1, 1,
0.8127394, -0.141092, -0.1546754, 1, 1, 1, 1, 1,
0.8179927, 0.7303867, -0.2283022, 1, 1, 1, 1, 1,
0.8193317, 1.350275, 2.181644, 1, 1, 1, 1, 1,
0.8247607, -1.660647, 4.076794, 1, 1, 1, 1, 1,
0.8316587, -0.6394328, 4.543765, 1, 1, 1, 1, 1,
0.8390611, -0.03781895, 3.590055, 0, 0, 1, 1, 1,
0.8414086, -0.6625087, 2.211727, 1, 0, 0, 1, 1,
0.8426086, 0.6832073, 3.258638, 1, 0, 0, 1, 1,
0.8445295, -1.647027, 3.525822, 1, 0, 0, 1, 1,
0.8457891, -0.4656172, 1.701263, 1, 0, 0, 1, 1,
0.8466399, 1.507363, -0.2435694, 1, 0, 0, 1, 1,
0.8555942, -1.067032, 0.9425704, 0, 0, 0, 1, 1,
0.8561924, 1.490795, -0.2160774, 0, 0, 0, 1, 1,
0.8587207, -0.07682441, 2.237493, 0, 0, 0, 1, 1,
0.8606304, 0.2141739, 0.6811523, 0, 0, 0, 1, 1,
0.8608056, 0.2952158, -0.03374237, 0, 0, 0, 1, 1,
0.864526, -1.719904, 0.2927969, 0, 0, 0, 1, 1,
0.866336, 0.384027, 1.124392, 0, 0, 0, 1, 1,
0.8669242, 0.4810207, 0.1265831, 1, 1, 1, 1, 1,
0.876772, -1.027972, 1.096216, 1, 1, 1, 1, 1,
0.8775471, 0.1765893, 1.643797, 1, 1, 1, 1, 1,
0.8816252, 0.9271364, -0.9319795, 1, 1, 1, 1, 1,
0.8845488, 0.3052897, 1.627915, 1, 1, 1, 1, 1,
0.8855482, -0.9413064, 3.812127, 1, 1, 1, 1, 1,
0.8889769, 0.6990174, 0.6260895, 1, 1, 1, 1, 1,
0.8964404, 0.03512836, 2.187604, 1, 1, 1, 1, 1,
0.8971152, -0.2842854, 0.5056245, 1, 1, 1, 1, 1,
0.8979114, -0.006202284, 1.775482, 1, 1, 1, 1, 1,
0.9087894, 0.8085724, 1.033954, 1, 1, 1, 1, 1,
0.9175458, -0.2786736, 0.7920851, 1, 1, 1, 1, 1,
0.9183316, -0.7005392, 2.266832, 1, 1, 1, 1, 1,
0.920847, 2.197639, 1.240937, 1, 1, 1, 1, 1,
0.9208971, -0.3346336, 2.68839, 1, 1, 1, 1, 1,
0.9232241, -0.828724, 1.986289, 0, 0, 1, 1, 1,
0.9233112, -0.2748298, 3.957629, 1, 0, 0, 1, 1,
0.9307147, -1.119087, 2.567867, 1, 0, 0, 1, 1,
0.9307249, -0.3192232, 2.660363, 1, 0, 0, 1, 1,
0.9340068, -0.6091607, 3.614198, 1, 0, 0, 1, 1,
0.9347597, 0.5159857, 1.064337, 1, 0, 0, 1, 1,
0.9381046, 0.1539701, 1.736605, 0, 0, 0, 1, 1,
0.9384486, 0.9111707, 1.503063, 0, 0, 0, 1, 1,
0.9415241, 0.5623446, 1.271718, 0, 0, 0, 1, 1,
0.9428002, 0.1866622, 2.136786, 0, 0, 0, 1, 1,
0.9513483, 0.4461644, 0.2896225, 0, 0, 0, 1, 1,
0.9559569, -0.02543524, 0.7279676, 0, 0, 0, 1, 1,
0.9571401, 0.003726945, 0.9476124, 0, 0, 0, 1, 1,
0.9596134, -0.1971781, 1.276638, 1, 1, 1, 1, 1,
0.9608827, -0.6388187, 1.423195, 1, 1, 1, 1, 1,
0.9610281, -0.208229, 1.609779, 1, 1, 1, 1, 1,
0.9657114, 0.03451569, 1.421693, 1, 1, 1, 1, 1,
0.9753336, -1.458618, 3.422127, 1, 1, 1, 1, 1,
0.979184, -1.259775, 1.453895, 1, 1, 1, 1, 1,
0.979886, -0.4610434, 2.239728, 1, 1, 1, 1, 1,
0.9828242, -0.4554798, 1.91541, 1, 1, 1, 1, 1,
0.9869126, -0.8681746, 2.742451, 1, 1, 1, 1, 1,
0.9924161, 0.7517005, 1.852743, 1, 1, 1, 1, 1,
0.9992789, -0.9192085, 1.499125, 1, 1, 1, 1, 1,
1.005777, -0.02416045, 1.282352, 1, 1, 1, 1, 1,
1.011621, 1.105239, 1.38244, 1, 1, 1, 1, 1,
1.014637, -0.5088019, 1.278849, 1, 1, 1, 1, 1,
1.015916, 1.385955, 0.5339407, 1, 1, 1, 1, 1,
1.017154, 1.294397, 0.2600886, 0, 0, 1, 1, 1,
1.017613, 0.2241966, 0.922381, 1, 0, 0, 1, 1,
1.022186, 0.05319615, 1.513425, 1, 0, 0, 1, 1,
1.039406, 1.631479, 0.5368511, 1, 0, 0, 1, 1,
1.040252, 0.6164721, 1.803588, 1, 0, 0, 1, 1,
1.044553, -0.2691285, 1.470044, 1, 0, 0, 1, 1,
1.045945, 1.493159, -0.9405985, 0, 0, 0, 1, 1,
1.052753, -0.3065905, 0.8298729, 0, 0, 0, 1, 1,
1.053455, 0.4209947, 1.459804, 0, 0, 0, 1, 1,
1.064681, -0.1907642, 1.567131, 0, 0, 0, 1, 1,
1.065036, -0.03873863, 1.951627, 0, 0, 0, 1, 1,
1.066235, -1.454993, 0.8836027, 0, 0, 0, 1, 1,
1.070188, -1.750102, 2.066601, 0, 0, 0, 1, 1,
1.072878, -0.1742598, 1.030832, 1, 1, 1, 1, 1,
1.076294, -0.6214297, 0.2043961, 1, 1, 1, 1, 1,
1.078543, -0.7916361, 2.495144, 1, 1, 1, 1, 1,
1.080953, 0.03043409, 1.361018, 1, 1, 1, 1, 1,
1.081968, 0.3007205, 0.6493749, 1, 1, 1, 1, 1,
1.082008, 0.01493603, 2.165053, 1, 1, 1, 1, 1,
1.084924, -0.7721813, -0.2648729, 1, 1, 1, 1, 1,
1.08495, 0.1727883, 1.518241, 1, 1, 1, 1, 1,
1.087889, -0.2847081, 1.131308, 1, 1, 1, 1, 1,
1.088542, -0.5125594, 2.513668, 1, 1, 1, 1, 1,
1.09277, 3.721866, 1.743807, 1, 1, 1, 1, 1,
1.094962, 1.453284, -0.1533469, 1, 1, 1, 1, 1,
1.097873, 1.826315, 1.468368, 1, 1, 1, 1, 1,
1.110529, 0.3715427, -0.4893648, 1, 1, 1, 1, 1,
1.111973, 0.6066035, 1.422788, 1, 1, 1, 1, 1,
1.123824, -1.543602, 2.289033, 0, 0, 1, 1, 1,
1.124873, -0.8600055, 1.932081, 1, 0, 0, 1, 1,
1.125332, -0.9875872, 0.9502788, 1, 0, 0, 1, 1,
1.12784, 0.6814617, 2.946903, 1, 0, 0, 1, 1,
1.128602, -2.486843, 2.459818, 1, 0, 0, 1, 1,
1.136628, 0.2382533, 1.185256, 1, 0, 0, 1, 1,
1.137088, 0.5823868, 0.8005907, 0, 0, 0, 1, 1,
1.137179, -0.1908647, 0.8497501, 0, 0, 0, 1, 1,
1.141869, -0.4020787, 3.280921, 0, 0, 0, 1, 1,
1.144547, 0.144679, 1.736556, 0, 0, 0, 1, 1,
1.146857, -0.6639557, 0.7460529, 0, 0, 0, 1, 1,
1.147157, 0.613714, 2.560543, 0, 0, 0, 1, 1,
1.149259, -0.2950898, 1.730309, 0, 0, 0, 1, 1,
1.155738, -1.667703, 2.622195, 1, 1, 1, 1, 1,
1.156592, 1.129493, 1.544525, 1, 1, 1, 1, 1,
1.158841, -1.101871, 2.293324, 1, 1, 1, 1, 1,
1.160404, 1.68772, 2.868071, 1, 1, 1, 1, 1,
1.165674, -0.6370162, 2.332935, 1, 1, 1, 1, 1,
1.166999, -2.122895, 1.155607, 1, 1, 1, 1, 1,
1.197416, -1.540818, 4.15033, 1, 1, 1, 1, 1,
1.203303, 1.088776, -0.2847829, 1, 1, 1, 1, 1,
1.206525, 0.04849994, 1.15076, 1, 1, 1, 1, 1,
1.208263, 0.1057439, 1.830302, 1, 1, 1, 1, 1,
1.2179, 0.2238846, 2.658902, 1, 1, 1, 1, 1,
1.221013, -0.195963, 2.360868, 1, 1, 1, 1, 1,
1.231552, -0.5285722, 2.064872, 1, 1, 1, 1, 1,
1.232181, 0.3084871, -0.08821571, 1, 1, 1, 1, 1,
1.235351, 0.4687431, -0.3029228, 1, 1, 1, 1, 1,
1.237584, 1.731003, 2.20742, 0, 0, 1, 1, 1,
1.243605, 0.2508761, 3.472175, 1, 0, 0, 1, 1,
1.257064, 1.292918, 0.119316, 1, 0, 0, 1, 1,
1.260126, 1.42405, 1.998176, 1, 0, 0, 1, 1,
1.260967, -0.2838238, 2.186499, 1, 0, 0, 1, 1,
1.261857, 0.2713168, 0.6273133, 1, 0, 0, 1, 1,
1.262333, 0.4258012, 1.197709, 0, 0, 0, 1, 1,
1.270116, -1.155716, 2.654679, 0, 0, 0, 1, 1,
1.280815, -0.251244, 1.814448, 0, 0, 0, 1, 1,
1.284742, 0.2454989, 1.689217, 0, 0, 0, 1, 1,
1.30625, 1.04851, 2.237829, 0, 0, 0, 1, 1,
1.318097, -0.1862932, 2.175324, 0, 0, 0, 1, 1,
1.328994, 0.1327237, 2.927131, 0, 0, 0, 1, 1,
1.339459, 0.03199977, 0.8079244, 1, 1, 1, 1, 1,
1.355217, -0.506878, 2.37213, 1, 1, 1, 1, 1,
1.355558, -0.019582, 3.585257, 1, 1, 1, 1, 1,
1.370398, -0.7418748, 1.92251, 1, 1, 1, 1, 1,
1.377169, 0.7703261, 1.337828, 1, 1, 1, 1, 1,
1.393813, -0.5010763, 1.70909, 1, 1, 1, 1, 1,
1.3992, -1.099195, 1.778266, 1, 1, 1, 1, 1,
1.408421, -0.5976667, 2.105211, 1, 1, 1, 1, 1,
1.432229, 0.6632468, 3.492773, 1, 1, 1, 1, 1,
1.439092, -1.059154, 1.875343, 1, 1, 1, 1, 1,
1.446938, 0.18292, 0.9190577, 1, 1, 1, 1, 1,
1.45601, 1.468203, 1.946393, 1, 1, 1, 1, 1,
1.466906, 0.2598672, 1.220654, 1, 1, 1, 1, 1,
1.490329, -0.954946, 3.913264, 1, 1, 1, 1, 1,
1.504362, 0.02029107, 3.061874, 1, 1, 1, 1, 1,
1.520159, 0.1039407, 0.9649449, 0, 0, 1, 1, 1,
1.520588, 0.5504267, 1.87227, 1, 0, 0, 1, 1,
1.521229, -0.695264, 3.390789, 1, 0, 0, 1, 1,
1.522924, 0.4931234, 2.32148, 1, 0, 0, 1, 1,
1.539941, -0.3148079, 0.3292966, 1, 0, 0, 1, 1,
1.544011, -0.4102013, 0.5986412, 1, 0, 0, 1, 1,
1.55002, -2.053679, 1.778431, 0, 0, 0, 1, 1,
1.562885, -0.9168234, 3.438236, 0, 0, 0, 1, 1,
1.570222, -0.5023214, 1.893292, 0, 0, 0, 1, 1,
1.577022, -0.2265085, 2.783462, 0, 0, 0, 1, 1,
1.597383, 1.402405, 0.7166703, 0, 0, 0, 1, 1,
1.617212, 0.7653061, 1.422904, 0, 0, 0, 1, 1,
1.638955, 0.929064, 1.959532, 0, 0, 0, 1, 1,
1.649989, 0.5105836, 2.407926, 1, 1, 1, 1, 1,
1.658479, -0.6004712, 1.178849, 1, 1, 1, 1, 1,
1.659203, 2.282336, 0.7688168, 1, 1, 1, 1, 1,
1.661629, -1.175256, 2.310294, 1, 1, 1, 1, 1,
1.679846, 1.933859, 0.6332781, 1, 1, 1, 1, 1,
1.693444, -0.2201879, 2.128498, 1, 1, 1, 1, 1,
1.697196, 1.388208, -0.7190484, 1, 1, 1, 1, 1,
1.709307, -1.475382, 1.81087, 1, 1, 1, 1, 1,
1.712765, -0.908844, 2.290371, 1, 1, 1, 1, 1,
1.715803, 0.08920771, 1.742199, 1, 1, 1, 1, 1,
1.718355, 0.977135, 2.912774, 1, 1, 1, 1, 1,
1.720437, 0.4964718, 3.120817, 1, 1, 1, 1, 1,
1.723803, -0.960561, 1.603684, 1, 1, 1, 1, 1,
1.744585, 0.7794441, 0.4372342, 1, 1, 1, 1, 1,
1.74925, -0.5422732, 2.344044, 1, 1, 1, 1, 1,
1.770777, 0.05349565, 2.300702, 0, 0, 1, 1, 1,
1.778979, 0.5805627, 1.84392, 1, 0, 0, 1, 1,
1.782649, -2.307585, 3.067151, 1, 0, 0, 1, 1,
1.787891, 0.05159897, 1.292184, 1, 0, 0, 1, 1,
1.796813, -1.879078, 2.245301, 1, 0, 0, 1, 1,
1.839298, 0.04134552, 1.044404, 1, 0, 0, 1, 1,
1.843088, 0.3469097, 2.544343, 0, 0, 0, 1, 1,
1.848244, -0.1148224, 0.2131504, 0, 0, 0, 1, 1,
1.856311, -0.2106535, 2.435351, 0, 0, 0, 1, 1,
1.86912, -1.404448, 2.030871, 0, 0, 0, 1, 1,
1.872732, 0.7817947, 0.6793141, 0, 0, 0, 1, 1,
1.896517, -1.528105, 2.446719, 0, 0, 0, 1, 1,
1.897109, -0.9317241, 2.442245, 0, 0, 0, 1, 1,
1.902606, -0.4919665, 1.272682, 1, 1, 1, 1, 1,
1.902633, 0.2103645, 2.576694, 1, 1, 1, 1, 1,
1.908119, 0.6867699, 2.655775, 1, 1, 1, 1, 1,
1.916814, -0.763283, 3.31461, 1, 1, 1, 1, 1,
1.919716, -1.811482, 1.721519, 1, 1, 1, 1, 1,
1.926401, 1.71657, 0.8960422, 1, 1, 1, 1, 1,
1.92906, -0.2380446, 2.680801, 1, 1, 1, 1, 1,
1.951875, -0.3771194, 1.689904, 1, 1, 1, 1, 1,
1.965445, 0.4842478, 2.444062, 1, 1, 1, 1, 1,
1.977508, 1.768395, 0.6922245, 1, 1, 1, 1, 1,
2.007704, -0.5389768, 4.031063, 1, 1, 1, 1, 1,
2.007964, 0.3621469, 1.813757, 1, 1, 1, 1, 1,
2.012886, -0.9931154, 3.330175, 1, 1, 1, 1, 1,
2.026269, 1.339159, 0.7557359, 1, 1, 1, 1, 1,
2.030106, 0.4828028, 2.332075, 1, 1, 1, 1, 1,
2.045511, 0.0004275326, 2.06752, 0, 0, 1, 1, 1,
2.052137, 0.8392594, 0.9389773, 1, 0, 0, 1, 1,
2.077432, -1.307997, 0.5989419, 1, 0, 0, 1, 1,
2.174402, -0.6540326, 2.596524, 1, 0, 0, 1, 1,
2.177565, -1.559689, 2.360367, 1, 0, 0, 1, 1,
2.189016, -1.084607, 1.446191, 1, 0, 0, 1, 1,
2.259023, -0.1546341, 1.010553, 0, 0, 0, 1, 1,
2.260224, -0.03643584, 2.248812, 0, 0, 0, 1, 1,
2.292982, 1.292205, 2.089314, 0, 0, 0, 1, 1,
2.295925, 0.7649154, 1.65945, 0, 0, 0, 1, 1,
2.305996, 0.7710549, 1.703458, 0, 0, 0, 1, 1,
2.319401, 0.6993907, 0.1937756, 0, 0, 0, 1, 1,
2.398544, -0.7419153, 2.687008, 0, 0, 0, 1, 1,
2.482689, -0.5837821, 2.545628, 1, 1, 1, 1, 1,
2.616713, 0.5912674, 1.188793, 1, 1, 1, 1, 1,
2.658409, -1.930078, 2.643189, 1, 1, 1, 1, 1,
2.723619, -0.1210092, -0.3471211, 1, 1, 1, 1, 1,
2.76047, 1.138724, 1.153227, 1, 1, 1, 1, 1,
2.875041, -0.01296647, 2.090311, 1, 1, 1, 1, 1,
2.995189, -1.05157, 1.653641, 1, 1, 1, 1, 1
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
var radius = 10.11516;
var distance = 35.52908;
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
mvMatrix.translate( 0.5922248, -0.3741082, 0.1639695 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.52908);
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
