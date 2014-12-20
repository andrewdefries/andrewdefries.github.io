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
-3.278651, -1.288656, -3.031923, 1, 0, 0, 1,
-2.769666, -0.3899406, 1.761353, 1, 0.007843138, 0, 1,
-2.603345, -0.4874902, -1.372723, 1, 0.01176471, 0, 1,
-2.550149, -0.506315, -2.71344, 1, 0.01960784, 0, 1,
-2.364263, 0.5208231, -0.2771019, 1, 0.02352941, 0, 1,
-2.29985, -0.3858393, -2.413178, 1, 0.03137255, 0, 1,
-2.295491, 1.763944, -3.028965, 1, 0.03529412, 0, 1,
-2.257464, -0.06872945, -1.711704, 1, 0.04313726, 0, 1,
-2.257169, 0.3862858, -3.944889, 1, 0.04705882, 0, 1,
-2.221311, -0.844156, -2.203012, 1, 0.05490196, 0, 1,
-2.212318, -0.1766972, -1.189839, 1, 0.05882353, 0, 1,
-2.195796, -0.1772332, -0.1137949, 1, 0.06666667, 0, 1,
-2.192235, -1.423782, -1.137636, 1, 0.07058824, 0, 1,
-2.175658, 0.05643453, -0.09344932, 1, 0.07843138, 0, 1,
-2.173679, 0.304247, -1.182918, 1, 0.08235294, 0, 1,
-2.172994, 0.6331669, -0.5390218, 1, 0.09019608, 0, 1,
-2.170448, 0.1924545, -1.418445, 1, 0.09411765, 0, 1,
-2.14314, -0.7643079, -1.941171, 1, 0.1019608, 0, 1,
-2.115916, -0.8248515, -1.951527, 1, 0.1098039, 0, 1,
-2.069364, 0.7231248, -0.2582481, 1, 0.1137255, 0, 1,
-2.067858, 1.441235, -1.547892, 1, 0.1215686, 0, 1,
-2.059848, -0.3507438, -2.147674, 1, 0.1254902, 0, 1,
-2.056108, 1.957121, -1.713323, 1, 0.1333333, 0, 1,
-1.933337, 0.6391367, -0.5680592, 1, 0.1372549, 0, 1,
-1.905651, -0.1441205, -1.298089, 1, 0.145098, 0, 1,
-1.904115, 0.9220132, -2.679334, 1, 0.1490196, 0, 1,
-1.899649, -0.3955686, -2.045622, 1, 0.1568628, 0, 1,
-1.898297, 1.137739, -1.469802, 1, 0.1607843, 0, 1,
-1.890933, 1.02251, -0.2448405, 1, 0.1686275, 0, 1,
-1.878217, 1.082248, 0.02662232, 1, 0.172549, 0, 1,
-1.84065, -1.17226, -3.706504, 1, 0.1803922, 0, 1,
-1.833138, 0.4479007, 0.9392482, 1, 0.1843137, 0, 1,
-1.825764, -0.05337795, -0.6219792, 1, 0.1921569, 0, 1,
-1.82378, 0.4259449, -1.701464, 1, 0.1960784, 0, 1,
-1.823715, -0.8996339, -2.378997, 1, 0.2039216, 0, 1,
-1.8046, -0.2887246, -1.924109, 1, 0.2117647, 0, 1,
-1.799891, -0.5504986, -1.45027, 1, 0.2156863, 0, 1,
-1.794898, 0.09631045, -3.224251, 1, 0.2235294, 0, 1,
-1.77198, 1.120191, -0.7778357, 1, 0.227451, 0, 1,
-1.769567, -0.9236422, -1.549276, 1, 0.2352941, 0, 1,
-1.765437, 0.3182968, -2.327015, 1, 0.2392157, 0, 1,
-1.749088, -0.2087788, -2.417609, 1, 0.2470588, 0, 1,
-1.748649, -0.8038071, -2.574454, 1, 0.2509804, 0, 1,
-1.744981, -0.7509736, -2.791216, 1, 0.2588235, 0, 1,
-1.709134, -0.7542226, -2.574107, 1, 0.2627451, 0, 1,
-1.7061, 0.8982526, -1.97929, 1, 0.2705882, 0, 1,
-1.687406, -1.359127, -2.994156, 1, 0.2745098, 0, 1,
-1.686926, -0.1601024, -1.306281, 1, 0.282353, 0, 1,
-1.680407, -1.468684, -2.555676, 1, 0.2862745, 0, 1,
-1.67622, -1.042435, -1.389789, 1, 0.2941177, 0, 1,
-1.671651, 1.772308, -1.77889, 1, 0.3019608, 0, 1,
-1.665438, -0.2176738, -3.3705, 1, 0.3058824, 0, 1,
-1.653777, -0.3875393, -1.874391, 1, 0.3137255, 0, 1,
-1.631555, 0.7595918, -0.8983201, 1, 0.3176471, 0, 1,
-1.605367, -0.3737425, -1.984302, 1, 0.3254902, 0, 1,
-1.601336, -1.768352, -2.147845, 1, 0.3294118, 0, 1,
-1.593414, -0.6632422, -1.416426, 1, 0.3372549, 0, 1,
-1.573593, -0.3806933, -2.114174, 1, 0.3411765, 0, 1,
-1.570561, -0.7662726, -2.090562, 1, 0.3490196, 0, 1,
-1.567513, -0.3765725, -1.591946, 1, 0.3529412, 0, 1,
-1.563588, 0.3021372, -0.01712118, 1, 0.3607843, 0, 1,
-1.554252, 1.002901, -1.950912, 1, 0.3647059, 0, 1,
-1.546927, -1.397449, -2.464728, 1, 0.372549, 0, 1,
-1.541515, 1.224634, -1.492168, 1, 0.3764706, 0, 1,
-1.531506, 0.7799245, -1.405284, 1, 0.3843137, 0, 1,
-1.526725, 0.9962285, -0.6802247, 1, 0.3882353, 0, 1,
-1.515033, -0.3626543, -1.564687, 1, 0.3960784, 0, 1,
-1.485183, -1.142136, -0.3643269, 1, 0.4039216, 0, 1,
-1.478858, 0.02756288, -1.005146, 1, 0.4078431, 0, 1,
-1.474871, -1.007625, -1.989595, 1, 0.4156863, 0, 1,
-1.465264, 1.172579, -1.893549, 1, 0.4196078, 0, 1,
-1.455965, -0.2923518, -2.61078, 1, 0.427451, 0, 1,
-1.451726, 0.6102858, -0.4429983, 1, 0.4313726, 0, 1,
-1.447339, 1.97566, -1.286806, 1, 0.4392157, 0, 1,
-1.436767, 0.2534455, -1.516027, 1, 0.4431373, 0, 1,
-1.430496, -0.5372171, -1.667552, 1, 0.4509804, 0, 1,
-1.42552, -0.04053547, -1.840551, 1, 0.454902, 0, 1,
-1.421616, -0.7287293, -4.076664, 1, 0.4627451, 0, 1,
-1.418591, -0.3946214, -2.26162, 1, 0.4666667, 0, 1,
-1.416605, 1.293568, -0.05879877, 1, 0.4745098, 0, 1,
-1.392765, 0.7029166, -0.07753491, 1, 0.4784314, 0, 1,
-1.389177, -0.1251221, -1.802311, 1, 0.4862745, 0, 1,
-1.383048, 2.588134, -1.067679, 1, 0.4901961, 0, 1,
-1.361822, -0.1421709, -0.05671144, 1, 0.4980392, 0, 1,
-1.352879, -0.3883474, -2.276992, 1, 0.5058824, 0, 1,
-1.351481, -2.78223, -1.665657, 1, 0.509804, 0, 1,
-1.343764, 0.4829656, 0.4764997, 1, 0.5176471, 0, 1,
-1.333765, -1.590863, -0.2975252, 1, 0.5215687, 0, 1,
-1.316018, -0.6814989, -3.950622, 1, 0.5294118, 0, 1,
-1.315488, 0.7656891, -2.0342, 1, 0.5333334, 0, 1,
-1.29514, -1.541533, -1.547866, 1, 0.5411765, 0, 1,
-1.2933, 0.197102, -3.102842, 1, 0.5450981, 0, 1,
-1.292146, -0.153911, -2.955674, 1, 0.5529412, 0, 1,
-1.287492, 0.4222681, 0.7910148, 1, 0.5568628, 0, 1,
-1.282351, 1.913328, 0.6191997, 1, 0.5647059, 0, 1,
-1.266205, -0.4579018, -3.475301, 1, 0.5686275, 0, 1,
-1.265668, -0.5840082, -3.064812, 1, 0.5764706, 0, 1,
-1.25827, -0.30591, -1.130908, 1, 0.5803922, 0, 1,
-1.250323, -0.07806057, -0.4218615, 1, 0.5882353, 0, 1,
-1.249415, 1.629229, -1.701678, 1, 0.5921569, 0, 1,
-1.245718, 0.5748992, -2.264881, 1, 0.6, 0, 1,
-1.244772, -0.3496587, -1.143895, 1, 0.6078432, 0, 1,
-1.242738, -0.9785305, -2.178033, 1, 0.6117647, 0, 1,
-1.235119, -1.053803, -2.757825, 1, 0.6196079, 0, 1,
-1.234367, -0.001124598, -1.268019, 1, 0.6235294, 0, 1,
-1.234348, 0.5273019, -1.736134, 1, 0.6313726, 0, 1,
-1.227896, 0.7220644, -1.19842, 1, 0.6352941, 0, 1,
-1.226462, 0.2777422, -1.246235, 1, 0.6431373, 0, 1,
-1.219038, -0.2437501, -1.438358, 1, 0.6470588, 0, 1,
-1.21545, -0.8499342, -2.058748, 1, 0.654902, 0, 1,
-1.198444, -1.116028, -2.970663, 1, 0.6588235, 0, 1,
-1.19833, -0.6527995, -1.640673, 1, 0.6666667, 0, 1,
-1.183645, 1.402773, 0.1026042, 1, 0.6705883, 0, 1,
-1.183103, 0.3070399, -2.655193, 1, 0.6784314, 0, 1,
-1.182248, 1.8267, -0.1043352, 1, 0.682353, 0, 1,
-1.179122, -0.664653, -1.866272, 1, 0.6901961, 0, 1,
-1.177261, -1.729161, -2.44009, 1, 0.6941177, 0, 1,
-1.170645, 0.4954332, -2.248858, 1, 0.7019608, 0, 1,
-1.170362, -0.008810804, -0.5248526, 1, 0.7098039, 0, 1,
-1.164102, -0.7503024, -1.647217, 1, 0.7137255, 0, 1,
-1.152852, -1.207645, -2.65047, 1, 0.7215686, 0, 1,
-1.143666, -0.885586, -3.635667, 1, 0.7254902, 0, 1,
-1.139954, -0.4397848, -1.615231, 1, 0.7333333, 0, 1,
-1.134553, -0.1513266, -1.989096, 1, 0.7372549, 0, 1,
-1.134314, -1.099276, -3.229018, 1, 0.7450981, 0, 1,
-1.134231, -0.4582666, -1.167765, 1, 0.7490196, 0, 1,
-1.124986, -0.1733133, -0.5799025, 1, 0.7568628, 0, 1,
-1.103117, -0.7527937, -2.027838, 1, 0.7607843, 0, 1,
-1.094579, 0.4548899, -1.443514, 1, 0.7686275, 0, 1,
-1.091504, 1.438857, -1.324339, 1, 0.772549, 0, 1,
-1.083158, 0.1154078, -0.1722686, 1, 0.7803922, 0, 1,
-1.081174, -0.4109145, -1.773299, 1, 0.7843137, 0, 1,
-1.072944, 0.6340666, -0.8006786, 1, 0.7921569, 0, 1,
-1.071806, -2.79224, -1.014409, 1, 0.7960784, 0, 1,
-1.062316, 2.14456, -0.6488495, 1, 0.8039216, 0, 1,
-1.05567, 0.6680349, -1.435227, 1, 0.8117647, 0, 1,
-1.054691, 0.2387182, -0.9448472, 1, 0.8156863, 0, 1,
-1.045681, -0.4765443, -2.727795, 1, 0.8235294, 0, 1,
-1.039819, 0.147032, -3.851404, 1, 0.827451, 0, 1,
-1.034882, -0.7797917, -2.251516, 1, 0.8352941, 0, 1,
-1.032184, 0.06381141, -0.1152513, 1, 0.8392157, 0, 1,
-1.03161, -1.50808, -3.228297, 1, 0.8470588, 0, 1,
-1.025644, -1.229511, -1.983719, 1, 0.8509804, 0, 1,
-1.025589, 1.255988, -0.1549273, 1, 0.8588235, 0, 1,
-1.018384, -0.1225626, -3.030093, 1, 0.8627451, 0, 1,
-1.017215, -0.2393757, -1.219908, 1, 0.8705882, 0, 1,
-1.01348, 0.5803346, -0.9074093, 1, 0.8745098, 0, 1,
-1.005169, 1.883035, -0.5859001, 1, 0.8823529, 0, 1,
-0.9970552, 0.8607272, -0.1354405, 1, 0.8862745, 0, 1,
-0.9968482, 0.697924, 0.4309871, 1, 0.8941177, 0, 1,
-0.9918063, 0.5043753, -0.8087023, 1, 0.8980392, 0, 1,
-0.9897103, -0.2808554, -1.656398, 1, 0.9058824, 0, 1,
-0.9870145, -0.4194285, -2.089345, 1, 0.9137255, 0, 1,
-0.9861304, -0.04444338, -2.69573, 1, 0.9176471, 0, 1,
-0.984069, -0.8010233, -1.303119, 1, 0.9254902, 0, 1,
-0.9778278, -0.8589396, -1.470343, 1, 0.9294118, 0, 1,
-0.9775522, -0.07807493, -2.447249, 1, 0.9372549, 0, 1,
-0.9757926, -1.1969, -1.334842, 1, 0.9411765, 0, 1,
-0.9732542, -0.1541131, -2.901163, 1, 0.9490196, 0, 1,
-0.9686408, 1.196242, -1.222365, 1, 0.9529412, 0, 1,
-0.9630899, -0.7950391, -0.8557681, 1, 0.9607843, 0, 1,
-0.9605765, 0.7906939, -0.9556397, 1, 0.9647059, 0, 1,
-0.9555, -0.3862882, -2.681306, 1, 0.972549, 0, 1,
-0.9523026, 0.4850579, -2.355407, 1, 0.9764706, 0, 1,
-0.9425416, -1.807601, -2.12572, 1, 0.9843137, 0, 1,
-0.9397546, 0.1538476, -1.496794, 1, 0.9882353, 0, 1,
-0.9360309, -1.317583, -1.512678, 1, 0.9960784, 0, 1,
-0.9320936, -0.6562656, -2.492226, 0.9960784, 1, 0, 1,
-0.923772, -0.08589005, -2.885367, 0.9921569, 1, 0, 1,
-0.920369, -0.5601472, -1.080626, 0.9843137, 1, 0, 1,
-0.9187414, -0.3174796, -1.304308, 0.9803922, 1, 0, 1,
-0.9149283, -1.073713, -0.8032376, 0.972549, 1, 0, 1,
-0.9142365, 0.5664402, -1.335036, 0.9686275, 1, 0, 1,
-0.9099656, 2.450342, 0.698731, 0.9607843, 1, 0, 1,
-0.908438, -1.61183, -2.973939, 0.9568627, 1, 0, 1,
-0.9080386, 0.751535, 0.0520962, 0.9490196, 1, 0, 1,
-0.9035025, 0.4991383, -0.7551938, 0.945098, 1, 0, 1,
-0.8969564, 0.3676423, -1.406316, 0.9372549, 1, 0, 1,
-0.8968412, 0.08662459, -3.110405, 0.9333333, 1, 0, 1,
-0.8964527, 0.6377991, -0.74378, 0.9254902, 1, 0, 1,
-0.8926749, -1.22232, -2.975526, 0.9215686, 1, 0, 1,
-0.8806413, 1.326009, -0.03241502, 0.9137255, 1, 0, 1,
-0.8774918, -0.07222634, -2.630508, 0.9098039, 1, 0, 1,
-0.8772244, -1.434873, -1.283354, 0.9019608, 1, 0, 1,
-0.874778, -1.241231, -2.293845, 0.8941177, 1, 0, 1,
-0.8712245, -1.638726, -4.902518, 0.8901961, 1, 0, 1,
-0.8708839, -1.502167, -0.6366382, 0.8823529, 1, 0, 1,
-0.8688705, -1.888659, -3.052861, 0.8784314, 1, 0, 1,
-0.8683392, -1.758308, -2.399928, 0.8705882, 1, 0, 1,
-0.8677252, 1.671436, -1.349245, 0.8666667, 1, 0, 1,
-0.863903, -0.3749728, -1.506131, 0.8588235, 1, 0, 1,
-0.8619782, 0.5436347, 0.001139623, 0.854902, 1, 0, 1,
-0.8550003, -1.944107, -2.311826, 0.8470588, 1, 0, 1,
-0.8522441, -1.284631, -3.434914, 0.8431373, 1, 0, 1,
-0.8520709, -1.279949, -2.575983, 0.8352941, 1, 0, 1,
-0.8473187, 0.3187906, -1.219386, 0.8313726, 1, 0, 1,
-0.8441338, 0.7963926, -2.506172, 0.8235294, 1, 0, 1,
-0.8368888, -0.3317567, -0.4427643, 0.8196079, 1, 0, 1,
-0.8364043, -0.01322709, -2.422843, 0.8117647, 1, 0, 1,
-0.8317775, -1.147586, -1.073192, 0.8078431, 1, 0, 1,
-0.8307455, -0.2997006, -1.614866, 0.8, 1, 0, 1,
-0.8305333, -0.6799535, -1.98466, 0.7921569, 1, 0, 1,
-0.8291984, 0.179046, -1.032435, 0.7882353, 1, 0, 1,
-0.8220696, -1.080913, -2.408774, 0.7803922, 1, 0, 1,
-0.8206933, 1.347062, -3.122761, 0.7764706, 1, 0, 1,
-0.8202308, -1.889271, -1.545886, 0.7686275, 1, 0, 1,
-0.8188044, -0.7958555, -2.405918, 0.7647059, 1, 0, 1,
-0.8123314, 0.1520772, -0.3909136, 0.7568628, 1, 0, 1,
-0.8111558, -1.133552, -2.999179, 0.7529412, 1, 0, 1,
-0.8102107, -0.2934222, -3.381613, 0.7450981, 1, 0, 1,
-0.8091231, 0.4514716, 1.460821, 0.7411765, 1, 0, 1,
-0.8048997, 0.7321618, -1.229748, 0.7333333, 1, 0, 1,
-0.7999379, -0.2892742, -1.856235, 0.7294118, 1, 0, 1,
-0.7982098, 1.315901, -2.295909, 0.7215686, 1, 0, 1,
-0.7972901, 2.006573, -2.612123, 0.7176471, 1, 0, 1,
-0.7950458, -1.55052, -1.634217, 0.7098039, 1, 0, 1,
-0.785318, 1.044684, 0.1163517, 0.7058824, 1, 0, 1,
-0.785155, -1.4309, -1.586023, 0.6980392, 1, 0, 1,
-0.7803025, 0.8009248, 0.8572834, 0.6901961, 1, 0, 1,
-0.7753021, -0.2803159, -3.637621, 0.6862745, 1, 0, 1,
-0.7746542, -0.1104395, 0.7364517, 0.6784314, 1, 0, 1,
-0.7745807, -0.3855678, -1.717324, 0.6745098, 1, 0, 1,
-0.774016, -0.5863597, -3.258901, 0.6666667, 1, 0, 1,
-0.7726188, -1.50181, -2.223653, 0.6627451, 1, 0, 1,
-0.7666364, 0.8660107, -0.1147183, 0.654902, 1, 0, 1,
-0.7648277, -0.07364503, -2.820704, 0.6509804, 1, 0, 1,
-0.7629882, 0.2156362, -1.048172, 0.6431373, 1, 0, 1,
-0.7625227, 0.3777418, 1.023237, 0.6392157, 1, 0, 1,
-0.7610989, -1.301795, -3.669142, 0.6313726, 1, 0, 1,
-0.7608848, -0.4972093, -3.453017, 0.627451, 1, 0, 1,
-0.7587574, 0.07261961, -2.414607, 0.6196079, 1, 0, 1,
-0.7540032, 0.5105717, -1.536183, 0.6156863, 1, 0, 1,
-0.7532804, -1.504802, -3.21338, 0.6078432, 1, 0, 1,
-0.7500666, -1.507213, -3.564638, 0.6039216, 1, 0, 1,
-0.7430307, 1.034697, -0.6256822, 0.5960785, 1, 0, 1,
-0.7379257, 0.08210099, -0.9040705, 0.5882353, 1, 0, 1,
-0.7371833, -0.6107863, -1.368616, 0.5843138, 1, 0, 1,
-0.7279373, -0.4929197, -1.144689, 0.5764706, 1, 0, 1,
-0.7265903, -1.308375, -3.644984, 0.572549, 1, 0, 1,
-0.7258086, -1.59256, -3.352723, 0.5647059, 1, 0, 1,
-0.7249962, 0.7603261, 0.3448492, 0.5607843, 1, 0, 1,
-0.7176355, 1.172066, 0.7476685, 0.5529412, 1, 0, 1,
-0.7135996, 0.1891701, -2.474867, 0.5490196, 1, 0, 1,
-0.709715, -0.675737, -3.450094, 0.5411765, 1, 0, 1,
-0.7071671, 0.6420492, -0.5880738, 0.5372549, 1, 0, 1,
-0.7058869, 0.3052342, -1.003497, 0.5294118, 1, 0, 1,
-0.7042749, -1.371071, -3.486291, 0.5254902, 1, 0, 1,
-0.7024609, -1.420187, -3.8581, 0.5176471, 1, 0, 1,
-0.7024052, 1.661692, -1.581768, 0.5137255, 1, 0, 1,
-0.7006608, 0.8444663, 0.8273717, 0.5058824, 1, 0, 1,
-0.7005091, 0.6302707, 1.842124, 0.5019608, 1, 0, 1,
-0.6984415, -0.747145, -1.216875, 0.4941176, 1, 0, 1,
-0.6975125, 0.3737213, -0.2186047, 0.4862745, 1, 0, 1,
-0.6965842, 0.2519607, 0.08359792, 0.4823529, 1, 0, 1,
-0.69311, 1.915198, 0.6097766, 0.4745098, 1, 0, 1,
-0.6923239, -0.6659452, -1.96242, 0.4705882, 1, 0, 1,
-0.6864288, 0.7531515, -0.8890557, 0.4627451, 1, 0, 1,
-0.6848005, 0.26203, -0.5541599, 0.4588235, 1, 0, 1,
-0.67578, 1.161629, -1.177435, 0.4509804, 1, 0, 1,
-0.6734674, 0.6662722, -0.6599038, 0.4470588, 1, 0, 1,
-0.6669593, -0.5379868, -1.338485, 0.4392157, 1, 0, 1,
-0.6537892, -1.98524, -5.445993, 0.4352941, 1, 0, 1,
-0.6537437, -0.3585163, -0.7315197, 0.427451, 1, 0, 1,
-0.6503531, 1.1708, 0.04186847, 0.4235294, 1, 0, 1,
-0.6496199, 0.4618944, -0.261455, 0.4156863, 1, 0, 1,
-0.6456704, -0.7310197, -2.569546, 0.4117647, 1, 0, 1,
-0.6409065, 0.6263289, -0.1175227, 0.4039216, 1, 0, 1,
-0.638315, -0.3536547, -1.655017, 0.3960784, 1, 0, 1,
-0.6331152, 0.7079123, -1.727535, 0.3921569, 1, 0, 1,
-0.6283309, 0.734843, -0.8049771, 0.3843137, 1, 0, 1,
-0.6252629, 0.5401359, -0.9423954, 0.3803922, 1, 0, 1,
-0.6126818, 0.8794714, -0.7653784, 0.372549, 1, 0, 1,
-0.6124787, 1.364891, 0.1971412, 0.3686275, 1, 0, 1,
-0.6103572, -0.8760717, -3.043502, 0.3607843, 1, 0, 1,
-0.6063451, 0.7261764, -0.01693469, 0.3568628, 1, 0, 1,
-0.6038114, 0.3998388, -0.3702222, 0.3490196, 1, 0, 1,
-0.6036954, 1.239356, -0.8653271, 0.345098, 1, 0, 1,
-0.6005329, -1.163982, -2.187139, 0.3372549, 1, 0, 1,
-0.5973424, 0.2868998, -1.121128, 0.3333333, 1, 0, 1,
-0.5966063, 0.2786463, -0.8600585, 0.3254902, 1, 0, 1,
-0.5924066, 1.293195, -0.8834461, 0.3215686, 1, 0, 1,
-0.5910989, -1.894031, -3.885668, 0.3137255, 1, 0, 1,
-0.5899024, -0.347584, -1.512137, 0.3098039, 1, 0, 1,
-0.5886717, -0.0756439, -2.395307, 0.3019608, 1, 0, 1,
-0.5849923, -1.465161, -2.946943, 0.2941177, 1, 0, 1,
-0.5843149, 0.0767896, -2.68244, 0.2901961, 1, 0, 1,
-0.5817268, 0.2144155, -0.6955541, 0.282353, 1, 0, 1,
-0.5715168, 0.2994078, -1.687388, 0.2784314, 1, 0, 1,
-0.5675623, 1.308082, -0.4818428, 0.2705882, 1, 0, 1,
-0.5632209, -0.1248225, -3.163552, 0.2666667, 1, 0, 1,
-0.5614841, 0.2893926, -0.332154, 0.2588235, 1, 0, 1,
-0.5553821, -0.4081979, -3.875958, 0.254902, 1, 0, 1,
-0.55217, -0.3060238, -0.4924924, 0.2470588, 1, 0, 1,
-0.5498917, 0.09014531, -2.408572, 0.2431373, 1, 0, 1,
-0.5428833, 0.9728247, -2.224752, 0.2352941, 1, 0, 1,
-0.5425371, 1.291931, 0.2418325, 0.2313726, 1, 0, 1,
-0.5382552, 0.5773054, -0.6979022, 0.2235294, 1, 0, 1,
-0.5381628, -2.101312, -3.050136, 0.2196078, 1, 0, 1,
-0.5302414, -0.9592156, -1.511767, 0.2117647, 1, 0, 1,
-0.5221754, 0.5108351, 0.3126199, 0.2078431, 1, 0, 1,
-0.5197108, -0.06327612, -2.191525, 0.2, 1, 0, 1,
-0.5195996, 0.8511661, 1.500617, 0.1921569, 1, 0, 1,
-0.5177518, -1.926774, -1.966079, 0.1882353, 1, 0, 1,
-0.5139362, 0.3392559, -1.557421, 0.1803922, 1, 0, 1,
-0.5073928, 2.346289, -0.7550079, 0.1764706, 1, 0, 1,
-0.5039643, 1.442063, 2.420928, 0.1686275, 1, 0, 1,
-0.5032543, 0.48824, 0.4076538, 0.1647059, 1, 0, 1,
-0.5020149, 0.3612505, -0.4665645, 0.1568628, 1, 0, 1,
-0.5001042, -0.3141516, -3.074575, 0.1529412, 1, 0, 1,
-0.4957744, 0.6864626, -1.259061, 0.145098, 1, 0, 1,
-0.4944842, -1.04893, -1.993367, 0.1411765, 1, 0, 1,
-0.4900525, -0.3155277, -2.507755, 0.1333333, 1, 0, 1,
-0.487607, -0.8423554, -2.570143, 0.1294118, 1, 0, 1,
-0.4839754, -2.919937, -2.482701, 0.1215686, 1, 0, 1,
-0.4797731, 0.9057974, -1.497112, 0.1176471, 1, 0, 1,
-0.4571212, 2.441859, 0.3016203, 0.1098039, 1, 0, 1,
-0.4555295, 0.01546704, -0.719874, 0.1058824, 1, 0, 1,
-0.455487, -1.474341, -2.959821, 0.09803922, 1, 0, 1,
-0.4549951, -0.7587891, -3.015964, 0.09019608, 1, 0, 1,
-0.4500763, -0.09444868, -1.83213, 0.08627451, 1, 0, 1,
-0.4459865, 0.6078128, 0.539448, 0.07843138, 1, 0, 1,
-0.4456062, -0.2649641, -0.5843213, 0.07450981, 1, 0, 1,
-0.4410996, 0.8809094, -0.6780972, 0.06666667, 1, 0, 1,
-0.4370832, -1.118222, -1.877117, 0.0627451, 1, 0, 1,
-0.4349316, -1.088392, -1.61424, 0.05490196, 1, 0, 1,
-0.4322222, 0.7247176, 0.2785079, 0.05098039, 1, 0, 1,
-0.4280296, -0.2357145, -2.688244, 0.04313726, 1, 0, 1,
-0.4278012, -0.4138066, -1.196026, 0.03921569, 1, 0, 1,
-0.4272046, 0.08569676, -1.087743, 0.03137255, 1, 0, 1,
-0.4228595, 0.5847545, -1.570872, 0.02745098, 1, 0, 1,
-0.4192587, -0.1725462, 0.2528671, 0.01960784, 1, 0, 1,
-0.4171831, 0.9015457, 0.4641497, 0.01568628, 1, 0, 1,
-0.4150151, -0.7640795, -2.205797, 0.007843138, 1, 0, 1,
-0.4140575, 0.7469007, -1.079329, 0.003921569, 1, 0, 1,
-0.4065563, -0.6893709, -1.675107, 0, 1, 0.003921569, 1,
-0.4039458, 0.4555016, -2.431504, 0, 1, 0.01176471, 1,
-0.4020258, -0.7746285, -2.811012, 0, 1, 0.01568628, 1,
-0.4017659, -0.05122103, -1.416942, 0, 1, 0.02352941, 1,
-0.3969733, 1.534914, -0.7513963, 0, 1, 0.02745098, 1,
-0.3928156, -1.343445, -1.703449, 0, 1, 0.03529412, 1,
-0.3885378, -0.8694507, -3.288928, 0, 1, 0.03921569, 1,
-0.3858078, -0.8360574, -1.773537, 0, 1, 0.04705882, 1,
-0.3854455, -1.18111, -4.105927, 0, 1, 0.05098039, 1,
-0.3828373, 2.222098, 1.738753, 0, 1, 0.05882353, 1,
-0.3816164, 0.3253945, -1.878954, 0, 1, 0.0627451, 1,
-0.376797, -0.3061236, -1.742613, 0, 1, 0.07058824, 1,
-0.37514, -0.7692304, -2.651832, 0, 1, 0.07450981, 1,
-0.3681052, -0.1477791, -1.179108, 0, 1, 0.08235294, 1,
-0.3675596, 0.7711288, -0.8817631, 0, 1, 0.08627451, 1,
-0.3674221, 0.5604582, -1.066431, 0, 1, 0.09411765, 1,
-0.3651803, 0.1273748, -0.7566845, 0, 1, 0.1019608, 1,
-0.3605188, 0.2389506, -0.3887331, 0, 1, 0.1058824, 1,
-0.3596557, -2.392348, -2.97216, 0, 1, 0.1137255, 1,
-0.3576508, -1.163873, -1.357173, 0, 1, 0.1176471, 1,
-0.3558308, -1.264947, -0.1023679, 0, 1, 0.1254902, 1,
-0.3557761, 1.232474, -1.069534, 0, 1, 0.1294118, 1,
-0.3556587, -0.7016289, -2.842207, 0, 1, 0.1372549, 1,
-0.3521416, 0.0903342, -0.1565709, 0, 1, 0.1411765, 1,
-0.3505507, 1.791382, -0.0849106, 0, 1, 0.1490196, 1,
-0.3451819, 1.336872, -2.076667, 0, 1, 0.1529412, 1,
-0.3446195, 0.439808, -1.757388, 0, 1, 0.1607843, 1,
-0.342482, 0.1581589, -1.629094, 0, 1, 0.1647059, 1,
-0.3415194, 0.4683501, 1.311717, 0, 1, 0.172549, 1,
-0.3400227, -0.7228419, -2.074387, 0, 1, 0.1764706, 1,
-0.3329745, 1.052434, -1.790547, 0, 1, 0.1843137, 1,
-0.3327139, -0.7108199, -3.239747, 0, 1, 0.1882353, 1,
-0.3319928, -0.1543994, -1.424445, 0, 1, 0.1960784, 1,
-0.3295445, -0.6418539, -0.9924528, 0, 1, 0.2039216, 1,
-0.3293284, 0.5328851, 1.785943, 0, 1, 0.2078431, 1,
-0.3270149, 1.317516, -1.525501, 0, 1, 0.2156863, 1,
-0.3254915, 0.8751857, 0.7840153, 0, 1, 0.2196078, 1,
-0.3233083, -0.1933974, -1.593231, 0, 1, 0.227451, 1,
-0.3182522, 1.478996, -1.523463, 0, 1, 0.2313726, 1,
-0.3178793, 1.337049, -1.338557, 0, 1, 0.2392157, 1,
-0.3129648, -0.7449242, -1.868579, 0, 1, 0.2431373, 1,
-0.3116941, -0.4533557, -1.620297, 0, 1, 0.2509804, 1,
-0.3110987, -2.094699, -1.474689, 0, 1, 0.254902, 1,
-0.3109479, 0.3545851, 1.394404, 0, 1, 0.2627451, 1,
-0.3088117, 0.2721756, -0.55896, 0, 1, 0.2666667, 1,
-0.3080476, -0.8756649, -2.480431, 0, 1, 0.2745098, 1,
-0.3060828, -1.812276, -4.009891, 0, 1, 0.2784314, 1,
-0.3036824, -1.28652, -1.321994, 0, 1, 0.2862745, 1,
-0.302476, 0.490049, -0.7720864, 0, 1, 0.2901961, 1,
-0.2993011, 0.7341462, 0.7427486, 0, 1, 0.2980392, 1,
-0.2982563, 1.172785, -1.632435, 0, 1, 0.3058824, 1,
-0.2981484, 1.033747, 0.1052781, 0, 1, 0.3098039, 1,
-0.293329, -1.649589, -3.023294, 0, 1, 0.3176471, 1,
-0.2923099, -2.115875, -1.572008, 0, 1, 0.3215686, 1,
-0.2922688, -1.979606, -3.241342, 0, 1, 0.3294118, 1,
-0.291736, -1.240746, -3.742934, 0, 1, 0.3333333, 1,
-0.2908759, -0.5263394, -2.393231, 0, 1, 0.3411765, 1,
-0.2889657, 0.3642448, -0.9817747, 0, 1, 0.345098, 1,
-0.284969, -0.5699297, -0.9979127, 0, 1, 0.3529412, 1,
-0.2830564, 0.2146539, -0.7931195, 0, 1, 0.3568628, 1,
-0.2801828, 0.4337259, -0.2611337, 0, 1, 0.3647059, 1,
-0.277005, 0.5385901, -1.002143, 0, 1, 0.3686275, 1,
-0.2760697, 2.290759, 1.367977, 0, 1, 0.3764706, 1,
-0.2738478, -0.5967023, -1.965807, 0, 1, 0.3803922, 1,
-0.2720983, 0.9053153, -1.078079, 0, 1, 0.3882353, 1,
-0.2711417, -0.4024549, -2.530177, 0, 1, 0.3921569, 1,
-0.2566888, 3.52875, 0.06356674, 0, 1, 0.4, 1,
-0.2545716, 0.2593111, 1.125955, 0, 1, 0.4078431, 1,
-0.2525056, 0.0157095, -1.5911, 0, 1, 0.4117647, 1,
-0.2515585, 0.1560354, -1.065503, 0, 1, 0.4196078, 1,
-0.2505544, -0.6120017, -3.479904, 0, 1, 0.4235294, 1,
-0.2479017, 1.326372, 1.187015, 0, 1, 0.4313726, 1,
-0.2465313, -0.4727107, -2.842847, 0, 1, 0.4352941, 1,
-0.2464186, -0.5008487, -4.520132, 0, 1, 0.4431373, 1,
-0.2462717, -0.4017543, -3.746402, 0, 1, 0.4470588, 1,
-0.2456616, 0.720666, 0.5261758, 0, 1, 0.454902, 1,
-0.2423427, -1.347929, -3.426857, 0, 1, 0.4588235, 1,
-0.2401473, -0.8084239, -2.93836, 0, 1, 0.4666667, 1,
-0.2372049, -0.06793377, -1.888896, 0, 1, 0.4705882, 1,
-0.2355793, 1.331794, -0.2662702, 0, 1, 0.4784314, 1,
-0.234772, 0.9398528, -1.688314, 0, 1, 0.4823529, 1,
-0.2337103, -0.633541, -2.955906, 0, 1, 0.4901961, 1,
-0.2311821, 0.7997836, 0.7617186, 0, 1, 0.4941176, 1,
-0.2239656, -0.5578328, -2.500999, 0, 1, 0.5019608, 1,
-0.2239035, -1.249566, -3.40782, 0, 1, 0.509804, 1,
-0.2236424, -0.4313107, -1.272353, 0, 1, 0.5137255, 1,
-0.2232036, 0.1702131, -1.173736, 0, 1, 0.5215687, 1,
-0.2138522, -1.484179, -2.175368, 0, 1, 0.5254902, 1,
-0.2124726, -0.4709187, -1.568875, 0, 1, 0.5333334, 1,
-0.209654, -1.209705, -2.906539, 0, 1, 0.5372549, 1,
-0.2091658, 1.625039, 0.5163927, 0, 1, 0.5450981, 1,
-0.205895, -0.7868464, -3.992308, 0, 1, 0.5490196, 1,
-0.2007477, -0.3796159, -2.065777, 0, 1, 0.5568628, 1,
-0.2001797, 0.6011272, -0.4401773, 0, 1, 0.5607843, 1,
-0.1968108, -1.069593, -4.355743, 0, 1, 0.5686275, 1,
-0.1903664, -1.611639, -1.069656, 0, 1, 0.572549, 1,
-0.1899264, -0.09220673, -0.822524, 0, 1, 0.5803922, 1,
-0.188968, -0.5971155, -3.534732, 0, 1, 0.5843138, 1,
-0.1873911, -0.7895467, -3.482199, 0, 1, 0.5921569, 1,
-0.1839112, -0.3338688, -2.00282, 0, 1, 0.5960785, 1,
-0.1764156, 0.01226308, 1.034325, 0, 1, 0.6039216, 1,
-0.1755593, 0.1509062, -3.072008, 0, 1, 0.6117647, 1,
-0.1725793, -2.972109, -2.685677, 0, 1, 0.6156863, 1,
-0.17219, 0.2520483, 0.6844749, 0, 1, 0.6235294, 1,
-0.1712521, -2.505214, -3.314288, 0, 1, 0.627451, 1,
-0.1697655, 0.2335542, -2.40526, 0, 1, 0.6352941, 1,
-0.1696709, -1.680441, -2.523888, 0, 1, 0.6392157, 1,
-0.1694864, -0.6636992, -2.453933, 0, 1, 0.6470588, 1,
-0.1584576, 0.3471417, 0.9513773, 0, 1, 0.6509804, 1,
-0.1573059, -1.819851, -2.564711, 0, 1, 0.6588235, 1,
-0.1544921, -0.9781685, -4.28758, 0, 1, 0.6627451, 1,
-0.1509328, 0.857177, 0.7229983, 0, 1, 0.6705883, 1,
-0.1491546, 0.5637448, 0.04379634, 0, 1, 0.6745098, 1,
-0.1479374, -2.314013, -2.598542, 0, 1, 0.682353, 1,
-0.1460104, 0.3131244, 1.266154, 0, 1, 0.6862745, 1,
-0.1443073, -1.610613, -3.570657, 0, 1, 0.6941177, 1,
-0.1423308, 0.863122, 0.5966083, 0, 1, 0.7019608, 1,
-0.1400227, -0.6984449, -3.152433, 0, 1, 0.7058824, 1,
-0.1389115, -1.480092, -3.004476, 0, 1, 0.7137255, 1,
-0.1352948, 2.081581, -1.370108, 0, 1, 0.7176471, 1,
-0.1266444, -1.33038, -3.704607, 0, 1, 0.7254902, 1,
-0.1255066, -0.9977105, -3.506889, 0, 1, 0.7294118, 1,
-0.1249136, -0.820824, -3.658493, 0, 1, 0.7372549, 1,
-0.1223517, -0.09896564, -1.50718, 0, 1, 0.7411765, 1,
-0.1221333, 0.5074012, -0.4883481, 0, 1, 0.7490196, 1,
-0.1212043, 0.8208963, -1.422279, 0, 1, 0.7529412, 1,
-0.1174766, 1.774044, -1.235688, 0, 1, 0.7607843, 1,
-0.1138061, -1.163046, -1.673878, 0, 1, 0.7647059, 1,
-0.111319, 0.9842958, -2.264808, 0, 1, 0.772549, 1,
-0.1077214, 1.244972, -1.92797, 0, 1, 0.7764706, 1,
-0.1023788, 0.5110081, 1.573355, 0, 1, 0.7843137, 1,
-0.1013842, 2.152436, -0.1117958, 0, 1, 0.7882353, 1,
-0.09854805, 1.477425, -0.5248824, 0, 1, 0.7960784, 1,
-0.09278005, 1.311248, 1.359216, 0, 1, 0.8039216, 1,
-0.09121577, -1.758743, -3.273525, 0, 1, 0.8078431, 1,
-0.09079401, 0.3224087, -0.4756424, 0, 1, 0.8156863, 1,
-0.08794071, 0.07205692, -0.3326702, 0, 1, 0.8196079, 1,
-0.08386326, 0.2436584, 0.4902289, 0, 1, 0.827451, 1,
-0.08275753, -2.318071, -3.650384, 0, 1, 0.8313726, 1,
-0.08232737, 0.6978619, -0.4923915, 0, 1, 0.8392157, 1,
-0.08225065, 0.9993362, -2.217047, 0, 1, 0.8431373, 1,
-0.07231393, -0.5394933, -3.335753, 0, 1, 0.8509804, 1,
-0.06871851, -0.544314, -2.232811, 0, 1, 0.854902, 1,
-0.06449983, 1.065467, 0.4304471, 0, 1, 0.8627451, 1,
-0.05962852, 2.087785, -1.717112, 0, 1, 0.8666667, 1,
-0.0578893, 0.2836365, 0.7397121, 0, 1, 0.8745098, 1,
-0.05260893, 1.448776, 1.009797, 0, 1, 0.8784314, 1,
-0.05183241, 0.1556667, 0.4397088, 0, 1, 0.8862745, 1,
-0.04420051, -0.3900655, -2.550645, 0, 1, 0.8901961, 1,
-0.04170612, -0.5074399, -1.138848, 0, 1, 0.8980392, 1,
-0.03596495, -1.312915, -3.268772, 0, 1, 0.9058824, 1,
-0.03158484, 0.1692379, 1.580107, 0, 1, 0.9098039, 1,
-0.03156165, 1.308002, 0.2194777, 0, 1, 0.9176471, 1,
-0.03110617, 1.602847, 1.534185, 0, 1, 0.9215686, 1,
-0.02681972, -0.6489439, -2.924688, 0, 1, 0.9294118, 1,
-0.02547914, 2.195992, -1.489183, 0, 1, 0.9333333, 1,
-0.02461302, -0.7943868, -3.387339, 0, 1, 0.9411765, 1,
-0.02011267, 0.5230476, -1.422929, 0, 1, 0.945098, 1,
-0.01735625, 1.149912, 0.7331449, 0, 1, 0.9529412, 1,
-0.0151715, -1.372759, -1.900533, 0, 1, 0.9568627, 1,
-0.009599554, 0.357131, -0.3036888, 0, 1, 0.9647059, 1,
-0.008038118, 0.3478589, -2.056202, 0, 1, 0.9686275, 1,
-0.007291739, -1.308764, -2.950098, 0, 1, 0.9764706, 1,
-0.005200583, 0.7238896, -0.9286093, 0, 1, 0.9803922, 1,
-0.004696061, 1.379644, 0.06416409, 0, 1, 0.9882353, 1,
-0.003068652, 0.2660994, 1.251594, 0, 1, 0.9921569, 1,
-0.001271517, -1.316535, -3.77687, 0, 1, 1, 1,
0.01337374, -0.1455038, 3.467052, 0, 0.9921569, 1, 1,
0.01712634, 0.9664611, 0.03445926, 0, 0.9882353, 1, 1,
0.0228305, -1.169772, 2.903223, 0, 0.9803922, 1, 1,
0.0266604, -2.403517, 2.800415, 0, 0.9764706, 1, 1,
0.02726463, -2.443886, 2.772527, 0, 0.9686275, 1, 1,
0.03210702, 1.459692, -0.731914, 0, 0.9647059, 1, 1,
0.03722135, 0.5928909, 0.4045738, 0, 0.9568627, 1, 1,
0.04552882, 1.25338, 0.1270247, 0, 0.9529412, 1, 1,
0.04619972, 0.9189453, 0.7442164, 0, 0.945098, 1, 1,
0.04871168, -0.6466894, 2.720609, 0, 0.9411765, 1, 1,
0.05002795, -0.421728, 4.351981, 0, 0.9333333, 1, 1,
0.0506526, -0.4873998, 3.757674, 0, 0.9294118, 1, 1,
0.05171449, -0.8809084, 2.292544, 0, 0.9215686, 1, 1,
0.05555383, 0.4368891, 1.040199, 0, 0.9176471, 1, 1,
0.06608494, 0.8039795, -0.6989194, 0, 0.9098039, 1, 1,
0.07097203, -0.3311878, 1.741989, 0, 0.9058824, 1, 1,
0.07228613, -2.439343, 3.282524, 0, 0.8980392, 1, 1,
0.0743725, -0.3158017, 1.058203, 0, 0.8901961, 1, 1,
0.07589721, -0.03767987, 0.5651914, 0, 0.8862745, 1, 1,
0.07686345, -0.6313401, 4.251687, 0, 0.8784314, 1, 1,
0.07786257, -0.1969421, 2.608356, 0, 0.8745098, 1, 1,
0.08057187, -0.9069964, 1.626245, 0, 0.8666667, 1, 1,
0.08181144, -1.247737, 2.204355, 0, 0.8627451, 1, 1,
0.08464196, -0.3611175, 4.523258, 0, 0.854902, 1, 1,
0.08725319, 1.739799, -0.168259, 0, 0.8509804, 1, 1,
0.0915909, -0.5236627, 1.846901, 0, 0.8431373, 1, 1,
0.09167434, -0.8778989, 3.524087, 0, 0.8392157, 1, 1,
0.09386767, 0.5038909, 0.2405255, 0, 0.8313726, 1, 1,
0.09407113, 0.2519713, 0.3090005, 0, 0.827451, 1, 1,
0.09576426, -0.6396088, 3.594815, 0, 0.8196079, 1, 1,
0.09754678, 0.1133762, -0.7737427, 0, 0.8156863, 1, 1,
0.1006507, 0.0601914, 0.5732806, 0, 0.8078431, 1, 1,
0.1011486, -0.245221, 1.74881, 0, 0.8039216, 1, 1,
0.1018544, 2.227707, 0.3597701, 0, 0.7960784, 1, 1,
0.1040239, -1.268536, 5.653044, 0, 0.7882353, 1, 1,
0.1094839, -0.1502246, 3.498734, 0, 0.7843137, 1, 1,
0.1104614, -0.04749418, 2.848732, 0, 0.7764706, 1, 1,
0.1139694, 0.05178832, 2.005508, 0, 0.772549, 1, 1,
0.1150725, -0.9099284, 4.835806, 0, 0.7647059, 1, 1,
0.1240791, -0.9522499, 3.161661, 0, 0.7607843, 1, 1,
0.1248776, -1.688387, 3.329687, 0, 0.7529412, 1, 1,
0.1270222, -0.1017358, 2.052379, 0, 0.7490196, 1, 1,
0.1277401, 0.3248057, 2.213911, 0, 0.7411765, 1, 1,
0.1305218, -0.309093, 2.4, 0, 0.7372549, 1, 1,
0.1322307, -0.6389248, 3.051854, 0, 0.7294118, 1, 1,
0.135952, -1.721663, 4.490485, 0, 0.7254902, 1, 1,
0.1381726, 1.343464, 0.8781829, 0, 0.7176471, 1, 1,
0.1397027, -0.1344992, 1.868442, 0, 0.7137255, 1, 1,
0.1418925, 1.322916, 0.5605819, 0, 0.7058824, 1, 1,
0.1440656, 0.04150392, -0.0362942, 0, 0.6980392, 1, 1,
0.1469478, 0.8077657, -0.441445, 0, 0.6941177, 1, 1,
0.1470533, 1.742117, -1.609999, 0, 0.6862745, 1, 1,
0.1492197, -0.01160577, 1.638961, 0, 0.682353, 1, 1,
0.1524051, 0.5387796, -1.576706, 0, 0.6745098, 1, 1,
0.1538343, -2.573423, 4.783408, 0, 0.6705883, 1, 1,
0.1573095, 2.326542, -1.40137, 0, 0.6627451, 1, 1,
0.1613586, 0.4939694, -0.09081197, 0, 0.6588235, 1, 1,
0.1616304, -1.144156, 4.369753, 0, 0.6509804, 1, 1,
0.1623972, 1.134939, 0.7765129, 0, 0.6470588, 1, 1,
0.1651119, -0.5074058, 2.202245, 0, 0.6392157, 1, 1,
0.1672835, 2.357603, -0.1999867, 0, 0.6352941, 1, 1,
0.1673688, -0.03227486, 2.86562, 0, 0.627451, 1, 1,
0.1675044, -2.312062, 3.450642, 0, 0.6235294, 1, 1,
0.1729644, 0.5352204, 0.1961528, 0, 0.6156863, 1, 1,
0.1731947, 2.299419, 0.51092, 0, 0.6117647, 1, 1,
0.1749783, 0.2768588, 0.8871101, 0, 0.6039216, 1, 1,
0.1781611, 0.7092748, 0.9806896, 0, 0.5960785, 1, 1,
0.1849991, -0.7074059, 2.099629, 0, 0.5921569, 1, 1,
0.1977251, -0.5645141, 3.490051, 0, 0.5843138, 1, 1,
0.2030686, -0.3325653, 3.574146, 0, 0.5803922, 1, 1,
0.2033669, -1.004388, 2.359879, 0, 0.572549, 1, 1,
0.204752, 1.154198, -0.5861948, 0, 0.5686275, 1, 1,
0.2091389, -1.112083, 2.20139, 0, 0.5607843, 1, 1,
0.214529, -0.5051966, 2.180763, 0, 0.5568628, 1, 1,
0.2205393, 0.6755159, -0.2294666, 0, 0.5490196, 1, 1,
0.2219572, 0.4975177, 0.08803934, 0, 0.5450981, 1, 1,
0.2224379, 1.301326, -0.2207393, 0, 0.5372549, 1, 1,
0.2264327, 1.191401, -0.6547772, 0, 0.5333334, 1, 1,
0.2306808, -0.1029973, 2.619283, 0, 0.5254902, 1, 1,
0.2343239, -1.127377, 3.521917, 0, 0.5215687, 1, 1,
0.2363765, 0.9444817, -0.1705506, 0, 0.5137255, 1, 1,
0.236746, -0.5709332, 1.5369, 0, 0.509804, 1, 1,
0.2383265, -1.451539, 3.468884, 0, 0.5019608, 1, 1,
0.2423721, 1.125295, 0.7534958, 0, 0.4941176, 1, 1,
0.2516752, -1.11493, 2.055463, 0, 0.4901961, 1, 1,
0.2531937, -0.5362065, 2.04301, 0, 0.4823529, 1, 1,
0.2594238, -1.175772, 4.769007, 0, 0.4784314, 1, 1,
0.2640875, 0.2808435, 0.6366499, 0, 0.4705882, 1, 1,
0.2679011, 0.6461294, 2.854795, 0, 0.4666667, 1, 1,
0.2693923, 0.5185187, -0.4673854, 0, 0.4588235, 1, 1,
0.2716618, -1.018662, 1.637015, 0, 0.454902, 1, 1,
0.2719402, 0.5148869, 0.6133473, 0, 0.4470588, 1, 1,
0.2764018, 1.456358, -0.0473594, 0, 0.4431373, 1, 1,
0.2766438, -0.1741063, 0.8974199, 0, 0.4352941, 1, 1,
0.2773172, 0.1220481, 2.112185, 0, 0.4313726, 1, 1,
0.2784682, 1.974283, 0.2929688, 0, 0.4235294, 1, 1,
0.279149, 0.2032999, 1.545519, 0, 0.4196078, 1, 1,
0.2819615, -0.3322718, 0.7834426, 0, 0.4117647, 1, 1,
0.2820305, -0.1068501, 3.534218, 0, 0.4078431, 1, 1,
0.2828534, 1.306003, 0.7007802, 0, 0.4, 1, 1,
0.2860752, -0.5833811, 1.783067, 0, 0.3921569, 1, 1,
0.2872568, 0.1097773, 0.7922629, 0, 0.3882353, 1, 1,
0.2882104, 0.754633, 1.300597, 0, 0.3803922, 1, 1,
0.2889131, 0.006293922, 0.3990378, 0, 0.3764706, 1, 1,
0.2902777, 0.6909922, 1.062649, 0, 0.3686275, 1, 1,
0.2927198, 0.09808318, 0.1767298, 0, 0.3647059, 1, 1,
0.2946758, 0.4029878, 2.343646, 0, 0.3568628, 1, 1,
0.2959227, -1.977214, 3.081076, 0, 0.3529412, 1, 1,
0.2960097, -0.7874948, 3.649632, 0, 0.345098, 1, 1,
0.3015569, -1.419306, 2.891394, 0, 0.3411765, 1, 1,
0.3018278, 1.706838, -1.245698, 0, 0.3333333, 1, 1,
0.3027968, -0.1166485, 2.907697, 0, 0.3294118, 1, 1,
0.3047062, -0.5465083, 1.631338, 0, 0.3215686, 1, 1,
0.3059676, -0.6959407, 3.032079, 0, 0.3176471, 1, 1,
0.3069533, -1.336212, 2.434608, 0, 0.3098039, 1, 1,
0.3093088, 0.2698386, 2.700373, 0, 0.3058824, 1, 1,
0.3103082, 0.4437359, -0.2150499, 0, 0.2980392, 1, 1,
0.3145907, -1.952352, 3.16625, 0, 0.2901961, 1, 1,
0.3153425, -1.028142, 1.669809, 0, 0.2862745, 1, 1,
0.3165151, 1.908942, -1.073314, 0, 0.2784314, 1, 1,
0.3302932, -0.9947277, 1.873598, 0, 0.2745098, 1, 1,
0.3426373, 1.055215, -0.7514703, 0, 0.2666667, 1, 1,
0.3435341, 1.84567, 1.10567, 0, 0.2627451, 1, 1,
0.351256, -0.8447432, 2.830156, 0, 0.254902, 1, 1,
0.3541124, 1.328252, 0.5743994, 0, 0.2509804, 1, 1,
0.3542189, -1.415505, 0.9406618, 0, 0.2431373, 1, 1,
0.3549458, -0.585111, 4.185489, 0, 0.2392157, 1, 1,
0.3578286, 0.3692943, 2.123312, 0, 0.2313726, 1, 1,
0.3578534, -0.8372583, 1.760108, 0, 0.227451, 1, 1,
0.3589498, 0.1679015, 0.9546511, 0, 0.2196078, 1, 1,
0.3657013, -0.9565448, 0.5878435, 0, 0.2156863, 1, 1,
0.3682922, 1.220828, 0.1488729, 0, 0.2078431, 1, 1,
0.3696811, 0.5254902, -0.446633, 0, 0.2039216, 1, 1,
0.3699757, 0.0483562, 2.552824, 0, 0.1960784, 1, 1,
0.3711331, -1.32118, 3.363349, 0, 0.1882353, 1, 1,
0.3730614, -2.324651, 2.179135, 0, 0.1843137, 1, 1,
0.3754837, 0.668995, 1.166109, 0, 0.1764706, 1, 1,
0.3763205, 0.4111439, 1.22676, 0, 0.172549, 1, 1,
0.3780037, 0.9456231, -0.5506212, 0, 0.1647059, 1, 1,
0.3791904, 1.100477, 0.9634451, 0, 0.1607843, 1, 1,
0.379429, 0.5305781, 0.01219573, 0, 0.1529412, 1, 1,
0.3821905, 0.1147005, 2.818315, 0, 0.1490196, 1, 1,
0.3852034, -0.1658963, 1.619457, 0, 0.1411765, 1, 1,
0.3898531, 2.019785, 1.184008, 0, 0.1372549, 1, 1,
0.3925827, -1.173343, 2.788467, 0, 0.1294118, 1, 1,
0.3927254, 1.195571, -0.7927156, 0, 0.1254902, 1, 1,
0.3930791, -0.1953791, 2.741742, 0, 0.1176471, 1, 1,
0.3933168, -0.5667545, 3.770871, 0, 0.1137255, 1, 1,
0.3955215, -0.1749518, 3.455943, 0, 0.1058824, 1, 1,
0.3975407, 0.9004192, 1.699375, 0, 0.09803922, 1, 1,
0.4010292, -1.075118, 2.881924, 0, 0.09411765, 1, 1,
0.4028935, 0.4928223, 1.092069, 0, 0.08627451, 1, 1,
0.4037313, 1.689221, 0.215204, 0, 0.08235294, 1, 1,
0.4042734, 0.814693, 0.8036427, 0, 0.07450981, 1, 1,
0.4065321, -1.424501, 3.751884, 0, 0.07058824, 1, 1,
0.4132369, 1.847579, 0.700857, 0, 0.0627451, 1, 1,
0.4135322, 0.2586088, 2.223783, 0, 0.05882353, 1, 1,
0.4150895, -1.241594, 3.420208, 0, 0.05098039, 1, 1,
0.4151041, 0.07624836, 0.4984323, 0, 0.04705882, 1, 1,
0.4249033, -0.0671982, 1.733485, 0, 0.03921569, 1, 1,
0.4281505, -0.7102685, 3.480452, 0, 0.03529412, 1, 1,
0.4284381, -0.5404091, 1.230596, 0, 0.02745098, 1, 1,
0.4288721, 0.3265501, 0.5866873, 0, 0.02352941, 1, 1,
0.4323262, -0.6415455, 2.680283, 0, 0.01568628, 1, 1,
0.4330084, -0.3205133, 3.500278, 0, 0.01176471, 1, 1,
0.4362566, -0.1252119, 1.742874, 0, 0.003921569, 1, 1,
0.4416006, 0.8505538, -1.736481, 0.003921569, 0, 1, 1,
0.4434167, 0.9023358, 1.505846, 0.007843138, 0, 1, 1,
0.4445522, -0.08301909, 2.047873, 0.01568628, 0, 1, 1,
0.4451246, -0.04218533, 1.492123, 0.01960784, 0, 1, 1,
0.4457974, -2.547493, 2.295465, 0.02745098, 0, 1, 1,
0.4520274, 0.5535908, 0.7806691, 0.03137255, 0, 1, 1,
0.4553887, -2.301127, 3.639832, 0.03921569, 0, 1, 1,
0.4557151, -0.6159505, 1.94296, 0.04313726, 0, 1, 1,
0.4558824, -0.753485, 1.354909, 0.05098039, 0, 1, 1,
0.4582268, 1.494715, 2.071866, 0.05490196, 0, 1, 1,
0.4585257, -0.2239151, 1.339996, 0.0627451, 0, 1, 1,
0.4591376, -0.355239, 3.004688, 0.06666667, 0, 1, 1,
0.4622676, -0.2736545, 2.923751, 0.07450981, 0, 1, 1,
0.4728171, -0.5353883, 3.441592, 0.07843138, 0, 1, 1,
0.4761742, -2.372009, 2.112014, 0.08627451, 0, 1, 1,
0.4799297, -0.8763842, 2.555064, 0.09019608, 0, 1, 1,
0.4858682, -0.8521437, 3.837704, 0.09803922, 0, 1, 1,
0.4877246, 0.8031064, -1.016984, 0.1058824, 0, 1, 1,
0.4893951, 0.9040024, 1.106409, 0.1098039, 0, 1, 1,
0.493221, 0.5084627, -0.1393379, 0.1176471, 0, 1, 1,
0.4946507, -0.01486835, 2.668254, 0.1215686, 0, 1, 1,
0.4947349, 1.068475, -0.719081, 0.1294118, 0, 1, 1,
0.4989659, 0.2300263, 2.340908, 0.1333333, 0, 1, 1,
0.5024178, 0.05188981, 2.237961, 0.1411765, 0, 1, 1,
0.5055559, 0.2470227, 2.044464, 0.145098, 0, 1, 1,
0.511652, -2.525583, 3.102358, 0.1529412, 0, 1, 1,
0.5180976, -1.000817, 1.72715, 0.1568628, 0, 1, 1,
0.5216444, -0.04708637, 1.7132, 0.1647059, 0, 1, 1,
0.5217223, -1.14181, 2.831822, 0.1686275, 0, 1, 1,
0.5246127, 2.546191, 0.3779491, 0.1764706, 0, 1, 1,
0.5266368, -0.7592938, 0.949909, 0.1803922, 0, 1, 1,
0.5272663, -0.7022563, 2.561307, 0.1882353, 0, 1, 1,
0.5295819, -0.07639258, 0.2478048, 0.1921569, 0, 1, 1,
0.5436168, 0.4092782, 2.066113, 0.2, 0, 1, 1,
0.5442936, -0.7578176, 1.736578, 0.2078431, 0, 1, 1,
0.5506938, -0.1218639, 2.686504, 0.2117647, 0, 1, 1,
0.5508928, 1.841971, -1.232649, 0.2196078, 0, 1, 1,
0.5535489, 1.292293, 0.4185293, 0.2235294, 0, 1, 1,
0.5547826, 0.5295309, 2.5852, 0.2313726, 0, 1, 1,
0.5549364, 0.907237, -0.1936069, 0.2352941, 0, 1, 1,
0.5551894, 0.4439656, 1.007983, 0.2431373, 0, 1, 1,
0.5564116, -0.3462569, 2.66214, 0.2470588, 0, 1, 1,
0.5565775, -0.5268762, 2.869551, 0.254902, 0, 1, 1,
0.5573757, -1.356909, 0.9630346, 0.2588235, 0, 1, 1,
0.5701551, 1.955425, 2.069122, 0.2666667, 0, 1, 1,
0.5721486, 0.1728724, -0.08798055, 0.2705882, 0, 1, 1,
0.5735081, 1.012896, 1.022941, 0.2784314, 0, 1, 1,
0.5745025, 1.49774, 0.6760218, 0.282353, 0, 1, 1,
0.5773863, 1.340522, 0.2747553, 0.2901961, 0, 1, 1,
0.5775057, 1.187623, 0.4301767, 0.2941177, 0, 1, 1,
0.5805917, 0.4116271, 0.8775321, 0.3019608, 0, 1, 1,
0.5861339, 0.620648, 0.478071, 0.3098039, 0, 1, 1,
0.588993, -0.3816918, 1.744798, 0.3137255, 0, 1, 1,
0.5892887, 0.4112865, 0.08912306, 0.3215686, 0, 1, 1,
0.5910773, -0.6196753, 2.797649, 0.3254902, 0, 1, 1,
0.5927956, 1.597323, 2.352435, 0.3333333, 0, 1, 1,
0.5929546, -0.5508054, 1.943893, 0.3372549, 0, 1, 1,
0.5947766, -0.3535125, 1.837862, 0.345098, 0, 1, 1,
0.5951363, 1.729438, 0.2518233, 0.3490196, 0, 1, 1,
0.5967864, -1.940825, 2.703325, 0.3568628, 0, 1, 1,
0.599718, 0.3688331, 0.2230908, 0.3607843, 0, 1, 1,
0.6004367, 0.132284, 1.418299, 0.3686275, 0, 1, 1,
0.6067882, 0.2745214, 0.2882921, 0.372549, 0, 1, 1,
0.6092827, -0.1752788, 3.920126, 0.3803922, 0, 1, 1,
0.6139449, 0.2974745, 1.918667, 0.3843137, 0, 1, 1,
0.6164737, 0.160089, 2.723407, 0.3921569, 0, 1, 1,
0.6165026, 0.335833, 2.181992, 0.3960784, 0, 1, 1,
0.6185279, -0.5557906, 2.475552, 0.4039216, 0, 1, 1,
0.6186879, 0.7188777, -0.4382714, 0.4117647, 0, 1, 1,
0.6212938, 1.098544, -0.1090633, 0.4156863, 0, 1, 1,
0.6269333, 1.771483, -0.3008974, 0.4235294, 0, 1, 1,
0.6270422, 1.240825, 1.329836, 0.427451, 0, 1, 1,
0.6326721, 0.6957512, 1.534399, 0.4352941, 0, 1, 1,
0.6342227, 0.01585414, 1.87874, 0.4392157, 0, 1, 1,
0.6385542, 0.1908325, 0.3725569, 0.4470588, 0, 1, 1,
0.6442502, -2.1369, 3.92432, 0.4509804, 0, 1, 1,
0.6533028, -0.6929222, 1.924825, 0.4588235, 0, 1, 1,
0.6534812, 0.3350293, -0.5686737, 0.4627451, 0, 1, 1,
0.6602675, -0.5521726, 0.1467293, 0.4705882, 0, 1, 1,
0.66756, -1.197821, 2.924485, 0.4745098, 0, 1, 1,
0.6704683, -1.523717, 2.098532, 0.4823529, 0, 1, 1,
0.6729932, 0.4375286, 0.5388204, 0.4862745, 0, 1, 1,
0.6743473, 1.856219, 0.1447746, 0.4941176, 0, 1, 1,
0.6801648, 1.624722, 1.832681, 0.5019608, 0, 1, 1,
0.6873196, -0.06999039, 0.7065905, 0.5058824, 0, 1, 1,
0.6884499, -2.088054, 2.610195, 0.5137255, 0, 1, 1,
0.6909449, 2.060017, 0.8178556, 0.5176471, 0, 1, 1,
0.6912472, 0.7687016, -0.1478963, 0.5254902, 0, 1, 1,
0.6953756, 0.3869063, 0.4741369, 0.5294118, 0, 1, 1,
0.7033207, 2.03056, -1.546854, 0.5372549, 0, 1, 1,
0.7044942, 0.1530326, -0.8672764, 0.5411765, 0, 1, 1,
0.7051196, 1.589773, 1.303891, 0.5490196, 0, 1, 1,
0.7065624, 0.5465481, -1.370488, 0.5529412, 0, 1, 1,
0.7085552, 0.1055542, 2.026228, 0.5607843, 0, 1, 1,
0.7113826, -0.5175295, 2.502217, 0.5647059, 0, 1, 1,
0.7122133, 0.166953, 1.629211, 0.572549, 0, 1, 1,
0.7157153, -0.2219926, 0.9580903, 0.5764706, 0, 1, 1,
0.7170409, -1.370178, 3.823151, 0.5843138, 0, 1, 1,
0.7213953, -0.9154738, 3.167041, 0.5882353, 0, 1, 1,
0.7311231, 0.4493611, 2.053431, 0.5960785, 0, 1, 1,
0.732078, 1.792698, 0.8797004, 0.6039216, 0, 1, 1,
0.7322937, 1.574262, -1.02749, 0.6078432, 0, 1, 1,
0.7325622, 0.07223549, -0.5572895, 0.6156863, 0, 1, 1,
0.7348342, -0.5548955, 2.860099, 0.6196079, 0, 1, 1,
0.7385222, -0.6781326, 2.493415, 0.627451, 0, 1, 1,
0.7418469, 0.9527926, 0.2618048, 0.6313726, 0, 1, 1,
0.7449242, 1.251771, 0.2289793, 0.6392157, 0, 1, 1,
0.7455163, -0.6369587, 3.221946, 0.6431373, 0, 1, 1,
0.7461223, -0.734567, 3.215675, 0.6509804, 0, 1, 1,
0.7467799, 0.8660826, 0.4008195, 0.654902, 0, 1, 1,
0.7467957, -0.6901176, 1.481084, 0.6627451, 0, 1, 1,
0.7532108, 1.141147, -0.2089129, 0.6666667, 0, 1, 1,
0.7547231, -0.3398879, 3.451992, 0.6745098, 0, 1, 1,
0.7560383, -0.009030677, 2.828374, 0.6784314, 0, 1, 1,
0.7608598, -0.157782, 2.982355, 0.6862745, 0, 1, 1,
0.7635285, -0.08707505, 3.115248, 0.6901961, 0, 1, 1,
0.7659614, -0.02804196, 1.424307, 0.6980392, 0, 1, 1,
0.7664404, 0.644698, 1.891254, 0.7058824, 0, 1, 1,
0.7681929, 0.5741635, -0.2076843, 0.7098039, 0, 1, 1,
0.7684017, -0.2531814, 1.804817, 0.7176471, 0, 1, 1,
0.7715836, 0.4381232, -0.002653669, 0.7215686, 0, 1, 1,
0.7723683, -1.152557, 1.360606, 0.7294118, 0, 1, 1,
0.7768967, -0.3043277, 1.109647, 0.7333333, 0, 1, 1,
0.7833779, 0.7841217, -0.1499109, 0.7411765, 0, 1, 1,
0.7894816, 0.1561229, 0.2714365, 0.7450981, 0, 1, 1,
0.7968583, -0.8954711, 0.6046185, 0.7529412, 0, 1, 1,
0.7997729, -0.5777492, 1.074281, 0.7568628, 0, 1, 1,
0.8005021, 0.7495528, -0.7007579, 0.7647059, 0, 1, 1,
0.8007718, 0.3262869, 0.5141364, 0.7686275, 0, 1, 1,
0.8023481, 1.132972, 1.285702, 0.7764706, 0, 1, 1,
0.8040044, -0.6703083, 2.281744, 0.7803922, 0, 1, 1,
0.8069869, -0.1394965, 1.258724, 0.7882353, 0, 1, 1,
0.8091406, 0.05533218, -0.21102, 0.7921569, 0, 1, 1,
0.819644, -0.8658408, 2.195064, 0.8, 0, 1, 1,
0.8242456, 2.342377, -0.4157366, 0.8078431, 0, 1, 1,
0.8288486, 0.01403374, 1.001696, 0.8117647, 0, 1, 1,
0.8293839, 2.408551, 0.7300328, 0.8196079, 0, 1, 1,
0.8293895, -0.8416804, 3.431926, 0.8235294, 0, 1, 1,
0.831745, -0.3141705, 2.718693, 0.8313726, 0, 1, 1,
0.8331334, 1.392418, 2.224317, 0.8352941, 0, 1, 1,
0.8354105, 1.161459, 0.1810146, 0.8431373, 0, 1, 1,
0.8358154, -0.3198505, 1.606217, 0.8470588, 0, 1, 1,
0.8379678, 0.3837453, 1.282203, 0.854902, 0, 1, 1,
0.848052, -0.2723971, 3.872125, 0.8588235, 0, 1, 1,
0.8513252, -0.5791083, 1.911765, 0.8666667, 0, 1, 1,
0.8539847, 0.3614291, 2.217504, 0.8705882, 0, 1, 1,
0.8540429, 1.060816, 0.8659556, 0.8784314, 0, 1, 1,
0.8543252, -0.1761588, 2.9761, 0.8823529, 0, 1, 1,
0.862344, 0.2207799, 1.283137, 0.8901961, 0, 1, 1,
0.8666832, 0.6098847, -0.4480185, 0.8941177, 0, 1, 1,
0.8684984, 0.9079533, 1.070934, 0.9019608, 0, 1, 1,
0.8714061, -1.074428, 0.6693397, 0.9098039, 0, 1, 1,
0.8746029, 0.9619768, 1.582189, 0.9137255, 0, 1, 1,
0.8749979, 0.6132929, 1.58453, 0.9215686, 0, 1, 1,
0.8756356, 1.172759, 1.597659, 0.9254902, 0, 1, 1,
0.8809062, 1.243653, 1.980961, 0.9333333, 0, 1, 1,
0.8813254, 0.4163365, 0.7081167, 0.9372549, 0, 1, 1,
0.8825503, -0.3329957, 3.153443, 0.945098, 0, 1, 1,
0.8871303, 1.418164, 0.8736785, 0.9490196, 0, 1, 1,
0.8959116, 0.6316226, -0.7893661, 0.9568627, 0, 1, 1,
0.9020933, -0.1373801, 1.378745, 0.9607843, 0, 1, 1,
0.9190406, 0.6260621, -0.05655445, 0.9686275, 0, 1, 1,
0.923227, 1.179069, 0.8123981, 0.972549, 0, 1, 1,
0.9272537, 2.239256, 0.8593898, 0.9803922, 0, 1, 1,
0.9517621, -0.3272518, 1.007321, 0.9843137, 0, 1, 1,
0.9634407, 1.471806, -0.4250994, 0.9921569, 0, 1, 1,
0.9639693, 1.464548, 0.09690977, 0.9960784, 0, 1, 1,
0.9757748, 1.249119, -1.70183, 1, 0, 0.9960784, 1,
0.977431, 0.9404444, 2.188514, 1, 0, 0.9882353, 1,
0.9796085, 2.319329, 1.139753, 1, 0, 0.9843137, 1,
0.982732, 0.2695757, 1.332988, 1, 0, 0.9764706, 1,
0.9827915, -0.7332327, 1.814664, 1, 0, 0.972549, 1,
0.9838528, 0.6337571, 0.1409674, 1, 0, 0.9647059, 1,
0.9840804, -1.551565, 1.685735, 1, 0, 0.9607843, 1,
0.9849154, 1.214334, 1.608006, 1, 0, 0.9529412, 1,
0.9853276, 1.027742, 2.33433, 1, 0, 0.9490196, 1,
0.9901029, 1.613434, 1.394088, 1, 0, 0.9411765, 1,
0.9924061, -0.09403577, 2.459522, 1, 0, 0.9372549, 1,
0.9996246, -0.7062296, 3.548092, 1, 0, 0.9294118, 1,
1.002149, -1.350251, 2.678257, 1, 0, 0.9254902, 1,
1.007698, 0.0007791403, 1.685008, 1, 0, 0.9176471, 1,
1.009881, -1.366576, 1.766071, 1, 0, 0.9137255, 1,
1.010557, 1.56774, 0.2089435, 1, 0, 0.9058824, 1,
1.014129, 0.6181281, 1.596794, 1, 0, 0.9019608, 1,
1.017088, 0.2475097, 1.733469, 1, 0, 0.8941177, 1,
1.021577, -0.1405791, 2.029916, 1, 0, 0.8862745, 1,
1.027177, 0.9502271, 1.320483, 1, 0, 0.8823529, 1,
1.029083, -1.44756, 1.518884, 1, 0, 0.8745098, 1,
1.029924, 0.5547795, 1.875845, 1, 0, 0.8705882, 1,
1.032186, 0.3167191, 1.483101, 1, 0, 0.8627451, 1,
1.043592, -0.1881979, 0.4096634, 1, 0, 0.8588235, 1,
1.049305, -0.08565844, 2.164016, 1, 0, 0.8509804, 1,
1.051571, -0.6352303, 1.841012, 1, 0, 0.8470588, 1,
1.059126, -0.873772, 1.117769, 1, 0, 0.8392157, 1,
1.060125, 0.7860096, 1.605083, 1, 0, 0.8352941, 1,
1.062904, -1.264044, 3.902154, 1, 0, 0.827451, 1,
1.063733, -0.05127685, 1.595826, 1, 0, 0.8235294, 1,
1.064539, -0.8811698, 1.233934, 1, 0, 0.8156863, 1,
1.064889, -0.5892364, 2.204681, 1, 0, 0.8117647, 1,
1.074477, 1.77245, 0.394398, 1, 0, 0.8039216, 1,
1.076022, -1.316379, 2.641526, 1, 0, 0.7960784, 1,
1.077577, -0.8322796, 2.46721, 1, 0, 0.7921569, 1,
1.080454, 0.7753401, -0.2160878, 1, 0, 0.7843137, 1,
1.087443, 1.043195, 0.7546596, 1, 0, 0.7803922, 1,
1.093123, -0.284401, 1.583778, 1, 0, 0.772549, 1,
1.094011, -0.5483613, 2.046793, 1, 0, 0.7686275, 1,
1.095237, -0.6525726, 1.883572, 1, 0, 0.7607843, 1,
1.096413, 0.334536, 1.947379, 1, 0, 0.7568628, 1,
1.102375, 0.2107887, 1.340167, 1, 0, 0.7490196, 1,
1.103876, 0.6604499, -0.5907665, 1, 0, 0.7450981, 1,
1.10595, 1.224024, 1.318498, 1, 0, 0.7372549, 1,
1.110788, 0.0793284, 1.650295, 1, 0, 0.7333333, 1,
1.112563, -0.04114413, 3.630068, 1, 0, 0.7254902, 1,
1.120547, 0.3300426, 0.296354, 1, 0, 0.7215686, 1,
1.12093, -1.237277, 0.358852, 1, 0, 0.7137255, 1,
1.124516, 1.800878, 2.69328, 1, 0, 0.7098039, 1,
1.128401, 0.6881579, 1.745706, 1, 0, 0.7019608, 1,
1.133454, -1.653097, 2.726486, 1, 0, 0.6941177, 1,
1.144145, -0.008980809, 1.324387, 1, 0, 0.6901961, 1,
1.149437, 0.06964836, 0.7918982, 1, 0, 0.682353, 1,
1.158645, 0.3316555, 1.720051, 1, 0, 0.6784314, 1,
1.161076, -1.261689, 1.604251, 1, 0, 0.6705883, 1,
1.171133, -1.451607, 3.603447, 1, 0, 0.6666667, 1,
1.171191, 0.9568125, 1.113584, 1, 0, 0.6588235, 1,
1.176524, 0.3138145, 0.7297559, 1, 0, 0.654902, 1,
1.188833, 0.2723845, 1.082841, 1, 0, 0.6470588, 1,
1.18969, 1.656394, 0.3812858, 1, 0, 0.6431373, 1,
1.192295, -1.25915, 0.8633156, 1, 0, 0.6352941, 1,
1.194566, -1.496889, 1.94614, 1, 0, 0.6313726, 1,
1.195799, 1.482399, 0.9295517, 1, 0, 0.6235294, 1,
1.197855, 1.517072, 0.2719346, 1, 0, 0.6196079, 1,
1.204008, -1.141463, 3.49826, 1, 0, 0.6117647, 1,
1.206335, -0.5049216, 1.599748, 1, 0, 0.6078432, 1,
1.211225, 0.006749944, -0.7559855, 1, 0, 0.6, 1,
1.214693, 0.5219228, 2.076987, 1, 0, 0.5921569, 1,
1.219556, 0.3407465, 1.766721, 1, 0, 0.5882353, 1,
1.226847, 1.17419, -0.4127071, 1, 0, 0.5803922, 1,
1.229478, 0.1287731, 2.512942, 1, 0, 0.5764706, 1,
1.232464, 0.9907252, -0.1140436, 1, 0, 0.5686275, 1,
1.247268, 0.2846503, 2.409203, 1, 0, 0.5647059, 1,
1.250735, 1.620267, 0.3652354, 1, 0, 0.5568628, 1,
1.255115, -0.634321, 2.182437, 1, 0, 0.5529412, 1,
1.28558, 1.442266, -0.05032792, 1, 0, 0.5450981, 1,
1.289935, -0.4052867, 2.751966, 1, 0, 0.5411765, 1,
1.302306, 0.6204267, 0.0282257, 1, 0, 0.5333334, 1,
1.305316, 0.01662637, 2.766796, 1, 0, 0.5294118, 1,
1.307029, -1.490611, 2.336159, 1, 0, 0.5215687, 1,
1.309474, 0.7924477, 2.263072, 1, 0, 0.5176471, 1,
1.330928, 1.726327, 0.01594261, 1, 0, 0.509804, 1,
1.331945, 0.4570708, 1.303604, 1, 0, 0.5058824, 1,
1.333187, 0.1124338, 2.802644, 1, 0, 0.4980392, 1,
1.33349, 1.623157, 0.8245311, 1, 0, 0.4901961, 1,
1.355337, 0.4958105, -0.5768957, 1, 0, 0.4862745, 1,
1.365272, -1.298026, 2.416583, 1, 0, 0.4784314, 1,
1.380511, 0.3703784, 1.617646, 1, 0, 0.4745098, 1,
1.3808, 0.09392871, 2.889803, 1, 0, 0.4666667, 1,
1.382166, 0.004296618, -0.5335531, 1, 0, 0.4627451, 1,
1.384291, -0.2841268, -0.5897726, 1, 0, 0.454902, 1,
1.391279, 0.04112621, 0.1967306, 1, 0, 0.4509804, 1,
1.394071, 0.6669549, 0.5299894, 1, 0, 0.4431373, 1,
1.395714, -0.7293233, 1.165345, 1, 0, 0.4392157, 1,
1.411018, -1.88781, 0.7982935, 1, 0, 0.4313726, 1,
1.41207, 0.6181107, -0.835842, 1, 0, 0.427451, 1,
1.423507, -0.9827741, 1.541877, 1, 0, 0.4196078, 1,
1.423846, 1.855017, 0.2336241, 1, 0, 0.4156863, 1,
1.426091, -1.450576, 3.420691, 1, 0, 0.4078431, 1,
1.43366, 0.4486798, 2.940414, 1, 0, 0.4039216, 1,
1.435484, 1.18947, 0.6300074, 1, 0, 0.3960784, 1,
1.438313, 1.701365, 1.999624, 1, 0, 0.3882353, 1,
1.443891, 0.7300164, 0.7622786, 1, 0, 0.3843137, 1,
1.449687, -0.3855129, 1.016281, 1, 0, 0.3764706, 1,
1.457669, 0.9858516, 0.7781982, 1, 0, 0.372549, 1,
1.46083, -1.497422, 2.802464, 1, 0, 0.3647059, 1,
1.472286, -0.548579, 1.865829, 1, 0, 0.3607843, 1,
1.472489, 1.532056, 0.5189622, 1, 0, 0.3529412, 1,
1.482508, -0.6290946, 3.403098, 1, 0, 0.3490196, 1,
1.515178, 2.893592, 0.1695267, 1, 0, 0.3411765, 1,
1.54744, -0.03590586, 0.8921414, 1, 0, 0.3372549, 1,
1.573965, -2.528394, 1.632423, 1, 0, 0.3294118, 1,
1.582288, -1.044035, 1.95518, 1, 0, 0.3254902, 1,
1.603254, -0.07457715, 2.871116, 1, 0, 0.3176471, 1,
1.608111, -0.001324389, 2.343441, 1, 0, 0.3137255, 1,
1.620882, 0.3207331, 0.756296, 1, 0, 0.3058824, 1,
1.630514, -1.022089, 3.005606, 1, 0, 0.2980392, 1,
1.634493, 0.1805527, 0.5052394, 1, 0, 0.2941177, 1,
1.639711, -0.320703, 1.581843, 1, 0, 0.2862745, 1,
1.658681, 2.20243, 1.44049, 1, 0, 0.282353, 1,
1.662456, -1.069817, 0.7959229, 1, 0, 0.2745098, 1,
1.682761, 1.319448, 0.6537491, 1, 0, 0.2705882, 1,
1.704242, -0.9315983, 2.920611, 1, 0, 0.2627451, 1,
1.705744, 1.415284, 2.368437, 1, 0, 0.2588235, 1,
1.706234, -1.548757, 0.5210432, 1, 0, 0.2509804, 1,
1.728364, 0.04133959, 1.543578, 1, 0, 0.2470588, 1,
1.736233, -0.8978729, 1.130765, 1, 0, 0.2392157, 1,
1.748376, -0.2084202, 1.268946, 1, 0, 0.2352941, 1,
1.762912, 1.054897, 0.4548628, 1, 0, 0.227451, 1,
1.768344, 1.014381, 0.16772, 1, 0, 0.2235294, 1,
1.774426, 0.9286366, -0.6406756, 1, 0, 0.2156863, 1,
1.805315, -1.763735, 3.886792, 1, 0, 0.2117647, 1,
1.806268, 0.732614, 1.115195, 1, 0, 0.2039216, 1,
1.809211, 0.661491, 0.4588355, 1, 0, 0.1960784, 1,
1.824996, 1.072116, 0.9313138, 1, 0, 0.1921569, 1,
1.844376, -0.1316793, 0.8147712, 1, 0, 0.1843137, 1,
1.874714, 0.6983284, 0.7165092, 1, 0, 0.1803922, 1,
1.881799, 1.42874, 0.5761024, 1, 0, 0.172549, 1,
1.898594, 0.04517535, 0.7396968, 1, 0, 0.1686275, 1,
1.903131, -0.1935072, 1.603949, 1, 0, 0.1607843, 1,
1.917911, -0.7899094, 2.010243, 1, 0, 0.1568628, 1,
1.924225, 1.500891, 1.105734, 1, 0, 0.1490196, 1,
1.937967, 0.4255909, 2.565683, 1, 0, 0.145098, 1,
1.94699, -2.189967, 3.267924, 1, 0, 0.1372549, 1,
1.954658, 1.379546, -0.01232091, 1, 0, 0.1333333, 1,
1.954904, -0.05270353, 3.245447, 1, 0, 0.1254902, 1,
1.967392, -0.2087791, 1.918236, 1, 0, 0.1215686, 1,
1.989555, 0.032754, 2.077634, 1, 0, 0.1137255, 1,
2.000412, -0.7784616, 3.058919, 1, 0, 0.1098039, 1,
2.036167, 0.1179764, 2.13281, 1, 0, 0.1019608, 1,
2.047636, 0.4300613, 1.692193, 1, 0, 0.09411765, 1,
2.050372, -0.155007, 1.344292, 1, 0, 0.09019608, 1,
2.056709, -0.4899766, 1.517132, 1, 0, 0.08235294, 1,
2.096353, -0.8066545, 1.019142, 1, 0, 0.07843138, 1,
2.115801, 0.4166069, 2.119857, 1, 0, 0.07058824, 1,
2.130404, 0.6828219, -0.3257, 1, 0, 0.06666667, 1,
2.165109, 0.5202899, 3.094003, 1, 0, 0.05882353, 1,
2.210932, -0.5001155, 1.541319, 1, 0, 0.05490196, 1,
2.21614, 0.7632071, 1.025074, 1, 0, 0.04705882, 1,
2.219806, -1.581644, 1.794211, 1, 0, 0.04313726, 1,
2.396776, 0.01809573, 2.577422, 1, 0, 0.03529412, 1,
2.422226, -1.159989, -0.04673887, 1, 0, 0.03137255, 1,
2.452041, 1.14451, 0.9800156, 1, 0, 0.02352941, 1,
2.534559, 2.130185, 0.9405591, 1, 0, 0.01960784, 1,
2.535853, -0.9861789, 0.9712363, 1, 0, 0.01176471, 1,
3.098893, -1.150799, 0.5041856, 1, 0, 0.007843138, 1
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
-0.08987868, -4.074005, -7.32728, 0, -0.5, 0.5, 0.5,
-0.08987868, -4.074005, -7.32728, 1, -0.5, 0.5, 0.5,
-0.08987868, -4.074005, -7.32728, 1, 1.5, 0.5, 0.5,
-0.08987868, -4.074005, -7.32728, 0, 1.5, 0.5, 0.5
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
-4.359644, 0.2783206, -7.32728, 0, -0.5, 0.5, 0.5,
-4.359644, 0.2783206, -7.32728, 1, -0.5, 0.5, 0.5,
-4.359644, 0.2783206, -7.32728, 1, 1.5, 0.5, 0.5,
-4.359644, 0.2783206, -7.32728, 0, 1.5, 0.5, 0.5
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
-4.359644, -4.074005, 0.1035256, 0, -0.5, 0.5, 0.5,
-4.359644, -4.074005, 0.1035256, 1, -0.5, 0.5, 0.5,
-4.359644, -4.074005, 0.1035256, 1, 1.5, 0.5, 0.5,
-4.359644, -4.074005, 0.1035256, 0, 1.5, 0.5, 0.5
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
-3, -3.069622, -5.612479,
3, -3.069622, -5.612479,
-3, -3.069622, -5.612479,
-3, -3.237019, -5.898279,
-2, -3.069622, -5.612479,
-2, -3.237019, -5.898279,
-1, -3.069622, -5.612479,
-1, -3.237019, -5.898279,
0, -3.069622, -5.612479,
0, -3.237019, -5.898279,
1, -3.069622, -5.612479,
1, -3.237019, -5.898279,
2, -3.069622, -5.612479,
2, -3.237019, -5.898279,
3, -3.069622, -5.612479,
3, -3.237019, -5.898279
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
-3, -3.571813, -6.469879, 0, -0.5, 0.5, 0.5,
-3, -3.571813, -6.469879, 1, -0.5, 0.5, 0.5,
-3, -3.571813, -6.469879, 1, 1.5, 0.5, 0.5,
-3, -3.571813, -6.469879, 0, 1.5, 0.5, 0.5,
-2, -3.571813, -6.469879, 0, -0.5, 0.5, 0.5,
-2, -3.571813, -6.469879, 1, -0.5, 0.5, 0.5,
-2, -3.571813, -6.469879, 1, 1.5, 0.5, 0.5,
-2, -3.571813, -6.469879, 0, 1.5, 0.5, 0.5,
-1, -3.571813, -6.469879, 0, -0.5, 0.5, 0.5,
-1, -3.571813, -6.469879, 1, -0.5, 0.5, 0.5,
-1, -3.571813, -6.469879, 1, 1.5, 0.5, 0.5,
-1, -3.571813, -6.469879, 0, 1.5, 0.5, 0.5,
0, -3.571813, -6.469879, 0, -0.5, 0.5, 0.5,
0, -3.571813, -6.469879, 1, -0.5, 0.5, 0.5,
0, -3.571813, -6.469879, 1, 1.5, 0.5, 0.5,
0, -3.571813, -6.469879, 0, 1.5, 0.5, 0.5,
1, -3.571813, -6.469879, 0, -0.5, 0.5, 0.5,
1, -3.571813, -6.469879, 1, -0.5, 0.5, 0.5,
1, -3.571813, -6.469879, 1, 1.5, 0.5, 0.5,
1, -3.571813, -6.469879, 0, 1.5, 0.5, 0.5,
2, -3.571813, -6.469879, 0, -0.5, 0.5, 0.5,
2, -3.571813, -6.469879, 1, -0.5, 0.5, 0.5,
2, -3.571813, -6.469879, 1, 1.5, 0.5, 0.5,
2, -3.571813, -6.469879, 0, 1.5, 0.5, 0.5,
3, -3.571813, -6.469879, 0, -0.5, 0.5, 0.5,
3, -3.571813, -6.469879, 1, -0.5, 0.5, 0.5,
3, -3.571813, -6.469879, 1, 1.5, 0.5, 0.5,
3, -3.571813, -6.469879, 0, 1.5, 0.5, 0.5
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
-3.374314, -2, -5.612479,
-3.374314, 3, -5.612479,
-3.374314, -2, -5.612479,
-3.538536, -2, -5.898279,
-3.374314, -1, -5.612479,
-3.538536, -1, -5.898279,
-3.374314, 0, -5.612479,
-3.538536, 0, -5.898279,
-3.374314, 1, -5.612479,
-3.538536, 1, -5.898279,
-3.374314, 2, -5.612479,
-3.538536, 2, -5.898279,
-3.374314, 3, -5.612479,
-3.538536, 3, -5.898279
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
-3.866979, -2, -6.469879, 0, -0.5, 0.5, 0.5,
-3.866979, -2, -6.469879, 1, -0.5, 0.5, 0.5,
-3.866979, -2, -6.469879, 1, 1.5, 0.5, 0.5,
-3.866979, -2, -6.469879, 0, 1.5, 0.5, 0.5,
-3.866979, -1, -6.469879, 0, -0.5, 0.5, 0.5,
-3.866979, -1, -6.469879, 1, -0.5, 0.5, 0.5,
-3.866979, -1, -6.469879, 1, 1.5, 0.5, 0.5,
-3.866979, -1, -6.469879, 0, 1.5, 0.5, 0.5,
-3.866979, 0, -6.469879, 0, -0.5, 0.5, 0.5,
-3.866979, 0, -6.469879, 1, -0.5, 0.5, 0.5,
-3.866979, 0, -6.469879, 1, 1.5, 0.5, 0.5,
-3.866979, 0, -6.469879, 0, 1.5, 0.5, 0.5,
-3.866979, 1, -6.469879, 0, -0.5, 0.5, 0.5,
-3.866979, 1, -6.469879, 1, -0.5, 0.5, 0.5,
-3.866979, 1, -6.469879, 1, 1.5, 0.5, 0.5,
-3.866979, 1, -6.469879, 0, 1.5, 0.5, 0.5,
-3.866979, 2, -6.469879, 0, -0.5, 0.5, 0.5,
-3.866979, 2, -6.469879, 1, -0.5, 0.5, 0.5,
-3.866979, 2, -6.469879, 1, 1.5, 0.5, 0.5,
-3.866979, 2, -6.469879, 0, 1.5, 0.5, 0.5,
-3.866979, 3, -6.469879, 0, -0.5, 0.5, 0.5,
-3.866979, 3, -6.469879, 1, -0.5, 0.5, 0.5,
-3.866979, 3, -6.469879, 1, 1.5, 0.5, 0.5,
-3.866979, 3, -6.469879, 0, 1.5, 0.5, 0.5
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
-3.374314, -3.069622, -4,
-3.374314, -3.069622, 4,
-3.374314, -3.069622, -4,
-3.538536, -3.237019, -4,
-3.374314, -3.069622, -2,
-3.538536, -3.237019, -2,
-3.374314, -3.069622, 0,
-3.538536, -3.237019, 0,
-3.374314, -3.069622, 2,
-3.538536, -3.237019, 2,
-3.374314, -3.069622, 4,
-3.538536, -3.237019, 4
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
-3.866979, -3.571813, -4, 0, -0.5, 0.5, 0.5,
-3.866979, -3.571813, -4, 1, -0.5, 0.5, 0.5,
-3.866979, -3.571813, -4, 1, 1.5, 0.5, 0.5,
-3.866979, -3.571813, -4, 0, 1.5, 0.5, 0.5,
-3.866979, -3.571813, -2, 0, -0.5, 0.5, 0.5,
-3.866979, -3.571813, -2, 1, -0.5, 0.5, 0.5,
-3.866979, -3.571813, -2, 1, 1.5, 0.5, 0.5,
-3.866979, -3.571813, -2, 0, 1.5, 0.5, 0.5,
-3.866979, -3.571813, 0, 0, -0.5, 0.5, 0.5,
-3.866979, -3.571813, 0, 1, -0.5, 0.5, 0.5,
-3.866979, -3.571813, 0, 1, 1.5, 0.5, 0.5,
-3.866979, -3.571813, 0, 0, 1.5, 0.5, 0.5,
-3.866979, -3.571813, 2, 0, -0.5, 0.5, 0.5,
-3.866979, -3.571813, 2, 1, -0.5, 0.5, 0.5,
-3.866979, -3.571813, 2, 1, 1.5, 0.5, 0.5,
-3.866979, -3.571813, 2, 0, 1.5, 0.5, 0.5,
-3.866979, -3.571813, 4, 0, -0.5, 0.5, 0.5,
-3.866979, -3.571813, 4, 1, -0.5, 0.5, 0.5,
-3.866979, -3.571813, 4, 1, 1.5, 0.5, 0.5,
-3.866979, -3.571813, 4, 0, 1.5, 0.5, 0.5
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
-3.374314, -3.069622, -5.612479,
-3.374314, 3.626263, -5.612479,
-3.374314, -3.069622, 5.81953,
-3.374314, 3.626263, 5.81953,
-3.374314, -3.069622, -5.612479,
-3.374314, -3.069622, 5.81953,
-3.374314, 3.626263, -5.612479,
-3.374314, 3.626263, 5.81953,
-3.374314, -3.069622, -5.612479,
3.194556, -3.069622, -5.612479,
-3.374314, -3.069622, 5.81953,
3.194556, -3.069622, 5.81953,
-3.374314, 3.626263, -5.612479,
3.194556, 3.626263, -5.612479,
-3.374314, 3.626263, 5.81953,
3.194556, 3.626263, 5.81953,
3.194556, -3.069622, -5.612479,
3.194556, 3.626263, -5.612479,
3.194556, -3.069622, 5.81953,
3.194556, 3.626263, 5.81953,
3.194556, -3.069622, -5.612479,
3.194556, -3.069622, 5.81953,
3.194556, 3.626263, -5.612479,
3.194556, 3.626263, 5.81953
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
var radius = 7.896339;
var distance = 35.1317;
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
mvMatrix.translate( 0.08987868, -0.2783206, -0.1035256 );
mvMatrix.scale( 1.299718, 1.275063, 0.7468221 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.1317);
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
Mesomile<-read.table("Mesomile.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Mesomile$V2
```

```
## Error in eval(expr, envir, enclos): object 'Mesomile' not found
```

```r
y<-Mesomile$V3
```

```
## Error in eval(expr, envir, enclos): object 'Mesomile' not found
```

```r
z<-Mesomile$V4
```

```
## Error in eval(expr, envir, enclos): object 'Mesomile' not found
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
-3.278651, -1.288656, -3.031923, 0, 0, 1, 1, 1,
-2.769666, -0.3899406, 1.761353, 1, 0, 0, 1, 1,
-2.603345, -0.4874902, -1.372723, 1, 0, 0, 1, 1,
-2.550149, -0.506315, -2.71344, 1, 0, 0, 1, 1,
-2.364263, 0.5208231, -0.2771019, 1, 0, 0, 1, 1,
-2.29985, -0.3858393, -2.413178, 1, 0, 0, 1, 1,
-2.295491, 1.763944, -3.028965, 0, 0, 0, 1, 1,
-2.257464, -0.06872945, -1.711704, 0, 0, 0, 1, 1,
-2.257169, 0.3862858, -3.944889, 0, 0, 0, 1, 1,
-2.221311, -0.844156, -2.203012, 0, 0, 0, 1, 1,
-2.212318, -0.1766972, -1.189839, 0, 0, 0, 1, 1,
-2.195796, -0.1772332, -0.1137949, 0, 0, 0, 1, 1,
-2.192235, -1.423782, -1.137636, 0, 0, 0, 1, 1,
-2.175658, 0.05643453, -0.09344932, 1, 1, 1, 1, 1,
-2.173679, 0.304247, -1.182918, 1, 1, 1, 1, 1,
-2.172994, 0.6331669, -0.5390218, 1, 1, 1, 1, 1,
-2.170448, 0.1924545, -1.418445, 1, 1, 1, 1, 1,
-2.14314, -0.7643079, -1.941171, 1, 1, 1, 1, 1,
-2.115916, -0.8248515, -1.951527, 1, 1, 1, 1, 1,
-2.069364, 0.7231248, -0.2582481, 1, 1, 1, 1, 1,
-2.067858, 1.441235, -1.547892, 1, 1, 1, 1, 1,
-2.059848, -0.3507438, -2.147674, 1, 1, 1, 1, 1,
-2.056108, 1.957121, -1.713323, 1, 1, 1, 1, 1,
-1.933337, 0.6391367, -0.5680592, 1, 1, 1, 1, 1,
-1.905651, -0.1441205, -1.298089, 1, 1, 1, 1, 1,
-1.904115, 0.9220132, -2.679334, 1, 1, 1, 1, 1,
-1.899649, -0.3955686, -2.045622, 1, 1, 1, 1, 1,
-1.898297, 1.137739, -1.469802, 1, 1, 1, 1, 1,
-1.890933, 1.02251, -0.2448405, 0, 0, 1, 1, 1,
-1.878217, 1.082248, 0.02662232, 1, 0, 0, 1, 1,
-1.84065, -1.17226, -3.706504, 1, 0, 0, 1, 1,
-1.833138, 0.4479007, 0.9392482, 1, 0, 0, 1, 1,
-1.825764, -0.05337795, -0.6219792, 1, 0, 0, 1, 1,
-1.82378, 0.4259449, -1.701464, 1, 0, 0, 1, 1,
-1.823715, -0.8996339, -2.378997, 0, 0, 0, 1, 1,
-1.8046, -0.2887246, -1.924109, 0, 0, 0, 1, 1,
-1.799891, -0.5504986, -1.45027, 0, 0, 0, 1, 1,
-1.794898, 0.09631045, -3.224251, 0, 0, 0, 1, 1,
-1.77198, 1.120191, -0.7778357, 0, 0, 0, 1, 1,
-1.769567, -0.9236422, -1.549276, 0, 0, 0, 1, 1,
-1.765437, 0.3182968, -2.327015, 0, 0, 0, 1, 1,
-1.749088, -0.2087788, -2.417609, 1, 1, 1, 1, 1,
-1.748649, -0.8038071, -2.574454, 1, 1, 1, 1, 1,
-1.744981, -0.7509736, -2.791216, 1, 1, 1, 1, 1,
-1.709134, -0.7542226, -2.574107, 1, 1, 1, 1, 1,
-1.7061, 0.8982526, -1.97929, 1, 1, 1, 1, 1,
-1.687406, -1.359127, -2.994156, 1, 1, 1, 1, 1,
-1.686926, -0.1601024, -1.306281, 1, 1, 1, 1, 1,
-1.680407, -1.468684, -2.555676, 1, 1, 1, 1, 1,
-1.67622, -1.042435, -1.389789, 1, 1, 1, 1, 1,
-1.671651, 1.772308, -1.77889, 1, 1, 1, 1, 1,
-1.665438, -0.2176738, -3.3705, 1, 1, 1, 1, 1,
-1.653777, -0.3875393, -1.874391, 1, 1, 1, 1, 1,
-1.631555, 0.7595918, -0.8983201, 1, 1, 1, 1, 1,
-1.605367, -0.3737425, -1.984302, 1, 1, 1, 1, 1,
-1.601336, -1.768352, -2.147845, 1, 1, 1, 1, 1,
-1.593414, -0.6632422, -1.416426, 0, 0, 1, 1, 1,
-1.573593, -0.3806933, -2.114174, 1, 0, 0, 1, 1,
-1.570561, -0.7662726, -2.090562, 1, 0, 0, 1, 1,
-1.567513, -0.3765725, -1.591946, 1, 0, 0, 1, 1,
-1.563588, 0.3021372, -0.01712118, 1, 0, 0, 1, 1,
-1.554252, 1.002901, -1.950912, 1, 0, 0, 1, 1,
-1.546927, -1.397449, -2.464728, 0, 0, 0, 1, 1,
-1.541515, 1.224634, -1.492168, 0, 0, 0, 1, 1,
-1.531506, 0.7799245, -1.405284, 0, 0, 0, 1, 1,
-1.526725, 0.9962285, -0.6802247, 0, 0, 0, 1, 1,
-1.515033, -0.3626543, -1.564687, 0, 0, 0, 1, 1,
-1.485183, -1.142136, -0.3643269, 0, 0, 0, 1, 1,
-1.478858, 0.02756288, -1.005146, 0, 0, 0, 1, 1,
-1.474871, -1.007625, -1.989595, 1, 1, 1, 1, 1,
-1.465264, 1.172579, -1.893549, 1, 1, 1, 1, 1,
-1.455965, -0.2923518, -2.61078, 1, 1, 1, 1, 1,
-1.451726, 0.6102858, -0.4429983, 1, 1, 1, 1, 1,
-1.447339, 1.97566, -1.286806, 1, 1, 1, 1, 1,
-1.436767, 0.2534455, -1.516027, 1, 1, 1, 1, 1,
-1.430496, -0.5372171, -1.667552, 1, 1, 1, 1, 1,
-1.42552, -0.04053547, -1.840551, 1, 1, 1, 1, 1,
-1.421616, -0.7287293, -4.076664, 1, 1, 1, 1, 1,
-1.418591, -0.3946214, -2.26162, 1, 1, 1, 1, 1,
-1.416605, 1.293568, -0.05879877, 1, 1, 1, 1, 1,
-1.392765, 0.7029166, -0.07753491, 1, 1, 1, 1, 1,
-1.389177, -0.1251221, -1.802311, 1, 1, 1, 1, 1,
-1.383048, 2.588134, -1.067679, 1, 1, 1, 1, 1,
-1.361822, -0.1421709, -0.05671144, 1, 1, 1, 1, 1,
-1.352879, -0.3883474, -2.276992, 0, 0, 1, 1, 1,
-1.351481, -2.78223, -1.665657, 1, 0, 0, 1, 1,
-1.343764, 0.4829656, 0.4764997, 1, 0, 0, 1, 1,
-1.333765, -1.590863, -0.2975252, 1, 0, 0, 1, 1,
-1.316018, -0.6814989, -3.950622, 1, 0, 0, 1, 1,
-1.315488, 0.7656891, -2.0342, 1, 0, 0, 1, 1,
-1.29514, -1.541533, -1.547866, 0, 0, 0, 1, 1,
-1.2933, 0.197102, -3.102842, 0, 0, 0, 1, 1,
-1.292146, -0.153911, -2.955674, 0, 0, 0, 1, 1,
-1.287492, 0.4222681, 0.7910148, 0, 0, 0, 1, 1,
-1.282351, 1.913328, 0.6191997, 0, 0, 0, 1, 1,
-1.266205, -0.4579018, -3.475301, 0, 0, 0, 1, 1,
-1.265668, -0.5840082, -3.064812, 0, 0, 0, 1, 1,
-1.25827, -0.30591, -1.130908, 1, 1, 1, 1, 1,
-1.250323, -0.07806057, -0.4218615, 1, 1, 1, 1, 1,
-1.249415, 1.629229, -1.701678, 1, 1, 1, 1, 1,
-1.245718, 0.5748992, -2.264881, 1, 1, 1, 1, 1,
-1.244772, -0.3496587, -1.143895, 1, 1, 1, 1, 1,
-1.242738, -0.9785305, -2.178033, 1, 1, 1, 1, 1,
-1.235119, -1.053803, -2.757825, 1, 1, 1, 1, 1,
-1.234367, -0.001124598, -1.268019, 1, 1, 1, 1, 1,
-1.234348, 0.5273019, -1.736134, 1, 1, 1, 1, 1,
-1.227896, 0.7220644, -1.19842, 1, 1, 1, 1, 1,
-1.226462, 0.2777422, -1.246235, 1, 1, 1, 1, 1,
-1.219038, -0.2437501, -1.438358, 1, 1, 1, 1, 1,
-1.21545, -0.8499342, -2.058748, 1, 1, 1, 1, 1,
-1.198444, -1.116028, -2.970663, 1, 1, 1, 1, 1,
-1.19833, -0.6527995, -1.640673, 1, 1, 1, 1, 1,
-1.183645, 1.402773, 0.1026042, 0, 0, 1, 1, 1,
-1.183103, 0.3070399, -2.655193, 1, 0, 0, 1, 1,
-1.182248, 1.8267, -0.1043352, 1, 0, 0, 1, 1,
-1.179122, -0.664653, -1.866272, 1, 0, 0, 1, 1,
-1.177261, -1.729161, -2.44009, 1, 0, 0, 1, 1,
-1.170645, 0.4954332, -2.248858, 1, 0, 0, 1, 1,
-1.170362, -0.008810804, -0.5248526, 0, 0, 0, 1, 1,
-1.164102, -0.7503024, -1.647217, 0, 0, 0, 1, 1,
-1.152852, -1.207645, -2.65047, 0, 0, 0, 1, 1,
-1.143666, -0.885586, -3.635667, 0, 0, 0, 1, 1,
-1.139954, -0.4397848, -1.615231, 0, 0, 0, 1, 1,
-1.134553, -0.1513266, -1.989096, 0, 0, 0, 1, 1,
-1.134314, -1.099276, -3.229018, 0, 0, 0, 1, 1,
-1.134231, -0.4582666, -1.167765, 1, 1, 1, 1, 1,
-1.124986, -0.1733133, -0.5799025, 1, 1, 1, 1, 1,
-1.103117, -0.7527937, -2.027838, 1, 1, 1, 1, 1,
-1.094579, 0.4548899, -1.443514, 1, 1, 1, 1, 1,
-1.091504, 1.438857, -1.324339, 1, 1, 1, 1, 1,
-1.083158, 0.1154078, -0.1722686, 1, 1, 1, 1, 1,
-1.081174, -0.4109145, -1.773299, 1, 1, 1, 1, 1,
-1.072944, 0.6340666, -0.8006786, 1, 1, 1, 1, 1,
-1.071806, -2.79224, -1.014409, 1, 1, 1, 1, 1,
-1.062316, 2.14456, -0.6488495, 1, 1, 1, 1, 1,
-1.05567, 0.6680349, -1.435227, 1, 1, 1, 1, 1,
-1.054691, 0.2387182, -0.9448472, 1, 1, 1, 1, 1,
-1.045681, -0.4765443, -2.727795, 1, 1, 1, 1, 1,
-1.039819, 0.147032, -3.851404, 1, 1, 1, 1, 1,
-1.034882, -0.7797917, -2.251516, 1, 1, 1, 1, 1,
-1.032184, 0.06381141, -0.1152513, 0, 0, 1, 1, 1,
-1.03161, -1.50808, -3.228297, 1, 0, 0, 1, 1,
-1.025644, -1.229511, -1.983719, 1, 0, 0, 1, 1,
-1.025589, 1.255988, -0.1549273, 1, 0, 0, 1, 1,
-1.018384, -0.1225626, -3.030093, 1, 0, 0, 1, 1,
-1.017215, -0.2393757, -1.219908, 1, 0, 0, 1, 1,
-1.01348, 0.5803346, -0.9074093, 0, 0, 0, 1, 1,
-1.005169, 1.883035, -0.5859001, 0, 0, 0, 1, 1,
-0.9970552, 0.8607272, -0.1354405, 0, 0, 0, 1, 1,
-0.9968482, 0.697924, 0.4309871, 0, 0, 0, 1, 1,
-0.9918063, 0.5043753, -0.8087023, 0, 0, 0, 1, 1,
-0.9897103, -0.2808554, -1.656398, 0, 0, 0, 1, 1,
-0.9870145, -0.4194285, -2.089345, 0, 0, 0, 1, 1,
-0.9861304, -0.04444338, -2.69573, 1, 1, 1, 1, 1,
-0.984069, -0.8010233, -1.303119, 1, 1, 1, 1, 1,
-0.9778278, -0.8589396, -1.470343, 1, 1, 1, 1, 1,
-0.9775522, -0.07807493, -2.447249, 1, 1, 1, 1, 1,
-0.9757926, -1.1969, -1.334842, 1, 1, 1, 1, 1,
-0.9732542, -0.1541131, -2.901163, 1, 1, 1, 1, 1,
-0.9686408, 1.196242, -1.222365, 1, 1, 1, 1, 1,
-0.9630899, -0.7950391, -0.8557681, 1, 1, 1, 1, 1,
-0.9605765, 0.7906939, -0.9556397, 1, 1, 1, 1, 1,
-0.9555, -0.3862882, -2.681306, 1, 1, 1, 1, 1,
-0.9523026, 0.4850579, -2.355407, 1, 1, 1, 1, 1,
-0.9425416, -1.807601, -2.12572, 1, 1, 1, 1, 1,
-0.9397546, 0.1538476, -1.496794, 1, 1, 1, 1, 1,
-0.9360309, -1.317583, -1.512678, 1, 1, 1, 1, 1,
-0.9320936, -0.6562656, -2.492226, 1, 1, 1, 1, 1,
-0.923772, -0.08589005, -2.885367, 0, 0, 1, 1, 1,
-0.920369, -0.5601472, -1.080626, 1, 0, 0, 1, 1,
-0.9187414, -0.3174796, -1.304308, 1, 0, 0, 1, 1,
-0.9149283, -1.073713, -0.8032376, 1, 0, 0, 1, 1,
-0.9142365, 0.5664402, -1.335036, 1, 0, 0, 1, 1,
-0.9099656, 2.450342, 0.698731, 1, 0, 0, 1, 1,
-0.908438, -1.61183, -2.973939, 0, 0, 0, 1, 1,
-0.9080386, 0.751535, 0.0520962, 0, 0, 0, 1, 1,
-0.9035025, 0.4991383, -0.7551938, 0, 0, 0, 1, 1,
-0.8969564, 0.3676423, -1.406316, 0, 0, 0, 1, 1,
-0.8968412, 0.08662459, -3.110405, 0, 0, 0, 1, 1,
-0.8964527, 0.6377991, -0.74378, 0, 0, 0, 1, 1,
-0.8926749, -1.22232, -2.975526, 0, 0, 0, 1, 1,
-0.8806413, 1.326009, -0.03241502, 1, 1, 1, 1, 1,
-0.8774918, -0.07222634, -2.630508, 1, 1, 1, 1, 1,
-0.8772244, -1.434873, -1.283354, 1, 1, 1, 1, 1,
-0.874778, -1.241231, -2.293845, 1, 1, 1, 1, 1,
-0.8712245, -1.638726, -4.902518, 1, 1, 1, 1, 1,
-0.8708839, -1.502167, -0.6366382, 1, 1, 1, 1, 1,
-0.8688705, -1.888659, -3.052861, 1, 1, 1, 1, 1,
-0.8683392, -1.758308, -2.399928, 1, 1, 1, 1, 1,
-0.8677252, 1.671436, -1.349245, 1, 1, 1, 1, 1,
-0.863903, -0.3749728, -1.506131, 1, 1, 1, 1, 1,
-0.8619782, 0.5436347, 0.001139623, 1, 1, 1, 1, 1,
-0.8550003, -1.944107, -2.311826, 1, 1, 1, 1, 1,
-0.8522441, -1.284631, -3.434914, 1, 1, 1, 1, 1,
-0.8520709, -1.279949, -2.575983, 1, 1, 1, 1, 1,
-0.8473187, 0.3187906, -1.219386, 1, 1, 1, 1, 1,
-0.8441338, 0.7963926, -2.506172, 0, 0, 1, 1, 1,
-0.8368888, -0.3317567, -0.4427643, 1, 0, 0, 1, 1,
-0.8364043, -0.01322709, -2.422843, 1, 0, 0, 1, 1,
-0.8317775, -1.147586, -1.073192, 1, 0, 0, 1, 1,
-0.8307455, -0.2997006, -1.614866, 1, 0, 0, 1, 1,
-0.8305333, -0.6799535, -1.98466, 1, 0, 0, 1, 1,
-0.8291984, 0.179046, -1.032435, 0, 0, 0, 1, 1,
-0.8220696, -1.080913, -2.408774, 0, 0, 0, 1, 1,
-0.8206933, 1.347062, -3.122761, 0, 0, 0, 1, 1,
-0.8202308, -1.889271, -1.545886, 0, 0, 0, 1, 1,
-0.8188044, -0.7958555, -2.405918, 0, 0, 0, 1, 1,
-0.8123314, 0.1520772, -0.3909136, 0, 0, 0, 1, 1,
-0.8111558, -1.133552, -2.999179, 0, 0, 0, 1, 1,
-0.8102107, -0.2934222, -3.381613, 1, 1, 1, 1, 1,
-0.8091231, 0.4514716, 1.460821, 1, 1, 1, 1, 1,
-0.8048997, 0.7321618, -1.229748, 1, 1, 1, 1, 1,
-0.7999379, -0.2892742, -1.856235, 1, 1, 1, 1, 1,
-0.7982098, 1.315901, -2.295909, 1, 1, 1, 1, 1,
-0.7972901, 2.006573, -2.612123, 1, 1, 1, 1, 1,
-0.7950458, -1.55052, -1.634217, 1, 1, 1, 1, 1,
-0.785318, 1.044684, 0.1163517, 1, 1, 1, 1, 1,
-0.785155, -1.4309, -1.586023, 1, 1, 1, 1, 1,
-0.7803025, 0.8009248, 0.8572834, 1, 1, 1, 1, 1,
-0.7753021, -0.2803159, -3.637621, 1, 1, 1, 1, 1,
-0.7746542, -0.1104395, 0.7364517, 1, 1, 1, 1, 1,
-0.7745807, -0.3855678, -1.717324, 1, 1, 1, 1, 1,
-0.774016, -0.5863597, -3.258901, 1, 1, 1, 1, 1,
-0.7726188, -1.50181, -2.223653, 1, 1, 1, 1, 1,
-0.7666364, 0.8660107, -0.1147183, 0, 0, 1, 1, 1,
-0.7648277, -0.07364503, -2.820704, 1, 0, 0, 1, 1,
-0.7629882, 0.2156362, -1.048172, 1, 0, 0, 1, 1,
-0.7625227, 0.3777418, 1.023237, 1, 0, 0, 1, 1,
-0.7610989, -1.301795, -3.669142, 1, 0, 0, 1, 1,
-0.7608848, -0.4972093, -3.453017, 1, 0, 0, 1, 1,
-0.7587574, 0.07261961, -2.414607, 0, 0, 0, 1, 1,
-0.7540032, 0.5105717, -1.536183, 0, 0, 0, 1, 1,
-0.7532804, -1.504802, -3.21338, 0, 0, 0, 1, 1,
-0.7500666, -1.507213, -3.564638, 0, 0, 0, 1, 1,
-0.7430307, 1.034697, -0.6256822, 0, 0, 0, 1, 1,
-0.7379257, 0.08210099, -0.9040705, 0, 0, 0, 1, 1,
-0.7371833, -0.6107863, -1.368616, 0, 0, 0, 1, 1,
-0.7279373, -0.4929197, -1.144689, 1, 1, 1, 1, 1,
-0.7265903, -1.308375, -3.644984, 1, 1, 1, 1, 1,
-0.7258086, -1.59256, -3.352723, 1, 1, 1, 1, 1,
-0.7249962, 0.7603261, 0.3448492, 1, 1, 1, 1, 1,
-0.7176355, 1.172066, 0.7476685, 1, 1, 1, 1, 1,
-0.7135996, 0.1891701, -2.474867, 1, 1, 1, 1, 1,
-0.709715, -0.675737, -3.450094, 1, 1, 1, 1, 1,
-0.7071671, 0.6420492, -0.5880738, 1, 1, 1, 1, 1,
-0.7058869, 0.3052342, -1.003497, 1, 1, 1, 1, 1,
-0.7042749, -1.371071, -3.486291, 1, 1, 1, 1, 1,
-0.7024609, -1.420187, -3.8581, 1, 1, 1, 1, 1,
-0.7024052, 1.661692, -1.581768, 1, 1, 1, 1, 1,
-0.7006608, 0.8444663, 0.8273717, 1, 1, 1, 1, 1,
-0.7005091, 0.6302707, 1.842124, 1, 1, 1, 1, 1,
-0.6984415, -0.747145, -1.216875, 1, 1, 1, 1, 1,
-0.6975125, 0.3737213, -0.2186047, 0, 0, 1, 1, 1,
-0.6965842, 0.2519607, 0.08359792, 1, 0, 0, 1, 1,
-0.69311, 1.915198, 0.6097766, 1, 0, 0, 1, 1,
-0.6923239, -0.6659452, -1.96242, 1, 0, 0, 1, 1,
-0.6864288, 0.7531515, -0.8890557, 1, 0, 0, 1, 1,
-0.6848005, 0.26203, -0.5541599, 1, 0, 0, 1, 1,
-0.67578, 1.161629, -1.177435, 0, 0, 0, 1, 1,
-0.6734674, 0.6662722, -0.6599038, 0, 0, 0, 1, 1,
-0.6669593, -0.5379868, -1.338485, 0, 0, 0, 1, 1,
-0.6537892, -1.98524, -5.445993, 0, 0, 0, 1, 1,
-0.6537437, -0.3585163, -0.7315197, 0, 0, 0, 1, 1,
-0.6503531, 1.1708, 0.04186847, 0, 0, 0, 1, 1,
-0.6496199, 0.4618944, -0.261455, 0, 0, 0, 1, 1,
-0.6456704, -0.7310197, -2.569546, 1, 1, 1, 1, 1,
-0.6409065, 0.6263289, -0.1175227, 1, 1, 1, 1, 1,
-0.638315, -0.3536547, -1.655017, 1, 1, 1, 1, 1,
-0.6331152, 0.7079123, -1.727535, 1, 1, 1, 1, 1,
-0.6283309, 0.734843, -0.8049771, 1, 1, 1, 1, 1,
-0.6252629, 0.5401359, -0.9423954, 1, 1, 1, 1, 1,
-0.6126818, 0.8794714, -0.7653784, 1, 1, 1, 1, 1,
-0.6124787, 1.364891, 0.1971412, 1, 1, 1, 1, 1,
-0.6103572, -0.8760717, -3.043502, 1, 1, 1, 1, 1,
-0.6063451, 0.7261764, -0.01693469, 1, 1, 1, 1, 1,
-0.6038114, 0.3998388, -0.3702222, 1, 1, 1, 1, 1,
-0.6036954, 1.239356, -0.8653271, 1, 1, 1, 1, 1,
-0.6005329, -1.163982, -2.187139, 1, 1, 1, 1, 1,
-0.5973424, 0.2868998, -1.121128, 1, 1, 1, 1, 1,
-0.5966063, 0.2786463, -0.8600585, 1, 1, 1, 1, 1,
-0.5924066, 1.293195, -0.8834461, 0, 0, 1, 1, 1,
-0.5910989, -1.894031, -3.885668, 1, 0, 0, 1, 1,
-0.5899024, -0.347584, -1.512137, 1, 0, 0, 1, 1,
-0.5886717, -0.0756439, -2.395307, 1, 0, 0, 1, 1,
-0.5849923, -1.465161, -2.946943, 1, 0, 0, 1, 1,
-0.5843149, 0.0767896, -2.68244, 1, 0, 0, 1, 1,
-0.5817268, 0.2144155, -0.6955541, 0, 0, 0, 1, 1,
-0.5715168, 0.2994078, -1.687388, 0, 0, 0, 1, 1,
-0.5675623, 1.308082, -0.4818428, 0, 0, 0, 1, 1,
-0.5632209, -0.1248225, -3.163552, 0, 0, 0, 1, 1,
-0.5614841, 0.2893926, -0.332154, 0, 0, 0, 1, 1,
-0.5553821, -0.4081979, -3.875958, 0, 0, 0, 1, 1,
-0.55217, -0.3060238, -0.4924924, 0, 0, 0, 1, 1,
-0.5498917, 0.09014531, -2.408572, 1, 1, 1, 1, 1,
-0.5428833, 0.9728247, -2.224752, 1, 1, 1, 1, 1,
-0.5425371, 1.291931, 0.2418325, 1, 1, 1, 1, 1,
-0.5382552, 0.5773054, -0.6979022, 1, 1, 1, 1, 1,
-0.5381628, -2.101312, -3.050136, 1, 1, 1, 1, 1,
-0.5302414, -0.9592156, -1.511767, 1, 1, 1, 1, 1,
-0.5221754, 0.5108351, 0.3126199, 1, 1, 1, 1, 1,
-0.5197108, -0.06327612, -2.191525, 1, 1, 1, 1, 1,
-0.5195996, 0.8511661, 1.500617, 1, 1, 1, 1, 1,
-0.5177518, -1.926774, -1.966079, 1, 1, 1, 1, 1,
-0.5139362, 0.3392559, -1.557421, 1, 1, 1, 1, 1,
-0.5073928, 2.346289, -0.7550079, 1, 1, 1, 1, 1,
-0.5039643, 1.442063, 2.420928, 1, 1, 1, 1, 1,
-0.5032543, 0.48824, 0.4076538, 1, 1, 1, 1, 1,
-0.5020149, 0.3612505, -0.4665645, 1, 1, 1, 1, 1,
-0.5001042, -0.3141516, -3.074575, 0, 0, 1, 1, 1,
-0.4957744, 0.6864626, -1.259061, 1, 0, 0, 1, 1,
-0.4944842, -1.04893, -1.993367, 1, 0, 0, 1, 1,
-0.4900525, -0.3155277, -2.507755, 1, 0, 0, 1, 1,
-0.487607, -0.8423554, -2.570143, 1, 0, 0, 1, 1,
-0.4839754, -2.919937, -2.482701, 1, 0, 0, 1, 1,
-0.4797731, 0.9057974, -1.497112, 0, 0, 0, 1, 1,
-0.4571212, 2.441859, 0.3016203, 0, 0, 0, 1, 1,
-0.4555295, 0.01546704, -0.719874, 0, 0, 0, 1, 1,
-0.455487, -1.474341, -2.959821, 0, 0, 0, 1, 1,
-0.4549951, -0.7587891, -3.015964, 0, 0, 0, 1, 1,
-0.4500763, -0.09444868, -1.83213, 0, 0, 0, 1, 1,
-0.4459865, 0.6078128, 0.539448, 0, 0, 0, 1, 1,
-0.4456062, -0.2649641, -0.5843213, 1, 1, 1, 1, 1,
-0.4410996, 0.8809094, -0.6780972, 1, 1, 1, 1, 1,
-0.4370832, -1.118222, -1.877117, 1, 1, 1, 1, 1,
-0.4349316, -1.088392, -1.61424, 1, 1, 1, 1, 1,
-0.4322222, 0.7247176, 0.2785079, 1, 1, 1, 1, 1,
-0.4280296, -0.2357145, -2.688244, 1, 1, 1, 1, 1,
-0.4278012, -0.4138066, -1.196026, 1, 1, 1, 1, 1,
-0.4272046, 0.08569676, -1.087743, 1, 1, 1, 1, 1,
-0.4228595, 0.5847545, -1.570872, 1, 1, 1, 1, 1,
-0.4192587, -0.1725462, 0.2528671, 1, 1, 1, 1, 1,
-0.4171831, 0.9015457, 0.4641497, 1, 1, 1, 1, 1,
-0.4150151, -0.7640795, -2.205797, 1, 1, 1, 1, 1,
-0.4140575, 0.7469007, -1.079329, 1, 1, 1, 1, 1,
-0.4065563, -0.6893709, -1.675107, 1, 1, 1, 1, 1,
-0.4039458, 0.4555016, -2.431504, 1, 1, 1, 1, 1,
-0.4020258, -0.7746285, -2.811012, 0, 0, 1, 1, 1,
-0.4017659, -0.05122103, -1.416942, 1, 0, 0, 1, 1,
-0.3969733, 1.534914, -0.7513963, 1, 0, 0, 1, 1,
-0.3928156, -1.343445, -1.703449, 1, 0, 0, 1, 1,
-0.3885378, -0.8694507, -3.288928, 1, 0, 0, 1, 1,
-0.3858078, -0.8360574, -1.773537, 1, 0, 0, 1, 1,
-0.3854455, -1.18111, -4.105927, 0, 0, 0, 1, 1,
-0.3828373, 2.222098, 1.738753, 0, 0, 0, 1, 1,
-0.3816164, 0.3253945, -1.878954, 0, 0, 0, 1, 1,
-0.376797, -0.3061236, -1.742613, 0, 0, 0, 1, 1,
-0.37514, -0.7692304, -2.651832, 0, 0, 0, 1, 1,
-0.3681052, -0.1477791, -1.179108, 0, 0, 0, 1, 1,
-0.3675596, 0.7711288, -0.8817631, 0, 0, 0, 1, 1,
-0.3674221, 0.5604582, -1.066431, 1, 1, 1, 1, 1,
-0.3651803, 0.1273748, -0.7566845, 1, 1, 1, 1, 1,
-0.3605188, 0.2389506, -0.3887331, 1, 1, 1, 1, 1,
-0.3596557, -2.392348, -2.97216, 1, 1, 1, 1, 1,
-0.3576508, -1.163873, -1.357173, 1, 1, 1, 1, 1,
-0.3558308, -1.264947, -0.1023679, 1, 1, 1, 1, 1,
-0.3557761, 1.232474, -1.069534, 1, 1, 1, 1, 1,
-0.3556587, -0.7016289, -2.842207, 1, 1, 1, 1, 1,
-0.3521416, 0.0903342, -0.1565709, 1, 1, 1, 1, 1,
-0.3505507, 1.791382, -0.0849106, 1, 1, 1, 1, 1,
-0.3451819, 1.336872, -2.076667, 1, 1, 1, 1, 1,
-0.3446195, 0.439808, -1.757388, 1, 1, 1, 1, 1,
-0.342482, 0.1581589, -1.629094, 1, 1, 1, 1, 1,
-0.3415194, 0.4683501, 1.311717, 1, 1, 1, 1, 1,
-0.3400227, -0.7228419, -2.074387, 1, 1, 1, 1, 1,
-0.3329745, 1.052434, -1.790547, 0, 0, 1, 1, 1,
-0.3327139, -0.7108199, -3.239747, 1, 0, 0, 1, 1,
-0.3319928, -0.1543994, -1.424445, 1, 0, 0, 1, 1,
-0.3295445, -0.6418539, -0.9924528, 1, 0, 0, 1, 1,
-0.3293284, 0.5328851, 1.785943, 1, 0, 0, 1, 1,
-0.3270149, 1.317516, -1.525501, 1, 0, 0, 1, 1,
-0.3254915, 0.8751857, 0.7840153, 0, 0, 0, 1, 1,
-0.3233083, -0.1933974, -1.593231, 0, 0, 0, 1, 1,
-0.3182522, 1.478996, -1.523463, 0, 0, 0, 1, 1,
-0.3178793, 1.337049, -1.338557, 0, 0, 0, 1, 1,
-0.3129648, -0.7449242, -1.868579, 0, 0, 0, 1, 1,
-0.3116941, -0.4533557, -1.620297, 0, 0, 0, 1, 1,
-0.3110987, -2.094699, -1.474689, 0, 0, 0, 1, 1,
-0.3109479, 0.3545851, 1.394404, 1, 1, 1, 1, 1,
-0.3088117, 0.2721756, -0.55896, 1, 1, 1, 1, 1,
-0.3080476, -0.8756649, -2.480431, 1, 1, 1, 1, 1,
-0.3060828, -1.812276, -4.009891, 1, 1, 1, 1, 1,
-0.3036824, -1.28652, -1.321994, 1, 1, 1, 1, 1,
-0.302476, 0.490049, -0.7720864, 1, 1, 1, 1, 1,
-0.2993011, 0.7341462, 0.7427486, 1, 1, 1, 1, 1,
-0.2982563, 1.172785, -1.632435, 1, 1, 1, 1, 1,
-0.2981484, 1.033747, 0.1052781, 1, 1, 1, 1, 1,
-0.293329, -1.649589, -3.023294, 1, 1, 1, 1, 1,
-0.2923099, -2.115875, -1.572008, 1, 1, 1, 1, 1,
-0.2922688, -1.979606, -3.241342, 1, 1, 1, 1, 1,
-0.291736, -1.240746, -3.742934, 1, 1, 1, 1, 1,
-0.2908759, -0.5263394, -2.393231, 1, 1, 1, 1, 1,
-0.2889657, 0.3642448, -0.9817747, 1, 1, 1, 1, 1,
-0.284969, -0.5699297, -0.9979127, 0, 0, 1, 1, 1,
-0.2830564, 0.2146539, -0.7931195, 1, 0, 0, 1, 1,
-0.2801828, 0.4337259, -0.2611337, 1, 0, 0, 1, 1,
-0.277005, 0.5385901, -1.002143, 1, 0, 0, 1, 1,
-0.2760697, 2.290759, 1.367977, 1, 0, 0, 1, 1,
-0.2738478, -0.5967023, -1.965807, 1, 0, 0, 1, 1,
-0.2720983, 0.9053153, -1.078079, 0, 0, 0, 1, 1,
-0.2711417, -0.4024549, -2.530177, 0, 0, 0, 1, 1,
-0.2566888, 3.52875, 0.06356674, 0, 0, 0, 1, 1,
-0.2545716, 0.2593111, 1.125955, 0, 0, 0, 1, 1,
-0.2525056, 0.0157095, -1.5911, 0, 0, 0, 1, 1,
-0.2515585, 0.1560354, -1.065503, 0, 0, 0, 1, 1,
-0.2505544, -0.6120017, -3.479904, 0, 0, 0, 1, 1,
-0.2479017, 1.326372, 1.187015, 1, 1, 1, 1, 1,
-0.2465313, -0.4727107, -2.842847, 1, 1, 1, 1, 1,
-0.2464186, -0.5008487, -4.520132, 1, 1, 1, 1, 1,
-0.2462717, -0.4017543, -3.746402, 1, 1, 1, 1, 1,
-0.2456616, 0.720666, 0.5261758, 1, 1, 1, 1, 1,
-0.2423427, -1.347929, -3.426857, 1, 1, 1, 1, 1,
-0.2401473, -0.8084239, -2.93836, 1, 1, 1, 1, 1,
-0.2372049, -0.06793377, -1.888896, 1, 1, 1, 1, 1,
-0.2355793, 1.331794, -0.2662702, 1, 1, 1, 1, 1,
-0.234772, 0.9398528, -1.688314, 1, 1, 1, 1, 1,
-0.2337103, -0.633541, -2.955906, 1, 1, 1, 1, 1,
-0.2311821, 0.7997836, 0.7617186, 1, 1, 1, 1, 1,
-0.2239656, -0.5578328, -2.500999, 1, 1, 1, 1, 1,
-0.2239035, -1.249566, -3.40782, 1, 1, 1, 1, 1,
-0.2236424, -0.4313107, -1.272353, 1, 1, 1, 1, 1,
-0.2232036, 0.1702131, -1.173736, 0, 0, 1, 1, 1,
-0.2138522, -1.484179, -2.175368, 1, 0, 0, 1, 1,
-0.2124726, -0.4709187, -1.568875, 1, 0, 0, 1, 1,
-0.209654, -1.209705, -2.906539, 1, 0, 0, 1, 1,
-0.2091658, 1.625039, 0.5163927, 1, 0, 0, 1, 1,
-0.205895, -0.7868464, -3.992308, 1, 0, 0, 1, 1,
-0.2007477, -0.3796159, -2.065777, 0, 0, 0, 1, 1,
-0.2001797, 0.6011272, -0.4401773, 0, 0, 0, 1, 1,
-0.1968108, -1.069593, -4.355743, 0, 0, 0, 1, 1,
-0.1903664, -1.611639, -1.069656, 0, 0, 0, 1, 1,
-0.1899264, -0.09220673, -0.822524, 0, 0, 0, 1, 1,
-0.188968, -0.5971155, -3.534732, 0, 0, 0, 1, 1,
-0.1873911, -0.7895467, -3.482199, 0, 0, 0, 1, 1,
-0.1839112, -0.3338688, -2.00282, 1, 1, 1, 1, 1,
-0.1764156, 0.01226308, 1.034325, 1, 1, 1, 1, 1,
-0.1755593, 0.1509062, -3.072008, 1, 1, 1, 1, 1,
-0.1725793, -2.972109, -2.685677, 1, 1, 1, 1, 1,
-0.17219, 0.2520483, 0.6844749, 1, 1, 1, 1, 1,
-0.1712521, -2.505214, -3.314288, 1, 1, 1, 1, 1,
-0.1697655, 0.2335542, -2.40526, 1, 1, 1, 1, 1,
-0.1696709, -1.680441, -2.523888, 1, 1, 1, 1, 1,
-0.1694864, -0.6636992, -2.453933, 1, 1, 1, 1, 1,
-0.1584576, 0.3471417, 0.9513773, 1, 1, 1, 1, 1,
-0.1573059, -1.819851, -2.564711, 1, 1, 1, 1, 1,
-0.1544921, -0.9781685, -4.28758, 1, 1, 1, 1, 1,
-0.1509328, 0.857177, 0.7229983, 1, 1, 1, 1, 1,
-0.1491546, 0.5637448, 0.04379634, 1, 1, 1, 1, 1,
-0.1479374, -2.314013, -2.598542, 1, 1, 1, 1, 1,
-0.1460104, 0.3131244, 1.266154, 0, 0, 1, 1, 1,
-0.1443073, -1.610613, -3.570657, 1, 0, 0, 1, 1,
-0.1423308, 0.863122, 0.5966083, 1, 0, 0, 1, 1,
-0.1400227, -0.6984449, -3.152433, 1, 0, 0, 1, 1,
-0.1389115, -1.480092, -3.004476, 1, 0, 0, 1, 1,
-0.1352948, 2.081581, -1.370108, 1, 0, 0, 1, 1,
-0.1266444, -1.33038, -3.704607, 0, 0, 0, 1, 1,
-0.1255066, -0.9977105, -3.506889, 0, 0, 0, 1, 1,
-0.1249136, -0.820824, -3.658493, 0, 0, 0, 1, 1,
-0.1223517, -0.09896564, -1.50718, 0, 0, 0, 1, 1,
-0.1221333, 0.5074012, -0.4883481, 0, 0, 0, 1, 1,
-0.1212043, 0.8208963, -1.422279, 0, 0, 0, 1, 1,
-0.1174766, 1.774044, -1.235688, 0, 0, 0, 1, 1,
-0.1138061, -1.163046, -1.673878, 1, 1, 1, 1, 1,
-0.111319, 0.9842958, -2.264808, 1, 1, 1, 1, 1,
-0.1077214, 1.244972, -1.92797, 1, 1, 1, 1, 1,
-0.1023788, 0.5110081, 1.573355, 1, 1, 1, 1, 1,
-0.1013842, 2.152436, -0.1117958, 1, 1, 1, 1, 1,
-0.09854805, 1.477425, -0.5248824, 1, 1, 1, 1, 1,
-0.09278005, 1.311248, 1.359216, 1, 1, 1, 1, 1,
-0.09121577, -1.758743, -3.273525, 1, 1, 1, 1, 1,
-0.09079401, 0.3224087, -0.4756424, 1, 1, 1, 1, 1,
-0.08794071, 0.07205692, -0.3326702, 1, 1, 1, 1, 1,
-0.08386326, 0.2436584, 0.4902289, 1, 1, 1, 1, 1,
-0.08275753, -2.318071, -3.650384, 1, 1, 1, 1, 1,
-0.08232737, 0.6978619, -0.4923915, 1, 1, 1, 1, 1,
-0.08225065, 0.9993362, -2.217047, 1, 1, 1, 1, 1,
-0.07231393, -0.5394933, -3.335753, 1, 1, 1, 1, 1,
-0.06871851, -0.544314, -2.232811, 0, 0, 1, 1, 1,
-0.06449983, 1.065467, 0.4304471, 1, 0, 0, 1, 1,
-0.05962852, 2.087785, -1.717112, 1, 0, 0, 1, 1,
-0.0578893, 0.2836365, 0.7397121, 1, 0, 0, 1, 1,
-0.05260893, 1.448776, 1.009797, 1, 0, 0, 1, 1,
-0.05183241, 0.1556667, 0.4397088, 1, 0, 0, 1, 1,
-0.04420051, -0.3900655, -2.550645, 0, 0, 0, 1, 1,
-0.04170612, -0.5074399, -1.138848, 0, 0, 0, 1, 1,
-0.03596495, -1.312915, -3.268772, 0, 0, 0, 1, 1,
-0.03158484, 0.1692379, 1.580107, 0, 0, 0, 1, 1,
-0.03156165, 1.308002, 0.2194777, 0, 0, 0, 1, 1,
-0.03110617, 1.602847, 1.534185, 0, 0, 0, 1, 1,
-0.02681972, -0.6489439, -2.924688, 0, 0, 0, 1, 1,
-0.02547914, 2.195992, -1.489183, 1, 1, 1, 1, 1,
-0.02461302, -0.7943868, -3.387339, 1, 1, 1, 1, 1,
-0.02011267, 0.5230476, -1.422929, 1, 1, 1, 1, 1,
-0.01735625, 1.149912, 0.7331449, 1, 1, 1, 1, 1,
-0.0151715, -1.372759, -1.900533, 1, 1, 1, 1, 1,
-0.009599554, 0.357131, -0.3036888, 1, 1, 1, 1, 1,
-0.008038118, 0.3478589, -2.056202, 1, 1, 1, 1, 1,
-0.007291739, -1.308764, -2.950098, 1, 1, 1, 1, 1,
-0.005200583, 0.7238896, -0.9286093, 1, 1, 1, 1, 1,
-0.004696061, 1.379644, 0.06416409, 1, 1, 1, 1, 1,
-0.003068652, 0.2660994, 1.251594, 1, 1, 1, 1, 1,
-0.001271517, -1.316535, -3.77687, 1, 1, 1, 1, 1,
0.01337374, -0.1455038, 3.467052, 1, 1, 1, 1, 1,
0.01712634, 0.9664611, 0.03445926, 1, 1, 1, 1, 1,
0.0228305, -1.169772, 2.903223, 1, 1, 1, 1, 1,
0.0266604, -2.403517, 2.800415, 0, 0, 1, 1, 1,
0.02726463, -2.443886, 2.772527, 1, 0, 0, 1, 1,
0.03210702, 1.459692, -0.731914, 1, 0, 0, 1, 1,
0.03722135, 0.5928909, 0.4045738, 1, 0, 0, 1, 1,
0.04552882, 1.25338, 0.1270247, 1, 0, 0, 1, 1,
0.04619972, 0.9189453, 0.7442164, 1, 0, 0, 1, 1,
0.04871168, -0.6466894, 2.720609, 0, 0, 0, 1, 1,
0.05002795, -0.421728, 4.351981, 0, 0, 0, 1, 1,
0.0506526, -0.4873998, 3.757674, 0, 0, 0, 1, 1,
0.05171449, -0.8809084, 2.292544, 0, 0, 0, 1, 1,
0.05555383, 0.4368891, 1.040199, 0, 0, 0, 1, 1,
0.06608494, 0.8039795, -0.6989194, 0, 0, 0, 1, 1,
0.07097203, -0.3311878, 1.741989, 0, 0, 0, 1, 1,
0.07228613, -2.439343, 3.282524, 1, 1, 1, 1, 1,
0.0743725, -0.3158017, 1.058203, 1, 1, 1, 1, 1,
0.07589721, -0.03767987, 0.5651914, 1, 1, 1, 1, 1,
0.07686345, -0.6313401, 4.251687, 1, 1, 1, 1, 1,
0.07786257, -0.1969421, 2.608356, 1, 1, 1, 1, 1,
0.08057187, -0.9069964, 1.626245, 1, 1, 1, 1, 1,
0.08181144, -1.247737, 2.204355, 1, 1, 1, 1, 1,
0.08464196, -0.3611175, 4.523258, 1, 1, 1, 1, 1,
0.08725319, 1.739799, -0.168259, 1, 1, 1, 1, 1,
0.0915909, -0.5236627, 1.846901, 1, 1, 1, 1, 1,
0.09167434, -0.8778989, 3.524087, 1, 1, 1, 1, 1,
0.09386767, 0.5038909, 0.2405255, 1, 1, 1, 1, 1,
0.09407113, 0.2519713, 0.3090005, 1, 1, 1, 1, 1,
0.09576426, -0.6396088, 3.594815, 1, 1, 1, 1, 1,
0.09754678, 0.1133762, -0.7737427, 1, 1, 1, 1, 1,
0.1006507, 0.0601914, 0.5732806, 0, 0, 1, 1, 1,
0.1011486, -0.245221, 1.74881, 1, 0, 0, 1, 1,
0.1018544, 2.227707, 0.3597701, 1, 0, 0, 1, 1,
0.1040239, -1.268536, 5.653044, 1, 0, 0, 1, 1,
0.1094839, -0.1502246, 3.498734, 1, 0, 0, 1, 1,
0.1104614, -0.04749418, 2.848732, 1, 0, 0, 1, 1,
0.1139694, 0.05178832, 2.005508, 0, 0, 0, 1, 1,
0.1150725, -0.9099284, 4.835806, 0, 0, 0, 1, 1,
0.1240791, -0.9522499, 3.161661, 0, 0, 0, 1, 1,
0.1248776, -1.688387, 3.329687, 0, 0, 0, 1, 1,
0.1270222, -0.1017358, 2.052379, 0, 0, 0, 1, 1,
0.1277401, 0.3248057, 2.213911, 0, 0, 0, 1, 1,
0.1305218, -0.309093, 2.4, 0, 0, 0, 1, 1,
0.1322307, -0.6389248, 3.051854, 1, 1, 1, 1, 1,
0.135952, -1.721663, 4.490485, 1, 1, 1, 1, 1,
0.1381726, 1.343464, 0.8781829, 1, 1, 1, 1, 1,
0.1397027, -0.1344992, 1.868442, 1, 1, 1, 1, 1,
0.1418925, 1.322916, 0.5605819, 1, 1, 1, 1, 1,
0.1440656, 0.04150392, -0.0362942, 1, 1, 1, 1, 1,
0.1469478, 0.8077657, -0.441445, 1, 1, 1, 1, 1,
0.1470533, 1.742117, -1.609999, 1, 1, 1, 1, 1,
0.1492197, -0.01160577, 1.638961, 1, 1, 1, 1, 1,
0.1524051, 0.5387796, -1.576706, 1, 1, 1, 1, 1,
0.1538343, -2.573423, 4.783408, 1, 1, 1, 1, 1,
0.1573095, 2.326542, -1.40137, 1, 1, 1, 1, 1,
0.1613586, 0.4939694, -0.09081197, 1, 1, 1, 1, 1,
0.1616304, -1.144156, 4.369753, 1, 1, 1, 1, 1,
0.1623972, 1.134939, 0.7765129, 1, 1, 1, 1, 1,
0.1651119, -0.5074058, 2.202245, 0, 0, 1, 1, 1,
0.1672835, 2.357603, -0.1999867, 1, 0, 0, 1, 1,
0.1673688, -0.03227486, 2.86562, 1, 0, 0, 1, 1,
0.1675044, -2.312062, 3.450642, 1, 0, 0, 1, 1,
0.1729644, 0.5352204, 0.1961528, 1, 0, 0, 1, 1,
0.1731947, 2.299419, 0.51092, 1, 0, 0, 1, 1,
0.1749783, 0.2768588, 0.8871101, 0, 0, 0, 1, 1,
0.1781611, 0.7092748, 0.9806896, 0, 0, 0, 1, 1,
0.1849991, -0.7074059, 2.099629, 0, 0, 0, 1, 1,
0.1977251, -0.5645141, 3.490051, 0, 0, 0, 1, 1,
0.2030686, -0.3325653, 3.574146, 0, 0, 0, 1, 1,
0.2033669, -1.004388, 2.359879, 0, 0, 0, 1, 1,
0.204752, 1.154198, -0.5861948, 0, 0, 0, 1, 1,
0.2091389, -1.112083, 2.20139, 1, 1, 1, 1, 1,
0.214529, -0.5051966, 2.180763, 1, 1, 1, 1, 1,
0.2205393, 0.6755159, -0.2294666, 1, 1, 1, 1, 1,
0.2219572, 0.4975177, 0.08803934, 1, 1, 1, 1, 1,
0.2224379, 1.301326, -0.2207393, 1, 1, 1, 1, 1,
0.2264327, 1.191401, -0.6547772, 1, 1, 1, 1, 1,
0.2306808, -0.1029973, 2.619283, 1, 1, 1, 1, 1,
0.2343239, -1.127377, 3.521917, 1, 1, 1, 1, 1,
0.2363765, 0.9444817, -0.1705506, 1, 1, 1, 1, 1,
0.236746, -0.5709332, 1.5369, 1, 1, 1, 1, 1,
0.2383265, -1.451539, 3.468884, 1, 1, 1, 1, 1,
0.2423721, 1.125295, 0.7534958, 1, 1, 1, 1, 1,
0.2516752, -1.11493, 2.055463, 1, 1, 1, 1, 1,
0.2531937, -0.5362065, 2.04301, 1, 1, 1, 1, 1,
0.2594238, -1.175772, 4.769007, 1, 1, 1, 1, 1,
0.2640875, 0.2808435, 0.6366499, 0, 0, 1, 1, 1,
0.2679011, 0.6461294, 2.854795, 1, 0, 0, 1, 1,
0.2693923, 0.5185187, -0.4673854, 1, 0, 0, 1, 1,
0.2716618, -1.018662, 1.637015, 1, 0, 0, 1, 1,
0.2719402, 0.5148869, 0.6133473, 1, 0, 0, 1, 1,
0.2764018, 1.456358, -0.0473594, 1, 0, 0, 1, 1,
0.2766438, -0.1741063, 0.8974199, 0, 0, 0, 1, 1,
0.2773172, 0.1220481, 2.112185, 0, 0, 0, 1, 1,
0.2784682, 1.974283, 0.2929688, 0, 0, 0, 1, 1,
0.279149, 0.2032999, 1.545519, 0, 0, 0, 1, 1,
0.2819615, -0.3322718, 0.7834426, 0, 0, 0, 1, 1,
0.2820305, -0.1068501, 3.534218, 0, 0, 0, 1, 1,
0.2828534, 1.306003, 0.7007802, 0, 0, 0, 1, 1,
0.2860752, -0.5833811, 1.783067, 1, 1, 1, 1, 1,
0.2872568, 0.1097773, 0.7922629, 1, 1, 1, 1, 1,
0.2882104, 0.754633, 1.300597, 1, 1, 1, 1, 1,
0.2889131, 0.006293922, 0.3990378, 1, 1, 1, 1, 1,
0.2902777, 0.6909922, 1.062649, 1, 1, 1, 1, 1,
0.2927198, 0.09808318, 0.1767298, 1, 1, 1, 1, 1,
0.2946758, 0.4029878, 2.343646, 1, 1, 1, 1, 1,
0.2959227, -1.977214, 3.081076, 1, 1, 1, 1, 1,
0.2960097, -0.7874948, 3.649632, 1, 1, 1, 1, 1,
0.3015569, -1.419306, 2.891394, 1, 1, 1, 1, 1,
0.3018278, 1.706838, -1.245698, 1, 1, 1, 1, 1,
0.3027968, -0.1166485, 2.907697, 1, 1, 1, 1, 1,
0.3047062, -0.5465083, 1.631338, 1, 1, 1, 1, 1,
0.3059676, -0.6959407, 3.032079, 1, 1, 1, 1, 1,
0.3069533, -1.336212, 2.434608, 1, 1, 1, 1, 1,
0.3093088, 0.2698386, 2.700373, 0, 0, 1, 1, 1,
0.3103082, 0.4437359, -0.2150499, 1, 0, 0, 1, 1,
0.3145907, -1.952352, 3.16625, 1, 0, 0, 1, 1,
0.3153425, -1.028142, 1.669809, 1, 0, 0, 1, 1,
0.3165151, 1.908942, -1.073314, 1, 0, 0, 1, 1,
0.3302932, -0.9947277, 1.873598, 1, 0, 0, 1, 1,
0.3426373, 1.055215, -0.7514703, 0, 0, 0, 1, 1,
0.3435341, 1.84567, 1.10567, 0, 0, 0, 1, 1,
0.351256, -0.8447432, 2.830156, 0, 0, 0, 1, 1,
0.3541124, 1.328252, 0.5743994, 0, 0, 0, 1, 1,
0.3542189, -1.415505, 0.9406618, 0, 0, 0, 1, 1,
0.3549458, -0.585111, 4.185489, 0, 0, 0, 1, 1,
0.3578286, 0.3692943, 2.123312, 0, 0, 0, 1, 1,
0.3578534, -0.8372583, 1.760108, 1, 1, 1, 1, 1,
0.3589498, 0.1679015, 0.9546511, 1, 1, 1, 1, 1,
0.3657013, -0.9565448, 0.5878435, 1, 1, 1, 1, 1,
0.3682922, 1.220828, 0.1488729, 1, 1, 1, 1, 1,
0.3696811, 0.5254902, -0.446633, 1, 1, 1, 1, 1,
0.3699757, 0.0483562, 2.552824, 1, 1, 1, 1, 1,
0.3711331, -1.32118, 3.363349, 1, 1, 1, 1, 1,
0.3730614, -2.324651, 2.179135, 1, 1, 1, 1, 1,
0.3754837, 0.668995, 1.166109, 1, 1, 1, 1, 1,
0.3763205, 0.4111439, 1.22676, 1, 1, 1, 1, 1,
0.3780037, 0.9456231, -0.5506212, 1, 1, 1, 1, 1,
0.3791904, 1.100477, 0.9634451, 1, 1, 1, 1, 1,
0.379429, 0.5305781, 0.01219573, 1, 1, 1, 1, 1,
0.3821905, 0.1147005, 2.818315, 1, 1, 1, 1, 1,
0.3852034, -0.1658963, 1.619457, 1, 1, 1, 1, 1,
0.3898531, 2.019785, 1.184008, 0, 0, 1, 1, 1,
0.3925827, -1.173343, 2.788467, 1, 0, 0, 1, 1,
0.3927254, 1.195571, -0.7927156, 1, 0, 0, 1, 1,
0.3930791, -0.1953791, 2.741742, 1, 0, 0, 1, 1,
0.3933168, -0.5667545, 3.770871, 1, 0, 0, 1, 1,
0.3955215, -0.1749518, 3.455943, 1, 0, 0, 1, 1,
0.3975407, 0.9004192, 1.699375, 0, 0, 0, 1, 1,
0.4010292, -1.075118, 2.881924, 0, 0, 0, 1, 1,
0.4028935, 0.4928223, 1.092069, 0, 0, 0, 1, 1,
0.4037313, 1.689221, 0.215204, 0, 0, 0, 1, 1,
0.4042734, 0.814693, 0.8036427, 0, 0, 0, 1, 1,
0.4065321, -1.424501, 3.751884, 0, 0, 0, 1, 1,
0.4132369, 1.847579, 0.700857, 0, 0, 0, 1, 1,
0.4135322, 0.2586088, 2.223783, 1, 1, 1, 1, 1,
0.4150895, -1.241594, 3.420208, 1, 1, 1, 1, 1,
0.4151041, 0.07624836, 0.4984323, 1, 1, 1, 1, 1,
0.4249033, -0.0671982, 1.733485, 1, 1, 1, 1, 1,
0.4281505, -0.7102685, 3.480452, 1, 1, 1, 1, 1,
0.4284381, -0.5404091, 1.230596, 1, 1, 1, 1, 1,
0.4288721, 0.3265501, 0.5866873, 1, 1, 1, 1, 1,
0.4323262, -0.6415455, 2.680283, 1, 1, 1, 1, 1,
0.4330084, -0.3205133, 3.500278, 1, 1, 1, 1, 1,
0.4362566, -0.1252119, 1.742874, 1, 1, 1, 1, 1,
0.4416006, 0.8505538, -1.736481, 1, 1, 1, 1, 1,
0.4434167, 0.9023358, 1.505846, 1, 1, 1, 1, 1,
0.4445522, -0.08301909, 2.047873, 1, 1, 1, 1, 1,
0.4451246, -0.04218533, 1.492123, 1, 1, 1, 1, 1,
0.4457974, -2.547493, 2.295465, 1, 1, 1, 1, 1,
0.4520274, 0.5535908, 0.7806691, 0, 0, 1, 1, 1,
0.4553887, -2.301127, 3.639832, 1, 0, 0, 1, 1,
0.4557151, -0.6159505, 1.94296, 1, 0, 0, 1, 1,
0.4558824, -0.753485, 1.354909, 1, 0, 0, 1, 1,
0.4582268, 1.494715, 2.071866, 1, 0, 0, 1, 1,
0.4585257, -0.2239151, 1.339996, 1, 0, 0, 1, 1,
0.4591376, -0.355239, 3.004688, 0, 0, 0, 1, 1,
0.4622676, -0.2736545, 2.923751, 0, 0, 0, 1, 1,
0.4728171, -0.5353883, 3.441592, 0, 0, 0, 1, 1,
0.4761742, -2.372009, 2.112014, 0, 0, 0, 1, 1,
0.4799297, -0.8763842, 2.555064, 0, 0, 0, 1, 1,
0.4858682, -0.8521437, 3.837704, 0, 0, 0, 1, 1,
0.4877246, 0.8031064, -1.016984, 0, 0, 0, 1, 1,
0.4893951, 0.9040024, 1.106409, 1, 1, 1, 1, 1,
0.493221, 0.5084627, -0.1393379, 1, 1, 1, 1, 1,
0.4946507, -0.01486835, 2.668254, 1, 1, 1, 1, 1,
0.4947349, 1.068475, -0.719081, 1, 1, 1, 1, 1,
0.4989659, 0.2300263, 2.340908, 1, 1, 1, 1, 1,
0.5024178, 0.05188981, 2.237961, 1, 1, 1, 1, 1,
0.5055559, 0.2470227, 2.044464, 1, 1, 1, 1, 1,
0.511652, -2.525583, 3.102358, 1, 1, 1, 1, 1,
0.5180976, -1.000817, 1.72715, 1, 1, 1, 1, 1,
0.5216444, -0.04708637, 1.7132, 1, 1, 1, 1, 1,
0.5217223, -1.14181, 2.831822, 1, 1, 1, 1, 1,
0.5246127, 2.546191, 0.3779491, 1, 1, 1, 1, 1,
0.5266368, -0.7592938, 0.949909, 1, 1, 1, 1, 1,
0.5272663, -0.7022563, 2.561307, 1, 1, 1, 1, 1,
0.5295819, -0.07639258, 0.2478048, 1, 1, 1, 1, 1,
0.5436168, 0.4092782, 2.066113, 0, 0, 1, 1, 1,
0.5442936, -0.7578176, 1.736578, 1, 0, 0, 1, 1,
0.5506938, -0.1218639, 2.686504, 1, 0, 0, 1, 1,
0.5508928, 1.841971, -1.232649, 1, 0, 0, 1, 1,
0.5535489, 1.292293, 0.4185293, 1, 0, 0, 1, 1,
0.5547826, 0.5295309, 2.5852, 1, 0, 0, 1, 1,
0.5549364, 0.907237, -0.1936069, 0, 0, 0, 1, 1,
0.5551894, 0.4439656, 1.007983, 0, 0, 0, 1, 1,
0.5564116, -0.3462569, 2.66214, 0, 0, 0, 1, 1,
0.5565775, -0.5268762, 2.869551, 0, 0, 0, 1, 1,
0.5573757, -1.356909, 0.9630346, 0, 0, 0, 1, 1,
0.5701551, 1.955425, 2.069122, 0, 0, 0, 1, 1,
0.5721486, 0.1728724, -0.08798055, 0, 0, 0, 1, 1,
0.5735081, 1.012896, 1.022941, 1, 1, 1, 1, 1,
0.5745025, 1.49774, 0.6760218, 1, 1, 1, 1, 1,
0.5773863, 1.340522, 0.2747553, 1, 1, 1, 1, 1,
0.5775057, 1.187623, 0.4301767, 1, 1, 1, 1, 1,
0.5805917, 0.4116271, 0.8775321, 1, 1, 1, 1, 1,
0.5861339, 0.620648, 0.478071, 1, 1, 1, 1, 1,
0.588993, -0.3816918, 1.744798, 1, 1, 1, 1, 1,
0.5892887, 0.4112865, 0.08912306, 1, 1, 1, 1, 1,
0.5910773, -0.6196753, 2.797649, 1, 1, 1, 1, 1,
0.5927956, 1.597323, 2.352435, 1, 1, 1, 1, 1,
0.5929546, -0.5508054, 1.943893, 1, 1, 1, 1, 1,
0.5947766, -0.3535125, 1.837862, 1, 1, 1, 1, 1,
0.5951363, 1.729438, 0.2518233, 1, 1, 1, 1, 1,
0.5967864, -1.940825, 2.703325, 1, 1, 1, 1, 1,
0.599718, 0.3688331, 0.2230908, 1, 1, 1, 1, 1,
0.6004367, 0.132284, 1.418299, 0, 0, 1, 1, 1,
0.6067882, 0.2745214, 0.2882921, 1, 0, 0, 1, 1,
0.6092827, -0.1752788, 3.920126, 1, 0, 0, 1, 1,
0.6139449, 0.2974745, 1.918667, 1, 0, 0, 1, 1,
0.6164737, 0.160089, 2.723407, 1, 0, 0, 1, 1,
0.6165026, 0.335833, 2.181992, 1, 0, 0, 1, 1,
0.6185279, -0.5557906, 2.475552, 0, 0, 0, 1, 1,
0.6186879, 0.7188777, -0.4382714, 0, 0, 0, 1, 1,
0.6212938, 1.098544, -0.1090633, 0, 0, 0, 1, 1,
0.6269333, 1.771483, -0.3008974, 0, 0, 0, 1, 1,
0.6270422, 1.240825, 1.329836, 0, 0, 0, 1, 1,
0.6326721, 0.6957512, 1.534399, 0, 0, 0, 1, 1,
0.6342227, 0.01585414, 1.87874, 0, 0, 0, 1, 1,
0.6385542, 0.1908325, 0.3725569, 1, 1, 1, 1, 1,
0.6442502, -2.1369, 3.92432, 1, 1, 1, 1, 1,
0.6533028, -0.6929222, 1.924825, 1, 1, 1, 1, 1,
0.6534812, 0.3350293, -0.5686737, 1, 1, 1, 1, 1,
0.6602675, -0.5521726, 0.1467293, 1, 1, 1, 1, 1,
0.66756, -1.197821, 2.924485, 1, 1, 1, 1, 1,
0.6704683, -1.523717, 2.098532, 1, 1, 1, 1, 1,
0.6729932, 0.4375286, 0.5388204, 1, 1, 1, 1, 1,
0.6743473, 1.856219, 0.1447746, 1, 1, 1, 1, 1,
0.6801648, 1.624722, 1.832681, 1, 1, 1, 1, 1,
0.6873196, -0.06999039, 0.7065905, 1, 1, 1, 1, 1,
0.6884499, -2.088054, 2.610195, 1, 1, 1, 1, 1,
0.6909449, 2.060017, 0.8178556, 1, 1, 1, 1, 1,
0.6912472, 0.7687016, -0.1478963, 1, 1, 1, 1, 1,
0.6953756, 0.3869063, 0.4741369, 1, 1, 1, 1, 1,
0.7033207, 2.03056, -1.546854, 0, 0, 1, 1, 1,
0.7044942, 0.1530326, -0.8672764, 1, 0, 0, 1, 1,
0.7051196, 1.589773, 1.303891, 1, 0, 0, 1, 1,
0.7065624, 0.5465481, -1.370488, 1, 0, 0, 1, 1,
0.7085552, 0.1055542, 2.026228, 1, 0, 0, 1, 1,
0.7113826, -0.5175295, 2.502217, 1, 0, 0, 1, 1,
0.7122133, 0.166953, 1.629211, 0, 0, 0, 1, 1,
0.7157153, -0.2219926, 0.9580903, 0, 0, 0, 1, 1,
0.7170409, -1.370178, 3.823151, 0, 0, 0, 1, 1,
0.7213953, -0.9154738, 3.167041, 0, 0, 0, 1, 1,
0.7311231, 0.4493611, 2.053431, 0, 0, 0, 1, 1,
0.732078, 1.792698, 0.8797004, 0, 0, 0, 1, 1,
0.7322937, 1.574262, -1.02749, 0, 0, 0, 1, 1,
0.7325622, 0.07223549, -0.5572895, 1, 1, 1, 1, 1,
0.7348342, -0.5548955, 2.860099, 1, 1, 1, 1, 1,
0.7385222, -0.6781326, 2.493415, 1, 1, 1, 1, 1,
0.7418469, 0.9527926, 0.2618048, 1, 1, 1, 1, 1,
0.7449242, 1.251771, 0.2289793, 1, 1, 1, 1, 1,
0.7455163, -0.6369587, 3.221946, 1, 1, 1, 1, 1,
0.7461223, -0.734567, 3.215675, 1, 1, 1, 1, 1,
0.7467799, 0.8660826, 0.4008195, 1, 1, 1, 1, 1,
0.7467957, -0.6901176, 1.481084, 1, 1, 1, 1, 1,
0.7532108, 1.141147, -0.2089129, 1, 1, 1, 1, 1,
0.7547231, -0.3398879, 3.451992, 1, 1, 1, 1, 1,
0.7560383, -0.009030677, 2.828374, 1, 1, 1, 1, 1,
0.7608598, -0.157782, 2.982355, 1, 1, 1, 1, 1,
0.7635285, -0.08707505, 3.115248, 1, 1, 1, 1, 1,
0.7659614, -0.02804196, 1.424307, 1, 1, 1, 1, 1,
0.7664404, 0.644698, 1.891254, 0, 0, 1, 1, 1,
0.7681929, 0.5741635, -0.2076843, 1, 0, 0, 1, 1,
0.7684017, -0.2531814, 1.804817, 1, 0, 0, 1, 1,
0.7715836, 0.4381232, -0.002653669, 1, 0, 0, 1, 1,
0.7723683, -1.152557, 1.360606, 1, 0, 0, 1, 1,
0.7768967, -0.3043277, 1.109647, 1, 0, 0, 1, 1,
0.7833779, 0.7841217, -0.1499109, 0, 0, 0, 1, 1,
0.7894816, 0.1561229, 0.2714365, 0, 0, 0, 1, 1,
0.7968583, -0.8954711, 0.6046185, 0, 0, 0, 1, 1,
0.7997729, -0.5777492, 1.074281, 0, 0, 0, 1, 1,
0.8005021, 0.7495528, -0.7007579, 0, 0, 0, 1, 1,
0.8007718, 0.3262869, 0.5141364, 0, 0, 0, 1, 1,
0.8023481, 1.132972, 1.285702, 0, 0, 0, 1, 1,
0.8040044, -0.6703083, 2.281744, 1, 1, 1, 1, 1,
0.8069869, -0.1394965, 1.258724, 1, 1, 1, 1, 1,
0.8091406, 0.05533218, -0.21102, 1, 1, 1, 1, 1,
0.819644, -0.8658408, 2.195064, 1, 1, 1, 1, 1,
0.8242456, 2.342377, -0.4157366, 1, 1, 1, 1, 1,
0.8288486, 0.01403374, 1.001696, 1, 1, 1, 1, 1,
0.8293839, 2.408551, 0.7300328, 1, 1, 1, 1, 1,
0.8293895, -0.8416804, 3.431926, 1, 1, 1, 1, 1,
0.831745, -0.3141705, 2.718693, 1, 1, 1, 1, 1,
0.8331334, 1.392418, 2.224317, 1, 1, 1, 1, 1,
0.8354105, 1.161459, 0.1810146, 1, 1, 1, 1, 1,
0.8358154, -0.3198505, 1.606217, 1, 1, 1, 1, 1,
0.8379678, 0.3837453, 1.282203, 1, 1, 1, 1, 1,
0.848052, -0.2723971, 3.872125, 1, 1, 1, 1, 1,
0.8513252, -0.5791083, 1.911765, 1, 1, 1, 1, 1,
0.8539847, 0.3614291, 2.217504, 0, 0, 1, 1, 1,
0.8540429, 1.060816, 0.8659556, 1, 0, 0, 1, 1,
0.8543252, -0.1761588, 2.9761, 1, 0, 0, 1, 1,
0.862344, 0.2207799, 1.283137, 1, 0, 0, 1, 1,
0.8666832, 0.6098847, -0.4480185, 1, 0, 0, 1, 1,
0.8684984, 0.9079533, 1.070934, 1, 0, 0, 1, 1,
0.8714061, -1.074428, 0.6693397, 0, 0, 0, 1, 1,
0.8746029, 0.9619768, 1.582189, 0, 0, 0, 1, 1,
0.8749979, 0.6132929, 1.58453, 0, 0, 0, 1, 1,
0.8756356, 1.172759, 1.597659, 0, 0, 0, 1, 1,
0.8809062, 1.243653, 1.980961, 0, 0, 0, 1, 1,
0.8813254, 0.4163365, 0.7081167, 0, 0, 0, 1, 1,
0.8825503, -0.3329957, 3.153443, 0, 0, 0, 1, 1,
0.8871303, 1.418164, 0.8736785, 1, 1, 1, 1, 1,
0.8959116, 0.6316226, -0.7893661, 1, 1, 1, 1, 1,
0.9020933, -0.1373801, 1.378745, 1, 1, 1, 1, 1,
0.9190406, 0.6260621, -0.05655445, 1, 1, 1, 1, 1,
0.923227, 1.179069, 0.8123981, 1, 1, 1, 1, 1,
0.9272537, 2.239256, 0.8593898, 1, 1, 1, 1, 1,
0.9517621, -0.3272518, 1.007321, 1, 1, 1, 1, 1,
0.9634407, 1.471806, -0.4250994, 1, 1, 1, 1, 1,
0.9639693, 1.464548, 0.09690977, 1, 1, 1, 1, 1,
0.9757748, 1.249119, -1.70183, 1, 1, 1, 1, 1,
0.977431, 0.9404444, 2.188514, 1, 1, 1, 1, 1,
0.9796085, 2.319329, 1.139753, 1, 1, 1, 1, 1,
0.982732, 0.2695757, 1.332988, 1, 1, 1, 1, 1,
0.9827915, -0.7332327, 1.814664, 1, 1, 1, 1, 1,
0.9838528, 0.6337571, 0.1409674, 1, 1, 1, 1, 1,
0.9840804, -1.551565, 1.685735, 0, 0, 1, 1, 1,
0.9849154, 1.214334, 1.608006, 1, 0, 0, 1, 1,
0.9853276, 1.027742, 2.33433, 1, 0, 0, 1, 1,
0.9901029, 1.613434, 1.394088, 1, 0, 0, 1, 1,
0.9924061, -0.09403577, 2.459522, 1, 0, 0, 1, 1,
0.9996246, -0.7062296, 3.548092, 1, 0, 0, 1, 1,
1.002149, -1.350251, 2.678257, 0, 0, 0, 1, 1,
1.007698, 0.0007791403, 1.685008, 0, 0, 0, 1, 1,
1.009881, -1.366576, 1.766071, 0, 0, 0, 1, 1,
1.010557, 1.56774, 0.2089435, 0, 0, 0, 1, 1,
1.014129, 0.6181281, 1.596794, 0, 0, 0, 1, 1,
1.017088, 0.2475097, 1.733469, 0, 0, 0, 1, 1,
1.021577, -0.1405791, 2.029916, 0, 0, 0, 1, 1,
1.027177, 0.9502271, 1.320483, 1, 1, 1, 1, 1,
1.029083, -1.44756, 1.518884, 1, 1, 1, 1, 1,
1.029924, 0.5547795, 1.875845, 1, 1, 1, 1, 1,
1.032186, 0.3167191, 1.483101, 1, 1, 1, 1, 1,
1.043592, -0.1881979, 0.4096634, 1, 1, 1, 1, 1,
1.049305, -0.08565844, 2.164016, 1, 1, 1, 1, 1,
1.051571, -0.6352303, 1.841012, 1, 1, 1, 1, 1,
1.059126, -0.873772, 1.117769, 1, 1, 1, 1, 1,
1.060125, 0.7860096, 1.605083, 1, 1, 1, 1, 1,
1.062904, -1.264044, 3.902154, 1, 1, 1, 1, 1,
1.063733, -0.05127685, 1.595826, 1, 1, 1, 1, 1,
1.064539, -0.8811698, 1.233934, 1, 1, 1, 1, 1,
1.064889, -0.5892364, 2.204681, 1, 1, 1, 1, 1,
1.074477, 1.77245, 0.394398, 1, 1, 1, 1, 1,
1.076022, -1.316379, 2.641526, 1, 1, 1, 1, 1,
1.077577, -0.8322796, 2.46721, 0, 0, 1, 1, 1,
1.080454, 0.7753401, -0.2160878, 1, 0, 0, 1, 1,
1.087443, 1.043195, 0.7546596, 1, 0, 0, 1, 1,
1.093123, -0.284401, 1.583778, 1, 0, 0, 1, 1,
1.094011, -0.5483613, 2.046793, 1, 0, 0, 1, 1,
1.095237, -0.6525726, 1.883572, 1, 0, 0, 1, 1,
1.096413, 0.334536, 1.947379, 0, 0, 0, 1, 1,
1.102375, 0.2107887, 1.340167, 0, 0, 0, 1, 1,
1.103876, 0.6604499, -0.5907665, 0, 0, 0, 1, 1,
1.10595, 1.224024, 1.318498, 0, 0, 0, 1, 1,
1.110788, 0.0793284, 1.650295, 0, 0, 0, 1, 1,
1.112563, -0.04114413, 3.630068, 0, 0, 0, 1, 1,
1.120547, 0.3300426, 0.296354, 0, 0, 0, 1, 1,
1.12093, -1.237277, 0.358852, 1, 1, 1, 1, 1,
1.124516, 1.800878, 2.69328, 1, 1, 1, 1, 1,
1.128401, 0.6881579, 1.745706, 1, 1, 1, 1, 1,
1.133454, -1.653097, 2.726486, 1, 1, 1, 1, 1,
1.144145, -0.008980809, 1.324387, 1, 1, 1, 1, 1,
1.149437, 0.06964836, 0.7918982, 1, 1, 1, 1, 1,
1.158645, 0.3316555, 1.720051, 1, 1, 1, 1, 1,
1.161076, -1.261689, 1.604251, 1, 1, 1, 1, 1,
1.171133, -1.451607, 3.603447, 1, 1, 1, 1, 1,
1.171191, 0.9568125, 1.113584, 1, 1, 1, 1, 1,
1.176524, 0.3138145, 0.7297559, 1, 1, 1, 1, 1,
1.188833, 0.2723845, 1.082841, 1, 1, 1, 1, 1,
1.18969, 1.656394, 0.3812858, 1, 1, 1, 1, 1,
1.192295, -1.25915, 0.8633156, 1, 1, 1, 1, 1,
1.194566, -1.496889, 1.94614, 1, 1, 1, 1, 1,
1.195799, 1.482399, 0.9295517, 0, 0, 1, 1, 1,
1.197855, 1.517072, 0.2719346, 1, 0, 0, 1, 1,
1.204008, -1.141463, 3.49826, 1, 0, 0, 1, 1,
1.206335, -0.5049216, 1.599748, 1, 0, 0, 1, 1,
1.211225, 0.006749944, -0.7559855, 1, 0, 0, 1, 1,
1.214693, 0.5219228, 2.076987, 1, 0, 0, 1, 1,
1.219556, 0.3407465, 1.766721, 0, 0, 0, 1, 1,
1.226847, 1.17419, -0.4127071, 0, 0, 0, 1, 1,
1.229478, 0.1287731, 2.512942, 0, 0, 0, 1, 1,
1.232464, 0.9907252, -0.1140436, 0, 0, 0, 1, 1,
1.247268, 0.2846503, 2.409203, 0, 0, 0, 1, 1,
1.250735, 1.620267, 0.3652354, 0, 0, 0, 1, 1,
1.255115, -0.634321, 2.182437, 0, 0, 0, 1, 1,
1.28558, 1.442266, -0.05032792, 1, 1, 1, 1, 1,
1.289935, -0.4052867, 2.751966, 1, 1, 1, 1, 1,
1.302306, 0.6204267, 0.0282257, 1, 1, 1, 1, 1,
1.305316, 0.01662637, 2.766796, 1, 1, 1, 1, 1,
1.307029, -1.490611, 2.336159, 1, 1, 1, 1, 1,
1.309474, 0.7924477, 2.263072, 1, 1, 1, 1, 1,
1.330928, 1.726327, 0.01594261, 1, 1, 1, 1, 1,
1.331945, 0.4570708, 1.303604, 1, 1, 1, 1, 1,
1.333187, 0.1124338, 2.802644, 1, 1, 1, 1, 1,
1.33349, 1.623157, 0.8245311, 1, 1, 1, 1, 1,
1.355337, 0.4958105, -0.5768957, 1, 1, 1, 1, 1,
1.365272, -1.298026, 2.416583, 1, 1, 1, 1, 1,
1.380511, 0.3703784, 1.617646, 1, 1, 1, 1, 1,
1.3808, 0.09392871, 2.889803, 1, 1, 1, 1, 1,
1.382166, 0.004296618, -0.5335531, 1, 1, 1, 1, 1,
1.384291, -0.2841268, -0.5897726, 0, 0, 1, 1, 1,
1.391279, 0.04112621, 0.1967306, 1, 0, 0, 1, 1,
1.394071, 0.6669549, 0.5299894, 1, 0, 0, 1, 1,
1.395714, -0.7293233, 1.165345, 1, 0, 0, 1, 1,
1.411018, -1.88781, 0.7982935, 1, 0, 0, 1, 1,
1.41207, 0.6181107, -0.835842, 1, 0, 0, 1, 1,
1.423507, -0.9827741, 1.541877, 0, 0, 0, 1, 1,
1.423846, 1.855017, 0.2336241, 0, 0, 0, 1, 1,
1.426091, -1.450576, 3.420691, 0, 0, 0, 1, 1,
1.43366, 0.4486798, 2.940414, 0, 0, 0, 1, 1,
1.435484, 1.18947, 0.6300074, 0, 0, 0, 1, 1,
1.438313, 1.701365, 1.999624, 0, 0, 0, 1, 1,
1.443891, 0.7300164, 0.7622786, 0, 0, 0, 1, 1,
1.449687, -0.3855129, 1.016281, 1, 1, 1, 1, 1,
1.457669, 0.9858516, 0.7781982, 1, 1, 1, 1, 1,
1.46083, -1.497422, 2.802464, 1, 1, 1, 1, 1,
1.472286, -0.548579, 1.865829, 1, 1, 1, 1, 1,
1.472489, 1.532056, 0.5189622, 1, 1, 1, 1, 1,
1.482508, -0.6290946, 3.403098, 1, 1, 1, 1, 1,
1.515178, 2.893592, 0.1695267, 1, 1, 1, 1, 1,
1.54744, -0.03590586, 0.8921414, 1, 1, 1, 1, 1,
1.573965, -2.528394, 1.632423, 1, 1, 1, 1, 1,
1.582288, -1.044035, 1.95518, 1, 1, 1, 1, 1,
1.603254, -0.07457715, 2.871116, 1, 1, 1, 1, 1,
1.608111, -0.001324389, 2.343441, 1, 1, 1, 1, 1,
1.620882, 0.3207331, 0.756296, 1, 1, 1, 1, 1,
1.630514, -1.022089, 3.005606, 1, 1, 1, 1, 1,
1.634493, 0.1805527, 0.5052394, 1, 1, 1, 1, 1,
1.639711, -0.320703, 1.581843, 0, 0, 1, 1, 1,
1.658681, 2.20243, 1.44049, 1, 0, 0, 1, 1,
1.662456, -1.069817, 0.7959229, 1, 0, 0, 1, 1,
1.682761, 1.319448, 0.6537491, 1, 0, 0, 1, 1,
1.704242, -0.9315983, 2.920611, 1, 0, 0, 1, 1,
1.705744, 1.415284, 2.368437, 1, 0, 0, 1, 1,
1.706234, -1.548757, 0.5210432, 0, 0, 0, 1, 1,
1.728364, 0.04133959, 1.543578, 0, 0, 0, 1, 1,
1.736233, -0.8978729, 1.130765, 0, 0, 0, 1, 1,
1.748376, -0.2084202, 1.268946, 0, 0, 0, 1, 1,
1.762912, 1.054897, 0.4548628, 0, 0, 0, 1, 1,
1.768344, 1.014381, 0.16772, 0, 0, 0, 1, 1,
1.774426, 0.9286366, -0.6406756, 0, 0, 0, 1, 1,
1.805315, -1.763735, 3.886792, 1, 1, 1, 1, 1,
1.806268, 0.732614, 1.115195, 1, 1, 1, 1, 1,
1.809211, 0.661491, 0.4588355, 1, 1, 1, 1, 1,
1.824996, 1.072116, 0.9313138, 1, 1, 1, 1, 1,
1.844376, -0.1316793, 0.8147712, 1, 1, 1, 1, 1,
1.874714, 0.6983284, 0.7165092, 1, 1, 1, 1, 1,
1.881799, 1.42874, 0.5761024, 1, 1, 1, 1, 1,
1.898594, 0.04517535, 0.7396968, 1, 1, 1, 1, 1,
1.903131, -0.1935072, 1.603949, 1, 1, 1, 1, 1,
1.917911, -0.7899094, 2.010243, 1, 1, 1, 1, 1,
1.924225, 1.500891, 1.105734, 1, 1, 1, 1, 1,
1.937967, 0.4255909, 2.565683, 1, 1, 1, 1, 1,
1.94699, -2.189967, 3.267924, 1, 1, 1, 1, 1,
1.954658, 1.379546, -0.01232091, 1, 1, 1, 1, 1,
1.954904, -0.05270353, 3.245447, 1, 1, 1, 1, 1,
1.967392, -0.2087791, 1.918236, 0, 0, 1, 1, 1,
1.989555, 0.032754, 2.077634, 1, 0, 0, 1, 1,
2.000412, -0.7784616, 3.058919, 1, 0, 0, 1, 1,
2.036167, 0.1179764, 2.13281, 1, 0, 0, 1, 1,
2.047636, 0.4300613, 1.692193, 1, 0, 0, 1, 1,
2.050372, -0.155007, 1.344292, 1, 0, 0, 1, 1,
2.056709, -0.4899766, 1.517132, 0, 0, 0, 1, 1,
2.096353, -0.8066545, 1.019142, 0, 0, 0, 1, 1,
2.115801, 0.4166069, 2.119857, 0, 0, 0, 1, 1,
2.130404, 0.6828219, -0.3257, 0, 0, 0, 1, 1,
2.165109, 0.5202899, 3.094003, 0, 0, 0, 1, 1,
2.210932, -0.5001155, 1.541319, 0, 0, 0, 1, 1,
2.21614, 0.7632071, 1.025074, 0, 0, 0, 1, 1,
2.219806, -1.581644, 1.794211, 1, 1, 1, 1, 1,
2.396776, 0.01809573, 2.577422, 1, 1, 1, 1, 1,
2.422226, -1.159989, -0.04673887, 1, 1, 1, 1, 1,
2.452041, 1.14451, 0.9800156, 1, 1, 1, 1, 1,
2.534559, 2.130185, 0.9405591, 1, 1, 1, 1, 1,
2.535853, -0.9861789, 0.9712363, 1, 1, 1, 1, 1,
3.098893, -1.150799, 0.5041856, 1, 1, 1, 1, 1
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
var radius = 9.746531;
var distance = 34.23428;
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
mvMatrix.translate( 0.0898788, -0.2783207, -0.1035256 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.23428);
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
