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
-3.377876, 0.09303688, -1.205644, 1, 0, 0, 1,
-3.034744, 0.2461792, -1.416163, 1, 0.007843138, 0, 1,
-3.015506, -0.511018, -1.643712, 1, 0.01176471, 0, 1,
-2.63582, 1.212536, 0.3906215, 1, 0.01960784, 0, 1,
-2.616225, -1.324907, -2.55702, 1, 0.02352941, 0, 1,
-2.515804, -0.3962078, -1.142766, 1, 0.03137255, 0, 1,
-2.485629, -0.7288078, -2.792708, 1, 0.03529412, 0, 1,
-2.395824, -0.9563982, -1.02564, 1, 0.04313726, 0, 1,
-2.392086, 0.6139427, -1.267077, 1, 0.04705882, 0, 1,
-2.387334, 0.6893041, -1.361879, 1, 0.05490196, 0, 1,
-2.371558, 0.3254111, -0.8429392, 1, 0.05882353, 0, 1,
-2.348532, -1.689202, -2.600914, 1, 0.06666667, 0, 1,
-2.348487, -0.1874573, -1.635343, 1, 0.07058824, 0, 1,
-2.338937, 0.4283013, 0.1652605, 1, 0.07843138, 0, 1,
-2.328296, -1.12405, -2.370698, 1, 0.08235294, 0, 1,
-2.315382, 1.214771, -2.95535, 1, 0.09019608, 0, 1,
-2.213658, -0.4283274, -0.7327275, 1, 0.09411765, 0, 1,
-2.208093, -1.064404, -2.289271, 1, 0.1019608, 0, 1,
-2.197648, -1.982327, -1.84511, 1, 0.1098039, 0, 1,
-2.190107, 0.6944045, -0.7886083, 1, 0.1137255, 0, 1,
-2.165377, 0.4122017, -1.704694, 1, 0.1215686, 0, 1,
-2.153603, 0.03198841, -0.7392753, 1, 0.1254902, 0, 1,
-2.130859, 1.212003, -1.26854, 1, 0.1333333, 0, 1,
-2.123181, -0.3241582, -3.225077, 1, 0.1372549, 0, 1,
-2.079537, 2.592483, -2.332435, 1, 0.145098, 0, 1,
-2.021776, 1.330556, -2.625726, 1, 0.1490196, 0, 1,
-2.01986, 0.5757266, -1.41868, 1, 0.1568628, 0, 1,
-2.018986, -0.5558912, -1.936227, 1, 0.1607843, 0, 1,
-2.011003, -0.8571155, -1.341229, 1, 0.1686275, 0, 1,
-2.006555, 0.4823873, -1.754615, 1, 0.172549, 0, 1,
-2.000441, 0.1714243, -1.215699, 1, 0.1803922, 0, 1,
-1.998971, 1.195631, -0.9411055, 1, 0.1843137, 0, 1,
-1.979409, 0.3508334, -1.395451, 1, 0.1921569, 0, 1,
-1.975469, 0.1216146, -0.2050133, 1, 0.1960784, 0, 1,
-1.967722, 0.818009, -1.81188, 1, 0.2039216, 0, 1,
-1.966574, 1.920736, 0.3365758, 1, 0.2117647, 0, 1,
-1.963006, -0.3825909, -0.279695, 1, 0.2156863, 0, 1,
-1.959144, -0.4324785, -2.414492, 1, 0.2235294, 0, 1,
-1.937124, 1.884889, -1.534338, 1, 0.227451, 0, 1,
-1.931003, 0.2835289, -0.6517503, 1, 0.2352941, 0, 1,
-1.923272, 0.3654556, -1.213849, 1, 0.2392157, 0, 1,
-1.909084, -0.987447, -2.875502, 1, 0.2470588, 0, 1,
-1.876097, 1.52341, -0.7248944, 1, 0.2509804, 0, 1,
-1.875601, 2.07276, -1.959649, 1, 0.2588235, 0, 1,
-1.855421, 0.3695244, -1.645943, 1, 0.2627451, 0, 1,
-1.830735, -2.576063, -2.478925, 1, 0.2705882, 0, 1,
-1.815374, 0.09770238, -1.147692, 1, 0.2745098, 0, 1,
-1.810901, 1.749716, -0.4962341, 1, 0.282353, 0, 1,
-1.797886, -0.5722129, 0.6922188, 1, 0.2862745, 0, 1,
-1.79043, 2.379546, -2.330216, 1, 0.2941177, 0, 1,
-1.769771, 0.6315753, -1.867887, 1, 0.3019608, 0, 1,
-1.755975, 0.3886529, -0.6640575, 1, 0.3058824, 0, 1,
-1.755208, 0.6617602, -3.432309, 1, 0.3137255, 0, 1,
-1.741049, -0.5257537, -1.260996, 1, 0.3176471, 0, 1,
-1.728713, 1.094789, -1.06089, 1, 0.3254902, 0, 1,
-1.72806, -0.06169222, -0.3509832, 1, 0.3294118, 0, 1,
-1.724113, -0.6612301, -1.237554, 1, 0.3372549, 0, 1,
-1.723151, -0.5705722, -1.144822, 1, 0.3411765, 0, 1,
-1.697468, -0.405902, -1.646284, 1, 0.3490196, 0, 1,
-1.691613, 0.5677277, -1.639069, 1, 0.3529412, 0, 1,
-1.683888, 1.85719, -0.5324637, 1, 0.3607843, 0, 1,
-1.665984, 1.018418, -0.9790708, 1, 0.3647059, 0, 1,
-1.655034, -0.1453708, -0.2746899, 1, 0.372549, 0, 1,
-1.647307, 0.3018544, -0.6553725, 1, 0.3764706, 0, 1,
-1.646315, 0.4378551, -1.845674, 1, 0.3843137, 0, 1,
-1.639805, -0.9252028, -1.089499, 1, 0.3882353, 0, 1,
-1.62939, 0.5588623, -2.236223, 1, 0.3960784, 0, 1,
-1.628388, -0.1659174, -1.311335, 1, 0.4039216, 0, 1,
-1.624604, -1.210919, -1.347528, 1, 0.4078431, 0, 1,
-1.623519, -0.7772949, -2.590204, 1, 0.4156863, 0, 1,
-1.622655, 0.354074, -1.759454, 1, 0.4196078, 0, 1,
-1.621205, -0.5455191, -1.386332, 1, 0.427451, 0, 1,
-1.609508, 0.6202961, -1.178315, 1, 0.4313726, 0, 1,
-1.575536, -0.9552057, -2.332174, 1, 0.4392157, 0, 1,
-1.573811, -0.1196542, -2.222214, 1, 0.4431373, 0, 1,
-1.563228, -0.038275, -0.8603481, 1, 0.4509804, 0, 1,
-1.533856, -1.278906, -1.649462, 1, 0.454902, 0, 1,
-1.528666, 0.1157154, 0.02164047, 1, 0.4627451, 0, 1,
-1.521467, 1.042992, -0.7233034, 1, 0.4666667, 0, 1,
-1.517694, -0.798665, -1.626825, 1, 0.4745098, 0, 1,
-1.514501, -0.3790049, -0.6980371, 1, 0.4784314, 0, 1,
-1.505372, 1.178622, -1.153145, 1, 0.4862745, 0, 1,
-1.47419, -2.309598, -2.923959, 1, 0.4901961, 0, 1,
-1.463166, -0.841119, -2.945035, 1, 0.4980392, 0, 1,
-1.45446, -0.8634332, -2.417567, 1, 0.5058824, 0, 1,
-1.45339, -1.314167, -1.053046, 1, 0.509804, 0, 1,
-1.450017, -1.265924, -3.158707, 1, 0.5176471, 0, 1,
-1.450006, -0.3430787, -0.8187152, 1, 0.5215687, 0, 1,
-1.444342, -0.6983457, -0.4997729, 1, 0.5294118, 0, 1,
-1.444239, 1.538627, -1.961776, 1, 0.5333334, 0, 1,
-1.434982, 0.7560372, -1.76869, 1, 0.5411765, 0, 1,
-1.394644, -1.109744, -3.043083, 1, 0.5450981, 0, 1,
-1.390528, 0.3583349, -2.658001, 1, 0.5529412, 0, 1,
-1.389547, -0.9174554, -3.464506, 1, 0.5568628, 0, 1,
-1.386183, -0.9300977, -3.195257, 1, 0.5647059, 0, 1,
-1.373073, 0.4037549, -1.11003, 1, 0.5686275, 0, 1,
-1.365369, 0.5574222, -1.519233, 1, 0.5764706, 0, 1,
-1.35313, -0.1315955, -2.168712, 1, 0.5803922, 0, 1,
-1.35309, 0.7782236, -0.7202817, 1, 0.5882353, 0, 1,
-1.347487, -0.3266402, -1.242506, 1, 0.5921569, 0, 1,
-1.346968, 0.1667488, -2.468843, 1, 0.6, 0, 1,
-1.346653, 0.2676902, -0.4146571, 1, 0.6078432, 0, 1,
-1.338506, -0.2670835, -0.96245, 1, 0.6117647, 0, 1,
-1.320767, 0.7292774, -1.030079, 1, 0.6196079, 0, 1,
-1.316097, 0.9684615, -1.195779, 1, 0.6235294, 0, 1,
-1.307775, -0.9087619, -2.692296, 1, 0.6313726, 0, 1,
-1.293236, 2.490421, 0.1115069, 1, 0.6352941, 0, 1,
-1.283588, -0.64087, -1.946672, 1, 0.6431373, 0, 1,
-1.28277, 0.9546633, -0.7393606, 1, 0.6470588, 0, 1,
-1.281696, -1.844836, -3.413152, 1, 0.654902, 0, 1,
-1.275815, 0.8920053, -2.068893, 1, 0.6588235, 0, 1,
-1.269265, 0.4960843, -1.28672, 1, 0.6666667, 0, 1,
-1.265498, 0.255897, -0.6323618, 1, 0.6705883, 0, 1,
-1.262411, -0.912429, -2.37843, 1, 0.6784314, 0, 1,
-1.253331, -1.110558, -0.7360033, 1, 0.682353, 0, 1,
-1.247898, -1.654978, -2.893137, 1, 0.6901961, 0, 1,
-1.246775, -0.5388542, -1.196068, 1, 0.6941177, 0, 1,
-1.239917, 0.9828673, 2.356225, 1, 0.7019608, 0, 1,
-1.236179, 0.5683281, -1.972784, 1, 0.7098039, 0, 1,
-1.232475, 0.7351447, -0.333808, 1, 0.7137255, 0, 1,
-1.205233, 1.189555, -0.6611964, 1, 0.7215686, 0, 1,
-1.187178, -0.4559556, -3.425463, 1, 0.7254902, 0, 1,
-1.186108, 0.2751565, -2.406624, 1, 0.7333333, 0, 1,
-1.18103, -0.2846682, -4.885082, 1, 0.7372549, 0, 1,
-1.177609, 0.4229598, 0.2794682, 1, 0.7450981, 0, 1,
-1.167495, -0.5771342, -1.662048, 1, 0.7490196, 0, 1,
-1.165269, -0.3731945, -0.9349568, 1, 0.7568628, 0, 1,
-1.164465, 1.479592, -0.2509885, 1, 0.7607843, 0, 1,
-1.14777, 0.5142549, -1.868014, 1, 0.7686275, 0, 1,
-1.144966, -0.07427056, -0.7795218, 1, 0.772549, 0, 1,
-1.138226, -0.2263856, -1.677542, 1, 0.7803922, 0, 1,
-1.135535, 0.1096725, -1.849318, 1, 0.7843137, 0, 1,
-1.135001, -0.2571718, -2.035793, 1, 0.7921569, 0, 1,
-1.132351, -1.003532, -2.792166, 1, 0.7960784, 0, 1,
-1.131583, -1.250618, -2.435535, 1, 0.8039216, 0, 1,
-1.127644, 0.02087136, -3.243284, 1, 0.8117647, 0, 1,
-1.117519, -0.1173567, -2.418132, 1, 0.8156863, 0, 1,
-1.11475, -0.1224746, -2.815722, 1, 0.8235294, 0, 1,
-1.110523, -0.504813, -1.155494, 1, 0.827451, 0, 1,
-1.107242, 1.069903, -0.3777151, 1, 0.8352941, 0, 1,
-1.103917, -1.447449, -4.091857, 1, 0.8392157, 0, 1,
-1.102693, -1.146616, -3.121124, 1, 0.8470588, 0, 1,
-1.100629, 0.9661708, -1.013826, 1, 0.8509804, 0, 1,
-1.09246, -0.004545851, -1.60889, 1, 0.8588235, 0, 1,
-1.086231, -0.4505602, -2.46338, 1, 0.8627451, 0, 1,
-1.085501, -0.3172035, -1.026043, 1, 0.8705882, 0, 1,
-1.083354, -2.182769, -4.988656, 1, 0.8745098, 0, 1,
-1.080725, 0.6055294, -0.9808632, 1, 0.8823529, 0, 1,
-1.074605, -0.6854689, -0.6228702, 1, 0.8862745, 0, 1,
-1.073107, 1.290668, -0.4505543, 1, 0.8941177, 0, 1,
-1.072604, 0.03430172, -3.070801, 1, 0.8980392, 0, 1,
-1.070399, -0.7837414, -2.647487, 1, 0.9058824, 0, 1,
-1.070083, -0.6219764, -3.401221, 1, 0.9137255, 0, 1,
-1.059735, 0.9312231, 0.2237434, 1, 0.9176471, 0, 1,
-1.044555, 0.9076642, -0.5583611, 1, 0.9254902, 0, 1,
-1.042327, 0.1595316, -0.8958564, 1, 0.9294118, 0, 1,
-1.039621, 0.2948768, -3.322011, 1, 0.9372549, 0, 1,
-1.032079, 1.194873, 0.3321804, 1, 0.9411765, 0, 1,
-1.028683, -0.2906333, -2.284543, 1, 0.9490196, 0, 1,
-1.022763, 0.09535554, -0.2010882, 1, 0.9529412, 0, 1,
-1.013102, -0.8707004, -2.490686, 1, 0.9607843, 0, 1,
-1.012366, -0.9505475, -2.260184, 1, 0.9647059, 0, 1,
-1.007263, -0.6986646, -1.179869, 1, 0.972549, 0, 1,
-1.00288, -1.601054, -4.730779, 1, 0.9764706, 0, 1,
-1.000286, 0.2861403, -0.564257, 1, 0.9843137, 0, 1,
-0.9999251, -1.386378, -5.616108, 1, 0.9882353, 0, 1,
-0.9919932, -1.871302, -5.196504, 1, 0.9960784, 0, 1,
-0.9893572, -1.095363, -2.028298, 0.9960784, 1, 0, 1,
-0.9803563, 0.245458, -0.05870359, 0.9921569, 1, 0, 1,
-0.9790722, 0.895005, -0.509753, 0.9843137, 1, 0, 1,
-0.9776668, -0.1886597, -1.187698, 0.9803922, 1, 0, 1,
-0.9738902, -0.1539023, -1.297338, 0.972549, 1, 0, 1,
-0.9706435, 0.1363773, -3.373811, 0.9686275, 1, 0, 1,
-0.9692277, 2.466427, 0.7745455, 0.9607843, 1, 0, 1,
-0.9618742, -1.01218, -2.621952, 0.9568627, 1, 0, 1,
-0.9562017, -0.6463758, -2.839458, 0.9490196, 1, 0, 1,
-0.9518296, 0.5874614, -3.375611, 0.945098, 1, 0, 1,
-0.9414122, 0.893996, -0.2654352, 0.9372549, 1, 0, 1,
-0.9353065, -0.5877264, -3.341326, 0.9333333, 1, 0, 1,
-0.9332017, -2.14886, -1.115863, 0.9254902, 1, 0, 1,
-0.9330548, -0.2903174, -2.973557, 0.9215686, 1, 0, 1,
-0.9105124, -1.220492, -2.339448, 0.9137255, 1, 0, 1,
-0.9049008, -0.05962454, -1.822757, 0.9098039, 1, 0, 1,
-0.9048434, 0.7068875, -1.162213, 0.9019608, 1, 0, 1,
-0.9038734, -0.05834799, 0.2846079, 0.8941177, 1, 0, 1,
-0.8896471, 1.919856, -0.5437061, 0.8901961, 1, 0, 1,
-0.887831, -0.6776213, -2.946082, 0.8823529, 1, 0, 1,
-0.8838237, -0.08199201, -2.174139, 0.8784314, 1, 0, 1,
-0.8807347, -0.9194081, -4.89902, 0.8705882, 1, 0, 1,
-0.8754844, 0.02752791, -0.718237, 0.8666667, 1, 0, 1,
-0.8651898, -1.040244, -0.3428474, 0.8588235, 1, 0, 1,
-0.8600897, -1.683878, -0.1948658, 0.854902, 1, 0, 1,
-0.8588315, 0.6132475, -1.214161, 0.8470588, 1, 0, 1,
-0.8567408, -0.009646681, -1.68611, 0.8431373, 1, 0, 1,
-0.8531853, 0.7031744, -0.1918547, 0.8352941, 1, 0, 1,
-0.8527515, -0.1160285, -1.233641, 0.8313726, 1, 0, 1,
-0.8513546, -0.7348524, -1.179218, 0.8235294, 1, 0, 1,
-0.8353012, -1.824385, -3.630208, 0.8196079, 1, 0, 1,
-0.8342958, -0.5291064, -2.824073, 0.8117647, 1, 0, 1,
-0.8321854, -0.07406651, 0.3194033, 0.8078431, 1, 0, 1,
-0.8317447, -0.6906643, -2.079833, 0.8, 1, 0, 1,
-0.8310791, -0.07125061, -0.9193514, 0.7921569, 1, 0, 1,
-0.8274489, 0.6110798, -1.348433, 0.7882353, 1, 0, 1,
-0.826026, -1.029572, -2.796947, 0.7803922, 1, 0, 1,
-0.8247725, -1.930529, -3.11526, 0.7764706, 1, 0, 1,
-0.8191659, 1.10758, -0.4968597, 0.7686275, 1, 0, 1,
-0.8070921, 0.9284683, -0.314402, 0.7647059, 1, 0, 1,
-0.8068857, 1.119167, -1.344017, 0.7568628, 1, 0, 1,
-0.7843859, -0.08278356, -2.18933, 0.7529412, 1, 0, 1,
-0.7835757, -0.7955132, -1.879885, 0.7450981, 1, 0, 1,
-0.7835096, 0.7211505, -2.183273, 0.7411765, 1, 0, 1,
-0.7823153, 0.778114, -0.9360904, 0.7333333, 1, 0, 1,
-0.7776164, 1.420901, -2.143909, 0.7294118, 1, 0, 1,
-0.7739581, -0.1850889, -3.133034, 0.7215686, 1, 0, 1,
-0.766494, -0.3568336, -2.873667, 0.7176471, 1, 0, 1,
-0.7616696, 1.964298, -0.6854264, 0.7098039, 1, 0, 1,
-0.7561893, 0.8937345, 0.227384, 0.7058824, 1, 0, 1,
-0.7560784, -0.0263792, -1.420905, 0.6980392, 1, 0, 1,
-0.7545325, -2.58107, -3.138024, 0.6901961, 1, 0, 1,
-0.7543991, -0.1162191, -1.017439, 0.6862745, 1, 0, 1,
-0.7516935, -0.7292343, -3.10289, 0.6784314, 1, 0, 1,
-0.7451933, -0.4446865, -1.955182, 0.6745098, 1, 0, 1,
-0.7444173, 0.6549317, -1.83338, 0.6666667, 1, 0, 1,
-0.744341, -1.840491, -3.009401, 0.6627451, 1, 0, 1,
-0.741914, -1.384726, -1.13455, 0.654902, 1, 0, 1,
-0.7415881, -0.06783188, 0.1792966, 0.6509804, 1, 0, 1,
-0.7388372, -0.5698804, -2.923451, 0.6431373, 1, 0, 1,
-0.7369542, 2.16464, -0.3311154, 0.6392157, 1, 0, 1,
-0.7337461, -0.1039705, -2.911949, 0.6313726, 1, 0, 1,
-0.7334698, -0.7596828, -3.260369, 0.627451, 1, 0, 1,
-0.7303057, -0.005851691, -0.105123, 0.6196079, 1, 0, 1,
-0.7297009, 0.7506295, 0.8123538, 0.6156863, 1, 0, 1,
-0.7258899, -0.3309705, -0.8610047, 0.6078432, 1, 0, 1,
-0.7189968, 0.08733714, -1.598711, 0.6039216, 1, 0, 1,
-0.7178774, 2.478685, -0.281936, 0.5960785, 1, 0, 1,
-0.71675, 0.006459085, -0.7499807, 0.5882353, 1, 0, 1,
-0.7156096, -0.7963269, -1.932517, 0.5843138, 1, 0, 1,
-0.7142227, -0.5157257, -2.804831, 0.5764706, 1, 0, 1,
-0.7103506, -0.9058197, -2.772779, 0.572549, 1, 0, 1,
-0.7092375, -0.7177738, -2.211274, 0.5647059, 1, 0, 1,
-0.7086171, 0.1350465, -2.595763, 0.5607843, 1, 0, 1,
-0.7049392, 0.6420348, -0.870562, 0.5529412, 1, 0, 1,
-0.6963928, 1.180445, -1.172611, 0.5490196, 1, 0, 1,
-0.6949726, -1.655722, -3.541816, 0.5411765, 1, 0, 1,
-0.694075, -0.3884819, -1.511609, 0.5372549, 1, 0, 1,
-0.6934869, -1.175463, -2.038996, 0.5294118, 1, 0, 1,
-0.6915528, -0.4421156, -1.677469, 0.5254902, 1, 0, 1,
-0.6888314, 1.348258, -0.6148606, 0.5176471, 1, 0, 1,
-0.6868917, -1.175299, -3.497435, 0.5137255, 1, 0, 1,
-0.6838712, -0.1497058, -1.548401, 0.5058824, 1, 0, 1,
-0.6821536, 1.606271, -1.609389, 0.5019608, 1, 0, 1,
-0.6780772, -0.5482823, -0.7361655, 0.4941176, 1, 0, 1,
-0.6653084, -1.454561, -0.5838979, 0.4862745, 1, 0, 1,
-0.6576272, -0.3492556, -4.365723, 0.4823529, 1, 0, 1,
-0.6528257, 0.9174441, -1.089358, 0.4745098, 1, 0, 1,
-0.6516902, -0.5590018, -1.575756, 0.4705882, 1, 0, 1,
-0.6408266, 1.781626, 0.1119502, 0.4627451, 1, 0, 1,
-0.6277082, 0.199643, -0.1732888, 0.4588235, 1, 0, 1,
-0.6136313, 1.175225, 0.4962393, 0.4509804, 1, 0, 1,
-0.611231, -0.8224683, -2.789784, 0.4470588, 1, 0, 1,
-0.6104775, 0.2662733, 1.188012, 0.4392157, 1, 0, 1,
-0.5993311, 1.348081, -0.1987686, 0.4352941, 1, 0, 1,
-0.5977367, 1.064, -1.057754, 0.427451, 1, 0, 1,
-0.5768313, 0.5396696, -1.478539, 0.4235294, 1, 0, 1,
-0.5767914, -0.3210565, -0.3016217, 0.4156863, 1, 0, 1,
-0.5748159, -0.6118794, -1.710455, 0.4117647, 1, 0, 1,
-0.5730577, -0.1731758, -2.086566, 0.4039216, 1, 0, 1,
-0.5722097, -1.347496, -2.791995, 0.3960784, 1, 0, 1,
-0.5701541, 0.3767124, -0.5311766, 0.3921569, 1, 0, 1,
-0.5673751, 0.2397579, -2.913153, 0.3843137, 1, 0, 1,
-0.5660382, 0.02966414, -2.936764, 0.3803922, 1, 0, 1,
-0.565395, 0.5972635, 0.1692474, 0.372549, 1, 0, 1,
-0.5621436, 0.110636, -0.1078122, 0.3686275, 1, 0, 1,
-0.5561821, 0.6127615, -0.927259, 0.3607843, 1, 0, 1,
-0.5544336, 0.449914, -0.6032683, 0.3568628, 1, 0, 1,
-0.553625, -0.1279514, -1.228879, 0.3490196, 1, 0, 1,
-0.5516699, 0.09431009, -0.1955679, 0.345098, 1, 0, 1,
-0.5383983, -0.01793229, -1.71789, 0.3372549, 1, 0, 1,
-0.5353317, 0.3408966, -0.1228966, 0.3333333, 1, 0, 1,
-0.5334059, 1.935449, -0.2449058, 0.3254902, 1, 0, 1,
-0.5311568, -1.581264, -1.737074, 0.3215686, 1, 0, 1,
-0.5298907, 1.558884, -0.5069544, 0.3137255, 1, 0, 1,
-0.5260596, -0.3425356, -2.603874, 0.3098039, 1, 0, 1,
-0.5235516, -1.932483, -2.037194, 0.3019608, 1, 0, 1,
-0.5231242, 1.184903, 0.6010947, 0.2941177, 1, 0, 1,
-0.5197621, -2.051252, -1.837768, 0.2901961, 1, 0, 1,
-0.5184135, -1.25275, -2.238692, 0.282353, 1, 0, 1,
-0.5143822, 0.5457278, -3.245845, 0.2784314, 1, 0, 1,
-0.5141478, -0.9729475, -1.865075, 0.2705882, 1, 0, 1,
-0.5122328, 0.686361, -0.1460673, 0.2666667, 1, 0, 1,
-0.5114064, 1.910485, -0.8396276, 0.2588235, 1, 0, 1,
-0.5089585, 0.8734476, -1.869177, 0.254902, 1, 0, 1,
-0.5083392, -0.1379502, -3.777477, 0.2470588, 1, 0, 1,
-0.5068445, 0.3872534, -1.372667, 0.2431373, 1, 0, 1,
-0.5062949, -0.2785843, -1.059974, 0.2352941, 1, 0, 1,
-0.5040851, -0.3331806, -3.640774, 0.2313726, 1, 0, 1,
-0.5010792, 0.2573765, -0.3225424, 0.2235294, 1, 0, 1,
-0.4980291, -1.649637, -1.8035, 0.2196078, 1, 0, 1,
-0.4969533, 0.5101812, -0.7507424, 0.2117647, 1, 0, 1,
-0.4941731, 0.8175286, -0.07924314, 0.2078431, 1, 0, 1,
-0.4913439, -0.06523802, -2.818877, 0.2, 1, 0, 1,
-0.4884329, -0.335541, -0.09880595, 0.1921569, 1, 0, 1,
-0.4869246, -0.7868671, -3.852175, 0.1882353, 1, 0, 1,
-0.4864737, -1.930828, -2.418888, 0.1803922, 1, 0, 1,
-0.4854702, 2.296062, -0.5431348, 0.1764706, 1, 0, 1,
-0.4817758, 0.7280596, -0.3019493, 0.1686275, 1, 0, 1,
-0.4807644, -0.5975481, -0.7326209, 0.1647059, 1, 0, 1,
-0.4805844, -0.209862, -1.530874, 0.1568628, 1, 0, 1,
-0.4803774, -0.5726852, -2.193205, 0.1529412, 1, 0, 1,
-0.4788563, -0.4201961, -2.215067, 0.145098, 1, 0, 1,
-0.4734352, -1.872869, -2.080901, 0.1411765, 1, 0, 1,
-0.4718959, -0.3708455, -1.660091, 0.1333333, 1, 0, 1,
-0.4633698, 1.119239, 0.2543326, 0.1294118, 1, 0, 1,
-0.462938, 0.1913428, -1.281594, 0.1215686, 1, 0, 1,
-0.4628532, 1.154419, 0.6624973, 0.1176471, 1, 0, 1,
-0.460033, -0.5789236, -1.696457, 0.1098039, 1, 0, 1,
-0.4520622, -2.978714, -2.198922, 0.1058824, 1, 0, 1,
-0.4507843, -0.007485616, -0.6109721, 0.09803922, 1, 0, 1,
-0.4500543, -0.7159076, -2.93887, 0.09019608, 1, 0, 1,
-0.4496416, -1.61903, -3.476723, 0.08627451, 1, 0, 1,
-0.4494904, 0.5868248, 1.927374, 0.07843138, 1, 0, 1,
-0.4472441, -0.93929, -3.12547, 0.07450981, 1, 0, 1,
-0.4434223, -1.081604, -3.190963, 0.06666667, 1, 0, 1,
-0.4407277, 0.7071165, -0.5177727, 0.0627451, 1, 0, 1,
-0.4352076, -0.2855091, -1.521869, 0.05490196, 1, 0, 1,
-0.4288029, -0.9815976, -3.419544, 0.05098039, 1, 0, 1,
-0.4278895, 1.157296, -0.6308875, 0.04313726, 1, 0, 1,
-0.4221182, 0.3913879, -0.6761318, 0.03921569, 1, 0, 1,
-0.4209225, -0.4522285, -3.227726, 0.03137255, 1, 0, 1,
-0.4171129, 0.1684748, -1.380801, 0.02745098, 1, 0, 1,
-0.4153573, -1.874747, -3.230968, 0.01960784, 1, 0, 1,
-0.4152343, -0.8522564, -3.296642, 0.01568628, 1, 0, 1,
-0.413893, -0.6128746, -1.061955, 0.007843138, 1, 0, 1,
-0.4117359, -1.324265, -2.197826, 0.003921569, 1, 0, 1,
-0.4100426, 1.019791, -0.7532328, 0, 1, 0.003921569, 1,
-0.4072691, 0.9585824, 0.08748502, 0, 1, 0.01176471, 1,
-0.4049794, -0.04976238, 0.1787563, 0, 1, 0.01568628, 1,
-0.4037901, -1.159152, -2.731592, 0, 1, 0.02352941, 1,
-0.4030313, -1.965507, -1.832888, 0, 1, 0.02745098, 1,
-0.3983285, -0.07501642, -2.972317, 0, 1, 0.03529412, 1,
-0.3976769, 0.6204674, -1.277867, 0, 1, 0.03921569, 1,
-0.3975827, -0.09584741, -2.552059, 0, 1, 0.04705882, 1,
-0.3971981, -0.2020152, -1.892011, 0, 1, 0.05098039, 1,
-0.3956124, -0.7481316, -2.252119, 0, 1, 0.05882353, 1,
-0.3952285, 1.7344, -0.1462178, 0, 1, 0.0627451, 1,
-0.3910843, 1.063798, -0.08760598, 0, 1, 0.07058824, 1,
-0.3873349, -0.9358909, -2.52152, 0, 1, 0.07450981, 1,
-0.3838806, 1.235362, 1.897172, 0, 1, 0.08235294, 1,
-0.383334, 1.820431, 0.3385809, 0, 1, 0.08627451, 1,
-0.3714214, 1.16415, 0.2116297, 0, 1, 0.09411765, 1,
-0.365604, 0.006208927, -2.604589, 0, 1, 0.1019608, 1,
-0.3592018, 0.8301931, 0.08856598, 0, 1, 0.1058824, 1,
-0.3563279, -0.937283, -3.63716, 0, 1, 0.1137255, 1,
-0.3557859, 1.714353, -2.335275, 0, 1, 0.1176471, 1,
-0.3554158, 0.3428112, -1.433793, 0, 1, 0.1254902, 1,
-0.3529951, -0.1926938, -3.41301, 0, 1, 0.1294118, 1,
-0.3527013, -1.256988, -1.649928, 0, 1, 0.1372549, 1,
-0.3484674, 0.6968144, 0.3528875, 0, 1, 0.1411765, 1,
-0.348, -0.05306547, -1.430244, 0, 1, 0.1490196, 1,
-0.347887, -1.058606, -2.854209, 0, 1, 0.1529412, 1,
-0.3447472, 0.3896666, -1.624106, 0, 1, 0.1607843, 1,
-0.3438673, -0.5435901, -0.6038308, 0, 1, 0.1647059, 1,
-0.3430021, 0.9944115, 1.442323, 0, 1, 0.172549, 1,
-0.3397091, -1.06873, -4.671154, 0, 1, 0.1764706, 1,
-0.3384264, 0.02760973, -1.061676, 0, 1, 0.1843137, 1,
-0.3381036, -0.6124234, -0.5580267, 0, 1, 0.1882353, 1,
-0.335093, 0.171579, 0.4807898, 0, 1, 0.1960784, 1,
-0.3273999, -1.85823, -3.303988, 0, 1, 0.2039216, 1,
-0.3232596, 0.7450032, 1.331245, 0, 1, 0.2078431, 1,
-0.3221009, 0.8893284, -0.7746408, 0, 1, 0.2156863, 1,
-0.3134795, -0.276929, -2.874772, 0, 1, 0.2196078, 1,
-0.3134642, 0.9793777, -0.3916535, 0, 1, 0.227451, 1,
-0.3112768, -2.047748, -2.869586, 0, 1, 0.2313726, 1,
-0.3105584, -1.018529, -2.037144, 0, 1, 0.2392157, 1,
-0.3072691, -1.838087, -3.048641, 0, 1, 0.2431373, 1,
-0.3062022, -1.004781, -3.290445, 0, 1, 0.2509804, 1,
-0.3047744, -0.5002292, -2.478959, 0, 1, 0.254902, 1,
-0.3030078, -0.8725342, -2.830178, 0, 1, 0.2627451, 1,
-0.3027937, 0.1073899, -2.085534, 0, 1, 0.2666667, 1,
-0.3004502, -1.122771, -0.7771262, 0, 1, 0.2745098, 1,
-0.3000387, -0.8873259, -1.879992, 0, 1, 0.2784314, 1,
-0.2991973, -1.728972, -1.952655, 0, 1, 0.2862745, 1,
-0.2962732, -0.04955563, -2.855338, 0, 1, 0.2901961, 1,
-0.2957712, -1.139, -2.93108, 0, 1, 0.2980392, 1,
-0.2936857, -0.5100208, -2.052342, 0, 1, 0.3058824, 1,
-0.2933505, -0.2511013, -1.344075, 0, 1, 0.3098039, 1,
-0.2927157, 0.0492609, -2.722194, 0, 1, 0.3176471, 1,
-0.2896679, -1.240676, -3.6633, 0, 1, 0.3215686, 1,
-0.2857572, 1.530604, -1.149766, 0, 1, 0.3294118, 1,
-0.2839888, 2.881068, -1.47309, 0, 1, 0.3333333, 1,
-0.283555, 1.414509, 0.02954466, 0, 1, 0.3411765, 1,
-0.2826478, -1.686808, -2.198735, 0, 1, 0.345098, 1,
-0.2765679, 0.2748254, -1.39235, 0, 1, 0.3529412, 1,
-0.2565634, -0.487509, -2.403884, 0, 1, 0.3568628, 1,
-0.2469703, 0.2583016, -1.619692, 0, 1, 0.3647059, 1,
-0.2459396, 0.01453391, 0.9737622, 0, 1, 0.3686275, 1,
-0.2442767, -1.408571, -3.182021, 0, 1, 0.3764706, 1,
-0.2338115, 0.02376894, -0.004757059, 0, 1, 0.3803922, 1,
-0.2323398, -0.096558, -3.196991, 0, 1, 0.3882353, 1,
-0.2255883, -0.5875961, -3.484187, 0, 1, 0.3921569, 1,
-0.2239186, 1.200125, 0.4106468, 0, 1, 0.4, 1,
-0.2200625, 0.5234425, -2.002744, 0, 1, 0.4078431, 1,
-0.2179684, 0.7443421, -0.01382897, 0, 1, 0.4117647, 1,
-0.216491, 0.6771646, -0.1363756, 0, 1, 0.4196078, 1,
-0.2158011, 1.47508, -0.5484576, 0, 1, 0.4235294, 1,
-0.2124268, 0.05526036, -1.402766, 0, 1, 0.4313726, 1,
-0.2087926, 0.5065911, -1.166561, 0, 1, 0.4352941, 1,
-0.2084388, 1.542418, -0.476749, 0, 1, 0.4431373, 1,
-0.2050308, 1.112248, -0.2797358, 0, 1, 0.4470588, 1,
-0.2026398, 0.4855207, 0.1812187, 0, 1, 0.454902, 1,
-0.2020609, -0.01289073, -0.9431334, 0, 1, 0.4588235, 1,
-0.2012817, 1.972035, -0.984975, 0, 1, 0.4666667, 1,
-0.2004247, -2.674261, -1.280859, 0, 1, 0.4705882, 1,
-0.1986807, -1.074365, -4.964165, 0, 1, 0.4784314, 1,
-0.191672, -0.6247544, -3.387569, 0, 1, 0.4823529, 1,
-0.1897453, 0.7669175, 0.9720149, 0, 1, 0.4901961, 1,
-0.1890969, 0.9960328, -2.376884, 0, 1, 0.4941176, 1,
-0.1881652, -0.1778773, -4.637436, 0, 1, 0.5019608, 1,
-0.1870556, -0.2067468, -0.9144209, 0, 1, 0.509804, 1,
-0.1849612, 0.79618, 0.5572547, 0, 1, 0.5137255, 1,
-0.1838873, -1.194289, -4.250465, 0, 1, 0.5215687, 1,
-0.182294, -0.3176329, -3.308464, 0, 1, 0.5254902, 1,
-0.1791879, -1.413264, -1.276676, 0, 1, 0.5333334, 1,
-0.1783646, 1.014925, 0.05988928, 0, 1, 0.5372549, 1,
-0.176669, -0.6168311, -3.384916, 0, 1, 0.5450981, 1,
-0.1742959, -1.217598, -3.749549, 0, 1, 0.5490196, 1,
-0.1693839, 1.383729, 0.02786454, 0, 1, 0.5568628, 1,
-0.169224, 0.1682152, -1.977638, 0, 1, 0.5607843, 1,
-0.16468, -0.3154331, -2.736281, 0, 1, 0.5686275, 1,
-0.1596355, -1.060741, -1.690114, 0, 1, 0.572549, 1,
-0.1533042, 0.2746489, -0.1373533, 0, 1, 0.5803922, 1,
-0.1515848, -0.3478348, -5.429912, 0, 1, 0.5843138, 1,
-0.1475295, 2.125075, -0.2810643, 0, 1, 0.5921569, 1,
-0.142978, -0.2682606, -0.438882, 0, 1, 0.5960785, 1,
-0.1377953, 0.5381517, 0.6696132, 0, 1, 0.6039216, 1,
-0.1360676, -1.288462, -3.310077, 0, 1, 0.6117647, 1,
-0.135019, -0.2678597, -1.284854, 0, 1, 0.6156863, 1,
-0.1313118, -0.751458, -1.981597, 0, 1, 0.6235294, 1,
-0.1311866, -1.164839, -2.590809, 0, 1, 0.627451, 1,
-0.1280287, -0.9482896, -3.162702, 0, 1, 0.6352941, 1,
-0.122238, -0.8771461, -4.08259, 0, 1, 0.6392157, 1,
-0.1207544, 0.5468168, -0.5559739, 0, 1, 0.6470588, 1,
-0.1195783, 0.8401887, 0.0927458, 0, 1, 0.6509804, 1,
-0.1168798, -0.6314157, -4.047204, 0, 1, 0.6588235, 1,
-0.1167631, 0.1633292, 1.429442, 0, 1, 0.6627451, 1,
-0.1130526, 0.8519804, 1.222081, 0, 1, 0.6705883, 1,
-0.1114847, -0.3131285, -3.852108, 0, 1, 0.6745098, 1,
-0.110724, 0.05249421, -0.4108216, 0, 1, 0.682353, 1,
-0.1100532, 0.9660248, -1.356849, 0, 1, 0.6862745, 1,
-0.1098954, -1.836329, -3.163453, 0, 1, 0.6941177, 1,
-0.1069705, -0.6467389, -3.836771, 0, 1, 0.7019608, 1,
-0.1064153, -0.645538, -2.20503, 0, 1, 0.7058824, 1,
-0.104046, -0.747771, -2.290277, 0, 1, 0.7137255, 1,
-0.1019743, -1.122173, -4.903058, 0, 1, 0.7176471, 1,
-0.1005466, 0.2983254, -0.02478253, 0, 1, 0.7254902, 1,
-0.09907752, -1.261495, -0.5957838, 0, 1, 0.7294118, 1,
-0.09905984, 0.4120756, -0.4690339, 0, 1, 0.7372549, 1,
-0.09700365, -1.139457, -1.624581, 0, 1, 0.7411765, 1,
-0.09511179, -0.9008967, -3.082069, 0, 1, 0.7490196, 1,
-0.09304962, -0.5544989, -1.659763, 0, 1, 0.7529412, 1,
-0.09283528, 0.4272603, -1.267679, 0, 1, 0.7607843, 1,
-0.09257665, 0.8569613, 0.654044, 0, 1, 0.7647059, 1,
-0.09228417, -0.8085771, -3.594826, 0, 1, 0.772549, 1,
-0.08812872, 1.924924, 0.2779489, 0, 1, 0.7764706, 1,
-0.08737989, -1.56819, -2.554423, 0, 1, 0.7843137, 1,
-0.08681113, -0.7615442, -3.602524, 0, 1, 0.7882353, 1,
-0.08380312, -0.9870949, -3.755206, 0, 1, 0.7960784, 1,
-0.08153518, 0.3492219, -0.3981566, 0, 1, 0.8039216, 1,
-0.07940644, 0.7165833, -1.138268, 0, 1, 0.8078431, 1,
-0.07858031, 0.76272, -1.507545, 0, 1, 0.8156863, 1,
-0.07714142, 1.299275, -0.6215848, 0, 1, 0.8196079, 1,
-0.07066805, 0.8418638, -1.171525, 0, 1, 0.827451, 1,
-0.07002788, 1.560946, -0.7556521, 0, 1, 0.8313726, 1,
-0.06874292, 1.016715, -0.4208973, 0, 1, 0.8392157, 1,
-0.06820988, -0.2239458, -2.020974, 0, 1, 0.8431373, 1,
-0.06815802, -0.374775, -2.392404, 0, 1, 0.8509804, 1,
-0.06785429, 0.2926823, -2.051937, 0, 1, 0.854902, 1,
-0.06727201, 0.9015064, -1.781515, 0, 1, 0.8627451, 1,
-0.0649633, -0.4894472, -2.188201, 0, 1, 0.8666667, 1,
-0.06495243, 1.9656, 1.513929, 0, 1, 0.8745098, 1,
-0.06238917, 0.06707677, -1.505384, 0, 1, 0.8784314, 1,
-0.05720779, 0.5702039, 0.5320182, 0, 1, 0.8862745, 1,
-0.05627725, -0.8915107, -2.873642, 0, 1, 0.8901961, 1,
-0.04336785, 0.02173199, -3.614973, 0, 1, 0.8980392, 1,
-0.03887422, 0.4128246, -0.9158058, 0, 1, 0.9058824, 1,
-0.0354392, -0.4265586, -2.609918, 0, 1, 0.9098039, 1,
-0.02954287, 0.4806732, -2.420106, 0, 1, 0.9176471, 1,
-0.02225473, 2.213196, -0.6845505, 0, 1, 0.9215686, 1,
-0.01102905, 0.313102, 0.4629486, 0, 1, 0.9294118, 1,
-0.001127077, 0.9170573, -1.733439, 0, 1, 0.9333333, 1,
0.001149207, -0.5578544, 2.846494, 0, 1, 0.9411765, 1,
0.006328485, 0.906732, 0.2787616, 0, 1, 0.945098, 1,
0.006898402, -1.457361, 4.826212, 0, 1, 0.9529412, 1,
0.00740943, 0.8365805, -0.1881813, 0, 1, 0.9568627, 1,
0.009884638, 0.951259, -1.372231, 0, 1, 0.9647059, 1,
0.01042159, -1.294902, 2.446106, 0, 1, 0.9686275, 1,
0.01376918, -0.6394891, 1.462133, 0, 1, 0.9764706, 1,
0.01416954, -0.3337193, 2.745468, 0, 1, 0.9803922, 1,
0.01419096, 2.362697, -0.7672089, 0, 1, 0.9882353, 1,
0.01942133, -1.386808, 1.547971, 0, 1, 0.9921569, 1,
0.02040355, -0.2190731, 1.190495, 0, 1, 1, 1,
0.02255172, -0.3996935, 2.210006, 0, 0.9921569, 1, 1,
0.02599179, 0.6498992, -0.02949913, 0, 0.9882353, 1, 1,
0.02620327, -1.29304, 4.397215, 0, 0.9803922, 1, 1,
0.0284211, 1.843675, 0.02851015, 0, 0.9764706, 1, 1,
0.02978172, -1.02833, 2.986326, 0, 0.9686275, 1, 1,
0.03054133, 0.4024062, -1.28176, 0, 0.9647059, 1, 1,
0.0319593, -0.7840527, 1.698556, 0, 0.9568627, 1, 1,
0.0358281, 1.215632, 0.2548028, 0, 0.9529412, 1, 1,
0.03659759, -0.8788509, 3.515292, 0, 0.945098, 1, 1,
0.03821525, 0.2985635, -0.4659438, 0, 0.9411765, 1, 1,
0.03914486, 1.39124, 0.1880366, 0, 0.9333333, 1, 1,
0.04042761, 0.9166995, 0.6502473, 0, 0.9294118, 1, 1,
0.04360431, -1.266968, 2.013183, 0, 0.9215686, 1, 1,
0.0438859, -0.9861972, 4.307605, 0, 0.9176471, 1, 1,
0.04469752, -0.3457599, 1.256145, 0, 0.9098039, 1, 1,
0.04576721, -0.605866, 3.289897, 0, 0.9058824, 1, 1,
0.04585644, -1.436049, 3.005289, 0, 0.8980392, 1, 1,
0.04596009, 0.5620574, 0.5973952, 0, 0.8901961, 1, 1,
0.04745825, -0.4851841, 2.896023, 0, 0.8862745, 1, 1,
0.04802852, -0.3217463, 2.182883, 0, 0.8784314, 1, 1,
0.05035941, -1.332684, 1.5259, 0, 0.8745098, 1, 1,
0.05613009, -1.040356, 3.289884, 0, 0.8666667, 1, 1,
0.05618615, -0.08361523, 2.454479, 0, 0.8627451, 1, 1,
0.05906903, 0.08507577, 0.1630892, 0, 0.854902, 1, 1,
0.061328, -0.1880675, 3.778869, 0, 0.8509804, 1, 1,
0.06677965, 1.632014, 1.596441, 0, 0.8431373, 1, 1,
0.07310687, -0.523402, 1.385214, 0, 0.8392157, 1, 1,
0.07703403, -0.9153154, 3.467011, 0, 0.8313726, 1, 1,
0.0775651, 0.9644243, -0.5542623, 0, 0.827451, 1, 1,
0.07906397, 0.09754066, 1.638404, 0, 0.8196079, 1, 1,
0.08282977, 1.185975, -0.6736961, 0, 0.8156863, 1, 1,
0.08464345, -0.1751381, 1.460059, 0, 0.8078431, 1, 1,
0.0905847, 0.2731314, -0.6088837, 0, 0.8039216, 1, 1,
0.0908742, -0.7061531, 2.848477, 0, 0.7960784, 1, 1,
0.09436645, -0.9477974, 4.064129, 0, 0.7882353, 1, 1,
0.09474658, 1.089447, 1.330128, 0, 0.7843137, 1, 1,
0.0950523, -0.5380552, 3.212456, 0, 0.7764706, 1, 1,
0.09538118, 0.394923, -0.04842921, 0, 0.772549, 1, 1,
0.100353, -1.291592, 2.407351, 0, 0.7647059, 1, 1,
0.1019078, 0.9257625, -0.7437661, 0, 0.7607843, 1, 1,
0.1037003, 0.01715768, 2.494693, 0, 0.7529412, 1, 1,
0.1053742, -0.6716141, 4.034127, 0, 0.7490196, 1, 1,
0.107595, 0.9862528, -0.3464613, 0, 0.7411765, 1, 1,
0.1103376, 0.2149108, 1.2177, 0, 0.7372549, 1, 1,
0.1158751, 0.1194125, 0.8933139, 0, 0.7294118, 1, 1,
0.11767, -0.2912625, 3.431431, 0, 0.7254902, 1, 1,
0.1206077, 0.2375285, -0.07247116, 0, 0.7176471, 1, 1,
0.1244102, 0.6821967, -1.728507, 0, 0.7137255, 1, 1,
0.1248662, -0.1137546, 0.997032, 0, 0.7058824, 1, 1,
0.1259538, -2.170474, 1.479042, 0, 0.6980392, 1, 1,
0.1262625, 1.659209, 2.002589, 0, 0.6941177, 1, 1,
0.1274216, 0.5292277, 0.5827799, 0, 0.6862745, 1, 1,
0.1312872, -0.7821739, 3.967294, 0, 0.682353, 1, 1,
0.1317546, -1.255669, 1.967329, 0, 0.6745098, 1, 1,
0.1356134, 1.561393, -1.463759, 0, 0.6705883, 1, 1,
0.1366867, 1.102428, 1.436528, 0, 0.6627451, 1, 1,
0.1383936, 1.056036, -0.3524481, 0, 0.6588235, 1, 1,
0.1416605, -0.4919951, 3.84816, 0, 0.6509804, 1, 1,
0.144162, 1.166436, 2.459928, 0, 0.6470588, 1, 1,
0.1452688, 1.843591, 1.684632, 0, 0.6392157, 1, 1,
0.1482726, 1.094087, 0.3584427, 0, 0.6352941, 1, 1,
0.151652, -1.329921, 2.552716, 0, 0.627451, 1, 1,
0.1518271, 0.3654577, -0.1086978, 0, 0.6235294, 1, 1,
0.1554372, 0.06760497, -0.3230604, 0, 0.6156863, 1, 1,
0.155886, -0.6401625, 2.231341, 0, 0.6117647, 1, 1,
0.1560656, 0.5778562, -1.268239, 0, 0.6039216, 1, 1,
0.1620845, -0.8218029, 2.006147, 0, 0.5960785, 1, 1,
0.1655311, 1.126937, -0.2757935, 0, 0.5921569, 1, 1,
0.1681625, -0.1444707, -0.1229945, 0, 0.5843138, 1, 1,
0.1779067, -0.9476718, 1.453556, 0, 0.5803922, 1, 1,
0.1819518, -0.07876131, 1.314023, 0, 0.572549, 1, 1,
0.1837486, -0.5352474, 3.989525, 0, 0.5686275, 1, 1,
0.1879159, 0.7292066, 0.941786, 0, 0.5607843, 1, 1,
0.1925686, -0.4348413, 5.152277, 0, 0.5568628, 1, 1,
0.1938439, 0.412573, 1.459032, 0, 0.5490196, 1, 1,
0.1948378, 0.9490881, -0.1820349, 0, 0.5450981, 1, 1,
0.1964366, 0.01280325, -0.1061617, 0, 0.5372549, 1, 1,
0.1976624, -0.6140207, 3.481149, 0, 0.5333334, 1, 1,
0.1984327, 1.308636, -1.027173, 0, 0.5254902, 1, 1,
0.1993399, 0.2602357, -1.444304, 0, 0.5215687, 1, 1,
0.2030151, -0.8088635, 4.005275, 0, 0.5137255, 1, 1,
0.2032304, 2.214621, -0.3775111, 0, 0.509804, 1, 1,
0.203694, 0.2484684, 0.9951672, 0, 0.5019608, 1, 1,
0.2056128, 2.463794, -1.517235, 0, 0.4941176, 1, 1,
0.2148818, -1.063948, 1.02487, 0, 0.4901961, 1, 1,
0.2187607, 1.470656, 0.8618302, 0, 0.4823529, 1, 1,
0.2218501, 0.2874334, -0.1707419, 0, 0.4784314, 1, 1,
0.2257717, -0.2845114, 2.423973, 0, 0.4705882, 1, 1,
0.2283778, -0.1883881, 3.461792, 0, 0.4666667, 1, 1,
0.2290182, 0.510083, 0.9091467, 0, 0.4588235, 1, 1,
0.2292938, 0.07612674, 0.6745367, 0, 0.454902, 1, 1,
0.2325636, -0.3246436, 4.257936, 0, 0.4470588, 1, 1,
0.233904, 0.1319278, 1.731265, 0, 0.4431373, 1, 1,
0.2340612, 1.207961, 0.8576313, 0, 0.4352941, 1, 1,
0.2362335, -0.3561372, 3.944904, 0, 0.4313726, 1, 1,
0.244088, 0.8631527, 1.138864, 0, 0.4235294, 1, 1,
0.2453058, -0.09762075, 2.809529, 0, 0.4196078, 1, 1,
0.2560863, -0.4862124, 3.998959, 0, 0.4117647, 1, 1,
0.2593857, -0.1765375, 3.059518, 0, 0.4078431, 1, 1,
0.2620682, 0.1550928, 0.4253884, 0, 0.4, 1, 1,
0.2680848, -0.6373516, 2.878678, 0, 0.3921569, 1, 1,
0.2702096, 1.462728, -1.488509, 0, 0.3882353, 1, 1,
0.2728465, 0.5701458, -0.01211864, 0, 0.3803922, 1, 1,
0.2795695, 2.204579, -1.404734, 0, 0.3764706, 1, 1,
0.2799681, -0.5365539, 3.0158, 0, 0.3686275, 1, 1,
0.2839069, 2.105754, 0.02666829, 0, 0.3647059, 1, 1,
0.284461, -0.6049473, 2.744482, 0, 0.3568628, 1, 1,
0.2852468, -0.5887548, 3.740871, 0, 0.3529412, 1, 1,
0.290593, -1.246251, 3.338486, 0, 0.345098, 1, 1,
0.2907543, -2.160712, 3.29702, 0, 0.3411765, 1, 1,
0.2911872, 1.046845, 1.608845, 0, 0.3333333, 1, 1,
0.2923496, 0.863043, 0.1758348, 0, 0.3294118, 1, 1,
0.2930352, 0.9153504, 0.3891651, 0, 0.3215686, 1, 1,
0.3052388, -0.3030598, -0.0733718, 0, 0.3176471, 1, 1,
0.3091664, 0.4901234, -1.286319, 0, 0.3098039, 1, 1,
0.3112819, 0.7527208, -0.1497091, 0, 0.3058824, 1, 1,
0.3148998, -0.7467455, 2.9241, 0, 0.2980392, 1, 1,
0.3164968, -1.532038, 3.278253, 0, 0.2901961, 1, 1,
0.31924, 0.6215749, -0.3962036, 0, 0.2862745, 1, 1,
0.3209524, 2.467101, 0.6239646, 0, 0.2784314, 1, 1,
0.3211166, 2.77831, 0.1042187, 0, 0.2745098, 1, 1,
0.3229874, -1.340313, 3.900876, 0, 0.2666667, 1, 1,
0.3237212, -0.2107624, 4.172886, 0, 0.2627451, 1, 1,
0.331856, -1.315127, 1.876903, 0, 0.254902, 1, 1,
0.3340306, -1.575779, 2.563879, 0, 0.2509804, 1, 1,
0.3367864, 0.1537188, 3.14174, 0, 0.2431373, 1, 1,
0.3405373, 0.02501707, 1.351443, 0, 0.2392157, 1, 1,
0.3473154, -0.2403484, 1.261389, 0, 0.2313726, 1, 1,
0.3480923, -0.7833899, 3.518669, 0, 0.227451, 1, 1,
0.3491105, -1.215418, 0.7158452, 0, 0.2196078, 1, 1,
0.3497229, -0.3882627, 1.995684, 0, 0.2156863, 1, 1,
0.3551175, 0.4207005, -0.4172415, 0, 0.2078431, 1, 1,
0.3567963, -0.2064508, 2.422182, 0, 0.2039216, 1, 1,
0.362255, -0.8011591, 3.113193, 0, 0.1960784, 1, 1,
0.36695, -0.7131951, 2.815063, 0, 0.1882353, 1, 1,
0.3693507, -0.4628309, 1.808494, 0, 0.1843137, 1, 1,
0.3714775, 1.040545, 0.2496315, 0, 0.1764706, 1, 1,
0.3718555, 0.1836839, 2.012712, 0, 0.172549, 1, 1,
0.3735459, -0.1931679, 1.619372, 0, 0.1647059, 1, 1,
0.3781191, 0.3571856, 0.9558693, 0, 0.1607843, 1, 1,
0.3791676, -0.4169944, 0.6009108, 0, 0.1529412, 1, 1,
0.3794859, -0.3826415, 2.210297, 0, 0.1490196, 1, 1,
0.3808896, 1.03918, 1.965815, 0, 0.1411765, 1, 1,
0.3839164, -0.09125746, 3.791553, 0, 0.1372549, 1, 1,
0.3839796, 2.22985, 0.7834986, 0, 0.1294118, 1, 1,
0.3845617, 0.4518343, 0.9022239, 0, 0.1254902, 1, 1,
0.3852948, -1.77163, 3.524311, 0, 0.1176471, 1, 1,
0.3854492, 0.8773049, 0.8419434, 0, 0.1137255, 1, 1,
0.3854873, 0.7415409, 0.1055443, 0, 0.1058824, 1, 1,
0.3935277, 0.305129, -0.3285504, 0, 0.09803922, 1, 1,
0.3993378, 0.8462119, 0.9567919, 0, 0.09411765, 1, 1,
0.3998975, -0.6159779, 3.140528, 0, 0.08627451, 1, 1,
0.4000441, -1.29348, 4.203889, 0, 0.08235294, 1, 1,
0.4017782, -0.7503588, 2.319641, 0, 0.07450981, 1, 1,
0.4066309, -1.870578, 2.363799, 0, 0.07058824, 1, 1,
0.406754, -0.5733151, 4.504747, 0, 0.0627451, 1, 1,
0.4079559, 1.13541, 1.081817, 0, 0.05882353, 1, 1,
0.4097379, 0.3091207, 1.381102, 0, 0.05098039, 1, 1,
0.4114673, -0.8722429, 2.147436, 0, 0.04705882, 1, 1,
0.4115927, 2.411917, 0.9654802, 0, 0.03921569, 1, 1,
0.4184521, 1.492298, -1.369672, 0, 0.03529412, 1, 1,
0.421855, -0.7657598, 2.788887, 0, 0.02745098, 1, 1,
0.422278, 1.976414, -0.007289763, 0, 0.02352941, 1, 1,
0.4272633, -0.6981069, 2.636709, 0, 0.01568628, 1, 1,
0.43563, 0.4022473, 1.801113, 0, 0.01176471, 1, 1,
0.4368613, 0.3724186, 0.9207717, 0, 0.003921569, 1, 1,
0.4383609, 0.04098983, 0.6874794, 0.003921569, 0, 1, 1,
0.4396904, -0.8479016, 3.588067, 0.007843138, 0, 1, 1,
0.4398672, -1.034384, 2.053924, 0.01568628, 0, 1, 1,
0.440175, -0.353226, 2.119326, 0.01960784, 0, 1, 1,
0.4410333, 0.4589319, -0.9658831, 0.02745098, 0, 1, 1,
0.4456355, 0.3601416, -0.520696, 0.03137255, 0, 1, 1,
0.446876, 1.579026, -0.2699426, 0.03921569, 0, 1, 1,
0.4480251, -1.259382, 1.761195, 0.04313726, 0, 1, 1,
0.4517744, -1.200254, 2.992633, 0.05098039, 0, 1, 1,
0.4533767, 1.448189, 1.050139, 0.05490196, 0, 1, 1,
0.4538328, -0.9359366, 0.597994, 0.0627451, 0, 1, 1,
0.4584315, 1.26342, 0.9569001, 0.06666667, 0, 1, 1,
0.459941, -0.2484058, 2.468828, 0.07450981, 0, 1, 1,
0.460199, 0.6127213, -0.1273028, 0.07843138, 0, 1, 1,
0.4676533, -1.617201, 2.98108, 0.08627451, 0, 1, 1,
0.4684588, -0.03096584, 0.7694253, 0.09019608, 0, 1, 1,
0.4707527, -0.2086525, 3.772659, 0.09803922, 0, 1, 1,
0.4740352, 0.5870806, 1.698287, 0.1058824, 0, 1, 1,
0.4844317, 0.858301, 0.4991584, 0.1098039, 0, 1, 1,
0.4853225, -0.1367402, 1.735499, 0.1176471, 0, 1, 1,
0.4858225, -1.595953, 1.591614, 0.1215686, 0, 1, 1,
0.4865421, 0.4873403, 4.452711, 0.1294118, 0, 1, 1,
0.4871085, 0.5468224, 1.08435, 0.1333333, 0, 1, 1,
0.4874077, -1.629102, 2.26077, 0.1411765, 0, 1, 1,
0.4913646, -0.9319849, 2.230006, 0.145098, 0, 1, 1,
0.4929707, 0.1051579, 1.10026, 0.1529412, 0, 1, 1,
0.4964741, 0.8336292, 2.084831, 0.1568628, 0, 1, 1,
0.4989367, 0.2599936, 0.9831458, 0.1647059, 0, 1, 1,
0.5018601, -2.131307, 2.819874, 0.1686275, 0, 1, 1,
0.5084917, -0.4380836, 3.736079, 0.1764706, 0, 1, 1,
0.521076, -0.3926868, 2.226863, 0.1803922, 0, 1, 1,
0.5256236, -0.3836465, 1.890641, 0.1882353, 0, 1, 1,
0.5258162, 0.5075591, 1.671268, 0.1921569, 0, 1, 1,
0.5408237, -0.5189841, 1.951385, 0.2, 0, 1, 1,
0.5451855, -1.444024, 4.574113, 0.2078431, 0, 1, 1,
0.5499637, -1.152484, 1.644378, 0.2117647, 0, 1, 1,
0.5523034, 0.03835383, 0.5006683, 0.2196078, 0, 1, 1,
0.5549154, 2.879297, 0.9452844, 0.2235294, 0, 1, 1,
0.5608666, -0.7056627, 2.084552, 0.2313726, 0, 1, 1,
0.5613154, -0.2234992, 3.502181, 0.2352941, 0, 1, 1,
0.5634349, -1.240935, 2.305417, 0.2431373, 0, 1, 1,
0.5667772, 1.770877, -0.8012, 0.2470588, 0, 1, 1,
0.5692321, -0.9709979, 2.892133, 0.254902, 0, 1, 1,
0.5747436, 0.1080872, 2.330396, 0.2588235, 0, 1, 1,
0.5784344, 0.6130751, -1.384041, 0.2666667, 0, 1, 1,
0.5865342, 0.3318322, 2.250131, 0.2705882, 0, 1, 1,
0.589467, -0.633921, -0.2634033, 0.2784314, 0, 1, 1,
0.5912447, 1.061269, 1.78097, 0.282353, 0, 1, 1,
0.5953957, 1.134325, 1.218271, 0.2901961, 0, 1, 1,
0.5992082, 0.09495901, 1.631574, 0.2941177, 0, 1, 1,
0.6012623, -0.136587, 4.140207, 0.3019608, 0, 1, 1,
0.6022112, 0.4634666, 1.55053, 0.3098039, 0, 1, 1,
0.6047629, -0.737279, 2.857152, 0.3137255, 0, 1, 1,
0.6068051, -0.5345814, 3.778125, 0.3215686, 0, 1, 1,
0.606849, 0.4829648, -1.181435, 0.3254902, 0, 1, 1,
0.6120279, -0.226681, 2.164568, 0.3333333, 0, 1, 1,
0.6127701, -0.1864408, 2.585711, 0.3372549, 0, 1, 1,
0.6175775, 1.37062, 0.5677625, 0.345098, 0, 1, 1,
0.6185885, 0.4310155, -1.548529, 0.3490196, 0, 1, 1,
0.6207542, -0.1703197, 0.254734, 0.3568628, 0, 1, 1,
0.6222535, 0.270409, 0.8724316, 0.3607843, 0, 1, 1,
0.6223242, -0.7237582, 3.220072, 0.3686275, 0, 1, 1,
0.6223833, -0.3363083, 1.675733, 0.372549, 0, 1, 1,
0.6326799, 0.3252909, 1.939713, 0.3803922, 0, 1, 1,
0.6366084, 1.781326, -1.227045, 0.3843137, 0, 1, 1,
0.6366352, -0.0420454, -0.7222725, 0.3921569, 0, 1, 1,
0.6388154, 0.3022729, 0.682452, 0.3960784, 0, 1, 1,
0.6396942, -0.2303028, 3.061007, 0.4039216, 0, 1, 1,
0.6401042, 1.285056, 0.7262597, 0.4117647, 0, 1, 1,
0.643538, -0.1814444, 1.737691, 0.4156863, 0, 1, 1,
0.6472381, -0.1495071, 2.377088, 0.4235294, 0, 1, 1,
0.6538991, -0.954846, 3.615653, 0.427451, 0, 1, 1,
0.6551579, -0.2927826, 2.341077, 0.4352941, 0, 1, 1,
0.6600237, 0.902678, 0.5373032, 0.4392157, 0, 1, 1,
0.6607308, 1.659518, -0.7878257, 0.4470588, 0, 1, 1,
0.6642066, -1.114067, 0.5629644, 0.4509804, 0, 1, 1,
0.664859, -0.7523961, 1.937743, 0.4588235, 0, 1, 1,
0.6681837, 0.3102294, 2.762929, 0.4627451, 0, 1, 1,
0.67612, -1.296012, 0.7054853, 0.4705882, 0, 1, 1,
0.6763402, 0.4868219, 0.1115251, 0.4745098, 0, 1, 1,
0.6790031, 1.560639, 0.7082734, 0.4823529, 0, 1, 1,
0.6817138, -0.1926725, 2.641993, 0.4862745, 0, 1, 1,
0.6839433, 0.5621333, 1.024927, 0.4941176, 0, 1, 1,
0.6850015, 0.2924286, 0.04418036, 0.5019608, 0, 1, 1,
0.6851144, -0.6049161, 3.006362, 0.5058824, 0, 1, 1,
0.6901239, -0.7313616, 3.111205, 0.5137255, 0, 1, 1,
0.6915728, 1.315274, 0.4965487, 0.5176471, 0, 1, 1,
0.6957676, -2.037953, 1.892523, 0.5254902, 0, 1, 1,
0.7002192, -0.01197633, 1.95775, 0.5294118, 0, 1, 1,
0.7002593, -1.22614, 2.476607, 0.5372549, 0, 1, 1,
0.7002738, -0.7347335, 0.8347015, 0.5411765, 0, 1, 1,
0.7014257, -0.101021, 1.258684, 0.5490196, 0, 1, 1,
0.7019709, -0.5632772, 3.759843, 0.5529412, 0, 1, 1,
0.7035373, 0.0273232, 0.1935435, 0.5607843, 0, 1, 1,
0.7077335, 0.7073321, -1.647551, 0.5647059, 0, 1, 1,
0.7190812, -1.227028, 3.667467, 0.572549, 0, 1, 1,
0.7199486, 0.4715301, 0.5018036, 0.5764706, 0, 1, 1,
0.7251337, 0.5712659, 0.1264214, 0.5843138, 0, 1, 1,
0.7341101, -1.746087, 1.499487, 0.5882353, 0, 1, 1,
0.7431706, 0.4379593, 0.2223559, 0.5960785, 0, 1, 1,
0.7448791, -1.398963, 1.887676, 0.6039216, 0, 1, 1,
0.7510903, 0.3705845, 1.355535, 0.6078432, 0, 1, 1,
0.7537414, -0.9047627, 2.244105, 0.6156863, 0, 1, 1,
0.7604963, -0.4062595, 1.881783, 0.6196079, 0, 1, 1,
0.7616815, -0.5008541, 1.813911, 0.627451, 0, 1, 1,
0.7650523, -0.1411864, 3.000676, 0.6313726, 0, 1, 1,
0.7657378, 0.04824816, 0.6318423, 0.6392157, 0, 1, 1,
0.7725503, 0.7378262, 1.274941, 0.6431373, 0, 1, 1,
0.7736784, -0.916904, 3.280259, 0.6509804, 0, 1, 1,
0.7751154, 1.004525, -0.2030115, 0.654902, 0, 1, 1,
0.7768759, 1.771689, 0.7677023, 0.6627451, 0, 1, 1,
0.7774984, -1.632315, 1.922855, 0.6666667, 0, 1, 1,
0.7794975, -0.5859917, 2.211995, 0.6745098, 0, 1, 1,
0.7860397, 0.8093323, 1.368825, 0.6784314, 0, 1, 1,
0.7871921, 1.722709, 1.947334, 0.6862745, 0, 1, 1,
0.7885351, 0.300786, 2.340644, 0.6901961, 0, 1, 1,
0.7967694, 1.447889, -0.9503863, 0.6980392, 0, 1, 1,
0.8050609, 0.7438989, 1.87814, 0.7058824, 0, 1, 1,
0.80646, -1.091806, 4.331495, 0.7098039, 0, 1, 1,
0.8088971, -0.6456675, 0.3641503, 0.7176471, 0, 1, 1,
0.8105713, -0.7844768, 1.718483, 0.7215686, 0, 1, 1,
0.8161855, 0.7809937, 1.035071, 0.7294118, 0, 1, 1,
0.8258639, 0.8259792, 1.59439, 0.7333333, 0, 1, 1,
0.8306711, -0.9694766, 0.2124029, 0.7411765, 0, 1, 1,
0.8330639, -0.7822906, 0.5517545, 0.7450981, 0, 1, 1,
0.8414956, -0.0949934, 1.269921, 0.7529412, 0, 1, 1,
0.845211, 1.033144, 0.09939279, 0.7568628, 0, 1, 1,
0.8574926, 0.2958626, 1.269254, 0.7647059, 0, 1, 1,
0.8637471, -0.2275503, 3.574659, 0.7686275, 0, 1, 1,
0.8658919, 1.814535, 0.3692875, 0.7764706, 0, 1, 1,
0.870933, 1.183771, 1.040784, 0.7803922, 0, 1, 1,
0.8713068, 0.7830834, -0.0780289, 0.7882353, 0, 1, 1,
0.8729991, -1.360231, 1.13922, 0.7921569, 0, 1, 1,
0.8767478, 0.04227288, 2.352952, 0.8, 0, 1, 1,
0.8822529, -0.9439474, 1.484653, 0.8078431, 0, 1, 1,
0.8896324, 0.9001051, 0.5027431, 0.8117647, 0, 1, 1,
0.8915558, 0.3495513, 1.600561, 0.8196079, 0, 1, 1,
0.8992322, -1.182256, 2.780492, 0.8235294, 0, 1, 1,
0.9013616, -1.553694, 4.539905, 0.8313726, 0, 1, 1,
0.9022131, -1.446197, 2.881935, 0.8352941, 0, 1, 1,
0.9022467, 0.1823596, 2.138411, 0.8431373, 0, 1, 1,
0.9045419, 0.7123814, 1.278271, 0.8470588, 0, 1, 1,
0.9104912, 0.4238758, 1.332003, 0.854902, 0, 1, 1,
0.9195947, -0.0301169, 1.574611, 0.8588235, 0, 1, 1,
0.9240388, -0.4767792, 1.813896, 0.8666667, 0, 1, 1,
0.9295147, -0.8441544, 3.370752, 0.8705882, 0, 1, 1,
0.9311758, 1.1493, 2.322048, 0.8784314, 0, 1, 1,
0.9407623, 0.4207475, -0.06894383, 0.8823529, 0, 1, 1,
0.9444174, -0.4296554, 1.686194, 0.8901961, 0, 1, 1,
0.9450373, -0.001141474, 1.773058, 0.8941177, 0, 1, 1,
0.9468329, 0.3957623, -0.5284162, 0.9019608, 0, 1, 1,
0.9478917, -0.5401997, 1.473092, 0.9098039, 0, 1, 1,
0.950294, -0.07029754, -1.381046, 0.9137255, 0, 1, 1,
0.9524946, 0.1203545, 1.345646, 0.9215686, 0, 1, 1,
0.9532506, -2.021925, 3.275819, 0.9254902, 0, 1, 1,
0.9578492, -2.203565, 1.808619, 0.9333333, 0, 1, 1,
0.9685923, -0.9503731, 2.825578, 0.9372549, 0, 1, 1,
0.9724693, 0.06699197, 0.5529619, 0.945098, 0, 1, 1,
0.9736826, 1.403301, 1.181342, 0.9490196, 0, 1, 1,
0.9737448, 0.2437994, 1.749795, 0.9568627, 0, 1, 1,
0.9760936, 0.63279, 1.249974, 0.9607843, 0, 1, 1,
0.9785888, -0.7992978, 2.189714, 0.9686275, 0, 1, 1,
0.9790978, 0.2044549, 0.9735032, 0.972549, 0, 1, 1,
0.985665, 0.6246302, -0.6349953, 0.9803922, 0, 1, 1,
0.9891371, -1.449749, 3.148667, 0.9843137, 0, 1, 1,
0.9928003, -0.113214, -0.1421758, 0.9921569, 0, 1, 1,
0.9932067, 0.3643546, 0.4762676, 0.9960784, 0, 1, 1,
0.9946696, -0.3347384, 0.6437722, 1, 0, 0.9960784, 1,
0.9984717, -0.7740879, 0.3518706, 1, 0, 0.9882353, 1,
1.008201, 0.7629453, 0.2713926, 1, 0, 0.9843137, 1,
1.010159, 0.3563814, 0.6515054, 1, 0, 0.9764706, 1,
1.015238, 0.1858529, 1.096521, 1, 0, 0.972549, 1,
1.015946, 0.277569, 2.691013, 1, 0, 0.9647059, 1,
1.016363, 1.148407, 1.033783, 1, 0, 0.9607843, 1,
1.017359, 0.9184232, -0.3113743, 1, 0, 0.9529412, 1,
1.019475, -0.2826405, 3.092801, 1, 0, 0.9490196, 1,
1.019642, 0.2662567, 2.920964, 1, 0, 0.9411765, 1,
1.022951, -0.8381547, 1.159329, 1, 0, 0.9372549, 1,
1.025771, -1.426539, 3.084885, 1, 0, 0.9294118, 1,
1.027648, 0.8194523, 2.061929, 1, 0, 0.9254902, 1,
1.028764, 0.2630339, 3.326358, 1, 0, 0.9176471, 1,
1.03171, 0.9005219, 2.682961, 1, 0, 0.9137255, 1,
1.033381, 0.1974722, 1.530597, 1, 0, 0.9058824, 1,
1.038525, -0.291622, 2.197067, 1, 0, 0.9019608, 1,
1.052754, -0.2616623, 0.8637624, 1, 0, 0.8941177, 1,
1.056383, 0.2881317, 1.100668, 1, 0, 0.8862745, 1,
1.056969, -0.6724858, 0.861744, 1, 0, 0.8823529, 1,
1.057726, 0.188881, 2.161993, 1, 0, 0.8745098, 1,
1.05865, 1.186348, 1.058009, 1, 0, 0.8705882, 1,
1.05914, 0.08104212, 1.861331, 1, 0, 0.8627451, 1,
1.060236, -1.782369, 2.710403, 1, 0, 0.8588235, 1,
1.061157, -0.4140231, 2.084707, 1, 0, 0.8509804, 1,
1.067349, 0.2427933, 0.1716628, 1, 0, 0.8470588, 1,
1.083149, 0.8946639, 1.273472, 1, 0, 0.8392157, 1,
1.083525, -0.5249532, 2.176837, 1, 0, 0.8352941, 1,
1.091674, -0.6812295, 2.666301, 1, 0, 0.827451, 1,
1.092314, 0.4647505, 0.1710134, 1, 0, 0.8235294, 1,
1.092495, -0.4308017, 1.74008, 1, 0, 0.8156863, 1,
1.101929, -1.257763, 1.627838, 1, 0, 0.8117647, 1,
1.105909, 0.2866961, 4.217211, 1, 0, 0.8039216, 1,
1.109642, -2.206889, 3.74958, 1, 0, 0.7960784, 1,
1.110237, -1.208839, 3.147537, 1, 0, 0.7921569, 1,
1.115843, -0.3673203, 2.489362, 1, 0, 0.7843137, 1,
1.124538, 0.6514561, 1.207921, 1, 0, 0.7803922, 1,
1.126133, -0.09563874, 2.378047, 1, 0, 0.772549, 1,
1.128869, -0.3301806, 3.009897, 1, 0, 0.7686275, 1,
1.129754, 2.108972, 2.357419, 1, 0, 0.7607843, 1,
1.139542, -0.1830363, 1.858764, 1, 0, 0.7568628, 1,
1.140804, 0.6319828, 0.61874, 1, 0, 0.7490196, 1,
1.143453, 1.970194, 0.9910874, 1, 0, 0.7450981, 1,
1.15555, -0.4852587, 2.561212, 1, 0, 0.7372549, 1,
1.168909, -0.6326604, 1.364621, 1, 0, 0.7333333, 1,
1.172653, -0.8304105, 2.309353, 1, 0, 0.7254902, 1,
1.175279, 0.4844207, 1.621928, 1, 0, 0.7215686, 1,
1.179106, 0.5331219, 0.8307096, 1, 0, 0.7137255, 1,
1.184251, 0.7235056, 0.3406902, 1, 0, 0.7098039, 1,
1.184835, 0.1343155, 3.086512, 1, 0, 0.7019608, 1,
1.18716, 0.05735412, 3.228781, 1, 0, 0.6941177, 1,
1.189804, 0.7216918, -0.8788211, 1, 0, 0.6901961, 1,
1.193524, -1.878958, 1.420545, 1, 0, 0.682353, 1,
1.196755, -0.3040227, 2.191658, 1, 0, 0.6784314, 1,
1.197144, -0.8711334, 1.356177, 1, 0, 0.6705883, 1,
1.199471, -2.061851, 3.022919, 1, 0, 0.6666667, 1,
1.201272, 0.6950024, 0.9622509, 1, 0, 0.6588235, 1,
1.202271, -0.5657135, 1.243064, 1, 0, 0.654902, 1,
1.208704, 0.6444103, 1.500942, 1, 0, 0.6470588, 1,
1.215142, 2.166058, 0.7230268, 1, 0, 0.6431373, 1,
1.216327, -1.088763, 3.540709, 1, 0, 0.6352941, 1,
1.220951, 0.8478769, -0.2341703, 1, 0, 0.6313726, 1,
1.227245, 1.04199, 0.9982255, 1, 0, 0.6235294, 1,
1.227987, 2.465524, -1.107582, 1, 0, 0.6196079, 1,
1.228153, 0.432965, 0.6894371, 1, 0, 0.6117647, 1,
1.22907, 1.381843, 0.4944108, 1, 0, 0.6078432, 1,
1.229132, 0.7040107, 0.7263224, 1, 0, 0.6, 1,
1.232697, 1.833154, -0.2503984, 1, 0, 0.5921569, 1,
1.233624, 0.8680506, 2.459728, 1, 0, 0.5882353, 1,
1.23507, -0.6952908, 0.798116, 1, 0, 0.5803922, 1,
1.238705, -1.253236, 2.326998, 1, 0, 0.5764706, 1,
1.242835, -0.05214519, 0.5978992, 1, 0, 0.5686275, 1,
1.249177, 0.9096659, 1.473326, 1, 0, 0.5647059, 1,
1.25327, -0.5316111, 2.218958, 1, 0, 0.5568628, 1,
1.254492, -0.1303402, 2.081698, 1, 0, 0.5529412, 1,
1.254724, -0.1111658, 0.1488971, 1, 0, 0.5450981, 1,
1.262934, -0.6249685, 3.106278, 1, 0, 0.5411765, 1,
1.270694, -0.6667107, 1.904869, 1, 0, 0.5333334, 1,
1.274428, 0.6452404, 1.002047, 1, 0, 0.5294118, 1,
1.283217, 0.7156212, 3.453379, 1, 0, 0.5215687, 1,
1.286084, -0.5149271, 1.385075, 1, 0, 0.5176471, 1,
1.312945, -0.04889465, 1.904687, 1, 0, 0.509804, 1,
1.314556, 1.599122, 0.7894737, 1, 0, 0.5058824, 1,
1.314765, -0.8242203, 2.04182, 1, 0, 0.4980392, 1,
1.315718, 1.365227, -0.9036218, 1, 0, 0.4901961, 1,
1.318288, 2.03118, 1.457721, 1, 0, 0.4862745, 1,
1.324962, -0.4181136, 2.028818, 1, 0, 0.4784314, 1,
1.328639, 0.3385738, 1.055673, 1, 0, 0.4745098, 1,
1.347662, 0.2706334, 0.168715, 1, 0, 0.4666667, 1,
1.35298, 1.507388, -0.09605177, 1, 0, 0.4627451, 1,
1.357878, -0.3596151, 1.201905, 1, 0, 0.454902, 1,
1.365426, 0.1320008, 2.287296, 1, 0, 0.4509804, 1,
1.369691, 2.026949, -0.1433605, 1, 0, 0.4431373, 1,
1.376159, -0.05072469, 2.662473, 1, 0, 0.4392157, 1,
1.3815, 0.5975619, 1.565637, 1, 0, 0.4313726, 1,
1.388621, 0.8289637, 0.2228711, 1, 0, 0.427451, 1,
1.405394, -0.2078372, 2.763124, 1, 0, 0.4196078, 1,
1.406343, 0.5632854, 2.442917, 1, 0, 0.4156863, 1,
1.408525, 0.2518317, 1.68159, 1, 0, 0.4078431, 1,
1.408702, -1.368971, 1.629117, 1, 0, 0.4039216, 1,
1.420382, -1.1333, 3.005794, 1, 0, 0.3960784, 1,
1.420941, 0.2805897, 1.655739, 1, 0, 0.3882353, 1,
1.426864, 0.8683161, 0.7596917, 1, 0, 0.3843137, 1,
1.437795, -1.273392, 0.6294138, 1, 0, 0.3764706, 1,
1.442599, 1.111955, 1.104341, 1, 0, 0.372549, 1,
1.450658, -1.031974, 2.266382, 1, 0, 0.3647059, 1,
1.452203, 0.02629549, 0.8249635, 1, 0, 0.3607843, 1,
1.452967, 1.143742, 2.201546, 1, 0, 0.3529412, 1,
1.453159, 1.553491, 1.413373, 1, 0, 0.3490196, 1,
1.466967, 0.5751362, 0.4959664, 1, 0, 0.3411765, 1,
1.467346, -0.103741, 0.2467939, 1, 0, 0.3372549, 1,
1.478348, 1.635812, -0.2208001, 1, 0, 0.3294118, 1,
1.492658, -0.694602, 3.728548, 1, 0, 0.3254902, 1,
1.513795, -0.6677328, 2.468973, 1, 0, 0.3176471, 1,
1.51387, -0.7782015, -0.8722726, 1, 0, 0.3137255, 1,
1.521924, -1.037962, 3.87283, 1, 0, 0.3058824, 1,
1.549545, -1.125656, 2.213483, 1, 0, 0.2980392, 1,
1.551843, -0.6685857, 1.414688, 1, 0, 0.2941177, 1,
1.559772, -0.1309456, 0.8899236, 1, 0, 0.2862745, 1,
1.562485, 0.8280996, 2.012609, 1, 0, 0.282353, 1,
1.562781, 1.085791, 0.7465526, 1, 0, 0.2745098, 1,
1.601651, 0.3677827, 1.316341, 1, 0, 0.2705882, 1,
1.611827, -0.8037264, 3.011131, 1, 0, 0.2627451, 1,
1.646818, -0.6062861, 2.84581, 1, 0, 0.2588235, 1,
1.661653, 0.5227086, 1.393366, 1, 0, 0.2509804, 1,
1.667569, -0.06701963, 1.829499, 1, 0, 0.2470588, 1,
1.673542, -1.148267, 1.884786, 1, 0, 0.2392157, 1,
1.68154, 0.5629123, 0.3101864, 1, 0, 0.2352941, 1,
1.684063, 0.7968124, 0.02236777, 1, 0, 0.227451, 1,
1.68432, 0.3715846, 0.009468521, 1, 0, 0.2235294, 1,
1.689559, -0.9102547, 0.8239169, 1, 0, 0.2156863, 1,
1.701991, -0.6877734, 4.146409, 1, 0, 0.2117647, 1,
1.717455, 1.452154, -0.2751728, 1, 0, 0.2039216, 1,
1.721552, 0.7809967, 1.280568, 1, 0, 0.1960784, 1,
1.741204, -0.5528156, 0.9621373, 1, 0, 0.1921569, 1,
1.748414, -0.5721314, 2.472738, 1, 0, 0.1843137, 1,
1.751293, 1.725467, 0.5669709, 1, 0, 0.1803922, 1,
1.79108, -0.5735958, 2.130132, 1, 0, 0.172549, 1,
1.809376, 2.469645, -0.422945, 1, 0, 0.1686275, 1,
1.809421, 0.8494195, 0.04958789, 1, 0, 0.1607843, 1,
1.827212, 0.7450274, 4.069645, 1, 0, 0.1568628, 1,
1.847606, 1.213478, 0.6686121, 1, 0, 0.1490196, 1,
1.853303, -0.5784199, 1.768037, 1, 0, 0.145098, 1,
1.879135, -0.205597, 0.750604, 1, 0, 0.1372549, 1,
1.879747, -0.1305945, 1.000808, 1, 0, 0.1333333, 1,
1.885937, 0.8744706, 1.155411, 1, 0, 0.1254902, 1,
1.931525, 0.5440105, 1.346605, 1, 0, 0.1215686, 1,
1.947005, -0.358041, 1.875441, 1, 0, 0.1137255, 1,
1.978201, -1.057186, 1.52747, 1, 0, 0.1098039, 1,
2.012777, -0.6453969, 2.229134, 1, 0, 0.1019608, 1,
2.017572, 1.517734, 1.449634, 1, 0, 0.09411765, 1,
2.030096, -0.004616214, 2.663428, 1, 0, 0.09019608, 1,
2.051248, 0.3988633, 0.6777155, 1, 0, 0.08235294, 1,
2.118925, -0.328307, 0.6993192, 1, 0, 0.07843138, 1,
2.158426, 1.046444, 0.05265532, 1, 0, 0.07058824, 1,
2.175049, -1.069545, 1.175266, 1, 0, 0.06666667, 1,
2.180733, 2.055578, 0.005004992, 1, 0, 0.05882353, 1,
2.194555, 0.01442224, 3.467548, 1, 0, 0.05490196, 1,
2.218805, 1.450625, 2.494542, 1, 0, 0.04705882, 1,
2.220438, -0.05616482, 1.753171, 1, 0, 0.04313726, 1,
2.30562, 1.242298, 1.901876, 1, 0, 0.03529412, 1,
2.409501, 0.8325842, 1.176656, 1, 0, 0.03137255, 1,
2.426407, 0.8576646, 2.597283, 1, 0, 0.02352941, 1,
2.662077, -0.3377962, 1.027282, 1, 0, 0.01960784, 1,
2.745083, 0.3333283, 1.310191, 1, 0, 0.01176471, 1,
3.3516, -0.9361362, 1.370314, 1, 0, 0.007843138, 1
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
-0.01313806, -3.971947, -7.441349, 0, -0.5, 0.5, 0.5,
-0.01313806, -3.971947, -7.441349, 1, -0.5, 0.5, 0.5,
-0.01313806, -3.971947, -7.441349, 1, 1.5, 0.5, 0.5,
-0.01313806, -3.971947, -7.441349, 0, 1.5, 0.5, 0.5
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
-4.518522, -0.04882288, -7.441349, 0, -0.5, 0.5, 0.5,
-4.518522, -0.04882288, -7.441349, 1, -0.5, 0.5, 0.5,
-4.518522, -0.04882288, -7.441349, 1, 1.5, 0.5, 0.5,
-4.518522, -0.04882288, -7.441349, 0, 1.5, 0.5, 0.5
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
-4.518522, -3.971947, -0.2319157, 0, -0.5, 0.5, 0.5,
-4.518522, -3.971947, -0.2319157, 1, -0.5, 0.5, 0.5,
-4.518522, -3.971947, -0.2319157, 1, 1.5, 0.5, 0.5,
-4.518522, -3.971947, -0.2319157, 0, 1.5, 0.5, 0.5
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
-3, -3.066611, -5.777634,
3, -3.066611, -5.777634,
-3, -3.066611, -5.777634,
-3, -3.2175, -6.05492,
-2, -3.066611, -5.777634,
-2, -3.2175, -6.05492,
-1, -3.066611, -5.777634,
-1, -3.2175, -6.05492,
0, -3.066611, -5.777634,
0, -3.2175, -6.05492,
1, -3.066611, -5.777634,
1, -3.2175, -6.05492,
2, -3.066611, -5.777634,
2, -3.2175, -6.05492,
3, -3.066611, -5.777634,
3, -3.2175, -6.05492
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
-3, -3.519279, -6.609491, 0, -0.5, 0.5, 0.5,
-3, -3.519279, -6.609491, 1, -0.5, 0.5, 0.5,
-3, -3.519279, -6.609491, 1, 1.5, 0.5, 0.5,
-3, -3.519279, -6.609491, 0, 1.5, 0.5, 0.5,
-2, -3.519279, -6.609491, 0, -0.5, 0.5, 0.5,
-2, -3.519279, -6.609491, 1, -0.5, 0.5, 0.5,
-2, -3.519279, -6.609491, 1, 1.5, 0.5, 0.5,
-2, -3.519279, -6.609491, 0, 1.5, 0.5, 0.5,
-1, -3.519279, -6.609491, 0, -0.5, 0.5, 0.5,
-1, -3.519279, -6.609491, 1, -0.5, 0.5, 0.5,
-1, -3.519279, -6.609491, 1, 1.5, 0.5, 0.5,
-1, -3.519279, -6.609491, 0, 1.5, 0.5, 0.5,
0, -3.519279, -6.609491, 0, -0.5, 0.5, 0.5,
0, -3.519279, -6.609491, 1, -0.5, 0.5, 0.5,
0, -3.519279, -6.609491, 1, 1.5, 0.5, 0.5,
0, -3.519279, -6.609491, 0, 1.5, 0.5, 0.5,
1, -3.519279, -6.609491, 0, -0.5, 0.5, 0.5,
1, -3.519279, -6.609491, 1, -0.5, 0.5, 0.5,
1, -3.519279, -6.609491, 1, 1.5, 0.5, 0.5,
1, -3.519279, -6.609491, 0, 1.5, 0.5, 0.5,
2, -3.519279, -6.609491, 0, -0.5, 0.5, 0.5,
2, -3.519279, -6.609491, 1, -0.5, 0.5, 0.5,
2, -3.519279, -6.609491, 1, 1.5, 0.5, 0.5,
2, -3.519279, -6.609491, 0, 1.5, 0.5, 0.5,
3, -3.519279, -6.609491, 0, -0.5, 0.5, 0.5,
3, -3.519279, -6.609491, 1, -0.5, 0.5, 0.5,
3, -3.519279, -6.609491, 1, 1.5, 0.5, 0.5,
3, -3.519279, -6.609491, 0, 1.5, 0.5, 0.5
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
-3.478818, -2, -5.777634,
-3.478818, 2, -5.777634,
-3.478818, -2, -5.777634,
-3.652102, -2, -6.05492,
-3.478818, -1, -5.777634,
-3.652102, -1, -6.05492,
-3.478818, 0, -5.777634,
-3.652102, 0, -6.05492,
-3.478818, 1, -5.777634,
-3.652102, 1, -6.05492,
-3.478818, 2, -5.777634,
-3.652102, 2, -6.05492
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
-3.99867, -2, -6.609491, 0, -0.5, 0.5, 0.5,
-3.99867, -2, -6.609491, 1, -0.5, 0.5, 0.5,
-3.99867, -2, -6.609491, 1, 1.5, 0.5, 0.5,
-3.99867, -2, -6.609491, 0, 1.5, 0.5, 0.5,
-3.99867, -1, -6.609491, 0, -0.5, 0.5, 0.5,
-3.99867, -1, -6.609491, 1, -0.5, 0.5, 0.5,
-3.99867, -1, -6.609491, 1, 1.5, 0.5, 0.5,
-3.99867, -1, -6.609491, 0, 1.5, 0.5, 0.5,
-3.99867, 0, -6.609491, 0, -0.5, 0.5, 0.5,
-3.99867, 0, -6.609491, 1, -0.5, 0.5, 0.5,
-3.99867, 0, -6.609491, 1, 1.5, 0.5, 0.5,
-3.99867, 0, -6.609491, 0, 1.5, 0.5, 0.5,
-3.99867, 1, -6.609491, 0, -0.5, 0.5, 0.5,
-3.99867, 1, -6.609491, 1, -0.5, 0.5, 0.5,
-3.99867, 1, -6.609491, 1, 1.5, 0.5, 0.5,
-3.99867, 1, -6.609491, 0, 1.5, 0.5, 0.5,
-3.99867, 2, -6.609491, 0, -0.5, 0.5, 0.5,
-3.99867, 2, -6.609491, 1, -0.5, 0.5, 0.5,
-3.99867, 2, -6.609491, 1, 1.5, 0.5, 0.5,
-3.99867, 2, -6.609491, 0, 1.5, 0.5, 0.5
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
-3.478818, -3.066611, -4,
-3.478818, -3.066611, 4,
-3.478818, -3.066611, -4,
-3.652102, -3.2175, -4,
-3.478818, -3.066611, -2,
-3.652102, -3.2175, -2,
-3.478818, -3.066611, 0,
-3.652102, -3.2175, 0,
-3.478818, -3.066611, 2,
-3.652102, -3.2175, 2,
-3.478818, -3.066611, 4,
-3.652102, -3.2175, 4
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
-3.99867, -3.519279, -4, 0, -0.5, 0.5, 0.5,
-3.99867, -3.519279, -4, 1, -0.5, 0.5, 0.5,
-3.99867, -3.519279, -4, 1, 1.5, 0.5, 0.5,
-3.99867, -3.519279, -4, 0, 1.5, 0.5, 0.5,
-3.99867, -3.519279, -2, 0, -0.5, 0.5, 0.5,
-3.99867, -3.519279, -2, 1, -0.5, 0.5, 0.5,
-3.99867, -3.519279, -2, 1, 1.5, 0.5, 0.5,
-3.99867, -3.519279, -2, 0, 1.5, 0.5, 0.5,
-3.99867, -3.519279, 0, 0, -0.5, 0.5, 0.5,
-3.99867, -3.519279, 0, 1, -0.5, 0.5, 0.5,
-3.99867, -3.519279, 0, 1, 1.5, 0.5, 0.5,
-3.99867, -3.519279, 0, 0, 1.5, 0.5, 0.5,
-3.99867, -3.519279, 2, 0, -0.5, 0.5, 0.5,
-3.99867, -3.519279, 2, 1, -0.5, 0.5, 0.5,
-3.99867, -3.519279, 2, 1, 1.5, 0.5, 0.5,
-3.99867, -3.519279, 2, 0, 1.5, 0.5, 0.5,
-3.99867, -3.519279, 4, 0, -0.5, 0.5, 0.5,
-3.99867, -3.519279, 4, 1, -0.5, 0.5, 0.5,
-3.99867, -3.519279, 4, 1, 1.5, 0.5, 0.5,
-3.99867, -3.519279, 4, 0, 1.5, 0.5, 0.5
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
-3.478818, -3.066611, -5.777634,
-3.478818, 2.968965, -5.777634,
-3.478818, -3.066611, 5.313802,
-3.478818, 2.968965, 5.313802,
-3.478818, -3.066611, -5.777634,
-3.478818, -3.066611, 5.313802,
-3.478818, 2.968965, -5.777634,
-3.478818, 2.968965, 5.313802,
-3.478818, -3.066611, -5.777634,
3.452542, -3.066611, -5.777634,
-3.478818, -3.066611, 5.313802,
3.452542, -3.066611, 5.313802,
-3.478818, 2.968965, -5.777634,
3.452542, 2.968965, -5.777634,
-3.478818, 2.968965, 5.313802,
3.452542, 2.968965, 5.313802,
3.452542, -3.066611, -5.777634,
3.452542, 2.968965, -5.777634,
3.452542, -3.066611, 5.313802,
3.452542, 2.968965, 5.313802,
3.452542, -3.066611, -5.777634,
3.452542, -3.066611, 5.313802,
3.452542, 2.968965, -5.777634,
3.452542, 2.968965, 5.313802
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
var radius = 7.691765;
var distance = 34.22153;
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
mvMatrix.translate( 0.01313806, 0.04882288, 0.2319157 );
mvMatrix.scale( 1.199835, 1.377911, 0.7498116 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.22153);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Kasugamycin<-read.table("Kasugamycin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Kasugamycin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Kasugamycin' not found
```

```r
y<-Kasugamycin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Kasugamycin' not found
```

```r
z<-Kasugamycin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Kasugamycin' not found
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
-3.377876, 0.09303688, -1.205644, 0, 0, 1, 1, 1,
-3.034744, 0.2461792, -1.416163, 1, 0, 0, 1, 1,
-3.015506, -0.511018, -1.643712, 1, 0, 0, 1, 1,
-2.63582, 1.212536, 0.3906215, 1, 0, 0, 1, 1,
-2.616225, -1.324907, -2.55702, 1, 0, 0, 1, 1,
-2.515804, -0.3962078, -1.142766, 1, 0, 0, 1, 1,
-2.485629, -0.7288078, -2.792708, 0, 0, 0, 1, 1,
-2.395824, -0.9563982, -1.02564, 0, 0, 0, 1, 1,
-2.392086, 0.6139427, -1.267077, 0, 0, 0, 1, 1,
-2.387334, 0.6893041, -1.361879, 0, 0, 0, 1, 1,
-2.371558, 0.3254111, -0.8429392, 0, 0, 0, 1, 1,
-2.348532, -1.689202, -2.600914, 0, 0, 0, 1, 1,
-2.348487, -0.1874573, -1.635343, 0, 0, 0, 1, 1,
-2.338937, 0.4283013, 0.1652605, 1, 1, 1, 1, 1,
-2.328296, -1.12405, -2.370698, 1, 1, 1, 1, 1,
-2.315382, 1.214771, -2.95535, 1, 1, 1, 1, 1,
-2.213658, -0.4283274, -0.7327275, 1, 1, 1, 1, 1,
-2.208093, -1.064404, -2.289271, 1, 1, 1, 1, 1,
-2.197648, -1.982327, -1.84511, 1, 1, 1, 1, 1,
-2.190107, 0.6944045, -0.7886083, 1, 1, 1, 1, 1,
-2.165377, 0.4122017, -1.704694, 1, 1, 1, 1, 1,
-2.153603, 0.03198841, -0.7392753, 1, 1, 1, 1, 1,
-2.130859, 1.212003, -1.26854, 1, 1, 1, 1, 1,
-2.123181, -0.3241582, -3.225077, 1, 1, 1, 1, 1,
-2.079537, 2.592483, -2.332435, 1, 1, 1, 1, 1,
-2.021776, 1.330556, -2.625726, 1, 1, 1, 1, 1,
-2.01986, 0.5757266, -1.41868, 1, 1, 1, 1, 1,
-2.018986, -0.5558912, -1.936227, 1, 1, 1, 1, 1,
-2.011003, -0.8571155, -1.341229, 0, 0, 1, 1, 1,
-2.006555, 0.4823873, -1.754615, 1, 0, 0, 1, 1,
-2.000441, 0.1714243, -1.215699, 1, 0, 0, 1, 1,
-1.998971, 1.195631, -0.9411055, 1, 0, 0, 1, 1,
-1.979409, 0.3508334, -1.395451, 1, 0, 0, 1, 1,
-1.975469, 0.1216146, -0.2050133, 1, 0, 0, 1, 1,
-1.967722, 0.818009, -1.81188, 0, 0, 0, 1, 1,
-1.966574, 1.920736, 0.3365758, 0, 0, 0, 1, 1,
-1.963006, -0.3825909, -0.279695, 0, 0, 0, 1, 1,
-1.959144, -0.4324785, -2.414492, 0, 0, 0, 1, 1,
-1.937124, 1.884889, -1.534338, 0, 0, 0, 1, 1,
-1.931003, 0.2835289, -0.6517503, 0, 0, 0, 1, 1,
-1.923272, 0.3654556, -1.213849, 0, 0, 0, 1, 1,
-1.909084, -0.987447, -2.875502, 1, 1, 1, 1, 1,
-1.876097, 1.52341, -0.7248944, 1, 1, 1, 1, 1,
-1.875601, 2.07276, -1.959649, 1, 1, 1, 1, 1,
-1.855421, 0.3695244, -1.645943, 1, 1, 1, 1, 1,
-1.830735, -2.576063, -2.478925, 1, 1, 1, 1, 1,
-1.815374, 0.09770238, -1.147692, 1, 1, 1, 1, 1,
-1.810901, 1.749716, -0.4962341, 1, 1, 1, 1, 1,
-1.797886, -0.5722129, 0.6922188, 1, 1, 1, 1, 1,
-1.79043, 2.379546, -2.330216, 1, 1, 1, 1, 1,
-1.769771, 0.6315753, -1.867887, 1, 1, 1, 1, 1,
-1.755975, 0.3886529, -0.6640575, 1, 1, 1, 1, 1,
-1.755208, 0.6617602, -3.432309, 1, 1, 1, 1, 1,
-1.741049, -0.5257537, -1.260996, 1, 1, 1, 1, 1,
-1.728713, 1.094789, -1.06089, 1, 1, 1, 1, 1,
-1.72806, -0.06169222, -0.3509832, 1, 1, 1, 1, 1,
-1.724113, -0.6612301, -1.237554, 0, 0, 1, 1, 1,
-1.723151, -0.5705722, -1.144822, 1, 0, 0, 1, 1,
-1.697468, -0.405902, -1.646284, 1, 0, 0, 1, 1,
-1.691613, 0.5677277, -1.639069, 1, 0, 0, 1, 1,
-1.683888, 1.85719, -0.5324637, 1, 0, 0, 1, 1,
-1.665984, 1.018418, -0.9790708, 1, 0, 0, 1, 1,
-1.655034, -0.1453708, -0.2746899, 0, 0, 0, 1, 1,
-1.647307, 0.3018544, -0.6553725, 0, 0, 0, 1, 1,
-1.646315, 0.4378551, -1.845674, 0, 0, 0, 1, 1,
-1.639805, -0.9252028, -1.089499, 0, 0, 0, 1, 1,
-1.62939, 0.5588623, -2.236223, 0, 0, 0, 1, 1,
-1.628388, -0.1659174, -1.311335, 0, 0, 0, 1, 1,
-1.624604, -1.210919, -1.347528, 0, 0, 0, 1, 1,
-1.623519, -0.7772949, -2.590204, 1, 1, 1, 1, 1,
-1.622655, 0.354074, -1.759454, 1, 1, 1, 1, 1,
-1.621205, -0.5455191, -1.386332, 1, 1, 1, 1, 1,
-1.609508, 0.6202961, -1.178315, 1, 1, 1, 1, 1,
-1.575536, -0.9552057, -2.332174, 1, 1, 1, 1, 1,
-1.573811, -0.1196542, -2.222214, 1, 1, 1, 1, 1,
-1.563228, -0.038275, -0.8603481, 1, 1, 1, 1, 1,
-1.533856, -1.278906, -1.649462, 1, 1, 1, 1, 1,
-1.528666, 0.1157154, 0.02164047, 1, 1, 1, 1, 1,
-1.521467, 1.042992, -0.7233034, 1, 1, 1, 1, 1,
-1.517694, -0.798665, -1.626825, 1, 1, 1, 1, 1,
-1.514501, -0.3790049, -0.6980371, 1, 1, 1, 1, 1,
-1.505372, 1.178622, -1.153145, 1, 1, 1, 1, 1,
-1.47419, -2.309598, -2.923959, 1, 1, 1, 1, 1,
-1.463166, -0.841119, -2.945035, 1, 1, 1, 1, 1,
-1.45446, -0.8634332, -2.417567, 0, 0, 1, 1, 1,
-1.45339, -1.314167, -1.053046, 1, 0, 0, 1, 1,
-1.450017, -1.265924, -3.158707, 1, 0, 0, 1, 1,
-1.450006, -0.3430787, -0.8187152, 1, 0, 0, 1, 1,
-1.444342, -0.6983457, -0.4997729, 1, 0, 0, 1, 1,
-1.444239, 1.538627, -1.961776, 1, 0, 0, 1, 1,
-1.434982, 0.7560372, -1.76869, 0, 0, 0, 1, 1,
-1.394644, -1.109744, -3.043083, 0, 0, 0, 1, 1,
-1.390528, 0.3583349, -2.658001, 0, 0, 0, 1, 1,
-1.389547, -0.9174554, -3.464506, 0, 0, 0, 1, 1,
-1.386183, -0.9300977, -3.195257, 0, 0, 0, 1, 1,
-1.373073, 0.4037549, -1.11003, 0, 0, 0, 1, 1,
-1.365369, 0.5574222, -1.519233, 0, 0, 0, 1, 1,
-1.35313, -0.1315955, -2.168712, 1, 1, 1, 1, 1,
-1.35309, 0.7782236, -0.7202817, 1, 1, 1, 1, 1,
-1.347487, -0.3266402, -1.242506, 1, 1, 1, 1, 1,
-1.346968, 0.1667488, -2.468843, 1, 1, 1, 1, 1,
-1.346653, 0.2676902, -0.4146571, 1, 1, 1, 1, 1,
-1.338506, -0.2670835, -0.96245, 1, 1, 1, 1, 1,
-1.320767, 0.7292774, -1.030079, 1, 1, 1, 1, 1,
-1.316097, 0.9684615, -1.195779, 1, 1, 1, 1, 1,
-1.307775, -0.9087619, -2.692296, 1, 1, 1, 1, 1,
-1.293236, 2.490421, 0.1115069, 1, 1, 1, 1, 1,
-1.283588, -0.64087, -1.946672, 1, 1, 1, 1, 1,
-1.28277, 0.9546633, -0.7393606, 1, 1, 1, 1, 1,
-1.281696, -1.844836, -3.413152, 1, 1, 1, 1, 1,
-1.275815, 0.8920053, -2.068893, 1, 1, 1, 1, 1,
-1.269265, 0.4960843, -1.28672, 1, 1, 1, 1, 1,
-1.265498, 0.255897, -0.6323618, 0, 0, 1, 1, 1,
-1.262411, -0.912429, -2.37843, 1, 0, 0, 1, 1,
-1.253331, -1.110558, -0.7360033, 1, 0, 0, 1, 1,
-1.247898, -1.654978, -2.893137, 1, 0, 0, 1, 1,
-1.246775, -0.5388542, -1.196068, 1, 0, 0, 1, 1,
-1.239917, 0.9828673, 2.356225, 1, 0, 0, 1, 1,
-1.236179, 0.5683281, -1.972784, 0, 0, 0, 1, 1,
-1.232475, 0.7351447, -0.333808, 0, 0, 0, 1, 1,
-1.205233, 1.189555, -0.6611964, 0, 0, 0, 1, 1,
-1.187178, -0.4559556, -3.425463, 0, 0, 0, 1, 1,
-1.186108, 0.2751565, -2.406624, 0, 0, 0, 1, 1,
-1.18103, -0.2846682, -4.885082, 0, 0, 0, 1, 1,
-1.177609, 0.4229598, 0.2794682, 0, 0, 0, 1, 1,
-1.167495, -0.5771342, -1.662048, 1, 1, 1, 1, 1,
-1.165269, -0.3731945, -0.9349568, 1, 1, 1, 1, 1,
-1.164465, 1.479592, -0.2509885, 1, 1, 1, 1, 1,
-1.14777, 0.5142549, -1.868014, 1, 1, 1, 1, 1,
-1.144966, -0.07427056, -0.7795218, 1, 1, 1, 1, 1,
-1.138226, -0.2263856, -1.677542, 1, 1, 1, 1, 1,
-1.135535, 0.1096725, -1.849318, 1, 1, 1, 1, 1,
-1.135001, -0.2571718, -2.035793, 1, 1, 1, 1, 1,
-1.132351, -1.003532, -2.792166, 1, 1, 1, 1, 1,
-1.131583, -1.250618, -2.435535, 1, 1, 1, 1, 1,
-1.127644, 0.02087136, -3.243284, 1, 1, 1, 1, 1,
-1.117519, -0.1173567, -2.418132, 1, 1, 1, 1, 1,
-1.11475, -0.1224746, -2.815722, 1, 1, 1, 1, 1,
-1.110523, -0.504813, -1.155494, 1, 1, 1, 1, 1,
-1.107242, 1.069903, -0.3777151, 1, 1, 1, 1, 1,
-1.103917, -1.447449, -4.091857, 0, 0, 1, 1, 1,
-1.102693, -1.146616, -3.121124, 1, 0, 0, 1, 1,
-1.100629, 0.9661708, -1.013826, 1, 0, 0, 1, 1,
-1.09246, -0.004545851, -1.60889, 1, 0, 0, 1, 1,
-1.086231, -0.4505602, -2.46338, 1, 0, 0, 1, 1,
-1.085501, -0.3172035, -1.026043, 1, 0, 0, 1, 1,
-1.083354, -2.182769, -4.988656, 0, 0, 0, 1, 1,
-1.080725, 0.6055294, -0.9808632, 0, 0, 0, 1, 1,
-1.074605, -0.6854689, -0.6228702, 0, 0, 0, 1, 1,
-1.073107, 1.290668, -0.4505543, 0, 0, 0, 1, 1,
-1.072604, 0.03430172, -3.070801, 0, 0, 0, 1, 1,
-1.070399, -0.7837414, -2.647487, 0, 0, 0, 1, 1,
-1.070083, -0.6219764, -3.401221, 0, 0, 0, 1, 1,
-1.059735, 0.9312231, 0.2237434, 1, 1, 1, 1, 1,
-1.044555, 0.9076642, -0.5583611, 1, 1, 1, 1, 1,
-1.042327, 0.1595316, -0.8958564, 1, 1, 1, 1, 1,
-1.039621, 0.2948768, -3.322011, 1, 1, 1, 1, 1,
-1.032079, 1.194873, 0.3321804, 1, 1, 1, 1, 1,
-1.028683, -0.2906333, -2.284543, 1, 1, 1, 1, 1,
-1.022763, 0.09535554, -0.2010882, 1, 1, 1, 1, 1,
-1.013102, -0.8707004, -2.490686, 1, 1, 1, 1, 1,
-1.012366, -0.9505475, -2.260184, 1, 1, 1, 1, 1,
-1.007263, -0.6986646, -1.179869, 1, 1, 1, 1, 1,
-1.00288, -1.601054, -4.730779, 1, 1, 1, 1, 1,
-1.000286, 0.2861403, -0.564257, 1, 1, 1, 1, 1,
-0.9999251, -1.386378, -5.616108, 1, 1, 1, 1, 1,
-0.9919932, -1.871302, -5.196504, 1, 1, 1, 1, 1,
-0.9893572, -1.095363, -2.028298, 1, 1, 1, 1, 1,
-0.9803563, 0.245458, -0.05870359, 0, 0, 1, 1, 1,
-0.9790722, 0.895005, -0.509753, 1, 0, 0, 1, 1,
-0.9776668, -0.1886597, -1.187698, 1, 0, 0, 1, 1,
-0.9738902, -0.1539023, -1.297338, 1, 0, 0, 1, 1,
-0.9706435, 0.1363773, -3.373811, 1, 0, 0, 1, 1,
-0.9692277, 2.466427, 0.7745455, 1, 0, 0, 1, 1,
-0.9618742, -1.01218, -2.621952, 0, 0, 0, 1, 1,
-0.9562017, -0.6463758, -2.839458, 0, 0, 0, 1, 1,
-0.9518296, 0.5874614, -3.375611, 0, 0, 0, 1, 1,
-0.9414122, 0.893996, -0.2654352, 0, 0, 0, 1, 1,
-0.9353065, -0.5877264, -3.341326, 0, 0, 0, 1, 1,
-0.9332017, -2.14886, -1.115863, 0, 0, 0, 1, 1,
-0.9330548, -0.2903174, -2.973557, 0, 0, 0, 1, 1,
-0.9105124, -1.220492, -2.339448, 1, 1, 1, 1, 1,
-0.9049008, -0.05962454, -1.822757, 1, 1, 1, 1, 1,
-0.9048434, 0.7068875, -1.162213, 1, 1, 1, 1, 1,
-0.9038734, -0.05834799, 0.2846079, 1, 1, 1, 1, 1,
-0.8896471, 1.919856, -0.5437061, 1, 1, 1, 1, 1,
-0.887831, -0.6776213, -2.946082, 1, 1, 1, 1, 1,
-0.8838237, -0.08199201, -2.174139, 1, 1, 1, 1, 1,
-0.8807347, -0.9194081, -4.89902, 1, 1, 1, 1, 1,
-0.8754844, 0.02752791, -0.718237, 1, 1, 1, 1, 1,
-0.8651898, -1.040244, -0.3428474, 1, 1, 1, 1, 1,
-0.8600897, -1.683878, -0.1948658, 1, 1, 1, 1, 1,
-0.8588315, 0.6132475, -1.214161, 1, 1, 1, 1, 1,
-0.8567408, -0.009646681, -1.68611, 1, 1, 1, 1, 1,
-0.8531853, 0.7031744, -0.1918547, 1, 1, 1, 1, 1,
-0.8527515, -0.1160285, -1.233641, 1, 1, 1, 1, 1,
-0.8513546, -0.7348524, -1.179218, 0, 0, 1, 1, 1,
-0.8353012, -1.824385, -3.630208, 1, 0, 0, 1, 1,
-0.8342958, -0.5291064, -2.824073, 1, 0, 0, 1, 1,
-0.8321854, -0.07406651, 0.3194033, 1, 0, 0, 1, 1,
-0.8317447, -0.6906643, -2.079833, 1, 0, 0, 1, 1,
-0.8310791, -0.07125061, -0.9193514, 1, 0, 0, 1, 1,
-0.8274489, 0.6110798, -1.348433, 0, 0, 0, 1, 1,
-0.826026, -1.029572, -2.796947, 0, 0, 0, 1, 1,
-0.8247725, -1.930529, -3.11526, 0, 0, 0, 1, 1,
-0.8191659, 1.10758, -0.4968597, 0, 0, 0, 1, 1,
-0.8070921, 0.9284683, -0.314402, 0, 0, 0, 1, 1,
-0.8068857, 1.119167, -1.344017, 0, 0, 0, 1, 1,
-0.7843859, -0.08278356, -2.18933, 0, 0, 0, 1, 1,
-0.7835757, -0.7955132, -1.879885, 1, 1, 1, 1, 1,
-0.7835096, 0.7211505, -2.183273, 1, 1, 1, 1, 1,
-0.7823153, 0.778114, -0.9360904, 1, 1, 1, 1, 1,
-0.7776164, 1.420901, -2.143909, 1, 1, 1, 1, 1,
-0.7739581, -0.1850889, -3.133034, 1, 1, 1, 1, 1,
-0.766494, -0.3568336, -2.873667, 1, 1, 1, 1, 1,
-0.7616696, 1.964298, -0.6854264, 1, 1, 1, 1, 1,
-0.7561893, 0.8937345, 0.227384, 1, 1, 1, 1, 1,
-0.7560784, -0.0263792, -1.420905, 1, 1, 1, 1, 1,
-0.7545325, -2.58107, -3.138024, 1, 1, 1, 1, 1,
-0.7543991, -0.1162191, -1.017439, 1, 1, 1, 1, 1,
-0.7516935, -0.7292343, -3.10289, 1, 1, 1, 1, 1,
-0.7451933, -0.4446865, -1.955182, 1, 1, 1, 1, 1,
-0.7444173, 0.6549317, -1.83338, 1, 1, 1, 1, 1,
-0.744341, -1.840491, -3.009401, 1, 1, 1, 1, 1,
-0.741914, -1.384726, -1.13455, 0, 0, 1, 1, 1,
-0.7415881, -0.06783188, 0.1792966, 1, 0, 0, 1, 1,
-0.7388372, -0.5698804, -2.923451, 1, 0, 0, 1, 1,
-0.7369542, 2.16464, -0.3311154, 1, 0, 0, 1, 1,
-0.7337461, -0.1039705, -2.911949, 1, 0, 0, 1, 1,
-0.7334698, -0.7596828, -3.260369, 1, 0, 0, 1, 1,
-0.7303057, -0.005851691, -0.105123, 0, 0, 0, 1, 1,
-0.7297009, 0.7506295, 0.8123538, 0, 0, 0, 1, 1,
-0.7258899, -0.3309705, -0.8610047, 0, 0, 0, 1, 1,
-0.7189968, 0.08733714, -1.598711, 0, 0, 0, 1, 1,
-0.7178774, 2.478685, -0.281936, 0, 0, 0, 1, 1,
-0.71675, 0.006459085, -0.7499807, 0, 0, 0, 1, 1,
-0.7156096, -0.7963269, -1.932517, 0, 0, 0, 1, 1,
-0.7142227, -0.5157257, -2.804831, 1, 1, 1, 1, 1,
-0.7103506, -0.9058197, -2.772779, 1, 1, 1, 1, 1,
-0.7092375, -0.7177738, -2.211274, 1, 1, 1, 1, 1,
-0.7086171, 0.1350465, -2.595763, 1, 1, 1, 1, 1,
-0.7049392, 0.6420348, -0.870562, 1, 1, 1, 1, 1,
-0.6963928, 1.180445, -1.172611, 1, 1, 1, 1, 1,
-0.6949726, -1.655722, -3.541816, 1, 1, 1, 1, 1,
-0.694075, -0.3884819, -1.511609, 1, 1, 1, 1, 1,
-0.6934869, -1.175463, -2.038996, 1, 1, 1, 1, 1,
-0.6915528, -0.4421156, -1.677469, 1, 1, 1, 1, 1,
-0.6888314, 1.348258, -0.6148606, 1, 1, 1, 1, 1,
-0.6868917, -1.175299, -3.497435, 1, 1, 1, 1, 1,
-0.6838712, -0.1497058, -1.548401, 1, 1, 1, 1, 1,
-0.6821536, 1.606271, -1.609389, 1, 1, 1, 1, 1,
-0.6780772, -0.5482823, -0.7361655, 1, 1, 1, 1, 1,
-0.6653084, -1.454561, -0.5838979, 0, 0, 1, 1, 1,
-0.6576272, -0.3492556, -4.365723, 1, 0, 0, 1, 1,
-0.6528257, 0.9174441, -1.089358, 1, 0, 0, 1, 1,
-0.6516902, -0.5590018, -1.575756, 1, 0, 0, 1, 1,
-0.6408266, 1.781626, 0.1119502, 1, 0, 0, 1, 1,
-0.6277082, 0.199643, -0.1732888, 1, 0, 0, 1, 1,
-0.6136313, 1.175225, 0.4962393, 0, 0, 0, 1, 1,
-0.611231, -0.8224683, -2.789784, 0, 0, 0, 1, 1,
-0.6104775, 0.2662733, 1.188012, 0, 0, 0, 1, 1,
-0.5993311, 1.348081, -0.1987686, 0, 0, 0, 1, 1,
-0.5977367, 1.064, -1.057754, 0, 0, 0, 1, 1,
-0.5768313, 0.5396696, -1.478539, 0, 0, 0, 1, 1,
-0.5767914, -0.3210565, -0.3016217, 0, 0, 0, 1, 1,
-0.5748159, -0.6118794, -1.710455, 1, 1, 1, 1, 1,
-0.5730577, -0.1731758, -2.086566, 1, 1, 1, 1, 1,
-0.5722097, -1.347496, -2.791995, 1, 1, 1, 1, 1,
-0.5701541, 0.3767124, -0.5311766, 1, 1, 1, 1, 1,
-0.5673751, 0.2397579, -2.913153, 1, 1, 1, 1, 1,
-0.5660382, 0.02966414, -2.936764, 1, 1, 1, 1, 1,
-0.565395, 0.5972635, 0.1692474, 1, 1, 1, 1, 1,
-0.5621436, 0.110636, -0.1078122, 1, 1, 1, 1, 1,
-0.5561821, 0.6127615, -0.927259, 1, 1, 1, 1, 1,
-0.5544336, 0.449914, -0.6032683, 1, 1, 1, 1, 1,
-0.553625, -0.1279514, -1.228879, 1, 1, 1, 1, 1,
-0.5516699, 0.09431009, -0.1955679, 1, 1, 1, 1, 1,
-0.5383983, -0.01793229, -1.71789, 1, 1, 1, 1, 1,
-0.5353317, 0.3408966, -0.1228966, 1, 1, 1, 1, 1,
-0.5334059, 1.935449, -0.2449058, 1, 1, 1, 1, 1,
-0.5311568, -1.581264, -1.737074, 0, 0, 1, 1, 1,
-0.5298907, 1.558884, -0.5069544, 1, 0, 0, 1, 1,
-0.5260596, -0.3425356, -2.603874, 1, 0, 0, 1, 1,
-0.5235516, -1.932483, -2.037194, 1, 0, 0, 1, 1,
-0.5231242, 1.184903, 0.6010947, 1, 0, 0, 1, 1,
-0.5197621, -2.051252, -1.837768, 1, 0, 0, 1, 1,
-0.5184135, -1.25275, -2.238692, 0, 0, 0, 1, 1,
-0.5143822, 0.5457278, -3.245845, 0, 0, 0, 1, 1,
-0.5141478, -0.9729475, -1.865075, 0, 0, 0, 1, 1,
-0.5122328, 0.686361, -0.1460673, 0, 0, 0, 1, 1,
-0.5114064, 1.910485, -0.8396276, 0, 0, 0, 1, 1,
-0.5089585, 0.8734476, -1.869177, 0, 0, 0, 1, 1,
-0.5083392, -0.1379502, -3.777477, 0, 0, 0, 1, 1,
-0.5068445, 0.3872534, -1.372667, 1, 1, 1, 1, 1,
-0.5062949, -0.2785843, -1.059974, 1, 1, 1, 1, 1,
-0.5040851, -0.3331806, -3.640774, 1, 1, 1, 1, 1,
-0.5010792, 0.2573765, -0.3225424, 1, 1, 1, 1, 1,
-0.4980291, -1.649637, -1.8035, 1, 1, 1, 1, 1,
-0.4969533, 0.5101812, -0.7507424, 1, 1, 1, 1, 1,
-0.4941731, 0.8175286, -0.07924314, 1, 1, 1, 1, 1,
-0.4913439, -0.06523802, -2.818877, 1, 1, 1, 1, 1,
-0.4884329, -0.335541, -0.09880595, 1, 1, 1, 1, 1,
-0.4869246, -0.7868671, -3.852175, 1, 1, 1, 1, 1,
-0.4864737, -1.930828, -2.418888, 1, 1, 1, 1, 1,
-0.4854702, 2.296062, -0.5431348, 1, 1, 1, 1, 1,
-0.4817758, 0.7280596, -0.3019493, 1, 1, 1, 1, 1,
-0.4807644, -0.5975481, -0.7326209, 1, 1, 1, 1, 1,
-0.4805844, -0.209862, -1.530874, 1, 1, 1, 1, 1,
-0.4803774, -0.5726852, -2.193205, 0, 0, 1, 1, 1,
-0.4788563, -0.4201961, -2.215067, 1, 0, 0, 1, 1,
-0.4734352, -1.872869, -2.080901, 1, 0, 0, 1, 1,
-0.4718959, -0.3708455, -1.660091, 1, 0, 0, 1, 1,
-0.4633698, 1.119239, 0.2543326, 1, 0, 0, 1, 1,
-0.462938, 0.1913428, -1.281594, 1, 0, 0, 1, 1,
-0.4628532, 1.154419, 0.6624973, 0, 0, 0, 1, 1,
-0.460033, -0.5789236, -1.696457, 0, 0, 0, 1, 1,
-0.4520622, -2.978714, -2.198922, 0, 0, 0, 1, 1,
-0.4507843, -0.007485616, -0.6109721, 0, 0, 0, 1, 1,
-0.4500543, -0.7159076, -2.93887, 0, 0, 0, 1, 1,
-0.4496416, -1.61903, -3.476723, 0, 0, 0, 1, 1,
-0.4494904, 0.5868248, 1.927374, 0, 0, 0, 1, 1,
-0.4472441, -0.93929, -3.12547, 1, 1, 1, 1, 1,
-0.4434223, -1.081604, -3.190963, 1, 1, 1, 1, 1,
-0.4407277, 0.7071165, -0.5177727, 1, 1, 1, 1, 1,
-0.4352076, -0.2855091, -1.521869, 1, 1, 1, 1, 1,
-0.4288029, -0.9815976, -3.419544, 1, 1, 1, 1, 1,
-0.4278895, 1.157296, -0.6308875, 1, 1, 1, 1, 1,
-0.4221182, 0.3913879, -0.6761318, 1, 1, 1, 1, 1,
-0.4209225, -0.4522285, -3.227726, 1, 1, 1, 1, 1,
-0.4171129, 0.1684748, -1.380801, 1, 1, 1, 1, 1,
-0.4153573, -1.874747, -3.230968, 1, 1, 1, 1, 1,
-0.4152343, -0.8522564, -3.296642, 1, 1, 1, 1, 1,
-0.413893, -0.6128746, -1.061955, 1, 1, 1, 1, 1,
-0.4117359, -1.324265, -2.197826, 1, 1, 1, 1, 1,
-0.4100426, 1.019791, -0.7532328, 1, 1, 1, 1, 1,
-0.4072691, 0.9585824, 0.08748502, 1, 1, 1, 1, 1,
-0.4049794, -0.04976238, 0.1787563, 0, 0, 1, 1, 1,
-0.4037901, -1.159152, -2.731592, 1, 0, 0, 1, 1,
-0.4030313, -1.965507, -1.832888, 1, 0, 0, 1, 1,
-0.3983285, -0.07501642, -2.972317, 1, 0, 0, 1, 1,
-0.3976769, 0.6204674, -1.277867, 1, 0, 0, 1, 1,
-0.3975827, -0.09584741, -2.552059, 1, 0, 0, 1, 1,
-0.3971981, -0.2020152, -1.892011, 0, 0, 0, 1, 1,
-0.3956124, -0.7481316, -2.252119, 0, 0, 0, 1, 1,
-0.3952285, 1.7344, -0.1462178, 0, 0, 0, 1, 1,
-0.3910843, 1.063798, -0.08760598, 0, 0, 0, 1, 1,
-0.3873349, -0.9358909, -2.52152, 0, 0, 0, 1, 1,
-0.3838806, 1.235362, 1.897172, 0, 0, 0, 1, 1,
-0.383334, 1.820431, 0.3385809, 0, 0, 0, 1, 1,
-0.3714214, 1.16415, 0.2116297, 1, 1, 1, 1, 1,
-0.365604, 0.006208927, -2.604589, 1, 1, 1, 1, 1,
-0.3592018, 0.8301931, 0.08856598, 1, 1, 1, 1, 1,
-0.3563279, -0.937283, -3.63716, 1, 1, 1, 1, 1,
-0.3557859, 1.714353, -2.335275, 1, 1, 1, 1, 1,
-0.3554158, 0.3428112, -1.433793, 1, 1, 1, 1, 1,
-0.3529951, -0.1926938, -3.41301, 1, 1, 1, 1, 1,
-0.3527013, -1.256988, -1.649928, 1, 1, 1, 1, 1,
-0.3484674, 0.6968144, 0.3528875, 1, 1, 1, 1, 1,
-0.348, -0.05306547, -1.430244, 1, 1, 1, 1, 1,
-0.347887, -1.058606, -2.854209, 1, 1, 1, 1, 1,
-0.3447472, 0.3896666, -1.624106, 1, 1, 1, 1, 1,
-0.3438673, -0.5435901, -0.6038308, 1, 1, 1, 1, 1,
-0.3430021, 0.9944115, 1.442323, 1, 1, 1, 1, 1,
-0.3397091, -1.06873, -4.671154, 1, 1, 1, 1, 1,
-0.3384264, 0.02760973, -1.061676, 0, 0, 1, 1, 1,
-0.3381036, -0.6124234, -0.5580267, 1, 0, 0, 1, 1,
-0.335093, 0.171579, 0.4807898, 1, 0, 0, 1, 1,
-0.3273999, -1.85823, -3.303988, 1, 0, 0, 1, 1,
-0.3232596, 0.7450032, 1.331245, 1, 0, 0, 1, 1,
-0.3221009, 0.8893284, -0.7746408, 1, 0, 0, 1, 1,
-0.3134795, -0.276929, -2.874772, 0, 0, 0, 1, 1,
-0.3134642, 0.9793777, -0.3916535, 0, 0, 0, 1, 1,
-0.3112768, -2.047748, -2.869586, 0, 0, 0, 1, 1,
-0.3105584, -1.018529, -2.037144, 0, 0, 0, 1, 1,
-0.3072691, -1.838087, -3.048641, 0, 0, 0, 1, 1,
-0.3062022, -1.004781, -3.290445, 0, 0, 0, 1, 1,
-0.3047744, -0.5002292, -2.478959, 0, 0, 0, 1, 1,
-0.3030078, -0.8725342, -2.830178, 1, 1, 1, 1, 1,
-0.3027937, 0.1073899, -2.085534, 1, 1, 1, 1, 1,
-0.3004502, -1.122771, -0.7771262, 1, 1, 1, 1, 1,
-0.3000387, -0.8873259, -1.879992, 1, 1, 1, 1, 1,
-0.2991973, -1.728972, -1.952655, 1, 1, 1, 1, 1,
-0.2962732, -0.04955563, -2.855338, 1, 1, 1, 1, 1,
-0.2957712, -1.139, -2.93108, 1, 1, 1, 1, 1,
-0.2936857, -0.5100208, -2.052342, 1, 1, 1, 1, 1,
-0.2933505, -0.2511013, -1.344075, 1, 1, 1, 1, 1,
-0.2927157, 0.0492609, -2.722194, 1, 1, 1, 1, 1,
-0.2896679, -1.240676, -3.6633, 1, 1, 1, 1, 1,
-0.2857572, 1.530604, -1.149766, 1, 1, 1, 1, 1,
-0.2839888, 2.881068, -1.47309, 1, 1, 1, 1, 1,
-0.283555, 1.414509, 0.02954466, 1, 1, 1, 1, 1,
-0.2826478, -1.686808, -2.198735, 1, 1, 1, 1, 1,
-0.2765679, 0.2748254, -1.39235, 0, 0, 1, 1, 1,
-0.2565634, -0.487509, -2.403884, 1, 0, 0, 1, 1,
-0.2469703, 0.2583016, -1.619692, 1, 0, 0, 1, 1,
-0.2459396, 0.01453391, 0.9737622, 1, 0, 0, 1, 1,
-0.2442767, -1.408571, -3.182021, 1, 0, 0, 1, 1,
-0.2338115, 0.02376894, -0.004757059, 1, 0, 0, 1, 1,
-0.2323398, -0.096558, -3.196991, 0, 0, 0, 1, 1,
-0.2255883, -0.5875961, -3.484187, 0, 0, 0, 1, 1,
-0.2239186, 1.200125, 0.4106468, 0, 0, 0, 1, 1,
-0.2200625, 0.5234425, -2.002744, 0, 0, 0, 1, 1,
-0.2179684, 0.7443421, -0.01382897, 0, 0, 0, 1, 1,
-0.216491, 0.6771646, -0.1363756, 0, 0, 0, 1, 1,
-0.2158011, 1.47508, -0.5484576, 0, 0, 0, 1, 1,
-0.2124268, 0.05526036, -1.402766, 1, 1, 1, 1, 1,
-0.2087926, 0.5065911, -1.166561, 1, 1, 1, 1, 1,
-0.2084388, 1.542418, -0.476749, 1, 1, 1, 1, 1,
-0.2050308, 1.112248, -0.2797358, 1, 1, 1, 1, 1,
-0.2026398, 0.4855207, 0.1812187, 1, 1, 1, 1, 1,
-0.2020609, -0.01289073, -0.9431334, 1, 1, 1, 1, 1,
-0.2012817, 1.972035, -0.984975, 1, 1, 1, 1, 1,
-0.2004247, -2.674261, -1.280859, 1, 1, 1, 1, 1,
-0.1986807, -1.074365, -4.964165, 1, 1, 1, 1, 1,
-0.191672, -0.6247544, -3.387569, 1, 1, 1, 1, 1,
-0.1897453, 0.7669175, 0.9720149, 1, 1, 1, 1, 1,
-0.1890969, 0.9960328, -2.376884, 1, 1, 1, 1, 1,
-0.1881652, -0.1778773, -4.637436, 1, 1, 1, 1, 1,
-0.1870556, -0.2067468, -0.9144209, 1, 1, 1, 1, 1,
-0.1849612, 0.79618, 0.5572547, 1, 1, 1, 1, 1,
-0.1838873, -1.194289, -4.250465, 0, 0, 1, 1, 1,
-0.182294, -0.3176329, -3.308464, 1, 0, 0, 1, 1,
-0.1791879, -1.413264, -1.276676, 1, 0, 0, 1, 1,
-0.1783646, 1.014925, 0.05988928, 1, 0, 0, 1, 1,
-0.176669, -0.6168311, -3.384916, 1, 0, 0, 1, 1,
-0.1742959, -1.217598, -3.749549, 1, 0, 0, 1, 1,
-0.1693839, 1.383729, 0.02786454, 0, 0, 0, 1, 1,
-0.169224, 0.1682152, -1.977638, 0, 0, 0, 1, 1,
-0.16468, -0.3154331, -2.736281, 0, 0, 0, 1, 1,
-0.1596355, -1.060741, -1.690114, 0, 0, 0, 1, 1,
-0.1533042, 0.2746489, -0.1373533, 0, 0, 0, 1, 1,
-0.1515848, -0.3478348, -5.429912, 0, 0, 0, 1, 1,
-0.1475295, 2.125075, -0.2810643, 0, 0, 0, 1, 1,
-0.142978, -0.2682606, -0.438882, 1, 1, 1, 1, 1,
-0.1377953, 0.5381517, 0.6696132, 1, 1, 1, 1, 1,
-0.1360676, -1.288462, -3.310077, 1, 1, 1, 1, 1,
-0.135019, -0.2678597, -1.284854, 1, 1, 1, 1, 1,
-0.1313118, -0.751458, -1.981597, 1, 1, 1, 1, 1,
-0.1311866, -1.164839, -2.590809, 1, 1, 1, 1, 1,
-0.1280287, -0.9482896, -3.162702, 1, 1, 1, 1, 1,
-0.122238, -0.8771461, -4.08259, 1, 1, 1, 1, 1,
-0.1207544, 0.5468168, -0.5559739, 1, 1, 1, 1, 1,
-0.1195783, 0.8401887, 0.0927458, 1, 1, 1, 1, 1,
-0.1168798, -0.6314157, -4.047204, 1, 1, 1, 1, 1,
-0.1167631, 0.1633292, 1.429442, 1, 1, 1, 1, 1,
-0.1130526, 0.8519804, 1.222081, 1, 1, 1, 1, 1,
-0.1114847, -0.3131285, -3.852108, 1, 1, 1, 1, 1,
-0.110724, 0.05249421, -0.4108216, 1, 1, 1, 1, 1,
-0.1100532, 0.9660248, -1.356849, 0, 0, 1, 1, 1,
-0.1098954, -1.836329, -3.163453, 1, 0, 0, 1, 1,
-0.1069705, -0.6467389, -3.836771, 1, 0, 0, 1, 1,
-0.1064153, -0.645538, -2.20503, 1, 0, 0, 1, 1,
-0.104046, -0.747771, -2.290277, 1, 0, 0, 1, 1,
-0.1019743, -1.122173, -4.903058, 1, 0, 0, 1, 1,
-0.1005466, 0.2983254, -0.02478253, 0, 0, 0, 1, 1,
-0.09907752, -1.261495, -0.5957838, 0, 0, 0, 1, 1,
-0.09905984, 0.4120756, -0.4690339, 0, 0, 0, 1, 1,
-0.09700365, -1.139457, -1.624581, 0, 0, 0, 1, 1,
-0.09511179, -0.9008967, -3.082069, 0, 0, 0, 1, 1,
-0.09304962, -0.5544989, -1.659763, 0, 0, 0, 1, 1,
-0.09283528, 0.4272603, -1.267679, 0, 0, 0, 1, 1,
-0.09257665, 0.8569613, 0.654044, 1, 1, 1, 1, 1,
-0.09228417, -0.8085771, -3.594826, 1, 1, 1, 1, 1,
-0.08812872, 1.924924, 0.2779489, 1, 1, 1, 1, 1,
-0.08737989, -1.56819, -2.554423, 1, 1, 1, 1, 1,
-0.08681113, -0.7615442, -3.602524, 1, 1, 1, 1, 1,
-0.08380312, -0.9870949, -3.755206, 1, 1, 1, 1, 1,
-0.08153518, 0.3492219, -0.3981566, 1, 1, 1, 1, 1,
-0.07940644, 0.7165833, -1.138268, 1, 1, 1, 1, 1,
-0.07858031, 0.76272, -1.507545, 1, 1, 1, 1, 1,
-0.07714142, 1.299275, -0.6215848, 1, 1, 1, 1, 1,
-0.07066805, 0.8418638, -1.171525, 1, 1, 1, 1, 1,
-0.07002788, 1.560946, -0.7556521, 1, 1, 1, 1, 1,
-0.06874292, 1.016715, -0.4208973, 1, 1, 1, 1, 1,
-0.06820988, -0.2239458, -2.020974, 1, 1, 1, 1, 1,
-0.06815802, -0.374775, -2.392404, 1, 1, 1, 1, 1,
-0.06785429, 0.2926823, -2.051937, 0, 0, 1, 1, 1,
-0.06727201, 0.9015064, -1.781515, 1, 0, 0, 1, 1,
-0.0649633, -0.4894472, -2.188201, 1, 0, 0, 1, 1,
-0.06495243, 1.9656, 1.513929, 1, 0, 0, 1, 1,
-0.06238917, 0.06707677, -1.505384, 1, 0, 0, 1, 1,
-0.05720779, 0.5702039, 0.5320182, 1, 0, 0, 1, 1,
-0.05627725, -0.8915107, -2.873642, 0, 0, 0, 1, 1,
-0.04336785, 0.02173199, -3.614973, 0, 0, 0, 1, 1,
-0.03887422, 0.4128246, -0.9158058, 0, 0, 0, 1, 1,
-0.0354392, -0.4265586, -2.609918, 0, 0, 0, 1, 1,
-0.02954287, 0.4806732, -2.420106, 0, 0, 0, 1, 1,
-0.02225473, 2.213196, -0.6845505, 0, 0, 0, 1, 1,
-0.01102905, 0.313102, 0.4629486, 0, 0, 0, 1, 1,
-0.001127077, 0.9170573, -1.733439, 1, 1, 1, 1, 1,
0.001149207, -0.5578544, 2.846494, 1, 1, 1, 1, 1,
0.006328485, 0.906732, 0.2787616, 1, 1, 1, 1, 1,
0.006898402, -1.457361, 4.826212, 1, 1, 1, 1, 1,
0.00740943, 0.8365805, -0.1881813, 1, 1, 1, 1, 1,
0.009884638, 0.951259, -1.372231, 1, 1, 1, 1, 1,
0.01042159, -1.294902, 2.446106, 1, 1, 1, 1, 1,
0.01376918, -0.6394891, 1.462133, 1, 1, 1, 1, 1,
0.01416954, -0.3337193, 2.745468, 1, 1, 1, 1, 1,
0.01419096, 2.362697, -0.7672089, 1, 1, 1, 1, 1,
0.01942133, -1.386808, 1.547971, 1, 1, 1, 1, 1,
0.02040355, -0.2190731, 1.190495, 1, 1, 1, 1, 1,
0.02255172, -0.3996935, 2.210006, 1, 1, 1, 1, 1,
0.02599179, 0.6498992, -0.02949913, 1, 1, 1, 1, 1,
0.02620327, -1.29304, 4.397215, 1, 1, 1, 1, 1,
0.0284211, 1.843675, 0.02851015, 0, 0, 1, 1, 1,
0.02978172, -1.02833, 2.986326, 1, 0, 0, 1, 1,
0.03054133, 0.4024062, -1.28176, 1, 0, 0, 1, 1,
0.0319593, -0.7840527, 1.698556, 1, 0, 0, 1, 1,
0.0358281, 1.215632, 0.2548028, 1, 0, 0, 1, 1,
0.03659759, -0.8788509, 3.515292, 1, 0, 0, 1, 1,
0.03821525, 0.2985635, -0.4659438, 0, 0, 0, 1, 1,
0.03914486, 1.39124, 0.1880366, 0, 0, 0, 1, 1,
0.04042761, 0.9166995, 0.6502473, 0, 0, 0, 1, 1,
0.04360431, -1.266968, 2.013183, 0, 0, 0, 1, 1,
0.0438859, -0.9861972, 4.307605, 0, 0, 0, 1, 1,
0.04469752, -0.3457599, 1.256145, 0, 0, 0, 1, 1,
0.04576721, -0.605866, 3.289897, 0, 0, 0, 1, 1,
0.04585644, -1.436049, 3.005289, 1, 1, 1, 1, 1,
0.04596009, 0.5620574, 0.5973952, 1, 1, 1, 1, 1,
0.04745825, -0.4851841, 2.896023, 1, 1, 1, 1, 1,
0.04802852, -0.3217463, 2.182883, 1, 1, 1, 1, 1,
0.05035941, -1.332684, 1.5259, 1, 1, 1, 1, 1,
0.05613009, -1.040356, 3.289884, 1, 1, 1, 1, 1,
0.05618615, -0.08361523, 2.454479, 1, 1, 1, 1, 1,
0.05906903, 0.08507577, 0.1630892, 1, 1, 1, 1, 1,
0.061328, -0.1880675, 3.778869, 1, 1, 1, 1, 1,
0.06677965, 1.632014, 1.596441, 1, 1, 1, 1, 1,
0.07310687, -0.523402, 1.385214, 1, 1, 1, 1, 1,
0.07703403, -0.9153154, 3.467011, 1, 1, 1, 1, 1,
0.0775651, 0.9644243, -0.5542623, 1, 1, 1, 1, 1,
0.07906397, 0.09754066, 1.638404, 1, 1, 1, 1, 1,
0.08282977, 1.185975, -0.6736961, 1, 1, 1, 1, 1,
0.08464345, -0.1751381, 1.460059, 0, 0, 1, 1, 1,
0.0905847, 0.2731314, -0.6088837, 1, 0, 0, 1, 1,
0.0908742, -0.7061531, 2.848477, 1, 0, 0, 1, 1,
0.09436645, -0.9477974, 4.064129, 1, 0, 0, 1, 1,
0.09474658, 1.089447, 1.330128, 1, 0, 0, 1, 1,
0.0950523, -0.5380552, 3.212456, 1, 0, 0, 1, 1,
0.09538118, 0.394923, -0.04842921, 0, 0, 0, 1, 1,
0.100353, -1.291592, 2.407351, 0, 0, 0, 1, 1,
0.1019078, 0.9257625, -0.7437661, 0, 0, 0, 1, 1,
0.1037003, 0.01715768, 2.494693, 0, 0, 0, 1, 1,
0.1053742, -0.6716141, 4.034127, 0, 0, 0, 1, 1,
0.107595, 0.9862528, -0.3464613, 0, 0, 0, 1, 1,
0.1103376, 0.2149108, 1.2177, 0, 0, 0, 1, 1,
0.1158751, 0.1194125, 0.8933139, 1, 1, 1, 1, 1,
0.11767, -0.2912625, 3.431431, 1, 1, 1, 1, 1,
0.1206077, 0.2375285, -0.07247116, 1, 1, 1, 1, 1,
0.1244102, 0.6821967, -1.728507, 1, 1, 1, 1, 1,
0.1248662, -0.1137546, 0.997032, 1, 1, 1, 1, 1,
0.1259538, -2.170474, 1.479042, 1, 1, 1, 1, 1,
0.1262625, 1.659209, 2.002589, 1, 1, 1, 1, 1,
0.1274216, 0.5292277, 0.5827799, 1, 1, 1, 1, 1,
0.1312872, -0.7821739, 3.967294, 1, 1, 1, 1, 1,
0.1317546, -1.255669, 1.967329, 1, 1, 1, 1, 1,
0.1356134, 1.561393, -1.463759, 1, 1, 1, 1, 1,
0.1366867, 1.102428, 1.436528, 1, 1, 1, 1, 1,
0.1383936, 1.056036, -0.3524481, 1, 1, 1, 1, 1,
0.1416605, -0.4919951, 3.84816, 1, 1, 1, 1, 1,
0.144162, 1.166436, 2.459928, 1, 1, 1, 1, 1,
0.1452688, 1.843591, 1.684632, 0, 0, 1, 1, 1,
0.1482726, 1.094087, 0.3584427, 1, 0, 0, 1, 1,
0.151652, -1.329921, 2.552716, 1, 0, 0, 1, 1,
0.1518271, 0.3654577, -0.1086978, 1, 0, 0, 1, 1,
0.1554372, 0.06760497, -0.3230604, 1, 0, 0, 1, 1,
0.155886, -0.6401625, 2.231341, 1, 0, 0, 1, 1,
0.1560656, 0.5778562, -1.268239, 0, 0, 0, 1, 1,
0.1620845, -0.8218029, 2.006147, 0, 0, 0, 1, 1,
0.1655311, 1.126937, -0.2757935, 0, 0, 0, 1, 1,
0.1681625, -0.1444707, -0.1229945, 0, 0, 0, 1, 1,
0.1779067, -0.9476718, 1.453556, 0, 0, 0, 1, 1,
0.1819518, -0.07876131, 1.314023, 0, 0, 0, 1, 1,
0.1837486, -0.5352474, 3.989525, 0, 0, 0, 1, 1,
0.1879159, 0.7292066, 0.941786, 1, 1, 1, 1, 1,
0.1925686, -0.4348413, 5.152277, 1, 1, 1, 1, 1,
0.1938439, 0.412573, 1.459032, 1, 1, 1, 1, 1,
0.1948378, 0.9490881, -0.1820349, 1, 1, 1, 1, 1,
0.1964366, 0.01280325, -0.1061617, 1, 1, 1, 1, 1,
0.1976624, -0.6140207, 3.481149, 1, 1, 1, 1, 1,
0.1984327, 1.308636, -1.027173, 1, 1, 1, 1, 1,
0.1993399, 0.2602357, -1.444304, 1, 1, 1, 1, 1,
0.2030151, -0.8088635, 4.005275, 1, 1, 1, 1, 1,
0.2032304, 2.214621, -0.3775111, 1, 1, 1, 1, 1,
0.203694, 0.2484684, 0.9951672, 1, 1, 1, 1, 1,
0.2056128, 2.463794, -1.517235, 1, 1, 1, 1, 1,
0.2148818, -1.063948, 1.02487, 1, 1, 1, 1, 1,
0.2187607, 1.470656, 0.8618302, 1, 1, 1, 1, 1,
0.2218501, 0.2874334, -0.1707419, 1, 1, 1, 1, 1,
0.2257717, -0.2845114, 2.423973, 0, 0, 1, 1, 1,
0.2283778, -0.1883881, 3.461792, 1, 0, 0, 1, 1,
0.2290182, 0.510083, 0.9091467, 1, 0, 0, 1, 1,
0.2292938, 0.07612674, 0.6745367, 1, 0, 0, 1, 1,
0.2325636, -0.3246436, 4.257936, 1, 0, 0, 1, 1,
0.233904, 0.1319278, 1.731265, 1, 0, 0, 1, 1,
0.2340612, 1.207961, 0.8576313, 0, 0, 0, 1, 1,
0.2362335, -0.3561372, 3.944904, 0, 0, 0, 1, 1,
0.244088, 0.8631527, 1.138864, 0, 0, 0, 1, 1,
0.2453058, -0.09762075, 2.809529, 0, 0, 0, 1, 1,
0.2560863, -0.4862124, 3.998959, 0, 0, 0, 1, 1,
0.2593857, -0.1765375, 3.059518, 0, 0, 0, 1, 1,
0.2620682, 0.1550928, 0.4253884, 0, 0, 0, 1, 1,
0.2680848, -0.6373516, 2.878678, 1, 1, 1, 1, 1,
0.2702096, 1.462728, -1.488509, 1, 1, 1, 1, 1,
0.2728465, 0.5701458, -0.01211864, 1, 1, 1, 1, 1,
0.2795695, 2.204579, -1.404734, 1, 1, 1, 1, 1,
0.2799681, -0.5365539, 3.0158, 1, 1, 1, 1, 1,
0.2839069, 2.105754, 0.02666829, 1, 1, 1, 1, 1,
0.284461, -0.6049473, 2.744482, 1, 1, 1, 1, 1,
0.2852468, -0.5887548, 3.740871, 1, 1, 1, 1, 1,
0.290593, -1.246251, 3.338486, 1, 1, 1, 1, 1,
0.2907543, -2.160712, 3.29702, 1, 1, 1, 1, 1,
0.2911872, 1.046845, 1.608845, 1, 1, 1, 1, 1,
0.2923496, 0.863043, 0.1758348, 1, 1, 1, 1, 1,
0.2930352, 0.9153504, 0.3891651, 1, 1, 1, 1, 1,
0.3052388, -0.3030598, -0.0733718, 1, 1, 1, 1, 1,
0.3091664, 0.4901234, -1.286319, 1, 1, 1, 1, 1,
0.3112819, 0.7527208, -0.1497091, 0, 0, 1, 1, 1,
0.3148998, -0.7467455, 2.9241, 1, 0, 0, 1, 1,
0.3164968, -1.532038, 3.278253, 1, 0, 0, 1, 1,
0.31924, 0.6215749, -0.3962036, 1, 0, 0, 1, 1,
0.3209524, 2.467101, 0.6239646, 1, 0, 0, 1, 1,
0.3211166, 2.77831, 0.1042187, 1, 0, 0, 1, 1,
0.3229874, -1.340313, 3.900876, 0, 0, 0, 1, 1,
0.3237212, -0.2107624, 4.172886, 0, 0, 0, 1, 1,
0.331856, -1.315127, 1.876903, 0, 0, 0, 1, 1,
0.3340306, -1.575779, 2.563879, 0, 0, 0, 1, 1,
0.3367864, 0.1537188, 3.14174, 0, 0, 0, 1, 1,
0.3405373, 0.02501707, 1.351443, 0, 0, 0, 1, 1,
0.3473154, -0.2403484, 1.261389, 0, 0, 0, 1, 1,
0.3480923, -0.7833899, 3.518669, 1, 1, 1, 1, 1,
0.3491105, -1.215418, 0.7158452, 1, 1, 1, 1, 1,
0.3497229, -0.3882627, 1.995684, 1, 1, 1, 1, 1,
0.3551175, 0.4207005, -0.4172415, 1, 1, 1, 1, 1,
0.3567963, -0.2064508, 2.422182, 1, 1, 1, 1, 1,
0.362255, -0.8011591, 3.113193, 1, 1, 1, 1, 1,
0.36695, -0.7131951, 2.815063, 1, 1, 1, 1, 1,
0.3693507, -0.4628309, 1.808494, 1, 1, 1, 1, 1,
0.3714775, 1.040545, 0.2496315, 1, 1, 1, 1, 1,
0.3718555, 0.1836839, 2.012712, 1, 1, 1, 1, 1,
0.3735459, -0.1931679, 1.619372, 1, 1, 1, 1, 1,
0.3781191, 0.3571856, 0.9558693, 1, 1, 1, 1, 1,
0.3791676, -0.4169944, 0.6009108, 1, 1, 1, 1, 1,
0.3794859, -0.3826415, 2.210297, 1, 1, 1, 1, 1,
0.3808896, 1.03918, 1.965815, 1, 1, 1, 1, 1,
0.3839164, -0.09125746, 3.791553, 0, 0, 1, 1, 1,
0.3839796, 2.22985, 0.7834986, 1, 0, 0, 1, 1,
0.3845617, 0.4518343, 0.9022239, 1, 0, 0, 1, 1,
0.3852948, -1.77163, 3.524311, 1, 0, 0, 1, 1,
0.3854492, 0.8773049, 0.8419434, 1, 0, 0, 1, 1,
0.3854873, 0.7415409, 0.1055443, 1, 0, 0, 1, 1,
0.3935277, 0.305129, -0.3285504, 0, 0, 0, 1, 1,
0.3993378, 0.8462119, 0.9567919, 0, 0, 0, 1, 1,
0.3998975, -0.6159779, 3.140528, 0, 0, 0, 1, 1,
0.4000441, -1.29348, 4.203889, 0, 0, 0, 1, 1,
0.4017782, -0.7503588, 2.319641, 0, 0, 0, 1, 1,
0.4066309, -1.870578, 2.363799, 0, 0, 0, 1, 1,
0.406754, -0.5733151, 4.504747, 0, 0, 0, 1, 1,
0.4079559, 1.13541, 1.081817, 1, 1, 1, 1, 1,
0.4097379, 0.3091207, 1.381102, 1, 1, 1, 1, 1,
0.4114673, -0.8722429, 2.147436, 1, 1, 1, 1, 1,
0.4115927, 2.411917, 0.9654802, 1, 1, 1, 1, 1,
0.4184521, 1.492298, -1.369672, 1, 1, 1, 1, 1,
0.421855, -0.7657598, 2.788887, 1, 1, 1, 1, 1,
0.422278, 1.976414, -0.007289763, 1, 1, 1, 1, 1,
0.4272633, -0.6981069, 2.636709, 1, 1, 1, 1, 1,
0.43563, 0.4022473, 1.801113, 1, 1, 1, 1, 1,
0.4368613, 0.3724186, 0.9207717, 1, 1, 1, 1, 1,
0.4383609, 0.04098983, 0.6874794, 1, 1, 1, 1, 1,
0.4396904, -0.8479016, 3.588067, 1, 1, 1, 1, 1,
0.4398672, -1.034384, 2.053924, 1, 1, 1, 1, 1,
0.440175, -0.353226, 2.119326, 1, 1, 1, 1, 1,
0.4410333, 0.4589319, -0.9658831, 1, 1, 1, 1, 1,
0.4456355, 0.3601416, -0.520696, 0, 0, 1, 1, 1,
0.446876, 1.579026, -0.2699426, 1, 0, 0, 1, 1,
0.4480251, -1.259382, 1.761195, 1, 0, 0, 1, 1,
0.4517744, -1.200254, 2.992633, 1, 0, 0, 1, 1,
0.4533767, 1.448189, 1.050139, 1, 0, 0, 1, 1,
0.4538328, -0.9359366, 0.597994, 1, 0, 0, 1, 1,
0.4584315, 1.26342, 0.9569001, 0, 0, 0, 1, 1,
0.459941, -0.2484058, 2.468828, 0, 0, 0, 1, 1,
0.460199, 0.6127213, -0.1273028, 0, 0, 0, 1, 1,
0.4676533, -1.617201, 2.98108, 0, 0, 0, 1, 1,
0.4684588, -0.03096584, 0.7694253, 0, 0, 0, 1, 1,
0.4707527, -0.2086525, 3.772659, 0, 0, 0, 1, 1,
0.4740352, 0.5870806, 1.698287, 0, 0, 0, 1, 1,
0.4844317, 0.858301, 0.4991584, 1, 1, 1, 1, 1,
0.4853225, -0.1367402, 1.735499, 1, 1, 1, 1, 1,
0.4858225, -1.595953, 1.591614, 1, 1, 1, 1, 1,
0.4865421, 0.4873403, 4.452711, 1, 1, 1, 1, 1,
0.4871085, 0.5468224, 1.08435, 1, 1, 1, 1, 1,
0.4874077, -1.629102, 2.26077, 1, 1, 1, 1, 1,
0.4913646, -0.9319849, 2.230006, 1, 1, 1, 1, 1,
0.4929707, 0.1051579, 1.10026, 1, 1, 1, 1, 1,
0.4964741, 0.8336292, 2.084831, 1, 1, 1, 1, 1,
0.4989367, 0.2599936, 0.9831458, 1, 1, 1, 1, 1,
0.5018601, -2.131307, 2.819874, 1, 1, 1, 1, 1,
0.5084917, -0.4380836, 3.736079, 1, 1, 1, 1, 1,
0.521076, -0.3926868, 2.226863, 1, 1, 1, 1, 1,
0.5256236, -0.3836465, 1.890641, 1, 1, 1, 1, 1,
0.5258162, 0.5075591, 1.671268, 1, 1, 1, 1, 1,
0.5408237, -0.5189841, 1.951385, 0, 0, 1, 1, 1,
0.5451855, -1.444024, 4.574113, 1, 0, 0, 1, 1,
0.5499637, -1.152484, 1.644378, 1, 0, 0, 1, 1,
0.5523034, 0.03835383, 0.5006683, 1, 0, 0, 1, 1,
0.5549154, 2.879297, 0.9452844, 1, 0, 0, 1, 1,
0.5608666, -0.7056627, 2.084552, 1, 0, 0, 1, 1,
0.5613154, -0.2234992, 3.502181, 0, 0, 0, 1, 1,
0.5634349, -1.240935, 2.305417, 0, 0, 0, 1, 1,
0.5667772, 1.770877, -0.8012, 0, 0, 0, 1, 1,
0.5692321, -0.9709979, 2.892133, 0, 0, 0, 1, 1,
0.5747436, 0.1080872, 2.330396, 0, 0, 0, 1, 1,
0.5784344, 0.6130751, -1.384041, 0, 0, 0, 1, 1,
0.5865342, 0.3318322, 2.250131, 0, 0, 0, 1, 1,
0.589467, -0.633921, -0.2634033, 1, 1, 1, 1, 1,
0.5912447, 1.061269, 1.78097, 1, 1, 1, 1, 1,
0.5953957, 1.134325, 1.218271, 1, 1, 1, 1, 1,
0.5992082, 0.09495901, 1.631574, 1, 1, 1, 1, 1,
0.6012623, -0.136587, 4.140207, 1, 1, 1, 1, 1,
0.6022112, 0.4634666, 1.55053, 1, 1, 1, 1, 1,
0.6047629, -0.737279, 2.857152, 1, 1, 1, 1, 1,
0.6068051, -0.5345814, 3.778125, 1, 1, 1, 1, 1,
0.606849, 0.4829648, -1.181435, 1, 1, 1, 1, 1,
0.6120279, -0.226681, 2.164568, 1, 1, 1, 1, 1,
0.6127701, -0.1864408, 2.585711, 1, 1, 1, 1, 1,
0.6175775, 1.37062, 0.5677625, 1, 1, 1, 1, 1,
0.6185885, 0.4310155, -1.548529, 1, 1, 1, 1, 1,
0.6207542, -0.1703197, 0.254734, 1, 1, 1, 1, 1,
0.6222535, 0.270409, 0.8724316, 1, 1, 1, 1, 1,
0.6223242, -0.7237582, 3.220072, 0, 0, 1, 1, 1,
0.6223833, -0.3363083, 1.675733, 1, 0, 0, 1, 1,
0.6326799, 0.3252909, 1.939713, 1, 0, 0, 1, 1,
0.6366084, 1.781326, -1.227045, 1, 0, 0, 1, 1,
0.6366352, -0.0420454, -0.7222725, 1, 0, 0, 1, 1,
0.6388154, 0.3022729, 0.682452, 1, 0, 0, 1, 1,
0.6396942, -0.2303028, 3.061007, 0, 0, 0, 1, 1,
0.6401042, 1.285056, 0.7262597, 0, 0, 0, 1, 1,
0.643538, -0.1814444, 1.737691, 0, 0, 0, 1, 1,
0.6472381, -0.1495071, 2.377088, 0, 0, 0, 1, 1,
0.6538991, -0.954846, 3.615653, 0, 0, 0, 1, 1,
0.6551579, -0.2927826, 2.341077, 0, 0, 0, 1, 1,
0.6600237, 0.902678, 0.5373032, 0, 0, 0, 1, 1,
0.6607308, 1.659518, -0.7878257, 1, 1, 1, 1, 1,
0.6642066, -1.114067, 0.5629644, 1, 1, 1, 1, 1,
0.664859, -0.7523961, 1.937743, 1, 1, 1, 1, 1,
0.6681837, 0.3102294, 2.762929, 1, 1, 1, 1, 1,
0.67612, -1.296012, 0.7054853, 1, 1, 1, 1, 1,
0.6763402, 0.4868219, 0.1115251, 1, 1, 1, 1, 1,
0.6790031, 1.560639, 0.7082734, 1, 1, 1, 1, 1,
0.6817138, -0.1926725, 2.641993, 1, 1, 1, 1, 1,
0.6839433, 0.5621333, 1.024927, 1, 1, 1, 1, 1,
0.6850015, 0.2924286, 0.04418036, 1, 1, 1, 1, 1,
0.6851144, -0.6049161, 3.006362, 1, 1, 1, 1, 1,
0.6901239, -0.7313616, 3.111205, 1, 1, 1, 1, 1,
0.6915728, 1.315274, 0.4965487, 1, 1, 1, 1, 1,
0.6957676, -2.037953, 1.892523, 1, 1, 1, 1, 1,
0.7002192, -0.01197633, 1.95775, 1, 1, 1, 1, 1,
0.7002593, -1.22614, 2.476607, 0, 0, 1, 1, 1,
0.7002738, -0.7347335, 0.8347015, 1, 0, 0, 1, 1,
0.7014257, -0.101021, 1.258684, 1, 0, 0, 1, 1,
0.7019709, -0.5632772, 3.759843, 1, 0, 0, 1, 1,
0.7035373, 0.0273232, 0.1935435, 1, 0, 0, 1, 1,
0.7077335, 0.7073321, -1.647551, 1, 0, 0, 1, 1,
0.7190812, -1.227028, 3.667467, 0, 0, 0, 1, 1,
0.7199486, 0.4715301, 0.5018036, 0, 0, 0, 1, 1,
0.7251337, 0.5712659, 0.1264214, 0, 0, 0, 1, 1,
0.7341101, -1.746087, 1.499487, 0, 0, 0, 1, 1,
0.7431706, 0.4379593, 0.2223559, 0, 0, 0, 1, 1,
0.7448791, -1.398963, 1.887676, 0, 0, 0, 1, 1,
0.7510903, 0.3705845, 1.355535, 0, 0, 0, 1, 1,
0.7537414, -0.9047627, 2.244105, 1, 1, 1, 1, 1,
0.7604963, -0.4062595, 1.881783, 1, 1, 1, 1, 1,
0.7616815, -0.5008541, 1.813911, 1, 1, 1, 1, 1,
0.7650523, -0.1411864, 3.000676, 1, 1, 1, 1, 1,
0.7657378, 0.04824816, 0.6318423, 1, 1, 1, 1, 1,
0.7725503, 0.7378262, 1.274941, 1, 1, 1, 1, 1,
0.7736784, -0.916904, 3.280259, 1, 1, 1, 1, 1,
0.7751154, 1.004525, -0.2030115, 1, 1, 1, 1, 1,
0.7768759, 1.771689, 0.7677023, 1, 1, 1, 1, 1,
0.7774984, -1.632315, 1.922855, 1, 1, 1, 1, 1,
0.7794975, -0.5859917, 2.211995, 1, 1, 1, 1, 1,
0.7860397, 0.8093323, 1.368825, 1, 1, 1, 1, 1,
0.7871921, 1.722709, 1.947334, 1, 1, 1, 1, 1,
0.7885351, 0.300786, 2.340644, 1, 1, 1, 1, 1,
0.7967694, 1.447889, -0.9503863, 1, 1, 1, 1, 1,
0.8050609, 0.7438989, 1.87814, 0, 0, 1, 1, 1,
0.80646, -1.091806, 4.331495, 1, 0, 0, 1, 1,
0.8088971, -0.6456675, 0.3641503, 1, 0, 0, 1, 1,
0.8105713, -0.7844768, 1.718483, 1, 0, 0, 1, 1,
0.8161855, 0.7809937, 1.035071, 1, 0, 0, 1, 1,
0.8258639, 0.8259792, 1.59439, 1, 0, 0, 1, 1,
0.8306711, -0.9694766, 0.2124029, 0, 0, 0, 1, 1,
0.8330639, -0.7822906, 0.5517545, 0, 0, 0, 1, 1,
0.8414956, -0.0949934, 1.269921, 0, 0, 0, 1, 1,
0.845211, 1.033144, 0.09939279, 0, 0, 0, 1, 1,
0.8574926, 0.2958626, 1.269254, 0, 0, 0, 1, 1,
0.8637471, -0.2275503, 3.574659, 0, 0, 0, 1, 1,
0.8658919, 1.814535, 0.3692875, 0, 0, 0, 1, 1,
0.870933, 1.183771, 1.040784, 1, 1, 1, 1, 1,
0.8713068, 0.7830834, -0.0780289, 1, 1, 1, 1, 1,
0.8729991, -1.360231, 1.13922, 1, 1, 1, 1, 1,
0.8767478, 0.04227288, 2.352952, 1, 1, 1, 1, 1,
0.8822529, -0.9439474, 1.484653, 1, 1, 1, 1, 1,
0.8896324, 0.9001051, 0.5027431, 1, 1, 1, 1, 1,
0.8915558, 0.3495513, 1.600561, 1, 1, 1, 1, 1,
0.8992322, -1.182256, 2.780492, 1, 1, 1, 1, 1,
0.9013616, -1.553694, 4.539905, 1, 1, 1, 1, 1,
0.9022131, -1.446197, 2.881935, 1, 1, 1, 1, 1,
0.9022467, 0.1823596, 2.138411, 1, 1, 1, 1, 1,
0.9045419, 0.7123814, 1.278271, 1, 1, 1, 1, 1,
0.9104912, 0.4238758, 1.332003, 1, 1, 1, 1, 1,
0.9195947, -0.0301169, 1.574611, 1, 1, 1, 1, 1,
0.9240388, -0.4767792, 1.813896, 1, 1, 1, 1, 1,
0.9295147, -0.8441544, 3.370752, 0, 0, 1, 1, 1,
0.9311758, 1.1493, 2.322048, 1, 0, 0, 1, 1,
0.9407623, 0.4207475, -0.06894383, 1, 0, 0, 1, 1,
0.9444174, -0.4296554, 1.686194, 1, 0, 0, 1, 1,
0.9450373, -0.001141474, 1.773058, 1, 0, 0, 1, 1,
0.9468329, 0.3957623, -0.5284162, 1, 0, 0, 1, 1,
0.9478917, -0.5401997, 1.473092, 0, 0, 0, 1, 1,
0.950294, -0.07029754, -1.381046, 0, 0, 0, 1, 1,
0.9524946, 0.1203545, 1.345646, 0, 0, 0, 1, 1,
0.9532506, -2.021925, 3.275819, 0, 0, 0, 1, 1,
0.9578492, -2.203565, 1.808619, 0, 0, 0, 1, 1,
0.9685923, -0.9503731, 2.825578, 0, 0, 0, 1, 1,
0.9724693, 0.06699197, 0.5529619, 0, 0, 0, 1, 1,
0.9736826, 1.403301, 1.181342, 1, 1, 1, 1, 1,
0.9737448, 0.2437994, 1.749795, 1, 1, 1, 1, 1,
0.9760936, 0.63279, 1.249974, 1, 1, 1, 1, 1,
0.9785888, -0.7992978, 2.189714, 1, 1, 1, 1, 1,
0.9790978, 0.2044549, 0.9735032, 1, 1, 1, 1, 1,
0.985665, 0.6246302, -0.6349953, 1, 1, 1, 1, 1,
0.9891371, -1.449749, 3.148667, 1, 1, 1, 1, 1,
0.9928003, -0.113214, -0.1421758, 1, 1, 1, 1, 1,
0.9932067, 0.3643546, 0.4762676, 1, 1, 1, 1, 1,
0.9946696, -0.3347384, 0.6437722, 1, 1, 1, 1, 1,
0.9984717, -0.7740879, 0.3518706, 1, 1, 1, 1, 1,
1.008201, 0.7629453, 0.2713926, 1, 1, 1, 1, 1,
1.010159, 0.3563814, 0.6515054, 1, 1, 1, 1, 1,
1.015238, 0.1858529, 1.096521, 1, 1, 1, 1, 1,
1.015946, 0.277569, 2.691013, 1, 1, 1, 1, 1,
1.016363, 1.148407, 1.033783, 0, 0, 1, 1, 1,
1.017359, 0.9184232, -0.3113743, 1, 0, 0, 1, 1,
1.019475, -0.2826405, 3.092801, 1, 0, 0, 1, 1,
1.019642, 0.2662567, 2.920964, 1, 0, 0, 1, 1,
1.022951, -0.8381547, 1.159329, 1, 0, 0, 1, 1,
1.025771, -1.426539, 3.084885, 1, 0, 0, 1, 1,
1.027648, 0.8194523, 2.061929, 0, 0, 0, 1, 1,
1.028764, 0.2630339, 3.326358, 0, 0, 0, 1, 1,
1.03171, 0.9005219, 2.682961, 0, 0, 0, 1, 1,
1.033381, 0.1974722, 1.530597, 0, 0, 0, 1, 1,
1.038525, -0.291622, 2.197067, 0, 0, 0, 1, 1,
1.052754, -0.2616623, 0.8637624, 0, 0, 0, 1, 1,
1.056383, 0.2881317, 1.100668, 0, 0, 0, 1, 1,
1.056969, -0.6724858, 0.861744, 1, 1, 1, 1, 1,
1.057726, 0.188881, 2.161993, 1, 1, 1, 1, 1,
1.05865, 1.186348, 1.058009, 1, 1, 1, 1, 1,
1.05914, 0.08104212, 1.861331, 1, 1, 1, 1, 1,
1.060236, -1.782369, 2.710403, 1, 1, 1, 1, 1,
1.061157, -0.4140231, 2.084707, 1, 1, 1, 1, 1,
1.067349, 0.2427933, 0.1716628, 1, 1, 1, 1, 1,
1.083149, 0.8946639, 1.273472, 1, 1, 1, 1, 1,
1.083525, -0.5249532, 2.176837, 1, 1, 1, 1, 1,
1.091674, -0.6812295, 2.666301, 1, 1, 1, 1, 1,
1.092314, 0.4647505, 0.1710134, 1, 1, 1, 1, 1,
1.092495, -0.4308017, 1.74008, 1, 1, 1, 1, 1,
1.101929, -1.257763, 1.627838, 1, 1, 1, 1, 1,
1.105909, 0.2866961, 4.217211, 1, 1, 1, 1, 1,
1.109642, -2.206889, 3.74958, 1, 1, 1, 1, 1,
1.110237, -1.208839, 3.147537, 0, 0, 1, 1, 1,
1.115843, -0.3673203, 2.489362, 1, 0, 0, 1, 1,
1.124538, 0.6514561, 1.207921, 1, 0, 0, 1, 1,
1.126133, -0.09563874, 2.378047, 1, 0, 0, 1, 1,
1.128869, -0.3301806, 3.009897, 1, 0, 0, 1, 1,
1.129754, 2.108972, 2.357419, 1, 0, 0, 1, 1,
1.139542, -0.1830363, 1.858764, 0, 0, 0, 1, 1,
1.140804, 0.6319828, 0.61874, 0, 0, 0, 1, 1,
1.143453, 1.970194, 0.9910874, 0, 0, 0, 1, 1,
1.15555, -0.4852587, 2.561212, 0, 0, 0, 1, 1,
1.168909, -0.6326604, 1.364621, 0, 0, 0, 1, 1,
1.172653, -0.8304105, 2.309353, 0, 0, 0, 1, 1,
1.175279, 0.4844207, 1.621928, 0, 0, 0, 1, 1,
1.179106, 0.5331219, 0.8307096, 1, 1, 1, 1, 1,
1.184251, 0.7235056, 0.3406902, 1, 1, 1, 1, 1,
1.184835, 0.1343155, 3.086512, 1, 1, 1, 1, 1,
1.18716, 0.05735412, 3.228781, 1, 1, 1, 1, 1,
1.189804, 0.7216918, -0.8788211, 1, 1, 1, 1, 1,
1.193524, -1.878958, 1.420545, 1, 1, 1, 1, 1,
1.196755, -0.3040227, 2.191658, 1, 1, 1, 1, 1,
1.197144, -0.8711334, 1.356177, 1, 1, 1, 1, 1,
1.199471, -2.061851, 3.022919, 1, 1, 1, 1, 1,
1.201272, 0.6950024, 0.9622509, 1, 1, 1, 1, 1,
1.202271, -0.5657135, 1.243064, 1, 1, 1, 1, 1,
1.208704, 0.6444103, 1.500942, 1, 1, 1, 1, 1,
1.215142, 2.166058, 0.7230268, 1, 1, 1, 1, 1,
1.216327, -1.088763, 3.540709, 1, 1, 1, 1, 1,
1.220951, 0.8478769, -0.2341703, 1, 1, 1, 1, 1,
1.227245, 1.04199, 0.9982255, 0, 0, 1, 1, 1,
1.227987, 2.465524, -1.107582, 1, 0, 0, 1, 1,
1.228153, 0.432965, 0.6894371, 1, 0, 0, 1, 1,
1.22907, 1.381843, 0.4944108, 1, 0, 0, 1, 1,
1.229132, 0.7040107, 0.7263224, 1, 0, 0, 1, 1,
1.232697, 1.833154, -0.2503984, 1, 0, 0, 1, 1,
1.233624, 0.8680506, 2.459728, 0, 0, 0, 1, 1,
1.23507, -0.6952908, 0.798116, 0, 0, 0, 1, 1,
1.238705, -1.253236, 2.326998, 0, 0, 0, 1, 1,
1.242835, -0.05214519, 0.5978992, 0, 0, 0, 1, 1,
1.249177, 0.9096659, 1.473326, 0, 0, 0, 1, 1,
1.25327, -0.5316111, 2.218958, 0, 0, 0, 1, 1,
1.254492, -0.1303402, 2.081698, 0, 0, 0, 1, 1,
1.254724, -0.1111658, 0.1488971, 1, 1, 1, 1, 1,
1.262934, -0.6249685, 3.106278, 1, 1, 1, 1, 1,
1.270694, -0.6667107, 1.904869, 1, 1, 1, 1, 1,
1.274428, 0.6452404, 1.002047, 1, 1, 1, 1, 1,
1.283217, 0.7156212, 3.453379, 1, 1, 1, 1, 1,
1.286084, -0.5149271, 1.385075, 1, 1, 1, 1, 1,
1.312945, -0.04889465, 1.904687, 1, 1, 1, 1, 1,
1.314556, 1.599122, 0.7894737, 1, 1, 1, 1, 1,
1.314765, -0.8242203, 2.04182, 1, 1, 1, 1, 1,
1.315718, 1.365227, -0.9036218, 1, 1, 1, 1, 1,
1.318288, 2.03118, 1.457721, 1, 1, 1, 1, 1,
1.324962, -0.4181136, 2.028818, 1, 1, 1, 1, 1,
1.328639, 0.3385738, 1.055673, 1, 1, 1, 1, 1,
1.347662, 0.2706334, 0.168715, 1, 1, 1, 1, 1,
1.35298, 1.507388, -0.09605177, 1, 1, 1, 1, 1,
1.357878, -0.3596151, 1.201905, 0, 0, 1, 1, 1,
1.365426, 0.1320008, 2.287296, 1, 0, 0, 1, 1,
1.369691, 2.026949, -0.1433605, 1, 0, 0, 1, 1,
1.376159, -0.05072469, 2.662473, 1, 0, 0, 1, 1,
1.3815, 0.5975619, 1.565637, 1, 0, 0, 1, 1,
1.388621, 0.8289637, 0.2228711, 1, 0, 0, 1, 1,
1.405394, -0.2078372, 2.763124, 0, 0, 0, 1, 1,
1.406343, 0.5632854, 2.442917, 0, 0, 0, 1, 1,
1.408525, 0.2518317, 1.68159, 0, 0, 0, 1, 1,
1.408702, -1.368971, 1.629117, 0, 0, 0, 1, 1,
1.420382, -1.1333, 3.005794, 0, 0, 0, 1, 1,
1.420941, 0.2805897, 1.655739, 0, 0, 0, 1, 1,
1.426864, 0.8683161, 0.7596917, 0, 0, 0, 1, 1,
1.437795, -1.273392, 0.6294138, 1, 1, 1, 1, 1,
1.442599, 1.111955, 1.104341, 1, 1, 1, 1, 1,
1.450658, -1.031974, 2.266382, 1, 1, 1, 1, 1,
1.452203, 0.02629549, 0.8249635, 1, 1, 1, 1, 1,
1.452967, 1.143742, 2.201546, 1, 1, 1, 1, 1,
1.453159, 1.553491, 1.413373, 1, 1, 1, 1, 1,
1.466967, 0.5751362, 0.4959664, 1, 1, 1, 1, 1,
1.467346, -0.103741, 0.2467939, 1, 1, 1, 1, 1,
1.478348, 1.635812, -0.2208001, 1, 1, 1, 1, 1,
1.492658, -0.694602, 3.728548, 1, 1, 1, 1, 1,
1.513795, -0.6677328, 2.468973, 1, 1, 1, 1, 1,
1.51387, -0.7782015, -0.8722726, 1, 1, 1, 1, 1,
1.521924, -1.037962, 3.87283, 1, 1, 1, 1, 1,
1.549545, -1.125656, 2.213483, 1, 1, 1, 1, 1,
1.551843, -0.6685857, 1.414688, 1, 1, 1, 1, 1,
1.559772, -0.1309456, 0.8899236, 0, 0, 1, 1, 1,
1.562485, 0.8280996, 2.012609, 1, 0, 0, 1, 1,
1.562781, 1.085791, 0.7465526, 1, 0, 0, 1, 1,
1.601651, 0.3677827, 1.316341, 1, 0, 0, 1, 1,
1.611827, -0.8037264, 3.011131, 1, 0, 0, 1, 1,
1.646818, -0.6062861, 2.84581, 1, 0, 0, 1, 1,
1.661653, 0.5227086, 1.393366, 0, 0, 0, 1, 1,
1.667569, -0.06701963, 1.829499, 0, 0, 0, 1, 1,
1.673542, -1.148267, 1.884786, 0, 0, 0, 1, 1,
1.68154, 0.5629123, 0.3101864, 0, 0, 0, 1, 1,
1.684063, 0.7968124, 0.02236777, 0, 0, 0, 1, 1,
1.68432, 0.3715846, 0.009468521, 0, 0, 0, 1, 1,
1.689559, -0.9102547, 0.8239169, 0, 0, 0, 1, 1,
1.701991, -0.6877734, 4.146409, 1, 1, 1, 1, 1,
1.717455, 1.452154, -0.2751728, 1, 1, 1, 1, 1,
1.721552, 0.7809967, 1.280568, 1, 1, 1, 1, 1,
1.741204, -0.5528156, 0.9621373, 1, 1, 1, 1, 1,
1.748414, -0.5721314, 2.472738, 1, 1, 1, 1, 1,
1.751293, 1.725467, 0.5669709, 1, 1, 1, 1, 1,
1.79108, -0.5735958, 2.130132, 1, 1, 1, 1, 1,
1.809376, 2.469645, -0.422945, 1, 1, 1, 1, 1,
1.809421, 0.8494195, 0.04958789, 1, 1, 1, 1, 1,
1.827212, 0.7450274, 4.069645, 1, 1, 1, 1, 1,
1.847606, 1.213478, 0.6686121, 1, 1, 1, 1, 1,
1.853303, -0.5784199, 1.768037, 1, 1, 1, 1, 1,
1.879135, -0.205597, 0.750604, 1, 1, 1, 1, 1,
1.879747, -0.1305945, 1.000808, 1, 1, 1, 1, 1,
1.885937, 0.8744706, 1.155411, 1, 1, 1, 1, 1,
1.931525, 0.5440105, 1.346605, 0, 0, 1, 1, 1,
1.947005, -0.358041, 1.875441, 1, 0, 0, 1, 1,
1.978201, -1.057186, 1.52747, 1, 0, 0, 1, 1,
2.012777, -0.6453969, 2.229134, 1, 0, 0, 1, 1,
2.017572, 1.517734, 1.449634, 1, 0, 0, 1, 1,
2.030096, -0.004616214, 2.663428, 1, 0, 0, 1, 1,
2.051248, 0.3988633, 0.6777155, 0, 0, 0, 1, 1,
2.118925, -0.328307, 0.6993192, 0, 0, 0, 1, 1,
2.158426, 1.046444, 0.05265532, 0, 0, 0, 1, 1,
2.175049, -1.069545, 1.175266, 0, 0, 0, 1, 1,
2.180733, 2.055578, 0.005004992, 0, 0, 0, 1, 1,
2.194555, 0.01442224, 3.467548, 0, 0, 0, 1, 1,
2.218805, 1.450625, 2.494542, 0, 0, 0, 1, 1,
2.220438, -0.05616482, 1.753171, 1, 1, 1, 1, 1,
2.30562, 1.242298, 1.901876, 1, 1, 1, 1, 1,
2.409501, 0.8325842, 1.176656, 1, 1, 1, 1, 1,
2.426407, 0.8576646, 2.597283, 1, 1, 1, 1, 1,
2.662077, -0.3377962, 1.027282, 1, 1, 1, 1, 1,
2.745083, 0.3333283, 1.310191, 1, 1, 1, 1, 1,
3.3516, -0.9361362, 1.370314, 1, 1, 1, 1, 1
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
var radius = 9.542327;
var distance = 33.51702;
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
mvMatrix.translate( 0.01313806, 0.04882288, 0.2319157 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.51702);
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
