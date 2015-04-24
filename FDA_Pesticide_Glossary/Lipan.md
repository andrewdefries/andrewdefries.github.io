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
-3.052706, -0.5116594, -2.821073, 1, 0, 0, 1,
-2.988623, 0.4500566, -0.2785224, 1, 0.007843138, 0, 1,
-2.933424, 0.2857658, 0.3988912, 1, 0.01176471, 0, 1,
-2.921952, 1.388865, 0.1364132, 1, 0.01960784, 0, 1,
-2.91993, 0.1823699, -0.4423897, 1, 0.02352941, 0, 1,
-2.731879, 1.234115, -0.008933966, 1, 0.03137255, 0, 1,
-2.652787, -0.2125725, -0.3295185, 1, 0.03529412, 0, 1,
-2.601427, -0.5571755, -1.534604, 1, 0.04313726, 0, 1,
-2.589398, -1.382359, -1.599283, 1, 0.04705882, 0, 1,
-2.466502, -0.7365248, -2.103539, 1, 0.05490196, 0, 1,
-2.299631, 0.8971518, -3.120945, 1, 0.05882353, 0, 1,
-2.29536, 0.01849341, -1.268582, 1, 0.06666667, 0, 1,
-2.272833, -0.1588648, -1.090097, 1, 0.07058824, 0, 1,
-2.208997, -0.2641493, -1.428217, 1, 0.07843138, 0, 1,
-2.17261, -0.105961, -2.969629, 1, 0.08235294, 0, 1,
-2.167885, -0.9474455, -2.178724, 1, 0.09019608, 0, 1,
-2.021812, 0.7314806, -0.2965543, 1, 0.09411765, 0, 1,
-2.012254, -0.4970746, -2.424986, 1, 0.1019608, 0, 1,
-2.009273, 0.8455979, -0.8156738, 1, 0.1098039, 0, 1,
-1.977403, 1.228528, -1.479607, 1, 0.1137255, 0, 1,
-1.971827, 1.746935, -0.04431295, 1, 0.1215686, 0, 1,
-1.951838, -0.7260382, -1.754781, 1, 0.1254902, 0, 1,
-1.932941, 0.7627361, 0.5212727, 1, 0.1333333, 0, 1,
-1.930695, 0.7465144, -1.006785, 1, 0.1372549, 0, 1,
-1.89499, -0.7917464, -1.992413, 1, 0.145098, 0, 1,
-1.891009, -0.4113271, -1.120932, 1, 0.1490196, 0, 1,
-1.881552, 0.8183343, -1.807843, 1, 0.1568628, 0, 1,
-1.861626, 0.2252903, -1.162823, 1, 0.1607843, 0, 1,
-1.844511, 1.541921, -0.6677589, 1, 0.1686275, 0, 1,
-1.804988, 0.01701233, -0.6177955, 1, 0.172549, 0, 1,
-1.780229, -1.263568, -2.67657, 1, 0.1803922, 0, 1,
-1.771683, -1.16934, -0.9886618, 1, 0.1843137, 0, 1,
-1.732483, 0.8589214, -1.533162, 1, 0.1921569, 0, 1,
-1.698771, -1.289931, -2.199657, 1, 0.1960784, 0, 1,
-1.695623, 0.05221635, -1.58041, 1, 0.2039216, 0, 1,
-1.693481, -1.190638, -0.854111, 1, 0.2117647, 0, 1,
-1.677958, 0.6149516, -0.4074511, 1, 0.2156863, 0, 1,
-1.675241, 0.09767832, -1.637845, 1, 0.2235294, 0, 1,
-1.643586, -1.074915, -1.475344, 1, 0.227451, 0, 1,
-1.630873, 0.381488, -0.08003933, 1, 0.2352941, 0, 1,
-1.629338, -0.5986205, -1.357582, 1, 0.2392157, 0, 1,
-1.624182, 0.1731832, -1.819348, 1, 0.2470588, 0, 1,
-1.622405, 0.2339697, -0.6827199, 1, 0.2509804, 0, 1,
-1.612325, -1.208975, -1.772523, 1, 0.2588235, 0, 1,
-1.583608, 0.8111978, -1.703562, 1, 0.2627451, 0, 1,
-1.578408, 0.02078439, -0.998955, 1, 0.2705882, 0, 1,
-1.568043, 0.09931923, -0.8205678, 1, 0.2745098, 0, 1,
-1.556945, 0.9903682, -1.546883, 1, 0.282353, 0, 1,
-1.553849, -0.6600175, -1.990025, 1, 0.2862745, 0, 1,
-1.551303, -0.3233452, -1.502475, 1, 0.2941177, 0, 1,
-1.549861, 1.258541, -1.799405, 1, 0.3019608, 0, 1,
-1.540651, 0.3083418, -1.187155, 1, 0.3058824, 0, 1,
-1.539603, -1.098284, -2.17793, 1, 0.3137255, 0, 1,
-1.532967, 1.333362, -0.4779926, 1, 0.3176471, 0, 1,
-1.528835, -0.7714114, -1.282935, 1, 0.3254902, 0, 1,
-1.522407, 0.9915355, -2.216775, 1, 0.3294118, 0, 1,
-1.520736, 1.017242, 0.8808513, 1, 0.3372549, 0, 1,
-1.515881, 0.3399355, -2.23696, 1, 0.3411765, 0, 1,
-1.514477, -0.8372953, -3.114262, 1, 0.3490196, 0, 1,
-1.482207, 2.079807, -0.8456543, 1, 0.3529412, 0, 1,
-1.460727, 0.4817751, -1.724899, 1, 0.3607843, 0, 1,
-1.448749, 0.3036834, -2.080271, 1, 0.3647059, 0, 1,
-1.448229, -0.8632579, -3.975713, 1, 0.372549, 0, 1,
-1.442658, 0.5296679, -1.319656, 1, 0.3764706, 0, 1,
-1.440662, 1.305054, -0.3280624, 1, 0.3843137, 0, 1,
-1.435348, 0.4032452, -0.8747075, 1, 0.3882353, 0, 1,
-1.428909, 0.07219269, -1.015121, 1, 0.3960784, 0, 1,
-1.421238, -1.263357, -3.248463, 1, 0.4039216, 0, 1,
-1.412867, 0.3591924, -2.267992, 1, 0.4078431, 0, 1,
-1.410888, -1.159064, -0.1062303, 1, 0.4156863, 0, 1,
-1.405564, -0.1087735, -2.077053, 1, 0.4196078, 0, 1,
-1.386505, -0.0561698, -1.963851, 1, 0.427451, 0, 1,
-1.385647, 0.6843136, 0.08355262, 1, 0.4313726, 0, 1,
-1.383864, -0.8142143, -3.545287, 1, 0.4392157, 0, 1,
-1.38161, -1.252062, -2.000264, 1, 0.4431373, 0, 1,
-1.378256, -1.060718, -2.197158, 1, 0.4509804, 0, 1,
-1.376553, 0.2450003, -0.6504931, 1, 0.454902, 0, 1,
-1.370675, -0.4697399, -2.201307, 1, 0.4627451, 0, 1,
-1.366742, 0.4900402, -2.707966, 1, 0.4666667, 0, 1,
-1.359765, -0.8658463, -1.110753, 1, 0.4745098, 0, 1,
-1.354992, -0.302065, -0.9460906, 1, 0.4784314, 0, 1,
-1.354326, -1.037258, -2.413308, 1, 0.4862745, 0, 1,
-1.327901, -0.2458671, -2.457232, 1, 0.4901961, 0, 1,
-1.327342, -0.2815058, -1.798747, 1, 0.4980392, 0, 1,
-1.327287, -0.8752169, -4.266936, 1, 0.5058824, 0, 1,
-1.32661, 0.0009124795, -2.842513, 1, 0.509804, 0, 1,
-1.321978, -0.1143862, -0.5976853, 1, 0.5176471, 0, 1,
-1.32027, 1.061027, -1.127025, 1, 0.5215687, 0, 1,
-1.319069, -1.987366, -3.848793, 1, 0.5294118, 0, 1,
-1.315271, 0.06773999, -2.718386, 1, 0.5333334, 0, 1,
-1.312266, 0.9042678, -0.7141141, 1, 0.5411765, 0, 1,
-1.309935, 0.5680396, -0.641742, 1, 0.5450981, 0, 1,
-1.308425, 0.976662, -0.4665538, 1, 0.5529412, 0, 1,
-1.308387, -0.6874876, -2.086228, 1, 0.5568628, 0, 1,
-1.307788, 0.6642854, -1.242618, 1, 0.5647059, 0, 1,
-1.306458, -0.5605874, -1.308637, 1, 0.5686275, 0, 1,
-1.305224, -0.7152455, -1.664763, 1, 0.5764706, 0, 1,
-1.304868, 1.231482, 0.2624304, 1, 0.5803922, 0, 1,
-1.298734, -0.2749961, -3.094335, 1, 0.5882353, 0, 1,
-1.285809, -0.3894637, -3.061805, 1, 0.5921569, 0, 1,
-1.267046, -1.197266, -1.94109, 1, 0.6, 0, 1,
-1.266064, 0.964659, -0.4326381, 1, 0.6078432, 0, 1,
-1.263441, -0.929105, -1.786992, 1, 0.6117647, 0, 1,
-1.260974, 1.014092, -2.540651, 1, 0.6196079, 0, 1,
-1.242285, 0.6708, -1.814248, 1, 0.6235294, 0, 1,
-1.240168, -0.7931474, -0.5574744, 1, 0.6313726, 0, 1,
-1.232034, 1.39676, -0.4590395, 1, 0.6352941, 0, 1,
-1.222227, 1.379782, -1.364707, 1, 0.6431373, 0, 1,
-1.217971, 0.7830426, -1.533776, 1, 0.6470588, 0, 1,
-1.21501, 0.9933207, -0.2985401, 1, 0.654902, 0, 1,
-1.202331, 1.066915, 0.2848716, 1, 0.6588235, 0, 1,
-1.185951, 0.7948316, -2.001545, 1, 0.6666667, 0, 1,
-1.182198, 0.405335, 0.1614343, 1, 0.6705883, 0, 1,
-1.173831, 1.052411, -1.439239, 1, 0.6784314, 0, 1,
-1.173469, -0.1796536, -0.6087322, 1, 0.682353, 0, 1,
-1.170467, -0.1657055, 0.06956226, 1, 0.6901961, 0, 1,
-1.163199, 0.139765, -1.937394, 1, 0.6941177, 0, 1,
-1.158903, -0.7339988, -0.3701455, 1, 0.7019608, 0, 1,
-1.147244, -0.1078055, -0.8218383, 1, 0.7098039, 0, 1,
-1.140915, 0.3674749, -1.258903, 1, 0.7137255, 0, 1,
-1.138094, -0.3168652, -3.252228, 1, 0.7215686, 0, 1,
-1.134258, -1.523496, -2.706702, 1, 0.7254902, 0, 1,
-1.112171, 0.7031586, 1.986256, 1, 0.7333333, 0, 1,
-1.108418, -0.1770973, -1.891714, 1, 0.7372549, 0, 1,
-1.10728, 0.1406274, -2.089133, 1, 0.7450981, 0, 1,
-1.099686, 1.039872, -1.047236, 1, 0.7490196, 0, 1,
-1.095901, 0.4271696, -0.02966626, 1, 0.7568628, 0, 1,
-1.093058, -0.673358, -3.448899, 1, 0.7607843, 0, 1,
-1.092805, 0.04528826, -0.6494455, 1, 0.7686275, 0, 1,
-1.089761, 1.241717, -0.6956669, 1, 0.772549, 0, 1,
-1.08886, 0.9719391, -0.9217173, 1, 0.7803922, 0, 1,
-1.087748, -0.60824, -2.616012, 1, 0.7843137, 0, 1,
-1.082139, 0.207019, -1.879927, 1, 0.7921569, 0, 1,
-1.076272, 0.2908137, -1.611503, 1, 0.7960784, 0, 1,
-1.073089, -1.194891, -2.334857, 1, 0.8039216, 0, 1,
-1.051851, -0.01507889, -0.7386535, 1, 0.8117647, 0, 1,
-1.049949, -1.274072, -2.326927, 1, 0.8156863, 0, 1,
-1.049861, -0.2249362, -0.9465263, 1, 0.8235294, 0, 1,
-1.047874, 1.756372, 0.05325467, 1, 0.827451, 0, 1,
-1.04707, -0.8324762, -2.898308, 1, 0.8352941, 0, 1,
-1.043429, 0.8022256, -4.110703, 1, 0.8392157, 0, 1,
-1.043298, -1.149095, -2.10736, 1, 0.8470588, 0, 1,
-1.042178, 1.470122, -0.240565, 1, 0.8509804, 0, 1,
-1.041921, -0.7084681, -2.307205, 1, 0.8588235, 0, 1,
-1.041586, -1.847929, -3.359895, 1, 0.8627451, 0, 1,
-1.03486, 1.644352, 0.1986064, 1, 0.8705882, 0, 1,
-1.031937, 0.8489835, -0.2917887, 1, 0.8745098, 0, 1,
-1.029573, 0.7016603, -2.06867, 1, 0.8823529, 0, 1,
-1.027268, 1.003603, -1.805665, 1, 0.8862745, 0, 1,
-1.024721, 0.7055691, 0.7272433, 1, 0.8941177, 0, 1,
-1.021636, -2.040854, -3.022583, 1, 0.8980392, 0, 1,
-1.008214, -0.8690385, -1.711831, 1, 0.9058824, 0, 1,
-0.9991064, -1.914791, -2.020535, 1, 0.9137255, 0, 1,
-0.9990063, 0.8304121, -0.968743, 1, 0.9176471, 0, 1,
-0.9966552, -1.666428, -2.987061, 1, 0.9254902, 0, 1,
-0.9958345, -0.2889954, -2.380265, 1, 0.9294118, 0, 1,
-0.9907017, 1.360116, -0.2881083, 1, 0.9372549, 0, 1,
-0.9870301, 0.8332554, -1.947296, 1, 0.9411765, 0, 1,
-0.9809313, -0.8631219, -2.381625, 1, 0.9490196, 0, 1,
-0.9805263, -0.5308016, -2.110293, 1, 0.9529412, 0, 1,
-0.9799746, -0.2397776, -3.316815, 1, 0.9607843, 0, 1,
-0.9778234, 0.06385067, -0.8665788, 1, 0.9647059, 0, 1,
-0.9730568, -0.7160189, -0.5880035, 1, 0.972549, 0, 1,
-0.9712102, -0.4668323, -2.453268, 1, 0.9764706, 0, 1,
-0.971185, -0.2502021, -2.257357, 1, 0.9843137, 0, 1,
-0.9711019, 0.1189942, -2.471442, 1, 0.9882353, 0, 1,
-0.969082, -0.2942754, -0.7092802, 1, 0.9960784, 0, 1,
-0.9635896, -0.2583547, -0.02776265, 0.9960784, 1, 0, 1,
-0.9568005, 2.267249, -1.318636, 0.9921569, 1, 0, 1,
-0.9539055, 0.9177627, 0.2966895, 0.9843137, 1, 0, 1,
-0.9521112, -1.373275, -1.963744, 0.9803922, 1, 0, 1,
-0.9478477, -1.063796, -1.662073, 0.972549, 1, 0, 1,
-0.938011, -0.8963922, -1.321837, 0.9686275, 1, 0, 1,
-0.9375157, 1.509217, -0.5707493, 0.9607843, 1, 0, 1,
-0.9253815, -2.390354, -3.887312, 0.9568627, 1, 0, 1,
-0.920522, -0.05339151, -0.5127213, 0.9490196, 1, 0, 1,
-0.919625, 1.395026, -1.607459, 0.945098, 1, 0, 1,
-0.9085944, -0.7875059, -2.085377, 0.9372549, 1, 0, 1,
-0.908452, 1.223166, -1.07863, 0.9333333, 1, 0, 1,
-0.9077517, -0.1734979, 0.8405261, 0.9254902, 1, 0, 1,
-0.9060189, 0.8133573, -0.05577398, 0.9215686, 1, 0, 1,
-0.9010693, 0.507589, -2.361104, 0.9137255, 1, 0, 1,
-0.8962376, 0.7921922, -0.06923071, 0.9098039, 1, 0, 1,
-0.8844211, -0.993202, -0.5922451, 0.9019608, 1, 0, 1,
-0.8808771, 0.4784312, -1.358064, 0.8941177, 1, 0, 1,
-0.8800048, -0.6518866, -0.4553301, 0.8901961, 1, 0, 1,
-0.8770154, -0.05798405, -1.537753, 0.8823529, 1, 0, 1,
-0.8751317, 0.3401158, -0.09007184, 0.8784314, 1, 0, 1,
-0.8691198, -1.103892, -1.537516, 0.8705882, 1, 0, 1,
-0.85101, 0.6757433, 0.07348561, 0.8666667, 1, 0, 1,
-0.8488469, 0.7958957, -0.4539381, 0.8588235, 1, 0, 1,
-0.8433242, -2.029341, -2.389816, 0.854902, 1, 0, 1,
-0.837499, 0.3839567, -1.988387, 0.8470588, 1, 0, 1,
-0.8344164, 1.276572, -3.379942, 0.8431373, 1, 0, 1,
-0.8342539, -1.548075, -5.187706, 0.8352941, 1, 0, 1,
-0.8318082, -1.8866, -2.494255, 0.8313726, 1, 0, 1,
-0.8276547, 0.290202, -0.8524374, 0.8235294, 1, 0, 1,
-0.824242, -0.3561664, -1.242074, 0.8196079, 1, 0, 1,
-0.8233001, 0.2350713, -2.580326, 0.8117647, 1, 0, 1,
-0.8187976, 0.1501474, -2.259261, 0.8078431, 1, 0, 1,
-0.8159173, -0.8013777, 0.06211391, 0.8, 1, 0, 1,
-0.8089885, -0.742642, -2.7765, 0.7921569, 1, 0, 1,
-0.8035245, -1.820203, -3.322184, 0.7882353, 1, 0, 1,
-0.8024358, 0.05455936, -0.2082143, 0.7803922, 1, 0, 1,
-0.8015376, -1.033104, -2.190493, 0.7764706, 1, 0, 1,
-0.7967102, 0.5444009, -1.8098, 0.7686275, 1, 0, 1,
-0.7876846, -0.6784284, -3.133163, 0.7647059, 1, 0, 1,
-0.7812033, 0.9273246, -0.9725198, 0.7568628, 1, 0, 1,
-0.7811663, 0.777737, -0.8070703, 0.7529412, 1, 0, 1,
-0.7798035, 2.333869, 1.280883, 0.7450981, 1, 0, 1,
-0.7740948, -0.8719622, -1.725233, 0.7411765, 1, 0, 1,
-0.769904, 1.086486, -0.9928923, 0.7333333, 1, 0, 1,
-0.7601552, -0.3637924, -2.326263, 0.7294118, 1, 0, 1,
-0.7592012, 0.5692948, -2.018316, 0.7215686, 1, 0, 1,
-0.7581372, -0.1766981, -2.460371, 0.7176471, 1, 0, 1,
-0.7561136, 0.3805793, -2.356435, 0.7098039, 1, 0, 1,
-0.7537472, -0.7173459, -3.946346, 0.7058824, 1, 0, 1,
-0.7516659, 1.196396, -0.5644613, 0.6980392, 1, 0, 1,
-0.7507491, 0.9236299, -1.206034, 0.6901961, 1, 0, 1,
-0.7451479, 0.1659237, 0.01264505, 0.6862745, 1, 0, 1,
-0.7444609, -0.3828655, -3.001992, 0.6784314, 1, 0, 1,
-0.7438962, -1.288532, -2.827729, 0.6745098, 1, 0, 1,
-0.7402872, -0.8108436, -2.122639, 0.6666667, 1, 0, 1,
-0.7374482, 0.5026401, 0.09107246, 0.6627451, 1, 0, 1,
-0.7350867, -0.1948388, -1.250274, 0.654902, 1, 0, 1,
-0.7342713, 0.8538387, 0.3925637, 0.6509804, 1, 0, 1,
-0.7326538, 0.7690295, -0.3896388, 0.6431373, 1, 0, 1,
-0.7295689, -1.070265, -4.026953, 0.6392157, 1, 0, 1,
-0.723394, 1.933056, -0.6947964, 0.6313726, 1, 0, 1,
-0.7224267, 1.431138, 0.6231881, 0.627451, 1, 0, 1,
-0.7224102, -0.6518849, -2.451462, 0.6196079, 1, 0, 1,
-0.7198446, 0.8663614, -1.654145, 0.6156863, 1, 0, 1,
-0.7182598, 0.06237636, -0.5712484, 0.6078432, 1, 0, 1,
-0.7087415, 0.949843, -0.9490327, 0.6039216, 1, 0, 1,
-0.6990448, 0.6825329, -1.715623, 0.5960785, 1, 0, 1,
-0.6976376, 1.123306, 0.529741, 0.5882353, 1, 0, 1,
-0.6966323, -0.2806543, -1.228342, 0.5843138, 1, 0, 1,
-0.6949545, -0.8982814, -1.760369, 0.5764706, 1, 0, 1,
-0.6904532, -2.528537, -1.834309, 0.572549, 1, 0, 1,
-0.6902117, 0.8607723, -0.4196235, 0.5647059, 1, 0, 1,
-0.6875808, -2.18454, -4.072208, 0.5607843, 1, 0, 1,
-0.6849173, 0.2368798, -0.8004059, 0.5529412, 1, 0, 1,
-0.672922, 2.028542, -1.607173, 0.5490196, 1, 0, 1,
-0.6704436, -1.13663, -1.502296, 0.5411765, 1, 0, 1,
-0.6645331, 1.319216, -2.640541, 0.5372549, 1, 0, 1,
-0.6635174, -0.5765487, -1.404833, 0.5294118, 1, 0, 1,
-0.6597149, -0.7214592, -2.071429, 0.5254902, 1, 0, 1,
-0.6582, 0.3889283, -2.44984, 0.5176471, 1, 0, 1,
-0.6502916, -0.7071441, -2.943555, 0.5137255, 1, 0, 1,
-0.6495854, -0.8745289, -2.650922, 0.5058824, 1, 0, 1,
-0.6493136, -0.3515784, -2.550442, 0.5019608, 1, 0, 1,
-0.6490628, -0.7130272, -3.231429, 0.4941176, 1, 0, 1,
-0.6479035, -2.197175, -2.489855, 0.4862745, 1, 0, 1,
-0.6476009, 1.525033, -1.850177, 0.4823529, 1, 0, 1,
-0.6466836, -0.2212826, -2.815881, 0.4745098, 1, 0, 1,
-0.6447008, -0.5654808, -2.16051, 0.4705882, 1, 0, 1,
-0.6394007, 0.1546446, -2.194703, 0.4627451, 1, 0, 1,
-0.6392103, 0.4463659, -0.3212242, 0.4588235, 1, 0, 1,
-0.6369183, 0.8422176, -1.485497, 0.4509804, 1, 0, 1,
-0.634741, 0.5409948, -0.3170284, 0.4470588, 1, 0, 1,
-0.6329052, 2.115707, -0.81888, 0.4392157, 1, 0, 1,
-0.6325608, 0.6961411, -1.237416, 0.4352941, 1, 0, 1,
-0.6279666, -0.8326921, -2.221903, 0.427451, 1, 0, 1,
-0.6276986, 0.591242, -1.084892, 0.4235294, 1, 0, 1,
-0.6256087, 0.01238335, -3.055352, 0.4156863, 1, 0, 1,
-0.6205429, 0.4020259, 0.3294077, 0.4117647, 1, 0, 1,
-0.6184675, 0.3378734, -1.050303, 0.4039216, 1, 0, 1,
-0.6129628, 1.046488, -1.523984, 0.3960784, 1, 0, 1,
-0.6068358, 2.018317, -0.5516983, 0.3921569, 1, 0, 1,
-0.6059793, -0.3778473, -2.183302, 0.3843137, 1, 0, 1,
-0.601048, 0.3405577, -1.558433, 0.3803922, 1, 0, 1,
-0.5969342, -0.2478314, -4.33625, 0.372549, 1, 0, 1,
-0.5894184, -0.2336658, -1.592865, 0.3686275, 1, 0, 1,
-0.5841017, 1.201766, -0.8192813, 0.3607843, 1, 0, 1,
-0.5827821, 0.7836881, -2.029849, 0.3568628, 1, 0, 1,
-0.5656734, 1.016183, 0.1890007, 0.3490196, 1, 0, 1,
-0.558764, 1.041135, 0.05040962, 0.345098, 1, 0, 1,
-0.557272, -1.278496, -3.684625, 0.3372549, 1, 0, 1,
-0.5546902, -0.3420425, -2.037851, 0.3333333, 1, 0, 1,
-0.5528687, 0.08418892, -0.9398068, 0.3254902, 1, 0, 1,
-0.5522156, -0.9368009, -2.581521, 0.3215686, 1, 0, 1,
-0.546296, -0.4946748, -1.937268, 0.3137255, 1, 0, 1,
-0.5409114, 0.3336261, -1.232647, 0.3098039, 1, 0, 1,
-0.5367231, 1.151303, 0.4045093, 0.3019608, 1, 0, 1,
-0.5360561, 1.758073, 0.2023309, 0.2941177, 1, 0, 1,
-0.5289021, 0.3565389, -2.700448, 0.2901961, 1, 0, 1,
-0.5287225, -1.527553, -2.00519, 0.282353, 1, 0, 1,
-0.5273018, -0.8529914, -3.498718, 0.2784314, 1, 0, 1,
-0.5255099, 1.422391, 0.6825972, 0.2705882, 1, 0, 1,
-0.5231822, 1.579483, -1.215741, 0.2666667, 1, 0, 1,
-0.5204632, 0.7918118, 1.412492, 0.2588235, 1, 0, 1,
-0.5189672, 0.7528409, 0.1099933, 0.254902, 1, 0, 1,
-0.5147435, -0.4840825, -2.412904, 0.2470588, 1, 0, 1,
-0.5123459, 2.724859, -0.4437468, 0.2431373, 1, 0, 1,
-0.5119796, -1.376931, -3.223998, 0.2352941, 1, 0, 1,
-0.5100002, 1.058134, 0.6797397, 0.2313726, 1, 0, 1,
-0.5080655, 1.476002, -0.5161169, 0.2235294, 1, 0, 1,
-0.5060535, -0.6079339, -2.383797, 0.2196078, 1, 0, 1,
-0.5060197, 0.4815744, -1.594502, 0.2117647, 1, 0, 1,
-0.5044672, 0.1461199, -3.920441, 0.2078431, 1, 0, 1,
-0.5024264, 0.915735, 0.5113317, 0.2, 1, 0, 1,
-0.498783, -0.2534739, -0.7755318, 0.1921569, 1, 0, 1,
-0.4967164, -1.387047, -3.519305, 0.1882353, 1, 0, 1,
-0.4963821, 0.5101002, -0.6174434, 0.1803922, 1, 0, 1,
-0.4930426, -0.755239, -4.112423, 0.1764706, 1, 0, 1,
-0.489989, -1.203609, -2.761606, 0.1686275, 1, 0, 1,
-0.4829994, 2.010318, -0.3738549, 0.1647059, 1, 0, 1,
-0.4829367, -2.245411, -2.460285, 0.1568628, 1, 0, 1,
-0.481277, -0.4665228, -3.197719, 0.1529412, 1, 0, 1,
-0.4713891, -0.165545, -1.137829, 0.145098, 1, 0, 1,
-0.4708221, -0.5079633, -2.389767, 0.1411765, 1, 0, 1,
-0.4684959, 0.6892422, -0.7827461, 0.1333333, 1, 0, 1,
-0.4647789, 1.369535, 0.0922868, 0.1294118, 1, 0, 1,
-0.4630743, -1.499128, -3.201828, 0.1215686, 1, 0, 1,
-0.462016, 1.185975, -1.700077, 0.1176471, 1, 0, 1,
-0.4528881, -0.8624519, -2.547782, 0.1098039, 1, 0, 1,
-0.4499967, 0.07260433, -2.511315, 0.1058824, 1, 0, 1,
-0.4479448, -0.7539037, -4.600013, 0.09803922, 1, 0, 1,
-0.4453947, -0.6479407, -2.53758, 0.09019608, 1, 0, 1,
-0.4438983, -0.9253755, -4.454933, 0.08627451, 1, 0, 1,
-0.4400301, -1.331005, -2.03661, 0.07843138, 1, 0, 1,
-0.438982, 0.8933936, -1.329801, 0.07450981, 1, 0, 1,
-0.4381238, -0.3894286, -0.5033966, 0.06666667, 1, 0, 1,
-0.4347408, -0.118283, -3.88124, 0.0627451, 1, 0, 1,
-0.4322817, -0.127782, -2.521577, 0.05490196, 1, 0, 1,
-0.4240937, 2.662991, -2.851918, 0.05098039, 1, 0, 1,
-0.4218283, -1.617504, -3.026741, 0.04313726, 1, 0, 1,
-0.4205222, 0.6915658, -1.845986, 0.03921569, 1, 0, 1,
-0.4204527, -0.5342877, -1.656539, 0.03137255, 1, 0, 1,
-0.4199283, -0.5210379, -3.409406, 0.02745098, 1, 0, 1,
-0.4099604, -0.9737354, -2.627805, 0.01960784, 1, 0, 1,
-0.4077581, 0.6089292, -1.295189, 0.01568628, 1, 0, 1,
-0.4063093, 0.361185, -3.572037, 0.007843138, 1, 0, 1,
-0.4028302, 1.026247, -0.785443, 0.003921569, 1, 0, 1,
-0.3939011, -1.115922, -1.884269, 0, 1, 0.003921569, 1,
-0.3917719, 1.097356, -1.243255, 0, 1, 0.01176471, 1,
-0.3844863, 1.617025, -0.340534, 0, 1, 0.01568628, 1,
-0.381565, 1.127294, -3.172451, 0, 1, 0.02352941, 1,
-0.3805526, -0.6265794, -1.932391, 0, 1, 0.02745098, 1,
-0.3793315, 0.5642273, -0.807655, 0, 1, 0.03529412, 1,
-0.3684746, 0.4511015, 0.9114881, 0, 1, 0.03921569, 1,
-0.3653786, 0.5361001, -0.7589465, 0, 1, 0.04705882, 1,
-0.3594396, -0.8667756, -2.348319, 0, 1, 0.05098039, 1,
-0.353274, -1.05959, -1.330388, 0, 1, 0.05882353, 1,
-0.3506595, -1.317345, -2.543427, 0, 1, 0.0627451, 1,
-0.3476396, 0.03078462, -1.654073, 0, 1, 0.07058824, 1,
-0.3428595, -1.656857, -5.47331, 0, 1, 0.07450981, 1,
-0.3392869, 0.121032, -0.4512058, 0, 1, 0.08235294, 1,
-0.336362, 1.277497, 0.4241682, 0, 1, 0.08627451, 1,
-0.334514, 1.991058, -1.308153, 0, 1, 0.09411765, 1,
-0.3303894, -0.2488487, -1.717924, 0, 1, 0.1019608, 1,
-0.3289822, 1.061402, 0.2584216, 0, 1, 0.1058824, 1,
-0.3277495, -0.400691, -1.92745, 0, 1, 0.1137255, 1,
-0.3276986, 1.249548, -0.1194202, 0, 1, 0.1176471, 1,
-0.3271858, -2.069045, -3.301378, 0, 1, 0.1254902, 1,
-0.3268582, -0.8067845, -1.67202, 0, 1, 0.1294118, 1,
-0.324343, 0.5354421, -1.576643, 0, 1, 0.1372549, 1,
-0.3202212, -1.119815, -2.312772, 0, 1, 0.1411765, 1,
-0.3160336, 1.428886, -0.5636097, 0, 1, 0.1490196, 1,
-0.3088933, -0.8725724, -1.305077, 0, 1, 0.1529412, 1,
-0.3087927, 0.7547987, -0.628431, 0, 1, 0.1607843, 1,
-0.3061942, 2.028792, 1.262934, 0, 1, 0.1647059, 1,
-0.3013775, 0.3639234, -0.9400602, 0, 1, 0.172549, 1,
-0.3009437, 0.6006657, -0.2066673, 0, 1, 0.1764706, 1,
-0.3003363, 0.4656889, -0.4642621, 0, 1, 0.1843137, 1,
-0.3002726, -0.1289235, -1.565111, 0, 1, 0.1882353, 1,
-0.2944729, -0.05579233, -0.3776536, 0, 1, 0.1960784, 1,
-0.2888466, 1.645281, -0.8191671, 0, 1, 0.2039216, 1,
-0.2808734, -1.719706, -3.505857, 0, 1, 0.2078431, 1,
-0.2799715, -0.5617959, -2.760284, 0, 1, 0.2156863, 1,
-0.2789548, 0.0351931, 0.5069739, 0, 1, 0.2196078, 1,
-0.2761723, 0.9629638, -2.55296, 0, 1, 0.227451, 1,
-0.2745704, -1.229384, -2.960562, 0, 1, 0.2313726, 1,
-0.2706653, -0.6653935, -3.388105, 0, 1, 0.2392157, 1,
-0.2644154, 0.1457625, -2.169056, 0, 1, 0.2431373, 1,
-0.2632905, 0.08322773, -0.9082536, 0, 1, 0.2509804, 1,
-0.2614441, -0.9702119, -1.95006, 0, 1, 0.254902, 1,
-0.2577759, 0.4668926, -0.4022492, 0, 1, 0.2627451, 1,
-0.2482311, -0.08509862, -1.955258, 0, 1, 0.2666667, 1,
-0.246176, -1.537937, -2.40296, 0, 1, 0.2745098, 1,
-0.244461, -1.578396, -3.818224, 0, 1, 0.2784314, 1,
-0.2340927, 2.185556, -0.5188072, 0, 1, 0.2862745, 1,
-0.2319621, 0.8338051, -1.498393, 0, 1, 0.2901961, 1,
-0.2274507, -0.3807802, -1.034829, 0, 1, 0.2980392, 1,
-0.2270804, 1.343632, -1.999401, 0, 1, 0.3058824, 1,
-0.2262474, 1.550579, -0.749037, 0, 1, 0.3098039, 1,
-0.2253836, 0.3519703, -1.780031, 0, 1, 0.3176471, 1,
-0.2247148, 0.9204348, -1.078374, 0, 1, 0.3215686, 1,
-0.2227015, -0.3249631, -2.598519, 0, 1, 0.3294118, 1,
-0.2163321, 0.4157577, -1.344484, 0, 1, 0.3333333, 1,
-0.215005, -1.881646, -1.803698, 0, 1, 0.3411765, 1,
-0.2125919, -0.5340657, -2.52531, 0, 1, 0.345098, 1,
-0.2122004, -0.4262228, -3.52525, 0, 1, 0.3529412, 1,
-0.2092302, -0.4699164, -3.232798, 0, 1, 0.3568628, 1,
-0.2048206, 0.9578027, -0.7922742, 0, 1, 0.3647059, 1,
-0.2022279, 0.08637933, -2.079145, 0, 1, 0.3686275, 1,
-0.1994405, -0.3982854, -3.492195, 0, 1, 0.3764706, 1,
-0.1979146, -1.045786, -3.108483, 0, 1, 0.3803922, 1,
-0.1975618, -0.6362744, -4.144269, 0, 1, 0.3882353, 1,
-0.1933345, 0.3709508, -1.159521, 0, 1, 0.3921569, 1,
-0.1931627, 1.176505, 0.308953, 0, 1, 0.4, 1,
-0.1909508, -0.7568375, -3.173516, 0, 1, 0.4078431, 1,
-0.1903967, 0.9252838, -0.06523027, 0, 1, 0.4117647, 1,
-0.186093, 1.058251, 0.2604257, 0, 1, 0.4196078, 1,
-0.1832377, 0.7681989, 1.373002, 0, 1, 0.4235294, 1,
-0.1814383, 0.04867804, -0.6320511, 0, 1, 0.4313726, 1,
-0.1812365, 1.373788, 0.4163079, 0, 1, 0.4352941, 1,
-0.1810903, 0.2460889, 0.2148182, 0, 1, 0.4431373, 1,
-0.1748747, 0.3290236, -0.5369587, 0, 1, 0.4470588, 1,
-0.1744407, -0.3105394, -2.834148, 0, 1, 0.454902, 1,
-0.1744106, -0.4225155, -2.855703, 0, 1, 0.4588235, 1,
-0.1732003, -1.198712, -5.099928, 0, 1, 0.4666667, 1,
-0.1710051, 2.549061, 0.3907754, 0, 1, 0.4705882, 1,
-0.169022, -1.154625, -3.651597, 0, 1, 0.4784314, 1,
-0.1678303, -0.8238555, -4.503217, 0, 1, 0.4823529, 1,
-0.1598213, -0.4530836, -1.3783, 0, 1, 0.4901961, 1,
-0.1583938, -0.1281688, -1.50721, 0, 1, 0.4941176, 1,
-0.1571073, 0.01356429, -2.396371, 0, 1, 0.5019608, 1,
-0.1557101, 1.226911, 0.2435737, 0, 1, 0.509804, 1,
-0.150269, 0.1578143, 0.07202931, 0, 1, 0.5137255, 1,
-0.149907, -0.3194598, -2.317456, 0, 1, 0.5215687, 1,
-0.1496377, -0.8137577, -2.978124, 0, 1, 0.5254902, 1,
-0.1466702, -0.003968225, -4.120409, 0, 1, 0.5333334, 1,
-0.1466424, 0.3371212, -0.9058503, 0, 1, 0.5372549, 1,
-0.142418, -1.375702, -3.780113, 0, 1, 0.5450981, 1,
-0.1415342, -0.393887, -1.712041, 0, 1, 0.5490196, 1,
-0.1386347, -1.273525, -2.150802, 0, 1, 0.5568628, 1,
-0.1366253, -1.182044, -2.003438, 0, 1, 0.5607843, 1,
-0.128999, -2.884395, -3.091672, 0, 1, 0.5686275, 1,
-0.128948, 0.04538508, -1.503803, 0, 1, 0.572549, 1,
-0.1270648, 0.2773248, 0.03474694, 0, 1, 0.5803922, 1,
-0.1268371, -0.9389836, -2.047943, 0, 1, 0.5843138, 1,
-0.124675, 0.03257824, -0.01777095, 0, 1, 0.5921569, 1,
-0.1246331, 1.777108, 1.040121, 0, 1, 0.5960785, 1,
-0.1240297, 2.785526, -0.01240885, 0, 1, 0.6039216, 1,
-0.1206792, -0.8878541, -1.763391, 0, 1, 0.6117647, 1,
-0.1200007, -0.5612526, -2.819028, 0, 1, 0.6156863, 1,
-0.1192572, -0.4772902, -4.12745, 0, 1, 0.6235294, 1,
-0.1152631, 0.9977503, -0.1212946, 0, 1, 0.627451, 1,
-0.1084384, 0.2925473, -2.216263, 0, 1, 0.6352941, 1,
-0.1043214, -0.7427239, -1.503598, 0, 1, 0.6392157, 1,
-0.10391, -0.1898713, -2.15852, 0, 1, 0.6470588, 1,
-0.09852378, 0.478492, 0.511739, 0, 1, 0.6509804, 1,
-0.0972913, 0.6850243, -0.7199624, 0, 1, 0.6588235, 1,
-0.09480333, 1.277735, -0.04830321, 0, 1, 0.6627451, 1,
-0.09176891, 0.4717753, 1.161275, 0, 1, 0.6705883, 1,
-0.09133718, -1.253889, -2.825105, 0, 1, 0.6745098, 1,
-0.08859476, -0.3440107, -2.137731, 0, 1, 0.682353, 1,
-0.08608229, -0.03047905, -2.436576, 0, 1, 0.6862745, 1,
-0.07643292, -0.4868942, -2.659083, 0, 1, 0.6941177, 1,
-0.07602485, 0.3222717, 0.2902581, 0, 1, 0.7019608, 1,
-0.06867532, 1.024141, -0.3465929, 0, 1, 0.7058824, 1,
-0.06777234, -1.003004, -5.404655, 0, 1, 0.7137255, 1,
-0.06593814, -0.9064607, -3.819544, 0, 1, 0.7176471, 1,
-0.06283423, -0.7678768, -4.336919, 0, 1, 0.7254902, 1,
-0.06264916, -1.50736, -2.054119, 0, 1, 0.7294118, 1,
-0.06245994, 0.2925206, -1.230631, 0, 1, 0.7372549, 1,
-0.06238142, -1.12849, -1.206765, 0, 1, 0.7411765, 1,
-0.05417779, 1.234506, 0.2480065, 0, 1, 0.7490196, 1,
-0.05337901, -1.181023, -2.437375, 0, 1, 0.7529412, 1,
-0.05105951, -0.4929802, -2.164496, 0, 1, 0.7607843, 1,
-0.0440497, 1.290794, 0.1159342, 0, 1, 0.7647059, 1,
-0.04388242, 0.6523965, -0.7308175, 0, 1, 0.772549, 1,
-0.04174748, 2.487831, -0.9764288, 0, 1, 0.7764706, 1,
-0.03502497, -0.0562676, -2.187287, 0, 1, 0.7843137, 1,
-0.03440091, -1.07895, -4.343902, 0, 1, 0.7882353, 1,
-0.02817505, -2.519973, -3.918293, 0, 1, 0.7960784, 1,
-0.02757946, 0.6323193, 0.498123, 0, 1, 0.8039216, 1,
-0.02720204, 1.120893, -0.8902536, 0, 1, 0.8078431, 1,
-0.02347752, -1.356898, -2.635776, 0, 1, 0.8156863, 1,
-0.02346754, -1.982015, -3.637955, 0, 1, 0.8196079, 1,
-0.02253423, -0.2958127, -2.984607, 0, 1, 0.827451, 1,
-0.02136486, 0.01929111, 0.3729452, 0, 1, 0.8313726, 1,
-0.02112834, 0.01336551, 0.4257464, 0, 1, 0.8392157, 1,
-0.01924538, 0.5046915, -0.9965531, 0, 1, 0.8431373, 1,
-0.01708001, 1.989139, 1.077312, 0, 1, 0.8509804, 1,
-0.01472205, 0.1758545, -0.2057059, 0, 1, 0.854902, 1,
-0.01249452, 0.1069411, 1.047146, 0, 1, 0.8627451, 1,
-0.01221834, -0.8728577, -3.534126, 0, 1, 0.8666667, 1,
-0.00911945, 0.5752292, -1.493241, 0, 1, 0.8745098, 1,
-0.0075984, -0.9609026, -1.959401, 0, 1, 0.8784314, 1,
-0.004883326, 0.9935664, 0.09662009, 0, 1, 0.8862745, 1,
-0.003718266, -5.349e-05, -2.874194, 0, 1, 0.8901961, 1,
0.0009979658, 1.086236, 0.6352857, 0, 1, 0.8980392, 1,
0.006179195, -1.196529, 3.003909, 0, 1, 0.9058824, 1,
0.007612081, -0.07572798, 3.754057, 0, 1, 0.9098039, 1,
0.007962242, -1.213579, 3.847636, 0, 1, 0.9176471, 1,
0.009397791, 1.110761, -0.4227366, 0, 1, 0.9215686, 1,
0.0106376, -0.7552053, 2.109217, 0, 1, 0.9294118, 1,
0.01783946, 1.758641, -1.387047, 0, 1, 0.9333333, 1,
0.01930535, 0.472159, -0.7072396, 0, 1, 0.9411765, 1,
0.02212833, 0.7944474, 1.120465, 0, 1, 0.945098, 1,
0.02503549, 0.08148006, 2.118391, 0, 1, 0.9529412, 1,
0.0276824, -0.709127, 1.777716, 0, 1, 0.9568627, 1,
0.02957109, 0.7751707, 1.490917, 0, 1, 0.9647059, 1,
0.02982025, -0.2715693, 3.361758, 0, 1, 0.9686275, 1,
0.0315425, 0.5589094, 1.309521, 0, 1, 0.9764706, 1,
0.03333285, 1.708001, 0.1200193, 0, 1, 0.9803922, 1,
0.0352806, 1.431478, -0.4659427, 0, 1, 0.9882353, 1,
0.03567107, -0.5474044, 3.764656, 0, 1, 0.9921569, 1,
0.03833613, -1.121137, 2.203135, 0, 1, 1, 1,
0.03951027, -1.759781, 3.081047, 0, 0.9921569, 1, 1,
0.04410417, 0.646068, -0.330229, 0, 0.9882353, 1, 1,
0.05173704, 2.101449, 2.070584, 0, 0.9803922, 1, 1,
0.06306339, -0.8923324, 4.40251, 0, 0.9764706, 1, 1,
0.06545997, -1.750979, 3.307577, 0, 0.9686275, 1, 1,
0.07118902, -1.338031, 2.885877, 0, 0.9647059, 1, 1,
0.07211296, 0.6175068, -0.04493141, 0, 0.9568627, 1, 1,
0.07214473, -1.585643, 2.292065, 0, 0.9529412, 1, 1,
0.07400066, 0.276066, 1.013852, 0, 0.945098, 1, 1,
0.07466573, -0.1023718, 1.669029, 0, 0.9411765, 1, 1,
0.0751881, 0.5907152, 3.640961, 0, 0.9333333, 1, 1,
0.07864703, 0.995473, 0.8522021, 0, 0.9294118, 1, 1,
0.08226295, 0.3484493, 0.4729254, 0, 0.9215686, 1, 1,
0.08235247, 0.06103995, 0.7014717, 0, 0.9176471, 1, 1,
0.08265124, 0.7666773, 0.1075328, 0, 0.9098039, 1, 1,
0.08377731, 0.4174872, -0.7404805, 0, 0.9058824, 1, 1,
0.08446693, -1.66815, 4.356889, 0, 0.8980392, 1, 1,
0.08566328, 0.0152087, 0.532429, 0, 0.8901961, 1, 1,
0.09039833, 0.7166666, -0.1185797, 0, 0.8862745, 1, 1,
0.09134109, -0.4375246, 2.737911, 0, 0.8784314, 1, 1,
0.0941486, -0.4429006, 3.719447, 0, 0.8745098, 1, 1,
0.09764553, 1.030958, 1.497859, 0, 0.8666667, 1, 1,
0.1005617, -0.1863631, 3.048865, 0, 0.8627451, 1, 1,
0.1010142, -0.3330627, 3.485303, 0, 0.854902, 1, 1,
0.1019165, -0.1082311, 3.496044, 0, 0.8509804, 1, 1,
0.1021515, 0.8454928, 0.008448584, 0, 0.8431373, 1, 1,
0.1024455, -0.2948393, 1.548509, 0, 0.8392157, 1, 1,
0.1048822, -0.02080291, 2.456252, 0, 0.8313726, 1, 1,
0.105048, -0.8707939, 3.126258, 0, 0.827451, 1, 1,
0.108261, 0.688202, 1.298291, 0, 0.8196079, 1, 1,
0.1109465, 0.4403061, -0.8334143, 0, 0.8156863, 1, 1,
0.1168056, -0.2251819, 3.794304, 0, 0.8078431, 1, 1,
0.1175007, 0.7344953, -0.8504193, 0, 0.8039216, 1, 1,
0.1175347, -1.052518, 3.133773, 0, 0.7960784, 1, 1,
0.1189127, -0.4279211, 1.782936, 0, 0.7882353, 1, 1,
0.1196508, 0.4537737, 0.5805562, 0, 0.7843137, 1, 1,
0.1217535, 1.186921, 1.833148, 0, 0.7764706, 1, 1,
0.1228388, -0.0675349, 1.23364, 0, 0.772549, 1, 1,
0.1242267, -0.1457593, 2.248363, 0, 0.7647059, 1, 1,
0.1264971, 0.2903893, 1.66848, 0, 0.7607843, 1, 1,
0.127533, 0.3157365, -0.8893003, 0, 0.7529412, 1, 1,
0.1303346, -0.7003489, 0.9694934, 0, 0.7490196, 1, 1,
0.1327883, -0.5660756, 3.6133, 0, 0.7411765, 1, 1,
0.1340791, -1.50815, 2.391944, 0, 0.7372549, 1, 1,
0.1363299, -0.1972338, 3.892186, 0, 0.7294118, 1, 1,
0.1369378, 1.191661, 0.8928179, 0, 0.7254902, 1, 1,
0.1373862, -0.6438243, 3.830553, 0, 0.7176471, 1, 1,
0.1395868, -0.3700229, 3.053654, 0, 0.7137255, 1, 1,
0.1428587, 0.9542095, 1.449982, 0, 0.7058824, 1, 1,
0.1435663, -0.1734389, 3.452252, 0, 0.6980392, 1, 1,
0.1465282, -0.3794213, 1.112916, 0, 0.6941177, 1, 1,
0.1533673, -0.284793, 2.422931, 0, 0.6862745, 1, 1,
0.1571546, 0.2592436, -0.3647312, 0, 0.682353, 1, 1,
0.1598387, -1.500109, 3.331195, 0, 0.6745098, 1, 1,
0.1602277, -0.2417885, 2.329892, 0, 0.6705883, 1, 1,
0.1636287, 2.281332, -0.2530669, 0, 0.6627451, 1, 1,
0.1670516, 0.3471564, -0.1467968, 0, 0.6588235, 1, 1,
0.168075, -0.5740516, 1.82286, 0, 0.6509804, 1, 1,
0.1701307, 1.749311, -0.09840769, 0, 0.6470588, 1, 1,
0.1714977, 0.5347128, -1.772027, 0, 0.6392157, 1, 1,
0.1748144, 1.092532, -0.4039908, 0, 0.6352941, 1, 1,
0.1780267, 0.5752007, 1.65784, 0, 0.627451, 1, 1,
0.1780299, -0.1298921, 2.483942, 0, 0.6235294, 1, 1,
0.1808333, 0.9160937, -0.5994763, 0, 0.6156863, 1, 1,
0.1833728, -0.5221102, 1.1546, 0, 0.6117647, 1, 1,
0.1900596, -0.8989806, 3.931874, 0, 0.6039216, 1, 1,
0.191137, -1.437786, 4.041636, 0, 0.5960785, 1, 1,
0.1920918, -0.8610188, 2.781712, 0, 0.5921569, 1, 1,
0.1931802, 0.7245312, -0.08048733, 0, 0.5843138, 1, 1,
0.1969714, -0.4574414, 0.9144649, 0, 0.5803922, 1, 1,
0.1980205, 1.394122, -1.247329, 0, 0.572549, 1, 1,
0.1994585, -0.1847933, 2.172762, 0, 0.5686275, 1, 1,
0.2005969, 0.4105184, -0.2518844, 0, 0.5607843, 1, 1,
0.2009379, -0.6869925, 3.040476, 0, 0.5568628, 1, 1,
0.2026449, 0.56218, -0.2246983, 0, 0.5490196, 1, 1,
0.2043541, 0.792657, 0.5351971, 0, 0.5450981, 1, 1,
0.2075057, -0.3733733, 2.846651, 0, 0.5372549, 1, 1,
0.2117721, 1.113118, 0.7415124, 0, 0.5333334, 1, 1,
0.2126057, -0.01733012, 2.04054, 0, 0.5254902, 1, 1,
0.2140976, -0.4215737, 2.216539, 0, 0.5215687, 1, 1,
0.2179894, 0.09076911, 2.673451, 0, 0.5137255, 1, 1,
0.2218921, 0.3934972, 0.8216132, 0, 0.509804, 1, 1,
0.2238248, 1.223685, -0.3116202, 0, 0.5019608, 1, 1,
0.2239445, -0.1241832, 2.2506, 0, 0.4941176, 1, 1,
0.2243336, 0.6167661, -0.2434743, 0, 0.4901961, 1, 1,
0.2259854, -0.08059179, -0.06110127, 0, 0.4823529, 1, 1,
0.2303798, -0.534085, 3.585528, 0, 0.4784314, 1, 1,
0.2312038, -0.3908468, 3.387393, 0, 0.4705882, 1, 1,
0.2317557, 2.279445, -0.2829967, 0, 0.4666667, 1, 1,
0.2387284, -0.4255005, 2.781805, 0, 0.4588235, 1, 1,
0.24793, 0.8916807, 0.1812111, 0, 0.454902, 1, 1,
0.2676244, -0.9031348, 2.938996, 0, 0.4470588, 1, 1,
0.2682661, 0.496743, -0.7068573, 0, 0.4431373, 1, 1,
0.2718002, 0.3654855, 0.6303121, 0, 0.4352941, 1, 1,
0.2727603, -0.5521455, 2.002467, 0, 0.4313726, 1, 1,
0.2747143, -0.34458, 2.897922, 0, 0.4235294, 1, 1,
0.2814068, -0.4067785, 3.867704, 0, 0.4196078, 1, 1,
0.2851312, 1.149673, 1.208282, 0, 0.4117647, 1, 1,
0.2863869, -1.293912, 1.288927, 0, 0.4078431, 1, 1,
0.2906287, -0.1613141, 1.571634, 0, 0.4, 1, 1,
0.2949305, -0.545841, 1.208932, 0, 0.3921569, 1, 1,
0.3002836, 0.8960581, 1.017933, 0, 0.3882353, 1, 1,
0.3035991, 0.1404709, 1.563238, 0, 0.3803922, 1, 1,
0.3045761, 0.6628658, -0.9641396, 0, 0.3764706, 1, 1,
0.3101199, -0.9540029, 3.20768, 0, 0.3686275, 1, 1,
0.3117504, -1.030184, 4.05763, 0, 0.3647059, 1, 1,
0.3132185, 1.100463, 1.230593, 0, 0.3568628, 1, 1,
0.3224106, 0.254527, 0.9224203, 0, 0.3529412, 1, 1,
0.3270133, 1.087093, 0.5949915, 0, 0.345098, 1, 1,
0.3287124, -0.8415444, 3.497484, 0, 0.3411765, 1, 1,
0.3299204, -0.8896838, 2.94626, 0, 0.3333333, 1, 1,
0.3312368, 1.15326, -0.6215963, 0, 0.3294118, 1, 1,
0.3342451, -1.953094, 3.868445, 0, 0.3215686, 1, 1,
0.3395623, 1.131432, 2.148891, 0, 0.3176471, 1, 1,
0.350044, -1.397421, 3.435606, 0, 0.3098039, 1, 1,
0.3519359, 1.188104, -0.444389, 0, 0.3058824, 1, 1,
0.3540119, -1.143584, 3.082318, 0, 0.2980392, 1, 1,
0.3551212, -0.09023005, 1.805303, 0, 0.2901961, 1, 1,
0.3572908, -0.4006904, 3.587007, 0, 0.2862745, 1, 1,
0.3577, 0.6629156, 1.196895, 0, 0.2784314, 1, 1,
0.3602078, -0.04989371, 0.7969732, 0, 0.2745098, 1, 1,
0.3618613, 0.1231986, 0.6870875, 0, 0.2666667, 1, 1,
0.3673189, 1.238468, -0.685342, 0, 0.2627451, 1, 1,
0.3675822, 0.1189064, 1.737244, 0, 0.254902, 1, 1,
0.367656, -0.6467419, 2.021924, 0, 0.2509804, 1, 1,
0.3693528, 0.6579527, -1.662604, 0, 0.2431373, 1, 1,
0.3695577, 0.400849, 0.148653, 0, 0.2392157, 1, 1,
0.3707395, -0.6070461, 1.916284, 0, 0.2313726, 1, 1,
0.3724062, -0.4829732, 2.424732, 0, 0.227451, 1, 1,
0.3757463, 0.07969666, 1.6334, 0, 0.2196078, 1, 1,
0.3777108, -3.632286, 2.826475, 0, 0.2156863, 1, 1,
0.3821933, -0.6271287, 2.809618, 0, 0.2078431, 1, 1,
0.3887249, 0.7484637, -1.311195, 0, 0.2039216, 1, 1,
0.3921902, -0.7562683, 2.528291, 0, 0.1960784, 1, 1,
0.3923275, 0.6399813, 1.30393, 0, 0.1882353, 1, 1,
0.3959622, 0.3884344, 3.11743, 0, 0.1843137, 1, 1,
0.3966292, -0.2721394, 4.340734, 0, 0.1764706, 1, 1,
0.3970131, 0.01772977, 2.717559, 0, 0.172549, 1, 1,
0.4008687, 0.7508428, -0.9021379, 0, 0.1647059, 1, 1,
0.403204, 0.5470691, 1.731082, 0, 0.1607843, 1, 1,
0.4079572, -0.3954705, 2.33221, 0, 0.1529412, 1, 1,
0.4079852, -1.049522, 2.085357, 0, 0.1490196, 1, 1,
0.4109807, 0.1200281, 0.7127498, 0, 0.1411765, 1, 1,
0.4144381, -1.229613, 2.875482, 0, 0.1372549, 1, 1,
0.4169735, 0.6030309, 2.082762, 0, 0.1294118, 1, 1,
0.4187842, 0.02002983, 2.389242, 0, 0.1254902, 1, 1,
0.4195387, 0.476331, 2.223045, 0, 0.1176471, 1, 1,
0.4208799, 0.2617743, 1.04487, 0, 0.1137255, 1, 1,
0.420947, -0.05539834, 2.216216, 0, 0.1058824, 1, 1,
0.4297103, -0.364166, 0.6139926, 0, 0.09803922, 1, 1,
0.4309841, 0.3748126, 0.06826887, 0, 0.09411765, 1, 1,
0.4359957, -1.137105, 2.573734, 0, 0.08627451, 1, 1,
0.4371979, -1.103878, 1.706432, 0, 0.08235294, 1, 1,
0.4375196, -0.5084921, 1.762849, 0, 0.07450981, 1, 1,
0.4420852, -0.4123218, 1.042064, 0, 0.07058824, 1, 1,
0.4446789, 0.7956995, 2.481994, 0, 0.0627451, 1, 1,
0.4495868, 1.279166, 1.495995, 0, 0.05882353, 1, 1,
0.4523408, -1.842271, 2.504741, 0, 0.05098039, 1, 1,
0.4532191, 0.6170138, 0.8081016, 0, 0.04705882, 1, 1,
0.4550418, 0.5163741, -0.05967811, 0, 0.03921569, 1, 1,
0.4568941, 0.3325698, 0.5693854, 0, 0.03529412, 1, 1,
0.4575061, 0.7920247, 0.8746128, 0, 0.02745098, 1, 1,
0.4600441, 0.4442852, 0.5713299, 0, 0.02352941, 1, 1,
0.4622528, -0.3719299, 2.306189, 0, 0.01568628, 1, 1,
0.465976, 0.338748, 2.008612, 0, 0.01176471, 1, 1,
0.46854, -0.7411755, 1.897108, 0, 0.003921569, 1, 1,
0.4689334, 1.722733, -0.6572596, 0.003921569, 0, 1, 1,
0.4739188, 1.486454, -0.6311451, 0.007843138, 0, 1, 1,
0.4768595, 2.083645, 0.8116946, 0.01568628, 0, 1, 1,
0.4797201, -0.430329, 3.671905, 0.01960784, 0, 1, 1,
0.4822857, -0.9575856, 2.15895, 0.02745098, 0, 1, 1,
0.4829523, -0.2532498, 3.295054, 0.03137255, 0, 1, 1,
0.4850504, 0.5163426, 1.353087, 0.03921569, 0, 1, 1,
0.4864346, -0.554031, 2.165631, 0.04313726, 0, 1, 1,
0.4926451, -0.4709083, 1.423796, 0.05098039, 0, 1, 1,
0.497283, -0.6490843, 1.545472, 0.05490196, 0, 1, 1,
0.5016379, -0.9507515, 1.608087, 0.0627451, 0, 1, 1,
0.5017694, 0.9435316, 0.249633, 0.06666667, 0, 1, 1,
0.5025032, -0.6283069, 3.241069, 0.07450981, 0, 1, 1,
0.5035148, 0.1246988, 1.553353, 0.07843138, 0, 1, 1,
0.5058388, -0.1677983, 1.366036, 0.08627451, 0, 1, 1,
0.506745, -1.019977, 1.242662, 0.09019608, 0, 1, 1,
0.5072273, 0.07988318, 1.242678, 0.09803922, 0, 1, 1,
0.5074105, -1.167295, 1.749491, 0.1058824, 0, 1, 1,
0.5089646, 0.4369063, 0.4104414, 0.1098039, 0, 1, 1,
0.511252, -2.275312, 2.637201, 0.1176471, 0, 1, 1,
0.5156036, -1.076069, 3.870965, 0.1215686, 0, 1, 1,
0.5171221, 2.117132, 2.330489, 0.1294118, 0, 1, 1,
0.517474, -0.7654814, 1.927999, 0.1333333, 0, 1, 1,
0.519902, 0.4828922, 2.373695, 0.1411765, 0, 1, 1,
0.5231264, 1.951718, -0.0580205, 0.145098, 0, 1, 1,
0.524487, -1.374786, 2.387529, 0.1529412, 0, 1, 1,
0.5256679, -1.645655, 1.891091, 0.1568628, 0, 1, 1,
0.5272129, 0.8353517, 1.519075, 0.1647059, 0, 1, 1,
0.5291538, -0.4807816, -0.3960033, 0.1686275, 0, 1, 1,
0.5305885, 0.8379733, 0.4170765, 0.1764706, 0, 1, 1,
0.5315295, 1.317581, 0.007139042, 0.1803922, 0, 1, 1,
0.5324399, 0.01519779, 1.596841, 0.1882353, 0, 1, 1,
0.5326105, 1.406047, -1.557462, 0.1921569, 0, 1, 1,
0.5340475, -0.01922156, 2.579003, 0.2, 0, 1, 1,
0.5362045, -0.3351841, 1.561801, 0.2078431, 0, 1, 1,
0.5392379, -0.9223447, 2.200283, 0.2117647, 0, 1, 1,
0.5401507, 2.04041, 0.2410484, 0.2196078, 0, 1, 1,
0.5407582, -1.057336, 1.341835, 0.2235294, 0, 1, 1,
0.546205, 0.8262753, 0.3320337, 0.2313726, 0, 1, 1,
0.5475384, -0.9853327, 2.151716, 0.2352941, 0, 1, 1,
0.5505001, 0.7922364, 1.143251, 0.2431373, 0, 1, 1,
0.5516928, 0.8662618, -0.3978324, 0.2470588, 0, 1, 1,
0.5626705, 0.02022558, 2.633029, 0.254902, 0, 1, 1,
0.5750065, 1.447149, -0.9327805, 0.2588235, 0, 1, 1,
0.577608, 0.9657705, 0.8721467, 0.2666667, 0, 1, 1,
0.5781571, -0.05510392, 3.310496, 0.2705882, 0, 1, 1,
0.5814711, -0.4561059, 2.30218, 0.2784314, 0, 1, 1,
0.5841004, -2.133341, 3.070071, 0.282353, 0, 1, 1,
0.5852042, -0.1599524, 1.872291, 0.2901961, 0, 1, 1,
0.5866583, -1.8345, 2.104844, 0.2941177, 0, 1, 1,
0.6033047, -0.1045905, 1.394012, 0.3019608, 0, 1, 1,
0.6065737, 9.430019e-05, 0.3203519, 0.3098039, 0, 1, 1,
0.6068494, -0.5635138, 3.085744, 0.3137255, 0, 1, 1,
0.6091743, 0.8574419, 1.450229, 0.3215686, 0, 1, 1,
0.6153055, -1.549556, 1.961877, 0.3254902, 0, 1, 1,
0.6234016, -0.694516, 4.410978, 0.3333333, 0, 1, 1,
0.6250172, -0.501134, 2.049239, 0.3372549, 0, 1, 1,
0.6261917, 1.420138, -0.5579641, 0.345098, 0, 1, 1,
0.6275776, 0.3738075, 1.87119, 0.3490196, 0, 1, 1,
0.6320577, 0.1832232, 2.232907, 0.3568628, 0, 1, 1,
0.6340417, -0.01601101, 2.261614, 0.3607843, 0, 1, 1,
0.6357329, -0.3291455, 2.676827, 0.3686275, 0, 1, 1,
0.6414056, -0.2674988, 2.06467, 0.372549, 0, 1, 1,
0.6415152, -1.131847, 2.762404, 0.3803922, 0, 1, 1,
0.643422, -1.14344, 2.724216, 0.3843137, 0, 1, 1,
0.6476626, 0.152045, 3.272951, 0.3921569, 0, 1, 1,
0.6504683, 0.2649204, 0.7041335, 0.3960784, 0, 1, 1,
0.6537049, 0.7673875, -0.2817537, 0.4039216, 0, 1, 1,
0.6541731, 0.06578948, 1.504671, 0.4117647, 0, 1, 1,
0.6545855, 0.7523588, -0.2447289, 0.4156863, 0, 1, 1,
0.6547318, -0.3347601, 1.667532, 0.4235294, 0, 1, 1,
0.655075, -1.04386, 1.289491, 0.427451, 0, 1, 1,
0.6590596, 1.405305, 1.792086, 0.4352941, 0, 1, 1,
0.6594466, 0.05387036, 3.142428, 0.4392157, 0, 1, 1,
0.6596358, 0.7538114, 1.772255, 0.4470588, 0, 1, 1,
0.6628319, 0.4980942, 2.661074, 0.4509804, 0, 1, 1,
0.6643625, 0.1611473, 0.5480382, 0.4588235, 0, 1, 1,
0.6676329, 0.9646493, 2.996949, 0.4627451, 0, 1, 1,
0.6711092, -1.687832, 2.817367, 0.4705882, 0, 1, 1,
0.6784358, -0.0812543, 1.566344, 0.4745098, 0, 1, 1,
0.6791008, 1.352244, -0.6645816, 0.4823529, 0, 1, 1,
0.6847116, -0.1879216, 2.363483, 0.4862745, 0, 1, 1,
0.6896537, 0.5447363, 2.144518, 0.4941176, 0, 1, 1,
0.694054, 0.9075449, -1.239267, 0.5019608, 0, 1, 1,
0.6967795, 0.03098588, 1.820818, 0.5058824, 0, 1, 1,
0.6980194, 0.2322933, 2.792195, 0.5137255, 0, 1, 1,
0.7006949, 1.461117, 0.05670477, 0.5176471, 0, 1, 1,
0.7048187, 1.166409, 1.416515, 0.5254902, 0, 1, 1,
0.7057391, 0.3480093, -1.173732, 0.5294118, 0, 1, 1,
0.7096692, 1.281935, -0.5778961, 0.5372549, 0, 1, 1,
0.7143238, -0.4630398, 3.32307, 0.5411765, 0, 1, 1,
0.714406, -0.668265, 1.901296, 0.5490196, 0, 1, 1,
0.7178172, 1.249287, 0.9891993, 0.5529412, 0, 1, 1,
0.7181217, 0.6113657, -0.3010374, 0.5607843, 0, 1, 1,
0.7213269, -0.1785671, 0.7498086, 0.5647059, 0, 1, 1,
0.7229078, -0.3182651, 0.1099855, 0.572549, 0, 1, 1,
0.723275, 1.07573, 1.27322, 0.5764706, 0, 1, 1,
0.7251, 1.138605, 0.4390228, 0.5843138, 0, 1, 1,
0.7256113, 0.882353, 1.935138, 0.5882353, 0, 1, 1,
0.7265815, -0.9504563, 2.266994, 0.5960785, 0, 1, 1,
0.7312871, -0.4324608, 1.496313, 0.6039216, 0, 1, 1,
0.7333813, -0.4389466, 1.812034, 0.6078432, 0, 1, 1,
0.7396514, 1.530411, -0.7395959, 0.6156863, 0, 1, 1,
0.7409514, -1.104406, 3.36227, 0.6196079, 0, 1, 1,
0.7471753, 0.8039641, 1.747267, 0.627451, 0, 1, 1,
0.7484581, -0.7055851, 4.458164, 0.6313726, 0, 1, 1,
0.7537028, 0.9746271, 0.7711092, 0.6392157, 0, 1, 1,
0.7566745, -0.3481428, 2.575368, 0.6431373, 0, 1, 1,
0.7588542, -1.060964, 0.3004011, 0.6509804, 0, 1, 1,
0.7589456, 1.364173, 1.135621, 0.654902, 0, 1, 1,
0.7602025, 0.9994888, -0.1794405, 0.6627451, 0, 1, 1,
0.7610561, 1.568529, 1.318101, 0.6666667, 0, 1, 1,
0.7617129, 0.2400407, 0.5834284, 0.6745098, 0, 1, 1,
0.7649538, -1.401578, 2.178596, 0.6784314, 0, 1, 1,
0.7732328, 0.368038, 0.8380196, 0.6862745, 0, 1, 1,
0.7736189, -0.7632834, 3.354698, 0.6901961, 0, 1, 1,
0.7780811, -1.385364, 3.159813, 0.6980392, 0, 1, 1,
0.7796145, -0.2598202, 0.9397549, 0.7058824, 0, 1, 1,
0.7848318, -0.3193969, 2.440938, 0.7098039, 0, 1, 1,
0.7867532, -0.2604958, 2.520301, 0.7176471, 0, 1, 1,
0.794261, 0.1812615, -0.3620215, 0.7215686, 0, 1, 1,
0.8033006, -0.3227473, 0.3148067, 0.7294118, 0, 1, 1,
0.8035146, 1.467268, 0.1013435, 0.7333333, 0, 1, 1,
0.8035346, -0.07541008, -0.5268334, 0.7411765, 0, 1, 1,
0.8037499, 1.128301, -0.8309914, 0.7450981, 0, 1, 1,
0.8039311, -0.8938423, 2.377405, 0.7529412, 0, 1, 1,
0.81104, 0.5115371, 0.6677907, 0.7568628, 0, 1, 1,
0.8146849, 1.415616, -0.4022895, 0.7647059, 0, 1, 1,
0.8176357, 0.8812646, 1.974406, 0.7686275, 0, 1, 1,
0.8199545, -0.174377, 2.247465, 0.7764706, 0, 1, 1,
0.8290254, -0.5475185, 1.103256, 0.7803922, 0, 1, 1,
0.8367589, 0.9520273, 2.747947, 0.7882353, 0, 1, 1,
0.840154, -0.4578955, 3.751816, 0.7921569, 0, 1, 1,
0.8418369, 0.6257376, 1.950649, 0.8, 0, 1, 1,
0.845898, -2.037603, 3.231215, 0.8078431, 0, 1, 1,
0.8547087, 1.801221, -1.585491, 0.8117647, 0, 1, 1,
0.8597723, -0.4785373, 3.307766, 0.8196079, 0, 1, 1,
0.8637455, -0.2372988, 3.406858, 0.8235294, 0, 1, 1,
0.8656953, -0.9099224, 2.853342, 0.8313726, 0, 1, 1,
0.8672036, -0.04856395, 0.9766864, 0.8352941, 0, 1, 1,
0.8737718, 0.2165033, 2.461262, 0.8431373, 0, 1, 1,
0.8740847, 2.425363, -2.06787, 0.8470588, 0, 1, 1,
0.8758271, -0.2664174, 2.364667, 0.854902, 0, 1, 1,
0.8803031, 1.105605, -1.374397, 0.8588235, 0, 1, 1,
0.8856307, 0.2684824, -0.406064, 0.8666667, 0, 1, 1,
0.8891023, -0.6962866, 3.043797, 0.8705882, 0, 1, 1,
0.8952774, -2.276419, 1.39927, 0.8784314, 0, 1, 1,
0.8997885, -0.5311108, 2.065355, 0.8823529, 0, 1, 1,
0.903472, -1.515221, 2.938156, 0.8901961, 0, 1, 1,
0.9070882, -0.05945041, 0.9595332, 0.8941177, 0, 1, 1,
0.9073293, 0.5515793, -0.2643065, 0.9019608, 0, 1, 1,
0.9096086, -0.7508912, 3.42928, 0.9098039, 0, 1, 1,
0.916385, 0.3756234, 1.359716, 0.9137255, 0, 1, 1,
0.9208629, -1.060968, 3.120273, 0.9215686, 0, 1, 1,
0.9234455, -0.174722, 0.3206446, 0.9254902, 0, 1, 1,
0.9248571, 1.170162, 0.4552381, 0.9333333, 0, 1, 1,
0.9260132, 0.8138723, 0.8989971, 0.9372549, 0, 1, 1,
0.9277443, 0.279727, 0.9842999, 0.945098, 0, 1, 1,
0.9301243, -2.732962, 3.338122, 0.9490196, 0, 1, 1,
0.936125, -0.1994515, 0.1160898, 0.9568627, 0, 1, 1,
0.9368661, 0.6592878, -0.5765083, 0.9607843, 0, 1, 1,
0.9426037, -0.8890198, 3.296498, 0.9686275, 0, 1, 1,
0.9546209, 1.292691, 0.2949589, 0.972549, 0, 1, 1,
0.9612179, -0.09565339, 1.514828, 0.9803922, 0, 1, 1,
0.9681786, 0.3980521, 0.4017241, 0.9843137, 0, 1, 1,
0.9686652, 0.07280298, -0.6367432, 0.9921569, 0, 1, 1,
0.9698473, -0.7516318, 3.111383, 0.9960784, 0, 1, 1,
0.9728465, -0.5614126, 1.156367, 1, 0, 0.9960784, 1,
0.9765235, -1.072977, 2.148249, 1, 0, 0.9882353, 1,
0.9780805, -0.4271485, 1.572118, 1, 0, 0.9843137, 1,
0.9857814, -1.417394, 2.093232, 1, 0, 0.9764706, 1,
0.9908491, 1.071701, 2.089236, 1, 0, 0.972549, 1,
0.9915969, 0.2358292, 2.090508, 1, 0, 0.9647059, 1,
0.99751, -1.247146, 2.672758, 1, 0, 0.9607843, 1,
0.9987608, 1.733666, 1.373748, 1, 0, 0.9529412, 1,
1.001688, -0.09787735, 2.404754, 1, 0, 0.9490196, 1,
1.007741, -0.08860593, 2.157079, 1, 0, 0.9411765, 1,
1.010437, -0.2829413, 1.106598, 1, 0, 0.9372549, 1,
1.012863, 0.8994213, 1.521481, 1, 0, 0.9294118, 1,
1.021908, 0.2735798, 1.415132, 1, 0, 0.9254902, 1,
1.022419, -1.583812, 2.138323, 1, 0, 0.9176471, 1,
1.032711, 1.504628, 0.901736, 1, 0, 0.9137255, 1,
1.035285, -0.5558046, 3.376338, 1, 0, 0.9058824, 1,
1.044572, -0.3123041, 2.915538, 1, 0, 0.9019608, 1,
1.04842, 0.3951552, 1.435754, 1, 0, 0.8941177, 1,
1.049372, 2.359483, 1.246392, 1, 0, 0.8862745, 1,
1.053078, 1.024985, 1.962892, 1, 0, 0.8823529, 1,
1.058365, -0.1719899, 2.924872, 1, 0, 0.8745098, 1,
1.060428, 0.5643541, 0.8689714, 1, 0, 0.8705882, 1,
1.075719, -2.174017, 0.549029, 1, 0, 0.8627451, 1,
1.0794, -0.6672991, 3.386316, 1, 0, 0.8588235, 1,
1.080016, 0.7927997, 0.910926, 1, 0, 0.8509804, 1,
1.081216, 0.126451, 0.2451464, 1, 0, 0.8470588, 1,
1.08468, 0.3017062, 2.458999, 1, 0, 0.8392157, 1,
1.09156, 1.425174, 2.054678, 1, 0, 0.8352941, 1,
1.092092, -0.3374314, 2.981372, 1, 0, 0.827451, 1,
1.101328, -1.419352, 1.259878, 1, 0, 0.8235294, 1,
1.103062, 0.837292, 0.6439648, 1, 0, 0.8156863, 1,
1.109443, -0.3991251, 0.2759088, 1, 0, 0.8117647, 1,
1.110904, 0.2428351, 2.054187, 1, 0, 0.8039216, 1,
1.112621, -0.1559023, 1.358218, 1, 0, 0.7960784, 1,
1.119159, -1.120858, 3.344448, 1, 0, 0.7921569, 1,
1.119495, -0.5350107, 3.185709, 1, 0, 0.7843137, 1,
1.120353, 0.91999, -0.1423497, 1, 0, 0.7803922, 1,
1.125799, -0.2811026, 1.382561, 1, 0, 0.772549, 1,
1.127241, -1.495284, 1.387876, 1, 0, 0.7686275, 1,
1.127539, -1.295584, 3.418663, 1, 0, 0.7607843, 1,
1.14186, 1.025155, -0.6743001, 1, 0, 0.7568628, 1,
1.144101, 0.9875239, 1.266156, 1, 0, 0.7490196, 1,
1.145789, 1.46684, 0.4500244, 1, 0, 0.7450981, 1,
1.146603, -2.446488, 2.695588, 1, 0, 0.7372549, 1,
1.147332, -1.256374, 4.358798, 1, 0, 0.7333333, 1,
1.148188, 0.595501, 1.257417, 1, 0, 0.7254902, 1,
1.159487, -1.81566, 4.677209, 1, 0, 0.7215686, 1,
1.159628, -0.7842807, 1.961325, 1, 0, 0.7137255, 1,
1.167389, -1.415568, 2.631145, 1, 0, 0.7098039, 1,
1.171233, 0.299569, 2.009955, 1, 0, 0.7019608, 1,
1.199618, 0.6997774, 3.262223, 1, 0, 0.6941177, 1,
1.200045, -0.6392383, 2.204892, 1, 0, 0.6901961, 1,
1.204048, 1.865091, 0.2285019, 1, 0, 0.682353, 1,
1.204977, 0.2650029, 1.552609, 1, 0, 0.6784314, 1,
1.209403, 2.510117, 0.1493517, 1, 0, 0.6705883, 1,
1.209978, -0.5964358, 0.09829252, 1, 0, 0.6666667, 1,
1.216505, 1.122436, 1.094941, 1, 0, 0.6588235, 1,
1.223717, 1.553477, 0.3076784, 1, 0, 0.654902, 1,
1.237554, 1.003047, 0.6106092, 1, 0, 0.6470588, 1,
1.242589, 0.1145542, -0.01559818, 1, 0, 0.6431373, 1,
1.243879, -0.7095711, 0.9467923, 1, 0, 0.6352941, 1,
1.246913, -0.9543463, 3.49848, 1, 0, 0.6313726, 1,
1.249134, -0.5503687, 2.224696, 1, 0, 0.6235294, 1,
1.254267, -0.3745192, 2.193423, 1, 0, 0.6196079, 1,
1.258747, 1.596087, -0.4529981, 1, 0, 0.6117647, 1,
1.265274, -0.5844269, 1.134047, 1, 0, 0.6078432, 1,
1.26593, -0.384988, 1.7431, 1, 0, 0.6, 1,
1.280275, 0.8752751, 1.730715, 1, 0, 0.5921569, 1,
1.284736, -0.3213004, 0.0624276, 1, 0, 0.5882353, 1,
1.284814, 0.1262142, 2.574809, 1, 0, 0.5803922, 1,
1.285759, 0.6573215, 0.4608581, 1, 0, 0.5764706, 1,
1.291161, 0.6144214, 0.6354001, 1, 0, 0.5686275, 1,
1.295017, -0.02592693, 1.299749, 1, 0, 0.5647059, 1,
1.295122, -2.119035, 1.86202, 1, 0, 0.5568628, 1,
1.312213, 0.9367692, 2.455969, 1, 0, 0.5529412, 1,
1.316726, 0.2481423, 2.431879, 1, 0, 0.5450981, 1,
1.318019, -0.4500942, 1.46057, 1, 0, 0.5411765, 1,
1.327673, -0.2751915, 2.915725, 1, 0, 0.5333334, 1,
1.331036, 1.803226, -0.7389703, 1, 0, 0.5294118, 1,
1.334315, -1.022181, 1.900242, 1, 0, 0.5215687, 1,
1.335743, -0.6014261, 3.026627, 1, 0, 0.5176471, 1,
1.342911, -1.267399, 1.891328, 1, 0, 0.509804, 1,
1.34816, 0.8642772, 1.853845, 1, 0, 0.5058824, 1,
1.356034, 0.3515621, 1.7207, 1, 0, 0.4980392, 1,
1.356229, 0.1127967, 0.9449037, 1, 0, 0.4901961, 1,
1.357505, 0.404011, 2.076925, 1, 0, 0.4862745, 1,
1.379449, 1.120723, 0.2934717, 1, 0, 0.4784314, 1,
1.412757, -0.0006451052, 1.159979, 1, 0, 0.4745098, 1,
1.420208, 0.7117329, 1.834393, 1, 0, 0.4666667, 1,
1.424422, -0.6280645, 2.833719, 1, 0, 0.4627451, 1,
1.431806, 1.377598, 0.08876988, 1, 0, 0.454902, 1,
1.433725, -0.4405363, 2.696904, 1, 0, 0.4509804, 1,
1.437977, -0.3628168, 2.422816, 1, 0, 0.4431373, 1,
1.443206, 1.328919, 0.2422262, 1, 0, 0.4392157, 1,
1.476771, -0.9275458, 2.841512, 1, 0, 0.4313726, 1,
1.481884, 0.9733223, 0.9828334, 1, 0, 0.427451, 1,
1.490487, 1.5339, 0.03570314, 1, 0, 0.4196078, 1,
1.493025, -0.3436427, 0.698395, 1, 0, 0.4156863, 1,
1.504591, -1.211231, 2.36997, 1, 0, 0.4078431, 1,
1.513257, -0.3635686, 2.951077, 1, 0, 0.4039216, 1,
1.536975, -0.7759071, 1.582656, 1, 0, 0.3960784, 1,
1.537877, 0.6151971, -0.392706, 1, 0, 0.3882353, 1,
1.551871, -0.4824596, 3.165863, 1, 0, 0.3843137, 1,
1.554748, 0.8136267, -0.6444981, 1, 0, 0.3764706, 1,
1.566103, -0.4516752, 0.8323101, 1, 0, 0.372549, 1,
1.567381, -0.7437333, 2.242735, 1, 0, 0.3647059, 1,
1.569515, 0.7585401, 0.6881649, 1, 0, 0.3607843, 1,
1.573508, 1.711265, 0.6945878, 1, 0, 0.3529412, 1,
1.57585, 0.3222121, 1.151891, 1, 0, 0.3490196, 1,
1.593436, 0.5319845, 1.396317, 1, 0, 0.3411765, 1,
1.598906, 1.169402, 1.881525, 1, 0, 0.3372549, 1,
1.613506, 0.784657, 1.226075, 1, 0, 0.3294118, 1,
1.61769, -0.3404061, 2.555992, 1, 0, 0.3254902, 1,
1.624028, -0.5181366, 3.668775, 1, 0, 0.3176471, 1,
1.628024, 1.147387, 1.800105, 1, 0, 0.3137255, 1,
1.639549, -1.199004, 3.90748, 1, 0, 0.3058824, 1,
1.656934, 1.510922, 0.169561, 1, 0, 0.2980392, 1,
1.660764, 1.33526, 0.4868603, 1, 0, 0.2941177, 1,
1.661232, -0.9607715, 1.968809, 1, 0, 0.2862745, 1,
1.670323, -1.31241, 0.3280512, 1, 0, 0.282353, 1,
1.673998, -0.1079397, 2.537513, 1, 0, 0.2745098, 1,
1.681578, -0.1918016, 2.241853, 1, 0, 0.2705882, 1,
1.687611, 0.9075187, 0.7224154, 1, 0, 0.2627451, 1,
1.711762, -0.7108742, 3.389121, 1, 0, 0.2588235, 1,
1.742074, 0.2561479, 2.977754, 1, 0, 0.2509804, 1,
1.752766, 0.5983326, -0.771693, 1, 0, 0.2470588, 1,
1.776575, -0.8650142, 3.361454, 1, 0, 0.2392157, 1,
1.79046, -0.738666, 0.3901447, 1, 0, 0.2352941, 1,
1.792535, 0.6289779, 0.7937384, 1, 0, 0.227451, 1,
1.810809, -1.047952, 0.9142567, 1, 0, 0.2235294, 1,
1.812555, -0.2030364, 1.974235, 1, 0, 0.2156863, 1,
1.815027, -1.472602, 2.336894, 1, 0, 0.2117647, 1,
1.820408, -0.4177373, 1.531214, 1, 0, 0.2039216, 1,
1.827273, -0.5601048, 1.593886, 1, 0, 0.1960784, 1,
1.83017, 1.510476, 1.632032, 1, 0, 0.1921569, 1,
1.847489, -1.183981, 0.5108494, 1, 0, 0.1843137, 1,
1.865068, 0.894825, 0.8481938, 1, 0, 0.1803922, 1,
1.872089, 0.1583313, 2.311006, 1, 0, 0.172549, 1,
1.887629, 0.2354828, 1.794946, 1, 0, 0.1686275, 1,
1.899322, -0.5633989, 1.997117, 1, 0, 0.1607843, 1,
1.925188, -2.109124, 0.7677959, 1, 0, 0.1568628, 1,
1.931462, 0.685155, 1.647951, 1, 0, 0.1490196, 1,
1.944412, -0.9498838, 1.403247, 1, 0, 0.145098, 1,
1.953125, 0.09625614, 3.235583, 1, 0, 0.1372549, 1,
1.967322, 1.330241, 1.740603, 1, 0, 0.1333333, 1,
1.984801, 0.6321561, 0.5290447, 1, 0, 0.1254902, 1,
1.993733, -1.318254, 5.267425, 1, 0, 0.1215686, 1,
1.996814, 0.8969947, 3.185219e-05, 1, 0, 0.1137255, 1,
2.036832, -0.6245284, 1.446138, 1, 0, 0.1098039, 1,
2.050575, 0.83161, 1.156366, 1, 0, 0.1019608, 1,
2.055536, -0.6239816, 0.5076646, 1, 0, 0.09411765, 1,
2.08035, 0.3620967, 0.9413448, 1, 0, 0.09019608, 1,
2.109521, -0.004727343, 3.901813, 1, 0, 0.08235294, 1,
2.119065, -1.480522, 1.39534, 1, 0, 0.07843138, 1,
2.126127, -1.090741, 1.562779, 1, 0, 0.07058824, 1,
2.140156, -0.5952035, 2.940084, 1, 0, 0.06666667, 1,
2.193091, 0.277167, -0.4282888, 1, 0, 0.05882353, 1,
2.208588, 0.317532, 1.110216, 1, 0, 0.05490196, 1,
2.23531, 1.125456, 0.9998007, 1, 0, 0.04705882, 1,
2.322848, 2.213446, 1.949446, 1, 0, 0.04313726, 1,
2.411258, 0.6152579, 1.066024, 1, 0, 0.03529412, 1,
2.419644, -1.613466, 2.056623, 1, 0, 0.03137255, 1,
2.44014, 1.807891, 1.751218, 1, 0, 0.02352941, 1,
2.441034, -0.2512355, 2.918547, 1, 0, 0.01960784, 1,
2.521867, 0.2790488, 0.9275903, 1, 0, 0.01176471, 1,
2.557835, -1.392513, 2.003701, 1, 0, 0.007843138, 1
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
-0.2474353, -4.720105, -7.293864, 0, -0.5, 0.5, 0.5,
-0.2474353, -4.720105, -7.293864, 1, -0.5, 0.5, 0.5,
-0.2474353, -4.720105, -7.293864, 1, 1.5, 0.5, 0.5,
-0.2474353, -4.720105, -7.293864, 0, 1.5, 0.5, 0.5
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
-4.003693, -0.4233803, -7.293864, 0, -0.5, 0.5, 0.5,
-4.003693, -0.4233803, -7.293864, 1, -0.5, 0.5, 0.5,
-4.003693, -0.4233803, -7.293864, 1, 1.5, 0.5, 0.5,
-4.003693, -0.4233803, -7.293864, 0, 1.5, 0.5, 0.5
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
-4.003693, -4.720105, -0.1029422, 0, -0.5, 0.5, 0.5,
-4.003693, -4.720105, -0.1029422, 1, -0.5, 0.5, 0.5,
-4.003693, -4.720105, -0.1029422, 1, 1.5, 0.5, 0.5,
-4.003693, -4.720105, -0.1029422, 0, 1.5, 0.5, 0.5
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
-3, -3.728553, -5.63442,
2, -3.728553, -5.63442,
-3, -3.728553, -5.63442,
-3, -3.893812, -5.910995,
-2, -3.728553, -5.63442,
-2, -3.893812, -5.910995,
-1, -3.728553, -5.63442,
-1, -3.893812, -5.910995,
0, -3.728553, -5.63442,
0, -3.893812, -5.910995,
1, -3.728553, -5.63442,
1, -3.893812, -5.910995,
2, -3.728553, -5.63442,
2, -3.893812, -5.910995
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
-3, -4.224329, -6.464142, 0, -0.5, 0.5, 0.5,
-3, -4.224329, -6.464142, 1, -0.5, 0.5, 0.5,
-3, -4.224329, -6.464142, 1, 1.5, 0.5, 0.5,
-3, -4.224329, -6.464142, 0, 1.5, 0.5, 0.5,
-2, -4.224329, -6.464142, 0, -0.5, 0.5, 0.5,
-2, -4.224329, -6.464142, 1, -0.5, 0.5, 0.5,
-2, -4.224329, -6.464142, 1, 1.5, 0.5, 0.5,
-2, -4.224329, -6.464142, 0, 1.5, 0.5, 0.5,
-1, -4.224329, -6.464142, 0, -0.5, 0.5, 0.5,
-1, -4.224329, -6.464142, 1, -0.5, 0.5, 0.5,
-1, -4.224329, -6.464142, 1, 1.5, 0.5, 0.5,
-1, -4.224329, -6.464142, 0, 1.5, 0.5, 0.5,
0, -4.224329, -6.464142, 0, -0.5, 0.5, 0.5,
0, -4.224329, -6.464142, 1, -0.5, 0.5, 0.5,
0, -4.224329, -6.464142, 1, 1.5, 0.5, 0.5,
0, -4.224329, -6.464142, 0, 1.5, 0.5, 0.5,
1, -4.224329, -6.464142, 0, -0.5, 0.5, 0.5,
1, -4.224329, -6.464142, 1, -0.5, 0.5, 0.5,
1, -4.224329, -6.464142, 1, 1.5, 0.5, 0.5,
1, -4.224329, -6.464142, 0, 1.5, 0.5, 0.5,
2, -4.224329, -6.464142, 0, -0.5, 0.5, 0.5,
2, -4.224329, -6.464142, 1, -0.5, 0.5, 0.5,
2, -4.224329, -6.464142, 1, 1.5, 0.5, 0.5,
2, -4.224329, -6.464142, 0, 1.5, 0.5, 0.5
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
-3.136864, -3, -5.63442,
-3.136864, 2, -5.63442,
-3.136864, -3, -5.63442,
-3.281335, -3, -5.910995,
-3.136864, -2, -5.63442,
-3.281335, -2, -5.910995,
-3.136864, -1, -5.63442,
-3.281335, -1, -5.910995,
-3.136864, 0, -5.63442,
-3.281335, 0, -5.910995,
-3.136864, 1, -5.63442,
-3.281335, 1, -5.910995,
-3.136864, 2, -5.63442,
-3.281335, 2, -5.910995
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
-3.570278, -3, -6.464142, 0, -0.5, 0.5, 0.5,
-3.570278, -3, -6.464142, 1, -0.5, 0.5, 0.5,
-3.570278, -3, -6.464142, 1, 1.5, 0.5, 0.5,
-3.570278, -3, -6.464142, 0, 1.5, 0.5, 0.5,
-3.570278, -2, -6.464142, 0, -0.5, 0.5, 0.5,
-3.570278, -2, -6.464142, 1, -0.5, 0.5, 0.5,
-3.570278, -2, -6.464142, 1, 1.5, 0.5, 0.5,
-3.570278, -2, -6.464142, 0, 1.5, 0.5, 0.5,
-3.570278, -1, -6.464142, 0, -0.5, 0.5, 0.5,
-3.570278, -1, -6.464142, 1, -0.5, 0.5, 0.5,
-3.570278, -1, -6.464142, 1, 1.5, 0.5, 0.5,
-3.570278, -1, -6.464142, 0, 1.5, 0.5, 0.5,
-3.570278, 0, -6.464142, 0, -0.5, 0.5, 0.5,
-3.570278, 0, -6.464142, 1, -0.5, 0.5, 0.5,
-3.570278, 0, -6.464142, 1, 1.5, 0.5, 0.5,
-3.570278, 0, -6.464142, 0, 1.5, 0.5, 0.5,
-3.570278, 1, -6.464142, 0, -0.5, 0.5, 0.5,
-3.570278, 1, -6.464142, 1, -0.5, 0.5, 0.5,
-3.570278, 1, -6.464142, 1, 1.5, 0.5, 0.5,
-3.570278, 1, -6.464142, 0, 1.5, 0.5, 0.5,
-3.570278, 2, -6.464142, 0, -0.5, 0.5, 0.5,
-3.570278, 2, -6.464142, 1, -0.5, 0.5, 0.5,
-3.570278, 2, -6.464142, 1, 1.5, 0.5, 0.5,
-3.570278, 2, -6.464142, 0, 1.5, 0.5, 0.5
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
-3.136864, -3.728553, -4,
-3.136864, -3.728553, 4,
-3.136864, -3.728553, -4,
-3.281335, -3.893812, -4,
-3.136864, -3.728553, -2,
-3.281335, -3.893812, -2,
-3.136864, -3.728553, 0,
-3.281335, -3.893812, 0,
-3.136864, -3.728553, 2,
-3.281335, -3.893812, 2,
-3.136864, -3.728553, 4,
-3.281335, -3.893812, 4
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
-3.570278, -4.224329, -4, 0, -0.5, 0.5, 0.5,
-3.570278, -4.224329, -4, 1, -0.5, 0.5, 0.5,
-3.570278, -4.224329, -4, 1, 1.5, 0.5, 0.5,
-3.570278, -4.224329, -4, 0, 1.5, 0.5, 0.5,
-3.570278, -4.224329, -2, 0, -0.5, 0.5, 0.5,
-3.570278, -4.224329, -2, 1, -0.5, 0.5, 0.5,
-3.570278, -4.224329, -2, 1, 1.5, 0.5, 0.5,
-3.570278, -4.224329, -2, 0, 1.5, 0.5, 0.5,
-3.570278, -4.224329, 0, 0, -0.5, 0.5, 0.5,
-3.570278, -4.224329, 0, 1, -0.5, 0.5, 0.5,
-3.570278, -4.224329, 0, 1, 1.5, 0.5, 0.5,
-3.570278, -4.224329, 0, 0, 1.5, 0.5, 0.5,
-3.570278, -4.224329, 2, 0, -0.5, 0.5, 0.5,
-3.570278, -4.224329, 2, 1, -0.5, 0.5, 0.5,
-3.570278, -4.224329, 2, 1, 1.5, 0.5, 0.5,
-3.570278, -4.224329, 2, 0, 1.5, 0.5, 0.5,
-3.570278, -4.224329, 4, 0, -0.5, 0.5, 0.5,
-3.570278, -4.224329, 4, 1, -0.5, 0.5, 0.5,
-3.570278, -4.224329, 4, 1, 1.5, 0.5, 0.5,
-3.570278, -4.224329, 4, 0, 1.5, 0.5, 0.5
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
-3.136864, -3.728553, -5.63442,
-3.136864, 2.881793, -5.63442,
-3.136864, -3.728553, 5.428536,
-3.136864, 2.881793, 5.428536,
-3.136864, -3.728553, -5.63442,
-3.136864, -3.728553, 5.428536,
-3.136864, 2.881793, -5.63442,
-3.136864, 2.881793, 5.428536,
-3.136864, -3.728553, -5.63442,
2.641993, -3.728553, -5.63442,
-3.136864, -3.728553, 5.428536,
2.641993, -3.728553, 5.428536,
-3.136864, 2.881793, -5.63442,
2.641993, 2.881793, -5.63442,
-3.136864, 2.881793, 5.428536,
2.641993, 2.881793, 5.428536,
2.641993, -3.728553, -5.63442,
2.641993, 2.881793, -5.63442,
2.641993, -3.728553, 5.428536,
2.641993, 2.881793, 5.428536,
2.641993, -3.728553, -5.63442,
2.641993, -3.728553, 5.428536,
2.641993, 2.881793, -5.63442,
2.641993, 2.881793, 5.428536
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
var radius = 7.541819;
var distance = 33.55441;
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
mvMatrix.translate( 0.2474353, 0.4233803, 0.1029422 );
mvMatrix.scale( 1.411068, 1.233576, 0.7370871 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.55441);
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
Lipan<-read.table("Lipan.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Lipan$V2
```

```
## Error in eval(expr, envir, enclos): object 'Lipan' not found
```

```r
y<-Lipan$V3
```

```
## Error in eval(expr, envir, enclos): object 'Lipan' not found
```

```r
z<-Lipan$V4
```

```
## Error in eval(expr, envir, enclos): object 'Lipan' not found
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
-3.052706, -0.5116594, -2.821073, 0, 0, 1, 1, 1,
-2.988623, 0.4500566, -0.2785224, 1, 0, 0, 1, 1,
-2.933424, 0.2857658, 0.3988912, 1, 0, 0, 1, 1,
-2.921952, 1.388865, 0.1364132, 1, 0, 0, 1, 1,
-2.91993, 0.1823699, -0.4423897, 1, 0, 0, 1, 1,
-2.731879, 1.234115, -0.008933966, 1, 0, 0, 1, 1,
-2.652787, -0.2125725, -0.3295185, 0, 0, 0, 1, 1,
-2.601427, -0.5571755, -1.534604, 0, 0, 0, 1, 1,
-2.589398, -1.382359, -1.599283, 0, 0, 0, 1, 1,
-2.466502, -0.7365248, -2.103539, 0, 0, 0, 1, 1,
-2.299631, 0.8971518, -3.120945, 0, 0, 0, 1, 1,
-2.29536, 0.01849341, -1.268582, 0, 0, 0, 1, 1,
-2.272833, -0.1588648, -1.090097, 0, 0, 0, 1, 1,
-2.208997, -0.2641493, -1.428217, 1, 1, 1, 1, 1,
-2.17261, -0.105961, -2.969629, 1, 1, 1, 1, 1,
-2.167885, -0.9474455, -2.178724, 1, 1, 1, 1, 1,
-2.021812, 0.7314806, -0.2965543, 1, 1, 1, 1, 1,
-2.012254, -0.4970746, -2.424986, 1, 1, 1, 1, 1,
-2.009273, 0.8455979, -0.8156738, 1, 1, 1, 1, 1,
-1.977403, 1.228528, -1.479607, 1, 1, 1, 1, 1,
-1.971827, 1.746935, -0.04431295, 1, 1, 1, 1, 1,
-1.951838, -0.7260382, -1.754781, 1, 1, 1, 1, 1,
-1.932941, 0.7627361, 0.5212727, 1, 1, 1, 1, 1,
-1.930695, 0.7465144, -1.006785, 1, 1, 1, 1, 1,
-1.89499, -0.7917464, -1.992413, 1, 1, 1, 1, 1,
-1.891009, -0.4113271, -1.120932, 1, 1, 1, 1, 1,
-1.881552, 0.8183343, -1.807843, 1, 1, 1, 1, 1,
-1.861626, 0.2252903, -1.162823, 1, 1, 1, 1, 1,
-1.844511, 1.541921, -0.6677589, 0, 0, 1, 1, 1,
-1.804988, 0.01701233, -0.6177955, 1, 0, 0, 1, 1,
-1.780229, -1.263568, -2.67657, 1, 0, 0, 1, 1,
-1.771683, -1.16934, -0.9886618, 1, 0, 0, 1, 1,
-1.732483, 0.8589214, -1.533162, 1, 0, 0, 1, 1,
-1.698771, -1.289931, -2.199657, 1, 0, 0, 1, 1,
-1.695623, 0.05221635, -1.58041, 0, 0, 0, 1, 1,
-1.693481, -1.190638, -0.854111, 0, 0, 0, 1, 1,
-1.677958, 0.6149516, -0.4074511, 0, 0, 0, 1, 1,
-1.675241, 0.09767832, -1.637845, 0, 0, 0, 1, 1,
-1.643586, -1.074915, -1.475344, 0, 0, 0, 1, 1,
-1.630873, 0.381488, -0.08003933, 0, 0, 0, 1, 1,
-1.629338, -0.5986205, -1.357582, 0, 0, 0, 1, 1,
-1.624182, 0.1731832, -1.819348, 1, 1, 1, 1, 1,
-1.622405, 0.2339697, -0.6827199, 1, 1, 1, 1, 1,
-1.612325, -1.208975, -1.772523, 1, 1, 1, 1, 1,
-1.583608, 0.8111978, -1.703562, 1, 1, 1, 1, 1,
-1.578408, 0.02078439, -0.998955, 1, 1, 1, 1, 1,
-1.568043, 0.09931923, -0.8205678, 1, 1, 1, 1, 1,
-1.556945, 0.9903682, -1.546883, 1, 1, 1, 1, 1,
-1.553849, -0.6600175, -1.990025, 1, 1, 1, 1, 1,
-1.551303, -0.3233452, -1.502475, 1, 1, 1, 1, 1,
-1.549861, 1.258541, -1.799405, 1, 1, 1, 1, 1,
-1.540651, 0.3083418, -1.187155, 1, 1, 1, 1, 1,
-1.539603, -1.098284, -2.17793, 1, 1, 1, 1, 1,
-1.532967, 1.333362, -0.4779926, 1, 1, 1, 1, 1,
-1.528835, -0.7714114, -1.282935, 1, 1, 1, 1, 1,
-1.522407, 0.9915355, -2.216775, 1, 1, 1, 1, 1,
-1.520736, 1.017242, 0.8808513, 0, 0, 1, 1, 1,
-1.515881, 0.3399355, -2.23696, 1, 0, 0, 1, 1,
-1.514477, -0.8372953, -3.114262, 1, 0, 0, 1, 1,
-1.482207, 2.079807, -0.8456543, 1, 0, 0, 1, 1,
-1.460727, 0.4817751, -1.724899, 1, 0, 0, 1, 1,
-1.448749, 0.3036834, -2.080271, 1, 0, 0, 1, 1,
-1.448229, -0.8632579, -3.975713, 0, 0, 0, 1, 1,
-1.442658, 0.5296679, -1.319656, 0, 0, 0, 1, 1,
-1.440662, 1.305054, -0.3280624, 0, 0, 0, 1, 1,
-1.435348, 0.4032452, -0.8747075, 0, 0, 0, 1, 1,
-1.428909, 0.07219269, -1.015121, 0, 0, 0, 1, 1,
-1.421238, -1.263357, -3.248463, 0, 0, 0, 1, 1,
-1.412867, 0.3591924, -2.267992, 0, 0, 0, 1, 1,
-1.410888, -1.159064, -0.1062303, 1, 1, 1, 1, 1,
-1.405564, -0.1087735, -2.077053, 1, 1, 1, 1, 1,
-1.386505, -0.0561698, -1.963851, 1, 1, 1, 1, 1,
-1.385647, 0.6843136, 0.08355262, 1, 1, 1, 1, 1,
-1.383864, -0.8142143, -3.545287, 1, 1, 1, 1, 1,
-1.38161, -1.252062, -2.000264, 1, 1, 1, 1, 1,
-1.378256, -1.060718, -2.197158, 1, 1, 1, 1, 1,
-1.376553, 0.2450003, -0.6504931, 1, 1, 1, 1, 1,
-1.370675, -0.4697399, -2.201307, 1, 1, 1, 1, 1,
-1.366742, 0.4900402, -2.707966, 1, 1, 1, 1, 1,
-1.359765, -0.8658463, -1.110753, 1, 1, 1, 1, 1,
-1.354992, -0.302065, -0.9460906, 1, 1, 1, 1, 1,
-1.354326, -1.037258, -2.413308, 1, 1, 1, 1, 1,
-1.327901, -0.2458671, -2.457232, 1, 1, 1, 1, 1,
-1.327342, -0.2815058, -1.798747, 1, 1, 1, 1, 1,
-1.327287, -0.8752169, -4.266936, 0, 0, 1, 1, 1,
-1.32661, 0.0009124795, -2.842513, 1, 0, 0, 1, 1,
-1.321978, -0.1143862, -0.5976853, 1, 0, 0, 1, 1,
-1.32027, 1.061027, -1.127025, 1, 0, 0, 1, 1,
-1.319069, -1.987366, -3.848793, 1, 0, 0, 1, 1,
-1.315271, 0.06773999, -2.718386, 1, 0, 0, 1, 1,
-1.312266, 0.9042678, -0.7141141, 0, 0, 0, 1, 1,
-1.309935, 0.5680396, -0.641742, 0, 0, 0, 1, 1,
-1.308425, 0.976662, -0.4665538, 0, 0, 0, 1, 1,
-1.308387, -0.6874876, -2.086228, 0, 0, 0, 1, 1,
-1.307788, 0.6642854, -1.242618, 0, 0, 0, 1, 1,
-1.306458, -0.5605874, -1.308637, 0, 0, 0, 1, 1,
-1.305224, -0.7152455, -1.664763, 0, 0, 0, 1, 1,
-1.304868, 1.231482, 0.2624304, 1, 1, 1, 1, 1,
-1.298734, -0.2749961, -3.094335, 1, 1, 1, 1, 1,
-1.285809, -0.3894637, -3.061805, 1, 1, 1, 1, 1,
-1.267046, -1.197266, -1.94109, 1, 1, 1, 1, 1,
-1.266064, 0.964659, -0.4326381, 1, 1, 1, 1, 1,
-1.263441, -0.929105, -1.786992, 1, 1, 1, 1, 1,
-1.260974, 1.014092, -2.540651, 1, 1, 1, 1, 1,
-1.242285, 0.6708, -1.814248, 1, 1, 1, 1, 1,
-1.240168, -0.7931474, -0.5574744, 1, 1, 1, 1, 1,
-1.232034, 1.39676, -0.4590395, 1, 1, 1, 1, 1,
-1.222227, 1.379782, -1.364707, 1, 1, 1, 1, 1,
-1.217971, 0.7830426, -1.533776, 1, 1, 1, 1, 1,
-1.21501, 0.9933207, -0.2985401, 1, 1, 1, 1, 1,
-1.202331, 1.066915, 0.2848716, 1, 1, 1, 1, 1,
-1.185951, 0.7948316, -2.001545, 1, 1, 1, 1, 1,
-1.182198, 0.405335, 0.1614343, 0, 0, 1, 1, 1,
-1.173831, 1.052411, -1.439239, 1, 0, 0, 1, 1,
-1.173469, -0.1796536, -0.6087322, 1, 0, 0, 1, 1,
-1.170467, -0.1657055, 0.06956226, 1, 0, 0, 1, 1,
-1.163199, 0.139765, -1.937394, 1, 0, 0, 1, 1,
-1.158903, -0.7339988, -0.3701455, 1, 0, 0, 1, 1,
-1.147244, -0.1078055, -0.8218383, 0, 0, 0, 1, 1,
-1.140915, 0.3674749, -1.258903, 0, 0, 0, 1, 1,
-1.138094, -0.3168652, -3.252228, 0, 0, 0, 1, 1,
-1.134258, -1.523496, -2.706702, 0, 0, 0, 1, 1,
-1.112171, 0.7031586, 1.986256, 0, 0, 0, 1, 1,
-1.108418, -0.1770973, -1.891714, 0, 0, 0, 1, 1,
-1.10728, 0.1406274, -2.089133, 0, 0, 0, 1, 1,
-1.099686, 1.039872, -1.047236, 1, 1, 1, 1, 1,
-1.095901, 0.4271696, -0.02966626, 1, 1, 1, 1, 1,
-1.093058, -0.673358, -3.448899, 1, 1, 1, 1, 1,
-1.092805, 0.04528826, -0.6494455, 1, 1, 1, 1, 1,
-1.089761, 1.241717, -0.6956669, 1, 1, 1, 1, 1,
-1.08886, 0.9719391, -0.9217173, 1, 1, 1, 1, 1,
-1.087748, -0.60824, -2.616012, 1, 1, 1, 1, 1,
-1.082139, 0.207019, -1.879927, 1, 1, 1, 1, 1,
-1.076272, 0.2908137, -1.611503, 1, 1, 1, 1, 1,
-1.073089, -1.194891, -2.334857, 1, 1, 1, 1, 1,
-1.051851, -0.01507889, -0.7386535, 1, 1, 1, 1, 1,
-1.049949, -1.274072, -2.326927, 1, 1, 1, 1, 1,
-1.049861, -0.2249362, -0.9465263, 1, 1, 1, 1, 1,
-1.047874, 1.756372, 0.05325467, 1, 1, 1, 1, 1,
-1.04707, -0.8324762, -2.898308, 1, 1, 1, 1, 1,
-1.043429, 0.8022256, -4.110703, 0, 0, 1, 1, 1,
-1.043298, -1.149095, -2.10736, 1, 0, 0, 1, 1,
-1.042178, 1.470122, -0.240565, 1, 0, 0, 1, 1,
-1.041921, -0.7084681, -2.307205, 1, 0, 0, 1, 1,
-1.041586, -1.847929, -3.359895, 1, 0, 0, 1, 1,
-1.03486, 1.644352, 0.1986064, 1, 0, 0, 1, 1,
-1.031937, 0.8489835, -0.2917887, 0, 0, 0, 1, 1,
-1.029573, 0.7016603, -2.06867, 0, 0, 0, 1, 1,
-1.027268, 1.003603, -1.805665, 0, 0, 0, 1, 1,
-1.024721, 0.7055691, 0.7272433, 0, 0, 0, 1, 1,
-1.021636, -2.040854, -3.022583, 0, 0, 0, 1, 1,
-1.008214, -0.8690385, -1.711831, 0, 0, 0, 1, 1,
-0.9991064, -1.914791, -2.020535, 0, 0, 0, 1, 1,
-0.9990063, 0.8304121, -0.968743, 1, 1, 1, 1, 1,
-0.9966552, -1.666428, -2.987061, 1, 1, 1, 1, 1,
-0.9958345, -0.2889954, -2.380265, 1, 1, 1, 1, 1,
-0.9907017, 1.360116, -0.2881083, 1, 1, 1, 1, 1,
-0.9870301, 0.8332554, -1.947296, 1, 1, 1, 1, 1,
-0.9809313, -0.8631219, -2.381625, 1, 1, 1, 1, 1,
-0.9805263, -0.5308016, -2.110293, 1, 1, 1, 1, 1,
-0.9799746, -0.2397776, -3.316815, 1, 1, 1, 1, 1,
-0.9778234, 0.06385067, -0.8665788, 1, 1, 1, 1, 1,
-0.9730568, -0.7160189, -0.5880035, 1, 1, 1, 1, 1,
-0.9712102, -0.4668323, -2.453268, 1, 1, 1, 1, 1,
-0.971185, -0.2502021, -2.257357, 1, 1, 1, 1, 1,
-0.9711019, 0.1189942, -2.471442, 1, 1, 1, 1, 1,
-0.969082, -0.2942754, -0.7092802, 1, 1, 1, 1, 1,
-0.9635896, -0.2583547, -0.02776265, 1, 1, 1, 1, 1,
-0.9568005, 2.267249, -1.318636, 0, 0, 1, 1, 1,
-0.9539055, 0.9177627, 0.2966895, 1, 0, 0, 1, 1,
-0.9521112, -1.373275, -1.963744, 1, 0, 0, 1, 1,
-0.9478477, -1.063796, -1.662073, 1, 0, 0, 1, 1,
-0.938011, -0.8963922, -1.321837, 1, 0, 0, 1, 1,
-0.9375157, 1.509217, -0.5707493, 1, 0, 0, 1, 1,
-0.9253815, -2.390354, -3.887312, 0, 0, 0, 1, 1,
-0.920522, -0.05339151, -0.5127213, 0, 0, 0, 1, 1,
-0.919625, 1.395026, -1.607459, 0, 0, 0, 1, 1,
-0.9085944, -0.7875059, -2.085377, 0, 0, 0, 1, 1,
-0.908452, 1.223166, -1.07863, 0, 0, 0, 1, 1,
-0.9077517, -0.1734979, 0.8405261, 0, 0, 0, 1, 1,
-0.9060189, 0.8133573, -0.05577398, 0, 0, 0, 1, 1,
-0.9010693, 0.507589, -2.361104, 1, 1, 1, 1, 1,
-0.8962376, 0.7921922, -0.06923071, 1, 1, 1, 1, 1,
-0.8844211, -0.993202, -0.5922451, 1, 1, 1, 1, 1,
-0.8808771, 0.4784312, -1.358064, 1, 1, 1, 1, 1,
-0.8800048, -0.6518866, -0.4553301, 1, 1, 1, 1, 1,
-0.8770154, -0.05798405, -1.537753, 1, 1, 1, 1, 1,
-0.8751317, 0.3401158, -0.09007184, 1, 1, 1, 1, 1,
-0.8691198, -1.103892, -1.537516, 1, 1, 1, 1, 1,
-0.85101, 0.6757433, 0.07348561, 1, 1, 1, 1, 1,
-0.8488469, 0.7958957, -0.4539381, 1, 1, 1, 1, 1,
-0.8433242, -2.029341, -2.389816, 1, 1, 1, 1, 1,
-0.837499, 0.3839567, -1.988387, 1, 1, 1, 1, 1,
-0.8344164, 1.276572, -3.379942, 1, 1, 1, 1, 1,
-0.8342539, -1.548075, -5.187706, 1, 1, 1, 1, 1,
-0.8318082, -1.8866, -2.494255, 1, 1, 1, 1, 1,
-0.8276547, 0.290202, -0.8524374, 0, 0, 1, 1, 1,
-0.824242, -0.3561664, -1.242074, 1, 0, 0, 1, 1,
-0.8233001, 0.2350713, -2.580326, 1, 0, 0, 1, 1,
-0.8187976, 0.1501474, -2.259261, 1, 0, 0, 1, 1,
-0.8159173, -0.8013777, 0.06211391, 1, 0, 0, 1, 1,
-0.8089885, -0.742642, -2.7765, 1, 0, 0, 1, 1,
-0.8035245, -1.820203, -3.322184, 0, 0, 0, 1, 1,
-0.8024358, 0.05455936, -0.2082143, 0, 0, 0, 1, 1,
-0.8015376, -1.033104, -2.190493, 0, 0, 0, 1, 1,
-0.7967102, 0.5444009, -1.8098, 0, 0, 0, 1, 1,
-0.7876846, -0.6784284, -3.133163, 0, 0, 0, 1, 1,
-0.7812033, 0.9273246, -0.9725198, 0, 0, 0, 1, 1,
-0.7811663, 0.777737, -0.8070703, 0, 0, 0, 1, 1,
-0.7798035, 2.333869, 1.280883, 1, 1, 1, 1, 1,
-0.7740948, -0.8719622, -1.725233, 1, 1, 1, 1, 1,
-0.769904, 1.086486, -0.9928923, 1, 1, 1, 1, 1,
-0.7601552, -0.3637924, -2.326263, 1, 1, 1, 1, 1,
-0.7592012, 0.5692948, -2.018316, 1, 1, 1, 1, 1,
-0.7581372, -0.1766981, -2.460371, 1, 1, 1, 1, 1,
-0.7561136, 0.3805793, -2.356435, 1, 1, 1, 1, 1,
-0.7537472, -0.7173459, -3.946346, 1, 1, 1, 1, 1,
-0.7516659, 1.196396, -0.5644613, 1, 1, 1, 1, 1,
-0.7507491, 0.9236299, -1.206034, 1, 1, 1, 1, 1,
-0.7451479, 0.1659237, 0.01264505, 1, 1, 1, 1, 1,
-0.7444609, -0.3828655, -3.001992, 1, 1, 1, 1, 1,
-0.7438962, -1.288532, -2.827729, 1, 1, 1, 1, 1,
-0.7402872, -0.8108436, -2.122639, 1, 1, 1, 1, 1,
-0.7374482, 0.5026401, 0.09107246, 1, 1, 1, 1, 1,
-0.7350867, -0.1948388, -1.250274, 0, 0, 1, 1, 1,
-0.7342713, 0.8538387, 0.3925637, 1, 0, 0, 1, 1,
-0.7326538, 0.7690295, -0.3896388, 1, 0, 0, 1, 1,
-0.7295689, -1.070265, -4.026953, 1, 0, 0, 1, 1,
-0.723394, 1.933056, -0.6947964, 1, 0, 0, 1, 1,
-0.7224267, 1.431138, 0.6231881, 1, 0, 0, 1, 1,
-0.7224102, -0.6518849, -2.451462, 0, 0, 0, 1, 1,
-0.7198446, 0.8663614, -1.654145, 0, 0, 0, 1, 1,
-0.7182598, 0.06237636, -0.5712484, 0, 0, 0, 1, 1,
-0.7087415, 0.949843, -0.9490327, 0, 0, 0, 1, 1,
-0.6990448, 0.6825329, -1.715623, 0, 0, 0, 1, 1,
-0.6976376, 1.123306, 0.529741, 0, 0, 0, 1, 1,
-0.6966323, -0.2806543, -1.228342, 0, 0, 0, 1, 1,
-0.6949545, -0.8982814, -1.760369, 1, 1, 1, 1, 1,
-0.6904532, -2.528537, -1.834309, 1, 1, 1, 1, 1,
-0.6902117, 0.8607723, -0.4196235, 1, 1, 1, 1, 1,
-0.6875808, -2.18454, -4.072208, 1, 1, 1, 1, 1,
-0.6849173, 0.2368798, -0.8004059, 1, 1, 1, 1, 1,
-0.672922, 2.028542, -1.607173, 1, 1, 1, 1, 1,
-0.6704436, -1.13663, -1.502296, 1, 1, 1, 1, 1,
-0.6645331, 1.319216, -2.640541, 1, 1, 1, 1, 1,
-0.6635174, -0.5765487, -1.404833, 1, 1, 1, 1, 1,
-0.6597149, -0.7214592, -2.071429, 1, 1, 1, 1, 1,
-0.6582, 0.3889283, -2.44984, 1, 1, 1, 1, 1,
-0.6502916, -0.7071441, -2.943555, 1, 1, 1, 1, 1,
-0.6495854, -0.8745289, -2.650922, 1, 1, 1, 1, 1,
-0.6493136, -0.3515784, -2.550442, 1, 1, 1, 1, 1,
-0.6490628, -0.7130272, -3.231429, 1, 1, 1, 1, 1,
-0.6479035, -2.197175, -2.489855, 0, 0, 1, 1, 1,
-0.6476009, 1.525033, -1.850177, 1, 0, 0, 1, 1,
-0.6466836, -0.2212826, -2.815881, 1, 0, 0, 1, 1,
-0.6447008, -0.5654808, -2.16051, 1, 0, 0, 1, 1,
-0.6394007, 0.1546446, -2.194703, 1, 0, 0, 1, 1,
-0.6392103, 0.4463659, -0.3212242, 1, 0, 0, 1, 1,
-0.6369183, 0.8422176, -1.485497, 0, 0, 0, 1, 1,
-0.634741, 0.5409948, -0.3170284, 0, 0, 0, 1, 1,
-0.6329052, 2.115707, -0.81888, 0, 0, 0, 1, 1,
-0.6325608, 0.6961411, -1.237416, 0, 0, 0, 1, 1,
-0.6279666, -0.8326921, -2.221903, 0, 0, 0, 1, 1,
-0.6276986, 0.591242, -1.084892, 0, 0, 0, 1, 1,
-0.6256087, 0.01238335, -3.055352, 0, 0, 0, 1, 1,
-0.6205429, 0.4020259, 0.3294077, 1, 1, 1, 1, 1,
-0.6184675, 0.3378734, -1.050303, 1, 1, 1, 1, 1,
-0.6129628, 1.046488, -1.523984, 1, 1, 1, 1, 1,
-0.6068358, 2.018317, -0.5516983, 1, 1, 1, 1, 1,
-0.6059793, -0.3778473, -2.183302, 1, 1, 1, 1, 1,
-0.601048, 0.3405577, -1.558433, 1, 1, 1, 1, 1,
-0.5969342, -0.2478314, -4.33625, 1, 1, 1, 1, 1,
-0.5894184, -0.2336658, -1.592865, 1, 1, 1, 1, 1,
-0.5841017, 1.201766, -0.8192813, 1, 1, 1, 1, 1,
-0.5827821, 0.7836881, -2.029849, 1, 1, 1, 1, 1,
-0.5656734, 1.016183, 0.1890007, 1, 1, 1, 1, 1,
-0.558764, 1.041135, 0.05040962, 1, 1, 1, 1, 1,
-0.557272, -1.278496, -3.684625, 1, 1, 1, 1, 1,
-0.5546902, -0.3420425, -2.037851, 1, 1, 1, 1, 1,
-0.5528687, 0.08418892, -0.9398068, 1, 1, 1, 1, 1,
-0.5522156, -0.9368009, -2.581521, 0, 0, 1, 1, 1,
-0.546296, -0.4946748, -1.937268, 1, 0, 0, 1, 1,
-0.5409114, 0.3336261, -1.232647, 1, 0, 0, 1, 1,
-0.5367231, 1.151303, 0.4045093, 1, 0, 0, 1, 1,
-0.5360561, 1.758073, 0.2023309, 1, 0, 0, 1, 1,
-0.5289021, 0.3565389, -2.700448, 1, 0, 0, 1, 1,
-0.5287225, -1.527553, -2.00519, 0, 0, 0, 1, 1,
-0.5273018, -0.8529914, -3.498718, 0, 0, 0, 1, 1,
-0.5255099, 1.422391, 0.6825972, 0, 0, 0, 1, 1,
-0.5231822, 1.579483, -1.215741, 0, 0, 0, 1, 1,
-0.5204632, 0.7918118, 1.412492, 0, 0, 0, 1, 1,
-0.5189672, 0.7528409, 0.1099933, 0, 0, 0, 1, 1,
-0.5147435, -0.4840825, -2.412904, 0, 0, 0, 1, 1,
-0.5123459, 2.724859, -0.4437468, 1, 1, 1, 1, 1,
-0.5119796, -1.376931, -3.223998, 1, 1, 1, 1, 1,
-0.5100002, 1.058134, 0.6797397, 1, 1, 1, 1, 1,
-0.5080655, 1.476002, -0.5161169, 1, 1, 1, 1, 1,
-0.5060535, -0.6079339, -2.383797, 1, 1, 1, 1, 1,
-0.5060197, 0.4815744, -1.594502, 1, 1, 1, 1, 1,
-0.5044672, 0.1461199, -3.920441, 1, 1, 1, 1, 1,
-0.5024264, 0.915735, 0.5113317, 1, 1, 1, 1, 1,
-0.498783, -0.2534739, -0.7755318, 1, 1, 1, 1, 1,
-0.4967164, -1.387047, -3.519305, 1, 1, 1, 1, 1,
-0.4963821, 0.5101002, -0.6174434, 1, 1, 1, 1, 1,
-0.4930426, -0.755239, -4.112423, 1, 1, 1, 1, 1,
-0.489989, -1.203609, -2.761606, 1, 1, 1, 1, 1,
-0.4829994, 2.010318, -0.3738549, 1, 1, 1, 1, 1,
-0.4829367, -2.245411, -2.460285, 1, 1, 1, 1, 1,
-0.481277, -0.4665228, -3.197719, 0, 0, 1, 1, 1,
-0.4713891, -0.165545, -1.137829, 1, 0, 0, 1, 1,
-0.4708221, -0.5079633, -2.389767, 1, 0, 0, 1, 1,
-0.4684959, 0.6892422, -0.7827461, 1, 0, 0, 1, 1,
-0.4647789, 1.369535, 0.0922868, 1, 0, 0, 1, 1,
-0.4630743, -1.499128, -3.201828, 1, 0, 0, 1, 1,
-0.462016, 1.185975, -1.700077, 0, 0, 0, 1, 1,
-0.4528881, -0.8624519, -2.547782, 0, 0, 0, 1, 1,
-0.4499967, 0.07260433, -2.511315, 0, 0, 0, 1, 1,
-0.4479448, -0.7539037, -4.600013, 0, 0, 0, 1, 1,
-0.4453947, -0.6479407, -2.53758, 0, 0, 0, 1, 1,
-0.4438983, -0.9253755, -4.454933, 0, 0, 0, 1, 1,
-0.4400301, -1.331005, -2.03661, 0, 0, 0, 1, 1,
-0.438982, 0.8933936, -1.329801, 1, 1, 1, 1, 1,
-0.4381238, -0.3894286, -0.5033966, 1, 1, 1, 1, 1,
-0.4347408, -0.118283, -3.88124, 1, 1, 1, 1, 1,
-0.4322817, -0.127782, -2.521577, 1, 1, 1, 1, 1,
-0.4240937, 2.662991, -2.851918, 1, 1, 1, 1, 1,
-0.4218283, -1.617504, -3.026741, 1, 1, 1, 1, 1,
-0.4205222, 0.6915658, -1.845986, 1, 1, 1, 1, 1,
-0.4204527, -0.5342877, -1.656539, 1, 1, 1, 1, 1,
-0.4199283, -0.5210379, -3.409406, 1, 1, 1, 1, 1,
-0.4099604, -0.9737354, -2.627805, 1, 1, 1, 1, 1,
-0.4077581, 0.6089292, -1.295189, 1, 1, 1, 1, 1,
-0.4063093, 0.361185, -3.572037, 1, 1, 1, 1, 1,
-0.4028302, 1.026247, -0.785443, 1, 1, 1, 1, 1,
-0.3939011, -1.115922, -1.884269, 1, 1, 1, 1, 1,
-0.3917719, 1.097356, -1.243255, 1, 1, 1, 1, 1,
-0.3844863, 1.617025, -0.340534, 0, 0, 1, 1, 1,
-0.381565, 1.127294, -3.172451, 1, 0, 0, 1, 1,
-0.3805526, -0.6265794, -1.932391, 1, 0, 0, 1, 1,
-0.3793315, 0.5642273, -0.807655, 1, 0, 0, 1, 1,
-0.3684746, 0.4511015, 0.9114881, 1, 0, 0, 1, 1,
-0.3653786, 0.5361001, -0.7589465, 1, 0, 0, 1, 1,
-0.3594396, -0.8667756, -2.348319, 0, 0, 0, 1, 1,
-0.353274, -1.05959, -1.330388, 0, 0, 0, 1, 1,
-0.3506595, -1.317345, -2.543427, 0, 0, 0, 1, 1,
-0.3476396, 0.03078462, -1.654073, 0, 0, 0, 1, 1,
-0.3428595, -1.656857, -5.47331, 0, 0, 0, 1, 1,
-0.3392869, 0.121032, -0.4512058, 0, 0, 0, 1, 1,
-0.336362, 1.277497, 0.4241682, 0, 0, 0, 1, 1,
-0.334514, 1.991058, -1.308153, 1, 1, 1, 1, 1,
-0.3303894, -0.2488487, -1.717924, 1, 1, 1, 1, 1,
-0.3289822, 1.061402, 0.2584216, 1, 1, 1, 1, 1,
-0.3277495, -0.400691, -1.92745, 1, 1, 1, 1, 1,
-0.3276986, 1.249548, -0.1194202, 1, 1, 1, 1, 1,
-0.3271858, -2.069045, -3.301378, 1, 1, 1, 1, 1,
-0.3268582, -0.8067845, -1.67202, 1, 1, 1, 1, 1,
-0.324343, 0.5354421, -1.576643, 1, 1, 1, 1, 1,
-0.3202212, -1.119815, -2.312772, 1, 1, 1, 1, 1,
-0.3160336, 1.428886, -0.5636097, 1, 1, 1, 1, 1,
-0.3088933, -0.8725724, -1.305077, 1, 1, 1, 1, 1,
-0.3087927, 0.7547987, -0.628431, 1, 1, 1, 1, 1,
-0.3061942, 2.028792, 1.262934, 1, 1, 1, 1, 1,
-0.3013775, 0.3639234, -0.9400602, 1, 1, 1, 1, 1,
-0.3009437, 0.6006657, -0.2066673, 1, 1, 1, 1, 1,
-0.3003363, 0.4656889, -0.4642621, 0, 0, 1, 1, 1,
-0.3002726, -0.1289235, -1.565111, 1, 0, 0, 1, 1,
-0.2944729, -0.05579233, -0.3776536, 1, 0, 0, 1, 1,
-0.2888466, 1.645281, -0.8191671, 1, 0, 0, 1, 1,
-0.2808734, -1.719706, -3.505857, 1, 0, 0, 1, 1,
-0.2799715, -0.5617959, -2.760284, 1, 0, 0, 1, 1,
-0.2789548, 0.0351931, 0.5069739, 0, 0, 0, 1, 1,
-0.2761723, 0.9629638, -2.55296, 0, 0, 0, 1, 1,
-0.2745704, -1.229384, -2.960562, 0, 0, 0, 1, 1,
-0.2706653, -0.6653935, -3.388105, 0, 0, 0, 1, 1,
-0.2644154, 0.1457625, -2.169056, 0, 0, 0, 1, 1,
-0.2632905, 0.08322773, -0.9082536, 0, 0, 0, 1, 1,
-0.2614441, -0.9702119, -1.95006, 0, 0, 0, 1, 1,
-0.2577759, 0.4668926, -0.4022492, 1, 1, 1, 1, 1,
-0.2482311, -0.08509862, -1.955258, 1, 1, 1, 1, 1,
-0.246176, -1.537937, -2.40296, 1, 1, 1, 1, 1,
-0.244461, -1.578396, -3.818224, 1, 1, 1, 1, 1,
-0.2340927, 2.185556, -0.5188072, 1, 1, 1, 1, 1,
-0.2319621, 0.8338051, -1.498393, 1, 1, 1, 1, 1,
-0.2274507, -0.3807802, -1.034829, 1, 1, 1, 1, 1,
-0.2270804, 1.343632, -1.999401, 1, 1, 1, 1, 1,
-0.2262474, 1.550579, -0.749037, 1, 1, 1, 1, 1,
-0.2253836, 0.3519703, -1.780031, 1, 1, 1, 1, 1,
-0.2247148, 0.9204348, -1.078374, 1, 1, 1, 1, 1,
-0.2227015, -0.3249631, -2.598519, 1, 1, 1, 1, 1,
-0.2163321, 0.4157577, -1.344484, 1, 1, 1, 1, 1,
-0.215005, -1.881646, -1.803698, 1, 1, 1, 1, 1,
-0.2125919, -0.5340657, -2.52531, 1, 1, 1, 1, 1,
-0.2122004, -0.4262228, -3.52525, 0, 0, 1, 1, 1,
-0.2092302, -0.4699164, -3.232798, 1, 0, 0, 1, 1,
-0.2048206, 0.9578027, -0.7922742, 1, 0, 0, 1, 1,
-0.2022279, 0.08637933, -2.079145, 1, 0, 0, 1, 1,
-0.1994405, -0.3982854, -3.492195, 1, 0, 0, 1, 1,
-0.1979146, -1.045786, -3.108483, 1, 0, 0, 1, 1,
-0.1975618, -0.6362744, -4.144269, 0, 0, 0, 1, 1,
-0.1933345, 0.3709508, -1.159521, 0, 0, 0, 1, 1,
-0.1931627, 1.176505, 0.308953, 0, 0, 0, 1, 1,
-0.1909508, -0.7568375, -3.173516, 0, 0, 0, 1, 1,
-0.1903967, 0.9252838, -0.06523027, 0, 0, 0, 1, 1,
-0.186093, 1.058251, 0.2604257, 0, 0, 0, 1, 1,
-0.1832377, 0.7681989, 1.373002, 0, 0, 0, 1, 1,
-0.1814383, 0.04867804, -0.6320511, 1, 1, 1, 1, 1,
-0.1812365, 1.373788, 0.4163079, 1, 1, 1, 1, 1,
-0.1810903, 0.2460889, 0.2148182, 1, 1, 1, 1, 1,
-0.1748747, 0.3290236, -0.5369587, 1, 1, 1, 1, 1,
-0.1744407, -0.3105394, -2.834148, 1, 1, 1, 1, 1,
-0.1744106, -0.4225155, -2.855703, 1, 1, 1, 1, 1,
-0.1732003, -1.198712, -5.099928, 1, 1, 1, 1, 1,
-0.1710051, 2.549061, 0.3907754, 1, 1, 1, 1, 1,
-0.169022, -1.154625, -3.651597, 1, 1, 1, 1, 1,
-0.1678303, -0.8238555, -4.503217, 1, 1, 1, 1, 1,
-0.1598213, -0.4530836, -1.3783, 1, 1, 1, 1, 1,
-0.1583938, -0.1281688, -1.50721, 1, 1, 1, 1, 1,
-0.1571073, 0.01356429, -2.396371, 1, 1, 1, 1, 1,
-0.1557101, 1.226911, 0.2435737, 1, 1, 1, 1, 1,
-0.150269, 0.1578143, 0.07202931, 1, 1, 1, 1, 1,
-0.149907, -0.3194598, -2.317456, 0, 0, 1, 1, 1,
-0.1496377, -0.8137577, -2.978124, 1, 0, 0, 1, 1,
-0.1466702, -0.003968225, -4.120409, 1, 0, 0, 1, 1,
-0.1466424, 0.3371212, -0.9058503, 1, 0, 0, 1, 1,
-0.142418, -1.375702, -3.780113, 1, 0, 0, 1, 1,
-0.1415342, -0.393887, -1.712041, 1, 0, 0, 1, 1,
-0.1386347, -1.273525, -2.150802, 0, 0, 0, 1, 1,
-0.1366253, -1.182044, -2.003438, 0, 0, 0, 1, 1,
-0.128999, -2.884395, -3.091672, 0, 0, 0, 1, 1,
-0.128948, 0.04538508, -1.503803, 0, 0, 0, 1, 1,
-0.1270648, 0.2773248, 0.03474694, 0, 0, 0, 1, 1,
-0.1268371, -0.9389836, -2.047943, 0, 0, 0, 1, 1,
-0.124675, 0.03257824, -0.01777095, 0, 0, 0, 1, 1,
-0.1246331, 1.777108, 1.040121, 1, 1, 1, 1, 1,
-0.1240297, 2.785526, -0.01240885, 1, 1, 1, 1, 1,
-0.1206792, -0.8878541, -1.763391, 1, 1, 1, 1, 1,
-0.1200007, -0.5612526, -2.819028, 1, 1, 1, 1, 1,
-0.1192572, -0.4772902, -4.12745, 1, 1, 1, 1, 1,
-0.1152631, 0.9977503, -0.1212946, 1, 1, 1, 1, 1,
-0.1084384, 0.2925473, -2.216263, 1, 1, 1, 1, 1,
-0.1043214, -0.7427239, -1.503598, 1, 1, 1, 1, 1,
-0.10391, -0.1898713, -2.15852, 1, 1, 1, 1, 1,
-0.09852378, 0.478492, 0.511739, 1, 1, 1, 1, 1,
-0.0972913, 0.6850243, -0.7199624, 1, 1, 1, 1, 1,
-0.09480333, 1.277735, -0.04830321, 1, 1, 1, 1, 1,
-0.09176891, 0.4717753, 1.161275, 1, 1, 1, 1, 1,
-0.09133718, -1.253889, -2.825105, 1, 1, 1, 1, 1,
-0.08859476, -0.3440107, -2.137731, 1, 1, 1, 1, 1,
-0.08608229, -0.03047905, -2.436576, 0, 0, 1, 1, 1,
-0.07643292, -0.4868942, -2.659083, 1, 0, 0, 1, 1,
-0.07602485, 0.3222717, 0.2902581, 1, 0, 0, 1, 1,
-0.06867532, 1.024141, -0.3465929, 1, 0, 0, 1, 1,
-0.06777234, -1.003004, -5.404655, 1, 0, 0, 1, 1,
-0.06593814, -0.9064607, -3.819544, 1, 0, 0, 1, 1,
-0.06283423, -0.7678768, -4.336919, 0, 0, 0, 1, 1,
-0.06264916, -1.50736, -2.054119, 0, 0, 0, 1, 1,
-0.06245994, 0.2925206, -1.230631, 0, 0, 0, 1, 1,
-0.06238142, -1.12849, -1.206765, 0, 0, 0, 1, 1,
-0.05417779, 1.234506, 0.2480065, 0, 0, 0, 1, 1,
-0.05337901, -1.181023, -2.437375, 0, 0, 0, 1, 1,
-0.05105951, -0.4929802, -2.164496, 0, 0, 0, 1, 1,
-0.0440497, 1.290794, 0.1159342, 1, 1, 1, 1, 1,
-0.04388242, 0.6523965, -0.7308175, 1, 1, 1, 1, 1,
-0.04174748, 2.487831, -0.9764288, 1, 1, 1, 1, 1,
-0.03502497, -0.0562676, -2.187287, 1, 1, 1, 1, 1,
-0.03440091, -1.07895, -4.343902, 1, 1, 1, 1, 1,
-0.02817505, -2.519973, -3.918293, 1, 1, 1, 1, 1,
-0.02757946, 0.6323193, 0.498123, 1, 1, 1, 1, 1,
-0.02720204, 1.120893, -0.8902536, 1, 1, 1, 1, 1,
-0.02347752, -1.356898, -2.635776, 1, 1, 1, 1, 1,
-0.02346754, -1.982015, -3.637955, 1, 1, 1, 1, 1,
-0.02253423, -0.2958127, -2.984607, 1, 1, 1, 1, 1,
-0.02136486, 0.01929111, 0.3729452, 1, 1, 1, 1, 1,
-0.02112834, 0.01336551, 0.4257464, 1, 1, 1, 1, 1,
-0.01924538, 0.5046915, -0.9965531, 1, 1, 1, 1, 1,
-0.01708001, 1.989139, 1.077312, 1, 1, 1, 1, 1,
-0.01472205, 0.1758545, -0.2057059, 0, 0, 1, 1, 1,
-0.01249452, 0.1069411, 1.047146, 1, 0, 0, 1, 1,
-0.01221834, -0.8728577, -3.534126, 1, 0, 0, 1, 1,
-0.00911945, 0.5752292, -1.493241, 1, 0, 0, 1, 1,
-0.0075984, -0.9609026, -1.959401, 1, 0, 0, 1, 1,
-0.004883326, 0.9935664, 0.09662009, 1, 0, 0, 1, 1,
-0.003718266, -5.349e-05, -2.874194, 0, 0, 0, 1, 1,
0.0009979658, 1.086236, 0.6352857, 0, 0, 0, 1, 1,
0.006179195, -1.196529, 3.003909, 0, 0, 0, 1, 1,
0.007612081, -0.07572798, 3.754057, 0, 0, 0, 1, 1,
0.007962242, -1.213579, 3.847636, 0, 0, 0, 1, 1,
0.009397791, 1.110761, -0.4227366, 0, 0, 0, 1, 1,
0.0106376, -0.7552053, 2.109217, 0, 0, 0, 1, 1,
0.01783946, 1.758641, -1.387047, 1, 1, 1, 1, 1,
0.01930535, 0.472159, -0.7072396, 1, 1, 1, 1, 1,
0.02212833, 0.7944474, 1.120465, 1, 1, 1, 1, 1,
0.02503549, 0.08148006, 2.118391, 1, 1, 1, 1, 1,
0.0276824, -0.709127, 1.777716, 1, 1, 1, 1, 1,
0.02957109, 0.7751707, 1.490917, 1, 1, 1, 1, 1,
0.02982025, -0.2715693, 3.361758, 1, 1, 1, 1, 1,
0.0315425, 0.5589094, 1.309521, 1, 1, 1, 1, 1,
0.03333285, 1.708001, 0.1200193, 1, 1, 1, 1, 1,
0.0352806, 1.431478, -0.4659427, 1, 1, 1, 1, 1,
0.03567107, -0.5474044, 3.764656, 1, 1, 1, 1, 1,
0.03833613, -1.121137, 2.203135, 1, 1, 1, 1, 1,
0.03951027, -1.759781, 3.081047, 1, 1, 1, 1, 1,
0.04410417, 0.646068, -0.330229, 1, 1, 1, 1, 1,
0.05173704, 2.101449, 2.070584, 1, 1, 1, 1, 1,
0.06306339, -0.8923324, 4.40251, 0, 0, 1, 1, 1,
0.06545997, -1.750979, 3.307577, 1, 0, 0, 1, 1,
0.07118902, -1.338031, 2.885877, 1, 0, 0, 1, 1,
0.07211296, 0.6175068, -0.04493141, 1, 0, 0, 1, 1,
0.07214473, -1.585643, 2.292065, 1, 0, 0, 1, 1,
0.07400066, 0.276066, 1.013852, 1, 0, 0, 1, 1,
0.07466573, -0.1023718, 1.669029, 0, 0, 0, 1, 1,
0.0751881, 0.5907152, 3.640961, 0, 0, 0, 1, 1,
0.07864703, 0.995473, 0.8522021, 0, 0, 0, 1, 1,
0.08226295, 0.3484493, 0.4729254, 0, 0, 0, 1, 1,
0.08235247, 0.06103995, 0.7014717, 0, 0, 0, 1, 1,
0.08265124, 0.7666773, 0.1075328, 0, 0, 0, 1, 1,
0.08377731, 0.4174872, -0.7404805, 0, 0, 0, 1, 1,
0.08446693, -1.66815, 4.356889, 1, 1, 1, 1, 1,
0.08566328, 0.0152087, 0.532429, 1, 1, 1, 1, 1,
0.09039833, 0.7166666, -0.1185797, 1, 1, 1, 1, 1,
0.09134109, -0.4375246, 2.737911, 1, 1, 1, 1, 1,
0.0941486, -0.4429006, 3.719447, 1, 1, 1, 1, 1,
0.09764553, 1.030958, 1.497859, 1, 1, 1, 1, 1,
0.1005617, -0.1863631, 3.048865, 1, 1, 1, 1, 1,
0.1010142, -0.3330627, 3.485303, 1, 1, 1, 1, 1,
0.1019165, -0.1082311, 3.496044, 1, 1, 1, 1, 1,
0.1021515, 0.8454928, 0.008448584, 1, 1, 1, 1, 1,
0.1024455, -0.2948393, 1.548509, 1, 1, 1, 1, 1,
0.1048822, -0.02080291, 2.456252, 1, 1, 1, 1, 1,
0.105048, -0.8707939, 3.126258, 1, 1, 1, 1, 1,
0.108261, 0.688202, 1.298291, 1, 1, 1, 1, 1,
0.1109465, 0.4403061, -0.8334143, 1, 1, 1, 1, 1,
0.1168056, -0.2251819, 3.794304, 0, 0, 1, 1, 1,
0.1175007, 0.7344953, -0.8504193, 1, 0, 0, 1, 1,
0.1175347, -1.052518, 3.133773, 1, 0, 0, 1, 1,
0.1189127, -0.4279211, 1.782936, 1, 0, 0, 1, 1,
0.1196508, 0.4537737, 0.5805562, 1, 0, 0, 1, 1,
0.1217535, 1.186921, 1.833148, 1, 0, 0, 1, 1,
0.1228388, -0.0675349, 1.23364, 0, 0, 0, 1, 1,
0.1242267, -0.1457593, 2.248363, 0, 0, 0, 1, 1,
0.1264971, 0.2903893, 1.66848, 0, 0, 0, 1, 1,
0.127533, 0.3157365, -0.8893003, 0, 0, 0, 1, 1,
0.1303346, -0.7003489, 0.9694934, 0, 0, 0, 1, 1,
0.1327883, -0.5660756, 3.6133, 0, 0, 0, 1, 1,
0.1340791, -1.50815, 2.391944, 0, 0, 0, 1, 1,
0.1363299, -0.1972338, 3.892186, 1, 1, 1, 1, 1,
0.1369378, 1.191661, 0.8928179, 1, 1, 1, 1, 1,
0.1373862, -0.6438243, 3.830553, 1, 1, 1, 1, 1,
0.1395868, -0.3700229, 3.053654, 1, 1, 1, 1, 1,
0.1428587, 0.9542095, 1.449982, 1, 1, 1, 1, 1,
0.1435663, -0.1734389, 3.452252, 1, 1, 1, 1, 1,
0.1465282, -0.3794213, 1.112916, 1, 1, 1, 1, 1,
0.1533673, -0.284793, 2.422931, 1, 1, 1, 1, 1,
0.1571546, 0.2592436, -0.3647312, 1, 1, 1, 1, 1,
0.1598387, -1.500109, 3.331195, 1, 1, 1, 1, 1,
0.1602277, -0.2417885, 2.329892, 1, 1, 1, 1, 1,
0.1636287, 2.281332, -0.2530669, 1, 1, 1, 1, 1,
0.1670516, 0.3471564, -0.1467968, 1, 1, 1, 1, 1,
0.168075, -0.5740516, 1.82286, 1, 1, 1, 1, 1,
0.1701307, 1.749311, -0.09840769, 1, 1, 1, 1, 1,
0.1714977, 0.5347128, -1.772027, 0, 0, 1, 1, 1,
0.1748144, 1.092532, -0.4039908, 1, 0, 0, 1, 1,
0.1780267, 0.5752007, 1.65784, 1, 0, 0, 1, 1,
0.1780299, -0.1298921, 2.483942, 1, 0, 0, 1, 1,
0.1808333, 0.9160937, -0.5994763, 1, 0, 0, 1, 1,
0.1833728, -0.5221102, 1.1546, 1, 0, 0, 1, 1,
0.1900596, -0.8989806, 3.931874, 0, 0, 0, 1, 1,
0.191137, -1.437786, 4.041636, 0, 0, 0, 1, 1,
0.1920918, -0.8610188, 2.781712, 0, 0, 0, 1, 1,
0.1931802, 0.7245312, -0.08048733, 0, 0, 0, 1, 1,
0.1969714, -0.4574414, 0.9144649, 0, 0, 0, 1, 1,
0.1980205, 1.394122, -1.247329, 0, 0, 0, 1, 1,
0.1994585, -0.1847933, 2.172762, 0, 0, 0, 1, 1,
0.2005969, 0.4105184, -0.2518844, 1, 1, 1, 1, 1,
0.2009379, -0.6869925, 3.040476, 1, 1, 1, 1, 1,
0.2026449, 0.56218, -0.2246983, 1, 1, 1, 1, 1,
0.2043541, 0.792657, 0.5351971, 1, 1, 1, 1, 1,
0.2075057, -0.3733733, 2.846651, 1, 1, 1, 1, 1,
0.2117721, 1.113118, 0.7415124, 1, 1, 1, 1, 1,
0.2126057, -0.01733012, 2.04054, 1, 1, 1, 1, 1,
0.2140976, -0.4215737, 2.216539, 1, 1, 1, 1, 1,
0.2179894, 0.09076911, 2.673451, 1, 1, 1, 1, 1,
0.2218921, 0.3934972, 0.8216132, 1, 1, 1, 1, 1,
0.2238248, 1.223685, -0.3116202, 1, 1, 1, 1, 1,
0.2239445, -0.1241832, 2.2506, 1, 1, 1, 1, 1,
0.2243336, 0.6167661, -0.2434743, 1, 1, 1, 1, 1,
0.2259854, -0.08059179, -0.06110127, 1, 1, 1, 1, 1,
0.2303798, -0.534085, 3.585528, 1, 1, 1, 1, 1,
0.2312038, -0.3908468, 3.387393, 0, 0, 1, 1, 1,
0.2317557, 2.279445, -0.2829967, 1, 0, 0, 1, 1,
0.2387284, -0.4255005, 2.781805, 1, 0, 0, 1, 1,
0.24793, 0.8916807, 0.1812111, 1, 0, 0, 1, 1,
0.2676244, -0.9031348, 2.938996, 1, 0, 0, 1, 1,
0.2682661, 0.496743, -0.7068573, 1, 0, 0, 1, 1,
0.2718002, 0.3654855, 0.6303121, 0, 0, 0, 1, 1,
0.2727603, -0.5521455, 2.002467, 0, 0, 0, 1, 1,
0.2747143, -0.34458, 2.897922, 0, 0, 0, 1, 1,
0.2814068, -0.4067785, 3.867704, 0, 0, 0, 1, 1,
0.2851312, 1.149673, 1.208282, 0, 0, 0, 1, 1,
0.2863869, -1.293912, 1.288927, 0, 0, 0, 1, 1,
0.2906287, -0.1613141, 1.571634, 0, 0, 0, 1, 1,
0.2949305, -0.545841, 1.208932, 1, 1, 1, 1, 1,
0.3002836, 0.8960581, 1.017933, 1, 1, 1, 1, 1,
0.3035991, 0.1404709, 1.563238, 1, 1, 1, 1, 1,
0.3045761, 0.6628658, -0.9641396, 1, 1, 1, 1, 1,
0.3101199, -0.9540029, 3.20768, 1, 1, 1, 1, 1,
0.3117504, -1.030184, 4.05763, 1, 1, 1, 1, 1,
0.3132185, 1.100463, 1.230593, 1, 1, 1, 1, 1,
0.3224106, 0.254527, 0.9224203, 1, 1, 1, 1, 1,
0.3270133, 1.087093, 0.5949915, 1, 1, 1, 1, 1,
0.3287124, -0.8415444, 3.497484, 1, 1, 1, 1, 1,
0.3299204, -0.8896838, 2.94626, 1, 1, 1, 1, 1,
0.3312368, 1.15326, -0.6215963, 1, 1, 1, 1, 1,
0.3342451, -1.953094, 3.868445, 1, 1, 1, 1, 1,
0.3395623, 1.131432, 2.148891, 1, 1, 1, 1, 1,
0.350044, -1.397421, 3.435606, 1, 1, 1, 1, 1,
0.3519359, 1.188104, -0.444389, 0, 0, 1, 1, 1,
0.3540119, -1.143584, 3.082318, 1, 0, 0, 1, 1,
0.3551212, -0.09023005, 1.805303, 1, 0, 0, 1, 1,
0.3572908, -0.4006904, 3.587007, 1, 0, 0, 1, 1,
0.3577, 0.6629156, 1.196895, 1, 0, 0, 1, 1,
0.3602078, -0.04989371, 0.7969732, 1, 0, 0, 1, 1,
0.3618613, 0.1231986, 0.6870875, 0, 0, 0, 1, 1,
0.3673189, 1.238468, -0.685342, 0, 0, 0, 1, 1,
0.3675822, 0.1189064, 1.737244, 0, 0, 0, 1, 1,
0.367656, -0.6467419, 2.021924, 0, 0, 0, 1, 1,
0.3693528, 0.6579527, -1.662604, 0, 0, 0, 1, 1,
0.3695577, 0.400849, 0.148653, 0, 0, 0, 1, 1,
0.3707395, -0.6070461, 1.916284, 0, 0, 0, 1, 1,
0.3724062, -0.4829732, 2.424732, 1, 1, 1, 1, 1,
0.3757463, 0.07969666, 1.6334, 1, 1, 1, 1, 1,
0.3777108, -3.632286, 2.826475, 1, 1, 1, 1, 1,
0.3821933, -0.6271287, 2.809618, 1, 1, 1, 1, 1,
0.3887249, 0.7484637, -1.311195, 1, 1, 1, 1, 1,
0.3921902, -0.7562683, 2.528291, 1, 1, 1, 1, 1,
0.3923275, 0.6399813, 1.30393, 1, 1, 1, 1, 1,
0.3959622, 0.3884344, 3.11743, 1, 1, 1, 1, 1,
0.3966292, -0.2721394, 4.340734, 1, 1, 1, 1, 1,
0.3970131, 0.01772977, 2.717559, 1, 1, 1, 1, 1,
0.4008687, 0.7508428, -0.9021379, 1, 1, 1, 1, 1,
0.403204, 0.5470691, 1.731082, 1, 1, 1, 1, 1,
0.4079572, -0.3954705, 2.33221, 1, 1, 1, 1, 1,
0.4079852, -1.049522, 2.085357, 1, 1, 1, 1, 1,
0.4109807, 0.1200281, 0.7127498, 1, 1, 1, 1, 1,
0.4144381, -1.229613, 2.875482, 0, 0, 1, 1, 1,
0.4169735, 0.6030309, 2.082762, 1, 0, 0, 1, 1,
0.4187842, 0.02002983, 2.389242, 1, 0, 0, 1, 1,
0.4195387, 0.476331, 2.223045, 1, 0, 0, 1, 1,
0.4208799, 0.2617743, 1.04487, 1, 0, 0, 1, 1,
0.420947, -0.05539834, 2.216216, 1, 0, 0, 1, 1,
0.4297103, -0.364166, 0.6139926, 0, 0, 0, 1, 1,
0.4309841, 0.3748126, 0.06826887, 0, 0, 0, 1, 1,
0.4359957, -1.137105, 2.573734, 0, 0, 0, 1, 1,
0.4371979, -1.103878, 1.706432, 0, 0, 0, 1, 1,
0.4375196, -0.5084921, 1.762849, 0, 0, 0, 1, 1,
0.4420852, -0.4123218, 1.042064, 0, 0, 0, 1, 1,
0.4446789, 0.7956995, 2.481994, 0, 0, 0, 1, 1,
0.4495868, 1.279166, 1.495995, 1, 1, 1, 1, 1,
0.4523408, -1.842271, 2.504741, 1, 1, 1, 1, 1,
0.4532191, 0.6170138, 0.8081016, 1, 1, 1, 1, 1,
0.4550418, 0.5163741, -0.05967811, 1, 1, 1, 1, 1,
0.4568941, 0.3325698, 0.5693854, 1, 1, 1, 1, 1,
0.4575061, 0.7920247, 0.8746128, 1, 1, 1, 1, 1,
0.4600441, 0.4442852, 0.5713299, 1, 1, 1, 1, 1,
0.4622528, -0.3719299, 2.306189, 1, 1, 1, 1, 1,
0.465976, 0.338748, 2.008612, 1, 1, 1, 1, 1,
0.46854, -0.7411755, 1.897108, 1, 1, 1, 1, 1,
0.4689334, 1.722733, -0.6572596, 1, 1, 1, 1, 1,
0.4739188, 1.486454, -0.6311451, 1, 1, 1, 1, 1,
0.4768595, 2.083645, 0.8116946, 1, 1, 1, 1, 1,
0.4797201, -0.430329, 3.671905, 1, 1, 1, 1, 1,
0.4822857, -0.9575856, 2.15895, 1, 1, 1, 1, 1,
0.4829523, -0.2532498, 3.295054, 0, 0, 1, 1, 1,
0.4850504, 0.5163426, 1.353087, 1, 0, 0, 1, 1,
0.4864346, -0.554031, 2.165631, 1, 0, 0, 1, 1,
0.4926451, -0.4709083, 1.423796, 1, 0, 0, 1, 1,
0.497283, -0.6490843, 1.545472, 1, 0, 0, 1, 1,
0.5016379, -0.9507515, 1.608087, 1, 0, 0, 1, 1,
0.5017694, 0.9435316, 0.249633, 0, 0, 0, 1, 1,
0.5025032, -0.6283069, 3.241069, 0, 0, 0, 1, 1,
0.5035148, 0.1246988, 1.553353, 0, 0, 0, 1, 1,
0.5058388, -0.1677983, 1.366036, 0, 0, 0, 1, 1,
0.506745, -1.019977, 1.242662, 0, 0, 0, 1, 1,
0.5072273, 0.07988318, 1.242678, 0, 0, 0, 1, 1,
0.5074105, -1.167295, 1.749491, 0, 0, 0, 1, 1,
0.5089646, 0.4369063, 0.4104414, 1, 1, 1, 1, 1,
0.511252, -2.275312, 2.637201, 1, 1, 1, 1, 1,
0.5156036, -1.076069, 3.870965, 1, 1, 1, 1, 1,
0.5171221, 2.117132, 2.330489, 1, 1, 1, 1, 1,
0.517474, -0.7654814, 1.927999, 1, 1, 1, 1, 1,
0.519902, 0.4828922, 2.373695, 1, 1, 1, 1, 1,
0.5231264, 1.951718, -0.0580205, 1, 1, 1, 1, 1,
0.524487, -1.374786, 2.387529, 1, 1, 1, 1, 1,
0.5256679, -1.645655, 1.891091, 1, 1, 1, 1, 1,
0.5272129, 0.8353517, 1.519075, 1, 1, 1, 1, 1,
0.5291538, -0.4807816, -0.3960033, 1, 1, 1, 1, 1,
0.5305885, 0.8379733, 0.4170765, 1, 1, 1, 1, 1,
0.5315295, 1.317581, 0.007139042, 1, 1, 1, 1, 1,
0.5324399, 0.01519779, 1.596841, 1, 1, 1, 1, 1,
0.5326105, 1.406047, -1.557462, 1, 1, 1, 1, 1,
0.5340475, -0.01922156, 2.579003, 0, 0, 1, 1, 1,
0.5362045, -0.3351841, 1.561801, 1, 0, 0, 1, 1,
0.5392379, -0.9223447, 2.200283, 1, 0, 0, 1, 1,
0.5401507, 2.04041, 0.2410484, 1, 0, 0, 1, 1,
0.5407582, -1.057336, 1.341835, 1, 0, 0, 1, 1,
0.546205, 0.8262753, 0.3320337, 1, 0, 0, 1, 1,
0.5475384, -0.9853327, 2.151716, 0, 0, 0, 1, 1,
0.5505001, 0.7922364, 1.143251, 0, 0, 0, 1, 1,
0.5516928, 0.8662618, -0.3978324, 0, 0, 0, 1, 1,
0.5626705, 0.02022558, 2.633029, 0, 0, 0, 1, 1,
0.5750065, 1.447149, -0.9327805, 0, 0, 0, 1, 1,
0.577608, 0.9657705, 0.8721467, 0, 0, 0, 1, 1,
0.5781571, -0.05510392, 3.310496, 0, 0, 0, 1, 1,
0.5814711, -0.4561059, 2.30218, 1, 1, 1, 1, 1,
0.5841004, -2.133341, 3.070071, 1, 1, 1, 1, 1,
0.5852042, -0.1599524, 1.872291, 1, 1, 1, 1, 1,
0.5866583, -1.8345, 2.104844, 1, 1, 1, 1, 1,
0.6033047, -0.1045905, 1.394012, 1, 1, 1, 1, 1,
0.6065737, 9.430019e-05, 0.3203519, 1, 1, 1, 1, 1,
0.6068494, -0.5635138, 3.085744, 1, 1, 1, 1, 1,
0.6091743, 0.8574419, 1.450229, 1, 1, 1, 1, 1,
0.6153055, -1.549556, 1.961877, 1, 1, 1, 1, 1,
0.6234016, -0.694516, 4.410978, 1, 1, 1, 1, 1,
0.6250172, -0.501134, 2.049239, 1, 1, 1, 1, 1,
0.6261917, 1.420138, -0.5579641, 1, 1, 1, 1, 1,
0.6275776, 0.3738075, 1.87119, 1, 1, 1, 1, 1,
0.6320577, 0.1832232, 2.232907, 1, 1, 1, 1, 1,
0.6340417, -0.01601101, 2.261614, 1, 1, 1, 1, 1,
0.6357329, -0.3291455, 2.676827, 0, 0, 1, 1, 1,
0.6414056, -0.2674988, 2.06467, 1, 0, 0, 1, 1,
0.6415152, -1.131847, 2.762404, 1, 0, 0, 1, 1,
0.643422, -1.14344, 2.724216, 1, 0, 0, 1, 1,
0.6476626, 0.152045, 3.272951, 1, 0, 0, 1, 1,
0.6504683, 0.2649204, 0.7041335, 1, 0, 0, 1, 1,
0.6537049, 0.7673875, -0.2817537, 0, 0, 0, 1, 1,
0.6541731, 0.06578948, 1.504671, 0, 0, 0, 1, 1,
0.6545855, 0.7523588, -0.2447289, 0, 0, 0, 1, 1,
0.6547318, -0.3347601, 1.667532, 0, 0, 0, 1, 1,
0.655075, -1.04386, 1.289491, 0, 0, 0, 1, 1,
0.6590596, 1.405305, 1.792086, 0, 0, 0, 1, 1,
0.6594466, 0.05387036, 3.142428, 0, 0, 0, 1, 1,
0.6596358, 0.7538114, 1.772255, 1, 1, 1, 1, 1,
0.6628319, 0.4980942, 2.661074, 1, 1, 1, 1, 1,
0.6643625, 0.1611473, 0.5480382, 1, 1, 1, 1, 1,
0.6676329, 0.9646493, 2.996949, 1, 1, 1, 1, 1,
0.6711092, -1.687832, 2.817367, 1, 1, 1, 1, 1,
0.6784358, -0.0812543, 1.566344, 1, 1, 1, 1, 1,
0.6791008, 1.352244, -0.6645816, 1, 1, 1, 1, 1,
0.6847116, -0.1879216, 2.363483, 1, 1, 1, 1, 1,
0.6896537, 0.5447363, 2.144518, 1, 1, 1, 1, 1,
0.694054, 0.9075449, -1.239267, 1, 1, 1, 1, 1,
0.6967795, 0.03098588, 1.820818, 1, 1, 1, 1, 1,
0.6980194, 0.2322933, 2.792195, 1, 1, 1, 1, 1,
0.7006949, 1.461117, 0.05670477, 1, 1, 1, 1, 1,
0.7048187, 1.166409, 1.416515, 1, 1, 1, 1, 1,
0.7057391, 0.3480093, -1.173732, 1, 1, 1, 1, 1,
0.7096692, 1.281935, -0.5778961, 0, 0, 1, 1, 1,
0.7143238, -0.4630398, 3.32307, 1, 0, 0, 1, 1,
0.714406, -0.668265, 1.901296, 1, 0, 0, 1, 1,
0.7178172, 1.249287, 0.9891993, 1, 0, 0, 1, 1,
0.7181217, 0.6113657, -0.3010374, 1, 0, 0, 1, 1,
0.7213269, -0.1785671, 0.7498086, 1, 0, 0, 1, 1,
0.7229078, -0.3182651, 0.1099855, 0, 0, 0, 1, 1,
0.723275, 1.07573, 1.27322, 0, 0, 0, 1, 1,
0.7251, 1.138605, 0.4390228, 0, 0, 0, 1, 1,
0.7256113, 0.882353, 1.935138, 0, 0, 0, 1, 1,
0.7265815, -0.9504563, 2.266994, 0, 0, 0, 1, 1,
0.7312871, -0.4324608, 1.496313, 0, 0, 0, 1, 1,
0.7333813, -0.4389466, 1.812034, 0, 0, 0, 1, 1,
0.7396514, 1.530411, -0.7395959, 1, 1, 1, 1, 1,
0.7409514, -1.104406, 3.36227, 1, 1, 1, 1, 1,
0.7471753, 0.8039641, 1.747267, 1, 1, 1, 1, 1,
0.7484581, -0.7055851, 4.458164, 1, 1, 1, 1, 1,
0.7537028, 0.9746271, 0.7711092, 1, 1, 1, 1, 1,
0.7566745, -0.3481428, 2.575368, 1, 1, 1, 1, 1,
0.7588542, -1.060964, 0.3004011, 1, 1, 1, 1, 1,
0.7589456, 1.364173, 1.135621, 1, 1, 1, 1, 1,
0.7602025, 0.9994888, -0.1794405, 1, 1, 1, 1, 1,
0.7610561, 1.568529, 1.318101, 1, 1, 1, 1, 1,
0.7617129, 0.2400407, 0.5834284, 1, 1, 1, 1, 1,
0.7649538, -1.401578, 2.178596, 1, 1, 1, 1, 1,
0.7732328, 0.368038, 0.8380196, 1, 1, 1, 1, 1,
0.7736189, -0.7632834, 3.354698, 1, 1, 1, 1, 1,
0.7780811, -1.385364, 3.159813, 1, 1, 1, 1, 1,
0.7796145, -0.2598202, 0.9397549, 0, 0, 1, 1, 1,
0.7848318, -0.3193969, 2.440938, 1, 0, 0, 1, 1,
0.7867532, -0.2604958, 2.520301, 1, 0, 0, 1, 1,
0.794261, 0.1812615, -0.3620215, 1, 0, 0, 1, 1,
0.8033006, -0.3227473, 0.3148067, 1, 0, 0, 1, 1,
0.8035146, 1.467268, 0.1013435, 1, 0, 0, 1, 1,
0.8035346, -0.07541008, -0.5268334, 0, 0, 0, 1, 1,
0.8037499, 1.128301, -0.8309914, 0, 0, 0, 1, 1,
0.8039311, -0.8938423, 2.377405, 0, 0, 0, 1, 1,
0.81104, 0.5115371, 0.6677907, 0, 0, 0, 1, 1,
0.8146849, 1.415616, -0.4022895, 0, 0, 0, 1, 1,
0.8176357, 0.8812646, 1.974406, 0, 0, 0, 1, 1,
0.8199545, -0.174377, 2.247465, 0, 0, 0, 1, 1,
0.8290254, -0.5475185, 1.103256, 1, 1, 1, 1, 1,
0.8367589, 0.9520273, 2.747947, 1, 1, 1, 1, 1,
0.840154, -0.4578955, 3.751816, 1, 1, 1, 1, 1,
0.8418369, 0.6257376, 1.950649, 1, 1, 1, 1, 1,
0.845898, -2.037603, 3.231215, 1, 1, 1, 1, 1,
0.8547087, 1.801221, -1.585491, 1, 1, 1, 1, 1,
0.8597723, -0.4785373, 3.307766, 1, 1, 1, 1, 1,
0.8637455, -0.2372988, 3.406858, 1, 1, 1, 1, 1,
0.8656953, -0.9099224, 2.853342, 1, 1, 1, 1, 1,
0.8672036, -0.04856395, 0.9766864, 1, 1, 1, 1, 1,
0.8737718, 0.2165033, 2.461262, 1, 1, 1, 1, 1,
0.8740847, 2.425363, -2.06787, 1, 1, 1, 1, 1,
0.8758271, -0.2664174, 2.364667, 1, 1, 1, 1, 1,
0.8803031, 1.105605, -1.374397, 1, 1, 1, 1, 1,
0.8856307, 0.2684824, -0.406064, 1, 1, 1, 1, 1,
0.8891023, -0.6962866, 3.043797, 0, 0, 1, 1, 1,
0.8952774, -2.276419, 1.39927, 1, 0, 0, 1, 1,
0.8997885, -0.5311108, 2.065355, 1, 0, 0, 1, 1,
0.903472, -1.515221, 2.938156, 1, 0, 0, 1, 1,
0.9070882, -0.05945041, 0.9595332, 1, 0, 0, 1, 1,
0.9073293, 0.5515793, -0.2643065, 1, 0, 0, 1, 1,
0.9096086, -0.7508912, 3.42928, 0, 0, 0, 1, 1,
0.916385, 0.3756234, 1.359716, 0, 0, 0, 1, 1,
0.9208629, -1.060968, 3.120273, 0, 0, 0, 1, 1,
0.9234455, -0.174722, 0.3206446, 0, 0, 0, 1, 1,
0.9248571, 1.170162, 0.4552381, 0, 0, 0, 1, 1,
0.9260132, 0.8138723, 0.8989971, 0, 0, 0, 1, 1,
0.9277443, 0.279727, 0.9842999, 0, 0, 0, 1, 1,
0.9301243, -2.732962, 3.338122, 1, 1, 1, 1, 1,
0.936125, -0.1994515, 0.1160898, 1, 1, 1, 1, 1,
0.9368661, 0.6592878, -0.5765083, 1, 1, 1, 1, 1,
0.9426037, -0.8890198, 3.296498, 1, 1, 1, 1, 1,
0.9546209, 1.292691, 0.2949589, 1, 1, 1, 1, 1,
0.9612179, -0.09565339, 1.514828, 1, 1, 1, 1, 1,
0.9681786, 0.3980521, 0.4017241, 1, 1, 1, 1, 1,
0.9686652, 0.07280298, -0.6367432, 1, 1, 1, 1, 1,
0.9698473, -0.7516318, 3.111383, 1, 1, 1, 1, 1,
0.9728465, -0.5614126, 1.156367, 1, 1, 1, 1, 1,
0.9765235, -1.072977, 2.148249, 1, 1, 1, 1, 1,
0.9780805, -0.4271485, 1.572118, 1, 1, 1, 1, 1,
0.9857814, -1.417394, 2.093232, 1, 1, 1, 1, 1,
0.9908491, 1.071701, 2.089236, 1, 1, 1, 1, 1,
0.9915969, 0.2358292, 2.090508, 1, 1, 1, 1, 1,
0.99751, -1.247146, 2.672758, 0, 0, 1, 1, 1,
0.9987608, 1.733666, 1.373748, 1, 0, 0, 1, 1,
1.001688, -0.09787735, 2.404754, 1, 0, 0, 1, 1,
1.007741, -0.08860593, 2.157079, 1, 0, 0, 1, 1,
1.010437, -0.2829413, 1.106598, 1, 0, 0, 1, 1,
1.012863, 0.8994213, 1.521481, 1, 0, 0, 1, 1,
1.021908, 0.2735798, 1.415132, 0, 0, 0, 1, 1,
1.022419, -1.583812, 2.138323, 0, 0, 0, 1, 1,
1.032711, 1.504628, 0.901736, 0, 0, 0, 1, 1,
1.035285, -0.5558046, 3.376338, 0, 0, 0, 1, 1,
1.044572, -0.3123041, 2.915538, 0, 0, 0, 1, 1,
1.04842, 0.3951552, 1.435754, 0, 0, 0, 1, 1,
1.049372, 2.359483, 1.246392, 0, 0, 0, 1, 1,
1.053078, 1.024985, 1.962892, 1, 1, 1, 1, 1,
1.058365, -0.1719899, 2.924872, 1, 1, 1, 1, 1,
1.060428, 0.5643541, 0.8689714, 1, 1, 1, 1, 1,
1.075719, -2.174017, 0.549029, 1, 1, 1, 1, 1,
1.0794, -0.6672991, 3.386316, 1, 1, 1, 1, 1,
1.080016, 0.7927997, 0.910926, 1, 1, 1, 1, 1,
1.081216, 0.126451, 0.2451464, 1, 1, 1, 1, 1,
1.08468, 0.3017062, 2.458999, 1, 1, 1, 1, 1,
1.09156, 1.425174, 2.054678, 1, 1, 1, 1, 1,
1.092092, -0.3374314, 2.981372, 1, 1, 1, 1, 1,
1.101328, -1.419352, 1.259878, 1, 1, 1, 1, 1,
1.103062, 0.837292, 0.6439648, 1, 1, 1, 1, 1,
1.109443, -0.3991251, 0.2759088, 1, 1, 1, 1, 1,
1.110904, 0.2428351, 2.054187, 1, 1, 1, 1, 1,
1.112621, -0.1559023, 1.358218, 1, 1, 1, 1, 1,
1.119159, -1.120858, 3.344448, 0, 0, 1, 1, 1,
1.119495, -0.5350107, 3.185709, 1, 0, 0, 1, 1,
1.120353, 0.91999, -0.1423497, 1, 0, 0, 1, 1,
1.125799, -0.2811026, 1.382561, 1, 0, 0, 1, 1,
1.127241, -1.495284, 1.387876, 1, 0, 0, 1, 1,
1.127539, -1.295584, 3.418663, 1, 0, 0, 1, 1,
1.14186, 1.025155, -0.6743001, 0, 0, 0, 1, 1,
1.144101, 0.9875239, 1.266156, 0, 0, 0, 1, 1,
1.145789, 1.46684, 0.4500244, 0, 0, 0, 1, 1,
1.146603, -2.446488, 2.695588, 0, 0, 0, 1, 1,
1.147332, -1.256374, 4.358798, 0, 0, 0, 1, 1,
1.148188, 0.595501, 1.257417, 0, 0, 0, 1, 1,
1.159487, -1.81566, 4.677209, 0, 0, 0, 1, 1,
1.159628, -0.7842807, 1.961325, 1, 1, 1, 1, 1,
1.167389, -1.415568, 2.631145, 1, 1, 1, 1, 1,
1.171233, 0.299569, 2.009955, 1, 1, 1, 1, 1,
1.199618, 0.6997774, 3.262223, 1, 1, 1, 1, 1,
1.200045, -0.6392383, 2.204892, 1, 1, 1, 1, 1,
1.204048, 1.865091, 0.2285019, 1, 1, 1, 1, 1,
1.204977, 0.2650029, 1.552609, 1, 1, 1, 1, 1,
1.209403, 2.510117, 0.1493517, 1, 1, 1, 1, 1,
1.209978, -0.5964358, 0.09829252, 1, 1, 1, 1, 1,
1.216505, 1.122436, 1.094941, 1, 1, 1, 1, 1,
1.223717, 1.553477, 0.3076784, 1, 1, 1, 1, 1,
1.237554, 1.003047, 0.6106092, 1, 1, 1, 1, 1,
1.242589, 0.1145542, -0.01559818, 1, 1, 1, 1, 1,
1.243879, -0.7095711, 0.9467923, 1, 1, 1, 1, 1,
1.246913, -0.9543463, 3.49848, 1, 1, 1, 1, 1,
1.249134, -0.5503687, 2.224696, 0, 0, 1, 1, 1,
1.254267, -0.3745192, 2.193423, 1, 0, 0, 1, 1,
1.258747, 1.596087, -0.4529981, 1, 0, 0, 1, 1,
1.265274, -0.5844269, 1.134047, 1, 0, 0, 1, 1,
1.26593, -0.384988, 1.7431, 1, 0, 0, 1, 1,
1.280275, 0.8752751, 1.730715, 1, 0, 0, 1, 1,
1.284736, -0.3213004, 0.0624276, 0, 0, 0, 1, 1,
1.284814, 0.1262142, 2.574809, 0, 0, 0, 1, 1,
1.285759, 0.6573215, 0.4608581, 0, 0, 0, 1, 1,
1.291161, 0.6144214, 0.6354001, 0, 0, 0, 1, 1,
1.295017, -0.02592693, 1.299749, 0, 0, 0, 1, 1,
1.295122, -2.119035, 1.86202, 0, 0, 0, 1, 1,
1.312213, 0.9367692, 2.455969, 0, 0, 0, 1, 1,
1.316726, 0.2481423, 2.431879, 1, 1, 1, 1, 1,
1.318019, -0.4500942, 1.46057, 1, 1, 1, 1, 1,
1.327673, -0.2751915, 2.915725, 1, 1, 1, 1, 1,
1.331036, 1.803226, -0.7389703, 1, 1, 1, 1, 1,
1.334315, -1.022181, 1.900242, 1, 1, 1, 1, 1,
1.335743, -0.6014261, 3.026627, 1, 1, 1, 1, 1,
1.342911, -1.267399, 1.891328, 1, 1, 1, 1, 1,
1.34816, 0.8642772, 1.853845, 1, 1, 1, 1, 1,
1.356034, 0.3515621, 1.7207, 1, 1, 1, 1, 1,
1.356229, 0.1127967, 0.9449037, 1, 1, 1, 1, 1,
1.357505, 0.404011, 2.076925, 1, 1, 1, 1, 1,
1.379449, 1.120723, 0.2934717, 1, 1, 1, 1, 1,
1.412757, -0.0006451052, 1.159979, 1, 1, 1, 1, 1,
1.420208, 0.7117329, 1.834393, 1, 1, 1, 1, 1,
1.424422, -0.6280645, 2.833719, 1, 1, 1, 1, 1,
1.431806, 1.377598, 0.08876988, 0, 0, 1, 1, 1,
1.433725, -0.4405363, 2.696904, 1, 0, 0, 1, 1,
1.437977, -0.3628168, 2.422816, 1, 0, 0, 1, 1,
1.443206, 1.328919, 0.2422262, 1, 0, 0, 1, 1,
1.476771, -0.9275458, 2.841512, 1, 0, 0, 1, 1,
1.481884, 0.9733223, 0.9828334, 1, 0, 0, 1, 1,
1.490487, 1.5339, 0.03570314, 0, 0, 0, 1, 1,
1.493025, -0.3436427, 0.698395, 0, 0, 0, 1, 1,
1.504591, -1.211231, 2.36997, 0, 0, 0, 1, 1,
1.513257, -0.3635686, 2.951077, 0, 0, 0, 1, 1,
1.536975, -0.7759071, 1.582656, 0, 0, 0, 1, 1,
1.537877, 0.6151971, -0.392706, 0, 0, 0, 1, 1,
1.551871, -0.4824596, 3.165863, 0, 0, 0, 1, 1,
1.554748, 0.8136267, -0.6444981, 1, 1, 1, 1, 1,
1.566103, -0.4516752, 0.8323101, 1, 1, 1, 1, 1,
1.567381, -0.7437333, 2.242735, 1, 1, 1, 1, 1,
1.569515, 0.7585401, 0.6881649, 1, 1, 1, 1, 1,
1.573508, 1.711265, 0.6945878, 1, 1, 1, 1, 1,
1.57585, 0.3222121, 1.151891, 1, 1, 1, 1, 1,
1.593436, 0.5319845, 1.396317, 1, 1, 1, 1, 1,
1.598906, 1.169402, 1.881525, 1, 1, 1, 1, 1,
1.613506, 0.784657, 1.226075, 1, 1, 1, 1, 1,
1.61769, -0.3404061, 2.555992, 1, 1, 1, 1, 1,
1.624028, -0.5181366, 3.668775, 1, 1, 1, 1, 1,
1.628024, 1.147387, 1.800105, 1, 1, 1, 1, 1,
1.639549, -1.199004, 3.90748, 1, 1, 1, 1, 1,
1.656934, 1.510922, 0.169561, 1, 1, 1, 1, 1,
1.660764, 1.33526, 0.4868603, 1, 1, 1, 1, 1,
1.661232, -0.9607715, 1.968809, 0, 0, 1, 1, 1,
1.670323, -1.31241, 0.3280512, 1, 0, 0, 1, 1,
1.673998, -0.1079397, 2.537513, 1, 0, 0, 1, 1,
1.681578, -0.1918016, 2.241853, 1, 0, 0, 1, 1,
1.687611, 0.9075187, 0.7224154, 1, 0, 0, 1, 1,
1.711762, -0.7108742, 3.389121, 1, 0, 0, 1, 1,
1.742074, 0.2561479, 2.977754, 0, 0, 0, 1, 1,
1.752766, 0.5983326, -0.771693, 0, 0, 0, 1, 1,
1.776575, -0.8650142, 3.361454, 0, 0, 0, 1, 1,
1.79046, -0.738666, 0.3901447, 0, 0, 0, 1, 1,
1.792535, 0.6289779, 0.7937384, 0, 0, 0, 1, 1,
1.810809, -1.047952, 0.9142567, 0, 0, 0, 1, 1,
1.812555, -0.2030364, 1.974235, 0, 0, 0, 1, 1,
1.815027, -1.472602, 2.336894, 1, 1, 1, 1, 1,
1.820408, -0.4177373, 1.531214, 1, 1, 1, 1, 1,
1.827273, -0.5601048, 1.593886, 1, 1, 1, 1, 1,
1.83017, 1.510476, 1.632032, 1, 1, 1, 1, 1,
1.847489, -1.183981, 0.5108494, 1, 1, 1, 1, 1,
1.865068, 0.894825, 0.8481938, 1, 1, 1, 1, 1,
1.872089, 0.1583313, 2.311006, 1, 1, 1, 1, 1,
1.887629, 0.2354828, 1.794946, 1, 1, 1, 1, 1,
1.899322, -0.5633989, 1.997117, 1, 1, 1, 1, 1,
1.925188, -2.109124, 0.7677959, 1, 1, 1, 1, 1,
1.931462, 0.685155, 1.647951, 1, 1, 1, 1, 1,
1.944412, -0.9498838, 1.403247, 1, 1, 1, 1, 1,
1.953125, 0.09625614, 3.235583, 1, 1, 1, 1, 1,
1.967322, 1.330241, 1.740603, 1, 1, 1, 1, 1,
1.984801, 0.6321561, 0.5290447, 1, 1, 1, 1, 1,
1.993733, -1.318254, 5.267425, 0, 0, 1, 1, 1,
1.996814, 0.8969947, 3.185219e-05, 1, 0, 0, 1, 1,
2.036832, -0.6245284, 1.446138, 1, 0, 0, 1, 1,
2.050575, 0.83161, 1.156366, 1, 0, 0, 1, 1,
2.055536, -0.6239816, 0.5076646, 1, 0, 0, 1, 1,
2.08035, 0.3620967, 0.9413448, 1, 0, 0, 1, 1,
2.109521, -0.004727343, 3.901813, 0, 0, 0, 1, 1,
2.119065, -1.480522, 1.39534, 0, 0, 0, 1, 1,
2.126127, -1.090741, 1.562779, 0, 0, 0, 1, 1,
2.140156, -0.5952035, 2.940084, 0, 0, 0, 1, 1,
2.193091, 0.277167, -0.4282888, 0, 0, 0, 1, 1,
2.208588, 0.317532, 1.110216, 0, 0, 0, 1, 1,
2.23531, 1.125456, 0.9998007, 0, 0, 0, 1, 1,
2.322848, 2.213446, 1.949446, 1, 1, 1, 1, 1,
2.411258, 0.6152579, 1.066024, 1, 1, 1, 1, 1,
2.419644, -1.613466, 2.056623, 1, 1, 1, 1, 1,
2.44014, 1.807891, 1.751218, 1, 1, 1, 1, 1,
2.441034, -0.2512355, 2.918547, 1, 1, 1, 1, 1,
2.521867, 0.2790488, 0.9275903, 1, 1, 1, 1, 1,
2.557835, -1.392513, 2.003701, 1, 1, 1, 1, 1
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
var radius = 9.384009;
var distance = 32.96093;
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
mvMatrix.translate( 0.2474353, 0.4233803, 0.1029422 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.96093);
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