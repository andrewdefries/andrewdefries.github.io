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
-2.956506, -0.5137646, -1.687817, 1, 0, 0, 1,
-2.773485, -0.3125811, -0.07955513, 1, 0.007843138, 0, 1,
-2.772842, -0.8397779, -1.95855, 1, 0.01176471, 0, 1,
-2.543278, 0.9565676, -1.04012, 1, 0.01960784, 0, 1,
-2.469884, 0.4148453, -1.531366, 1, 0.02352941, 0, 1,
-2.403755, -0.2996125, -1.161077, 1, 0.03137255, 0, 1,
-2.347645, -1.424561, -1.494142, 1, 0.03529412, 0, 1,
-2.31448, 2.137465, -1.314001, 1, 0.04313726, 0, 1,
-2.30355, 0.958948, -0.442882, 1, 0.04705882, 0, 1,
-2.296745, -0.3624289, -1.800858, 1, 0.05490196, 0, 1,
-2.273347, 1.523294, -0.3537621, 1, 0.05882353, 0, 1,
-2.268304, 1.09605, -1.067483, 1, 0.06666667, 0, 1,
-2.266336, -1.509317, -1.626302, 1, 0.07058824, 0, 1,
-2.185878, -0.2934158, -1.82849, 1, 0.07843138, 0, 1,
-2.076198, -0.5866795, -3.399729, 1, 0.08235294, 0, 1,
-2.060492, 1.18668, -0.653393, 1, 0.09019608, 0, 1,
-2.016905, -2.409859, -3.566712, 1, 0.09411765, 0, 1,
-1.9986, 1.119247, 0.1259202, 1, 0.1019608, 0, 1,
-1.990116, 0.07077883, -2.319262, 1, 0.1098039, 0, 1,
-1.914526, 0.5448167, -2.030605, 1, 0.1137255, 0, 1,
-1.848589, 0.6593105, -3.092244, 1, 0.1215686, 0, 1,
-1.847874, 0.8519546, -0.3498167, 1, 0.1254902, 0, 1,
-1.838773, 0.1487741, -3.158801, 1, 0.1333333, 0, 1,
-1.788003, 0.3851105, -2.058669, 1, 0.1372549, 0, 1,
-1.769885, -0.4876699, -0.5253609, 1, 0.145098, 0, 1,
-1.76272, -0.02733223, -1.115743, 1, 0.1490196, 0, 1,
-1.715194, 1.201569, -1.329081, 1, 0.1568628, 0, 1,
-1.703573, 0.6441612, -1.108561, 1, 0.1607843, 0, 1,
-1.697283, 0.1795194, -2.243183, 1, 0.1686275, 0, 1,
-1.692724, 1.611437, 0.9670485, 1, 0.172549, 0, 1,
-1.656445, -0.3857778, -2.653449, 1, 0.1803922, 0, 1,
-1.655713, 1.830812, 0.1926895, 1, 0.1843137, 0, 1,
-1.654032, -1.458468, -2.701614, 1, 0.1921569, 0, 1,
-1.650378, 0.1612547, -1.890217, 1, 0.1960784, 0, 1,
-1.647452, -0.8442149, -3.158391, 1, 0.2039216, 0, 1,
-1.618428, 0.2506759, -1.696191, 1, 0.2117647, 0, 1,
-1.601751, -0.9517892, -2.46359, 1, 0.2156863, 0, 1,
-1.578109, -0.3182532, -1.799514, 1, 0.2235294, 0, 1,
-1.577213, 0.4179955, -0.8405682, 1, 0.227451, 0, 1,
-1.562181, -0.4721614, -1.92357, 1, 0.2352941, 0, 1,
-1.559, -1.827655, -3.38832, 1, 0.2392157, 0, 1,
-1.557347, -2.060851, -1.049002, 1, 0.2470588, 0, 1,
-1.5514, 0.5517001, -1.522329, 1, 0.2509804, 0, 1,
-1.547534, 0.1411041, -0.680475, 1, 0.2588235, 0, 1,
-1.540478, -0.06570386, -0.04803424, 1, 0.2627451, 0, 1,
-1.534391, 0.3049003, -1.134341, 1, 0.2705882, 0, 1,
-1.523472, 0.1855381, -2.603486, 1, 0.2745098, 0, 1,
-1.516116, -0.7095988, -0.8967451, 1, 0.282353, 0, 1,
-1.505498, 1.107267, -0.5729917, 1, 0.2862745, 0, 1,
-1.500724, -0.3945743, -0.9975342, 1, 0.2941177, 0, 1,
-1.499397, 0.1981862, -1.44364, 1, 0.3019608, 0, 1,
-1.496796, 0.9849164, -0.19088, 1, 0.3058824, 0, 1,
-1.494034, 1.185636, 0.1091931, 1, 0.3137255, 0, 1,
-1.476225, 1.246969, -1.401844, 1, 0.3176471, 0, 1,
-1.475443, -0.5590044, -2.822184, 1, 0.3254902, 0, 1,
-1.473396, -0.6370739, -0.07337446, 1, 0.3294118, 0, 1,
-1.436248, -0.6349648, -0.7841813, 1, 0.3372549, 0, 1,
-1.428474, -0.1067235, -1.448906, 1, 0.3411765, 0, 1,
-1.423593, -0.6252266, -1.775997, 1, 0.3490196, 0, 1,
-1.420251, -0.6053587, -2.263458, 1, 0.3529412, 0, 1,
-1.418071, 0.7121204, -4.337155, 1, 0.3607843, 0, 1,
-1.411342, 0.7235682, -2.238959, 1, 0.3647059, 0, 1,
-1.410809, 0.1921633, 0.7035218, 1, 0.372549, 0, 1,
-1.40507, 1.816614, -0.5586273, 1, 0.3764706, 0, 1,
-1.399038, -0.7733487, -0.7289727, 1, 0.3843137, 0, 1,
-1.396117, -1.354962, -2.860211, 1, 0.3882353, 0, 1,
-1.39503, -0.8454574, -1.041269, 1, 0.3960784, 0, 1,
-1.388592, 0.820506, 0.3560754, 1, 0.4039216, 0, 1,
-1.381594, 2.005948, 0.6057642, 1, 0.4078431, 0, 1,
-1.380287, -0.3465967, -1.699472, 1, 0.4156863, 0, 1,
-1.374066, -0.8540812, -1.822307, 1, 0.4196078, 0, 1,
-1.370537, -0.1817228, -1.071356, 1, 0.427451, 0, 1,
-1.353869, 0.08078273, -0.5660847, 1, 0.4313726, 0, 1,
-1.344173, 0.1591645, -1.005936, 1, 0.4392157, 0, 1,
-1.327243, -0.747361, -3.126581, 1, 0.4431373, 0, 1,
-1.325536, -0.5092018, -0.5119347, 1, 0.4509804, 0, 1,
-1.320011, 0.415425, -0.6258175, 1, 0.454902, 0, 1,
-1.313271, -0.5630952, -0.3291461, 1, 0.4627451, 0, 1,
-1.311325, -0.2566651, -1.933937, 1, 0.4666667, 0, 1,
-1.307275, 0.4722392, -1.21658, 1, 0.4745098, 0, 1,
-1.292968, -1.531252, -2.472151, 1, 0.4784314, 0, 1,
-1.28895, -0.02487746, -3.109836, 1, 0.4862745, 0, 1,
-1.288856, 0.3780775, -1.308675, 1, 0.4901961, 0, 1,
-1.28823, 1.243872, -0.756107, 1, 0.4980392, 0, 1,
-1.282774, -0.4262931, -0.6342673, 1, 0.5058824, 0, 1,
-1.274117, 0.8278969, -0.8780913, 1, 0.509804, 0, 1,
-1.263165, 0.2937855, -0.2957349, 1, 0.5176471, 0, 1,
-1.256564, -1.626047, -3.116828, 1, 0.5215687, 0, 1,
-1.252863, -0.1162166, -0.4366271, 1, 0.5294118, 0, 1,
-1.249792, -0.400104, -1.634427, 1, 0.5333334, 0, 1,
-1.240311, 0.226946, -0.3114932, 1, 0.5411765, 0, 1,
-1.238796, -0.937211, -2.269254, 1, 0.5450981, 0, 1,
-1.231176, 2.033037, -1.770728, 1, 0.5529412, 0, 1,
-1.22963, 0.8020926, -0.9435791, 1, 0.5568628, 0, 1,
-1.220411, -0.1037407, -2.415341, 1, 0.5647059, 0, 1,
-1.214142, -0.006511635, -4.103523, 1, 0.5686275, 0, 1,
-1.21399, -0.5306873, -2.436576, 1, 0.5764706, 0, 1,
-1.207298, -0.4019672, -1.60955, 1, 0.5803922, 0, 1,
-1.206681, 0.06537706, -2.195829, 1, 0.5882353, 0, 1,
-1.201574, 1.332249, -0.4745184, 1, 0.5921569, 0, 1,
-1.201282, 0.1932169, -1.724111, 1, 0.6, 0, 1,
-1.200624, 0.1207004, -0.3625288, 1, 0.6078432, 0, 1,
-1.191662, 0.03677578, -3.384772, 1, 0.6117647, 0, 1,
-1.191159, -0.3384553, 0.4656615, 1, 0.6196079, 0, 1,
-1.18525, 1.255974, -1.592265, 1, 0.6235294, 0, 1,
-1.178335, -0.05680496, -2.370443, 1, 0.6313726, 0, 1,
-1.161066, 0.8773044, -1.23385, 1, 0.6352941, 0, 1,
-1.160585, -0.4687098, -2.088766, 1, 0.6431373, 0, 1,
-1.16018, 0.1568798, -0.7613296, 1, 0.6470588, 0, 1,
-1.159044, 0.2665201, -1.759864, 1, 0.654902, 0, 1,
-1.158582, 0.5055209, -2.817872, 1, 0.6588235, 0, 1,
-1.157444, 0.9361263, -1.251867, 1, 0.6666667, 0, 1,
-1.151624, -1.476674, -2.318698, 1, 0.6705883, 0, 1,
-1.1425, 1.221005, -1.884916, 1, 0.6784314, 0, 1,
-1.125905, -0.8741525, -3.683676, 1, 0.682353, 0, 1,
-1.12078, -0.5573177, -2.15645, 1, 0.6901961, 0, 1,
-1.11947, 1.089569, -1.163283, 1, 0.6941177, 0, 1,
-1.116514, -1.025109, -2.966097, 1, 0.7019608, 0, 1,
-1.114538, -1.563911, -2.921057, 1, 0.7098039, 0, 1,
-1.114045, 0.6101725, -1.158964, 1, 0.7137255, 0, 1,
-1.107643, 0.2058688, -1.563184, 1, 0.7215686, 0, 1,
-1.097113, 1.117047, -0.4481131, 1, 0.7254902, 0, 1,
-1.094048, 0.675145, -0.6497079, 1, 0.7333333, 0, 1,
-1.086873, -2.201098, -3.62054, 1, 0.7372549, 0, 1,
-1.068078, 0.8385344, -0.3609379, 1, 0.7450981, 0, 1,
-1.064528, -1.43623, -2.497777, 1, 0.7490196, 0, 1,
-1.063149, 0.8701201, 0.8154446, 1, 0.7568628, 0, 1,
-1.061219, 0.7614309, 0.1025021, 1, 0.7607843, 0, 1,
-1.054187, -1.78881, -1.627086, 1, 0.7686275, 0, 1,
-1.046789, 0.1865351, -0.8489692, 1, 0.772549, 0, 1,
-1.044582, -0.6860961, -3.371841, 1, 0.7803922, 0, 1,
-1.043514, 0.6870506, -1.535354, 1, 0.7843137, 0, 1,
-1.034634, 0.1595979, -1.344412, 1, 0.7921569, 0, 1,
-1.022201, 1.324592, -1.691603, 1, 0.7960784, 0, 1,
-1.014672, 0.07335968, -1.810451, 1, 0.8039216, 0, 1,
-1.011982, -1.049989, -2.036572, 1, 0.8117647, 0, 1,
-1.005347, -1.074491, -3.055006, 1, 0.8156863, 0, 1,
-0.9939165, 0.5494816, -1.524135, 1, 0.8235294, 0, 1,
-0.9907774, 0.1571802, -1.834086, 1, 0.827451, 0, 1,
-0.9820171, -1.005047, -2.663851, 1, 0.8352941, 0, 1,
-0.9802335, -1.440947, -2.410108, 1, 0.8392157, 0, 1,
-0.9779547, 0.5599666, -1.830894, 1, 0.8470588, 0, 1,
-0.9774637, -0.1922508, -2.696963, 1, 0.8509804, 0, 1,
-0.9741402, -1.108913, -2.803793, 1, 0.8588235, 0, 1,
-0.9630476, 0.3627939, -1.106771, 1, 0.8627451, 0, 1,
-0.9623627, -1.303719, -2.214877, 1, 0.8705882, 0, 1,
-0.9573836, -0.3445516, -2.614458, 1, 0.8745098, 0, 1,
-0.9571728, 0.1762101, -1.26904, 1, 0.8823529, 0, 1,
-0.9520647, -0.7904278, -1.273517, 1, 0.8862745, 0, 1,
-0.9488015, 0.3342561, -0.3290017, 1, 0.8941177, 0, 1,
-0.9448803, 0.2610965, -0.08221836, 1, 0.8980392, 0, 1,
-0.9404107, 2.485116, -0.6567312, 1, 0.9058824, 0, 1,
-0.9378124, 1.227552, 0.1861591, 1, 0.9137255, 0, 1,
-0.9264085, 0.8078003, -2.431602, 1, 0.9176471, 0, 1,
-0.9244902, -1.289621, -1.789666, 1, 0.9254902, 0, 1,
-0.9234204, 0.9869743, 0.5157518, 1, 0.9294118, 0, 1,
-0.9209531, -1.085107, -2.986749, 1, 0.9372549, 0, 1,
-0.9153075, -0.6781978, -0.4268357, 1, 0.9411765, 0, 1,
-0.9111983, 0.1558398, -1.569721, 1, 0.9490196, 0, 1,
-0.9106338, -1.420747, -3.748013, 1, 0.9529412, 0, 1,
-0.9086241, -0.1833183, -2.053195, 1, 0.9607843, 0, 1,
-0.892519, -0.408623, -0.7089959, 1, 0.9647059, 0, 1,
-0.8891342, 1.075152, -1.145204, 1, 0.972549, 0, 1,
-0.8864238, -0.8560224, -0.7327818, 1, 0.9764706, 0, 1,
-0.8831556, -0.70147, -1.132376, 1, 0.9843137, 0, 1,
-0.8802477, -0.8395159, -1.901647, 1, 0.9882353, 0, 1,
-0.8794534, -0.6012878, -1.656731, 1, 0.9960784, 0, 1,
-0.871913, -0.1076941, -1.464367, 0.9960784, 1, 0, 1,
-0.8654771, 1.106345, 0.2129685, 0.9921569, 1, 0, 1,
-0.864393, -1.31543, -2.442862, 0.9843137, 1, 0, 1,
-0.8622506, -1.119969, -2.285831, 0.9803922, 1, 0, 1,
-0.8577666, -0.3564873, -0.9008984, 0.972549, 1, 0, 1,
-0.8570797, 0.5198072, -0.3095999, 0.9686275, 1, 0, 1,
-0.8531373, 1.020434, 0.9218814, 0.9607843, 1, 0, 1,
-0.8522623, -0.1244011, -2.725191, 0.9568627, 1, 0, 1,
-0.845744, -0.618352, -3.462312, 0.9490196, 1, 0, 1,
-0.8437667, 0.2993988, 0.3781767, 0.945098, 1, 0, 1,
-0.8406222, -0.4021726, -0.2648126, 0.9372549, 1, 0, 1,
-0.8397272, 1.810821, 0.06408472, 0.9333333, 1, 0, 1,
-0.8362255, -1.687707, -1.134143, 0.9254902, 1, 0, 1,
-0.8341133, 0.4182514, -0.7909931, 0.9215686, 1, 0, 1,
-0.8312499, -0.1367497, -3.203818, 0.9137255, 1, 0, 1,
-0.8307734, -1.619522, -1.743267, 0.9098039, 1, 0, 1,
-0.823265, -0.5109067, -0.7154984, 0.9019608, 1, 0, 1,
-0.8228864, 1.409212, -0.326945, 0.8941177, 1, 0, 1,
-0.8203457, 0.4105514, -2.071732, 0.8901961, 1, 0, 1,
-0.8187248, 0.1962491, -1.750207, 0.8823529, 1, 0, 1,
-0.8176281, 0.4588709, -1.042379, 0.8784314, 1, 0, 1,
-0.8078939, 1.036449, -0.3946357, 0.8705882, 1, 0, 1,
-0.8041297, 0.3058589, -1.053831, 0.8666667, 1, 0, 1,
-0.8033499, -1.475262, -1.806887, 0.8588235, 1, 0, 1,
-0.7949664, -0.1019575, -0.8712515, 0.854902, 1, 0, 1,
-0.7929634, -0.9413913, -2.529769, 0.8470588, 1, 0, 1,
-0.7919541, -0.1412712, -3.32079, 0.8431373, 1, 0, 1,
-0.7877712, -0.3480439, -3.506119, 0.8352941, 1, 0, 1,
-0.7872162, 0.04889654, -2.370281, 0.8313726, 1, 0, 1,
-0.782717, 0.1169001, -0.3566663, 0.8235294, 1, 0, 1,
-0.7800844, 0.4697532, -1.826365, 0.8196079, 1, 0, 1,
-0.7730777, -1.003278, -2.192498, 0.8117647, 1, 0, 1,
-0.7676773, -0.7826905, -3.542397, 0.8078431, 1, 0, 1,
-0.7659817, 1.541203, 0.3445125, 0.8, 1, 0, 1,
-0.765723, -0.04909476, -3.861935, 0.7921569, 1, 0, 1,
-0.765058, 1.509877, -0.2175862, 0.7882353, 1, 0, 1,
-0.7616255, 0.3986359, -1.036358, 0.7803922, 1, 0, 1,
-0.7585014, 1.038824, -0.7374238, 0.7764706, 1, 0, 1,
-0.7572267, 0.4770853, -1.069712, 0.7686275, 1, 0, 1,
-0.7557092, -0.2012248, -3.091243, 0.7647059, 1, 0, 1,
-0.753871, 0.5944821, 0.6191057, 0.7568628, 1, 0, 1,
-0.7462217, 0.2481394, -2.674665, 0.7529412, 1, 0, 1,
-0.7408401, -1.222222, -4.023682, 0.7450981, 1, 0, 1,
-0.7402027, 0.6758885, -0.9268234, 0.7411765, 1, 0, 1,
-0.7395649, 0.3599112, -0.4012005, 0.7333333, 1, 0, 1,
-0.7391511, 0.9302531, -1.51116, 0.7294118, 1, 0, 1,
-0.7330089, 1.178876, 0.3013854, 0.7215686, 1, 0, 1,
-0.7317668, 0.3543199, 0.9123861, 0.7176471, 1, 0, 1,
-0.7305537, -0.7070153, -2.400263, 0.7098039, 1, 0, 1,
-0.7277431, -1.352111, -3.151544, 0.7058824, 1, 0, 1,
-0.7272964, 0.6957988, -0.618413, 0.6980392, 1, 0, 1,
-0.7259586, -0.0868457, -0.5956487, 0.6901961, 1, 0, 1,
-0.7199311, 0.508501, -0.2082224, 0.6862745, 1, 0, 1,
-0.7187473, 0.7867951, -0.8303263, 0.6784314, 1, 0, 1,
-0.7150249, -1.511982, -2.08912, 0.6745098, 1, 0, 1,
-0.7068345, -2.209547, -3.948868, 0.6666667, 1, 0, 1,
-0.7042232, 1.148656, -1.041176, 0.6627451, 1, 0, 1,
-0.703356, 0.2873667, -1.926467, 0.654902, 1, 0, 1,
-0.7032412, 1.128982, -0.3447501, 0.6509804, 1, 0, 1,
-0.7030402, -0.76332, -3.781882, 0.6431373, 1, 0, 1,
-0.6987599, -0.0998681, -2.262259, 0.6392157, 1, 0, 1,
-0.6952152, 1.729728, 0.7810473, 0.6313726, 1, 0, 1,
-0.6919912, 0.616034, 2.325576, 0.627451, 1, 0, 1,
-0.6754456, 0.3562062, -0.6463352, 0.6196079, 1, 0, 1,
-0.6732555, -1.064519, -3.643299, 0.6156863, 1, 0, 1,
-0.6726521, 1.383328, 1.252454, 0.6078432, 1, 0, 1,
-0.6615984, 0.6189516, -1.54493, 0.6039216, 1, 0, 1,
-0.6602988, -1.026647, -1.864558, 0.5960785, 1, 0, 1,
-0.6556543, -0.7725365, -2.198702, 0.5882353, 1, 0, 1,
-0.6488243, -0.6872184, -1.624373, 0.5843138, 1, 0, 1,
-0.6434601, -0.5012273, -4.529158, 0.5764706, 1, 0, 1,
-0.6432945, 1.205087, -1.465494, 0.572549, 1, 0, 1,
-0.6424646, 2.994875, 0.3840741, 0.5647059, 1, 0, 1,
-0.638341, 0.1030922, -0.9185429, 0.5607843, 1, 0, 1,
-0.6377797, -0.3319561, -0.787071, 0.5529412, 1, 0, 1,
-0.6348139, -0.2551896, -1.758304, 0.5490196, 1, 0, 1,
-0.6296951, 0.8175263, 0.0339393, 0.5411765, 1, 0, 1,
-0.6230079, -1.872768, -2.007016, 0.5372549, 1, 0, 1,
-0.6228975, 1.474972, 1.016595, 0.5294118, 1, 0, 1,
-0.6171113, 0.6705068, -0.6917848, 0.5254902, 1, 0, 1,
-0.6156391, 1.197699, 0.2947033, 0.5176471, 1, 0, 1,
-0.6120436, -0.4366916, -1.171938, 0.5137255, 1, 0, 1,
-0.6064667, -0.671571, -1.832928, 0.5058824, 1, 0, 1,
-0.6046235, -1.958222, -1.561537, 0.5019608, 1, 0, 1,
-0.5995731, -0.8309664, -2.258132, 0.4941176, 1, 0, 1,
-0.5946989, -0.8960565, -2.317225, 0.4862745, 1, 0, 1,
-0.5937673, 0.6112152, -0.07017308, 0.4823529, 1, 0, 1,
-0.5920972, 0.3418976, -0.6597058, 0.4745098, 1, 0, 1,
-0.5913055, -0.2336416, -1.351846, 0.4705882, 1, 0, 1,
-0.5882918, 1.154757, -1.398753, 0.4627451, 1, 0, 1,
-0.5785669, 0.3878572, 1.349905, 0.4588235, 1, 0, 1,
-0.577862, 2.021527, 0.2141278, 0.4509804, 1, 0, 1,
-0.5749952, 0.9622928, -0.3051323, 0.4470588, 1, 0, 1,
-0.5712857, -1.167681, -1.241593, 0.4392157, 1, 0, 1,
-0.5690597, 0.190683, -3.6761, 0.4352941, 1, 0, 1,
-0.5672972, 0.7775614, 0.6596079, 0.427451, 1, 0, 1,
-0.5663048, 1.836116, -0.6913446, 0.4235294, 1, 0, 1,
-0.5613544, -0.3536841, -0.9868976, 0.4156863, 1, 0, 1,
-0.5575373, 1.009406, -0.5914051, 0.4117647, 1, 0, 1,
-0.5534717, 0.904904, -1.966106, 0.4039216, 1, 0, 1,
-0.5495651, -0.3502183, -2.350192, 0.3960784, 1, 0, 1,
-0.5430748, -0.3603919, -2.078524, 0.3921569, 1, 0, 1,
-0.5371469, -0.5344617, -4.077173, 0.3843137, 1, 0, 1,
-0.5354537, -0.6593123, -4.561798, 0.3803922, 1, 0, 1,
-0.5352581, 0.5929264, -0.3520272, 0.372549, 1, 0, 1,
-0.5348154, 0.0872096, -2.096852, 0.3686275, 1, 0, 1,
-0.5312095, -0.9595275, -4.283878, 0.3607843, 1, 0, 1,
-0.5310013, 0.6656133, -1.072216, 0.3568628, 1, 0, 1,
-0.5262948, -1.244924, -3.097577, 0.3490196, 1, 0, 1,
-0.5256258, -1.557493, -1.568923, 0.345098, 1, 0, 1,
-0.5229148, 1.147512, -0.8373137, 0.3372549, 1, 0, 1,
-0.5225192, 0.3072963, -3.1029, 0.3333333, 1, 0, 1,
-0.5160019, 0.4029087, -0.04702378, 0.3254902, 1, 0, 1,
-0.5142017, -0.3772916, -0.8762143, 0.3215686, 1, 0, 1,
-0.5139008, -0.08757886, -3.016479, 0.3137255, 1, 0, 1,
-0.511072, -1.740505, -1.859678, 0.3098039, 1, 0, 1,
-0.5097651, 0.3430296, -0.7230059, 0.3019608, 1, 0, 1,
-0.5078295, 0.03580881, 0.05255523, 0.2941177, 1, 0, 1,
-0.5069736, 0.7076926, -0.2427628, 0.2901961, 1, 0, 1,
-0.5011652, -1.006229, -2.848141, 0.282353, 1, 0, 1,
-0.5008022, -1.205334, -3.042712, 0.2784314, 1, 0, 1,
-0.5003728, 0.7424732, -0.1792914, 0.2705882, 1, 0, 1,
-0.4973172, 1.562625, -0.6779217, 0.2666667, 1, 0, 1,
-0.4955905, -0.9576938, -2.963264, 0.2588235, 1, 0, 1,
-0.4949363, 1.83045, -2.604054, 0.254902, 1, 0, 1,
-0.4942965, -1.247067, -2.873101, 0.2470588, 1, 0, 1,
-0.493566, -0.07376599, -2.415488, 0.2431373, 1, 0, 1,
-0.4917614, 0.447625, -0.5190036, 0.2352941, 1, 0, 1,
-0.490986, -0.2123597, -2.531511, 0.2313726, 1, 0, 1,
-0.4899631, -0.7941266, -1.704281, 0.2235294, 1, 0, 1,
-0.4875134, 1.461559, -0.4269379, 0.2196078, 1, 0, 1,
-0.4870217, -0.4977896, -2.633924, 0.2117647, 1, 0, 1,
-0.4843648, 1.099271, -0.2468062, 0.2078431, 1, 0, 1,
-0.4780651, -0.7558574, -2.938638, 0.2, 1, 0, 1,
-0.4776244, -0.4059955, -3.161052, 0.1921569, 1, 0, 1,
-0.470484, -0.09532756, -1.254974, 0.1882353, 1, 0, 1,
-0.4703802, -0.7653056, -0.8371198, 0.1803922, 1, 0, 1,
-0.465649, -0.08132798, -0.854836, 0.1764706, 1, 0, 1,
-0.4641488, 0.4314317, 0.813724, 0.1686275, 1, 0, 1,
-0.4640676, -0.9118406, -2.917926, 0.1647059, 1, 0, 1,
-0.463634, 0.666124, -1.656785, 0.1568628, 1, 0, 1,
-0.4564851, 1.299259, -0.9675199, 0.1529412, 1, 0, 1,
-0.4534088, -0.936244, -2.78602, 0.145098, 1, 0, 1,
-0.4515436, 0.2296537, -1.573995, 0.1411765, 1, 0, 1,
-0.4511562, -0.1322589, -1.024499, 0.1333333, 1, 0, 1,
-0.4509223, 1.837214, -0.5425009, 0.1294118, 1, 0, 1,
-0.4505941, 0.9069725, 0.02806135, 0.1215686, 1, 0, 1,
-0.4429355, -0.6279977, -2.458205, 0.1176471, 1, 0, 1,
-0.4411555, -0.3432139, -2.277587, 0.1098039, 1, 0, 1,
-0.4373954, 0.05772987, 0.909282, 0.1058824, 1, 0, 1,
-0.4372625, -0.4230548, -4.629061, 0.09803922, 1, 0, 1,
-0.4348272, -0.3260075, -2.678893, 0.09019608, 1, 0, 1,
-0.4346832, -0.5823144, -1.524857, 0.08627451, 1, 0, 1,
-0.4324321, 0.5883993, -0.285619, 0.07843138, 1, 0, 1,
-0.431039, -0.3745373, -0.3956429, 0.07450981, 1, 0, 1,
-0.430221, 1.090711, -0.2538069, 0.06666667, 1, 0, 1,
-0.4238172, -0.01605428, -1.44345, 0.0627451, 1, 0, 1,
-0.4206176, 0.2538412, -1.971954, 0.05490196, 1, 0, 1,
-0.4166771, 0.9689235, -0.2946987, 0.05098039, 1, 0, 1,
-0.4131782, -0.7896284, -1.923869, 0.04313726, 1, 0, 1,
-0.412929, -1.255383, -2.015621, 0.03921569, 1, 0, 1,
-0.4121602, 2.02315, -0.08911645, 0.03137255, 1, 0, 1,
-0.4020169, -1.262796, -4.796929, 0.02745098, 1, 0, 1,
-0.3957215, -0.07271266, -2.116176, 0.01960784, 1, 0, 1,
-0.3934986, -0.02823918, -1.227293, 0.01568628, 1, 0, 1,
-0.3921092, 0.2203568, -1.731933, 0.007843138, 1, 0, 1,
-0.3886659, 1.608896, -0.1664188, 0.003921569, 1, 0, 1,
-0.3861183, -0.4492115, -3.393601, 0, 1, 0.003921569, 1,
-0.3853769, 0.3114081, 0.1548679, 0, 1, 0.01176471, 1,
-0.3846719, 1.354195, -0.9385332, 0, 1, 0.01568628, 1,
-0.3824708, -0.1303788, -2.127996, 0, 1, 0.02352941, 1,
-0.3823415, -0.2206819, -2.776664, 0, 1, 0.02745098, 1,
-0.3787116, 0.7066779, -0.0008477353, 0, 1, 0.03529412, 1,
-0.3755307, 0.2330599, -2.198041, 0, 1, 0.03921569, 1,
-0.3726885, 0.4133703, -1.210693, 0, 1, 0.04705882, 1,
-0.3723086, -1.348072, -3.503185, 0, 1, 0.05098039, 1,
-0.3692522, -1.646362, -3.97325, 0, 1, 0.05882353, 1,
-0.3646918, -0.3139036, -2.938855, 0, 1, 0.0627451, 1,
-0.364149, -0.06209696, -1.919262, 0, 1, 0.07058824, 1,
-0.3637237, -0.2615491, -1.31781, 0, 1, 0.07450981, 1,
-0.3605077, -1.463878, -2.569782, 0, 1, 0.08235294, 1,
-0.3599127, 0.9663751, 0.09845915, 0, 1, 0.08627451, 1,
-0.3549497, -0.9686316, -2.864424, 0, 1, 0.09411765, 1,
-0.3543651, -0.2171978, -1.114608, 0, 1, 0.1019608, 1,
-0.3487521, -2.295571, -1.599083, 0, 1, 0.1058824, 1,
-0.3472297, 0.7683454, 0.7557062, 0, 1, 0.1137255, 1,
-0.3459484, 0.6335096, 0.975234, 0, 1, 0.1176471, 1,
-0.3366345, -0.6162576, -2.564218, 0, 1, 0.1254902, 1,
-0.3352156, -0.4370337, -3.516554, 0, 1, 0.1294118, 1,
-0.3350249, 0.9875175, -0.6364646, 0, 1, 0.1372549, 1,
-0.3327349, 0.3014929, -1.103124, 0, 1, 0.1411765, 1,
-0.3292775, -1.748216, -2.923935, 0, 1, 0.1490196, 1,
-0.3291456, -0.2042992, -2.357899, 0, 1, 0.1529412, 1,
-0.3265517, 1.240078, -1.042797, 0, 1, 0.1607843, 1,
-0.3261946, 1.840639, -1.005666, 0, 1, 0.1647059, 1,
-0.318345, -0.08742143, -0.2586103, 0, 1, 0.172549, 1,
-0.3122731, -0.2043845, -2.316308, 0, 1, 0.1764706, 1,
-0.3111258, -0.1718727, -2.150459, 0, 1, 0.1843137, 1,
-0.3109794, -0.6788152, -3.382973, 0, 1, 0.1882353, 1,
-0.310601, -1.188747, -2.911166, 0, 1, 0.1960784, 1,
-0.3087982, -1.358453, -1.942434, 0, 1, 0.2039216, 1,
-0.306799, 2.027338, -0.9135355, 0, 1, 0.2078431, 1,
-0.3066354, 0.1320543, -1.73561, 0, 1, 0.2156863, 1,
-0.3043573, 0.4140263, 0.4581445, 0, 1, 0.2196078, 1,
-0.3043226, 1.015185, -0.2062473, 0, 1, 0.227451, 1,
-0.3030796, -1.006229, -3.189547, 0, 1, 0.2313726, 1,
-0.2986209, -1.725384, -2.349733, 0, 1, 0.2392157, 1,
-0.2929894, -1.910033, -2.283462, 0, 1, 0.2431373, 1,
-0.2902141, -0.7224308, -2.051198, 0, 1, 0.2509804, 1,
-0.2899378, 0.8165106, 1.479057, 0, 1, 0.254902, 1,
-0.2843745, -1.390484, -2.670874, 0, 1, 0.2627451, 1,
-0.2832364, 0.3146628, -0.3995683, 0, 1, 0.2666667, 1,
-0.2832192, -0.708478, -1.852778, 0, 1, 0.2745098, 1,
-0.2830718, 1.021139, -0.3905533, 0, 1, 0.2784314, 1,
-0.2797733, 0.1365088, -0.08615859, 0, 1, 0.2862745, 1,
-0.2744246, -0.2449958, -2.271243, 0, 1, 0.2901961, 1,
-0.2739387, 0.07130589, -1.100439, 0, 1, 0.2980392, 1,
-0.272346, -0.1181542, -1.840892, 0, 1, 0.3058824, 1,
-0.2692956, 0.6021873, 1.897927, 0, 1, 0.3098039, 1,
-0.2683623, -0.02789493, -1.3165, 0, 1, 0.3176471, 1,
-0.2644986, -1.742852, -2.839616, 0, 1, 0.3215686, 1,
-0.264168, -0.3072256, -3.748463, 0, 1, 0.3294118, 1,
-0.2603601, -0.8045538, -1.551431, 0, 1, 0.3333333, 1,
-0.2595161, -1.274276, -1.923811, 0, 1, 0.3411765, 1,
-0.2582727, -0.2493729, -3.02794, 0, 1, 0.345098, 1,
-0.2572688, 1.303855, -1.467165, 0, 1, 0.3529412, 1,
-0.2568885, -0.473867, -4.15901, 0, 1, 0.3568628, 1,
-0.2539335, -0.7406496, -1.611722, 0, 1, 0.3647059, 1,
-0.2536643, -0.2613149, -1.438701, 0, 1, 0.3686275, 1,
-0.2515437, 0.6611183, 1.431777, 0, 1, 0.3764706, 1,
-0.2496838, -0.466594, -0.8362365, 0, 1, 0.3803922, 1,
-0.2466382, 0.1342387, -0.9644696, 0, 1, 0.3882353, 1,
-0.2463678, 0.5312416, 0.06081369, 0, 1, 0.3921569, 1,
-0.2430739, -0.5105879, -0.3548054, 0, 1, 0.4, 1,
-0.2409342, -1.580426, -1.606917, 0, 1, 0.4078431, 1,
-0.2374843, -0.7391564, -3.094072, 0, 1, 0.4117647, 1,
-0.2359839, 0.4536942, 0.5457557, 0, 1, 0.4196078, 1,
-0.2337627, -0.3080907, -2.796384, 0, 1, 0.4235294, 1,
-0.2337007, -0.7836236, -4.720209, 0, 1, 0.4313726, 1,
-0.2327191, 0.593645, 0.140044, 0, 1, 0.4352941, 1,
-0.2305479, 2.405184, 0.7609919, 0, 1, 0.4431373, 1,
-0.2268108, 1.064375, 0.4862066, 0, 1, 0.4470588, 1,
-0.2231022, -0.155292, -2.039062, 0, 1, 0.454902, 1,
-0.2213394, 0.7690955, -0.5869059, 0, 1, 0.4588235, 1,
-0.2209195, 0.08048736, -3.155077, 0, 1, 0.4666667, 1,
-0.2208222, -0.6851198, -2.193941, 0, 1, 0.4705882, 1,
-0.2193044, 0.3682835, -2.604031, 0, 1, 0.4784314, 1,
-0.2173329, -0.1308081, -1.668896, 0, 1, 0.4823529, 1,
-0.2162188, -0.04521266, -2.260221, 0, 1, 0.4901961, 1,
-0.2159007, -0.08252812, -0.8664973, 0, 1, 0.4941176, 1,
-0.2109602, 2.200428, 1.268275, 0, 1, 0.5019608, 1,
-0.209954, 0.7918525, 0.3735518, 0, 1, 0.509804, 1,
-0.2061445, -1.265535, -2.064528, 0, 1, 0.5137255, 1,
-0.2050191, 1.296123, -0.8798725, 0, 1, 0.5215687, 1,
-0.2041338, -0.6736544, -2.338896, 0, 1, 0.5254902, 1,
-0.2031069, 1.696233, -0.8421192, 0, 1, 0.5333334, 1,
-0.2012379, -0.0701835, -2.309745, 0, 1, 0.5372549, 1,
-0.1987288, 0.722101, 0.09058118, 0, 1, 0.5450981, 1,
-0.1922729, 0.04976704, -0.7930025, 0, 1, 0.5490196, 1,
-0.1814407, -0.3963847, -3.048005, 0, 1, 0.5568628, 1,
-0.1801478, 1.110441, -1.119609, 0, 1, 0.5607843, 1,
-0.179945, -0.09812491, -0.9050229, 0, 1, 0.5686275, 1,
-0.1746553, -1.823041, -3.933477, 0, 1, 0.572549, 1,
-0.172445, -1.119064, -3.331154, 0, 1, 0.5803922, 1,
-0.1714381, -0.06979901, -1.055706, 0, 1, 0.5843138, 1,
-0.1680661, 1.064755, -0.7866843, 0, 1, 0.5921569, 1,
-0.1679797, -0.6211242, -3.183027, 0, 1, 0.5960785, 1,
-0.1675983, 1.444996, -0.7757366, 0, 1, 0.6039216, 1,
-0.1675509, -1.368114, -2.432822, 0, 1, 0.6117647, 1,
-0.1657056, 0.1151131, -0.8013204, 0, 1, 0.6156863, 1,
-0.1440105, -1.051527, -3.275299, 0, 1, 0.6235294, 1,
-0.1433489, 0.3566868, -0.3584453, 0, 1, 0.627451, 1,
-0.1370245, -0.396452, -1.999776, 0, 1, 0.6352941, 1,
-0.1366533, 1.434259, -0.1294268, 0, 1, 0.6392157, 1,
-0.1315623, -1.103604, -2.599762, 0, 1, 0.6470588, 1,
-0.1234262, -0.007169385, -1.998244, 0, 1, 0.6509804, 1,
-0.1224325, 0.5029293, 0.2846299, 0, 1, 0.6588235, 1,
-0.1180898, -0.6718975, -1.804518, 0, 1, 0.6627451, 1,
-0.1147637, -2.50743, -2.291929, 0, 1, 0.6705883, 1,
-0.1146025, 1.814964, 1.134298, 0, 1, 0.6745098, 1,
-0.1136803, 0.4172105, -0.783654, 0, 1, 0.682353, 1,
-0.1090725, -2.244607, -2.166602, 0, 1, 0.6862745, 1,
-0.106818, 0.6727799, -0.3754975, 0, 1, 0.6941177, 1,
-0.1040958, 0.1138786, -0.717302, 0, 1, 0.7019608, 1,
-0.102794, -0.9073913, -2.067481, 0, 1, 0.7058824, 1,
-0.1023301, 0.3938055, -0.2781653, 0, 1, 0.7137255, 1,
-0.09768955, -0.4872949, -3.386904, 0, 1, 0.7176471, 1,
-0.09492978, 1.421509, -0.262255, 0, 1, 0.7254902, 1,
-0.09465993, -0.6238812, -4.275184, 0, 1, 0.7294118, 1,
-0.09181483, -0.09416869, -2.832787, 0, 1, 0.7372549, 1,
-0.09119572, -0.4063539, -4.366214, 0, 1, 0.7411765, 1,
-0.08845019, 0.2371936, -2.649426, 0, 1, 0.7490196, 1,
-0.08714048, -0.08208515, -0.9158835, 0, 1, 0.7529412, 1,
-0.0866463, 0.3259872, -1.740592, 0, 1, 0.7607843, 1,
-0.08442621, -0.9859125, -3.416397, 0, 1, 0.7647059, 1,
-0.08275367, -0.06266358, -1.985419, 0, 1, 0.772549, 1,
-0.07993201, -1.158007, -4.522216, 0, 1, 0.7764706, 1,
-0.07803354, 0.5444242, 1.349021, 0, 1, 0.7843137, 1,
-0.07398949, -0.04021529, -1.843583, 0, 1, 0.7882353, 1,
-0.07216174, 0.1989291, -0.4301812, 0, 1, 0.7960784, 1,
-0.06964922, -0.8802947, -3.295143, 0, 1, 0.8039216, 1,
-0.06277623, -0.803443, -2.691118, 0, 1, 0.8078431, 1,
-0.0611934, -1.1329, -3.48907, 0, 1, 0.8156863, 1,
-0.0610344, 0.3710111, -1.557217, 0, 1, 0.8196079, 1,
-0.05638945, 0.5616309, -1.105645, 0, 1, 0.827451, 1,
-0.0539057, -0.6432183, -2.058447, 0, 1, 0.8313726, 1,
-0.04885905, -1.728205, -1.185972, 0, 1, 0.8392157, 1,
-0.04885365, 3.052843, 0.7124885, 0, 1, 0.8431373, 1,
-0.04395948, 0.05709175, -0.9605386, 0, 1, 0.8509804, 1,
-0.03755106, -1.058224, -3.582614, 0, 1, 0.854902, 1,
-0.03490686, -0.5610399, -2.303591, 0, 1, 0.8627451, 1,
-0.03389655, 1.168362, 0.5767223, 0, 1, 0.8666667, 1,
-0.03136179, -0.775683, -1.813017, 0, 1, 0.8745098, 1,
-0.02787838, -0.5715332, -1.737663, 0, 1, 0.8784314, 1,
-0.02745636, -0.2077685, -3.920591, 0, 1, 0.8862745, 1,
-0.02727941, 0.01928178, -0.7898826, 0, 1, 0.8901961, 1,
-0.02418667, 0.09917289, -0.6274326, 0, 1, 0.8980392, 1,
-0.02297027, -0.7346854, -2.222165, 0, 1, 0.9058824, 1,
-0.01405942, -0.3298633, -3.01408, 0, 1, 0.9098039, 1,
-0.01357674, -0.9066274, -3.205343, 0, 1, 0.9176471, 1,
-0.01238817, 0.9956968, 0.1526054, 0, 1, 0.9215686, 1,
-0.0122681, 1.001117, -1.017826, 0, 1, 0.9294118, 1,
-0.01217236, 0.05207397, -1.607175, 0, 1, 0.9333333, 1,
-0.006641603, -0.4970392, -1.933635, 0, 1, 0.9411765, 1,
-0.003541243, -1.717997, -2.251342, 0, 1, 0.945098, 1,
-0.000447269, 0.9168743, 1.189258, 0, 1, 0.9529412, 1,
0.00441679, 0.1942905, 1.030576, 0, 1, 0.9568627, 1,
0.005533854, -0.5908841, 1.938157, 0, 1, 0.9647059, 1,
0.01263219, -0.368836, 2.594544, 0, 1, 0.9686275, 1,
0.02091189, -0.1014601, 3.185838, 0, 1, 0.9764706, 1,
0.02516796, 1.278678, 0.6328141, 0, 1, 0.9803922, 1,
0.02701202, 0.8408824, 0.5742035, 0, 1, 0.9882353, 1,
0.02953016, -0.5775261, 2.674732, 0, 1, 0.9921569, 1,
0.03124006, -0.3682058, 3.359295, 0, 1, 1, 1,
0.03402074, 1.344272, 0.08292481, 0, 0.9921569, 1, 1,
0.03810113, 0.04835341, 1.144359, 0, 0.9882353, 1, 1,
0.03925831, 0.383569, 0.6175952, 0, 0.9803922, 1, 1,
0.0400444, 0.519517, -1.255095, 0, 0.9764706, 1, 1,
0.04192708, -0.9109463, 2.681474, 0, 0.9686275, 1, 1,
0.04800505, -0.191774, 4.849672, 0, 0.9647059, 1, 1,
0.05365233, -1.111361, 2.396933, 0, 0.9568627, 1, 1,
0.05381249, -1.076039, 3.175539, 0, 0.9529412, 1, 1,
0.05441572, -0.7990645, 2.992665, 0, 0.945098, 1, 1,
0.06564502, 0.2380415, 1.790042, 0, 0.9411765, 1, 1,
0.07539862, -0.7659269, 3.38294, 0, 0.9333333, 1, 1,
0.07892148, -0.05004553, 1.230949, 0, 0.9294118, 1, 1,
0.08037309, 0.01082412, 0.8596169, 0, 0.9215686, 1, 1,
0.08636986, 0.1664188, 0.2812879, 0, 0.9176471, 1, 1,
0.08719395, 0.5744433, -0.1548988, 0, 0.9098039, 1, 1,
0.08761723, -0.14281, 2.507282, 0, 0.9058824, 1, 1,
0.08964337, 1.192528, 0.2163574, 0, 0.8980392, 1, 1,
0.08984436, 0.7800984, 0.121546, 0, 0.8901961, 1, 1,
0.09268631, 0.3153217, -1.080044, 0, 0.8862745, 1, 1,
0.09942334, -1.410768, 2.717406, 0, 0.8784314, 1, 1,
0.1022451, 2.080654, 0.1757154, 0, 0.8745098, 1, 1,
0.1043551, 0.04431865, 0.6724415, 0, 0.8666667, 1, 1,
0.1096525, -0.5252795, 2.284925, 0, 0.8627451, 1, 1,
0.1103166, 0.1526577, 0.8166516, 0, 0.854902, 1, 1,
0.1146901, 0.04179745, 2.081939, 0, 0.8509804, 1, 1,
0.1174188, 0.9449468, 1.064088, 0, 0.8431373, 1, 1,
0.119361, -1.797077, 2.743131, 0, 0.8392157, 1, 1,
0.1202261, 1.832132, -0.5666013, 0, 0.8313726, 1, 1,
0.1228299, -0.5138502, 2.604344, 0, 0.827451, 1, 1,
0.1229375, 0.9146737, -1.496299, 0, 0.8196079, 1, 1,
0.1231835, 1.175618, 1.248192, 0, 0.8156863, 1, 1,
0.1255064, 1.038762, -1.213328, 0, 0.8078431, 1, 1,
0.1295161, 0.2465056, 1.031649, 0, 0.8039216, 1, 1,
0.1300908, 0.1379717, 2.386365, 0, 0.7960784, 1, 1,
0.1333487, 0.4375041, -0.004651378, 0, 0.7882353, 1, 1,
0.1400586, 0.06437799, -0.2911881, 0, 0.7843137, 1, 1,
0.140406, -0.301411, 3.843407, 0, 0.7764706, 1, 1,
0.1428119, 0.5061635, 1.331164, 0, 0.772549, 1, 1,
0.1460335, -0.3376773, 3.888272, 0, 0.7647059, 1, 1,
0.1462082, -0.2986045, 3.770295, 0, 0.7607843, 1, 1,
0.148391, -0.9489643, 0.2307239, 0, 0.7529412, 1, 1,
0.1574955, -0.3410326, 1.463987, 0, 0.7490196, 1, 1,
0.1581419, 0.6732664, 1.816724, 0, 0.7411765, 1, 1,
0.159894, -1.356947, 1.731366, 0, 0.7372549, 1, 1,
0.162792, 1.634358, -0.3662354, 0, 0.7294118, 1, 1,
0.1645584, 0.8089297, -0.1470651, 0, 0.7254902, 1, 1,
0.165343, -0.5959833, 2.810585, 0, 0.7176471, 1, 1,
0.1691727, 1.005568, -0.3512854, 0, 0.7137255, 1, 1,
0.1744926, 0.07472411, 2.160022, 0, 0.7058824, 1, 1,
0.1843904, -1.471587, 2.179199, 0, 0.6980392, 1, 1,
0.1850747, 0.2463821, -1.261248, 0, 0.6941177, 1, 1,
0.190858, -0.7509884, 2.351731, 0, 0.6862745, 1, 1,
0.1928007, -1.476592, 3.00692, 0, 0.682353, 1, 1,
0.1962899, 0.6936258, 2.29039, 0, 0.6745098, 1, 1,
0.1969132, -0.4726561, 3.640228, 0, 0.6705883, 1, 1,
0.1977308, -1.174961, 4.434145, 0, 0.6627451, 1, 1,
0.2015671, 1.706488, -1.204245, 0, 0.6588235, 1, 1,
0.2020831, -1.044016, 3.594491, 0, 0.6509804, 1, 1,
0.2049103, 0.5863714, 0.4227465, 0, 0.6470588, 1, 1,
0.206081, -1.012201, 3.001429, 0, 0.6392157, 1, 1,
0.2079793, 0.2446564, 1.208481, 0, 0.6352941, 1, 1,
0.2087109, -1.597994, 1.396789, 0, 0.627451, 1, 1,
0.2106119, -0.7545826, 2.114912, 0, 0.6235294, 1, 1,
0.212119, 0.1461717, 1.148603, 0, 0.6156863, 1, 1,
0.2143759, -1.412896, 1.820638, 0, 0.6117647, 1, 1,
0.2148959, 2.39394, -0.1013878, 0, 0.6039216, 1, 1,
0.2157578, 1.065911, -0.7361686, 0, 0.5960785, 1, 1,
0.2187071, 1.321945, 0.2118782, 0, 0.5921569, 1, 1,
0.2190603, 0.6450177, 0.3757926, 0, 0.5843138, 1, 1,
0.2197029, 1.018044, 0.6944473, 0, 0.5803922, 1, 1,
0.2205172, -0.3221545, 3.689037, 0, 0.572549, 1, 1,
0.220798, -0.7481588, 3.90927, 0, 0.5686275, 1, 1,
0.222757, -0.08545458, 1.886592, 0, 0.5607843, 1, 1,
0.2317289, -0.01758835, 1.654812, 0, 0.5568628, 1, 1,
0.234612, -0.4583506, 1.376925, 0, 0.5490196, 1, 1,
0.2365395, 1.26604, 1.670072, 0, 0.5450981, 1, 1,
0.2382665, -0.5657618, 1.238857, 0, 0.5372549, 1, 1,
0.2431189, -0.06025562, 0.9481511, 0, 0.5333334, 1, 1,
0.243282, -0.7394766, 1.631408, 0, 0.5254902, 1, 1,
0.243366, 0.9704988, 0.1970746, 0, 0.5215687, 1, 1,
0.2440906, 0.6312153, 1.101379, 0, 0.5137255, 1, 1,
0.2465724, -0.3507407, 2.747928, 0, 0.509804, 1, 1,
0.2477978, -0.6632756, 3.218101, 0, 0.5019608, 1, 1,
0.2553523, -1.033941, 3.872059, 0, 0.4941176, 1, 1,
0.2593199, 1.09132, 0.9149545, 0, 0.4901961, 1, 1,
0.2617828, 1.557564, -0.1536093, 0, 0.4823529, 1, 1,
0.2628701, 1.252206, -0.6240059, 0, 0.4784314, 1, 1,
0.2643069, -0.6697755, 2.262366, 0, 0.4705882, 1, 1,
0.2644673, -0.2212292, 1.133437, 0, 0.4666667, 1, 1,
0.2656553, 0.2181499, 1.087859, 0, 0.4588235, 1, 1,
0.2678177, 0.5043655, 1.082554, 0, 0.454902, 1, 1,
0.2694224, 0.04736546, 0.1446075, 0, 0.4470588, 1, 1,
0.2716837, -0.8094246, 1.928187, 0, 0.4431373, 1, 1,
0.2755972, -0.6453236, 1.690264, 0, 0.4352941, 1, 1,
0.2807488, -0.6653316, 3.370085, 0, 0.4313726, 1, 1,
0.2807869, -1.383251, 1.289091, 0, 0.4235294, 1, 1,
0.2825203, 0.3448563, 1.237141, 0, 0.4196078, 1, 1,
0.2837433, 0.7794193, 0.3242276, 0, 0.4117647, 1, 1,
0.2842134, 2.049165, -0.1550352, 0, 0.4078431, 1, 1,
0.2861267, -0.1474148, 2.81467, 0, 0.4, 1, 1,
0.291195, 0.269214, 0.2963917, 0, 0.3921569, 1, 1,
0.2938603, -1.071942, 2.259582, 0, 0.3882353, 1, 1,
0.2949131, 0.3316066, 1.363116, 0, 0.3803922, 1, 1,
0.2957351, -0.1164512, 1.903727, 0, 0.3764706, 1, 1,
0.2960751, 0.4006265, -0.5672043, 0, 0.3686275, 1, 1,
0.2965183, -0.463281, 2.591115, 0, 0.3647059, 1, 1,
0.2989642, -0.8770174, 3.52299, 0, 0.3568628, 1, 1,
0.3012844, 0.4096088, -0.1105769, 0, 0.3529412, 1, 1,
0.3030452, 0.5985128, 1.3881, 0, 0.345098, 1, 1,
0.3045616, 1.356921, -1.467929, 0, 0.3411765, 1, 1,
0.3058748, 0.427851, -1.614931, 0, 0.3333333, 1, 1,
0.308058, -0.9795091, 3.553725, 0, 0.3294118, 1, 1,
0.3082319, -0.4596035, 1.099487, 0, 0.3215686, 1, 1,
0.3152207, 2.090441, -1.099186, 0, 0.3176471, 1, 1,
0.3167615, 1.798222, 0.6746067, 0, 0.3098039, 1, 1,
0.3201101, 2.649436, -1.567476, 0, 0.3058824, 1, 1,
0.3224643, 1.432618, -0.5136355, 0, 0.2980392, 1, 1,
0.3295417, -0.3453836, 1.357781, 0, 0.2901961, 1, 1,
0.3311727, 0.7400035, -1.221766, 0, 0.2862745, 1, 1,
0.3359807, 1.020788, -0.9181373, 0, 0.2784314, 1, 1,
0.3360275, 0.978362, 1.105922, 0, 0.2745098, 1, 1,
0.3375846, -1.299047, 3.604696, 0, 0.2666667, 1, 1,
0.3422183, -0.4715325, 2.803246, 0, 0.2627451, 1, 1,
0.3428749, 0.01700073, 0.1624578, 0, 0.254902, 1, 1,
0.3448364, -0.0343212, 1.581366, 0, 0.2509804, 1, 1,
0.3453082, -0.3269381, 1.712748, 0, 0.2431373, 1, 1,
0.348132, 2.038734, -1.1443, 0, 0.2392157, 1, 1,
0.3510814, -0.1364893, 3.530202, 0, 0.2313726, 1, 1,
0.3530549, 1.094457, 0.2659289, 0, 0.227451, 1, 1,
0.3649416, -0.9451602, 2.552554, 0, 0.2196078, 1, 1,
0.3695182, 0.06381068, 0.08710577, 0, 0.2156863, 1, 1,
0.378818, -0.0785483, 0.7227811, 0, 0.2078431, 1, 1,
0.3811094, 0.2730134, 0.9556234, 0, 0.2039216, 1, 1,
0.3811521, -0.8516667, 3.526964, 0, 0.1960784, 1, 1,
0.3861038, -0.1036402, -0.003749962, 0, 0.1882353, 1, 1,
0.3867115, -0.01633539, 2.308961, 0, 0.1843137, 1, 1,
0.3908174, 0.0009399038, 0.2529944, 0, 0.1764706, 1, 1,
0.3935014, 0.06099498, 1.338966, 0, 0.172549, 1, 1,
0.3944024, 1.61292, 0.1006918, 0, 0.1647059, 1, 1,
0.3970412, 0.2285678, 0.4005364, 0, 0.1607843, 1, 1,
0.3976025, 1.340748, -0.3670003, 0, 0.1529412, 1, 1,
0.4002638, 1.611548, 0.2208358, 0, 0.1490196, 1, 1,
0.4096488, 1.099079, 0.3942755, 0, 0.1411765, 1, 1,
0.4195139, -0.2197583, 3.126787, 0, 0.1372549, 1, 1,
0.4201407, 0.6865032, 1.217889, 0, 0.1294118, 1, 1,
0.421048, -0.7831137, 1.459414, 0, 0.1254902, 1, 1,
0.4333974, 1.08158, 0.376767, 0, 0.1176471, 1, 1,
0.4334079, -1.662624, 5.648046, 0, 0.1137255, 1, 1,
0.4377986, -0.5397764, 3.369981, 0, 0.1058824, 1, 1,
0.4390201, 0.2691875, 1.124971, 0, 0.09803922, 1, 1,
0.4403953, -0.8812506, 2.122237, 0, 0.09411765, 1, 1,
0.4407408, 0.8492048, 0.02067355, 0, 0.08627451, 1, 1,
0.4417318, -0.9637662, 2.995091, 0, 0.08235294, 1, 1,
0.4506012, -0.3923256, 2.912667, 0, 0.07450981, 1, 1,
0.4538032, 0.5220406, 1.305655, 0, 0.07058824, 1, 1,
0.4578608, -2.18692, 2.960192, 0, 0.0627451, 1, 1,
0.459752, -0.8158581, 2.099412, 0, 0.05882353, 1, 1,
0.4603194, 1.195768, 1.075306, 0, 0.05098039, 1, 1,
0.463414, -2.014599, 2.949151, 0, 0.04705882, 1, 1,
0.4676144, 0.33377, 1.76145, 0, 0.03921569, 1, 1,
0.4759584, -1.093528, 2.655304, 0, 0.03529412, 1, 1,
0.4804136, -0.5096263, 1.543453, 0, 0.02745098, 1, 1,
0.4832186, 0.5738742, -0.4232758, 0, 0.02352941, 1, 1,
0.4847561, -0.3225628, 0.8100184, 0, 0.01568628, 1, 1,
0.4884791, 0.3939995, 0.8592126, 0, 0.01176471, 1, 1,
0.4886774, -1.684911, 1.451328, 0, 0.003921569, 1, 1,
0.4895552, 0.4332561, 2.140001, 0.003921569, 0, 1, 1,
0.4907001, 1.341176, 2.048565, 0.007843138, 0, 1, 1,
0.4948648, -0.08609649, 2.078556, 0.01568628, 0, 1, 1,
0.4960766, -2.710487, 2.798839, 0.01960784, 0, 1, 1,
0.4966558, -0.3728084, 2.367211, 0.02745098, 0, 1, 1,
0.4977896, -0.7941391, 4.31492, 0.03137255, 0, 1, 1,
0.4981945, -0.3340721, 2.64504, 0.03921569, 0, 1, 1,
0.5009444, -0.2678451, 1.863511, 0.04313726, 0, 1, 1,
0.504259, -0.5432137, 0.6258635, 0.05098039, 0, 1, 1,
0.5052653, 1.240078, 1.531231, 0.05490196, 0, 1, 1,
0.5070634, -1.390835, 2.942587, 0.0627451, 0, 1, 1,
0.5070863, 0.3602728, 3.043478, 0.06666667, 0, 1, 1,
0.5090511, 0.5688021, 1.694331, 0.07450981, 0, 1, 1,
0.5105304, 0.1745342, 1.858367, 0.07843138, 0, 1, 1,
0.5105334, -0.4983159, 3.668989, 0.08627451, 0, 1, 1,
0.5151258, 1.73606, 0.4715041, 0.09019608, 0, 1, 1,
0.5171048, 0.1224508, 1.924147, 0.09803922, 0, 1, 1,
0.522206, -0.7870746, 3.6457, 0.1058824, 0, 1, 1,
0.5242958, 0.9251931, 0.09014431, 0.1098039, 0, 1, 1,
0.524618, -1.108662, 3.31052, 0.1176471, 0, 1, 1,
0.5324808, -0.05783539, 3.569025, 0.1215686, 0, 1, 1,
0.5351016, -0.5650066, 2.536813, 0.1294118, 0, 1, 1,
0.535509, -1.649611, 2.576711, 0.1333333, 0, 1, 1,
0.5454913, 1.126307, -0.4013493, 0.1411765, 0, 1, 1,
0.5511404, -0.3308954, 1.84593, 0.145098, 0, 1, 1,
0.5514444, 0.5102767, 0.4241224, 0.1529412, 0, 1, 1,
0.5601261, -0.8363899, 1.591444, 0.1568628, 0, 1, 1,
0.5611361, -0.4181314, 3.522181, 0.1647059, 0, 1, 1,
0.5626138, -0.929085, 3.432612, 0.1686275, 0, 1, 1,
0.5661882, 0.7993237, 0.8640224, 0.1764706, 0, 1, 1,
0.566624, 0.359695, 1.438566, 0.1803922, 0, 1, 1,
0.5676028, 0.5517008, -0.2448842, 0.1882353, 0, 1, 1,
0.5703418, -0.4085019, 3.364602, 0.1921569, 0, 1, 1,
0.5704787, -1.019561, 2.009747, 0.2, 0, 1, 1,
0.5704878, 1.409118, 1.231302, 0.2078431, 0, 1, 1,
0.5711931, 0.7357335, 1.278116, 0.2117647, 0, 1, 1,
0.5731673, 1.570302, 0.2498277, 0.2196078, 0, 1, 1,
0.573707, -0.1767375, 1.008554, 0.2235294, 0, 1, 1,
0.5755039, -0.1611026, 1.488527, 0.2313726, 0, 1, 1,
0.5807715, 0.6256368, 0.05591471, 0.2352941, 0, 1, 1,
0.5830666, -0.1216, 2.218451, 0.2431373, 0, 1, 1,
0.5835821, 0.6416324, 1.411237, 0.2470588, 0, 1, 1,
0.5931126, -1.947281, 2.23106, 0.254902, 0, 1, 1,
0.5933683, -1.729269, 2.911566, 0.2588235, 0, 1, 1,
0.6057225, -1.308479, 3.387923, 0.2666667, 0, 1, 1,
0.607284, -0.2449127, 4.258497, 0.2705882, 0, 1, 1,
0.6073939, -0.5897052, 0.9463034, 0.2784314, 0, 1, 1,
0.6104428, -1.773723, 3.881692, 0.282353, 0, 1, 1,
0.6125976, -0.2025921, 3.502528, 0.2901961, 0, 1, 1,
0.6131463, -0.3340179, 2.190929, 0.2941177, 0, 1, 1,
0.6194839, -0.6968634, 2.549171, 0.3019608, 0, 1, 1,
0.6220243, -1.878564, 2.375114, 0.3098039, 0, 1, 1,
0.6231519, 0.1015927, 1.539917, 0.3137255, 0, 1, 1,
0.6234673, 1.333717, 0.1100031, 0.3215686, 0, 1, 1,
0.6252586, 0.140302, 0.4350227, 0.3254902, 0, 1, 1,
0.6259587, 0.4732056, 1.707539, 0.3333333, 0, 1, 1,
0.6264533, -0.9112369, 2.237459, 0.3372549, 0, 1, 1,
0.6297479, -0.6135536, 2.371269, 0.345098, 0, 1, 1,
0.6337994, -0.2988586, 0.2174488, 0.3490196, 0, 1, 1,
0.6348556, 0.1424641, 0.8119372, 0.3568628, 0, 1, 1,
0.6349799, -0.3582659, 3.469246, 0.3607843, 0, 1, 1,
0.6350863, -2.007586, 3.46911, 0.3686275, 0, 1, 1,
0.6358874, 0.3276664, 3.05539, 0.372549, 0, 1, 1,
0.6407689, 0.2090128, 1.127771, 0.3803922, 0, 1, 1,
0.6432092, 1.070212, -0.1038196, 0.3843137, 0, 1, 1,
0.6467764, 0.3195373, 1.409536, 0.3921569, 0, 1, 1,
0.6491712, -1.149578, 1.009534, 0.3960784, 0, 1, 1,
0.6516204, -0.4991774, 1.748273, 0.4039216, 0, 1, 1,
0.6533344, -0.7707646, 4.046849, 0.4117647, 0, 1, 1,
0.6533784, 1.11795, -0.4892193, 0.4156863, 0, 1, 1,
0.6536795, -0.9216916, 2.102615, 0.4235294, 0, 1, 1,
0.6622103, 0.9442328, 0.7112094, 0.427451, 0, 1, 1,
0.6658278, 0.222885, 1.216541, 0.4352941, 0, 1, 1,
0.6661087, -0.4916105, 2.262806, 0.4392157, 0, 1, 1,
0.6697888, 0.6922083, -0.8193361, 0.4470588, 0, 1, 1,
0.6744277, -0.3354629, 1.041302, 0.4509804, 0, 1, 1,
0.6862045, -0.5855898, 1.112956, 0.4588235, 0, 1, 1,
0.6869068, -2.538898, 1.922705, 0.4627451, 0, 1, 1,
0.6870776, -0.9997486, 2.25287, 0.4705882, 0, 1, 1,
0.6871943, 0.4212113, -1.702617, 0.4745098, 0, 1, 1,
0.6878574, -1.403415, 3.117791, 0.4823529, 0, 1, 1,
0.6884897, -0.6812363, 1.85813, 0.4862745, 0, 1, 1,
0.6889692, -1.241664, 2.657237, 0.4941176, 0, 1, 1,
0.7027358, -0.1148232, 0.9769827, 0.5019608, 0, 1, 1,
0.7056208, -1.618018, 2.055242, 0.5058824, 0, 1, 1,
0.7060253, 1.628059, 3.028476, 0.5137255, 0, 1, 1,
0.7086684, -1.821481, 4.366243, 0.5176471, 0, 1, 1,
0.7088338, 0.2858216, 1.387471, 0.5254902, 0, 1, 1,
0.7157627, 0.00296486, 1.403447, 0.5294118, 0, 1, 1,
0.7158058, 1.699671, 2.099226, 0.5372549, 0, 1, 1,
0.7199351, 0.4951407, 0.1178812, 0.5411765, 0, 1, 1,
0.7258401, -1.009403, 2.721797, 0.5490196, 0, 1, 1,
0.7259238, 0.1957525, 0.2509546, 0.5529412, 0, 1, 1,
0.7264351, 0.7341714, -0.2521166, 0.5607843, 0, 1, 1,
0.7280278, -1.100047, 2.1685, 0.5647059, 0, 1, 1,
0.73092, 0.2421946, 1.071236, 0.572549, 0, 1, 1,
0.7338106, 0.6132292, 0.08546354, 0.5764706, 0, 1, 1,
0.7424257, -1.183144, 2.584759, 0.5843138, 0, 1, 1,
0.7459232, 1.05371, 0.8581659, 0.5882353, 0, 1, 1,
0.7492111, -0.1136967, 2.703003, 0.5960785, 0, 1, 1,
0.7520734, 1.207476, 0.9015875, 0.6039216, 0, 1, 1,
0.7525845, -1.450357, 1.05794, 0.6078432, 0, 1, 1,
0.7532602, 1.022201, 2.268663, 0.6156863, 0, 1, 1,
0.7566617, 0.2932321, 1.885895, 0.6196079, 0, 1, 1,
0.757753, -0.7376972, 1.555424, 0.627451, 0, 1, 1,
0.7591091, -0.8104519, 0.4958512, 0.6313726, 0, 1, 1,
0.7592494, 1.297102, -0.785722, 0.6392157, 0, 1, 1,
0.7615768, 2.156532, 0.7620501, 0.6431373, 0, 1, 1,
0.7670923, 0.2621812, 0.3741245, 0.6509804, 0, 1, 1,
0.7683434, -0.3755629, 3.393971, 0.654902, 0, 1, 1,
0.7700103, -2.49479, 2.647684, 0.6627451, 0, 1, 1,
0.7769325, 0.2154833, 2.654479, 0.6666667, 0, 1, 1,
0.7779261, 1.054493, -0.2536631, 0.6745098, 0, 1, 1,
0.7793079, -0.3517412, 1.230993, 0.6784314, 0, 1, 1,
0.7825745, 0.1494831, 1.827253, 0.6862745, 0, 1, 1,
0.7838433, -0.9272874, 3.420474, 0.6901961, 0, 1, 1,
0.7842792, -0.3097338, 0.8020954, 0.6980392, 0, 1, 1,
0.7874491, -0.09605778, 0.3844999, 0.7058824, 0, 1, 1,
0.7953803, 0.6837196, 1.969885, 0.7098039, 0, 1, 1,
0.7978869, 0.1527553, -0.3459249, 0.7176471, 0, 1, 1,
0.8001513, -0.3280149, 1.563024, 0.7215686, 0, 1, 1,
0.8006908, 0.424986, -0.4569766, 0.7294118, 0, 1, 1,
0.8027911, -0.5762982, 1.176299, 0.7333333, 0, 1, 1,
0.8062624, -0.5137953, 1.220219, 0.7411765, 0, 1, 1,
0.807514, 0.3233917, -0.8900328, 0.7450981, 0, 1, 1,
0.8189995, 2.162968, 0.6048906, 0.7529412, 0, 1, 1,
0.8256515, -0.2449495, 1.469965, 0.7568628, 0, 1, 1,
0.8266432, 0.9900755, 0.6351157, 0.7647059, 0, 1, 1,
0.8315631, 0.9076747, 0.7109632, 0.7686275, 0, 1, 1,
0.8338956, 0.2885853, 0.4479144, 0.7764706, 0, 1, 1,
0.8360449, -1.064996, 4.987471, 0.7803922, 0, 1, 1,
0.8458619, 1.96569, -1.003576, 0.7882353, 0, 1, 1,
0.8479066, 1.139519, 0.9464631, 0.7921569, 0, 1, 1,
0.8494856, 0.1576858, 1.651332, 0.8, 0, 1, 1,
0.8585265, 0.01699818, 1.856686, 0.8078431, 0, 1, 1,
0.8604632, 1.273577, 0.4856322, 0.8117647, 0, 1, 1,
0.8673003, -0.7123533, 0.8019438, 0.8196079, 0, 1, 1,
0.8758858, 0.2201783, 0.9228578, 0.8235294, 0, 1, 1,
0.878908, 0.3213507, 1.048257, 0.8313726, 0, 1, 1,
0.8846773, 0.3368382, 1.833761, 0.8352941, 0, 1, 1,
0.8896615, 1.16857, -1.235758, 0.8431373, 0, 1, 1,
0.8922108, 0.7616671, 0.6801661, 0.8470588, 0, 1, 1,
0.8951902, 0.4508071, 2.215478, 0.854902, 0, 1, 1,
0.8996316, 0.2449709, 2.460073, 0.8588235, 0, 1, 1,
0.9030528, 0.1726191, 0.9992989, 0.8666667, 0, 1, 1,
0.913298, 0.05097177, 2.156508, 0.8705882, 0, 1, 1,
0.9133871, -0.3586612, 1.612787, 0.8784314, 0, 1, 1,
0.9170986, 0.627712, -0.05249773, 0.8823529, 0, 1, 1,
0.9189768, -0.6583893, 4.317858, 0.8901961, 0, 1, 1,
0.9195642, 0.2103386, 0.7603616, 0.8941177, 0, 1, 1,
0.9224655, 0.1655578, 0.913846, 0.9019608, 0, 1, 1,
0.9236023, -2.105724, 3.148068, 0.9098039, 0, 1, 1,
0.9322297, -2.521571, 1.797221, 0.9137255, 0, 1, 1,
0.9396055, -1.485456, 3.231339, 0.9215686, 0, 1, 1,
0.9517615, 0.6400079, -0.4745421, 0.9254902, 0, 1, 1,
0.9536097, -0.1924213, 2.780891, 0.9333333, 0, 1, 1,
0.9539344, -0.545313, 2.28846, 0.9372549, 0, 1, 1,
0.9543023, 0.3955004, 0.3395524, 0.945098, 0, 1, 1,
0.9552783, -1.854682, 2.064001, 0.9490196, 0, 1, 1,
0.9569836, -0.1232237, 0.7856184, 0.9568627, 0, 1, 1,
0.9657308, 0.7676388, -0.2735899, 0.9607843, 0, 1, 1,
0.9769428, -1.62455, 4.032517, 0.9686275, 0, 1, 1,
0.9775569, -0.6979976, 0.6119442, 0.972549, 0, 1, 1,
0.9778719, 0.2486115, 1.161388, 0.9803922, 0, 1, 1,
0.9801766, 0.5663172, 0.6863719, 0.9843137, 0, 1, 1,
0.9809108, -2.036864, 0.5511653, 0.9921569, 0, 1, 1,
0.9901531, 3.387236, -0.07158677, 0.9960784, 0, 1, 1,
0.9905149, -1.133642, 2.166835, 1, 0, 0.9960784, 1,
0.9994531, 1.087624, -0.371781, 1, 0, 0.9882353, 1,
1.001644, 0.3956852, 0.621753, 1, 0, 0.9843137, 1,
1.00777, 0.538682, 2.762788, 1, 0, 0.9764706, 1,
1.010192, -0.01143012, 3.079975, 1, 0, 0.972549, 1,
1.01112, 0.1206315, 2.31194, 1, 0, 0.9647059, 1,
1.012264, -0.723411, 2.031379, 1, 0, 0.9607843, 1,
1.014262, 0.2002295, -0.1565911, 1, 0, 0.9529412, 1,
1.016486, -0.0317068, 2.497258, 1, 0, 0.9490196, 1,
1.017872, -0.5393572, 0.7670604, 1, 0, 0.9411765, 1,
1.018137, 0.8330814, -0.609707, 1, 0, 0.9372549, 1,
1.021153, 1.607826, 2.380939, 1, 0, 0.9294118, 1,
1.025294, -0.4263471, 1.632892, 1, 0, 0.9254902, 1,
1.029294, 0.7756397, 1.865262, 1, 0, 0.9176471, 1,
1.036721, 1.140346, -1.093164, 1, 0, 0.9137255, 1,
1.044643, 1.456457, -0.03830498, 1, 0, 0.9058824, 1,
1.045869, -0.07147835, 1.754642, 1, 0, 0.9019608, 1,
1.049012, -0.04341301, 0.7866217, 1, 0, 0.8941177, 1,
1.051155, 1.877679, 1.489135, 1, 0, 0.8862745, 1,
1.055252, -1.317922, 3.617414, 1, 0, 0.8823529, 1,
1.064189, 1.041144, 1.512491, 1, 0, 0.8745098, 1,
1.069188, 0.3307311, 0.2372903, 1, 0, 0.8705882, 1,
1.079665, 0.5173312, 0.7804117, 1, 0, 0.8627451, 1,
1.081212, 0.1779603, 2.059315, 1, 0, 0.8588235, 1,
1.081692, 0.8015348, 1.327577, 1, 0, 0.8509804, 1,
1.08386, -1.774544, 1.844713, 1, 0, 0.8470588, 1,
1.08393, 0.5374962, -0.3027094, 1, 0, 0.8392157, 1,
1.084691, 1.262177, 1.713753, 1, 0, 0.8352941, 1,
1.087445, 0.9067777, -0.5168992, 1, 0, 0.827451, 1,
1.088561, 1.596701, 0.7621822, 1, 0, 0.8235294, 1,
1.089794, 0.0658883, 2.29544, 1, 0, 0.8156863, 1,
1.089995, -0.4828526, 2.969308, 1, 0, 0.8117647, 1,
1.097395, 1.136305, 0.1949008, 1, 0, 0.8039216, 1,
1.103325, -1.175151, 3.13203, 1, 0, 0.7960784, 1,
1.104697, 0.1071721, 0.4334931, 1, 0, 0.7921569, 1,
1.110395, -0.5640786, 2.359405, 1, 0, 0.7843137, 1,
1.113616, -0.7129645, 0.591065, 1, 0, 0.7803922, 1,
1.119076, -0.3554468, 1.399985, 1, 0, 0.772549, 1,
1.124582, 2.284568, -0.404484, 1, 0, 0.7686275, 1,
1.125161, -0.8341223, 2.621495, 1, 0, 0.7607843, 1,
1.131361, 0.6203374, -0.5721295, 1, 0, 0.7568628, 1,
1.132892, 1.675253, 0.003453238, 1, 0, 0.7490196, 1,
1.135097, 0.1851724, 0.3346937, 1, 0, 0.7450981, 1,
1.148156, 1.270501, 1.410287, 1, 0, 0.7372549, 1,
1.158077, 0.2984269, 1.287817, 1, 0, 0.7333333, 1,
1.160067, 0.3006691, 2.739802, 1, 0, 0.7254902, 1,
1.162331, -0.7894617, 2.56451, 1, 0, 0.7215686, 1,
1.164376, 0.02006304, 0.9253035, 1, 0, 0.7137255, 1,
1.168028, 0.5824013, 0.8818989, 1, 0, 0.7098039, 1,
1.174714, -0.4274601, 2.909475, 1, 0, 0.7019608, 1,
1.181105, 0.5574953, 1.427971, 1, 0, 0.6941177, 1,
1.181305, -1.67362, 1.888211, 1, 0, 0.6901961, 1,
1.181614, -0.1891461, 0.5011125, 1, 0, 0.682353, 1,
1.19963, -0.9635652, 0.6248422, 1, 0, 0.6784314, 1,
1.200974, -0.03050499, 0.7833793, 1, 0, 0.6705883, 1,
1.223517, -0.06153018, 2.853678, 1, 0, 0.6666667, 1,
1.234265, 0.4885181, 0.5950037, 1, 0, 0.6588235, 1,
1.237125, -0.6288158, 1.053555, 1, 0, 0.654902, 1,
1.238663, 1.146097, 2.135703, 1, 0, 0.6470588, 1,
1.241832, 0.1668058, 1.406922, 1, 0, 0.6431373, 1,
1.243584, -0.7392297, 3.444888, 1, 0, 0.6352941, 1,
1.252928, 1.015908, 1.480532, 1, 0, 0.6313726, 1,
1.265263, -2.073077, 2.901725, 1, 0, 0.6235294, 1,
1.277392, -0.3536152, 1.505445, 1, 0, 0.6196079, 1,
1.279958, 1.216612, 1.842349, 1, 0, 0.6117647, 1,
1.281868, -0.09023251, 0.9985152, 1, 0, 0.6078432, 1,
1.286168, 0.108142, 0.2199652, 1, 0, 0.6, 1,
1.288699, 0.09210151, 2.622442, 1, 0, 0.5921569, 1,
1.289328, 0.7299291, 0.9001533, 1, 0, 0.5882353, 1,
1.293673, -1.201515, 2.190563, 1, 0, 0.5803922, 1,
1.299566, -0.26131, 1.19849, 1, 0, 0.5764706, 1,
1.314366, 0.2397126, 0.03134004, 1, 0, 0.5686275, 1,
1.325922, 0.2235077, 1.614898, 1, 0, 0.5647059, 1,
1.331576, -0.08715302, 3.05759, 1, 0, 0.5568628, 1,
1.3368, 0.1842607, 2.709428, 1, 0, 0.5529412, 1,
1.34124, -0.4317858, 1.955015, 1, 0, 0.5450981, 1,
1.344158, -1.751597, 1.839568, 1, 0, 0.5411765, 1,
1.362491, -0.2357594, 3.003214, 1, 0, 0.5333334, 1,
1.362743, 1.30423, -0.1278684, 1, 0, 0.5294118, 1,
1.368377, 0.1373182, 1.541424, 1, 0, 0.5215687, 1,
1.375792, -0.1871046, 2.388491, 1, 0, 0.5176471, 1,
1.376101, 0.5693076, 0.7585291, 1, 0, 0.509804, 1,
1.382312, 1.657452, 0.682247, 1, 0, 0.5058824, 1,
1.383075, 0.6830025, 0.8395741, 1, 0, 0.4980392, 1,
1.388198, 1.18371, -1.277923, 1, 0, 0.4901961, 1,
1.388894, 0.5694951, 0.1266303, 1, 0, 0.4862745, 1,
1.401343, -0.01123158, 1.362423, 1, 0, 0.4784314, 1,
1.403386, 1.86773, 0.6924723, 1, 0, 0.4745098, 1,
1.4041, -1.531072, 3.244805, 1, 0, 0.4666667, 1,
1.406463, -1.317867, 3.089697, 1, 0, 0.4627451, 1,
1.415348, 2.476033, 0.8759682, 1, 0, 0.454902, 1,
1.419287, 0.06368811, 1.628107, 1, 0, 0.4509804, 1,
1.421597, 2.300959, -0.8923054, 1, 0, 0.4431373, 1,
1.427299, -0.9835644, 3.427789, 1, 0, 0.4392157, 1,
1.437004, 1.556197, -1.071147, 1, 0, 0.4313726, 1,
1.454615, -0.5841681, 0.6942724, 1, 0, 0.427451, 1,
1.473411, 0.8093331, 2.144149, 1, 0, 0.4196078, 1,
1.474365, 0.8600848, -0.218371, 1, 0, 0.4156863, 1,
1.474999, -0.1227898, 0.7929726, 1, 0, 0.4078431, 1,
1.486128, 0.2336189, 3.018562, 1, 0, 0.4039216, 1,
1.498239, -1.251659, 4.163143, 1, 0, 0.3960784, 1,
1.506142, -0.9901865, 2.563844, 1, 0, 0.3882353, 1,
1.52402, -0.846539, 2.231152, 1, 0, 0.3843137, 1,
1.533754, -1.533236, 1.613464, 1, 0, 0.3764706, 1,
1.538615, 0.1514836, 0.8656471, 1, 0, 0.372549, 1,
1.546975, 0.3863413, 1.385248, 1, 0, 0.3647059, 1,
1.557267, -0.2141223, 1.943373, 1, 0, 0.3607843, 1,
1.560475, 0.1726492, -0.002636014, 1, 0, 0.3529412, 1,
1.579448, 0.02121968, 0.2850295, 1, 0, 0.3490196, 1,
1.590671, -0.734529, 3.281241, 1, 0, 0.3411765, 1,
1.601096, 0.8423823, 0.9896758, 1, 0, 0.3372549, 1,
1.611011, -0.6830752, 2.236113, 1, 0, 0.3294118, 1,
1.626994, 0.1942579, 0.3680841, 1, 0, 0.3254902, 1,
1.642106, -0.3387697, 2.870884, 1, 0, 0.3176471, 1,
1.677581, 0.3112652, 0.5826105, 1, 0, 0.3137255, 1,
1.683895, -0.4263667, 1.263576, 1, 0, 0.3058824, 1,
1.686327, -0.3160297, 0.1166616, 1, 0, 0.2980392, 1,
1.706408, 0.6216421, 1.192597, 1, 0, 0.2941177, 1,
1.707208, 0.2248621, 1.779513, 1, 0, 0.2862745, 1,
1.707706, 1.41977, 0.5477154, 1, 0, 0.282353, 1,
1.709727, -0.7347698, 2.247155, 1, 0, 0.2745098, 1,
1.720794, -1.998165, 2.887252, 1, 0, 0.2705882, 1,
1.722874, 1.086316, 2.503102, 1, 0, 0.2627451, 1,
1.731641, 0.9065768, -0.5602101, 1, 0, 0.2588235, 1,
1.750016, 1.195348, 0.7182634, 1, 0, 0.2509804, 1,
1.783645, -1.605606, 2.513637, 1, 0, 0.2470588, 1,
1.785565, 0.09684885, 1.508959, 1, 0, 0.2392157, 1,
1.823904, 0.7091731, 1.10005, 1, 0, 0.2352941, 1,
1.841052, -1.293809, 2.525493, 1, 0, 0.227451, 1,
1.856323, 0.4374569, 0.09018613, 1, 0, 0.2235294, 1,
1.880045, -0.450129, 2.23813, 1, 0, 0.2156863, 1,
1.882157, -0.1377394, 2.180903, 1, 0, 0.2117647, 1,
1.895829, 1.828525, 2.237345, 1, 0, 0.2039216, 1,
1.912282, -0.3664544, 0.2144515, 1, 0, 0.1960784, 1,
1.921516, -0.4837067, 2.503933, 1, 0, 0.1921569, 1,
1.935794, -0.5557728, 1.228419, 1, 0, 0.1843137, 1,
1.949309, 0.667107, 0.4451282, 1, 0, 0.1803922, 1,
1.951286, 0.7493434, 1.19958, 1, 0, 0.172549, 1,
1.953019, -0.2459277, 3.063043, 1, 0, 0.1686275, 1,
1.961636, 1.179607, 0.912661, 1, 0, 0.1607843, 1,
2.036509, 0.2763087, 1.734002, 1, 0, 0.1568628, 1,
2.052379, -1.09422, 1.873482, 1, 0, 0.1490196, 1,
2.065479, 1.595204, 2.660656, 1, 0, 0.145098, 1,
2.076383, -1.539655, 2.172855, 1, 0, 0.1372549, 1,
2.105585, -0.3583772, 1.978318, 1, 0, 0.1333333, 1,
2.116625, 0.3043985, 0.8341001, 1, 0, 0.1254902, 1,
2.126416, -1.109376, 2.435439, 1, 0, 0.1215686, 1,
2.130659, -0.9732559, 4.365734, 1, 0, 0.1137255, 1,
2.140427, -0.3037621, 1.08787, 1, 0, 0.1098039, 1,
2.156337, 1.560097, 0.7669144, 1, 0, 0.1019608, 1,
2.208961, 0.4354296, 2.05441, 1, 0, 0.09411765, 1,
2.339637, 0.1676329, 3.354595, 1, 0, 0.09019608, 1,
2.34684, 0.4541815, 1.852756, 1, 0, 0.08235294, 1,
2.395626, -0.3768764, -0.6965637, 1, 0, 0.07843138, 1,
2.398005, 0.1772166, 1.687624, 1, 0, 0.07058824, 1,
2.398288, -0.2963358, 0.5921649, 1, 0, 0.06666667, 1,
2.407567, 1.12277, 0.4170568, 1, 0, 0.05882353, 1,
2.473882, -0.7459454, 2.017916, 1, 0, 0.05490196, 1,
2.529869, -0.8228416, 1.532737, 1, 0, 0.04705882, 1,
2.536777, -0.1034909, 0.4841235, 1, 0, 0.04313726, 1,
2.624617, 0.1360109, 1.436085, 1, 0, 0.03529412, 1,
2.775004, -0.977155, 1.875538, 1, 0, 0.03137255, 1,
3.003243, -1.096574, 1.291504, 1, 0, 0.02352941, 1,
3.128475, -2.046255, 1.849207, 1, 0, 0.01960784, 1,
3.208462, -0.6428444, 2.702166, 1, 0, 0.01176471, 1,
3.541616, -1.55347, 0.3272007, 1, 0, 0.007843138, 1
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
0.2925552, -3.744051, -6.567352, 0, -0.5, 0.5, 0.5,
0.2925552, -3.744051, -6.567352, 1, -0.5, 0.5, 0.5,
0.2925552, -3.744051, -6.567352, 1, 1.5, 0.5, 0.5,
0.2925552, -3.744051, -6.567352, 0, 1.5, 0.5, 0.5
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
-4.057937, 0.3383745, -6.567352, 0, -0.5, 0.5, 0.5,
-4.057937, 0.3383745, -6.567352, 1, -0.5, 0.5, 0.5,
-4.057937, 0.3383745, -6.567352, 1, 1.5, 0.5, 0.5,
-4.057937, 0.3383745, -6.567352, 0, 1.5, 0.5, 0.5
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
-4.057937, -3.744051, 0.4255588, 0, -0.5, 0.5, 0.5,
-4.057937, -3.744051, 0.4255588, 1, -0.5, 0.5, 0.5,
-4.057937, -3.744051, 0.4255588, 1, 1.5, 0.5, 0.5,
-4.057937, -3.744051, 0.4255588, 0, 1.5, 0.5, 0.5
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
-2, -2.801953, -4.953604,
3, -2.801953, -4.953604,
-2, -2.801953, -4.953604,
-2, -2.958969, -5.222562,
-1, -2.801953, -4.953604,
-1, -2.958969, -5.222562,
0, -2.801953, -4.953604,
0, -2.958969, -5.222562,
1, -2.801953, -4.953604,
1, -2.958969, -5.222562,
2, -2.801953, -4.953604,
2, -2.958969, -5.222562,
3, -2.801953, -4.953604,
3, -2.958969, -5.222562
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
-2, -3.273002, -5.760478, 0, -0.5, 0.5, 0.5,
-2, -3.273002, -5.760478, 1, -0.5, 0.5, 0.5,
-2, -3.273002, -5.760478, 1, 1.5, 0.5, 0.5,
-2, -3.273002, -5.760478, 0, 1.5, 0.5, 0.5,
-1, -3.273002, -5.760478, 0, -0.5, 0.5, 0.5,
-1, -3.273002, -5.760478, 1, -0.5, 0.5, 0.5,
-1, -3.273002, -5.760478, 1, 1.5, 0.5, 0.5,
-1, -3.273002, -5.760478, 0, 1.5, 0.5, 0.5,
0, -3.273002, -5.760478, 0, -0.5, 0.5, 0.5,
0, -3.273002, -5.760478, 1, -0.5, 0.5, 0.5,
0, -3.273002, -5.760478, 1, 1.5, 0.5, 0.5,
0, -3.273002, -5.760478, 0, 1.5, 0.5, 0.5,
1, -3.273002, -5.760478, 0, -0.5, 0.5, 0.5,
1, -3.273002, -5.760478, 1, -0.5, 0.5, 0.5,
1, -3.273002, -5.760478, 1, 1.5, 0.5, 0.5,
1, -3.273002, -5.760478, 0, 1.5, 0.5, 0.5,
2, -3.273002, -5.760478, 0, -0.5, 0.5, 0.5,
2, -3.273002, -5.760478, 1, -0.5, 0.5, 0.5,
2, -3.273002, -5.760478, 1, 1.5, 0.5, 0.5,
2, -3.273002, -5.760478, 0, 1.5, 0.5, 0.5,
3, -3.273002, -5.760478, 0, -0.5, 0.5, 0.5,
3, -3.273002, -5.760478, 1, -0.5, 0.5, 0.5,
3, -3.273002, -5.760478, 1, 1.5, 0.5, 0.5,
3, -3.273002, -5.760478, 0, 1.5, 0.5, 0.5
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
-3.053977, -2, -4.953604,
-3.053977, 3, -4.953604,
-3.053977, -2, -4.953604,
-3.221304, -2, -5.222562,
-3.053977, -1, -4.953604,
-3.221304, -1, -5.222562,
-3.053977, 0, -4.953604,
-3.221304, 0, -5.222562,
-3.053977, 1, -4.953604,
-3.221304, 1, -5.222562,
-3.053977, 2, -4.953604,
-3.221304, 2, -5.222562,
-3.053977, 3, -4.953604,
-3.221304, 3, -5.222562
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
-3.555957, -2, -5.760478, 0, -0.5, 0.5, 0.5,
-3.555957, -2, -5.760478, 1, -0.5, 0.5, 0.5,
-3.555957, -2, -5.760478, 1, 1.5, 0.5, 0.5,
-3.555957, -2, -5.760478, 0, 1.5, 0.5, 0.5,
-3.555957, -1, -5.760478, 0, -0.5, 0.5, 0.5,
-3.555957, -1, -5.760478, 1, -0.5, 0.5, 0.5,
-3.555957, -1, -5.760478, 1, 1.5, 0.5, 0.5,
-3.555957, -1, -5.760478, 0, 1.5, 0.5, 0.5,
-3.555957, 0, -5.760478, 0, -0.5, 0.5, 0.5,
-3.555957, 0, -5.760478, 1, -0.5, 0.5, 0.5,
-3.555957, 0, -5.760478, 1, 1.5, 0.5, 0.5,
-3.555957, 0, -5.760478, 0, 1.5, 0.5, 0.5,
-3.555957, 1, -5.760478, 0, -0.5, 0.5, 0.5,
-3.555957, 1, -5.760478, 1, -0.5, 0.5, 0.5,
-3.555957, 1, -5.760478, 1, 1.5, 0.5, 0.5,
-3.555957, 1, -5.760478, 0, 1.5, 0.5, 0.5,
-3.555957, 2, -5.760478, 0, -0.5, 0.5, 0.5,
-3.555957, 2, -5.760478, 1, -0.5, 0.5, 0.5,
-3.555957, 2, -5.760478, 1, 1.5, 0.5, 0.5,
-3.555957, 2, -5.760478, 0, 1.5, 0.5, 0.5,
-3.555957, 3, -5.760478, 0, -0.5, 0.5, 0.5,
-3.555957, 3, -5.760478, 1, -0.5, 0.5, 0.5,
-3.555957, 3, -5.760478, 1, 1.5, 0.5, 0.5,
-3.555957, 3, -5.760478, 0, 1.5, 0.5, 0.5
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
-3.053977, -2.801953, -4,
-3.053977, -2.801953, 4,
-3.053977, -2.801953, -4,
-3.221304, -2.958969, -4,
-3.053977, -2.801953, -2,
-3.221304, -2.958969, -2,
-3.053977, -2.801953, 0,
-3.221304, -2.958969, 0,
-3.053977, -2.801953, 2,
-3.221304, -2.958969, 2,
-3.053977, -2.801953, 4,
-3.221304, -2.958969, 4
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
-3.555957, -3.273002, -4, 0, -0.5, 0.5, 0.5,
-3.555957, -3.273002, -4, 1, -0.5, 0.5, 0.5,
-3.555957, -3.273002, -4, 1, 1.5, 0.5, 0.5,
-3.555957, -3.273002, -4, 0, 1.5, 0.5, 0.5,
-3.555957, -3.273002, -2, 0, -0.5, 0.5, 0.5,
-3.555957, -3.273002, -2, 1, -0.5, 0.5, 0.5,
-3.555957, -3.273002, -2, 1, 1.5, 0.5, 0.5,
-3.555957, -3.273002, -2, 0, 1.5, 0.5, 0.5,
-3.555957, -3.273002, 0, 0, -0.5, 0.5, 0.5,
-3.555957, -3.273002, 0, 1, -0.5, 0.5, 0.5,
-3.555957, -3.273002, 0, 1, 1.5, 0.5, 0.5,
-3.555957, -3.273002, 0, 0, 1.5, 0.5, 0.5,
-3.555957, -3.273002, 2, 0, -0.5, 0.5, 0.5,
-3.555957, -3.273002, 2, 1, -0.5, 0.5, 0.5,
-3.555957, -3.273002, 2, 1, 1.5, 0.5, 0.5,
-3.555957, -3.273002, 2, 0, 1.5, 0.5, 0.5,
-3.555957, -3.273002, 4, 0, -0.5, 0.5, 0.5,
-3.555957, -3.273002, 4, 1, -0.5, 0.5, 0.5,
-3.555957, -3.273002, 4, 1, 1.5, 0.5, 0.5,
-3.555957, -3.273002, 4, 0, 1.5, 0.5, 0.5
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
-3.053977, -2.801953, -4.953604,
-3.053977, 3.478702, -4.953604,
-3.053977, -2.801953, 5.804721,
-3.053977, 3.478702, 5.804721,
-3.053977, -2.801953, -4.953604,
-3.053977, -2.801953, 5.804721,
-3.053977, 3.478702, -4.953604,
-3.053977, 3.478702, 5.804721,
-3.053977, -2.801953, -4.953604,
3.639088, -2.801953, -4.953604,
-3.053977, -2.801953, 5.804721,
3.639088, -2.801953, 5.804721,
-3.053977, 3.478702, -4.953604,
3.639088, 3.478702, -4.953604,
-3.053977, 3.478702, 5.804721,
3.639088, 3.478702, 5.804721,
3.639088, -2.801953, -4.953604,
3.639088, 3.478702, -4.953604,
3.639088, -2.801953, 5.804721,
3.639088, 3.478702, 5.804721,
3.639088, -2.801953, -4.953604,
3.639088, -2.801953, 5.804721,
3.639088, 3.478702, -4.953604,
3.639088, 3.478702, 5.804721
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
var radius = 7.551348;
var distance = 33.5968;
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
mvMatrix.translate( -0.2925552, -0.3383745, -0.4255588 );
mvMatrix.scale( 1.219869, 1.299971, 0.7589161 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.5968);
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
Leptophos<-read.table("Leptophos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Leptophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Leptophos' not found
```

```r
y<-Leptophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Leptophos' not found
```

```r
z<-Leptophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Leptophos' not found
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
-2.956506, -0.5137646, -1.687817, 0, 0, 1, 1, 1,
-2.773485, -0.3125811, -0.07955513, 1, 0, 0, 1, 1,
-2.772842, -0.8397779, -1.95855, 1, 0, 0, 1, 1,
-2.543278, 0.9565676, -1.04012, 1, 0, 0, 1, 1,
-2.469884, 0.4148453, -1.531366, 1, 0, 0, 1, 1,
-2.403755, -0.2996125, -1.161077, 1, 0, 0, 1, 1,
-2.347645, -1.424561, -1.494142, 0, 0, 0, 1, 1,
-2.31448, 2.137465, -1.314001, 0, 0, 0, 1, 1,
-2.30355, 0.958948, -0.442882, 0, 0, 0, 1, 1,
-2.296745, -0.3624289, -1.800858, 0, 0, 0, 1, 1,
-2.273347, 1.523294, -0.3537621, 0, 0, 0, 1, 1,
-2.268304, 1.09605, -1.067483, 0, 0, 0, 1, 1,
-2.266336, -1.509317, -1.626302, 0, 0, 0, 1, 1,
-2.185878, -0.2934158, -1.82849, 1, 1, 1, 1, 1,
-2.076198, -0.5866795, -3.399729, 1, 1, 1, 1, 1,
-2.060492, 1.18668, -0.653393, 1, 1, 1, 1, 1,
-2.016905, -2.409859, -3.566712, 1, 1, 1, 1, 1,
-1.9986, 1.119247, 0.1259202, 1, 1, 1, 1, 1,
-1.990116, 0.07077883, -2.319262, 1, 1, 1, 1, 1,
-1.914526, 0.5448167, -2.030605, 1, 1, 1, 1, 1,
-1.848589, 0.6593105, -3.092244, 1, 1, 1, 1, 1,
-1.847874, 0.8519546, -0.3498167, 1, 1, 1, 1, 1,
-1.838773, 0.1487741, -3.158801, 1, 1, 1, 1, 1,
-1.788003, 0.3851105, -2.058669, 1, 1, 1, 1, 1,
-1.769885, -0.4876699, -0.5253609, 1, 1, 1, 1, 1,
-1.76272, -0.02733223, -1.115743, 1, 1, 1, 1, 1,
-1.715194, 1.201569, -1.329081, 1, 1, 1, 1, 1,
-1.703573, 0.6441612, -1.108561, 1, 1, 1, 1, 1,
-1.697283, 0.1795194, -2.243183, 0, 0, 1, 1, 1,
-1.692724, 1.611437, 0.9670485, 1, 0, 0, 1, 1,
-1.656445, -0.3857778, -2.653449, 1, 0, 0, 1, 1,
-1.655713, 1.830812, 0.1926895, 1, 0, 0, 1, 1,
-1.654032, -1.458468, -2.701614, 1, 0, 0, 1, 1,
-1.650378, 0.1612547, -1.890217, 1, 0, 0, 1, 1,
-1.647452, -0.8442149, -3.158391, 0, 0, 0, 1, 1,
-1.618428, 0.2506759, -1.696191, 0, 0, 0, 1, 1,
-1.601751, -0.9517892, -2.46359, 0, 0, 0, 1, 1,
-1.578109, -0.3182532, -1.799514, 0, 0, 0, 1, 1,
-1.577213, 0.4179955, -0.8405682, 0, 0, 0, 1, 1,
-1.562181, -0.4721614, -1.92357, 0, 0, 0, 1, 1,
-1.559, -1.827655, -3.38832, 0, 0, 0, 1, 1,
-1.557347, -2.060851, -1.049002, 1, 1, 1, 1, 1,
-1.5514, 0.5517001, -1.522329, 1, 1, 1, 1, 1,
-1.547534, 0.1411041, -0.680475, 1, 1, 1, 1, 1,
-1.540478, -0.06570386, -0.04803424, 1, 1, 1, 1, 1,
-1.534391, 0.3049003, -1.134341, 1, 1, 1, 1, 1,
-1.523472, 0.1855381, -2.603486, 1, 1, 1, 1, 1,
-1.516116, -0.7095988, -0.8967451, 1, 1, 1, 1, 1,
-1.505498, 1.107267, -0.5729917, 1, 1, 1, 1, 1,
-1.500724, -0.3945743, -0.9975342, 1, 1, 1, 1, 1,
-1.499397, 0.1981862, -1.44364, 1, 1, 1, 1, 1,
-1.496796, 0.9849164, -0.19088, 1, 1, 1, 1, 1,
-1.494034, 1.185636, 0.1091931, 1, 1, 1, 1, 1,
-1.476225, 1.246969, -1.401844, 1, 1, 1, 1, 1,
-1.475443, -0.5590044, -2.822184, 1, 1, 1, 1, 1,
-1.473396, -0.6370739, -0.07337446, 1, 1, 1, 1, 1,
-1.436248, -0.6349648, -0.7841813, 0, 0, 1, 1, 1,
-1.428474, -0.1067235, -1.448906, 1, 0, 0, 1, 1,
-1.423593, -0.6252266, -1.775997, 1, 0, 0, 1, 1,
-1.420251, -0.6053587, -2.263458, 1, 0, 0, 1, 1,
-1.418071, 0.7121204, -4.337155, 1, 0, 0, 1, 1,
-1.411342, 0.7235682, -2.238959, 1, 0, 0, 1, 1,
-1.410809, 0.1921633, 0.7035218, 0, 0, 0, 1, 1,
-1.40507, 1.816614, -0.5586273, 0, 0, 0, 1, 1,
-1.399038, -0.7733487, -0.7289727, 0, 0, 0, 1, 1,
-1.396117, -1.354962, -2.860211, 0, 0, 0, 1, 1,
-1.39503, -0.8454574, -1.041269, 0, 0, 0, 1, 1,
-1.388592, 0.820506, 0.3560754, 0, 0, 0, 1, 1,
-1.381594, 2.005948, 0.6057642, 0, 0, 0, 1, 1,
-1.380287, -0.3465967, -1.699472, 1, 1, 1, 1, 1,
-1.374066, -0.8540812, -1.822307, 1, 1, 1, 1, 1,
-1.370537, -0.1817228, -1.071356, 1, 1, 1, 1, 1,
-1.353869, 0.08078273, -0.5660847, 1, 1, 1, 1, 1,
-1.344173, 0.1591645, -1.005936, 1, 1, 1, 1, 1,
-1.327243, -0.747361, -3.126581, 1, 1, 1, 1, 1,
-1.325536, -0.5092018, -0.5119347, 1, 1, 1, 1, 1,
-1.320011, 0.415425, -0.6258175, 1, 1, 1, 1, 1,
-1.313271, -0.5630952, -0.3291461, 1, 1, 1, 1, 1,
-1.311325, -0.2566651, -1.933937, 1, 1, 1, 1, 1,
-1.307275, 0.4722392, -1.21658, 1, 1, 1, 1, 1,
-1.292968, -1.531252, -2.472151, 1, 1, 1, 1, 1,
-1.28895, -0.02487746, -3.109836, 1, 1, 1, 1, 1,
-1.288856, 0.3780775, -1.308675, 1, 1, 1, 1, 1,
-1.28823, 1.243872, -0.756107, 1, 1, 1, 1, 1,
-1.282774, -0.4262931, -0.6342673, 0, 0, 1, 1, 1,
-1.274117, 0.8278969, -0.8780913, 1, 0, 0, 1, 1,
-1.263165, 0.2937855, -0.2957349, 1, 0, 0, 1, 1,
-1.256564, -1.626047, -3.116828, 1, 0, 0, 1, 1,
-1.252863, -0.1162166, -0.4366271, 1, 0, 0, 1, 1,
-1.249792, -0.400104, -1.634427, 1, 0, 0, 1, 1,
-1.240311, 0.226946, -0.3114932, 0, 0, 0, 1, 1,
-1.238796, -0.937211, -2.269254, 0, 0, 0, 1, 1,
-1.231176, 2.033037, -1.770728, 0, 0, 0, 1, 1,
-1.22963, 0.8020926, -0.9435791, 0, 0, 0, 1, 1,
-1.220411, -0.1037407, -2.415341, 0, 0, 0, 1, 1,
-1.214142, -0.006511635, -4.103523, 0, 0, 0, 1, 1,
-1.21399, -0.5306873, -2.436576, 0, 0, 0, 1, 1,
-1.207298, -0.4019672, -1.60955, 1, 1, 1, 1, 1,
-1.206681, 0.06537706, -2.195829, 1, 1, 1, 1, 1,
-1.201574, 1.332249, -0.4745184, 1, 1, 1, 1, 1,
-1.201282, 0.1932169, -1.724111, 1, 1, 1, 1, 1,
-1.200624, 0.1207004, -0.3625288, 1, 1, 1, 1, 1,
-1.191662, 0.03677578, -3.384772, 1, 1, 1, 1, 1,
-1.191159, -0.3384553, 0.4656615, 1, 1, 1, 1, 1,
-1.18525, 1.255974, -1.592265, 1, 1, 1, 1, 1,
-1.178335, -0.05680496, -2.370443, 1, 1, 1, 1, 1,
-1.161066, 0.8773044, -1.23385, 1, 1, 1, 1, 1,
-1.160585, -0.4687098, -2.088766, 1, 1, 1, 1, 1,
-1.16018, 0.1568798, -0.7613296, 1, 1, 1, 1, 1,
-1.159044, 0.2665201, -1.759864, 1, 1, 1, 1, 1,
-1.158582, 0.5055209, -2.817872, 1, 1, 1, 1, 1,
-1.157444, 0.9361263, -1.251867, 1, 1, 1, 1, 1,
-1.151624, -1.476674, -2.318698, 0, 0, 1, 1, 1,
-1.1425, 1.221005, -1.884916, 1, 0, 0, 1, 1,
-1.125905, -0.8741525, -3.683676, 1, 0, 0, 1, 1,
-1.12078, -0.5573177, -2.15645, 1, 0, 0, 1, 1,
-1.11947, 1.089569, -1.163283, 1, 0, 0, 1, 1,
-1.116514, -1.025109, -2.966097, 1, 0, 0, 1, 1,
-1.114538, -1.563911, -2.921057, 0, 0, 0, 1, 1,
-1.114045, 0.6101725, -1.158964, 0, 0, 0, 1, 1,
-1.107643, 0.2058688, -1.563184, 0, 0, 0, 1, 1,
-1.097113, 1.117047, -0.4481131, 0, 0, 0, 1, 1,
-1.094048, 0.675145, -0.6497079, 0, 0, 0, 1, 1,
-1.086873, -2.201098, -3.62054, 0, 0, 0, 1, 1,
-1.068078, 0.8385344, -0.3609379, 0, 0, 0, 1, 1,
-1.064528, -1.43623, -2.497777, 1, 1, 1, 1, 1,
-1.063149, 0.8701201, 0.8154446, 1, 1, 1, 1, 1,
-1.061219, 0.7614309, 0.1025021, 1, 1, 1, 1, 1,
-1.054187, -1.78881, -1.627086, 1, 1, 1, 1, 1,
-1.046789, 0.1865351, -0.8489692, 1, 1, 1, 1, 1,
-1.044582, -0.6860961, -3.371841, 1, 1, 1, 1, 1,
-1.043514, 0.6870506, -1.535354, 1, 1, 1, 1, 1,
-1.034634, 0.1595979, -1.344412, 1, 1, 1, 1, 1,
-1.022201, 1.324592, -1.691603, 1, 1, 1, 1, 1,
-1.014672, 0.07335968, -1.810451, 1, 1, 1, 1, 1,
-1.011982, -1.049989, -2.036572, 1, 1, 1, 1, 1,
-1.005347, -1.074491, -3.055006, 1, 1, 1, 1, 1,
-0.9939165, 0.5494816, -1.524135, 1, 1, 1, 1, 1,
-0.9907774, 0.1571802, -1.834086, 1, 1, 1, 1, 1,
-0.9820171, -1.005047, -2.663851, 1, 1, 1, 1, 1,
-0.9802335, -1.440947, -2.410108, 0, 0, 1, 1, 1,
-0.9779547, 0.5599666, -1.830894, 1, 0, 0, 1, 1,
-0.9774637, -0.1922508, -2.696963, 1, 0, 0, 1, 1,
-0.9741402, -1.108913, -2.803793, 1, 0, 0, 1, 1,
-0.9630476, 0.3627939, -1.106771, 1, 0, 0, 1, 1,
-0.9623627, -1.303719, -2.214877, 1, 0, 0, 1, 1,
-0.9573836, -0.3445516, -2.614458, 0, 0, 0, 1, 1,
-0.9571728, 0.1762101, -1.26904, 0, 0, 0, 1, 1,
-0.9520647, -0.7904278, -1.273517, 0, 0, 0, 1, 1,
-0.9488015, 0.3342561, -0.3290017, 0, 0, 0, 1, 1,
-0.9448803, 0.2610965, -0.08221836, 0, 0, 0, 1, 1,
-0.9404107, 2.485116, -0.6567312, 0, 0, 0, 1, 1,
-0.9378124, 1.227552, 0.1861591, 0, 0, 0, 1, 1,
-0.9264085, 0.8078003, -2.431602, 1, 1, 1, 1, 1,
-0.9244902, -1.289621, -1.789666, 1, 1, 1, 1, 1,
-0.9234204, 0.9869743, 0.5157518, 1, 1, 1, 1, 1,
-0.9209531, -1.085107, -2.986749, 1, 1, 1, 1, 1,
-0.9153075, -0.6781978, -0.4268357, 1, 1, 1, 1, 1,
-0.9111983, 0.1558398, -1.569721, 1, 1, 1, 1, 1,
-0.9106338, -1.420747, -3.748013, 1, 1, 1, 1, 1,
-0.9086241, -0.1833183, -2.053195, 1, 1, 1, 1, 1,
-0.892519, -0.408623, -0.7089959, 1, 1, 1, 1, 1,
-0.8891342, 1.075152, -1.145204, 1, 1, 1, 1, 1,
-0.8864238, -0.8560224, -0.7327818, 1, 1, 1, 1, 1,
-0.8831556, -0.70147, -1.132376, 1, 1, 1, 1, 1,
-0.8802477, -0.8395159, -1.901647, 1, 1, 1, 1, 1,
-0.8794534, -0.6012878, -1.656731, 1, 1, 1, 1, 1,
-0.871913, -0.1076941, -1.464367, 1, 1, 1, 1, 1,
-0.8654771, 1.106345, 0.2129685, 0, 0, 1, 1, 1,
-0.864393, -1.31543, -2.442862, 1, 0, 0, 1, 1,
-0.8622506, -1.119969, -2.285831, 1, 0, 0, 1, 1,
-0.8577666, -0.3564873, -0.9008984, 1, 0, 0, 1, 1,
-0.8570797, 0.5198072, -0.3095999, 1, 0, 0, 1, 1,
-0.8531373, 1.020434, 0.9218814, 1, 0, 0, 1, 1,
-0.8522623, -0.1244011, -2.725191, 0, 0, 0, 1, 1,
-0.845744, -0.618352, -3.462312, 0, 0, 0, 1, 1,
-0.8437667, 0.2993988, 0.3781767, 0, 0, 0, 1, 1,
-0.8406222, -0.4021726, -0.2648126, 0, 0, 0, 1, 1,
-0.8397272, 1.810821, 0.06408472, 0, 0, 0, 1, 1,
-0.8362255, -1.687707, -1.134143, 0, 0, 0, 1, 1,
-0.8341133, 0.4182514, -0.7909931, 0, 0, 0, 1, 1,
-0.8312499, -0.1367497, -3.203818, 1, 1, 1, 1, 1,
-0.8307734, -1.619522, -1.743267, 1, 1, 1, 1, 1,
-0.823265, -0.5109067, -0.7154984, 1, 1, 1, 1, 1,
-0.8228864, 1.409212, -0.326945, 1, 1, 1, 1, 1,
-0.8203457, 0.4105514, -2.071732, 1, 1, 1, 1, 1,
-0.8187248, 0.1962491, -1.750207, 1, 1, 1, 1, 1,
-0.8176281, 0.4588709, -1.042379, 1, 1, 1, 1, 1,
-0.8078939, 1.036449, -0.3946357, 1, 1, 1, 1, 1,
-0.8041297, 0.3058589, -1.053831, 1, 1, 1, 1, 1,
-0.8033499, -1.475262, -1.806887, 1, 1, 1, 1, 1,
-0.7949664, -0.1019575, -0.8712515, 1, 1, 1, 1, 1,
-0.7929634, -0.9413913, -2.529769, 1, 1, 1, 1, 1,
-0.7919541, -0.1412712, -3.32079, 1, 1, 1, 1, 1,
-0.7877712, -0.3480439, -3.506119, 1, 1, 1, 1, 1,
-0.7872162, 0.04889654, -2.370281, 1, 1, 1, 1, 1,
-0.782717, 0.1169001, -0.3566663, 0, 0, 1, 1, 1,
-0.7800844, 0.4697532, -1.826365, 1, 0, 0, 1, 1,
-0.7730777, -1.003278, -2.192498, 1, 0, 0, 1, 1,
-0.7676773, -0.7826905, -3.542397, 1, 0, 0, 1, 1,
-0.7659817, 1.541203, 0.3445125, 1, 0, 0, 1, 1,
-0.765723, -0.04909476, -3.861935, 1, 0, 0, 1, 1,
-0.765058, 1.509877, -0.2175862, 0, 0, 0, 1, 1,
-0.7616255, 0.3986359, -1.036358, 0, 0, 0, 1, 1,
-0.7585014, 1.038824, -0.7374238, 0, 0, 0, 1, 1,
-0.7572267, 0.4770853, -1.069712, 0, 0, 0, 1, 1,
-0.7557092, -0.2012248, -3.091243, 0, 0, 0, 1, 1,
-0.753871, 0.5944821, 0.6191057, 0, 0, 0, 1, 1,
-0.7462217, 0.2481394, -2.674665, 0, 0, 0, 1, 1,
-0.7408401, -1.222222, -4.023682, 1, 1, 1, 1, 1,
-0.7402027, 0.6758885, -0.9268234, 1, 1, 1, 1, 1,
-0.7395649, 0.3599112, -0.4012005, 1, 1, 1, 1, 1,
-0.7391511, 0.9302531, -1.51116, 1, 1, 1, 1, 1,
-0.7330089, 1.178876, 0.3013854, 1, 1, 1, 1, 1,
-0.7317668, 0.3543199, 0.9123861, 1, 1, 1, 1, 1,
-0.7305537, -0.7070153, -2.400263, 1, 1, 1, 1, 1,
-0.7277431, -1.352111, -3.151544, 1, 1, 1, 1, 1,
-0.7272964, 0.6957988, -0.618413, 1, 1, 1, 1, 1,
-0.7259586, -0.0868457, -0.5956487, 1, 1, 1, 1, 1,
-0.7199311, 0.508501, -0.2082224, 1, 1, 1, 1, 1,
-0.7187473, 0.7867951, -0.8303263, 1, 1, 1, 1, 1,
-0.7150249, -1.511982, -2.08912, 1, 1, 1, 1, 1,
-0.7068345, -2.209547, -3.948868, 1, 1, 1, 1, 1,
-0.7042232, 1.148656, -1.041176, 1, 1, 1, 1, 1,
-0.703356, 0.2873667, -1.926467, 0, 0, 1, 1, 1,
-0.7032412, 1.128982, -0.3447501, 1, 0, 0, 1, 1,
-0.7030402, -0.76332, -3.781882, 1, 0, 0, 1, 1,
-0.6987599, -0.0998681, -2.262259, 1, 0, 0, 1, 1,
-0.6952152, 1.729728, 0.7810473, 1, 0, 0, 1, 1,
-0.6919912, 0.616034, 2.325576, 1, 0, 0, 1, 1,
-0.6754456, 0.3562062, -0.6463352, 0, 0, 0, 1, 1,
-0.6732555, -1.064519, -3.643299, 0, 0, 0, 1, 1,
-0.6726521, 1.383328, 1.252454, 0, 0, 0, 1, 1,
-0.6615984, 0.6189516, -1.54493, 0, 0, 0, 1, 1,
-0.6602988, -1.026647, -1.864558, 0, 0, 0, 1, 1,
-0.6556543, -0.7725365, -2.198702, 0, 0, 0, 1, 1,
-0.6488243, -0.6872184, -1.624373, 0, 0, 0, 1, 1,
-0.6434601, -0.5012273, -4.529158, 1, 1, 1, 1, 1,
-0.6432945, 1.205087, -1.465494, 1, 1, 1, 1, 1,
-0.6424646, 2.994875, 0.3840741, 1, 1, 1, 1, 1,
-0.638341, 0.1030922, -0.9185429, 1, 1, 1, 1, 1,
-0.6377797, -0.3319561, -0.787071, 1, 1, 1, 1, 1,
-0.6348139, -0.2551896, -1.758304, 1, 1, 1, 1, 1,
-0.6296951, 0.8175263, 0.0339393, 1, 1, 1, 1, 1,
-0.6230079, -1.872768, -2.007016, 1, 1, 1, 1, 1,
-0.6228975, 1.474972, 1.016595, 1, 1, 1, 1, 1,
-0.6171113, 0.6705068, -0.6917848, 1, 1, 1, 1, 1,
-0.6156391, 1.197699, 0.2947033, 1, 1, 1, 1, 1,
-0.6120436, -0.4366916, -1.171938, 1, 1, 1, 1, 1,
-0.6064667, -0.671571, -1.832928, 1, 1, 1, 1, 1,
-0.6046235, -1.958222, -1.561537, 1, 1, 1, 1, 1,
-0.5995731, -0.8309664, -2.258132, 1, 1, 1, 1, 1,
-0.5946989, -0.8960565, -2.317225, 0, 0, 1, 1, 1,
-0.5937673, 0.6112152, -0.07017308, 1, 0, 0, 1, 1,
-0.5920972, 0.3418976, -0.6597058, 1, 0, 0, 1, 1,
-0.5913055, -0.2336416, -1.351846, 1, 0, 0, 1, 1,
-0.5882918, 1.154757, -1.398753, 1, 0, 0, 1, 1,
-0.5785669, 0.3878572, 1.349905, 1, 0, 0, 1, 1,
-0.577862, 2.021527, 0.2141278, 0, 0, 0, 1, 1,
-0.5749952, 0.9622928, -0.3051323, 0, 0, 0, 1, 1,
-0.5712857, -1.167681, -1.241593, 0, 0, 0, 1, 1,
-0.5690597, 0.190683, -3.6761, 0, 0, 0, 1, 1,
-0.5672972, 0.7775614, 0.6596079, 0, 0, 0, 1, 1,
-0.5663048, 1.836116, -0.6913446, 0, 0, 0, 1, 1,
-0.5613544, -0.3536841, -0.9868976, 0, 0, 0, 1, 1,
-0.5575373, 1.009406, -0.5914051, 1, 1, 1, 1, 1,
-0.5534717, 0.904904, -1.966106, 1, 1, 1, 1, 1,
-0.5495651, -0.3502183, -2.350192, 1, 1, 1, 1, 1,
-0.5430748, -0.3603919, -2.078524, 1, 1, 1, 1, 1,
-0.5371469, -0.5344617, -4.077173, 1, 1, 1, 1, 1,
-0.5354537, -0.6593123, -4.561798, 1, 1, 1, 1, 1,
-0.5352581, 0.5929264, -0.3520272, 1, 1, 1, 1, 1,
-0.5348154, 0.0872096, -2.096852, 1, 1, 1, 1, 1,
-0.5312095, -0.9595275, -4.283878, 1, 1, 1, 1, 1,
-0.5310013, 0.6656133, -1.072216, 1, 1, 1, 1, 1,
-0.5262948, -1.244924, -3.097577, 1, 1, 1, 1, 1,
-0.5256258, -1.557493, -1.568923, 1, 1, 1, 1, 1,
-0.5229148, 1.147512, -0.8373137, 1, 1, 1, 1, 1,
-0.5225192, 0.3072963, -3.1029, 1, 1, 1, 1, 1,
-0.5160019, 0.4029087, -0.04702378, 1, 1, 1, 1, 1,
-0.5142017, -0.3772916, -0.8762143, 0, 0, 1, 1, 1,
-0.5139008, -0.08757886, -3.016479, 1, 0, 0, 1, 1,
-0.511072, -1.740505, -1.859678, 1, 0, 0, 1, 1,
-0.5097651, 0.3430296, -0.7230059, 1, 0, 0, 1, 1,
-0.5078295, 0.03580881, 0.05255523, 1, 0, 0, 1, 1,
-0.5069736, 0.7076926, -0.2427628, 1, 0, 0, 1, 1,
-0.5011652, -1.006229, -2.848141, 0, 0, 0, 1, 1,
-0.5008022, -1.205334, -3.042712, 0, 0, 0, 1, 1,
-0.5003728, 0.7424732, -0.1792914, 0, 0, 0, 1, 1,
-0.4973172, 1.562625, -0.6779217, 0, 0, 0, 1, 1,
-0.4955905, -0.9576938, -2.963264, 0, 0, 0, 1, 1,
-0.4949363, 1.83045, -2.604054, 0, 0, 0, 1, 1,
-0.4942965, -1.247067, -2.873101, 0, 0, 0, 1, 1,
-0.493566, -0.07376599, -2.415488, 1, 1, 1, 1, 1,
-0.4917614, 0.447625, -0.5190036, 1, 1, 1, 1, 1,
-0.490986, -0.2123597, -2.531511, 1, 1, 1, 1, 1,
-0.4899631, -0.7941266, -1.704281, 1, 1, 1, 1, 1,
-0.4875134, 1.461559, -0.4269379, 1, 1, 1, 1, 1,
-0.4870217, -0.4977896, -2.633924, 1, 1, 1, 1, 1,
-0.4843648, 1.099271, -0.2468062, 1, 1, 1, 1, 1,
-0.4780651, -0.7558574, -2.938638, 1, 1, 1, 1, 1,
-0.4776244, -0.4059955, -3.161052, 1, 1, 1, 1, 1,
-0.470484, -0.09532756, -1.254974, 1, 1, 1, 1, 1,
-0.4703802, -0.7653056, -0.8371198, 1, 1, 1, 1, 1,
-0.465649, -0.08132798, -0.854836, 1, 1, 1, 1, 1,
-0.4641488, 0.4314317, 0.813724, 1, 1, 1, 1, 1,
-0.4640676, -0.9118406, -2.917926, 1, 1, 1, 1, 1,
-0.463634, 0.666124, -1.656785, 1, 1, 1, 1, 1,
-0.4564851, 1.299259, -0.9675199, 0, 0, 1, 1, 1,
-0.4534088, -0.936244, -2.78602, 1, 0, 0, 1, 1,
-0.4515436, 0.2296537, -1.573995, 1, 0, 0, 1, 1,
-0.4511562, -0.1322589, -1.024499, 1, 0, 0, 1, 1,
-0.4509223, 1.837214, -0.5425009, 1, 0, 0, 1, 1,
-0.4505941, 0.9069725, 0.02806135, 1, 0, 0, 1, 1,
-0.4429355, -0.6279977, -2.458205, 0, 0, 0, 1, 1,
-0.4411555, -0.3432139, -2.277587, 0, 0, 0, 1, 1,
-0.4373954, 0.05772987, 0.909282, 0, 0, 0, 1, 1,
-0.4372625, -0.4230548, -4.629061, 0, 0, 0, 1, 1,
-0.4348272, -0.3260075, -2.678893, 0, 0, 0, 1, 1,
-0.4346832, -0.5823144, -1.524857, 0, 0, 0, 1, 1,
-0.4324321, 0.5883993, -0.285619, 0, 0, 0, 1, 1,
-0.431039, -0.3745373, -0.3956429, 1, 1, 1, 1, 1,
-0.430221, 1.090711, -0.2538069, 1, 1, 1, 1, 1,
-0.4238172, -0.01605428, -1.44345, 1, 1, 1, 1, 1,
-0.4206176, 0.2538412, -1.971954, 1, 1, 1, 1, 1,
-0.4166771, 0.9689235, -0.2946987, 1, 1, 1, 1, 1,
-0.4131782, -0.7896284, -1.923869, 1, 1, 1, 1, 1,
-0.412929, -1.255383, -2.015621, 1, 1, 1, 1, 1,
-0.4121602, 2.02315, -0.08911645, 1, 1, 1, 1, 1,
-0.4020169, -1.262796, -4.796929, 1, 1, 1, 1, 1,
-0.3957215, -0.07271266, -2.116176, 1, 1, 1, 1, 1,
-0.3934986, -0.02823918, -1.227293, 1, 1, 1, 1, 1,
-0.3921092, 0.2203568, -1.731933, 1, 1, 1, 1, 1,
-0.3886659, 1.608896, -0.1664188, 1, 1, 1, 1, 1,
-0.3861183, -0.4492115, -3.393601, 1, 1, 1, 1, 1,
-0.3853769, 0.3114081, 0.1548679, 1, 1, 1, 1, 1,
-0.3846719, 1.354195, -0.9385332, 0, 0, 1, 1, 1,
-0.3824708, -0.1303788, -2.127996, 1, 0, 0, 1, 1,
-0.3823415, -0.2206819, -2.776664, 1, 0, 0, 1, 1,
-0.3787116, 0.7066779, -0.0008477353, 1, 0, 0, 1, 1,
-0.3755307, 0.2330599, -2.198041, 1, 0, 0, 1, 1,
-0.3726885, 0.4133703, -1.210693, 1, 0, 0, 1, 1,
-0.3723086, -1.348072, -3.503185, 0, 0, 0, 1, 1,
-0.3692522, -1.646362, -3.97325, 0, 0, 0, 1, 1,
-0.3646918, -0.3139036, -2.938855, 0, 0, 0, 1, 1,
-0.364149, -0.06209696, -1.919262, 0, 0, 0, 1, 1,
-0.3637237, -0.2615491, -1.31781, 0, 0, 0, 1, 1,
-0.3605077, -1.463878, -2.569782, 0, 0, 0, 1, 1,
-0.3599127, 0.9663751, 0.09845915, 0, 0, 0, 1, 1,
-0.3549497, -0.9686316, -2.864424, 1, 1, 1, 1, 1,
-0.3543651, -0.2171978, -1.114608, 1, 1, 1, 1, 1,
-0.3487521, -2.295571, -1.599083, 1, 1, 1, 1, 1,
-0.3472297, 0.7683454, 0.7557062, 1, 1, 1, 1, 1,
-0.3459484, 0.6335096, 0.975234, 1, 1, 1, 1, 1,
-0.3366345, -0.6162576, -2.564218, 1, 1, 1, 1, 1,
-0.3352156, -0.4370337, -3.516554, 1, 1, 1, 1, 1,
-0.3350249, 0.9875175, -0.6364646, 1, 1, 1, 1, 1,
-0.3327349, 0.3014929, -1.103124, 1, 1, 1, 1, 1,
-0.3292775, -1.748216, -2.923935, 1, 1, 1, 1, 1,
-0.3291456, -0.2042992, -2.357899, 1, 1, 1, 1, 1,
-0.3265517, 1.240078, -1.042797, 1, 1, 1, 1, 1,
-0.3261946, 1.840639, -1.005666, 1, 1, 1, 1, 1,
-0.318345, -0.08742143, -0.2586103, 1, 1, 1, 1, 1,
-0.3122731, -0.2043845, -2.316308, 1, 1, 1, 1, 1,
-0.3111258, -0.1718727, -2.150459, 0, 0, 1, 1, 1,
-0.3109794, -0.6788152, -3.382973, 1, 0, 0, 1, 1,
-0.310601, -1.188747, -2.911166, 1, 0, 0, 1, 1,
-0.3087982, -1.358453, -1.942434, 1, 0, 0, 1, 1,
-0.306799, 2.027338, -0.9135355, 1, 0, 0, 1, 1,
-0.3066354, 0.1320543, -1.73561, 1, 0, 0, 1, 1,
-0.3043573, 0.4140263, 0.4581445, 0, 0, 0, 1, 1,
-0.3043226, 1.015185, -0.2062473, 0, 0, 0, 1, 1,
-0.3030796, -1.006229, -3.189547, 0, 0, 0, 1, 1,
-0.2986209, -1.725384, -2.349733, 0, 0, 0, 1, 1,
-0.2929894, -1.910033, -2.283462, 0, 0, 0, 1, 1,
-0.2902141, -0.7224308, -2.051198, 0, 0, 0, 1, 1,
-0.2899378, 0.8165106, 1.479057, 0, 0, 0, 1, 1,
-0.2843745, -1.390484, -2.670874, 1, 1, 1, 1, 1,
-0.2832364, 0.3146628, -0.3995683, 1, 1, 1, 1, 1,
-0.2832192, -0.708478, -1.852778, 1, 1, 1, 1, 1,
-0.2830718, 1.021139, -0.3905533, 1, 1, 1, 1, 1,
-0.2797733, 0.1365088, -0.08615859, 1, 1, 1, 1, 1,
-0.2744246, -0.2449958, -2.271243, 1, 1, 1, 1, 1,
-0.2739387, 0.07130589, -1.100439, 1, 1, 1, 1, 1,
-0.272346, -0.1181542, -1.840892, 1, 1, 1, 1, 1,
-0.2692956, 0.6021873, 1.897927, 1, 1, 1, 1, 1,
-0.2683623, -0.02789493, -1.3165, 1, 1, 1, 1, 1,
-0.2644986, -1.742852, -2.839616, 1, 1, 1, 1, 1,
-0.264168, -0.3072256, -3.748463, 1, 1, 1, 1, 1,
-0.2603601, -0.8045538, -1.551431, 1, 1, 1, 1, 1,
-0.2595161, -1.274276, -1.923811, 1, 1, 1, 1, 1,
-0.2582727, -0.2493729, -3.02794, 1, 1, 1, 1, 1,
-0.2572688, 1.303855, -1.467165, 0, 0, 1, 1, 1,
-0.2568885, -0.473867, -4.15901, 1, 0, 0, 1, 1,
-0.2539335, -0.7406496, -1.611722, 1, 0, 0, 1, 1,
-0.2536643, -0.2613149, -1.438701, 1, 0, 0, 1, 1,
-0.2515437, 0.6611183, 1.431777, 1, 0, 0, 1, 1,
-0.2496838, -0.466594, -0.8362365, 1, 0, 0, 1, 1,
-0.2466382, 0.1342387, -0.9644696, 0, 0, 0, 1, 1,
-0.2463678, 0.5312416, 0.06081369, 0, 0, 0, 1, 1,
-0.2430739, -0.5105879, -0.3548054, 0, 0, 0, 1, 1,
-0.2409342, -1.580426, -1.606917, 0, 0, 0, 1, 1,
-0.2374843, -0.7391564, -3.094072, 0, 0, 0, 1, 1,
-0.2359839, 0.4536942, 0.5457557, 0, 0, 0, 1, 1,
-0.2337627, -0.3080907, -2.796384, 0, 0, 0, 1, 1,
-0.2337007, -0.7836236, -4.720209, 1, 1, 1, 1, 1,
-0.2327191, 0.593645, 0.140044, 1, 1, 1, 1, 1,
-0.2305479, 2.405184, 0.7609919, 1, 1, 1, 1, 1,
-0.2268108, 1.064375, 0.4862066, 1, 1, 1, 1, 1,
-0.2231022, -0.155292, -2.039062, 1, 1, 1, 1, 1,
-0.2213394, 0.7690955, -0.5869059, 1, 1, 1, 1, 1,
-0.2209195, 0.08048736, -3.155077, 1, 1, 1, 1, 1,
-0.2208222, -0.6851198, -2.193941, 1, 1, 1, 1, 1,
-0.2193044, 0.3682835, -2.604031, 1, 1, 1, 1, 1,
-0.2173329, -0.1308081, -1.668896, 1, 1, 1, 1, 1,
-0.2162188, -0.04521266, -2.260221, 1, 1, 1, 1, 1,
-0.2159007, -0.08252812, -0.8664973, 1, 1, 1, 1, 1,
-0.2109602, 2.200428, 1.268275, 1, 1, 1, 1, 1,
-0.209954, 0.7918525, 0.3735518, 1, 1, 1, 1, 1,
-0.2061445, -1.265535, -2.064528, 1, 1, 1, 1, 1,
-0.2050191, 1.296123, -0.8798725, 0, 0, 1, 1, 1,
-0.2041338, -0.6736544, -2.338896, 1, 0, 0, 1, 1,
-0.2031069, 1.696233, -0.8421192, 1, 0, 0, 1, 1,
-0.2012379, -0.0701835, -2.309745, 1, 0, 0, 1, 1,
-0.1987288, 0.722101, 0.09058118, 1, 0, 0, 1, 1,
-0.1922729, 0.04976704, -0.7930025, 1, 0, 0, 1, 1,
-0.1814407, -0.3963847, -3.048005, 0, 0, 0, 1, 1,
-0.1801478, 1.110441, -1.119609, 0, 0, 0, 1, 1,
-0.179945, -0.09812491, -0.9050229, 0, 0, 0, 1, 1,
-0.1746553, -1.823041, -3.933477, 0, 0, 0, 1, 1,
-0.172445, -1.119064, -3.331154, 0, 0, 0, 1, 1,
-0.1714381, -0.06979901, -1.055706, 0, 0, 0, 1, 1,
-0.1680661, 1.064755, -0.7866843, 0, 0, 0, 1, 1,
-0.1679797, -0.6211242, -3.183027, 1, 1, 1, 1, 1,
-0.1675983, 1.444996, -0.7757366, 1, 1, 1, 1, 1,
-0.1675509, -1.368114, -2.432822, 1, 1, 1, 1, 1,
-0.1657056, 0.1151131, -0.8013204, 1, 1, 1, 1, 1,
-0.1440105, -1.051527, -3.275299, 1, 1, 1, 1, 1,
-0.1433489, 0.3566868, -0.3584453, 1, 1, 1, 1, 1,
-0.1370245, -0.396452, -1.999776, 1, 1, 1, 1, 1,
-0.1366533, 1.434259, -0.1294268, 1, 1, 1, 1, 1,
-0.1315623, -1.103604, -2.599762, 1, 1, 1, 1, 1,
-0.1234262, -0.007169385, -1.998244, 1, 1, 1, 1, 1,
-0.1224325, 0.5029293, 0.2846299, 1, 1, 1, 1, 1,
-0.1180898, -0.6718975, -1.804518, 1, 1, 1, 1, 1,
-0.1147637, -2.50743, -2.291929, 1, 1, 1, 1, 1,
-0.1146025, 1.814964, 1.134298, 1, 1, 1, 1, 1,
-0.1136803, 0.4172105, -0.783654, 1, 1, 1, 1, 1,
-0.1090725, -2.244607, -2.166602, 0, 0, 1, 1, 1,
-0.106818, 0.6727799, -0.3754975, 1, 0, 0, 1, 1,
-0.1040958, 0.1138786, -0.717302, 1, 0, 0, 1, 1,
-0.102794, -0.9073913, -2.067481, 1, 0, 0, 1, 1,
-0.1023301, 0.3938055, -0.2781653, 1, 0, 0, 1, 1,
-0.09768955, -0.4872949, -3.386904, 1, 0, 0, 1, 1,
-0.09492978, 1.421509, -0.262255, 0, 0, 0, 1, 1,
-0.09465993, -0.6238812, -4.275184, 0, 0, 0, 1, 1,
-0.09181483, -0.09416869, -2.832787, 0, 0, 0, 1, 1,
-0.09119572, -0.4063539, -4.366214, 0, 0, 0, 1, 1,
-0.08845019, 0.2371936, -2.649426, 0, 0, 0, 1, 1,
-0.08714048, -0.08208515, -0.9158835, 0, 0, 0, 1, 1,
-0.0866463, 0.3259872, -1.740592, 0, 0, 0, 1, 1,
-0.08442621, -0.9859125, -3.416397, 1, 1, 1, 1, 1,
-0.08275367, -0.06266358, -1.985419, 1, 1, 1, 1, 1,
-0.07993201, -1.158007, -4.522216, 1, 1, 1, 1, 1,
-0.07803354, 0.5444242, 1.349021, 1, 1, 1, 1, 1,
-0.07398949, -0.04021529, -1.843583, 1, 1, 1, 1, 1,
-0.07216174, 0.1989291, -0.4301812, 1, 1, 1, 1, 1,
-0.06964922, -0.8802947, -3.295143, 1, 1, 1, 1, 1,
-0.06277623, -0.803443, -2.691118, 1, 1, 1, 1, 1,
-0.0611934, -1.1329, -3.48907, 1, 1, 1, 1, 1,
-0.0610344, 0.3710111, -1.557217, 1, 1, 1, 1, 1,
-0.05638945, 0.5616309, -1.105645, 1, 1, 1, 1, 1,
-0.0539057, -0.6432183, -2.058447, 1, 1, 1, 1, 1,
-0.04885905, -1.728205, -1.185972, 1, 1, 1, 1, 1,
-0.04885365, 3.052843, 0.7124885, 1, 1, 1, 1, 1,
-0.04395948, 0.05709175, -0.9605386, 1, 1, 1, 1, 1,
-0.03755106, -1.058224, -3.582614, 0, 0, 1, 1, 1,
-0.03490686, -0.5610399, -2.303591, 1, 0, 0, 1, 1,
-0.03389655, 1.168362, 0.5767223, 1, 0, 0, 1, 1,
-0.03136179, -0.775683, -1.813017, 1, 0, 0, 1, 1,
-0.02787838, -0.5715332, -1.737663, 1, 0, 0, 1, 1,
-0.02745636, -0.2077685, -3.920591, 1, 0, 0, 1, 1,
-0.02727941, 0.01928178, -0.7898826, 0, 0, 0, 1, 1,
-0.02418667, 0.09917289, -0.6274326, 0, 0, 0, 1, 1,
-0.02297027, -0.7346854, -2.222165, 0, 0, 0, 1, 1,
-0.01405942, -0.3298633, -3.01408, 0, 0, 0, 1, 1,
-0.01357674, -0.9066274, -3.205343, 0, 0, 0, 1, 1,
-0.01238817, 0.9956968, 0.1526054, 0, 0, 0, 1, 1,
-0.0122681, 1.001117, -1.017826, 0, 0, 0, 1, 1,
-0.01217236, 0.05207397, -1.607175, 1, 1, 1, 1, 1,
-0.006641603, -0.4970392, -1.933635, 1, 1, 1, 1, 1,
-0.003541243, -1.717997, -2.251342, 1, 1, 1, 1, 1,
-0.000447269, 0.9168743, 1.189258, 1, 1, 1, 1, 1,
0.00441679, 0.1942905, 1.030576, 1, 1, 1, 1, 1,
0.005533854, -0.5908841, 1.938157, 1, 1, 1, 1, 1,
0.01263219, -0.368836, 2.594544, 1, 1, 1, 1, 1,
0.02091189, -0.1014601, 3.185838, 1, 1, 1, 1, 1,
0.02516796, 1.278678, 0.6328141, 1, 1, 1, 1, 1,
0.02701202, 0.8408824, 0.5742035, 1, 1, 1, 1, 1,
0.02953016, -0.5775261, 2.674732, 1, 1, 1, 1, 1,
0.03124006, -0.3682058, 3.359295, 1, 1, 1, 1, 1,
0.03402074, 1.344272, 0.08292481, 1, 1, 1, 1, 1,
0.03810113, 0.04835341, 1.144359, 1, 1, 1, 1, 1,
0.03925831, 0.383569, 0.6175952, 1, 1, 1, 1, 1,
0.0400444, 0.519517, -1.255095, 0, 0, 1, 1, 1,
0.04192708, -0.9109463, 2.681474, 1, 0, 0, 1, 1,
0.04800505, -0.191774, 4.849672, 1, 0, 0, 1, 1,
0.05365233, -1.111361, 2.396933, 1, 0, 0, 1, 1,
0.05381249, -1.076039, 3.175539, 1, 0, 0, 1, 1,
0.05441572, -0.7990645, 2.992665, 1, 0, 0, 1, 1,
0.06564502, 0.2380415, 1.790042, 0, 0, 0, 1, 1,
0.07539862, -0.7659269, 3.38294, 0, 0, 0, 1, 1,
0.07892148, -0.05004553, 1.230949, 0, 0, 0, 1, 1,
0.08037309, 0.01082412, 0.8596169, 0, 0, 0, 1, 1,
0.08636986, 0.1664188, 0.2812879, 0, 0, 0, 1, 1,
0.08719395, 0.5744433, -0.1548988, 0, 0, 0, 1, 1,
0.08761723, -0.14281, 2.507282, 0, 0, 0, 1, 1,
0.08964337, 1.192528, 0.2163574, 1, 1, 1, 1, 1,
0.08984436, 0.7800984, 0.121546, 1, 1, 1, 1, 1,
0.09268631, 0.3153217, -1.080044, 1, 1, 1, 1, 1,
0.09942334, -1.410768, 2.717406, 1, 1, 1, 1, 1,
0.1022451, 2.080654, 0.1757154, 1, 1, 1, 1, 1,
0.1043551, 0.04431865, 0.6724415, 1, 1, 1, 1, 1,
0.1096525, -0.5252795, 2.284925, 1, 1, 1, 1, 1,
0.1103166, 0.1526577, 0.8166516, 1, 1, 1, 1, 1,
0.1146901, 0.04179745, 2.081939, 1, 1, 1, 1, 1,
0.1174188, 0.9449468, 1.064088, 1, 1, 1, 1, 1,
0.119361, -1.797077, 2.743131, 1, 1, 1, 1, 1,
0.1202261, 1.832132, -0.5666013, 1, 1, 1, 1, 1,
0.1228299, -0.5138502, 2.604344, 1, 1, 1, 1, 1,
0.1229375, 0.9146737, -1.496299, 1, 1, 1, 1, 1,
0.1231835, 1.175618, 1.248192, 1, 1, 1, 1, 1,
0.1255064, 1.038762, -1.213328, 0, 0, 1, 1, 1,
0.1295161, 0.2465056, 1.031649, 1, 0, 0, 1, 1,
0.1300908, 0.1379717, 2.386365, 1, 0, 0, 1, 1,
0.1333487, 0.4375041, -0.004651378, 1, 0, 0, 1, 1,
0.1400586, 0.06437799, -0.2911881, 1, 0, 0, 1, 1,
0.140406, -0.301411, 3.843407, 1, 0, 0, 1, 1,
0.1428119, 0.5061635, 1.331164, 0, 0, 0, 1, 1,
0.1460335, -0.3376773, 3.888272, 0, 0, 0, 1, 1,
0.1462082, -0.2986045, 3.770295, 0, 0, 0, 1, 1,
0.148391, -0.9489643, 0.2307239, 0, 0, 0, 1, 1,
0.1574955, -0.3410326, 1.463987, 0, 0, 0, 1, 1,
0.1581419, 0.6732664, 1.816724, 0, 0, 0, 1, 1,
0.159894, -1.356947, 1.731366, 0, 0, 0, 1, 1,
0.162792, 1.634358, -0.3662354, 1, 1, 1, 1, 1,
0.1645584, 0.8089297, -0.1470651, 1, 1, 1, 1, 1,
0.165343, -0.5959833, 2.810585, 1, 1, 1, 1, 1,
0.1691727, 1.005568, -0.3512854, 1, 1, 1, 1, 1,
0.1744926, 0.07472411, 2.160022, 1, 1, 1, 1, 1,
0.1843904, -1.471587, 2.179199, 1, 1, 1, 1, 1,
0.1850747, 0.2463821, -1.261248, 1, 1, 1, 1, 1,
0.190858, -0.7509884, 2.351731, 1, 1, 1, 1, 1,
0.1928007, -1.476592, 3.00692, 1, 1, 1, 1, 1,
0.1962899, 0.6936258, 2.29039, 1, 1, 1, 1, 1,
0.1969132, -0.4726561, 3.640228, 1, 1, 1, 1, 1,
0.1977308, -1.174961, 4.434145, 1, 1, 1, 1, 1,
0.2015671, 1.706488, -1.204245, 1, 1, 1, 1, 1,
0.2020831, -1.044016, 3.594491, 1, 1, 1, 1, 1,
0.2049103, 0.5863714, 0.4227465, 1, 1, 1, 1, 1,
0.206081, -1.012201, 3.001429, 0, 0, 1, 1, 1,
0.2079793, 0.2446564, 1.208481, 1, 0, 0, 1, 1,
0.2087109, -1.597994, 1.396789, 1, 0, 0, 1, 1,
0.2106119, -0.7545826, 2.114912, 1, 0, 0, 1, 1,
0.212119, 0.1461717, 1.148603, 1, 0, 0, 1, 1,
0.2143759, -1.412896, 1.820638, 1, 0, 0, 1, 1,
0.2148959, 2.39394, -0.1013878, 0, 0, 0, 1, 1,
0.2157578, 1.065911, -0.7361686, 0, 0, 0, 1, 1,
0.2187071, 1.321945, 0.2118782, 0, 0, 0, 1, 1,
0.2190603, 0.6450177, 0.3757926, 0, 0, 0, 1, 1,
0.2197029, 1.018044, 0.6944473, 0, 0, 0, 1, 1,
0.2205172, -0.3221545, 3.689037, 0, 0, 0, 1, 1,
0.220798, -0.7481588, 3.90927, 0, 0, 0, 1, 1,
0.222757, -0.08545458, 1.886592, 1, 1, 1, 1, 1,
0.2317289, -0.01758835, 1.654812, 1, 1, 1, 1, 1,
0.234612, -0.4583506, 1.376925, 1, 1, 1, 1, 1,
0.2365395, 1.26604, 1.670072, 1, 1, 1, 1, 1,
0.2382665, -0.5657618, 1.238857, 1, 1, 1, 1, 1,
0.2431189, -0.06025562, 0.9481511, 1, 1, 1, 1, 1,
0.243282, -0.7394766, 1.631408, 1, 1, 1, 1, 1,
0.243366, 0.9704988, 0.1970746, 1, 1, 1, 1, 1,
0.2440906, 0.6312153, 1.101379, 1, 1, 1, 1, 1,
0.2465724, -0.3507407, 2.747928, 1, 1, 1, 1, 1,
0.2477978, -0.6632756, 3.218101, 1, 1, 1, 1, 1,
0.2553523, -1.033941, 3.872059, 1, 1, 1, 1, 1,
0.2593199, 1.09132, 0.9149545, 1, 1, 1, 1, 1,
0.2617828, 1.557564, -0.1536093, 1, 1, 1, 1, 1,
0.2628701, 1.252206, -0.6240059, 1, 1, 1, 1, 1,
0.2643069, -0.6697755, 2.262366, 0, 0, 1, 1, 1,
0.2644673, -0.2212292, 1.133437, 1, 0, 0, 1, 1,
0.2656553, 0.2181499, 1.087859, 1, 0, 0, 1, 1,
0.2678177, 0.5043655, 1.082554, 1, 0, 0, 1, 1,
0.2694224, 0.04736546, 0.1446075, 1, 0, 0, 1, 1,
0.2716837, -0.8094246, 1.928187, 1, 0, 0, 1, 1,
0.2755972, -0.6453236, 1.690264, 0, 0, 0, 1, 1,
0.2807488, -0.6653316, 3.370085, 0, 0, 0, 1, 1,
0.2807869, -1.383251, 1.289091, 0, 0, 0, 1, 1,
0.2825203, 0.3448563, 1.237141, 0, 0, 0, 1, 1,
0.2837433, 0.7794193, 0.3242276, 0, 0, 0, 1, 1,
0.2842134, 2.049165, -0.1550352, 0, 0, 0, 1, 1,
0.2861267, -0.1474148, 2.81467, 0, 0, 0, 1, 1,
0.291195, 0.269214, 0.2963917, 1, 1, 1, 1, 1,
0.2938603, -1.071942, 2.259582, 1, 1, 1, 1, 1,
0.2949131, 0.3316066, 1.363116, 1, 1, 1, 1, 1,
0.2957351, -0.1164512, 1.903727, 1, 1, 1, 1, 1,
0.2960751, 0.4006265, -0.5672043, 1, 1, 1, 1, 1,
0.2965183, -0.463281, 2.591115, 1, 1, 1, 1, 1,
0.2989642, -0.8770174, 3.52299, 1, 1, 1, 1, 1,
0.3012844, 0.4096088, -0.1105769, 1, 1, 1, 1, 1,
0.3030452, 0.5985128, 1.3881, 1, 1, 1, 1, 1,
0.3045616, 1.356921, -1.467929, 1, 1, 1, 1, 1,
0.3058748, 0.427851, -1.614931, 1, 1, 1, 1, 1,
0.308058, -0.9795091, 3.553725, 1, 1, 1, 1, 1,
0.3082319, -0.4596035, 1.099487, 1, 1, 1, 1, 1,
0.3152207, 2.090441, -1.099186, 1, 1, 1, 1, 1,
0.3167615, 1.798222, 0.6746067, 1, 1, 1, 1, 1,
0.3201101, 2.649436, -1.567476, 0, 0, 1, 1, 1,
0.3224643, 1.432618, -0.5136355, 1, 0, 0, 1, 1,
0.3295417, -0.3453836, 1.357781, 1, 0, 0, 1, 1,
0.3311727, 0.7400035, -1.221766, 1, 0, 0, 1, 1,
0.3359807, 1.020788, -0.9181373, 1, 0, 0, 1, 1,
0.3360275, 0.978362, 1.105922, 1, 0, 0, 1, 1,
0.3375846, -1.299047, 3.604696, 0, 0, 0, 1, 1,
0.3422183, -0.4715325, 2.803246, 0, 0, 0, 1, 1,
0.3428749, 0.01700073, 0.1624578, 0, 0, 0, 1, 1,
0.3448364, -0.0343212, 1.581366, 0, 0, 0, 1, 1,
0.3453082, -0.3269381, 1.712748, 0, 0, 0, 1, 1,
0.348132, 2.038734, -1.1443, 0, 0, 0, 1, 1,
0.3510814, -0.1364893, 3.530202, 0, 0, 0, 1, 1,
0.3530549, 1.094457, 0.2659289, 1, 1, 1, 1, 1,
0.3649416, -0.9451602, 2.552554, 1, 1, 1, 1, 1,
0.3695182, 0.06381068, 0.08710577, 1, 1, 1, 1, 1,
0.378818, -0.0785483, 0.7227811, 1, 1, 1, 1, 1,
0.3811094, 0.2730134, 0.9556234, 1, 1, 1, 1, 1,
0.3811521, -0.8516667, 3.526964, 1, 1, 1, 1, 1,
0.3861038, -0.1036402, -0.003749962, 1, 1, 1, 1, 1,
0.3867115, -0.01633539, 2.308961, 1, 1, 1, 1, 1,
0.3908174, 0.0009399038, 0.2529944, 1, 1, 1, 1, 1,
0.3935014, 0.06099498, 1.338966, 1, 1, 1, 1, 1,
0.3944024, 1.61292, 0.1006918, 1, 1, 1, 1, 1,
0.3970412, 0.2285678, 0.4005364, 1, 1, 1, 1, 1,
0.3976025, 1.340748, -0.3670003, 1, 1, 1, 1, 1,
0.4002638, 1.611548, 0.2208358, 1, 1, 1, 1, 1,
0.4096488, 1.099079, 0.3942755, 1, 1, 1, 1, 1,
0.4195139, -0.2197583, 3.126787, 0, 0, 1, 1, 1,
0.4201407, 0.6865032, 1.217889, 1, 0, 0, 1, 1,
0.421048, -0.7831137, 1.459414, 1, 0, 0, 1, 1,
0.4333974, 1.08158, 0.376767, 1, 0, 0, 1, 1,
0.4334079, -1.662624, 5.648046, 1, 0, 0, 1, 1,
0.4377986, -0.5397764, 3.369981, 1, 0, 0, 1, 1,
0.4390201, 0.2691875, 1.124971, 0, 0, 0, 1, 1,
0.4403953, -0.8812506, 2.122237, 0, 0, 0, 1, 1,
0.4407408, 0.8492048, 0.02067355, 0, 0, 0, 1, 1,
0.4417318, -0.9637662, 2.995091, 0, 0, 0, 1, 1,
0.4506012, -0.3923256, 2.912667, 0, 0, 0, 1, 1,
0.4538032, 0.5220406, 1.305655, 0, 0, 0, 1, 1,
0.4578608, -2.18692, 2.960192, 0, 0, 0, 1, 1,
0.459752, -0.8158581, 2.099412, 1, 1, 1, 1, 1,
0.4603194, 1.195768, 1.075306, 1, 1, 1, 1, 1,
0.463414, -2.014599, 2.949151, 1, 1, 1, 1, 1,
0.4676144, 0.33377, 1.76145, 1, 1, 1, 1, 1,
0.4759584, -1.093528, 2.655304, 1, 1, 1, 1, 1,
0.4804136, -0.5096263, 1.543453, 1, 1, 1, 1, 1,
0.4832186, 0.5738742, -0.4232758, 1, 1, 1, 1, 1,
0.4847561, -0.3225628, 0.8100184, 1, 1, 1, 1, 1,
0.4884791, 0.3939995, 0.8592126, 1, 1, 1, 1, 1,
0.4886774, -1.684911, 1.451328, 1, 1, 1, 1, 1,
0.4895552, 0.4332561, 2.140001, 1, 1, 1, 1, 1,
0.4907001, 1.341176, 2.048565, 1, 1, 1, 1, 1,
0.4948648, -0.08609649, 2.078556, 1, 1, 1, 1, 1,
0.4960766, -2.710487, 2.798839, 1, 1, 1, 1, 1,
0.4966558, -0.3728084, 2.367211, 1, 1, 1, 1, 1,
0.4977896, -0.7941391, 4.31492, 0, 0, 1, 1, 1,
0.4981945, -0.3340721, 2.64504, 1, 0, 0, 1, 1,
0.5009444, -0.2678451, 1.863511, 1, 0, 0, 1, 1,
0.504259, -0.5432137, 0.6258635, 1, 0, 0, 1, 1,
0.5052653, 1.240078, 1.531231, 1, 0, 0, 1, 1,
0.5070634, -1.390835, 2.942587, 1, 0, 0, 1, 1,
0.5070863, 0.3602728, 3.043478, 0, 0, 0, 1, 1,
0.5090511, 0.5688021, 1.694331, 0, 0, 0, 1, 1,
0.5105304, 0.1745342, 1.858367, 0, 0, 0, 1, 1,
0.5105334, -0.4983159, 3.668989, 0, 0, 0, 1, 1,
0.5151258, 1.73606, 0.4715041, 0, 0, 0, 1, 1,
0.5171048, 0.1224508, 1.924147, 0, 0, 0, 1, 1,
0.522206, -0.7870746, 3.6457, 0, 0, 0, 1, 1,
0.5242958, 0.9251931, 0.09014431, 1, 1, 1, 1, 1,
0.524618, -1.108662, 3.31052, 1, 1, 1, 1, 1,
0.5324808, -0.05783539, 3.569025, 1, 1, 1, 1, 1,
0.5351016, -0.5650066, 2.536813, 1, 1, 1, 1, 1,
0.535509, -1.649611, 2.576711, 1, 1, 1, 1, 1,
0.5454913, 1.126307, -0.4013493, 1, 1, 1, 1, 1,
0.5511404, -0.3308954, 1.84593, 1, 1, 1, 1, 1,
0.5514444, 0.5102767, 0.4241224, 1, 1, 1, 1, 1,
0.5601261, -0.8363899, 1.591444, 1, 1, 1, 1, 1,
0.5611361, -0.4181314, 3.522181, 1, 1, 1, 1, 1,
0.5626138, -0.929085, 3.432612, 1, 1, 1, 1, 1,
0.5661882, 0.7993237, 0.8640224, 1, 1, 1, 1, 1,
0.566624, 0.359695, 1.438566, 1, 1, 1, 1, 1,
0.5676028, 0.5517008, -0.2448842, 1, 1, 1, 1, 1,
0.5703418, -0.4085019, 3.364602, 1, 1, 1, 1, 1,
0.5704787, -1.019561, 2.009747, 0, 0, 1, 1, 1,
0.5704878, 1.409118, 1.231302, 1, 0, 0, 1, 1,
0.5711931, 0.7357335, 1.278116, 1, 0, 0, 1, 1,
0.5731673, 1.570302, 0.2498277, 1, 0, 0, 1, 1,
0.573707, -0.1767375, 1.008554, 1, 0, 0, 1, 1,
0.5755039, -0.1611026, 1.488527, 1, 0, 0, 1, 1,
0.5807715, 0.6256368, 0.05591471, 0, 0, 0, 1, 1,
0.5830666, -0.1216, 2.218451, 0, 0, 0, 1, 1,
0.5835821, 0.6416324, 1.411237, 0, 0, 0, 1, 1,
0.5931126, -1.947281, 2.23106, 0, 0, 0, 1, 1,
0.5933683, -1.729269, 2.911566, 0, 0, 0, 1, 1,
0.6057225, -1.308479, 3.387923, 0, 0, 0, 1, 1,
0.607284, -0.2449127, 4.258497, 0, 0, 0, 1, 1,
0.6073939, -0.5897052, 0.9463034, 1, 1, 1, 1, 1,
0.6104428, -1.773723, 3.881692, 1, 1, 1, 1, 1,
0.6125976, -0.2025921, 3.502528, 1, 1, 1, 1, 1,
0.6131463, -0.3340179, 2.190929, 1, 1, 1, 1, 1,
0.6194839, -0.6968634, 2.549171, 1, 1, 1, 1, 1,
0.6220243, -1.878564, 2.375114, 1, 1, 1, 1, 1,
0.6231519, 0.1015927, 1.539917, 1, 1, 1, 1, 1,
0.6234673, 1.333717, 0.1100031, 1, 1, 1, 1, 1,
0.6252586, 0.140302, 0.4350227, 1, 1, 1, 1, 1,
0.6259587, 0.4732056, 1.707539, 1, 1, 1, 1, 1,
0.6264533, -0.9112369, 2.237459, 1, 1, 1, 1, 1,
0.6297479, -0.6135536, 2.371269, 1, 1, 1, 1, 1,
0.6337994, -0.2988586, 0.2174488, 1, 1, 1, 1, 1,
0.6348556, 0.1424641, 0.8119372, 1, 1, 1, 1, 1,
0.6349799, -0.3582659, 3.469246, 1, 1, 1, 1, 1,
0.6350863, -2.007586, 3.46911, 0, 0, 1, 1, 1,
0.6358874, 0.3276664, 3.05539, 1, 0, 0, 1, 1,
0.6407689, 0.2090128, 1.127771, 1, 0, 0, 1, 1,
0.6432092, 1.070212, -0.1038196, 1, 0, 0, 1, 1,
0.6467764, 0.3195373, 1.409536, 1, 0, 0, 1, 1,
0.6491712, -1.149578, 1.009534, 1, 0, 0, 1, 1,
0.6516204, -0.4991774, 1.748273, 0, 0, 0, 1, 1,
0.6533344, -0.7707646, 4.046849, 0, 0, 0, 1, 1,
0.6533784, 1.11795, -0.4892193, 0, 0, 0, 1, 1,
0.6536795, -0.9216916, 2.102615, 0, 0, 0, 1, 1,
0.6622103, 0.9442328, 0.7112094, 0, 0, 0, 1, 1,
0.6658278, 0.222885, 1.216541, 0, 0, 0, 1, 1,
0.6661087, -0.4916105, 2.262806, 0, 0, 0, 1, 1,
0.6697888, 0.6922083, -0.8193361, 1, 1, 1, 1, 1,
0.6744277, -0.3354629, 1.041302, 1, 1, 1, 1, 1,
0.6862045, -0.5855898, 1.112956, 1, 1, 1, 1, 1,
0.6869068, -2.538898, 1.922705, 1, 1, 1, 1, 1,
0.6870776, -0.9997486, 2.25287, 1, 1, 1, 1, 1,
0.6871943, 0.4212113, -1.702617, 1, 1, 1, 1, 1,
0.6878574, -1.403415, 3.117791, 1, 1, 1, 1, 1,
0.6884897, -0.6812363, 1.85813, 1, 1, 1, 1, 1,
0.6889692, -1.241664, 2.657237, 1, 1, 1, 1, 1,
0.7027358, -0.1148232, 0.9769827, 1, 1, 1, 1, 1,
0.7056208, -1.618018, 2.055242, 1, 1, 1, 1, 1,
0.7060253, 1.628059, 3.028476, 1, 1, 1, 1, 1,
0.7086684, -1.821481, 4.366243, 1, 1, 1, 1, 1,
0.7088338, 0.2858216, 1.387471, 1, 1, 1, 1, 1,
0.7157627, 0.00296486, 1.403447, 1, 1, 1, 1, 1,
0.7158058, 1.699671, 2.099226, 0, 0, 1, 1, 1,
0.7199351, 0.4951407, 0.1178812, 1, 0, 0, 1, 1,
0.7258401, -1.009403, 2.721797, 1, 0, 0, 1, 1,
0.7259238, 0.1957525, 0.2509546, 1, 0, 0, 1, 1,
0.7264351, 0.7341714, -0.2521166, 1, 0, 0, 1, 1,
0.7280278, -1.100047, 2.1685, 1, 0, 0, 1, 1,
0.73092, 0.2421946, 1.071236, 0, 0, 0, 1, 1,
0.7338106, 0.6132292, 0.08546354, 0, 0, 0, 1, 1,
0.7424257, -1.183144, 2.584759, 0, 0, 0, 1, 1,
0.7459232, 1.05371, 0.8581659, 0, 0, 0, 1, 1,
0.7492111, -0.1136967, 2.703003, 0, 0, 0, 1, 1,
0.7520734, 1.207476, 0.9015875, 0, 0, 0, 1, 1,
0.7525845, -1.450357, 1.05794, 0, 0, 0, 1, 1,
0.7532602, 1.022201, 2.268663, 1, 1, 1, 1, 1,
0.7566617, 0.2932321, 1.885895, 1, 1, 1, 1, 1,
0.757753, -0.7376972, 1.555424, 1, 1, 1, 1, 1,
0.7591091, -0.8104519, 0.4958512, 1, 1, 1, 1, 1,
0.7592494, 1.297102, -0.785722, 1, 1, 1, 1, 1,
0.7615768, 2.156532, 0.7620501, 1, 1, 1, 1, 1,
0.7670923, 0.2621812, 0.3741245, 1, 1, 1, 1, 1,
0.7683434, -0.3755629, 3.393971, 1, 1, 1, 1, 1,
0.7700103, -2.49479, 2.647684, 1, 1, 1, 1, 1,
0.7769325, 0.2154833, 2.654479, 1, 1, 1, 1, 1,
0.7779261, 1.054493, -0.2536631, 1, 1, 1, 1, 1,
0.7793079, -0.3517412, 1.230993, 1, 1, 1, 1, 1,
0.7825745, 0.1494831, 1.827253, 1, 1, 1, 1, 1,
0.7838433, -0.9272874, 3.420474, 1, 1, 1, 1, 1,
0.7842792, -0.3097338, 0.8020954, 1, 1, 1, 1, 1,
0.7874491, -0.09605778, 0.3844999, 0, 0, 1, 1, 1,
0.7953803, 0.6837196, 1.969885, 1, 0, 0, 1, 1,
0.7978869, 0.1527553, -0.3459249, 1, 0, 0, 1, 1,
0.8001513, -0.3280149, 1.563024, 1, 0, 0, 1, 1,
0.8006908, 0.424986, -0.4569766, 1, 0, 0, 1, 1,
0.8027911, -0.5762982, 1.176299, 1, 0, 0, 1, 1,
0.8062624, -0.5137953, 1.220219, 0, 0, 0, 1, 1,
0.807514, 0.3233917, -0.8900328, 0, 0, 0, 1, 1,
0.8189995, 2.162968, 0.6048906, 0, 0, 0, 1, 1,
0.8256515, -0.2449495, 1.469965, 0, 0, 0, 1, 1,
0.8266432, 0.9900755, 0.6351157, 0, 0, 0, 1, 1,
0.8315631, 0.9076747, 0.7109632, 0, 0, 0, 1, 1,
0.8338956, 0.2885853, 0.4479144, 0, 0, 0, 1, 1,
0.8360449, -1.064996, 4.987471, 1, 1, 1, 1, 1,
0.8458619, 1.96569, -1.003576, 1, 1, 1, 1, 1,
0.8479066, 1.139519, 0.9464631, 1, 1, 1, 1, 1,
0.8494856, 0.1576858, 1.651332, 1, 1, 1, 1, 1,
0.8585265, 0.01699818, 1.856686, 1, 1, 1, 1, 1,
0.8604632, 1.273577, 0.4856322, 1, 1, 1, 1, 1,
0.8673003, -0.7123533, 0.8019438, 1, 1, 1, 1, 1,
0.8758858, 0.2201783, 0.9228578, 1, 1, 1, 1, 1,
0.878908, 0.3213507, 1.048257, 1, 1, 1, 1, 1,
0.8846773, 0.3368382, 1.833761, 1, 1, 1, 1, 1,
0.8896615, 1.16857, -1.235758, 1, 1, 1, 1, 1,
0.8922108, 0.7616671, 0.6801661, 1, 1, 1, 1, 1,
0.8951902, 0.4508071, 2.215478, 1, 1, 1, 1, 1,
0.8996316, 0.2449709, 2.460073, 1, 1, 1, 1, 1,
0.9030528, 0.1726191, 0.9992989, 1, 1, 1, 1, 1,
0.913298, 0.05097177, 2.156508, 0, 0, 1, 1, 1,
0.9133871, -0.3586612, 1.612787, 1, 0, 0, 1, 1,
0.9170986, 0.627712, -0.05249773, 1, 0, 0, 1, 1,
0.9189768, -0.6583893, 4.317858, 1, 0, 0, 1, 1,
0.9195642, 0.2103386, 0.7603616, 1, 0, 0, 1, 1,
0.9224655, 0.1655578, 0.913846, 1, 0, 0, 1, 1,
0.9236023, -2.105724, 3.148068, 0, 0, 0, 1, 1,
0.9322297, -2.521571, 1.797221, 0, 0, 0, 1, 1,
0.9396055, -1.485456, 3.231339, 0, 0, 0, 1, 1,
0.9517615, 0.6400079, -0.4745421, 0, 0, 0, 1, 1,
0.9536097, -0.1924213, 2.780891, 0, 0, 0, 1, 1,
0.9539344, -0.545313, 2.28846, 0, 0, 0, 1, 1,
0.9543023, 0.3955004, 0.3395524, 0, 0, 0, 1, 1,
0.9552783, -1.854682, 2.064001, 1, 1, 1, 1, 1,
0.9569836, -0.1232237, 0.7856184, 1, 1, 1, 1, 1,
0.9657308, 0.7676388, -0.2735899, 1, 1, 1, 1, 1,
0.9769428, -1.62455, 4.032517, 1, 1, 1, 1, 1,
0.9775569, -0.6979976, 0.6119442, 1, 1, 1, 1, 1,
0.9778719, 0.2486115, 1.161388, 1, 1, 1, 1, 1,
0.9801766, 0.5663172, 0.6863719, 1, 1, 1, 1, 1,
0.9809108, -2.036864, 0.5511653, 1, 1, 1, 1, 1,
0.9901531, 3.387236, -0.07158677, 1, 1, 1, 1, 1,
0.9905149, -1.133642, 2.166835, 1, 1, 1, 1, 1,
0.9994531, 1.087624, -0.371781, 1, 1, 1, 1, 1,
1.001644, 0.3956852, 0.621753, 1, 1, 1, 1, 1,
1.00777, 0.538682, 2.762788, 1, 1, 1, 1, 1,
1.010192, -0.01143012, 3.079975, 1, 1, 1, 1, 1,
1.01112, 0.1206315, 2.31194, 1, 1, 1, 1, 1,
1.012264, -0.723411, 2.031379, 0, 0, 1, 1, 1,
1.014262, 0.2002295, -0.1565911, 1, 0, 0, 1, 1,
1.016486, -0.0317068, 2.497258, 1, 0, 0, 1, 1,
1.017872, -0.5393572, 0.7670604, 1, 0, 0, 1, 1,
1.018137, 0.8330814, -0.609707, 1, 0, 0, 1, 1,
1.021153, 1.607826, 2.380939, 1, 0, 0, 1, 1,
1.025294, -0.4263471, 1.632892, 0, 0, 0, 1, 1,
1.029294, 0.7756397, 1.865262, 0, 0, 0, 1, 1,
1.036721, 1.140346, -1.093164, 0, 0, 0, 1, 1,
1.044643, 1.456457, -0.03830498, 0, 0, 0, 1, 1,
1.045869, -0.07147835, 1.754642, 0, 0, 0, 1, 1,
1.049012, -0.04341301, 0.7866217, 0, 0, 0, 1, 1,
1.051155, 1.877679, 1.489135, 0, 0, 0, 1, 1,
1.055252, -1.317922, 3.617414, 1, 1, 1, 1, 1,
1.064189, 1.041144, 1.512491, 1, 1, 1, 1, 1,
1.069188, 0.3307311, 0.2372903, 1, 1, 1, 1, 1,
1.079665, 0.5173312, 0.7804117, 1, 1, 1, 1, 1,
1.081212, 0.1779603, 2.059315, 1, 1, 1, 1, 1,
1.081692, 0.8015348, 1.327577, 1, 1, 1, 1, 1,
1.08386, -1.774544, 1.844713, 1, 1, 1, 1, 1,
1.08393, 0.5374962, -0.3027094, 1, 1, 1, 1, 1,
1.084691, 1.262177, 1.713753, 1, 1, 1, 1, 1,
1.087445, 0.9067777, -0.5168992, 1, 1, 1, 1, 1,
1.088561, 1.596701, 0.7621822, 1, 1, 1, 1, 1,
1.089794, 0.0658883, 2.29544, 1, 1, 1, 1, 1,
1.089995, -0.4828526, 2.969308, 1, 1, 1, 1, 1,
1.097395, 1.136305, 0.1949008, 1, 1, 1, 1, 1,
1.103325, -1.175151, 3.13203, 1, 1, 1, 1, 1,
1.104697, 0.1071721, 0.4334931, 0, 0, 1, 1, 1,
1.110395, -0.5640786, 2.359405, 1, 0, 0, 1, 1,
1.113616, -0.7129645, 0.591065, 1, 0, 0, 1, 1,
1.119076, -0.3554468, 1.399985, 1, 0, 0, 1, 1,
1.124582, 2.284568, -0.404484, 1, 0, 0, 1, 1,
1.125161, -0.8341223, 2.621495, 1, 0, 0, 1, 1,
1.131361, 0.6203374, -0.5721295, 0, 0, 0, 1, 1,
1.132892, 1.675253, 0.003453238, 0, 0, 0, 1, 1,
1.135097, 0.1851724, 0.3346937, 0, 0, 0, 1, 1,
1.148156, 1.270501, 1.410287, 0, 0, 0, 1, 1,
1.158077, 0.2984269, 1.287817, 0, 0, 0, 1, 1,
1.160067, 0.3006691, 2.739802, 0, 0, 0, 1, 1,
1.162331, -0.7894617, 2.56451, 0, 0, 0, 1, 1,
1.164376, 0.02006304, 0.9253035, 1, 1, 1, 1, 1,
1.168028, 0.5824013, 0.8818989, 1, 1, 1, 1, 1,
1.174714, -0.4274601, 2.909475, 1, 1, 1, 1, 1,
1.181105, 0.5574953, 1.427971, 1, 1, 1, 1, 1,
1.181305, -1.67362, 1.888211, 1, 1, 1, 1, 1,
1.181614, -0.1891461, 0.5011125, 1, 1, 1, 1, 1,
1.19963, -0.9635652, 0.6248422, 1, 1, 1, 1, 1,
1.200974, -0.03050499, 0.7833793, 1, 1, 1, 1, 1,
1.223517, -0.06153018, 2.853678, 1, 1, 1, 1, 1,
1.234265, 0.4885181, 0.5950037, 1, 1, 1, 1, 1,
1.237125, -0.6288158, 1.053555, 1, 1, 1, 1, 1,
1.238663, 1.146097, 2.135703, 1, 1, 1, 1, 1,
1.241832, 0.1668058, 1.406922, 1, 1, 1, 1, 1,
1.243584, -0.7392297, 3.444888, 1, 1, 1, 1, 1,
1.252928, 1.015908, 1.480532, 1, 1, 1, 1, 1,
1.265263, -2.073077, 2.901725, 0, 0, 1, 1, 1,
1.277392, -0.3536152, 1.505445, 1, 0, 0, 1, 1,
1.279958, 1.216612, 1.842349, 1, 0, 0, 1, 1,
1.281868, -0.09023251, 0.9985152, 1, 0, 0, 1, 1,
1.286168, 0.108142, 0.2199652, 1, 0, 0, 1, 1,
1.288699, 0.09210151, 2.622442, 1, 0, 0, 1, 1,
1.289328, 0.7299291, 0.9001533, 0, 0, 0, 1, 1,
1.293673, -1.201515, 2.190563, 0, 0, 0, 1, 1,
1.299566, -0.26131, 1.19849, 0, 0, 0, 1, 1,
1.314366, 0.2397126, 0.03134004, 0, 0, 0, 1, 1,
1.325922, 0.2235077, 1.614898, 0, 0, 0, 1, 1,
1.331576, -0.08715302, 3.05759, 0, 0, 0, 1, 1,
1.3368, 0.1842607, 2.709428, 0, 0, 0, 1, 1,
1.34124, -0.4317858, 1.955015, 1, 1, 1, 1, 1,
1.344158, -1.751597, 1.839568, 1, 1, 1, 1, 1,
1.362491, -0.2357594, 3.003214, 1, 1, 1, 1, 1,
1.362743, 1.30423, -0.1278684, 1, 1, 1, 1, 1,
1.368377, 0.1373182, 1.541424, 1, 1, 1, 1, 1,
1.375792, -0.1871046, 2.388491, 1, 1, 1, 1, 1,
1.376101, 0.5693076, 0.7585291, 1, 1, 1, 1, 1,
1.382312, 1.657452, 0.682247, 1, 1, 1, 1, 1,
1.383075, 0.6830025, 0.8395741, 1, 1, 1, 1, 1,
1.388198, 1.18371, -1.277923, 1, 1, 1, 1, 1,
1.388894, 0.5694951, 0.1266303, 1, 1, 1, 1, 1,
1.401343, -0.01123158, 1.362423, 1, 1, 1, 1, 1,
1.403386, 1.86773, 0.6924723, 1, 1, 1, 1, 1,
1.4041, -1.531072, 3.244805, 1, 1, 1, 1, 1,
1.406463, -1.317867, 3.089697, 1, 1, 1, 1, 1,
1.415348, 2.476033, 0.8759682, 0, 0, 1, 1, 1,
1.419287, 0.06368811, 1.628107, 1, 0, 0, 1, 1,
1.421597, 2.300959, -0.8923054, 1, 0, 0, 1, 1,
1.427299, -0.9835644, 3.427789, 1, 0, 0, 1, 1,
1.437004, 1.556197, -1.071147, 1, 0, 0, 1, 1,
1.454615, -0.5841681, 0.6942724, 1, 0, 0, 1, 1,
1.473411, 0.8093331, 2.144149, 0, 0, 0, 1, 1,
1.474365, 0.8600848, -0.218371, 0, 0, 0, 1, 1,
1.474999, -0.1227898, 0.7929726, 0, 0, 0, 1, 1,
1.486128, 0.2336189, 3.018562, 0, 0, 0, 1, 1,
1.498239, -1.251659, 4.163143, 0, 0, 0, 1, 1,
1.506142, -0.9901865, 2.563844, 0, 0, 0, 1, 1,
1.52402, -0.846539, 2.231152, 0, 0, 0, 1, 1,
1.533754, -1.533236, 1.613464, 1, 1, 1, 1, 1,
1.538615, 0.1514836, 0.8656471, 1, 1, 1, 1, 1,
1.546975, 0.3863413, 1.385248, 1, 1, 1, 1, 1,
1.557267, -0.2141223, 1.943373, 1, 1, 1, 1, 1,
1.560475, 0.1726492, -0.002636014, 1, 1, 1, 1, 1,
1.579448, 0.02121968, 0.2850295, 1, 1, 1, 1, 1,
1.590671, -0.734529, 3.281241, 1, 1, 1, 1, 1,
1.601096, 0.8423823, 0.9896758, 1, 1, 1, 1, 1,
1.611011, -0.6830752, 2.236113, 1, 1, 1, 1, 1,
1.626994, 0.1942579, 0.3680841, 1, 1, 1, 1, 1,
1.642106, -0.3387697, 2.870884, 1, 1, 1, 1, 1,
1.677581, 0.3112652, 0.5826105, 1, 1, 1, 1, 1,
1.683895, -0.4263667, 1.263576, 1, 1, 1, 1, 1,
1.686327, -0.3160297, 0.1166616, 1, 1, 1, 1, 1,
1.706408, 0.6216421, 1.192597, 1, 1, 1, 1, 1,
1.707208, 0.2248621, 1.779513, 0, 0, 1, 1, 1,
1.707706, 1.41977, 0.5477154, 1, 0, 0, 1, 1,
1.709727, -0.7347698, 2.247155, 1, 0, 0, 1, 1,
1.720794, -1.998165, 2.887252, 1, 0, 0, 1, 1,
1.722874, 1.086316, 2.503102, 1, 0, 0, 1, 1,
1.731641, 0.9065768, -0.5602101, 1, 0, 0, 1, 1,
1.750016, 1.195348, 0.7182634, 0, 0, 0, 1, 1,
1.783645, -1.605606, 2.513637, 0, 0, 0, 1, 1,
1.785565, 0.09684885, 1.508959, 0, 0, 0, 1, 1,
1.823904, 0.7091731, 1.10005, 0, 0, 0, 1, 1,
1.841052, -1.293809, 2.525493, 0, 0, 0, 1, 1,
1.856323, 0.4374569, 0.09018613, 0, 0, 0, 1, 1,
1.880045, -0.450129, 2.23813, 0, 0, 0, 1, 1,
1.882157, -0.1377394, 2.180903, 1, 1, 1, 1, 1,
1.895829, 1.828525, 2.237345, 1, 1, 1, 1, 1,
1.912282, -0.3664544, 0.2144515, 1, 1, 1, 1, 1,
1.921516, -0.4837067, 2.503933, 1, 1, 1, 1, 1,
1.935794, -0.5557728, 1.228419, 1, 1, 1, 1, 1,
1.949309, 0.667107, 0.4451282, 1, 1, 1, 1, 1,
1.951286, 0.7493434, 1.19958, 1, 1, 1, 1, 1,
1.953019, -0.2459277, 3.063043, 1, 1, 1, 1, 1,
1.961636, 1.179607, 0.912661, 1, 1, 1, 1, 1,
2.036509, 0.2763087, 1.734002, 1, 1, 1, 1, 1,
2.052379, -1.09422, 1.873482, 1, 1, 1, 1, 1,
2.065479, 1.595204, 2.660656, 1, 1, 1, 1, 1,
2.076383, -1.539655, 2.172855, 1, 1, 1, 1, 1,
2.105585, -0.3583772, 1.978318, 1, 1, 1, 1, 1,
2.116625, 0.3043985, 0.8341001, 1, 1, 1, 1, 1,
2.126416, -1.109376, 2.435439, 0, 0, 1, 1, 1,
2.130659, -0.9732559, 4.365734, 1, 0, 0, 1, 1,
2.140427, -0.3037621, 1.08787, 1, 0, 0, 1, 1,
2.156337, 1.560097, 0.7669144, 1, 0, 0, 1, 1,
2.208961, 0.4354296, 2.05441, 1, 0, 0, 1, 1,
2.339637, 0.1676329, 3.354595, 1, 0, 0, 1, 1,
2.34684, 0.4541815, 1.852756, 0, 0, 0, 1, 1,
2.395626, -0.3768764, -0.6965637, 0, 0, 0, 1, 1,
2.398005, 0.1772166, 1.687624, 0, 0, 0, 1, 1,
2.398288, -0.2963358, 0.5921649, 0, 0, 0, 1, 1,
2.407567, 1.12277, 0.4170568, 0, 0, 0, 1, 1,
2.473882, -0.7459454, 2.017916, 0, 0, 0, 1, 1,
2.529869, -0.8228416, 1.532737, 0, 0, 0, 1, 1,
2.536777, -0.1034909, 0.4841235, 1, 1, 1, 1, 1,
2.624617, 0.1360109, 1.436085, 1, 1, 1, 1, 1,
2.775004, -0.977155, 1.875538, 1, 1, 1, 1, 1,
3.003243, -1.096574, 1.291504, 1, 1, 1, 1, 1,
3.128475, -2.046255, 1.849207, 1, 1, 1, 1, 1,
3.208462, -0.6428444, 2.702166, 1, 1, 1, 1, 1,
3.541616, -1.55347, 0.3272007, 1, 1, 1, 1, 1
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
var radius = 9.409158;
var distance = 33.04927;
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
mvMatrix.translate( -0.2925552, -0.3383744, -0.4255588 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.04927);
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
