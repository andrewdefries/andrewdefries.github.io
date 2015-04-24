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
-3.301667, 0.522706, -0.8824869, 1, 0, 0, 1,
-2.858451, -1.398121, -3.345798, 1, 0.007843138, 0, 1,
-2.440199, -0.2018825, -0.3188991, 1, 0.01176471, 0, 1,
-2.436091, 1.978925, -0.8021674, 1, 0.01960784, 0, 1,
-2.418761, 1.166762, -0.975799, 1, 0.02352941, 0, 1,
-2.406166, 0.3118344, -1.258107, 1, 0.03137255, 0, 1,
-2.359802, -0.9770207, -1.891152, 1, 0.03529412, 0, 1,
-2.342116, -1.06585, -2.782135, 1, 0.04313726, 0, 1,
-2.329267, -1.213648, -1.377193, 1, 0.04705882, 0, 1,
-2.309661, 0.2920517, -1.417475, 1, 0.05490196, 0, 1,
-2.282014, -0.3273179, -0.8961515, 1, 0.05882353, 0, 1,
-2.278703, 1.94181, -1.197367, 1, 0.06666667, 0, 1,
-2.273759, -1.51132, -3.493256, 1, 0.07058824, 0, 1,
-2.270866, 0.02050722, -3.542748, 1, 0.07843138, 0, 1,
-2.266922, 1.743318, -1.138205, 1, 0.08235294, 0, 1,
-2.256428, -0.3957753, -2.473769, 1, 0.09019608, 0, 1,
-2.184073, -0.3167009, -0.9797316, 1, 0.09411765, 0, 1,
-2.140261, -1.535851, -2.129016, 1, 0.1019608, 0, 1,
-2.128636, -0.9115916, -1.294294, 1, 0.1098039, 0, 1,
-2.115919, 0.6497381, -3.575641, 1, 0.1137255, 0, 1,
-2.034739, 0.02693836, -1.535622, 1, 0.1215686, 0, 1,
-1.988784, -0.3423643, -1.798071, 1, 0.1254902, 0, 1,
-1.986768, 1.514087, -0.4780005, 1, 0.1333333, 0, 1,
-1.978938, 0.4230816, -1.057269, 1, 0.1372549, 0, 1,
-1.925151, -1.142495, -3.018899, 1, 0.145098, 0, 1,
-1.910825, -0.7103634, -1.120984, 1, 0.1490196, 0, 1,
-1.908017, -0.2214517, -2.365522, 1, 0.1568628, 0, 1,
-1.90574, -0.4362015, -1.833643, 1, 0.1607843, 0, 1,
-1.895375, -2.084918, -2.484164, 1, 0.1686275, 0, 1,
-1.893365, -2.331906, -1.21493, 1, 0.172549, 0, 1,
-1.885319, 0.6833165, 0.1320491, 1, 0.1803922, 0, 1,
-1.880595, 0.2327672, -0.3468788, 1, 0.1843137, 0, 1,
-1.859865, -0.3321492, -2.444973, 1, 0.1921569, 0, 1,
-1.859452, -0.9823826, -1.709296, 1, 0.1960784, 0, 1,
-1.847932, -0.5499517, -1.480655, 1, 0.2039216, 0, 1,
-1.82994, -0.2230215, -2.026975, 1, 0.2117647, 0, 1,
-1.828154, 0.3208341, -0.8115081, 1, 0.2156863, 0, 1,
-1.819367, 0.6265689, -3.422316, 1, 0.2235294, 0, 1,
-1.810312, 0.4846166, -1.294053, 1, 0.227451, 0, 1,
-1.749407, -1.03111, -1.762654, 1, 0.2352941, 0, 1,
-1.749167, -1.157571, -3.201235, 1, 0.2392157, 0, 1,
-1.748721, -0.6797679, -0.4868836, 1, 0.2470588, 0, 1,
-1.729511, -0.339189, -2.351205, 1, 0.2509804, 0, 1,
-1.70539, 0.4162707, -1.536613, 1, 0.2588235, 0, 1,
-1.704065, -0.8815628, -1.6801, 1, 0.2627451, 0, 1,
-1.703073, 0.9984519, -0.944021, 1, 0.2705882, 0, 1,
-1.693387, 1.622427, -1.676876, 1, 0.2745098, 0, 1,
-1.691568, 0.5264874, 0.4450046, 1, 0.282353, 0, 1,
-1.665371, 1.692223, -1.486353, 1, 0.2862745, 0, 1,
-1.649721, 1.130094, -3.345905, 1, 0.2941177, 0, 1,
-1.607059, 1.536369, -0.3036824, 1, 0.3019608, 0, 1,
-1.591198, -0.5885245, -1.103369, 1, 0.3058824, 0, 1,
-1.57535, -0.06179297, -0.7296454, 1, 0.3137255, 0, 1,
-1.564609, -1.28564, -1.042798, 1, 0.3176471, 0, 1,
-1.556021, -1.148052, -1.385551, 1, 0.3254902, 0, 1,
-1.547763, -0.3728478, -1.892287, 1, 0.3294118, 0, 1,
-1.547537, 1.048979, -2.392612, 1, 0.3372549, 0, 1,
-1.546108, 0.5074278, 0.5634727, 1, 0.3411765, 0, 1,
-1.524634, 0.5964246, -0.3097287, 1, 0.3490196, 0, 1,
-1.523708, 0.5405182, -1.591123, 1, 0.3529412, 0, 1,
-1.518833, -1.581432, -2.182561, 1, 0.3607843, 0, 1,
-1.509397, -0.03449957, -0.8941582, 1, 0.3647059, 0, 1,
-1.494851, -1.196216, -3.291032, 1, 0.372549, 0, 1,
-1.492855, 1.002078, -1.950727, 1, 0.3764706, 0, 1,
-1.49022, -0.870648, -2.494669, 1, 0.3843137, 0, 1,
-1.47839, -0.2905033, -2.533669, 1, 0.3882353, 0, 1,
-1.473871, 0.1385164, -1.676208, 1, 0.3960784, 0, 1,
-1.473722, 0.5539482, 0.02184604, 1, 0.4039216, 0, 1,
-1.456587, 0.5493297, -2.187174, 1, 0.4078431, 0, 1,
-1.441892, -1.252766, -2.961246, 1, 0.4156863, 0, 1,
-1.440798, -1.415357, -1.614179, 1, 0.4196078, 0, 1,
-1.432554, 1.367486, -1.536215, 1, 0.427451, 0, 1,
-1.416152, 0.6208299, -2.953558, 1, 0.4313726, 0, 1,
-1.408076, -1.085163, -1.719887, 1, 0.4392157, 0, 1,
-1.404891, -0.2662367, -3.051582, 1, 0.4431373, 0, 1,
-1.396742, -0.4580562, -3.409579, 1, 0.4509804, 0, 1,
-1.391463, 1.216086, -0.5213373, 1, 0.454902, 0, 1,
-1.39006, 0.9988443, -1.003098, 1, 0.4627451, 0, 1,
-1.382634, 1.752982, -0.273498, 1, 0.4666667, 0, 1,
-1.381759, -0.7089703, -3.607962, 1, 0.4745098, 0, 1,
-1.378513, 1.8018, -0.7716426, 1, 0.4784314, 0, 1,
-1.370451, 0.672416, -2.218416, 1, 0.4862745, 0, 1,
-1.366085, -0.09775042, -2.799898, 1, 0.4901961, 0, 1,
-1.365245, -1.817312, -1.939569, 1, 0.4980392, 0, 1,
-1.344374, -0.2339073, -1.927101, 1, 0.5058824, 0, 1,
-1.337911, 1.461138, -0.4225755, 1, 0.509804, 0, 1,
-1.336402, -1.220099, -2.953056, 1, 0.5176471, 0, 1,
-1.330873, -2.135768, -2.209776, 1, 0.5215687, 0, 1,
-1.329695, -1.258826, -3.135386, 1, 0.5294118, 0, 1,
-1.329509, 1.016098, -2.508934, 1, 0.5333334, 0, 1,
-1.327195, -0.5647497, -1.850346, 1, 0.5411765, 0, 1,
-1.314995, -1.321561, -2.695456, 1, 0.5450981, 0, 1,
-1.312224, -1.282656, -2.55736, 1, 0.5529412, 0, 1,
-1.297653, 0.1064054, -1.758696, 1, 0.5568628, 0, 1,
-1.296546, 1.046012, -1.303995, 1, 0.5647059, 0, 1,
-1.284128, -0.3494868, -2.42825, 1, 0.5686275, 0, 1,
-1.283418, 0.4686331, -1.781991, 1, 0.5764706, 0, 1,
-1.278937, -0.1133034, -0.7010195, 1, 0.5803922, 0, 1,
-1.276024, -0.5842707, -1.907223, 1, 0.5882353, 0, 1,
-1.275001, 1.664617, -1.106728, 1, 0.5921569, 0, 1,
-1.268974, 0.4938101, -0.9054589, 1, 0.6, 0, 1,
-1.265911, -0.1583134, -3.397315, 1, 0.6078432, 0, 1,
-1.264674, 0.6322315, -3.257676, 1, 0.6117647, 0, 1,
-1.257427, 0.2238654, -2.085362, 1, 0.6196079, 0, 1,
-1.257033, -1.37192, -2.35586, 1, 0.6235294, 0, 1,
-1.251821, 1.347592, -0.7012187, 1, 0.6313726, 0, 1,
-1.250498, -0.5856476, -3.395747, 1, 0.6352941, 0, 1,
-1.248253, 1.566458, -1.070683, 1, 0.6431373, 0, 1,
-1.246903, 0.2122154, -3.488611, 1, 0.6470588, 0, 1,
-1.240116, 0.2528754, 0.9872439, 1, 0.654902, 0, 1,
-1.2375, 0.8892111, -0.7996696, 1, 0.6588235, 0, 1,
-1.227685, -0.02103347, -1.890091, 1, 0.6666667, 0, 1,
-1.224115, 0.9049251, -0.1823192, 1, 0.6705883, 0, 1,
-1.211795, 2.268529, -0.7207981, 1, 0.6784314, 0, 1,
-1.211681, 1.320811, 1.072944, 1, 0.682353, 0, 1,
-1.20052, 0.3961204, -2.269447, 1, 0.6901961, 0, 1,
-1.194047, -1.219959, -3.383415, 1, 0.6941177, 0, 1,
-1.18943, -0.04097801, -0.7268082, 1, 0.7019608, 0, 1,
-1.170307, -0.4456871, -2.175589, 1, 0.7098039, 0, 1,
-1.168962, -1.331604, -2.671887, 1, 0.7137255, 0, 1,
-1.168588, 0.3470117, -1.318719, 1, 0.7215686, 0, 1,
-1.163705, -1.648118, -0.9827256, 1, 0.7254902, 0, 1,
-1.163494, -0.4644922, -2.994268, 1, 0.7333333, 0, 1,
-1.16183, -0.004161367, -3.476027, 1, 0.7372549, 0, 1,
-1.161285, -0.03294769, -0.2435489, 1, 0.7450981, 0, 1,
-1.159124, 1.664784, -0.3030086, 1, 0.7490196, 0, 1,
-1.151887, -0.4625086, -2.17627, 1, 0.7568628, 0, 1,
-1.151304, 1.047515, -0.2275357, 1, 0.7607843, 0, 1,
-1.14978, -3.871009, -4.003172, 1, 0.7686275, 0, 1,
-1.147615, -1.379639, -0.5341916, 1, 0.772549, 0, 1,
-1.146134, -0.5773934, -2.498063, 1, 0.7803922, 0, 1,
-1.143396, 0.9752274, -0.10006, 1, 0.7843137, 0, 1,
-1.140906, 0.03952913, -2.818159, 1, 0.7921569, 0, 1,
-1.131646, 0.6516442, -1.709953, 1, 0.7960784, 0, 1,
-1.130987, 0.09792352, 0.2322191, 1, 0.8039216, 0, 1,
-1.128877, 0.1819879, -1.790608, 1, 0.8117647, 0, 1,
-1.127548, -0.2406085, -1.770569, 1, 0.8156863, 0, 1,
-1.123858, -0.3748384, -2.140978, 1, 0.8235294, 0, 1,
-1.112838, -1.049539, -2.705857, 1, 0.827451, 0, 1,
-1.112216, -1.050502, -1.444602, 1, 0.8352941, 0, 1,
-1.10691, 0.7575105, -3.760798, 1, 0.8392157, 0, 1,
-1.075976, -0.04221629, -3.008558, 1, 0.8470588, 0, 1,
-1.07575, -0.8922731, -2.581842, 1, 0.8509804, 0, 1,
-1.069445, -0.7163262, -2.682163, 1, 0.8588235, 0, 1,
-1.058012, 0.7706365, -2.140461, 1, 0.8627451, 0, 1,
-1.050928, 0.951759, -1.01359, 1, 0.8705882, 0, 1,
-1.04929, 0.5667772, -1.355381, 1, 0.8745098, 0, 1,
-1.034701, 1.492026, -0.4519002, 1, 0.8823529, 0, 1,
-1.03467, -1.681446, -2.474182, 1, 0.8862745, 0, 1,
-1.029726, -1.636502, -3.700924, 1, 0.8941177, 0, 1,
-1.025187, -0.6430062, -2.081474, 1, 0.8980392, 0, 1,
-1.01365, -0.3790212, -2.414582, 1, 0.9058824, 0, 1,
-1.012156, -1.070633, -2.24133, 1, 0.9137255, 0, 1,
-1.000237, -0.2156904, -1.692271, 1, 0.9176471, 0, 1,
-0.9941713, 0.8012508, -1.122171, 1, 0.9254902, 0, 1,
-0.9919967, 0.05299326, -2.331711, 1, 0.9294118, 0, 1,
-0.9866707, 1.422379, -0.666574, 1, 0.9372549, 0, 1,
-0.9724888, 1.231016, -0.7799293, 1, 0.9411765, 0, 1,
-0.9708557, 0.04098163, -3.065595, 1, 0.9490196, 0, 1,
-0.96435, 0.317281, -0.7631639, 1, 0.9529412, 0, 1,
-0.9629131, -1.684819, -3.083428, 1, 0.9607843, 0, 1,
-0.9585614, 0.4423696, -1.695274, 1, 0.9647059, 0, 1,
-0.9555889, 0.1122632, -1.884863, 1, 0.972549, 0, 1,
-0.9473486, 0.9798096, -1.321022, 1, 0.9764706, 0, 1,
-0.936995, 0.0622221, -1.025913, 1, 0.9843137, 0, 1,
-0.931555, -1.219475, -2.460507, 1, 0.9882353, 0, 1,
-0.9271477, -0.05209501, -1.614519, 1, 0.9960784, 0, 1,
-0.9270601, 0.2394686, -2.374496, 0.9960784, 1, 0, 1,
-0.926913, 0.735904, -1.692942, 0.9921569, 1, 0, 1,
-0.9243602, 0.7833059, -1.937515, 0.9843137, 1, 0, 1,
-0.9184934, 0.9870707, -0.3138416, 0.9803922, 1, 0, 1,
-0.9060571, -0.6678953, -1.851946, 0.972549, 1, 0, 1,
-0.9059989, 0.6962625, -1.264896, 0.9686275, 1, 0, 1,
-0.9012918, 0.001669882, -1.81725, 0.9607843, 1, 0, 1,
-0.8971881, 1.011887, 0.9045743, 0.9568627, 1, 0, 1,
-0.8970963, -0.3314482, 0.8169407, 0.9490196, 1, 0, 1,
-0.8965766, -1.455582, -4.076805, 0.945098, 1, 0, 1,
-0.8961859, 0.2995152, -2.415115, 0.9372549, 1, 0, 1,
-0.8926916, 2.227969, -0.1296339, 0.9333333, 1, 0, 1,
-0.8879526, -0.2731707, -1.836032, 0.9254902, 1, 0, 1,
-0.8863103, 0.05403779, -0.6160051, 0.9215686, 1, 0, 1,
-0.8856748, 0.9583305, -0.9583586, 0.9137255, 1, 0, 1,
-0.8825521, 0.6847659, -2.033527, 0.9098039, 1, 0, 1,
-0.8789299, -0.003332904, -2.125396, 0.9019608, 1, 0, 1,
-0.8749725, -0.6659074, -1.123669, 0.8941177, 1, 0, 1,
-0.8708895, 0.3606259, -1.17257, 0.8901961, 1, 0, 1,
-0.8690798, -1.020985, -3.067842, 0.8823529, 1, 0, 1,
-0.857977, 0.3366224, -0.5988126, 0.8784314, 1, 0, 1,
-0.8568992, 0.2709446, -1.272295, 0.8705882, 1, 0, 1,
-0.856155, 1.060059, -1.311145, 0.8666667, 1, 0, 1,
-0.8559072, 0.08766484, -1.649247, 0.8588235, 1, 0, 1,
-0.8545435, -0.8474441, -2.739604, 0.854902, 1, 0, 1,
-0.8531128, -1.009836, -1.791982, 0.8470588, 1, 0, 1,
-0.8528709, -0.7249652, -2.161067, 0.8431373, 1, 0, 1,
-0.8458185, -0.05390073, -1.607556, 0.8352941, 1, 0, 1,
-0.8445271, 0.9376561, -0.9647879, 0.8313726, 1, 0, 1,
-0.8396776, -1.306424, -4.292726, 0.8235294, 1, 0, 1,
-0.837424, 0.3288219, -2.272815, 0.8196079, 1, 0, 1,
-0.8360681, -1.535554, -2.012898, 0.8117647, 1, 0, 1,
-0.8320124, -0.2729827, -1.223839, 0.8078431, 1, 0, 1,
-0.8250571, 0.3813094, -1.865734, 0.8, 1, 0, 1,
-0.8214713, -0.9886696, -2.76713, 0.7921569, 1, 0, 1,
-0.8211896, 2.306883, 0.06910503, 0.7882353, 1, 0, 1,
-0.8190689, 0.4560652, -1.678098, 0.7803922, 1, 0, 1,
-0.8173468, -0.5778972, -2.325614, 0.7764706, 1, 0, 1,
-0.8170571, -1.36243, -3.680774, 0.7686275, 1, 0, 1,
-0.8151531, 0.1532111, 0.1178275, 0.7647059, 1, 0, 1,
-0.8113672, -1.466888, -1.814864, 0.7568628, 1, 0, 1,
-0.8059928, -1.229782, -4.559092, 0.7529412, 1, 0, 1,
-0.8051459, 0.269068, -1.309116, 0.7450981, 1, 0, 1,
-0.8040288, -0.7645555, -0.6979484, 0.7411765, 1, 0, 1,
-0.8018681, 1.012644, -1.705205, 0.7333333, 1, 0, 1,
-0.7968183, -1.029622, -1.809867, 0.7294118, 1, 0, 1,
-0.7966279, 0.9081495, -2.182017, 0.7215686, 1, 0, 1,
-0.79614, -1.568951, -2.928179, 0.7176471, 1, 0, 1,
-0.7960714, -2.26121, -2.465602, 0.7098039, 1, 0, 1,
-0.7937081, -0.9019269, -2.758028, 0.7058824, 1, 0, 1,
-0.7932059, 0.533944, -0.5868331, 0.6980392, 1, 0, 1,
-0.7929263, 0.06137132, -2.95953, 0.6901961, 1, 0, 1,
-0.7918667, 0.1030107, -1.225115, 0.6862745, 1, 0, 1,
-0.7909074, 1.433712, -0.3175207, 0.6784314, 1, 0, 1,
-0.7858801, -0.06057783, 0.6173732, 0.6745098, 1, 0, 1,
-0.7747735, 0.471339, -1.884659, 0.6666667, 1, 0, 1,
-0.7728537, 0.3957001, -0.2168133, 0.6627451, 1, 0, 1,
-0.7708507, 1.120202, -0.6830495, 0.654902, 1, 0, 1,
-0.7683548, 0.1936846, -0.8714691, 0.6509804, 1, 0, 1,
-0.7668508, 1.09312, -2.171358, 0.6431373, 1, 0, 1,
-0.7666468, 0.2160566, -1.450491, 0.6392157, 1, 0, 1,
-0.7656984, -0.9003307, -3.502463, 0.6313726, 1, 0, 1,
-0.7652337, -0.6560189, -2.142969, 0.627451, 1, 0, 1,
-0.7555447, 0.09031101, -1.491008, 0.6196079, 1, 0, 1,
-0.7534369, 1.524469, -1.835089, 0.6156863, 1, 0, 1,
-0.7394924, -0.7653164, -2.601174, 0.6078432, 1, 0, 1,
-0.7374995, 0.7468503, 0.009408172, 0.6039216, 1, 0, 1,
-0.7362764, -0.6489593, -1.820431, 0.5960785, 1, 0, 1,
-0.7342046, 2.082311, -2.508246, 0.5882353, 1, 0, 1,
-0.7332053, -0.5552087, -3.884776, 0.5843138, 1, 0, 1,
-0.7303005, -1.015934, -3.949062, 0.5764706, 1, 0, 1,
-0.7255818, -0.2475794, 0.1275862, 0.572549, 1, 0, 1,
-0.7223516, 0.1278509, -1.742712, 0.5647059, 1, 0, 1,
-0.7177747, 0.6686158, -0.1731112, 0.5607843, 1, 0, 1,
-0.7161986, 1.546086, -0.8794279, 0.5529412, 1, 0, 1,
-0.7153916, 0.5046381, -0.797785, 0.5490196, 1, 0, 1,
-0.7106705, -0.07745285, -0.3281253, 0.5411765, 1, 0, 1,
-0.707391, -1.820231, -3.173019, 0.5372549, 1, 0, 1,
-0.707372, -1.130569, -3.518998, 0.5294118, 1, 0, 1,
-0.705255, -1.720089, -2.168632, 0.5254902, 1, 0, 1,
-0.6973556, -0.538514, -2.180677, 0.5176471, 1, 0, 1,
-0.6940746, 0.3227289, -2.295458, 0.5137255, 1, 0, 1,
-0.6907115, 0.7644621, 0.1138953, 0.5058824, 1, 0, 1,
-0.6896524, 0.5028865, 0.6321905, 0.5019608, 1, 0, 1,
-0.6870249, -2.282329, -3.347955, 0.4941176, 1, 0, 1,
-0.6850924, -1.41424, -2.260375, 0.4862745, 1, 0, 1,
-0.6839827, 1.107224, -0.1504719, 0.4823529, 1, 0, 1,
-0.682153, 0.5004842, 0.0543975, 0.4745098, 1, 0, 1,
-0.6773978, -0.5324476, -2.782002, 0.4705882, 1, 0, 1,
-0.6740535, -0.544433, -1.504218, 0.4627451, 1, 0, 1,
-0.671401, 0.7310614, -0.2298654, 0.4588235, 1, 0, 1,
-0.6707355, 0.7401189, -1.960929, 0.4509804, 1, 0, 1,
-0.6693698, -1.340412, -3.391242, 0.4470588, 1, 0, 1,
-0.6666399, 0.2374827, -1.180483, 0.4392157, 1, 0, 1,
-0.6618596, -0.5819528, -2.33354, 0.4352941, 1, 0, 1,
-0.6604984, 0.319806, 0.7660789, 0.427451, 1, 0, 1,
-0.6569567, 2.312346, -0.3319851, 0.4235294, 1, 0, 1,
-0.6554273, 0.977507, -0.8214502, 0.4156863, 1, 0, 1,
-0.6544261, 0.3294318, -2.518898, 0.4117647, 1, 0, 1,
-0.6543155, 0.91192, -1.185276, 0.4039216, 1, 0, 1,
-0.6408771, 0.9220904, -0.3242003, 0.3960784, 1, 0, 1,
-0.6367415, -1.873612, -2.565849, 0.3921569, 1, 0, 1,
-0.6330535, -1.875047, -2.512972, 0.3843137, 1, 0, 1,
-0.6313321, 0.03503112, -1.769923, 0.3803922, 1, 0, 1,
-0.6272237, 0.8132867, -1.242086, 0.372549, 1, 0, 1,
-0.6269373, -0.4989664, -1.813148, 0.3686275, 1, 0, 1,
-0.6260481, 0.5724469, -1.901138, 0.3607843, 1, 0, 1,
-0.6258, 0.5784925, -0.7479801, 0.3568628, 1, 0, 1,
-0.6245942, 0.9361177, -0.3782667, 0.3490196, 1, 0, 1,
-0.6199819, -0.04199677, -2.407367, 0.345098, 1, 0, 1,
-0.6170062, 0.258077, -2.049101, 0.3372549, 1, 0, 1,
-0.6160737, 0.9475619, -0.2197517, 0.3333333, 1, 0, 1,
-0.6140493, -0.8857692, -2.489377, 0.3254902, 1, 0, 1,
-0.6104994, -0.4993714, -2.392449, 0.3215686, 1, 0, 1,
-0.610448, -1.666703, -4.530311, 0.3137255, 1, 0, 1,
-0.6087393, 0.5333608, 0.4325343, 0.3098039, 1, 0, 1,
-0.59875, 2.595844, 0.6517009, 0.3019608, 1, 0, 1,
-0.595503, 0.5789175, -2.567429, 0.2941177, 1, 0, 1,
-0.5884276, -0.682638, -2.779971, 0.2901961, 1, 0, 1,
-0.5872123, -1.796265, -3.417498, 0.282353, 1, 0, 1,
-0.586284, 0.9022499, -1.385183, 0.2784314, 1, 0, 1,
-0.5848212, 0.02164618, 0.5131197, 0.2705882, 1, 0, 1,
-0.5803003, 0.7242229, -0.007488394, 0.2666667, 1, 0, 1,
-0.5789612, -0.2592429, -1.739867, 0.2588235, 1, 0, 1,
-0.5766768, -0.5319952, -1.241532, 0.254902, 1, 0, 1,
-0.569419, 0.2610611, -1.725518, 0.2470588, 1, 0, 1,
-0.5621018, -1.403593, -3.260679, 0.2431373, 1, 0, 1,
-0.5556908, 0.2652265, -0.01370341, 0.2352941, 1, 0, 1,
-0.5507182, -0.9884007, -2.368891, 0.2313726, 1, 0, 1,
-0.5489711, -0.09475459, -0.532879, 0.2235294, 1, 0, 1,
-0.546616, 1.90891, -0.9500846, 0.2196078, 1, 0, 1,
-0.5463237, 0.7738048, -0.3994257, 0.2117647, 1, 0, 1,
-0.5459399, 0.1918911, -1.681881, 0.2078431, 1, 0, 1,
-0.5457476, 1.553777, -0.8487018, 0.2, 1, 0, 1,
-0.5439432, 1.705481, -2.083209, 0.1921569, 1, 0, 1,
-0.5417079, 0.5418561, -1.68035, 0.1882353, 1, 0, 1,
-0.5331702, 0.2044533, -1.765634, 0.1803922, 1, 0, 1,
-0.5262212, 0.07212087, -2.429891, 0.1764706, 1, 0, 1,
-0.5250562, 0.6812853, 0.1808666, 0.1686275, 1, 0, 1,
-0.5217005, -0.01398223, -0.5201682, 0.1647059, 1, 0, 1,
-0.5207263, 2.19645, 1.248767, 0.1568628, 1, 0, 1,
-0.5201288, 1.623952, -1.026133, 0.1529412, 1, 0, 1,
-0.5152415, -0.2138486, -3.185572, 0.145098, 1, 0, 1,
-0.5149258, -0.683854, -2.025041, 0.1411765, 1, 0, 1,
-0.5136364, 1.34357, -0.3845443, 0.1333333, 1, 0, 1,
-0.5041499, -0.215896, -2.265033, 0.1294118, 1, 0, 1,
-0.4981365, 0.9972283, -0.03419789, 0.1215686, 1, 0, 1,
-0.4963023, -0.4794176, -2.426631, 0.1176471, 1, 0, 1,
-0.4961042, 0.1776964, -1.170505, 0.1098039, 1, 0, 1,
-0.4905051, -1.853344, -3.871615, 0.1058824, 1, 0, 1,
-0.4879504, -0.7753409, -2.313398, 0.09803922, 1, 0, 1,
-0.484907, -1.741051, -3.399135, 0.09019608, 1, 0, 1,
-0.4818368, 1.642221, 0.2133552, 0.08627451, 1, 0, 1,
-0.4742061, -0.09670305, -3.177263, 0.07843138, 1, 0, 1,
-0.4664097, -0.6264563, -1.557071, 0.07450981, 1, 0, 1,
-0.4659575, -0.2315812, -1.987301, 0.06666667, 1, 0, 1,
-0.4645487, 0.5792209, -0.290272, 0.0627451, 1, 0, 1,
-0.4547337, 0.05371333, -1.495987, 0.05490196, 1, 0, 1,
-0.4488004, -1.12897, -3.841179, 0.05098039, 1, 0, 1,
-0.446772, -0.389095, -2.194361, 0.04313726, 1, 0, 1,
-0.4425831, 1.056988, 0.9491822, 0.03921569, 1, 0, 1,
-0.442118, 0.2428184, 1.083953, 0.03137255, 1, 0, 1,
-0.4408608, 1.319558, 0.4095748, 0.02745098, 1, 0, 1,
-0.4407734, 1.244644, 0.1057252, 0.01960784, 1, 0, 1,
-0.440506, 0.1856925, -1.246808, 0.01568628, 1, 0, 1,
-0.4359051, -1.435809, -1.739567, 0.007843138, 1, 0, 1,
-0.4346954, 1.747399, 0.6378665, 0.003921569, 1, 0, 1,
-0.4343667, -0.4346293, -0.702718, 0, 1, 0.003921569, 1,
-0.4314004, 0.5234244, -0.4067873, 0, 1, 0.01176471, 1,
-0.411539, -0.6161267, -2.374231, 0, 1, 0.01568628, 1,
-0.4029197, 0.5021803, 0.02610921, 0, 1, 0.02352941, 1,
-0.3982876, -0.2492102, -2.537713, 0, 1, 0.02745098, 1,
-0.3931767, 0.2021948, -1.764461, 0, 1, 0.03529412, 1,
-0.3855303, -0.2572621, -3.897079, 0, 1, 0.03921569, 1,
-0.3844845, -0.5682132, -2.119056, 0, 1, 0.04705882, 1,
-0.3766192, -0.8895643, -3.027268, 0, 1, 0.05098039, 1,
-0.369091, 0.7321375, 1.30436, 0, 1, 0.05882353, 1,
-0.3675255, 0.8303959, -0.7311759, 0, 1, 0.0627451, 1,
-0.3629318, 0.3331912, -1.75557, 0, 1, 0.07058824, 1,
-0.3594048, -0.6672422, -3.06519, 0, 1, 0.07450981, 1,
-0.3584054, -1.35874, -2.377152, 0, 1, 0.08235294, 1,
-0.3531498, -0.5645118, -2.540727, 0, 1, 0.08627451, 1,
-0.3512665, 1.33258, 1.010082, 0, 1, 0.09411765, 1,
-0.3508832, 1.020054, 0.3727811, 0, 1, 0.1019608, 1,
-0.3439464, 0.8267093, -0.1755492, 0, 1, 0.1058824, 1,
-0.3410531, 0.8027958, -1.940214, 0, 1, 0.1137255, 1,
-0.3386433, 2.306633, -0.1482631, 0, 1, 0.1176471, 1,
-0.3373646, 0.7195957, -1.118723, 0, 1, 0.1254902, 1,
-0.3368965, -0.3792513, -1.202914, 0, 1, 0.1294118, 1,
-0.3360051, 0.7019323, 0.4196895, 0, 1, 0.1372549, 1,
-0.3273738, -0.6096902, -1.821179, 0, 1, 0.1411765, 1,
-0.322995, -1.197586, -1.854673, 0, 1, 0.1490196, 1,
-0.3228452, 0.07191051, -2.20308, 0, 1, 0.1529412, 1,
-0.3200341, 0.5564333, -1.113058, 0, 1, 0.1607843, 1,
-0.320005, 1.534916, 1.091517, 0, 1, 0.1647059, 1,
-0.319827, -0.5016321, -2.10384, 0, 1, 0.172549, 1,
-0.3191923, -1.993018, -3.77632, 0, 1, 0.1764706, 1,
-0.3155241, 1.448877, -0.3311725, 0, 1, 0.1843137, 1,
-0.3095252, -0.1274311, -1.657298, 0, 1, 0.1882353, 1,
-0.3075396, -1.390155, -3.241151, 0, 1, 0.1960784, 1,
-0.3069225, 0.2046946, -1.755734, 0, 1, 0.2039216, 1,
-0.3043416, -0.2925312, -1.991867, 0, 1, 0.2078431, 1,
-0.3036902, -1.176372, -3.946618, 0, 1, 0.2156863, 1,
-0.3032557, -0.340988, -1.972095, 0, 1, 0.2196078, 1,
-0.3027263, 1.523386, -0.9220676, 0, 1, 0.227451, 1,
-0.3016986, 1.313012, -2.196142, 0, 1, 0.2313726, 1,
-0.2915398, 0.2481778, -0.8406237, 0, 1, 0.2392157, 1,
-0.2909117, -0.3157576, -1.998204, 0, 1, 0.2431373, 1,
-0.2906213, -0.7763107, -2.043519, 0, 1, 0.2509804, 1,
-0.2867171, 0.782129, 1.017699, 0, 1, 0.254902, 1,
-0.2833941, 0.5000772, 0.06779065, 0, 1, 0.2627451, 1,
-0.2833894, 0.5049503, -0.07004158, 0, 1, 0.2666667, 1,
-0.2825642, -1.48096, -3.361712, 0, 1, 0.2745098, 1,
-0.2812112, 0.7573577, -1.696137, 0, 1, 0.2784314, 1,
-0.2749518, -0.4178456, -3.31382, 0, 1, 0.2862745, 1,
-0.2678751, -0.1626792, -1.299418, 0, 1, 0.2901961, 1,
-0.2657977, -1.285609, -3.120979, 0, 1, 0.2980392, 1,
-0.2637667, -0.3304746, -4.112798, 0, 1, 0.3058824, 1,
-0.2587859, 0.09125984, 0.2420808, 0, 1, 0.3098039, 1,
-0.2560642, -0.3790856, -2.80159, 0, 1, 0.3176471, 1,
-0.2388358, 0.3029039, -0.8211254, 0, 1, 0.3215686, 1,
-0.2386584, 0.5417263, 0.3171552, 0, 1, 0.3294118, 1,
-0.2381683, -0.3013053, -2.86393, 0, 1, 0.3333333, 1,
-0.2337847, 1.768027, -0.8941964, 0, 1, 0.3411765, 1,
-0.2298557, 0.4771695, 0.6287534, 0, 1, 0.345098, 1,
-0.2297875, -0.5367413, -3.453589, 0, 1, 0.3529412, 1,
-0.2297426, 1.361249, 1.651446, 0, 1, 0.3568628, 1,
-0.2290218, 0.07561953, -2.360103, 0, 1, 0.3647059, 1,
-0.2257119, 1.950668, -0.2962824, 0, 1, 0.3686275, 1,
-0.2255655, -1.371995, -1.942199, 0, 1, 0.3764706, 1,
-0.225151, 2.044388, -0.9925358, 0, 1, 0.3803922, 1,
-0.2229822, -0.6634555, -2.748735, 0, 1, 0.3882353, 1,
-0.2216311, -0.6374202, -2.170394, 0, 1, 0.3921569, 1,
-0.2209828, -0.3732994, -0.6020687, 0, 1, 0.4, 1,
-0.2154486, 0.004378061, -1.486367, 0, 1, 0.4078431, 1,
-0.2151802, 0.6088994, -0.9082655, 0, 1, 0.4117647, 1,
-0.2017455, -0.5385121, -3.361562, 0, 1, 0.4196078, 1,
-0.2010674, -0.5215033, -3.003432, 0, 1, 0.4235294, 1,
-0.1952255, 0.176269, -1.248112, 0, 1, 0.4313726, 1,
-0.1939337, 2.175355, 0.8770795, 0, 1, 0.4352941, 1,
-0.1897489, -0.1110152, -2.182556, 0, 1, 0.4431373, 1,
-0.1889236, -0.1700404, -3.156502, 0, 1, 0.4470588, 1,
-0.1844928, -0.2558548, -2.954489, 0, 1, 0.454902, 1,
-0.1770927, 0.3412748, -1.216028, 0, 1, 0.4588235, 1,
-0.1732459, -0.2211761, -4.580871, 0, 1, 0.4666667, 1,
-0.1700829, -1.798021, -3.481931, 0, 1, 0.4705882, 1,
-0.1690909, -0.02475868, -1.976615, 0, 1, 0.4784314, 1,
-0.1614268, -0.5072343, -1.558116, 0, 1, 0.4823529, 1,
-0.1599006, -2.578617, -2.638519, 0, 1, 0.4901961, 1,
-0.1594636, -0.7495762, -3.368798, 0, 1, 0.4941176, 1,
-0.1545158, -1.862206, -0.4947735, 0, 1, 0.5019608, 1,
-0.1531679, -0.3255651, -1.308041, 0, 1, 0.509804, 1,
-0.1522532, 0.4805489, -1.108904, 0, 1, 0.5137255, 1,
-0.1518563, 2.654093, -3.448388, 0, 1, 0.5215687, 1,
-0.1513525, 0.5722835, -2.610562, 0, 1, 0.5254902, 1,
-0.1504186, -0.4130266, -2.817082, 0, 1, 0.5333334, 1,
-0.1472452, -0.6893401, -3.339143, 0, 1, 0.5372549, 1,
-0.1461056, 0.3552395, -1.256489, 0, 1, 0.5450981, 1,
-0.1416811, 1.227954, 0.03941484, 0, 1, 0.5490196, 1,
-0.1370465, -0.3353358, -3.685549, 0, 1, 0.5568628, 1,
-0.1367704, -0.6463218, -4.117765, 0, 1, 0.5607843, 1,
-0.1353584, 0.6042517, -0.4829333, 0, 1, 0.5686275, 1,
-0.1353372, -0.05616698, -1.806942, 0, 1, 0.572549, 1,
-0.1351419, -1.520717, -2.311015, 0, 1, 0.5803922, 1,
-0.1325855, -0.3176404, -2.647801, 0, 1, 0.5843138, 1,
-0.1274739, 1.772997, -2.34801, 0, 1, 0.5921569, 1,
-0.1257094, -0.1181386, -1.294102, 0, 1, 0.5960785, 1,
-0.1214023, 1.18414, -1.636805, 0, 1, 0.6039216, 1,
-0.1186696, 0.7095138, 1.22531, 0, 1, 0.6117647, 1,
-0.1175649, 2.02273, -0.5912783, 0, 1, 0.6156863, 1,
-0.1104174, 0.4368575, 1.071222, 0, 1, 0.6235294, 1,
-0.1078623, -0.5082321, -2.447194, 0, 1, 0.627451, 1,
-0.09953354, -0.03009484, -2.850187, 0, 1, 0.6352941, 1,
-0.09712451, 2.17284, 0.1613093, 0, 1, 0.6392157, 1,
-0.0939296, -0.4389533, -2.667655, 0, 1, 0.6470588, 1,
-0.08340456, 0.182454, 0.5751881, 0, 1, 0.6509804, 1,
-0.08273016, 0.7931343, 0.6074035, 0, 1, 0.6588235, 1,
-0.07668959, -2.800076, -3.428455, 0, 1, 0.6627451, 1,
-0.07593717, 0.1161264, -0.791028, 0, 1, 0.6705883, 1,
-0.07295773, -1.269496, -2.19977, 0, 1, 0.6745098, 1,
-0.07131027, 0.5350801, 1.825362, 0, 1, 0.682353, 1,
-0.07077555, 0.8020512, 1.716662, 0, 1, 0.6862745, 1,
-0.06959026, 0.2411487, 0.478884, 0, 1, 0.6941177, 1,
-0.06950208, 0.2149864, 0.1032221, 0, 1, 0.7019608, 1,
-0.06701189, -1.434091, -2.857313, 0, 1, 0.7058824, 1,
-0.06470238, -0.1116729, -2.254953, 0, 1, 0.7137255, 1,
-0.05777397, 0.3377445, 1.423974, 0, 1, 0.7176471, 1,
-0.05756366, 1.8871, 1.326054, 0, 1, 0.7254902, 1,
-0.05675398, 0.7750482, 0.1932273, 0, 1, 0.7294118, 1,
-0.05483177, -0.9975306, -3.352977, 0, 1, 0.7372549, 1,
-0.05434712, -0.963514, -2.159114, 0, 1, 0.7411765, 1,
-0.04443299, 0.9920142, -0.2093204, 0, 1, 0.7490196, 1,
-0.04388717, 0.7093162, 0.06835862, 0, 1, 0.7529412, 1,
-0.04350042, -1.688594, -2.166788, 0, 1, 0.7607843, 1,
-0.04150763, -0.1504828, -2.60048, 0, 1, 0.7647059, 1,
-0.03849242, 0.04792709, -0.7525131, 0, 1, 0.772549, 1,
-0.0273657, -0.5298876, -4.851821, 0, 1, 0.7764706, 1,
-0.02671555, -1.066077, -4.217322, 0, 1, 0.7843137, 1,
-0.02611397, -1.132082, -0.5749817, 0, 1, 0.7882353, 1,
-0.02552763, -0.8185787, -1.577999, 0, 1, 0.7960784, 1,
-0.02201657, -1.447569, -2.344203, 0, 1, 0.8039216, 1,
-0.0212045, -0.3090347, -2.728431, 0, 1, 0.8078431, 1,
-0.0209518, -0.9883457, -2.860713, 0, 1, 0.8156863, 1,
-0.02039682, 0.9859267, 0.8072569, 0, 1, 0.8196079, 1,
-0.008260129, -0.2753407, -2.100607, 0, 1, 0.827451, 1,
-0.005071359, -0.6711009, -4.100831, 0, 1, 0.8313726, 1,
-0.004339483, 0.195175, 0.3016561, 0, 1, 0.8392157, 1,
-0.004253405, -0.5142199, -2.0972, 0, 1, 0.8431373, 1,
-0.002440927, 0.8464587, -1.319403, 0, 1, 0.8509804, 1,
0.006453449, 0.3963669, -1.662489, 0, 1, 0.854902, 1,
0.00982713, -0.1799696, 2.084634, 0, 1, 0.8627451, 1,
0.01259752, -0.2515907, 2.377498, 0, 1, 0.8666667, 1,
0.01625748, -0.8234649, 1.540952, 0, 1, 0.8745098, 1,
0.01666818, 1.572294, 1.473558, 0, 1, 0.8784314, 1,
0.01914185, 0.4055153, -1.237946, 0, 1, 0.8862745, 1,
0.02057088, 0.3390859, -1.296039, 0, 1, 0.8901961, 1,
0.02405713, 0.1890957, 0.4576826, 0, 1, 0.8980392, 1,
0.02765847, 1.061041, 0.3337603, 0, 1, 0.9058824, 1,
0.02953098, -1.315753, 1.30893, 0, 1, 0.9098039, 1,
0.03345365, 1.079648, 0.8933566, 0, 1, 0.9176471, 1,
0.03570023, 0.785796, 0.04200748, 0, 1, 0.9215686, 1,
0.03635727, -0.05226541, 2.441329, 0, 1, 0.9294118, 1,
0.04195879, -0.01562642, 4.124821, 0, 1, 0.9333333, 1,
0.04214091, -0.009835297, 0.5627018, 0, 1, 0.9411765, 1,
0.04800792, 0.5545402, -0.1015273, 0, 1, 0.945098, 1,
0.04835596, 0.5393172, 1.837295, 0, 1, 0.9529412, 1,
0.05002672, 0.5217428, 0.2404747, 0, 1, 0.9568627, 1,
0.05854236, -0.3090925, 2.681781, 0, 1, 0.9647059, 1,
0.05959818, 1.721513, 0.6751356, 0, 1, 0.9686275, 1,
0.05990013, -2.674703, 2.988788, 0, 1, 0.9764706, 1,
0.06173242, -0.3185691, 5.229764, 0, 1, 0.9803922, 1,
0.06205496, -0.5610285, 3.558305, 0, 1, 0.9882353, 1,
0.064589, 0.3121977, 1.145374, 0, 1, 0.9921569, 1,
0.0689112, 1.557339, -0.6146987, 0, 1, 1, 1,
0.07269179, 0.5619171, -1.087866, 0, 0.9921569, 1, 1,
0.0728098, 0.5186405, -0.2778369, 0, 0.9882353, 1, 1,
0.07595284, -1.127341, 2.189655, 0, 0.9803922, 1, 1,
0.07882565, -0.3656846, 4.032546, 0, 0.9764706, 1, 1,
0.07916595, 1.005037, -0.7432675, 0, 0.9686275, 1, 1,
0.07979944, 1.768455, -0.6493549, 0, 0.9647059, 1, 1,
0.08050197, -2.334179, 3.388454, 0, 0.9568627, 1, 1,
0.08408973, 0.01922445, 0.1107709, 0, 0.9529412, 1, 1,
0.08517646, 0.5718388, -1.782131, 0, 0.945098, 1, 1,
0.08605694, 0.08140586, 0.2726255, 0, 0.9411765, 1, 1,
0.08940719, 1.114895, 0.9017132, 0, 0.9333333, 1, 1,
0.09026734, -1.475945, 3.304356, 0, 0.9294118, 1, 1,
0.09838428, 1.120204, 2.406423, 0, 0.9215686, 1, 1,
0.09895016, -1.098022, 2.511159, 0, 0.9176471, 1, 1,
0.1039321, 0.2883264, 1.288904, 0, 0.9098039, 1, 1,
0.1053953, -0.4671385, 2.638204, 0, 0.9058824, 1, 1,
0.1066741, -0.7574442, 3.67702, 0, 0.8980392, 1, 1,
0.1070185, 1.400973, -0.1077202, 0, 0.8901961, 1, 1,
0.1083117, 0.7508255, -1.136274, 0, 0.8862745, 1, 1,
0.108917, 0.2476016, 0.08224934, 0, 0.8784314, 1, 1,
0.1091271, 0.791576, -0.2756117, 0, 0.8745098, 1, 1,
0.111779, 1.052648, -0.3082391, 0, 0.8666667, 1, 1,
0.1139847, -0.3594823, 3.459066, 0, 0.8627451, 1, 1,
0.1194213, -2.649669, 3.385603, 0, 0.854902, 1, 1,
0.1202465, -1.222224, 3.331058, 0, 0.8509804, 1, 1,
0.1234657, -1.326243, 4.886412, 0, 0.8431373, 1, 1,
0.123687, -1.170172, 2.547812, 0, 0.8392157, 1, 1,
0.1242847, 0.07773165, 1.899466, 0, 0.8313726, 1, 1,
0.1245959, -0.1046346, 1.366559, 0, 0.827451, 1, 1,
0.1258836, -1.162514, 3.104504, 0, 0.8196079, 1, 1,
0.1282428, -1.163451, 3.112591, 0, 0.8156863, 1, 1,
0.1289409, 0.5499669, 0.4417112, 0, 0.8078431, 1, 1,
0.1300582, 0.5496696, 0.7638956, 0, 0.8039216, 1, 1,
0.1309381, -0.9366741, 4.464279, 0, 0.7960784, 1, 1,
0.1316357, 0.501475, 0.4724237, 0, 0.7882353, 1, 1,
0.1329768, -0.5356314, 2.375839, 0, 0.7843137, 1, 1,
0.1348451, -0.7682163, 4.330765, 0, 0.7764706, 1, 1,
0.1400829, -0.1991316, 3.253326, 0, 0.772549, 1, 1,
0.1406732, 0.4447494, 0.627308, 0, 0.7647059, 1, 1,
0.1462403, 1.5215, -0.3077824, 0, 0.7607843, 1, 1,
0.1473428, 2.292001, 1.009595, 0, 0.7529412, 1, 1,
0.1477586, -0.8199714, 3.821373, 0, 0.7490196, 1, 1,
0.1482868, -1.852584, 2.772914, 0, 0.7411765, 1, 1,
0.1513731, -1.349241, 2.056292, 0, 0.7372549, 1, 1,
0.1557725, -0.1299777, 2.323383, 0, 0.7294118, 1, 1,
0.1560146, -0.8232825, 3.387547, 0, 0.7254902, 1, 1,
0.1619521, -2.337928, 3.505747, 0, 0.7176471, 1, 1,
0.1620227, -2.497811, 2.336635, 0, 0.7137255, 1, 1,
0.1623676, 1.318378, -0.7078076, 0, 0.7058824, 1, 1,
0.1664978, -0.4371542, 1.714224, 0, 0.6980392, 1, 1,
0.1670589, -1.689204, 3.182398, 0, 0.6941177, 1, 1,
0.1701305, 0.3890261, -0.8731623, 0, 0.6862745, 1, 1,
0.171581, -0.5627834, 2.574959, 0, 0.682353, 1, 1,
0.1778971, -0.2580533, 2.459225, 0, 0.6745098, 1, 1,
0.1780725, 0.02851453, 1.816315, 0, 0.6705883, 1, 1,
0.1818646, -0.3587138, 4.256494, 0, 0.6627451, 1, 1,
0.1870112, -0.6133456, 2.233225, 0, 0.6588235, 1, 1,
0.188391, -0.7119502, 3.248429, 0, 0.6509804, 1, 1,
0.1897259, 0.06297939, 2.234243, 0, 0.6470588, 1, 1,
0.194084, 1.966969, -0.6782141, 0, 0.6392157, 1, 1,
0.1992248, -0.7961017, 2.289254, 0, 0.6352941, 1, 1,
0.1995414, 0.8625287, -0.2666646, 0, 0.627451, 1, 1,
0.2032129, -0.1799499, 1.413701, 0, 0.6235294, 1, 1,
0.2054478, 0.1502819, 0.3349498, 0, 0.6156863, 1, 1,
0.2093976, 0.8155035, 0.3506517, 0, 0.6117647, 1, 1,
0.2119925, -0.1763882, 1.961543, 0, 0.6039216, 1, 1,
0.2191005, -1.920726, 2.844987, 0, 0.5960785, 1, 1,
0.2223445, 0.4265049, 0.4333395, 0, 0.5921569, 1, 1,
0.2256207, -0.3893728, 2.672467, 0, 0.5843138, 1, 1,
0.2273216, 0.3276108, -0.9542055, 0, 0.5803922, 1, 1,
0.2322038, -0.1866518, 2.565934, 0, 0.572549, 1, 1,
0.2350874, -0.1337021, 1.907038, 0, 0.5686275, 1, 1,
0.2403552, 1.060987, 1.357331, 0, 0.5607843, 1, 1,
0.2411403, -0.7510733, 3.176016, 0, 0.5568628, 1, 1,
0.244716, -2.211529, 3.06742, 0, 0.5490196, 1, 1,
0.2464679, -0.5153843, 1.821349, 0, 0.5450981, 1, 1,
0.2523707, -0.1686353, 1.112802, 0, 0.5372549, 1, 1,
0.2526971, -0.4649408, 1.836817, 0, 0.5333334, 1, 1,
0.2529436, 0.1161239, 3.312378, 0, 0.5254902, 1, 1,
0.2607222, 0.7486153, -0.1776887, 0, 0.5215687, 1, 1,
0.2610314, -0.9729522, 3.434608, 0, 0.5137255, 1, 1,
0.270837, 0.2490008, -0.8962536, 0, 0.509804, 1, 1,
0.2726357, -0.3852131, 2.678082, 0, 0.5019608, 1, 1,
0.2743866, -2.576369, 2.199941, 0, 0.4941176, 1, 1,
0.2770838, -1.037232, 2.692274, 0, 0.4901961, 1, 1,
0.2780459, -0.8244191, 3.61652, 0, 0.4823529, 1, 1,
0.2781663, 0.4102314, 0.1682891, 0, 0.4784314, 1, 1,
0.2783947, 0.8410169, 1.793041, 0, 0.4705882, 1, 1,
0.280865, 0.3929, 2.118344, 0, 0.4666667, 1, 1,
0.286754, 0.01773867, 3.081465, 0, 0.4588235, 1, 1,
0.2879712, -0.4012763, 2.208106, 0, 0.454902, 1, 1,
0.2952304, -0.5879498, 3.008183, 0, 0.4470588, 1, 1,
0.2991304, -0.8233587, 1.561194, 0, 0.4431373, 1, 1,
0.3004047, -0.6537688, 3.954341, 0, 0.4352941, 1, 1,
0.3020184, -0.4749973, 3.549945, 0, 0.4313726, 1, 1,
0.3020357, 0.3173946, 1.178439, 0, 0.4235294, 1, 1,
0.302553, -1.547619, 1.759658, 0, 0.4196078, 1, 1,
0.3026798, -0.2794948, 2.763105, 0, 0.4117647, 1, 1,
0.3034779, 1.106347, 0.9687222, 0, 0.4078431, 1, 1,
0.3061573, 0.109848, 2.447878, 0, 0.4, 1, 1,
0.3080809, -0.8098248, 2.063047, 0, 0.3921569, 1, 1,
0.3085049, -0.7019743, 2.622262, 0, 0.3882353, 1, 1,
0.3110093, -1.398337, 5.042564, 0, 0.3803922, 1, 1,
0.3137765, 2.471751, 0.7582229, 0, 0.3764706, 1, 1,
0.315138, 0.1521007, 1.236939, 0, 0.3686275, 1, 1,
0.3182227, 2.487493, 0.363537, 0, 0.3647059, 1, 1,
0.3185406, -0.4405456, 2.042531, 0, 0.3568628, 1, 1,
0.3187095, 0.9535177, -0.510833, 0, 0.3529412, 1, 1,
0.319734, -0.8776074, 1.660463, 0, 0.345098, 1, 1,
0.3200303, 0.2387785, 0.843674, 0, 0.3411765, 1, 1,
0.3312092, 2.46232, 0.8144571, 0, 0.3333333, 1, 1,
0.3334263, 0.4595733, 0.79704, 0, 0.3294118, 1, 1,
0.333723, 0.4616996, 1.459436, 0, 0.3215686, 1, 1,
0.3391744, -1.086424, 1.969494, 0, 0.3176471, 1, 1,
0.340625, -1.227676, 1.010984, 0, 0.3098039, 1, 1,
0.3441018, -1.543162, 3.626233, 0, 0.3058824, 1, 1,
0.3443697, -0.5680771, 0.3388845, 0, 0.2980392, 1, 1,
0.3447389, 0.1188178, 0.9878576, 0, 0.2901961, 1, 1,
0.3447513, -0.6034933, 4.386864, 0, 0.2862745, 1, 1,
0.3448199, -1.509215, 3.132928, 0, 0.2784314, 1, 1,
0.3487876, 0.3195444, 0.0457278, 0, 0.2745098, 1, 1,
0.3502652, -0.2347221, 2.893138, 0, 0.2666667, 1, 1,
0.351063, 0.2665651, 0.8923657, 0, 0.2627451, 1, 1,
0.3515365, -1.19406, 2.828305, 0, 0.254902, 1, 1,
0.3519581, 0.8140596, 0.5963545, 0, 0.2509804, 1, 1,
0.3528557, -0.369166, 1.409063, 0, 0.2431373, 1, 1,
0.3569122, -1.271449, 2.431057, 0, 0.2392157, 1, 1,
0.3576426, 1.395437, 0.04001226, 0, 0.2313726, 1, 1,
0.3635629, 0.007402099, 1.840222, 0, 0.227451, 1, 1,
0.364272, 1.562849, -1.37746, 0, 0.2196078, 1, 1,
0.3668284, 0.665889, 1.176721, 0, 0.2156863, 1, 1,
0.3680477, -1.410671, 2.821961, 0, 0.2078431, 1, 1,
0.3680576, 0.4569007, -0.4540159, 0, 0.2039216, 1, 1,
0.3704397, 2.256567, 0.4889325, 0, 0.1960784, 1, 1,
0.3712863, -0.703108, 3.587982, 0, 0.1882353, 1, 1,
0.3714457, 0.7893101, 0.46656, 0, 0.1843137, 1, 1,
0.3723926, 1.065869, 0.9391409, 0, 0.1764706, 1, 1,
0.3739797, -0.5139543, 2.728044, 0, 0.172549, 1, 1,
0.3781544, -0.5788875, 2.186016, 0, 0.1647059, 1, 1,
0.3793426, 1.46119, 1.462107, 0, 0.1607843, 1, 1,
0.3805072, -0.4334014, 2.665995, 0, 0.1529412, 1, 1,
0.3810569, 0.8922021, 0.9125589, 0, 0.1490196, 1, 1,
0.3824185, -0.1758271, 0.9782797, 0, 0.1411765, 1, 1,
0.3853925, 0.2414189, 1.563122, 0, 0.1372549, 1, 1,
0.3863584, -1.227193, 1.547701, 0, 0.1294118, 1, 1,
0.3863887, -0.7458125, 1.755031, 0, 0.1254902, 1, 1,
0.3897839, -1.026669, 0.8662163, 0, 0.1176471, 1, 1,
0.3909643, 0.3402864, 0.9956013, 0, 0.1137255, 1, 1,
0.3952557, 0.9721361, -0.2386615, 0, 0.1058824, 1, 1,
0.3969986, -0.1452199, -0.7267264, 0, 0.09803922, 1, 1,
0.3988291, 0.5351483, 0.4255093, 0, 0.09411765, 1, 1,
0.4015594, 0.2797477, 1.655229, 0, 0.08627451, 1, 1,
0.4067744, 0.3504795, 1.415594, 0, 0.08235294, 1, 1,
0.4106204, -1.171382, 2.339053, 0, 0.07450981, 1, 1,
0.4107583, 0.0996546, 0.9149663, 0, 0.07058824, 1, 1,
0.412415, -0.4176835, 1.929157, 0, 0.0627451, 1, 1,
0.4132364, -0.7440319, 2.48528, 0, 0.05882353, 1, 1,
0.4152922, 0.5179574, 1.00582, 0, 0.05098039, 1, 1,
0.416686, 1.394024, 0.6449994, 0, 0.04705882, 1, 1,
0.4210218, 0.6557782, -0.1852675, 0, 0.03921569, 1, 1,
0.4229067, 0.145957, 0.1092967, 0, 0.03529412, 1, 1,
0.4337854, 0.5198333, 2.274107, 0, 0.02745098, 1, 1,
0.4382624, 0.6199857, 0.2844484, 0, 0.02352941, 1, 1,
0.4402992, 0.4713026, 0.9750401, 0, 0.01568628, 1, 1,
0.4404236, -0.9861302, 2.099399, 0, 0.01176471, 1, 1,
0.4428976, 0.4749331, 0.6550878, 0, 0.003921569, 1, 1,
0.4447897, 1.951577, -0.8825331, 0.003921569, 0, 1, 1,
0.4479448, 0.4630516, 1.676439, 0.007843138, 0, 1, 1,
0.4482477, 0.1355953, 2.200824, 0.01568628, 0, 1, 1,
0.451921, 1.337948, 0.3774833, 0.01960784, 0, 1, 1,
0.4527981, -0.8123993, 2.888278, 0.02745098, 0, 1, 1,
0.4553836, -0.2916691, 2.372185, 0.03137255, 0, 1, 1,
0.4563702, 0.3238114, 0.6297919, 0.03921569, 0, 1, 1,
0.4585646, -0.5548146, 2.261261, 0.04313726, 0, 1, 1,
0.4586075, 0.7078733, 1.79507, 0.05098039, 0, 1, 1,
0.459265, 1.979606, -0.2292121, 0.05490196, 0, 1, 1,
0.4595526, -0.3376347, 3.350925, 0.0627451, 0, 1, 1,
0.4646074, 0.1727869, 2.084887, 0.06666667, 0, 1, 1,
0.466109, 0.7726484, 0.7413445, 0.07450981, 0, 1, 1,
0.483495, -0.05186684, 1.174163, 0.07843138, 0, 1, 1,
0.4864788, -0.6946223, 3.995977, 0.08627451, 0, 1, 1,
0.489767, 1.266706, -0.2677339, 0.09019608, 0, 1, 1,
0.4912117, 0.2044921, 0.6234313, 0.09803922, 0, 1, 1,
0.4925982, -0.3077995, 1.481054, 0.1058824, 0, 1, 1,
0.4955635, 0.461276, -0.0923676, 0.1098039, 0, 1, 1,
0.497126, 0.4972698, 1.921043, 0.1176471, 0, 1, 1,
0.497297, 1.238071, 1.290082, 0.1215686, 0, 1, 1,
0.5067511, -1.437224, 3.594559, 0.1294118, 0, 1, 1,
0.506961, -0.1394203, 2.843193, 0.1333333, 0, 1, 1,
0.5090424, -0.3117763, 1.259423, 0.1411765, 0, 1, 1,
0.515383, -1.616957, 3.915651, 0.145098, 0, 1, 1,
0.5168426, -0.1017826, 1.169779, 0.1529412, 0, 1, 1,
0.517224, 0.5189868, 1.950853, 0.1568628, 0, 1, 1,
0.5229341, -1.234619, 1.693628, 0.1647059, 0, 1, 1,
0.5256683, 1.49563, 0.0391539, 0.1686275, 0, 1, 1,
0.5295398, 0.9635195, 1.126302, 0.1764706, 0, 1, 1,
0.5302144, -0.0833261, 0.05333511, 0.1803922, 0, 1, 1,
0.5368698, -0.4862282, 1.909017, 0.1882353, 0, 1, 1,
0.5399898, -0.8646188, 3.472015, 0.1921569, 0, 1, 1,
0.542532, 0.4649984, 1.10575, 0.2, 0, 1, 1,
0.546753, -0.367496, 0.7266862, 0.2078431, 0, 1, 1,
0.5472727, 2.966982, -0.2317038, 0.2117647, 0, 1, 1,
0.5498583, 0.1473692, -0.465062, 0.2196078, 0, 1, 1,
0.5520765, -0.8587279, 2.576327, 0.2235294, 0, 1, 1,
0.553053, -1.328691, 1.281666, 0.2313726, 0, 1, 1,
0.5550525, -0.09909346, 0.6798723, 0.2352941, 0, 1, 1,
0.5569409, 0.3287712, 2.644759, 0.2431373, 0, 1, 1,
0.5617176, -0.9093746, 3.759046, 0.2470588, 0, 1, 1,
0.5627226, 1.139062, 1.27324, 0.254902, 0, 1, 1,
0.5639, -0.4038909, 2.004595, 0.2588235, 0, 1, 1,
0.5671371, 1.205901, 2.298408, 0.2666667, 0, 1, 1,
0.5740238, 0.5534976, 1.891385, 0.2705882, 0, 1, 1,
0.5749918, -1.034101, 2.311913, 0.2784314, 0, 1, 1,
0.578599, -0.7535838, 2.196091, 0.282353, 0, 1, 1,
0.5808141, 0.9636636, 0.4531423, 0.2901961, 0, 1, 1,
0.5866023, 0.4051524, 0.3629909, 0.2941177, 0, 1, 1,
0.587823, -0.2606266, 1.790046, 0.3019608, 0, 1, 1,
0.5910733, -1.515916, 2.317685, 0.3098039, 0, 1, 1,
0.5912615, -0.5343632, 2.089142, 0.3137255, 0, 1, 1,
0.5922726, -0.4324942, 0.6719606, 0.3215686, 0, 1, 1,
0.5947862, -0.1224911, 1.56863, 0.3254902, 0, 1, 1,
0.5977621, 0.5058176, 0.9240894, 0.3333333, 0, 1, 1,
0.6006024, -1.270924, 3.679574, 0.3372549, 0, 1, 1,
0.6038677, 0.2536328, 1.875798, 0.345098, 0, 1, 1,
0.6055469, 0.0131969, 0.319109, 0.3490196, 0, 1, 1,
0.6061271, 0.6712413, 1.234085, 0.3568628, 0, 1, 1,
0.6103698, -0.01944488, 0.3931759, 0.3607843, 0, 1, 1,
0.6106681, -1.863608, 2.595612, 0.3686275, 0, 1, 1,
0.6110634, 0.7811126, 1.135073, 0.372549, 0, 1, 1,
0.6119301, 0.08178446, 1.715315, 0.3803922, 0, 1, 1,
0.6172108, 1.179579, 1.015757, 0.3843137, 0, 1, 1,
0.6176105, 0.9504953, 2.744591, 0.3921569, 0, 1, 1,
0.6268581, 0.3929829, -1.027238, 0.3960784, 0, 1, 1,
0.6273059, -0.5159606, 1.979838, 0.4039216, 0, 1, 1,
0.6273956, -1.022767, 3.359915, 0.4117647, 0, 1, 1,
0.6284088, -0.7326346, 3.339921, 0.4156863, 0, 1, 1,
0.6305371, -1.03404, 0.9861183, 0.4235294, 0, 1, 1,
0.6348389, -0.5201936, 1.898714, 0.427451, 0, 1, 1,
0.6359324, -1.423469, 3.343544, 0.4352941, 0, 1, 1,
0.6369678, -0.5680206, 3.351352, 0.4392157, 0, 1, 1,
0.6401502, 0.6502767, 0.9494461, 0.4470588, 0, 1, 1,
0.6424762, -0.3272524, 2.329537, 0.4509804, 0, 1, 1,
0.6470593, -0.6619695, 2.014258, 0.4588235, 0, 1, 1,
0.6475955, 0.106308, 1.447834, 0.4627451, 0, 1, 1,
0.6489096, -0.7424784, 2.98185, 0.4705882, 0, 1, 1,
0.6532594, -2.15801, 2.355564, 0.4745098, 0, 1, 1,
0.6588827, -0.1813762, 1.541169, 0.4823529, 0, 1, 1,
0.6660729, -0.1517747, 0.7705806, 0.4862745, 0, 1, 1,
0.6677714, -0.1609346, 3.046871, 0.4941176, 0, 1, 1,
0.6686143, 0.2410127, 1.197068, 0.5019608, 0, 1, 1,
0.6696349, 1.050791, -0.6745304, 0.5058824, 0, 1, 1,
0.670801, -1.236289, 1.907152, 0.5137255, 0, 1, 1,
0.6752015, 2.955988, 0.2334502, 0.5176471, 0, 1, 1,
0.6799321, -0.4789226, 2.15973, 0.5254902, 0, 1, 1,
0.6814812, -1.094977, 0.6483192, 0.5294118, 0, 1, 1,
0.6976908, 1.623564, 1.257894, 0.5372549, 0, 1, 1,
0.7054724, -0.273317, 3.324445, 0.5411765, 0, 1, 1,
0.7063345, 0.7843078, 2.020586, 0.5490196, 0, 1, 1,
0.7071999, -0.6931596, 1.07619, 0.5529412, 0, 1, 1,
0.7082057, -0.782319, 2.89451, 0.5607843, 0, 1, 1,
0.7128295, -1.013443, 3.686303, 0.5647059, 0, 1, 1,
0.7161219, -0.6505539, 2.779463, 0.572549, 0, 1, 1,
0.7165274, -1.267078, 1.388988, 0.5764706, 0, 1, 1,
0.7174056, 0.8447945, 0.8778411, 0.5843138, 0, 1, 1,
0.7191035, 1.027981, -0.4526156, 0.5882353, 0, 1, 1,
0.7270214, -1.047967, 3.119048, 0.5960785, 0, 1, 1,
0.7296025, -0.9682811, 2.751203, 0.6039216, 0, 1, 1,
0.7303396, -0.3182398, 3.462986, 0.6078432, 0, 1, 1,
0.7303416, -0.9219411, 2.18854, 0.6156863, 0, 1, 1,
0.7317867, -1.662513, 3.511255, 0.6196079, 0, 1, 1,
0.7335951, 0.6714282, 1.131684, 0.627451, 0, 1, 1,
0.7357019, 1.72312, 1.408376, 0.6313726, 0, 1, 1,
0.7378949, 1.583731, -2.033184, 0.6392157, 0, 1, 1,
0.7391598, -1.412579, 4.238113, 0.6431373, 0, 1, 1,
0.7434532, 0.98592, 1.195891, 0.6509804, 0, 1, 1,
0.7448409, 1.09001, -0.1476878, 0.654902, 0, 1, 1,
0.745206, 0.1928284, 2.351243, 0.6627451, 0, 1, 1,
0.7506071, -0.5689313, 2.040173, 0.6666667, 0, 1, 1,
0.7507719, -1.139168, 1.801735, 0.6745098, 0, 1, 1,
0.7512227, 2.750511, 0.4399714, 0.6784314, 0, 1, 1,
0.7517556, 0.3669018, 1.979415, 0.6862745, 0, 1, 1,
0.7534771, 0.1665528, 0.1245978, 0.6901961, 0, 1, 1,
0.7549044, -0.2081523, 0.6270025, 0.6980392, 0, 1, 1,
0.7568303, 0.6934108, -1.543127, 0.7058824, 0, 1, 1,
0.7615417, 0.8636137, 0.8622539, 0.7098039, 0, 1, 1,
0.765441, 0.7184962, -0.4371008, 0.7176471, 0, 1, 1,
0.7657236, -1.44047, 1.791488, 0.7215686, 0, 1, 1,
0.7668978, 1.605529, -1.185264, 0.7294118, 0, 1, 1,
0.7804133, 0.2865729, 0.6320681, 0.7333333, 0, 1, 1,
0.7867664, -0.9901696, 1.66718, 0.7411765, 0, 1, 1,
0.793434, 0.1006651, 0.8877782, 0.7450981, 0, 1, 1,
0.7946521, -0.9731249, 2.463327, 0.7529412, 0, 1, 1,
0.7956705, -0.4463096, 2.996867, 0.7568628, 0, 1, 1,
0.8001627, -1.53896, 2.66256, 0.7647059, 0, 1, 1,
0.8118972, 0.358514, 0.496982, 0.7686275, 0, 1, 1,
0.8127363, -0.67776, 2.959357, 0.7764706, 0, 1, 1,
0.8143824, 0.1366946, 0.1785822, 0.7803922, 0, 1, 1,
0.8148094, -1.132347, 3.576648, 0.7882353, 0, 1, 1,
0.8195626, -0.1137858, 0.776103, 0.7921569, 0, 1, 1,
0.8240108, -1.508248, 3.484382, 0.8, 0, 1, 1,
0.8246354, 0.244421, 0.5416851, 0.8078431, 0, 1, 1,
0.8249606, -1.26576, 2.187929, 0.8117647, 0, 1, 1,
0.8280014, 0.3277306, 1.278315, 0.8196079, 0, 1, 1,
0.8295507, 0.1062239, 1.240529, 0.8235294, 0, 1, 1,
0.829719, -0.2422042, 3.122224, 0.8313726, 0, 1, 1,
0.830514, 0.1279899, 0.5605345, 0.8352941, 0, 1, 1,
0.8343354, 2.094804, -0.5025009, 0.8431373, 0, 1, 1,
0.8405683, -0.06318559, 0.8735877, 0.8470588, 0, 1, 1,
0.8419827, 0.2126932, 2.030655, 0.854902, 0, 1, 1,
0.8426698, -0.2067191, 0.9038084, 0.8588235, 0, 1, 1,
0.8455242, -0.5183024, 1.637158, 0.8666667, 0, 1, 1,
0.8510517, 1.342595, -2.251619, 0.8705882, 0, 1, 1,
0.854465, -1.651128, 3.543286, 0.8784314, 0, 1, 1,
0.8593265, 0.4531693, 2.019203, 0.8823529, 0, 1, 1,
0.8593821, -1.259802, 2.666969, 0.8901961, 0, 1, 1,
0.8600001, -0.4459831, 1.774209, 0.8941177, 0, 1, 1,
0.8622571, -1.336659, 1.384462, 0.9019608, 0, 1, 1,
0.8712346, -0.9373748, 1.898079, 0.9098039, 0, 1, 1,
0.8716179, 1.470318, 0.5683175, 0.9137255, 0, 1, 1,
0.8729678, -0.03042473, 1.11096, 0.9215686, 0, 1, 1,
0.8772077, 1.82616, 0.947058, 0.9254902, 0, 1, 1,
0.8813708, 1.348368, 0.9245125, 0.9333333, 0, 1, 1,
0.8851126, 0.3565798, 0.5836328, 0.9372549, 0, 1, 1,
0.8861422, 2.28792, 1.979174, 0.945098, 0, 1, 1,
0.8878046, -1.402935, 2.750879, 0.9490196, 0, 1, 1,
0.8912446, 0.2744555, 0.6775512, 0.9568627, 0, 1, 1,
0.8961595, 0.3081931, 2.213789, 0.9607843, 0, 1, 1,
0.9071689, 0.6692442, -0.4629977, 0.9686275, 0, 1, 1,
0.9081421, 0.4655934, 0.769805, 0.972549, 0, 1, 1,
0.9197925, -0.3585273, 0.6976514, 0.9803922, 0, 1, 1,
0.9241005, -2.707444, 2.398967, 0.9843137, 0, 1, 1,
0.9254128, 0.6076441, 1.507948, 0.9921569, 0, 1, 1,
0.9293794, -1.537885, 2.429958, 0.9960784, 0, 1, 1,
0.9344097, -0.4245223, 2.900134, 1, 0, 0.9960784, 1,
0.9395365, -0.5801279, 2.566525, 1, 0, 0.9882353, 1,
0.9431955, -0.6034614, 3.343676, 1, 0, 0.9843137, 1,
0.950106, 1.154114, 2.640451, 1, 0, 0.9764706, 1,
0.9560502, 0.5519646, 1.719225, 1, 0, 0.972549, 1,
0.9637999, -0.4078453, 2.52565, 1, 0, 0.9647059, 1,
0.9656, -0.7942258, 2.399252, 1, 0, 0.9607843, 1,
0.9681229, -1.345356, 3.483094, 1, 0, 0.9529412, 1,
0.9699784, -1.04909, 1.049999, 1, 0, 0.9490196, 1,
0.9776041, -0.2094754, 2.010519, 1, 0, 0.9411765, 1,
0.9835321, 0.8954738, 1.719869, 1, 0, 0.9372549, 1,
0.9838774, 1.899879, 0.5510269, 1, 0, 0.9294118, 1,
0.9863859, 0.9330783, 0.5114114, 1, 0, 0.9254902, 1,
0.9905459, -0.7557113, 2.783864, 1, 0, 0.9176471, 1,
0.9913358, 0.965811, 2.424075, 1, 0, 0.9137255, 1,
0.9942599, -0.1603218, -0.6046777, 1, 0, 0.9058824, 1,
0.9972973, 2.194942, 1.888355, 1, 0, 0.9019608, 1,
0.9978212, -1.040149, 3.098072, 1, 0, 0.8941177, 1,
1.007115, 0.9833325, 1.514737, 1, 0, 0.8862745, 1,
1.013221, 0.2355476, 0.9476833, 1, 0, 0.8823529, 1,
1.03203, 0.8894643, -0.2154034, 1, 0, 0.8745098, 1,
1.037651, 1.063736, 0.5615106, 1, 0, 0.8705882, 1,
1.05141, 0.6935524, 1.267085, 1, 0, 0.8627451, 1,
1.054658, 1.073077, 0.9832893, 1, 0, 0.8588235, 1,
1.058192, 1.011494, 1.434388, 1, 0, 0.8509804, 1,
1.059195, -1.708291, 4.178119, 1, 0, 0.8470588, 1,
1.064859, -0.9949064, 3.059294, 1, 0, 0.8392157, 1,
1.069304, 0.5634567, 1.250944, 1, 0, 0.8352941, 1,
1.069753, -1.462272, 2.666062, 1, 0, 0.827451, 1,
1.074822, -0.3613975, 2.645599, 1, 0, 0.8235294, 1,
1.07972, 0.3652742, 3.511687, 1, 0, 0.8156863, 1,
1.081012, 0.2344173, 0.5404183, 1, 0, 0.8117647, 1,
1.087957, 1.076509, 0.2316543, 1, 0, 0.8039216, 1,
1.088257, 0.530697, 3.617573, 1, 0, 0.7960784, 1,
1.101408, 0.21644, 0.9332871, 1, 0, 0.7921569, 1,
1.111352, -1.033683, 2.079417, 1, 0, 0.7843137, 1,
1.112618, -0.8886595, 1.919214, 1, 0, 0.7803922, 1,
1.121186, -1.516772, 1.423682, 1, 0, 0.772549, 1,
1.121739, 0.9675427, 0.6190587, 1, 0, 0.7686275, 1,
1.12289, -0.699271, 3.472119, 1, 0, 0.7607843, 1,
1.133282, 1.022473, 1.020465, 1, 0, 0.7568628, 1,
1.135526, 0.5118419, -0.9193425, 1, 0, 0.7490196, 1,
1.137285, -0.4379999, 1.711967, 1, 0, 0.7450981, 1,
1.141072, -0.6946436, 3.557928, 1, 0, 0.7372549, 1,
1.141536, 0.176297, 1.899352, 1, 0, 0.7333333, 1,
1.146212, 0.4150386, 3.481465, 1, 0, 0.7254902, 1,
1.151011, 0.1857073, 1.597995, 1, 0, 0.7215686, 1,
1.152447, -1.345308, 2.954682, 1, 0, 0.7137255, 1,
1.152537, -1.741944, 1.452646, 1, 0, 0.7098039, 1,
1.158594, -0.41521, 3.724427, 1, 0, 0.7019608, 1,
1.162161, 0.1235816, -0.01670624, 1, 0, 0.6941177, 1,
1.163912, -1.424738, 1.958107, 1, 0, 0.6901961, 1,
1.176133, -0.01930729, 2.530984, 1, 0, 0.682353, 1,
1.178183, -0.7410709, 2.587806, 1, 0, 0.6784314, 1,
1.181892, 0.6880549, -0.007277972, 1, 0, 0.6705883, 1,
1.191877, 1.022191, 2.297629, 1, 0, 0.6666667, 1,
1.194548, 1.384238, 1.945497, 1, 0, 0.6588235, 1,
1.209563, 1.294589, 2.526978, 1, 0, 0.654902, 1,
1.231152, 0.8091201, 0.9691262, 1, 0, 0.6470588, 1,
1.231647, 0.006208601, 1.280239, 1, 0, 0.6431373, 1,
1.233922, 0.4235037, 0.06442139, 1, 0, 0.6352941, 1,
1.241768, -1.228736, 2.927054, 1, 0, 0.6313726, 1,
1.243444, -1.969009, 0.8323668, 1, 0, 0.6235294, 1,
1.244528, 0.0179295, 0.8445225, 1, 0, 0.6196079, 1,
1.249062, 0.4108127, 0.8774518, 1, 0, 0.6117647, 1,
1.253478, -1.91419, 2.603811, 1, 0, 0.6078432, 1,
1.253675, 0.3996959, 1.130692, 1, 0, 0.6, 1,
1.26081, -0.4351897, 1.568139, 1, 0, 0.5921569, 1,
1.264832, 1.914508, 1.227435, 1, 0, 0.5882353, 1,
1.270716, -0.345661, 1.493628, 1, 0, 0.5803922, 1,
1.27505, -0.9914454, 2.728688, 1, 0, 0.5764706, 1,
1.276265, 0.2910627, 1.316399, 1, 0, 0.5686275, 1,
1.276585, 0.5124639, 2.036178, 1, 0, 0.5647059, 1,
1.277734, 0.3637231, -0.5619791, 1, 0, 0.5568628, 1,
1.289293, -0.1179542, 0.2409458, 1, 0, 0.5529412, 1,
1.29613, 1.604016, 0.5538583, 1, 0, 0.5450981, 1,
1.30212, 0.6629306, 0.8986577, 1, 0, 0.5411765, 1,
1.316566, -0.7567188, 2.433927, 1, 0, 0.5333334, 1,
1.320789, -0.3733228, 0.2154778, 1, 0, 0.5294118, 1,
1.323542, -0.05347279, 0.7981496, 1, 0, 0.5215687, 1,
1.331127, -0.2211359, 2.406651, 1, 0, 0.5176471, 1,
1.337202, -0.2939657, 3.067055, 1, 0, 0.509804, 1,
1.339859, 0.9998772, 1.884178, 1, 0, 0.5058824, 1,
1.348769, 0.1308323, 1.470514, 1, 0, 0.4980392, 1,
1.349132, 1.006901, 1.138924, 1, 0, 0.4901961, 1,
1.355992, 0.7537565, 1.76193, 1, 0, 0.4862745, 1,
1.358291, -1.454581, 1.484723, 1, 0, 0.4784314, 1,
1.362715, 0.004320137, 1.584058, 1, 0, 0.4745098, 1,
1.372301, -1.488536, 3.794436, 1, 0, 0.4666667, 1,
1.414204, -0.04920847, 2.459463, 1, 0, 0.4627451, 1,
1.418329, -1.180285, 2.102431, 1, 0, 0.454902, 1,
1.425076, -0.4760175, 2.023931, 1, 0, 0.4509804, 1,
1.42857, -0.7338194, 1.06373, 1, 0, 0.4431373, 1,
1.431348, -0.3947291, 1.738537, 1, 0, 0.4392157, 1,
1.45239, -0.9834698, 3.115962, 1, 0, 0.4313726, 1,
1.453737, -0.5049169, 1.059699, 1, 0, 0.427451, 1,
1.476897, 0.6973895, 3.299715, 1, 0, 0.4196078, 1,
1.486023, 0.9432186, 1.840654, 1, 0, 0.4156863, 1,
1.48614, -1.784799, 1.900892, 1, 0, 0.4078431, 1,
1.498471, -0.05729732, 3.060755, 1, 0, 0.4039216, 1,
1.506974, -0.6693779, 1.222742, 1, 0, 0.3960784, 1,
1.509707, -1.242201, 3.546325, 1, 0, 0.3882353, 1,
1.520274, 2.157648, -0.1202474, 1, 0, 0.3843137, 1,
1.530246, -0.9712654, 1.497836, 1, 0, 0.3764706, 1,
1.531992, -1.084912, 1.121317, 1, 0, 0.372549, 1,
1.538543, -1.042927, 2.38079, 1, 0, 0.3647059, 1,
1.544639, 0.6246839, 1.081672, 1, 0, 0.3607843, 1,
1.560314, 1.074828, 1.010003, 1, 0, 0.3529412, 1,
1.565203, -0.5878341, 1.321082, 1, 0, 0.3490196, 1,
1.570065, -0.4012081, 1.661864, 1, 0, 0.3411765, 1,
1.576061, 0.7751498, 1.781246, 1, 0, 0.3372549, 1,
1.59094, -1.41338, 4.288705, 1, 0, 0.3294118, 1,
1.592039, 0.5096344, -0.001825822, 1, 0, 0.3254902, 1,
1.61097, -0.6607098, 3.200313, 1, 0, 0.3176471, 1,
1.614822, 0.8716704, 2.593416, 1, 0, 0.3137255, 1,
1.615539, -1.662863, 2.581712, 1, 0, 0.3058824, 1,
1.626768, 0.4884324, 1.655025, 1, 0, 0.2980392, 1,
1.636341, -0.9089714, 0.9262396, 1, 0, 0.2941177, 1,
1.652717, -2.281569, 2.627206, 1, 0, 0.2862745, 1,
1.661654, -0.4507163, 1.412383, 1, 0, 0.282353, 1,
1.673049, 0.1279677, 2.174544, 1, 0, 0.2745098, 1,
1.675738, -0.9047664, 2.867357, 1, 0, 0.2705882, 1,
1.678693, -0.08600049, 1.911744, 1, 0, 0.2627451, 1,
1.690151, 0.04938531, 2.479951, 1, 0, 0.2588235, 1,
1.690816, -0.1404893, 1.923246, 1, 0, 0.2509804, 1,
1.699977, -0.4147998, 3.212477, 1, 0, 0.2470588, 1,
1.703338, -0.6312712, 1.231645, 1, 0, 0.2392157, 1,
1.712739, 0.6451344, 1.427226, 1, 0, 0.2352941, 1,
1.73756, 0.3981468, 2.194941, 1, 0, 0.227451, 1,
1.753716, -0.578795, 2.010622, 1, 0, 0.2235294, 1,
1.765018, -0.3002607, 1.598664, 1, 0, 0.2156863, 1,
1.76838, -0.2800621, 1.723988, 1, 0, 0.2117647, 1,
1.772918, -0.0931206, 0.9455711, 1, 0, 0.2039216, 1,
1.852132, 1.479492, 0.8362817, 1, 0, 0.1960784, 1,
1.856339, -1.951471, 3.322534, 1, 0, 0.1921569, 1,
1.868225, -0.3876597, 2.805815, 1, 0, 0.1843137, 1,
1.870143, 1.501769, 0.601685, 1, 0, 0.1803922, 1,
1.873844, 0.977995, 1.344341, 1, 0, 0.172549, 1,
1.878214, 0.797099, 1.238527, 1, 0, 0.1686275, 1,
1.878793, -0.3940234, 2.502322, 1, 0, 0.1607843, 1,
1.88708, -0.4722375, 2.887405, 1, 0, 0.1568628, 1,
1.945156, 0.2786255, 1.120762, 1, 0, 0.1490196, 1,
1.946176, 1.558906, 1.369064, 1, 0, 0.145098, 1,
1.951434, 1.631277, -0.62, 1, 0, 0.1372549, 1,
1.965623, 0.8494718, 0.5327882, 1, 0, 0.1333333, 1,
2.054621, -0.2889898, 3.66759, 1, 0, 0.1254902, 1,
2.065215, 1.769719, 0.9955926, 1, 0, 0.1215686, 1,
2.11004, 0.7140566, 2.509006, 1, 0, 0.1137255, 1,
2.152534, 0.6997624, 1.801089, 1, 0, 0.1098039, 1,
2.167955, 0.9889323, 3.130495, 1, 0, 0.1019608, 1,
2.175832, -2.183473, 2.765539, 1, 0, 0.09411765, 1,
2.223182, 0.9882948, 2.438207, 1, 0, 0.09019608, 1,
2.22445, -0.4297017, 3.085579, 1, 0, 0.08235294, 1,
2.228719, -0.5643138, 2.167878, 1, 0, 0.07843138, 1,
2.318435, 0.3692813, 1.32464, 1, 0, 0.07058824, 1,
2.32479, 0.275472, 0.7879424, 1, 0, 0.06666667, 1,
2.344381, 0.3661588, 0.5257432, 1, 0, 0.05882353, 1,
2.363421, 1.566785, 0.5654081, 1, 0, 0.05490196, 1,
2.366894, -0.6479064, 1.944504, 1, 0, 0.04705882, 1,
2.405516, 1.189042, -0.6748989, 1, 0, 0.04313726, 1,
2.621806, 0.9307569, 1.400638, 1, 0, 0.03529412, 1,
2.648531, 0.4236968, 0.8150583, 1, 0, 0.03137255, 1,
2.696112, -1.047649, 2.174716, 1, 0, 0.02352941, 1,
2.723787, 0.8713121, 2.292066, 1, 0, 0.01960784, 1,
2.808797, 1.770061, -0.06910131, 1, 0, 0.01176471, 1,
2.973007, 1.681697, 3.210577, 1, 0, 0.007843138, 1
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
-0.16433, -5.030048, -6.56065, 0, -0.5, 0.5, 0.5,
-0.16433, -5.030048, -6.56065, 1, -0.5, 0.5, 0.5,
-0.16433, -5.030048, -6.56065, 1, 1.5, 0.5, 0.5,
-0.16433, -5.030048, -6.56065, 0, 1.5, 0.5, 0.5
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
-4.365224, -0.4520135, -6.56065, 0, -0.5, 0.5, 0.5,
-4.365224, -0.4520135, -6.56065, 1, -0.5, 0.5, 0.5,
-4.365224, -0.4520135, -6.56065, 1, 1.5, 0.5, 0.5,
-4.365224, -0.4520135, -6.56065, 0, 1.5, 0.5, 0.5
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
-4.365224, -5.030048, 0.188971, 0, -0.5, 0.5, 0.5,
-4.365224, -5.030048, 0.188971, 1, -0.5, 0.5, 0.5,
-4.365224, -5.030048, 0.188971, 1, 1.5, 0.5, 0.5,
-4.365224, -5.030048, 0.188971, 0, 1.5, 0.5, 0.5
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
-3, -3.973579, -5.003045,
2, -3.973579, -5.003045,
-3, -3.973579, -5.003045,
-3, -4.149657, -5.262646,
-2, -3.973579, -5.003045,
-2, -4.149657, -5.262646,
-1, -3.973579, -5.003045,
-1, -4.149657, -5.262646,
0, -3.973579, -5.003045,
0, -4.149657, -5.262646,
1, -3.973579, -5.003045,
1, -4.149657, -5.262646,
2, -3.973579, -5.003045,
2, -4.149657, -5.262646
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
-3, -4.501813, -5.781847, 0, -0.5, 0.5, 0.5,
-3, -4.501813, -5.781847, 1, -0.5, 0.5, 0.5,
-3, -4.501813, -5.781847, 1, 1.5, 0.5, 0.5,
-3, -4.501813, -5.781847, 0, 1.5, 0.5, 0.5,
-2, -4.501813, -5.781847, 0, -0.5, 0.5, 0.5,
-2, -4.501813, -5.781847, 1, -0.5, 0.5, 0.5,
-2, -4.501813, -5.781847, 1, 1.5, 0.5, 0.5,
-2, -4.501813, -5.781847, 0, 1.5, 0.5, 0.5,
-1, -4.501813, -5.781847, 0, -0.5, 0.5, 0.5,
-1, -4.501813, -5.781847, 1, -0.5, 0.5, 0.5,
-1, -4.501813, -5.781847, 1, 1.5, 0.5, 0.5,
-1, -4.501813, -5.781847, 0, 1.5, 0.5, 0.5,
0, -4.501813, -5.781847, 0, -0.5, 0.5, 0.5,
0, -4.501813, -5.781847, 1, -0.5, 0.5, 0.5,
0, -4.501813, -5.781847, 1, 1.5, 0.5, 0.5,
0, -4.501813, -5.781847, 0, 1.5, 0.5, 0.5,
1, -4.501813, -5.781847, 0, -0.5, 0.5, 0.5,
1, -4.501813, -5.781847, 1, -0.5, 0.5, 0.5,
1, -4.501813, -5.781847, 1, 1.5, 0.5, 0.5,
1, -4.501813, -5.781847, 0, 1.5, 0.5, 0.5,
2, -4.501813, -5.781847, 0, -0.5, 0.5, 0.5,
2, -4.501813, -5.781847, 1, -0.5, 0.5, 0.5,
2, -4.501813, -5.781847, 1, 1.5, 0.5, 0.5,
2, -4.501813, -5.781847, 0, 1.5, 0.5, 0.5
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
-3.395787, -3, -5.003045,
-3.395787, 2, -5.003045,
-3.395787, -3, -5.003045,
-3.55736, -3, -5.262646,
-3.395787, -2, -5.003045,
-3.55736, -2, -5.262646,
-3.395787, -1, -5.003045,
-3.55736, -1, -5.262646,
-3.395787, 0, -5.003045,
-3.55736, 0, -5.262646,
-3.395787, 1, -5.003045,
-3.55736, 1, -5.262646,
-3.395787, 2, -5.003045,
-3.55736, 2, -5.262646
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
-3.880506, -3, -5.781847, 0, -0.5, 0.5, 0.5,
-3.880506, -3, -5.781847, 1, -0.5, 0.5, 0.5,
-3.880506, -3, -5.781847, 1, 1.5, 0.5, 0.5,
-3.880506, -3, -5.781847, 0, 1.5, 0.5, 0.5,
-3.880506, -2, -5.781847, 0, -0.5, 0.5, 0.5,
-3.880506, -2, -5.781847, 1, -0.5, 0.5, 0.5,
-3.880506, -2, -5.781847, 1, 1.5, 0.5, 0.5,
-3.880506, -2, -5.781847, 0, 1.5, 0.5, 0.5,
-3.880506, -1, -5.781847, 0, -0.5, 0.5, 0.5,
-3.880506, -1, -5.781847, 1, -0.5, 0.5, 0.5,
-3.880506, -1, -5.781847, 1, 1.5, 0.5, 0.5,
-3.880506, -1, -5.781847, 0, 1.5, 0.5, 0.5,
-3.880506, 0, -5.781847, 0, -0.5, 0.5, 0.5,
-3.880506, 0, -5.781847, 1, -0.5, 0.5, 0.5,
-3.880506, 0, -5.781847, 1, 1.5, 0.5, 0.5,
-3.880506, 0, -5.781847, 0, 1.5, 0.5, 0.5,
-3.880506, 1, -5.781847, 0, -0.5, 0.5, 0.5,
-3.880506, 1, -5.781847, 1, -0.5, 0.5, 0.5,
-3.880506, 1, -5.781847, 1, 1.5, 0.5, 0.5,
-3.880506, 1, -5.781847, 0, 1.5, 0.5, 0.5,
-3.880506, 2, -5.781847, 0, -0.5, 0.5, 0.5,
-3.880506, 2, -5.781847, 1, -0.5, 0.5, 0.5,
-3.880506, 2, -5.781847, 1, 1.5, 0.5, 0.5,
-3.880506, 2, -5.781847, 0, 1.5, 0.5, 0.5
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
-3.395787, -3.973579, -4,
-3.395787, -3.973579, 4,
-3.395787, -3.973579, -4,
-3.55736, -4.149657, -4,
-3.395787, -3.973579, -2,
-3.55736, -4.149657, -2,
-3.395787, -3.973579, 0,
-3.55736, -4.149657, 0,
-3.395787, -3.973579, 2,
-3.55736, -4.149657, 2,
-3.395787, -3.973579, 4,
-3.55736, -4.149657, 4
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
-3.880506, -4.501813, -4, 0, -0.5, 0.5, 0.5,
-3.880506, -4.501813, -4, 1, -0.5, 0.5, 0.5,
-3.880506, -4.501813, -4, 1, 1.5, 0.5, 0.5,
-3.880506, -4.501813, -4, 0, 1.5, 0.5, 0.5,
-3.880506, -4.501813, -2, 0, -0.5, 0.5, 0.5,
-3.880506, -4.501813, -2, 1, -0.5, 0.5, 0.5,
-3.880506, -4.501813, -2, 1, 1.5, 0.5, 0.5,
-3.880506, -4.501813, -2, 0, 1.5, 0.5, 0.5,
-3.880506, -4.501813, 0, 0, -0.5, 0.5, 0.5,
-3.880506, -4.501813, 0, 1, -0.5, 0.5, 0.5,
-3.880506, -4.501813, 0, 1, 1.5, 0.5, 0.5,
-3.880506, -4.501813, 0, 0, 1.5, 0.5, 0.5,
-3.880506, -4.501813, 2, 0, -0.5, 0.5, 0.5,
-3.880506, -4.501813, 2, 1, -0.5, 0.5, 0.5,
-3.880506, -4.501813, 2, 1, 1.5, 0.5, 0.5,
-3.880506, -4.501813, 2, 0, 1.5, 0.5, 0.5,
-3.880506, -4.501813, 4, 0, -0.5, 0.5, 0.5,
-3.880506, -4.501813, 4, 1, -0.5, 0.5, 0.5,
-3.880506, -4.501813, 4, 1, 1.5, 0.5, 0.5,
-3.880506, -4.501813, 4, 0, 1.5, 0.5, 0.5
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
-3.395787, -3.973579, -5.003045,
-3.395787, 3.069552, -5.003045,
-3.395787, -3.973579, 5.380987,
-3.395787, 3.069552, 5.380987,
-3.395787, -3.973579, -5.003045,
-3.395787, -3.973579, 5.380987,
-3.395787, 3.069552, -5.003045,
-3.395787, 3.069552, 5.380987,
-3.395787, -3.973579, -5.003045,
3.067127, -3.973579, -5.003045,
-3.395787, -3.973579, 5.380987,
3.067127, -3.973579, 5.380987,
-3.395787, 3.069552, -5.003045,
3.067127, 3.069552, -5.003045,
-3.395787, 3.069552, 5.380987,
3.067127, 3.069552, 5.380987,
3.067127, -3.973579, -5.003045,
3.067127, 3.069552, -5.003045,
3.067127, -3.973579, 5.380987,
3.067127, 3.069552, 5.380987,
3.067127, -3.973579, -5.003045,
3.067127, -3.973579, 5.380987,
3.067127, 3.069552, -5.003045,
3.067127, 3.069552, 5.380987
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
var radius = 7.536566;
var distance = 33.53103;
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
mvMatrix.translate( 0.16433, 0.4520135, -0.188971 );
mvMatrix.scale( 1.260837, 1.156969, 0.784732 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.53103);
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
Karathane<-read.table("Karathane.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Karathane$V2
```

```
## Error in eval(expr, envir, enclos): object 'Karathane' not found
```

```r
y<-Karathane$V3
```

```
## Error in eval(expr, envir, enclos): object 'Karathane' not found
```

```r
z<-Karathane$V4
```

```
## Error in eval(expr, envir, enclos): object 'Karathane' not found
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
-3.301667, 0.522706, -0.8824869, 0, 0, 1, 1, 1,
-2.858451, -1.398121, -3.345798, 1, 0, 0, 1, 1,
-2.440199, -0.2018825, -0.3188991, 1, 0, 0, 1, 1,
-2.436091, 1.978925, -0.8021674, 1, 0, 0, 1, 1,
-2.418761, 1.166762, -0.975799, 1, 0, 0, 1, 1,
-2.406166, 0.3118344, -1.258107, 1, 0, 0, 1, 1,
-2.359802, -0.9770207, -1.891152, 0, 0, 0, 1, 1,
-2.342116, -1.06585, -2.782135, 0, 0, 0, 1, 1,
-2.329267, -1.213648, -1.377193, 0, 0, 0, 1, 1,
-2.309661, 0.2920517, -1.417475, 0, 0, 0, 1, 1,
-2.282014, -0.3273179, -0.8961515, 0, 0, 0, 1, 1,
-2.278703, 1.94181, -1.197367, 0, 0, 0, 1, 1,
-2.273759, -1.51132, -3.493256, 0, 0, 0, 1, 1,
-2.270866, 0.02050722, -3.542748, 1, 1, 1, 1, 1,
-2.266922, 1.743318, -1.138205, 1, 1, 1, 1, 1,
-2.256428, -0.3957753, -2.473769, 1, 1, 1, 1, 1,
-2.184073, -0.3167009, -0.9797316, 1, 1, 1, 1, 1,
-2.140261, -1.535851, -2.129016, 1, 1, 1, 1, 1,
-2.128636, -0.9115916, -1.294294, 1, 1, 1, 1, 1,
-2.115919, 0.6497381, -3.575641, 1, 1, 1, 1, 1,
-2.034739, 0.02693836, -1.535622, 1, 1, 1, 1, 1,
-1.988784, -0.3423643, -1.798071, 1, 1, 1, 1, 1,
-1.986768, 1.514087, -0.4780005, 1, 1, 1, 1, 1,
-1.978938, 0.4230816, -1.057269, 1, 1, 1, 1, 1,
-1.925151, -1.142495, -3.018899, 1, 1, 1, 1, 1,
-1.910825, -0.7103634, -1.120984, 1, 1, 1, 1, 1,
-1.908017, -0.2214517, -2.365522, 1, 1, 1, 1, 1,
-1.90574, -0.4362015, -1.833643, 1, 1, 1, 1, 1,
-1.895375, -2.084918, -2.484164, 0, 0, 1, 1, 1,
-1.893365, -2.331906, -1.21493, 1, 0, 0, 1, 1,
-1.885319, 0.6833165, 0.1320491, 1, 0, 0, 1, 1,
-1.880595, 0.2327672, -0.3468788, 1, 0, 0, 1, 1,
-1.859865, -0.3321492, -2.444973, 1, 0, 0, 1, 1,
-1.859452, -0.9823826, -1.709296, 1, 0, 0, 1, 1,
-1.847932, -0.5499517, -1.480655, 0, 0, 0, 1, 1,
-1.82994, -0.2230215, -2.026975, 0, 0, 0, 1, 1,
-1.828154, 0.3208341, -0.8115081, 0, 0, 0, 1, 1,
-1.819367, 0.6265689, -3.422316, 0, 0, 0, 1, 1,
-1.810312, 0.4846166, -1.294053, 0, 0, 0, 1, 1,
-1.749407, -1.03111, -1.762654, 0, 0, 0, 1, 1,
-1.749167, -1.157571, -3.201235, 0, 0, 0, 1, 1,
-1.748721, -0.6797679, -0.4868836, 1, 1, 1, 1, 1,
-1.729511, -0.339189, -2.351205, 1, 1, 1, 1, 1,
-1.70539, 0.4162707, -1.536613, 1, 1, 1, 1, 1,
-1.704065, -0.8815628, -1.6801, 1, 1, 1, 1, 1,
-1.703073, 0.9984519, -0.944021, 1, 1, 1, 1, 1,
-1.693387, 1.622427, -1.676876, 1, 1, 1, 1, 1,
-1.691568, 0.5264874, 0.4450046, 1, 1, 1, 1, 1,
-1.665371, 1.692223, -1.486353, 1, 1, 1, 1, 1,
-1.649721, 1.130094, -3.345905, 1, 1, 1, 1, 1,
-1.607059, 1.536369, -0.3036824, 1, 1, 1, 1, 1,
-1.591198, -0.5885245, -1.103369, 1, 1, 1, 1, 1,
-1.57535, -0.06179297, -0.7296454, 1, 1, 1, 1, 1,
-1.564609, -1.28564, -1.042798, 1, 1, 1, 1, 1,
-1.556021, -1.148052, -1.385551, 1, 1, 1, 1, 1,
-1.547763, -0.3728478, -1.892287, 1, 1, 1, 1, 1,
-1.547537, 1.048979, -2.392612, 0, 0, 1, 1, 1,
-1.546108, 0.5074278, 0.5634727, 1, 0, 0, 1, 1,
-1.524634, 0.5964246, -0.3097287, 1, 0, 0, 1, 1,
-1.523708, 0.5405182, -1.591123, 1, 0, 0, 1, 1,
-1.518833, -1.581432, -2.182561, 1, 0, 0, 1, 1,
-1.509397, -0.03449957, -0.8941582, 1, 0, 0, 1, 1,
-1.494851, -1.196216, -3.291032, 0, 0, 0, 1, 1,
-1.492855, 1.002078, -1.950727, 0, 0, 0, 1, 1,
-1.49022, -0.870648, -2.494669, 0, 0, 0, 1, 1,
-1.47839, -0.2905033, -2.533669, 0, 0, 0, 1, 1,
-1.473871, 0.1385164, -1.676208, 0, 0, 0, 1, 1,
-1.473722, 0.5539482, 0.02184604, 0, 0, 0, 1, 1,
-1.456587, 0.5493297, -2.187174, 0, 0, 0, 1, 1,
-1.441892, -1.252766, -2.961246, 1, 1, 1, 1, 1,
-1.440798, -1.415357, -1.614179, 1, 1, 1, 1, 1,
-1.432554, 1.367486, -1.536215, 1, 1, 1, 1, 1,
-1.416152, 0.6208299, -2.953558, 1, 1, 1, 1, 1,
-1.408076, -1.085163, -1.719887, 1, 1, 1, 1, 1,
-1.404891, -0.2662367, -3.051582, 1, 1, 1, 1, 1,
-1.396742, -0.4580562, -3.409579, 1, 1, 1, 1, 1,
-1.391463, 1.216086, -0.5213373, 1, 1, 1, 1, 1,
-1.39006, 0.9988443, -1.003098, 1, 1, 1, 1, 1,
-1.382634, 1.752982, -0.273498, 1, 1, 1, 1, 1,
-1.381759, -0.7089703, -3.607962, 1, 1, 1, 1, 1,
-1.378513, 1.8018, -0.7716426, 1, 1, 1, 1, 1,
-1.370451, 0.672416, -2.218416, 1, 1, 1, 1, 1,
-1.366085, -0.09775042, -2.799898, 1, 1, 1, 1, 1,
-1.365245, -1.817312, -1.939569, 1, 1, 1, 1, 1,
-1.344374, -0.2339073, -1.927101, 0, 0, 1, 1, 1,
-1.337911, 1.461138, -0.4225755, 1, 0, 0, 1, 1,
-1.336402, -1.220099, -2.953056, 1, 0, 0, 1, 1,
-1.330873, -2.135768, -2.209776, 1, 0, 0, 1, 1,
-1.329695, -1.258826, -3.135386, 1, 0, 0, 1, 1,
-1.329509, 1.016098, -2.508934, 1, 0, 0, 1, 1,
-1.327195, -0.5647497, -1.850346, 0, 0, 0, 1, 1,
-1.314995, -1.321561, -2.695456, 0, 0, 0, 1, 1,
-1.312224, -1.282656, -2.55736, 0, 0, 0, 1, 1,
-1.297653, 0.1064054, -1.758696, 0, 0, 0, 1, 1,
-1.296546, 1.046012, -1.303995, 0, 0, 0, 1, 1,
-1.284128, -0.3494868, -2.42825, 0, 0, 0, 1, 1,
-1.283418, 0.4686331, -1.781991, 0, 0, 0, 1, 1,
-1.278937, -0.1133034, -0.7010195, 1, 1, 1, 1, 1,
-1.276024, -0.5842707, -1.907223, 1, 1, 1, 1, 1,
-1.275001, 1.664617, -1.106728, 1, 1, 1, 1, 1,
-1.268974, 0.4938101, -0.9054589, 1, 1, 1, 1, 1,
-1.265911, -0.1583134, -3.397315, 1, 1, 1, 1, 1,
-1.264674, 0.6322315, -3.257676, 1, 1, 1, 1, 1,
-1.257427, 0.2238654, -2.085362, 1, 1, 1, 1, 1,
-1.257033, -1.37192, -2.35586, 1, 1, 1, 1, 1,
-1.251821, 1.347592, -0.7012187, 1, 1, 1, 1, 1,
-1.250498, -0.5856476, -3.395747, 1, 1, 1, 1, 1,
-1.248253, 1.566458, -1.070683, 1, 1, 1, 1, 1,
-1.246903, 0.2122154, -3.488611, 1, 1, 1, 1, 1,
-1.240116, 0.2528754, 0.9872439, 1, 1, 1, 1, 1,
-1.2375, 0.8892111, -0.7996696, 1, 1, 1, 1, 1,
-1.227685, -0.02103347, -1.890091, 1, 1, 1, 1, 1,
-1.224115, 0.9049251, -0.1823192, 0, 0, 1, 1, 1,
-1.211795, 2.268529, -0.7207981, 1, 0, 0, 1, 1,
-1.211681, 1.320811, 1.072944, 1, 0, 0, 1, 1,
-1.20052, 0.3961204, -2.269447, 1, 0, 0, 1, 1,
-1.194047, -1.219959, -3.383415, 1, 0, 0, 1, 1,
-1.18943, -0.04097801, -0.7268082, 1, 0, 0, 1, 1,
-1.170307, -0.4456871, -2.175589, 0, 0, 0, 1, 1,
-1.168962, -1.331604, -2.671887, 0, 0, 0, 1, 1,
-1.168588, 0.3470117, -1.318719, 0, 0, 0, 1, 1,
-1.163705, -1.648118, -0.9827256, 0, 0, 0, 1, 1,
-1.163494, -0.4644922, -2.994268, 0, 0, 0, 1, 1,
-1.16183, -0.004161367, -3.476027, 0, 0, 0, 1, 1,
-1.161285, -0.03294769, -0.2435489, 0, 0, 0, 1, 1,
-1.159124, 1.664784, -0.3030086, 1, 1, 1, 1, 1,
-1.151887, -0.4625086, -2.17627, 1, 1, 1, 1, 1,
-1.151304, 1.047515, -0.2275357, 1, 1, 1, 1, 1,
-1.14978, -3.871009, -4.003172, 1, 1, 1, 1, 1,
-1.147615, -1.379639, -0.5341916, 1, 1, 1, 1, 1,
-1.146134, -0.5773934, -2.498063, 1, 1, 1, 1, 1,
-1.143396, 0.9752274, -0.10006, 1, 1, 1, 1, 1,
-1.140906, 0.03952913, -2.818159, 1, 1, 1, 1, 1,
-1.131646, 0.6516442, -1.709953, 1, 1, 1, 1, 1,
-1.130987, 0.09792352, 0.2322191, 1, 1, 1, 1, 1,
-1.128877, 0.1819879, -1.790608, 1, 1, 1, 1, 1,
-1.127548, -0.2406085, -1.770569, 1, 1, 1, 1, 1,
-1.123858, -0.3748384, -2.140978, 1, 1, 1, 1, 1,
-1.112838, -1.049539, -2.705857, 1, 1, 1, 1, 1,
-1.112216, -1.050502, -1.444602, 1, 1, 1, 1, 1,
-1.10691, 0.7575105, -3.760798, 0, 0, 1, 1, 1,
-1.075976, -0.04221629, -3.008558, 1, 0, 0, 1, 1,
-1.07575, -0.8922731, -2.581842, 1, 0, 0, 1, 1,
-1.069445, -0.7163262, -2.682163, 1, 0, 0, 1, 1,
-1.058012, 0.7706365, -2.140461, 1, 0, 0, 1, 1,
-1.050928, 0.951759, -1.01359, 1, 0, 0, 1, 1,
-1.04929, 0.5667772, -1.355381, 0, 0, 0, 1, 1,
-1.034701, 1.492026, -0.4519002, 0, 0, 0, 1, 1,
-1.03467, -1.681446, -2.474182, 0, 0, 0, 1, 1,
-1.029726, -1.636502, -3.700924, 0, 0, 0, 1, 1,
-1.025187, -0.6430062, -2.081474, 0, 0, 0, 1, 1,
-1.01365, -0.3790212, -2.414582, 0, 0, 0, 1, 1,
-1.012156, -1.070633, -2.24133, 0, 0, 0, 1, 1,
-1.000237, -0.2156904, -1.692271, 1, 1, 1, 1, 1,
-0.9941713, 0.8012508, -1.122171, 1, 1, 1, 1, 1,
-0.9919967, 0.05299326, -2.331711, 1, 1, 1, 1, 1,
-0.9866707, 1.422379, -0.666574, 1, 1, 1, 1, 1,
-0.9724888, 1.231016, -0.7799293, 1, 1, 1, 1, 1,
-0.9708557, 0.04098163, -3.065595, 1, 1, 1, 1, 1,
-0.96435, 0.317281, -0.7631639, 1, 1, 1, 1, 1,
-0.9629131, -1.684819, -3.083428, 1, 1, 1, 1, 1,
-0.9585614, 0.4423696, -1.695274, 1, 1, 1, 1, 1,
-0.9555889, 0.1122632, -1.884863, 1, 1, 1, 1, 1,
-0.9473486, 0.9798096, -1.321022, 1, 1, 1, 1, 1,
-0.936995, 0.0622221, -1.025913, 1, 1, 1, 1, 1,
-0.931555, -1.219475, -2.460507, 1, 1, 1, 1, 1,
-0.9271477, -0.05209501, -1.614519, 1, 1, 1, 1, 1,
-0.9270601, 0.2394686, -2.374496, 1, 1, 1, 1, 1,
-0.926913, 0.735904, -1.692942, 0, 0, 1, 1, 1,
-0.9243602, 0.7833059, -1.937515, 1, 0, 0, 1, 1,
-0.9184934, 0.9870707, -0.3138416, 1, 0, 0, 1, 1,
-0.9060571, -0.6678953, -1.851946, 1, 0, 0, 1, 1,
-0.9059989, 0.6962625, -1.264896, 1, 0, 0, 1, 1,
-0.9012918, 0.001669882, -1.81725, 1, 0, 0, 1, 1,
-0.8971881, 1.011887, 0.9045743, 0, 0, 0, 1, 1,
-0.8970963, -0.3314482, 0.8169407, 0, 0, 0, 1, 1,
-0.8965766, -1.455582, -4.076805, 0, 0, 0, 1, 1,
-0.8961859, 0.2995152, -2.415115, 0, 0, 0, 1, 1,
-0.8926916, 2.227969, -0.1296339, 0, 0, 0, 1, 1,
-0.8879526, -0.2731707, -1.836032, 0, 0, 0, 1, 1,
-0.8863103, 0.05403779, -0.6160051, 0, 0, 0, 1, 1,
-0.8856748, 0.9583305, -0.9583586, 1, 1, 1, 1, 1,
-0.8825521, 0.6847659, -2.033527, 1, 1, 1, 1, 1,
-0.8789299, -0.003332904, -2.125396, 1, 1, 1, 1, 1,
-0.8749725, -0.6659074, -1.123669, 1, 1, 1, 1, 1,
-0.8708895, 0.3606259, -1.17257, 1, 1, 1, 1, 1,
-0.8690798, -1.020985, -3.067842, 1, 1, 1, 1, 1,
-0.857977, 0.3366224, -0.5988126, 1, 1, 1, 1, 1,
-0.8568992, 0.2709446, -1.272295, 1, 1, 1, 1, 1,
-0.856155, 1.060059, -1.311145, 1, 1, 1, 1, 1,
-0.8559072, 0.08766484, -1.649247, 1, 1, 1, 1, 1,
-0.8545435, -0.8474441, -2.739604, 1, 1, 1, 1, 1,
-0.8531128, -1.009836, -1.791982, 1, 1, 1, 1, 1,
-0.8528709, -0.7249652, -2.161067, 1, 1, 1, 1, 1,
-0.8458185, -0.05390073, -1.607556, 1, 1, 1, 1, 1,
-0.8445271, 0.9376561, -0.9647879, 1, 1, 1, 1, 1,
-0.8396776, -1.306424, -4.292726, 0, 0, 1, 1, 1,
-0.837424, 0.3288219, -2.272815, 1, 0, 0, 1, 1,
-0.8360681, -1.535554, -2.012898, 1, 0, 0, 1, 1,
-0.8320124, -0.2729827, -1.223839, 1, 0, 0, 1, 1,
-0.8250571, 0.3813094, -1.865734, 1, 0, 0, 1, 1,
-0.8214713, -0.9886696, -2.76713, 1, 0, 0, 1, 1,
-0.8211896, 2.306883, 0.06910503, 0, 0, 0, 1, 1,
-0.8190689, 0.4560652, -1.678098, 0, 0, 0, 1, 1,
-0.8173468, -0.5778972, -2.325614, 0, 0, 0, 1, 1,
-0.8170571, -1.36243, -3.680774, 0, 0, 0, 1, 1,
-0.8151531, 0.1532111, 0.1178275, 0, 0, 0, 1, 1,
-0.8113672, -1.466888, -1.814864, 0, 0, 0, 1, 1,
-0.8059928, -1.229782, -4.559092, 0, 0, 0, 1, 1,
-0.8051459, 0.269068, -1.309116, 1, 1, 1, 1, 1,
-0.8040288, -0.7645555, -0.6979484, 1, 1, 1, 1, 1,
-0.8018681, 1.012644, -1.705205, 1, 1, 1, 1, 1,
-0.7968183, -1.029622, -1.809867, 1, 1, 1, 1, 1,
-0.7966279, 0.9081495, -2.182017, 1, 1, 1, 1, 1,
-0.79614, -1.568951, -2.928179, 1, 1, 1, 1, 1,
-0.7960714, -2.26121, -2.465602, 1, 1, 1, 1, 1,
-0.7937081, -0.9019269, -2.758028, 1, 1, 1, 1, 1,
-0.7932059, 0.533944, -0.5868331, 1, 1, 1, 1, 1,
-0.7929263, 0.06137132, -2.95953, 1, 1, 1, 1, 1,
-0.7918667, 0.1030107, -1.225115, 1, 1, 1, 1, 1,
-0.7909074, 1.433712, -0.3175207, 1, 1, 1, 1, 1,
-0.7858801, -0.06057783, 0.6173732, 1, 1, 1, 1, 1,
-0.7747735, 0.471339, -1.884659, 1, 1, 1, 1, 1,
-0.7728537, 0.3957001, -0.2168133, 1, 1, 1, 1, 1,
-0.7708507, 1.120202, -0.6830495, 0, 0, 1, 1, 1,
-0.7683548, 0.1936846, -0.8714691, 1, 0, 0, 1, 1,
-0.7668508, 1.09312, -2.171358, 1, 0, 0, 1, 1,
-0.7666468, 0.2160566, -1.450491, 1, 0, 0, 1, 1,
-0.7656984, -0.9003307, -3.502463, 1, 0, 0, 1, 1,
-0.7652337, -0.6560189, -2.142969, 1, 0, 0, 1, 1,
-0.7555447, 0.09031101, -1.491008, 0, 0, 0, 1, 1,
-0.7534369, 1.524469, -1.835089, 0, 0, 0, 1, 1,
-0.7394924, -0.7653164, -2.601174, 0, 0, 0, 1, 1,
-0.7374995, 0.7468503, 0.009408172, 0, 0, 0, 1, 1,
-0.7362764, -0.6489593, -1.820431, 0, 0, 0, 1, 1,
-0.7342046, 2.082311, -2.508246, 0, 0, 0, 1, 1,
-0.7332053, -0.5552087, -3.884776, 0, 0, 0, 1, 1,
-0.7303005, -1.015934, -3.949062, 1, 1, 1, 1, 1,
-0.7255818, -0.2475794, 0.1275862, 1, 1, 1, 1, 1,
-0.7223516, 0.1278509, -1.742712, 1, 1, 1, 1, 1,
-0.7177747, 0.6686158, -0.1731112, 1, 1, 1, 1, 1,
-0.7161986, 1.546086, -0.8794279, 1, 1, 1, 1, 1,
-0.7153916, 0.5046381, -0.797785, 1, 1, 1, 1, 1,
-0.7106705, -0.07745285, -0.3281253, 1, 1, 1, 1, 1,
-0.707391, -1.820231, -3.173019, 1, 1, 1, 1, 1,
-0.707372, -1.130569, -3.518998, 1, 1, 1, 1, 1,
-0.705255, -1.720089, -2.168632, 1, 1, 1, 1, 1,
-0.6973556, -0.538514, -2.180677, 1, 1, 1, 1, 1,
-0.6940746, 0.3227289, -2.295458, 1, 1, 1, 1, 1,
-0.6907115, 0.7644621, 0.1138953, 1, 1, 1, 1, 1,
-0.6896524, 0.5028865, 0.6321905, 1, 1, 1, 1, 1,
-0.6870249, -2.282329, -3.347955, 1, 1, 1, 1, 1,
-0.6850924, -1.41424, -2.260375, 0, 0, 1, 1, 1,
-0.6839827, 1.107224, -0.1504719, 1, 0, 0, 1, 1,
-0.682153, 0.5004842, 0.0543975, 1, 0, 0, 1, 1,
-0.6773978, -0.5324476, -2.782002, 1, 0, 0, 1, 1,
-0.6740535, -0.544433, -1.504218, 1, 0, 0, 1, 1,
-0.671401, 0.7310614, -0.2298654, 1, 0, 0, 1, 1,
-0.6707355, 0.7401189, -1.960929, 0, 0, 0, 1, 1,
-0.6693698, -1.340412, -3.391242, 0, 0, 0, 1, 1,
-0.6666399, 0.2374827, -1.180483, 0, 0, 0, 1, 1,
-0.6618596, -0.5819528, -2.33354, 0, 0, 0, 1, 1,
-0.6604984, 0.319806, 0.7660789, 0, 0, 0, 1, 1,
-0.6569567, 2.312346, -0.3319851, 0, 0, 0, 1, 1,
-0.6554273, 0.977507, -0.8214502, 0, 0, 0, 1, 1,
-0.6544261, 0.3294318, -2.518898, 1, 1, 1, 1, 1,
-0.6543155, 0.91192, -1.185276, 1, 1, 1, 1, 1,
-0.6408771, 0.9220904, -0.3242003, 1, 1, 1, 1, 1,
-0.6367415, -1.873612, -2.565849, 1, 1, 1, 1, 1,
-0.6330535, -1.875047, -2.512972, 1, 1, 1, 1, 1,
-0.6313321, 0.03503112, -1.769923, 1, 1, 1, 1, 1,
-0.6272237, 0.8132867, -1.242086, 1, 1, 1, 1, 1,
-0.6269373, -0.4989664, -1.813148, 1, 1, 1, 1, 1,
-0.6260481, 0.5724469, -1.901138, 1, 1, 1, 1, 1,
-0.6258, 0.5784925, -0.7479801, 1, 1, 1, 1, 1,
-0.6245942, 0.9361177, -0.3782667, 1, 1, 1, 1, 1,
-0.6199819, -0.04199677, -2.407367, 1, 1, 1, 1, 1,
-0.6170062, 0.258077, -2.049101, 1, 1, 1, 1, 1,
-0.6160737, 0.9475619, -0.2197517, 1, 1, 1, 1, 1,
-0.6140493, -0.8857692, -2.489377, 1, 1, 1, 1, 1,
-0.6104994, -0.4993714, -2.392449, 0, 0, 1, 1, 1,
-0.610448, -1.666703, -4.530311, 1, 0, 0, 1, 1,
-0.6087393, 0.5333608, 0.4325343, 1, 0, 0, 1, 1,
-0.59875, 2.595844, 0.6517009, 1, 0, 0, 1, 1,
-0.595503, 0.5789175, -2.567429, 1, 0, 0, 1, 1,
-0.5884276, -0.682638, -2.779971, 1, 0, 0, 1, 1,
-0.5872123, -1.796265, -3.417498, 0, 0, 0, 1, 1,
-0.586284, 0.9022499, -1.385183, 0, 0, 0, 1, 1,
-0.5848212, 0.02164618, 0.5131197, 0, 0, 0, 1, 1,
-0.5803003, 0.7242229, -0.007488394, 0, 0, 0, 1, 1,
-0.5789612, -0.2592429, -1.739867, 0, 0, 0, 1, 1,
-0.5766768, -0.5319952, -1.241532, 0, 0, 0, 1, 1,
-0.569419, 0.2610611, -1.725518, 0, 0, 0, 1, 1,
-0.5621018, -1.403593, -3.260679, 1, 1, 1, 1, 1,
-0.5556908, 0.2652265, -0.01370341, 1, 1, 1, 1, 1,
-0.5507182, -0.9884007, -2.368891, 1, 1, 1, 1, 1,
-0.5489711, -0.09475459, -0.532879, 1, 1, 1, 1, 1,
-0.546616, 1.90891, -0.9500846, 1, 1, 1, 1, 1,
-0.5463237, 0.7738048, -0.3994257, 1, 1, 1, 1, 1,
-0.5459399, 0.1918911, -1.681881, 1, 1, 1, 1, 1,
-0.5457476, 1.553777, -0.8487018, 1, 1, 1, 1, 1,
-0.5439432, 1.705481, -2.083209, 1, 1, 1, 1, 1,
-0.5417079, 0.5418561, -1.68035, 1, 1, 1, 1, 1,
-0.5331702, 0.2044533, -1.765634, 1, 1, 1, 1, 1,
-0.5262212, 0.07212087, -2.429891, 1, 1, 1, 1, 1,
-0.5250562, 0.6812853, 0.1808666, 1, 1, 1, 1, 1,
-0.5217005, -0.01398223, -0.5201682, 1, 1, 1, 1, 1,
-0.5207263, 2.19645, 1.248767, 1, 1, 1, 1, 1,
-0.5201288, 1.623952, -1.026133, 0, 0, 1, 1, 1,
-0.5152415, -0.2138486, -3.185572, 1, 0, 0, 1, 1,
-0.5149258, -0.683854, -2.025041, 1, 0, 0, 1, 1,
-0.5136364, 1.34357, -0.3845443, 1, 0, 0, 1, 1,
-0.5041499, -0.215896, -2.265033, 1, 0, 0, 1, 1,
-0.4981365, 0.9972283, -0.03419789, 1, 0, 0, 1, 1,
-0.4963023, -0.4794176, -2.426631, 0, 0, 0, 1, 1,
-0.4961042, 0.1776964, -1.170505, 0, 0, 0, 1, 1,
-0.4905051, -1.853344, -3.871615, 0, 0, 0, 1, 1,
-0.4879504, -0.7753409, -2.313398, 0, 0, 0, 1, 1,
-0.484907, -1.741051, -3.399135, 0, 0, 0, 1, 1,
-0.4818368, 1.642221, 0.2133552, 0, 0, 0, 1, 1,
-0.4742061, -0.09670305, -3.177263, 0, 0, 0, 1, 1,
-0.4664097, -0.6264563, -1.557071, 1, 1, 1, 1, 1,
-0.4659575, -0.2315812, -1.987301, 1, 1, 1, 1, 1,
-0.4645487, 0.5792209, -0.290272, 1, 1, 1, 1, 1,
-0.4547337, 0.05371333, -1.495987, 1, 1, 1, 1, 1,
-0.4488004, -1.12897, -3.841179, 1, 1, 1, 1, 1,
-0.446772, -0.389095, -2.194361, 1, 1, 1, 1, 1,
-0.4425831, 1.056988, 0.9491822, 1, 1, 1, 1, 1,
-0.442118, 0.2428184, 1.083953, 1, 1, 1, 1, 1,
-0.4408608, 1.319558, 0.4095748, 1, 1, 1, 1, 1,
-0.4407734, 1.244644, 0.1057252, 1, 1, 1, 1, 1,
-0.440506, 0.1856925, -1.246808, 1, 1, 1, 1, 1,
-0.4359051, -1.435809, -1.739567, 1, 1, 1, 1, 1,
-0.4346954, 1.747399, 0.6378665, 1, 1, 1, 1, 1,
-0.4343667, -0.4346293, -0.702718, 1, 1, 1, 1, 1,
-0.4314004, 0.5234244, -0.4067873, 1, 1, 1, 1, 1,
-0.411539, -0.6161267, -2.374231, 0, 0, 1, 1, 1,
-0.4029197, 0.5021803, 0.02610921, 1, 0, 0, 1, 1,
-0.3982876, -0.2492102, -2.537713, 1, 0, 0, 1, 1,
-0.3931767, 0.2021948, -1.764461, 1, 0, 0, 1, 1,
-0.3855303, -0.2572621, -3.897079, 1, 0, 0, 1, 1,
-0.3844845, -0.5682132, -2.119056, 1, 0, 0, 1, 1,
-0.3766192, -0.8895643, -3.027268, 0, 0, 0, 1, 1,
-0.369091, 0.7321375, 1.30436, 0, 0, 0, 1, 1,
-0.3675255, 0.8303959, -0.7311759, 0, 0, 0, 1, 1,
-0.3629318, 0.3331912, -1.75557, 0, 0, 0, 1, 1,
-0.3594048, -0.6672422, -3.06519, 0, 0, 0, 1, 1,
-0.3584054, -1.35874, -2.377152, 0, 0, 0, 1, 1,
-0.3531498, -0.5645118, -2.540727, 0, 0, 0, 1, 1,
-0.3512665, 1.33258, 1.010082, 1, 1, 1, 1, 1,
-0.3508832, 1.020054, 0.3727811, 1, 1, 1, 1, 1,
-0.3439464, 0.8267093, -0.1755492, 1, 1, 1, 1, 1,
-0.3410531, 0.8027958, -1.940214, 1, 1, 1, 1, 1,
-0.3386433, 2.306633, -0.1482631, 1, 1, 1, 1, 1,
-0.3373646, 0.7195957, -1.118723, 1, 1, 1, 1, 1,
-0.3368965, -0.3792513, -1.202914, 1, 1, 1, 1, 1,
-0.3360051, 0.7019323, 0.4196895, 1, 1, 1, 1, 1,
-0.3273738, -0.6096902, -1.821179, 1, 1, 1, 1, 1,
-0.322995, -1.197586, -1.854673, 1, 1, 1, 1, 1,
-0.3228452, 0.07191051, -2.20308, 1, 1, 1, 1, 1,
-0.3200341, 0.5564333, -1.113058, 1, 1, 1, 1, 1,
-0.320005, 1.534916, 1.091517, 1, 1, 1, 1, 1,
-0.319827, -0.5016321, -2.10384, 1, 1, 1, 1, 1,
-0.3191923, -1.993018, -3.77632, 1, 1, 1, 1, 1,
-0.3155241, 1.448877, -0.3311725, 0, 0, 1, 1, 1,
-0.3095252, -0.1274311, -1.657298, 1, 0, 0, 1, 1,
-0.3075396, -1.390155, -3.241151, 1, 0, 0, 1, 1,
-0.3069225, 0.2046946, -1.755734, 1, 0, 0, 1, 1,
-0.3043416, -0.2925312, -1.991867, 1, 0, 0, 1, 1,
-0.3036902, -1.176372, -3.946618, 1, 0, 0, 1, 1,
-0.3032557, -0.340988, -1.972095, 0, 0, 0, 1, 1,
-0.3027263, 1.523386, -0.9220676, 0, 0, 0, 1, 1,
-0.3016986, 1.313012, -2.196142, 0, 0, 0, 1, 1,
-0.2915398, 0.2481778, -0.8406237, 0, 0, 0, 1, 1,
-0.2909117, -0.3157576, -1.998204, 0, 0, 0, 1, 1,
-0.2906213, -0.7763107, -2.043519, 0, 0, 0, 1, 1,
-0.2867171, 0.782129, 1.017699, 0, 0, 0, 1, 1,
-0.2833941, 0.5000772, 0.06779065, 1, 1, 1, 1, 1,
-0.2833894, 0.5049503, -0.07004158, 1, 1, 1, 1, 1,
-0.2825642, -1.48096, -3.361712, 1, 1, 1, 1, 1,
-0.2812112, 0.7573577, -1.696137, 1, 1, 1, 1, 1,
-0.2749518, -0.4178456, -3.31382, 1, 1, 1, 1, 1,
-0.2678751, -0.1626792, -1.299418, 1, 1, 1, 1, 1,
-0.2657977, -1.285609, -3.120979, 1, 1, 1, 1, 1,
-0.2637667, -0.3304746, -4.112798, 1, 1, 1, 1, 1,
-0.2587859, 0.09125984, 0.2420808, 1, 1, 1, 1, 1,
-0.2560642, -0.3790856, -2.80159, 1, 1, 1, 1, 1,
-0.2388358, 0.3029039, -0.8211254, 1, 1, 1, 1, 1,
-0.2386584, 0.5417263, 0.3171552, 1, 1, 1, 1, 1,
-0.2381683, -0.3013053, -2.86393, 1, 1, 1, 1, 1,
-0.2337847, 1.768027, -0.8941964, 1, 1, 1, 1, 1,
-0.2298557, 0.4771695, 0.6287534, 1, 1, 1, 1, 1,
-0.2297875, -0.5367413, -3.453589, 0, 0, 1, 1, 1,
-0.2297426, 1.361249, 1.651446, 1, 0, 0, 1, 1,
-0.2290218, 0.07561953, -2.360103, 1, 0, 0, 1, 1,
-0.2257119, 1.950668, -0.2962824, 1, 0, 0, 1, 1,
-0.2255655, -1.371995, -1.942199, 1, 0, 0, 1, 1,
-0.225151, 2.044388, -0.9925358, 1, 0, 0, 1, 1,
-0.2229822, -0.6634555, -2.748735, 0, 0, 0, 1, 1,
-0.2216311, -0.6374202, -2.170394, 0, 0, 0, 1, 1,
-0.2209828, -0.3732994, -0.6020687, 0, 0, 0, 1, 1,
-0.2154486, 0.004378061, -1.486367, 0, 0, 0, 1, 1,
-0.2151802, 0.6088994, -0.9082655, 0, 0, 0, 1, 1,
-0.2017455, -0.5385121, -3.361562, 0, 0, 0, 1, 1,
-0.2010674, -0.5215033, -3.003432, 0, 0, 0, 1, 1,
-0.1952255, 0.176269, -1.248112, 1, 1, 1, 1, 1,
-0.1939337, 2.175355, 0.8770795, 1, 1, 1, 1, 1,
-0.1897489, -0.1110152, -2.182556, 1, 1, 1, 1, 1,
-0.1889236, -0.1700404, -3.156502, 1, 1, 1, 1, 1,
-0.1844928, -0.2558548, -2.954489, 1, 1, 1, 1, 1,
-0.1770927, 0.3412748, -1.216028, 1, 1, 1, 1, 1,
-0.1732459, -0.2211761, -4.580871, 1, 1, 1, 1, 1,
-0.1700829, -1.798021, -3.481931, 1, 1, 1, 1, 1,
-0.1690909, -0.02475868, -1.976615, 1, 1, 1, 1, 1,
-0.1614268, -0.5072343, -1.558116, 1, 1, 1, 1, 1,
-0.1599006, -2.578617, -2.638519, 1, 1, 1, 1, 1,
-0.1594636, -0.7495762, -3.368798, 1, 1, 1, 1, 1,
-0.1545158, -1.862206, -0.4947735, 1, 1, 1, 1, 1,
-0.1531679, -0.3255651, -1.308041, 1, 1, 1, 1, 1,
-0.1522532, 0.4805489, -1.108904, 1, 1, 1, 1, 1,
-0.1518563, 2.654093, -3.448388, 0, 0, 1, 1, 1,
-0.1513525, 0.5722835, -2.610562, 1, 0, 0, 1, 1,
-0.1504186, -0.4130266, -2.817082, 1, 0, 0, 1, 1,
-0.1472452, -0.6893401, -3.339143, 1, 0, 0, 1, 1,
-0.1461056, 0.3552395, -1.256489, 1, 0, 0, 1, 1,
-0.1416811, 1.227954, 0.03941484, 1, 0, 0, 1, 1,
-0.1370465, -0.3353358, -3.685549, 0, 0, 0, 1, 1,
-0.1367704, -0.6463218, -4.117765, 0, 0, 0, 1, 1,
-0.1353584, 0.6042517, -0.4829333, 0, 0, 0, 1, 1,
-0.1353372, -0.05616698, -1.806942, 0, 0, 0, 1, 1,
-0.1351419, -1.520717, -2.311015, 0, 0, 0, 1, 1,
-0.1325855, -0.3176404, -2.647801, 0, 0, 0, 1, 1,
-0.1274739, 1.772997, -2.34801, 0, 0, 0, 1, 1,
-0.1257094, -0.1181386, -1.294102, 1, 1, 1, 1, 1,
-0.1214023, 1.18414, -1.636805, 1, 1, 1, 1, 1,
-0.1186696, 0.7095138, 1.22531, 1, 1, 1, 1, 1,
-0.1175649, 2.02273, -0.5912783, 1, 1, 1, 1, 1,
-0.1104174, 0.4368575, 1.071222, 1, 1, 1, 1, 1,
-0.1078623, -0.5082321, -2.447194, 1, 1, 1, 1, 1,
-0.09953354, -0.03009484, -2.850187, 1, 1, 1, 1, 1,
-0.09712451, 2.17284, 0.1613093, 1, 1, 1, 1, 1,
-0.0939296, -0.4389533, -2.667655, 1, 1, 1, 1, 1,
-0.08340456, 0.182454, 0.5751881, 1, 1, 1, 1, 1,
-0.08273016, 0.7931343, 0.6074035, 1, 1, 1, 1, 1,
-0.07668959, -2.800076, -3.428455, 1, 1, 1, 1, 1,
-0.07593717, 0.1161264, -0.791028, 1, 1, 1, 1, 1,
-0.07295773, -1.269496, -2.19977, 1, 1, 1, 1, 1,
-0.07131027, 0.5350801, 1.825362, 1, 1, 1, 1, 1,
-0.07077555, 0.8020512, 1.716662, 0, 0, 1, 1, 1,
-0.06959026, 0.2411487, 0.478884, 1, 0, 0, 1, 1,
-0.06950208, 0.2149864, 0.1032221, 1, 0, 0, 1, 1,
-0.06701189, -1.434091, -2.857313, 1, 0, 0, 1, 1,
-0.06470238, -0.1116729, -2.254953, 1, 0, 0, 1, 1,
-0.05777397, 0.3377445, 1.423974, 1, 0, 0, 1, 1,
-0.05756366, 1.8871, 1.326054, 0, 0, 0, 1, 1,
-0.05675398, 0.7750482, 0.1932273, 0, 0, 0, 1, 1,
-0.05483177, -0.9975306, -3.352977, 0, 0, 0, 1, 1,
-0.05434712, -0.963514, -2.159114, 0, 0, 0, 1, 1,
-0.04443299, 0.9920142, -0.2093204, 0, 0, 0, 1, 1,
-0.04388717, 0.7093162, 0.06835862, 0, 0, 0, 1, 1,
-0.04350042, -1.688594, -2.166788, 0, 0, 0, 1, 1,
-0.04150763, -0.1504828, -2.60048, 1, 1, 1, 1, 1,
-0.03849242, 0.04792709, -0.7525131, 1, 1, 1, 1, 1,
-0.0273657, -0.5298876, -4.851821, 1, 1, 1, 1, 1,
-0.02671555, -1.066077, -4.217322, 1, 1, 1, 1, 1,
-0.02611397, -1.132082, -0.5749817, 1, 1, 1, 1, 1,
-0.02552763, -0.8185787, -1.577999, 1, 1, 1, 1, 1,
-0.02201657, -1.447569, -2.344203, 1, 1, 1, 1, 1,
-0.0212045, -0.3090347, -2.728431, 1, 1, 1, 1, 1,
-0.0209518, -0.9883457, -2.860713, 1, 1, 1, 1, 1,
-0.02039682, 0.9859267, 0.8072569, 1, 1, 1, 1, 1,
-0.008260129, -0.2753407, -2.100607, 1, 1, 1, 1, 1,
-0.005071359, -0.6711009, -4.100831, 1, 1, 1, 1, 1,
-0.004339483, 0.195175, 0.3016561, 1, 1, 1, 1, 1,
-0.004253405, -0.5142199, -2.0972, 1, 1, 1, 1, 1,
-0.002440927, 0.8464587, -1.319403, 1, 1, 1, 1, 1,
0.006453449, 0.3963669, -1.662489, 0, 0, 1, 1, 1,
0.00982713, -0.1799696, 2.084634, 1, 0, 0, 1, 1,
0.01259752, -0.2515907, 2.377498, 1, 0, 0, 1, 1,
0.01625748, -0.8234649, 1.540952, 1, 0, 0, 1, 1,
0.01666818, 1.572294, 1.473558, 1, 0, 0, 1, 1,
0.01914185, 0.4055153, -1.237946, 1, 0, 0, 1, 1,
0.02057088, 0.3390859, -1.296039, 0, 0, 0, 1, 1,
0.02405713, 0.1890957, 0.4576826, 0, 0, 0, 1, 1,
0.02765847, 1.061041, 0.3337603, 0, 0, 0, 1, 1,
0.02953098, -1.315753, 1.30893, 0, 0, 0, 1, 1,
0.03345365, 1.079648, 0.8933566, 0, 0, 0, 1, 1,
0.03570023, 0.785796, 0.04200748, 0, 0, 0, 1, 1,
0.03635727, -0.05226541, 2.441329, 0, 0, 0, 1, 1,
0.04195879, -0.01562642, 4.124821, 1, 1, 1, 1, 1,
0.04214091, -0.009835297, 0.5627018, 1, 1, 1, 1, 1,
0.04800792, 0.5545402, -0.1015273, 1, 1, 1, 1, 1,
0.04835596, 0.5393172, 1.837295, 1, 1, 1, 1, 1,
0.05002672, 0.5217428, 0.2404747, 1, 1, 1, 1, 1,
0.05854236, -0.3090925, 2.681781, 1, 1, 1, 1, 1,
0.05959818, 1.721513, 0.6751356, 1, 1, 1, 1, 1,
0.05990013, -2.674703, 2.988788, 1, 1, 1, 1, 1,
0.06173242, -0.3185691, 5.229764, 1, 1, 1, 1, 1,
0.06205496, -0.5610285, 3.558305, 1, 1, 1, 1, 1,
0.064589, 0.3121977, 1.145374, 1, 1, 1, 1, 1,
0.0689112, 1.557339, -0.6146987, 1, 1, 1, 1, 1,
0.07269179, 0.5619171, -1.087866, 1, 1, 1, 1, 1,
0.0728098, 0.5186405, -0.2778369, 1, 1, 1, 1, 1,
0.07595284, -1.127341, 2.189655, 1, 1, 1, 1, 1,
0.07882565, -0.3656846, 4.032546, 0, 0, 1, 1, 1,
0.07916595, 1.005037, -0.7432675, 1, 0, 0, 1, 1,
0.07979944, 1.768455, -0.6493549, 1, 0, 0, 1, 1,
0.08050197, -2.334179, 3.388454, 1, 0, 0, 1, 1,
0.08408973, 0.01922445, 0.1107709, 1, 0, 0, 1, 1,
0.08517646, 0.5718388, -1.782131, 1, 0, 0, 1, 1,
0.08605694, 0.08140586, 0.2726255, 0, 0, 0, 1, 1,
0.08940719, 1.114895, 0.9017132, 0, 0, 0, 1, 1,
0.09026734, -1.475945, 3.304356, 0, 0, 0, 1, 1,
0.09838428, 1.120204, 2.406423, 0, 0, 0, 1, 1,
0.09895016, -1.098022, 2.511159, 0, 0, 0, 1, 1,
0.1039321, 0.2883264, 1.288904, 0, 0, 0, 1, 1,
0.1053953, -0.4671385, 2.638204, 0, 0, 0, 1, 1,
0.1066741, -0.7574442, 3.67702, 1, 1, 1, 1, 1,
0.1070185, 1.400973, -0.1077202, 1, 1, 1, 1, 1,
0.1083117, 0.7508255, -1.136274, 1, 1, 1, 1, 1,
0.108917, 0.2476016, 0.08224934, 1, 1, 1, 1, 1,
0.1091271, 0.791576, -0.2756117, 1, 1, 1, 1, 1,
0.111779, 1.052648, -0.3082391, 1, 1, 1, 1, 1,
0.1139847, -0.3594823, 3.459066, 1, 1, 1, 1, 1,
0.1194213, -2.649669, 3.385603, 1, 1, 1, 1, 1,
0.1202465, -1.222224, 3.331058, 1, 1, 1, 1, 1,
0.1234657, -1.326243, 4.886412, 1, 1, 1, 1, 1,
0.123687, -1.170172, 2.547812, 1, 1, 1, 1, 1,
0.1242847, 0.07773165, 1.899466, 1, 1, 1, 1, 1,
0.1245959, -0.1046346, 1.366559, 1, 1, 1, 1, 1,
0.1258836, -1.162514, 3.104504, 1, 1, 1, 1, 1,
0.1282428, -1.163451, 3.112591, 1, 1, 1, 1, 1,
0.1289409, 0.5499669, 0.4417112, 0, 0, 1, 1, 1,
0.1300582, 0.5496696, 0.7638956, 1, 0, 0, 1, 1,
0.1309381, -0.9366741, 4.464279, 1, 0, 0, 1, 1,
0.1316357, 0.501475, 0.4724237, 1, 0, 0, 1, 1,
0.1329768, -0.5356314, 2.375839, 1, 0, 0, 1, 1,
0.1348451, -0.7682163, 4.330765, 1, 0, 0, 1, 1,
0.1400829, -0.1991316, 3.253326, 0, 0, 0, 1, 1,
0.1406732, 0.4447494, 0.627308, 0, 0, 0, 1, 1,
0.1462403, 1.5215, -0.3077824, 0, 0, 0, 1, 1,
0.1473428, 2.292001, 1.009595, 0, 0, 0, 1, 1,
0.1477586, -0.8199714, 3.821373, 0, 0, 0, 1, 1,
0.1482868, -1.852584, 2.772914, 0, 0, 0, 1, 1,
0.1513731, -1.349241, 2.056292, 0, 0, 0, 1, 1,
0.1557725, -0.1299777, 2.323383, 1, 1, 1, 1, 1,
0.1560146, -0.8232825, 3.387547, 1, 1, 1, 1, 1,
0.1619521, -2.337928, 3.505747, 1, 1, 1, 1, 1,
0.1620227, -2.497811, 2.336635, 1, 1, 1, 1, 1,
0.1623676, 1.318378, -0.7078076, 1, 1, 1, 1, 1,
0.1664978, -0.4371542, 1.714224, 1, 1, 1, 1, 1,
0.1670589, -1.689204, 3.182398, 1, 1, 1, 1, 1,
0.1701305, 0.3890261, -0.8731623, 1, 1, 1, 1, 1,
0.171581, -0.5627834, 2.574959, 1, 1, 1, 1, 1,
0.1778971, -0.2580533, 2.459225, 1, 1, 1, 1, 1,
0.1780725, 0.02851453, 1.816315, 1, 1, 1, 1, 1,
0.1818646, -0.3587138, 4.256494, 1, 1, 1, 1, 1,
0.1870112, -0.6133456, 2.233225, 1, 1, 1, 1, 1,
0.188391, -0.7119502, 3.248429, 1, 1, 1, 1, 1,
0.1897259, 0.06297939, 2.234243, 1, 1, 1, 1, 1,
0.194084, 1.966969, -0.6782141, 0, 0, 1, 1, 1,
0.1992248, -0.7961017, 2.289254, 1, 0, 0, 1, 1,
0.1995414, 0.8625287, -0.2666646, 1, 0, 0, 1, 1,
0.2032129, -0.1799499, 1.413701, 1, 0, 0, 1, 1,
0.2054478, 0.1502819, 0.3349498, 1, 0, 0, 1, 1,
0.2093976, 0.8155035, 0.3506517, 1, 0, 0, 1, 1,
0.2119925, -0.1763882, 1.961543, 0, 0, 0, 1, 1,
0.2191005, -1.920726, 2.844987, 0, 0, 0, 1, 1,
0.2223445, 0.4265049, 0.4333395, 0, 0, 0, 1, 1,
0.2256207, -0.3893728, 2.672467, 0, 0, 0, 1, 1,
0.2273216, 0.3276108, -0.9542055, 0, 0, 0, 1, 1,
0.2322038, -0.1866518, 2.565934, 0, 0, 0, 1, 1,
0.2350874, -0.1337021, 1.907038, 0, 0, 0, 1, 1,
0.2403552, 1.060987, 1.357331, 1, 1, 1, 1, 1,
0.2411403, -0.7510733, 3.176016, 1, 1, 1, 1, 1,
0.244716, -2.211529, 3.06742, 1, 1, 1, 1, 1,
0.2464679, -0.5153843, 1.821349, 1, 1, 1, 1, 1,
0.2523707, -0.1686353, 1.112802, 1, 1, 1, 1, 1,
0.2526971, -0.4649408, 1.836817, 1, 1, 1, 1, 1,
0.2529436, 0.1161239, 3.312378, 1, 1, 1, 1, 1,
0.2607222, 0.7486153, -0.1776887, 1, 1, 1, 1, 1,
0.2610314, -0.9729522, 3.434608, 1, 1, 1, 1, 1,
0.270837, 0.2490008, -0.8962536, 1, 1, 1, 1, 1,
0.2726357, -0.3852131, 2.678082, 1, 1, 1, 1, 1,
0.2743866, -2.576369, 2.199941, 1, 1, 1, 1, 1,
0.2770838, -1.037232, 2.692274, 1, 1, 1, 1, 1,
0.2780459, -0.8244191, 3.61652, 1, 1, 1, 1, 1,
0.2781663, 0.4102314, 0.1682891, 1, 1, 1, 1, 1,
0.2783947, 0.8410169, 1.793041, 0, 0, 1, 1, 1,
0.280865, 0.3929, 2.118344, 1, 0, 0, 1, 1,
0.286754, 0.01773867, 3.081465, 1, 0, 0, 1, 1,
0.2879712, -0.4012763, 2.208106, 1, 0, 0, 1, 1,
0.2952304, -0.5879498, 3.008183, 1, 0, 0, 1, 1,
0.2991304, -0.8233587, 1.561194, 1, 0, 0, 1, 1,
0.3004047, -0.6537688, 3.954341, 0, 0, 0, 1, 1,
0.3020184, -0.4749973, 3.549945, 0, 0, 0, 1, 1,
0.3020357, 0.3173946, 1.178439, 0, 0, 0, 1, 1,
0.302553, -1.547619, 1.759658, 0, 0, 0, 1, 1,
0.3026798, -0.2794948, 2.763105, 0, 0, 0, 1, 1,
0.3034779, 1.106347, 0.9687222, 0, 0, 0, 1, 1,
0.3061573, 0.109848, 2.447878, 0, 0, 0, 1, 1,
0.3080809, -0.8098248, 2.063047, 1, 1, 1, 1, 1,
0.3085049, -0.7019743, 2.622262, 1, 1, 1, 1, 1,
0.3110093, -1.398337, 5.042564, 1, 1, 1, 1, 1,
0.3137765, 2.471751, 0.7582229, 1, 1, 1, 1, 1,
0.315138, 0.1521007, 1.236939, 1, 1, 1, 1, 1,
0.3182227, 2.487493, 0.363537, 1, 1, 1, 1, 1,
0.3185406, -0.4405456, 2.042531, 1, 1, 1, 1, 1,
0.3187095, 0.9535177, -0.510833, 1, 1, 1, 1, 1,
0.319734, -0.8776074, 1.660463, 1, 1, 1, 1, 1,
0.3200303, 0.2387785, 0.843674, 1, 1, 1, 1, 1,
0.3312092, 2.46232, 0.8144571, 1, 1, 1, 1, 1,
0.3334263, 0.4595733, 0.79704, 1, 1, 1, 1, 1,
0.333723, 0.4616996, 1.459436, 1, 1, 1, 1, 1,
0.3391744, -1.086424, 1.969494, 1, 1, 1, 1, 1,
0.340625, -1.227676, 1.010984, 1, 1, 1, 1, 1,
0.3441018, -1.543162, 3.626233, 0, 0, 1, 1, 1,
0.3443697, -0.5680771, 0.3388845, 1, 0, 0, 1, 1,
0.3447389, 0.1188178, 0.9878576, 1, 0, 0, 1, 1,
0.3447513, -0.6034933, 4.386864, 1, 0, 0, 1, 1,
0.3448199, -1.509215, 3.132928, 1, 0, 0, 1, 1,
0.3487876, 0.3195444, 0.0457278, 1, 0, 0, 1, 1,
0.3502652, -0.2347221, 2.893138, 0, 0, 0, 1, 1,
0.351063, 0.2665651, 0.8923657, 0, 0, 0, 1, 1,
0.3515365, -1.19406, 2.828305, 0, 0, 0, 1, 1,
0.3519581, 0.8140596, 0.5963545, 0, 0, 0, 1, 1,
0.3528557, -0.369166, 1.409063, 0, 0, 0, 1, 1,
0.3569122, -1.271449, 2.431057, 0, 0, 0, 1, 1,
0.3576426, 1.395437, 0.04001226, 0, 0, 0, 1, 1,
0.3635629, 0.007402099, 1.840222, 1, 1, 1, 1, 1,
0.364272, 1.562849, -1.37746, 1, 1, 1, 1, 1,
0.3668284, 0.665889, 1.176721, 1, 1, 1, 1, 1,
0.3680477, -1.410671, 2.821961, 1, 1, 1, 1, 1,
0.3680576, 0.4569007, -0.4540159, 1, 1, 1, 1, 1,
0.3704397, 2.256567, 0.4889325, 1, 1, 1, 1, 1,
0.3712863, -0.703108, 3.587982, 1, 1, 1, 1, 1,
0.3714457, 0.7893101, 0.46656, 1, 1, 1, 1, 1,
0.3723926, 1.065869, 0.9391409, 1, 1, 1, 1, 1,
0.3739797, -0.5139543, 2.728044, 1, 1, 1, 1, 1,
0.3781544, -0.5788875, 2.186016, 1, 1, 1, 1, 1,
0.3793426, 1.46119, 1.462107, 1, 1, 1, 1, 1,
0.3805072, -0.4334014, 2.665995, 1, 1, 1, 1, 1,
0.3810569, 0.8922021, 0.9125589, 1, 1, 1, 1, 1,
0.3824185, -0.1758271, 0.9782797, 1, 1, 1, 1, 1,
0.3853925, 0.2414189, 1.563122, 0, 0, 1, 1, 1,
0.3863584, -1.227193, 1.547701, 1, 0, 0, 1, 1,
0.3863887, -0.7458125, 1.755031, 1, 0, 0, 1, 1,
0.3897839, -1.026669, 0.8662163, 1, 0, 0, 1, 1,
0.3909643, 0.3402864, 0.9956013, 1, 0, 0, 1, 1,
0.3952557, 0.9721361, -0.2386615, 1, 0, 0, 1, 1,
0.3969986, -0.1452199, -0.7267264, 0, 0, 0, 1, 1,
0.3988291, 0.5351483, 0.4255093, 0, 0, 0, 1, 1,
0.4015594, 0.2797477, 1.655229, 0, 0, 0, 1, 1,
0.4067744, 0.3504795, 1.415594, 0, 0, 0, 1, 1,
0.4106204, -1.171382, 2.339053, 0, 0, 0, 1, 1,
0.4107583, 0.0996546, 0.9149663, 0, 0, 0, 1, 1,
0.412415, -0.4176835, 1.929157, 0, 0, 0, 1, 1,
0.4132364, -0.7440319, 2.48528, 1, 1, 1, 1, 1,
0.4152922, 0.5179574, 1.00582, 1, 1, 1, 1, 1,
0.416686, 1.394024, 0.6449994, 1, 1, 1, 1, 1,
0.4210218, 0.6557782, -0.1852675, 1, 1, 1, 1, 1,
0.4229067, 0.145957, 0.1092967, 1, 1, 1, 1, 1,
0.4337854, 0.5198333, 2.274107, 1, 1, 1, 1, 1,
0.4382624, 0.6199857, 0.2844484, 1, 1, 1, 1, 1,
0.4402992, 0.4713026, 0.9750401, 1, 1, 1, 1, 1,
0.4404236, -0.9861302, 2.099399, 1, 1, 1, 1, 1,
0.4428976, 0.4749331, 0.6550878, 1, 1, 1, 1, 1,
0.4447897, 1.951577, -0.8825331, 1, 1, 1, 1, 1,
0.4479448, 0.4630516, 1.676439, 1, 1, 1, 1, 1,
0.4482477, 0.1355953, 2.200824, 1, 1, 1, 1, 1,
0.451921, 1.337948, 0.3774833, 1, 1, 1, 1, 1,
0.4527981, -0.8123993, 2.888278, 1, 1, 1, 1, 1,
0.4553836, -0.2916691, 2.372185, 0, 0, 1, 1, 1,
0.4563702, 0.3238114, 0.6297919, 1, 0, 0, 1, 1,
0.4585646, -0.5548146, 2.261261, 1, 0, 0, 1, 1,
0.4586075, 0.7078733, 1.79507, 1, 0, 0, 1, 1,
0.459265, 1.979606, -0.2292121, 1, 0, 0, 1, 1,
0.4595526, -0.3376347, 3.350925, 1, 0, 0, 1, 1,
0.4646074, 0.1727869, 2.084887, 0, 0, 0, 1, 1,
0.466109, 0.7726484, 0.7413445, 0, 0, 0, 1, 1,
0.483495, -0.05186684, 1.174163, 0, 0, 0, 1, 1,
0.4864788, -0.6946223, 3.995977, 0, 0, 0, 1, 1,
0.489767, 1.266706, -0.2677339, 0, 0, 0, 1, 1,
0.4912117, 0.2044921, 0.6234313, 0, 0, 0, 1, 1,
0.4925982, -0.3077995, 1.481054, 0, 0, 0, 1, 1,
0.4955635, 0.461276, -0.0923676, 1, 1, 1, 1, 1,
0.497126, 0.4972698, 1.921043, 1, 1, 1, 1, 1,
0.497297, 1.238071, 1.290082, 1, 1, 1, 1, 1,
0.5067511, -1.437224, 3.594559, 1, 1, 1, 1, 1,
0.506961, -0.1394203, 2.843193, 1, 1, 1, 1, 1,
0.5090424, -0.3117763, 1.259423, 1, 1, 1, 1, 1,
0.515383, -1.616957, 3.915651, 1, 1, 1, 1, 1,
0.5168426, -0.1017826, 1.169779, 1, 1, 1, 1, 1,
0.517224, 0.5189868, 1.950853, 1, 1, 1, 1, 1,
0.5229341, -1.234619, 1.693628, 1, 1, 1, 1, 1,
0.5256683, 1.49563, 0.0391539, 1, 1, 1, 1, 1,
0.5295398, 0.9635195, 1.126302, 1, 1, 1, 1, 1,
0.5302144, -0.0833261, 0.05333511, 1, 1, 1, 1, 1,
0.5368698, -0.4862282, 1.909017, 1, 1, 1, 1, 1,
0.5399898, -0.8646188, 3.472015, 1, 1, 1, 1, 1,
0.542532, 0.4649984, 1.10575, 0, 0, 1, 1, 1,
0.546753, -0.367496, 0.7266862, 1, 0, 0, 1, 1,
0.5472727, 2.966982, -0.2317038, 1, 0, 0, 1, 1,
0.5498583, 0.1473692, -0.465062, 1, 0, 0, 1, 1,
0.5520765, -0.8587279, 2.576327, 1, 0, 0, 1, 1,
0.553053, -1.328691, 1.281666, 1, 0, 0, 1, 1,
0.5550525, -0.09909346, 0.6798723, 0, 0, 0, 1, 1,
0.5569409, 0.3287712, 2.644759, 0, 0, 0, 1, 1,
0.5617176, -0.9093746, 3.759046, 0, 0, 0, 1, 1,
0.5627226, 1.139062, 1.27324, 0, 0, 0, 1, 1,
0.5639, -0.4038909, 2.004595, 0, 0, 0, 1, 1,
0.5671371, 1.205901, 2.298408, 0, 0, 0, 1, 1,
0.5740238, 0.5534976, 1.891385, 0, 0, 0, 1, 1,
0.5749918, -1.034101, 2.311913, 1, 1, 1, 1, 1,
0.578599, -0.7535838, 2.196091, 1, 1, 1, 1, 1,
0.5808141, 0.9636636, 0.4531423, 1, 1, 1, 1, 1,
0.5866023, 0.4051524, 0.3629909, 1, 1, 1, 1, 1,
0.587823, -0.2606266, 1.790046, 1, 1, 1, 1, 1,
0.5910733, -1.515916, 2.317685, 1, 1, 1, 1, 1,
0.5912615, -0.5343632, 2.089142, 1, 1, 1, 1, 1,
0.5922726, -0.4324942, 0.6719606, 1, 1, 1, 1, 1,
0.5947862, -0.1224911, 1.56863, 1, 1, 1, 1, 1,
0.5977621, 0.5058176, 0.9240894, 1, 1, 1, 1, 1,
0.6006024, -1.270924, 3.679574, 1, 1, 1, 1, 1,
0.6038677, 0.2536328, 1.875798, 1, 1, 1, 1, 1,
0.6055469, 0.0131969, 0.319109, 1, 1, 1, 1, 1,
0.6061271, 0.6712413, 1.234085, 1, 1, 1, 1, 1,
0.6103698, -0.01944488, 0.3931759, 1, 1, 1, 1, 1,
0.6106681, -1.863608, 2.595612, 0, 0, 1, 1, 1,
0.6110634, 0.7811126, 1.135073, 1, 0, 0, 1, 1,
0.6119301, 0.08178446, 1.715315, 1, 0, 0, 1, 1,
0.6172108, 1.179579, 1.015757, 1, 0, 0, 1, 1,
0.6176105, 0.9504953, 2.744591, 1, 0, 0, 1, 1,
0.6268581, 0.3929829, -1.027238, 1, 0, 0, 1, 1,
0.6273059, -0.5159606, 1.979838, 0, 0, 0, 1, 1,
0.6273956, -1.022767, 3.359915, 0, 0, 0, 1, 1,
0.6284088, -0.7326346, 3.339921, 0, 0, 0, 1, 1,
0.6305371, -1.03404, 0.9861183, 0, 0, 0, 1, 1,
0.6348389, -0.5201936, 1.898714, 0, 0, 0, 1, 1,
0.6359324, -1.423469, 3.343544, 0, 0, 0, 1, 1,
0.6369678, -0.5680206, 3.351352, 0, 0, 0, 1, 1,
0.6401502, 0.6502767, 0.9494461, 1, 1, 1, 1, 1,
0.6424762, -0.3272524, 2.329537, 1, 1, 1, 1, 1,
0.6470593, -0.6619695, 2.014258, 1, 1, 1, 1, 1,
0.6475955, 0.106308, 1.447834, 1, 1, 1, 1, 1,
0.6489096, -0.7424784, 2.98185, 1, 1, 1, 1, 1,
0.6532594, -2.15801, 2.355564, 1, 1, 1, 1, 1,
0.6588827, -0.1813762, 1.541169, 1, 1, 1, 1, 1,
0.6660729, -0.1517747, 0.7705806, 1, 1, 1, 1, 1,
0.6677714, -0.1609346, 3.046871, 1, 1, 1, 1, 1,
0.6686143, 0.2410127, 1.197068, 1, 1, 1, 1, 1,
0.6696349, 1.050791, -0.6745304, 1, 1, 1, 1, 1,
0.670801, -1.236289, 1.907152, 1, 1, 1, 1, 1,
0.6752015, 2.955988, 0.2334502, 1, 1, 1, 1, 1,
0.6799321, -0.4789226, 2.15973, 1, 1, 1, 1, 1,
0.6814812, -1.094977, 0.6483192, 1, 1, 1, 1, 1,
0.6976908, 1.623564, 1.257894, 0, 0, 1, 1, 1,
0.7054724, -0.273317, 3.324445, 1, 0, 0, 1, 1,
0.7063345, 0.7843078, 2.020586, 1, 0, 0, 1, 1,
0.7071999, -0.6931596, 1.07619, 1, 0, 0, 1, 1,
0.7082057, -0.782319, 2.89451, 1, 0, 0, 1, 1,
0.7128295, -1.013443, 3.686303, 1, 0, 0, 1, 1,
0.7161219, -0.6505539, 2.779463, 0, 0, 0, 1, 1,
0.7165274, -1.267078, 1.388988, 0, 0, 0, 1, 1,
0.7174056, 0.8447945, 0.8778411, 0, 0, 0, 1, 1,
0.7191035, 1.027981, -0.4526156, 0, 0, 0, 1, 1,
0.7270214, -1.047967, 3.119048, 0, 0, 0, 1, 1,
0.7296025, -0.9682811, 2.751203, 0, 0, 0, 1, 1,
0.7303396, -0.3182398, 3.462986, 0, 0, 0, 1, 1,
0.7303416, -0.9219411, 2.18854, 1, 1, 1, 1, 1,
0.7317867, -1.662513, 3.511255, 1, 1, 1, 1, 1,
0.7335951, 0.6714282, 1.131684, 1, 1, 1, 1, 1,
0.7357019, 1.72312, 1.408376, 1, 1, 1, 1, 1,
0.7378949, 1.583731, -2.033184, 1, 1, 1, 1, 1,
0.7391598, -1.412579, 4.238113, 1, 1, 1, 1, 1,
0.7434532, 0.98592, 1.195891, 1, 1, 1, 1, 1,
0.7448409, 1.09001, -0.1476878, 1, 1, 1, 1, 1,
0.745206, 0.1928284, 2.351243, 1, 1, 1, 1, 1,
0.7506071, -0.5689313, 2.040173, 1, 1, 1, 1, 1,
0.7507719, -1.139168, 1.801735, 1, 1, 1, 1, 1,
0.7512227, 2.750511, 0.4399714, 1, 1, 1, 1, 1,
0.7517556, 0.3669018, 1.979415, 1, 1, 1, 1, 1,
0.7534771, 0.1665528, 0.1245978, 1, 1, 1, 1, 1,
0.7549044, -0.2081523, 0.6270025, 1, 1, 1, 1, 1,
0.7568303, 0.6934108, -1.543127, 0, 0, 1, 1, 1,
0.7615417, 0.8636137, 0.8622539, 1, 0, 0, 1, 1,
0.765441, 0.7184962, -0.4371008, 1, 0, 0, 1, 1,
0.7657236, -1.44047, 1.791488, 1, 0, 0, 1, 1,
0.7668978, 1.605529, -1.185264, 1, 0, 0, 1, 1,
0.7804133, 0.2865729, 0.6320681, 1, 0, 0, 1, 1,
0.7867664, -0.9901696, 1.66718, 0, 0, 0, 1, 1,
0.793434, 0.1006651, 0.8877782, 0, 0, 0, 1, 1,
0.7946521, -0.9731249, 2.463327, 0, 0, 0, 1, 1,
0.7956705, -0.4463096, 2.996867, 0, 0, 0, 1, 1,
0.8001627, -1.53896, 2.66256, 0, 0, 0, 1, 1,
0.8118972, 0.358514, 0.496982, 0, 0, 0, 1, 1,
0.8127363, -0.67776, 2.959357, 0, 0, 0, 1, 1,
0.8143824, 0.1366946, 0.1785822, 1, 1, 1, 1, 1,
0.8148094, -1.132347, 3.576648, 1, 1, 1, 1, 1,
0.8195626, -0.1137858, 0.776103, 1, 1, 1, 1, 1,
0.8240108, -1.508248, 3.484382, 1, 1, 1, 1, 1,
0.8246354, 0.244421, 0.5416851, 1, 1, 1, 1, 1,
0.8249606, -1.26576, 2.187929, 1, 1, 1, 1, 1,
0.8280014, 0.3277306, 1.278315, 1, 1, 1, 1, 1,
0.8295507, 0.1062239, 1.240529, 1, 1, 1, 1, 1,
0.829719, -0.2422042, 3.122224, 1, 1, 1, 1, 1,
0.830514, 0.1279899, 0.5605345, 1, 1, 1, 1, 1,
0.8343354, 2.094804, -0.5025009, 1, 1, 1, 1, 1,
0.8405683, -0.06318559, 0.8735877, 1, 1, 1, 1, 1,
0.8419827, 0.2126932, 2.030655, 1, 1, 1, 1, 1,
0.8426698, -0.2067191, 0.9038084, 1, 1, 1, 1, 1,
0.8455242, -0.5183024, 1.637158, 1, 1, 1, 1, 1,
0.8510517, 1.342595, -2.251619, 0, 0, 1, 1, 1,
0.854465, -1.651128, 3.543286, 1, 0, 0, 1, 1,
0.8593265, 0.4531693, 2.019203, 1, 0, 0, 1, 1,
0.8593821, -1.259802, 2.666969, 1, 0, 0, 1, 1,
0.8600001, -0.4459831, 1.774209, 1, 0, 0, 1, 1,
0.8622571, -1.336659, 1.384462, 1, 0, 0, 1, 1,
0.8712346, -0.9373748, 1.898079, 0, 0, 0, 1, 1,
0.8716179, 1.470318, 0.5683175, 0, 0, 0, 1, 1,
0.8729678, -0.03042473, 1.11096, 0, 0, 0, 1, 1,
0.8772077, 1.82616, 0.947058, 0, 0, 0, 1, 1,
0.8813708, 1.348368, 0.9245125, 0, 0, 0, 1, 1,
0.8851126, 0.3565798, 0.5836328, 0, 0, 0, 1, 1,
0.8861422, 2.28792, 1.979174, 0, 0, 0, 1, 1,
0.8878046, -1.402935, 2.750879, 1, 1, 1, 1, 1,
0.8912446, 0.2744555, 0.6775512, 1, 1, 1, 1, 1,
0.8961595, 0.3081931, 2.213789, 1, 1, 1, 1, 1,
0.9071689, 0.6692442, -0.4629977, 1, 1, 1, 1, 1,
0.9081421, 0.4655934, 0.769805, 1, 1, 1, 1, 1,
0.9197925, -0.3585273, 0.6976514, 1, 1, 1, 1, 1,
0.9241005, -2.707444, 2.398967, 1, 1, 1, 1, 1,
0.9254128, 0.6076441, 1.507948, 1, 1, 1, 1, 1,
0.9293794, -1.537885, 2.429958, 1, 1, 1, 1, 1,
0.9344097, -0.4245223, 2.900134, 1, 1, 1, 1, 1,
0.9395365, -0.5801279, 2.566525, 1, 1, 1, 1, 1,
0.9431955, -0.6034614, 3.343676, 1, 1, 1, 1, 1,
0.950106, 1.154114, 2.640451, 1, 1, 1, 1, 1,
0.9560502, 0.5519646, 1.719225, 1, 1, 1, 1, 1,
0.9637999, -0.4078453, 2.52565, 1, 1, 1, 1, 1,
0.9656, -0.7942258, 2.399252, 0, 0, 1, 1, 1,
0.9681229, -1.345356, 3.483094, 1, 0, 0, 1, 1,
0.9699784, -1.04909, 1.049999, 1, 0, 0, 1, 1,
0.9776041, -0.2094754, 2.010519, 1, 0, 0, 1, 1,
0.9835321, 0.8954738, 1.719869, 1, 0, 0, 1, 1,
0.9838774, 1.899879, 0.5510269, 1, 0, 0, 1, 1,
0.9863859, 0.9330783, 0.5114114, 0, 0, 0, 1, 1,
0.9905459, -0.7557113, 2.783864, 0, 0, 0, 1, 1,
0.9913358, 0.965811, 2.424075, 0, 0, 0, 1, 1,
0.9942599, -0.1603218, -0.6046777, 0, 0, 0, 1, 1,
0.9972973, 2.194942, 1.888355, 0, 0, 0, 1, 1,
0.9978212, -1.040149, 3.098072, 0, 0, 0, 1, 1,
1.007115, 0.9833325, 1.514737, 0, 0, 0, 1, 1,
1.013221, 0.2355476, 0.9476833, 1, 1, 1, 1, 1,
1.03203, 0.8894643, -0.2154034, 1, 1, 1, 1, 1,
1.037651, 1.063736, 0.5615106, 1, 1, 1, 1, 1,
1.05141, 0.6935524, 1.267085, 1, 1, 1, 1, 1,
1.054658, 1.073077, 0.9832893, 1, 1, 1, 1, 1,
1.058192, 1.011494, 1.434388, 1, 1, 1, 1, 1,
1.059195, -1.708291, 4.178119, 1, 1, 1, 1, 1,
1.064859, -0.9949064, 3.059294, 1, 1, 1, 1, 1,
1.069304, 0.5634567, 1.250944, 1, 1, 1, 1, 1,
1.069753, -1.462272, 2.666062, 1, 1, 1, 1, 1,
1.074822, -0.3613975, 2.645599, 1, 1, 1, 1, 1,
1.07972, 0.3652742, 3.511687, 1, 1, 1, 1, 1,
1.081012, 0.2344173, 0.5404183, 1, 1, 1, 1, 1,
1.087957, 1.076509, 0.2316543, 1, 1, 1, 1, 1,
1.088257, 0.530697, 3.617573, 1, 1, 1, 1, 1,
1.101408, 0.21644, 0.9332871, 0, 0, 1, 1, 1,
1.111352, -1.033683, 2.079417, 1, 0, 0, 1, 1,
1.112618, -0.8886595, 1.919214, 1, 0, 0, 1, 1,
1.121186, -1.516772, 1.423682, 1, 0, 0, 1, 1,
1.121739, 0.9675427, 0.6190587, 1, 0, 0, 1, 1,
1.12289, -0.699271, 3.472119, 1, 0, 0, 1, 1,
1.133282, 1.022473, 1.020465, 0, 0, 0, 1, 1,
1.135526, 0.5118419, -0.9193425, 0, 0, 0, 1, 1,
1.137285, -0.4379999, 1.711967, 0, 0, 0, 1, 1,
1.141072, -0.6946436, 3.557928, 0, 0, 0, 1, 1,
1.141536, 0.176297, 1.899352, 0, 0, 0, 1, 1,
1.146212, 0.4150386, 3.481465, 0, 0, 0, 1, 1,
1.151011, 0.1857073, 1.597995, 0, 0, 0, 1, 1,
1.152447, -1.345308, 2.954682, 1, 1, 1, 1, 1,
1.152537, -1.741944, 1.452646, 1, 1, 1, 1, 1,
1.158594, -0.41521, 3.724427, 1, 1, 1, 1, 1,
1.162161, 0.1235816, -0.01670624, 1, 1, 1, 1, 1,
1.163912, -1.424738, 1.958107, 1, 1, 1, 1, 1,
1.176133, -0.01930729, 2.530984, 1, 1, 1, 1, 1,
1.178183, -0.7410709, 2.587806, 1, 1, 1, 1, 1,
1.181892, 0.6880549, -0.007277972, 1, 1, 1, 1, 1,
1.191877, 1.022191, 2.297629, 1, 1, 1, 1, 1,
1.194548, 1.384238, 1.945497, 1, 1, 1, 1, 1,
1.209563, 1.294589, 2.526978, 1, 1, 1, 1, 1,
1.231152, 0.8091201, 0.9691262, 1, 1, 1, 1, 1,
1.231647, 0.006208601, 1.280239, 1, 1, 1, 1, 1,
1.233922, 0.4235037, 0.06442139, 1, 1, 1, 1, 1,
1.241768, -1.228736, 2.927054, 1, 1, 1, 1, 1,
1.243444, -1.969009, 0.8323668, 0, 0, 1, 1, 1,
1.244528, 0.0179295, 0.8445225, 1, 0, 0, 1, 1,
1.249062, 0.4108127, 0.8774518, 1, 0, 0, 1, 1,
1.253478, -1.91419, 2.603811, 1, 0, 0, 1, 1,
1.253675, 0.3996959, 1.130692, 1, 0, 0, 1, 1,
1.26081, -0.4351897, 1.568139, 1, 0, 0, 1, 1,
1.264832, 1.914508, 1.227435, 0, 0, 0, 1, 1,
1.270716, -0.345661, 1.493628, 0, 0, 0, 1, 1,
1.27505, -0.9914454, 2.728688, 0, 0, 0, 1, 1,
1.276265, 0.2910627, 1.316399, 0, 0, 0, 1, 1,
1.276585, 0.5124639, 2.036178, 0, 0, 0, 1, 1,
1.277734, 0.3637231, -0.5619791, 0, 0, 0, 1, 1,
1.289293, -0.1179542, 0.2409458, 0, 0, 0, 1, 1,
1.29613, 1.604016, 0.5538583, 1, 1, 1, 1, 1,
1.30212, 0.6629306, 0.8986577, 1, 1, 1, 1, 1,
1.316566, -0.7567188, 2.433927, 1, 1, 1, 1, 1,
1.320789, -0.3733228, 0.2154778, 1, 1, 1, 1, 1,
1.323542, -0.05347279, 0.7981496, 1, 1, 1, 1, 1,
1.331127, -0.2211359, 2.406651, 1, 1, 1, 1, 1,
1.337202, -0.2939657, 3.067055, 1, 1, 1, 1, 1,
1.339859, 0.9998772, 1.884178, 1, 1, 1, 1, 1,
1.348769, 0.1308323, 1.470514, 1, 1, 1, 1, 1,
1.349132, 1.006901, 1.138924, 1, 1, 1, 1, 1,
1.355992, 0.7537565, 1.76193, 1, 1, 1, 1, 1,
1.358291, -1.454581, 1.484723, 1, 1, 1, 1, 1,
1.362715, 0.004320137, 1.584058, 1, 1, 1, 1, 1,
1.372301, -1.488536, 3.794436, 1, 1, 1, 1, 1,
1.414204, -0.04920847, 2.459463, 1, 1, 1, 1, 1,
1.418329, -1.180285, 2.102431, 0, 0, 1, 1, 1,
1.425076, -0.4760175, 2.023931, 1, 0, 0, 1, 1,
1.42857, -0.7338194, 1.06373, 1, 0, 0, 1, 1,
1.431348, -0.3947291, 1.738537, 1, 0, 0, 1, 1,
1.45239, -0.9834698, 3.115962, 1, 0, 0, 1, 1,
1.453737, -0.5049169, 1.059699, 1, 0, 0, 1, 1,
1.476897, 0.6973895, 3.299715, 0, 0, 0, 1, 1,
1.486023, 0.9432186, 1.840654, 0, 0, 0, 1, 1,
1.48614, -1.784799, 1.900892, 0, 0, 0, 1, 1,
1.498471, -0.05729732, 3.060755, 0, 0, 0, 1, 1,
1.506974, -0.6693779, 1.222742, 0, 0, 0, 1, 1,
1.509707, -1.242201, 3.546325, 0, 0, 0, 1, 1,
1.520274, 2.157648, -0.1202474, 0, 0, 0, 1, 1,
1.530246, -0.9712654, 1.497836, 1, 1, 1, 1, 1,
1.531992, -1.084912, 1.121317, 1, 1, 1, 1, 1,
1.538543, -1.042927, 2.38079, 1, 1, 1, 1, 1,
1.544639, 0.6246839, 1.081672, 1, 1, 1, 1, 1,
1.560314, 1.074828, 1.010003, 1, 1, 1, 1, 1,
1.565203, -0.5878341, 1.321082, 1, 1, 1, 1, 1,
1.570065, -0.4012081, 1.661864, 1, 1, 1, 1, 1,
1.576061, 0.7751498, 1.781246, 1, 1, 1, 1, 1,
1.59094, -1.41338, 4.288705, 1, 1, 1, 1, 1,
1.592039, 0.5096344, -0.001825822, 1, 1, 1, 1, 1,
1.61097, -0.6607098, 3.200313, 1, 1, 1, 1, 1,
1.614822, 0.8716704, 2.593416, 1, 1, 1, 1, 1,
1.615539, -1.662863, 2.581712, 1, 1, 1, 1, 1,
1.626768, 0.4884324, 1.655025, 1, 1, 1, 1, 1,
1.636341, -0.9089714, 0.9262396, 1, 1, 1, 1, 1,
1.652717, -2.281569, 2.627206, 0, 0, 1, 1, 1,
1.661654, -0.4507163, 1.412383, 1, 0, 0, 1, 1,
1.673049, 0.1279677, 2.174544, 1, 0, 0, 1, 1,
1.675738, -0.9047664, 2.867357, 1, 0, 0, 1, 1,
1.678693, -0.08600049, 1.911744, 1, 0, 0, 1, 1,
1.690151, 0.04938531, 2.479951, 1, 0, 0, 1, 1,
1.690816, -0.1404893, 1.923246, 0, 0, 0, 1, 1,
1.699977, -0.4147998, 3.212477, 0, 0, 0, 1, 1,
1.703338, -0.6312712, 1.231645, 0, 0, 0, 1, 1,
1.712739, 0.6451344, 1.427226, 0, 0, 0, 1, 1,
1.73756, 0.3981468, 2.194941, 0, 0, 0, 1, 1,
1.753716, -0.578795, 2.010622, 0, 0, 0, 1, 1,
1.765018, -0.3002607, 1.598664, 0, 0, 0, 1, 1,
1.76838, -0.2800621, 1.723988, 1, 1, 1, 1, 1,
1.772918, -0.0931206, 0.9455711, 1, 1, 1, 1, 1,
1.852132, 1.479492, 0.8362817, 1, 1, 1, 1, 1,
1.856339, -1.951471, 3.322534, 1, 1, 1, 1, 1,
1.868225, -0.3876597, 2.805815, 1, 1, 1, 1, 1,
1.870143, 1.501769, 0.601685, 1, 1, 1, 1, 1,
1.873844, 0.977995, 1.344341, 1, 1, 1, 1, 1,
1.878214, 0.797099, 1.238527, 1, 1, 1, 1, 1,
1.878793, -0.3940234, 2.502322, 1, 1, 1, 1, 1,
1.88708, -0.4722375, 2.887405, 1, 1, 1, 1, 1,
1.945156, 0.2786255, 1.120762, 1, 1, 1, 1, 1,
1.946176, 1.558906, 1.369064, 1, 1, 1, 1, 1,
1.951434, 1.631277, -0.62, 1, 1, 1, 1, 1,
1.965623, 0.8494718, 0.5327882, 1, 1, 1, 1, 1,
2.054621, -0.2889898, 3.66759, 1, 1, 1, 1, 1,
2.065215, 1.769719, 0.9955926, 0, 0, 1, 1, 1,
2.11004, 0.7140566, 2.509006, 1, 0, 0, 1, 1,
2.152534, 0.6997624, 1.801089, 1, 0, 0, 1, 1,
2.167955, 0.9889323, 3.130495, 1, 0, 0, 1, 1,
2.175832, -2.183473, 2.765539, 1, 0, 0, 1, 1,
2.223182, 0.9882948, 2.438207, 1, 0, 0, 1, 1,
2.22445, -0.4297017, 3.085579, 0, 0, 0, 1, 1,
2.228719, -0.5643138, 2.167878, 0, 0, 0, 1, 1,
2.318435, 0.3692813, 1.32464, 0, 0, 0, 1, 1,
2.32479, 0.275472, 0.7879424, 0, 0, 0, 1, 1,
2.344381, 0.3661588, 0.5257432, 0, 0, 0, 1, 1,
2.363421, 1.566785, 0.5654081, 0, 0, 0, 1, 1,
2.366894, -0.6479064, 1.944504, 0, 0, 0, 1, 1,
2.405516, 1.189042, -0.6748989, 1, 1, 1, 1, 1,
2.621806, 0.9307569, 1.400638, 1, 1, 1, 1, 1,
2.648531, 0.4236968, 0.8150583, 1, 1, 1, 1, 1,
2.696112, -1.047649, 2.174716, 1, 1, 1, 1, 1,
2.723787, 0.8713121, 2.292066, 1, 1, 1, 1, 1,
2.808797, 1.770061, -0.06910131, 1, 1, 1, 1, 1,
2.973007, 1.681697, 3.210577, 1, 1, 1, 1, 1
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
var radius = 9.407171;
var distance = 33.04229;
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
mvMatrix.translate( 0.1643301, 0.4520135, -0.188971 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.04229);
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