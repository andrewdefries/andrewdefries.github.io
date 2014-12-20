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
-2.949392, 0.3894998, -0.4527115, 1, 0, 0, 1,
-2.943126, 1.248888, -0.2454655, 1, 0.007843138, 0, 1,
-2.941099, 1.121538, -1.083297, 1, 0.01176471, 0, 1,
-2.729734, -0.06949551, 0.7904431, 1, 0.01960784, 0, 1,
-2.584859, -1.551839, -4.167661, 1, 0.02352941, 0, 1,
-2.565041, -1.295789, -3.321291, 1, 0.03137255, 0, 1,
-2.482113, 2.388024, -0.4839492, 1, 0.03529412, 0, 1,
-2.423577, -1.271328, -1.646062, 1, 0.04313726, 0, 1,
-2.378472, 0.7281502, -1.708436, 1, 0.04705882, 0, 1,
-2.311382, -0.4105124, -1.930804, 1, 0.05490196, 0, 1,
-2.23163, -0.07613073, -1.738069, 1, 0.05882353, 0, 1,
-2.21661, -0.175053, -3.929058, 1, 0.06666667, 0, 1,
-2.207974, -0.358562, -1.793433, 1, 0.07058824, 0, 1,
-2.152589, -0.266236, -2.087446, 1, 0.07843138, 0, 1,
-2.151989, 0.2385667, 0.7908158, 1, 0.08235294, 0, 1,
-2.135206, -0.3505968, -3.463916, 1, 0.09019608, 0, 1,
-2.126467, 1.327297, -1.380556, 1, 0.09411765, 0, 1,
-2.120641, 0.4231618, -0.9400852, 1, 0.1019608, 0, 1,
-2.104992, -0.7743402, -1.681673, 1, 0.1098039, 0, 1,
-2.100692, 0.08682775, -2.472446, 1, 0.1137255, 0, 1,
-2.068128, -1.658897, -1.568993, 1, 0.1215686, 0, 1,
-2.061722, 0.7067829, -1.301392, 1, 0.1254902, 0, 1,
-2.060556, 1.413578, -3.019048, 1, 0.1333333, 0, 1,
-2.060405, 1.440125, -0.8455456, 1, 0.1372549, 0, 1,
-2.031535, 1.851068, -0.8999706, 1, 0.145098, 0, 1,
-2.024034, -0.5764358, 0.7220445, 1, 0.1490196, 0, 1,
-2.012639, -1.691728, -4.018915, 1, 0.1568628, 0, 1,
-2.002038, 0.3869192, -0.9113641, 1, 0.1607843, 0, 1,
-1.992899, -1.251086, -0.474336, 1, 0.1686275, 0, 1,
-1.969462, -0.9822637, -1.202614, 1, 0.172549, 0, 1,
-1.961104, -1.336884, -2.477598, 1, 0.1803922, 0, 1,
-1.941332, -0.8312877, -0.6986692, 1, 0.1843137, 0, 1,
-1.925339, 0.07435332, -0.5743979, 1, 0.1921569, 0, 1,
-1.909664, 0.6361952, -0.8606156, 1, 0.1960784, 0, 1,
-1.891369, -2.699517, -2.979042, 1, 0.2039216, 0, 1,
-1.87503, 0.869766, -0.6598705, 1, 0.2117647, 0, 1,
-1.861942, 1.94466, -0.788332, 1, 0.2156863, 0, 1,
-1.856503, 0.7789938, -0.8260558, 1, 0.2235294, 0, 1,
-1.852659, 1.050777, -3.162174, 1, 0.227451, 0, 1,
-1.84542, 2.032776, -0.4582044, 1, 0.2352941, 0, 1,
-1.835787, -0.3458414, -2.622023, 1, 0.2392157, 0, 1,
-1.835439, 0.3238316, -2.562803, 1, 0.2470588, 0, 1,
-1.835347, -0.07679512, -1.623282, 1, 0.2509804, 0, 1,
-1.799813, 0.7577055, -2.902709, 1, 0.2588235, 0, 1,
-1.792163, -0.3347819, -2.994848, 1, 0.2627451, 0, 1,
-1.779973, -0.3659329, -0.3195759, 1, 0.2705882, 0, 1,
-1.778854, 0.4693725, -1.470286, 1, 0.2745098, 0, 1,
-1.774622, -0.3120832, -2.487973, 1, 0.282353, 0, 1,
-1.755769, -0.5938991, -1.149706, 1, 0.2862745, 0, 1,
-1.748752, 0.6926329, -2.012223, 1, 0.2941177, 0, 1,
-1.748275, -0.733765, -1.981633, 1, 0.3019608, 0, 1,
-1.707064, -1.1469, -1.610401, 1, 0.3058824, 0, 1,
-1.69246, 0.8150607, -2.65626, 1, 0.3137255, 0, 1,
-1.691218, 0.2398027, 0.4459392, 1, 0.3176471, 0, 1,
-1.687101, 0.150079, 0.1827201, 1, 0.3254902, 0, 1,
-1.662497, -0.8854059, -1.037287, 1, 0.3294118, 0, 1,
-1.638972, 0.554881, -1.668706, 1, 0.3372549, 0, 1,
-1.624888, 0.04893946, -2.387149, 1, 0.3411765, 0, 1,
-1.620783, -1.858447, -3.747691, 1, 0.3490196, 0, 1,
-1.597172, 0.7117558, -1.47493, 1, 0.3529412, 0, 1,
-1.576512, -0.5398498, -3.254133, 1, 0.3607843, 0, 1,
-1.570638, 0.4417418, -0.7698989, 1, 0.3647059, 0, 1,
-1.553302, -0.327171, -1.082853, 1, 0.372549, 0, 1,
-1.552111, -0.5312251, -2.265337, 1, 0.3764706, 0, 1,
-1.546626, 0.3568189, -1.49016, 1, 0.3843137, 0, 1,
-1.543442, 1.182832, 1.331836, 1, 0.3882353, 0, 1,
-1.532857, -1.038096, -3.003864, 1, 0.3960784, 0, 1,
-1.519367, -1.026435, -2.396489, 1, 0.4039216, 0, 1,
-1.504061, 0.1117377, -2.616, 1, 0.4078431, 0, 1,
-1.501333, -2.722013, -1.818595, 1, 0.4156863, 0, 1,
-1.488149, 1.245104, -2.581747, 1, 0.4196078, 0, 1,
-1.485271, 1.137426, -0.7342826, 1, 0.427451, 0, 1,
-1.483046, 1.289554, -1.835485, 1, 0.4313726, 0, 1,
-1.473579, -0.3064483, -1.680113, 1, 0.4392157, 0, 1,
-1.467577, -0.506992, -1.68065, 1, 0.4431373, 0, 1,
-1.447275, -0.4733466, -0.5844298, 1, 0.4509804, 0, 1,
-1.419372, -0.08077728, -2.457909, 1, 0.454902, 0, 1,
-1.419062, 0.1480583, -1.217425, 1, 0.4627451, 0, 1,
-1.4162, 0.5215071, -1.050828, 1, 0.4666667, 0, 1,
-1.399893, -3.179383, -2.909237, 1, 0.4745098, 0, 1,
-1.398333, 1.113201, -1.668211, 1, 0.4784314, 0, 1,
-1.38956, 1.336663, 0.024019, 1, 0.4862745, 0, 1,
-1.387314, 0.04303538, -0.9169567, 1, 0.4901961, 0, 1,
-1.383942, 0.9797071, -0.678304, 1, 0.4980392, 0, 1,
-1.382367, -0.9116188, -1.614639, 1, 0.5058824, 0, 1,
-1.376744, -1.351114, -2.07281, 1, 0.509804, 0, 1,
-1.37614, -0.09043369, -0.7111794, 1, 0.5176471, 0, 1,
-1.37188, -0.162423, -1.235877, 1, 0.5215687, 0, 1,
-1.358011, -0.6956658, -2.344686, 1, 0.5294118, 0, 1,
-1.356634, -2.169119, -2.465855, 1, 0.5333334, 0, 1,
-1.349001, 0.1265812, -1.886035, 1, 0.5411765, 0, 1,
-1.343568, 0.1600406, -1.039639, 1, 0.5450981, 0, 1,
-1.340587, 2.136343, 0.4195852, 1, 0.5529412, 0, 1,
-1.3366, -0.008522224, -2.202589, 1, 0.5568628, 0, 1,
-1.332082, 0.260285, -4.353809, 1, 0.5647059, 0, 1,
-1.330232, -0.1507463, -1.667869, 1, 0.5686275, 0, 1,
-1.327357, -1.181704, -2.948094, 1, 0.5764706, 0, 1,
-1.323283, 0.4742155, -2.424226, 1, 0.5803922, 0, 1,
-1.321644, -1.297379, -2.230957, 1, 0.5882353, 0, 1,
-1.309002, -0.0730005, -1.761568, 1, 0.5921569, 0, 1,
-1.305843, -0.2367374, -2.145334, 1, 0.6, 0, 1,
-1.298091, -0.3137122, -2.681564, 1, 0.6078432, 0, 1,
-1.296294, 0.3905228, -1.624016, 1, 0.6117647, 0, 1,
-1.293972, 1.08621, -2.92404, 1, 0.6196079, 0, 1,
-1.293499, 0.3517513, -1.082851, 1, 0.6235294, 0, 1,
-1.279758, -1.772961, -1.910761, 1, 0.6313726, 0, 1,
-1.27526, -0.3096431, -2.347143, 1, 0.6352941, 0, 1,
-1.272415, 1.159834, -0.7086856, 1, 0.6431373, 0, 1,
-1.250231, 0.3203378, -1.321109, 1, 0.6470588, 0, 1,
-1.249017, -0.1350332, -1.107961, 1, 0.654902, 0, 1,
-1.248854, -1.358152, -2.367999, 1, 0.6588235, 0, 1,
-1.238249, -0.3982524, -3.20937, 1, 0.6666667, 0, 1,
-1.226725, 0.809235, -1.740149, 1, 0.6705883, 0, 1,
-1.224406, 0.5553459, -3.363419, 1, 0.6784314, 0, 1,
-1.224213, 0.02749353, -0.2729845, 1, 0.682353, 0, 1,
-1.220163, 1.125872, -2.035342, 1, 0.6901961, 0, 1,
-1.219916, 0.05907461, -1.813265, 1, 0.6941177, 0, 1,
-1.210479, -0.9898819, -1.968965, 1, 0.7019608, 0, 1,
-1.205284, 0.570329, -0.7794884, 1, 0.7098039, 0, 1,
-1.204039, -1.85521, -2.590756, 1, 0.7137255, 0, 1,
-1.202758, -0.1068873, -3.772828, 1, 0.7215686, 0, 1,
-1.201993, -0.8984163, -2.708926, 1, 0.7254902, 0, 1,
-1.201659, 0.7966616, -2.251955, 1, 0.7333333, 0, 1,
-1.196047, -0.0436996, -3.163824, 1, 0.7372549, 0, 1,
-1.185878, 2.110307, -0.4076054, 1, 0.7450981, 0, 1,
-1.185724, -0.4886407, -1.633811, 1, 0.7490196, 0, 1,
-1.185385, -2.597221, -1.917759, 1, 0.7568628, 0, 1,
-1.184283, -0.540651, -2.627698, 1, 0.7607843, 0, 1,
-1.183702, -0.4725733, -1.117648, 1, 0.7686275, 0, 1,
-1.182701, -1.332258, -2.243587, 1, 0.772549, 0, 1,
-1.180414, -0.274969, -3.293546, 1, 0.7803922, 0, 1,
-1.178169, 0.4555345, -3.016595, 1, 0.7843137, 0, 1,
-1.164914, 0.5528733, -3.679224, 1, 0.7921569, 0, 1,
-1.159102, 1.260239, 0.6712672, 1, 0.7960784, 0, 1,
-1.146541, -0.04078815, -0.321959, 1, 0.8039216, 0, 1,
-1.144377, 1.301754, -1.886891, 1, 0.8117647, 0, 1,
-1.140084, -1.081735, -3.756087, 1, 0.8156863, 0, 1,
-1.139784, 0.6738805, -0.5751261, 1, 0.8235294, 0, 1,
-1.134661, -1.444313, -1.887801, 1, 0.827451, 0, 1,
-1.13105, -2.613473, -1.419657, 1, 0.8352941, 0, 1,
-1.12747, 0.07269149, -1.042658, 1, 0.8392157, 0, 1,
-1.126244, -0.4703503, -1.421237, 1, 0.8470588, 0, 1,
-1.123309, 0.08490807, -1.96451, 1, 0.8509804, 0, 1,
-1.119868, -2.619636, -3.186584, 1, 0.8588235, 0, 1,
-1.114877, 0.5194577, -1.632924, 1, 0.8627451, 0, 1,
-1.113182, 0.6592308, -2.158621, 1, 0.8705882, 0, 1,
-1.111424, 0.07987653, -1.488844, 1, 0.8745098, 0, 1,
-1.109545, 1.374099, 0.4440775, 1, 0.8823529, 0, 1,
-1.104125, -0.447063, -3.182418, 1, 0.8862745, 0, 1,
-1.09945, 0.6423828, -1.972043, 1, 0.8941177, 0, 1,
-1.099218, -0.5690382, -1.887155, 1, 0.8980392, 0, 1,
-1.096495, 0.04326312, -0.5743321, 1, 0.9058824, 0, 1,
-1.084951, -0.1733869, -1.868322, 1, 0.9137255, 0, 1,
-1.082069, -0.3075231, -2.06748, 1, 0.9176471, 0, 1,
-1.078571, 0.02656559, -1.671428, 1, 0.9254902, 0, 1,
-1.075773, 1.720391, -1.188782, 1, 0.9294118, 0, 1,
-1.073541, 1.203668, -0.5138065, 1, 0.9372549, 0, 1,
-1.065594, 0.375746, -2.647426, 1, 0.9411765, 0, 1,
-1.065448, -0.06413551, -0.6083498, 1, 0.9490196, 0, 1,
-1.064251, -0.1285586, -0.2298861, 1, 0.9529412, 0, 1,
-1.047334, -0.179833, -1.83208, 1, 0.9607843, 0, 1,
-1.041159, 0.6864809, -0.135167, 1, 0.9647059, 0, 1,
-1.038363, -0.1580158, -1.157839, 1, 0.972549, 0, 1,
-1.023533, 0.7661605, -0.9712917, 1, 0.9764706, 0, 1,
-1.020919, -0.3275987, -1.763144, 1, 0.9843137, 0, 1,
-1.020513, 0.03492596, -1.767967, 1, 0.9882353, 0, 1,
-1.013178, -0.2691514, -1.951569, 1, 0.9960784, 0, 1,
-1.003463, 0.9624215, -1.188978, 0.9960784, 1, 0, 1,
-1.001835, 0.2687846, -2.022232, 0.9921569, 1, 0, 1,
-0.998604, 0.5792105, -1.694524, 0.9843137, 1, 0, 1,
-0.99118, 1.063141, -0.842269, 0.9803922, 1, 0, 1,
-0.9884117, -0.03499033, -1.981522, 0.972549, 1, 0, 1,
-0.9815251, 0.5471837, 1.198068, 0.9686275, 1, 0, 1,
-0.9771359, -0.3099003, -2.786163, 0.9607843, 1, 0, 1,
-0.9734631, -0.2815475, -1.794308, 0.9568627, 1, 0, 1,
-0.9713143, 0.2410037, -1.941572, 0.9490196, 1, 0, 1,
-0.9620793, -1.609428, -2.448843, 0.945098, 1, 0, 1,
-0.9594105, 1.803337, 0.6660367, 0.9372549, 1, 0, 1,
-0.9587427, -0.3866127, -2.302299, 0.9333333, 1, 0, 1,
-0.9564561, 1.290392, -1.773949, 0.9254902, 1, 0, 1,
-0.9564369, -0.8711321, -2.537603, 0.9215686, 1, 0, 1,
-0.9494601, 0.6666508, -0.5766061, 0.9137255, 1, 0, 1,
-0.9457235, 0.9526491, -0.1833803, 0.9098039, 1, 0, 1,
-0.944232, 1.16389, -0.9454713, 0.9019608, 1, 0, 1,
-0.9428295, 1.797212, 0.1038097, 0.8941177, 1, 0, 1,
-0.9399517, 0.1443052, -2.229606, 0.8901961, 1, 0, 1,
-0.9376296, -0.001921018, -1.559332, 0.8823529, 1, 0, 1,
-0.9330358, 0.1489666, -2.498763, 0.8784314, 1, 0, 1,
-0.9326492, -0.2652982, 0.4597119, 0.8705882, 1, 0, 1,
-0.9272152, 0.353894, -1.981691, 0.8666667, 1, 0, 1,
-0.9267883, 0.1011174, -1.159331, 0.8588235, 1, 0, 1,
-0.9206011, -0.5727579, -1.701673, 0.854902, 1, 0, 1,
-0.9141598, 1.29711, -0.53441, 0.8470588, 1, 0, 1,
-0.9118096, 2.824953, 1.093874, 0.8431373, 1, 0, 1,
-0.9103437, -0.1850761, -1.06503, 0.8352941, 1, 0, 1,
-0.9052274, 0.5728273, -1.60582, 0.8313726, 1, 0, 1,
-0.9041405, 0.1198256, -3.659424, 0.8235294, 1, 0, 1,
-0.9031301, -0.407954, -2.426661, 0.8196079, 1, 0, 1,
-0.8949374, -1.005331, -1.727236, 0.8117647, 1, 0, 1,
-0.8942368, -0.1657817, -3.002714, 0.8078431, 1, 0, 1,
-0.8936222, -0.4323815, 0.5974303, 0.8, 1, 0, 1,
-0.8923838, -0.01368238, -0.3029347, 0.7921569, 1, 0, 1,
-0.8915516, -1.114423, -3.267345, 0.7882353, 1, 0, 1,
-0.8907517, 1.168435, -0.8511258, 0.7803922, 1, 0, 1,
-0.8696688, 1.280001, -0.1671305, 0.7764706, 1, 0, 1,
-0.8576722, 0.4575295, -2.295652, 0.7686275, 1, 0, 1,
-0.8575418, 0.3364166, -1.42772, 0.7647059, 1, 0, 1,
-0.8563832, 0.1821539, -1.320215, 0.7568628, 1, 0, 1,
-0.8526781, 0.1938035, -1.144361, 0.7529412, 1, 0, 1,
-0.8442397, -0.3184218, -2.025126, 0.7450981, 1, 0, 1,
-0.8430769, 0.3596538, -3.598846, 0.7411765, 1, 0, 1,
-0.8390022, -0.6358208, -0.4359652, 0.7333333, 1, 0, 1,
-0.8372198, 0.3110675, -1.797392, 0.7294118, 1, 0, 1,
-0.8368428, 0.7195206, -0.7453605, 0.7215686, 1, 0, 1,
-0.8361598, -0.05815297, -1.866646, 0.7176471, 1, 0, 1,
-0.8325629, 0.6077235, -1.401585, 0.7098039, 1, 0, 1,
-0.8323492, -0.516091, -1.462424, 0.7058824, 1, 0, 1,
-0.8253385, -0.4337054, -1.878926, 0.6980392, 1, 0, 1,
-0.8250631, -0.8212125, -2.963897, 0.6901961, 1, 0, 1,
-0.8188585, 0.8993139, -1.018754, 0.6862745, 1, 0, 1,
-0.8088783, 0.2174432, -1.018825, 0.6784314, 1, 0, 1,
-0.8087038, 0.481031, -0.9672831, 0.6745098, 1, 0, 1,
-0.8085033, -0.2460124, -1.598065, 0.6666667, 1, 0, 1,
-0.8054222, -0.373439, -1.828454, 0.6627451, 1, 0, 1,
-0.8052567, 0.1723293, -0.4738729, 0.654902, 1, 0, 1,
-0.8021214, -1.497036, -2.791286, 0.6509804, 1, 0, 1,
-0.8016767, 0.1737477, -2.515855, 0.6431373, 1, 0, 1,
-0.79887, 1.065465, -2.108965, 0.6392157, 1, 0, 1,
-0.7975079, -2.083191, -3.85459, 0.6313726, 1, 0, 1,
-0.790388, 2.330354, 0.9195865, 0.627451, 1, 0, 1,
-0.788097, 0.1482856, -2.130051, 0.6196079, 1, 0, 1,
-0.7845729, -0.06754845, -1.243792, 0.6156863, 1, 0, 1,
-0.7844977, 0.8616076, -1.343007, 0.6078432, 1, 0, 1,
-0.7834505, -1.550766, -1.747725, 0.6039216, 1, 0, 1,
-0.782581, 0.3322741, 0.9790319, 0.5960785, 1, 0, 1,
-0.7777537, 0.3771599, -1.233544, 0.5882353, 1, 0, 1,
-0.7764917, -0.0713882, 0.3962663, 0.5843138, 1, 0, 1,
-0.7728295, -0.699994, -2.301136, 0.5764706, 1, 0, 1,
-0.7724206, 0.456649, -4.124876, 0.572549, 1, 0, 1,
-0.7673956, -1.065755, -0.8294644, 0.5647059, 1, 0, 1,
-0.7609803, 0.9308002, -0.9236954, 0.5607843, 1, 0, 1,
-0.7503644, 1.169188, -0.8443142, 0.5529412, 1, 0, 1,
-0.7467608, -1.104629, -2.825037, 0.5490196, 1, 0, 1,
-0.7454007, -0.6964443, -1.651489, 0.5411765, 1, 0, 1,
-0.7373186, 0.5646707, -1.202731, 0.5372549, 1, 0, 1,
-0.7292816, -1.728596, -2.663008, 0.5294118, 1, 0, 1,
-0.7223499, 0.5455768, -0.149495, 0.5254902, 1, 0, 1,
-0.7188338, 0.8269598, -0.7940201, 0.5176471, 1, 0, 1,
-0.715286, -0.3876202, -2.501853, 0.5137255, 1, 0, 1,
-0.7136928, -3.088478, -3.961682, 0.5058824, 1, 0, 1,
-0.7089015, 0.3142676, -2.112381, 0.5019608, 1, 0, 1,
-0.7014819, 1.179587, -0.09228026, 0.4941176, 1, 0, 1,
-0.6990235, 1.713181, -0.9922963, 0.4862745, 1, 0, 1,
-0.6971354, 0.2314261, -0.7592732, 0.4823529, 1, 0, 1,
-0.6969519, -1.071045, -1.045129, 0.4745098, 1, 0, 1,
-0.6870189, 0.03404441, -2.021103, 0.4705882, 1, 0, 1,
-0.6852139, -0.265678, -3.137857, 0.4627451, 1, 0, 1,
-0.6821634, -1.520148, -2.541531, 0.4588235, 1, 0, 1,
-0.678468, -0.07050596, -2.130883, 0.4509804, 1, 0, 1,
-0.6757218, -1.230654, -2.766483, 0.4470588, 1, 0, 1,
-0.6744576, 0.2229411, -0.9650819, 0.4392157, 1, 0, 1,
-0.6719841, -1.740215, -3.956109, 0.4352941, 1, 0, 1,
-0.6698738, -0.2611749, -2.813306, 0.427451, 1, 0, 1,
-0.6671767, 0.5615296, -2.157794, 0.4235294, 1, 0, 1,
-0.665949, -0.6285598, -2.48108, 0.4156863, 1, 0, 1,
-0.662772, 1.337901, -0.8853804, 0.4117647, 1, 0, 1,
-0.6613459, 1.594363, 1.006205, 0.4039216, 1, 0, 1,
-0.660628, 0.5965837, -0.508887, 0.3960784, 1, 0, 1,
-0.6506721, 1.010982, -0.9596437, 0.3921569, 1, 0, 1,
-0.6350539, 0.7402731, 0.4264746, 0.3843137, 1, 0, 1,
-0.6313129, 1.385115, 0.490869, 0.3803922, 1, 0, 1,
-0.6294814, -0.8734059, -3.616215, 0.372549, 1, 0, 1,
-0.6280226, 0.7516336, 0.4147322, 0.3686275, 1, 0, 1,
-0.6271222, 1.268048, -0.558845, 0.3607843, 1, 0, 1,
-0.6122832, -0.02434876, -2.351402, 0.3568628, 1, 0, 1,
-0.6080588, -2.006289, -3.409819, 0.3490196, 1, 0, 1,
-0.6076121, 0.3896673, -1.949209, 0.345098, 1, 0, 1,
-0.606841, -2.405019, -2.155005, 0.3372549, 1, 0, 1,
-0.6068043, 1.705904, -0.6689188, 0.3333333, 1, 0, 1,
-0.6030748, -0.4771615, -0.5572959, 0.3254902, 1, 0, 1,
-0.5877539, -0.1819072, -0.5941867, 0.3215686, 1, 0, 1,
-0.5812004, 0.4004653, -2.945264, 0.3137255, 1, 0, 1,
-0.58016, 0.4732348, -2.579504, 0.3098039, 1, 0, 1,
-0.5674315, 0.1257653, 0.2999251, 0.3019608, 1, 0, 1,
-0.5661661, 0.4427162, -0.9684879, 0.2941177, 1, 0, 1,
-0.5633547, 0.8431591, 0.648465, 0.2901961, 1, 0, 1,
-0.5624272, 0.9488316, -2.853603, 0.282353, 1, 0, 1,
-0.5581232, 0.7308075, -2.152271, 0.2784314, 1, 0, 1,
-0.5580202, -0.09816697, -4.340421, 0.2705882, 1, 0, 1,
-0.5559142, 0.1628309, -1.22956, 0.2666667, 1, 0, 1,
-0.5547692, 0.8831436, -1.732774, 0.2588235, 1, 0, 1,
-0.5527904, -0.9706253, -4.522937, 0.254902, 1, 0, 1,
-0.5494502, 0.2739233, -1.500478, 0.2470588, 1, 0, 1,
-0.5454941, -0.6604391, -2.255847, 0.2431373, 1, 0, 1,
-0.5412597, 1.093836, -1.428721, 0.2352941, 1, 0, 1,
-0.5382326, -1.171803, -2.204673, 0.2313726, 1, 0, 1,
-0.5312379, -0.6669182, -2.371451, 0.2235294, 1, 0, 1,
-0.5278715, -1.567475, -1.586703, 0.2196078, 1, 0, 1,
-0.5276535, -0.3296776, -1.695171, 0.2117647, 1, 0, 1,
-0.5274091, 0.1382796, -1.490706, 0.2078431, 1, 0, 1,
-0.524845, 1.780147, -1.085045, 0.2, 1, 0, 1,
-0.517271, -2.658194, -5.305952, 0.1921569, 1, 0, 1,
-0.5126615, 0.5433965, -2.584196, 0.1882353, 1, 0, 1,
-0.5030363, -1.001176, -4.336739, 0.1803922, 1, 0, 1,
-0.5022039, 0.921962, -0.3970743, 0.1764706, 1, 0, 1,
-0.5005665, 1.515046, 0.8305792, 0.1686275, 1, 0, 1,
-0.500202, -0.641871, -2.421028, 0.1647059, 1, 0, 1,
-0.496083, 0.3978226, -0.8139632, 0.1568628, 1, 0, 1,
-0.4935693, 1.265147, -0.7812839, 0.1529412, 1, 0, 1,
-0.4895804, 1.048961, -1.733552, 0.145098, 1, 0, 1,
-0.4888452, 0.9894444, -0.07491741, 0.1411765, 1, 0, 1,
-0.4877613, -1.015877, -4.165843, 0.1333333, 1, 0, 1,
-0.4860879, 0.8794708, -0.4569656, 0.1294118, 1, 0, 1,
-0.4812528, -0.6852849, -3.169712, 0.1215686, 1, 0, 1,
-0.4798751, -2.704021, -3.786296, 0.1176471, 1, 0, 1,
-0.477496, 0.7444779, -1.366182, 0.1098039, 1, 0, 1,
-0.4766341, -1.550896, -3.627677, 0.1058824, 1, 0, 1,
-0.4667557, -0.3730307, -0.5023003, 0.09803922, 1, 0, 1,
-0.4664807, 1.092528, -1.650554, 0.09019608, 1, 0, 1,
-0.466044, -0.4543795, -1.521791, 0.08627451, 1, 0, 1,
-0.465577, 1.698297, -0.3059018, 0.07843138, 1, 0, 1,
-0.4651775, 0.09523007, -1.626865, 0.07450981, 1, 0, 1,
-0.4643713, 0.7223575, -2.424048, 0.06666667, 1, 0, 1,
-0.4631351, -1.065547, -2.722092, 0.0627451, 1, 0, 1,
-0.4620157, -1.36936, -1.997705, 0.05490196, 1, 0, 1,
-0.4512716, 2.316246, -0.7578152, 0.05098039, 1, 0, 1,
-0.4506351, -0.5829707, -3.826362, 0.04313726, 1, 0, 1,
-0.4486715, 0.3194457, -0.5013537, 0.03921569, 1, 0, 1,
-0.4468699, -0.4677284, -2.337312, 0.03137255, 1, 0, 1,
-0.4438372, -1.290344, -3.638532, 0.02745098, 1, 0, 1,
-0.4412548, -0.5208425, -2.331999, 0.01960784, 1, 0, 1,
-0.4368264, 0.953521, -1.211265, 0.01568628, 1, 0, 1,
-0.4360855, 0.4872535, -1.615606, 0.007843138, 1, 0, 1,
-0.4334357, -0.2998655, -1.370377, 0.003921569, 1, 0, 1,
-0.4267596, -1.027855, -2.526613, 0, 1, 0.003921569, 1,
-0.4241165, -1.276745, -1.303937, 0, 1, 0.01176471, 1,
-0.4229622, 0.4813745, -2.613195, 0, 1, 0.01568628, 1,
-0.4217976, 0.0551173, -0.2176085, 0, 1, 0.02352941, 1,
-0.4185261, -0.008102374, -2.26985, 0, 1, 0.02745098, 1,
-0.4183283, 0.5091303, -1.021675, 0, 1, 0.03529412, 1,
-0.4157341, -0.442395, -3.658769, 0, 1, 0.03921569, 1,
-0.4124407, 0.9782284, 1.652508, 0, 1, 0.04705882, 1,
-0.4117154, -1.214414, -1.383964, 0, 1, 0.05098039, 1,
-0.4086618, -0.1039511, -3.985731, 0, 1, 0.05882353, 1,
-0.4035749, 1.566047, -1.707342, 0, 1, 0.0627451, 1,
-0.3943036, 1.431651, 0.04466931, 0, 1, 0.07058824, 1,
-0.3894493, 0.9585309, -1.350435, 0, 1, 0.07450981, 1,
-0.3849127, -0.9744438, -3.183355, 0, 1, 0.08235294, 1,
-0.3839163, -0.7080993, -4.258988, 0, 1, 0.08627451, 1,
-0.383307, -2.033055, -3.813863, 0, 1, 0.09411765, 1,
-0.3804768, -0.398669, -2.651193, 0, 1, 0.1019608, 1,
-0.3769542, 3.676958, -1.702431, 0, 1, 0.1058824, 1,
-0.3759682, 0.5862203, -1.465653, 0, 1, 0.1137255, 1,
-0.3740832, -0.6226782, -3.450394, 0, 1, 0.1176471, 1,
-0.3724198, -0.1438106, 0.4383414, 0, 1, 0.1254902, 1,
-0.37089, -0.6301946, -1.169947, 0, 1, 0.1294118, 1,
-0.3703655, 3.810738, -0.3117733, 0, 1, 0.1372549, 1,
-0.3694406, 1.038224, -0.6365215, 0, 1, 0.1411765, 1,
-0.3676588, -0.4417424, -3.741604, 0, 1, 0.1490196, 1,
-0.3671576, -1.435381, -3.822248, 0, 1, 0.1529412, 1,
-0.3665044, 0.739606, -0.7977042, 0, 1, 0.1607843, 1,
-0.3654747, -0.3402021, -2.430303, 0, 1, 0.1647059, 1,
-0.3630393, 0.3805407, 0.1431866, 0, 1, 0.172549, 1,
-0.3622001, -0.971966, -1.902448, 0, 1, 0.1764706, 1,
-0.3611207, 0.7598385, 0.2481214, 0, 1, 0.1843137, 1,
-0.3591405, -0.4075676, -3.984722, 0, 1, 0.1882353, 1,
-0.3572567, 0.1336959, -1.316548, 0, 1, 0.1960784, 1,
-0.3553776, 1.424904, -0.3860725, 0, 1, 0.2039216, 1,
-0.350668, -0.9490822, -2.627853, 0, 1, 0.2078431, 1,
-0.349198, -0.6678668, -2.29821, 0, 1, 0.2156863, 1,
-0.3482534, -0.8727958, -0.8031582, 0, 1, 0.2196078, 1,
-0.346818, 0.1536017, -1.337452, 0, 1, 0.227451, 1,
-0.3420847, 1.907742, 0.1211867, 0, 1, 0.2313726, 1,
-0.3412561, 1.234905, -0.9912807, 0, 1, 0.2392157, 1,
-0.3382903, -0.01902081, -1.994238, 0, 1, 0.2431373, 1,
-0.3349195, 1.086439, 0.8186107, 0, 1, 0.2509804, 1,
-0.3327999, -0.8680977, -2.75578, 0, 1, 0.254902, 1,
-0.3309868, 0.674534, -0.8438911, 0, 1, 0.2627451, 1,
-0.3268384, -0.231166, -2.683797, 0, 1, 0.2666667, 1,
-0.3251349, 0.01571529, -0.2664401, 0, 1, 0.2745098, 1,
-0.3248649, -0.2186311, -1.694377, 0, 1, 0.2784314, 1,
-0.3247204, -1.959003, -2.067121, 0, 1, 0.2862745, 1,
-0.3239471, -1.462207, -3.090999, 0, 1, 0.2901961, 1,
-0.322243, -1.016061, -3.92676, 0, 1, 0.2980392, 1,
-0.3211279, 0.7736541, -1.092039, 0, 1, 0.3058824, 1,
-0.320874, 0.3640203, 0.09417266, 0, 1, 0.3098039, 1,
-0.3167588, 0.4151308, -1.593549, 0, 1, 0.3176471, 1,
-0.315417, -0.2031876, -2.149653, 0, 1, 0.3215686, 1,
-0.3120401, 0.2895144, -1.979341, 0, 1, 0.3294118, 1,
-0.3075291, 1.030958, -1.225322, 0, 1, 0.3333333, 1,
-0.3067509, 1.779716, 0.3478429, 0, 1, 0.3411765, 1,
-0.2986769, 0.2945432, -0.156047, 0, 1, 0.345098, 1,
-0.2961438, -0.01401843, -3.367516, 0, 1, 0.3529412, 1,
-0.2950373, -0.03908574, -0.9420458, 0, 1, 0.3568628, 1,
-0.287127, 0.5196565, -1.900382, 0, 1, 0.3647059, 1,
-0.2851227, -1.522342, -4.338852, 0, 1, 0.3686275, 1,
-0.2738984, -0.1381824, 0.04627004, 0, 1, 0.3764706, 1,
-0.2738974, -0.5377526, -4.59809, 0, 1, 0.3803922, 1,
-0.2722496, 0.1971329, -0.5632212, 0, 1, 0.3882353, 1,
-0.2698096, -3.123118, -3.150242, 0, 1, 0.3921569, 1,
-0.2682576, -0.1602355, -1.649718, 0, 1, 0.4, 1,
-0.2667137, 0.2652823, -0.3037989, 0, 1, 0.4078431, 1,
-0.2664586, -0.2589667, -2.48399, 0, 1, 0.4117647, 1,
-0.2641127, 1.082127, 1.29532, 0, 1, 0.4196078, 1,
-0.2604551, -0.6296308, -1.775192, 0, 1, 0.4235294, 1,
-0.2522888, 0.4930184, -0.4464982, 0, 1, 0.4313726, 1,
-0.2503582, -1.699086, -3.671257, 0, 1, 0.4352941, 1,
-0.2494645, 0.8601737, -0.7024435, 0, 1, 0.4431373, 1,
-0.2491789, -0.1497257, -0.4594629, 0, 1, 0.4470588, 1,
-0.2474909, 1.676252, -0.2298524, 0, 1, 0.454902, 1,
-0.2439797, 0.1572198, -1.304778, 0, 1, 0.4588235, 1,
-0.2435934, 0.6864169, -1.769566, 0, 1, 0.4666667, 1,
-0.2413657, -1.571959, -3.278712, 0, 1, 0.4705882, 1,
-0.2337526, -0.2538743, -4.354058, 0, 1, 0.4784314, 1,
-0.2336194, 2.36355, -0.7690216, 0, 1, 0.4823529, 1,
-0.2320732, 1.314377, 0.5152687, 0, 1, 0.4901961, 1,
-0.2251866, 1.018913, -0.3044775, 0, 1, 0.4941176, 1,
-0.2234165, 0.6533487, 0.4085722, 0, 1, 0.5019608, 1,
-0.2195122, 0.2216278, -0.02579311, 0, 1, 0.509804, 1,
-0.2095744, 2.530739, -0.3584627, 0, 1, 0.5137255, 1,
-0.2088668, -0.7690868, -1.490645, 0, 1, 0.5215687, 1,
-0.2059493, -0.9721261, -3.289142, 0, 1, 0.5254902, 1,
-0.2047839, 1.323109, -2.36891, 0, 1, 0.5333334, 1,
-0.204571, 1.193258, -0.8407616, 0, 1, 0.5372549, 1,
-0.2032719, -0.3268277, -2.404666, 0, 1, 0.5450981, 1,
-0.2002675, -1.039869, -3.663449, 0, 1, 0.5490196, 1,
-0.198854, -1.035978, -2.907308, 0, 1, 0.5568628, 1,
-0.1973984, -2.016772, -1.673849, 0, 1, 0.5607843, 1,
-0.1972413, 0.9884647, -0.2427512, 0, 1, 0.5686275, 1,
-0.194011, 0.07233603, 0.5306479, 0, 1, 0.572549, 1,
-0.1931759, 1.397158, 1.205609, 0, 1, 0.5803922, 1,
-0.1900945, -0.8439806, -3.486007, 0, 1, 0.5843138, 1,
-0.1849756, 0.4523976, -1.24289, 0, 1, 0.5921569, 1,
-0.1847765, -0.214167, -2.32813, 0, 1, 0.5960785, 1,
-0.1841049, -1.24752, -2.755801, 0, 1, 0.6039216, 1,
-0.1838615, 0.1757994, -0.393647, 0, 1, 0.6117647, 1,
-0.1833624, -0.9337047, -4.255857, 0, 1, 0.6156863, 1,
-0.1813099, 0.2259451, 0.06389686, 0, 1, 0.6235294, 1,
-0.1808303, -0.2229112, -3.565314, 0, 1, 0.627451, 1,
-0.178557, -1.30609, -3.574827, 0, 1, 0.6352941, 1,
-0.1716886, 0.7661897, -1.983492, 0, 1, 0.6392157, 1,
-0.165486, 0.3225755, -0.5560467, 0, 1, 0.6470588, 1,
-0.1645652, 0.146613, -1.17545, 0, 1, 0.6509804, 1,
-0.1601643, -1.581969, -3.275757, 0, 1, 0.6588235, 1,
-0.1596133, -0.6832601, -3.496303, 0, 1, 0.6627451, 1,
-0.1591396, 1.032653, 1.909044, 0, 1, 0.6705883, 1,
-0.1583087, 0.2366204, -1.684514, 0, 1, 0.6745098, 1,
-0.1572161, -1.964147, -3.440984, 0, 1, 0.682353, 1,
-0.1532846, 0.7165063, 0.2813051, 0, 1, 0.6862745, 1,
-0.1529363, 0.1262669, -2.627976, 0, 1, 0.6941177, 1,
-0.1521287, -0.09661152, -3.563694, 0, 1, 0.7019608, 1,
-0.150107, -0.8365771, -2.030503, 0, 1, 0.7058824, 1,
-0.1490425, -0.1015418, -1.440728, 0, 1, 0.7137255, 1,
-0.1443643, 0.1499034, -0.5637864, 0, 1, 0.7176471, 1,
-0.1439647, -0.1812147, -2.123599, 0, 1, 0.7254902, 1,
-0.1421779, 0.2925219, -1.477121, 0, 1, 0.7294118, 1,
-0.1415742, 0.3915966, -0.7182609, 0, 1, 0.7372549, 1,
-0.1392606, 1.154696, -1.767006, 0, 1, 0.7411765, 1,
-0.1385271, -1.808444, -2.933207, 0, 1, 0.7490196, 1,
-0.1291893, -0.2084019, -1.840157, 0, 1, 0.7529412, 1,
-0.1270337, 0.6259524, -1.902274, 0, 1, 0.7607843, 1,
-0.1240092, -1.267562, -2.953376, 0, 1, 0.7647059, 1,
-0.115089, -0.9192657, -2.546954, 0, 1, 0.772549, 1,
-0.1142251, 0.86204, -1.694058, 0, 1, 0.7764706, 1,
-0.1101187, -0.995152, -2.520315, 0, 1, 0.7843137, 1,
-0.1081534, 0.2854771, -1.245767, 0, 1, 0.7882353, 1,
-0.09992352, -2.308586, -2.48309, 0, 1, 0.7960784, 1,
-0.09893359, -0.236087, -2.151964, 0, 1, 0.8039216, 1,
-0.09431376, -0.2029053, -0.6401716, 0, 1, 0.8078431, 1,
-0.09239471, -0.4183966, -3.519121, 0, 1, 0.8156863, 1,
-0.08917253, -0.6736456, -2.418149, 0, 1, 0.8196079, 1,
-0.08912194, -1.245642, -2.650517, 0, 1, 0.827451, 1,
-0.07718401, 0.4347658, 1.283197, 0, 1, 0.8313726, 1,
-0.07652178, -2.621057, -1.81528, 0, 1, 0.8392157, 1,
-0.07259274, 1.572908, 0.5208458, 0, 1, 0.8431373, 1,
-0.07210238, -0.8084692, -3.650947, 0, 1, 0.8509804, 1,
-0.07078895, -0.2330295, -1.264865, 0, 1, 0.854902, 1,
-0.07071332, 0.4590931, -0.615179, 0, 1, 0.8627451, 1,
-0.06792786, -0.9599845, -1.800086, 0, 1, 0.8666667, 1,
-0.06588367, 1.279401, -0.514282, 0, 1, 0.8745098, 1,
-0.05926946, -0.3719773, -2.380425, 0, 1, 0.8784314, 1,
-0.0579952, 1.234195, 0.8962459, 0, 1, 0.8862745, 1,
-0.05322833, -0.2881438, -1.445112, 0, 1, 0.8901961, 1,
-0.05064979, -0.827924, -2.555323, 0, 1, 0.8980392, 1,
-0.04658696, 0.4300467, 1.239058, 0, 1, 0.9058824, 1,
-0.04642444, 0.000130416, -0.2673635, 0, 1, 0.9098039, 1,
-0.0463734, 0.9089953, 1.05927, 0, 1, 0.9176471, 1,
-0.04361545, 0.1599226, -0.5391748, 0, 1, 0.9215686, 1,
-0.04253526, 1.743008, -0.9668527, 0, 1, 0.9294118, 1,
-0.04202201, 1.825806, -0.9207638, 0, 1, 0.9333333, 1,
-0.03836013, -0.1526448, -0.7365629, 0, 1, 0.9411765, 1,
-0.03201911, -0.6137398, -2.305935, 0, 1, 0.945098, 1,
-0.03168735, 1.051173, -0.6099189, 0, 1, 0.9529412, 1,
-0.02840107, -1.666939, -4.74676, 0, 1, 0.9568627, 1,
-0.01834226, 0.5339377, -0.1927514, 0, 1, 0.9647059, 1,
-0.01747228, -0.4631241, -4.052262, 0, 1, 0.9686275, 1,
-0.01428604, 0.8195677, -1.042925, 0, 1, 0.9764706, 1,
-0.01191513, 1.128467, 0.3047793, 0, 1, 0.9803922, 1,
-0.00867149, -0.5940204, -2.300448, 0, 1, 0.9882353, 1,
-0.004552844, 1.392744, -0.3524869, 0, 1, 0.9921569, 1,
-0.000904429, -0.5595663, -4.391549, 0, 1, 1, 1,
0.005580646, 0.1151239, 0.9696251, 0, 0.9921569, 1, 1,
0.008051188, -0.9492925, 2.012042, 0, 0.9882353, 1, 1,
0.01015431, -0.3089366, 3.465345, 0, 0.9803922, 1, 1,
0.01140811, 0.2029514, 0.2974055, 0, 0.9764706, 1, 1,
0.01253209, -2.113384, 2.190832, 0, 0.9686275, 1, 1,
0.01356206, -0.6191375, 2.984506, 0, 0.9647059, 1, 1,
0.0141467, 0.3695892, 1.121954, 0, 0.9568627, 1, 1,
0.01497955, 0.1196204, 2.627205, 0, 0.9529412, 1, 1,
0.01827191, -0.05664815, 0.4341161, 0, 0.945098, 1, 1,
0.02038328, 0.1481194, 0.2858362, 0, 0.9411765, 1, 1,
0.02071721, 0.1995032, -0.1759146, 0, 0.9333333, 1, 1,
0.02111099, 0.711306, -0.8147628, 0, 0.9294118, 1, 1,
0.02294895, -0.3092003, 2.474313, 0, 0.9215686, 1, 1,
0.02435924, -0.5822245, 4.651606, 0, 0.9176471, 1, 1,
0.02437465, 0.308946, 0.3838421, 0, 0.9098039, 1, 1,
0.02807404, 1.276314, -2.529919, 0, 0.9058824, 1, 1,
0.02836367, 0.7068634, -0.002038505, 0, 0.8980392, 1, 1,
0.02925989, -0.4657183, 2.512501, 0, 0.8901961, 1, 1,
0.03262557, 1.4406, -0.8419218, 0, 0.8862745, 1, 1,
0.03346343, -0.6868653, 6.098863, 0, 0.8784314, 1, 1,
0.03999188, 1.218428, -0.6221518, 0, 0.8745098, 1, 1,
0.04101938, 0.9791674, 0.1300786, 0, 0.8666667, 1, 1,
0.04229349, -0.2529264, 3.827313, 0, 0.8627451, 1, 1,
0.04651508, -0.3583859, 3.273148, 0, 0.854902, 1, 1,
0.05010251, -0.1207387, 2.937237, 0, 0.8509804, 1, 1,
0.05405716, 0.7466156, 0.5210319, 0, 0.8431373, 1, 1,
0.06896371, -0.7719474, 2.166945, 0, 0.8392157, 1, 1,
0.06937603, -0.6951477, 4.145599, 0, 0.8313726, 1, 1,
0.07093935, 0.3299785, -0.19, 0, 0.827451, 1, 1,
0.07190009, 2.867617, 0.4493397, 0, 0.8196079, 1, 1,
0.07725081, 0.1457966, 3.10427, 0, 0.8156863, 1, 1,
0.07893143, -0.6407393, 2.40694, 0, 0.8078431, 1, 1,
0.07932807, -0.6527982, 4.604728, 0, 0.8039216, 1, 1,
0.08147056, 2.015435, -0.4387262, 0, 0.7960784, 1, 1,
0.08885652, 0.2645116, -0.9170917, 0, 0.7882353, 1, 1,
0.09594602, 0.4720885, 1.728611, 0, 0.7843137, 1, 1,
0.09691458, -0.04828975, 2.077231, 0, 0.7764706, 1, 1,
0.09818058, -1.805025, 3.67624, 0, 0.772549, 1, 1,
0.1003468, -0.2933275, 2.815458, 0, 0.7647059, 1, 1,
0.1018456, -0.7806374, 2.950151, 0, 0.7607843, 1, 1,
0.1085323, -0.397341, 1.786983, 0, 0.7529412, 1, 1,
0.1086725, -0.274277, 1.569926, 0, 0.7490196, 1, 1,
0.1099157, -0.5145988, 3.382512, 0, 0.7411765, 1, 1,
0.1130636, -0.01169662, -0.1878961, 0, 0.7372549, 1, 1,
0.1175266, -1.740528, 1.977396, 0, 0.7294118, 1, 1,
0.123889, -0.8510441, 3.251792, 0, 0.7254902, 1, 1,
0.1243825, 0.1076342, -0.01939602, 0, 0.7176471, 1, 1,
0.1281232, -1.281071, 4.308604, 0, 0.7137255, 1, 1,
0.1306885, 0.5124062, 1.094967, 0, 0.7058824, 1, 1,
0.1358988, -1.459614, 2.020104, 0, 0.6980392, 1, 1,
0.1405478, -0.7218177, 2.528942, 0, 0.6941177, 1, 1,
0.1406098, -0.2538069, 3.815204, 0, 0.6862745, 1, 1,
0.1411305, 1.472513, 2.099652, 0, 0.682353, 1, 1,
0.1419145, -1.145639, 2.235585, 0, 0.6745098, 1, 1,
0.1446356, 0.07971772, -0.3494209, 0, 0.6705883, 1, 1,
0.14796, 0.2691715, -0.8223457, 0, 0.6627451, 1, 1,
0.1491513, -0.4949923, 0.4803556, 0, 0.6588235, 1, 1,
0.1509605, -0.4172799, 5.245961, 0, 0.6509804, 1, 1,
0.1536575, -1.394825, 3.307006, 0, 0.6470588, 1, 1,
0.1574742, -0.2702647, 2.825214, 0, 0.6392157, 1, 1,
0.1582662, 0.05011565, 1.139753, 0, 0.6352941, 1, 1,
0.1587623, 0.05484625, -0.6479239, 0, 0.627451, 1, 1,
0.1608572, -0.5443361, 3.105701, 0, 0.6235294, 1, 1,
0.1614875, -0.3143761, 2.961509, 0, 0.6156863, 1, 1,
0.1621038, -2.063245, 3.753351, 0, 0.6117647, 1, 1,
0.1680372, -0.704671, 2.698757, 0, 0.6039216, 1, 1,
0.1687227, 1.458723, -1.008647, 0, 0.5960785, 1, 1,
0.1688124, 0.716513, 0.08815981, 0, 0.5921569, 1, 1,
0.1694653, -0.7656331, 3.017833, 0, 0.5843138, 1, 1,
0.1704237, 1.676854, -0.3639868, 0, 0.5803922, 1, 1,
0.1735238, -0.01450303, 0.3461305, 0, 0.572549, 1, 1,
0.1805943, 1.252737, 0.2819903, 0, 0.5686275, 1, 1,
0.1845746, -0.05066654, 2.056318, 0, 0.5607843, 1, 1,
0.1918692, -0.6340446, 1.921889, 0, 0.5568628, 1, 1,
0.1943706, 2.153374, 0.7116949, 0, 0.5490196, 1, 1,
0.1968416, 1.593901, -0.583549, 0, 0.5450981, 1, 1,
0.2010928, -0.004904003, 3.187488, 0, 0.5372549, 1, 1,
0.2021415, 0.6389535, -1.948817, 0, 0.5333334, 1, 1,
0.2098006, -0.9246382, 3.06269, 0, 0.5254902, 1, 1,
0.2179057, -0.8392926, 2.681586, 0, 0.5215687, 1, 1,
0.2186751, 0.6960725, 1.580184, 0, 0.5137255, 1, 1,
0.2229882, -0.9381839, 3.262692, 0, 0.509804, 1, 1,
0.2244063, 1.272029, -0.01920135, 0, 0.5019608, 1, 1,
0.2248791, 0.6815369, -0.08635332, 0, 0.4941176, 1, 1,
0.2251952, 0.2385353, 0.7196933, 0, 0.4901961, 1, 1,
0.2268384, 0.07212381, 0.5537501, 0, 0.4823529, 1, 1,
0.2273407, -2.36316, 3.687207, 0, 0.4784314, 1, 1,
0.22935, -1.372481, 2.00735, 0, 0.4705882, 1, 1,
0.2303285, -0.8773179, 2.668859, 0, 0.4666667, 1, 1,
0.2311911, 0.8279181, -0.8140702, 0, 0.4588235, 1, 1,
0.2320954, 0.6379175, 0.6326945, 0, 0.454902, 1, 1,
0.2418282, 0.3452666, 0.3380174, 0, 0.4470588, 1, 1,
0.2491771, -0.4210657, 3.548796, 0, 0.4431373, 1, 1,
0.2507907, 0.2745861, -0.7859753, 0, 0.4352941, 1, 1,
0.2525555, -1.901798, 1.857791, 0, 0.4313726, 1, 1,
0.2559501, 0.05753931, 1.479557, 0, 0.4235294, 1, 1,
0.2563502, 1.456977, -0.7300172, 0, 0.4196078, 1, 1,
0.2572091, -1.604863, 1.976597, 0, 0.4117647, 1, 1,
0.2598254, -1.023642, 1.35778, 0, 0.4078431, 1, 1,
0.2619308, -0.5808309, 2.256511, 0, 0.4, 1, 1,
0.2701307, -2.213231, 4.50913, 0, 0.3921569, 1, 1,
0.2712483, 0.8701217, 0.1366438, 0, 0.3882353, 1, 1,
0.272149, 0.1793486, -0.1220865, 0, 0.3803922, 1, 1,
0.2724821, -0.5680788, 2.489611, 0, 0.3764706, 1, 1,
0.2751071, 1.351916, -1.222892, 0, 0.3686275, 1, 1,
0.2782538, -0.8712566, 2.17386, 0, 0.3647059, 1, 1,
0.2794378, -0.08479031, 1.96807, 0, 0.3568628, 1, 1,
0.2803602, -0.09982993, 0.9967627, 0, 0.3529412, 1, 1,
0.2810524, 0.1450399, 2.400969, 0, 0.345098, 1, 1,
0.2831216, 1.404026, 1.447038, 0, 0.3411765, 1, 1,
0.2906141, 0.5501847, 0.3457224, 0, 0.3333333, 1, 1,
0.2933252, -1.932091, 3.01601, 0, 0.3294118, 1, 1,
0.2973627, -0.286184, 1.918668, 0, 0.3215686, 1, 1,
0.297441, -2.35736, 3.58367, 0, 0.3176471, 1, 1,
0.2982802, 1.066995, -0.8067566, 0, 0.3098039, 1, 1,
0.2990934, -1.326537, 3.355665, 0, 0.3058824, 1, 1,
0.2997328, 0.1359104, 3.340758, 0, 0.2980392, 1, 1,
0.3005013, -0.1596288, 3.177689, 0, 0.2901961, 1, 1,
0.3033334, -0.9095739, 1.410527, 0, 0.2862745, 1, 1,
0.3043922, -1.124242, 2.500387, 0, 0.2784314, 1, 1,
0.3048488, 1.312953, -0.8657543, 0, 0.2745098, 1, 1,
0.3059072, -0.5650204, 1.67635, 0, 0.2666667, 1, 1,
0.307117, 0.3270462, 2.233969, 0, 0.2627451, 1, 1,
0.3083617, -0.1156095, 3.16741, 0, 0.254902, 1, 1,
0.3096762, -1.416177, 2.20501, 0, 0.2509804, 1, 1,
0.3106605, -0.4731948, 3.95385, 0, 0.2431373, 1, 1,
0.3142269, -0.4903958, 0.5118816, 0, 0.2392157, 1, 1,
0.3164451, -1.864419, 1.617826, 0, 0.2313726, 1, 1,
0.3171019, 0.8246745, 0.4928057, 0, 0.227451, 1, 1,
0.317774, 0.2045225, 0.899304, 0, 0.2196078, 1, 1,
0.3180169, -1.193345, 3.113873, 0, 0.2156863, 1, 1,
0.3245967, 0.6652184, 1.864801, 0, 0.2078431, 1, 1,
0.3248793, 0.4582365, -0.7772163, 0, 0.2039216, 1, 1,
0.3276473, -0.436089, 3.361621, 0, 0.1960784, 1, 1,
0.3288771, -0.9167092, 3.365756, 0, 0.1882353, 1, 1,
0.3297488, 0.3376581, -1.044109, 0, 0.1843137, 1, 1,
0.3299031, -0.9704452, 3.627038, 0, 0.1764706, 1, 1,
0.3380066, -0.9328206, 2.185425, 0, 0.172549, 1, 1,
0.3401478, -0.2930966, 0.8119057, 0, 0.1647059, 1, 1,
0.3452039, -2.279644, 2.230933, 0, 0.1607843, 1, 1,
0.3478537, -0.725099, 2.723577, 0, 0.1529412, 1, 1,
0.348696, 0.9372059, -1.313064, 0, 0.1490196, 1, 1,
0.3489855, 0.5305605, 1.267204, 0, 0.1411765, 1, 1,
0.3573931, -0.700815, 1.868287, 0, 0.1372549, 1, 1,
0.3579431, -0.1066508, 1.915017, 0, 0.1294118, 1, 1,
0.3586819, 2.083923, 1.131128, 0, 0.1254902, 1, 1,
0.3609368, -1.207615, 2.085629, 0, 0.1176471, 1, 1,
0.3610899, -0.05911281, 0.6848788, 0, 0.1137255, 1, 1,
0.361798, -0.6554781, 3.824348, 0, 0.1058824, 1, 1,
0.3624887, 0.4284832, 2.047206, 0, 0.09803922, 1, 1,
0.3636613, 0.4638418, 0.4325745, 0, 0.09411765, 1, 1,
0.3665229, -0.3241678, 2.27045, 0, 0.08627451, 1, 1,
0.3667936, 0.297964, 3.073752, 0, 0.08235294, 1, 1,
0.3676123, 1.53336, 0.9666481, 0, 0.07450981, 1, 1,
0.3714054, 1.355552, -0.003887604, 0, 0.07058824, 1, 1,
0.3745915, 0.1783855, 0.9452258, 0, 0.0627451, 1, 1,
0.3784685, -1.505966, 1.106815, 0, 0.05882353, 1, 1,
0.378478, -1.090479, 2.926361, 0, 0.05098039, 1, 1,
0.3822412, -0.2023097, 2.361289, 0, 0.04705882, 1, 1,
0.383927, 0.8083223, -0.4992805, 0, 0.03921569, 1, 1,
0.3858073, -1.14425, 1.606652, 0, 0.03529412, 1, 1,
0.3860535, -0.9303643, 1.667092, 0, 0.02745098, 1, 1,
0.3882482, 0.03452041, 1.37828, 0, 0.02352941, 1, 1,
0.3929814, -1.007816, 3.239781, 0, 0.01568628, 1, 1,
0.4008245, 0.5223855, 0.03037354, 0, 0.01176471, 1, 1,
0.4027315, 1.064697, 1.632041, 0, 0.003921569, 1, 1,
0.4034952, 0.8287963, 0.1400024, 0.003921569, 0, 1, 1,
0.4039266, 0.4152495, -0.01524489, 0.007843138, 0, 1, 1,
0.4041817, 0.03486926, 1.259611, 0.01568628, 0, 1, 1,
0.4060992, 0.806194, 0.7153913, 0.01960784, 0, 1, 1,
0.4108423, 0.05009481, 0.7320509, 0.02745098, 0, 1, 1,
0.4115993, -0.8177335, 2.37074, 0.03137255, 0, 1, 1,
0.4156383, -0.6887979, 2.560906, 0.03921569, 0, 1, 1,
0.4184761, 0.144543, 0.3815769, 0.04313726, 0, 1, 1,
0.42224, -0.2592421, 0.2236092, 0.05098039, 0, 1, 1,
0.4242692, 1.096562, 0.7541493, 0.05490196, 0, 1, 1,
0.4250775, -0.5857254, 3.402603, 0.0627451, 0, 1, 1,
0.4306841, 0.9955214, 0.3267898, 0.06666667, 0, 1, 1,
0.4340494, 1.102708, -0.283666, 0.07450981, 0, 1, 1,
0.4357781, -1.107161, 3.660109, 0.07843138, 0, 1, 1,
0.4360472, -0.6524179, 1.291527, 0.08627451, 0, 1, 1,
0.437604, -0.9534555, 2.650339, 0.09019608, 0, 1, 1,
0.4389886, 1.418821, 0.7440079, 0.09803922, 0, 1, 1,
0.4394666, 0.1949104, 0.7977227, 0.1058824, 0, 1, 1,
0.4404657, 0.1352353, 0.7054845, 0.1098039, 0, 1, 1,
0.4426725, 2.75109, -0.08444778, 0.1176471, 0, 1, 1,
0.4437375, -0.05228788, 0.618547, 0.1215686, 0, 1, 1,
0.4437582, 0.8157804, 1.424078, 0.1294118, 0, 1, 1,
0.4439443, -0.308562, 3.494499, 0.1333333, 0, 1, 1,
0.4451385, -0.1188133, 1.1425, 0.1411765, 0, 1, 1,
0.4454568, 1.261139, 2.094134, 0.145098, 0, 1, 1,
0.449662, -0.5512712, 2.250423, 0.1529412, 0, 1, 1,
0.4497373, -0.1317428, 1.004574, 0.1568628, 0, 1, 1,
0.4583674, 1.787747, 0.6858469, 0.1647059, 0, 1, 1,
0.4598195, -0.2785212, 0.7556755, 0.1686275, 0, 1, 1,
0.4611417, 1.135135, 0.6390118, 0.1764706, 0, 1, 1,
0.4623162, 0.7608845, 1.778891, 0.1803922, 0, 1, 1,
0.4669394, -1.564685, 2.368965, 0.1882353, 0, 1, 1,
0.4685686, 0.8761653, 0.2155959, 0.1921569, 0, 1, 1,
0.473234, -0.9952566, 0.6633824, 0.2, 0, 1, 1,
0.4785061, -0.1069723, 0.8686182, 0.2078431, 0, 1, 1,
0.4785601, 1.044067, 0.6557686, 0.2117647, 0, 1, 1,
0.4798474, -0.6566483, 1.405252, 0.2196078, 0, 1, 1,
0.4828439, -1.72309, 2.670727, 0.2235294, 0, 1, 1,
0.4829848, -1.700217, 2.489557, 0.2313726, 0, 1, 1,
0.484041, -0.4297419, 2.333224, 0.2352941, 0, 1, 1,
0.4933034, 1.168924, -1.0695, 0.2431373, 0, 1, 1,
0.4947668, 0.5528688, 0.9247987, 0.2470588, 0, 1, 1,
0.4956451, 1.014035, -1.489055, 0.254902, 0, 1, 1,
0.4964998, 0.4411665, 2.259389, 0.2588235, 0, 1, 1,
0.5006005, 0.3967166, 1.01236, 0.2666667, 0, 1, 1,
0.5037976, -0.1435926, 2.213667, 0.2705882, 0, 1, 1,
0.5109858, 0.4019529, 1.187983, 0.2784314, 0, 1, 1,
0.5164343, 0.5651214, -0.6694843, 0.282353, 0, 1, 1,
0.5179014, -1.074853, 2.453683, 0.2901961, 0, 1, 1,
0.5207873, -0.8956943, 1.408343, 0.2941177, 0, 1, 1,
0.5229453, 0.4004949, 1.900263, 0.3019608, 0, 1, 1,
0.5276327, -0.02532021, 0.4097483, 0.3098039, 0, 1, 1,
0.5357211, 1.054973, 0.9353762, 0.3137255, 0, 1, 1,
0.5468822, 1.568868, 1.111242, 0.3215686, 0, 1, 1,
0.5514923, 0.1914248, 1.993391, 0.3254902, 0, 1, 1,
0.5565177, -0.1557604, 0.9876132, 0.3333333, 0, 1, 1,
0.5606739, 0.7758689, 0.3279222, 0.3372549, 0, 1, 1,
0.5669539, -1.972677, 2.684558, 0.345098, 0, 1, 1,
0.5741315, 0.6528026, 1.597607, 0.3490196, 0, 1, 1,
0.5744748, 0.05465605, 1.083194, 0.3568628, 0, 1, 1,
0.5811173, -0.3622084, 2.862906, 0.3607843, 0, 1, 1,
0.5856218, -0.3448926, 1.249575, 0.3686275, 0, 1, 1,
0.5911107, 1.168935, 1.103464, 0.372549, 0, 1, 1,
0.5912814, 0.3935076, 0.2554013, 0.3803922, 0, 1, 1,
0.5965872, 1.213039, 1.654697, 0.3843137, 0, 1, 1,
0.5998838, -0.4055422, 2.59629, 0.3921569, 0, 1, 1,
0.6011047, 2.213222, 0.615564, 0.3960784, 0, 1, 1,
0.6029758, 1.506891, 1.613657, 0.4039216, 0, 1, 1,
0.6165699, 0.7961012, 0.07124069, 0.4117647, 0, 1, 1,
0.6186137, 0.7798081, 0.1349284, 0.4156863, 0, 1, 1,
0.6272319, -1.883397, 3.453447, 0.4235294, 0, 1, 1,
0.6303332, 0.08950405, 1.696016, 0.427451, 0, 1, 1,
0.637215, -0.2540245, 1.810528, 0.4352941, 0, 1, 1,
0.6375691, 1.104188, 1.733609, 0.4392157, 0, 1, 1,
0.6388738, -0.1663097, 3.709602, 0.4470588, 0, 1, 1,
0.6567371, -1.174118, 3.539331, 0.4509804, 0, 1, 1,
0.6626436, 0.07545063, 1.542425, 0.4588235, 0, 1, 1,
0.6639714, -0.7640612, 2.759152, 0.4627451, 0, 1, 1,
0.6643137, -1.258387, 1.937093, 0.4705882, 0, 1, 1,
0.6747317, 0.8698241, 0.7216519, 0.4745098, 0, 1, 1,
0.6768749, 1.047539, 0.2361282, 0.4823529, 0, 1, 1,
0.6793594, 1.612825, 0.7722121, 0.4862745, 0, 1, 1,
0.6795265, 0.906975, 0.1441914, 0.4941176, 0, 1, 1,
0.6797456, -0.3583837, 2.313162, 0.5019608, 0, 1, 1,
0.6871006, -0.8202562, 1.650017, 0.5058824, 0, 1, 1,
0.6939768, 1.206633, 0.03266294, 0.5137255, 0, 1, 1,
0.6947545, 0.8420693, -0.01936565, 0.5176471, 0, 1, 1,
0.6967025, 0.1793743, 0.7528291, 0.5254902, 0, 1, 1,
0.6975089, 0.8415355, -0.3656542, 0.5294118, 0, 1, 1,
0.6991435, 0.9745359, -0.3244754, 0.5372549, 0, 1, 1,
0.699194, -0.1477069, 1.777846, 0.5411765, 0, 1, 1,
0.7016916, 0.206713, 1.252428, 0.5490196, 0, 1, 1,
0.7071288, -0.450834, 1.206066, 0.5529412, 0, 1, 1,
0.7077484, 2.235846, 0.5692541, 0.5607843, 0, 1, 1,
0.708048, 0.6834691, -0.770398, 0.5647059, 0, 1, 1,
0.7081634, 0.3394529, 1.165203, 0.572549, 0, 1, 1,
0.7198831, 0.1738677, 1.194023, 0.5764706, 0, 1, 1,
0.721279, -0.8369948, 4.339993, 0.5843138, 0, 1, 1,
0.7216214, 1.312302, -1.474087, 0.5882353, 0, 1, 1,
0.7248455, 0.05343204, 2.089473, 0.5960785, 0, 1, 1,
0.7271193, -0.6262246, 2.673893, 0.6039216, 0, 1, 1,
0.7276373, -1.043965, 2.647245, 0.6078432, 0, 1, 1,
0.7277348, 1.689666, 0.5730309, 0.6156863, 0, 1, 1,
0.7303291, 0.2914767, 1.525648, 0.6196079, 0, 1, 1,
0.7311352, -0.1104864, 0.07631575, 0.627451, 0, 1, 1,
0.7328128, 2.380283, 0.8107263, 0.6313726, 0, 1, 1,
0.7342584, -0.148094, 0.4081472, 0.6392157, 0, 1, 1,
0.7345956, 0.7459937, -1.720454, 0.6431373, 0, 1, 1,
0.7347144, -0.4236084, 2.488261, 0.6509804, 0, 1, 1,
0.7352806, 1.157081, -0.1016482, 0.654902, 0, 1, 1,
0.7355248, 1.801576, 2.245764, 0.6627451, 0, 1, 1,
0.7412338, -2.362258, 1.264935, 0.6666667, 0, 1, 1,
0.7413384, 0.899973, 0.3000213, 0.6745098, 0, 1, 1,
0.7429388, 0.3270508, 0.496029, 0.6784314, 0, 1, 1,
0.745051, -0.8872316, 2.938929, 0.6862745, 0, 1, 1,
0.7579767, -0.4014549, 1.330275, 0.6901961, 0, 1, 1,
0.7593111, 1.703112, -0.7751386, 0.6980392, 0, 1, 1,
0.7616334, -0.5993016, 4.155212, 0.7058824, 0, 1, 1,
0.7635177, -0.220228, 2.827713, 0.7098039, 0, 1, 1,
0.7643611, 1.204127, 1.52541, 0.7176471, 0, 1, 1,
0.7679721, 0.6769857, -0.05238578, 0.7215686, 0, 1, 1,
0.7735409, -0.587998, 2.544952, 0.7294118, 0, 1, 1,
0.7784438, -0.9150832, 1.562243, 0.7333333, 0, 1, 1,
0.7787802, -0.3152527, 2.82477, 0.7411765, 0, 1, 1,
0.7876863, 0.5872502, -2.006153, 0.7450981, 0, 1, 1,
0.7898152, -0.819137, 3.493362, 0.7529412, 0, 1, 1,
0.7927831, -1.213047, 1.990005, 0.7568628, 0, 1, 1,
0.7942027, 0.2956601, 1.517627, 0.7647059, 0, 1, 1,
0.7949215, 1.296282, -0.7556441, 0.7686275, 0, 1, 1,
0.7961789, -0.4316702, 2.488744, 0.7764706, 0, 1, 1,
0.7995743, 0.1243116, 1.128707, 0.7803922, 0, 1, 1,
0.8087416, -0.1657129, 3.170999, 0.7882353, 0, 1, 1,
0.8186263, 0.1995099, 0.7815251, 0.7921569, 0, 1, 1,
0.8236142, -0.3194759, 2.0106, 0.8, 0, 1, 1,
0.8292688, 0.4374237, 1.154948, 0.8078431, 0, 1, 1,
0.8393832, 0.7770295, -0.8735567, 0.8117647, 0, 1, 1,
0.8401034, 0.0451303, 1.435255, 0.8196079, 0, 1, 1,
0.8496869, -1.001046, 0.7325543, 0.8235294, 0, 1, 1,
0.8497232, 0.340764, 1.590443, 0.8313726, 0, 1, 1,
0.8500637, -0.6699594, 1.11215, 0.8352941, 0, 1, 1,
0.8504583, -0.7262921, 1.955528, 0.8431373, 0, 1, 1,
0.8643358, -0.9753426, 3.276842, 0.8470588, 0, 1, 1,
0.8645105, 0.05989082, 2.793487, 0.854902, 0, 1, 1,
0.8654838, 0.4308343, -0.6882272, 0.8588235, 0, 1, 1,
0.8661334, -0.3708835, 2.003861, 0.8666667, 0, 1, 1,
0.8697603, -0.05417565, 2.291282, 0.8705882, 0, 1, 1,
0.8757669, 1.078584, -0.04629749, 0.8784314, 0, 1, 1,
0.877134, -0.07413264, 3.93106, 0.8823529, 0, 1, 1,
0.8930213, -0.3642536, 4.465776, 0.8901961, 0, 1, 1,
0.8937123, -1.115853, 2.685472, 0.8941177, 0, 1, 1,
0.8939725, 0.859411, 0.3823963, 0.9019608, 0, 1, 1,
0.8966368, 0.2143603, 2.63496, 0.9098039, 0, 1, 1,
0.8984294, 0.6644321, 0.8951984, 0.9137255, 0, 1, 1,
0.9017251, 1.113274, 1.870328, 0.9215686, 0, 1, 1,
0.9018909, -1.239334, 1.627445, 0.9254902, 0, 1, 1,
0.9026026, -0.2554992, 1.448693, 0.9333333, 0, 1, 1,
0.9047166, -0.5289161, 3.783976, 0.9372549, 0, 1, 1,
0.9081638, -0.48397, 1.350469, 0.945098, 0, 1, 1,
0.9108571, 0.6744448, 1.869926, 0.9490196, 0, 1, 1,
0.914427, -0.001857554, 1.060778, 0.9568627, 0, 1, 1,
0.9200995, -0.3971394, 3.906397, 0.9607843, 0, 1, 1,
0.9202452, -0.07760958, 1.305377, 0.9686275, 0, 1, 1,
0.925864, 2.034467, 0.04156062, 0.972549, 0, 1, 1,
0.9265621, 2.238723, 0.8342804, 0.9803922, 0, 1, 1,
0.9302255, -0.04540048, 1.804486, 0.9843137, 0, 1, 1,
0.9380131, 1.657675, -0.9306871, 0.9921569, 0, 1, 1,
0.940283, 0.6555543, -1.268974, 0.9960784, 0, 1, 1,
0.9433462, -0.1631517, 1.508856, 1, 0, 0.9960784, 1,
0.9557071, 1.288004, 1.580463, 1, 0, 0.9882353, 1,
0.9682354, 0.9128271, 1.500344, 1, 0, 0.9843137, 1,
0.9704255, -0.4728007, 2.939288, 1, 0, 0.9764706, 1,
0.9831275, -0.3929798, 2.804713, 1, 0, 0.972549, 1,
0.9831294, -0.3417553, 2.396746, 1, 0, 0.9647059, 1,
0.986804, 2.219741, 0.7169467, 1, 0, 0.9607843, 1,
0.9877883, -0.01756936, 1.140504, 1, 0, 0.9529412, 1,
0.9908413, 1.808644, 0.3709778, 1, 0, 0.9490196, 1,
0.9915175, -1.24036, 3.691182, 1, 0, 0.9411765, 1,
1.003606, -0.08015199, -0.2287388, 1, 0, 0.9372549, 1,
1.005697, 0.4193367, -0.2882977, 1, 0, 0.9294118, 1,
1.007135, 0.4203603, 0.7325135, 1, 0, 0.9254902, 1,
1.007674, 0.2011739, 0.1780959, 1, 0, 0.9176471, 1,
1.010804, -1.752894, 0.8881537, 1, 0, 0.9137255, 1,
1.018792, -1.984551, 2.241203, 1, 0, 0.9058824, 1,
1.024625, 0.1733281, 1.791056, 1, 0, 0.9019608, 1,
1.031079, -0.3379407, 0.2077329, 1, 0, 0.8941177, 1,
1.034411, 0.9214742, 0.7840247, 1, 0, 0.8862745, 1,
1.038553, -0.1246716, 1.415906, 1, 0, 0.8823529, 1,
1.041259, 0.7917036, -0.306295, 1, 0, 0.8745098, 1,
1.043461, 1.297112, -1.868628, 1, 0, 0.8705882, 1,
1.044446, 0.591505, 1.608528, 1, 0, 0.8627451, 1,
1.051369, -1.952842, 3.5931, 1, 0, 0.8588235, 1,
1.054118, -0.1938913, 1.349823, 1, 0, 0.8509804, 1,
1.058282, 1.854094, 1.002356, 1, 0, 0.8470588, 1,
1.059226, -1.574203, 1.946014, 1, 0, 0.8392157, 1,
1.059291, 0.484276, -0.04650211, 1, 0, 0.8352941, 1,
1.062233, 0.8556171, 2.896922, 1, 0, 0.827451, 1,
1.070599, -1.822077, 2.365138, 1, 0, 0.8235294, 1,
1.077546, -0.2117292, 0.9676628, 1, 0, 0.8156863, 1,
1.089067, -1.69133, 1.554153, 1, 0, 0.8117647, 1,
1.104498, 0.6743665, 1.007796, 1, 0, 0.8039216, 1,
1.104974, -0.805134, 1.86937, 1, 0, 0.7960784, 1,
1.107426, -1.469653, 3.829193, 1, 0, 0.7921569, 1,
1.108247, 0.6934868, 1.833616, 1, 0, 0.7843137, 1,
1.108848, 0.2663, 1.182487, 1, 0, 0.7803922, 1,
1.109359, 0.04272303, 0.7710947, 1, 0, 0.772549, 1,
1.114897, -0.7438567, 1.715644, 1, 0, 0.7686275, 1,
1.120782, 0.7808031, 1.362734, 1, 0, 0.7607843, 1,
1.120925, -0.08505001, 1.800503, 1, 0, 0.7568628, 1,
1.121023, -0.4493649, 2.36535, 1, 0, 0.7490196, 1,
1.125681, -0.6767525, 0.490739, 1, 0, 0.7450981, 1,
1.130957, 1.916769, -0.08225774, 1, 0, 0.7372549, 1,
1.142471, -0.3656411, 1.172702, 1, 0, 0.7333333, 1,
1.148993, -0.08497356, 1.247051, 1, 0, 0.7254902, 1,
1.150315, -0.8984686, 3.98704, 1, 0, 0.7215686, 1,
1.171763, 1.86043, 0.2017695, 1, 0, 0.7137255, 1,
1.173465, -0.4570269, 2.386075, 1, 0, 0.7098039, 1,
1.176387, -0.01701814, 2.218139, 1, 0, 0.7019608, 1,
1.176956, 1.052822, -0.5903043, 1, 0, 0.6941177, 1,
1.177227, 2.181344, 0.5412758, 1, 0, 0.6901961, 1,
1.178301, -1.001832, 0.9617673, 1, 0, 0.682353, 1,
1.180484, 1.324236, 0.9641047, 1, 0, 0.6784314, 1,
1.183236, -0.7412496, 2.23585, 1, 0, 0.6705883, 1,
1.195164, -0.5360597, 1.364169, 1, 0, 0.6666667, 1,
1.198779, 0.5893683, 0.04498228, 1, 0, 0.6588235, 1,
1.203231, 0.4880425, 0.614076, 1, 0, 0.654902, 1,
1.206797, -1.589549, 3.767995, 1, 0, 0.6470588, 1,
1.207797, 0.7219985, 1.013581, 1, 0, 0.6431373, 1,
1.209068, 0.3264578, 2.409281, 1, 0, 0.6352941, 1,
1.213544, -0.08317078, 2.263924, 1, 0, 0.6313726, 1,
1.219458, 0.4617672, 0.4991416, 1, 0, 0.6235294, 1,
1.22154, 0.156677, 1.988653, 1, 0, 0.6196079, 1,
1.221791, -2.377778, 2.833742, 1, 0, 0.6117647, 1,
1.22382, 0.4424886, -0.0519292, 1, 0, 0.6078432, 1,
1.223859, 0.2952945, 0.4195296, 1, 0, 0.6, 1,
1.229413, -1.847936, 4.152145, 1, 0, 0.5921569, 1,
1.234134, 0.2206513, 0.905978, 1, 0, 0.5882353, 1,
1.250032, -1.766852, 2.266246, 1, 0, 0.5803922, 1,
1.257924, 0.1594701, 0.9075328, 1, 0, 0.5764706, 1,
1.281102, 0.4070307, 2.180051, 1, 0, 0.5686275, 1,
1.290446, 1.035593, 2.277632, 1, 0, 0.5647059, 1,
1.293611, 0.3604208, 1.486115, 1, 0, 0.5568628, 1,
1.301444, -1.267903, 1.524761, 1, 0, 0.5529412, 1,
1.304809, 0.2275271, 0.1642945, 1, 0, 0.5450981, 1,
1.318276, -0.8312955, 2.156345, 1, 0, 0.5411765, 1,
1.32182, -0.2054002, 0.9131496, 1, 0, 0.5333334, 1,
1.323923, 0.4455771, 1.776404, 1, 0, 0.5294118, 1,
1.344154, -2.031513, 3.55827, 1, 0, 0.5215687, 1,
1.34441, 0.1545997, 1.192269, 1, 0, 0.5176471, 1,
1.347133, -0.328545, 1.868613, 1, 0, 0.509804, 1,
1.353881, 0.5026091, 1.630438, 1, 0, 0.5058824, 1,
1.358415, -1.25113, 0.5888543, 1, 0, 0.4980392, 1,
1.359408, -0.07819511, 1.619641, 1, 0, 0.4901961, 1,
1.375358, -1.357201, 3.616212, 1, 0, 0.4862745, 1,
1.380833, -0.5530741, 1.446782, 1, 0, 0.4784314, 1,
1.39234, 0.8616949, 2.457391, 1, 0, 0.4745098, 1,
1.416042, -0.2297966, 0.05646584, 1, 0, 0.4666667, 1,
1.427906, 0.983034, 0.5598019, 1, 0, 0.4627451, 1,
1.432193, -0.005536202, 3.654615, 1, 0, 0.454902, 1,
1.432869, -2.03238, 2.537327, 1, 0, 0.4509804, 1,
1.44405, 0.08147067, 3.00795, 1, 0, 0.4431373, 1,
1.444871, 0.2512936, 0.7650344, 1, 0, 0.4392157, 1,
1.461356, 0.4176986, 2.281617, 1, 0, 0.4313726, 1,
1.471409, 0.9446394, -0.6202608, 1, 0, 0.427451, 1,
1.473935, -0.9003437, 2.836325, 1, 0, 0.4196078, 1,
1.475308, 1.363879, 1.300801, 1, 0, 0.4156863, 1,
1.480119, 0.7020139, 0.594707, 1, 0, 0.4078431, 1,
1.488113, 0.6408108, 1.603573, 1, 0, 0.4039216, 1,
1.493751, -0.07620175, 2.691804, 1, 0, 0.3960784, 1,
1.506505, 0.8745695, 1.709587, 1, 0, 0.3882353, 1,
1.51304, 0.3481672, 2.623312, 1, 0, 0.3843137, 1,
1.513746, -1.143653, 1.580405, 1, 0, 0.3764706, 1,
1.514868, -0.7970095, 0.9052953, 1, 0, 0.372549, 1,
1.531313, 1.269982, 1.874476, 1, 0, 0.3647059, 1,
1.542273, 0.891785, 2.831648, 1, 0, 0.3607843, 1,
1.549693, -0.03236432, -0.007101533, 1, 0, 0.3529412, 1,
1.550501, -1.825681, 1.703798, 1, 0, 0.3490196, 1,
1.551387, -0.8494835, 3.103418, 1, 0, 0.3411765, 1,
1.560171, -0.9196143, 2.051543, 1, 0, 0.3372549, 1,
1.570609, -0.336521, 0.893115, 1, 0, 0.3294118, 1,
1.571643, -1.21334, 3.319659, 1, 0, 0.3254902, 1,
1.578858, -0.5811357, 0.8324808, 1, 0, 0.3176471, 1,
1.638218, -0.2294929, 2.112253, 1, 0, 0.3137255, 1,
1.655057, 0.6515406, 0.2276852, 1, 0, 0.3058824, 1,
1.655792, -2.038711, 1.389865, 1, 0, 0.2980392, 1,
1.658508, 0.5403509, -0.2025542, 1, 0, 0.2941177, 1,
1.671988, 0.1074685, 0.666616, 1, 0, 0.2862745, 1,
1.67806, 0.261544, 1.68028, 1, 0, 0.282353, 1,
1.68925, -0.7257332, 1.878379, 1, 0, 0.2745098, 1,
1.706594, -1.5572, 2.049871, 1, 0, 0.2705882, 1,
1.707496, -1.407515, 1.756667, 1, 0, 0.2627451, 1,
1.714784, -0.9974014, 1.91512, 1, 0, 0.2588235, 1,
1.716583, 1.397094, -0.2259389, 1, 0, 0.2509804, 1,
1.72348, 0.7856023, 1.394172, 1, 0, 0.2470588, 1,
1.724083, 0.2254789, -0.4617948, 1, 0, 0.2392157, 1,
1.74141, 0.8428276, 0.4084449, 1, 0, 0.2352941, 1,
1.749357, -0.3063324, 1.145008, 1, 0, 0.227451, 1,
1.75536, -1.13417, 1.590121, 1, 0, 0.2235294, 1,
1.784822, 0.07355511, 0.8908169, 1, 0, 0.2156863, 1,
1.784917, -1.796662, 1.613726, 1, 0, 0.2117647, 1,
1.831464, -0.04306694, 1.760578, 1, 0, 0.2039216, 1,
1.842739, 0.8544638, 1.942471, 1, 0, 0.1960784, 1,
1.845789, 0.160506, 1.128147, 1, 0, 0.1921569, 1,
1.851257, -0.4183528, 2.362073, 1, 0, 0.1843137, 1,
1.851827, 0.1171559, 1.876383, 1, 0, 0.1803922, 1,
1.863899, 0.6342905, 1.789133, 1, 0, 0.172549, 1,
1.909288, -0.1128666, 0.7437226, 1, 0, 0.1686275, 1,
1.928052, -0.4952877, 1.316276, 1, 0, 0.1607843, 1,
1.961719, -0.3907074, 1.670092, 1, 0, 0.1568628, 1,
1.978801, 0.2403687, 1.078501, 1, 0, 0.1490196, 1,
2.004612, -0.7371092, 2.331095, 1, 0, 0.145098, 1,
2.060323, 0.5252184, 0.7754273, 1, 0, 0.1372549, 1,
2.073993, -0.7435564, 2.557611, 1, 0, 0.1333333, 1,
2.085951, -0.2784772, 2.496621, 1, 0, 0.1254902, 1,
2.092499, 1.070138, 1.94148, 1, 0, 0.1215686, 1,
2.142413, -1.901852, -0.05964099, 1, 0, 0.1137255, 1,
2.144881, -0.5718772, 0.3676054, 1, 0, 0.1098039, 1,
2.165833, 0.557633, -0.3094918, 1, 0, 0.1019608, 1,
2.167502, 1.771377, 0.340454, 1, 0, 0.09411765, 1,
2.211977, 0.795595, 0.1358821, 1, 0, 0.09019608, 1,
2.213831, 0.09304445, 0.9264054, 1, 0, 0.08235294, 1,
2.236973, -0.8992859, 2.293199, 1, 0, 0.07843138, 1,
2.261954, 0.08855702, 0.5422777, 1, 0, 0.07058824, 1,
2.269005, -0.4679831, 0.952801, 1, 0, 0.06666667, 1,
2.316928, 2.147058, -1.109493, 1, 0, 0.05882353, 1,
2.343167, -0.2014754, 1.192346, 1, 0, 0.05490196, 1,
2.362775, -0.7000386, 1.399656, 1, 0, 0.04705882, 1,
2.371671, 1.896091, -0.5366631, 1, 0, 0.04313726, 1,
2.377765, -0.03505683, 2.319052, 1, 0, 0.03529412, 1,
2.391006, -0.958445, 1.509313, 1, 0, 0.03137255, 1,
2.466729, -0.4870374, 2.206822, 1, 0, 0.02352941, 1,
2.602167, -1.109602, 2.793436, 1, 0, 0.01960784, 1,
2.623281, 0.6830081, -0.02108545, 1, 0, 0.01176471, 1,
2.92732, 1.17959, 1.188573, 1, 0, 0.007843138, 1
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
-0.01103628, -4.364208, -7.239068, 0, -0.5, 0.5, 0.5,
-0.01103628, -4.364208, -7.239068, 1, -0.5, 0.5, 0.5,
-0.01103628, -4.364208, -7.239068, 1, 1.5, 0.5, 0.5,
-0.01103628, -4.364208, -7.239068, 0, 1.5, 0.5, 0.5
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
-3.945495, 0.3156776, -7.239068, 0, -0.5, 0.5, 0.5,
-3.945495, 0.3156776, -7.239068, 1, -0.5, 0.5, 0.5,
-3.945495, 0.3156776, -7.239068, 1, 1.5, 0.5, 0.5,
-3.945495, 0.3156776, -7.239068, 0, 1.5, 0.5, 0.5
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
-3.945495, -4.364208, 0.3964553, 0, -0.5, 0.5, 0.5,
-3.945495, -4.364208, 0.3964553, 1, -0.5, 0.5, 0.5,
-3.945495, -4.364208, 0.3964553, 1, 1.5, 0.5, 0.5,
-3.945495, -4.364208, 0.3964553, 0, 1.5, 0.5, 0.5
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
-2, -3.284235, -5.477024,
2, -3.284235, -5.477024,
-2, -3.284235, -5.477024,
-2, -3.46423, -5.770698,
-1, -3.284235, -5.477024,
-1, -3.46423, -5.770698,
0, -3.284235, -5.477024,
0, -3.46423, -5.770698,
1, -3.284235, -5.477024,
1, -3.46423, -5.770698,
2, -3.284235, -5.477024,
2, -3.46423, -5.770698
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
-2, -3.824221, -6.358046, 0, -0.5, 0.5, 0.5,
-2, -3.824221, -6.358046, 1, -0.5, 0.5, 0.5,
-2, -3.824221, -6.358046, 1, 1.5, 0.5, 0.5,
-2, -3.824221, -6.358046, 0, 1.5, 0.5, 0.5,
-1, -3.824221, -6.358046, 0, -0.5, 0.5, 0.5,
-1, -3.824221, -6.358046, 1, -0.5, 0.5, 0.5,
-1, -3.824221, -6.358046, 1, 1.5, 0.5, 0.5,
-1, -3.824221, -6.358046, 0, 1.5, 0.5, 0.5,
0, -3.824221, -6.358046, 0, -0.5, 0.5, 0.5,
0, -3.824221, -6.358046, 1, -0.5, 0.5, 0.5,
0, -3.824221, -6.358046, 1, 1.5, 0.5, 0.5,
0, -3.824221, -6.358046, 0, 1.5, 0.5, 0.5,
1, -3.824221, -6.358046, 0, -0.5, 0.5, 0.5,
1, -3.824221, -6.358046, 1, -0.5, 0.5, 0.5,
1, -3.824221, -6.358046, 1, 1.5, 0.5, 0.5,
1, -3.824221, -6.358046, 0, 1.5, 0.5, 0.5,
2, -3.824221, -6.358046, 0, -0.5, 0.5, 0.5,
2, -3.824221, -6.358046, 1, -0.5, 0.5, 0.5,
2, -3.824221, -6.358046, 1, 1.5, 0.5, 0.5,
2, -3.824221, -6.358046, 0, 1.5, 0.5, 0.5
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
-3.037543, -3, -5.477024,
-3.037543, 3, -5.477024,
-3.037543, -3, -5.477024,
-3.188868, -3, -5.770698,
-3.037543, -2, -5.477024,
-3.188868, -2, -5.770698,
-3.037543, -1, -5.477024,
-3.188868, -1, -5.770698,
-3.037543, 0, -5.477024,
-3.188868, 0, -5.770698,
-3.037543, 1, -5.477024,
-3.188868, 1, -5.770698,
-3.037543, 2, -5.477024,
-3.188868, 2, -5.770698,
-3.037543, 3, -5.477024,
-3.188868, 3, -5.770698
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
-3.491519, -3, -6.358046, 0, -0.5, 0.5, 0.5,
-3.491519, -3, -6.358046, 1, -0.5, 0.5, 0.5,
-3.491519, -3, -6.358046, 1, 1.5, 0.5, 0.5,
-3.491519, -3, -6.358046, 0, 1.5, 0.5, 0.5,
-3.491519, -2, -6.358046, 0, -0.5, 0.5, 0.5,
-3.491519, -2, -6.358046, 1, -0.5, 0.5, 0.5,
-3.491519, -2, -6.358046, 1, 1.5, 0.5, 0.5,
-3.491519, -2, -6.358046, 0, 1.5, 0.5, 0.5,
-3.491519, -1, -6.358046, 0, -0.5, 0.5, 0.5,
-3.491519, -1, -6.358046, 1, -0.5, 0.5, 0.5,
-3.491519, -1, -6.358046, 1, 1.5, 0.5, 0.5,
-3.491519, -1, -6.358046, 0, 1.5, 0.5, 0.5,
-3.491519, 0, -6.358046, 0, -0.5, 0.5, 0.5,
-3.491519, 0, -6.358046, 1, -0.5, 0.5, 0.5,
-3.491519, 0, -6.358046, 1, 1.5, 0.5, 0.5,
-3.491519, 0, -6.358046, 0, 1.5, 0.5, 0.5,
-3.491519, 1, -6.358046, 0, -0.5, 0.5, 0.5,
-3.491519, 1, -6.358046, 1, -0.5, 0.5, 0.5,
-3.491519, 1, -6.358046, 1, 1.5, 0.5, 0.5,
-3.491519, 1, -6.358046, 0, 1.5, 0.5, 0.5,
-3.491519, 2, -6.358046, 0, -0.5, 0.5, 0.5,
-3.491519, 2, -6.358046, 1, -0.5, 0.5, 0.5,
-3.491519, 2, -6.358046, 1, 1.5, 0.5, 0.5,
-3.491519, 2, -6.358046, 0, 1.5, 0.5, 0.5,
-3.491519, 3, -6.358046, 0, -0.5, 0.5, 0.5,
-3.491519, 3, -6.358046, 1, -0.5, 0.5, 0.5,
-3.491519, 3, -6.358046, 1, 1.5, 0.5, 0.5,
-3.491519, 3, -6.358046, 0, 1.5, 0.5, 0.5
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
-3.037543, -3.284235, -4,
-3.037543, -3.284235, 6,
-3.037543, -3.284235, -4,
-3.188868, -3.46423, -4,
-3.037543, -3.284235, -2,
-3.188868, -3.46423, -2,
-3.037543, -3.284235, 0,
-3.188868, -3.46423, 0,
-3.037543, -3.284235, 2,
-3.188868, -3.46423, 2,
-3.037543, -3.284235, 4,
-3.188868, -3.46423, 4,
-3.037543, -3.284235, 6,
-3.188868, -3.46423, 6
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
"4",
"6"
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
-3.491519, -3.824221, -4, 0, -0.5, 0.5, 0.5,
-3.491519, -3.824221, -4, 1, -0.5, 0.5, 0.5,
-3.491519, -3.824221, -4, 1, 1.5, 0.5, 0.5,
-3.491519, -3.824221, -4, 0, 1.5, 0.5, 0.5,
-3.491519, -3.824221, -2, 0, -0.5, 0.5, 0.5,
-3.491519, -3.824221, -2, 1, -0.5, 0.5, 0.5,
-3.491519, -3.824221, -2, 1, 1.5, 0.5, 0.5,
-3.491519, -3.824221, -2, 0, 1.5, 0.5, 0.5,
-3.491519, -3.824221, 0, 0, -0.5, 0.5, 0.5,
-3.491519, -3.824221, 0, 1, -0.5, 0.5, 0.5,
-3.491519, -3.824221, 0, 1, 1.5, 0.5, 0.5,
-3.491519, -3.824221, 0, 0, 1.5, 0.5, 0.5,
-3.491519, -3.824221, 2, 0, -0.5, 0.5, 0.5,
-3.491519, -3.824221, 2, 1, -0.5, 0.5, 0.5,
-3.491519, -3.824221, 2, 1, 1.5, 0.5, 0.5,
-3.491519, -3.824221, 2, 0, 1.5, 0.5, 0.5,
-3.491519, -3.824221, 4, 0, -0.5, 0.5, 0.5,
-3.491519, -3.824221, 4, 1, -0.5, 0.5, 0.5,
-3.491519, -3.824221, 4, 1, 1.5, 0.5, 0.5,
-3.491519, -3.824221, 4, 0, 1.5, 0.5, 0.5,
-3.491519, -3.824221, 6, 0, -0.5, 0.5, 0.5,
-3.491519, -3.824221, 6, 1, -0.5, 0.5, 0.5,
-3.491519, -3.824221, 6, 1, 1.5, 0.5, 0.5,
-3.491519, -3.824221, 6, 0, 1.5, 0.5, 0.5
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
-3.037543, -3.284235, -5.477024,
-3.037543, 3.91559, -5.477024,
-3.037543, -3.284235, 6.269935,
-3.037543, 3.91559, 6.269935,
-3.037543, -3.284235, -5.477024,
-3.037543, -3.284235, 6.269935,
-3.037543, 3.91559, -5.477024,
-3.037543, 3.91559, 6.269935,
-3.037543, -3.284235, -5.477024,
3.015471, -3.284235, -5.477024,
-3.037543, -3.284235, 6.269935,
3.015471, -3.284235, 6.269935,
-3.037543, 3.91559, -5.477024,
3.015471, 3.91559, -5.477024,
-3.037543, 3.91559, 6.269935,
3.015471, 3.91559, 6.269935,
3.015471, -3.284235, -5.477024,
3.015471, 3.91559, -5.477024,
3.015471, -3.284235, 6.269935,
3.015471, 3.91559, 6.269935,
3.015471, -3.284235, -5.477024,
3.015471, -3.284235, 6.269935,
3.015471, 3.91559, -5.477024,
3.015471, 3.91559, 6.269935
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
var radius = 8.035787;
var distance = 35.75212;
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
mvMatrix.translate( 0.01103628, -0.3156776, -0.3964553 );
mvMatrix.scale( 1.435392, 1.206759, 0.739634 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.75212);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Magnesium_arsenate<-read.table("Magnesium_arsenate.xyz")
```

```
## Error in read.table("Magnesium_arsenate.xyz"): no lines available in input
```

```r
x<-Magnesium_arsenate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Magnesium_arsenate' not found
```

```r
y<-Magnesium_arsenate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Magnesium_arsenate' not found
```

```r
z<-Magnesium_arsenate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Magnesium_arsenate' not found
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
-2.949392, 0.3894998, -0.4527115, 0, 0, 1, 1, 1,
-2.943126, 1.248888, -0.2454655, 1, 0, 0, 1, 1,
-2.941099, 1.121538, -1.083297, 1, 0, 0, 1, 1,
-2.729734, -0.06949551, 0.7904431, 1, 0, 0, 1, 1,
-2.584859, -1.551839, -4.167661, 1, 0, 0, 1, 1,
-2.565041, -1.295789, -3.321291, 1, 0, 0, 1, 1,
-2.482113, 2.388024, -0.4839492, 0, 0, 0, 1, 1,
-2.423577, -1.271328, -1.646062, 0, 0, 0, 1, 1,
-2.378472, 0.7281502, -1.708436, 0, 0, 0, 1, 1,
-2.311382, -0.4105124, -1.930804, 0, 0, 0, 1, 1,
-2.23163, -0.07613073, -1.738069, 0, 0, 0, 1, 1,
-2.21661, -0.175053, -3.929058, 0, 0, 0, 1, 1,
-2.207974, -0.358562, -1.793433, 0, 0, 0, 1, 1,
-2.152589, -0.266236, -2.087446, 1, 1, 1, 1, 1,
-2.151989, 0.2385667, 0.7908158, 1, 1, 1, 1, 1,
-2.135206, -0.3505968, -3.463916, 1, 1, 1, 1, 1,
-2.126467, 1.327297, -1.380556, 1, 1, 1, 1, 1,
-2.120641, 0.4231618, -0.9400852, 1, 1, 1, 1, 1,
-2.104992, -0.7743402, -1.681673, 1, 1, 1, 1, 1,
-2.100692, 0.08682775, -2.472446, 1, 1, 1, 1, 1,
-2.068128, -1.658897, -1.568993, 1, 1, 1, 1, 1,
-2.061722, 0.7067829, -1.301392, 1, 1, 1, 1, 1,
-2.060556, 1.413578, -3.019048, 1, 1, 1, 1, 1,
-2.060405, 1.440125, -0.8455456, 1, 1, 1, 1, 1,
-2.031535, 1.851068, -0.8999706, 1, 1, 1, 1, 1,
-2.024034, -0.5764358, 0.7220445, 1, 1, 1, 1, 1,
-2.012639, -1.691728, -4.018915, 1, 1, 1, 1, 1,
-2.002038, 0.3869192, -0.9113641, 1, 1, 1, 1, 1,
-1.992899, -1.251086, -0.474336, 0, 0, 1, 1, 1,
-1.969462, -0.9822637, -1.202614, 1, 0, 0, 1, 1,
-1.961104, -1.336884, -2.477598, 1, 0, 0, 1, 1,
-1.941332, -0.8312877, -0.6986692, 1, 0, 0, 1, 1,
-1.925339, 0.07435332, -0.5743979, 1, 0, 0, 1, 1,
-1.909664, 0.6361952, -0.8606156, 1, 0, 0, 1, 1,
-1.891369, -2.699517, -2.979042, 0, 0, 0, 1, 1,
-1.87503, 0.869766, -0.6598705, 0, 0, 0, 1, 1,
-1.861942, 1.94466, -0.788332, 0, 0, 0, 1, 1,
-1.856503, 0.7789938, -0.8260558, 0, 0, 0, 1, 1,
-1.852659, 1.050777, -3.162174, 0, 0, 0, 1, 1,
-1.84542, 2.032776, -0.4582044, 0, 0, 0, 1, 1,
-1.835787, -0.3458414, -2.622023, 0, 0, 0, 1, 1,
-1.835439, 0.3238316, -2.562803, 1, 1, 1, 1, 1,
-1.835347, -0.07679512, -1.623282, 1, 1, 1, 1, 1,
-1.799813, 0.7577055, -2.902709, 1, 1, 1, 1, 1,
-1.792163, -0.3347819, -2.994848, 1, 1, 1, 1, 1,
-1.779973, -0.3659329, -0.3195759, 1, 1, 1, 1, 1,
-1.778854, 0.4693725, -1.470286, 1, 1, 1, 1, 1,
-1.774622, -0.3120832, -2.487973, 1, 1, 1, 1, 1,
-1.755769, -0.5938991, -1.149706, 1, 1, 1, 1, 1,
-1.748752, 0.6926329, -2.012223, 1, 1, 1, 1, 1,
-1.748275, -0.733765, -1.981633, 1, 1, 1, 1, 1,
-1.707064, -1.1469, -1.610401, 1, 1, 1, 1, 1,
-1.69246, 0.8150607, -2.65626, 1, 1, 1, 1, 1,
-1.691218, 0.2398027, 0.4459392, 1, 1, 1, 1, 1,
-1.687101, 0.150079, 0.1827201, 1, 1, 1, 1, 1,
-1.662497, -0.8854059, -1.037287, 1, 1, 1, 1, 1,
-1.638972, 0.554881, -1.668706, 0, 0, 1, 1, 1,
-1.624888, 0.04893946, -2.387149, 1, 0, 0, 1, 1,
-1.620783, -1.858447, -3.747691, 1, 0, 0, 1, 1,
-1.597172, 0.7117558, -1.47493, 1, 0, 0, 1, 1,
-1.576512, -0.5398498, -3.254133, 1, 0, 0, 1, 1,
-1.570638, 0.4417418, -0.7698989, 1, 0, 0, 1, 1,
-1.553302, -0.327171, -1.082853, 0, 0, 0, 1, 1,
-1.552111, -0.5312251, -2.265337, 0, 0, 0, 1, 1,
-1.546626, 0.3568189, -1.49016, 0, 0, 0, 1, 1,
-1.543442, 1.182832, 1.331836, 0, 0, 0, 1, 1,
-1.532857, -1.038096, -3.003864, 0, 0, 0, 1, 1,
-1.519367, -1.026435, -2.396489, 0, 0, 0, 1, 1,
-1.504061, 0.1117377, -2.616, 0, 0, 0, 1, 1,
-1.501333, -2.722013, -1.818595, 1, 1, 1, 1, 1,
-1.488149, 1.245104, -2.581747, 1, 1, 1, 1, 1,
-1.485271, 1.137426, -0.7342826, 1, 1, 1, 1, 1,
-1.483046, 1.289554, -1.835485, 1, 1, 1, 1, 1,
-1.473579, -0.3064483, -1.680113, 1, 1, 1, 1, 1,
-1.467577, -0.506992, -1.68065, 1, 1, 1, 1, 1,
-1.447275, -0.4733466, -0.5844298, 1, 1, 1, 1, 1,
-1.419372, -0.08077728, -2.457909, 1, 1, 1, 1, 1,
-1.419062, 0.1480583, -1.217425, 1, 1, 1, 1, 1,
-1.4162, 0.5215071, -1.050828, 1, 1, 1, 1, 1,
-1.399893, -3.179383, -2.909237, 1, 1, 1, 1, 1,
-1.398333, 1.113201, -1.668211, 1, 1, 1, 1, 1,
-1.38956, 1.336663, 0.024019, 1, 1, 1, 1, 1,
-1.387314, 0.04303538, -0.9169567, 1, 1, 1, 1, 1,
-1.383942, 0.9797071, -0.678304, 1, 1, 1, 1, 1,
-1.382367, -0.9116188, -1.614639, 0, 0, 1, 1, 1,
-1.376744, -1.351114, -2.07281, 1, 0, 0, 1, 1,
-1.37614, -0.09043369, -0.7111794, 1, 0, 0, 1, 1,
-1.37188, -0.162423, -1.235877, 1, 0, 0, 1, 1,
-1.358011, -0.6956658, -2.344686, 1, 0, 0, 1, 1,
-1.356634, -2.169119, -2.465855, 1, 0, 0, 1, 1,
-1.349001, 0.1265812, -1.886035, 0, 0, 0, 1, 1,
-1.343568, 0.1600406, -1.039639, 0, 0, 0, 1, 1,
-1.340587, 2.136343, 0.4195852, 0, 0, 0, 1, 1,
-1.3366, -0.008522224, -2.202589, 0, 0, 0, 1, 1,
-1.332082, 0.260285, -4.353809, 0, 0, 0, 1, 1,
-1.330232, -0.1507463, -1.667869, 0, 0, 0, 1, 1,
-1.327357, -1.181704, -2.948094, 0, 0, 0, 1, 1,
-1.323283, 0.4742155, -2.424226, 1, 1, 1, 1, 1,
-1.321644, -1.297379, -2.230957, 1, 1, 1, 1, 1,
-1.309002, -0.0730005, -1.761568, 1, 1, 1, 1, 1,
-1.305843, -0.2367374, -2.145334, 1, 1, 1, 1, 1,
-1.298091, -0.3137122, -2.681564, 1, 1, 1, 1, 1,
-1.296294, 0.3905228, -1.624016, 1, 1, 1, 1, 1,
-1.293972, 1.08621, -2.92404, 1, 1, 1, 1, 1,
-1.293499, 0.3517513, -1.082851, 1, 1, 1, 1, 1,
-1.279758, -1.772961, -1.910761, 1, 1, 1, 1, 1,
-1.27526, -0.3096431, -2.347143, 1, 1, 1, 1, 1,
-1.272415, 1.159834, -0.7086856, 1, 1, 1, 1, 1,
-1.250231, 0.3203378, -1.321109, 1, 1, 1, 1, 1,
-1.249017, -0.1350332, -1.107961, 1, 1, 1, 1, 1,
-1.248854, -1.358152, -2.367999, 1, 1, 1, 1, 1,
-1.238249, -0.3982524, -3.20937, 1, 1, 1, 1, 1,
-1.226725, 0.809235, -1.740149, 0, 0, 1, 1, 1,
-1.224406, 0.5553459, -3.363419, 1, 0, 0, 1, 1,
-1.224213, 0.02749353, -0.2729845, 1, 0, 0, 1, 1,
-1.220163, 1.125872, -2.035342, 1, 0, 0, 1, 1,
-1.219916, 0.05907461, -1.813265, 1, 0, 0, 1, 1,
-1.210479, -0.9898819, -1.968965, 1, 0, 0, 1, 1,
-1.205284, 0.570329, -0.7794884, 0, 0, 0, 1, 1,
-1.204039, -1.85521, -2.590756, 0, 0, 0, 1, 1,
-1.202758, -0.1068873, -3.772828, 0, 0, 0, 1, 1,
-1.201993, -0.8984163, -2.708926, 0, 0, 0, 1, 1,
-1.201659, 0.7966616, -2.251955, 0, 0, 0, 1, 1,
-1.196047, -0.0436996, -3.163824, 0, 0, 0, 1, 1,
-1.185878, 2.110307, -0.4076054, 0, 0, 0, 1, 1,
-1.185724, -0.4886407, -1.633811, 1, 1, 1, 1, 1,
-1.185385, -2.597221, -1.917759, 1, 1, 1, 1, 1,
-1.184283, -0.540651, -2.627698, 1, 1, 1, 1, 1,
-1.183702, -0.4725733, -1.117648, 1, 1, 1, 1, 1,
-1.182701, -1.332258, -2.243587, 1, 1, 1, 1, 1,
-1.180414, -0.274969, -3.293546, 1, 1, 1, 1, 1,
-1.178169, 0.4555345, -3.016595, 1, 1, 1, 1, 1,
-1.164914, 0.5528733, -3.679224, 1, 1, 1, 1, 1,
-1.159102, 1.260239, 0.6712672, 1, 1, 1, 1, 1,
-1.146541, -0.04078815, -0.321959, 1, 1, 1, 1, 1,
-1.144377, 1.301754, -1.886891, 1, 1, 1, 1, 1,
-1.140084, -1.081735, -3.756087, 1, 1, 1, 1, 1,
-1.139784, 0.6738805, -0.5751261, 1, 1, 1, 1, 1,
-1.134661, -1.444313, -1.887801, 1, 1, 1, 1, 1,
-1.13105, -2.613473, -1.419657, 1, 1, 1, 1, 1,
-1.12747, 0.07269149, -1.042658, 0, 0, 1, 1, 1,
-1.126244, -0.4703503, -1.421237, 1, 0, 0, 1, 1,
-1.123309, 0.08490807, -1.96451, 1, 0, 0, 1, 1,
-1.119868, -2.619636, -3.186584, 1, 0, 0, 1, 1,
-1.114877, 0.5194577, -1.632924, 1, 0, 0, 1, 1,
-1.113182, 0.6592308, -2.158621, 1, 0, 0, 1, 1,
-1.111424, 0.07987653, -1.488844, 0, 0, 0, 1, 1,
-1.109545, 1.374099, 0.4440775, 0, 0, 0, 1, 1,
-1.104125, -0.447063, -3.182418, 0, 0, 0, 1, 1,
-1.09945, 0.6423828, -1.972043, 0, 0, 0, 1, 1,
-1.099218, -0.5690382, -1.887155, 0, 0, 0, 1, 1,
-1.096495, 0.04326312, -0.5743321, 0, 0, 0, 1, 1,
-1.084951, -0.1733869, -1.868322, 0, 0, 0, 1, 1,
-1.082069, -0.3075231, -2.06748, 1, 1, 1, 1, 1,
-1.078571, 0.02656559, -1.671428, 1, 1, 1, 1, 1,
-1.075773, 1.720391, -1.188782, 1, 1, 1, 1, 1,
-1.073541, 1.203668, -0.5138065, 1, 1, 1, 1, 1,
-1.065594, 0.375746, -2.647426, 1, 1, 1, 1, 1,
-1.065448, -0.06413551, -0.6083498, 1, 1, 1, 1, 1,
-1.064251, -0.1285586, -0.2298861, 1, 1, 1, 1, 1,
-1.047334, -0.179833, -1.83208, 1, 1, 1, 1, 1,
-1.041159, 0.6864809, -0.135167, 1, 1, 1, 1, 1,
-1.038363, -0.1580158, -1.157839, 1, 1, 1, 1, 1,
-1.023533, 0.7661605, -0.9712917, 1, 1, 1, 1, 1,
-1.020919, -0.3275987, -1.763144, 1, 1, 1, 1, 1,
-1.020513, 0.03492596, -1.767967, 1, 1, 1, 1, 1,
-1.013178, -0.2691514, -1.951569, 1, 1, 1, 1, 1,
-1.003463, 0.9624215, -1.188978, 1, 1, 1, 1, 1,
-1.001835, 0.2687846, -2.022232, 0, 0, 1, 1, 1,
-0.998604, 0.5792105, -1.694524, 1, 0, 0, 1, 1,
-0.99118, 1.063141, -0.842269, 1, 0, 0, 1, 1,
-0.9884117, -0.03499033, -1.981522, 1, 0, 0, 1, 1,
-0.9815251, 0.5471837, 1.198068, 1, 0, 0, 1, 1,
-0.9771359, -0.3099003, -2.786163, 1, 0, 0, 1, 1,
-0.9734631, -0.2815475, -1.794308, 0, 0, 0, 1, 1,
-0.9713143, 0.2410037, -1.941572, 0, 0, 0, 1, 1,
-0.9620793, -1.609428, -2.448843, 0, 0, 0, 1, 1,
-0.9594105, 1.803337, 0.6660367, 0, 0, 0, 1, 1,
-0.9587427, -0.3866127, -2.302299, 0, 0, 0, 1, 1,
-0.9564561, 1.290392, -1.773949, 0, 0, 0, 1, 1,
-0.9564369, -0.8711321, -2.537603, 0, 0, 0, 1, 1,
-0.9494601, 0.6666508, -0.5766061, 1, 1, 1, 1, 1,
-0.9457235, 0.9526491, -0.1833803, 1, 1, 1, 1, 1,
-0.944232, 1.16389, -0.9454713, 1, 1, 1, 1, 1,
-0.9428295, 1.797212, 0.1038097, 1, 1, 1, 1, 1,
-0.9399517, 0.1443052, -2.229606, 1, 1, 1, 1, 1,
-0.9376296, -0.001921018, -1.559332, 1, 1, 1, 1, 1,
-0.9330358, 0.1489666, -2.498763, 1, 1, 1, 1, 1,
-0.9326492, -0.2652982, 0.4597119, 1, 1, 1, 1, 1,
-0.9272152, 0.353894, -1.981691, 1, 1, 1, 1, 1,
-0.9267883, 0.1011174, -1.159331, 1, 1, 1, 1, 1,
-0.9206011, -0.5727579, -1.701673, 1, 1, 1, 1, 1,
-0.9141598, 1.29711, -0.53441, 1, 1, 1, 1, 1,
-0.9118096, 2.824953, 1.093874, 1, 1, 1, 1, 1,
-0.9103437, -0.1850761, -1.06503, 1, 1, 1, 1, 1,
-0.9052274, 0.5728273, -1.60582, 1, 1, 1, 1, 1,
-0.9041405, 0.1198256, -3.659424, 0, 0, 1, 1, 1,
-0.9031301, -0.407954, -2.426661, 1, 0, 0, 1, 1,
-0.8949374, -1.005331, -1.727236, 1, 0, 0, 1, 1,
-0.8942368, -0.1657817, -3.002714, 1, 0, 0, 1, 1,
-0.8936222, -0.4323815, 0.5974303, 1, 0, 0, 1, 1,
-0.8923838, -0.01368238, -0.3029347, 1, 0, 0, 1, 1,
-0.8915516, -1.114423, -3.267345, 0, 0, 0, 1, 1,
-0.8907517, 1.168435, -0.8511258, 0, 0, 0, 1, 1,
-0.8696688, 1.280001, -0.1671305, 0, 0, 0, 1, 1,
-0.8576722, 0.4575295, -2.295652, 0, 0, 0, 1, 1,
-0.8575418, 0.3364166, -1.42772, 0, 0, 0, 1, 1,
-0.8563832, 0.1821539, -1.320215, 0, 0, 0, 1, 1,
-0.8526781, 0.1938035, -1.144361, 0, 0, 0, 1, 1,
-0.8442397, -0.3184218, -2.025126, 1, 1, 1, 1, 1,
-0.8430769, 0.3596538, -3.598846, 1, 1, 1, 1, 1,
-0.8390022, -0.6358208, -0.4359652, 1, 1, 1, 1, 1,
-0.8372198, 0.3110675, -1.797392, 1, 1, 1, 1, 1,
-0.8368428, 0.7195206, -0.7453605, 1, 1, 1, 1, 1,
-0.8361598, -0.05815297, -1.866646, 1, 1, 1, 1, 1,
-0.8325629, 0.6077235, -1.401585, 1, 1, 1, 1, 1,
-0.8323492, -0.516091, -1.462424, 1, 1, 1, 1, 1,
-0.8253385, -0.4337054, -1.878926, 1, 1, 1, 1, 1,
-0.8250631, -0.8212125, -2.963897, 1, 1, 1, 1, 1,
-0.8188585, 0.8993139, -1.018754, 1, 1, 1, 1, 1,
-0.8088783, 0.2174432, -1.018825, 1, 1, 1, 1, 1,
-0.8087038, 0.481031, -0.9672831, 1, 1, 1, 1, 1,
-0.8085033, -0.2460124, -1.598065, 1, 1, 1, 1, 1,
-0.8054222, -0.373439, -1.828454, 1, 1, 1, 1, 1,
-0.8052567, 0.1723293, -0.4738729, 0, 0, 1, 1, 1,
-0.8021214, -1.497036, -2.791286, 1, 0, 0, 1, 1,
-0.8016767, 0.1737477, -2.515855, 1, 0, 0, 1, 1,
-0.79887, 1.065465, -2.108965, 1, 0, 0, 1, 1,
-0.7975079, -2.083191, -3.85459, 1, 0, 0, 1, 1,
-0.790388, 2.330354, 0.9195865, 1, 0, 0, 1, 1,
-0.788097, 0.1482856, -2.130051, 0, 0, 0, 1, 1,
-0.7845729, -0.06754845, -1.243792, 0, 0, 0, 1, 1,
-0.7844977, 0.8616076, -1.343007, 0, 0, 0, 1, 1,
-0.7834505, -1.550766, -1.747725, 0, 0, 0, 1, 1,
-0.782581, 0.3322741, 0.9790319, 0, 0, 0, 1, 1,
-0.7777537, 0.3771599, -1.233544, 0, 0, 0, 1, 1,
-0.7764917, -0.0713882, 0.3962663, 0, 0, 0, 1, 1,
-0.7728295, -0.699994, -2.301136, 1, 1, 1, 1, 1,
-0.7724206, 0.456649, -4.124876, 1, 1, 1, 1, 1,
-0.7673956, -1.065755, -0.8294644, 1, 1, 1, 1, 1,
-0.7609803, 0.9308002, -0.9236954, 1, 1, 1, 1, 1,
-0.7503644, 1.169188, -0.8443142, 1, 1, 1, 1, 1,
-0.7467608, -1.104629, -2.825037, 1, 1, 1, 1, 1,
-0.7454007, -0.6964443, -1.651489, 1, 1, 1, 1, 1,
-0.7373186, 0.5646707, -1.202731, 1, 1, 1, 1, 1,
-0.7292816, -1.728596, -2.663008, 1, 1, 1, 1, 1,
-0.7223499, 0.5455768, -0.149495, 1, 1, 1, 1, 1,
-0.7188338, 0.8269598, -0.7940201, 1, 1, 1, 1, 1,
-0.715286, -0.3876202, -2.501853, 1, 1, 1, 1, 1,
-0.7136928, -3.088478, -3.961682, 1, 1, 1, 1, 1,
-0.7089015, 0.3142676, -2.112381, 1, 1, 1, 1, 1,
-0.7014819, 1.179587, -0.09228026, 1, 1, 1, 1, 1,
-0.6990235, 1.713181, -0.9922963, 0, 0, 1, 1, 1,
-0.6971354, 0.2314261, -0.7592732, 1, 0, 0, 1, 1,
-0.6969519, -1.071045, -1.045129, 1, 0, 0, 1, 1,
-0.6870189, 0.03404441, -2.021103, 1, 0, 0, 1, 1,
-0.6852139, -0.265678, -3.137857, 1, 0, 0, 1, 1,
-0.6821634, -1.520148, -2.541531, 1, 0, 0, 1, 1,
-0.678468, -0.07050596, -2.130883, 0, 0, 0, 1, 1,
-0.6757218, -1.230654, -2.766483, 0, 0, 0, 1, 1,
-0.6744576, 0.2229411, -0.9650819, 0, 0, 0, 1, 1,
-0.6719841, -1.740215, -3.956109, 0, 0, 0, 1, 1,
-0.6698738, -0.2611749, -2.813306, 0, 0, 0, 1, 1,
-0.6671767, 0.5615296, -2.157794, 0, 0, 0, 1, 1,
-0.665949, -0.6285598, -2.48108, 0, 0, 0, 1, 1,
-0.662772, 1.337901, -0.8853804, 1, 1, 1, 1, 1,
-0.6613459, 1.594363, 1.006205, 1, 1, 1, 1, 1,
-0.660628, 0.5965837, -0.508887, 1, 1, 1, 1, 1,
-0.6506721, 1.010982, -0.9596437, 1, 1, 1, 1, 1,
-0.6350539, 0.7402731, 0.4264746, 1, 1, 1, 1, 1,
-0.6313129, 1.385115, 0.490869, 1, 1, 1, 1, 1,
-0.6294814, -0.8734059, -3.616215, 1, 1, 1, 1, 1,
-0.6280226, 0.7516336, 0.4147322, 1, 1, 1, 1, 1,
-0.6271222, 1.268048, -0.558845, 1, 1, 1, 1, 1,
-0.6122832, -0.02434876, -2.351402, 1, 1, 1, 1, 1,
-0.6080588, -2.006289, -3.409819, 1, 1, 1, 1, 1,
-0.6076121, 0.3896673, -1.949209, 1, 1, 1, 1, 1,
-0.606841, -2.405019, -2.155005, 1, 1, 1, 1, 1,
-0.6068043, 1.705904, -0.6689188, 1, 1, 1, 1, 1,
-0.6030748, -0.4771615, -0.5572959, 1, 1, 1, 1, 1,
-0.5877539, -0.1819072, -0.5941867, 0, 0, 1, 1, 1,
-0.5812004, 0.4004653, -2.945264, 1, 0, 0, 1, 1,
-0.58016, 0.4732348, -2.579504, 1, 0, 0, 1, 1,
-0.5674315, 0.1257653, 0.2999251, 1, 0, 0, 1, 1,
-0.5661661, 0.4427162, -0.9684879, 1, 0, 0, 1, 1,
-0.5633547, 0.8431591, 0.648465, 1, 0, 0, 1, 1,
-0.5624272, 0.9488316, -2.853603, 0, 0, 0, 1, 1,
-0.5581232, 0.7308075, -2.152271, 0, 0, 0, 1, 1,
-0.5580202, -0.09816697, -4.340421, 0, 0, 0, 1, 1,
-0.5559142, 0.1628309, -1.22956, 0, 0, 0, 1, 1,
-0.5547692, 0.8831436, -1.732774, 0, 0, 0, 1, 1,
-0.5527904, -0.9706253, -4.522937, 0, 0, 0, 1, 1,
-0.5494502, 0.2739233, -1.500478, 0, 0, 0, 1, 1,
-0.5454941, -0.6604391, -2.255847, 1, 1, 1, 1, 1,
-0.5412597, 1.093836, -1.428721, 1, 1, 1, 1, 1,
-0.5382326, -1.171803, -2.204673, 1, 1, 1, 1, 1,
-0.5312379, -0.6669182, -2.371451, 1, 1, 1, 1, 1,
-0.5278715, -1.567475, -1.586703, 1, 1, 1, 1, 1,
-0.5276535, -0.3296776, -1.695171, 1, 1, 1, 1, 1,
-0.5274091, 0.1382796, -1.490706, 1, 1, 1, 1, 1,
-0.524845, 1.780147, -1.085045, 1, 1, 1, 1, 1,
-0.517271, -2.658194, -5.305952, 1, 1, 1, 1, 1,
-0.5126615, 0.5433965, -2.584196, 1, 1, 1, 1, 1,
-0.5030363, -1.001176, -4.336739, 1, 1, 1, 1, 1,
-0.5022039, 0.921962, -0.3970743, 1, 1, 1, 1, 1,
-0.5005665, 1.515046, 0.8305792, 1, 1, 1, 1, 1,
-0.500202, -0.641871, -2.421028, 1, 1, 1, 1, 1,
-0.496083, 0.3978226, -0.8139632, 1, 1, 1, 1, 1,
-0.4935693, 1.265147, -0.7812839, 0, 0, 1, 1, 1,
-0.4895804, 1.048961, -1.733552, 1, 0, 0, 1, 1,
-0.4888452, 0.9894444, -0.07491741, 1, 0, 0, 1, 1,
-0.4877613, -1.015877, -4.165843, 1, 0, 0, 1, 1,
-0.4860879, 0.8794708, -0.4569656, 1, 0, 0, 1, 1,
-0.4812528, -0.6852849, -3.169712, 1, 0, 0, 1, 1,
-0.4798751, -2.704021, -3.786296, 0, 0, 0, 1, 1,
-0.477496, 0.7444779, -1.366182, 0, 0, 0, 1, 1,
-0.4766341, -1.550896, -3.627677, 0, 0, 0, 1, 1,
-0.4667557, -0.3730307, -0.5023003, 0, 0, 0, 1, 1,
-0.4664807, 1.092528, -1.650554, 0, 0, 0, 1, 1,
-0.466044, -0.4543795, -1.521791, 0, 0, 0, 1, 1,
-0.465577, 1.698297, -0.3059018, 0, 0, 0, 1, 1,
-0.4651775, 0.09523007, -1.626865, 1, 1, 1, 1, 1,
-0.4643713, 0.7223575, -2.424048, 1, 1, 1, 1, 1,
-0.4631351, -1.065547, -2.722092, 1, 1, 1, 1, 1,
-0.4620157, -1.36936, -1.997705, 1, 1, 1, 1, 1,
-0.4512716, 2.316246, -0.7578152, 1, 1, 1, 1, 1,
-0.4506351, -0.5829707, -3.826362, 1, 1, 1, 1, 1,
-0.4486715, 0.3194457, -0.5013537, 1, 1, 1, 1, 1,
-0.4468699, -0.4677284, -2.337312, 1, 1, 1, 1, 1,
-0.4438372, -1.290344, -3.638532, 1, 1, 1, 1, 1,
-0.4412548, -0.5208425, -2.331999, 1, 1, 1, 1, 1,
-0.4368264, 0.953521, -1.211265, 1, 1, 1, 1, 1,
-0.4360855, 0.4872535, -1.615606, 1, 1, 1, 1, 1,
-0.4334357, -0.2998655, -1.370377, 1, 1, 1, 1, 1,
-0.4267596, -1.027855, -2.526613, 1, 1, 1, 1, 1,
-0.4241165, -1.276745, -1.303937, 1, 1, 1, 1, 1,
-0.4229622, 0.4813745, -2.613195, 0, 0, 1, 1, 1,
-0.4217976, 0.0551173, -0.2176085, 1, 0, 0, 1, 1,
-0.4185261, -0.008102374, -2.26985, 1, 0, 0, 1, 1,
-0.4183283, 0.5091303, -1.021675, 1, 0, 0, 1, 1,
-0.4157341, -0.442395, -3.658769, 1, 0, 0, 1, 1,
-0.4124407, 0.9782284, 1.652508, 1, 0, 0, 1, 1,
-0.4117154, -1.214414, -1.383964, 0, 0, 0, 1, 1,
-0.4086618, -0.1039511, -3.985731, 0, 0, 0, 1, 1,
-0.4035749, 1.566047, -1.707342, 0, 0, 0, 1, 1,
-0.3943036, 1.431651, 0.04466931, 0, 0, 0, 1, 1,
-0.3894493, 0.9585309, -1.350435, 0, 0, 0, 1, 1,
-0.3849127, -0.9744438, -3.183355, 0, 0, 0, 1, 1,
-0.3839163, -0.7080993, -4.258988, 0, 0, 0, 1, 1,
-0.383307, -2.033055, -3.813863, 1, 1, 1, 1, 1,
-0.3804768, -0.398669, -2.651193, 1, 1, 1, 1, 1,
-0.3769542, 3.676958, -1.702431, 1, 1, 1, 1, 1,
-0.3759682, 0.5862203, -1.465653, 1, 1, 1, 1, 1,
-0.3740832, -0.6226782, -3.450394, 1, 1, 1, 1, 1,
-0.3724198, -0.1438106, 0.4383414, 1, 1, 1, 1, 1,
-0.37089, -0.6301946, -1.169947, 1, 1, 1, 1, 1,
-0.3703655, 3.810738, -0.3117733, 1, 1, 1, 1, 1,
-0.3694406, 1.038224, -0.6365215, 1, 1, 1, 1, 1,
-0.3676588, -0.4417424, -3.741604, 1, 1, 1, 1, 1,
-0.3671576, -1.435381, -3.822248, 1, 1, 1, 1, 1,
-0.3665044, 0.739606, -0.7977042, 1, 1, 1, 1, 1,
-0.3654747, -0.3402021, -2.430303, 1, 1, 1, 1, 1,
-0.3630393, 0.3805407, 0.1431866, 1, 1, 1, 1, 1,
-0.3622001, -0.971966, -1.902448, 1, 1, 1, 1, 1,
-0.3611207, 0.7598385, 0.2481214, 0, 0, 1, 1, 1,
-0.3591405, -0.4075676, -3.984722, 1, 0, 0, 1, 1,
-0.3572567, 0.1336959, -1.316548, 1, 0, 0, 1, 1,
-0.3553776, 1.424904, -0.3860725, 1, 0, 0, 1, 1,
-0.350668, -0.9490822, -2.627853, 1, 0, 0, 1, 1,
-0.349198, -0.6678668, -2.29821, 1, 0, 0, 1, 1,
-0.3482534, -0.8727958, -0.8031582, 0, 0, 0, 1, 1,
-0.346818, 0.1536017, -1.337452, 0, 0, 0, 1, 1,
-0.3420847, 1.907742, 0.1211867, 0, 0, 0, 1, 1,
-0.3412561, 1.234905, -0.9912807, 0, 0, 0, 1, 1,
-0.3382903, -0.01902081, -1.994238, 0, 0, 0, 1, 1,
-0.3349195, 1.086439, 0.8186107, 0, 0, 0, 1, 1,
-0.3327999, -0.8680977, -2.75578, 0, 0, 0, 1, 1,
-0.3309868, 0.674534, -0.8438911, 1, 1, 1, 1, 1,
-0.3268384, -0.231166, -2.683797, 1, 1, 1, 1, 1,
-0.3251349, 0.01571529, -0.2664401, 1, 1, 1, 1, 1,
-0.3248649, -0.2186311, -1.694377, 1, 1, 1, 1, 1,
-0.3247204, -1.959003, -2.067121, 1, 1, 1, 1, 1,
-0.3239471, -1.462207, -3.090999, 1, 1, 1, 1, 1,
-0.322243, -1.016061, -3.92676, 1, 1, 1, 1, 1,
-0.3211279, 0.7736541, -1.092039, 1, 1, 1, 1, 1,
-0.320874, 0.3640203, 0.09417266, 1, 1, 1, 1, 1,
-0.3167588, 0.4151308, -1.593549, 1, 1, 1, 1, 1,
-0.315417, -0.2031876, -2.149653, 1, 1, 1, 1, 1,
-0.3120401, 0.2895144, -1.979341, 1, 1, 1, 1, 1,
-0.3075291, 1.030958, -1.225322, 1, 1, 1, 1, 1,
-0.3067509, 1.779716, 0.3478429, 1, 1, 1, 1, 1,
-0.2986769, 0.2945432, -0.156047, 1, 1, 1, 1, 1,
-0.2961438, -0.01401843, -3.367516, 0, 0, 1, 1, 1,
-0.2950373, -0.03908574, -0.9420458, 1, 0, 0, 1, 1,
-0.287127, 0.5196565, -1.900382, 1, 0, 0, 1, 1,
-0.2851227, -1.522342, -4.338852, 1, 0, 0, 1, 1,
-0.2738984, -0.1381824, 0.04627004, 1, 0, 0, 1, 1,
-0.2738974, -0.5377526, -4.59809, 1, 0, 0, 1, 1,
-0.2722496, 0.1971329, -0.5632212, 0, 0, 0, 1, 1,
-0.2698096, -3.123118, -3.150242, 0, 0, 0, 1, 1,
-0.2682576, -0.1602355, -1.649718, 0, 0, 0, 1, 1,
-0.2667137, 0.2652823, -0.3037989, 0, 0, 0, 1, 1,
-0.2664586, -0.2589667, -2.48399, 0, 0, 0, 1, 1,
-0.2641127, 1.082127, 1.29532, 0, 0, 0, 1, 1,
-0.2604551, -0.6296308, -1.775192, 0, 0, 0, 1, 1,
-0.2522888, 0.4930184, -0.4464982, 1, 1, 1, 1, 1,
-0.2503582, -1.699086, -3.671257, 1, 1, 1, 1, 1,
-0.2494645, 0.8601737, -0.7024435, 1, 1, 1, 1, 1,
-0.2491789, -0.1497257, -0.4594629, 1, 1, 1, 1, 1,
-0.2474909, 1.676252, -0.2298524, 1, 1, 1, 1, 1,
-0.2439797, 0.1572198, -1.304778, 1, 1, 1, 1, 1,
-0.2435934, 0.6864169, -1.769566, 1, 1, 1, 1, 1,
-0.2413657, -1.571959, -3.278712, 1, 1, 1, 1, 1,
-0.2337526, -0.2538743, -4.354058, 1, 1, 1, 1, 1,
-0.2336194, 2.36355, -0.7690216, 1, 1, 1, 1, 1,
-0.2320732, 1.314377, 0.5152687, 1, 1, 1, 1, 1,
-0.2251866, 1.018913, -0.3044775, 1, 1, 1, 1, 1,
-0.2234165, 0.6533487, 0.4085722, 1, 1, 1, 1, 1,
-0.2195122, 0.2216278, -0.02579311, 1, 1, 1, 1, 1,
-0.2095744, 2.530739, -0.3584627, 1, 1, 1, 1, 1,
-0.2088668, -0.7690868, -1.490645, 0, 0, 1, 1, 1,
-0.2059493, -0.9721261, -3.289142, 1, 0, 0, 1, 1,
-0.2047839, 1.323109, -2.36891, 1, 0, 0, 1, 1,
-0.204571, 1.193258, -0.8407616, 1, 0, 0, 1, 1,
-0.2032719, -0.3268277, -2.404666, 1, 0, 0, 1, 1,
-0.2002675, -1.039869, -3.663449, 1, 0, 0, 1, 1,
-0.198854, -1.035978, -2.907308, 0, 0, 0, 1, 1,
-0.1973984, -2.016772, -1.673849, 0, 0, 0, 1, 1,
-0.1972413, 0.9884647, -0.2427512, 0, 0, 0, 1, 1,
-0.194011, 0.07233603, 0.5306479, 0, 0, 0, 1, 1,
-0.1931759, 1.397158, 1.205609, 0, 0, 0, 1, 1,
-0.1900945, -0.8439806, -3.486007, 0, 0, 0, 1, 1,
-0.1849756, 0.4523976, -1.24289, 0, 0, 0, 1, 1,
-0.1847765, -0.214167, -2.32813, 1, 1, 1, 1, 1,
-0.1841049, -1.24752, -2.755801, 1, 1, 1, 1, 1,
-0.1838615, 0.1757994, -0.393647, 1, 1, 1, 1, 1,
-0.1833624, -0.9337047, -4.255857, 1, 1, 1, 1, 1,
-0.1813099, 0.2259451, 0.06389686, 1, 1, 1, 1, 1,
-0.1808303, -0.2229112, -3.565314, 1, 1, 1, 1, 1,
-0.178557, -1.30609, -3.574827, 1, 1, 1, 1, 1,
-0.1716886, 0.7661897, -1.983492, 1, 1, 1, 1, 1,
-0.165486, 0.3225755, -0.5560467, 1, 1, 1, 1, 1,
-0.1645652, 0.146613, -1.17545, 1, 1, 1, 1, 1,
-0.1601643, -1.581969, -3.275757, 1, 1, 1, 1, 1,
-0.1596133, -0.6832601, -3.496303, 1, 1, 1, 1, 1,
-0.1591396, 1.032653, 1.909044, 1, 1, 1, 1, 1,
-0.1583087, 0.2366204, -1.684514, 1, 1, 1, 1, 1,
-0.1572161, -1.964147, -3.440984, 1, 1, 1, 1, 1,
-0.1532846, 0.7165063, 0.2813051, 0, 0, 1, 1, 1,
-0.1529363, 0.1262669, -2.627976, 1, 0, 0, 1, 1,
-0.1521287, -0.09661152, -3.563694, 1, 0, 0, 1, 1,
-0.150107, -0.8365771, -2.030503, 1, 0, 0, 1, 1,
-0.1490425, -0.1015418, -1.440728, 1, 0, 0, 1, 1,
-0.1443643, 0.1499034, -0.5637864, 1, 0, 0, 1, 1,
-0.1439647, -0.1812147, -2.123599, 0, 0, 0, 1, 1,
-0.1421779, 0.2925219, -1.477121, 0, 0, 0, 1, 1,
-0.1415742, 0.3915966, -0.7182609, 0, 0, 0, 1, 1,
-0.1392606, 1.154696, -1.767006, 0, 0, 0, 1, 1,
-0.1385271, -1.808444, -2.933207, 0, 0, 0, 1, 1,
-0.1291893, -0.2084019, -1.840157, 0, 0, 0, 1, 1,
-0.1270337, 0.6259524, -1.902274, 0, 0, 0, 1, 1,
-0.1240092, -1.267562, -2.953376, 1, 1, 1, 1, 1,
-0.115089, -0.9192657, -2.546954, 1, 1, 1, 1, 1,
-0.1142251, 0.86204, -1.694058, 1, 1, 1, 1, 1,
-0.1101187, -0.995152, -2.520315, 1, 1, 1, 1, 1,
-0.1081534, 0.2854771, -1.245767, 1, 1, 1, 1, 1,
-0.09992352, -2.308586, -2.48309, 1, 1, 1, 1, 1,
-0.09893359, -0.236087, -2.151964, 1, 1, 1, 1, 1,
-0.09431376, -0.2029053, -0.6401716, 1, 1, 1, 1, 1,
-0.09239471, -0.4183966, -3.519121, 1, 1, 1, 1, 1,
-0.08917253, -0.6736456, -2.418149, 1, 1, 1, 1, 1,
-0.08912194, -1.245642, -2.650517, 1, 1, 1, 1, 1,
-0.07718401, 0.4347658, 1.283197, 1, 1, 1, 1, 1,
-0.07652178, -2.621057, -1.81528, 1, 1, 1, 1, 1,
-0.07259274, 1.572908, 0.5208458, 1, 1, 1, 1, 1,
-0.07210238, -0.8084692, -3.650947, 1, 1, 1, 1, 1,
-0.07078895, -0.2330295, -1.264865, 0, 0, 1, 1, 1,
-0.07071332, 0.4590931, -0.615179, 1, 0, 0, 1, 1,
-0.06792786, -0.9599845, -1.800086, 1, 0, 0, 1, 1,
-0.06588367, 1.279401, -0.514282, 1, 0, 0, 1, 1,
-0.05926946, -0.3719773, -2.380425, 1, 0, 0, 1, 1,
-0.0579952, 1.234195, 0.8962459, 1, 0, 0, 1, 1,
-0.05322833, -0.2881438, -1.445112, 0, 0, 0, 1, 1,
-0.05064979, -0.827924, -2.555323, 0, 0, 0, 1, 1,
-0.04658696, 0.4300467, 1.239058, 0, 0, 0, 1, 1,
-0.04642444, 0.000130416, -0.2673635, 0, 0, 0, 1, 1,
-0.0463734, 0.9089953, 1.05927, 0, 0, 0, 1, 1,
-0.04361545, 0.1599226, -0.5391748, 0, 0, 0, 1, 1,
-0.04253526, 1.743008, -0.9668527, 0, 0, 0, 1, 1,
-0.04202201, 1.825806, -0.9207638, 1, 1, 1, 1, 1,
-0.03836013, -0.1526448, -0.7365629, 1, 1, 1, 1, 1,
-0.03201911, -0.6137398, -2.305935, 1, 1, 1, 1, 1,
-0.03168735, 1.051173, -0.6099189, 1, 1, 1, 1, 1,
-0.02840107, -1.666939, -4.74676, 1, 1, 1, 1, 1,
-0.01834226, 0.5339377, -0.1927514, 1, 1, 1, 1, 1,
-0.01747228, -0.4631241, -4.052262, 1, 1, 1, 1, 1,
-0.01428604, 0.8195677, -1.042925, 1, 1, 1, 1, 1,
-0.01191513, 1.128467, 0.3047793, 1, 1, 1, 1, 1,
-0.00867149, -0.5940204, -2.300448, 1, 1, 1, 1, 1,
-0.004552844, 1.392744, -0.3524869, 1, 1, 1, 1, 1,
-0.000904429, -0.5595663, -4.391549, 1, 1, 1, 1, 1,
0.005580646, 0.1151239, 0.9696251, 1, 1, 1, 1, 1,
0.008051188, -0.9492925, 2.012042, 1, 1, 1, 1, 1,
0.01015431, -0.3089366, 3.465345, 1, 1, 1, 1, 1,
0.01140811, 0.2029514, 0.2974055, 0, 0, 1, 1, 1,
0.01253209, -2.113384, 2.190832, 1, 0, 0, 1, 1,
0.01356206, -0.6191375, 2.984506, 1, 0, 0, 1, 1,
0.0141467, 0.3695892, 1.121954, 1, 0, 0, 1, 1,
0.01497955, 0.1196204, 2.627205, 1, 0, 0, 1, 1,
0.01827191, -0.05664815, 0.4341161, 1, 0, 0, 1, 1,
0.02038328, 0.1481194, 0.2858362, 0, 0, 0, 1, 1,
0.02071721, 0.1995032, -0.1759146, 0, 0, 0, 1, 1,
0.02111099, 0.711306, -0.8147628, 0, 0, 0, 1, 1,
0.02294895, -0.3092003, 2.474313, 0, 0, 0, 1, 1,
0.02435924, -0.5822245, 4.651606, 0, 0, 0, 1, 1,
0.02437465, 0.308946, 0.3838421, 0, 0, 0, 1, 1,
0.02807404, 1.276314, -2.529919, 0, 0, 0, 1, 1,
0.02836367, 0.7068634, -0.002038505, 1, 1, 1, 1, 1,
0.02925989, -0.4657183, 2.512501, 1, 1, 1, 1, 1,
0.03262557, 1.4406, -0.8419218, 1, 1, 1, 1, 1,
0.03346343, -0.6868653, 6.098863, 1, 1, 1, 1, 1,
0.03999188, 1.218428, -0.6221518, 1, 1, 1, 1, 1,
0.04101938, 0.9791674, 0.1300786, 1, 1, 1, 1, 1,
0.04229349, -0.2529264, 3.827313, 1, 1, 1, 1, 1,
0.04651508, -0.3583859, 3.273148, 1, 1, 1, 1, 1,
0.05010251, -0.1207387, 2.937237, 1, 1, 1, 1, 1,
0.05405716, 0.7466156, 0.5210319, 1, 1, 1, 1, 1,
0.06896371, -0.7719474, 2.166945, 1, 1, 1, 1, 1,
0.06937603, -0.6951477, 4.145599, 1, 1, 1, 1, 1,
0.07093935, 0.3299785, -0.19, 1, 1, 1, 1, 1,
0.07190009, 2.867617, 0.4493397, 1, 1, 1, 1, 1,
0.07725081, 0.1457966, 3.10427, 1, 1, 1, 1, 1,
0.07893143, -0.6407393, 2.40694, 0, 0, 1, 1, 1,
0.07932807, -0.6527982, 4.604728, 1, 0, 0, 1, 1,
0.08147056, 2.015435, -0.4387262, 1, 0, 0, 1, 1,
0.08885652, 0.2645116, -0.9170917, 1, 0, 0, 1, 1,
0.09594602, 0.4720885, 1.728611, 1, 0, 0, 1, 1,
0.09691458, -0.04828975, 2.077231, 1, 0, 0, 1, 1,
0.09818058, -1.805025, 3.67624, 0, 0, 0, 1, 1,
0.1003468, -0.2933275, 2.815458, 0, 0, 0, 1, 1,
0.1018456, -0.7806374, 2.950151, 0, 0, 0, 1, 1,
0.1085323, -0.397341, 1.786983, 0, 0, 0, 1, 1,
0.1086725, -0.274277, 1.569926, 0, 0, 0, 1, 1,
0.1099157, -0.5145988, 3.382512, 0, 0, 0, 1, 1,
0.1130636, -0.01169662, -0.1878961, 0, 0, 0, 1, 1,
0.1175266, -1.740528, 1.977396, 1, 1, 1, 1, 1,
0.123889, -0.8510441, 3.251792, 1, 1, 1, 1, 1,
0.1243825, 0.1076342, -0.01939602, 1, 1, 1, 1, 1,
0.1281232, -1.281071, 4.308604, 1, 1, 1, 1, 1,
0.1306885, 0.5124062, 1.094967, 1, 1, 1, 1, 1,
0.1358988, -1.459614, 2.020104, 1, 1, 1, 1, 1,
0.1405478, -0.7218177, 2.528942, 1, 1, 1, 1, 1,
0.1406098, -0.2538069, 3.815204, 1, 1, 1, 1, 1,
0.1411305, 1.472513, 2.099652, 1, 1, 1, 1, 1,
0.1419145, -1.145639, 2.235585, 1, 1, 1, 1, 1,
0.1446356, 0.07971772, -0.3494209, 1, 1, 1, 1, 1,
0.14796, 0.2691715, -0.8223457, 1, 1, 1, 1, 1,
0.1491513, -0.4949923, 0.4803556, 1, 1, 1, 1, 1,
0.1509605, -0.4172799, 5.245961, 1, 1, 1, 1, 1,
0.1536575, -1.394825, 3.307006, 1, 1, 1, 1, 1,
0.1574742, -0.2702647, 2.825214, 0, 0, 1, 1, 1,
0.1582662, 0.05011565, 1.139753, 1, 0, 0, 1, 1,
0.1587623, 0.05484625, -0.6479239, 1, 0, 0, 1, 1,
0.1608572, -0.5443361, 3.105701, 1, 0, 0, 1, 1,
0.1614875, -0.3143761, 2.961509, 1, 0, 0, 1, 1,
0.1621038, -2.063245, 3.753351, 1, 0, 0, 1, 1,
0.1680372, -0.704671, 2.698757, 0, 0, 0, 1, 1,
0.1687227, 1.458723, -1.008647, 0, 0, 0, 1, 1,
0.1688124, 0.716513, 0.08815981, 0, 0, 0, 1, 1,
0.1694653, -0.7656331, 3.017833, 0, 0, 0, 1, 1,
0.1704237, 1.676854, -0.3639868, 0, 0, 0, 1, 1,
0.1735238, -0.01450303, 0.3461305, 0, 0, 0, 1, 1,
0.1805943, 1.252737, 0.2819903, 0, 0, 0, 1, 1,
0.1845746, -0.05066654, 2.056318, 1, 1, 1, 1, 1,
0.1918692, -0.6340446, 1.921889, 1, 1, 1, 1, 1,
0.1943706, 2.153374, 0.7116949, 1, 1, 1, 1, 1,
0.1968416, 1.593901, -0.583549, 1, 1, 1, 1, 1,
0.2010928, -0.004904003, 3.187488, 1, 1, 1, 1, 1,
0.2021415, 0.6389535, -1.948817, 1, 1, 1, 1, 1,
0.2098006, -0.9246382, 3.06269, 1, 1, 1, 1, 1,
0.2179057, -0.8392926, 2.681586, 1, 1, 1, 1, 1,
0.2186751, 0.6960725, 1.580184, 1, 1, 1, 1, 1,
0.2229882, -0.9381839, 3.262692, 1, 1, 1, 1, 1,
0.2244063, 1.272029, -0.01920135, 1, 1, 1, 1, 1,
0.2248791, 0.6815369, -0.08635332, 1, 1, 1, 1, 1,
0.2251952, 0.2385353, 0.7196933, 1, 1, 1, 1, 1,
0.2268384, 0.07212381, 0.5537501, 1, 1, 1, 1, 1,
0.2273407, -2.36316, 3.687207, 1, 1, 1, 1, 1,
0.22935, -1.372481, 2.00735, 0, 0, 1, 1, 1,
0.2303285, -0.8773179, 2.668859, 1, 0, 0, 1, 1,
0.2311911, 0.8279181, -0.8140702, 1, 0, 0, 1, 1,
0.2320954, 0.6379175, 0.6326945, 1, 0, 0, 1, 1,
0.2418282, 0.3452666, 0.3380174, 1, 0, 0, 1, 1,
0.2491771, -0.4210657, 3.548796, 1, 0, 0, 1, 1,
0.2507907, 0.2745861, -0.7859753, 0, 0, 0, 1, 1,
0.2525555, -1.901798, 1.857791, 0, 0, 0, 1, 1,
0.2559501, 0.05753931, 1.479557, 0, 0, 0, 1, 1,
0.2563502, 1.456977, -0.7300172, 0, 0, 0, 1, 1,
0.2572091, -1.604863, 1.976597, 0, 0, 0, 1, 1,
0.2598254, -1.023642, 1.35778, 0, 0, 0, 1, 1,
0.2619308, -0.5808309, 2.256511, 0, 0, 0, 1, 1,
0.2701307, -2.213231, 4.50913, 1, 1, 1, 1, 1,
0.2712483, 0.8701217, 0.1366438, 1, 1, 1, 1, 1,
0.272149, 0.1793486, -0.1220865, 1, 1, 1, 1, 1,
0.2724821, -0.5680788, 2.489611, 1, 1, 1, 1, 1,
0.2751071, 1.351916, -1.222892, 1, 1, 1, 1, 1,
0.2782538, -0.8712566, 2.17386, 1, 1, 1, 1, 1,
0.2794378, -0.08479031, 1.96807, 1, 1, 1, 1, 1,
0.2803602, -0.09982993, 0.9967627, 1, 1, 1, 1, 1,
0.2810524, 0.1450399, 2.400969, 1, 1, 1, 1, 1,
0.2831216, 1.404026, 1.447038, 1, 1, 1, 1, 1,
0.2906141, 0.5501847, 0.3457224, 1, 1, 1, 1, 1,
0.2933252, -1.932091, 3.01601, 1, 1, 1, 1, 1,
0.2973627, -0.286184, 1.918668, 1, 1, 1, 1, 1,
0.297441, -2.35736, 3.58367, 1, 1, 1, 1, 1,
0.2982802, 1.066995, -0.8067566, 1, 1, 1, 1, 1,
0.2990934, -1.326537, 3.355665, 0, 0, 1, 1, 1,
0.2997328, 0.1359104, 3.340758, 1, 0, 0, 1, 1,
0.3005013, -0.1596288, 3.177689, 1, 0, 0, 1, 1,
0.3033334, -0.9095739, 1.410527, 1, 0, 0, 1, 1,
0.3043922, -1.124242, 2.500387, 1, 0, 0, 1, 1,
0.3048488, 1.312953, -0.8657543, 1, 0, 0, 1, 1,
0.3059072, -0.5650204, 1.67635, 0, 0, 0, 1, 1,
0.307117, 0.3270462, 2.233969, 0, 0, 0, 1, 1,
0.3083617, -0.1156095, 3.16741, 0, 0, 0, 1, 1,
0.3096762, -1.416177, 2.20501, 0, 0, 0, 1, 1,
0.3106605, -0.4731948, 3.95385, 0, 0, 0, 1, 1,
0.3142269, -0.4903958, 0.5118816, 0, 0, 0, 1, 1,
0.3164451, -1.864419, 1.617826, 0, 0, 0, 1, 1,
0.3171019, 0.8246745, 0.4928057, 1, 1, 1, 1, 1,
0.317774, 0.2045225, 0.899304, 1, 1, 1, 1, 1,
0.3180169, -1.193345, 3.113873, 1, 1, 1, 1, 1,
0.3245967, 0.6652184, 1.864801, 1, 1, 1, 1, 1,
0.3248793, 0.4582365, -0.7772163, 1, 1, 1, 1, 1,
0.3276473, -0.436089, 3.361621, 1, 1, 1, 1, 1,
0.3288771, -0.9167092, 3.365756, 1, 1, 1, 1, 1,
0.3297488, 0.3376581, -1.044109, 1, 1, 1, 1, 1,
0.3299031, -0.9704452, 3.627038, 1, 1, 1, 1, 1,
0.3380066, -0.9328206, 2.185425, 1, 1, 1, 1, 1,
0.3401478, -0.2930966, 0.8119057, 1, 1, 1, 1, 1,
0.3452039, -2.279644, 2.230933, 1, 1, 1, 1, 1,
0.3478537, -0.725099, 2.723577, 1, 1, 1, 1, 1,
0.348696, 0.9372059, -1.313064, 1, 1, 1, 1, 1,
0.3489855, 0.5305605, 1.267204, 1, 1, 1, 1, 1,
0.3573931, -0.700815, 1.868287, 0, 0, 1, 1, 1,
0.3579431, -0.1066508, 1.915017, 1, 0, 0, 1, 1,
0.3586819, 2.083923, 1.131128, 1, 0, 0, 1, 1,
0.3609368, -1.207615, 2.085629, 1, 0, 0, 1, 1,
0.3610899, -0.05911281, 0.6848788, 1, 0, 0, 1, 1,
0.361798, -0.6554781, 3.824348, 1, 0, 0, 1, 1,
0.3624887, 0.4284832, 2.047206, 0, 0, 0, 1, 1,
0.3636613, 0.4638418, 0.4325745, 0, 0, 0, 1, 1,
0.3665229, -0.3241678, 2.27045, 0, 0, 0, 1, 1,
0.3667936, 0.297964, 3.073752, 0, 0, 0, 1, 1,
0.3676123, 1.53336, 0.9666481, 0, 0, 0, 1, 1,
0.3714054, 1.355552, -0.003887604, 0, 0, 0, 1, 1,
0.3745915, 0.1783855, 0.9452258, 0, 0, 0, 1, 1,
0.3784685, -1.505966, 1.106815, 1, 1, 1, 1, 1,
0.378478, -1.090479, 2.926361, 1, 1, 1, 1, 1,
0.3822412, -0.2023097, 2.361289, 1, 1, 1, 1, 1,
0.383927, 0.8083223, -0.4992805, 1, 1, 1, 1, 1,
0.3858073, -1.14425, 1.606652, 1, 1, 1, 1, 1,
0.3860535, -0.9303643, 1.667092, 1, 1, 1, 1, 1,
0.3882482, 0.03452041, 1.37828, 1, 1, 1, 1, 1,
0.3929814, -1.007816, 3.239781, 1, 1, 1, 1, 1,
0.4008245, 0.5223855, 0.03037354, 1, 1, 1, 1, 1,
0.4027315, 1.064697, 1.632041, 1, 1, 1, 1, 1,
0.4034952, 0.8287963, 0.1400024, 1, 1, 1, 1, 1,
0.4039266, 0.4152495, -0.01524489, 1, 1, 1, 1, 1,
0.4041817, 0.03486926, 1.259611, 1, 1, 1, 1, 1,
0.4060992, 0.806194, 0.7153913, 1, 1, 1, 1, 1,
0.4108423, 0.05009481, 0.7320509, 1, 1, 1, 1, 1,
0.4115993, -0.8177335, 2.37074, 0, 0, 1, 1, 1,
0.4156383, -0.6887979, 2.560906, 1, 0, 0, 1, 1,
0.4184761, 0.144543, 0.3815769, 1, 0, 0, 1, 1,
0.42224, -0.2592421, 0.2236092, 1, 0, 0, 1, 1,
0.4242692, 1.096562, 0.7541493, 1, 0, 0, 1, 1,
0.4250775, -0.5857254, 3.402603, 1, 0, 0, 1, 1,
0.4306841, 0.9955214, 0.3267898, 0, 0, 0, 1, 1,
0.4340494, 1.102708, -0.283666, 0, 0, 0, 1, 1,
0.4357781, -1.107161, 3.660109, 0, 0, 0, 1, 1,
0.4360472, -0.6524179, 1.291527, 0, 0, 0, 1, 1,
0.437604, -0.9534555, 2.650339, 0, 0, 0, 1, 1,
0.4389886, 1.418821, 0.7440079, 0, 0, 0, 1, 1,
0.4394666, 0.1949104, 0.7977227, 0, 0, 0, 1, 1,
0.4404657, 0.1352353, 0.7054845, 1, 1, 1, 1, 1,
0.4426725, 2.75109, -0.08444778, 1, 1, 1, 1, 1,
0.4437375, -0.05228788, 0.618547, 1, 1, 1, 1, 1,
0.4437582, 0.8157804, 1.424078, 1, 1, 1, 1, 1,
0.4439443, -0.308562, 3.494499, 1, 1, 1, 1, 1,
0.4451385, -0.1188133, 1.1425, 1, 1, 1, 1, 1,
0.4454568, 1.261139, 2.094134, 1, 1, 1, 1, 1,
0.449662, -0.5512712, 2.250423, 1, 1, 1, 1, 1,
0.4497373, -0.1317428, 1.004574, 1, 1, 1, 1, 1,
0.4583674, 1.787747, 0.6858469, 1, 1, 1, 1, 1,
0.4598195, -0.2785212, 0.7556755, 1, 1, 1, 1, 1,
0.4611417, 1.135135, 0.6390118, 1, 1, 1, 1, 1,
0.4623162, 0.7608845, 1.778891, 1, 1, 1, 1, 1,
0.4669394, -1.564685, 2.368965, 1, 1, 1, 1, 1,
0.4685686, 0.8761653, 0.2155959, 1, 1, 1, 1, 1,
0.473234, -0.9952566, 0.6633824, 0, 0, 1, 1, 1,
0.4785061, -0.1069723, 0.8686182, 1, 0, 0, 1, 1,
0.4785601, 1.044067, 0.6557686, 1, 0, 0, 1, 1,
0.4798474, -0.6566483, 1.405252, 1, 0, 0, 1, 1,
0.4828439, -1.72309, 2.670727, 1, 0, 0, 1, 1,
0.4829848, -1.700217, 2.489557, 1, 0, 0, 1, 1,
0.484041, -0.4297419, 2.333224, 0, 0, 0, 1, 1,
0.4933034, 1.168924, -1.0695, 0, 0, 0, 1, 1,
0.4947668, 0.5528688, 0.9247987, 0, 0, 0, 1, 1,
0.4956451, 1.014035, -1.489055, 0, 0, 0, 1, 1,
0.4964998, 0.4411665, 2.259389, 0, 0, 0, 1, 1,
0.5006005, 0.3967166, 1.01236, 0, 0, 0, 1, 1,
0.5037976, -0.1435926, 2.213667, 0, 0, 0, 1, 1,
0.5109858, 0.4019529, 1.187983, 1, 1, 1, 1, 1,
0.5164343, 0.5651214, -0.6694843, 1, 1, 1, 1, 1,
0.5179014, -1.074853, 2.453683, 1, 1, 1, 1, 1,
0.5207873, -0.8956943, 1.408343, 1, 1, 1, 1, 1,
0.5229453, 0.4004949, 1.900263, 1, 1, 1, 1, 1,
0.5276327, -0.02532021, 0.4097483, 1, 1, 1, 1, 1,
0.5357211, 1.054973, 0.9353762, 1, 1, 1, 1, 1,
0.5468822, 1.568868, 1.111242, 1, 1, 1, 1, 1,
0.5514923, 0.1914248, 1.993391, 1, 1, 1, 1, 1,
0.5565177, -0.1557604, 0.9876132, 1, 1, 1, 1, 1,
0.5606739, 0.7758689, 0.3279222, 1, 1, 1, 1, 1,
0.5669539, -1.972677, 2.684558, 1, 1, 1, 1, 1,
0.5741315, 0.6528026, 1.597607, 1, 1, 1, 1, 1,
0.5744748, 0.05465605, 1.083194, 1, 1, 1, 1, 1,
0.5811173, -0.3622084, 2.862906, 1, 1, 1, 1, 1,
0.5856218, -0.3448926, 1.249575, 0, 0, 1, 1, 1,
0.5911107, 1.168935, 1.103464, 1, 0, 0, 1, 1,
0.5912814, 0.3935076, 0.2554013, 1, 0, 0, 1, 1,
0.5965872, 1.213039, 1.654697, 1, 0, 0, 1, 1,
0.5998838, -0.4055422, 2.59629, 1, 0, 0, 1, 1,
0.6011047, 2.213222, 0.615564, 1, 0, 0, 1, 1,
0.6029758, 1.506891, 1.613657, 0, 0, 0, 1, 1,
0.6165699, 0.7961012, 0.07124069, 0, 0, 0, 1, 1,
0.6186137, 0.7798081, 0.1349284, 0, 0, 0, 1, 1,
0.6272319, -1.883397, 3.453447, 0, 0, 0, 1, 1,
0.6303332, 0.08950405, 1.696016, 0, 0, 0, 1, 1,
0.637215, -0.2540245, 1.810528, 0, 0, 0, 1, 1,
0.6375691, 1.104188, 1.733609, 0, 0, 0, 1, 1,
0.6388738, -0.1663097, 3.709602, 1, 1, 1, 1, 1,
0.6567371, -1.174118, 3.539331, 1, 1, 1, 1, 1,
0.6626436, 0.07545063, 1.542425, 1, 1, 1, 1, 1,
0.6639714, -0.7640612, 2.759152, 1, 1, 1, 1, 1,
0.6643137, -1.258387, 1.937093, 1, 1, 1, 1, 1,
0.6747317, 0.8698241, 0.7216519, 1, 1, 1, 1, 1,
0.6768749, 1.047539, 0.2361282, 1, 1, 1, 1, 1,
0.6793594, 1.612825, 0.7722121, 1, 1, 1, 1, 1,
0.6795265, 0.906975, 0.1441914, 1, 1, 1, 1, 1,
0.6797456, -0.3583837, 2.313162, 1, 1, 1, 1, 1,
0.6871006, -0.8202562, 1.650017, 1, 1, 1, 1, 1,
0.6939768, 1.206633, 0.03266294, 1, 1, 1, 1, 1,
0.6947545, 0.8420693, -0.01936565, 1, 1, 1, 1, 1,
0.6967025, 0.1793743, 0.7528291, 1, 1, 1, 1, 1,
0.6975089, 0.8415355, -0.3656542, 1, 1, 1, 1, 1,
0.6991435, 0.9745359, -0.3244754, 0, 0, 1, 1, 1,
0.699194, -0.1477069, 1.777846, 1, 0, 0, 1, 1,
0.7016916, 0.206713, 1.252428, 1, 0, 0, 1, 1,
0.7071288, -0.450834, 1.206066, 1, 0, 0, 1, 1,
0.7077484, 2.235846, 0.5692541, 1, 0, 0, 1, 1,
0.708048, 0.6834691, -0.770398, 1, 0, 0, 1, 1,
0.7081634, 0.3394529, 1.165203, 0, 0, 0, 1, 1,
0.7198831, 0.1738677, 1.194023, 0, 0, 0, 1, 1,
0.721279, -0.8369948, 4.339993, 0, 0, 0, 1, 1,
0.7216214, 1.312302, -1.474087, 0, 0, 0, 1, 1,
0.7248455, 0.05343204, 2.089473, 0, 0, 0, 1, 1,
0.7271193, -0.6262246, 2.673893, 0, 0, 0, 1, 1,
0.7276373, -1.043965, 2.647245, 0, 0, 0, 1, 1,
0.7277348, 1.689666, 0.5730309, 1, 1, 1, 1, 1,
0.7303291, 0.2914767, 1.525648, 1, 1, 1, 1, 1,
0.7311352, -0.1104864, 0.07631575, 1, 1, 1, 1, 1,
0.7328128, 2.380283, 0.8107263, 1, 1, 1, 1, 1,
0.7342584, -0.148094, 0.4081472, 1, 1, 1, 1, 1,
0.7345956, 0.7459937, -1.720454, 1, 1, 1, 1, 1,
0.7347144, -0.4236084, 2.488261, 1, 1, 1, 1, 1,
0.7352806, 1.157081, -0.1016482, 1, 1, 1, 1, 1,
0.7355248, 1.801576, 2.245764, 1, 1, 1, 1, 1,
0.7412338, -2.362258, 1.264935, 1, 1, 1, 1, 1,
0.7413384, 0.899973, 0.3000213, 1, 1, 1, 1, 1,
0.7429388, 0.3270508, 0.496029, 1, 1, 1, 1, 1,
0.745051, -0.8872316, 2.938929, 1, 1, 1, 1, 1,
0.7579767, -0.4014549, 1.330275, 1, 1, 1, 1, 1,
0.7593111, 1.703112, -0.7751386, 1, 1, 1, 1, 1,
0.7616334, -0.5993016, 4.155212, 0, 0, 1, 1, 1,
0.7635177, -0.220228, 2.827713, 1, 0, 0, 1, 1,
0.7643611, 1.204127, 1.52541, 1, 0, 0, 1, 1,
0.7679721, 0.6769857, -0.05238578, 1, 0, 0, 1, 1,
0.7735409, -0.587998, 2.544952, 1, 0, 0, 1, 1,
0.7784438, -0.9150832, 1.562243, 1, 0, 0, 1, 1,
0.7787802, -0.3152527, 2.82477, 0, 0, 0, 1, 1,
0.7876863, 0.5872502, -2.006153, 0, 0, 0, 1, 1,
0.7898152, -0.819137, 3.493362, 0, 0, 0, 1, 1,
0.7927831, -1.213047, 1.990005, 0, 0, 0, 1, 1,
0.7942027, 0.2956601, 1.517627, 0, 0, 0, 1, 1,
0.7949215, 1.296282, -0.7556441, 0, 0, 0, 1, 1,
0.7961789, -0.4316702, 2.488744, 0, 0, 0, 1, 1,
0.7995743, 0.1243116, 1.128707, 1, 1, 1, 1, 1,
0.8087416, -0.1657129, 3.170999, 1, 1, 1, 1, 1,
0.8186263, 0.1995099, 0.7815251, 1, 1, 1, 1, 1,
0.8236142, -0.3194759, 2.0106, 1, 1, 1, 1, 1,
0.8292688, 0.4374237, 1.154948, 1, 1, 1, 1, 1,
0.8393832, 0.7770295, -0.8735567, 1, 1, 1, 1, 1,
0.8401034, 0.0451303, 1.435255, 1, 1, 1, 1, 1,
0.8496869, -1.001046, 0.7325543, 1, 1, 1, 1, 1,
0.8497232, 0.340764, 1.590443, 1, 1, 1, 1, 1,
0.8500637, -0.6699594, 1.11215, 1, 1, 1, 1, 1,
0.8504583, -0.7262921, 1.955528, 1, 1, 1, 1, 1,
0.8643358, -0.9753426, 3.276842, 1, 1, 1, 1, 1,
0.8645105, 0.05989082, 2.793487, 1, 1, 1, 1, 1,
0.8654838, 0.4308343, -0.6882272, 1, 1, 1, 1, 1,
0.8661334, -0.3708835, 2.003861, 1, 1, 1, 1, 1,
0.8697603, -0.05417565, 2.291282, 0, 0, 1, 1, 1,
0.8757669, 1.078584, -0.04629749, 1, 0, 0, 1, 1,
0.877134, -0.07413264, 3.93106, 1, 0, 0, 1, 1,
0.8930213, -0.3642536, 4.465776, 1, 0, 0, 1, 1,
0.8937123, -1.115853, 2.685472, 1, 0, 0, 1, 1,
0.8939725, 0.859411, 0.3823963, 1, 0, 0, 1, 1,
0.8966368, 0.2143603, 2.63496, 0, 0, 0, 1, 1,
0.8984294, 0.6644321, 0.8951984, 0, 0, 0, 1, 1,
0.9017251, 1.113274, 1.870328, 0, 0, 0, 1, 1,
0.9018909, -1.239334, 1.627445, 0, 0, 0, 1, 1,
0.9026026, -0.2554992, 1.448693, 0, 0, 0, 1, 1,
0.9047166, -0.5289161, 3.783976, 0, 0, 0, 1, 1,
0.9081638, -0.48397, 1.350469, 0, 0, 0, 1, 1,
0.9108571, 0.6744448, 1.869926, 1, 1, 1, 1, 1,
0.914427, -0.001857554, 1.060778, 1, 1, 1, 1, 1,
0.9200995, -0.3971394, 3.906397, 1, 1, 1, 1, 1,
0.9202452, -0.07760958, 1.305377, 1, 1, 1, 1, 1,
0.925864, 2.034467, 0.04156062, 1, 1, 1, 1, 1,
0.9265621, 2.238723, 0.8342804, 1, 1, 1, 1, 1,
0.9302255, -0.04540048, 1.804486, 1, 1, 1, 1, 1,
0.9380131, 1.657675, -0.9306871, 1, 1, 1, 1, 1,
0.940283, 0.6555543, -1.268974, 1, 1, 1, 1, 1,
0.9433462, -0.1631517, 1.508856, 1, 1, 1, 1, 1,
0.9557071, 1.288004, 1.580463, 1, 1, 1, 1, 1,
0.9682354, 0.9128271, 1.500344, 1, 1, 1, 1, 1,
0.9704255, -0.4728007, 2.939288, 1, 1, 1, 1, 1,
0.9831275, -0.3929798, 2.804713, 1, 1, 1, 1, 1,
0.9831294, -0.3417553, 2.396746, 1, 1, 1, 1, 1,
0.986804, 2.219741, 0.7169467, 0, 0, 1, 1, 1,
0.9877883, -0.01756936, 1.140504, 1, 0, 0, 1, 1,
0.9908413, 1.808644, 0.3709778, 1, 0, 0, 1, 1,
0.9915175, -1.24036, 3.691182, 1, 0, 0, 1, 1,
1.003606, -0.08015199, -0.2287388, 1, 0, 0, 1, 1,
1.005697, 0.4193367, -0.2882977, 1, 0, 0, 1, 1,
1.007135, 0.4203603, 0.7325135, 0, 0, 0, 1, 1,
1.007674, 0.2011739, 0.1780959, 0, 0, 0, 1, 1,
1.010804, -1.752894, 0.8881537, 0, 0, 0, 1, 1,
1.018792, -1.984551, 2.241203, 0, 0, 0, 1, 1,
1.024625, 0.1733281, 1.791056, 0, 0, 0, 1, 1,
1.031079, -0.3379407, 0.2077329, 0, 0, 0, 1, 1,
1.034411, 0.9214742, 0.7840247, 0, 0, 0, 1, 1,
1.038553, -0.1246716, 1.415906, 1, 1, 1, 1, 1,
1.041259, 0.7917036, -0.306295, 1, 1, 1, 1, 1,
1.043461, 1.297112, -1.868628, 1, 1, 1, 1, 1,
1.044446, 0.591505, 1.608528, 1, 1, 1, 1, 1,
1.051369, -1.952842, 3.5931, 1, 1, 1, 1, 1,
1.054118, -0.1938913, 1.349823, 1, 1, 1, 1, 1,
1.058282, 1.854094, 1.002356, 1, 1, 1, 1, 1,
1.059226, -1.574203, 1.946014, 1, 1, 1, 1, 1,
1.059291, 0.484276, -0.04650211, 1, 1, 1, 1, 1,
1.062233, 0.8556171, 2.896922, 1, 1, 1, 1, 1,
1.070599, -1.822077, 2.365138, 1, 1, 1, 1, 1,
1.077546, -0.2117292, 0.9676628, 1, 1, 1, 1, 1,
1.089067, -1.69133, 1.554153, 1, 1, 1, 1, 1,
1.104498, 0.6743665, 1.007796, 1, 1, 1, 1, 1,
1.104974, -0.805134, 1.86937, 1, 1, 1, 1, 1,
1.107426, -1.469653, 3.829193, 0, 0, 1, 1, 1,
1.108247, 0.6934868, 1.833616, 1, 0, 0, 1, 1,
1.108848, 0.2663, 1.182487, 1, 0, 0, 1, 1,
1.109359, 0.04272303, 0.7710947, 1, 0, 0, 1, 1,
1.114897, -0.7438567, 1.715644, 1, 0, 0, 1, 1,
1.120782, 0.7808031, 1.362734, 1, 0, 0, 1, 1,
1.120925, -0.08505001, 1.800503, 0, 0, 0, 1, 1,
1.121023, -0.4493649, 2.36535, 0, 0, 0, 1, 1,
1.125681, -0.6767525, 0.490739, 0, 0, 0, 1, 1,
1.130957, 1.916769, -0.08225774, 0, 0, 0, 1, 1,
1.142471, -0.3656411, 1.172702, 0, 0, 0, 1, 1,
1.148993, -0.08497356, 1.247051, 0, 0, 0, 1, 1,
1.150315, -0.8984686, 3.98704, 0, 0, 0, 1, 1,
1.171763, 1.86043, 0.2017695, 1, 1, 1, 1, 1,
1.173465, -0.4570269, 2.386075, 1, 1, 1, 1, 1,
1.176387, -0.01701814, 2.218139, 1, 1, 1, 1, 1,
1.176956, 1.052822, -0.5903043, 1, 1, 1, 1, 1,
1.177227, 2.181344, 0.5412758, 1, 1, 1, 1, 1,
1.178301, -1.001832, 0.9617673, 1, 1, 1, 1, 1,
1.180484, 1.324236, 0.9641047, 1, 1, 1, 1, 1,
1.183236, -0.7412496, 2.23585, 1, 1, 1, 1, 1,
1.195164, -0.5360597, 1.364169, 1, 1, 1, 1, 1,
1.198779, 0.5893683, 0.04498228, 1, 1, 1, 1, 1,
1.203231, 0.4880425, 0.614076, 1, 1, 1, 1, 1,
1.206797, -1.589549, 3.767995, 1, 1, 1, 1, 1,
1.207797, 0.7219985, 1.013581, 1, 1, 1, 1, 1,
1.209068, 0.3264578, 2.409281, 1, 1, 1, 1, 1,
1.213544, -0.08317078, 2.263924, 1, 1, 1, 1, 1,
1.219458, 0.4617672, 0.4991416, 0, 0, 1, 1, 1,
1.22154, 0.156677, 1.988653, 1, 0, 0, 1, 1,
1.221791, -2.377778, 2.833742, 1, 0, 0, 1, 1,
1.22382, 0.4424886, -0.0519292, 1, 0, 0, 1, 1,
1.223859, 0.2952945, 0.4195296, 1, 0, 0, 1, 1,
1.229413, -1.847936, 4.152145, 1, 0, 0, 1, 1,
1.234134, 0.2206513, 0.905978, 0, 0, 0, 1, 1,
1.250032, -1.766852, 2.266246, 0, 0, 0, 1, 1,
1.257924, 0.1594701, 0.9075328, 0, 0, 0, 1, 1,
1.281102, 0.4070307, 2.180051, 0, 0, 0, 1, 1,
1.290446, 1.035593, 2.277632, 0, 0, 0, 1, 1,
1.293611, 0.3604208, 1.486115, 0, 0, 0, 1, 1,
1.301444, -1.267903, 1.524761, 0, 0, 0, 1, 1,
1.304809, 0.2275271, 0.1642945, 1, 1, 1, 1, 1,
1.318276, -0.8312955, 2.156345, 1, 1, 1, 1, 1,
1.32182, -0.2054002, 0.9131496, 1, 1, 1, 1, 1,
1.323923, 0.4455771, 1.776404, 1, 1, 1, 1, 1,
1.344154, -2.031513, 3.55827, 1, 1, 1, 1, 1,
1.34441, 0.1545997, 1.192269, 1, 1, 1, 1, 1,
1.347133, -0.328545, 1.868613, 1, 1, 1, 1, 1,
1.353881, 0.5026091, 1.630438, 1, 1, 1, 1, 1,
1.358415, -1.25113, 0.5888543, 1, 1, 1, 1, 1,
1.359408, -0.07819511, 1.619641, 1, 1, 1, 1, 1,
1.375358, -1.357201, 3.616212, 1, 1, 1, 1, 1,
1.380833, -0.5530741, 1.446782, 1, 1, 1, 1, 1,
1.39234, 0.8616949, 2.457391, 1, 1, 1, 1, 1,
1.416042, -0.2297966, 0.05646584, 1, 1, 1, 1, 1,
1.427906, 0.983034, 0.5598019, 1, 1, 1, 1, 1,
1.432193, -0.005536202, 3.654615, 0, 0, 1, 1, 1,
1.432869, -2.03238, 2.537327, 1, 0, 0, 1, 1,
1.44405, 0.08147067, 3.00795, 1, 0, 0, 1, 1,
1.444871, 0.2512936, 0.7650344, 1, 0, 0, 1, 1,
1.461356, 0.4176986, 2.281617, 1, 0, 0, 1, 1,
1.471409, 0.9446394, -0.6202608, 1, 0, 0, 1, 1,
1.473935, -0.9003437, 2.836325, 0, 0, 0, 1, 1,
1.475308, 1.363879, 1.300801, 0, 0, 0, 1, 1,
1.480119, 0.7020139, 0.594707, 0, 0, 0, 1, 1,
1.488113, 0.6408108, 1.603573, 0, 0, 0, 1, 1,
1.493751, -0.07620175, 2.691804, 0, 0, 0, 1, 1,
1.506505, 0.8745695, 1.709587, 0, 0, 0, 1, 1,
1.51304, 0.3481672, 2.623312, 0, 0, 0, 1, 1,
1.513746, -1.143653, 1.580405, 1, 1, 1, 1, 1,
1.514868, -0.7970095, 0.9052953, 1, 1, 1, 1, 1,
1.531313, 1.269982, 1.874476, 1, 1, 1, 1, 1,
1.542273, 0.891785, 2.831648, 1, 1, 1, 1, 1,
1.549693, -0.03236432, -0.007101533, 1, 1, 1, 1, 1,
1.550501, -1.825681, 1.703798, 1, 1, 1, 1, 1,
1.551387, -0.8494835, 3.103418, 1, 1, 1, 1, 1,
1.560171, -0.9196143, 2.051543, 1, 1, 1, 1, 1,
1.570609, -0.336521, 0.893115, 1, 1, 1, 1, 1,
1.571643, -1.21334, 3.319659, 1, 1, 1, 1, 1,
1.578858, -0.5811357, 0.8324808, 1, 1, 1, 1, 1,
1.638218, -0.2294929, 2.112253, 1, 1, 1, 1, 1,
1.655057, 0.6515406, 0.2276852, 1, 1, 1, 1, 1,
1.655792, -2.038711, 1.389865, 1, 1, 1, 1, 1,
1.658508, 0.5403509, -0.2025542, 1, 1, 1, 1, 1,
1.671988, 0.1074685, 0.666616, 0, 0, 1, 1, 1,
1.67806, 0.261544, 1.68028, 1, 0, 0, 1, 1,
1.68925, -0.7257332, 1.878379, 1, 0, 0, 1, 1,
1.706594, -1.5572, 2.049871, 1, 0, 0, 1, 1,
1.707496, -1.407515, 1.756667, 1, 0, 0, 1, 1,
1.714784, -0.9974014, 1.91512, 1, 0, 0, 1, 1,
1.716583, 1.397094, -0.2259389, 0, 0, 0, 1, 1,
1.72348, 0.7856023, 1.394172, 0, 0, 0, 1, 1,
1.724083, 0.2254789, -0.4617948, 0, 0, 0, 1, 1,
1.74141, 0.8428276, 0.4084449, 0, 0, 0, 1, 1,
1.749357, -0.3063324, 1.145008, 0, 0, 0, 1, 1,
1.75536, -1.13417, 1.590121, 0, 0, 0, 1, 1,
1.784822, 0.07355511, 0.8908169, 0, 0, 0, 1, 1,
1.784917, -1.796662, 1.613726, 1, 1, 1, 1, 1,
1.831464, -0.04306694, 1.760578, 1, 1, 1, 1, 1,
1.842739, 0.8544638, 1.942471, 1, 1, 1, 1, 1,
1.845789, 0.160506, 1.128147, 1, 1, 1, 1, 1,
1.851257, -0.4183528, 2.362073, 1, 1, 1, 1, 1,
1.851827, 0.1171559, 1.876383, 1, 1, 1, 1, 1,
1.863899, 0.6342905, 1.789133, 1, 1, 1, 1, 1,
1.909288, -0.1128666, 0.7437226, 1, 1, 1, 1, 1,
1.928052, -0.4952877, 1.316276, 1, 1, 1, 1, 1,
1.961719, -0.3907074, 1.670092, 1, 1, 1, 1, 1,
1.978801, 0.2403687, 1.078501, 1, 1, 1, 1, 1,
2.004612, -0.7371092, 2.331095, 1, 1, 1, 1, 1,
2.060323, 0.5252184, 0.7754273, 1, 1, 1, 1, 1,
2.073993, -0.7435564, 2.557611, 1, 1, 1, 1, 1,
2.085951, -0.2784772, 2.496621, 1, 1, 1, 1, 1,
2.092499, 1.070138, 1.94148, 0, 0, 1, 1, 1,
2.142413, -1.901852, -0.05964099, 1, 0, 0, 1, 1,
2.144881, -0.5718772, 0.3676054, 1, 0, 0, 1, 1,
2.165833, 0.557633, -0.3094918, 1, 0, 0, 1, 1,
2.167502, 1.771377, 0.340454, 1, 0, 0, 1, 1,
2.211977, 0.795595, 0.1358821, 1, 0, 0, 1, 1,
2.213831, 0.09304445, 0.9264054, 0, 0, 0, 1, 1,
2.236973, -0.8992859, 2.293199, 0, 0, 0, 1, 1,
2.261954, 0.08855702, 0.5422777, 0, 0, 0, 1, 1,
2.269005, -0.4679831, 0.952801, 0, 0, 0, 1, 1,
2.316928, 2.147058, -1.109493, 0, 0, 0, 1, 1,
2.343167, -0.2014754, 1.192346, 0, 0, 0, 1, 1,
2.362775, -0.7000386, 1.399656, 0, 0, 0, 1, 1,
2.371671, 1.896091, -0.5366631, 1, 1, 1, 1, 1,
2.377765, -0.03505683, 2.319052, 1, 1, 1, 1, 1,
2.391006, -0.958445, 1.509313, 1, 1, 1, 1, 1,
2.466729, -0.4870374, 2.206822, 1, 1, 1, 1, 1,
2.602167, -1.109602, 2.793436, 1, 1, 1, 1, 1,
2.623281, 0.6830081, -0.02108545, 1, 1, 1, 1, 1,
2.92732, 1.17959, 1.188573, 1, 1, 1, 1, 1
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
var radius = 9.877882;
var distance = 34.69564;
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
mvMatrix.translate( 0.01103628, -0.3156776, -0.3964553 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.69564);
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
