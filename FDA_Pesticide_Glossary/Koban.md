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
-2.860471, 0.8053977, -2.089668, 1, 0, 0, 1,
-2.679069, 0.3049259, -1.929714, 1, 0.007843138, 0, 1,
-2.503297, 0.9985825, -1.110702, 1, 0.01176471, 0, 1,
-2.462402, 0.5245844, -1.216698, 1, 0.01960784, 0, 1,
-2.455935, 1.114984, -1.702889, 1, 0.02352941, 0, 1,
-2.443616, -0.1616459, -2.541979, 1, 0.03137255, 0, 1,
-2.364785, 0.3220229, -3.046854, 1, 0.03529412, 0, 1,
-2.162002, -0.7468159, -1.917789, 1, 0.04313726, 0, 1,
-2.151495, -0.4148149, -1.304178, 1, 0.04705882, 0, 1,
-2.128868, -1.605217, -2.500311, 1, 0.05490196, 0, 1,
-2.092845, 0.6728736, -1.53191, 1, 0.05882353, 0, 1,
-2.07917, 0.2993259, -2.173909, 1, 0.06666667, 0, 1,
-2.065557, -0.1493502, -1.682761, 1, 0.07058824, 0, 1,
-2.050907, -0.4572289, -2.281281, 1, 0.07843138, 0, 1,
-2.012261, 1.445454, -1.54234, 1, 0.08235294, 0, 1,
-2.002565, 0.4065091, -1.806802, 1, 0.09019608, 0, 1,
-1.978833, -0.6514205, -0.7095676, 1, 0.09411765, 0, 1,
-1.970917, -0.7925035, -1.989102, 1, 0.1019608, 0, 1,
-1.960717, 0.1222122, -3.245698, 1, 0.1098039, 0, 1,
-1.954286, 0.9257926, -2.093499, 1, 0.1137255, 0, 1,
-1.944205, -0.764492, -0.9059114, 1, 0.1215686, 0, 1,
-1.921658, 0.671668, -0.4851528, 1, 0.1254902, 0, 1,
-1.897488, 1.905012, -1.417684, 1, 0.1333333, 0, 1,
-1.873763, 0.01542582, -1.672953, 1, 0.1372549, 0, 1,
-1.86405, -0.2113982, -1.499584, 1, 0.145098, 0, 1,
-1.863966, 1.035566, -0.691265, 1, 0.1490196, 0, 1,
-1.846641, -1.018496, -2.128542, 1, 0.1568628, 0, 1,
-1.845527, -1.224409, -2.29793, 1, 0.1607843, 0, 1,
-1.843756, -0.1857692, -1.637101, 1, 0.1686275, 0, 1,
-1.831729, 1.81886, -2.054253, 1, 0.172549, 0, 1,
-1.828299, 1.083685, -2.943762, 1, 0.1803922, 0, 1,
-1.801987, -1.035481, -2.416036, 1, 0.1843137, 0, 1,
-1.776563, -1.174145, -3.119588, 1, 0.1921569, 0, 1,
-1.775842, -2.659918, -1.866738, 1, 0.1960784, 0, 1,
-1.762738, -0.4722014, -2.184072, 1, 0.2039216, 0, 1,
-1.761827, -0.5159165, -0.967391, 1, 0.2117647, 0, 1,
-1.744428, -0.2961437, -2.483243, 1, 0.2156863, 0, 1,
-1.710191, -0.7813968, -1.92869, 1, 0.2235294, 0, 1,
-1.707598, 0.0480946, -1.863506, 1, 0.227451, 0, 1,
-1.705503, 0.2259398, -1.958987, 1, 0.2352941, 0, 1,
-1.691197, -0.3442005, -2.546287, 1, 0.2392157, 0, 1,
-1.685292, -0.3422149, -1.812799, 1, 0.2470588, 0, 1,
-1.681673, 0.07392193, -2.196841, 1, 0.2509804, 0, 1,
-1.675924, 0.9924705, -0.1375247, 1, 0.2588235, 0, 1,
-1.674603, 0.1823699, 0.2187373, 1, 0.2627451, 0, 1,
-1.656405, 0.2839984, -2.719171, 1, 0.2705882, 0, 1,
-1.640344, -0.1893835, -1.021357, 1, 0.2745098, 0, 1,
-1.638667, 0.3703977, -2.901984, 1, 0.282353, 0, 1,
-1.635329, -0.0328123, -1.982019, 1, 0.2862745, 0, 1,
-1.627132, 1.073616, -0.1697607, 1, 0.2941177, 0, 1,
-1.624129, -1.021832, -2.721413, 1, 0.3019608, 0, 1,
-1.600251, 0.5536969, -1.695291, 1, 0.3058824, 0, 1,
-1.590433, -1.626429, -1.962687, 1, 0.3137255, 0, 1,
-1.587155, -0.4664287, -2.271916, 1, 0.3176471, 0, 1,
-1.574935, 0.8667324, -1.523418, 1, 0.3254902, 0, 1,
-1.566357, 1.063901, -1.799171, 1, 0.3294118, 0, 1,
-1.558983, -0.09848502, -3.337746, 1, 0.3372549, 0, 1,
-1.553505, -0.6111432, -1.960273, 1, 0.3411765, 0, 1,
-1.544249, 1.804247, -2.834901, 1, 0.3490196, 0, 1,
-1.54404, -0.708999, -3.005633, 1, 0.3529412, 0, 1,
-1.535986, -1.978252, -1.244116, 1, 0.3607843, 0, 1,
-1.510996, -2.662098, -2.622961, 1, 0.3647059, 0, 1,
-1.508392, -0.171503, -1.466674, 1, 0.372549, 0, 1,
-1.507549, 1.602907, 0.4625362, 1, 0.3764706, 0, 1,
-1.507329, -0.2204034, -0.6007507, 1, 0.3843137, 0, 1,
-1.465613, -0.07970097, -2.1088, 1, 0.3882353, 0, 1,
-1.453826, 0.09493164, -1.797555, 1, 0.3960784, 0, 1,
-1.45277, 0.1597849, -0.1623981, 1, 0.4039216, 0, 1,
-1.43858, 0.2920244, -2.334435, 1, 0.4078431, 0, 1,
-1.437545, -1.058881, -1.08183, 1, 0.4156863, 0, 1,
-1.430851, 0.05073278, -2.29634, 1, 0.4196078, 0, 1,
-1.393986, -0.8265014, -3.14705, 1, 0.427451, 0, 1,
-1.371625, -0.7551973, -0.9200755, 1, 0.4313726, 0, 1,
-1.37081, -0.7247523, -2.19843, 1, 0.4392157, 0, 1,
-1.365414, -0.2273554, -0.1461328, 1, 0.4431373, 0, 1,
-1.347586, -1.686476, -3.458952, 1, 0.4509804, 0, 1,
-1.347219, 0.8925954, -0.4490685, 1, 0.454902, 0, 1,
-1.347082, 0.6696606, -2.813926, 1, 0.4627451, 0, 1,
-1.344097, -2.110323, -4.138878, 1, 0.4666667, 0, 1,
-1.343858, -0.4731185, -1.567436, 1, 0.4745098, 0, 1,
-1.335458, 0.5251098, -0.06628539, 1, 0.4784314, 0, 1,
-1.334361, 1.470293, 0.5653623, 1, 0.4862745, 0, 1,
-1.324452, 0.4098442, -0.7999373, 1, 0.4901961, 0, 1,
-1.322278, 0.5908363, -0.6890811, 1, 0.4980392, 0, 1,
-1.320869, -1.208425, -3.722658, 1, 0.5058824, 0, 1,
-1.311757, -0.7227817, -0.06500527, 1, 0.509804, 0, 1,
-1.306222, -0.6014773, -1.811479, 1, 0.5176471, 0, 1,
-1.306153, -1.795454, -3.347602, 1, 0.5215687, 0, 1,
-1.302558, -0.1085861, -1.258673, 1, 0.5294118, 0, 1,
-1.289628, 0.3035533, -1.669043, 1, 0.5333334, 0, 1,
-1.276202, 1.09899, 1.765475, 1, 0.5411765, 0, 1,
-1.271111, -0.4004694, -4.147281, 1, 0.5450981, 0, 1,
-1.261673, -2.36499, -2.633763, 1, 0.5529412, 0, 1,
-1.260639, 0.738347, -2.425081, 1, 0.5568628, 0, 1,
-1.259355, -0.8432357, -1.549972, 1, 0.5647059, 0, 1,
-1.258171, -0.1120396, -2.568113, 1, 0.5686275, 0, 1,
-1.250818, 0.407326, -2.315277, 1, 0.5764706, 0, 1,
-1.250621, 0.8579926, -0.3468374, 1, 0.5803922, 0, 1,
-1.23453, -0.6729453, -2.389548, 1, 0.5882353, 0, 1,
-1.225312, 0.1999676, -1.507921, 1, 0.5921569, 0, 1,
-1.221963, 0.3408616, -1.645213, 1, 0.6, 0, 1,
-1.221255, 0.5504963, -0.4051635, 1, 0.6078432, 0, 1,
-1.221036, 0.4346524, -1.480465, 1, 0.6117647, 0, 1,
-1.219816, 1.671931, 0.887079, 1, 0.6196079, 0, 1,
-1.215976, 1.282546, -0.6303854, 1, 0.6235294, 0, 1,
-1.204682, -0.1331594, -0.9186129, 1, 0.6313726, 0, 1,
-1.201504, 2.002966, 0.112974, 1, 0.6352941, 0, 1,
-1.194173, -1.493637, -2.883279, 1, 0.6431373, 0, 1,
-1.189862, 0.547975, 0.4334823, 1, 0.6470588, 0, 1,
-1.188686, 1.868815, 0.6807234, 1, 0.654902, 0, 1,
-1.180986, -0.1314136, -0.5985109, 1, 0.6588235, 0, 1,
-1.179242, 1.067432, -0.0222629, 1, 0.6666667, 0, 1,
-1.177142, 0.6567428, -1.841436, 1, 0.6705883, 0, 1,
-1.160821, -0.566809, -2.918375, 1, 0.6784314, 0, 1,
-1.155407, -0.05573793, -1.605116, 1, 0.682353, 0, 1,
-1.151284, -0.1200945, -1.789994, 1, 0.6901961, 0, 1,
-1.143357, 0.2469933, -2.911591, 1, 0.6941177, 0, 1,
-1.139446, 0.4251301, -1.421686, 1, 0.7019608, 0, 1,
-1.136455, -0.09814308, -0.3321287, 1, 0.7098039, 0, 1,
-1.131116, -0.4714385, -3.343625, 1, 0.7137255, 0, 1,
-1.125847, 0.3400862, -3.26608, 1, 0.7215686, 0, 1,
-1.124629, -1.118153, -2.212518, 1, 0.7254902, 0, 1,
-1.121746, 1.0925, -1.076138, 1, 0.7333333, 0, 1,
-1.121437, -0.533949, -2.454924, 1, 0.7372549, 0, 1,
-1.106545, -1.449926, -3.881478, 1, 0.7450981, 0, 1,
-1.104582, 0.01403234, -1.630167, 1, 0.7490196, 0, 1,
-1.101801, -0.2478365, -1.323099, 1, 0.7568628, 0, 1,
-1.098788, -0.4588605, -0.5483667, 1, 0.7607843, 0, 1,
-1.098022, 0.03144989, 0.09302989, 1, 0.7686275, 0, 1,
-1.09254, 0.5605648, -0.0402049, 1, 0.772549, 0, 1,
-1.089813, -0.1155989, -1.76099, 1, 0.7803922, 0, 1,
-1.084457, 1.09784, -1.666088, 1, 0.7843137, 0, 1,
-1.069123, -0.6022275, -2.685953, 1, 0.7921569, 0, 1,
-1.060073, 1.159284, -1.324723, 1, 0.7960784, 0, 1,
-1.05677, -0.0947854, -0.4769024, 1, 0.8039216, 0, 1,
-1.055428, 1.167117, -2.359345, 1, 0.8117647, 0, 1,
-1.054451, -0.083945, -1.040067, 1, 0.8156863, 0, 1,
-1.053304, 0.6340801, -1.918442, 1, 0.8235294, 0, 1,
-1.053035, -0.2961045, -0.8710332, 1, 0.827451, 0, 1,
-1.049491, -0.6523064, -1.705339, 1, 0.8352941, 0, 1,
-1.046814, -0.6690022, -3.064477, 1, 0.8392157, 0, 1,
-1.040123, 0.1598363, -1.188624, 1, 0.8470588, 0, 1,
-1.038018, -0.5649133, -1.418181, 1, 0.8509804, 0, 1,
-1.027115, 1.602634, -2.969652, 1, 0.8588235, 0, 1,
-1.021682, 1.357179, -1.49991, 1, 0.8627451, 0, 1,
-1.01343, 1.702117, -0.5447542, 1, 0.8705882, 0, 1,
-1.008072, -0.857557, -1.36655, 1, 0.8745098, 0, 1,
-1.006291, 0.6208122, 0.7620841, 1, 0.8823529, 0, 1,
-1.00023, -0.4164729, -1.609823, 1, 0.8862745, 0, 1,
-0.9954, -0.1572592, -3.566204, 1, 0.8941177, 0, 1,
-0.9947826, -0.2047189, -2.005691, 1, 0.8980392, 0, 1,
-0.9937912, -1.800407, -2.674874, 1, 0.9058824, 0, 1,
-0.991379, -0.521487, -0.5816944, 1, 0.9137255, 0, 1,
-0.9897377, 1.362149, -0.363593, 1, 0.9176471, 0, 1,
-0.9790928, -0.7544645, -2.202718, 1, 0.9254902, 0, 1,
-0.9772335, -1.590849, -1.796066, 1, 0.9294118, 0, 1,
-0.9751933, 1.625078, 0.4025034, 1, 0.9372549, 0, 1,
-0.9747926, 0.1916472, 0.2297464, 1, 0.9411765, 0, 1,
-0.9745678, -1.672691, -1.930929, 1, 0.9490196, 0, 1,
-0.9735975, 2.160773, -2.183126, 1, 0.9529412, 0, 1,
-0.9733012, 0.08273652, -0.6728886, 1, 0.9607843, 0, 1,
-0.9706427, 1.533259, -0.7426527, 1, 0.9647059, 0, 1,
-0.9666713, 0.1406198, -1.266994, 1, 0.972549, 0, 1,
-0.9655362, -1.307384, -2.595414, 1, 0.9764706, 0, 1,
-0.9621254, 0.2663381, -0.7528134, 1, 0.9843137, 0, 1,
-0.955493, 0.8445062, 0.9451419, 1, 0.9882353, 0, 1,
-0.9516027, 0.005545773, -1.675414, 1, 0.9960784, 0, 1,
-0.9501321, 0.4442621, -0.4471259, 0.9960784, 1, 0, 1,
-0.9500494, -0.1169594, -1.400095, 0.9921569, 1, 0, 1,
-0.9441771, -0.1697921, -0.9135123, 0.9843137, 1, 0, 1,
-0.943998, -0.5089585, -2.932586, 0.9803922, 1, 0, 1,
-0.9408721, 0.9076254, -0.823712, 0.972549, 1, 0, 1,
-0.936183, -0.5740644, -1.476696, 0.9686275, 1, 0, 1,
-0.9314338, 1.076753, -2.807109, 0.9607843, 1, 0, 1,
-0.9303306, 1.891543, -1.50943, 0.9568627, 1, 0, 1,
-0.9205223, 0.2059955, -0.9206891, 0.9490196, 1, 0, 1,
-0.9138073, 0.7323651, -1.367852, 0.945098, 1, 0, 1,
-0.9117596, 0.4038271, -1.860022, 0.9372549, 1, 0, 1,
-0.9100295, 1.384485, -0.3961863, 0.9333333, 1, 0, 1,
-0.9096809, -0.6019372, -2.048821, 0.9254902, 1, 0, 1,
-0.9064977, 1.172821, -2.094977, 0.9215686, 1, 0, 1,
-0.9063563, -1.158961, -2.160463, 0.9137255, 1, 0, 1,
-0.8995874, -0.08035478, -1.286226, 0.9098039, 1, 0, 1,
-0.898472, -0.7875837, -2.076121, 0.9019608, 1, 0, 1,
-0.8871236, -0.4546305, -1.438077, 0.8941177, 1, 0, 1,
-0.8803301, -1.329104, -3.34386, 0.8901961, 1, 0, 1,
-0.8782399, -1.000772, -2.485871, 0.8823529, 1, 0, 1,
-0.8683272, -0.3977733, -3.016749, 0.8784314, 1, 0, 1,
-0.8659572, 0.9111453, -0.7456961, 0.8705882, 1, 0, 1,
-0.864724, -0.4778327, -1.010036, 0.8666667, 1, 0, 1,
-0.8629823, 0.9212727, 0.184147, 0.8588235, 1, 0, 1,
-0.8585484, -0.8450124, -2.826697, 0.854902, 1, 0, 1,
-0.8555516, 1.084709, -0.6891941, 0.8470588, 1, 0, 1,
-0.8506671, 0.9927144, -0.2031539, 0.8431373, 1, 0, 1,
-0.847706, -1.002944, -3.577456, 0.8352941, 1, 0, 1,
-0.8449876, 1.273567, -0.6638223, 0.8313726, 1, 0, 1,
-0.8434822, 0.02758922, -2.195338, 0.8235294, 1, 0, 1,
-0.8434732, 0.12974, -0.5275645, 0.8196079, 1, 0, 1,
-0.8350441, -1.74127, -0.1724304, 0.8117647, 1, 0, 1,
-0.8348973, 1.04436, -0.9420674, 0.8078431, 1, 0, 1,
-0.8276556, -0.8538965, -2.614509, 0.8, 1, 0, 1,
-0.8256862, 0.7611027, -2.050047, 0.7921569, 1, 0, 1,
-0.8231093, 1.525707, -1.719551, 0.7882353, 1, 0, 1,
-0.8228598, 0.6150531, -1.750425, 0.7803922, 1, 0, 1,
-0.8224882, 0.1442305, -1.11955, 0.7764706, 1, 0, 1,
-0.8192666, 0.9776374, 0.74002, 0.7686275, 1, 0, 1,
-0.8109744, 1.039948, -0.9046348, 0.7647059, 1, 0, 1,
-0.8063059, 0.7103048, -0.8765337, 0.7568628, 1, 0, 1,
-0.8040874, -0.07429386, -1.273889, 0.7529412, 1, 0, 1,
-0.796385, -2.024433, -5.421245, 0.7450981, 1, 0, 1,
-0.790566, -1.39807, -2.302665, 0.7411765, 1, 0, 1,
-0.786531, 0.3194848, -0.681805, 0.7333333, 1, 0, 1,
-0.784113, -1.560405, -4.101587, 0.7294118, 1, 0, 1,
-0.7826597, 0.1148093, -3.215787, 0.7215686, 1, 0, 1,
-0.7824206, 0.7635757, -0.1841078, 0.7176471, 1, 0, 1,
-0.7820544, 0.2887453, -1.446224, 0.7098039, 1, 0, 1,
-0.7804287, -1.216513, -1.833628, 0.7058824, 1, 0, 1,
-0.7605022, 0.5837969, -1.286764, 0.6980392, 1, 0, 1,
-0.75849, -0.4819091, -2.476519, 0.6901961, 1, 0, 1,
-0.7554485, 1.427489, -1.491448, 0.6862745, 1, 0, 1,
-0.7530158, -0.4382266, -2.632507, 0.6784314, 1, 0, 1,
-0.7511796, -0.5568052, -3.418904, 0.6745098, 1, 0, 1,
-0.7469559, -1.025207, -3.93738, 0.6666667, 1, 0, 1,
-0.7447007, 0.302411, -0.03606724, 0.6627451, 1, 0, 1,
-0.7416449, 2.213084, 1.655751, 0.654902, 1, 0, 1,
-0.740336, 0.09800654, -1.931475, 0.6509804, 1, 0, 1,
-0.739401, 0.1434674, 0.1839031, 0.6431373, 1, 0, 1,
-0.7340717, 0.03944701, -2.653659, 0.6392157, 1, 0, 1,
-0.7320486, 1.469085, 1.084342, 0.6313726, 1, 0, 1,
-0.7307401, -0.1233679, -3.27837, 0.627451, 1, 0, 1,
-0.7301332, 0.6655312, 0.070705, 0.6196079, 1, 0, 1,
-0.7268194, -0.6186046, -2.333786, 0.6156863, 1, 0, 1,
-0.7253811, -0.6199256, -3.022797, 0.6078432, 1, 0, 1,
-0.7213264, 0.1648283, 0.04203338, 0.6039216, 1, 0, 1,
-0.7193137, -0.2896722, -1.961514, 0.5960785, 1, 0, 1,
-0.7118856, -0.1432712, -0.7554053, 0.5882353, 1, 0, 1,
-0.7109002, -1.896724, -4.26934, 0.5843138, 1, 0, 1,
-0.7071369, -0.210252, -0.7345322, 0.5764706, 1, 0, 1,
-0.7035989, 1.263728, -1.733928, 0.572549, 1, 0, 1,
-0.7035099, -1.381077, -2.072778, 0.5647059, 1, 0, 1,
-0.7020965, 0.1693802, -0.3373685, 0.5607843, 1, 0, 1,
-0.6983032, 0.04057305, -2.249437, 0.5529412, 1, 0, 1,
-0.696475, 1.930191, -2.546667, 0.5490196, 1, 0, 1,
-0.6963567, -1.276378, -0.593504, 0.5411765, 1, 0, 1,
-0.6943995, 0.0460343, -2.022898, 0.5372549, 1, 0, 1,
-0.6941472, 0.405129, 0.09106431, 0.5294118, 1, 0, 1,
-0.6936386, 0.05563055, -0.4326207, 0.5254902, 1, 0, 1,
-0.6917823, -0.04408026, -1.450248, 0.5176471, 1, 0, 1,
-0.6916624, 1.442929, -0.7520232, 0.5137255, 1, 0, 1,
-0.6913931, 1.561761, -1.999617, 0.5058824, 1, 0, 1,
-0.6890708, -0.008134631, -1.807669, 0.5019608, 1, 0, 1,
-0.6848632, -0.05024241, -1.24098, 0.4941176, 1, 0, 1,
-0.683343, -0.3411246, -3.668029, 0.4862745, 1, 0, 1,
-0.6818929, 0.4931101, -0.9589375, 0.4823529, 1, 0, 1,
-0.6806439, -0.05922021, -0.4583566, 0.4745098, 1, 0, 1,
-0.6782258, -0.2296163, -3.025765, 0.4705882, 1, 0, 1,
-0.6562063, -0.5380819, -3.011216, 0.4627451, 1, 0, 1,
-0.6518888, -0.7337098, -2.912636, 0.4588235, 1, 0, 1,
-0.6510252, -0.02650492, -2.628293, 0.4509804, 1, 0, 1,
-0.650609, 0.6526396, -0.2263943, 0.4470588, 1, 0, 1,
-0.6491246, -0.6576964, -2.212775, 0.4392157, 1, 0, 1,
-0.6464266, -0.3658996, -2.153165, 0.4352941, 1, 0, 1,
-0.6447548, 0.5941805, 0.6315084, 0.427451, 1, 0, 1,
-0.640681, 0.4392749, -0.788863, 0.4235294, 1, 0, 1,
-0.6393369, -0.229062, 0.03471564, 0.4156863, 1, 0, 1,
-0.6392197, 0.1712344, -2.3662, 0.4117647, 1, 0, 1,
-0.6365653, 1.212177, -1.49742, 0.4039216, 1, 0, 1,
-0.6365223, 0.4696682, -1.235027, 0.3960784, 1, 0, 1,
-0.6293953, -0.1074331, -2.308295, 0.3921569, 1, 0, 1,
-0.6265518, -2.093961, -0.8166912, 0.3843137, 1, 0, 1,
-0.6195958, -1.621997, -3.082661, 0.3803922, 1, 0, 1,
-0.6119509, 1.114933, -1.100211, 0.372549, 1, 0, 1,
-0.6112033, 0.5965536, -0.6546055, 0.3686275, 1, 0, 1,
-0.597362, -1.05637, -3.49675, 0.3607843, 1, 0, 1,
-0.5973582, 0.8065865, 0.3377427, 0.3568628, 1, 0, 1,
-0.5965869, -0.9472301, -2.954705, 0.3490196, 1, 0, 1,
-0.5928795, 0.3891684, -0.06293058, 0.345098, 1, 0, 1,
-0.5920781, 0.9716041, 0.371255, 0.3372549, 1, 0, 1,
-0.5905275, 1.876326, -0.838735, 0.3333333, 1, 0, 1,
-0.5904437, -1.528998, -3.322442, 0.3254902, 1, 0, 1,
-0.583551, -0.3905536, -2.08775, 0.3215686, 1, 0, 1,
-0.5833572, -0.2915589, -3.111801, 0.3137255, 1, 0, 1,
-0.5829192, 0.5000646, 0.3407228, 0.3098039, 1, 0, 1,
-0.5823863, -1.224936, -2.565136, 0.3019608, 1, 0, 1,
-0.5804382, 0.4311895, 0.411153, 0.2941177, 1, 0, 1,
-0.5789375, -0.9073989, -2.615465, 0.2901961, 1, 0, 1,
-0.5755653, -0.331553, -1.632563, 0.282353, 1, 0, 1,
-0.5739061, 1.5698, 1.807023, 0.2784314, 1, 0, 1,
-0.5723222, -0.1484687, -1.880677, 0.2705882, 1, 0, 1,
-0.5720679, 1.937239, -0.6826819, 0.2666667, 1, 0, 1,
-0.5709263, -0.7192319, -4.058426, 0.2588235, 1, 0, 1,
-0.567656, 0.6007001, -0.8347746, 0.254902, 1, 0, 1,
-0.5656855, -0.738899, -3.16945, 0.2470588, 1, 0, 1,
-0.5654885, -0.0520515, -1.371977, 0.2431373, 1, 0, 1,
-0.5586104, -1.172626, -5.0379, 0.2352941, 1, 0, 1,
-0.5558102, 0.5144779, 1.497865, 0.2313726, 1, 0, 1,
-0.5485352, -0.006502605, -0.2590138, 0.2235294, 1, 0, 1,
-0.5385468, 1.348062, -0.5306644, 0.2196078, 1, 0, 1,
-0.5377216, -0.2174773, -1.900456, 0.2117647, 1, 0, 1,
-0.5319594, -0.7088852, -2.962133, 0.2078431, 1, 0, 1,
-0.5297493, 0.3497689, 0.431313, 0.2, 1, 0, 1,
-0.5282248, 0.149684, -1.72256, 0.1921569, 1, 0, 1,
-0.5242102, -0.1467386, -3.645154, 0.1882353, 1, 0, 1,
-0.5184144, 0.4171141, -0.1092084, 0.1803922, 1, 0, 1,
-0.5160856, -0.7699589, -1.52026, 0.1764706, 1, 0, 1,
-0.5143272, -0.2373613, -1.949188, 0.1686275, 1, 0, 1,
-0.5094467, -0.5788668, -3.172107, 0.1647059, 1, 0, 1,
-0.5053639, 0.09320194, -0.7621554, 0.1568628, 1, 0, 1,
-0.5044551, 0.8239654, -2.186462, 0.1529412, 1, 0, 1,
-0.5019265, -0.5399268, -1.096744, 0.145098, 1, 0, 1,
-0.49759, -1.305052, -3.410839, 0.1411765, 1, 0, 1,
-0.4950364, -0.9427356, -1.779207, 0.1333333, 1, 0, 1,
-0.4933769, 0.759038, -2.926154, 0.1294118, 1, 0, 1,
-0.4917035, -1.795844, -4.659417, 0.1215686, 1, 0, 1,
-0.4823883, 2.065883, -1.435654, 0.1176471, 1, 0, 1,
-0.4819877, 0.5277367, -2.515138, 0.1098039, 1, 0, 1,
-0.4816952, 1.442269, 0.2388978, 0.1058824, 1, 0, 1,
-0.4787041, 0.9484778, 0.3635835, 0.09803922, 1, 0, 1,
-0.4783257, 0.8105759, -1.173261, 0.09019608, 1, 0, 1,
-0.4657748, 0.08956859, -0.8909512, 0.08627451, 1, 0, 1,
-0.4642564, -0.2299434, -3.61976, 0.07843138, 1, 0, 1,
-0.4560018, -0.2382347, -0.5570372, 0.07450981, 1, 0, 1,
-0.4525702, -0.282807, -0.756162, 0.06666667, 1, 0, 1,
-0.4513528, 0.3388342, -1.833516, 0.0627451, 1, 0, 1,
-0.4485971, -1.24197, -2.33518, 0.05490196, 1, 0, 1,
-0.4396575, 0.11549, -0.5529373, 0.05098039, 1, 0, 1,
-0.4195054, 0.3217987, -0.6978524, 0.04313726, 1, 0, 1,
-0.4151781, 0.21851, -1.376694, 0.03921569, 1, 0, 1,
-0.4092878, 0.1309292, -1.260528, 0.03137255, 1, 0, 1,
-0.4037957, -1.461296, -2.141325, 0.02745098, 1, 0, 1,
-0.4035861, -0.5311284, -1.704247, 0.01960784, 1, 0, 1,
-0.398082, -0.6544004, -3.794752, 0.01568628, 1, 0, 1,
-0.3932394, -0.07202796, -1.664464, 0.007843138, 1, 0, 1,
-0.3922426, 1.181686, -1.737416, 0.003921569, 1, 0, 1,
-0.3921306, -0.5343599, -2.313546, 0, 1, 0.003921569, 1,
-0.3917231, 0.251729, -0.9600099, 0, 1, 0.01176471, 1,
-0.3905105, -0.2424346, -1.374669, 0, 1, 0.01568628, 1,
-0.3890991, -1.061313, -2.512198, 0, 1, 0.02352941, 1,
-0.3831773, 0.5837755, -1.952953, 0, 1, 0.02745098, 1,
-0.3812923, -0.4903888, -0.1774736, 0, 1, 0.03529412, 1,
-0.3802486, 0.2344113, 0.8900036, 0, 1, 0.03921569, 1,
-0.3794385, -0.7474038, -2.24827, 0, 1, 0.04705882, 1,
-0.3703624, 0.07417345, 0.3283551, 0, 1, 0.05098039, 1,
-0.368788, 0.9464785, -1.250065, 0, 1, 0.05882353, 1,
-0.3661791, 0.3000607, -0.8774245, 0, 1, 0.0627451, 1,
-0.3647457, 0.2713845, -0.01728153, 0, 1, 0.07058824, 1,
-0.3599745, -0.7613872, -5.564746, 0, 1, 0.07450981, 1,
-0.3582877, -1.619993, -3.561682, 0, 1, 0.08235294, 1,
-0.3578612, 0.3003793, 0.2978797, 0, 1, 0.08627451, 1,
-0.3523741, -0.3294249, -2.651737, 0, 1, 0.09411765, 1,
-0.350275, -1.197157, -2.698454, 0, 1, 0.1019608, 1,
-0.3500769, -1.619363, -2.047408, 0, 1, 0.1058824, 1,
-0.3490065, -0.8885885, -3.839141, 0, 1, 0.1137255, 1,
-0.3445085, 0.1004166, -2.449667, 0, 1, 0.1176471, 1,
-0.3428932, 0.5485049, -1.171807, 0, 1, 0.1254902, 1,
-0.3341919, -1.115171, -1.640193, 0, 1, 0.1294118, 1,
-0.3336437, 0.5557057, -1.397308, 0, 1, 0.1372549, 1,
-0.3332961, 0.8943654, -0.1235005, 0, 1, 0.1411765, 1,
-0.3326716, -1.646524, -2.241942, 0, 1, 0.1490196, 1,
-0.3310152, -0.4085764, -3.046674, 0, 1, 0.1529412, 1,
-0.3281551, -0.3987826, -1.952785, 0, 1, 0.1607843, 1,
-0.3221195, 0.1910902, -0.2898546, 0, 1, 0.1647059, 1,
-0.3210877, 0.9131133, -1.365093, 0, 1, 0.172549, 1,
-0.3194176, -0.2841135, -1.471801, 0, 1, 0.1764706, 1,
-0.3189648, 1.26754, 0.8326377, 0, 1, 0.1843137, 1,
-0.3169228, 1.021747, 0.5236738, 0, 1, 0.1882353, 1,
-0.3160981, 0.4430407, -0.7628472, 0, 1, 0.1960784, 1,
-0.3150859, 0.2620406, -0.4680905, 0, 1, 0.2039216, 1,
-0.3141852, -2.370382, -2.92705, 0, 1, 0.2078431, 1,
-0.3126973, -0.4926037, -2.22633, 0, 1, 0.2156863, 1,
-0.30948, -1.257937, -4.027157, 0, 1, 0.2196078, 1,
-0.3075828, -1.641437, -2.315421, 0, 1, 0.227451, 1,
-0.3051146, 0.5612867, 0.7265889, 0, 1, 0.2313726, 1,
-0.3048686, 0.5702323, -2.881067, 0, 1, 0.2392157, 1,
-0.3046819, -0.2512329, -1.643687, 0, 1, 0.2431373, 1,
-0.3025694, -1.571732, -4.49901, 0, 1, 0.2509804, 1,
-0.3008695, 0.4816165, -1.097156, 0, 1, 0.254902, 1,
-0.299873, 0.02713776, -1.677871, 0, 1, 0.2627451, 1,
-0.29512, 2.19865, 0.8506815, 0, 1, 0.2666667, 1,
-0.2944932, 0.2183927, -0.915625, 0, 1, 0.2745098, 1,
-0.2927997, -0.597303, -0.6739745, 0, 1, 0.2784314, 1,
-0.2873807, -0.7635524, -3.1751, 0, 1, 0.2862745, 1,
-0.2846524, -1.40267, -1.6617, 0, 1, 0.2901961, 1,
-0.2829795, -0.2057222, -2.242195, 0, 1, 0.2980392, 1,
-0.276773, 1.603841, -1.133017, 0, 1, 0.3058824, 1,
-0.2757002, -1.585168, -4.218707, 0, 1, 0.3098039, 1,
-0.2695908, -0.9911755, -3.927247, 0, 1, 0.3176471, 1,
-0.2670051, 0.7975242, -1.336577, 0, 1, 0.3215686, 1,
-0.2647259, 0.658755, -1.082851, 0, 1, 0.3294118, 1,
-0.2646073, 0.7520061, 0.819602, 0, 1, 0.3333333, 1,
-0.261469, 0.282307, 1.069861, 0, 1, 0.3411765, 1,
-0.2596439, 0.1005969, 0.06001478, 0, 1, 0.345098, 1,
-0.256351, 1.287347, -1.174769, 0, 1, 0.3529412, 1,
-0.2557598, 1.444017, -1.235086, 0, 1, 0.3568628, 1,
-0.2526585, 1.158847, 0.475944, 0, 1, 0.3647059, 1,
-0.2449715, 1.734936, -1.301198, 0, 1, 0.3686275, 1,
-0.2422334, -0.07442471, -1.588695, 0, 1, 0.3764706, 1,
-0.2400802, -0.1850744, -2.353332, 0, 1, 0.3803922, 1,
-0.2385845, 0.1337775, 0.07500014, 0, 1, 0.3882353, 1,
-0.2366391, 2.284218, -0.6550246, 0, 1, 0.3921569, 1,
-0.2316848, -0.6961107, -3.191103, 0, 1, 0.4, 1,
-0.2305397, 1.390978, -0.8636283, 0, 1, 0.4078431, 1,
-0.2280029, 1.662547, 1.714039, 0, 1, 0.4117647, 1,
-0.2263508, -0.2489972, -3.294934, 0, 1, 0.4196078, 1,
-0.224081, -2.007929, -2.46999, 0, 1, 0.4235294, 1,
-0.2239513, 0.2717548, -1.738114, 0, 1, 0.4313726, 1,
-0.2228459, -0.3618041, -3.157915, 0, 1, 0.4352941, 1,
-0.2206025, 0.5164324, -0.7475719, 0, 1, 0.4431373, 1,
-0.216316, 0.06473657, -1.179915, 0, 1, 0.4470588, 1,
-0.2090319, 1.495072, -1.898153, 0, 1, 0.454902, 1,
-0.2056968, -0.3765936, -3.079596, 0, 1, 0.4588235, 1,
-0.2046901, -0.3955931, -2.46549, 0, 1, 0.4666667, 1,
-0.201711, 2.429012, 0.4940386, 0, 1, 0.4705882, 1,
-0.2010121, -0.050334, -0.9087366, 0, 1, 0.4784314, 1,
-0.1998477, 0.3851407, 0.839701, 0, 1, 0.4823529, 1,
-0.1977322, 0.5265145, -1.370039, 0, 1, 0.4901961, 1,
-0.194347, 0.200595, -0.4240707, 0, 1, 0.4941176, 1,
-0.1934371, -1.108358, -2.773144, 0, 1, 0.5019608, 1,
-0.1870717, -1.16008, -2.305582, 0, 1, 0.509804, 1,
-0.183813, -0.1792358, -2.280058, 0, 1, 0.5137255, 1,
-0.1823167, 0.6965438, 0.2509143, 0, 1, 0.5215687, 1,
-0.180668, -2.869022, -4.449617, 0, 1, 0.5254902, 1,
-0.1774528, 1.234787, -0.02863969, 0, 1, 0.5333334, 1,
-0.1741159, 0.7608246, 0.3063932, 0, 1, 0.5372549, 1,
-0.1736554, -0.03366401, -0.7145887, 0, 1, 0.5450981, 1,
-0.1704778, -1.574378, -4.364112, 0, 1, 0.5490196, 1,
-0.1700577, -0.5647203, -1.973075, 0, 1, 0.5568628, 1,
-0.166448, 0.1198636, -0.07832474, 0, 1, 0.5607843, 1,
-0.1647438, 1.271419, -0.6829587, 0, 1, 0.5686275, 1,
-0.1627372, -1.040419, -3.008875, 0, 1, 0.572549, 1,
-0.1588802, 1.895018, -0.7982476, 0, 1, 0.5803922, 1,
-0.1580427, -1.414951, -1.884188, 0, 1, 0.5843138, 1,
-0.1569388, 0.03327949, 0.4965999, 0, 1, 0.5921569, 1,
-0.1503797, 1.496393, -0.3114335, 0, 1, 0.5960785, 1,
-0.147044, 1.754457, -0.9949021, 0, 1, 0.6039216, 1,
-0.1430865, 0.1489019, 0.03637334, 0, 1, 0.6117647, 1,
-0.142703, 1.183115, 0.887776, 0, 1, 0.6156863, 1,
-0.1400385, -1.749706, -2.939176, 0, 1, 0.6235294, 1,
-0.138771, -0.5011016, -2.511343, 0, 1, 0.627451, 1,
-0.1350403, -0.2003324, -2.96239, 0, 1, 0.6352941, 1,
-0.1291014, -1.77546, -3.97998, 0, 1, 0.6392157, 1,
-0.12189, -0.1805168, -2.607049, 0, 1, 0.6470588, 1,
-0.1213292, 0.1143662, -0.9904624, 0, 1, 0.6509804, 1,
-0.1206086, 0.7979515, -0.7906954, 0, 1, 0.6588235, 1,
-0.1196905, 0.2761217, -0.6503448, 0, 1, 0.6627451, 1,
-0.1181975, 0.1041675, -1.475995, 0, 1, 0.6705883, 1,
-0.110829, -1.239478, -3.783797, 0, 1, 0.6745098, 1,
-0.1097131, -0.1811223, -1.610893, 0, 1, 0.682353, 1,
-0.1082155, 0.5010367, -0.7859001, 0, 1, 0.6862745, 1,
-0.1071592, -0.3712285, -2.336458, 0, 1, 0.6941177, 1,
-0.1069278, 0.9263968, -0.2809177, 0, 1, 0.7019608, 1,
-0.1067757, 1.65605, -0.304244, 0, 1, 0.7058824, 1,
-0.105247, 1.161295, 1.262172, 0, 1, 0.7137255, 1,
-0.1010031, -0.1081441, -2.035886, 0, 1, 0.7176471, 1,
-0.0967048, 0.87756, 1.146139, 0, 1, 0.7254902, 1,
-0.09584706, 0.5883366, 1.091248, 0, 1, 0.7294118, 1,
-0.09307274, -1.391751, -4.128528, 0, 1, 0.7372549, 1,
-0.0929177, 0.004844152, -0.9464197, 0, 1, 0.7411765, 1,
-0.09088653, -2.015775, -2.757339, 0, 1, 0.7490196, 1,
-0.08942532, 0.3649803, 0.1602626, 0, 1, 0.7529412, 1,
-0.08886158, 0.102177, 0.2339694, 0, 1, 0.7607843, 1,
-0.08534321, -1.02039, -2.815895, 0, 1, 0.7647059, 1,
-0.08467409, 1.62444, -0.3613732, 0, 1, 0.772549, 1,
-0.08096813, -1.845713, -1.239707, 0, 1, 0.7764706, 1,
-0.07654761, 0.04178476, -1.409681, 0, 1, 0.7843137, 1,
-0.07100817, 0.4430671, -0.852911, 0, 1, 0.7882353, 1,
-0.07001218, -1.523062, -2.824916, 0, 1, 0.7960784, 1,
-0.06824609, 0.376786, -0.1075376, 0, 1, 0.8039216, 1,
-0.06663636, -0.7376009, -3.351702, 0, 1, 0.8078431, 1,
-0.05936599, 0.2352196, -0.8681527, 0, 1, 0.8156863, 1,
-0.05635356, 1.227282, -0.3152118, 0, 1, 0.8196079, 1,
-0.0556477, -0.6853923, -3.58067, 0, 1, 0.827451, 1,
-0.05518799, -0.6269299, -2.047152, 0, 1, 0.8313726, 1,
-0.05469758, -1.309559, -4.579226, 0, 1, 0.8392157, 1,
-0.04499742, -0.6818181, -2.746515, 0, 1, 0.8431373, 1,
-0.04405931, 1.242295, -0.7300485, 0, 1, 0.8509804, 1,
-0.04189714, 0.02891697, -1.300599, 0, 1, 0.854902, 1,
-0.04132524, -1.560014, -1.816102, 0, 1, 0.8627451, 1,
-0.03507921, -0.571484, -3.97139, 0, 1, 0.8666667, 1,
-0.03342479, 0.5948773, -1.275001, 0, 1, 0.8745098, 1,
-0.03282789, 2.512054, 0.05644602, 0, 1, 0.8784314, 1,
-0.03097985, -0.5909724, -3.524564, 0, 1, 0.8862745, 1,
-0.03087347, -1.613782, -2.068912, 0, 1, 0.8901961, 1,
-0.02885456, 1.793566, -0.2787252, 0, 1, 0.8980392, 1,
-0.0284838, -1.34733, -2.77343, 0, 1, 0.9058824, 1,
-0.02710956, -0.622998, -3.277759, 0, 1, 0.9098039, 1,
-0.02373893, -1.007468, -3.097855, 0, 1, 0.9176471, 1,
-0.01088349, -1.930411, -2.482448, 0, 1, 0.9215686, 1,
-0.008385623, -1.434626, -2.56313, 0, 1, 0.9294118, 1,
-0.007895894, 0.2856306, -0.07612271, 0, 1, 0.9333333, 1,
-0.003722319, -1.328797, -2.717243, 0, 1, 0.9411765, 1,
-0.003298988, -1.129163, -2.436382, 0, 1, 0.945098, 1,
-0.003279168, -0.888059, -3.776816, 0, 1, 0.9529412, 1,
-0.003096907, 1.186094, 0.001131589, 0, 1, 0.9568627, 1,
-0.0004193364, 0.3417879, -1.832512, 0, 1, 0.9647059, 1,
0.0006441555, 1.332717, 0.5424563, 0, 1, 0.9686275, 1,
0.0007592509, 1.392887, 0.6825313, 0, 1, 0.9764706, 1,
0.004055417, -1.436436, 2.499613, 0, 1, 0.9803922, 1,
0.004296494, 0.3088371, 1.122079, 0, 1, 0.9882353, 1,
0.004388759, 0.2027806, -0.8421734, 0, 1, 0.9921569, 1,
0.0078683, -1.954197, 3.816713, 0, 1, 1, 1,
0.009718334, -1.196738, 2.796041, 0, 0.9921569, 1, 1,
0.01236594, 1.557343, 0.1858756, 0, 0.9882353, 1, 1,
0.01511238, 1.964854, 0.3673615, 0, 0.9803922, 1, 1,
0.01613315, -0.7449855, 2.992226, 0, 0.9764706, 1, 1,
0.01887364, -0.04309961, 1.199192, 0, 0.9686275, 1, 1,
0.03096157, 0.1106217, -0.05298086, 0, 0.9647059, 1, 1,
0.0321468, 1.11365, 0.8082465, 0, 0.9568627, 1, 1,
0.03612988, 2.378282, -0.04063031, 0, 0.9529412, 1, 1,
0.04168889, 0.8994975, -0.2938823, 0, 0.945098, 1, 1,
0.04238857, 1.469687, 0.2340003, 0, 0.9411765, 1, 1,
0.04485831, 0.4092566, -0.1479261, 0, 0.9333333, 1, 1,
0.04619041, 0.7683639, 0.5896097, 0, 0.9294118, 1, 1,
0.04790554, 1.484946, -1.230251, 0, 0.9215686, 1, 1,
0.04978377, -0.6632616, 3.691931, 0, 0.9176471, 1, 1,
0.05052542, 0.3992375, 1.391081, 0, 0.9098039, 1, 1,
0.05238513, -1.206165, 3.322244, 0, 0.9058824, 1, 1,
0.05629776, 1.021526, 0.6177381, 0, 0.8980392, 1, 1,
0.05631115, 1.425765, 0.8622653, 0, 0.8901961, 1, 1,
0.06864335, 1.558309, 0.5795357, 0, 0.8862745, 1, 1,
0.06898738, 0.1009557, -0.005421122, 0, 0.8784314, 1, 1,
0.06975732, 1.609861, 0.08279683, 0, 0.8745098, 1, 1,
0.07011322, 0.4358962, 0.9193788, 0, 0.8666667, 1, 1,
0.07085802, -0.2207196, 3.072582, 0, 0.8627451, 1, 1,
0.07240261, -0.5271074, 3.234356, 0, 0.854902, 1, 1,
0.07449562, 0.5514243, -0.9812774, 0, 0.8509804, 1, 1,
0.08253417, -0.367254, 2.244383, 0, 0.8431373, 1, 1,
0.08320578, 1.22977, -0.3202771, 0, 0.8392157, 1, 1,
0.08425509, -1.235446, 2.413361, 0, 0.8313726, 1, 1,
0.09233765, -1.047017, 4.472746, 0, 0.827451, 1, 1,
0.09409741, -0.01873925, 1.888555, 0, 0.8196079, 1, 1,
0.09618408, 0.2620783, 0.2978095, 0, 0.8156863, 1, 1,
0.09627011, 0.8903172, 0.8896983, 0, 0.8078431, 1, 1,
0.09843214, -0.001352968, 1.882794, 0, 0.8039216, 1, 1,
0.1000061, 0.2891155, 0.02054603, 0, 0.7960784, 1, 1,
0.1000599, 1.018486, -1.86971, 0, 0.7882353, 1, 1,
0.1021273, 0.4092547, 0.1842104, 0, 0.7843137, 1, 1,
0.1040527, 1.164965, -0.2248264, 0, 0.7764706, 1, 1,
0.1070921, -1.676485, 3.05605, 0, 0.772549, 1, 1,
0.1073759, 0.6589866, 1.89881, 0, 0.7647059, 1, 1,
0.1083409, 0.6779099, 0.7552829, 0, 0.7607843, 1, 1,
0.1116437, -0.1937454, 2.552839, 0, 0.7529412, 1, 1,
0.1117708, 0.3085892, 0.4860034, 0, 0.7490196, 1, 1,
0.1167685, 0.04557872, 2.624775, 0, 0.7411765, 1, 1,
0.1191149, -1.153544, 3.197733, 0, 0.7372549, 1, 1,
0.1198183, 0.9043224, 0.192721, 0, 0.7294118, 1, 1,
0.1208414, 0.1505177, 0.7926959, 0, 0.7254902, 1, 1,
0.1299616, 0.2145773, -0.1533668, 0, 0.7176471, 1, 1,
0.1312421, -0.1027175, 2.529977, 0, 0.7137255, 1, 1,
0.133201, 1.397938, 0.8345021, 0, 0.7058824, 1, 1,
0.1384967, -0.1858887, 1.762784, 0, 0.6980392, 1, 1,
0.1456414, -0.3964459, 4.080417, 0, 0.6941177, 1, 1,
0.1469223, -0.2709996, 1.950532, 0, 0.6862745, 1, 1,
0.1472101, 0.3130744, 0.9473107, 0, 0.682353, 1, 1,
0.1506847, 0.278415, 1.029876, 0, 0.6745098, 1, 1,
0.1551642, 0.03430341, 1.109963, 0, 0.6705883, 1, 1,
0.1567167, -0.3421383, 2.811259, 0, 0.6627451, 1, 1,
0.1573974, 0.8424711, -1.479769, 0, 0.6588235, 1, 1,
0.1584209, 1.301548, -0.2590863, 0, 0.6509804, 1, 1,
0.1591631, 0.9597106, 0.06495356, 0, 0.6470588, 1, 1,
0.1607166, -0.4599027, 3.705275, 0, 0.6392157, 1, 1,
0.1646208, -0.2060717, 4.398073, 0, 0.6352941, 1, 1,
0.1651991, -1.350436, 3.528957, 0, 0.627451, 1, 1,
0.1696568, -0.7827466, 1.518021, 0, 0.6235294, 1, 1,
0.1738425, -2.675031, 2.010443, 0, 0.6156863, 1, 1,
0.1738554, 0.6020612, 0.5099723, 0, 0.6117647, 1, 1,
0.1765175, -2.264332, 5.880647, 0, 0.6039216, 1, 1,
0.1784901, -0.5506248, 2.147699, 0, 0.5960785, 1, 1,
0.1788462, 0.6561068, -0.04303757, 0, 0.5921569, 1, 1,
0.1814998, 0.8988519, 0.9604345, 0, 0.5843138, 1, 1,
0.1820883, -0.2093853, 1.284897, 0, 0.5803922, 1, 1,
0.1842747, -1.680059, 4.620279, 0, 0.572549, 1, 1,
0.1845218, 0.682915, 2.343298, 0, 0.5686275, 1, 1,
0.1855938, 1.046938, 0.7140904, 0, 0.5607843, 1, 1,
0.1908138, -1.005932, 3.288507, 0, 0.5568628, 1, 1,
0.1916117, 0.9190633, 0.407888, 0, 0.5490196, 1, 1,
0.1949532, 0.1455122, 1.786661, 0, 0.5450981, 1, 1,
0.1952883, 0.2675736, 0.4656515, 0, 0.5372549, 1, 1,
0.1957864, -0.3590563, 3.091233, 0, 0.5333334, 1, 1,
0.200602, 0.8779557, 0.1765358, 0, 0.5254902, 1, 1,
0.2016926, 0.8755944, 0.8025655, 0, 0.5215687, 1, 1,
0.2030402, 0.9248062, 1.149262, 0, 0.5137255, 1, 1,
0.2036096, 0.7736384, -1.086104, 0, 0.509804, 1, 1,
0.2067463, -2.54184, 4.14747, 0, 0.5019608, 1, 1,
0.2068092, 1.112582, 0.476357, 0, 0.4941176, 1, 1,
0.2075841, -0.7809427, 1.941657, 0, 0.4901961, 1, 1,
0.2094145, 0.1126455, 3.013986, 0, 0.4823529, 1, 1,
0.2095302, -0.851846, 3.284864, 0, 0.4784314, 1, 1,
0.2104345, 1.501212, -1.287792, 0, 0.4705882, 1, 1,
0.2114689, 0.8373106, -0.6594149, 0, 0.4666667, 1, 1,
0.2164169, 1.109476, 1.705118, 0, 0.4588235, 1, 1,
0.2230914, -0.9620871, 3.092767, 0, 0.454902, 1, 1,
0.2235695, -0.6056612, 3.675662, 0, 0.4470588, 1, 1,
0.2275767, 0.713737, 1.516628, 0, 0.4431373, 1, 1,
0.2279683, -0.2843566, 1.3439, 0, 0.4352941, 1, 1,
0.2297281, 0.6915289, 0.4417252, 0, 0.4313726, 1, 1,
0.2299425, 0.05998506, -0.7804166, 0, 0.4235294, 1, 1,
0.2366964, -0.6344311, 2.270151, 0, 0.4196078, 1, 1,
0.2518865, -0.1713917, 2.793823, 0, 0.4117647, 1, 1,
0.2529477, -0.0392266, 1.922657, 0, 0.4078431, 1, 1,
0.2540351, 0.7104522, -0.05787443, 0, 0.4, 1, 1,
0.2575164, -1.055016, 1.014822, 0, 0.3921569, 1, 1,
0.2724996, -0.08706112, 1.712394, 0, 0.3882353, 1, 1,
0.2737545, 1.032556, 0.01181969, 0, 0.3803922, 1, 1,
0.2738523, -1.803419, 2.56609, 0, 0.3764706, 1, 1,
0.2740023, 1.139283, 1.204486, 0, 0.3686275, 1, 1,
0.278365, -0.8341973, 2.9693, 0, 0.3647059, 1, 1,
0.2787937, 0.5592132, 1.155342, 0, 0.3568628, 1, 1,
0.2818581, -1.24728, 3.814581, 0, 0.3529412, 1, 1,
0.2846407, -0.4818132, 1.745835, 0, 0.345098, 1, 1,
0.2875113, -2.306199, 3.551085, 0, 0.3411765, 1, 1,
0.2893607, -0.2414148, 2.184123, 0, 0.3333333, 1, 1,
0.2896528, 0.7798213, -0.2955706, 0, 0.3294118, 1, 1,
0.2972137, -0.3426146, 3.987848, 0, 0.3215686, 1, 1,
0.3023548, 1.623353, -0.04385626, 0, 0.3176471, 1, 1,
0.3052317, -2.301196, 1.979657, 0, 0.3098039, 1, 1,
0.3053715, -2.019615, 3.597611, 0, 0.3058824, 1, 1,
0.3098022, -0.09386429, 1.973096, 0, 0.2980392, 1, 1,
0.3154905, 1.505332, -0.1315934, 0, 0.2901961, 1, 1,
0.3165997, -0.7627056, 3.357795, 0, 0.2862745, 1, 1,
0.3197003, 0.3935873, 1.385367, 0, 0.2784314, 1, 1,
0.3211756, -1.312675, 2.468189, 0, 0.2745098, 1, 1,
0.3212826, 0.3663678, 0.1345603, 0, 0.2666667, 1, 1,
0.3264484, 0.6644083, -0.7026753, 0, 0.2627451, 1, 1,
0.3267982, 0.7990084, -0.2955284, 0, 0.254902, 1, 1,
0.3308351, 1.202011, 0.1976028, 0, 0.2509804, 1, 1,
0.3317142, 0.1735585, 0.2736282, 0, 0.2431373, 1, 1,
0.3321881, 1.183789, -1.324594, 0, 0.2392157, 1, 1,
0.3349581, 1.425915, 1.493899, 0, 0.2313726, 1, 1,
0.335168, 0.8294511, 0.465744, 0, 0.227451, 1, 1,
0.3376707, -1.767875, 2.706689, 0, 0.2196078, 1, 1,
0.3523264, 0.3739712, 1.268676, 0, 0.2156863, 1, 1,
0.3525618, 0.6043849, 0.3226218, 0, 0.2078431, 1, 1,
0.3542013, 0.2764598, 0.7732953, 0, 0.2039216, 1, 1,
0.3591426, -0.1584685, 3.452577, 0, 0.1960784, 1, 1,
0.3608188, -1.79203, 1.115588, 0, 0.1882353, 1, 1,
0.3639776, 1.746259, 0.1656237, 0, 0.1843137, 1, 1,
0.3641427, -2.029322, 0.6502731, 0, 0.1764706, 1, 1,
0.3676518, 0.5059664, -0.6563907, 0, 0.172549, 1, 1,
0.3686848, 1.654917, 0.5242546, 0, 0.1647059, 1, 1,
0.3691584, 0.01533232, 0.9822003, 0, 0.1607843, 1, 1,
0.3790492, 0.6002841, 1.18222, 0, 0.1529412, 1, 1,
0.3795308, -0.7078915, 2.378666, 0, 0.1490196, 1, 1,
0.3816685, 0.8726128, 2.437209, 0, 0.1411765, 1, 1,
0.3822116, 0.1528888, 0.1270869, 0, 0.1372549, 1, 1,
0.3855539, -1.096003, 2.578199, 0, 0.1294118, 1, 1,
0.3861269, 0.895636, 0.01921938, 0, 0.1254902, 1, 1,
0.3950516, 1.229385, 1.319412, 0, 0.1176471, 1, 1,
0.4020862, -1.106134, 4.040282, 0, 0.1137255, 1, 1,
0.4038823, 0.9979057, 1.087717, 0, 0.1058824, 1, 1,
0.4049503, -1.428353, 1.589284, 0, 0.09803922, 1, 1,
0.4067003, 0.08753808, 2.325961, 0, 0.09411765, 1, 1,
0.4067054, 0.5171797, -0.2481506, 0, 0.08627451, 1, 1,
0.4098338, -0.1062694, 1.52007, 0, 0.08235294, 1, 1,
0.410584, -1.405054, 2.653731, 0, 0.07450981, 1, 1,
0.4108036, 1.414782, 0.632459, 0, 0.07058824, 1, 1,
0.4114648, 0.9943393, 1.176596, 0, 0.0627451, 1, 1,
0.4115686, 0.2288249, -0.1924252, 0, 0.05882353, 1, 1,
0.4124594, -0.2228284, 3.150357, 0, 0.05098039, 1, 1,
0.4133428, 0.7052561, 0.876725, 0, 0.04705882, 1, 1,
0.4170796, 1.284563, -1.645352, 0, 0.03921569, 1, 1,
0.4186279, -0.4970638, 2.87577, 0, 0.03529412, 1, 1,
0.4194837, -1.549115, 1.123175, 0, 0.02745098, 1, 1,
0.4230725, 0.9876557, 0.6323487, 0, 0.02352941, 1, 1,
0.4254672, 0.2943496, 0.7451437, 0, 0.01568628, 1, 1,
0.4262372, 0.1730612, -1.066, 0, 0.01176471, 1, 1,
0.4264379, 0.5839934, 0.7297062, 0, 0.003921569, 1, 1,
0.4275812, -0.1811755, 0.6059179, 0.003921569, 0, 1, 1,
0.43135, 1.125011, 0.1410388, 0.007843138, 0, 1, 1,
0.4315398, -0.1261193, 3.631429, 0.01568628, 0, 1, 1,
0.4318248, 1.012939, 0.5804568, 0.01960784, 0, 1, 1,
0.4334805, -1.071656, 3.868432, 0.02745098, 0, 1, 1,
0.4360035, -0.6664389, 1.889901, 0.03137255, 0, 1, 1,
0.4365758, -0.6260551, 0.7405796, 0.03921569, 0, 1, 1,
0.4381148, 1.237494, 1.014877, 0.04313726, 0, 1, 1,
0.4411895, -1.222058, 2.764042, 0.05098039, 0, 1, 1,
0.4440187, -1.240718, 1.527784, 0.05490196, 0, 1, 1,
0.4459301, 1.013415, 0.2530913, 0.0627451, 0, 1, 1,
0.4467904, 1.452116, 0.4873208, 0.06666667, 0, 1, 1,
0.4469738, -0.4716576, 2.319324, 0.07450981, 0, 1, 1,
0.4472551, 0.170668, 1.173841, 0.07843138, 0, 1, 1,
0.4512266, 0.156319, 1.716948, 0.08627451, 0, 1, 1,
0.4548368, -0.5129108, 3.731316, 0.09019608, 0, 1, 1,
0.4557718, -0.7743397, 1.450846, 0.09803922, 0, 1, 1,
0.4617678, 0.2959618, 0.7932134, 0.1058824, 0, 1, 1,
0.4664289, 0.09427859, 0.9474103, 0.1098039, 0, 1, 1,
0.4710738, 0.05272346, 1.765815, 0.1176471, 0, 1, 1,
0.471462, 0.4409403, 0.7753209, 0.1215686, 0, 1, 1,
0.4721776, 0.3528629, 0.7484941, 0.1294118, 0, 1, 1,
0.4758054, 1.212678, -0.9340164, 0.1333333, 0, 1, 1,
0.4806482, 0.9085687, 1.15201, 0.1411765, 0, 1, 1,
0.4818632, -0.9729308, 2.438186, 0.145098, 0, 1, 1,
0.490752, 1.75203, -0.1536822, 0.1529412, 0, 1, 1,
0.4928782, -0.8294534, 4.142079, 0.1568628, 0, 1, 1,
0.4963538, 0.1360548, 1.687757, 0.1647059, 0, 1, 1,
0.4991066, 0.02562905, 0.6124805, 0.1686275, 0, 1, 1,
0.5053027, 0.7307247, 0.7231081, 0.1764706, 0, 1, 1,
0.5128936, -2.770727, 3.509006, 0.1803922, 0, 1, 1,
0.5137069, -0.5647184, 3.424795, 0.1882353, 0, 1, 1,
0.514686, 0.2037294, 0.6830317, 0.1921569, 0, 1, 1,
0.515361, 1.179257, 2.928614, 0.2, 0, 1, 1,
0.5202327, 1.107064, -0.6592593, 0.2078431, 0, 1, 1,
0.5248476, -0.3557073, -0.2682936, 0.2117647, 0, 1, 1,
0.5276659, -0.5268927, 2.590777, 0.2196078, 0, 1, 1,
0.5304145, -0.6056703, 2.700404, 0.2235294, 0, 1, 1,
0.5326854, 1.254048, -0.7303271, 0.2313726, 0, 1, 1,
0.5351497, -0.6533203, 2.368408, 0.2352941, 0, 1, 1,
0.5381318, -0.5921662, 2.968129, 0.2431373, 0, 1, 1,
0.5397642, -0.5334204, 1.467872, 0.2470588, 0, 1, 1,
0.5414029, 1.916136, 0.7648128, 0.254902, 0, 1, 1,
0.5419884, -1.105745, 2.992895, 0.2588235, 0, 1, 1,
0.547987, 0.4724638, -0.03601125, 0.2666667, 0, 1, 1,
0.551618, 0.1835464, 3.19709, 0.2705882, 0, 1, 1,
0.5527492, 0.9917652, 0.5967674, 0.2784314, 0, 1, 1,
0.5538101, 0.3915902, 0.2629541, 0.282353, 0, 1, 1,
0.5547429, -1.667797, 2.002292, 0.2901961, 0, 1, 1,
0.5568686, 0.3300638, 0.6836936, 0.2941177, 0, 1, 1,
0.5589026, -0.8674809, 2.246732, 0.3019608, 0, 1, 1,
0.5603892, 1.093673, -0.2259305, 0.3098039, 0, 1, 1,
0.5636756, -0.5284162, 3.082144, 0.3137255, 0, 1, 1,
0.5651832, -2.183309, 3.512151, 0.3215686, 0, 1, 1,
0.5694181, 0.2615312, 2.138524, 0.3254902, 0, 1, 1,
0.5744926, 0.08321524, 0.2632656, 0.3333333, 0, 1, 1,
0.5775303, 0.7930605, 0.6435996, 0.3372549, 0, 1, 1,
0.5869564, 0.494166, 0.3850625, 0.345098, 0, 1, 1,
0.5898829, 1.030556, 0.06762771, 0.3490196, 0, 1, 1,
0.5951649, -1.391321, 3.411924, 0.3568628, 0, 1, 1,
0.5975285, -1.338462, 2.185308, 0.3607843, 0, 1, 1,
0.5995865, -0.1292116, 2.106785, 0.3686275, 0, 1, 1,
0.6026541, -0.3959184, 2.235083, 0.372549, 0, 1, 1,
0.6041982, -0.4253352, 2.215957, 0.3803922, 0, 1, 1,
0.6046436, -1.17001, 3.370242, 0.3843137, 0, 1, 1,
0.6061331, -0.9990655, 2.70347, 0.3921569, 0, 1, 1,
0.6070172, -0.7186524, 3.282983, 0.3960784, 0, 1, 1,
0.6106355, -0.6955451, 3.158773, 0.4039216, 0, 1, 1,
0.6118103, -0.680739, 3.057409, 0.4117647, 0, 1, 1,
0.6132295, 0.05251882, 0.9131831, 0.4156863, 0, 1, 1,
0.6151908, -0.0779644, 3.080885, 0.4235294, 0, 1, 1,
0.6177834, -0.7092206, 1.465266, 0.427451, 0, 1, 1,
0.6211169, 1.898105, -0.2304662, 0.4352941, 0, 1, 1,
0.6264189, -0.436496, 1.767369, 0.4392157, 0, 1, 1,
0.6330093, -1.564907, 3.121823, 0.4470588, 0, 1, 1,
0.6351165, 0.01697247, 1.765371, 0.4509804, 0, 1, 1,
0.6356444, -1.130807, 2.707331, 0.4588235, 0, 1, 1,
0.6380644, 0.1527625, 2.216492, 0.4627451, 0, 1, 1,
0.63835, 0.9458246, -0.138012, 0.4705882, 0, 1, 1,
0.6411252, 1.970664, 0.5955471, 0.4745098, 0, 1, 1,
0.6504552, 0.3479344, 1.442591, 0.4823529, 0, 1, 1,
0.6542954, 0.2767745, 1.76001, 0.4862745, 0, 1, 1,
0.6557881, 1.362726, 1.299203, 0.4941176, 0, 1, 1,
0.6641209, 0.1350771, 2.811852, 0.5019608, 0, 1, 1,
0.6645944, -3.120649, 2.553111, 0.5058824, 0, 1, 1,
0.67939, -0.3855628, 1.537236, 0.5137255, 0, 1, 1,
0.6814176, 1.622424, 0.2182834, 0.5176471, 0, 1, 1,
0.685295, 0.5627512, -0.81183, 0.5254902, 0, 1, 1,
0.6897854, 1.682586, 1.497468, 0.5294118, 0, 1, 1,
0.6922158, 2.674929, 0.8720307, 0.5372549, 0, 1, 1,
0.6933101, 0.1857774, 1.464418, 0.5411765, 0, 1, 1,
0.6995817, -1.237566, 2.012097, 0.5490196, 0, 1, 1,
0.6996915, 2.249414, 0.8283347, 0.5529412, 0, 1, 1,
0.7016263, 0.3823228, 0.7571797, 0.5607843, 0, 1, 1,
0.7036859, 1.33671, -2.421391, 0.5647059, 0, 1, 1,
0.7055386, -0.9631999, 3.823716, 0.572549, 0, 1, 1,
0.7060824, 0.6133751, 0.9289594, 0.5764706, 0, 1, 1,
0.7085028, -3.035721, 2.050213, 0.5843138, 0, 1, 1,
0.7143825, 0.008676697, 1.37386, 0.5882353, 0, 1, 1,
0.7170491, 0.6278154, 0.7089063, 0.5960785, 0, 1, 1,
0.7172434, -0.9385684, 3.642734, 0.6039216, 0, 1, 1,
0.717269, 1.411725, 0.9636239, 0.6078432, 0, 1, 1,
0.7180333, 0.09506348, 0.4365686, 0.6156863, 0, 1, 1,
0.730903, -0.05726495, 1.3883, 0.6196079, 0, 1, 1,
0.7351879, -0.07649777, 2.756781, 0.627451, 0, 1, 1,
0.7375913, -0.9933289, 1.722448, 0.6313726, 0, 1, 1,
0.7400432, -1.415322, 2.381687, 0.6392157, 0, 1, 1,
0.7406954, -1.900061, 0.804244, 0.6431373, 0, 1, 1,
0.7417562, 0.0247023, 1.768061, 0.6509804, 0, 1, 1,
0.74488, 0.9156703, 2.254542, 0.654902, 0, 1, 1,
0.7451952, 0.9231535, 1.382457, 0.6627451, 0, 1, 1,
0.7466789, -0.1942115, 2.368224, 0.6666667, 0, 1, 1,
0.7480197, 0.1403059, 2.233897, 0.6745098, 0, 1, 1,
0.7484975, -0.9112161, 3.599322, 0.6784314, 0, 1, 1,
0.752906, -0.6078028, 2.899489, 0.6862745, 0, 1, 1,
0.7551274, -0.07062969, 1.903327, 0.6901961, 0, 1, 1,
0.7565234, 0.3682431, 1.910437, 0.6980392, 0, 1, 1,
0.7676674, -0.1092391, 0.9281443, 0.7058824, 0, 1, 1,
0.7703781, 1.191804, 0.1436099, 0.7098039, 0, 1, 1,
0.770578, -0.03500717, 1.17517, 0.7176471, 0, 1, 1,
0.7720581, -0.6825949, 4.119675, 0.7215686, 0, 1, 1,
0.7732379, 0.1259449, 0.2196578, 0.7294118, 0, 1, 1,
0.774389, 0.2033792, -0.1230553, 0.7333333, 0, 1, 1,
0.7842125, 0.3757066, 1.76291, 0.7411765, 0, 1, 1,
0.7864069, -1.237957, 2.79826, 0.7450981, 0, 1, 1,
0.7890977, -0.4483553, 1.226272, 0.7529412, 0, 1, 1,
0.7922173, 1.167736, 0.4098223, 0.7568628, 0, 1, 1,
0.7947296, 0.05181769, 1.252603, 0.7647059, 0, 1, 1,
0.7988958, -0.06246227, 1.379785, 0.7686275, 0, 1, 1,
0.8046058, -0.7328858, 2.327642, 0.7764706, 0, 1, 1,
0.8095257, -0.916598, 2.459058, 0.7803922, 0, 1, 1,
0.8137137, -0.6401848, 1.916484, 0.7882353, 0, 1, 1,
0.8157124, -0.3549287, 1.941607, 0.7921569, 0, 1, 1,
0.8190742, 1.462921, 0.1070764, 0.8, 0, 1, 1,
0.8228519, -2.075829, 0.7691103, 0.8078431, 0, 1, 1,
0.8236362, -0.3579318, 0.9670123, 0.8117647, 0, 1, 1,
0.8249251, 1.571517, -0.5641138, 0.8196079, 0, 1, 1,
0.8250626, -0.8922533, 1.451396, 0.8235294, 0, 1, 1,
0.826413, -1.188753, 3.976941, 0.8313726, 0, 1, 1,
0.8277684, -0.5671193, 2.452589, 0.8352941, 0, 1, 1,
0.8341374, -0.8321493, 2.912976, 0.8431373, 0, 1, 1,
0.8422413, -1.112298, 2.785848, 0.8470588, 0, 1, 1,
0.8443609, 1.065312, 1.261276, 0.854902, 0, 1, 1,
0.8467869, -0.02210901, 2.081344, 0.8588235, 0, 1, 1,
0.8606833, -0.1848516, 1.695526, 0.8666667, 0, 1, 1,
0.8636724, -0.2899731, 1.657177, 0.8705882, 0, 1, 1,
0.8654438, -0.09912089, 1.755136, 0.8784314, 0, 1, 1,
0.865795, -0.5353992, 1.149442, 0.8823529, 0, 1, 1,
0.8681281, 1.238972, -0.02437217, 0.8901961, 0, 1, 1,
0.872217, -0.7607742, 2.68633, 0.8941177, 0, 1, 1,
0.8731813, -0.6727319, 1.73798, 0.9019608, 0, 1, 1,
0.8763252, -0.6795308, 1.355378, 0.9098039, 0, 1, 1,
0.8822922, 0.02648596, 1.323355, 0.9137255, 0, 1, 1,
0.885872, 0.3006461, 1.829473, 0.9215686, 0, 1, 1,
0.8902513, 0.4912061, 1.587141, 0.9254902, 0, 1, 1,
0.8922565, -0.3852444, 2.001396, 0.9333333, 0, 1, 1,
0.8948709, 0.05418807, 3.301995, 0.9372549, 0, 1, 1,
0.9004684, -0.1028928, 1.377963, 0.945098, 0, 1, 1,
0.912749, 1.442391, 2.596819, 0.9490196, 0, 1, 1,
0.9148595, -1.134934, 2.049059, 0.9568627, 0, 1, 1,
0.9188542, 1.307479, 0.005865553, 0.9607843, 0, 1, 1,
0.9220552, 0.864967, 0.7340822, 0.9686275, 0, 1, 1,
0.9227813, -0.1858359, 1.317629, 0.972549, 0, 1, 1,
0.9240575, -0.0001532265, 2.607136, 0.9803922, 0, 1, 1,
0.9308141, -0.3851857, 2.321511, 0.9843137, 0, 1, 1,
0.9314557, 1.372748, 0.0934609, 0.9921569, 0, 1, 1,
0.9352149, 2.134796, 0.1488281, 0.9960784, 0, 1, 1,
0.9469013, 0.6816405, 1.71709, 1, 0, 0.9960784, 1,
0.9521552, -0.8889503, 4.969625, 1, 0, 0.9882353, 1,
0.9542608, 0.7907928, 0.1670429, 1, 0, 0.9843137, 1,
0.9571698, 0.5654491, 1.272614, 1, 0, 0.9764706, 1,
0.9599358, -0.7083315, 2.973999, 1, 0, 0.972549, 1,
0.9639072, 0.2056658, 1.240869, 1, 0, 0.9647059, 1,
0.9643072, 0.08807655, 1.54894, 1, 0, 0.9607843, 1,
0.9644051, -0.1228547, 1.498068, 1, 0, 0.9529412, 1,
0.9681068, 0.4221526, 1.7773, 1, 0, 0.9490196, 1,
0.9705302, -1.761849, 1.020102, 1, 0, 0.9411765, 1,
0.9705893, 0.1373829, 0.2393933, 1, 0, 0.9372549, 1,
0.9773253, 1.726901, 0.7870201, 1, 0, 0.9294118, 1,
0.9815052, -1.631208, 2.666607, 1, 0, 0.9254902, 1,
0.9830804, 1.224348, 0.5864843, 1, 0, 0.9176471, 1,
0.9867127, 0.576651, 1.620583, 1, 0, 0.9137255, 1,
0.9875375, 0.1604281, 1.77014, 1, 0, 0.9058824, 1,
0.9943948, 1.820684, -0.2127212, 1, 0, 0.9019608, 1,
0.9959053, 1.679813, -0.1260439, 1, 0, 0.8941177, 1,
0.9975349, 1.104789, 0.9024823, 1, 0, 0.8862745, 1,
1.010294, 0.2985414, 2.934099, 1, 0, 0.8823529, 1,
1.011756, -1.258996, 1.373133, 1, 0, 0.8745098, 1,
1.014057, 0.753126, 1.300279, 1, 0, 0.8705882, 1,
1.019126, -0.8549681, 2.756601, 1, 0, 0.8627451, 1,
1.026012, 0.01286082, 2.234297, 1, 0, 0.8588235, 1,
1.027075, 0.315531, 0.1986876, 1, 0, 0.8509804, 1,
1.027416, 0.01318321, 0.3284137, 1, 0, 0.8470588, 1,
1.037436, -0.1233583, 1.059233, 1, 0, 0.8392157, 1,
1.037782, 0.5525231, 1.800338, 1, 0, 0.8352941, 1,
1.039625, 0.1810211, 1.515606, 1, 0, 0.827451, 1,
1.04197, -0.7925333, 1.059308, 1, 0, 0.8235294, 1,
1.051522, 0.243482, 2.134983, 1, 0, 0.8156863, 1,
1.057171, -0.1817422, 1.746041, 1, 0, 0.8117647, 1,
1.064389, -0.9126001, 2.893401, 1, 0, 0.8039216, 1,
1.064877, 0.418478, 0.337369, 1, 0, 0.7960784, 1,
1.065395, -0.08348253, 0.4274229, 1, 0, 0.7921569, 1,
1.070173, 0.2941973, 0.6300955, 1, 0, 0.7843137, 1,
1.073009, 0.2921845, 1.191561, 1, 0, 0.7803922, 1,
1.077679, 1.601711, 1.860617, 1, 0, 0.772549, 1,
1.081342, 0.4230745, 1.213802, 1, 0, 0.7686275, 1,
1.082065, -1.325378, 1.630949, 1, 0, 0.7607843, 1,
1.08877, -1.0301, 2.394497, 1, 0, 0.7568628, 1,
1.089113, -0.7087166, 1.956868, 1, 0, 0.7490196, 1,
1.089268, -1.247517, 2.614537, 1, 0, 0.7450981, 1,
1.099317, -1.038636, 2.003337, 1, 0, 0.7372549, 1,
1.115578, 0.02848932, 1.299302, 1, 0, 0.7333333, 1,
1.117298, -0.8062581, 2.932088, 1, 0, 0.7254902, 1,
1.119962, -1.253423, 2.826046, 1, 0, 0.7215686, 1,
1.125272, -0.1546388, -1.185807, 1, 0, 0.7137255, 1,
1.132733, 0.2965801, 1.42444, 1, 0, 0.7098039, 1,
1.134804, 0.4760954, 1.472548, 1, 0, 0.7019608, 1,
1.135557, -0.5873006, 1.331268, 1, 0, 0.6941177, 1,
1.136999, -1.202322, 2.181911, 1, 0, 0.6901961, 1,
1.140677, 1.235429, 0.1222078, 1, 0, 0.682353, 1,
1.142159, -0.01333507, 2.039002, 1, 0, 0.6784314, 1,
1.145119, 1.180877, 1.334241, 1, 0, 0.6705883, 1,
1.147978, 0.1674886, 1.911384, 1, 0, 0.6666667, 1,
1.15543, -0.5762748, 1.922887, 1, 0, 0.6588235, 1,
1.156032, -2.175442, 1.50046, 1, 0, 0.654902, 1,
1.156289, -0.8345351, 1.881472, 1, 0, 0.6470588, 1,
1.163523, 0.0131333, 2.129912, 1, 0, 0.6431373, 1,
1.167084, -2.139045, 2.034298, 1, 0, 0.6352941, 1,
1.170634, -1.457614, 4.281665, 1, 0, 0.6313726, 1,
1.17392, -0.598421, 1.535649, 1, 0, 0.6235294, 1,
1.184665, 2.26662, 0.3066734, 1, 0, 0.6196079, 1,
1.184765, 1.372002, 0.6548734, 1, 0, 0.6117647, 1,
1.187786, -0.5063312, 3.52552, 1, 0, 0.6078432, 1,
1.193728, 0.2962007, 1.549981, 1, 0, 0.6, 1,
1.198124, -0.2759095, 2.1772, 1, 0, 0.5921569, 1,
1.198576, 0.9236115, 1.920795, 1, 0, 0.5882353, 1,
1.19884, 1.842897, 0.7993758, 1, 0, 0.5803922, 1,
1.19885, -0.9501584, 1.757374, 1, 0, 0.5764706, 1,
1.200688, 1.172516, 1.120612, 1, 0, 0.5686275, 1,
1.207584, -0.6584684, 3.892694, 1, 0, 0.5647059, 1,
1.21101, 0.1987551, 1.364562, 1, 0, 0.5568628, 1,
1.215101, -0.2634903, 0.263028, 1, 0, 0.5529412, 1,
1.215741, 0.6107812, -0.4189269, 1, 0, 0.5450981, 1,
1.216133, 1.554838, 2.696324, 1, 0, 0.5411765, 1,
1.219429, 0.9451039, 1.816753, 1, 0, 0.5333334, 1,
1.221012, -0.03623758, 2.691521, 1, 0, 0.5294118, 1,
1.221393, -2.469872, 1.987232, 1, 0, 0.5215687, 1,
1.223364, 0.4225128, 1.199697, 1, 0, 0.5176471, 1,
1.225387, -1.974233, 2.398571, 1, 0, 0.509804, 1,
1.233606, -0.3076876, 3.023919, 1, 0, 0.5058824, 1,
1.238947, -0.6105226, 2.716746, 1, 0, 0.4980392, 1,
1.248116, -1.36109, 1.337302, 1, 0, 0.4901961, 1,
1.261837, -0.6441084, 4.094284, 1, 0, 0.4862745, 1,
1.262094, 0.7155285, 0.8514371, 1, 0, 0.4784314, 1,
1.263548, 0.443883, 0.7138622, 1, 0, 0.4745098, 1,
1.263989, -0.6695102, 2.222365, 1, 0, 0.4666667, 1,
1.301617, -0.9525858, 2.381446, 1, 0, 0.4627451, 1,
1.325461, 0.1758212, 2.807168, 1, 0, 0.454902, 1,
1.334371, -0.3821689, 2.406331, 1, 0, 0.4509804, 1,
1.336429, 1.319352, 0.7139277, 1, 0, 0.4431373, 1,
1.339483, 0.05412018, 0.7634548, 1, 0, 0.4392157, 1,
1.345816, -1.006287, 3.357559, 1, 0, 0.4313726, 1,
1.355319, 0.6897631, 2.754848, 1, 0, 0.427451, 1,
1.355322, 0.3919417, 1.365849, 1, 0, 0.4196078, 1,
1.359005, 0.0696758, 2.357302, 1, 0, 0.4156863, 1,
1.361771, -0.6936128, 2.378803, 1, 0, 0.4078431, 1,
1.368141, -1.082856, 4.209144, 1, 0, 0.4039216, 1,
1.39081, -1.060342, 2.009147, 1, 0, 0.3960784, 1,
1.397286, -0.470853, 2.057971, 1, 0, 0.3882353, 1,
1.399685, -2.006277, 2.87848, 1, 0, 0.3843137, 1,
1.418544, 0.4770133, 0.3611327, 1, 0, 0.3764706, 1,
1.421299, -0.9285769, 1.61726, 1, 0, 0.372549, 1,
1.453177, 2.563604, -0.04058623, 1, 0, 0.3647059, 1,
1.461496, -0.8307493, 1.685677, 1, 0, 0.3607843, 1,
1.468373, -1.050454, 3.770195, 1, 0, 0.3529412, 1,
1.469898, 0.2262758, 4.262306, 1, 0, 0.3490196, 1,
1.472599, -2.573757, 2.334812, 1, 0, 0.3411765, 1,
1.483177, 0.9209136, 0.7994311, 1, 0, 0.3372549, 1,
1.490207, 0.998768, 2.078225, 1, 0, 0.3294118, 1,
1.491884, 0.5773631, 2.652691, 1, 0, 0.3254902, 1,
1.508908, 0.1427899, 0.8175129, 1, 0, 0.3176471, 1,
1.517209, 1.173467, 1.021546, 1, 0, 0.3137255, 1,
1.521189, -0.05746746, 1.016245, 1, 0, 0.3058824, 1,
1.539244, 1.550935, 0.8624583, 1, 0, 0.2980392, 1,
1.5395, -1.453346, 3.413273, 1, 0, 0.2941177, 1,
1.54074, -0.3513228, 1.445413, 1, 0, 0.2862745, 1,
1.567724, -0.04178781, 1.818631, 1, 0, 0.282353, 1,
1.585183, -0.8913245, 2.124715, 1, 0, 0.2745098, 1,
1.586636, -0.5155159, 1.633427, 1, 0, 0.2705882, 1,
1.592655, 0.5121159, 2.554813, 1, 0, 0.2627451, 1,
1.593653, 0.3820052, 0.1113631, 1, 0, 0.2588235, 1,
1.596128, -0.4649555, 0.396459, 1, 0, 0.2509804, 1,
1.61148, -0.5295346, 1.636795, 1, 0, 0.2470588, 1,
1.620743, -0.2005536, 1.813321, 1, 0, 0.2392157, 1,
1.642017, 2.461756, 0.3474754, 1, 0, 0.2352941, 1,
1.642125, -0.5426034, 2.011479, 1, 0, 0.227451, 1,
1.648186, 0.7628376, 0.05249085, 1, 0, 0.2235294, 1,
1.656427, -0.7619296, 1.437562, 1, 0, 0.2156863, 1,
1.667316, 0.2198888, 0.179259, 1, 0, 0.2117647, 1,
1.671221, 1.118961, 1.830545, 1, 0, 0.2039216, 1,
1.672648, 0.01497622, 2.069608, 1, 0, 0.1960784, 1,
1.700559, -0.567259, 1.154723, 1, 0, 0.1921569, 1,
1.706742, -1.133173, 1.952287, 1, 0, 0.1843137, 1,
1.714278, -1.593364, 2.832918, 1, 0, 0.1803922, 1,
1.735931, -0.02431824, 1.233437, 1, 0, 0.172549, 1,
1.767391, 0.8396896, 1.367585, 1, 0, 0.1686275, 1,
1.773462, -0.5914767, 3.293445, 1, 0, 0.1607843, 1,
1.802684, -0.3794788, 1.679143, 1, 0, 0.1568628, 1,
1.803779, -1.453915, 0.7971785, 1, 0, 0.1490196, 1,
1.805381, -2.261148, 2.752914, 1, 0, 0.145098, 1,
1.832145, 1.145221, 2.066234, 1, 0, 0.1372549, 1,
1.873815, -0.680759, 2.312218, 1, 0, 0.1333333, 1,
1.918328, -0.568972, 4.061999, 1, 0, 0.1254902, 1,
1.93404, -0.6445593, 3.445433, 1, 0, 0.1215686, 1,
1.934914, -0.4090101, 1.614773, 1, 0, 0.1137255, 1,
1.952678, -1.888626, 2.184733, 1, 0, 0.1098039, 1,
1.957237, -0.07062483, 3.617233, 1, 0, 0.1019608, 1,
1.995764, 1.278068, 0.02561171, 1, 0, 0.09411765, 1,
2.036968, -0.3650964, 1.399777, 1, 0, 0.09019608, 1,
2.077171, -1.250659, 0.475083, 1, 0, 0.08235294, 1,
2.105691, -0.8386469, 0.9130774, 1, 0, 0.07843138, 1,
2.130093, -1.113433, 2.526391, 1, 0, 0.07058824, 1,
2.188124, 0.1495042, 0.351896, 1, 0, 0.06666667, 1,
2.316177, 0.3299047, 1.901436, 1, 0, 0.05882353, 1,
2.324581, -0.882683, 0.07243732, 1, 0, 0.05490196, 1,
2.381837, -0.1972763, 1.710875, 1, 0, 0.04705882, 1,
2.399948, 2.145013, 2.967437, 1, 0, 0.04313726, 1,
2.657449, 0.4292694, 2.203747, 1, 0, 0.03529412, 1,
2.671829, 0.5338683, 1.392713, 1, 0, 0.03137255, 1,
2.78334, -0.3285038, 1.834135, 1, 0, 0.02352941, 1,
2.856306, -3.614074, 3.347462, 1, 0, 0.01960784, 1,
2.932675, 0.5042757, 0.4270967, 1, 0, 0.01176471, 1,
3.15128, -0.9092754, 2.794593, 1, 0, 0.007843138, 1
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
0.1454047, -4.68006, -7.504741, 0, -0.5, 0.5, 0.5,
0.1454047, -4.68006, -7.504741, 1, -0.5, 0.5, 0.5,
0.1454047, -4.68006, -7.504741, 1, 1.5, 0.5, 0.5,
0.1454047, -4.68006, -7.504741, 0, 1.5, 0.5, 0.5
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
-3.879463, -0.4695727, -7.504741, 0, -0.5, 0.5, 0.5,
-3.879463, -0.4695727, -7.504741, 1, -0.5, 0.5, 0.5,
-3.879463, -0.4695727, -7.504741, 1, 1.5, 0.5, 0.5,
-3.879463, -0.4695727, -7.504741, 0, 1.5, 0.5, 0.5
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
-3.879463, -4.68006, 0.1579502, 0, -0.5, 0.5, 0.5,
-3.879463, -4.68006, 0.1579502, 1, -0.5, 0.5, 0.5,
-3.879463, -4.68006, 0.1579502, 1, 1.5, 0.5, 0.5,
-3.879463, -4.68006, 0.1579502, 0, 1.5, 0.5, 0.5
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
-2, -3.708409, -5.736427,
3, -3.708409, -5.736427,
-2, -3.708409, -5.736427,
-2, -3.870351, -6.031146,
-1, -3.708409, -5.736427,
-1, -3.870351, -6.031146,
0, -3.708409, -5.736427,
0, -3.870351, -6.031146,
1, -3.708409, -5.736427,
1, -3.870351, -6.031146,
2, -3.708409, -5.736427,
2, -3.870351, -6.031146,
3, -3.708409, -5.736427,
3, -3.870351, -6.031146
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
-2, -4.194234, -6.620584, 0, -0.5, 0.5, 0.5,
-2, -4.194234, -6.620584, 1, -0.5, 0.5, 0.5,
-2, -4.194234, -6.620584, 1, 1.5, 0.5, 0.5,
-2, -4.194234, -6.620584, 0, 1.5, 0.5, 0.5,
-1, -4.194234, -6.620584, 0, -0.5, 0.5, 0.5,
-1, -4.194234, -6.620584, 1, -0.5, 0.5, 0.5,
-1, -4.194234, -6.620584, 1, 1.5, 0.5, 0.5,
-1, -4.194234, -6.620584, 0, 1.5, 0.5, 0.5,
0, -4.194234, -6.620584, 0, -0.5, 0.5, 0.5,
0, -4.194234, -6.620584, 1, -0.5, 0.5, 0.5,
0, -4.194234, -6.620584, 1, 1.5, 0.5, 0.5,
0, -4.194234, -6.620584, 0, 1.5, 0.5, 0.5,
1, -4.194234, -6.620584, 0, -0.5, 0.5, 0.5,
1, -4.194234, -6.620584, 1, -0.5, 0.5, 0.5,
1, -4.194234, -6.620584, 1, 1.5, 0.5, 0.5,
1, -4.194234, -6.620584, 0, 1.5, 0.5, 0.5,
2, -4.194234, -6.620584, 0, -0.5, 0.5, 0.5,
2, -4.194234, -6.620584, 1, -0.5, 0.5, 0.5,
2, -4.194234, -6.620584, 1, 1.5, 0.5, 0.5,
2, -4.194234, -6.620584, 0, 1.5, 0.5, 0.5,
3, -4.194234, -6.620584, 0, -0.5, 0.5, 0.5,
3, -4.194234, -6.620584, 1, -0.5, 0.5, 0.5,
3, -4.194234, -6.620584, 1, 1.5, 0.5, 0.5,
3, -4.194234, -6.620584, 0, 1.5, 0.5, 0.5
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
-2.950647, -3, -5.736427,
-2.950647, 2, -5.736427,
-2.950647, -3, -5.736427,
-3.10545, -3, -6.031146,
-2.950647, -2, -5.736427,
-3.10545, -2, -6.031146,
-2.950647, -1, -5.736427,
-3.10545, -1, -6.031146,
-2.950647, 0, -5.736427,
-3.10545, 0, -6.031146,
-2.950647, 1, -5.736427,
-3.10545, 1, -6.031146,
-2.950647, 2, -5.736427,
-3.10545, 2, -6.031146
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
-3.415055, -3, -6.620584, 0, -0.5, 0.5, 0.5,
-3.415055, -3, -6.620584, 1, -0.5, 0.5, 0.5,
-3.415055, -3, -6.620584, 1, 1.5, 0.5, 0.5,
-3.415055, -3, -6.620584, 0, 1.5, 0.5, 0.5,
-3.415055, -2, -6.620584, 0, -0.5, 0.5, 0.5,
-3.415055, -2, -6.620584, 1, -0.5, 0.5, 0.5,
-3.415055, -2, -6.620584, 1, 1.5, 0.5, 0.5,
-3.415055, -2, -6.620584, 0, 1.5, 0.5, 0.5,
-3.415055, -1, -6.620584, 0, -0.5, 0.5, 0.5,
-3.415055, -1, -6.620584, 1, -0.5, 0.5, 0.5,
-3.415055, -1, -6.620584, 1, 1.5, 0.5, 0.5,
-3.415055, -1, -6.620584, 0, 1.5, 0.5, 0.5,
-3.415055, 0, -6.620584, 0, -0.5, 0.5, 0.5,
-3.415055, 0, -6.620584, 1, -0.5, 0.5, 0.5,
-3.415055, 0, -6.620584, 1, 1.5, 0.5, 0.5,
-3.415055, 0, -6.620584, 0, 1.5, 0.5, 0.5,
-3.415055, 1, -6.620584, 0, -0.5, 0.5, 0.5,
-3.415055, 1, -6.620584, 1, -0.5, 0.5, 0.5,
-3.415055, 1, -6.620584, 1, 1.5, 0.5, 0.5,
-3.415055, 1, -6.620584, 0, 1.5, 0.5, 0.5,
-3.415055, 2, -6.620584, 0, -0.5, 0.5, 0.5,
-3.415055, 2, -6.620584, 1, -0.5, 0.5, 0.5,
-3.415055, 2, -6.620584, 1, 1.5, 0.5, 0.5,
-3.415055, 2, -6.620584, 0, 1.5, 0.5, 0.5
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
-2.950647, -3.708409, -4,
-2.950647, -3.708409, 4,
-2.950647, -3.708409, -4,
-3.10545, -3.870351, -4,
-2.950647, -3.708409, -2,
-3.10545, -3.870351, -2,
-2.950647, -3.708409, 0,
-3.10545, -3.870351, 0,
-2.950647, -3.708409, 2,
-3.10545, -3.870351, 2,
-2.950647, -3.708409, 4,
-3.10545, -3.870351, 4
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
-3.415055, -4.194234, -4, 0, -0.5, 0.5, 0.5,
-3.415055, -4.194234, -4, 1, -0.5, 0.5, 0.5,
-3.415055, -4.194234, -4, 1, 1.5, 0.5, 0.5,
-3.415055, -4.194234, -4, 0, 1.5, 0.5, 0.5,
-3.415055, -4.194234, -2, 0, -0.5, 0.5, 0.5,
-3.415055, -4.194234, -2, 1, -0.5, 0.5, 0.5,
-3.415055, -4.194234, -2, 1, 1.5, 0.5, 0.5,
-3.415055, -4.194234, -2, 0, 1.5, 0.5, 0.5,
-3.415055, -4.194234, 0, 0, -0.5, 0.5, 0.5,
-3.415055, -4.194234, 0, 1, -0.5, 0.5, 0.5,
-3.415055, -4.194234, 0, 1, 1.5, 0.5, 0.5,
-3.415055, -4.194234, 0, 0, 1.5, 0.5, 0.5,
-3.415055, -4.194234, 2, 0, -0.5, 0.5, 0.5,
-3.415055, -4.194234, 2, 1, -0.5, 0.5, 0.5,
-3.415055, -4.194234, 2, 1, 1.5, 0.5, 0.5,
-3.415055, -4.194234, 2, 0, 1.5, 0.5, 0.5,
-3.415055, -4.194234, 4, 0, -0.5, 0.5, 0.5,
-3.415055, -4.194234, 4, 1, -0.5, 0.5, 0.5,
-3.415055, -4.194234, 4, 1, 1.5, 0.5, 0.5,
-3.415055, -4.194234, 4, 0, 1.5, 0.5, 0.5
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
-2.950647, -3.708409, -5.736427,
-2.950647, 2.769264, -5.736427,
-2.950647, -3.708409, 6.052328,
-2.950647, 2.769264, 6.052328,
-2.950647, -3.708409, -5.736427,
-2.950647, -3.708409, 6.052328,
-2.950647, 2.769264, -5.736427,
-2.950647, 2.769264, 6.052328,
-2.950647, -3.708409, -5.736427,
3.241457, -3.708409, -5.736427,
-2.950647, -3.708409, 6.052328,
3.241457, -3.708409, 6.052328,
-2.950647, 2.769264, -5.736427,
3.241457, 2.769264, -5.736427,
-2.950647, 2.769264, 6.052328,
3.241457, 2.769264, 6.052328,
3.241457, -3.708409, -5.736427,
3.241457, 2.769264, -5.736427,
3.241457, -3.708409, 6.052328,
3.241457, 2.769264, 6.052328,
3.241457, -3.708409, -5.736427,
3.241457, -3.708409, 6.052328,
3.241457, 2.769264, -5.736427,
3.241457, 2.769264, 6.052328
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
var radius = 7.907189;
var distance = 35.17998;
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
mvMatrix.translate( -0.1454047, 0.4695727, -0.1579502 );
mvMatrix.scale( 1.380695, 1.319827, 0.7252172 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.17998);
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
Koban<-read.table("Koban.xyz")
```

```
## Error in read.table("Koban.xyz"): no lines available in input
```

```r
x<-Koban$V2
```

```
## Error in eval(expr, envir, enclos): object 'Koban' not found
```

```r
y<-Koban$V3
```

```
## Error in eval(expr, envir, enclos): object 'Koban' not found
```

```r
z<-Koban$V4
```

```
## Error in eval(expr, envir, enclos): object 'Koban' not found
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
-2.860471, 0.8053977, -2.089668, 0, 0, 1, 1, 1,
-2.679069, 0.3049259, -1.929714, 1, 0, 0, 1, 1,
-2.503297, 0.9985825, -1.110702, 1, 0, 0, 1, 1,
-2.462402, 0.5245844, -1.216698, 1, 0, 0, 1, 1,
-2.455935, 1.114984, -1.702889, 1, 0, 0, 1, 1,
-2.443616, -0.1616459, -2.541979, 1, 0, 0, 1, 1,
-2.364785, 0.3220229, -3.046854, 0, 0, 0, 1, 1,
-2.162002, -0.7468159, -1.917789, 0, 0, 0, 1, 1,
-2.151495, -0.4148149, -1.304178, 0, 0, 0, 1, 1,
-2.128868, -1.605217, -2.500311, 0, 0, 0, 1, 1,
-2.092845, 0.6728736, -1.53191, 0, 0, 0, 1, 1,
-2.07917, 0.2993259, -2.173909, 0, 0, 0, 1, 1,
-2.065557, -0.1493502, -1.682761, 0, 0, 0, 1, 1,
-2.050907, -0.4572289, -2.281281, 1, 1, 1, 1, 1,
-2.012261, 1.445454, -1.54234, 1, 1, 1, 1, 1,
-2.002565, 0.4065091, -1.806802, 1, 1, 1, 1, 1,
-1.978833, -0.6514205, -0.7095676, 1, 1, 1, 1, 1,
-1.970917, -0.7925035, -1.989102, 1, 1, 1, 1, 1,
-1.960717, 0.1222122, -3.245698, 1, 1, 1, 1, 1,
-1.954286, 0.9257926, -2.093499, 1, 1, 1, 1, 1,
-1.944205, -0.764492, -0.9059114, 1, 1, 1, 1, 1,
-1.921658, 0.671668, -0.4851528, 1, 1, 1, 1, 1,
-1.897488, 1.905012, -1.417684, 1, 1, 1, 1, 1,
-1.873763, 0.01542582, -1.672953, 1, 1, 1, 1, 1,
-1.86405, -0.2113982, -1.499584, 1, 1, 1, 1, 1,
-1.863966, 1.035566, -0.691265, 1, 1, 1, 1, 1,
-1.846641, -1.018496, -2.128542, 1, 1, 1, 1, 1,
-1.845527, -1.224409, -2.29793, 1, 1, 1, 1, 1,
-1.843756, -0.1857692, -1.637101, 0, 0, 1, 1, 1,
-1.831729, 1.81886, -2.054253, 1, 0, 0, 1, 1,
-1.828299, 1.083685, -2.943762, 1, 0, 0, 1, 1,
-1.801987, -1.035481, -2.416036, 1, 0, 0, 1, 1,
-1.776563, -1.174145, -3.119588, 1, 0, 0, 1, 1,
-1.775842, -2.659918, -1.866738, 1, 0, 0, 1, 1,
-1.762738, -0.4722014, -2.184072, 0, 0, 0, 1, 1,
-1.761827, -0.5159165, -0.967391, 0, 0, 0, 1, 1,
-1.744428, -0.2961437, -2.483243, 0, 0, 0, 1, 1,
-1.710191, -0.7813968, -1.92869, 0, 0, 0, 1, 1,
-1.707598, 0.0480946, -1.863506, 0, 0, 0, 1, 1,
-1.705503, 0.2259398, -1.958987, 0, 0, 0, 1, 1,
-1.691197, -0.3442005, -2.546287, 0, 0, 0, 1, 1,
-1.685292, -0.3422149, -1.812799, 1, 1, 1, 1, 1,
-1.681673, 0.07392193, -2.196841, 1, 1, 1, 1, 1,
-1.675924, 0.9924705, -0.1375247, 1, 1, 1, 1, 1,
-1.674603, 0.1823699, 0.2187373, 1, 1, 1, 1, 1,
-1.656405, 0.2839984, -2.719171, 1, 1, 1, 1, 1,
-1.640344, -0.1893835, -1.021357, 1, 1, 1, 1, 1,
-1.638667, 0.3703977, -2.901984, 1, 1, 1, 1, 1,
-1.635329, -0.0328123, -1.982019, 1, 1, 1, 1, 1,
-1.627132, 1.073616, -0.1697607, 1, 1, 1, 1, 1,
-1.624129, -1.021832, -2.721413, 1, 1, 1, 1, 1,
-1.600251, 0.5536969, -1.695291, 1, 1, 1, 1, 1,
-1.590433, -1.626429, -1.962687, 1, 1, 1, 1, 1,
-1.587155, -0.4664287, -2.271916, 1, 1, 1, 1, 1,
-1.574935, 0.8667324, -1.523418, 1, 1, 1, 1, 1,
-1.566357, 1.063901, -1.799171, 1, 1, 1, 1, 1,
-1.558983, -0.09848502, -3.337746, 0, 0, 1, 1, 1,
-1.553505, -0.6111432, -1.960273, 1, 0, 0, 1, 1,
-1.544249, 1.804247, -2.834901, 1, 0, 0, 1, 1,
-1.54404, -0.708999, -3.005633, 1, 0, 0, 1, 1,
-1.535986, -1.978252, -1.244116, 1, 0, 0, 1, 1,
-1.510996, -2.662098, -2.622961, 1, 0, 0, 1, 1,
-1.508392, -0.171503, -1.466674, 0, 0, 0, 1, 1,
-1.507549, 1.602907, 0.4625362, 0, 0, 0, 1, 1,
-1.507329, -0.2204034, -0.6007507, 0, 0, 0, 1, 1,
-1.465613, -0.07970097, -2.1088, 0, 0, 0, 1, 1,
-1.453826, 0.09493164, -1.797555, 0, 0, 0, 1, 1,
-1.45277, 0.1597849, -0.1623981, 0, 0, 0, 1, 1,
-1.43858, 0.2920244, -2.334435, 0, 0, 0, 1, 1,
-1.437545, -1.058881, -1.08183, 1, 1, 1, 1, 1,
-1.430851, 0.05073278, -2.29634, 1, 1, 1, 1, 1,
-1.393986, -0.8265014, -3.14705, 1, 1, 1, 1, 1,
-1.371625, -0.7551973, -0.9200755, 1, 1, 1, 1, 1,
-1.37081, -0.7247523, -2.19843, 1, 1, 1, 1, 1,
-1.365414, -0.2273554, -0.1461328, 1, 1, 1, 1, 1,
-1.347586, -1.686476, -3.458952, 1, 1, 1, 1, 1,
-1.347219, 0.8925954, -0.4490685, 1, 1, 1, 1, 1,
-1.347082, 0.6696606, -2.813926, 1, 1, 1, 1, 1,
-1.344097, -2.110323, -4.138878, 1, 1, 1, 1, 1,
-1.343858, -0.4731185, -1.567436, 1, 1, 1, 1, 1,
-1.335458, 0.5251098, -0.06628539, 1, 1, 1, 1, 1,
-1.334361, 1.470293, 0.5653623, 1, 1, 1, 1, 1,
-1.324452, 0.4098442, -0.7999373, 1, 1, 1, 1, 1,
-1.322278, 0.5908363, -0.6890811, 1, 1, 1, 1, 1,
-1.320869, -1.208425, -3.722658, 0, 0, 1, 1, 1,
-1.311757, -0.7227817, -0.06500527, 1, 0, 0, 1, 1,
-1.306222, -0.6014773, -1.811479, 1, 0, 0, 1, 1,
-1.306153, -1.795454, -3.347602, 1, 0, 0, 1, 1,
-1.302558, -0.1085861, -1.258673, 1, 0, 0, 1, 1,
-1.289628, 0.3035533, -1.669043, 1, 0, 0, 1, 1,
-1.276202, 1.09899, 1.765475, 0, 0, 0, 1, 1,
-1.271111, -0.4004694, -4.147281, 0, 0, 0, 1, 1,
-1.261673, -2.36499, -2.633763, 0, 0, 0, 1, 1,
-1.260639, 0.738347, -2.425081, 0, 0, 0, 1, 1,
-1.259355, -0.8432357, -1.549972, 0, 0, 0, 1, 1,
-1.258171, -0.1120396, -2.568113, 0, 0, 0, 1, 1,
-1.250818, 0.407326, -2.315277, 0, 0, 0, 1, 1,
-1.250621, 0.8579926, -0.3468374, 1, 1, 1, 1, 1,
-1.23453, -0.6729453, -2.389548, 1, 1, 1, 1, 1,
-1.225312, 0.1999676, -1.507921, 1, 1, 1, 1, 1,
-1.221963, 0.3408616, -1.645213, 1, 1, 1, 1, 1,
-1.221255, 0.5504963, -0.4051635, 1, 1, 1, 1, 1,
-1.221036, 0.4346524, -1.480465, 1, 1, 1, 1, 1,
-1.219816, 1.671931, 0.887079, 1, 1, 1, 1, 1,
-1.215976, 1.282546, -0.6303854, 1, 1, 1, 1, 1,
-1.204682, -0.1331594, -0.9186129, 1, 1, 1, 1, 1,
-1.201504, 2.002966, 0.112974, 1, 1, 1, 1, 1,
-1.194173, -1.493637, -2.883279, 1, 1, 1, 1, 1,
-1.189862, 0.547975, 0.4334823, 1, 1, 1, 1, 1,
-1.188686, 1.868815, 0.6807234, 1, 1, 1, 1, 1,
-1.180986, -0.1314136, -0.5985109, 1, 1, 1, 1, 1,
-1.179242, 1.067432, -0.0222629, 1, 1, 1, 1, 1,
-1.177142, 0.6567428, -1.841436, 0, 0, 1, 1, 1,
-1.160821, -0.566809, -2.918375, 1, 0, 0, 1, 1,
-1.155407, -0.05573793, -1.605116, 1, 0, 0, 1, 1,
-1.151284, -0.1200945, -1.789994, 1, 0, 0, 1, 1,
-1.143357, 0.2469933, -2.911591, 1, 0, 0, 1, 1,
-1.139446, 0.4251301, -1.421686, 1, 0, 0, 1, 1,
-1.136455, -0.09814308, -0.3321287, 0, 0, 0, 1, 1,
-1.131116, -0.4714385, -3.343625, 0, 0, 0, 1, 1,
-1.125847, 0.3400862, -3.26608, 0, 0, 0, 1, 1,
-1.124629, -1.118153, -2.212518, 0, 0, 0, 1, 1,
-1.121746, 1.0925, -1.076138, 0, 0, 0, 1, 1,
-1.121437, -0.533949, -2.454924, 0, 0, 0, 1, 1,
-1.106545, -1.449926, -3.881478, 0, 0, 0, 1, 1,
-1.104582, 0.01403234, -1.630167, 1, 1, 1, 1, 1,
-1.101801, -0.2478365, -1.323099, 1, 1, 1, 1, 1,
-1.098788, -0.4588605, -0.5483667, 1, 1, 1, 1, 1,
-1.098022, 0.03144989, 0.09302989, 1, 1, 1, 1, 1,
-1.09254, 0.5605648, -0.0402049, 1, 1, 1, 1, 1,
-1.089813, -0.1155989, -1.76099, 1, 1, 1, 1, 1,
-1.084457, 1.09784, -1.666088, 1, 1, 1, 1, 1,
-1.069123, -0.6022275, -2.685953, 1, 1, 1, 1, 1,
-1.060073, 1.159284, -1.324723, 1, 1, 1, 1, 1,
-1.05677, -0.0947854, -0.4769024, 1, 1, 1, 1, 1,
-1.055428, 1.167117, -2.359345, 1, 1, 1, 1, 1,
-1.054451, -0.083945, -1.040067, 1, 1, 1, 1, 1,
-1.053304, 0.6340801, -1.918442, 1, 1, 1, 1, 1,
-1.053035, -0.2961045, -0.8710332, 1, 1, 1, 1, 1,
-1.049491, -0.6523064, -1.705339, 1, 1, 1, 1, 1,
-1.046814, -0.6690022, -3.064477, 0, 0, 1, 1, 1,
-1.040123, 0.1598363, -1.188624, 1, 0, 0, 1, 1,
-1.038018, -0.5649133, -1.418181, 1, 0, 0, 1, 1,
-1.027115, 1.602634, -2.969652, 1, 0, 0, 1, 1,
-1.021682, 1.357179, -1.49991, 1, 0, 0, 1, 1,
-1.01343, 1.702117, -0.5447542, 1, 0, 0, 1, 1,
-1.008072, -0.857557, -1.36655, 0, 0, 0, 1, 1,
-1.006291, 0.6208122, 0.7620841, 0, 0, 0, 1, 1,
-1.00023, -0.4164729, -1.609823, 0, 0, 0, 1, 1,
-0.9954, -0.1572592, -3.566204, 0, 0, 0, 1, 1,
-0.9947826, -0.2047189, -2.005691, 0, 0, 0, 1, 1,
-0.9937912, -1.800407, -2.674874, 0, 0, 0, 1, 1,
-0.991379, -0.521487, -0.5816944, 0, 0, 0, 1, 1,
-0.9897377, 1.362149, -0.363593, 1, 1, 1, 1, 1,
-0.9790928, -0.7544645, -2.202718, 1, 1, 1, 1, 1,
-0.9772335, -1.590849, -1.796066, 1, 1, 1, 1, 1,
-0.9751933, 1.625078, 0.4025034, 1, 1, 1, 1, 1,
-0.9747926, 0.1916472, 0.2297464, 1, 1, 1, 1, 1,
-0.9745678, -1.672691, -1.930929, 1, 1, 1, 1, 1,
-0.9735975, 2.160773, -2.183126, 1, 1, 1, 1, 1,
-0.9733012, 0.08273652, -0.6728886, 1, 1, 1, 1, 1,
-0.9706427, 1.533259, -0.7426527, 1, 1, 1, 1, 1,
-0.9666713, 0.1406198, -1.266994, 1, 1, 1, 1, 1,
-0.9655362, -1.307384, -2.595414, 1, 1, 1, 1, 1,
-0.9621254, 0.2663381, -0.7528134, 1, 1, 1, 1, 1,
-0.955493, 0.8445062, 0.9451419, 1, 1, 1, 1, 1,
-0.9516027, 0.005545773, -1.675414, 1, 1, 1, 1, 1,
-0.9501321, 0.4442621, -0.4471259, 1, 1, 1, 1, 1,
-0.9500494, -0.1169594, -1.400095, 0, 0, 1, 1, 1,
-0.9441771, -0.1697921, -0.9135123, 1, 0, 0, 1, 1,
-0.943998, -0.5089585, -2.932586, 1, 0, 0, 1, 1,
-0.9408721, 0.9076254, -0.823712, 1, 0, 0, 1, 1,
-0.936183, -0.5740644, -1.476696, 1, 0, 0, 1, 1,
-0.9314338, 1.076753, -2.807109, 1, 0, 0, 1, 1,
-0.9303306, 1.891543, -1.50943, 0, 0, 0, 1, 1,
-0.9205223, 0.2059955, -0.9206891, 0, 0, 0, 1, 1,
-0.9138073, 0.7323651, -1.367852, 0, 0, 0, 1, 1,
-0.9117596, 0.4038271, -1.860022, 0, 0, 0, 1, 1,
-0.9100295, 1.384485, -0.3961863, 0, 0, 0, 1, 1,
-0.9096809, -0.6019372, -2.048821, 0, 0, 0, 1, 1,
-0.9064977, 1.172821, -2.094977, 0, 0, 0, 1, 1,
-0.9063563, -1.158961, -2.160463, 1, 1, 1, 1, 1,
-0.8995874, -0.08035478, -1.286226, 1, 1, 1, 1, 1,
-0.898472, -0.7875837, -2.076121, 1, 1, 1, 1, 1,
-0.8871236, -0.4546305, -1.438077, 1, 1, 1, 1, 1,
-0.8803301, -1.329104, -3.34386, 1, 1, 1, 1, 1,
-0.8782399, -1.000772, -2.485871, 1, 1, 1, 1, 1,
-0.8683272, -0.3977733, -3.016749, 1, 1, 1, 1, 1,
-0.8659572, 0.9111453, -0.7456961, 1, 1, 1, 1, 1,
-0.864724, -0.4778327, -1.010036, 1, 1, 1, 1, 1,
-0.8629823, 0.9212727, 0.184147, 1, 1, 1, 1, 1,
-0.8585484, -0.8450124, -2.826697, 1, 1, 1, 1, 1,
-0.8555516, 1.084709, -0.6891941, 1, 1, 1, 1, 1,
-0.8506671, 0.9927144, -0.2031539, 1, 1, 1, 1, 1,
-0.847706, -1.002944, -3.577456, 1, 1, 1, 1, 1,
-0.8449876, 1.273567, -0.6638223, 1, 1, 1, 1, 1,
-0.8434822, 0.02758922, -2.195338, 0, 0, 1, 1, 1,
-0.8434732, 0.12974, -0.5275645, 1, 0, 0, 1, 1,
-0.8350441, -1.74127, -0.1724304, 1, 0, 0, 1, 1,
-0.8348973, 1.04436, -0.9420674, 1, 0, 0, 1, 1,
-0.8276556, -0.8538965, -2.614509, 1, 0, 0, 1, 1,
-0.8256862, 0.7611027, -2.050047, 1, 0, 0, 1, 1,
-0.8231093, 1.525707, -1.719551, 0, 0, 0, 1, 1,
-0.8228598, 0.6150531, -1.750425, 0, 0, 0, 1, 1,
-0.8224882, 0.1442305, -1.11955, 0, 0, 0, 1, 1,
-0.8192666, 0.9776374, 0.74002, 0, 0, 0, 1, 1,
-0.8109744, 1.039948, -0.9046348, 0, 0, 0, 1, 1,
-0.8063059, 0.7103048, -0.8765337, 0, 0, 0, 1, 1,
-0.8040874, -0.07429386, -1.273889, 0, 0, 0, 1, 1,
-0.796385, -2.024433, -5.421245, 1, 1, 1, 1, 1,
-0.790566, -1.39807, -2.302665, 1, 1, 1, 1, 1,
-0.786531, 0.3194848, -0.681805, 1, 1, 1, 1, 1,
-0.784113, -1.560405, -4.101587, 1, 1, 1, 1, 1,
-0.7826597, 0.1148093, -3.215787, 1, 1, 1, 1, 1,
-0.7824206, 0.7635757, -0.1841078, 1, 1, 1, 1, 1,
-0.7820544, 0.2887453, -1.446224, 1, 1, 1, 1, 1,
-0.7804287, -1.216513, -1.833628, 1, 1, 1, 1, 1,
-0.7605022, 0.5837969, -1.286764, 1, 1, 1, 1, 1,
-0.75849, -0.4819091, -2.476519, 1, 1, 1, 1, 1,
-0.7554485, 1.427489, -1.491448, 1, 1, 1, 1, 1,
-0.7530158, -0.4382266, -2.632507, 1, 1, 1, 1, 1,
-0.7511796, -0.5568052, -3.418904, 1, 1, 1, 1, 1,
-0.7469559, -1.025207, -3.93738, 1, 1, 1, 1, 1,
-0.7447007, 0.302411, -0.03606724, 1, 1, 1, 1, 1,
-0.7416449, 2.213084, 1.655751, 0, 0, 1, 1, 1,
-0.740336, 0.09800654, -1.931475, 1, 0, 0, 1, 1,
-0.739401, 0.1434674, 0.1839031, 1, 0, 0, 1, 1,
-0.7340717, 0.03944701, -2.653659, 1, 0, 0, 1, 1,
-0.7320486, 1.469085, 1.084342, 1, 0, 0, 1, 1,
-0.7307401, -0.1233679, -3.27837, 1, 0, 0, 1, 1,
-0.7301332, 0.6655312, 0.070705, 0, 0, 0, 1, 1,
-0.7268194, -0.6186046, -2.333786, 0, 0, 0, 1, 1,
-0.7253811, -0.6199256, -3.022797, 0, 0, 0, 1, 1,
-0.7213264, 0.1648283, 0.04203338, 0, 0, 0, 1, 1,
-0.7193137, -0.2896722, -1.961514, 0, 0, 0, 1, 1,
-0.7118856, -0.1432712, -0.7554053, 0, 0, 0, 1, 1,
-0.7109002, -1.896724, -4.26934, 0, 0, 0, 1, 1,
-0.7071369, -0.210252, -0.7345322, 1, 1, 1, 1, 1,
-0.7035989, 1.263728, -1.733928, 1, 1, 1, 1, 1,
-0.7035099, -1.381077, -2.072778, 1, 1, 1, 1, 1,
-0.7020965, 0.1693802, -0.3373685, 1, 1, 1, 1, 1,
-0.6983032, 0.04057305, -2.249437, 1, 1, 1, 1, 1,
-0.696475, 1.930191, -2.546667, 1, 1, 1, 1, 1,
-0.6963567, -1.276378, -0.593504, 1, 1, 1, 1, 1,
-0.6943995, 0.0460343, -2.022898, 1, 1, 1, 1, 1,
-0.6941472, 0.405129, 0.09106431, 1, 1, 1, 1, 1,
-0.6936386, 0.05563055, -0.4326207, 1, 1, 1, 1, 1,
-0.6917823, -0.04408026, -1.450248, 1, 1, 1, 1, 1,
-0.6916624, 1.442929, -0.7520232, 1, 1, 1, 1, 1,
-0.6913931, 1.561761, -1.999617, 1, 1, 1, 1, 1,
-0.6890708, -0.008134631, -1.807669, 1, 1, 1, 1, 1,
-0.6848632, -0.05024241, -1.24098, 1, 1, 1, 1, 1,
-0.683343, -0.3411246, -3.668029, 0, 0, 1, 1, 1,
-0.6818929, 0.4931101, -0.9589375, 1, 0, 0, 1, 1,
-0.6806439, -0.05922021, -0.4583566, 1, 0, 0, 1, 1,
-0.6782258, -0.2296163, -3.025765, 1, 0, 0, 1, 1,
-0.6562063, -0.5380819, -3.011216, 1, 0, 0, 1, 1,
-0.6518888, -0.7337098, -2.912636, 1, 0, 0, 1, 1,
-0.6510252, -0.02650492, -2.628293, 0, 0, 0, 1, 1,
-0.650609, 0.6526396, -0.2263943, 0, 0, 0, 1, 1,
-0.6491246, -0.6576964, -2.212775, 0, 0, 0, 1, 1,
-0.6464266, -0.3658996, -2.153165, 0, 0, 0, 1, 1,
-0.6447548, 0.5941805, 0.6315084, 0, 0, 0, 1, 1,
-0.640681, 0.4392749, -0.788863, 0, 0, 0, 1, 1,
-0.6393369, -0.229062, 0.03471564, 0, 0, 0, 1, 1,
-0.6392197, 0.1712344, -2.3662, 1, 1, 1, 1, 1,
-0.6365653, 1.212177, -1.49742, 1, 1, 1, 1, 1,
-0.6365223, 0.4696682, -1.235027, 1, 1, 1, 1, 1,
-0.6293953, -0.1074331, -2.308295, 1, 1, 1, 1, 1,
-0.6265518, -2.093961, -0.8166912, 1, 1, 1, 1, 1,
-0.6195958, -1.621997, -3.082661, 1, 1, 1, 1, 1,
-0.6119509, 1.114933, -1.100211, 1, 1, 1, 1, 1,
-0.6112033, 0.5965536, -0.6546055, 1, 1, 1, 1, 1,
-0.597362, -1.05637, -3.49675, 1, 1, 1, 1, 1,
-0.5973582, 0.8065865, 0.3377427, 1, 1, 1, 1, 1,
-0.5965869, -0.9472301, -2.954705, 1, 1, 1, 1, 1,
-0.5928795, 0.3891684, -0.06293058, 1, 1, 1, 1, 1,
-0.5920781, 0.9716041, 0.371255, 1, 1, 1, 1, 1,
-0.5905275, 1.876326, -0.838735, 1, 1, 1, 1, 1,
-0.5904437, -1.528998, -3.322442, 1, 1, 1, 1, 1,
-0.583551, -0.3905536, -2.08775, 0, 0, 1, 1, 1,
-0.5833572, -0.2915589, -3.111801, 1, 0, 0, 1, 1,
-0.5829192, 0.5000646, 0.3407228, 1, 0, 0, 1, 1,
-0.5823863, -1.224936, -2.565136, 1, 0, 0, 1, 1,
-0.5804382, 0.4311895, 0.411153, 1, 0, 0, 1, 1,
-0.5789375, -0.9073989, -2.615465, 1, 0, 0, 1, 1,
-0.5755653, -0.331553, -1.632563, 0, 0, 0, 1, 1,
-0.5739061, 1.5698, 1.807023, 0, 0, 0, 1, 1,
-0.5723222, -0.1484687, -1.880677, 0, 0, 0, 1, 1,
-0.5720679, 1.937239, -0.6826819, 0, 0, 0, 1, 1,
-0.5709263, -0.7192319, -4.058426, 0, 0, 0, 1, 1,
-0.567656, 0.6007001, -0.8347746, 0, 0, 0, 1, 1,
-0.5656855, -0.738899, -3.16945, 0, 0, 0, 1, 1,
-0.5654885, -0.0520515, -1.371977, 1, 1, 1, 1, 1,
-0.5586104, -1.172626, -5.0379, 1, 1, 1, 1, 1,
-0.5558102, 0.5144779, 1.497865, 1, 1, 1, 1, 1,
-0.5485352, -0.006502605, -0.2590138, 1, 1, 1, 1, 1,
-0.5385468, 1.348062, -0.5306644, 1, 1, 1, 1, 1,
-0.5377216, -0.2174773, -1.900456, 1, 1, 1, 1, 1,
-0.5319594, -0.7088852, -2.962133, 1, 1, 1, 1, 1,
-0.5297493, 0.3497689, 0.431313, 1, 1, 1, 1, 1,
-0.5282248, 0.149684, -1.72256, 1, 1, 1, 1, 1,
-0.5242102, -0.1467386, -3.645154, 1, 1, 1, 1, 1,
-0.5184144, 0.4171141, -0.1092084, 1, 1, 1, 1, 1,
-0.5160856, -0.7699589, -1.52026, 1, 1, 1, 1, 1,
-0.5143272, -0.2373613, -1.949188, 1, 1, 1, 1, 1,
-0.5094467, -0.5788668, -3.172107, 1, 1, 1, 1, 1,
-0.5053639, 0.09320194, -0.7621554, 1, 1, 1, 1, 1,
-0.5044551, 0.8239654, -2.186462, 0, 0, 1, 1, 1,
-0.5019265, -0.5399268, -1.096744, 1, 0, 0, 1, 1,
-0.49759, -1.305052, -3.410839, 1, 0, 0, 1, 1,
-0.4950364, -0.9427356, -1.779207, 1, 0, 0, 1, 1,
-0.4933769, 0.759038, -2.926154, 1, 0, 0, 1, 1,
-0.4917035, -1.795844, -4.659417, 1, 0, 0, 1, 1,
-0.4823883, 2.065883, -1.435654, 0, 0, 0, 1, 1,
-0.4819877, 0.5277367, -2.515138, 0, 0, 0, 1, 1,
-0.4816952, 1.442269, 0.2388978, 0, 0, 0, 1, 1,
-0.4787041, 0.9484778, 0.3635835, 0, 0, 0, 1, 1,
-0.4783257, 0.8105759, -1.173261, 0, 0, 0, 1, 1,
-0.4657748, 0.08956859, -0.8909512, 0, 0, 0, 1, 1,
-0.4642564, -0.2299434, -3.61976, 0, 0, 0, 1, 1,
-0.4560018, -0.2382347, -0.5570372, 1, 1, 1, 1, 1,
-0.4525702, -0.282807, -0.756162, 1, 1, 1, 1, 1,
-0.4513528, 0.3388342, -1.833516, 1, 1, 1, 1, 1,
-0.4485971, -1.24197, -2.33518, 1, 1, 1, 1, 1,
-0.4396575, 0.11549, -0.5529373, 1, 1, 1, 1, 1,
-0.4195054, 0.3217987, -0.6978524, 1, 1, 1, 1, 1,
-0.4151781, 0.21851, -1.376694, 1, 1, 1, 1, 1,
-0.4092878, 0.1309292, -1.260528, 1, 1, 1, 1, 1,
-0.4037957, -1.461296, -2.141325, 1, 1, 1, 1, 1,
-0.4035861, -0.5311284, -1.704247, 1, 1, 1, 1, 1,
-0.398082, -0.6544004, -3.794752, 1, 1, 1, 1, 1,
-0.3932394, -0.07202796, -1.664464, 1, 1, 1, 1, 1,
-0.3922426, 1.181686, -1.737416, 1, 1, 1, 1, 1,
-0.3921306, -0.5343599, -2.313546, 1, 1, 1, 1, 1,
-0.3917231, 0.251729, -0.9600099, 1, 1, 1, 1, 1,
-0.3905105, -0.2424346, -1.374669, 0, 0, 1, 1, 1,
-0.3890991, -1.061313, -2.512198, 1, 0, 0, 1, 1,
-0.3831773, 0.5837755, -1.952953, 1, 0, 0, 1, 1,
-0.3812923, -0.4903888, -0.1774736, 1, 0, 0, 1, 1,
-0.3802486, 0.2344113, 0.8900036, 1, 0, 0, 1, 1,
-0.3794385, -0.7474038, -2.24827, 1, 0, 0, 1, 1,
-0.3703624, 0.07417345, 0.3283551, 0, 0, 0, 1, 1,
-0.368788, 0.9464785, -1.250065, 0, 0, 0, 1, 1,
-0.3661791, 0.3000607, -0.8774245, 0, 0, 0, 1, 1,
-0.3647457, 0.2713845, -0.01728153, 0, 0, 0, 1, 1,
-0.3599745, -0.7613872, -5.564746, 0, 0, 0, 1, 1,
-0.3582877, -1.619993, -3.561682, 0, 0, 0, 1, 1,
-0.3578612, 0.3003793, 0.2978797, 0, 0, 0, 1, 1,
-0.3523741, -0.3294249, -2.651737, 1, 1, 1, 1, 1,
-0.350275, -1.197157, -2.698454, 1, 1, 1, 1, 1,
-0.3500769, -1.619363, -2.047408, 1, 1, 1, 1, 1,
-0.3490065, -0.8885885, -3.839141, 1, 1, 1, 1, 1,
-0.3445085, 0.1004166, -2.449667, 1, 1, 1, 1, 1,
-0.3428932, 0.5485049, -1.171807, 1, 1, 1, 1, 1,
-0.3341919, -1.115171, -1.640193, 1, 1, 1, 1, 1,
-0.3336437, 0.5557057, -1.397308, 1, 1, 1, 1, 1,
-0.3332961, 0.8943654, -0.1235005, 1, 1, 1, 1, 1,
-0.3326716, -1.646524, -2.241942, 1, 1, 1, 1, 1,
-0.3310152, -0.4085764, -3.046674, 1, 1, 1, 1, 1,
-0.3281551, -0.3987826, -1.952785, 1, 1, 1, 1, 1,
-0.3221195, 0.1910902, -0.2898546, 1, 1, 1, 1, 1,
-0.3210877, 0.9131133, -1.365093, 1, 1, 1, 1, 1,
-0.3194176, -0.2841135, -1.471801, 1, 1, 1, 1, 1,
-0.3189648, 1.26754, 0.8326377, 0, 0, 1, 1, 1,
-0.3169228, 1.021747, 0.5236738, 1, 0, 0, 1, 1,
-0.3160981, 0.4430407, -0.7628472, 1, 0, 0, 1, 1,
-0.3150859, 0.2620406, -0.4680905, 1, 0, 0, 1, 1,
-0.3141852, -2.370382, -2.92705, 1, 0, 0, 1, 1,
-0.3126973, -0.4926037, -2.22633, 1, 0, 0, 1, 1,
-0.30948, -1.257937, -4.027157, 0, 0, 0, 1, 1,
-0.3075828, -1.641437, -2.315421, 0, 0, 0, 1, 1,
-0.3051146, 0.5612867, 0.7265889, 0, 0, 0, 1, 1,
-0.3048686, 0.5702323, -2.881067, 0, 0, 0, 1, 1,
-0.3046819, -0.2512329, -1.643687, 0, 0, 0, 1, 1,
-0.3025694, -1.571732, -4.49901, 0, 0, 0, 1, 1,
-0.3008695, 0.4816165, -1.097156, 0, 0, 0, 1, 1,
-0.299873, 0.02713776, -1.677871, 1, 1, 1, 1, 1,
-0.29512, 2.19865, 0.8506815, 1, 1, 1, 1, 1,
-0.2944932, 0.2183927, -0.915625, 1, 1, 1, 1, 1,
-0.2927997, -0.597303, -0.6739745, 1, 1, 1, 1, 1,
-0.2873807, -0.7635524, -3.1751, 1, 1, 1, 1, 1,
-0.2846524, -1.40267, -1.6617, 1, 1, 1, 1, 1,
-0.2829795, -0.2057222, -2.242195, 1, 1, 1, 1, 1,
-0.276773, 1.603841, -1.133017, 1, 1, 1, 1, 1,
-0.2757002, -1.585168, -4.218707, 1, 1, 1, 1, 1,
-0.2695908, -0.9911755, -3.927247, 1, 1, 1, 1, 1,
-0.2670051, 0.7975242, -1.336577, 1, 1, 1, 1, 1,
-0.2647259, 0.658755, -1.082851, 1, 1, 1, 1, 1,
-0.2646073, 0.7520061, 0.819602, 1, 1, 1, 1, 1,
-0.261469, 0.282307, 1.069861, 1, 1, 1, 1, 1,
-0.2596439, 0.1005969, 0.06001478, 1, 1, 1, 1, 1,
-0.256351, 1.287347, -1.174769, 0, 0, 1, 1, 1,
-0.2557598, 1.444017, -1.235086, 1, 0, 0, 1, 1,
-0.2526585, 1.158847, 0.475944, 1, 0, 0, 1, 1,
-0.2449715, 1.734936, -1.301198, 1, 0, 0, 1, 1,
-0.2422334, -0.07442471, -1.588695, 1, 0, 0, 1, 1,
-0.2400802, -0.1850744, -2.353332, 1, 0, 0, 1, 1,
-0.2385845, 0.1337775, 0.07500014, 0, 0, 0, 1, 1,
-0.2366391, 2.284218, -0.6550246, 0, 0, 0, 1, 1,
-0.2316848, -0.6961107, -3.191103, 0, 0, 0, 1, 1,
-0.2305397, 1.390978, -0.8636283, 0, 0, 0, 1, 1,
-0.2280029, 1.662547, 1.714039, 0, 0, 0, 1, 1,
-0.2263508, -0.2489972, -3.294934, 0, 0, 0, 1, 1,
-0.224081, -2.007929, -2.46999, 0, 0, 0, 1, 1,
-0.2239513, 0.2717548, -1.738114, 1, 1, 1, 1, 1,
-0.2228459, -0.3618041, -3.157915, 1, 1, 1, 1, 1,
-0.2206025, 0.5164324, -0.7475719, 1, 1, 1, 1, 1,
-0.216316, 0.06473657, -1.179915, 1, 1, 1, 1, 1,
-0.2090319, 1.495072, -1.898153, 1, 1, 1, 1, 1,
-0.2056968, -0.3765936, -3.079596, 1, 1, 1, 1, 1,
-0.2046901, -0.3955931, -2.46549, 1, 1, 1, 1, 1,
-0.201711, 2.429012, 0.4940386, 1, 1, 1, 1, 1,
-0.2010121, -0.050334, -0.9087366, 1, 1, 1, 1, 1,
-0.1998477, 0.3851407, 0.839701, 1, 1, 1, 1, 1,
-0.1977322, 0.5265145, -1.370039, 1, 1, 1, 1, 1,
-0.194347, 0.200595, -0.4240707, 1, 1, 1, 1, 1,
-0.1934371, -1.108358, -2.773144, 1, 1, 1, 1, 1,
-0.1870717, -1.16008, -2.305582, 1, 1, 1, 1, 1,
-0.183813, -0.1792358, -2.280058, 1, 1, 1, 1, 1,
-0.1823167, 0.6965438, 0.2509143, 0, 0, 1, 1, 1,
-0.180668, -2.869022, -4.449617, 1, 0, 0, 1, 1,
-0.1774528, 1.234787, -0.02863969, 1, 0, 0, 1, 1,
-0.1741159, 0.7608246, 0.3063932, 1, 0, 0, 1, 1,
-0.1736554, -0.03366401, -0.7145887, 1, 0, 0, 1, 1,
-0.1704778, -1.574378, -4.364112, 1, 0, 0, 1, 1,
-0.1700577, -0.5647203, -1.973075, 0, 0, 0, 1, 1,
-0.166448, 0.1198636, -0.07832474, 0, 0, 0, 1, 1,
-0.1647438, 1.271419, -0.6829587, 0, 0, 0, 1, 1,
-0.1627372, -1.040419, -3.008875, 0, 0, 0, 1, 1,
-0.1588802, 1.895018, -0.7982476, 0, 0, 0, 1, 1,
-0.1580427, -1.414951, -1.884188, 0, 0, 0, 1, 1,
-0.1569388, 0.03327949, 0.4965999, 0, 0, 0, 1, 1,
-0.1503797, 1.496393, -0.3114335, 1, 1, 1, 1, 1,
-0.147044, 1.754457, -0.9949021, 1, 1, 1, 1, 1,
-0.1430865, 0.1489019, 0.03637334, 1, 1, 1, 1, 1,
-0.142703, 1.183115, 0.887776, 1, 1, 1, 1, 1,
-0.1400385, -1.749706, -2.939176, 1, 1, 1, 1, 1,
-0.138771, -0.5011016, -2.511343, 1, 1, 1, 1, 1,
-0.1350403, -0.2003324, -2.96239, 1, 1, 1, 1, 1,
-0.1291014, -1.77546, -3.97998, 1, 1, 1, 1, 1,
-0.12189, -0.1805168, -2.607049, 1, 1, 1, 1, 1,
-0.1213292, 0.1143662, -0.9904624, 1, 1, 1, 1, 1,
-0.1206086, 0.7979515, -0.7906954, 1, 1, 1, 1, 1,
-0.1196905, 0.2761217, -0.6503448, 1, 1, 1, 1, 1,
-0.1181975, 0.1041675, -1.475995, 1, 1, 1, 1, 1,
-0.110829, -1.239478, -3.783797, 1, 1, 1, 1, 1,
-0.1097131, -0.1811223, -1.610893, 1, 1, 1, 1, 1,
-0.1082155, 0.5010367, -0.7859001, 0, 0, 1, 1, 1,
-0.1071592, -0.3712285, -2.336458, 1, 0, 0, 1, 1,
-0.1069278, 0.9263968, -0.2809177, 1, 0, 0, 1, 1,
-0.1067757, 1.65605, -0.304244, 1, 0, 0, 1, 1,
-0.105247, 1.161295, 1.262172, 1, 0, 0, 1, 1,
-0.1010031, -0.1081441, -2.035886, 1, 0, 0, 1, 1,
-0.0967048, 0.87756, 1.146139, 0, 0, 0, 1, 1,
-0.09584706, 0.5883366, 1.091248, 0, 0, 0, 1, 1,
-0.09307274, -1.391751, -4.128528, 0, 0, 0, 1, 1,
-0.0929177, 0.004844152, -0.9464197, 0, 0, 0, 1, 1,
-0.09088653, -2.015775, -2.757339, 0, 0, 0, 1, 1,
-0.08942532, 0.3649803, 0.1602626, 0, 0, 0, 1, 1,
-0.08886158, 0.102177, 0.2339694, 0, 0, 0, 1, 1,
-0.08534321, -1.02039, -2.815895, 1, 1, 1, 1, 1,
-0.08467409, 1.62444, -0.3613732, 1, 1, 1, 1, 1,
-0.08096813, -1.845713, -1.239707, 1, 1, 1, 1, 1,
-0.07654761, 0.04178476, -1.409681, 1, 1, 1, 1, 1,
-0.07100817, 0.4430671, -0.852911, 1, 1, 1, 1, 1,
-0.07001218, -1.523062, -2.824916, 1, 1, 1, 1, 1,
-0.06824609, 0.376786, -0.1075376, 1, 1, 1, 1, 1,
-0.06663636, -0.7376009, -3.351702, 1, 1, 1, 1, 1,
-0.05936599, 0.2352196, -0.8681527, 1, 1, 1, 1, 1,
-0.05635356, 1.227282, -0.3152118, 1, 1, 1, 1, 1,
-0.0556477, -0.6853923, -3.58067, 1, 1, 1, 1, 1,
-0.05518799, -0.6269299, -2.047152, 1, 1, 1, 1, 1,
-0.05469758, -1.309559, -4.579226, 1, 1, 1, 1, 1,
-0.04499742, -0.6818181, -2.746515, 1, 1, 1, 1, 1,
-0.04405931, 1.242295, -0.7300485, 1, 1, 1, 1, 1,
-0.04189714, 0.02891697, -1.300599, 0, 0, 1, 1, 1,
-0.04132524, -1.560014, -1.816102, 1, 0, 0, 1, 1,
-0.03507921, -0.571484, -3.97139, 1, 0, 0, 1, 1,
-0.03342479, 0.5948773, -1.275001, 1, 0, 0, 1, 1,
-0.03282789, 2.512054, 0.05644602, 1, 0, 0, 1, 1,
-0.03097985, -0.5909724, -3.524564, 1, 0, 0, 1, 1,
-0.03087347, -1.613782, -2.068912, 0, 0, 0, 1, 1,
-0.02885456, 1.793566, -0.2787252, 0, 0, 0, 1, 1,
-0.0284838, -1.34733, -2.77343, 0, 0, 0, 1, 1,
-0.02710956, -0.622998, -3.277759, 0, 0, 0, 1, 1,
-0.02373893, -1.007468, -3.097855, 0, 0, 0, 1, 1,
-0.01088349, -1.930411, -2.482448, 0, 0, 0, 1, 1,
-0.008385623, -1.434626, -2.56313, 0, 0, 0, 1, 1,
-0.007895894, 0.2856306, -0.07612271, 1, 1, 1, 1, 1,
-0.003722319, -1.328797, -2.717243, 1, 1, 1, 1, 1,
-0.003298988, -1.129163, -2.436382, 1, 1, 1, 1, 1,
-0.003279168, -0.888059, -3.776816, 1, 1, 1, 1, 1,
-0.003096907, 1.186094, 0.001131589, 1, 1, 1, 1, 1,
-0.0004193364, 0.3417879, -1.832512, 1, 1, 1, 1, 1,
0.0006441555, 1.332717, 0.5424563, 1, 1, 1, 1, 1,
0.0007592509, 1.392887, 0.6825313, 1, 1, 1, 1, 1,
0.004055417, -1.436436, 2.499613, 1, 1, 1, 1, 1,
0.004296494, 0.3088371, 1.122079, 1, 1, 1, 1, 1,
0.004388759, 0.2027806, -0.8421734, 1, 1, 1, 1, 1,
0.0078683, -1.954197, 3.816713, 1, 1, 1, 1, 1,
0.009718334, -1.196738, 2.796041, 1, 1, 1, 1, 1,
0.01236594, 1.557343, 0.1858756, 1, 1, 1, 1, 1,
0.01511238, 1.964854, 0.3673615, 1, 1, 1, 1, 1,
0.01613315, -0.7449855, 2.992226, 0, 0, 1, 1, 1,
0.01887364, -0.04309961, 1.199192, 1, 0, 0, 1, 1,
0.03096157, 0.1106217, -0.05298086, 1, 0, 0, 1, 1,
0.0321468, 1.11365, 0.8082465, 1, 0, 0, 1, 1,
0.03612988, 2.378282, -0.04063031, 1, 0, 0, 1, 1,
0.04168889, 0.8994975, -0.2938823, 1, 0, 0, 1, 1,
0.04238857, 1.469687, 0.2340003, 0, 0, 0, 1, 1,
0.04485831, 0.4092566, -0.1479261, 0, 0, 0, 1, 1,
0.04619041, 0.7683639, 0.5896097, 0, 0, 0, 1, 1,
0.04790554, 1.484946, -1.230251, 0, 0, 0, 1, 1,
0.04978377, -0.6632616, 3.691931, 0, 0, 0, 1, 1,
0.05052542, 0.3992375, 1.391081, 0, 0, 0, 1, 1,
0.05238513, -1.206165, 3.322244, 0, 0, 0, 1, 1,
0.05629776, 1.021526, 0.6177381, 1, 1, 1, 1, 1,
0.05631115, 1.425765, 0.8622653, 1, 1, 1, 1, 1,
0.06864335, 1.558309, 0.5795357, 1, 1, 1, 1, 1,
0.06898738, 0.1009557, -0.005421122, 1, 1, 1, 1, 1,
0.06975732, 1.609861, 0.08279683, 1, 1, 1, 1, 1,
0.07011322, 0.4358962, 0.9193788, 1, 1, 1, 1, 1,
0.07085802, -0.2207196, 3.072582, 1, 1, 1, 1, 1,
0.07240261, -0.5271074, 3.234356, 1, 1, 1, 1, 1,
0.07449562, 0.5514243, -0.9812774, 1, 1, 1, 1, 1,
0.08253417, -0.367254, 2.244383, 1, 1, 1, 1, 1,
0.08320578, 1.22977, -0.3202771, 1, 1, 1, 1, 1,
0.08425509, -1.235446, 2.413361, 1, 1, 1, 1, 1,
0.09233765, -1.047017, 4.472746, 1, 1, 1, 1, 1,
0.09409741, -0.01873925, 1.888555, 1, 1, 1, 1, 1,
0.09618408, 0.2620783, 0.2978095, 1, 1, 1, 1, 1,
0.09627011, 0.8903172, 0.8896983, 0, 0, 1, 1, 1,
0.09843214, -0.001352968, 1.882794, 1, 0, 0, 1, 1,
0.1000061, 0.2891155, 0.02054603, 1, 0, 0, 1, 1,
0.1000599, 1.018486, -1.86971, 1, 0, 0, 1, 1,
0.1021273, 0.4092547, 0.1842104, 1, 0, 0, 1, 1,
0.1040527, 1.164965, -0.2248264, 1, 0, 0, 1, 1,
0.1070921, -1.676485, 3.05605, 0, 0, 0, 1, 1,
0.1073759, 0.6589866, 1.89881, 0, 0, 0, 1, 1,
0.1083409, 0.6779099, 0.7552829, 0, 0, 0, 1, 1,
0.1116437, -0.1937454, 2.552839, 0, 0, 0, 1, 1,
0.1117708, 0.3085892, 0.4860034, 0, 0, 0, 1, 1,
0.1167685, 0.04557872, 2.624775, 0, 0, 0, 1, 1,
0.1191149, -1.153544, 3.197733, 0, 0, 0, 1, 1,
0.1198183, 0.9043224, 0.192721, 1, 1, 1, 1, 1,
0.1208414, 0.1505177, 0.7926959, 1, 1, 1, 1, 1,
0.1299616, 0.2145773, -0.1533668, 1, 1, 1, 1, 1,
0.1312421, -0.1027175, 2.529977, 1, 1, 1, 1, 1,
0.133201, 1.397938, 0.8345021, 1, 1, 1, 1, 1,
0.1384967, -0.1858887, 1.762784, 1, 1, 1, 1, 1,
0.1456414, -0.3964459, 4.080417, 1, 1, 1, 1, 1,
0.1469223, -0.2709996, 1.950532, 1, 1, 1, 1, 1,
0.1472101, 0.3130744, 0.9473107, 1, 1, 1, 1, 1,
0.1506847, 0.278415, 1.029876, 1, 1, 1, 1, 1,
0.1551642, 0.03430341, 1.109963, 1, 1, 1, 1, 1,
0.1567167, -0.3421383, 2.811259, 1, 1, 1, 1, 1,
0.1573974, 0.8424711, -1.479769, 1, 1, 1, 1, 1,
0.1584209, 1.301548, -0.2590863, 1, 1, 1, 1, 1,
0.1591631, 0.9597106, 0.06495356, 1, 1, 1, 1, 1,
0.1607166, -0.4599027, 3.705275, 0, 0, 1, 1, 1,
0.1646208, -0.2060717, 4.398073, 1, 0, 0, 1, 1,
0.1651991, -1.350436, 3.528957, 1, 0, 0, 1, 1,
0.1696568, -0.7827466, 1.518021, 1, 0, 0, 1, 1,
0.1738425, -2.675031, 2.010443, 1, 0, 0, 1, 1,
0.1738554, 0.6020612, 0.5099723, 1, 0, 0, 1, 1,
0.1765175, -2.264332, 5.880647, 0, 0, 0, 1, 1,
0.1784901, -0.5506248, 2.147699, 0, 0, 0, 1, 1,
0.1788462, 0.6561068, -0.04303757, 0, 0, 0, 1, 1,
0.1814998, 0.8988519, 0.9604345, 0, 0, 0, 1, 1,
0.1820883, -0.2093853, 1.284897, 0, 0, 0, 1, 1,
0.1842747, -1.680059, 4.620279, 0, 0, 0, 1, 1,
0.1845218, 0.682915, 2.343298, 0, 0, 0, 1, 1,
0.1855938, 1.046938, 0.7140904, 1, 1, 1, 1, 1,
0.1908138, -1.005932, 3.288507, 1, 1, 1, 1, 1,
0.1916117, 0.9190633, 0.407888, 1, 1, 1, 1, 1,
0.1949532, 0.1455122, 1.786661, 1, 1, 1, 1, 1,
0.1952883, 0.2675736, 0.4656515, 1, 1, 1, 1, 1,
0.1957864, -0.3590563, 3.091233, 1, 1, 1, 1, 1,
0.200602, 0.8779557, 0.1765358, 1, 1, 1, 1, 1,
0.2016926, 0.8755944, 0.8025655, 1, 1, 1, 1, 1,
0.2030402, 0.9248062, 1.149262, 1, 1, 1, 1, 1,
0.2036096, 0.7736384, -1.086104, 1, 1, 1, 1, 1,
0.2067463, -2.54184, 4.14747, 1, 1, 1, 1, 1,
0.2068092, 1.112582, 0.476357, 1, 1, 1, 1, 1,
0.2075841, -0.7809427, 1.941657, 1, 1, 1, 1, 1,
0.2094145, 0.1126455, 3.013986, 1, 1, 1, 1, 1,
0.2095302, -0.851846, 3.284864, 1, 1, 1, 1, 1,
0.2104345, 1.501212, -1.287792, 0, 0, 1, 1, 1,
0.2114689, 0.8373106, -0.6594149, 1, 0, 0, 1, 1,
0.2164169, 1.109476, 1.705118, 1, 0, 0, 1, 1,
0.2230914, -0.9620871, 3.092767, 1, 0, 0, 1, 1,
0.2235695, -0.6056612, 3.675662, 1, 0, 0, 1, 1,
0.2275767, 0.713737, 1.516628, 1, 0, 0, 1, 1,
0.2279683, -0.2843566, 1.3439, 0, 0, 0, 1, 1,
0.2297281, 0.6915289, 0.4417252, 0, 0, 0, 1, 1,
0.2299425, 0.05998506, -0.7804166, 0, 0, 0, 1, 1,
0.2366964, -0.6344311, 2.270151, 0, 0, 0, 1, 1,
0.2518865, -0.1713917, 2.793823, 0, 0, 0, 1, 1,
0.2529477, -0.0392266, 1.922657, 0, 0, 0, 1, 1,
0.2540351, 0.7104522, -0.05787443, 0, 0, 0, 1, 1,
0.2575164, -1.055016, 1.014822, 1, 1, 1, 1, 1,
0.2724996, -0.08706112, 1.712394, 1, 1, 1, 1, 1,
0.2737545, 1.032556, 0.01181969, 1, 1, 1, 1, 1,
0.2738523, -1.803419, 2.56609, 1, 1, 1, 1, 1,
0.2740023, 1.139283, 1.204486, 1, 1, 1, 1, 1,
0.278365, -0.8341973, 2.9693, 1, 1, 1, 1, 1,
0.2787937, 0.5592132, 1.155342, 1, 1, 1, 1, 1,
0.2818581, -1.24728, 3.814581, 1, 1, 1, 1, 1,
0.2846407, -0.4818132, 1.745835, 1, 1, 1, 1, 1,
0.2875113, -2.306199, 3.551085, 1, 1, 1, 1, 1,
0.2893607, -0.2414148, 2.184123, 1, 1, 1, 1, 1,
0.2896528, 0.7798213, -0.2955706, 1, 1, 1, 1, 1,
0.2972137, -0.3426146, 3.987848, 1, 1, 1, 1, 1,
0.3023548, 1.623353, -0.04385626, 1, 1, 1, 1, 1,
0.3052317, -2.301196, 1.979657, 1, 1, 1, 1, 1,
0.3053715, -2.019615, 3.597611, 0, 0, 1, 1, 1,
0.3098022, -0.09386429, 1.973096, 1, 0, 0, 1, 1,
0.3154905, 1.505332, -0.1315934, 1, 0, 0, 1, 1,
0.3165997, -0.7627056, 3.357795, 1, 0, 0, 1, 1,
0.3197003, 0.3935873, 1.385367, 1, 0, 0, 1, 1,
0.3211756, -1.312675, 2.468189, 1, 0, 0, 1, 1,
0.3212826, 0.3663678, 0.1345603, 0, 0, 0, 1, 1,
0.3264484, 0.6644083, -0.7026753, 0, 0, 0, 1, 1,
0.3267982, 0.7990084, -0.2955284, 0, 0, 0, 1, 1,
0.3308351, 1.202011, 0.1976028, 0, 0, 0, 1, 1,
0.3317142, 0.1735585, 0.2736282, 0, 0, 0, 1, 1,
0.3321881, 1.183789, -1.324594, 0, 0, 0, 1, 1,
0.3349581, 1.425915, 1.493899, 0, 0, 0, 1, 1,
0.335168, 0.8294511, 0.465744, 1, 1, 1, 1, 1,
0.3376707, -1.767875, 2.706689, 1, 1, 1, 1, 1,
0.3523264, 0.3739712, 1.268676, 1, 1, 1, 1, 1,
0.3525618, 0.6043849, 0.3226218, 1, 1, 1, 1, 1,
0.3542013, 0.2764598, 0.7732953, 1, 1, 1, 1, 1,
0.3591426, -0.1584685, 3.452577, 1, 1, 1, 1, 1,
0.3608188, -1.79203, 1.115588, 1, 1, 1, 1, 1,
0.3639776, 1.746259, 0.1656237, 1, 1, 1, 1, 1,
0.3641427, -2.029322, 0.6502731, 1, 1, 1, 1, 1,
0.3676518, 0.5059664, -0.6563907, 1, 1, 1, 1, 1,
0.3686848, 1.654917, 0.5242546, 1, 1, 1, 1, 1,
0.3691584, 0.01533232, 0.9822003, 1, 1, 1, 1, 1,
0.3790492, 0.6002841, 1.18222, 1, 1, 1, 1, 1,
0.3795308, -0.7078915, 2.378666, 1, 1, 1, 1, 1,
0.3816685, 0.8726128, 2.437209, 1, 1, 1, 1, 1,
0.3822116, 0.1528888, 0.1270869, 0, 0, 1, 1, 1,
0.3855539, -1.096003, 2.578199, 1, 0, 0, 1, 1,
0.3861269, 0.895636, 0.01921938, 1, 0, 0, 1, 1,
0.3950516, 1.229385, 1.319412, 1, 0, 0, 1, 1,
0.4020862, -1.106134, 4.040282, 1, 0, 0, 1, 1,
0.4038823, 0.9979057, 1.087717, 1, 0, 0, 1, 1,
0.4049503, -1.428353, 1.589284, 0, 0, 0, 1, 1,
0.4067003, 0.08753808, 2.325961, 0, 0, 0, 1, 1,
0.4067054, 0.5171797, -0.2481506, 0, 0, 0, 1, 1,
0.4098338, -0.1062694, 1.52007, 0, 0, 0, 1, 1,
0.410584, -1.405054, 2.653731, 0, 0, 0, 1, 1,
0.4108036, 1.414782, 0.632459, 0, 0, 0, 1, 1,
0.4114648, 0.9943393, 1.176596, 0, 0, 0, 1, 1,
0.4115686, 0.2288249, -0.1924252, 1, 1, 1, 1, 1,
0.4124594, -0.2228284, 3.150357, 1, 1, 1, 1, 1,
0.4133428, 0.7052561, 0.876725, 1, 1, 1, 1, 1,
0.4170796, 1.284563, -1.645352, 1, 1, 1, 1, 1,
0.4186279, -0.4970638, 2.87577, 1, 1, 1, 1, 1,
0.4194837, -1.549115, 1.123175, 1, 1, 1, 1, 1,
0.4230725, 0.9876557, 0.6323487, 1, 1, 1, 1, 1,
0.4254672, 0.2943496, 0.7451437, 1, 1, 1, 1, 1,
0.4262372, 0.1730612, -1.066, 1, 1, 1, 1, 1,
0.4264379, 0.5839934, 0.7297062, 1, 1, 1, 1, 1,
0.4275812, -0.1811755, 0.6059179, 1, 1, 1, 1, 1,
0.43135, 1.125011, 0.1410388, 1, 1, 1, 1, 1,
0.4315398, -0.1261193, 3.631429, 1, 1, 1, 1, 1,
0.4318248, 1.012939, 0.5804568, 1, 1, 1, 1, 1,
0.4334805, -1.071656, 3.868432, 1, 1, 1, 1, 1,
0.4360035, -0.6664389, 1.889901, 0, 0, 1, 1, 1,
0.4365758, -0.6260551, 0.7405796, 1, 0, 0, 1, 1,
0.4381148, 1.237494, 1.014877, 1, 0, 0, 1, 1,
0.4411895, -1.222058, 2.764042, 1, 0, 0, 1, 1,
0.4440187, -1.240718, 1.527784, 1, 0, 0, 1, 1,
0.4459301, 1.013415, 0.2530913, 1, 0, 0, 1, 1,
0.4467904, 1.452116, 0.4873208, 0, 0, 0, 1, 1,
0.4469738, -0.4716576, 2.319324, 0, 0, 0, 1, 1,
0.4472551, 0.170668, 1.173841, 0, 0, 0, 1, 1,
0.4512266, 0.156319, 1.716948, 0, 0, 0, 1, 1,
0.4548368, -0.5129108, 3.731316, 0, 0, 0, 1, 1,
0.4557718, -0.7743397, 1.450846, 0, 0, 0, 1, 1,
0.4617678, 0.2959618, 0.7932134, 0, 0, 0, 1, 1,
0.4664289, 0.09427859, 0.9474103, 1, 1, 1, 1, 1,
0.4710738, 0.05272346, 1.765815, 1, 1, 1, 1, 1,
0.471462, 0.4409403, 0.7753209, 1, 1, 1, 1, 1,
0.4721776, 0.3528629, 0.7484941, 1, 1, 1, 1, 1,
0.4758054, 1.212678, -0.9340164, 1, 1, 1, 1, 1,
0.4806482, 0.9085687, 1.15201, 1, 1, 1, 1, 1,
0.4818632, -0.9729308, 2.438186, 1, 1, 1, 1, 1,
0.490752, 1.75203, -0.1536822, 1, 1, 1, 1, 1,
0.4928782, -0.8294534, 4.142079, 1, 1, 1, 1, 1,
0.4963538, 0.1360548, 1.687757, 1, 1, 1, 1, 1,
0.4991066, 0.02562905, 0.6124805, 1, 1, 1, 1, 1,
0.5053027, 0.7307247, 0.7231081, 1, 1, 1, 1, 1,
0.5128936, -2.770727, 3.509006, 1, 1, 1, 1, 1,
0.5137069, -0.5647184, 3.424795, 1, 1, 1, 1, 1,
0.514686, 0.2037294, 0.6830317, 1, 1, 1, 1, 1,
0.515361, 1.179257, 2.928614, 0, 0, 1, 1, 1,
0.5202327, 1.107064, -0.6592593, 1, 0, 0, 1, 1,
0.5248476, -0.3557073, -0.2682936, 1, 0, 0, 1, 1,
0.5276659, -0.5268927, 2.590777, 1, 0, 0, 1, 1,
0.5304145, -0.6056703, 2.700404, 1, 0, 0, 1, 1,
0.5326854, 1.254048, -0.7303271, 1, 0, 0, 1, 1,
0.5351497, -0.6533203, 2.368408, 0, 0, 0, 1, 1,
0.5381318, -0.5921662, 2.968129, 0, 0, 0, 1, 1,
0.5397642, -0.5334204, 1.467872, 0, 0, 0, 1, 1,
0.5414029, 1.916136, 0.7648128, 0, 0, 0, 1, 1,
0.5419884, -1.105745, 2.992895, 0, 0, 0, 1, 1,
0.547987, 0.4724638, -0.03601125, 0, 0, 0, 1, 1,
0.551618, 0.1835464, 3.19709, 0, 0, 0, 1, 1,
0.5527492, 0.9917652, 0.5967674, 1, 1, 1, 1, 1,
0.5538101, 0.3915902, 0.2629541, 1, 1, 1, 1, 1,
0.5547429, -1.667797, 2.002292, 1, 1, 1, 1, 1,
0.5568686, 0.3300638, 0.6836936, 1, 1, 1, 1, 1,
0.5589026, -0.8674809, 2.246732, 1, 1, 1, 1, 1,
0.5603892, 1.093673, -0.2259305, 1, 1, 1, 1, 1,
0.5636756, -0.5284162, 3.082144, 1, 1, 1, 1, 1,
0.5651832, -2.183309, 3.512151, 1, 1, 1, 1, 1,
0.5694181, 0.2615312, 2.138524, 1, 1, 1, 1, 1,
0.5744926, 0.08321524, 0.2632656, 1, 1, 1, 1, 1,
0.5775303, 0.7930605, 0.6435996, 1, 1, 1, 1, 1,
0.5869564, 0.494166, 0.3850625, 1, 1, 1, 1, 1,
0.5898829, 1.030556, 0.06762771, 1, 1, 1, 1, 1,
0.5951649, -1.391321, 3.411924, 1, 1, 1, 1, 1,
0.5975285, -1.338462, 2.185308, 1, 1, 1, 1, 1,
0.5995865, -0.1292116, 2.106785, 0, 0, 1, 1, 1,
0.6026541, -0.3959184, 2.235083, 1, 0, 0, 1, 1,
0.6041982, -0.4253352, 2.215957, 1, 0, 0, 1, 1,
0.6046436, -1.17001, 3.370242, 1, 0, 0, 1, 1,
0.6061331, -0.9990655, 2.70347, 1, 0, 0, 1, 1,
0.6070172, -0.7186524, 3.282983, 1, 0, 0, 1, 1,
0.6106355, -0.6955451, 3.158773, 0, 0, 0, 1, 1,
0.6118103, -0.680739, 3.057409, 0, 0, 0, 1, 1,
0.6132295, 0.05251882, 0.9131831, 0, 0, 0, 1, 1,
0.6151908, -0.0779644, 3.080885, 0, 0, 0, 1, 1,
0.6177834, -0.7092206, 1.465266, 0, 0, 0, 1, 1,
0.6211169, 1.898105, -0.2304662, 0, 0, 0, 1, 1,
0.6264189, -0.436496, 1.767369, 0, 0, 0, 1, 1,
0.6330093, -1.564907, 3.121823, 1, 1, 1, 1, 1,
0.6351165, 0.01697247, 1.765371, 1, 1, 1, 1, 1,
0.6356444, -1.130807, 2.707331, 1, 1, 1, 1, 1,
0.6380644, 0.1527625, 2.216492, 1, 1, 1, 1, 1,
0.63835, 0.9458246, -0.138012, 1, 1, 1, 1, 1,
0.6411252, 1.970664, 0.5955471, 1, 1, 1, 1, 1,
0.6504552, 0.3479344, 1.442591, 1, 1, 1, 1, 1,
0.6542954, 0.2767745, 1.76001, 1, 1, 1, 1, 1,
0.6557881, 1.362726, 1.299203, 1, 1, 1, 1, 1,
0.6641209, 0.1350771, 2.811852, 1, 1, 1, 1, 1,
0.6645944, -3.120649, 2.553111, 1, 1, 1, 1, 1,
0.67939, -0.3855628, 1.537236, 1, 1, 1, 1, 1,
0.6814176, 1.622424, 0.2182834, 1, 1, 1, 1, 1,
0.685295, 0.5627512, -0.81183, 1, 1, 1, 1, 1,
0.6897854, 1.682586, 1.497468, 1, 1, 1, 1, 1,
0.6922158, 2.674929, 0.8720307, 0, 0, 1, 1, 1,
0.6933101, 0.1857774, 1.464418, 1, 0, 0, 1, 1,
0.6995817, -1.237566, 2.012097, 1, 0, 0, 1, 1,
0.6996915, 2.249414, 0.8283347, 1, 0, 0, 1, 1,
0.7016263, 0.3823228, 0.7571797, 1, 0, 0, 1, 1,
0.7036859, 1.33671, -2.421391, 1, 0, 0, 1, 1,
0.7055386, -0.9631999, 3.823716, 0, 0, 0, 1, 1,
0.7060824, 0.6133751, 0.9289594, 0, 0, 0, 1, 1,
0.7085028, -3.035721, 2.050213, 0, 0, 0, 1, 1,
0.7143825, 0.008676697, 1.37386, 0, 0, 0, 1, 1,
0.7170491, 0.6278154, 0.7089063, 0, 0, 0, 1, 1,
0.7172434, -0.9385684, 3.642734, 0, 0, 0, 1, 1,
0.717269, 1.411725, 0.9636239, 0, 0, 0, 1, 1,
0.7180333, 0.09506348, 0.4365686, 1, 1, 1, 1, 1,
0.730903, -0.05726495, 1.3883, 1, 1, 1, 1, 1,
0.7351879, -0.07649777, 2.756781, 1, 1, 1, 1, 1,
0.7375913, -0.9933289, 1.722448, 1, 1, 1, 1, 1,
0.7400432, -1.415322, 2.381687, 1, 1, 1, 1, 1,
0.7406954, -1.900061, 0.804244, 1, 1, 1, 1, 1,
0.7417562, 0.0247023, 1.768061, 1, 1, 1, 1, 1,
0.74488, 0.9156703, 2.254542, 1, 1, 1, 1, 1,
0.7451952, 0.9231535, 1.382457, 1, 1, 1, 1, 1,
0.7466789, -0.1942115, 2.368224, 1, 1, 1, 1, 1,
0.7480197, 0.1403059, 2.233897, 1, 1, 1, 1, 1,
0.7484975, -0.9112161, 3.599322, 1, 1, 1, 1, 1,
0.752906, -0.6078028, 2.899489, 1, 1, 1, 1, 1,
0.7551274, -0.07062969, 1.903327, 1, 1, 1, 1, 1,
0.7565234, 0.3682431, 1.910437, 1, 1, 1, 1, 1,
0.7676674, -0.1092391, 0.9281443, 0, 0, 1, 1, 1,
0.7703781, 1.191804, 0.1436099, 1, 0, 0, 1, 1,
0.770578, -0.03500717, 1.17517, 1, 0, 0, 1, 1,
0.7720581, -0.6825949, 4.119675, 1, 0, 0, 1, 1,
0.7732379, 0.1259449, 0.2196578, 1, 0, 0, 1, 1,
0.774389, 0.2033792, -0.1230553, 1, 0, 0, 1, 1,
0.7842125, 0.3757066, 1.76291, 0, 0, 0, 1, 1,
0.7864069, -1.237957, 2.79826, 0, 0, 0, 1, 1,
0.7890977, -0.4483553, 1.226272, 0, 0, 0, 1, 1,
0.7922173, 1.167736, 0.4098223, 0, 0, 0, 1, 1,
0.7947296, 0.05181769, 1.252603, 0, 0, 0, 1, 1,
0.7988958, -0.06246227, 1.379785, 0, 0, 0, 1, 1,
0.8046058, -0.7328858, 2.327642, 0, 0, 0, 1, 1,
0.8095257, -0.916598, 2.459058, 1, 1, 1, 1, 1,
0.8137137, -0.6401848, 1.916484, 1, 1, 1, 1, 1,
0.8157124, -0.3549287, 1.941607, 1, 1, 1, 1, 1,
0.8190742, 1.462921, 0.1070764, 1, 1, 1, 1, 1,
0.8228519, -2.075829, 0.7691103, 1, 1, 1, 1, 1,
0.8236362, -0.3579318, 0.9670123, 1, 1, 1, 1, 1,
0.8249251, 1.571517, -0.5641138, 1, 1, 1, 1, 1,
0.8250626, -0.8922533, 1.451396, 1, 1, 1, 1, 1,
0.826413, -1.188753, 3.976941, 1, 1, 1, 1, 1,
0.8277684, -0.5671193, 2.452589, 1, 1, 1, 1, 1,
0.8341374, -0.8321493, 2.912976, 1, 1, 1, 1, 1,
0.8422413, -1.112298, 2.785848, 1, 1, 1, 1, 1,
0.8443609, 1.065312, 1.261276, 1, 1, 1, 1, 1,
0.8467869, -0.02210901, 2.081344, 1, 1, 1, 1, 1,
0.8606833, -0.1848516, 1.695526, 1, 1, 1, 1, 1,
0.8636724, -0.2899731, 1.657177, 0, 0, 1, 1, 1,
0.8654438, -0.09912089, 1.755136, 1, 0, 0, 1, 1,
0.865795, -0.5353992, 1.149442, 1, 0, 0, 1, 1,
0.8681281, 1.238972, -0.02437217, 1, 0, 0, 1, 1,
0.872217, -0.7607742, 2.68633, 1, 0, 0, 1, 1,
0.8731813, -0.6727319, 1.73798, 1, 0, 0, 1, 1,
0.8763252, -0.6795308, 1.355378, 0, 0, 0, 1, 1,
0.8822922, 0.02648596, 1.323355, 0, 0, 0, 1, 1,
0.885872, 0.3006461, 1.829473, 0, 0, 0, 1, 1,
0.8902513, 0.4912061, 1.587141, 0, 0, 0, 1, 1,
0.8922565, -0.3852444, 2.001396, 0, 0, 0, 1, 1,
0.8948709, 0.05418807, 3.301995, 0, 0, 0, 1, 1,
0.9004684, -0.1028928, 1.377963, 0, 0, 0, 1, 1,
0.912749, 1.442391, 2.596819, 1, 1, 1, 1, 1,
0.9148595, -1.134934, 2.049059, 1, 1, 1, 1, 1,
0.9188542, 1.307479, 0.005865553, 1, 1, 1, 1, 1,
0.9220552, 0.864967, 0.7340822, 1, 1, 1, 1, 1,
0.9227813, -0.1858359, 1.317629, 1, 1, 1, 1, 1,
0.9240575, -0.0001532265, 2.607136, 1, 1, 1, 1, 1,
0.9308141, -0.3851857, 2.321511, 1, 1, 1, 1, 1,
0.9314557, 1.372748, 0.0934609, 1, 1, 1, 1, 1,
0.9352149, 2.134796, 0.1488281, 1, 1, 1, 1, 1,
0.9469013, 0.6816405, 1.71709, 1, 1, 1, 1, 1,
0.9521552, -0.8889503, 4.969625, 1, 1, 1, 1, 1,
0.9542608, 0.7907928, 0.1670429, 1, 1, 1, 1, 1,
0.9571698, 0.5654491, 1.272614, 1, 1, 1, 1, 1,
0.9599358, -0.7083315, 2.973999, 1, 1, 1, 1, 1,
0.9639072, 0.2056658, 1.240869, 1, 1, 1, 1, 1,
0.9643072, 0.08807655, 1.54894, 0, 0, 1, 1, 1,
0.9644051, -0.1228547, 1.498068, 1, 0, 0, 1, 1,
0.9681068, 0.4221526, 1.7773, 1, 0, 0, 1, 1,
0.9705302, -1.761849, 1.020102, 1, 0, 0, 1, 1,
0.9705893, 0.1373829, 0.2393933, 1, 0, 0, 1, 1,
0.9773253, 1.726901, 0.7870201, 1, 0, 0, 1, 1,
0.9815052, -1.631208, 2.666607, 0, 0, 0, 1, 1,
0.9830804, 1.224348, 0.5864843, 0, 0, 0, 1, 1,
0.9867127, 0.576651, 1.620583, 0, 0, 0, 1, 1,
0.9875375, 0.1604281, 1.77014, 0, 0, 0, 1, 1,
0.9943948, 1.820684, -0.2127212, 0, 0, 0, 1, 1,
0.9959053, 1.679813, -0.1260439, 0, 0, 0, 1, 1,
0.9975349, 1.104789, 0.9024823, 0, 0, 0, 1, 1,
1.010294, 0.2985414, 2.934099, 1, 1, 1, 1, 1,
1.011756, -1.258996, 1.373133, 1, 1, 1, 1, 1,
1.014057, 0.753126, 1.300279, 1, 1, 1, 1, 1,
1.019126, -0.8549681, 2.756601, 1, 1, 1, 1, 1,
1.026012, 0.01286082, 2.234297, 1, 1, 1, 1, 1,
1.027075, 0.315531, 0.1986876, 1, 1, 1, 1, 1,
1.027416, 0.01318321, 0.3284137, 1, 1, 1, 1, 1,
1.037436, -0.1233583, 1.059233, 1, 1, 1, 1, 1,
1.037782, 0.5525231, 1.800338, 1, 1, 1, 1, 1,
1.039625, 0.1810211, 1.515606, 1, 1, 1, 1, 1,
1.04197, -0.7925333, 1.059308, 1, 1, 1, 1, 1,
1.051522, 0.243482, 2.134983, 1, 1, 1, 1, 1,
1.057171, -0.1817422, 1.746041, 1, 1, 1, 1, 1,
1.064389, -0.9126001, 2.893401, 1, 1, 1, 1, 1,
1.064877, 0.418478, 0.337369, 1, 1, 1, 1, 1,
1.065395, -0.08348253, 0.4274229, 0, 0, 1, 1, 1,
1.070173, 0.2941973, 0.6300955, 1, 0, 0, 1, 1,
1.073009, 0.2921845, 1.191561, 1, 0, 0, 1, 1,
1.077679, 1.601711, 1.860617, 1, 0, 0, 1, 1,
1.081342, 0.4230745, 1.213802, 1, 0, 0, 1, 1,
1.082065, -1.325378, 1.630949, 1, 0, 0, 1, 1,
1.08877, -1.0301, 2.394497, 0, 0, 0, 1, 1,
1.089113, -0.7087166, 1.956868, 0, 0, 0, 1, 1,
1.089268, -1.247517, 2.614537, 0, 0, 0, 1, 1,
1.099317, -1.038636, 2.003337, 0, 0, 0, 1, 1,
1.115578, 0.02848932, 1.299302, 0, 0, 0, 1, 1,
1.117298, -0.8062581, 2.932088, 0, 0, 0, 1, 1,
1.119962, -1.253423, 2.826046, 0, 0, 0, 1, 1,
1.125272, -0.1546388, -1.185807, 1, 1, 1, 1, 1,
1.132733, 0.2965801, 1.42444, 1, 1, 1, 1, 1,
1.134804, 0.4760954, 1.472548, 1, 1, 1, 1, 1,
1.135557, -0.5873006, 1.331268, 1, 1, 1, 1, 1,
1.136999, -1.202322, 2.181911, 1, 1, 1, 1, 1,
1.140677, 1.235429, 0.1222078, 1, 1, 1, 1, 1,
1.142159, -0.01333507, 2.039002, 1, 1, 1, 1, 1,
1.145119, 1.180877, 1.334241, 1, 1, 1, 1, 1,
1.147978, 0.1674886, 1.911384, 1, 1, 1, 1, 1,
1.15543, -0.5762748, 1.922887, 1, 1, 1, 1, 1,
1.156032, -2.175442, 1.50046, 1, 1, 1, 1, 1,
1.156289, -0.8345351, 1.881472, 1, 1, 1, 1, 1,
1.163523, 0.0131333, 2.129912, 1, 1, 1, 1, 1,
1.167084, -2.139045, 2.034298, 1, 1, 1, 1, 1,
1.170634, -1.457614, 4.281665, 1, 1, 1, 1, 1,
1.17392, -0.598421, 1.535649, 0, 0, 1, 1, 1,
1.184665, 2.26662, 0.3066734, 1, 0, 0, 1, 1,
1.184765, 1.372002, 0.6548734, 1, 0, 0, 1, 1,
1.187786, -0.5063312, 3.52552, 1, 0, 0, 1, 1,
1.193728, 0.2962007, 1.549981, 1, 0, 0, 1, 1,
1.198124, -0.2759095, 2.1772, 1, 0, 0, 1, 1,
1.198576, 0.9236115, 1.920795, 0, 0, 0, 1, 1,
1.19884, 1.842897, 0.7993758, 0, 0, 0, 1, 1,
1.19885, -0.9501584, 1.757374, 0, 0, 0, 1, 1,
1.200688, 1.172516, 1.120612, 0, 0, 0, 1, 1,
1.207584, -0.6584684, 3.892694, 0, 0, 0, 1, 1,
1.21101, 0.1987551, 1.364562, 0, 0, 0, 1, 1,
1.215101, -0.2634903, 0.263028, 0, 0, 0, 1, 1,
1.215741, 0.6107812, -0.4189269, 1, 1, 1, 1, 1,
1.216133, 1.554838, 2.696324, 1, 1, 1, 1, 1,
1.219429, 0.9451039, 1.816753, 1, 1, 1, 1, 1,
1.221012, -0.03623758, 2.691521, 1, 1, 1, 1, 1,
1.221393, -2.469872, 1.987232, 1, 1, 1, 1, 1,
1.223364, 0.4225128, 1.199697, 1, 1, 1, 1, 1,
1.225387, -1.974233, 2.398571, 1, 1, 1, 1, 1,
1.233606, -0.3076876, 3.023919, 1, 1, 1, 1, 1,
1.238947, -0.6105226, 2.716746, 1, 1, 1, 1, 1,
1.248116, -1.36109, 1.337302, 1, 1, 1, 1, 1,
1.261837, -0.6441084, 4.094284, 1, 1, 1, 1, 1,
1.262094, 0.7155285, 0.8514371, 1, 1, 1, 1, 1,
1.263548, 0.443883, 0.7138622, 1, 1, 1, 1, 1,
1.263989, -0.6695102, 2.222365, 1, 1, 1, 1, 1,
1.301617, -0.9525858, 2.381446, 1, 1, 1, 1, 1,
1.325461, 0.1758212, 2.807168, 0, 0, 1, 1, 1,
1.334371, -0.3821689, 2.406331, 1, 0, 0, 1, 1,
1.336429, 1.319352, 0.7139277, 1, 0, 0, 1, 1,
1.339483, 0.05412018, 0.7634548, 1, 0, 0, 1, 1,
1.345816, -1.006287, 3.357559, 1, 0, 0, 1, 1,
1.355319, 0.6897631, 2.754848, 1, 0, 0, 1, 1,
1.355322, 0.3919417, 1.365849, 0, 0, 0, 1, 1,
1.359005, 0.0696758, 2.357302, 0, 0, 0, 1, 1,
1.361771, -0.6936128, 2.378803, 0, 0, 0, 1, 1,
1.368141, -1.082856, 4.209144, 0, 0, 0, 1, 1,
1.39081, -1.060342, 2.009147, 0, 0, 0, 1, 1,
1.397286, -0.470853, 2.057971, 0, 0, 0, 1, 1,
1.399685, -2.006277, 2.87848, 0, 0, 0, 1, 1,
1.418544, 0.4770133, 0.3611327, 1, 1, 1, 1, 1,
1.421299, -0.9285769, 1.61726, 1, 1, 1, 1, 1,
1.453177, 2.563604, -0.04058623, 1, 1, 1, 1, 1,
1.461496, -0.8307493, 1.685677, 1, 1, 1, 1, 1,
1.468373, -1.050454, 3.770195, 1, 1, 1, 1, 1,
1.469898, 0.2262758, 4.262306, 1, 1, 1, 1, 1,
1.472599, -2.573757, 2.334812, 1, 1, 1, 1, 1,
1.483177, 0.9209136, 0.7994311, 1, 1, 1, 1, 1,
1.490207, 0.998768, 2.078225, 1, 1, 1, 1, 1,
1.491884, 0.5773631, 2.652691, 1, 1, 1, 1, 1,
1.508908, 0.1427899, 0.8175129, 1, 1, 1, 1, 1,
1.517209, 1.173467, 1.021546, 1, 1, 1, 1, 1,
1.521189, -0.05746746, 1.016245, 1, 1, 1, 1, 1,
1.539244, 1.550935, 0.8624583, 1, 1, 1, 1, 1,
1.5395, -1.453346, 3.413273, 1, 1, 1, 1, 1,
1.54074, -0.3513228, 1.445413, 0, 0, 1, 1, 1,
1.567724, -0.04178781, 1.818631, 1, 0, 0, 1, 1,
1.585183, -0.8913245, 2.124715, 1, 0, 0, 1, 1,
1.586636, -0.5155159, 1.633427, 1, 0, 0, 1, 1,
1.592655, 0.5121159, 2.554813, 1, 0, 0, 1, 1,
1.593653, 0.3820052, 0.1113631, 1, 0, 0, 1, 1,
1.596128, -0.4649555, 0.396459, 0, 0, 0, 1, 1,
1.61148, -0.5295346, 1.636795, 0, 0, 0, 1, 1,
1.620743, -0.2005536, 1.813321, 0, 0, 0, 1, 1,
1.642017, 2.461756, 0.3474754, 0, 0, 0, 1, 1,
1.642125, -0.5426034, 2.011479, 0, 0, 0, 1, 1,
1.648186, 0.7628376, 0.05249085, 0, 0, 0, 1, 1,
1.656427, -0.7619296, 1.437562, 0, 0, 0, 1, 1,
1.667316, 0.2198888, 0.179259, 1, 1, 1, 1, 1,
1.671221, 1.118961, 1.830545, 1, 1, 1, 1, 1,
1.672648, 0.01497622, 2.069608, 1, 1, 1, 1, 1,
1.700559, -0.567259, 1.154723, 1, 1, 1, 1, 1,
1.706742, -1.133173, 1.952287, 1, 1, 1, 1, 1,
1.714278, -1.593364, 2.832918, 1, 1, 1, 1, 1,
1.735931, -0.02431824, 1.233437, 1, 1, 1, 1, 1,
1.767391, 0.8396896, 1.367585, 1, 1, 1, 1, 1,
1.773462, -0.5914767, 3.293445, 1, 1, 1, 1, 1,
1.802684, -0.3794788, 1.679143, 1, 1, 1, 1, 1,
1.803779, -1.453915, 0.7971785, 1, 1, 1, 1, 1,
1.805381, -2.261148, 2.752914, 1, 1, 1, 1, 1,
1.832145, 1.145221, 2.066234, 1, 1, 1, 1, 1,
1.873815, -0.680759, 2.312218, 1, 1, 1, 1, 1,
1.918328, -0.568972, 4.061999, 1, 1, 1, 1, 1,
1.93404, -0.6445593, 3.445433, 0, 0, 1, 1, 1,
1.934914, -0.4090101, 1.614773, 1, 0, 0, 1, 1,
1.952678, -1.888626, 2.184733, 1, 0, 0, 1, 1,
1.957237, -0.07062483, 3.617233, 1, 0, 0, 1, 1,
1.995764, 1.278068, 0.02561171, 1, 0, 0, 1, 1,
2.036968, -0.3650964, 1.399777, 1, 0, 0, 1, 1,
2.077171, -1.250659, 0.475083, 0, 0, 0, 1, 1,
2.105691, -0.8386469, 0.9130774, 0, 0, 0, 1, 1,
2.130093, -1.113433, 2.526391, 0, 0, 0, 1, 1,
2.188124, 0.1495042, 0.351896, 0, 0, 0, 1, 1,
2.316177, 0.3299047, 1.901436, 0, 0, 0, 1, 1,
2.324581, -0.882683, 0.07243732, 0, 0, 0, 1, 1,
2.381837, -0.1972763, 1.710875, 0, 0, 0, 1, 1,
2.399948, 2.145013, 2.967437, 1, 1, 1, 1, 1,
2.657449, 0.4292694, 2.203747, 1, 1, 1, 1, 1,
2.671829, 0.5338683, 1.392713, 1, 1, 1, 1, 1,
2.78334, -0.3285038, 1.834135, 1, 1, 1, 1, 1,
2.856306, -3.614074, 3.347462, 1, 1, 1, 1, 1,
2.932675, 0.5042757, 0.4270967, 1, 1, 1, 1, 1,
3.15128, -0.9092754, 2.794593, 1, 1, 1, 1, 1
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
var radius = 9.740969;
var distance = 34.21474;
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
mvMatrix.translate( -0.1454047, 0.4695725, -0.1579502 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.21474);
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
