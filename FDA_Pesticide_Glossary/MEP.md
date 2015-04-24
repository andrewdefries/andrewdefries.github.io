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
-3.44737, -0.2881721, -1.470237, 1, 0, 0, 1,
-2.871914, -1.061303, -0.362271, 1, 0.007843138, 0, 1,
-2.840185, -0.3140694, -1.944283, 1, 0.01176471, 0, 1,
-2.793622, 1.004235, -1.979089, 1, 0.01960784, 0, 1,
-2.748737, -0.7380435, -1.701261, 1, 0.02352941, 0, 1,
-2.681473, 0.0008886945, -1.673154, 1, 0.03137255, 0, 1,
-2.666422, 0.06281311, -0.75209, 1, 0.03529412, 0, 1,
-2.66625, -1.786831, -2.212788, 1, 0.04313726, 0, 1,
-2.541728, -0.6283726, -3.658372, 1, 0.04705882, 0, 1,
-2.500016, -0.4937802, -0.7469463, 1, 0.05490196, 0, 1,
-2.49384, -0.7780437, -2.844899, 1, 0.05882353, 0, 1,
-2.478731, -0.8482083, -2.709133, 1, 0.06666667, 0, 1,
-2.440301, 0.7217069, 0.6381361, 1, 0.07058824, 0, 1,
-2.398493, 0.8634187, 0.1921651, 1, 0.07843138, 0, 1,
-2.369924, -0.7347066, -2.257034, 1, 0.08235294, 0, 1,
-2.339418, -1.086017, -1.500687, 1, 0.09019608, 0, 1,
-2.331073, -0.4538105, -2.185354, 1, 0.09411765, 0, 1,
-2.322273, 0.4471274, -1.106885, 1, 0.1019608, 0, 1,
-2.208777, -1.341734, -0.6762062, 1, 0.1098039, 0, 1,
-2.188139, -0.2440809, -1.064945, 1, 0.1137255, 0, 1,
-2.173973, -0.8661715, -1.164437, 1, 0.1215686, 0, 1,
-2.161906, 1.035637, -2.225514, 1, 0.1254902, 0, 1,
-2.129049, -2.242305, -3.6354, 1, 0.1333333, 0, 1,
-2.126073, 1.555228, -1.293234, 1, 0.1372549, 0, 1,
-2.099902, 0.01551836, -2.683053, 1, 0.145098, 0, 1,
-2.071817, 1.115611, -1.231414, 1, 0.1490196, 0, 1,
-2.050783, -0.6786176, 1.213136, 1, 0.1568628, 0, 1,
-1.994798, 0.4219191, -0.6109497, 1, 0.1607843, 0, 1,
-1.952722, 0.6963385, -0.7151299, 1, 0.1686275, 0, 1,
-1.90237, 0.5440996, -0.4994756, 1, 0.172549, 0, 1,
-1.899255, -0.4642732, 0.2183784, 1, 0.1803922, 0, 1,
-1.894535, -0.184918, -0.6890081, 1, 0.1843137, 0, 1,
-1.867238, -0.7825166, -2.442239, 1, 0.1921569, 0, 1,
-1.849653, 0.1010782, -1.293297, 1, 0.1960784, 0, 1,
-1.842343, 1.296251, -2.851017, 1, 0.2039216, 0, 1,
-1.83004, 1.146104, 0.9440054, 1, 0.2117647, 0, 1,
-1.818154, -1.03182, -1.372539, 1, 0.2156863, 0, 1,
-1.815234, -0.3559362, -3.340244, 1, 0.2235294, 0, 1,
-1.813358, -1.510896, -2.406934, 1, 0.227451, 0, 1,
-1.811104, -1.166342, -1.948323, 1, 0.2352941, 0, 1,
-1.8017, 1.183828, -0.1263382, 1, 0.2392157, 0, 1,
-1.776979, 0.5262399, -2.211381, 1, 0.2470588, 0, 1,
-1.76988, -1.251673, -2.386154, 1, 0.2509804, 0, 1,
-1.732069, 0.3461092, -1.726691, 1, 0.2588235, 0, 1,
-1.73064, -0.8125331, -1.3246, 1, 0.2627451, 0, 1,
-1.719361, 0.4520783, -0.03488726, 1, 0.2705882, 0, 1,
-1.712675, -0.251968, -0.7321706, 1, 0.2745098, 0, 1,
-1.695161, -0.7357431, -2.85734, 1, 0.282353, 0, 1,
-1.687675, -0.6066712, -0.8957865, 1, 0.2862745, 0, 1,
-1.686548, 0.8959253, -1.325827, 1, 0.2941177, 0, 1,
-1.680832, -1.557881, -0.7484589, 1, 0.3019608, 0, 1,
-1.673926, -0.6928926, -1.726078, 1, 0.3058824, 0, 1,
-1.668966, -0.6399266, -2.68845, 1, 0.3137255, 0, 1,
-1.643405, 0.5357217, -3.698832, 1, 0.3176471, 0, 1,
-1.640984, -0.8428482, -1.547915, 1, 0.3254902, 0, 1,
-1.637348, 0.1011123, -1.486149, 1, 0.3294118, 0, 1,
-1.624147, 1.031081, -0.9353328, 1, 0.3372549, 0, 1,
-1.612515, 0.2659824, -3.298673, 1, 0.3411765, 0, 1,
-1.590522, 1.189215, 0.2927154, 1, 0.3490196, 0, 1,
-1.585152, 0.114723, -1.699583, 1, 0.3529412, 0, 1,
-1.561062, -0.239518, -1.551482, 1, 0.3607843, 0, 1,
-1.551512, 0.7172223, -0.7542559, 1, 0.3647059, 0, 1,
-1.545937, -0.0484198, -0.8098192, 1, 0.372549, 0, 1,
-1.544235, 0.6777385, -2.545042, 1, 0.3764706, 0, 1,
-1.542993, -0.05520622, -1.639747, 1, 0.3843137, 0, 1,
-1.52708, 0.7978016, -2.815388, 1, 0.3882353, 0, 1,
-1.526739, 0.2760257, -0.8116198, 1, 0.3960784, 0, 1,
-1.524143, -1.418252, -1.130432, 1, 0.4039216, 0, 1,
-1.511928, 1.653664, -0.5413786, 1, 0.4078431, 0, 1,
-1.511231, -1.082491, -3.311805, 1, 0.4156863, 0, 1,
-1.507939, -0.6274658, -2.12084, 1, 0.4196078, 0, 1,
-1.502791, 0.5786098, -1.087281, 1, 0.427451, 0, 1,
-1.498546, -1.115121, -1.037708, 1, 0.4313726, 0, 1,
-1.498527, 1.692714, -0.6612955, 1, 0.4392157, 0, 1,
-1.49512, 0.1574131, -2.718574, 1, 0.4431373, 0, 1,
-1.49035, -0.7572293, -2.800112, 1, 0.4509804, 0, 1,
-1.489811, 0.157968, -1.336434, 1, 0.454902, 0, 1,
-1.487471, -0.6436644, -0.3855901, 1, 0.4627451, 0, 1,
-1.482792, 0.3362321, -0.7852497, 1, 0.4666667, 0, 1,
-1.476159, -1.098664, -1.636781, 1, 0.4745098, 0, 1,
-1.473942, 0.12357, -2.675119, 1, 0.4784314, 0, 1,
-1.464099, 0.2049112, -0.3300401, 1, 0.4862745, 0, 1,
-1.459484, 0.1439389, -0.7182482, 1, 0.4901961, 0, 1,
-1.458198, 1.206466, 0.6229205, 1, 0.4980392, 0, 1,
-1.456668, -0.104801, 0.4647679, 1, 0.5058824, 0, 1,
-1.455833, -0.3234593, -2.80981, 1, 0.509804, 0, 1,
-1.453175, 0.7027113, -0.3555892, 1, 0.5176471, 0, 1,
-1.446751, 0.4622925, -1.175693, 1, 0.5215687, 0, 1,
-1.444893, 1.141724, -0.5683495, 1, 0.5294118, 0, 1,
-1.433287, -2.362859, -2.951651, 1, 0.5333334, 0, 1,
-1.424946, 2.273903, -0.447042, 1, 0.5411765, 0, 1,
-1.42243, -1.264306, -2.271709, 1, 0.5450981, 0, 1,
-1.419579, 0.4242202, -1.926392, 1, 0.5529412, 0, 1,
-1.419492, -1.34716, -1.35304, 1, 0.5568628, 0, 1,
-1.412823, -1.389835, -2.995079, 1, 0.5647059, 0, 1,
-1.38979, 0.1753836, -1.476987, 1, 0.5686275, 0, 1,
-1.387981, 0.5666783, -0.9798576, 1, 0.5764706, 0, 1,
-1.386212, 0.1006242, -1.609786, 1, 0.5803922, 0, 1,
-1.385453, 0.9559032, -1.27005, 1, 0.5882353, 0, 1,
-1.37363, -0.2110575, -1.69072, 1, 0.5921569, 0, 1,
-1.371458, -0.1657754, -2.394679, 1, 0.6, 0, 1,
-1.369726, -0.4984724, -0.9128881, 1, 0.6078432, 0, 1,
-1.364306, 0.4189492, 1.015637, 1, 0.6117647, 0, 1,
-1.358425, -0.2852297, -2.126576, 1, 0.6196079, 0, 1,
-1.355429, 0.8438689, -1.350414, 1, 0.6235294, 0, 1,
-1.350445, -0.8657965, -2.369387, 1, 0.6313726, 0, 1,
-1.340261, -0.396743, -2.395715, 1, 0.6352941, 0, 1,
-1.329034, 0.008955134, -0.1072773, 1, 0.6431373, 0, 1,
-1.32903, -1.092138, -0.6492294, 1, 0.6470588, 0, 1,
-1.328781, -2.053045, -2.256182, 1, 0.654902, 0, 1,
-1.326948, 0.8755051, -0.5579844, 1, 0.6588235, 0, 1,
-1.326754, 0.08428125, -1.453198, 1, 0.6666667, 0, 1,
-1.323143, -1.063454, -3.319562, 1, 0.6705883, 0, 1,
-1.319762, -1.73435, -3.442999, 1, 0.6784314, 0, 1,
-1.311738, -0.1312522, -2.929143, 1, 0.682353, 0, 1,
-1.311358, -0.901464, -1.945216, 1, 0.6901961, 0, 1,
-1.307328, -0.3547491, 0.5417008, 1, 0.6941177, 0, 1,
-1.304478, -0.4879997, -2.541343, 1, 0.7019608, 0, 1,
-1.296283, -0.4327306, -2.796273, 1, 0.7098039, 0, 1,
-1.295076, 0.07352826, 0.7883639, 1, 0.7137255, 0, 1,
-1.294912, 0.07006679, -0.3612125, 1, 0.7215686, 0, 1,
-1.285227, -1.047444, -2.965938, 1, 0.7254902, 0, 1,
-1.284278, 1.045444, -0.2221046, 1, 0.7333333, 0, 1,
-1.282425, 0.4930424, -1.399341, 1, 0.7372549, 0, 1,
-1.279972, -0.4932616, -2.329813, 1, 0.7450981, 0, 1,
-1.266919, -0.3414215, -2.915585, 1, 0.7490196, 0, 1,
-1.259509, 1.332878, -0.1784977, 1, 0.7568628, 0, 1,
-1.258929, -0.9795675, -2.225449, 1, 0.7607843, 0, 1,
-1.246139, -0.5103138, -2.402579, 1, 0.7686275, 0, 1,
-1.243669, 1.041618, -0.580532, 1, 0.772549, 0, 1,
-1.241697, -0.9606081, -3.281472, 1, 0.7803922, 0, 1,
-1.241445, 1.327593, -1.371208, 1, 0.7843137, 0, 1,
-1.239034, 0.5898001, -0.8683787, 1, 0.7921569, 0, 1,
-1.224535, -1.829281, -1.976566, 1, 0.7960784, 0, 1,
-1.2214, 0.6592174, -1.98073, 1, 0.8039216, 0, 1,
-1.218902, 0.09795012, -0.5548968, 1, 0.8117647, 0, 1,
-1.216264, -0.5581816, -3.236764, 1, 0.8156863, 0, 1,
-1.215901, 0.05057913, -1.39921, 1, 0.8235294, 0, 1,
-1.215631, -0.5473868, -4.013627, 1, 0.827451, 0, 1,
-1.211188, -0.6288841, -1.882522, 1, 0.8352941, 0, 1,
-1.189874, -1.101009, -1.953445, 1, 0.8392157, 0, 1,
-1.185893, -0.2536093, -0.3333546, 1, 0.8470588, 0, 1,
-1.185036, -0.04332611, -0.9689159, 1, 0.8509804, 0, 1,
-1.180776, -2.112591, -1.911061, 1, 0.8588235, 0, 1,
-1.177719, 2.023299, 1.368188, 1, 0.8627451, 0, 1,
-1.176383, 1.110341, -1.011571, 1, 0.8705882, 0, 1,
-1.155098, -1.459788, -0.9403967, 1, 0.8745098, 0, 1,
-1.148534, -0.6799966, -1.304578, 1, 0.8823529, 0, 1,
-1.141959, -0.2702945, -0.09802199, 1, 0.8862745, 0, 1,
-1.13761, 1.031596, -1.00935, 1, 0.8941177, 0, 1,
-1.125581, -0.3508064, -3.082259, 1, 0.8980392, 0, 1,
-1.125531, 0.5889668, -1.950555, 1, 0.9058824, 0, 1,
-1.125074, -0.820463, -1.992237, 1, 0.9137255, 0, 1,
-1.123938, -0.4006074, -1.687983, 1, 0.9176471, 0, 1,
-1.123306, 0.589044, -1.907277, 1, 0.9254902, 0, 1,
-1.121904, -0.5719575, -2.328701, 1, 0.9294118, 0, 1,
-1.113286, -0.3707867, -3.008427, 1, 0.9372549, 0, 1,
-1.10974, 0.04260745, -0.02107662, 1, 0.9411765, 0, 1,
-1.105352, -0.1358586, -1.719958, 1, 0.9490196, 0, 1,
-1.090587, -0.9952229, -1.830451, 1, 0.9529412, 0, 1,
-1.089391, -0.2227292, -0.6576326, 1, 0.9607843, 0, 1,
-1.081928, -0.3491628, -2.324154, 1, 0.9647059, 0, 1,
-1.067721, -1.651081, -1.233775, 1, 0.972549, 0, 1,
-1.065117, -0.5080163, 0.2527311, 1, 0.9764706, 0, 1,
-1.064446, 0.1571984, -3.957153, 1, 0.9843137, 0, 1,
-1.061044, -0.07814854, -2.378243, 1, 0.9882353, 0, 1,
-1.053624, 0.4208035, -1.69965, 1, 0.9960784, 0, 1,
-1.053478, 2.488513, -1.153452, 0.9960784, 1, 0, 1,
-1.040601, -1.187904, -3.564578, 0.9921569, 1, 0, 1,
-1.033141, -0.4782039, -1.691728, 0.9843137, 1, 0, 1,
-1.030101, 0.7682788, -0.1648456, 0.9803922, 1, 0, 1,
-1.028551, 0.6789454, -0.6715142, 0.972549, 1, 0, 1,
-1.025589, -0.2051593, -2.151772, 0.9686275, 1, 0, 1,
-1.025485, -0.1792581, -1.459587, 0.9607843, 1, 0, 1,
-1.024701, 0.8309262, -1.801321, 0.9568627, 1, 0, 1,
-1.024079, -1.216551, -2.332829, 0.9490196, 1, 0, 1,
-1.018423, -0.6961699, -2.548398, 0.945098, 1, 0, 1,
-1.017412, 0.3858898, -1.171399, 0.9372549, 1, 0, 1,
-1.008531, 0.3601408, -1.581936, 0.9333333, 1, 0, 1,
-1.006886, 1.158022, -1.961876, 0.9254902, 1, 0, 1,
-1.002592, 0.664224, -0.7218609, 0.9215686, 1, 0, 1,
-0.9988412, 0.5445385, -2.04083, 0.9137255, 1, 0, 1,
-0.9975626, 0.9664007, -2.533974, 0.9098039, 1, 0, 1,
-0.9966156, 0.2692094, -1.616386, 0.9019608, 1, 0, 1,
-0.9933911, 0.147689, -2.910507, 0.8941177, 1, 0, 1,
-0.9846285, 0.4104472, -1.82255, 0.8901961, 1, 0, 1,
-0.9804266, -0.9600202, -1.894749, 0.8823529, 1, 0, 1,
-0.9777669, -0.8196158, -3.143506, 0.8784314, 1, 0, 1,
-0.975437, -0.0237398, -2.572811, 0.8705882, 1, 0, 1,
-0.9753958, -1.0974, -4.058536, 0.8666667, 1, 0, 1,
-0.9657407, 1.819429, -0.2460693, 0.8588235, 1, 0, 1,
-0.9593472, -0.4258291, -3.429557, 0.854902, 1, 0, 1,
-0.9532577, 1.030241, -1.885546, 0.8470588, 1, 0, 1,
-0.953025, 1.62595, -2.581964, 0.8431373, 1, 0, 1,
-0.9494354, 0.6589879, -1.711748, 0.8352941, 1, 0, 1,
-0.9472951, -0.6213157, -2.563701, 0.8313726, 1, 0, 1,
-0.9332244, -0.5474085, -2.705034, 0.8235294, 1, 0, 1,
-0.9326321, 1.075042, -0.6519628, 0.8196079, 1, 0, 1,
-0.9306743, -0.6460896, -0.5198417, 0.8117647, 1, 0, 1,
-0.9256846, -1.344535, -0.8526763, 0.8078431, 1, 0, 1,
-0.9256726, -0.8730257, -1.884876, 0.8, 1, 0, 1,
-0.9216571, 1.036587, -0.06055006, 0.7921569, 1, 0, 1,
-0.9197835, -1.674693, -3.755091, 0.7882353, 1, 0, 1,
-0.9079195, 0.4314224, 0.3319667, 0.7803922, 1, 0, 1,
-0.8995807, -0.9133327, -2.172203, 0.7764706, 1, 0, 1,
-0.8990927, -2.128076, -2.711788, 0.7686275, 1, 0, 1,
-0.8964888, 0.2380939, -1.502383, 0.7647059, 1, 0, 1,
-0.8960629, 0.5776867, -1.643498, 0.7568628, 1, 0, 1,
-0.8869835, -1.072689, -3.537602, 0.7529412, 1, 0, 1,
-0.8854268, -0.526112, -0.1595778, 0.7450981, 1, 0, 1,
-0.8794119, 0.2927136, -1.544673, 0.7411765, 1, 0, 1,
-0.8774001, -0.4005412, -2.017024, 0.7333333, 1, 0, 1,
-0.8582295, 2.097496, 0.8860537, 0.7294118, 1, 0, 1,
-0.8551297, 0.4991713, 0.6112185, 0.7215686, 1, 0, 1,
-0.848419, -1.092462, -3.971159, 0.7176471, 1, 0, 1,
-0.8426351, -0.9336521, -2.696963, 0.7098039, 1, 0, 1,
-0.8396821, 1.450526, -0.00304331, 0.7058824, 1, 0, 1,
-0.8389391, 1.385075, 1.002677, 0.6980392, 1, 0, 1,
-0.8382106, -1.060709, -4.283069, 0.6901961, 1, 0, 1,
-0.8382092, -0.6359318, -3.1175, 0.6862745, 1, 0, 1,
-0.8370057, -1.403356, -1.346718, 0.6784314, 1, 0, 1,
-0.833846, -1.717052, -0.4870318, 0.6745098, 1, 0, 1,
-0.8192108, 0.6206292, -0.2745304, 0.6666667, 1, 0, 1,
-0.8185463, 1.048807, -1.857795, 0.6627451, 1, 0, 1,
-0.8178894, -0.8072853, -2.635972, 0.654902, 1, 0, 1,
-0.8144054, -0.1632903, -2.757782, 0.6509804, 1, 0, 1,
-0.8104415, 0.2683833, -3.265767, 0.6431373, 1, 0, 1,
-0.8065612, 1.36189, -1.267897, 0.6392157, 1, 0, 1,
-0.7940301, 0.4769391, -2.24211, 0.6313726, 1, 0, 1,
-0.7899386, 1.289025, -1.316464, 0.627451, 1, 0, 1,
-0.786872, 1.32618, -2.060172, 0.6196079, 1, 0, 1,
-0.7862024, 0.8096713, -1.215529, 0.6156863, 1, 0, 1,
-0.7841606, 0.5732154, -0.4966778, 0.6078432, 1, 0, 1,
-0.782468, -0.4433282, -1.913928, 0.6039216, 1, 0, 1,
-0.7810584, 1.94161, -0.9140367, 0.5960785, 1, 0, 1,
-0.7771263, 1.668545, -1.118624, 0.5882353, 1, 0, 1,
-0.7742732, 1.143229, 0.4534735, 0.5843138, 1, 0, 1,
-0.7724065, 0.09293008, -2.759575, 0.5764706, 1, 0, 1,
-0.7713414, 1.375247, -0.05242454, 0.572549, 1, 0, 1,
-0.7653993, -0.03560331, -1.536079, 0.5647059, 1, 0, 1,
-0.7612757, -0.4979905, -0.3679708, 0.5607843, 1, 0, 1,
-0.7571824, 0.5083146, 0.2277335, 0.5529412, 1, 0, 1,
-0.7546499, -1.189791, -1.613196, 0.5490196, 1, 0, 1,
-0.7523493, 1.001564, 0.1575138, 0.5411765, 1, 0, 1,
-0.7482685, 0.2974876, 0.5028197, 0.5372549, 1, 0, 1,
-0.7446145, -0.07674144, -1.43976, 0.5294118, 1, 0, 1,
-0.7416751, 1.319721, -0.4480993, 0.5254902, 1, 0, 1,
-0.7354877, 0.1305131, -0.4360832, 0.5176471, 1, 0, 1,
-0.7348501, -2.646368, -3.40763, 0.5137255, 1, 0, 1,
-0.7339631, -0.3345482, -2.65394, 0.5058824, 1, 0, 1,
-0.7306286, 0.5411527, -0.1443876, 0.5019608, 1, 0, 1,
-0.7284392, 1.197858, -2.133507, 0.4941176, 1, 0, 1,
-0.7282483, -0.7514707, -2.363468, 0.4862745, 1, 0, 1,
-0.7251269, 0.8146563, -0.5356734, 0.4823529, 1, 0, 1,
-0.7235368, -0.4687673, -1.454271, 0.4745098, 1, 0, 1,
-0.7221729, 0.8728316, -2.230312, 0.4705882, 1, 0, 1,
-0.7210808, 0.5463024, -1.897065, 0.4627451, 1, 0, 1,
-0.7179933, 0.2338728, -0.1062677, 0.4588235, 1, 0, 1,
-0.7127155, -0.7823799, -2.754606, 0.4509804, 1, 0, 1,
-0.7125917, -1.559935, -2.618252, 0.4470588, 1, 0, 1,
-0.7083628, 0.4765065, -0.6657881, 0.4392157, 1, 0, 1,
-0.7038429, -0.04187203, -1.533157, 0.4352941, 1, 0, 1,
-0.7016844, 1.28799, -0.8526044, 0.427451, 1, 0, 1,
-0.6969205, 0.8938112, 0.6838343, 0.4235294, 1, 0, 1,
-0.6962469, -0.6485918, -1.407436, 0.4156863, 1, 0, 1,
-0.6928692, -0.7717662, -2.100522, 0.4117647, 1, 0, 1,
-0.6892691, 0.6419663, 0.6233699, 0.4039216, 1, 0, 1,
-0.6883521, -0.7132679, -3.445464, 0.3960784, 1, 0, 1,
-0.6833638, -0.531723, -2.261016, 0.3921569, 1, 0, 1,
-0.6772883, 1.4527, 0.9683076, 0.3843137, 1, 0, 1,
-0.6763043, -0.6549698, -2.991434, 0.3803922, 1, 0, 1,
-0.6739641, -2.331624, -2.983437, 0.372549, 1, 0, 1,
-0.6723813, -0.7505332, -2.508184, 0.3686275, 1, 0, 1,
-0.6665872, -2.37116, -2.23859, 0.3607843, 1, 0, 1,
-0.6645986, 0.08409226, -1.205184, 0.3568628, 1, 0, 1,
-0.6574598, 0.03094007, -2.223222, 0.3490196, 1, 0, 1,
-0.6573294, -1.129935, -1.989543, 0.345098, 1, 0, 1,
-0.6566145, -1.55225, -3.749477, 0.3372549, 1, 0, 1,
-0.6552824, 0.8586998, 0.6759451, 0.3333333, 1, 0, 1,
-0.6549072, -1.132034, -2.409586, 0.3254902, 1, 0, 1,
-0.6543776, -0.1192376, -1.200805, 0.3215686, 1, 0, 1,
-0.6514216, 1.472558, -1.663751, 0.3137255, 1, 0, 1,
-0.6498346, -1.258169, -0.7020118, 0.3098039, 1, 0, 1,
-0.6497175, -1.920835, -2.625006, 0.3019608, 1, 0, 1,
-0.6438951, 1.520254, -0.391887, 0.2941177, 1, 0, 1,
-0.640402, -0.9754598, -2.556108, 0.2901961, 1, 0, 1,
-0.6376822, 0.1238754, -3.931748, 0.282353, 1, 0, 1,
-0.6331761, 0.822929, -2.453419, 0.2784314, 1, 0, 1,
-0.6277351, -0.0007567066, -1.949942, 0.2705882, 1, 0, 1,
-0.6185376, -1.863389, -3.50403, 0.2666667, 1, 0, 1,
-0.6148314, 0.1443429, 0.633678, 0.2588235, 1, 0, 1,
-0.6119037, 0.2585192, -2.191692, 0.254902, 1, 0, 1,
-0.6090922, -0.3826351, -2.351616, 0.2470588, 1, 0, 1,
-0.6069478, -0.9350874, -1.862706, 0.2431373, 1, 0, 1,
-0.6045188, -0.2191955, -0.1388131, 0.2352941, 1, 0, 1,
-0.6043616, -0.7671435, -2.059338, 0.2313726, 1, 0, 1,
-0.6041148, -0.3438455, -0.7094423, 0.2235294, 1, 0, 1,
-0.6035382, 0.7389807, 0.2067316, 0.2196078, 1, 0, 1,
-0.6006336, -0.2702722, -0.7344243, 0.2117647, 1, 0, 1,
-0.6003468, 1.180663, 0.1661775, 0.2078431, 1, 0, 1,
-0.6000007, -0.3542358, -2.487745, 0.2, 1, 0, 1,
-0.5949924, 1.165907, -2.175537, 0.1921569, 1, 0, 1,
-0.5926394, 2.158778, 1.032336, 0.1882353, 1, 0, 1,
-0.5917915, 0.5438204, -1.069216, 0.1803922, 1, 0, 1,
-0.5899487, -0.7943673, -3.564965, 0.1764706, 1, 0, 1,
-0.585576, -2.296641, -3.929545, 0.1686275, 1, 0, 1,
-0.5808302, -0.708185, -2.066929, 0.1647059, 1, 0, 1,
-0.5787119, 2.250999, -1.939307, 0.1568628, 1, 0, 1,
-0.5747944, -0.9278753, -3.709882, 0.1529412, 1, 0, 1,
-0.5725777, 0.7165487, -1.767991, 0.145098, 1, 0, 1,
-0.5710834, 1.259275, -0.6992022, 0.1411765, 1, 0, 1,
-0.5677155, 0.4200416, -1.349539, 0.1333333, 1, 0, 1,
-0.5665073, 2.216688, -0.810648, 0.1294118, 1, 0, 1,
-0.564405, 1.151035, -0.7318531, 0.1215686, 1, 0, 1,
-0.5643304, 0.09661815, -0.957189, 0.1176471, 1, 0, 1,
-0.5618797, 0.9469941, 1.977274, 0.1098039, 1, 0, 1,
-0.5615517, -0.4940139, -1.5778, 0.1058824, 1, 0, 1,
-0.5595365, 0.585855, -0.4291419, 0.09803922, 1, 0, 1,
-0.5516344, -1.29009, -2.133251, 0.09019608, 1, 0, 1,
-0.5437443, 1.359319, -1.477358, 0.08627451, 1, 0, 1,
-0.5421237, -0.3730254, -1.822564, 0.07843138, 1, 0, 1,
-0.5398454, 0.0674565, -1.074914, 0.07450981, 1, 0, 1,
-0.534143, -0.9387443, -1.978226, 0.06666667, 1, 0, 1,
-0.5339081, -1.242105, -2.299426, 0.0627451, 1, 0, 1,
-0.5333334, 1.004706, 1.683557, 0.05490196, 1, 0, 1,
-0.5284633, -0.7279895, -1.48793, 0.05098039, 1, 0, 1,
-0.5177198, -0.4572249, -1.409752, 0.04313726, 1, 0, 1,
-0.5166578, 2.089917, -0.5719484, 0.03921569, 1, 0, 1,
-0.516312, -0.7031601, -0.1955474, 0.03137255, 1, 0, 1,
-0.5121393, -0.3345609, -1.775361, 0.02745098, 1, 0, 1,
-0.511561, 1.438836, -1.698688, 0.01960784, 1, 0, 1,
-0.5115276, 0.6081432, 0.8007661, 0.01568628, 1, 0, 1,
-0.5045108, 0.9664765, -1.234956, 0.007843138, 1, 0, 1,
-0.5022381, -0.1491411, -2.317531, 0.003921569, 1, 0, 1,
-0.5003532, 0.04388673, -2.230567, 0, 1, 0.003921569, 1,
-0.496267, -0.3020989, -2.603063, 0, 1, 0.01176471, 1,
-0.496036, -0.7596812, -2.27855, 0, 1, 0.01568628, 1,
-0.4939131, -0.787456, -3.878283, 0, 1, 0.02352941, 1,
-0.4928097, -0.7704278, -2.63892, 0, 1, 0.02745098, 1,
-0.4887563, 0.9609776, -0.8135819, 0, 1, 0.03529412, 1,
-0.4858758, -0.3257707, -3.489229, 0, 1, 0.03921569, 1,
-0.4815351, 0.6221502, 0.3878343, 0, 1, 0.04705882, 1,
-0.4761131, -1.538913, -2.932085, 0, 1, 0.05098039, 1,
-0.4697226, -1.370472, -2.978423, 0, 1, 0.05882353, 1,
-0.4690596, -1.31445, -1.921447, 0, 1, 0.0627451, 1,
-0.4628423, 0.9098465, -1.213097, 0, 1, 0.07058824, 1,
-0.4623276, 1.098482, 0.303813, 0, 1, 0.07450981, 1,
-0.4540345, 0.3241178, -0.784484, 0, 1, 0.08235294, 1,
-0.4535473, 0.1159704, -2.860793, 0, 1, 0.08627451, 1,
-0.4497664, 2.271498, -0.7067783, 0, 1, 0.09411765, 1,
-0.4474578, 0.2771579, -0.4538225, 0, 1, 0.1019608, 1,
-0.4410762, -0.634154, -2.43237, 0, 1, 0.1058824, 1,
-0.4405168, 0.08929372, -3.350519, 0, 1, 0.1137255, 1,
-0.4379472, 1.106723, -0.7583262, 0, 1, 0.1176471, 1,
-0.4365171, -0.7763647, -3.5578, 0, 1, 0.1254902, 1,
-0.4355325, 0.6979804, -0.2132363, 0, 1, 0.1294118, 1,
-0.4076417, 0.4571588, 0.9152514, 0, 1, 0.1372549, 1,
-0.406902, -1.965614, -4.27873, 0, 1, 0.1411765, 1,
-0.3992813, 0.687035, -0.6548886, 0, 1, 0.1490196, 1,
-0.3948716, -0.109392, -2.278872, 0, 1, 0.1529412, 1,
-0.3930246, -1.170717, -2.708836, 0, 1, 0.1607843, 1,
-0.3905235, -0.486924, -2.772152, 0, 1, 0.1647059, 1,
-0.3880438, 1.179834, 0.3785016, 0, 1, 0.172549, 1,
-0.3859753, -0.3539322, -3.762553, 0, 1, 0.1764706, 1,
-0.3851961, -0.2137937, -1.278687, 0, 1, 0.1843137, 1,
-0.3825364, 1.759423, -1.55263, 0, 1, 0.1882353, 1,
-0.3824445, 1.220565, -0.9609389, 0, 1, 0.1960784, 1,
-0.3739008, -0.5135514, -1.90011, 0, 1, 0.2039216, 1,
-0.3695691, -1.66195, -3.781565, 0, 1, 0.2078431, 1,
-0.3680967, -0.108786, -1.997189, 0, 1, 0.2156863, 1,
-0.363634, 0.5359771, -0.7248453, 0, 1, 0.2196078, 1,
-0.3537109, 1.42472, -0.4285471, 0, 1, 0.227451, 1,
-0.3522649, -0.8123769, -2.001542, 0, 1, 0.2313726, 1,
-0.3509209, -0.5023123, -3.297742, 0, 1, 0.2392157, 1,
-0.3478241, 0.4401846, -1.37518, 0, 1, 0.2431373, 1,
-0.347627, 0.5688195, 1.182512, 0, 1, 0.2509804, 1,
-0.3461707, -2.145051, -2.996812, 0, 1, 0.254902, 1,
-0.3452055, 0.7115678, -0.2838271, 0, 1, 0.2627451, 1,
-0.3438202, 1.901729, -0.8322134, 0, 1, 0.2666667, 1,
-0.3412603, -2.886213, -3.451381, 0, 1, 0.2745098, 1,
-0.3410822, 1.226076, -0.7016635, 0, 1, 0.2784314, 1,
-0.3381912, -0.2994051, -3.208016, 0, 1, 0.2862745, 1,
-0.3316458, -1.132893, -1.733129, 0, 1, 0.2901961, 1,
-0.3302961, 1.583141, 0.4512488, 0, 1, 0.2980392, 1,
-0.3287325, -0.6475332, -5.077943, 0, 1, 0.3058824, 1,
-0.3283526, 0.7517342, 1.315252, 0, 1, 0.3098039, 1,
-0.3239702, -0.2129251, -0.6953071, 0, 1, 0.3176471, 1,
-0.3197915, -1.135552, -3.739087, 0, 1, 0.3215686, 1,
-0.3189645, 1.487808, 0.1265856, 0, 1, 0.3294118, 1,
-0.3187427, -1.81241, -3.948542, 0, 1, 0.3333333, 1,
-0.318708, -1.827028, -3.68591, 0, 1, 0.3411765, 1,
-0.3158661, 0.3665531, -2.098539, 0, 1, 0.345098, 1,
-0.3072379, 1.046646, 0.4030644, 0, 1, 0.3529412, 1,
-0.300578, -0.3746475, -1.586451, 0, 1, 0.3568628, 1,
-0.3002204, 0.4023879, -0.4361267, 0, 1, 0.3647059, 1,
-0.2993419, -0.07802105, -2.477052, 0, 1, 0.3686275, 1,
-0.2952454, 0.796187, -0.1582684, 0, 1, 0.3764706, 1,
-0.294496, -1.22538, -3.84341, 0, 1, 0.3803922, 1,
-0.2882929, 0.1648825, -0.337805, 0, 1, 0.3882353, 1,
-0.280495, -0.9427208, -3.231342, 0, 1, 0.3921569, 1,
-0.2784207, 0.1372154, 0.7189484, 0, 1, 0.4, 1,
-0.27819, -0.5511088, -4.050651, 0, 1, 0.4078431, 1,
-0.2765653, 1.15784, -1.24052, 0, 1, 0.4117647, 1,
-0.2753866, -0.0124213, -1.323988, 0, 1, 0.4196078, 1,
-0.2751324, -0.4239474, -2.696696, 0, 1, 0.4235294, 1,
-0.2725273, 1.613999, -1.881661, 0, 1, 0.4313726, 1,
-0.2697485, 0.59474, -0.4830371, 0, 1, 0.4352941, 1,
-0.2687787, -1.108898, -3.925217, 0, 1, 0.4431373, 1,
-0.2681615, -0.4237455, -2.647746, 0, 1, 0.4470588, 1,
-0.2618649, 0.8060325, -0.8172195, 0, 1, 0.454902, 1,
-0.2596618, 0.7400553, 1.645391, 0, 1, 0.4588235, 1,
-0.2585418, 0.07517988, -0.743634, 0, 1, 0.4666667, 1,
-0.2454978, 2.505901, -1.074553, 0, 1, 0.4705882, 1,
-0.243558, -0.1019521, -2.723276, 0, 1, 0.4784314, 1,
-0.2410222, 0.8163871, -2.351688, 0, 1, 0.4823529, 1,
-0.2409413, -1.64934, -2.962486, 0, 1, 0.4901961, 1,
-0.239328, 0.6695855, -0.08569682, 0, 1, 0.4941176, 1,
-0.238935, -0.1195773, -1.74195, 0, 1, 0.5019608, 1,
-0.2367854, -0.5285231, -1.425866, 0, 1, 0.509804, 1,
-0.2327588, 0.2407142, 0.2844793, 0, 1, 0.5137255, 1,
-0.2310974, -1.136121, -2.966702, 0, 1, 0.5215687, 1,
-0.2300572, 1.01121, 0.2587925, 0, 1, 0.5254902, 1,
-0.2294706, -0.240129, -2.295687, 0, 1, 0.5333334, 1,
-0.2285669, 1.560455, -1.224308, 0, 1, 0.5372549, 1,
-0.2253214, -0.5264733, -4.91258, 0, 1, 0.5450981, 1,
-0.2228436, 0.6962021, -1.088531, 0, 1, 0.5490196, 1,
-0.2223903, -0.9431744, -2.207224, 0, 1, 0.5568628, 1,
-0.2189555, -2.246156, -3.667506, 0, 1, 0.5607843, 1,
-0.2182068, -0.5392984, -2.023357, 0, 1, 0.5686275, 1,
-0.2159801, -0.996816, -2.521041, 0, 1, 0.572549, 1,
-0.2135746, -0.940738, -3.730286, 0, 1, 0.5803922, 1,
-0.2128355, -1.179138, -2.197642, 0, 1, 0.5843138, 1,
-0.2115817, -0.7569509, -2.764758, 0, 1, 0.5921569, 1,
-0.2091879, -1.797132, -3.367867, 0, 1, 0.5960785, 1,
-0.2057322, -1.257588, -2.542803, 0, 1, 0.6039216, 1,
-0.201968, -0.3117668, -0.9697261, 0, 1, 0.6117647, 1,
-0.2019217, -0.4462703, -2.175203, 0, 1, 0.6156863, 1,
-0.1969575, -1.081713, -3.623872, 0, 1, 0.6235294, 1,
-0.1952698, 1.03629, 0.6029603, 0, 1, 0.627451, 1,
-0.1947407, -0.4032426, -1.818905, 0, 1, 0.6352941, 1,
-0.1924146, 1.22636, 0.3808142, 0, 1, 0.6392157, 1,
-0.1908052, 0.4124193, -2.203873, 0, 1, 0.6470588, 1,
-0.1881635, 1.131067, -0.3694792, 0, 1, 0.6509804, 1,
-0.1873893, -1.131827, -3.093822, 0, 1, 0.6588235, 1,
-0.1863776, -0.2957708, -2.891386, 0, 1, 0.6627451, 1,
-0.1834608, -0.2114633, -2.768548, 0, 1, 0.6705883, 1,
-0.1824559, 0.1180411, 0.3024443, 0, 1, 0.6745098, 1,
-0.1818814, -0.09727632, -2.657871, 0, 1, 0.682353, 1,
-0.1751057, -1.461359, -2.256275, 0, 1, 0.6862745, 1,
-0.173727, 1.030264, 0.4335161, 0, 1, 0.6941177, 1,
-0.1718708, -0.2152239, -1.914261, 0, 1, 0.7019608, 1,
-0.1601261, 0.4598131, 0.1787163, 0, 1, 0.7058824, 1,
-0.157882, 0.6649475, -0.4458464, 0, 1, 0.7137255, 1,
-0.1570446, -0.2738236, -3.704311, 0, 1, 0.7176471, 1,
-0.1514563, -0.5351843, -4.143165, 0, 1, 0.7254902, 1,
-0.1432756, 0.2147821, -1.570013, 0, 1, 0.7294118, 1,
-0.1390901, -0.3548394, -3.183806, 0, 1, 0.7372549, 1,
-0.1363949, 1.470128, -1.470623, 0, 1, 0.7411765, 1,
-0.1342298, 1.682137, -0.07368211, 0, 1, 0.7490196, 1,
-0.1290723, -0.2126396, -1.332418, 0, 1, 0.7529412, 1,
-0.126959, -0.4398622, -3.199143, 0, 1, 0.7607843, 1,
-0.1265695, 0.9751492, -1.257717, 0, 1, 0.7647059, 1,
-0.1215272, 1.566089, 0.09327982, 0, 1, 0.772549, 1,
-0.1178138, 0.1012509, -1.478024, 0, 1, 0.7764706, 1,
-0.1165686, -1.973627, -4.507544, 0, 1, 0.7843137, 1,
-0.112949, 0.2509759, -0.4838592, 0, 1, 0.7882353, 1,
-0.1108145, -0.4742458, -0.5718938, 0, 1, 0.7960784, 1,
-0.1082321, 0.2313168, -1.930793, 0, 1, 0.8039216, 1,
-0.1065938, -2.247328, -2.149911, 0, 1, 0.8078431, 1,
-0.1016457, -1.477272, -2.819411, 0, 1, 0.8156863, 1,
-0.09843233, -0.381607, -2.781258, 0, 1, 0.8196079, 1,
-0.09653919, -0.275656, -1.80694, 0, 1, 0.827451, 1,
-0.09630539, -1.55197, -2.717513, 0, 1, 0.8313726, 1,
-0.09604157, 0.06601662, -0.9163811, 0, 1, 0.8392157, 1,
-0.09426222, -0.2361173, -2.677257, 0, 1, 0.8431373, 1,
-0.0901853, 1.280229, -0.3352416, 0, 1, 0.8509804, 1,
-0.08698745, 1.090621, -1.779919, 0, 1, 0.854902, 1,
-0.08629549, -0.6836618, -3.826027, 0, 1, 0.8627451, 1,
-0.08475735, -0.3015361, -3.63213, 0, 1, 0.8666667, 1,
-0.08177775, 0.789855, 1.631496, 0, 1, 0.8745098, 1,
-0.07751911, 0.07239959, 1.316908, 0, 1, 0.8784314, 1,
-0.0741994, -0.5031499, -2.656387, 0, 1, 0.8862745, 1,
-0.07242261, 0.9172575, -0.01004829, 0, 1, 0.8901961, 1,
-0.06856337, -0.7973503, -2.929848, 0, 1, 0.8980392, 1,
-0.06807303, 2.302695, -0.6059976, 0, 1, 0.9058824, 1,
-0.06641396, -1.057901, -1.532187, 0, 1, 0.9098039, 1,
-0.06441309, 0.2396723, -0.2839879, 0, 1, 0.9176471, 1,
-0.06440842, -1.35957, -4.205831, 0, 1, 0.9215686, 1,
-0.06330517, 0.4421459, -1.159673, 0, 1, 0.9294118, 1,
-0.0628225, -0.9686485, -3.599595, 0, 1, 0.9333333, 1,
-0.05839561, -1.501828, -2.359663, 0, 1, 0.9411765, 1,
-0.05419252, 0.8189207, -0.1462409, 0, 1, 0.945098, 1,
-0.05213876, -1.460432, -1.889886, 0, 1, 0.9529412, 1,
-0.04950031, -0.6194448, -1.91854, 0, 1, 0.9568627, 1,
-0.04528137, -0.4875519, -4.182039, 0, 1, 0.9647059, 1,
-0.04411785, 1.084053, -0.7559823, 0, 1, 0.9686275, 1,
-0.04060882, -1.397188, -3.729432, 0, 1, 0.9764706, 1,
-0.04021282, -0.2484062, -3.234598, 0, 1, 0.9803922, 1,
-0.03852303, -0.01271461, -4.318844, 0, 1, 0.9882353, 1,
-0.02488368, 0.3251061, 0.3760945, 0, 1, 0.9921569, 1,
-0.003315593, 0.02612872, -2.1646, 0, 1, 1, 1,
-0.002250745, -0.1561761, -2.908, 0, 0.9921569, 1, 1,
3.102237e-05, 1.765963, -1.08702, 0, 0.9882353, 1, 1,
0.002405779, 0.7243583, -0.732488, 0, 0.9803922, 1, 1,
0.003837784, -0.2085709, 3.034574, 0, 0.9764706, 1, 1,
0.005855154, -1.627003, 1.373003, 0, 0.9686275, 1, 1,
0.008245735, 0.1598046, 1.143675, 0, 0.9647059, 1, 1,
0.009272172, -0.005644858, 1.028657, 0, 0.9568627, 1, 1,
0.01181513, -0.996923, 3.170164, 0, 0.9529412, 1, 1,
0.01277963, 0.2163324, 0.3993597, 0, 0.945098, 1, 1,
0.01732273, 0.1185636, -0.4565574, 0, 0.9411765, 1, 1,
0.02106812, 0.09185908, 0.3956809, 0, 0.9333333, 1, 1,
0.02144403, -0.4015249, 1.991964, 0, 0.9294118, 1, 1,
0.0219912, -0.3732352, 3.948598, 0, 0.9215686, 1, 1,
0.02577939, 0.9224704, -0.02836068, 0, 0.9176471, 1, 1,
0.02739761, 0.9752122, 0.9661019, 0, 0.9098039, 1, 1,
0.03835839, 0.2748395, -0.2458771, 0, 0.9058824, 1, 1,
0.04689028, 1.217126, 0.480594, 0, 0.8980392, 1, 1,
0.04810177, -1.275802, 2.848531, 0, 0.8901961, 1, 1,
0.05082367, -1.278065, 5.534146, 0, 0.8862745, 1, 1,
0.05241166, -0.1507292, 0.7760977, 0, 0.8784314, 1, 1,
0.05311295, 0.5488878, 2.193017, 0, 0.8745098, 1, 1,
0.05354534, -0.2589625, 3.225205, 0, 0.8666667, 1, 1,
0.06454219, 0.02901995, 2.838846, 0, 0.8627451, 1, 1,
0.06548906, -0.260594, 1.936762, 0, 0.854902, 1, 1,
0.07247994, -0.2393569, 2.077587, 0, 0.8509804, 1, 1,
0.07348831, -0.5353221, 2.34616, 0, 0.8431373, 1, 1,
0.07437459, -1.494912, 3.21238, 0, 0.8392157, 1, 1,
0.07604181, 1.898365, -1.419834, 0, 0.8313726, 1, 1,
0.07630412, 1.359937, -0.152275, 0, 0.827451, 1, 1,
0.07720425, 1.682459, -1.357323, 0, 0.8196079, 1, 1,
0.07880041, -1.156931, 2.594166, 0, 0.8156863, 1, 1,
0.08140653, 2.020588, 1.020012, 0, 0.8078431, 1, 1,
0.08630566, -1.442897, 4.168993, 0, 0.8039216, 1, 1,
0.08750963, -0.6217235, 4.229177, 0, 0.7960784, 1, 1,
0.08860483, -1.004752, 0.6251751, 0, 0.7882353, 1, 1,
0.09146938, 1.062583, 1.261701, 0, 0.7843137, 1, 1,
0.09427795, 0.6281276, 0.6373514, 0, 0.7764706, 1, 1,
0.09777286, 2.482282, -0.7521282, 0, 0.772549, 1, 1,
0.09943628, 0.2379921, -0.5117366, 0, 0.7647059, 1, 1,
0.09978838, 0.1281278, 1.433159, 0, 0.7607843, 1, 1,
0.1000207, 0.9314342, -0.4816057, 0, 0.7529412, 1, 1,
0.1019005, -0.3530043, 1.998247, 0, 0.7490196, 1, 1,
0.107465, -0.4379402, 4.030725, 0, 0.7411765, 1, 1,
0.1082376, -1.022298, 4.712958, 0, 0.7372549, 1, 1,
0.1095709, -1.497903, 0.8455375, 0, 0.7294118, 1, 1,
0.1098833, 0.5195035, -0.876433, 0, 0.7254902, 1, 1,
0.1110995, -1.816007, 2.766474, 0, 0.7176471, 1, 1,
0.1112721, -1.320963, 1.113951, 0, 0.7137255, 1, 1,
0.1154244, 1.381845, 1.674464, 0, 0.7058824, 1, 1,
0.1165785, 0.4806764, -1.300611, 0, 0.6980392, 1, 1,
0.118663, 0.7768674, 0.08050406, 0, 0.6941177, 1, 1,
0.1215297, 0.2391888, 0.07311018, 0, 0.6862745, 1, 1,
0.1225051, 0.9782123, 0.1631784, 0, 0.682353, 1, 1,
0.1236477, -0.3481821, 3.3353, 0, 0.6745098, 1, 1,
0.127777, -0.6923711, 4.089808, 0, 0.6705883, 1, 1,
0.1295765, 0.5137098, 0.2815357, 0, 0.6627451, 1, 1,
0.1348379, 1.233669, -1.178178, 0, 0.6588235, 1, 1,
0.1350224, 0.9405353, 1.373126, 0, 0.6509804, 1, 1,
0.1411916, 1.81159, -0.9400429, 0, 0.6470588, 1, 1,
0.1436183, 0.7128718, 0.5408252, 0, 0.6392157, 1, 1,
0.1453345, -0.7374277, 2.143174, 0, 0.6352941, 1, 1,
0.1458479, -0.5421607, 3.257218, 0, 0.627451, 1, 1,
0.1509711, -0.6745934, 2.087113, 0, 0.6235294, 1, 1,
0.1546448, 0.2308652, 0.07533739, 0, 0.6156863, 1, 1,
0.156275, 1.365295, 0.6123562, 0, 0.6117647, 1, 1,
0.1591132, -0.6235185, 3.592122, 0, 0.6039216, 1, 1,
0.1594923, -1.197417, 3.309101, 0, 0.5960785, 1, 1,
0.160318, -0.4267427, 3.09768, 0, 0.5921569, 1, 1,
0.1605156, 0.7781565, 0.7846071, 0, 0.5843138, 1, 1,
0.1649642, 1.02358, 1.441791, 0, 0.5803922, 1, 1,
0.167279, 0.6955189, 0.5827374, 0, 0.572549, 1, 1,
0.1710501, -1.286436, 2.510103, 0, 0.5686275, 1, 1,
0.172873, -0.03062336, 2.18491, 0, 0.5607843, 1, 1,
0.1754571, -1.058779, 3.827897, 0, 0.5568628, 1, 1,
0.1758271, 0.4246515, 0.6256245, 0, 0.5490196, 1, 1,
0.176988, 0.7536715, 0.2510572, 0, 0.5450981, 1, 1,
0.1795497, 0.01504179, 2.653443, 0, 0.5372549, 1, 1,
0.180383, 0.3119397, 1.61753, 0, 0.5333334, 1, 1,
0.1833145, 0.8784339, -0.2900624, 0, 0.5254902, 1, 1,
0.1898338, -0.7801095, 4.474511, 0, 0.5215687, 1, 1,
0.1930945, -2.637566, 2.382529, 0, 0.5137255, 1, 1,
0.1947898, 1.649295, 0.3027691, 0, 0.509804, 1, 1,
0.196089, 0.6399901, -0.578796, 0, 0.5019608, 1, 1,
0.1988144, -0.1382151, 2.327864, 0, 0.4941176, 1, 1,
0.1996052, 0.9287157, -0.3685747, 0, 0.4901961, 1, 1,
0.2061974, -0.2836251, 3.231061, 0, 0.4823529, 1, 1,
0.2091811, 0.2890763, 1.105057, 0, 0.4784314, 1, 1,
0.214323, -1.486724, 3.284708, 0, 0.4705882, 1, 1,
0.2146635, -0.03030584, 2.587664, 0, 0.4666667, 1, 1,
0.2218743, -2.618071, 4.987005, 0, 0.4588235, 1, 1,
0.233455, 2.111664, 0.005904273, 0, 0.454902, 1, 1,
0.2377882, 0.3677731, -1.809357, 0, 0.4470588, 1, 1,
0.2399662, 0.3148564, 1.718138, 0, 0.4431373, 1, 1,
0.2411284, -1.227938, 2.769248, 0, 0.4352941, 1, 1,
0.2436246, -0.6625096, 1.844676, 0, 0.4313726, 1, 1,
0.2458993, -0.7591568, 1.935191, 0, 0.4235294, 1, 1,
0.2553727, -0.8240211, 3.013817, 0, 0.4196078, 1, 1,
0.2565777, -1.02844, 2.746706, 0, 0.4117647, 1, 1,
0.2593992, -1.608834, 2.603912, 0, 0.4078431, 1, 1,
0.2609532, -0.2805493, 2.088869, 0, 0.4, 1, 1,
0.2612368, -0.4035276, 2.149913, 0, 0.3921569, 1, 1,
0.2689388, -0.5446888, 0.9099761, 0, 0.3882353, 1, 1,
0.2711704, -0.1420068, 2.966688, 0, 0.3803922, 1, 1,
0.271209, 0.04896203, 1.018296, 0, 0.3764706, 1, 1,
0.2760102, 0.3406687, 0.2931843, 0, 0.3686275, 1, 1,
0.2779403, 1.054559, 0.9981061, 0, 0.3647059, 1, 1,
0.279712, 0.3783522, 1.169166, 0, 0.3568628, 1, 1,
0.280046, -0.2140523, 0.851659, 0, 0.3529412, 1, 1,
0.2883841, -0.1547056, 1.161015, 0, 0.345098, 1, 1,
0.2887964, 1.643521, 0.4201227, 0, 0.3411765, 1, 1,
0.294264, -0.1672326, 0.7067437, 0, 0.3333333, 1, 1,
0.2979326, -0.5665536, 2.873763, 0, 0.3294118, 1, 1,
0.2980743, 0.512741, -0.8706518, 0, 0.3215686, 1, 1,
0.299125, -1.360105, 3.349451, 0, 0.3176471, 1, 1,
0.2996691, 0.07736468, 1.657315, 0, 0.3098039, 1, 1,
0.3022945, -0.4322806, 4.361934, 0, 0.3058824, 1, 1,
0.3040621, -0.6497028, 4.315814, 0, 0.2980392, 1, 1,
0.3076585, 0.2106516, 1.407318, 0, 0.2901961, 1, 1,
0.3078983, -1.032656, 4.023261, 0, 0.2862745, 1, 1,
0.3081192, 0.1583596, 2.220114, 0, 0.2784314, 1, 1,
0.3138425, 1.591145, 1.093616, 0, 0.2745098, 1, 1,
0.3150594, -2.183515, 1.908129, 0, 0.2666667, 1, 1,
0.3156943, -0.5426231, 2.250762, 0, 0.2627451, 1, 1,
0.3189834, 1.191467, -0.1679486, 0, 0.254902, 1, 1,
0.3191564, -0.322073, 2.257313, 0, 0.2509804, 1, 1,
0.3278028, 0.5133669, 0.3245112, 0, 0.2431373, 1, 1,
0.3307719, 0.9255795, 0.2905247, 0, 0.2392157, 1, 1,
0.3328871, 1.420772, -1.527998, 0, 0.2313726, 1, 1,
0.3330463, -0.7536071, 4.015784, 0, 0.227451, 1, 1,
0.3349876, -1.312539, 4.493309, 0, 0.2196078, 1, 1,
0.3385015, -1.523336, 3.797251, 0, 0.2156863, 1, 1,
0.3386991, 0.4213121, -1.336585, 0, 0.2078431, 1, 1,
0.3400783, -0.3664469, 2.374928, 0, 0.2039216, 1, 1,
0.3421779, 0.07621007, 2.083739, 0, 0.1960784, 1, 1,
0.3450337, 0.9971461, 1.969629, 0, 0.1882353, 1, 1,
0.3474279, -0.7927647, 1.499073, 0, 0.1843137, 1, 1,
0.3492141, 0.9864922, 1.194264, 0, 0.1764706, 1, 1,
0.3502394, 0.8883325, 1.379556, 0, 0.172549, 1, 1,
0.353766, 1.291212, 1.165781, 0, 0.1647059, 1, 1,
0.3551154, 0.7602062, 1.193507, 0, 0.1607843, 1, 1,
0.3590875, 0.02839367, 1.616487, 0, 0.1529412, 1, 1,
0.3594261, 1.844275, 0.2912534, 0, 0.1490196, 1, 1,
0.3637832, -1.151959, 4.751629, 0, 0.1411765, 1, 1,
0.3662179, 1.462836, -0.05172017, 0, 0.1372549, 1, 1,
0.3684751, -1.146325, 1.92964, 0, 0.1294118, 1, 1,
0.3706323, 1.847429, 0.2520045, 0, 0.1254902, 1, 1,
0.3723139, -0.7683583, 3.499001, 0, 0.1176471, 1, 1,
0.3733613, -2.250436, 3.459025, 0, 0.1137255, 1, 1,
0.3768266, 1.397679, -0.8916681, 0, 0.1058824, 1, 1,
0.3805721, 0.05998589, 2.457056, 0, 0.09803922, 1, 1,
0.3922253, 1.070695, 0.2368742, 0, 0.09411765, 1, 1,
0.396229, -0.4805786, 2.534768, 0, 0.08627451, 1, 1,
0.3988231, -0.2405321, 1.723552, 0, 0.08235294, 1, 1,
0.3990107, 0.5390179, 0.8877236, 0, 0.07450981, 1, 1,
0.4018878, 0.8556008, 1.290984, 0, 0.07058824, 1, 1,
0.4024203, 1.53367, 1.215377, 0, 0.0627451, 1, 1,
0.4071385, -2.165172, 4.316574, 0, 0.05882353, 1, 1,
0.4101031, -0.008055662, 0.7900195, 0, 0.05098039, 1, 1,
0.4134154, -2.564579, 5.12706, 0, 0.04705882, 1, 1,
0.4162051, -0.4210573, 2.915461, 0, 0.03921569, 1, 1,
0.4184314, 0.6125318, 2.070677, 0, 0.03529412, 1, 1,
0.4186442, -0.3380364, 3.943211, 0, 0.02745098, 1, 1,
0.4243204, 1.86103, 1.582218, 0, 0.02352941, 1, 1,
0.4253956, -0.4729674, 2.087791, 0, 0.01568628, 1, 1,
0.4264394, -0.5754301, 2.489365, 0, 0.01176471, 1, 1,
0.4271975, -0.4457094, 2.321501, 0, 0.003921569, 1, 1,
0.4325097, 0.4622723, 0.9196712, 0.003921569, 0, 1, 1,
0.4326772, 0.4701427, -0.4235675, 0.007843138, 0, 1, 1,
0.4343667, 1.190807, 0.7931563, 0.01568628, 0, 1, 1,
0.4357547, -1.59428, 3.557973, 0.01960784, 0, 1, 1,
0.4392673, 0.726912, 0.6173761, 0.02745098, 0, 1, 1,
0.4399064, 0.5549476, -1.287609, 0.03137255, 0, 1, 1,
0.4446208, -0.3009288, 1.822892, 0.03921569, 0, 1, 1,
0.4469863, -0.6391978, 3.525626, 0.04313726, 0, 1, 1,
0.4477306, 1.008731, -0.3555197, 0.05098039, 0, 1, 1,
0.4522311, 0.5980894, 2.783434, 0.05490196, 0, 1, 1,
0.4567955, -0.4615445, 3.185708, 0.0627451, 0, 1, 1,
0.458623, 1.355617, 0.2383627, 0.06666667, 0, 1, 1,
0.4608521, 0.316952, 0.3510362, 0.07450981, 0, 1, 1,
0.4612944, -0.06532753, 1.435064, 0.07843138, 0, 1, 1,
0.4622455, 0.1595419, 2.075405, 0.08627451, 0, 1, 1,
0.4624059, -0.2989011, 2.520574, 0.09019608, 0, 1, 1,
0.4625873, 0.9629183, -0.3543458, 0.09803922, 0, 1, 1,
0.4663218, -0.0448246, 2.209931, 0.1058824, 0, 1, 1,
0.4667761, 1.654811, 1.073282, 0.1098039, 0, 1, 1,
0.472664, 2.648648, -0.2757573, 0.1176471, 0, 1, 1,
0.4819879, -0.3619335, 1.465152, 0.1215686, 0, 1, 1,
0.4839107, 0.1982848, 1.227352, 0.1294118, 0, 1, 1,
0.4868319, 0.339024, 1.750016, 0.1333333, 0, 1, 1,
0.4924138, -0.7976021, 2.057092, 0.1411765, 0, 1, 1,
0.4932732, 0.7040752, -0.2921327, 0.145098, 0, 1, 1,
0.4951621, -1.08862, 5.123905, 0.1529412, 0, 1, 1,
0.5022214, 0.4910673, 1.133534, 0.1568628, 0, 1, 1,
0.5045504, -1.470539, 4.749209, 0.1647059, 0, 1, 1,
0.505499, -0.3219267, 3.084941, 0.1686275, 0, 1, 1,
0.5071868, 0.5113024, -0.3865628, 0.1764706, 0, 1, 1,
0.5073324, -1.983945, 1.629463, 0.1803922, 0, 1, 1,
0.5079668, 0.3141457, 1.724554, 0.1882353, 0, 1, 1,
0.5092697, -0.4648015, 2.897412, 0.1921569, 0, 1, 1,
0.5093619, 0.6961364, 0.3481157, 0.2, 0, 1, 1,
0.5093771, 1.612217, 0.3000177, 0.2078431, 0, 1, 1,
0.5141321, 0.7474272, 1.911145, 0.2117647, 0, 1, 1,
0.5143033, 0.4791338, -1.604776, 0.2196078, 0, 1, 1,
0.5169644, -0.9389218, 3.481595, 0.2235294, 0, 1, 1,
0.5186763, 1.025676, 0.7931697, 0.2313726, 0, 1, 1,
0.5192061, 1.059815, -0.6112207, 0.2352941, 0, 1, 1,
0.5221372, 0.5412781, 0.8905379, 0.2431373, 0, 1, 1,
0.5252127, -0.556483, 2.174178, 0.2470588, 0, 1, 1,
0.5293067, 0.2861286, 0.5460168, 0.254902, 0, 1, 1,
0.5307897, 1.324404, -0.4694196, 0.2588235, 0, 1, 1,
0.5316226, -0.07104684, 1.252564, 0.2666667, 0, 1, 1,
0.5317155, -1.119361, 1.95681, 0.2705882, 0, 1, 1,
0.5358776, 1.139066, -0.8109847, 0.2784314, 0, 1, 1,
0.5360755, -0.6576068, 2.751946, 0.282353, 0, 1, 1,
0.5379466, 0.6975073, -0.2995395, 0.2901961, 0, 1, 1,
0.5452693, 0.06375141, 0.1443247, 0.2941177, 0, 1, 1,
0.5454557, 0.7616482, 0.8058912, 0.3019608, 0, 1, 1,
0.5466266, -1.063172, 3.973407, 0.3098039, 0, 1, 1,
0.5590736, -0.06370699, 1.378201, 0.3137255, 0, 1, 1,
0.563279, -0.5197216, 2.77862, 0.3215686, 0, 1, 1,
0.5651005, -1.556769, 1.843725, 0.3254902, 0, 1, 1,
0.5663553, 0.4118251, 0.8820366, 0.3333333, 0, 1, 1,
0.5685264, 0.2179294, 1.477555, 0.3372549, 0, 1, 1,
0.5750236, 1.042487, 0.2289501, 0.345098, 0, 1, 1,
0.5778612, 0.7938325, 1.152378, 0.3490196, 0, 1, 1,
0.5827758, 2.585331, 0.09599871, 0.3568628, 0, 1, 1,
0.5845794, 1.793872, 1.066282, 0.3607843, 0, 1, 1,
0.5890917, 1.24312, -1.185884, 0.3686275, 0, 1, 1,
0.5929376, 2.053897, 0.8749836, 0.372549, 0, 1, 1,
0.5970291, 0.4344423, 2.293665, 0.3803922, 0, 1, 1,
0.5989538, 0.0317659, 0.3649867, 0.3843137, 0, 1, 1,
0.5994091, 0.7803397, 0.8354992, 0.3921569, 0, 1, 1,
0.6060043, 1.268142, 0.5788713, 0.3960784, 0, 1, 1,
0.6080441, -0.1499455, 2.617854, 0.4039216, 0, 1, 1,
0.6081102, -1.017328, 2.741689, 0.4117647, 0, 1, 1,
0.6090391, 0.9054598, 0.9630911, 0.4156863, 0, 1, 1,
0.611492, 0.8415835, -0.7962477, 0.4235294, 0, 1, 1,
0.6136359, -0.8100324, 3.095705, 0.427451, 0, 1, 1,
0.6153604, 0.1397691, -0.1917199, 0.4352941, 0, 1, 1,
0.6178167, 1.653707, -0.623509, 0.4392157, 0, 1, 1,
0.6184249, 2.27832, 1.006071, 0.4470588, 0, 1, 1,
0.6228561, 0.880618, 0.5708637, 0.4509804, 0, 1, 1,
0.6265724, 1.851589, 0.09142729, 0.4588235, 0, 1, 1,
0.6291225, -0.2960459, 1.96658, 0.4627451, 0, 1, 1,
0.6328822, -0.1346647, 1.857862, 0.4705882, 0, 1, 1,
0.6334268, -0.4771505, 4.635294, 0.4745098, 0, 1, 1,
0.6389793, 2.173729, -1.572379, 0.4823529, 0, 1, 1,
0.6395389, 0.9857742, 0.8642212, 0.4862745, 0, 1, 1,
0.6442241, -0.3693036, 2.642543, 0.4941176, 0, 1, 1,
0.6508913, 0.7282584, 0.8512866, 0.5019608, 0, 1, 1,
0.6531658, 1.45868, 2.380209, 0.5058824, 0, 1, 1,
0.6611648, 0.30812, 1.885229, 0.5137255, 0, 1, 1,
0.6626594, 0.7697372, -0.7382452, 0.5176471, 0, 1, 1,
0.6655948, 0.62828, 2.125295, 0.5254902, 0, 1, 1,
0.666824, -1.107313, 3.844302, 0.5294118, 0, 1, 1,
0.6680273, -0.6636798, 2.030405, 0.5372549, 0, 1, 1,
0.6693646, 0.4250323, 1.057483, 0.5411765, 0, 1, 1,
0.6698457, 0.3976936, -0.2120503, 0.5490196, 0, 1, 1,
0.6800507, -1.498885, 1.700839, 0.5529412, 0, 1, 1,
0.6807101, 0.6612485, -0.8858367, 0.5607843, 0, 1, 1,
0.6817965, -0.5513935, 1.807503, 0.5647059, 0, 1, 1,
0.6824057, -0.5241839, 1.906201, 0.572549, 0, 1, 1,
0.6834546, -0.3132469, 2.36483, 0.5764706, 0, 1, 1,
0.6879088, 0.8725707, 0.05575255, 0.5843138, 0, 1, 1,
0.6985289, 1.091219, 1.313164, 0.5882353, 0, 1, 1,
0.7002596, -0.4243772, 2.770218, 0.5960785, 0, 1, 1,
0.7019234, -0.1790328, 4.563639, 0.6039216, 0, 1, 1,
0.7044346, -0.6867934, 2.725285, 0.6078432, 0, 1, 1,
0.704702, -0.8073497, 2.418988, 0.6156863, 0, 1, 1,
0.7048893, 1.446129, 1.250585, 0.6196079, 0, 1, 1,
0.7140906, 0.3462081, 1.917494, 0.627451, 0, 1, 1,
0.7197993, -0.5782519, 1.130896, 0.6313726, 0, 1, 1,
0.7229308, 1.108572, 1.023095, 0.6392157, 0, 1, 1,
0.7230746, -1.243086, 2.320674, 0.6431373, 0, 1, 1,
0.7285267, 0.06390617, 0.5984453, 0.6509804, 0, 1, 1,
0.7445672, -0.03840644, 1.300448, 0.654902, 0, 1, 1,
0.7520086, -0.01887909, 1.897097, 0.6627451, 0, 1, 1,
0.7567598, 0.4185186, 0.385527, 0.6666667, 0, 1, 1,
0.7649407, -1.384562, 3.990822, 0.6745098, 0, 1, 1,
0.7773233, 0.8401744, 0.04723794, 0.6784314, 0, 1, 1,
0.777414, 0.8653679, 2.153989, 0.6862745, 0, 1, 1,
0.7841549, -1.697558, 2.579489, 0.6901961, 0, 1, 1,
0.7848862, -1.074804, 2.572543, 0.6980392, 0, 1, 1,
0.7901937, 0.3892915, 0.1996417, 0.7058824, 0, 1, 1,
0.7930358, -1.027466, 2.500923, 0.7098039, 0, 1, 1,
0.796499, 1.323217, 0.3724216, 0.7176471, 0, 1, 1,
0.7996451, 0.3428762, 0.5397106, 0.7215686, 0, 1, 1,
0.802641, 1.223495, 0.2316004, 0.7294118, 0, 1, 1,
0.803982, 0.8925197, 1.184096, 0.7333333, 0, 1, 1,
0.80791, -2.337729, 2.971155, 0.7411765, 0, 1, 1,
0.8095988, -0.5985242, 3.453586, 0.7450981, 0, 1, 1,
0.8169641, -1.199513, 1.735108, 0.7529412, 0, 1, 1,
0.8219296, -0.02442944, 1.363762, 0.7568628, 0, 1, 1,
0.8260862, 0.06512023, 1.781438, 0.7647059, 0, 1, 1,
0.8275113, -0.2623174, 0.4444806, 0.7686275, 0, 1, 1,
0.8342035, 0.5060844, 2.521246, 0.7764706, 0, 1, 1,
0.8355235, 0.1590873, 1.119791, 0.7803922, 0, 1, 1,
0.8453046, 1.321589, 0.3894155, 0.7882353, 0, 1, 1,
0.8455685, 0.0675635, 0.108594, 0.7921569, 0, 1, 1,
0.846529, 0.03398073, 0.213029, 0.8, 0, 1, 1,
0.8511164, 1.106157, 0.5465498, 0.8078431, 0, 1, 1,
0.8612741, 1.690605, 0.7452197, 0.8117647, 0, 1, 1,
0.8626034, -0.1549298, 1.233358, 0.8196079, 0, 1, 1,
0.8640519, 0.7434109, 0.4907971, 0.8235294, 0, 1, 1,
0.8688689, -0.3130576, 3.247715, 0.8313726, 0, 1, 1,
0.8738312, 0.3223602, 1.168846, 0.8352941, 0, 1, 1,
0.8758473, 0.294392, 2.853042, 0.8431373, 0, 1, 1,
0.8910763, 0.3369116, 1.404367, 0.8470588, 0, 1, 1,
0.8921487, -2.218297, 1.145298, 0.854902, 0, 1, 1,
0.905874, -0.4002104, 0.6074954, 0.8588235, 0, 1, 1,
0.9061431, -1.970284, 3.140846, 0.8666667, 0, 1, 1,
0.9068579, 0.6340736, 0.3672429, 0.8705882, 0, 1, 1,
0.908228, -1.228912, 2.684459, 0.8784314, 0, 1, 1,
0.9099671, 0.4043319, -0.00993632, 0.8823529, 0, 1, 1,
0.9115501, 0.6558103, 2.773299, 0.8901961, 0, 1, 1,
0.9154055, 0.005073104, 1.573224, 0.8941177, 0, 1, 1,
0.9203936, 0.2093181, 2.544555, 0.9019608, 0, 1, 1,
0.92101, -0.3542723, 2.06384, 0.9098039, 0, 1, 1,
0.9228457, 1.347995, 0.4396995, 0.9137255, 0, 1, 1,
0.9269657, -0.1721131, 1.333064, 0.9215686, 0, 1, 1,
0.9345937, -1.365853, 3.229527, 0.9254902, 0, 1, 1,
0.9377332, -0.8585668, 2.067871, 0.9333333, 0, 1, 1,
0.9452794, -0.09819268, 2.083708, 0.9372549, 0, 1, 1,
0.9491755, -3.131497, 2.973052, 0.945098, 0, 1, 1,
0.9518153, -0.8201315, 3.821098, 0.9490196, 0, 1, 1,
0.955389, -1.396533, 1.047585, 0.9568627, 0, 1, 1,
0.9623045, 0.9881402, 1.55581, 0.9607843, 0, 1, 1,
0.9634521, 0.01148863, 0.03228446, 0.9686275, 0, 1, 1,
0.9652424, -1.996438, 1.442137, 0.972549, 0, 1, 1,
0.9676995, -0.7352524, 2.441436, 0.9803922, 0, 1, 1,
0.9808899, -0.05936415, 2.776037, 0.9843137, 0, 1, 1,
0.9817183, -0.06495696, 2.369076, 0.9921569, 0, 1, 1,
0.9939082, -1.10451, 3.541665, 0.9960784, 0, 1, 1,
0.994496, -1.176501, 3.011478, 1, 0, 0.9960784, 1,
0.9950122, -0.2108901, 1.50955, 1, 0, 0.9882353, 1,
1.011213, -0.3440053, 0.5932688, 1, 0, 0.9843137, 1,
1.01476, 0.8394221, -0.9399927, 1, 0, 0.9764706, 1,
1.015017, -0.2565202, 0.2087689, 1, 0, 0.972549, 1,
1.023825, -0.7850478, 2.618956, 1, 0, 0.9647059, 1,
1.025458, -0.3902434, 0.6812012, 1, 0, 0.9607843, 1,
1.031875, 0.8148723, 2.254832, 1, 0, 0.9529412, 1,
1.034782, 0.7359369, 0.3297028, 1, 0, 0.9490196, 1,
1.035035, 0.2328999, 2.498384, 1, 0, 0.9411765, 1,
1.036945, 0.6621447, 1.26117, 1, 0, 0.9372549, 1,
1.037659, -0.03312958, 2.014536, 1, 0, 0.9294118, 1,
1.042565, -0.3710509, 2.952138, 1, 0, 0.9254902, 1,
1.046232, 1.656739, 1.38367, 1, 0, 0.9176471, 1,
1.049496, -1.55916, 1.029094, 1, 0, 0.9137255, 1,
1.06189, 1.737277, 2.003845, 1, 0, 0.9058824, 1,
1.062254, 1.661674, -2.17803, 1, 0, 0.9019608, 1,
1.062941, -1.829587, 2.12547, 1, 0, 0.8941177, 1,
1.066005, -0.4275702, 2.697927, 1, 0, 0.8862745, 1,
1.075712, 0.6545792, -0.1062661, 1, 0, 0.8823529, 1,
1.084345, 2.107324, 0.3529316, 1, 0, 0.8745098, 1,
1.090026, -1.833574, 1.477969, 1, 0, 0.8705882, 1,
1.096312, -0.8635101, 2.112099, 1, 0, 0.8627451, 1,
1.096534, 1.663661, 0.1189971, 1, 0, 0.8588235, 1,
1.101267, 0.7842588, 2.422007, 1, 0, 0.8509804, 1,
1.104896, 0.7936741, 2.048904, 1, 0, 0.8470588, 1,
1.114149, 0.2191562, 2.189538, 1, 0, 0.8392157, 1,
1.114368, 0.05864163, 0.8610647, 1, 0, 0.8352941, 1,
1.122812, 1.335513, 0.657649, 1, 0, 0.827451, 1,
1.125176, -1.79748, 2.296999, 1, 0, 0.8235294, 1,
1.125587, -2.303093, 1.659094, 1, 0, 0.8156863, 1,
1.12994, -0.7148058, 2.328454, 1, 0, 0.8117647, 1,
1.131077, -2.897, 4.514338, 1, 0, 0.8039216, 1,
1.146403, -0.3932617, 2.164965, 1, 0, 0.7960784, 1,
1.148384, -0.1817326, 0.3175546, 1, 0, 0.7921569, 1,
1.15439, 0.5731079, 3.201915, 1, 0, 0.7843137, 1,
1.154579, -0.0644204, 1.739506, 1, 0, 0.7803922, 1,
1.167816, 1.500336, 1.514852, 1, 0, 0.772549, 1,
1.171299, 1.878945, 0.1096201, 1, 0, 0.7686275, 1,
1.185858, 0.4272052, 1.903099, 1, 0, 0.7607843, 1,
1.193295, 0.7144418, 2.821545, 1, 0, 0.7568628, 1,
1.195122, 0.6702738, -1.159232, 1, 0, 0.7490196, 1,
1.198725, -0.5419907, 1.164602, 1, 0, 0.7450981, 1,
1.199714, 1.7063, 1.848157, 1, 0, 0.7372549, 1,
1.205716, -2.33357, 1.178592, 1, 0, 0.7333333, 1,
1.214073, 2.541847, 1.714156, 1, 0, 0.7254902, 1,
1.22228, 1.584159, 0.4531429, 1, 0, 0.7215686, 1,
1.22289, -0.6946233, 1.371627, 1, 0, 0.7137255, 1,
1.229786, -0.4050953, -0.01156294, 1, 0, 0.7098039, 1,
1.234051, 0.1978241, 1.219473, 1, 0, 0.7019608, 1,
1.23407, -1.656061, 2.877858, 1, 0, 0.6941177, 1,
1.244539, 0.5292144, 1.656499, 1, 0, 0.6901961, 1,
1.248611, -1.646313, 3.746531, 1, 0, 0.682353, 1,
1.248976, -1.659137, 2.050378, 1, 0, 0.6784314, 1,
1.251302, -0.5556077, 1.733361, 1, 0, 0.6705883, 1,
1.251409, 0.8570794, 0.8827958, 1, 0, 0.6666667, 1,
1.252514, 0.07733673, 1.527706, 1, 0, 0.6588235, 1,
1.255042, 1.795249, 0.04831938, 1, 0, 0.654902, 1,
1.255531, 1.376436, 1.632467, 1, 0, 0.6470588, 1,
1.271401, -0.208327, 1.378698, 1, 0, 0.6431373, 1,
1.286873, 2.094112, 1.78258, 1, 0, 0.6352941, 1,
1.290185, 0.2850253, 0.756242, 1, 0, 0.6313726, 1,
1.290479, -0.3744888, 2.688035, 1, 0, 0.6235294, 1,
1.292001, -1.427132, 4.481728, 1, 0, 0.6196079, 1,
1.297773, -0.8433098, 2.005432, 1, 0, 0.6117647, 1,
1.315688, 1.134553, -1.642478, 1, 0, 0.6078432, 1,
1.331608, -0.4019956, 3.396659, 1, 0, 0.6, 1,
1.33693, -0.5031902, 1.259268, 1, 0, 0.5921569, 1,
1.33755, -0.3327059, 0.9723851, 1, 0, 0.5882353, 1,
1.344867, 1.56877, -0.6339391, 1, 0, 0.5803922, 1,
1.345144, -1.593091, 2.578283, 1, 0, 0.5764706, 1,
1.345406, -0.1952055, 2.048713, 1, 0, 0.5686275, 1,
1.345709, -0.4915608, 1.45115, 1, 0, 0.5647059, 1,
1.351235, -0.2566259, 2.151862, 1, 0, 0.5568628, 1,
1.353386, -0.8112324, 2.289714, 1, 0, 0.5529412, 1,
1.360023, -1.249383, 0.5730809, 1, 0, 0.5450981, 1,
1.373569, -0.9227564, 1.439992, 1, 0, 0.5411765, 1,
1.376485, 0.8792998, 1.771682, 1, 0, 0.5333334, 1,
1.380802, -0.3390512, 1.121345, 1, 0, 0.5294118, 1,
1.388248, 0.2011897, 1.584732, 1, 0, 0.5215687, 1,
1.389417, -1.564046, 2.242798, 1, 0, 0.5176471, 1,
1.399159, 0.8236907, -0.7748168, 1, 0, 0.509804, 1,
1.41872, -0.5268585, 1.572727, 1, 0, 0.5058824, 1,
1.431194, 0.34001, 2.089986, 1, 0, 0.4980392, 1,
1.431926, 1.394817, -0.6530605, 1, 0, 0.4901961, 1,
1.43454, -0.2554516, 2.503092, 1, 0, 0.4862745, 1,
1.445406, -1.765612, 3.312243, 1, 0, 0.4784314, 1,
1.449278, 0.2825989, -0.5975651, 1, 0, 0.4745098, 1,
1.449773, -1.381918, 3.78933, 1, 0, 0.4666667, 1,
1.45646, 1.497456, -0.4908467, 1, 0, 0.4627451, 1,
1.458687, 0.8733428, 0.2933851, 1, 0, 0.454902, 1,
1.460146, 0.3940862, 2.24943, 1, 0, 0.4509804, 1,
1.480978, -1.404841, 2.07025, 1, 0, 0.4431373, 1,
1.493732, 0.4312302, 3.412618, 1, 0, 0.4392157, 1,
1.505983, 1.339585, 1.450167, 1, 0, 0.4313726, 1,
1.507974, 0.8345516, -0.8854118, 1, 0, 0.427451, 1,
1.509446, 0.6491689, 0.1590526, 1, 0, 0.4196078, 1,
1.518412, -1.904554, 2.848967, 1, 0, 0.4156863, 1,
1.521109, -0.5194985, 1.702458, 1, 0, 0.4078431, 1,
1.526637, -0.9674919, 1.642161, 1, 0, 0.4039216, 1,
1.544747, -1.062066, 2.278893, 1, 0, 0.3960784, 1,
1.564401, 1.455763, 0.5873218, 1, 0, 0.3882353, 1,
1.588356, -1.44275, 1.034092, 1, 0, 0.3843137, 1,
1.594377, -1.38903, 3.576417, 1, 0, 0.3764706, 1,
1.604468, -0.1167301, -0.3691529, 1, 0, 0.372549, 1,
1.609105, -0.9418691, 2.440086, 1, 0, 0.3647059, 1,
1.61346, 0.309011, 0.9138406, 1, 0, 0.3607843, 1,
1.630128, -0.4044523, 1.226526, 1, 0, 0.3529412, 1,
1.6344, -0.9643754, 0.9391782, 1, 0, 0.3490196, 1,
1.652671, 0.6792191, 1.081451, 1, 0, 0.3411765, 1,
1.682272, 0.0518888, 1.722653, 1, 0, 0.3372549, 1,
1.682958, -0.6723172, 3.99515, 1, 0, 0.3294118, 1,
1.684967, -1.140366, 2.797456, 1, 0, 0.3254902, 1,
1.686051, -1.004546, 1.844127, 1, 0, 0.3176471, 1,
1.703493, 1.25997, 0.02868914, 1, 0, 0.3137255, 1,
1.707631, -0.1659751, 2.77368, 1, 0, 0.3058824, 1,
1.708378, -0.405901, 1.636174, 1, 0, 0.2980392, 1,
1.747325, -1.041309, 2.519797, 1, 0, 0.2941177, 1,
1.759799, 0.01806209, 1.66323, 1, 0, 0.2862745, 1,
1.766813, -0.09787588, 2.623787, 1, 0, 0.282353, 1,
1.76738, -0.1268476, 2.615288, 1, 0, 0.2745098, 1,
1.775636, 1.220067, -0.8527683, 1, 0, 0.2705882, 1,
1.776383, -0.3014034, 4.00561, 1, 0, 0.2627451, 1,
1.796798, 0.08104149, 1.406075, 1, 0, 0.2588235, 1,
1.801826, 0.04070646, 2.318613, 1, 0, 0.2509804, 1,
1.804378, 0.04439396, 3.502588, 1, 0, 0.2470588, 1,
1.835288, 0.09353001, 2.370273, 1, 0, 0.2392157, 1,
1.841691, 0.9321379, 0.2038391, 1, 0, 0.2352941, 1,
1.85192, 0.1726963, 0.6149011, 1, 0, 0.227451, 1,
1.859643, -0.01120812, 2.682104, 1, 0, 0.2235294, 1,
1.867605, -0.5504228, 2.686329, 1, 0, 0.2156863, 1,
1.86888, -0.3352218, 2.343836, 1, 0, 0.2117647, 1,
1.874014, -0.8247966, 1.600769, 1, 0, 0.2039216, 1,
1.879085, 0.2441344, 1.24869, 1, 0, 0.1960784, 1,
1.886946, -0.2288763, 2.882761, 1, 0, 0.1921569, 1,
1.896087, 0.406894, 0.6634616, 1, 0, 0.1843137, 1,
1.8996, -0.9535119, 1.482585, 1, 0, 0.1803922, 1,
1.910863, 0.1655068, 1.79824, 1, 0, 0.172549, 1,
1.916125, 0.961333, 0.318398, 1, 0, 0.1686275, 1,
1.926308, -0.1651363, 3.082801, 1, 0, 0.1607843, 1,
1.928495, -0.3840783, 0.9040118, 1, 0, 0.1568628, 1,
1.942933, 1.796945, 0.3969645, 1, 0, 0.1490196, 1,
1.943572, -0.9846929, 1.505354, 1, 0, 0.145098, 1,
1.961162, -1.223705, 2.959109, 1, 0, 0.1372549, 1,
1.964593, 0.03714992, 0.8385358, 1, 0, 0.1333333, 1,
1.968331, 0.0118789, 2.219473, 1, 0, 0.1254902, 1,
1.988124, 0.8151947, 2.573307, 1, 0, 0.1215686, 1,
2.036501, 0.1692109, 0.08494961, 1, 0, 0.1137255, 1,
2.052431, 1.371875, 0.5454994, 1, 0, 0.1098039, 1,
2.088938, -0.04957225, 0.6143115, 1, 0, 0.1019608, 1,
2.158772, 0.4038052, 1.591006, 1, 0, 0.09411765, 1,
2.174853, 0.3922564, 0.6826863, 1, 0, 0.09019608, 1,
2.190696, 0.8560174, 2.043382, 1, 0, 0.08235294, 1,
2.195143, 0.6407482, 0.7267295, 1, 0, 0.07843138, 1,
2.197609, 2.116043, -0.1486161, 1, 0, 0.07058824, 1,
2.215041, -0.07220157, 2.920307, 1, 0, 0.06666667, 1,
2.24109, 0.6018788, 1.658111, 1, 0, 0.05882353, 1,
2.242524, -1.352438, 1.145337, 1, 0, 0.05490196, 1,
2.295229, 1.01963, -0.8385672, 1, 0, 0.04705882, 1,
2.485658, 0.363618, 1.529128, 1, 0, 0.04313726, 1,
2.599059, 0.7626554, 1.014711, 1, 0, 0.03529412, 1,
2.63102, 0.1988716, 0.06596599, 1, 0, 0.03137255, 1,
2.648665, -0.2602907, 3.28569, 1, 0, 0.02352941, 1,
2.682273, -0.9393554, 2.605876, 1, 0, 0.01960784, 1,
2.715694, 0.2840798, 1.780892, 1, 0, 0.01176471, 1,
3.026923, -1.454342, 0.3724058, 1, 0, 0.007843138, 1
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
-0.2102233, -4.111231, -6.876692, 0, -0.5, 0.5, 0.5,
-0.2102233, -4.111231, -6.876692, 1, -0.5, 0.5, 0.5,
-0.2102233, -4.111231, -6.876692, 1, 1.5, 0.5, 0.5,
-0.2102233, -4.111231, -6.876692, 0, 1.5, 0.5, 0.5
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
-4.544763, -0.2414244, -6.876692, 0, -0.5, 0.5, 0.5,
-4.544763, -0.2414244, -6.876692, 1, -0.5, 0.5, 0.5,
-4.544763, -0.2414244, -6.876692, 1, 1.5, 0.5, 0.5,
-4.544763, -0.2414244, -6.876692, 0, 1.5, 0.5, 0.5
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
-4.544763, -4.111231, 0.2281013, 0, -0.5, 0.5, 0.5,
-4.544763, -4.111231, 0.2281013, 1, -0.5, 0.5, 0.5,
-4.544763, -4.111231, 0.2281013, 1, 1.5, 0.5, 0.5,
-4.544763, -4.111231, 0.2281013, 0, 1.5, 0.5, 0.5
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
-3, -3.218199, -5.237124,
3, -3.218199, -5.237124,
-3, -3.218199, -5.237124,
-3, -3.367038, -5.510386,
-2, -3.218199, -5.237124,
-2, -3.367038, -5.510386,
-1, -3.218199, -5.237124,
-1, -3.367038, -5.510386,
0, -3.218199, -5.237124,
0, -3.367038, -5.510386,
1, -3.218199, -5.237124,
1, -3.367038, -5.510386,
2, -3.218199, -5.237124,
2, -3.367038, -5.510386,
3, -3.218199, -5.237124,
3, -3.367038, -5.510386
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
-3, -3.664715, -6.056909, 0, -0.5, 0.5, 0.5,
-3, -3.664715, -6.056909, 1, -0.5, 0.5, 0.5,
-3, -3.664715, -6.056909, 1, 1.5, 0.5, 0.5,
-3, -3.664715, -6.056909, 0, 1.5, 0.5, 0.5,
-2, -3.664715, -6.056909, 0, -0.5, 0.5, 0.5,
-2, -3.664715, -6.056909, 1, -0.5, 0.5, 0.5,
-2, -3.664715, -6.056909, 1, 1.5, 0.5, 0.5,
-2, -3.664715, -6.056909, 0, 1.5, 0.5, 0.5,
-1, -3.664715, -6.056909, 0, -0.5, 0.5, 0.5,
-1, -3.664715, -6.056909, 1, -0.5, 0.5, 0.5,
-1, -3.664715, -6.056909, 1, 1.5, 0.5, 0.5,
-1, -3.664715, -6.056909, 0, 1.5, 0.5, 0.5,
0, -3.664715, -6.056909, 0, -0.5, 0.5, 0.5,
0, -3.664715, -6.056909, 1, -0.5, 0.5, 0.5,
0, -3.664715, -6.056909, 1, 1.5, 0.5, 0.5,
0, -3.664715, -6.056909, 0, 1.5, 0.5, 0.5,
1, -3.664715, -6.056909, 0, -0.5, 0.5, 0.5,
1, -3.664715, -6.056909, 1, -0.5, 0.5, 0.5,
1, -3.664715, -6.056909, 1, 1.5, 0.5, 0.5,
1, -3.664715, -6.056909, 0, 1.5, 0.5, 0.5,
2, -3.664715, -6.056909, 0, -0.5, 0.5, 0.5,
2, -3.664715, -6.056909, 1, -0.5, 0.5, 0.5,
2, -3.664715, -6.056909, 1, 1.5, 0.5, 0.5,
2, -3.664715, -6.056909, 0, 1.5, 0.5, 0.5,
3, -3.664715, -6.056909, 0, -0.5, 0.5, 0.5,
3, -3.664715, -6.056909, 1, -0.5, 0.5, 0.5,
3, -3.664715, -6.056909, 1, 1.5, 0.5, 0.5,
3, -3.664715, -6.056909, 0, 1.5, 0.5, 0.5
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
-3.544484, -3, -5.237124,
-3.544484, 2, -5.237124,
-3.544484, -3, -5.237124,
-3.711198, -3, -5.510386,
-3.544484, -2, -5.237124,
-3.711198, -2, -5.510386,
-3.544484, -1, -5.237124,
-3.711198, -1, -5.510386,
-3.544484, 0, -5.237124,
-3.711198, 0, -5.510386,
-3.544484, 1, -5.237124,
-3.711198, 1, -5.510386,
-3.544484, 2, -5.237124,
-3.711198, 2, -5.510386
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
-4.044624, -3, -6.056909, 0, -0.5, 0.5, 0.5,
-4.044624, -3, -6.056909, 1, -0.5, 0.5, 0.5,
-4.044624, -3, -6.056909, 1, 1.5, 0.5, 0.5,
-4.044624, -3, -6.056909, 0, 1.5, 0.5, 0.5,
-4.044624, -2, -6.056909, 0, -0.5, 0.5, 0.5,
-4.044624, -2, -6.056909, 1, -0.5, 0.5, 0.5,
-4.044624, -2, -6.056909, 1, 1.5, 0.5, 0.5,
-4.044624, -2, -6.056909, 0, 1.5, 0.5, 0.5,
-4.044624, -1, -6.056909, 0, -0.5, 0.5, 0.5,
-4.044624, -1, -6.056909, 1, -0.5, 0.5, 0.5,
-4.044624, -1, -6.056909, 1, 1.5, 0.5, 0.5,
-4.044624, -1, -6.056909, 0, 1.5, 0.5, 0.5,
-4.044624, 0, -6.056909, 0, -0.5, 0.5, 0.5,
-4.044624, 0, -6.056909, 1, -0.5, 0.5, 0.5,
-4.044624, 0, -6.056909, 1, 1.5, 0.5, 0.5,
-4.044624, 0, -6.056909, 0, 1.5, 0.5, 0.5,
-4.044624, 1, -6.056909, 0, -0.5, 0.5, 0.5,
-4.044624, 1, -6.056909, 1, -0.5, 0.5, 0.5,
-4.044624, 1, -6.056909, 1, 1.5, 0.5, 0.5,
-4.044624, 1, -6.056909, 0, 1.5, 0.5, 0.5,
-4.044624, 2, -6.056909, 0, -0.5, 0.5, 0.5,
-4.044624, 2, -6.056909, 1, -0.5, 0.5, 0.5,
-4.044624, 2, -6.056909, 1, 1.5, 0.5, 0.5,
-4.044624, 2, -6.056909, 0, 1.5, 0.5, 0.5
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
-3.544484, -3.218199, -4,
-3.544484, -3.218199, 4,
-3.544484, -3.218199, -4,
-3.711198, -3.367038, -4,
-3.544484, -3.218199, -2,
-3.711198, -3.367038, -2,
-3.544484, -3.218199, 0,
-3.711198, -3.367038, 0,
-3.544484, -3.218199, 2,
-3.711198, -3.367038, 2,
-3.544484, -3.218199, 4,
-3.711198, -3.367038, 4
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
-4.044624, -3.664715, -4, 0, -0.5, 0.5, 0.5,
-4.044624, -3.664715, -4, 1, -0.5, 0.5, 0.5,
-4.044624, -3.664715, -4, 1, 1.5, 0.5, 0.5,
-4.044624, -3.664715, -4, 0, 1.5, 0.5, 0.5,
-4.044624, -3.664715, -2, 0, -0.5, 0.5, 0.5,
-4.044624, -3.664715, -2, 1, -0.5, 0.5, 0.5,
-4.044624, -3.664715, -2, 1, 1.5, 0.5, 0.5,
-4.044624, -3.664715, -2, 0, 1.5, 0.5, 0.5,
-4.044624, -3.664715, 0, 0, -0.5, 0.5, 0.5,
-4.044624, -3.664715, 0, 1, -0.5, 0.5, 0.5,
-4.044624, -3.664715, 0, 1, 1.5, 0.5, 0.5,
-4.044624, -3.664715, 0, 0, 1.5, 0.5, 0.5,
-4.044624, -3.664715, 2, 0, -0.5, 0.5, 0.5,
-4.044624, -3.664715, 2, 1, -0.5, 0.5, 0.5,
-4.044624, -3.664715, 2, 1, 1.5, 0.5, 0.5,
-4.044624, -3.664715, 2, 0, 1.5, 0.5, 0.5,
-4.044624, -3.664715, 4, 0, -0.5, 0.5, 0.5,
-4.044624, -3.664715, 4, 1, -0.5, 0.5, 0.5,
-4.044624, -3.664715, 4, 1, 1.5, 0.5, 0.5,
-4.044624, -3.664715, 4, 0, 1.5, 0.5, 0.5
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
-3.544484, -3.218199, -5.237124,
-3.544484, 2.73535, -5.237124,
-3.544484, -3.218199, 5.693327,
-3.544484, 2.73535, 5.693327,
-3.544484, -3.218199, -5.237124,
-3.544484, -3.218199, 5.693327,
-3.544484, 2.73535, -5.237124,
-3.544484, 2.73535, 5.693327,
-3.544484, -3.218199, -5.237124,
3.124038, -3.218199, -5.237124,
-3.544484, -3.218199, 5.693327,
3.124038, -3.218199, 5.693327,
-3.544484, 2.73535, -5.237124,
3.124038, 2.73535, -5.237124,
-3.544484, 2.73535, 5.693327,
3.124038, 2.73535, 5.693327,
3.124038, -3.218199, -5.237124,
3.124038, 2.73535, -5.237124,
3.124038, -3.218199, 5.693327,
3.124038, 2.73535, 5.693327,
3.124038, -3.218199, -5.237124,
3.124038, -3.218199, 5.693327,
3.124038, 2.73535, -5.237124,
3.124038, 2.73535, 5.693327
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
var radius = 7.540076;
var distance = 33.54665;
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
mvMatrix.translate( 0.2102233, 0.2414244, -0.2281013 );
mvMatrix.scale( 1.222531, 1.369348, 0.7458501 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.54665);
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
MEP<-read.table("MEP.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-MEP$V2
```

```
## Error in eval(expr, envir, enclos): object 'MEP' not found
```

```r
y<-MEP$V3
```

```
## Error in eval(expr, envir, enclos): object 'MEP' not found
```

```r
z<-MEP$V4
```

```
## Error in eval(expr, envir, enclos): object 'MEP' not found
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
-3.44737, -0.2881721, -1.470237, 0, 0, 1, 1, 1,
-2.871914, -1.061303, -0.362271, 1, 0, 0, 1, 1,
-2.840185, -0.3140694, -1.944283, 1, 0, 0, 1, 1,
-2.793622, 1.004235, -1.979089, 1, 0, 0, 1, 1,
-2.748737, -0.7380435, -1.701261, 1, 0, 0, 1, 1,
-2.681473, 0.0008886945, -1.673154, 1, 0, 0, 1, 1,
-2.666422, 0.06281311, -0.75209, 0, 0, 0, 1, 1,
-2.66625, -1.786831, -2.212788, 0, 0, 0, 1, 1,
-2.541728, -0.6283726, -3.658372, 0, 0, 0, 1, 1,
-2.500016, -0.4937802, -0.7469463, 0, 0, 0, 1, 1,
-2.49384, -0.7780437, -2.844899, 0, 0, 0, 1, 1,
-2.478731, -0.8482083, -2.709133, 0, 0, 0, 1, 1,
-2.440301, 0.7217069, 0.6381361, 0, 0, 0, 1, 1,
-2.398493, 0.8634187, 0.1921651, 1, 1, 1, 1, 1,
-2.369924, -0.7347066, -2.257034, 1, 1, 1, 1, 1,
-2.339418, -1.086017, -1.500687, 1, 1, 1, 1, 1,
-2.331073, -0.4538105, -2.185354, 1, 1, 1, 1, 1,
-2.322273, 0.4471274, -1.106885, 1, 1, 1, 1, 1,
-2.208777, -1.341734, -0.6762062, 1, 1, 1, 1, 1,
-2.188139, -0.2440809, -1.064945, 1, 1, 1, 1, 1,
-2.173973, -0.8661715, -1.164437, 1, 1, 1, 1, 1,
-2.161906, 1.035637, -2.225514, 1, 1, 1, 1, 1,
-2.129049, -2.242305, -3.6354, 1, 1, 1, 1, 1,
-2.126073, 1.555228, -1.293234, 1, 1, 1, 1, 1,
-2.099902, 0.01551836, -2.683053, 1, 1, 1, 1, 1,
-2.071817, 1.115611, -1.231414, 1, 1, 1, 1, 1,
-2.050783, -0.6786176, 1.213136, 1, 1, 1, 1, 1,
-1.994798, 0.4219191, -0.6109497, 1, 1, 1, 1, 1,
-1.952722, 0.6963385, -0.7151299, 0, 0, 1, 1, 1,
-1.90237, 0.5440996, -0.4994756, 1, 0, 0, 1, 1,
-1.899255, -0.4642732, 0.2183784, 1, 0, 0, 1, 1,
-1.894535, -0.184918, -0.6890081, 1, 0, 0, 1, 1,
-1.867238, -0.7825166, -2.442239, 1, 0, 0, 1, 1,
-1.849653, 0.1010782, -1.293297, 1, 0, 0, 1, 1,
-1.842343, 1.296251, -2.851017, 0, 0, 0, 1, 1,
-1.83004, 1.146104, 0.9440054, 0, 0, 0, 1, 1,
-1.818154, -1.03182, -1.372539, 0, 0, 0, 1, 1,
-1.815234, -0.3559362, -3.340244, 0, 0, 0, 1, 1,
-1.813358, -1.510896, -2.406934, 0, 0, 0, 1, 1,
-1.811104, -1.166342, -1.948323, 0, 0, 0, 1, 1,
-1.8017, 1.183828, -0.1263382, 0, 0, 0, 1, 1,
-1.776979, 0.5262399, -2.211381, 1, 1, 1, 1, 1,
-1.76988, -1.251673, -2.386154, 1, 1, 1, 1, 1,
-1.732069, 0.3461092, -1.726691, 1, 1, 1, 1, 1,
-1.73064, -0.8125331, -1.3246, 1, 1, 1, 1, 1,
-1.719361, 0.4520783, -0.03488726, 1, 1, 1, 1, 1,
-1.712675, -0.251968, -0.7321706, 1, 1, 1, 1, 1,
-1.695161, -0.7357431, -2.85734, 1, 1, 1, 1, 1,
-1.687675, -0.6066712, -0.8957865, 1, 1, 1, 1, 1,
-1.686548, 0.8959253, -1.325827, 1, 1, 1, 1, 1,
-1.680832, -1.557881, -0.7484589, 1, 1, 1, 1, 1,
-1.673926, -0.6928926, -1.726078, 1, 1, 1, 1, 1,
-1.668966, -0.6399266, -2.68845, 1, 1, 1, 1, 1,
-1.643405, 0.5357217, -3.698832, 1, 1, 1, 1, 1,
-1.640984, -0.8428482, -1.547915, 1, 1, 1, 1, 1,
-1.637348, 0.1011123, -1.486149, 1, 1, 1, 1, 1,
-1.624147, 1.031081, -0.9353328, 0, 0, 1, 1, 1,
-1.612515, 0.2659824, -3.298673, 1, 0, 0, 1, 1,
-1.590522, 1.189215, 0.2927154, 1, 0, 0, 1, 1,
-1.585152, 0.114723, -1.699583, 1, 0, 0, 1, 1,
-1.561062, -0.239518, -1.551482, 1, 0, 0, 1, 1,
-1.551512, 0.7172223, -0.7542559, 1, 0, 0, 1, 1,
-1.545937, -0.0484198, -0.8098192, 0, 0, 0, 1, 1,
-1.544235, 0.6777385, -2.545042, 0, 0, 0, 1, 1,
-1.542993, -0.05520622, -1.639747, 0, 0, 0, 1, 1,
-1.52708, 0.7978016, -2.815388, 0, 0, 0, 1, 1,
-1.526739, 0.2760257, -0.8116198, 0, 0, 0, 1, 1,
-1.524143, -1.418252, -1.130432, 0, 0, 0, 1, 1,
-1.511928, 1.653664, -0.5413786, 0, 0, 0, 1, 1,
-1.511231, -1.082491, -3.311805, 1, 1, 1, 1, 1,
-1.507939, -0.6274658, -2.12084, 1, 1, 1, 1, 1,
-1.502791, 0.5786098, -1.087281, 1, 1, 1, 1, 1,
-1.498546, -1.115121, -1.037708, 1, 1, 1, 1, 1,
-1.498527, 1.692714, -0.6612955, 1, 1, 1, 1, 1,
-1.49512, 0.1574131, -2.718574, 1, 1, 1, 1, 1,
-1.49035, -0.7572293, -2.800112, 1, 1, 1, 1, 1,
-1.489811, 0.157968, -1.336434, 1, 1, 1, 1, 1,
-1.487471, -0.6436644, -0.3855901, 1, 1, 1, 1, 1,
-1.482792, 0.3362321, -0.7852497, 1, 1, 1, 1, 1,
-1.476159, -1.098664, -1.636781, 1, 1, 1, 1, 1,
-1.473942, 0.12357, -2.675119, 1, 1, 1, 1, 1,
-1.464099, 0.2049112, -0.3300401, 1, 1, 1, 1, 1,
-1.459484, 0.1439389, -0.7182482, 1, 1, 1, 1, 1,
-1.458198, 1.206466, 0.6229205, 1, 1, 1, 1, 1,
-1.456668, -0.104801, 0.4647679, 0, 0, 1, 1, 1,
-1.455833, -0.3234593, -2.80981, 1, 0, 0, 1, 1,
-1.453175, 0.7027113, -0.3555892, 1, 0, 0, 1, 1,
-1.446751, 0.4622925, -1.175693, 1, 0, 0, 1, 1,
-1.444893, 1.141724, -0.5683495, 1, 0, 0, 1, 1,
-1.433287, -2.362859, -2.951651, 1, 0, 0, 1, 1,
-1.424946, 2.273903, -0.447042, 0, 0, 0, 1, 1,
-1.42243, -1.264306, -2.271709, 0, 0, 0, 1, 1,
-1.419579, 0.4242202, -1.926392, 0, 0, 0, 1, 1,
-1.419492, -1.34716, -1.35304, 0, 0, 0, 1, 1,
-1.412823, -1.389835, -2.995079, 0, 0, 0, 1, 1,
-1.38979, 0.1753836, -1.476987, 0, 0, 0, 1, 1,
-1.387981, 0.5666783, -0.9798576, 0, 0, 0, 1, 1,
-1.386212, 0.1006242, -1.609786, 1, 1, 1, 1, 1,
-1.385453, 0.9559032, -1.27005, 1, 1, 1, 1, 1,
-1.37363, -0.2110575, -1.69072, 1, 1, 1, 1, 1,
-1.371458, -0.1657754, -2.394679, 1, 1, 1, 1, 1,
-1.369726, -0.4984724, -0.9128881, 1, 1, 1, 1, 1,
-1.364306, 0.4189492, 1.015637, 1, 1, 1, 1, 1,
-1.358425, -0.2852297, -2.126576, 1, 1, 1, 1, 1,
-1.355429, 0.8438689, -1.350414, 1, 1, 1, 1, 1,
-1.350445, -0.8657965, -2.369387, 1, 1, 1, 1, 1,
-1.340261, -0.396743, -2.395715, 1, 1, 1, 1, 1,
-1.329034, 0.008955134, -0.1072773, 1, 1, 1, 1, 1,
-1.32903, -1.092138, -0.6492294, 1, 1, 1, 1, 1,
-1.328781, -2.053045, -2.256182, 1, 1, 1, 1, 1,
-1.326948, 0.8755051, -0.5579844, 1, 1, 1, 1, 1,
-1.326754, 0.08428125, -1.453198, 1, 1, 1, 1, 1,
-1.323143, -1.063454, -3.319562, 0, 0, 1, 1, 1,
-1.319762, -1.73435, -3.442999, 1, 0, 0, 1, 1,
-1.311738, -0.1312522, -2.929143, 1, 0, 0, 1, 1,
-1.311358, -0.901464, -1.945216, 1, 0, 0, 1, 1,
-1.307328, -0.3547491, 0.5417008, 1, 0, 0, 1, 1,
-1.304478, -0.4879997, -2.541343, 1, 0, 0, 1, 1,
-1.296283, -0.4327306, -2.796273, 0, 0, 0, 1, 1,
-1.295076, 0.07352826, 0.7883639, 0, 0, 0, 1, 1,
-1.294912, 0.07006679, -0.3612125, 0, 0, 0, 1, 1,
-1.285227, -1.047444, -2.965938, 0, 0, 0, 1, 1,
-1.284278, 1.045444, -0.2221046, 0, 0, 0, 1, 1,
-1.282425, 0.4930424, -1.399341, 0, 0, 0, 1, 1,
-1.279972, -0.4932616, -2.329813, 0, 0, 0, 1, 1,
-1.266919, -0.3414215, -2.915585, 1, 1, 1, 1, 1,
-1.259509, 1.332878, -0.1784977, 1, 1, 1, 1, 1,
-1.258929, -0.9795675, -2.225449, 1, 1, 1, 1, 1,
-1.246139, -0.5103138, -2.402579, 1, 1, 1, 1, 1,
-1.243669, 1.041618, -0.580532, 1, 1, 1, 1, 1,
-1.241697, -0.9606081, -3.281472, 1, 1, 1, 1, 1,
-1.241445, 1.327593, -1.371208, 1, 1, 1, 1, 1,
-1.239034, 0.5898001, -0.8683787, 1, 1, 1, 1, 1,
-1.224535, -1.829281, -1.976566, 1, 1, 1, 1, 1,
-1.2214, 0.6592174, -1.98073, 1, 1, 1, 1, 1,
-1.218902, 0.09795012, -0.5548968, 1, 1, 1, 1, 1,
-1.216264, -0.5581816, -3.236764, 1, 1, 1, 1, 1,
-1.215901, 0.05057913, -1.39921, 1, 1, 1, 1, 1,
-1.215631, -0.5473868, -4.013627, 1, 1, 1, 1, 1,
-1.211188, -0.6288841, -1.882522, 1, 1, 1, 1, 1,
-1.189874, -1.101009, -1.953445, 0, 0, 1, 1, 1,
-1.185893, -0.2536093, -0.3333546, 1, 0, 0, 1, 1,
-1.185036, -0.04332611, -0.9689159, 1, 0, 0, 1, 1,
-1.180776, -2.112591, -1.911061, 1, 0, 0, 1, 1,
-1.177719, 2.023299, 1.368188, 1, 0, 0, 1, 1,
-1.176383, 1.110341, -1.011571, 1, 0, 0, 1, 1,
-1.155098, -1.459788, -0.9403967, 0, 0, 0, 1, 1,
-1.148534, -0.6799966, -1.304578, 0, 0, 0, 1, 1,
-1.141959, -0.2702945, -0.09802199, 0, 0, 0, 1, 1,
-1.13761, 1.031596, -1.00935, 0, 0, 0, 1, 1,
-1.125581, -0.3508064, -3.082259, 0, 0, 0, 1, 1,
-1.125531, 0.5889668, -1.950555, 0, 0, 0, 1, 1,
-1.125074, -0.820463, -1.992237, 0, 0, 0, 1, 1,
-1.123938, -0.4006074, -1.687983, 1, 1, 1, 1, 1,
-1.123306, 0.589044, -1.907277, 1, 1, 1, 1, 1,
-1.121904, -0.5719575, -2.328701, 1, 1, 1, 1, 1,
-1.113286, -0.3707867, -3.008427, 1, 1, 1, 1, 1,
-1.10974, 0.04260745, -0.02107662, 1, 1, 1, 1, 1,
-1.105352, -0.1358586, -1.719958, 1, 1, 1, 1, 1,
-1.090587, -0.9952229, -1.830451, 1, 1, 1, 1, 1,
-1.089391, -0.2227292, -0.6576326, 1, 1, 1, 1, 1,
-1.081928, -0.3491628, -2.324154, 1, 1, 1, 1, 1,
-1.067721, -1.651081, -1.233775, 1, 1, 1, 1, 1,
-1.065117, -0.5080163, 0.2527311, 1, 1, 1, 1, 1,
-1.064446, 0.1571984, -3.957153, 1, 1, 1, 1, 1,
-1.061044, -0.07814854, -2.378243, 1, 1, 1, 1, 1,
-1.053624, 0.4208035, -1.69965, 1, 1, 1, 1, 1,
-1.053478, 2.488513, -1.153452, 1, 1, 1, 1, 1,
-1.040601, -1.187904, -3.564578, 0, 0, 1, 1, 1,
-1.033141, -0.4782039, -1.691728, 1, 0, 0, 1, 1,
-1.030101, 0.7682788, -0.1648456, 1, 0, 0, 1, 1,
-1.028551, 0.6789454, -0.6715142, 1, 0, 0, 1, 1,
-1.025589, -0.2051593, -2.151772, 1, 0, 0, 1, 1,
-1.025485, -0.1792581, -1.459587, 1, 0, 0, 1, 1,
-1.024701, 0.8309262, -1.801321, 0, 0, 0, 1, 1,
-1.024079, -1.216551, -2.332829, 0, 0, 0, 1, 1,
-1.018423, -0.6961699, -2.548398, 0, 0, 0, 1, 1,
-1.017412, 0.3858898, -1.171399, 0, 0, 0, 1, 1,
-1.008531, 0.3601408, -1.581936, 0, 0, 0, 1, 1,
-1.006886, 1.158022, -1.961876, 0, 0, 0, 1, 1,
-1.002592, 0.664224, -0.7218609, 0, 0, 0, 1, 1,
-0.9988412, 0.5445385, -2.04083, 1, 1, 1, 1, 1,
-0.9975626, 0.9664007, -2.533974, 1, 1, 1, 1, 1,
-0.9966156, 0.2692094, -1.616386, 1, 1, 1, 1, 1,
-0.9933911, 0.147689, -2.910507, 1, 1, 1, 1, 1,
-0.9846285, 0.4104472, -1.82255, 1, 1, 1, 1, 1,
-0.9804266, -0.9600202, -1.894749, 1, 1, 1, 1, 1,
-0.9777669, -0.8196158, -3.143506, 1, 1, 1, 1, 1,
-0.975437, -0.0237398, -2.572811, 1, 1, 1, 1, 1,
-0.9753958, -1.0974, -4.058536, 1, 1, 1, 1, 1,
-0.9657407, 1.819429, -0.2460693, 1, 1, 1, 1, 1,
-0.9593472, -0.4258291, -3.429557, 1, 1, 1, 1, 1,
-0.9532577, 1.030241, -1.885546, 1, 1, 1, 1, 1,
-0.953025, 1.62595, -2.581964, 1, 1, 1, 1, 1,
-0.9494354, 0.6589879, -1.711748, 1, 1, 1, 1, 1,
-0.9472951, -0.6213157, -2.563701, 1, 1, 1, 1, 1,
-0.9332244, -0.5474085, -2.705034, 0, 0, 1, 1, 1,
-0.9326321, 1.075042, -0.6519628, 1, 0, 0, 1, 1,
-0.9306743, -0.6460896, -0.5198417, 1, 0, 0, 1, 1,
-0.9256846, -1.344535, -0.8526763, 1, 0, 0, 1, 1,
-0.9256726, -0.8730257, -1.884876, 1, 0, 0, 1, 1,
-0.9216571, 1.036587, -0.06055006, 1, 0, 0, 1, 1,
-0.9197835, -1.674693, -3.755091, 0, 0, 0, 1, 1,
-0.9079195, 0.4314224, 0.3319667, 0, 0, 0, 1, 1,
-0.8995807, -0.9133327, -2.172203, 0, 0, 0, 1, 1,
-0.8990927, -2.128076, -2.711788, 0, 0, 0, 1, 1,
-0.8964888, 0.2380939, -1.502383, 0, 0, 0, 1, 1,
-0.8960629, 0.5776867, -1.643498, 0, 0, 0, 1, 1,
-0.8869835, -1.072689, -3.537602, 0, 0, 0, 1, 1,
-0.8854268, -0.526112, -0.1595778, 1, 1, 1, 1, 1,
-0.8794119, 0.2927136, -1.544673, 1, 1, 1, 1, 1,
-0.8774001, -0.4005412, -2.017024, 1, 1, 1, 1, 1,
-0.8582295, 2.097496, 0.8860537, 1, 1, 1, 1, 1,
-0.8551297, 0.4991713, 0.6112185, 1, 1, 1, 1, 1,
-0.848419, -1.092462, -3.971159, 1, 1, 1, 1, 1,
-0.8426351, -0.9336521, -2.696963, 1, 1, 1, 1, 1,
-0.8396821, 1.450526, -0.00304331, 1, 1, 1, 1, 1,
-0.8389391, 1.385075, 1.002677, 1, 1, 1, 1, 1,
-0.8382106, -1.060709, -4.283069, 1, 1, 1, 1, 1,
-0.8382092, -0.6359318, -3.1175, 1, 1, 1, 1, 1,
-0.8370057, -1.403356, -1.346718, 1, 1, 1, 1, 1,
-0.833846, -1.717052, -0.4870318, 1, 1, 1, 1, 1,
-0.8192108, 0.6206292, -0.2745304, 1, 1, 1, 1, 1,
-0.8185463, 1.048807, -1.857795, 1, 1, 1, 1, 1,
-0.8178894, -0.8072853, -2.635972, 0, 0, 1, 1, 1,
-0.8144054, -0.1632903, -2.757782, 1, 0, 0, 1, 1,
-0.8104415, 0.2683833, -3.265767, 1, 0, 0, 1, 1,
-0.8065612, 1.36189, -1.267897, 1, 0, 0, 1, 1,
-0.7940301, 0.4769391, -2.24211, 1, 0, 0, 1, 1,
-0.7899386, 1.289025, -1.316464, 1, 0, 0, 1, 1,
-0.786872, 1.32618, -2.060172, 0, 0, 0, 1, 1,
-0.7862024, 0.8096713, -1.215529, 0, 0, 0, 1, 1,
-0.7841606, 0.5732154, -0.4966778, 0, 0, 0, 1, 1,
-0.782468, -0.4433282, -1.913928, 0, 0, 0, 1, 1,
-0.7810584, 1.94161, -0.9140367, 0, 0, 0, 1, 1,
-0.7771263, 1.668545, -1.118624, 0, 0, 0, 1, 1,
-0.7742732, 1.143229, 0.4534735, 0, 0, 0, 1, 1,
-0.7724065, 0.09293008, -2.759575, 1, 1, 1, 1, 1,
-0.7713414, 1.375247, -0.05242454, 1, 1, 1, 1, 1,
-0.7653993, -0.03560331, -1.536079, 1, 1, 1, 1, 1,
-0.7612757, -0.4979905, -0.3679708, 1, 1, 1, 1, 1,
-0.7571824, 0.5083146, 0.2277335, 1, 1, 1, 1, 1,
-0.7546499, -1.189791, -1.613196, 1, 1, 1, 1, 1,
-0.7523493, 1.001564, 0.1575138, 1, 1, 1, 1, 1,
-0.7482685, 0.2974876, 0.5028197, 1, 1, 1, 1, 1,
-0.7446145, -0.07674144, -1.43976, 1, 1, 1, 1, 1,
-0.7416751, 1.319721, -0.4480993, 1, 1, 1, 1, 1,
-0.7354877, 0.1305131, -0.4360832, 1, 1, 1, 1, 1,
-0.7348501, -2.646368, -3.40763, 1, 1, 1, 1, 1,
-0.7339631, -0.3345482, -2.65394, 1, 1, 1, 1, 1,
-0.7306286, 0.5411527, -0.1443876, 1, 1, 1, 1, 1,
-0.7284392, 1.197858, -2.133507, 1, 1, 1, 1, 1,
-0.7282483, -0.7514707, -2.363468, 0, 0, 1, 1, 1,
-0.7251269, 0.8146563, -0.5356734, 1, 0, 0, 1, 1,
-0.7235368, -0.4687673, -1.454271, 1, 0, 0, 1, 1,
-0.7221729, 0.8728316, -2.230312, 1, 0, 0, 1, 1,
-0.7210808, 0.5463024, -1.897065, 1, 0, 0, 1, 1,
-0.7179933, 0.2338728, -0.1062677, 1, 0, 0, 1, 1,
-0.7127155, -0.7823799, -2.754606, 0, 0, 0, 1, 1,
-0.7125917, -1.559935, -2.618252, 0, 0, 0, 1, 1,
-0.7083628, 0.4765065, -0.6657881, 0, 0, 0, 1, 1,
-0.7038429, -0.04187203, -1.533157, 0, 0, 0, 1, 1,
-0.7016844, 1.28799, -0.8526044, 0, 0, 0, 1, 1,
-0.6969205, 0.8938112, 0.6838343, 0, 0, 0, 1, 1,
-0.6962469, -0.6485918, -1.407436, 0, 0, 0, 1, 1,
-0.6928692, -0.7717662, -2.100522, 1, 1, 1, 1, 1,
-0.6892691, 0.6419663, 0.6233699, 1, 1, 1, 1, 1,
-0.6883521, -0.7132679, -3.445464, 1, 1, 1, 1, 1,
-0.6833638, -0.531723, -2.261016, 1, 1, 1, 1, 1,
-0.6772883, 1.4527, 0.9683076, 1, 1, 1, 1, 1,
-0.6763043, -0.6549698, -2.991434, 1, 1, 1, 1, 1,
-0.6739641, -2.331624, -2.983437, 1, 1, 1, 1, 1,
-0.6723813, -0.7505332, -2.508184, 1, 1, 1, 1, 1,
-0.6665872, -2.37116, -2.23859, 1, 1, 1, 1, 1,
-0.6645986, 0.08409226, -1.205184, 1, 1, 1, 1, 1,
-0.6574598, 0.03094007, -2.223222, 1, 1, 1, 1, 1,
-0.6573294, -1.129935, -1.989543, 1, 1, 1, 1, 1,
-0.6566145, -1.55225, -3.749477, 1, 1, 1, 1, 1,
-0.6552824, 0.8586998, 0.6759451, 1, 1, 1, 1, 1,
-0.6549072, -1.132034, -2.409586, 1, 1, 1, 1, 1,
-0.6543776, -0.1192376, -1.200805, 0, 0, 1, 1, 1,
-0.6514216, 1.472558, -1.663751, 1, 0, 0, 1, 1,
-0.6498346, -1.258169, -0.7020118, 1, 0, 0, 1, 1,
-0.6497175, -1.920835, -2.625006, 1, 0, 0, 1, 1,
-0.6438951, 1.520254, -0.391887, 1, 0, 0, 1, 1,
-0.640402, -0.9754598, -2.556108, 1, 0, 0, 1, 1,
-0.6376822, 0.1238754, -3.931748, 0, 0, 0, 1, 1,
-0.6331761, 0.822929, -2.453419, 0, 0, 0, 1, 1,
-0.6277351, -0.0007567066, -1.949942, 0, 0, 0, 1, 1,
-0.6185376, -1.863389, -3.50403, 0, 0, 0, 1, 1,
-0.6148314, 0.1443429, 0.633678, 0, 0, 0, 1, 1,
-0.6119037, 0.2585192, -2.191692, 0, 0, 0, 1, 1,
-0.6090922, -0.3826351, -2.351616, 0, 0, 0, 1, 1,
-0.6069478, -0.9350874, -1.862706, 1, 1, 1, 1, 1,
-0.6045188, -0.2191955, -0.1388131, 1, 1, 1, 1, 1,
-0.6043616, -0.7671435, -2.059338, 1, 1, 1, 1, 1,
-0.6041148, -0.3438455, -0.7094423, 1, 1, 1, 1, 1,
-0.6035382, 0.7389807, 0.2067316, 1, 1, 1, 1, 1,
-0.6006336, -0.2702722, -0.7344243, 1, 1, 1, 1, 1,
-0.6003468, 1.180663, 0.1661775, 1, 1, 1, 1, 1,
-0.6000007, -0.3542358, -2.487745, 1, 1, 1, 1, 1,
-0.5949924, 1.165907, -2.175537, 1, 1, 1, 1, 1,
-0.5926394, 2.158778, 1.032336, 1, 1, 1, 1, 1,
-0.5917915, 0.5438204, -1.069216, 1, 1, 1, 1, 1,
-0.5899487, -0.7943673, -3.564965, 1, 1, 1, 1, 1,
-0.585576, -2.296641, -3.929545, 1, 1, 1, 1, 1,
-0.5808302, -0.708185, -2.066929, 1, 1, 1, 1, 1,
-0.5787119, 2.250999, -1.939307, 1, 1, 1, 1, 1,
-0.5747944, -0.9278753, -3.709882, 0, 0, 1, 1, 1,
-0.5725777, 0.7165487, -1.767991, 1, 0, 0, 1, 1,
-0.5710834, 1.259275, -0.6992022, 1, 0, 0, 1, 1,
-0.5677155, 0.4200416, -1.349539, 1, 0, 0, 1, 1,
-0.5665073, 2.216688, -0.810648, 1, 0, 0, 1, 1,
-0.564405, 1.151035, -0.7318531, 1, 0, 0, 1, 1,
-0.5643304, 0.09661815, -0.957189, 0, 0, 0, 1, 1,
-0.5618797, 0.9469941, 1.977274, 0, 0, 0, 1, 1,
-0.5615517, -0.4940139, -1.5778, 0, 0, 0, 1, 1,
-0.5595365, 0.585855, -0.4291419, 0, 0, 0, 1, 1,
-0.5516344, -1.29009, -2.133251, 0, 0, 0, 1, 1,
-0.5437443, 1.359319, -1.477358, 0, 0, 0, 1, 1,
-0.5421237, -0.3730254, -1.822564, 0, 0, 0, 1, 1,
-0.5398454, 0.0674565, -1.074914, 1, 1, 1, 1, 1,
-0.534143, -0.9387443, -1.978226, 1, 1, 1, 1, 1,
-0.5339081, -1.242105, -2.299426, 1, 1, 1, 1, 1,
-0.5333334, 1.004706, 1.683557, 1, 1, 1, 1, 1,
-0.5284633, -0.7279895, -1.48793, 1, 1, 1, 1, 1,
-0.5177198, -0.4572249, -1.409752, 1, 1, 1, 1, 1,
-0.5166578, 2.089917, -0.5719484, 1, 1, 1, 1, 1,
-0.516312, -0.7031601, -0.1955474, 1, 1, 1, 1, 1,
-0.5121393, -0.3345609, -1.775361, 1, 1, 1, 1, 1,
-0.511561, 1.438836, -1.698688, 1, 1, 1, 1, 1,
-0.5115276, 0.6081432, 0.8007661, 1, 1, 1, 1, 1,
-0.5045108, 0.9664765, -1.234956, 1, 1, 1, 1, 1,
-0.5022381, -0.1491411, -2.317531, 1, 1, 1, 1, 1,
-0.5003532, 0.04388673, -2.230567, 1, 1, 1, 1, 1,
-0.496267, -0.3020989, -2.603063, 1, 1, 1, 1, 1,
-0.496036, -0.7596812, -2.27855, 0, 0, 1, 1, 1,
-0.4939131, -0.787456, -3.878283, 1, 0, 0, 1, 1,
-0.4928097, -0.7704278, -2.63892, 1, 0, 0, 1, 1,
-0.4887563, 0.9609776, -0.8135819, 1, 0, 0, 1, 1,
-0.4858758, -0.3257707, -3.489229, 1, 0, 0, 1, 1,
-0.4815351, 0.6221502, 0.3878343, 1, 0, 0, 1, 1,
-0.4761131, -1.538913, -2.932085, 0, 0, 0, 1, 1,
-0.4697226, -1.370472, -2.978423, 0, 0, 0, 1, 1,
-0.4690596, -1.31445, -1.921447, 0, 0, 0, 1, 1,
-0.4628423, 0.9098465, -1.213097, 0, 0, 0, 1, 1,
-0.4623276, 1.098482, 0.303813, 0, 0, 0, 1, 1,
-0.4540345, 0.3241178, -0.784484, 0, 0, 0, 1, 1,
-0.4535473, 0.1159704, -2.860793, 0, 0, 0, 1, 1,
-0.4497664, 2.271498, -0.7067783, 1, 1, 1, 1, 1,
-0.4474578, 0.2771579, -0.4538225, 1, 1, 1, 1, 1,
-0.4410762, -0.634154, -2.43237, 1, 1, 1, 1, 1,
-0.4405168, 0.08929372, -3.350519, 1, 1, 1, 1, 1,
-0.4379472, 1.106723, -0.7583262, 1, 1, 1, 1, 1,
-0.4365171, -0.7763647, -3.5578, 1, 1, 1, 1, 1,
-0.4355325, 0.6979804, -0.2132363, 1, 1, 1, 1, 1,
-0.4076417, 0.4571588, 0.9152514, 1, 1, 1, 1, 1,
-0.406902, -1.965614, -4.27873, 1, 1, 1, 1, 1,
-0.3992813, 0.687035, -0.6548886, 1, 1, 1, 1, 1,
-0.3948716, -0.109392, -2.278872, 1, 1, 1, 1, 1,
-0.3930246, -1.170717, -2.708836, 1, 1, 1, 1, 1,
-0.3905235, -0.486924, -2.772152, 1, 1, 1, 1, 1,
-0.3880438, 1.179834, 0.3785016, 1, 1, 1, 1, 1,
-0.3859753, -0.3539322, -3.762553, 1, 1, 1, 1, 1,
-0.3851961, -0.2137937, -1.278687, 0, 0, 1, 1, 1,
-0.3825364, 1.759423, -1.55263, 1, 0, 0, 1, 1,
-0.3824445, 1.220565, -0.9609389, 1, 0, 0, 1, 1,
-0.3739008, -0.5135514, -1.90011, 1, 0, 0, 1, 1,
-0.3695691, -1.66195, -3.781565, 1, 0, 0, 1, 1,
-0.3680967, -0.108786, -1.997189, 1, 0, 0, 1, 1,
-0.363634, 0.5359771, -0.7248453, 0, 0, 0, 1, 1,
-0.3537109, 1.42472, -0.4285471, 0, 0, 0, 1, 1,
-0.3522649, -0.8123769, -2.001542, 0, 0, 0, 1, 1,
-0.3509209, -0.5023123, -3.297742, 0, 0, 0, 1, 1,
-0.3478241, 0.4401846, -1.37518, 0, 0, 0, 1, 1,
-0.347627, 0.5688195, 1.182512, 0, 0, 0, 1, 1,
-0.3461707, -2.145051, -2.996812, 0, 0, 0, 1, 1,
-0.3452055, 0.7115678, -0.2838271, 1, 1, 1, 1, 1,
-0.3438202, 1.901729, -0.8322134, 1, 1, 1, 1, 1,
-0.3412603, -2.886213, -3.451381, 1, 1, 1, 1, 1,
-0.3410822, 1.226076, -0.7016635, 1, 1, 1, 1, 1,
-0.3381912, -0.2994051, -3.208016, 1, 1, 1, 1, 1,
-0.3316458, -1.132893, -1.733129, 1, 1, 1, 1, 1,
-0.3302961, 1.583141, 0.4512488, 1, 1, 1, 1, 1,
-0.3287325, -0.6475332, -5.077943, 1, 1, 1, 1, 1,
-0.3283526, 0.7517342, 1.315252, 1, 1, 1, 1, 1,
-0.3239702, -0.2129251, -0.6953071, 1, 1, 1, 1, 1,
-0.3197915, -1.135552, -3.739087, 1, 1, 1, 1, 1,
-0.3189645, 1.487808, 0.1265856, 1, 1, 1, 1, 1,
-0.3187427, -1.81241, -3.948542, 1, 1, 1, 1, 1,
-0.318708, -1.827028, -3.68591, 1, 1, 1, 1, 1,
-0.3158661, 0.3665531, -2.098539, 1, 1, 1, 1, 1,
-0.3072379, 1.046646, 0.4030644, 0, 0, 1, 1, 1,
-0.300578, -0.3746475, -1.586451, 1, 0, 0, 1, 1,
-0.3002204, 0.4023879, -0.4361267, 1, 0, 0, 1, 1,
-0.2993419, -0.07802105, -2.477052, 1, 0, 0, 1, 1,
-0.2952454, 0.796187, -0.1582684, 1, 0, 0, 1, 1,
-0.294496, -1.22538, -3.84341, 1, 0, 0, 1, 1,
-0.2882929, 0.1648825, -0.337805, 0, 0, 0, 1, 1,
-0.280495, -0.9427208, -3.231342, 0, 0, 0, 1, 1,
-0.2784207, 0.1372154, 0.7189484, 0, 0, 0, 1, 1,
-0.27819, -0.5511088, -4.050651, 0, 0, 0, 1, 1,
-0.2765653, 1.15784, -1.24052, 0, 0, 0, 1, 1,
-0.2753866, -0.0124213, -1.323988, 0, 0, 0, 1, 1,
-0.2751324, -0.4239474, -2.696696, 0, 0, 0, 1, 1,
-0.2725273, 1.613999, -1.881661, 1, 1, 1, 1, 1,
-0.2697485, 0.59474, -0.4830371, 1, 1, 1, 1, 1,
-0.2687787, -1.108898, -3.925217, 1, 1, 1, 1, 1,
-0.2681615, -0.4237455, -2.647746, 1, 1, 1, 1, 1,
-0.2618649, 0.8060325, -0.8172195, 1, 1, 1, 1, 1,
-0.2596618, 0.7400553, 1.645391, 1, 1, 1, 1, 1,
-0.2585418, 0.07517988, -0.743634, 1, 1, 1, 1, 1,
-0.2454978, 2.505901, -1.074553, 1, 1, 1, 1, 1,
-0.243558, -0.1019521, -2.723276, 1, 1, 1, 1, 1,
-0.2410222, 0.8163871, -2.351688, 1, 1, 1, 1, 1,
-0.2409413, -1.64934, -2.962486, 1, 1, 1, 1, 1,
-0.239328, 0.6695855, -0.08569682, 1, 1, 1, 1, 1,
-0.238935, -0.1195773, -1.74195, 1, 1, 1, 1, 1,
-0.2367854, -0.5285231, -1.425866, 1, 1, 1, 1, 1,
-0.2327588, 0.2407142, 0.2844793, 1, 1, 1, 1, 1,
-0.2310974, -1.136121, -2.966702, 0, 0, 1, 1, 1,
-0.2300572, 1.01121, 0.2587925, 1, 0, 0, 1, 1,
-0.2294706, -0.240129, -2.295687, 1, 0, 0, 1, 1,
-0.2285669, 1.560455, -1.224308, 1, 0, 0, 1, 1,
-0.2253214, -0.5264733, -4.91258, 1, 0, 0, 1, 1,
-0.2228436, 0.6962021, -1.088531, 1, 0, 0, 1, 1,
-0.2223903, -0.9431744, -2.207224, 0, 0, 0, 1, 1,
-0.2189555, -2.246156, -3.667506, 0, 0, 0, 1, 1,
-0.2182068, -0.5392984, -2.023357, 0, 0, 0, 1, 1,
-0.2159801, -0.996816, -2.521041, 0, 0, 0, 1, 1,
-0.2135746, -0.940738, -3.730286, 0, 0, 0, 1, 1,
-0.2128355, -1.179138, -2.197642, 0, 0, 0, 1, 1,
-0.2115817, -0.7569509, -2.764758, 0, 0, 0, 1, 1,
-0.2091879, -1.797132, -3.367867, 1, 1, 1, 1, 1,
-0.2057322, -1.257588, -2.542803, 1, 1, 1, 1, 1,
-0.201968, -0.3117668, -0.9697261, 1, 1, 1, 1, 1,
-0.2019217, -0.4462703, -2.175203, 1, 1, 1, 1, 1,
-0.1969575, -1.081713, -3.623872, 1, 1, 1, 1, 1,
-0.1952698, 1.03629, 0.6029603, 1, 1, 1, 1, 1,
-0.1947407, -0.4032426, -1.818905, 1, 1, 1, 1, 1,
-0.1924146, 1.22636, 0.3808142, 1, 1, 1, 1, 1,
-0.1908052, 0.4124193, -2.203873, 1, 1, 1, 1, 1,
-0.1881635, 1.131067, -0.3694792, 1, 1, 1, 1, 1,
-0.1873893, -1.131827, -3.093822, 1, 1, 1, 1, 1,
-0.1863776, -0.2957708, -2.891386, 1, 1, 1, 1, 1,
-0.1834608, -0.2114633, -2.768548, 1, 1, 1, 1, 1,
-0.1824559, 0.1180411, 0.3024443, 1, 1, 1, 1, 1,
-0.1818814, -0.09727632, -2.657871, 1, 1, 1, 1, 1,
-0.1751057, -1.461359, -2.256275, 0, 0, 1, 1, 1,
-0.173727, 1.030264, 0.4335161, 1, 0, 0, 1, 1,
-0.1718708, -0.2152239, -1.914261, 1, 0, 0, 1, 1,
-0.1601261, 0.4598131, 0.1787163, 1, 0, 0, 1, 1,
-0.157882, 0.6649475, -0.4458464, 1, 0, 0, 1, 1,
-0.1570446, -0.2738236, -3.704311, 1, 0, 0, 1, 1,
-0.1514563, -0.5351843, -4.143165, 0, 0, 0, 1, 1,
-0.1432756, 0.2147821, -1.570013, 0, 0, 0, 1, 1,
-0.1390901, -0.3548394, -3.183806, 0, 0, 0, 1, 1,
-0.1363949, 1.470128, -1.470623, 0, 0, 0, 1, 1,
-0.1342298, 1.682137, -0.07368211, 0, 0, 0, 1, 1,
-0.1290723, -0.2126396, -1.332418, 0, 0, 0, 1, 1,
-0.126959, -0.4398622, -3.199143, 0, 0, 0, 1, 1,
-0.1265695, 0.9751492, -1.257717, 1, 1, 1, 1, 1,
-0.1215272, 1.566089, 0.09327982, 1, 1, 1, 1, 1,
-0.1178138, 0.1012509, -1.478024, 1, 1, 1, 1, 1,
-0.1165686, -1.973627, -4.507544, 1, 1, 1, 1, 1,
-0.112949, 0.2509759, -0.4838592, 1, 1, 1, 1, 1,
-0.1108145, -0.4742458, -0.5718938, 1, 1, 1, 1, 1,
-0.1082321, 0.2313168, -1.930793, 1, 1, 1, 1, 1,
-0.1065938, -2.247328, -2.149911, 1, 1, 1, 1, 1,
-0.1016457, -1.477272, -2.819411, 1, 1, 1, 1, 1,
-0.09843233, -0.381607, -2.781258, 1, 1, 1, 1, 1,
-0.09653919, -0.275656, -1.80694, 1, 1, 1, 1, 1,
-0.09630539, -1.55197, -2.717513, 1, 1, 1, 1, 1,
-0.09604157, 0.06601662, -0.9163811, 1, 1, 1, 1, 1,
-0.09426222, -0.2361173, -2.677257, 1, 1, 1, 1, 1,
-0.0901853, 1.280229, -0.3352416, 1, 1, 1, 1, 1,
-0.08698745, 1.090621, -1.779919, 0, 0, 1, 1, 1,
-0.08629549, -0.6836618, -3.826027, 1, 0, 0, 1, 1,
-0.08475735, -0.3015361, -3.63213, 1, 0, 0, 1, 1,
-0.08177775, 0.789855, 1.631496, 1, 0, 0, 1, 1,
-0.07751911, 0.07239959, 1.316908, 1, 0, 0, 1, 1,
-0.0741994, -0.5031499, -2.656387, 1, 0, 0, 1, 1,
-0.07242261, 0.9172575, -0.01004829, 0, 0, 0, 1, 1,
-0.06856337, -0.7973503, -2.929848, 0, 0, 0, 1, 1,
-0.06807303, 2.302695, -0.6059976, 0, 0, 0, 1, 1,
-0.06641396, -1.057901, -1.532187, 0, 0, 0, 1, 1,
-0.06441309, 0.2396723, -0.2839879, 0, 0, 0, 1, 1,
-0.06440842, -1.35957, -4.205831, 0, 0, 0, 1, 1,
-0.06330517, 0.4421459, -1.159673, 0, 0, 0, 1, 1,
-0.0628225, -0.9686485, -3.599595, 1, 1, 1, 1, 1,
-0.05839561, -1.501828, -2.359663, 1, 1, 1, 1, 1,
-0.05419252, 0.8189207, -0.1462409, 1, 1, 1, 1, 1,
-0.05213876, -1.460432, -1.889886, 1, 1, 1, 1, 1,
-0.04950031, -0.6194448, -1.91854, 1, 1, 1, 1, 1,
-0.04528137, -0.4875519, -4.182039, 1, 1, 1, 1, 1,
-0.04411785, 1.084053, -0.7559823, 1, 1, 1, 1, 1,
-0.04060882, -1.397188, -3.729432, 1, 1, 1, 1, 1,
-0.04021282, -0.2484062, -3.234598, 1, 1, 1, 1, 1,
-0.03852303, -0.01271461, -4.318844, 1, 1, 1, 1, 1,
-0.02488368, 0.3251061, 0.3760945, 1, 1, 1, 1, 1,
-0.003315593, 0.02612872, -2.1646, 1, 1, 1, 1, 1,
-0.002250745, -0.1561761, -2.908, 1, 1, 1, 1, 1,
3.102237e-05, 1.765963, -1.08702, 1, 1, 1, 1, 1,
0.002405779, 0.7243583, -0.732488, 1, 1, 1, 1, 1,
0.003837784, -0.2085709, 3.034574, 0, 0, 1, 1, 1,
0.005855154, -1.627003, 1.373003, 1, 0, 0, 1, 1,
0.008245735, 0.1598046, 1.143675, 1, 0, 0, 1, 1,
0.009272172, -0.005644858, 1.028657, 1, 0, 0, 1, 1,
0.01181513, -0.996923, 3.170164, 1, 0, 0, 1, 1,
0.01277963, 0.2163324, 0.3993597, 1, 0, 0, 1, 1,
0.01732273, 0.1185636, -0.4565574, 0, 0, 0, 1, 1,
0.02106812, 0.09185908, 0.3956809, 0, 0, 0, 1, 1,
0.02144403, -0.4015249, 1.991964, 0, 0, 0, 1, 1,
0.0219912, -0.3732352, 3.948598, 0, 0, 0, 1, 1,
0.02577939, 0.9224704, -0.02836068, 0, 0, 0, 1, 1,
0.02739761, 0.9752122, 0.9661019, 0, 0, 0, 1, 1,
0.03835839, 0.2748395, -0.2458771, 0, 0, 0, 1, 1,
0.04689028, 1.217126, 0.480594, 1, 1, 1, 1, 1,
0.04810177, -1.275802, 2.848531, 1, 1, 1, 1, 1,
0.05082367, -1.278065, 5.534146, 1, 1, 1, 1, 1,
0.05241166, -0.1507292, 0.7760977, 1, 1, 1, 1, 1,
0.05311295, 0.5488878, 2.193017, 1, 1, 1, 1, 1,
0.05354534, -0.2589625, 3.225205, 1, 1, 1, 1, 1,
0.06454219, 0.02901995, 2.838846, 1, 1, 1, 1, 1,
0.06548906, -0.260594, 1.936762, 1, 1, 1, 1, 1,
0.07247994, -0.2393569, 2.077587, 1, 1, 1, 1, 1,
0.07348831, -0.5353221, 2.34616, 1, 1, 1, 1, 1,
0.07437459, -1.494912, 3.21238, 1, 1, 1, 1, 1,
0.07604181, 1.898365, -1.419834, 1, 1, 1, 1, 1,
0.07630412, 1.359937, -0.152275, 1, 1, 1, 1, 1,
0.07720425, 1.682459, -1.357323, 1, 1, 1, 1, 1,
0.07880041, -1.156931, 2.594166, 1, 1, 1, 1, 1,
0.08140653, 2.020588, 1.020012, 0, 0, 1, 1, 1,
0.08630566, -1.442897, 4.168993, 1, 0, 0, 1, 1,
0.08750963, -0.6217235, 4.229177, 1, 0, 0, 1, 1,
0.08860483, -1.004752, 0.6251751, 1, 0, 0, 1, 1,
0.09146938, 1.062583, 1.261701, 1, 0, 0, 1, 1,
0.09427795, 0.6281276, 0.6373514, 1, 0, 0, 1, 1,
0.09777286, 2.482282, -0.7521282, 0, 0, 0, 1, 1,
0.09943628, 0.2379921, -0.5117366, 0, 0, 0, 1, 1,
0.09978838, 0.1281278, 1.433159, 0, 0, 0, 1, 1,
0.1000207, 0.9314342, -0.4816057, 0, 0, 0, 1, 1,
0.1019005, -0.3530043, 1.998247, 0, 0, 0, 1, 1,
0.107465, -0.4379402, 4.030725, 0, 0, 0, 1, 1,
0.1082376, -1.022298, 4.712958, 0, 0, 0, 1, 1,
0.1095709, -1.497903, 0.8455375, 1, 1, 1, 1, 1,
0.1098833, 0.5195035, -0.876433, 1, 1, 1, 1, 1,
0.1110995, -1.816007, 2.766474, 1, 1, 1, 1, 1,
0.1112721, -1.320963, 1.113951, 1, 1, 1, 1, 1,
0.1154244, 1.381845, 1.674464, 1, 1, 1, 1, 1,
0.1165785, 0.4806764, -1.300611, 1, 1, 1, 1, 1,
0.118663, 0.7768674, 0.08050406, 1, 1, 1, 1, 1,
0.1215297, 0.2391888, 0.07311018, 1, 1, 1, 1, 1,
0.1225051, 0.9782123, 0.1631784, 1, 1, 1, 1, 1,
0.1236477, -0.3481821, 3.3353, 1, 1, 1, 1, 1,
0.127777, -0.6923711, 4.089808, 1, 1, 1, 1, 1,
0.1295765, 0.5137098, 0.2815357, 1, 1, 1, 1, 1,
0.1348379, 1.233669, -1.178178, 1, 1, 1, 1, 1,
0.1350224, 0.9405353, 1.373126, 1, 1, 1, 1, 1,
0.1411916, 1.81159, -0.9400429, 1, 1, 1, 1, 1,
0.1436183, 0.7128718, 0.5408252, 0, 0, 1, 1, 1,
0.1453345, -0.7374277, 2.143174, 1, 0, 0, 1, 1,
0.1458479, -0.5421607, 3.257218, 1, 0, 0, 1, 1,
0.1509711, -0.6745934, 2.087113, 1, 0, 0, 1, 1,
0.1546448, 0.2308652, 0.07533739, 1, 0, 0, 1, 1,
0.156275, 1.365295, 0.6123562, 1, 0, 0, 1, 1,
0.1591132, -0.6235185, 3.592122, 0, 0, 0, 1, 1,
0.1594923, -1.197417, 3.309101, 0, 0, 0, 1, 1,
0.160318, -0.4267427, 3.09768, 0, 0, 0, 1, 1,
0.1605156, 0.7781565, 0.7846071, 0, 0, 0, 1, 1,
0.1649642, 1.02358, 1.441791, 0, 0, 0, 1, 1,
0.167279, 0.6955189, 0.5827374, 0, 0, 0, 1, 1,
0.1710501, -1.286436, 2.510103, 0, 0, 0, 1, 1,
0.172873, -0.03062336, 2.18491, 1, 1, 1, 1, 1,
0.1754571, -1.058779, 3.827897, 1, 1, 1, 1, 1,
0.1758271, 0.4246515, 0.6256245, 1, 1, 1, 1, 1,
0.176988, 0.7536715, 0.2510572, 1, 1, 1, 1, 1,
0.1795497, 0.01504179, 2.653443, 1, 1, 1, 1, 1,
0.180383, 0.3119397, 1.61753, 1, 1, 1, 1, 1,
0.1833145, 0.8784339, -0.2900624, 1, 1, 1, 1, 1,
0.1898338, -0.7801095, 4.474511, 1, 1, 1, 1, 1,
0.1930945, -2.637566, 2.382529, 1, 1, 1, 1, 1,
0.1947898, 1.649295, 0.3027691, 1, 1, 1, 1, 1,
0.196089, 0.6399901, -0.578796, 1, 1, 1, 1, 1,
0.1988144, -0.1382151, 2.327864, 1, 1, 1, 1, 1,
0.1996052, 0.9287157, -0.3685747, 1, 1, 1, 1, 1,
0.2061974, -0.2836251, 3.231061, 1, 1, 1, 1, 1,
0.2091811, 0.2890763, 1.105057, 1, 1, 1, 1, 1,
0.214323, -1.486724, 3.284708, 0, 0, 1, 1, 1,
0.2146635, -0.03030584, 2.587664, 1, 0, 0, 1, 1,
0.2218743, -2.618071, 4.987005, 1, 0, 0, 1, 1,
0.233455, 2.111664, 0.005904273, 1, 0, 0, 1, 1,
0.2377882, 0.3677731, -1.809357, 1, 0, 0, 1, 1,
0.2399662, 0.3148564, 1.718138, 1, 0, 0, 1, 1,
0.2411284, -1.227938, 2.769248, 0, 0, 0, 1, 1,
0.2436246, -0.6625096, 1.844676, 0, 0, 0, 1, 1,
0.2458993, -0.7591568, 1.935191, 0, 0, 0, 1, 1,
0.2553727, -0.8240211, 3.013817, 0, 0, 0, 1, 1,
0.2565777, -1.02844, 2.746706, 0, 0, 0, 1, 1,
0.2593992, -1.608834, 2.603912, 0, 0, 0, 1, 1,
0.2609532, -0.2805493, 2.088869, 0, 0, 0, 1, 1,
0.2612368, -0.4035276, 2.149913, 1, 1, 1, 1, 1,
0.2689388, -0.5446888, 0.9099761, 1, 1, 1, 1, 1,
0.2711704, -0.1420068, 2.966688, 1, 1, 1, 1, 1,
0.271209, 0.04896203, 1.018296, 1, 1, 1, 1, 1,
0.2760102, 0.3406687, 0.2931843, 1, 1, 1, 1, 1,
0.2779403, 1.054559, 0.9981061, 1, 1, 1, 1, 1,
0.279712, 0.3783522, 1.169166, 1, 1, 1, 1, 1,
0.280046, -0.2140523, 0.851659, 1, 1, 1, 1, 1,
0.2883841, -0.1547056, 1.161015, 1, 1, 1, 1, 1,
0.2887964, 1.643521, 0.4201227, 1, 1, 1, 1, 1,
0.294264, -0.1672326, 0.7067437, 1, 1, 1, 1, 1,
0.2979326, -0.5665536, 2.873763, 1, 1, 1, 1, 1,
0.2980743, 0.512741, -0.8706518, 1, 1, 1, 1, 1,
0.299125, -1.360105, 3.349451, 1, 1, 1, 1, 1,
0.2996691, 0.07736468, 1.657315, 1, 1, 1, 1, 1,
0.3022945, -0.4322806, 4.361934, 0, 0, 1, 1, 1,
0.3040621, -0.6497028, 4.315814, 1, 0, 0, 1, 1,
0.3076585, 0.2106516, 1.407318, 1, 0, 0, 1, 1,
0.3078983, -1.032656, 4.023261, 1, 0, 0, 1, 1,
0.3081192, 0.1583596, 2.220114, 1, 0, 0, 1, 1,
0.3138425, 1.591145, 1.093616, 1, 0, 0, 1, 1,
0.3150594, -2.183515, 1.908129, 0, 0, 0, 1, 1,
0.3156943, -0.5426231, 2.250762, 0, 0, 0, 1, 1,
0.3189834, 1.191467, -0.1679486, 0, 0, 0, 1, 1,
0.3191564, -0.322073, 2.257313, 0, 0, 0, 1, 1,
0.3278028, 0.5133669, 0.3245112, 0, 0, 0, 1, 1,
0.3307719, 0.9255795, 0.2905247, 0, 0, 0, 1, 1,
0.3328871, 1.420772, -1.527998, 0, 0, 0, 1, 1,
0.3330463, -0.7536071, 4.015784, 1, 1, 1, 1, 1,
0.3349876, -1.312539, 4.493309, 1, 1, 1, 1, 1,
0.3385015, -1.523336, 3.797251, 1, 1, 1, 1, 1,
0.3386991, 0.4213121, -1.336585, 1, 1, 1, 1, 1,
0.3400783, -0.3664469, 2.374928, 1, 1, 1, 1, 1,
0.3421779, 0.07621007, 2.083739, 1, 1, 1, 1, 1,
0.3450337, 0.9971461, 1.969629, 1, 1, 1, 1, 1,
0.3474279, -0.7927647, 1.499073, 1, 1, 1, 1, 1,
0.3492141, 0.9864922, 1.194264, 1, 1, 1, 1, 1,
0.3502394, 0.8883325, 1.379556, 1, 1, 1, 1, 1,
0.353766, 1.291212, 1.165781, 1, 1, 1, 1, 1,
0.3551154, 0.7602062, 1.193507, 1, 1, 1, 1, 1,
0.3590875, 0.02839367, 1.616487, 1, 1, 1, 1, 1,
0.3594261, 1.844275, 0.2912534, 1, 1, 1, 1, 1,
0.3637832, -1.151959, 4.751629, 1, 1, 1, 1, 1,
0.3662179, 1.462836, -0.05172017, 0, 0, 1, 1, 1,
0.3684751, -1.146325, 1.92964, 1, 0, 0, 1, 1,
0.3706323, 1.847429, 0.2520045, 1, 0, 0, 1, 1,
0.3723139, -0.7683583, 3.499001, 1, 0, 0, 1, 1,
0.3733613, -2.250436, 3.459025, 1, 0, 0, 1, 1,
0.3768266, 1.397679, -0.8916681, 1, 0, 0, 1, 1,
0.3805721, 0.05998589, 2.457056, 0, 0, 0, 1, 1,
0.3922253, 1.070695, 0.2368742, 0, 0, 0, 1, 1,
0.396229, -0.4805786, 2.534768, 0, 0, 0, 1, 1,
0.3988231, -0.2405321, 1.723552, 0, 0, 0, 1, 1,
0.3990107, 0.5390179, 0.8877236, 0, 0, 0, 1, 1,
0.4018878, 0.8556008, 1.290984, 0, 0, 0, 1, 1,
0.4024203, 1.53367, 1.215377, 0, 0, 0, 1, 1,
0.4071385, -2.165172, 4.316574, 1, 1, 1, 1, 1,
0.4101031, -0.008055662, 0.7900195, 1, 1, 1, 1, 1,
0.4134154, -2.564579, 5.12706, 1, 1, 1, 1, 1,
0.4162051, -0.4210573, 2.915461, 1, 1, 1, 1, 1,
0.4184314, 0.6125318, 2.070677, 1, 1, 1, 1, 1,
0.4186442, -0.3380364, 3.943211, 1, 1, 1, 1, 1,
0.4243204, 1.86103, 1.582218, 1, 1, 1, 1, 1,
0.4253956, -0.4729674, 2.087791, 1, 1, 1, 1, 1,
0.4264394, -0.5754301, 2.489365, 1, 1, 1, 1, 1,
0.4271975, -0.4457094, 2.321501, 1, 1, 1, 1, 1,
0.4325097, 0.4622723, 0.9196712, 1, 1, 1, 1, 1,
0.4326772, 0.4701427, -0.4235675, 1, 1, 1, 1, 1,
0.4343667, 1.190807, 0.7931563, 1, 1, 1, 1, 1,
0.4357547, -1.59428, 3.557973, 1, 1, 1, 1, 1,
0.4392673, 0.726912, 0.6173761, 1, 1, 1, 1, 1,
0.4399064, 0.5549476, -1.287609, 0, 0, 1, 1, 1,
0.4446208, -0.3009288, 1.822892, 1, 0, 0, 1, 1,
0.4469863, -0.6391978, 3.525626, 1, 0, 0, 1, 1,
0.4477306, 1.008731, -0.3555197, 1, 0, 0, 1, 1,
0.4522311, 0.5980894, 2.783434, 1, 0, 0, 1, 1,
0.4567955, -0.4615445, 3.185708, 1, 0, 0, 1, 1,
0.458623, 1.355617, 0.2383627, 0, 0, 0, 1, 1,
0.4608521, 0.316952, 0.3510362, 0, 0, 0, 1, 1,
0.4612944, -0.06532753, 1.435064, 0, 0, 0, 1, 1,
0.4622455, 0.1595419, 2.075405, 0, 0, 0, 1, 1,
0.4624059, -0.2989011, 2.520574, 0, 0, 0, 1, 1,
0.4625873, 0.9629183, -0.3543458, 0, 0, 0, 1, 1,
0.4663218, -0.0448246, 2.209931, 0, 0, 0, 1, 1,
0.4667761, 1.654811, 1.073282, 1, 1, 1, 1, 1,
0.472664, 2.648648, -0.2757573, 1, 1, 1, 1, 1,
0.4819879, -0.3619335, 1.465152, 1, 1, 1, 1, 1,
0.4839107, 0.1982848, 1.227352, 1, 1, 1, 1, 1,
0.4868319, 0.339024, 1.750016, 1, 1, 1, 1, 1,
0.4924138, -0.7976021, 2.057092, 1, 1, 1, 1, 1,
0.4932732, 0.7040752, -0.2921327, 1, 1, 1, 1, 1,
0.4951621, -1.08862, 5.123905, 1, 1, 1, 1, 1,
0.5022214, 0.4910673, 1.133534, 1, 1, 1, 1, 1,
0.5045504, -1.470539, 4.749209, 1, 1, 1, 1, 1,
0.505499, -0.3219267, 3.084941, 1, 1, 1, 1, 1,
0.5071868, 0.5113024, -0.3865628, 1, 1, 1, 1, 1,
0.5073324, -1.983945, 1.629463, 1, 1, 1, 1, 1,
0.5079668, 0.3141457, 1.724554, 1, 1, 1, 1, 1,
0.5092697, -0.4648015, 2.897412, 1, 1, 1, 1, 1,
0.5093619, 0.6961364, 0.3481157, 0, 0, 1, 1, 1,
0.5093771, 1.612217, 0.3000177, 1, 0, 0, 1, 1,
0.5141321, 0.7474272, 1.911145, 1, 0, 0, 1, 1,
0.5143033, 0.4791338, -1.604776, 1, 0, 0, 1, 1,
0.5169644, -0.9389218, 3.481595, 1, 0, 0, 1, 1,
0.5186763, 1.025676, 0.7931697, 1, 0, 0, 1, 1,
0.5192061, 1.059815, -0.6112207, 0, 0, 0, 1, 1,
0.5221372, 0.5412781, 0.8905379, 0, 0, 0, 1, 1,
0.5252127, -0.556483, 2.174178, 0, 0, 0, 1, 1,
0.5293067, 0.2861286, 0.5460168, 0, 0, 0, 1, 1,
0.5307897, 1.324404, -0.4694196, 0, 0, 0, 1, 1,
0.5316226, -0.07104684, 1.252564, 0, 0, 0, 1, 1,
0.5317155, -1.119361, 1.95681, 0, 0, 0, 1, 1,
0.5358776, 1.139066, -0.8109847, 1, 1, 1, 1, 1,
0.5360755, -0.6576068, 2.751946, 1, 1, 1, 1, 1,
0.5379466, 0.6975073, -0.2995395, 1, 1, 1, 1, 1,
0.5452693, 0.06375141, 0.1443247, 1, 1, 1, 1, 1,
0.5454557, 0.7616482, 0.8058912, 1, 1, 1, 1, 1,
0.5466266, -1.063172, 3.973407, 1, 1, 1, 1, 1,
0.5590736, -0.06370699, 1.378201, 1, 1, 1, 1, 1,
0.563279, -0.5197216, 2.77862, 1, 1, 1, 1, 1,
0.5651005, -1.556769, 1.843725, 1, 1, 1, 1, 1,
0.5663553, 0.4118251, 0.8820366, 1, 1, 1, 1, 1,
0.5685264, 0.2179294, 1.477555, 1, 1, 1, 1, 1,
0.5750236, 1.042487, 0.2289501, 1, 1, 1, 1, 1,
0.5778612, 0.7938325, 1.152378, 1, 1, 1, 1, 1,
0.5827758, 2.585331, 0.09599871, 1, 1, 1, 1, 1,
0.5845794, 1.793872, 1.066282, 1, 1, 1, 1, 1,
0.5890917, 1.24312, -1.185884, 0, 0, 1, 1, 1,
0.5929376, 2.053897, 0.8749836, 1, 0, 0, 1, 1,
0.5970291, 0.4344423, 2.293665, 1, 0, 0, 1, 1,
0.5989538, 0.0317659, 0.3649867, 1, 0, 0, 1, 1,
0.5994091, 0.7803397, 0.8354992, 1, 0, 0, 1, 1,
0.6060043, 1.268142, 0.5788713, 1, 0, 0, 1, 1,
0.6080441, -0.1499455, 2.617854, 0, 0, 0, 1, 1,
0.6081102, -1.017328, 2.741689, 0, 0, 0, 1, 1,
0.6090391, 0.9054598, 0.9630911, 0, 0, 0, 1, 1,
0.611492, 0.8415835, -0.7962477, 0, 0, 0, 1, 1,
0.6136359, -0.8100324, 3.095705, 0, 0, 0, 1, 1,
0.6153604, 0.1397691, -0.1917199, 0, 0, 0, 1, 1,
0.6178167, 1.653707, -0.623509, 0, 0, 0, 1, 1,
0.6184249, 2.27832, 1.006071, 1, 1, 1, 1, 1,
0.6228561, 0.880618, 0.5708637, 1, 1, 1, 1, 1,
0.6265724, 1.851589, 0.09142729, 1, 1, 1, 1, 1,
0.6291225, -0.2960459, 1.96658, 1, 1, 1, 1, 1,
0.6328822, -0.1346647, 1.857862, 1, 1, 1, 1, 1,
0.6334268, -0.4771505, 4.635294, 1, 1, 1, 1, 1,
0.6389793, 2.173729, -1.572379, 1, 1, 1, 1, 1,
0.6395389, 0.9857742, 0.8642212, 1, 1, 1, 1, 1,
0.6442241, -0.3693036, 2.642543, 1, 1, 1, 1, 1,
0.6508913, 0.7282584, 0.8512866, 1, 1, 1, 1, 1,
0.6531658, 1.45868, 2.380209, 1, 1, 1, 1, 1,
0.6611648, 0.30812, 1.885229, 1, 1, 1, 1, 1,
0.6626594, 0.7697372, -0.7382452, 1, 1, 1, 1, 1,
0.6655948, 0.62828, 2.125295, 1, 1, 1, 1, 1,
0.666824, -1.107313, 3.844302, 1, 1, 1, 1, 1,
0.6680273, -0.6636798, 2.030405, 0, 0, 1, 1, 1,
0.6693646, 0.4250323, 1.057483, 1, 0, 0, 1, 1,
0.6698457, 0.3976936, -0.2120503, 1, 0, 0, 1, 1,
0.6800507, -1.498885, 1.700839, 1, 0, 0, 1, 1,
0.6807101, 0.6612485, -0.8858367, 1, 0, 0, 1, 1,
0.6817965, -0.5513935, 1.807503, 1, 0, 0, 1, 1,
0.6824057, -0.5241839, 1.906201, 0, 0, 0, 1, 1,
0.6834546, -0.3132469, 2.36483, 0, 0, 0, 1, 1,
0.6879088, 0.8725707, 0.05575255, 0, 0, 0, 1, 1,
0.6985289, 1.091219, 1.313164, 0, 0, 0, 1, 1,
0.7002596, -0.4243772, 2.770218, 0, 0, 0, 1, 1,
0.7019234, -0.1790328, 4.563639, 0, 0, 0, 1, 1,
0.7044346, -0.6867934, 2.725285, 0, 0, 0, 1, 1,
0.704702, -0.8073497, 2.418988, 1, 1, 1, 1, 1,
0.7048893, 1.446129, 1.250585, 1, 1, 1, 1, 1,
0.7140906, 0.3462081, 1.917494, 1, 1, 1, 1, 1,
0.7197993, -0.5782519, 1.130896, 1, 1, 1, 1, 1,
0.7229308, 1.108572, 1.023095, 1, 1, 1, 1, 1,
0.7230746, -1.243086, 2.320674, 1, 1, 1, 1, 1,
0.7285267, 0.06390617, 0.5984453, 1, 1, 1, 1, 1,
0.7445672, -0.03840644, 1.300448, 1, 1, 1, 1, 1,
0.7520086, -0.01887909, 1.897097, 1, 1, 1, 1, 1,
0.7567598, 0.4185186, 0.385527, 1, 1, 1, 1, 1,
0.7649407, -1.384562, 3.990822, 1, 1, 1, 1, 1,
0.7773233, 0.8401744, 0.04723794, 1, 1, 1, 1, 1,
0.777414, 0.8653679, 2.153989, 1, 1, 1, 1, 1,
0.7841549, -1.697558, 2.579489, 1, 1, 1, 1, 1,
0.7848862, -1.074804, 2.572543, 1, 1, 1, 1, 1,
0.7901937, 0.3892915, 0.1996417, 0, 0, 1, 1, 1,
0.7930358, -1.027466, 2.500923, 1, 0, 0, 1, 1,
0.796499, 1.323217, 0.3724216, 1, 0, 0, 1, 1,
0.7996451, 0.3428762, 0.5397106, 1, 0, 0, 1, 1,
0.802641, 1.223495, 0.2316004, 1, 0, 0, 1, 1,
0.803982, 0.8925197, 1.184096, 1, 0, 0, 1, 1,
0.80791, -2.337729, 2.971155, 0, 0, 0, 1, 1,
0.8095988, -0.5985242, 3.453586, 0, 0, 0, 1, 1,
0.8169641, -1.199513, 1.735108, 0, 0, 0, 1, 1,
0.8219296, -0.02442944, 1.363762, 0, 0, 0, 1, 1,
0.8260862, 0.06512023, 1.781438, 0, 0, 0, 1, 1,
0.8275113, -0.2623174, 0.4444806, 0, 0, 0, 1, 1,
0.8342035, 0.5060844, 2.521246, 0, 0, 0, 1, 1,
0.8355235, 0.1590873, 1.119791, 1, 1, 1, 1, 1,
0.8453046, 1.321589, 0.3894155, 1, 1, 1, 1, 1,
0.8455685, 0.0675635, 0.108594, 1, 1, 1, 1, 1,
0.846529, 0.03398073, 0.213029, 1, 1, 1, 1, 1,
0.8511164, 1.106157, 0.5465498, 1, 1, 1, 1, 1,
0.8612741, 1.690605, 0.7452197, 1, 1, 1, 1, 1,
0.8626034, -0.1549298, 1.233358, 1, 1, 1, 1, 1,
0.8640519, 0.7434109, 0.4907971, 1, 1, 1, 1, 1,
0.8688689, -0.3130576, 3.247715, 1, 1, 1, 1, 1,
0.8738312, 0.3223602, 1.168846, 1, 1, 1, 1, 1,
0.8758473, 0.294392, 2.853042, 1, 1, 1, 1, 1,
0.8910763, 0.3369116, 1.404367, 1, 1, 1, 1, 1,
0.8921487, -2.218297, 1.145298, 1, 1, 1, 1, 1,
0.905874, -0.4002104, 0.6074954, 1, 1, 1, 1, 1,
0.9061431, -1.970284, 3.140846, 1, 1, 1, 1, 1,
0.9068579, 0.6340736, 0.3672429, 0, 0, 1, 1, 1,
0.908228, -1.228912, 2.684459, 1, 0, 0, 1, 1,
0.9099671, 0.4043319, -0.00993632, 1, 0, 0, 1, 1,
0.9115501, 0.6558103, 2.773299, 1, 0, 0, 1, 1,
0.9154055, 0.005073104, 1.573224, 1, 0, 0, 1, 1,
0.9203936, 0.2093181, 2.544555, 1, 0, 0, 1, 1,
0.92101, -0.3542723, 2.06384, 0, 0, 0, 1, 1,
0.9228457, 1.347995, 0.4396995, 0, 0, 0, 1, 1,
0.9269657, -0.1721131, 1.333064, 0, 0, 0, 1, 1,
0.9345937, -1.365853, 3.229527, 0, 0, 0, 1, 1,
0.9377332, -0.8585668, 2.067871, 0, 0, 0, 1, 1,
0.9452794, -0.09819268, 2.083708, 0, 0, 0, 1, 1,
0.9491755, -3.131497, 2.973052, 0, 0, 0, 1, 1,
0.9518153, -0.8201315, 3.821098, 1, 1, 1, 1, 1,
0.955389, -1.396533, 1.047585, 1, 1, 1, 1, 1,
0.9623045, 0.9881402, 1.55581, 1, 1, 1, 1, 1,
0.9634521, 0.01148863, 0.03228446, 1, 1, 1, 1, 1,
0.9652424, -1.996438, 1.442137, 1, 1, 1, 1, 1,
0.9676995, -0.7352524, 2.441436, 1, 1, 1, 1, 1,
0.9808899, -0.05936415, 2.776037, 1, 1, 1, 1, 1,
0.9817183, -0.06495696, 2.369076, 1, 1, 1, 1, 1,
0.9939082, -1.10451, 3.541665, 1, 1, 1, 1, 1,
0.994496, -1.176501, 3.011478, 1, 1, 1, 1, 1,
0.9950122, -0.2108901, 1.50955, 1, 1, 1, 1, 1,
1.011213, -0.3440053, 0.5932688, 1, 1, 1, 1, 1,
1.01476, 0.8394221, -0.9399927, 1, 1, 1, 1, 1,
1.015017, -0.2565202, 0.2087689, 1, 1, 1, 1, 1,
1.023825, -0.7850478, 2.618956, 1, 1, 1, 1, 1,
1.025458, -0.3902434, 0.6812012, 0, 0, 1, 1, 1,
1.031875, 0.8148723, 2.254832, 1, 0, 0, 1, 1,
1.034782, 0.7359369, 0.3297028, 1, 0, 0, 1, 1,
1.035035, 0.2328999, 2.498384, 1, 0, 0, 1, 1,
1.036945, 0.6621447, 1.26117, 1, 0, 0, 1, 1,
1.037659, -0.03312958, 2.014536, 1, 0, 0, 1, 1,
1.042565, -0.3710509, 2.952138, 0, 0, 0, 1, 1,
1.046232, 1.656739, 1.38367, 0, 0, 0, 1, 1,
1.049496, -1.55916, 1.029094, 0, 0, 0, 1, 1,
1.06189, 1.737277, 2.003845, 0, 0, 0, 1, 1,
1.062254, 1.661674, -2.17803, 0, 0, 0, 1, 1,
1.062941, -1.829587, 2.12547, 0, 0, 0, 1, 1,
1.066005, -0.4275702, 2.697927, 0, 0, 0, 1, 1,
1.075712, 0.6545792, -0.1062661, 1, 1, 1, 1, 1,
1.084345, 2.107324, 0.3529316, 1, 1, 1, 1, 1,
1.090026, -1.833574, 1.477969, 1, 1, 1, 1, 1,
1.096312, -0.8635101, 2.112099, 1, 1, 1, 1, 1,
1.096534, 1.663661, 0.1189971, 1, 1, 1, 1, 1,
1.101267, 0.7842588, 2.422007, 1, 1, 1, 1, 1,
1.104896, 0.7936741, 2.048904, 1, 1, 1, 1, 1,
1.114149, 0.2191562, 2.189538, 1, 1, 1, 1, 1,
1.114368, 0.05864163, 0.8610647, 1, 1, 1, 1, 1,
1.122812, 1.335513, 0.657649, 1, 1, 1, 1, 1,
1.125176, -1.79748, 2.296999, 1, 1, 1, 1, 1,
1.125587, -2.303093, 1.659094, 1, 1, 1, 1, 1,
1.12994, -0.7148058, 2.328454, 1, 1, 1, 1, 1,
1.131077, -2.897, 4.514338, 1, 1, 1, 1, 1,
1.146403, -0.3932617, 2.164965, 1, 1, 1, 1, 1,
1.148384, -0.1817326, 0.3175546, 0, 0, 1, 1, 1,
1.15439, 0.5731079, 3.201915, 1, 0, 0, 1, 1,
1.154579, -0.0644204, 1.739506, 1, 0, 0, 1, 1,
1.167816, 1.500336, 1.514852, 1, 0, 0, 1, 1,
1.171299, 1.878945, 0.1096201, 1, 0, 0, 1, 1,
1.185858, 0.4272052, 1.903099, 1, 0, 0, 1, 1,
1.193295, 0.7144418, 2.821545, 0, 0, 0, 1, 1,
1.195122, 0.6702738, -1.159232, 0, 0, 0, 1, 1,
1.198725, -0.5419907, 1.164602, 0, 0, 0, 1, 1,
1.199714, 1.7063, 1.848157, 0, 0, 0, 1, 1,
1.205716, -2.33357, 1.178592, 0, 0, 0, 1, 1,
1.214073, 2.541847, 1.714156, 0, 0, 0, 1, 1,
1.22228, 1.584159, 0.4531429, 0, 0, 0, 1, 1,
1.22289, -0.6946233, 1.371627, 1, 1, 1, 1, 1,
1.229786, -0.4050953, -0.01156294, 1, 1, 1, 1, 1,
1.234051, 0.1978241, 1.219473, 1, 1, 1, 1, 1,
1.23407, -1.656061, 2.877858, 1, 1, 1, 1, 1,
1.244539, 0.5292144, 1.656499, 1, 1, 1, 1, 1,
1.248611, -1.646313, 3.746531, 1, 1, 1, 1, 1,
1.248976, -1.659137, 2.050378, 1, 1, 1, 1, 1,
1.251302, -0.5556077, 1.733361, 1, 1, 1, 1, 1,
1.251409, 0.8570794, 0.8827958, 1, 1, 1, 1, 1,
1.252514, 0.07733673, 1.527706, 1, 1, 1, 1, 1,
1.255042, 1.795249, 0.04831938, 1, 1, 1, 1, 1,
1.255531, 1.376436, 1.632467, 1, 1, 1, 1, 1,
1.271401, -0.208327, 1.378698, 1, 1, 1, 1, 1,
1.286873, 2.094112, 1.78258, 1, 1, 1, 1, 1,
1.290185, 0.2850253, 0.756242, 1, 1, 1, 1, 1,
1.290479, -0.3744888, 2.688035, 0, 0, 1, 1, 1,
1.292001, -1.427132, 4.481728, 1, 0, 0, 1, 1,
1.297773, -0.8433098, 2.005432, 1, 0, 0, 1, 1,
1.315688, 1.134553, -1.642478, 1, 0, 0, 1, 1,
1.331608, -0.4019956, 3.396659, 1, 0, 0, 1, 1,
1.33693, -0.5031902, 1.259268, 1, 0, 0, 1, 1,
1.33755, -0.3327059, 0.9723851, 0, 0, 0, 1, 1,
1.344867, 1.56877, -0.6339391, 0, 0, 0, 1, 1,
1.345144, -1.593091, 2.578283, 0, 0, 0, 1, 1,
1.345406, -0.1952055, 2.048713, 0, 0, 0, 1, 1,
1.345709, -0.4915608, 1.45115, 0, 0, 0, 1, 1,
1.351235, -0.2566259, 2.151862, 0, 0, 0, 1, 1,
1.353386, -0.8112324, 2.289714, 0, 0, 0, 1, 1,
1.360023, -1.249383, 0.5730809, 1, 1, 1, 1, 1,
1.373569, -0.9227564, 1.439992, 1, 1, 1, 1, 1,
1.376485, 0.8792998, 1.771682, 1, 1, 1, 1, 1,
1.380802, -0.3390512, 1.121345, 1, 1, 1, 1, 1,
1.388248, 0.2011897, 1.584732, 1, 1, 1, 1, 1,
1.389417, -1.564046, 2.242798, 1, 1, 1, 1, 1,
1.399159, 0.8236907, -0.7748168, 1, 1, 1, 1, 1,
1.41872, -0.5268585, 1.572727, 1, 1, 1, 1, 1,
1.431194, 0.34001, 2.089986, 1, 1, 1, 1, 1,
1.431926, 1.394817, -0.6530605, 1, 1, 1, 1, 1,
1.43454, -0.2554516, 2.503092, 1, 1, 1, 1, 1,
1.445406, -1.765612, 3.312243, 1, 1, 1, 1, 1,
1.449278, 0.2825989, -0.5975651, 1, 1, 1, 1, 1,
1.449773, -1.381918, 3.78933, 1, 1, 1, 1, 1,
1.45646, 1.497456, -0.4908467, 1, 1, 1, 1, 1,
1.458687, 0.8733428, 0.2933851, 0, 0, 1, 1, 1,
1.460146, 0.3940862, 2.24943, 1, 0, 0, 1, 1,
1.480978, -1.404841, 2.07025, 1, 0, 0, 1, 1,
1.493732, 0.4312302, 3.412618, 1, 0, 0, 1, 1,
1.505983, 1.339585, 1.450167, 1, 0, 0, 1, 1,
1.507974, 0.8345516, -0.8854118, 1, 0, 0, 1, 1,
1.509446, 0.6491689, 0.1590526, 0, 0, 0, 1, 1,
1.518412, -1.904554, 2.848967, 0, 0, 0, 1, 1,
1.521109, -0.5194985, 1.702458, 0, 0, 0, 1, 1,
1.526637, -0.9674919, 1.642161, 0, 0, 0, 1, 1,
1.544747, -1.062066, 2.278893, 0, 0, 0, 1, 1,
1.564401, 1.455763, 0.5873218, 0, 0, 0, 1, 1,
1.588356, -1.44275, 1.034092, 0, 0, 0, 1, 1,
1.594377, -1.38903, 3.576417, 1, 1, 1, 1, 1,
1.604468, -0.1167301, -0.3691529, 1, 1, 1, 1, 1,
1.609105, -0.9418691, 2.440086, 1, 1, 1, 1, 1,
1.61346, 0.309011, 0.9138406, 1, 1, 1, 1, 1,
1.630128, -0.4044523, 1.226526, 1, 1, 1, 1, 1,
1.6344, -0.9643754, 0.9391782, 1, 1, 1, 1, 1,
1.652671, 0.6792191, 1.081451, 1, 1, 1, 1, 1,
1.682272, 0.0518888, 1.722653, 1, 1, 1, 1, 1,
1.682958, -0.6723172, 3.99515, 1, 1, 1, 1, 1,
1.684967, -1.140366, 2.797456, 1, 1, 1, 1, 1,
1.686051, -1.004546, 1.844127, 1, 1, 1, 1, 1,
1.703493, 1.25997, 0.02868914, 1, 1, 1, 1, 1,
1.707631, -0.1659751, 2.77368, 1, 1, 1, 1, 1,
1.708378, -0.405901, 1.636174, 1, 1, 1, 1, 1,
1.747325, -1.041309, 2.519797, 1, 1, 1, 1, 1,
1.759799, 0.01806209, 1.66323, 0, 0, 1, 1, 1,
1.766813, -0.09787588, 2.623787, 1, 0, 0, 1, 1,
1.76738, -0.1268476, 2.615288, 1, 0, 0, 1, 1,
1.775636, 1.220067, -0.8527683, 1, 0, 0, 1, 1,
1.776383, -0.3014034, 4.00561, 1, 0, 0, 1, 1,
1.796798, 0.08104149, 1.406075, 1, 0, 0, 1, 1,
1.801826, 0.04070646, 2.318613, 0, 0, 0, 1, 1,
1.804378, 0.04439396, 3.502588, 0, 0, 0, 1, 1,
1.835288, 0.09353001, 2.370273, 0, 0, 0, 1, 1,
1.841691, 0.9321379, 0.2038391, 0, 0, 0, 1, 1,
1.85192, 0.1726963, 0.6149011, 0, 0, 0, 1, 1,
1.859643, -0.01120812, 2.682104, 0, 0, 0, 1, 1,
1.867605, -0.5504228, 2.686329, 0, 0, 0, 1, 1,
1.86888, -0.3352218, 2.343836, 1, 1, 1, 1, 1,
1.874014, -0.8247966, 1.600769, 1, 1, 1, 1, 1,
1.879085, 0.2441344, 1.24869, 1, 1, 1, 1, 1,
1.886946, -0.2288763, 2.882761, 1, 1, 1, 1, 1,
1.896087, 0.406894, 0.6634616, 1, 1, 1, 1, 1,
1.8996, -0.9535119, 1.482585, 1, 1, 1, 1, 1,
1.910863, 0.1655068, 1.79824, 1, 1, 1, 1, 1,
1.916125, 0.961333, 0.318398, 1, 1, 1, 1, 1,
1.926308, -0.1651363, 3.082801, 1, 1, 1, 1, 1,
1.928495, -0.3840783, 0.9040118, 1, 1, 1, 1, 1,
1.942933, 1.796945, 0.3969645, 1, 1, 1, 1, 1,
1.943572, -0.9846929, 1.505354, 1, 1, 1, 1, 1,
1.961162, -1.223705, 2.959109, 1, 1, 1, 1, 1,
1.964593, 0.03714992, 0.8385358, 1, 1, 1, 1, 1,
1.968331, 0.0118789, 2.219473, 1, 1, 1, 1, 1,
1.988124, 0.8151947, 2.573307, 0, 0, 1, 1, 1,
2.036501, 0.1692109, 0.08494961, 1, 0, 0, 1, 1,
2.052431, 1.371875, 0.5454994, 1, 0, 0, 1, 1,
2.088938, -0.04957225, 0.6143115, 1, 0, 0, 1, 1,
2.158772, 0.4038052, 1.591006, 1, 0, 0, 1, 1,
2.174853, 0.3922564, 0.6826863, 1, 0, 0, 1, 1,
2.190696, 0.8560174, 2.043382, 0, 0, 0, 1, 1,
2.195143, 0.6407482, 0.7267295, 0, 0, 0, 1, 1,
2.197609, 2.116043, -0.1486161, 0, 0, 0, 1, 1,
2.215041, -0.07220157, 2.920307, 0, 0, 0, 1, 1,
2.24109, 0.6018788, 1.658111, 0, 0, 0, 1, 1,
2.242524, -1.352438, 1.145337, 0, 0, 0, 1, 1,
2.295229, 1.01963, -0.8385672, 0, 0, 0, 1, 1,
2.485658, 0.363618, 1.529128, 1, 1, 1, 1, 1,
2.599059, 0.7626554, 1.014711, 1, 1, 1, 1, 1,
2.63102, 0.1988716, 0.06596599, 1, 1, 1, 1, 1,
2.648665, -0.2602907, 3.28569, 1, 1, 1, 1, 1,
2.682273, -0.9393554, 2.605876, 1, 1, 1, 1, 1,
2.715694, 0.2840798, 1.780892, 1, 1, 1, 1, 1,
3.026923, -1.454342, 0.3724058, 1, 1, 1, 1, 1
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
var radius = 9.38889;
var distance = 32.97807;
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
mvMatrix.translate( 0.2102234, 0.2414243, -0.2281013 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.97807);
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