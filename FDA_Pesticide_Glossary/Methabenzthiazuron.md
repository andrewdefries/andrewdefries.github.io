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
-3.214581, -0.5335755, -2.283723, 1, 0, 0, 1,
-2.954608, -0.3179179, -1.263341, 1, 0.007843138, 0, 1,
-2.906263, -1.093764, -2.133074, 1, 0.01176471, 0, 1,
-2.830498, -0.6538133, -2.602024, 1, 0.01960784, 0, 1,
-2.726663, -0.78896, -2.838058, 1, 0.02352941, 0, 1,
-2.524112, -1.695462, -3.463266, 1, 0.03137255, 0, 1,
-2.44817, 1.503865, -1.164281, 1, 0.03529412, 0, 1,
-2.417435, -0.8751005, -1.751729, 1, 0.04313726, 0, 1,
-2.376664, -1.411357, -2.393396, 1, 0.04705882, 0, 1,
-2.374926, -0.4024623, -0.8125531, 1, 0.05490196, 0, 1,
-2.362667, -0.3372374, -1.757231, 1, 0.05882353, 0, 1,
-2.358408, -0.8126987, -2.193386, 1, 0.06666667, 0, 1,
-2.292026, 0.9352779, -2.454267, 1, 0.07058824, 0, 1,
-2.275833, -0.2369765, -2.092288, 1, 0.07843138, 0, 1,
-2.275748, 0.450524, -0.6353446, 1, 0.08235294, 0, 1,
-2.237359, -0.6602141, -2.459992, 1, 0.09019608, 0, 1,
-2.234792, -0.7837804, -2.874713, 1, 0.09411765, 0, 1,
-2.231658, 0.9832342, -1.207011, 1, 0.1019608, 0, 1,
-2.219734, 0.6133458, -2.150451, 1, 0.1098039, 0, 1,
-2.219202, -1.537825, -3.179551, 1, 0.1137255, 0, 1,
-2.213179, -1.379174, -3.341707, 1, 0.1215686, 0, 1,
-2.211874, 0.7772425, -2.711787, 1, 0.1254902, 0, 1,
-2.210069, 1.044568, -2.041472, 1, 0.1333333, 0, 1,
-2.207508, -0.7568817, -2.598086, 1, 0.1372549, 0, 1,
-2.193918, -0.8319705, -1.678706, 1, 0.145098, 0, 1,
-2.173334, 0.03787977, -1.223851, 1, 0.1490196, 0, 1,
-2.129016, 1.467337, -0.5236027, 1, 0.1568628, 0, 1,
-2.110386, 2.034125, -1.595257, 1, 0.1607843, 0, 1,
-2.099805, 0.8751048, -0.275783, 1, 0.1686275, 0, 1,
-2.061465, 0.9244592, -0.7521158, 1, 0.172549, 0, 1,
-1.991181, -0.9631099, -2.262857, 1, 0.1803922, 0, 1,
-1.965141, -0.1655225, -1.672009, 1, 0.1843137, 0, 1,
-1.956556, -0.4979595, -2.305479, 1, 0.1921569, 0, 1,
-1.95144, 1.310485, -1.08446, 1, 0.1960784, 0, 1,
-1.930093, -0.7704889, -4.432352, 1, 0.2039216, 0, 1,
-1.92409, 0.6867407, -1.937392, 1, 0.2117647, 0, 1,
-1.917214, 0.9381785, -2.718881, 1, 0.2156863, 0, 1,
-1.883708, 0.9491193, -1.139853, 1, 0.2235294, 0, 1,
-1.853083, -0.02881591, -1.461399, 1, 0.227451, 0, 1,
-1.845599, -0.6222958, -1.673249, 1, 0.2352941, 0, 1,
-1.842488, 0.3305503, -1.461841, 1, 0.2392157, 0, 1,
-1.835801, 1.048806, -1.284368, 1, 0.2470588, 0, 1,
-1.835206, -1.807235, -2.022579, 1, 0.2509804, 0, 1,
-1.806679, 1.808894, -1.343774, 1, 0.2588235, 0, 1,
-1.803702, -1.201966, -1.86323, 1, 0.2627451, 0, 1,
-1.801712, 0.180993, -2.908132, 1, 0.2705882, 0, 1,
-1.771052, 0.1250057, -1.317735, 1, 0.2745098, 0, 1,
-1.77102, -0.01684515, -2.065168, 1, 0.282353, 0, 1,
-1.750864, -0.4996262, -1.218657, 1, 0.2862745, 0, 1,
-1.747291, -2.695887, -1.936772, 1, 0.2941177, 0, 1,
-1.737646, -0.1289308, -1.151852, 1, 0.3019608, 0, 1,
-1.722769, -0.806818, -3.490854, 1, 0.3058824, 0, 1,
-1.715958, -0.8225755, -2.731048, 1, 0.3137255, 0, 1,
-1.70981, -0.1547383, -2.151616, 1, 0.3176471, 0, 1,
-1.706611, -1.484735, -2.047232, 1, 0.3254902, 0, 1,
-1.665324, -0.2788562, 0.0501451, 1, 0.3294118, 0, 1,
-1.662229, -0.1598963, -0.3699712, 1, 0.3372549, 0, 1,
-1.661832, -1.148433, -2.704904, 1, 0.3411765, 0, 1,
-1.658795, 1.725996, -0.9435313, 1, 0.3490196, 0, 1,
-1.650378, 0.4710673, -1.236688, 1, 0.3529412, 0, 1,
-1.650021, 1.272142, -2.000959, 1, 0.3607843, 0, 1,
-1.634039, 0.2180487, -1.448681, 1, 0.3647059, 0, 1,
-1.618955, 0.5679288, 0.5438275, 1, 0.372549, 0, 1,
-1.610492, 0.8935186, 0.7826422, 1, 0.3764706, 0, 1,
-1.609704, 0.01232599, -2.160808, 1, 0.3843137, 0, 1,
-1.608202, 0.6804729, -0.6053617, 1, 0.3882353, 0, 1,
-1.605772, -0.1827323, -3.140293, 1, 0.3960784, 0, 1,
-1.596016, 0.5392141, -1.264918, 1, 0.4039216, 0, 1,
-1.585896, 0.9620135, -0.1969707, 1, 0.4078431, 0, 1,
-1.575659, 2.648418, -0.4653673, 1, 0.4156863, 0, 1,
-1.575387, -0.0440885, 0.603774, 1, 0.4196078, 0, 1,
-1.572466, 0.3468719, -1.579807, 1, 0.427451, 0, 1,
-1.563668, -0.2334383, -1.402229, 1, 0.4313726, 0, 1,
-1.563612, 0.5712156, -2.175477, 1, 0.4392157, 0, 1,
-1.561978, -1.812119, -2.63012, 1, 0.4431373, 0, 1,
-1.558329, -0.4073746, -0.6577184, 1, 0.4509804, 0, 1,
-1.549684, -0.7870009, -2.177652, 1, 0.454902, 0, 1,
-1.540534, 0.1427169, -1.144838, 1, 0.4627451, 0, 1,
-1.520932, -1.072821, -2.493936, 1, 0.4666667, 0, 1,
-1.520763, -1.350154, -0.904247, 1, 0.4745098, 0, 1,
-1.516924, 0.7942638, -0.3745284, 1, 0.4784314, 0, 1,
-1.510833, -0.3863968, -1.690742, 1, 0.4862745, 0, 1,
-1.50109, -0.9588115, -2.661619, 1, 0.4901961, 0, 1,
-1.498345, -0.2247745, -1.190203, 1, 0.4980392, 0, 1,
-1.472025, -0.3930991, -1.327939, 1, 0.5058824, 0, 1,
-1.46763, -0.4291263, -0.494495, 1, 0.509804, 0, 1,
-1.465691, -1.201956, -1.146209, 1, 0.5176471, 0, 1,
-1.465598, 0.3168817, -2.220208, 1, 0.5215687, 0, 1,
-1.459699, 1.190181, -0.9987004, 1, 0.5294118, 0, 1,
-1.449722, -0.9864722, -2.058535, 1, 0.5333334, 0, 1,
-1.448554, -0.739661, -2.839221, 1, 0.5411765, 0, 1,
-1.446472, 0.2641006, -1.768756, 1, 0.5450981, 0, 1,
-1.443523, 1.707299, -1.606901, 1, 0.5529412, 0, 1,
-1.438342, 0.9765065, -0.9410141, 1, 0.5568628, 0, 1,
-1.425861, -0.3845934, -2.285797, 1, 0.5647059, 0, 1,
-1.422298, 1.010312, -1.593596, 1, 0.5686275, 0, 1,
-1.413395, -1.892386, -1.957615, 1, 0.5764706, 0, 1,
-1.404995, -0.8427633, -2.511632, 1, 0.5803922, 0, 1,
-1.400851, 0.08600335, -1.126477, 1, 0.5882353, 0, 1,
-1.379419, -0.8964675, -3.600918, 1, 0.5921569, 0, 1,
-1.377731, -0.1351802, -2.938315, 1, 0.6, 0, 1,
-1.374076, 0.1034181, -1.367269, 1, 0.6078432, 0, 1,
-1.373201, 0.2112822, -1.44778, 1, 0.6117647, 0, 1,
-1.361298, -0.8843791, -3.789058, 1, 0.6196079, 0, 1,
-1.341845, -3.010444, -2.335257, 1, 0.6235294, 0, 1,
-1.341249, 1.097045, 1.331875, 1, 0.6313726, 0, 1,
-1.340792, 0.8791519, -1.253811, 1, 0.6352941, 0, 1,
-1.334929, -0.2484864, -1.227102, 1, 0.6431373, 0, 1,
-1.333757, 1.187662, 1.180516, 1, 0.6470588, 0, 1,
-1.31802, -0.741666, -1.68178, 1, 0.654902, 0, 1,
-1.315367, -0.2971309, -1.836311, 1, 0.6588235, 0, 1,
-1.308092, -2.848131, -2.840894, 1, 0.6666667, 0, 1,
-1.307831, 0.8566087, -1.125913, 1, 0.6705883, 0, 1,
-1.301507, 1.26884, -0.6441063, 1, 0.6784314, 0, 1,
-1.30038, 0.2955502, 1.90856, 1, 0.682353, 0, 1,
-1.296877, -1.284222, -2.180695, 1, 0.6901961, 0, 1,
-1.296756, 0.5204406, -2.37332, 1, 0.6941177, 0, 1,
-1.292388, 0.9741672, -0.0351589, 1, 0.7019608, 0, 1,
-1.291639, -0.6561418, -2.198838, 1, 0.7098039, 0, 1,
-1.288733, 0.80071, -0.4797929, 1, 0.7137255, 0, 1,
-1.284425, -0.5760324, -0.7381031, 1, 0.7215686, 0, 1,
-1.273764, -0.1783623, -2.626428, 1, 0.7254902, 0, 1,
-1.270775, -1.400925, -3.091796, 1, 0.7333333, 0, 1,
-1.25436, 0.7800623, -2.621499, 1, 0.7372549, 0, 1,
-1.251803, -0.7259026, -0.5312692, 1, 0.7450981, 0, 1,
-1.24484, 0.1170102, -3.175439, 1, 0.7490196, 0, 1,
-1.237609, 0.9361641, -1.768511, 1, 0.7568628, 0, 1,
-1.234397, 1.232852, -0.9664072, 1, 0.7607843, 0, 1,
-1.231306, 1.529376, -0.9840238, 1, 0.7686275, 0, 1,
-1.222605, -0.7360193, -0.7587915, 1, 0.772549, 0, 1,
-1.211087, 0.4771512, -0.9409125, 1, 0.7803922, 0, 1,
-1.207037, 0.8815486, -1.157024, 1, 0.7843137, 0, 1,
-1.20191, 0.3495305, -0.6011318, 1, 0.7921569, 0, 1,
-1.189944, 0.6334646, -1.617582, 1, 0.7960784, 0, 1,
-1.184769, 0.8491474, -1.797267, 1, 0.8039216, 0, 1,
-1.173268, -0.05609018, 0.2451374, 1, 0.8117647, 0, 1,
-1.17265, 0.7517382, -0.236341, 1, 0.8156863, 0, 1,
-1.16945, -0.2360293, -0.7701492, 1, 0.8235294, 0, 1,
-1.169252, -2.008233, -2.584356, 1, 0.827451, 0, 1,
-1.155309, -0.3921125, -1.294208, 1, 0.8352941, 0, 1,
-1.150256, -0.3386314, -2.372926, 1, 0.8392157, 0, 1,
-1.144195, -0.1406026, -2.433255, 1, 0.8470588, 0, 1,
-1.135712, -1.357947, -1.538493, 1, 0.8509804, 0, 1,
-1.12394, 0.6907458, 0.3319245, 1, 0.8588235, 0, 1,
-1.113377, -2.482114, -4.194368, 1, 0.8627451, 0, 1,
-1.112794, -1.252555, -1.642672, 1, 0.8705882, 0, 1,
-1.112278, -0.8147751, -2.431513, 1, 0.8745098, 0, 1,
-1.110052, -1.253535, -2.867341, 1, 0.8823529, 0, 1,
-1.106136, -2.001334, -4.771034, 1, 0.8862745, 0, 1,
-1.092962, 0.4303132, -0.5622613, 1, 0.8941177, 0, 1,
-1.092178, -0.7013716, -1.988352, 1, 0.8980392, 0, 1,
-1.089128, -1.18285, -2.728612, 1, 0.9058824, 0, 1,
-1.08902, 0.7896625, -2.185102, 1, 0.9137255, 0, 1,
-1.088867, -0.4091997, -1.81818, 1, 0.9176471, 0, 1,
-1.088041, 0.06118273, -0.2165511, 1, 0.9254902, 0, 1,
-1.085055, 0.3158056, -1.971072, 1, 0.9294118, 0, 1,
-1.080701, 0.5664279, -2.732641, 1, 0.9372549, 0, 1,
-1.080083, 0.2821935, -1.547604, 1, 0.9411765, 0, 1,
-1.076561, 0.5502043, -0.3579631, 1, 0.9490196, 0, 1,
-1.057351, -1.14281, -2.200953, 1, 0.9529412, 0, 1,
-1.057115, 0.6847306, -0.5405725, 1, 0.9607843, 0, 1,
-1.040716, -0.3989616, -1.991488, 1, 0.9647059, 0, 1,
-1.040084, -0.9995924, -2.299296, 1, 0.972549, 0, 1,
-1.039959, 0.9583132, -1.097065, 1, 0.9764706, 0, 1,
-1.039003, -1.306765, -1.867559, 1, 0.9843137, 0, 1,
-1.036455, 0.1555805, -2.216856, 1, 0.9882353, 0, 1,
-1.033745, 0.2087004, -2.135527, 1, 0.9960784, 0, 1,
-1.033742, 1.230198, -2.577495, 0.9960784, 1, 0, 1,
-1.033502, 0.4302863, -2.035016, 0.9921569, 1, 0, 1,
-1.03, 0.565368, -1.413847, 0.9843137, 1, 0, 1,
-1.028238, 2.208633, -1.847652, 0.9803922, 1, 0, 1,
-1.028037, 1.519903, -1.449614, 0.972549, 1, 0, 1,
-1.025851, -0.8459772, -1.414319, 0.9686275, 1, 0, 1,
-1.024124, -1.252183, -3.238039, 0.9607843, 1, 0, 1,
-1.015642, -0.5787488, -3.580151, 0.9568627, 1, 0, 1,
-1.013313, 0.1848925, -1.922942, 0.9490196, 1, 0, 1,
-1.009741, -0.003344746, -2.97731, 0.945098, 1, 0, 1,
-1.002146, -0.08385517, -0.1744895, 0.9372549, 1, 0, 1,
-1.001708, 1.066462, 0.8164532, 0.9333333, 1, 0, 1,
-1.000462, -0.6641076, -2.359485, 0.9254902, 1, 0, 1,
-0.9978872, 2.583737, -2.48706, 0.9215686, 1, 0, 1,
-0.9954717, -0.5385544, -1.915697, 0.9137255, 1, 0, 1,
-0.9927944, 0.1384709, -2.722988, 0.9098039, 1, 0, 1,
-0.9925904, 0.1717482, -1.606189, 0.9019608, 1, 0, 1,
-0.9891401, -0.9159385, -3.274909, 0.8941177, 1, 0, 1,
-0.9874848, -0.2036773, -2.084708, 0.8901961, 1, 0, 1,
-0.9846457, 0.3134933, -0.2466995, 0.8823529, 1, 0, 1,
-0.9843579, 0.4230043, -0.7776005, 0.8784314, 1, 0, 1,
-0.9682807, -0.3168979, -1.391007, 0.8705882, 1, 0, 1,
-0.9665701, -1.986586, -5.942834, 0.8666667, 1, 0, 1,
-0.9663842, 0.2747976, 0.7263376, 0.8588235, 1, 0, 1,
-0.9660609, 0.9478585, 0.7868137, 0.854902, 1, 0, 1,
-0.9647223, -0.7365429, -1.824142, 0.8470588, 1, 0, 1,
-0.9492885, -0.5581096, -2.6812, 0.8431373, 1, 0, 1,
-0.9484367, 0.6925825, -0.03742731, 0.8352941, 1, 0, 1,
-0.9395406, 0.7533749, -0.5997921, 0.8313726, 1, 0, 1,
-0.938845, 0.1195838, -3.239581, 0.8235294, 1, 0, 1,
-0.9316688, 0.1863706, -0.7096442, 0.8196079, 1, 0, 1,
-0.9284477, 0.07504234, -2.569448, 0.8117647, 1, 0, 1,
-0.9197724, 0.2237469, -1.481188, 0.8078431, 1, 0, 1,
-0.9174238, -1.942636, -4.133143, 0.8, 1, 0, 1,
-0.913677, 0.9035362, -0.5195798, 0.7921569, 1, 0, 1,
-0.910263, 1.213257, -1.228043, 0.7882353, 1, 0, 1,
-0.9079335, 0.4229615, 1.270428, 0.7803922, 1, 0, 1,
-0.9012545, -0.04878445, -2.756227, 0.7764706, 1, 0, 1,
-0.9009268, -2.131735, -2.302447, 0.7686275, 1, 0, 1,
-0.8938867, -0.5158256, -3.296094, 0.7647059, 1, 0, 1,
-0.8896194, 1.701466, -1.112032, 0.7568628, 1, 0, 1,
-0.881489, -0.2232656, -2.239129, 0.7529412, 1, 0, 1,
-0.8773878, 0.3905452, -1.709167, 0.7450981, 1, 0, 1,
-0.8771465, -0.04780186, -0.4609104, 0.7411765, 1, 0, 1,
-0.870908, 1.388867, -0.5492979, 0.7333333, 1, 0, 1,
-0.8703222, 0.4342824, -0.1504187, 0.7294118, 1, 0, 1,
-0.8685859, 1.283729, -0.8599047, 0.7215686, 1, 0, 1,
-0.8684888, -2.401814, -0.6187105, 0.7176471, 1, 0, 1,
-0.8679615, -0.8391721, -2.573062, 0.7098039, 1, 0, 1,
-0.863142, -0.1062017, -1.05578, 0.7058824, 1, 0, 1,
-0.856336, -1.174862, -3.181544, 0.6980392, 1, 0, 1,
-0.8512607, -0.5130547, -1.018533, 0.6901961, 1, 0, 1,
-0.8486595, -0.8060995, -3.604862, 0.6862745, 1, 0, 1,
-0.8480039, -0.1272522, -1.629383, 0.6784314, 1, 0, 1,
-0.8479677, -0.4286956, -1.106319, 0.6745098, 1, 0, 1,
-0.8466047, -0.5147424, -1.490648, 0.6666667, 1, 0, 1,
-0.8404004, 0.4769075, -0.6650546, 0.6627451, 1, 0, 1,
-0.8399102, 0.6893726, -1.429674, 0.654902, 1, 0, 1,
-0.8352591, 1.381457, -0.4145961, 0.6509804, 1, 0, 1,
-0.8330005, 0.2910244, -0.5295215, 0.6431373, 1, 0, 1,
-0.8304782, -0.6238018, -0.660758, 0.6392157, 1, 0, 1,
-0.8294736, -0.9202005, -3.275841, 0.6313726, 1, 0, 1,
-0.8260631, -0.4663061, -3.750524, 0.627451, 1, 0, 1,
-0.8236699, 0.3035509, -1.004378, 0.6196079, 1, 0, 1,
-0.8210187, -1.008529, -2.624032, 0.6156863, 1, 0, 1,
-0.8168769, -0.3925639, -2.063466, 0.6078432, 1, 0, 1,
-0.8107013, -0.432244, -2.230687, 0.6039216, 1, 0, 1,
-0.8006261, -0.08302794, -1.914668, 0.5960785, 1, 0, 1,
-0.7901987, -0.7990367, -3.62796, 0.5882353, 1, 0, 1,
-0.788806, 0.5337293, -1.853819, 0.5843138, 1, 0, 1,
-0.7868695, 1.1781, -1.009308, 0.5764706, 1, 0, 1,
-0.7860402, 1.155833, -0.347297, 0.572549, 1, 0, 1,
-0.7823679, -1.530387, -2.76982, 0.5647059, 1, 0, 1,
-0.7782592, -0.7410014, -2.395626, 0.5607843, 1, 0, 1,
-0.7765243, -2.865807, -3.074617, 0.5529412, 1, 0, 1,
-0.7698779, -1.552036, -3.343876, 0.5490196, 1, 0, 1,
-0.7562223, 0.1821157, -1.235733, 0.5411765, 1, 0, 1,
-0.7446615, 1.472251, -1.359132, 0.5372549, 1, 0, 1,
-0.7378002, -0.7058663, -3.295135, 0.5294118, 1, 0, 1,
-0.7330253, -0.4971485, -1.882983, 0.5254902, 1, 0, 1,
-0.7316005, -2.975949, -1.335489, 0.5176471, 1, 0, 1,
-0.7253049, -0.9287015, -3.025769, 0.5137255, 1, 0, 1,
-0.7235667, -0.1739054, -1.879739, 0.5058824, 1, 0, 1,
-0.7226002, -0.9566963, -2.797102, 0.5019608, 1, 0, 1,
-0.7206658, -0.1677386, -3.159862, 0.4941176, 1, 0, 1,
-0.7174464, -1.415193, -3.050296, 0.4862745, 1, 0, 1,
-0.7166959, 0.5336784, -0.7153134, 0.4823529, 1, 0, 1,
-0.7151076, 0.3762139, -1.141149, 0.4745098, 1, 0, 1,
-0.7080433, -0.1457877, -1.048601, 0.4705882, 1, 0, 1,
-0.7073559, 0.242338, -1.275534, 0.4627451, 1, 0, 1,
-0.706641, 1.184536, -2.242947, 0.4588235, 1, 0, 1,
-0.6975157, -0.1269896, -1.838153, 0.4509804, 1, 0, 1,
-0.6965468, -0.4031833, -1.49082, 0.4470588, 1, 0, 1,
-0.696261, 0.2358694, -2.781814, 0.4392157, 1, 0, 1,
-0.6960137, -1.004117, -1.591463, 0.4352941, 1, 0, 1,
-0.6955747, -0.7148368, -2.549873, 0.427451, 1, 0, 1,
-0.6955162, 1.442978, -1.823138, 0.4235294, 1, 0, 1,
-0.693953, -0.3825822, -0.8329408, 0.4156863, 1, 0, 1,
-0.6878416, -0.1240088, -1.472882, 0.4117647, 1, 0, 1,
-0.6769071, -0.4980022, -3.100846, 0.4039216, 1, 0, 1,
-0.6757582, 0.206052, -2.598159, 0.3960784, 1, 0, 1,
-0.6742574, -0.8102331, -2.414227, 0.3921569, 1, 0, 1,
-0.665144, -1.279987, -2.90075, 0.3843137, 1, 0, 1,
-0.6648408, -1.368076, -3.990131, 0.3803922, 1, 0, 1,
-0.6600116, 1.1688, 1.305744, 0.372549, 1, 0, 1,
-0.6579618, -0.6466656, -4.496812, 0.3686275, 1, 0, 1,
-0.650643, 0.4965439, -0.56665, 0.3607843, 1, 0, 1,
-0.6476572, 0.9183187, -1.136976, 0.3568628, 1, 0, 1,
-0.6377023, 1.020115, -1.262634, 0.3490196, 1, 0, 1,
-0.6353202, -0.5435798, -1.798072, 0.345098, 1, 0, 1,
-0.6339344, 0.4171695, -2.116791, 0.3372549, 1, 0, 1,
-0.6289294, -0.3218321, -3.127379, 0.3333333, 1, 0, 1,
-0.626845, -0.6943183, -2.499646, 0.3254902, 1, 0, 1,
-0.6240437, 0.8214572, -0.161538, 0.3215686, 1, 0, 1,
-0.6216679, -0.07409909, -2.707667, 0.3137255, 1, 0, 1,
-0.6186653, -1.400059, -1.247394, 0.3098039, 1, 0, 1,
-0.6076539, 0.1976496, -1.646436, 0.3019608, 1, 0, 1,
-0.6070955, -2.319127, -4.326335, 0.2941177, 1, 0, 1,
-0.6051809, 0.1045178, 0.8414461, 0.2901961, 1, 0, 1,
-0.597894, 0.4710405, 1.418463, 0.282353, 1, 0, 1,
-0.5915093, -0.1019061, -1.680662, 0.2784314, 1, 0, 1,
-0.5899566, -0.7015936, -4.509023, 0.2705882, 1, 0, 1,
-0.5881273, -0.4361601, -3.362344, 0.2666667, 1, 0, 1,
-0.5874984, 0.9191984, -0.7787861, 0.2588235, 1, 0, 1,
-0.5846373, 0.8847144, -0.7554799, 0.254902, 1, 0, 1,
-0.58379, 0.4429083, -0.1654733, 0.2470588, 1, 0, 1,
-0.5803008, 1.253, 0.3876995, 0.2431373, 1, 0, 1,
-0.5771199, 0.2134868, 0.3727346, 0.2352941, 1, 0, 1,
-0.573797, -0.6672841, -3.276274, 0.2313726, 1, 0, 1,
-0.5730015, 0.1676167, -0.2631163, 0.2235294, 1, 0, 1,
-0.570483, 0.2139346, -1.882502, 0.2196078, 1, 0, 1,
-0.5678136, -1.129728, -3.101418, 0.2117647, 1, 0, 1,
-0.5655749, 0.1204224, -1.719565, 0.2078431, 1, 0, 1,
-0.5630826, 1.349329, 0.08232421, 0.2, 1, 0, 1,
-0.5616259, -1.224759, -2.859555, 0.1921569, 1, 0, 1,
-0.5608771, 0.2995142, -0.3112077, 0.1882353, 1, 0, 1,
-0.5562038, -0.08578792, -2.444073, 0.1803922, 1, 0, 1,
-0.5412678, 0.6841887, -0.8775573, 0.1764706, 1, 0, 1,
-0.5345395, 1.240788, -0.375444, 0.1686275, 1, 0, 1,
-0.5313967, -0.4266993, -1.989216, 0.1647059, 1, 0, 1,
-0.5304335, -1.902164, -2.338337, 0.1568628, 1, 0, 1,
-0.5288773, -0.7955254, -2.93926, 0.1529412, 1, 0, 1,
-0.5285082, 0.3131437, -0.501351, 0.145098, 1, 0, 1,
-0.5262074, -1.076511, -2.367681, 0.1411765, 1, 0, 1,
-0.5228664, 0.6683615, -0.8055525, 0.1333333, 1, 0, 1,
-0.5100092, 0.63925, -1.063341, 0.1294118, 1, 0, 1,
-0.5086024, 0.9290776, -0.6126325, 0.1215686, 1, 0, 1,
-0.5082912, 0.580825, -0.6846819, 0.1176471, 1, 0, 1,
-0.5074376, -0.5034824, -2.354688, 0.1098039, 1, 0, 1,
-0.5071931, -0.9985055, -1.45057, 0.1058824, 1, 0, 1,
-0.5060221, 0.0512764, -1.47841, 0.09803922, 1, 0, 1,
-0.503008, 0.6523078, -0.3845629, 0.09019608, 1, 0, 1,
-0.4942362, 0.5492301, 0.2641956, 0.08627451, 1, 0, 1,
-0.4912864, -0.1293205, -1.890543, 0.07843138, 1, 0, 1,
-0.4888212, -0.7081352, -2.192498, 0.07450981, 1, 0, 1,
-0.4883139, -1.299851, -2.41226, 0.06666667, 1, 0, 1,
-0.4878513, 0.6388724, 0.6423637, 0.0627451, 1, 0, 1,
-0.4864951, 0.1190773, -1.403814, 0.05490196, 1, 0, 1,
-0.4837293, 0.628199, -1.729152, 0.05098039, 1, 0, 1,
-0.4815714, -0.1185591, -3.843361, 0.04313726, 1, 0, 1,
-0.4766296, 0.7935343, -1.65231, 0.03921569, 1, 0, 1,
-0.4709736, -0.7209743, -1.646887, 0.03137255, 1, 0, 1,
-0.4695594, -0.1157481, 0.1385314, 0.02745098, 1, 0, 1,
-0.4672966, 0.4404829, 0.0146059, 0.01960784, 1, 0, 1,
-0.4667555, 1.095585, -0.5407501, 0.01568628, 1, 0, 1,
-0.465462, -2.102712, -2.431611, 0.007843138, 1, 0, 1,
-0.4615459, 0.008896344, -1.037867, 0.003921569, 1, 0, 1,
-0.4582416, 0.1810569, -1.797227, 0, 1, 0.003921569, 1,
-0.4569288, -0.4225626, -1.169177, 0, 1, 0.01176471, 1,
-0.4490793, 0.2137249, -0.6529848, 0, 1, 0.01568628, 1,
-0.4472847, 1.585419, -0.3404526, 0, 1, 0.02352941, 1,
-0.439875, 0.3778396, 0.9904652, 0, 1, 0.02745098, 1,
-0.4391586, 0.4211334, -1.800892, 0, 1, 0.03529412, 1,
-0.4386731, 0.3506886, -1.489432, 0, 1, 0.03921569, 1,
-0.4354811, 0.2110546, 0.9699508, 0, 1, 0.04705882, 1,
-0.4262816, -0.3782917, -2.230742, 0, 1, 0.05098039, 1,
-0.4207203, 1.296842, 1.673899, 0, 1, 0.05882353, 1,
-0.4202361, -0.2191157, -0.5416554, 0, 1, 0.0627451, 1,
-0.4163204, 0.5873383, 0.07616942, 0, 1, 0.07058824, 1,
-0.4146854, 0.6719226, -0.1340325, 0, 1, 0.07450981, 1,
-0.4121253, 0.5397436, -1.555025, 0, 1, 0.08235294, 1,
-0.4039948, -0.3725093, -0.9353866, 0, 1, 0.08627451, 1,
-0.4032478, -1.691206, -1.602213, 0, 1, 0.09411765, 1,
-0.4013402, 0.4716692, -1.217453, 0, 1, 0.1019608, 1,
-0.39993, 0.3255368, -1.121191, 0, 1, 0.1058824, 1,
-0.3952904, 0.6144108, -1.427292, 0, 1, 0.1137255, 1,
-0.3920287, -0.007337736, -0.6869564, 0, 1, 0.1176471, 1,
-0.3864317, -0.8725895, -2.041034, 0, 1, 0.1254902, 1,
-0.3824206, -1.687355, -3.026854, 0, 1, 0.1294118, 1,
-0.3766204, 0.2565214, -1.295598, 0, 1, 0.1372549, 1,
-0.372566, 1.313023, 0.1765409, 0, 1, 0.1411765, 1,
-0.3712459, 1.351907, -0.8106102, 0, 1, 0.1490196, 1,
-0.3678523, -0.4571505, -3.557782, 0, 1, 0.1529412, 1,
-0.3675936, 1.292904, -1.182435, 0, 1, 0.1607843, 1,
-0.367479, -0.436422, -1.468606, 0, 1, 0.1647059, 1,
-0.3625091, -0.4555332, -2.542229, 0, 1, 0.172549, 1,
-0.3609699, -2.37636, -2.96453, 0, 1, 0.1764706, 1,
-0.3606254, 1.226876, 0.1459408, 0, 1, 0.1843137, 1,
-0.3598574, -2.169409, -2.84081, 0, 1, 0.1882353, 1,
-0.3570884, -0.50387, -2.440653, 0, 1, 0.1960784, 1,
-0.3570646, -2.051418, -2.04811, 0, 1, 0.2039216, 1,
-0.3530712, -0.2804222, -3.803339, 0, 1, 0.2078431, 1,
-0.3522376, 0.1038957, -0.8803847, 0, 1, 0.2156863, 1,
-0.3460984, -0.4109251, -1.393904, 0, 1, 0.2196078, 1,
-0.3433137, 0.5994729, -0.6308144, 0, 1, 0.227451, 1,
-0.3429789, -0.2122286, -2.569697, 0, 1, 0.2313726, 1,
-0.3419925, -1.264913, -3.527603, 0, 1, 0.2392157, 1,
-0.3393131, -1.798923, -3.167353, 0, 1, 0.2431373, 1,
-0.3378165, 0.4532361, -1.369106, 0, 1, 0.2509804, 1,
-0.3331142, -0.6071314, -3.067313, 0, 1, 0.254902, 1,
-0.3259647, 1.580045, -0.364841, 0, 1, 0.2627451, 1,
-0.3211535, -1.05203, -2.030826, 0, 1, 0.2666667, 1,
-0.3182956, -0.5013465, -2.395794, 0, 1, 0.2745098, 1,
-0.3168125, -0.134922, -0.009354685, 0, 1, 0.2784314, 1,
-0.3065286, 1.784974, 1.055072, 0, 1, 0.2862745, 1,
-0.306463, -0.8880756, -2.758338, 0, 1, 0.2901961, 1,
-0.2981337, -0.1396033, -4.592678, 0, 1, 0.2980392, 1,
-0.297331, 1.26621, -0.622372, 0, 1, 0.3058824, 1,
-0.2955898, -0.9917685, -2.29573, 0, 1, 0.3098039, 1,
-0.2926673, -0.3501702, -1.291754, 0, 1, 0.3176471, 1,
-0.2909949, -0.2806578, -2.624599, 0, 1, 0.3215686, 1,
-0.2869797, -1.480635, -4.802353, 0, 1, 0.3294118, 1,
-0.2847021, 1.406632, -0.09637527, 0, 1, 0.3333333, 1,
-0.2844673, 0.2138114, -0.6700816, 0, 1, 0.3411765, 1,
-0.2841989, -1.079097, -3.721895, 0, 1, 0.345098, 1,
-0.284196, -2.757538, -2.565816, 0, 1, 0.3529412, 1,
-0.2833748, 0.4430825, -1.608148, 0, 1, 0.3568628, 1,
-0.2797168, -0.2726598, -3.313945, 0, 1, 0.3647059, 1,
-0.2763533, 1.357682, 0.7518983, 0, 1, 0.3686275, 1,
-0.2751879, -1.443222, -3.07016, 0, 1, 0.3764706, 1,
-0.2750705, -0.07856234, -2.241152, 0, 1, 0.3803922, 1,
-0.2724729, 1.447942, 0.258556, 0, 1, 0.3882353, 1,
-0.2689219, -0.5786831, -3.396427, 0, 1, 0.3921569, 1,
-0.2675017, -0.2826809, -2.972303, 0, 1, 0.4, 1,
-0.267226, -0.8951774, -3.745916, 0, 1, 0.4078431, 1,
-0.2669436, 0.1436463, -1.71704, 0, 1, 0.4117647, 1,
-0.2669108, 0.5765489, -2.226175, 0, 1, 0.4196078, 1,
-0.263211, 0.2945844, -0.5718942, 0, 1, 0.4235294, 1,
-0.2534885, -0.1859814, -3.90488, 0, 1, 0.4313726, 1,
-0.2526372, 0.4104572, -0.3991097, 0, 1, 0.4352941, 1,
-0.2485514, -0.7907525, -2.386591, 0, 1, 0.4431373, 1,
-0.2478769, -1.657377, -3.760998, 0, 1, 0.4470588, 1,
-0.2474515, 0.2742737, 0.9971752, 0, 1, 0.454902, 1,
-0.2460852, 0.1952337, 1.051635, 0, 1, 0.4588235, 1,
-0.2458328, -1.43028, -3.43636, 0, 1, 0.4666667, 1,
-0.242156, 0.7778713, -0.7683626, 0, 1, 0.4705882, 1,
-0.2393745, 0.4955513, -1.216093, 0, 1, 0.4784314, 1,
-0.2380147, 1.690949, 0.6205841, 0, 1, 0.4823529, 1,
-0.2350468, -0.5226429, -3.92853, 0, 1, 0.4901961, 1,
-0.234654, 0.5149748, -1.465215, 0, 1, 0.4941176, 1,
-0.2341549, -1.085766, -3.199535, 0, 1, 0.5019608, 1,
-0.2338817, 0.01951588, -2.205805, 0, 1, 0.509804, 1,
-0.2308956, -0.3631308, -2.034191, 0, 1, 0.5137255, 1,
-0.2290525, -0.8919226, -2.107342, 0, 1, 0.5215687, 1,
-0.2272562, -0.4238364, -2.418903, 0, 1, 0.5254902, 1,
-0.2269984, 0.2038899, -0.5189732, 0, 1, 0.5333334, 1,
-0.226911, -0.0515536, -1.216975, 0, 1, 0.5372549, 1,
-0.2256954, -0.3190418, -3.21471, 0, 1, 0.5450981, 1,
-0.2225575, -1.948246, -2.347133, 0, 1, 0.5490196, 1,
-0.2222166, 0.6919467, -1.261432, 0, 1, 0.5568628, 1,
-0.2221237, 0.08301893, -0.5786204, 0, 1, 0.5607843, 1,
-0.2183117, 1.086258, -0.7505053, 0, 1, 0.5686275, 1,
-0.2134299, -0.7798265, -4.882054, 0, 1, 0.572549, 1,
-0.2131588, 0.4197946, -1.903868, 0, 1, 0.5803922, 1,
-0.2115489, 0.9769997, -0.6719714, 0, 1, 0.5843138, 1,
-0.2087676, -0.7866594, -3.060178, 0, 1, 0.5921569, 1,
-0.207942, -0.1378426, -2.42927, 0, 1, 0.5960785, 1,
-0.2040103, -0.8412505, -2.85378, 0, 1, 0.6039216, 1,
-0.2027935, 2.525269, 1.363898, 0, 1, 0.6117647, 1,
-0.1998351, 1.318521, 0.3584259, 0, 1, 0.6156863, 1,
-0.1940015, -0.4542096, -2.796201, 0, 1, 0.6235294, 1,
-0.1918403, 1.57689, -0.6000723, 0, 1, 0.627451, 1,
-0.1904472, 0.5890095, 0.921114, 0, 1, 0.6352941, 1,
-0.1901194, 0.6992397, -0.2617174, 0, 1, 0.6392157, 1,
-0.1891852, -1.992935, -3.423297, 0, 1, 0.6470588, 1,
-0.1886563, -1.385553, -2.375579, 0, 1, 0.6509804, 1,
-0.1834979, -0.02932438, -2.14925, 0, 1, 0.6588235, 1,
-0.1828208, -0.1811072, -2.37568, 0, 1, 0.6627451, 1,
-0.1762487, -0.2475535, -1.783549, 0, 1, 0.6705883, 1,
-0.1719061, 0.1823355, -2.513557, 0, 1, 0.6745098, 1,
-0.1715712, 0.4064742, 1.36941, 0, 1, 0.682353, 1,
-0.1613809, 1.441383, 0.9560639, 0, 1, 0.6862745, 1,
-0.1601564, 0.7537922, 0.7053742, 0, 1, 0.6941177, 1,
-0.1599996, 0.3098646, 0.4225275, 0, 1, 0.7019608, 1,
-0.1562779, -0.6479291, -1.724134, 0, 1, 0.7058824, 1,
-0.1513707, 0.6200414, -1.508162, 0, 1, 0.7137255, 1,
-0.144565, 2.09092, -1.314199, 0, 1, 0.7176471, 1,
-0.1441084, 0.1776882, -1.746175, 0, 1, 0.7254902, 1,
-0.1413926, -0.4356199, -3.552093, 0, 1, 0.7294118, 1,
-0.1409622, 0.70951, 1.396825, 0, 1, 0.7372549, 1,
-0.1393176, 0.4407328, -0.2006993, 0, 1, 0.7411765, 1,
-0.134248, -0.07310872, -0.4082293, 0, 1, 0.7490196, 1,
-0.1340709, -0.4101821, -3.807551, 0, 1, 0.7529412, 1,
-0.1335755, -0.1849631, -2.863829, 0, 1, 0.7607843, 1,
-0.1318163, 1.949751, -0.6790278, 0, 1, 0.7647059, 1,
-0.1301354, -0.04155025, -0.7255837, 0, 1, 0.772549, 1,
-0.1286515, 0.2859164, -0.211562, 0, 1, 0.7764706, 1,
-0.127975, -0.02691821, -1.086087, 0, 1, 0.7843137, 1,
-0.1264889, 1.393967, 0.103337, 0, 1, 0.7882353, 1,
-0.1257895, -1.067817, -3.297917, 0, 1, 0.7960784, 1,
-0.1193315, 0.4380067, 0.1264527, 0, 1, 0.8039216, 1,
-0.1185037, -0.4496556, -3.858518, 0, 1, 0.8078431, 1,
-0.1166154, -0.8578473, -2.505948, 0, 1, 0.8156863, 1,
-0.1114736, 1.357515, 1.551461, 0, 1, 0.8196079, 1,
-0.1038751, 0.2061303, -1.119322, 0, 1, 0.827451, 1,
-0.1031065, 1.262188, 0.9048713, 0, 1, 0.8313726, 1,
-0.097984, 0.7862605, 0.1547764, 0, 1, 0.8392157, 1,
-0.09784011, 0.04048896, -0.8779846, 0, 1, 0.8431373, 1,
-0.09317788, -0.002604826, -0.7746971, 0, 1, 0.8509804, 1,
-0.09294063, 0.9767598, 1.078099, 0, 1, 0.854902, 1,
-0.08565494, -1.08957, -5.46326, 0, 1, 0.8627451, 1,
-0.08500545, -0.209611, -2.192358, 0, 1, 0.8666667, 1,
-0.08469054, -0.7730609, -3.756864, 0, 1, 0.8745098, 1,
-0.08459525, 0.0127128, -1.743817, 0, 1, 0.8784314, 1,
-0.07982719, 2.353864, 1.455802, 0, 1, 0.8862745, 1,
-0.07944778, -1.111224, -4.019053, 0, 1, 0.8901961, 1,
-0.07660086, 0.3373338, -1.549465, 0, 1, 0.8980392, 1,
-0.07437218, -1.120288, -4.150305, 0, 1, 0.9058824, 1,
-0.07142265, -1.581818, -3.032559, 0, 1, 0.9098039, 1,
-0.0706917, 0.8852139, 0.1377111, 0, 1, 0.9176471, 1,
-0.06904888, -0.574832, -2.96291, 0, 1, 0.9215686, 1,
-0.06830233, -1.116526, -2.458241, 0, 1, 0.9294118, 1,
-0.06612048, 0.8718074, 1.794656, 0, 1, 0.9333333, 1,
-0.06466506, -0.9861714, -2.076527, 0, 1, 0.9411765, 1,
-0.06091429, 0.3962451, -0.7350981, 0, 1, 0.945098, 1,
-0.05215425, -0.6289099, -4.131295, 0, 1, 0.9529412, 1,
-0.0481197, 0.002647982, -1.233937, 0, 1, 0.9568627, 1,
-0.04007458, -0.4249203, -0.9102094, 0, 1, 0.9647059, 1,
-0.03984075, -1.434237, -2.956335, 0, 1, 0.9686275, 1,
-0.03810799, -0.4065118, -3.558967, 0, 1, 0.9764706, 1,
-0.03801823, 0.4284952, 1.644354, 0, 1, 0.9803922, 1,
-0.03712494, -0.6761753, -1.822602, 0, 1, 0.9882353, 1,
-0.03500293, -1.325768, -3.260718, 0, 1, 0.9921569, 1,
-0.03424091, -0.4797035, -2.489581, 0, 1, 1, 1,
-0.03291712, 1.33714, -0.5381708, 0, 0.9921569, 1, 1,
-0.02823358, -2.740909, -1.307992, 0, 0.9882353, 1, 1,
-0.02513115, 1.175608, -0.4213786, 0, 0.9803922, 1, 1,
-0.02168809, -0.01435033, -4.23914, 0, 0.9764706, 1, 1,
-0.02133212, 0.6450119, 1.520764, 0, 0.9686275, 1, 1,
-0.01945434, 0.5379537, 0.6671388, 0, 0.9647059, 1, 1,
-0.01494119, -0.8489083, -4.100651, 0, 0.9568627, 1, 1,
-0.01193731, -0.9242427, -2.601131, 0, 0.9529412, 1, 1,
-0.00960928, -1.363437, -4.348738, 0, 0.945098, 1, 1,
-0.005245917, -0.6301603, -5.00841, 0, 0.9411765, 1, 1,
-0.001226932, 0.2765716, 0.150714, 0, 0.9333333, 1, 1,
9.177416e-05, -0.5726162, 3.936066, 0, 0.9294118, 1, 1,
0.002776668, -0.7599881, 3.049005, 0, 0.9215686, 1, 1,
0.002890599, 0.8869758, 0.44889, 0, 0.9176471, 1, 1,
0.007415188, 2.160508, -1.641891, 0, 0.9098039, 1, 1,
0.007928084, -0.4561202, 3.049211, 0, 0.9058824, 1, 1,
0.01183893, 0.1563704, -0.4884003, 0, 0.8980392, 1, 1,
0.01577761, -0.6756802, 3.496728, 0, 0.8901961, 1, 1,
0.01884296, -1.49996, 2.959382, 0, 0.8862745, 1, 1,
0.02916561, 0.1905032, -0.1826835, 0, 0.8784314, 1, 1,
0.03455467, 2.07503, 0.3541187, 0, 0.8745098, 1, 1,
0.03636483, -0.4359304, 2.06457, 0, 0.8666667, 1, 1,
0.04048702, -0.6804696, 4.233549, 0, 0.8627451, 1, 1,
0.04763611, 0.1918721, -1.708437, 0, 0.854902, 1, 1,
0.05327362, -0.9682328, 2.907136, 0, 0.8509804, 1, 1,
0.05382889, 0.03115236, 1.215351, 0, 0.8431373, 1, 1,
0.05697051, 0.9300669, -0.1212247, 0, 0.8392157, 1, 1,
0.06307078, 0.006079137, 1.986016, 0, 0.8313726, 1, 1,
0.06596647, 1.590831, 0.005497288, 0, 0.827451, 1, 1,
0.07166672, -0.03490266, 2.242969, 0, 0.8196079, 1, 1,
0.07169179, 0.8592701, 1.147208, 0, 0.8156863, 1, 1,
0.0725474, -0.1975459, 3.597872, 0, 0.8078431, 1, 1,
0.07550344, 0.608815, 1.054334, 0, 0.8039216, 1, 1,
0.07685401, 0.1223031, -0.3769759, 0, 0.7960784, 1, 1,
0.07748706, -0.9669033, 3.913195, 0, 0.7882353, 1, 1,
0.07942571, 0.9811902, -1.203052, 0, 0.7843137, 1, 1,
0.08169372, 1.966314, -0.1740131, 0, 0.7764706, 1, 1,
0.08673049, -0.3593937, 3.693304, 0, 0.772549, 1, 1,
0.09059147, 0.3947182, 1.675951, 0, 0.7647059, 1, 1,
0.09539045, -0.1550488, 1.509452, 0, 0.7607843, 1, 1,
0.09705307, 0.3708678, -1.299044, 0, 0.7529412, 1, 1,
0.09897556, 2.008787, -0.7424576, 0, 0.7490196, 1, 1,
0.1019232, 0.4401676, 0.7912004, 0, 0.7411765, 1, 1,
0.1095898, -1.165101, 4.381383, 0, 0.7372549, 1, 1,
0.1112746, -0.4531318, 2.401706, 0, 0.7294118, 1, 1,
0.1192689, -0.8786035, 3.347802, 0, 0.7254902, 1, 1,
0.120576, -0.9860224, 0.1813978, 0, 0.7176471, 1, 1,
0.1214116, -0.7214755, 1.832637, 0, 0.7137255, 1, 1,
0.1237366, 0.05111937, 1.565248, 0, 0.7058824, 1, 1,
0.1241154, 0.7279546, 0.7947713, 0, 0.6980392, 1, 1,
0.1243804, -0.04593943, 2.065463, 0, 0.6941177, 1, 1,
0.125935, 0.1337832, 0.04416668, 0, 0.6862745, 1, 1,
0.1274399, -2.887562, 2.250942, 0, 0.682353, 1, 1,
0.1277491, 0.7501275, -0.1882049, 0, 0.6745098, 1, 1,
0.128021, 0.06310093, 0.6893217, 0, 0.6705883, 1, 1,
0.1326862, -0.8206037, 2.144034, 0, 0.6627451, 1, 1,
0.1343021, 1.229004, 0.2515997, 0, 0.6588235, 1, 1,
0.1350437, -0.888046, 3.093735, 0, 0.6509804, 1, 1,
0.1397695, -0.9967195, 2.720643, 0, 0.6470588, 1, 1,
0.1405144, 2.243681, 0.8215292, 0, 0.6392157, 1, 1,
0.1417931, 0.4777528, -0.1178062, 0, 0.6352941, 1, 1,
0.1442402, 0.7801626, -0.1815346, 0, 0.627451, 1, 1,
0.1452061, 0.6252733, 1.297776, 0, 0.6235294, 1, 1,
0.1503246, -0.06414097, 2.349676, 0, 0.6156863, 1, 1,
0.1532464, 0.3901067, 0.749266, 0, 0.6117647, 1, 1,
0.1545535, -0.8138304, 3.466012, 0, 0.6039216, 1, 1,
0.1553003, -1.029068, 2.641943, 0, 0.5960785, 1, 1,
0.1563756, -1.090047, 3.342583, 0, 0.5921569, 1, 1,
0.1590152, 2.804997, 1.924758, 0, 0.5843138, 1, 1,
0.1621423, 0.3809685, 1.963076, 0, 0.5803922, 1, 1,
0.1643307, -1.11297, 3.961076, 0, 0.572549, 1, 1,
0.1654951, 0.3259525, -1.010718, 0, 0.5686275, 1, 1,
0.1655293, -1.433582, 1.614494, 0, 0.5607843, 1, 1,
0.1664937, -0.4024853, 2.529372, 0, 0.5568628, 1, 1,
0.1678496, 0.7984149, 0.1680023, 0, 0.5490196, 1, 1,
0.168136, 0.168088, 1.703161, 0, 0.5450981, 1, 1,
0.1727938, 0.4773944, -2.989859, 0, 0.5372549, 1, 1,
0.1729061, 4.481692e-05, 1.221434, 0, 0.5333334, 1, 1,
0.1729821, -1.465435, 3.627633, 0, 0.5254902, 1, 1,
0.1756837, -0.05115289, 1.557503, 0, 0.5215687, 1, 1,
0.1770463, 1.545425, 1.999536, 0, 0.5137255, 1, 1,
0.1780124, -0.4615761, 2.628335, 0, 0.509804, 1, 1,
0.1781912, 0.3397137, 0.6332669, 0, 0.5019608, 1, 1,
0.1784948, -2.223729, 4.071442, 0, 0.4941176, 1, 1,
0.1866079, 2.233767, 1.305889, 0, 0.4901961, 1, 1,
0.1927271, 0.409684, -0.9198094, 0, 0.4823529, 1, 1,
0.201111, 0.9148099, 3.045965, 0, 0.4784314, 1, 1,
0.2020288, -1.505318, 4.052559, 0, 0.4705882, 1, 1,
0.2021335, 0.3298877, 0.8624517, 0, 0.4666667, 1, 1,
0.2034656, -0.2774293, 4.085223, 0, 0.4588235, 1, 1,
0.2052613, -0.1162311, 1.309273, 0, 0.454902, 1, 1,
0.20793, -0.4021835, 0.8703986, 0, 0.4470588, 1, 1,
0.2125064, -0.6295832, 2.601046, 0, 0.4431373, 1, 1,
0.2148516, 2.186699, 0.989688, 0, 0.4352941, 1, 1,
0.2157056, -0.5741546, 2.519729, 0, 0.4313726, 1, 1,
0.2188096, 0.6126575, -0.4638994, 0, 0.4235294, 1, 1,
0.2203848, 0.04027424, 0.4083214, 0, 0.4196078, 1, 1,
0.2231758, 1.216073, -0.2155862, 0, 0.4117647, 1, 1,
0.2312398, -0.4136646, 3.732016, 0, 0.4078431, 1, 1,
0.2323855, -0.359576, 3.899261, 0, 0.4, 1, 1,
0.2333317, 1.669947, 0.7557154, 0, 0.3921569, 1, 1,
0.2354152, 0.1533559, 0.2575114, 0, 0.3882353, 1, 1,
0.2362022, 0.07154937, 2.07373, 0, 0.3803922, 1, 1,
0.2399228, -0.3805404, 3.175419, 0, 0.3764706, 1, 1,
0.2403127, 0.8123047, 1.373075, 0, 0.3686275, 1, 1,
0.2407022, 0.6455706, 0.8025562, 0, 0.3647059, 1, 1,
0.246018, 0.3636743, 0.8749463, 0, 0.3568628, 1, 1,
0.2478816, 0.2281917, 1.293927, 0, 0.3529412, 1, 1,
0.2492875, 1.377864, 0.8673818, 0, 0.345098, 1, 1,
0.2575058, -0.6151177, 2.57641, 0, 0.3411765, 1, 1,
0.2638779, -1.379455, 3.494876, 0, 0.3333333, 1, 1,
0.2658882, -0.5446216, 3.8147, 0, 0.3294118, 1, 1,
0.2666259, 0.910912, -0.8748217, 0, 0.3215686, 1, 1,
0.2675608, -1.776555, 3.323357, 0, 0.3176471, 1, 1,
0.2684012, 0.8682104, -1.39921, 0, 0.3098039, 1, 1,
0.2699972, -0.8334823, 3.264386, 0, 0.3058824, 1, 1,
0.2751616, 1.129335, 1.710784, 0, 0.2980392, 1, 1,
0.2785819, 1.450539, -0.6291465, 0, 0.2901961, 1, 1,
0.280823, -0.02387612, 0.6631888, 0, 0.2862745, 1, 1,
0.2904866, 0.7046238, 0.4746191, 0, 0.2784314, 1, 1,
0.291219, 1.425082, -0.7896071, 0, 0.2745098, 1, 1,
0.2955323, 0.6837329, 0.619122, 0, 0.2666667, 1, 1,
0.2986442, -1.755414, 5.506144, 0, 0.2627451, 1, 1,
0.3006078, -0.3593999, 3.258618, 0, 0.254902, 1, 1,
0.3043555, 0.008475833, 1.996557, 0, 0.2509804, 1, 1,
0.3105831, -1.776565, 2.107302, 0, 0.2431373, 1, 1,
0.312532, -0.492479, 2.166524, 0, 0.2392157, 1, 1,
0.3134767, -0.7860931, 1.467463, 0, 0.2313726, 1, 1,
0.3162301, 1.255967, -0.02961029, 0, 0.227451, 1, 1,
0.3183755, -2.42631, 2.006682, 0, 0.2196078, 1, 1,
0.3214308, -2.52516, 2.971005, 0, 0.2156863, 1, 1,
0.3218573, 0.2088976, 0.3386196, 0, 0.2078431, 1, 1,
0.3227199, 0.1289868, 0.4010878, 0, 0.2039216, 1, 1,
0.3230564, -0.3391369, 1.737411, 0, 0.1960784, 1, 1,
0.3405333, -0.2432, 2.936246, 0, 0.1882353, 1, 1,
0.3419602, -0.5294111, 4.376812, 0, 0.1843137, 1, 1,
0.3446466, 1.413499, -0.5416149, 0, 0.1764706, 1, 1,
0.3492348, 0.3801216, 0.2262786, 0, 0.172549, 1, 1,
0.3536499, -0.6158057, 3.561309, 0, 0.1647059, 1, 1,
0.3562542, 0.4952694, 0.7300329, 0, 0.1607843, 1, 1,
0.3564282, 0.4110371, 0.6851625, 0, 0.1529412, 1, 1,
0.3572905, 0.2774714, 0.7629392, 0, 0.1490196, 1, 1,
0.3598631, 0.2128346, 0.6480798, 0, 0.1411765, 1, 1,
0.3599807, 1.429822, 0.3329203, 0, 0.1372549, 1, 1,
0.3618998, -0.5867234, 3.013971, 0, 0.1294118, 1, 1,
0.3632681, 0.4451326, 1.6677, 0, 0.1254902, 1, 1,
0.3644944, 0.2391966, 1.367732, 0, 0.1176471, 1, 1,
0.3723505, -0.019093, 3.025186, 0, 0.1137255, 1, 1,
0.3749566, 0.07895751, -0.4385266, 0, 0.1058824, 1, 1,
0.3796403, 1.159758, -0.325705, 0, 0.09803922, 1, 1,
0.3798433, 1.479304, -0.647445, 0, 0.09411765, 1, 1,
0.3891845, -0.1777967, 2.136152, 0, 0.08627451, 1, 1,
0.3901989, -1.058804, 3.049743, 0, 0.08235294, 1, 1,
0.3968338, -0.2561507, -0.1140698, 0, 0.07450981, 1, 1,
0.3977689, 1.555415, 1.00248, 0, 0.07058824, 1, 1,
0.3979965, 0.2471508, 1.668039, 0, 0.0627451, 1, 1,
0.3996804, 0.7015941, -0.8830745, 0, 0.05882353, 1, 1,
0.4020868, -0.2703695, 3.458939, 0, 0.05098039, 1, 1,
0.4024473, -0.8801699, 1.772127, 0, 0.04705882, 1, 1,
0.4076517, -1.462845, 2.565538, 0, 0.03921569, 1, 1,
0.4121145, 0.8110842, 0.964391, 0, 0.03529412, 1, 1,
0.4148654, -0.6279976, 2.665408, 0, 0.02745098, 1, 1,
0.4155154, -1.172462, 4.278944, 0, 0.02352941, 1, 1,
0.4164154, 0.9004688, 0.349918, 0, 0.01568628, 1, 1,
0.4167235, 0.7475177, 0.1879206, 0, 0.01176471, 1, 1,
0.4191655, 2.709605, -1.303686, 0, 0.003921569, 1, 1,
0.4208913, -0.06324824, 0.9770437, 0.003921569, 0, 1, 1,
0.423833, -1.150874, 2.60498, 0.007843138, 0, 1, 1,
0.4266286, 0.4185498, 1.042855, 0.01568628, 0, 1, 1,
0.4266877, 2.311079, -0.5144215, 0.01960784, 0, 1, 1,
0.429206, 0.249247, 2.014869, 0.02745098, 0, 1, 1,
0.4329624, 1.370356, -0.2836167, 0.03137255, 0, 1, 1,
0.4380566, 0.4537481, 0.3294297, 0.03921569, 0, 1, 1,
0.4424608, -0.9377534, 2.546485, 0.04313726, 0, 1, 1,
0.4467033, 0.3441767, 1.920769, 0.05098039, 0, 1, 1,
0.4496237, -1.135008, 1.557526, 0.05490196, 0, 1, 1,
0.450491, 0.03791847, 0.8998219, 0.0627451, 0, 1, 1,
0.4517017, 1.586318, 0.01135952, 0.06666667, 0, 1, 1,
0.4524675, -1.274873, 0.502113, 0.07450981, 0, 1, 1,
0.4533926, 0.1866642, -0.06971686, 0.07843138, 0, 1, 1,
0.4542912, -0.6143029, 3.102445, 0.08627451, 0, 1, 1,
0.4551772, -0.3822848, 1.334485, 0.09019608, 0, 1, 1,
0.4582478, 0.5295894, 1.312935, 0.09803922, 0, 1, 1,
0.4584372, 1.506785, 0.3856522, 0.1058824, 0, 1, 1,
0.460679, -0.2505439, 2.513268, 0.1098039, 0, 1, 1,
0.461462, -1.107981, 2.431709, 0.1176471, 0, 1, 1,
0.4621993, -0.4679982, 3.34682, 0.1215686, 0, 1, 1,
0.4628344, 0.07410832, 0.2566431, 0.1294118, 0, 1, 1,
0.4670622, 0.09547684, 1.376129, 0.1333333, 0, 1, 1,
0.4701433, 0.1799471, 1.307231, 0.1411765, 0, 1, 1,
0.4741046, 1.060485, 1.187682, 0.145098, 0, 1, 1,
0.4764034, -0.4766732, 0.4742655, 0.1529412, 0, 1, 1,
0.4774441, -1.211601, 3.769943, 0.1568628, 0, 1, 1,
0.4795701, 0.2729878, 1.782969, 0.1647059, 0, 1, 1,
0.4813693, -1.572871, 1.908729, 0.1686275, 0, 1, 1,
0.4862299, -0.5613023, 1.963461, 0.1764706, 0, 1, 1,
0.4867361, 0.4018787, 0.9098673, 0.1803922, 0, 1, 1,
0.4867746, 0.868311, -0.1721664, 0.1882353, 0, 1, 1,
0.4889086, -0.09852207, 2.396134, 0.1921569, 0, 1, 1,
0.4895619, 1.517024, 0.2625578, 0.2, 0, 1, 1,
0.4940661, -1.276963, 2.600363, 0.2078431, 0, 1, 1,
0.4951231, -1.918009, 4.566212, 0.2117647, 0, 1, 1,
0.4962651, -1.32031, 3.62601, 0.2196078, 0, 1, 1,
0.496869, -0.41061, -0.009871811, 0.2235294, 0, 1, 1,
0.4983476, 1.302816, 0.4741223, 0.2313726, 0, 1, 1,
0.5006363, 0.07653838, 2.678796, 0.2352941, 0, 1, 1,
0.5012404, -0.8196821, 0.7473536, 0.2431373, 0, 1, 1,
0.5053881, -1.175103, 2.519294, 0.2470588, 0, 1, 1,
0.5069386, 1.113937, 0.7453529, 0.254902, 0, 1, 1,
0.5093231, 1.633016, 0.8086085, 0.2588235, 0, 1, 1,
0.5107617, 0.3154316, 1.140623, 0.2666667, 0, 1, 1,
0.5114529, -0.6575967, 3.776284, 0.2705882, 0, 1, 1,
0.515041, -1.317773, 2.090045, 0.2784314, 0, 1, 1,
0.5157623, -1.156232, 2.097425, 0.282353, 0, 1, 1,
0.5174426, 0.2323018, -1.014419, 0.2901961, 0, 1, 1,
0.5208653, -1.670284, 2.776853, 0.2941177, 0, 1, 1,
0.5214651, -1.015789, 2.520956, 0.3019608, 0, 1, 1,
0.5216315, 0.3891225, -0.1353486, 0.3098039, 0, 1, 1,
0.5216396, 0.3169048, 0.4918539, 0.3137255, 0, 1, 1,
0.5243568, 0.05494817, 1.736539, 0.3215686, 0, 1, 1,
0.5377591, -1.317393, 2.224909, 0.3254902, 0, 1, 1,
0.5461954, 0.3010292, 0.9275314, 0.3333333, 0, 1, 1,
0.5511729, 0.2809775, 0.2716995, 0.3372549, 0, 1, 1,
0.5552032, 1.671733, 0.8709277, 0.345098, 0, 1, 1,
0.5552312, -0.5887969, 1.536151, 0.3490196, 0, 1, 1,
0.5555271, -0.1932106, 2.934395, 0.3568628, 0, 1, 1,
0.5671311, 0.9027781, -0.163887, 0.3607843, 0, 1, 1,
0.5713478, 1.188276, 0.8859202, 0.3686275, 0, 1, 1,
0.578768, -0.6873881, 2.749443, 0.372549, 0, 1, 1,
0.5800958, 0.09857086, 2.224975, 0.3803922, 0, 1, 1,
0.5822748, -0.5748795, 3.045894, 0.3843137, 0, 1, 1,
0.5908514, 0.2414638, 1.205044, 0.3921569, 0, 1, 1,
0.5933359, 1.705482, 0.6820746, 0.3960784, 0, 1, 1,
0.5940114, 1.076891, 0.7359594, 0.4039216, 0, 1, 1,
0.5947142, 0.8742294, 2.555035, 0.4117647, 0, 1, 1,
0.5966661, 0.8043182, 1.207073, 0.4156863, 0, 1, 1,
0.5967846, -0.4257283, 1.82404, 0.4235294, 0, 1, 1,
0.5999112, 1.143533, -0.2176735, 0.427451, 0, 1, 1,
0.6229979, 0.3952008, 1.275345, 0.4352941, 0, 1, 1,
0.6299635, 0.506924, 1.571404, 0.4392157, 0, 1, 1,
0.6344893, 0.2570373, 0.5628343, 0.4470588, 0, 1, 1,
0.6354188, -0.1398464, 1.416339, 0.4509804, 0, 1, 1,
0.6359328, 1.055916, 2.203135, 0.4588235, 0, 1, 1,
0.6366882, 0.003906197, 2.380021, 0.4627451, 0, 1, 1,
0.6423037, 0.7447169, 1.523358, 0.4705882, 0, 1, 1,
0.6439754, -1.376752, 2.564969, 0.4745098, 0, 1, 1,
0.6463874, -2.550596, 2.744558, 0.4823529, 0, 1, 1,
0.6483964, 0.8432185, -0.06044523, 0.4862745, 0, 1, 1,
0.6548807, 1.946138, 0.07900274, 0.4941176, 0, 1, 1,
0.6605284, 0.3006581, 2.823016, 0.5019608, 0, 1, 1,
0.6615933, -0.110225, 2.082815, 0.5058824, 0, 1, 1,
0.6702055, -1.526808, 2.77997, 0.5137255, 0, 1, 1,
0.6708118, 0.1819481, 1.316436, 0.5176471, 0, 1, 1,
0.6792706, 0.1520224, 2.789506, 0.5254902, 0, 1, 1,
0.6829515, -0.1272235, 0.8004939, 0.5294118, 0, 1, 1,
0.683091, -0.007597926, 1.428454, 0.5372549, 0, 1, 1,
0.685477, 0.05372746, 1.319512, 0.5411765, 0, 1, 1,
0.6890643, -0.6725697, 2.201082, 0.5490196, 0, 1, 1,
0.6893316, 0.2786103, 1.046003, 0.5529412, 0, 1, 1,
0.6959057, 0.6051907, 1.20691, 0.5607843, 0, 1, 1,
0.6963252, -0.5295528, 2.497106, 0.5647059, 0, 1, 1,
0.6975709, -0.9526648, 2.722109, 0.572549, 0, 1, 1,
0.7068194, -0.9486486, 2.252872, 0.5764706, 0, 1, 1,
0.7114373, 0.2296165, 2.445575, 0.5843138, 0, 1, 1,
0.7160589, -0.6813944, 2.016615, 0.5882353, 0, 1, 1,
0.7165077, -0.08938979, 0.9561256, 0.5960785, 0, 1, 1,
0.7214263, 0.4629786, 1.629473, 0.6039216, 0, 1, 1,
0.7220563, 0.6110739, 2.411409, 0.6078432, 0, 1, 1,
0.7235284, 1.546966, 0.2438823, 0.6156863, 0, 1, 1,
0.7304785, -0.9517657, 1.190752, 0.6196079, 0, 1, 1,
0.732269, 0.3368523, 0.8515796, 0.627451, 0, 1, 1,
0.7328966, 1.511414, 0.06784952, 0.6313726, 0, 1, 1,
0.7397352, 0.4351724, 0.648273, 0.6392157, 0, 1, 1,
0.7426373, -0.27381, 2.610601, 0.6431373, 0, 1, 1,
0.7437063, 1.077458, 0.9883477, 0.6509804, 0, 1, 1,
0.7467782, 2.446523, -0.3391977, 0.654902, 0, 1, 1,
0.7489232, -0.3738451, -1.076137, 0.6627451, 0, 1, 1,
0.7505071, 0.6335894, 0.8440955, 0.6666667, 0, 1, 1,
0.7564228, 0.5400037, 1.87885, 0.6745098, 0, 1, 1,
0.762211, 1.113982, -0.6655157, 0.6784314, 0, 1, 1,
0.7630194, 0.9906628, 0.6928538, 0.6862745, 0, 1, 1,
0.767445, 0.04452377, 0.2526386, 0.6901961, 0, 1, 1,
0.7709556, 0.6046159, -0.1788745, 0.6980392, 0, 1, 1,
0.7780933, -0.1551261, 1.694886, 0.7058824, 0, 1, 1,
0.7786946, 0.4416804, -0.2308505, 0.7098039, 0, 1, 1,
0.7811919, 0.5338056, -0.5309106, 0.7176471, 0, 1, 1,
0.7815038, -0.7839319, 3.403649, 0.7215686, 0, 1, 1,
0.7817131, -0.6285124, 1.921199, 0.7294118, 0, 1, 1,
0.7829685, 0.8750063, 0.1969907, 0.7333333, 0, 1, 1,
0.7910783, -0.8933132, 1.536501, 0.7411765, 0, 1, 1,
0.7921015, -0.8958467, 2.544713, 0.7450981, 0, 1, 1,
0.7968618, 1.101747, 2.194835, 0.7529412, 0, 1, 1,
0.7971711, 1.187482, 0.0256279, 0.7568628, 0, 1, 1,
0.8036901, 1.624387, -1.190863, 0.7647059, 0, 1, 1,
0.8082111, -0.8520529, 1.690611, 0.7686275, 0, 1, 1,
0.8162866, -1.486348, 1.978577, 0.7764706, 0, 1, 1,
0.8216975, -0.1080969, 0.1983915, 0.7803922, 0, 1, 1,
0.8253065, -0.8913331, 3.308444, 0.7882353, 0, 1, 1,
0.8259988, -0.4229438, 2.062572, 0.7921569, 0, 1, 1,
0.8302243, -0.4741102, 1.465343, 0.8, 0, 1, 1,
0.8335728, 0.8444507, 1.110273, 0.8078431, 0, 1, 1,
0.8353284, -0.3339422, 2.915252, 0.8117647, 0, 1, 1,
0.8385776, 2.413075, -0.293634, 0.8196079, 0, 1, 1,
0.8403285, 0.4301013, 1.446962, 0.8235294, 0, 1, 1,
0.841909, -0.2362112, 0.700844, 0.8313726, 0, 1, 1,
0.8452529, -1.024313, 1.480439, 0.8352941, 0, 1, 1,
0.8485523, -0.7797065, 2.720215, 0.8431373, 0, 1, 1,
0.8497094, 2.138947, 1.059373, 0.8470588, 0, 1, 1,
0.855778, 1.516255, 1.405759, 0.854902, 0, 1, 1,
0.8692696, 0.3797685, 2.209897, 0.8588235, 0, 1, 1,
0.8698186, -0.6900834, 0.1143193, 0.8666667, 0, 1, 1,
0.8709613, -1.235677, 3.535961, 0.8705882, 0, 1, 1,
0.8730318, -0.203371, 1.841071, 0.8784314, 0, 1, 1,
0.8797081, -0.5611001, 2.206093, 0.8823529, 0, 1, 1,
0.8797926, -0.03994716, 2.532173, 0.8901961, 0, 1, 1,
0.8802341, -1.169308, 2.510836, 0.8941177, 0, 1, 1,
0.8811713, 2.519351, 1.221414, 0.9019608, 0, 1, 1,
0.8832916, -0.5419992, 2.541353, 0.9098039, 0, 1, 1,
0.8834006, 1.668684, -0.6691146, 0.9137255, 0, 1, 1,
0.8864212, -0.1303323, 1.231965, 0.9215686, 0, 1, 1,
0.8937562, -0.1248552, 1.458822, 0.9254902, 0, 1, 1,
0.8939717, -1.386026, 2.883272, 0.9333333, 0, 1, 1,
0.8943943, -0.7358396, 2.792023, 0.9372549, 0, 1, 1,
0.8944679, -0.6624216, 3.453531, 0.945098, 0, 1, 1,
0.8999944, 0.01388408, 2.529537, 0.9490196, 0, 1, 1,
0.9091121, 1.569908, 1.28492, 0.9568627, 0, 1, 1,
0.9106181, 0.5536333, 2.704742, 0.9607843, 0, 1, 1,
0.911552, -0.2765886, 1.968898, 0.9686275, 0, 1, 1,
0.9121069, 1.013237, 0.149947, 0.972549, 0, 1, 1,
0.9147856, -1.938113, 2.83252, 0.9803922, 0, 1, 1,
0.9197206, 0.2099461, -1.224125, 0.9843137, 0, 1, 1,
0.9201529, 0.01486452, 2.375787, 0.9921569, 0, 1, 1,
0.9244748, 0.4196478, 0.5825911, 0.9960784, 0, 1, 1,
0.939711, -0.3711041, 3.407979, 1, 0, 0.9960784, 1,
0.940221, -0.7138723, 3.309466, 1, 0, 0.9882353, 1,
0.9410103, 0.5299722, 0.1527441, 1, 0, 0.9843137, 1,
0.9455013, 1.013795, 3.154943, 1, 0, 0.9764706, 1,
0.9488244, 1.555376, 0.0007332779, 1, 0, 0.972549, 1,
0.950726, 0.04424424, 0.8233982, 1, 0, 0.9647059, 1,
0.9526907, 0.08211093, 1.031067, 1, 0, 0.9607843, 1,
0.9680998, 0.8861961, 0.3444328, 1, 0, 0.9529412, 1,
0.9688306, -0.1003499, 1.365015, 1, 0, 0.9490196, 1,
0.9704622, -0.1240512, 2.180124, 1, 0, 0.9411765, 1,
0.9795519, 0.5217558, 0.3596268, 1, 0, 0.9372549, 1,
0.9812111, -2.188192, 4.192719, 1, 0, 0.9294118, 1,
0.9825042, -0.1360865, 2.705756, 1, 0, 0.9254902, 1,
0.9853734, 1.113173, 1.239359, 1, 0, 0.9176471, 1,
0.9897023, -1.719118, 2.10131, 1, 0, 0.9137255, 1,
0.9932236, -0.3767914, 1.362229, 1, 0, 0.9058824, 1,
1.004093, 0.9679632, 0.5514865, 1, 0, 0.9019608, 1,
1.008088, -0.2817837, 1.121754, 1, 0, 0.8941177, 1,
1.011609, -1.234558, 3.291569, 1, 0, 0.8862745, 1,
1.026018, -0.6801728, 2.614443, 1, 0, 0.8823529, 1,
1.034001, -1.399992, 1.826523, 1, 0, 0.8745098, 1,
1.034256, 2.610822, -0.2834615, 1, 0, 0.8705882, 1,
1.03793, -1.277813, 3.401561, 1, 0, 0.8627451, 1,
1.040211, 0.05304676, 1.337706, 1, 0, 0.8588235, 1,
1.049994, -0.5183169, 1.186086, 1, 0, 0.8509804, 1,
1.054877, 0.07826389, 2.020695, 1, 0, 0.8470588, 1,
1.056215, -1.624606, 3.531948, 1, 0, 0.8392157, 1,
1.067718, -0.8488237, 2.91557, 1, 0, 0.8352941, 1,
1.067768, 3.75688, 0.139886, 1, 0, 0.827451, 1,
1.073758, -1.227008, 3.296736, 1, 0, 0.8235294, 1,
1.07836, -0.05051594, 2.509547, 1, 0, 0.8156863, 1,
1.084176, -1.719057, 3.188161, 1, 0, 0.8117647, 1,
1.090667, 2.680366, 0.08516972, 1, 0, 0.8039216, 1,
1.095592, -1.332227, 2.089886, 1, 0, 0.7960784, 1,
1.10169, 0.7069459, 0.288242, 1, 0, 0.7921569, 1,
1.103665, -0.4870601, 3.228618, 1, 0, 0.7843137, 1,
1.103793, 0.2321077, 0.5541033, 1, 0, 0.7803922, 1,
1.10594, -1.161969, 1.926019, 1, 0, 0.772549, 1,
1.106586, 0.2605867, 0.3306474, 1, 0, 0.7686275, 1,
1.111376, 0.6393841, 1.037386, 1, 0, 0.7607843, 1,
1.115331, -0.09948821, 2.418712, 1, 0, 0.7568628, 1,
1.126529, -1.466454, 3.315305, 1, 0, 0.7490196, 1,
1.130796, 0.3189694, 0.9475398, 1, 0, 0.7450981, 1,
1.13195, -1.451608, 4.332274, 1, 0, 0.7372549, 1,
1.132781, 0.6146446, -1.670831, 1, 0, 0.7333333, 1,
1.134249, -0.905407, 2.187914, 1, 0, 0.7254902, 1,
1.149501, 0.6798761, -0.6736419, 1, 0, 0.7215686, 1,
1.156949, -0.1049049, 2.526203, 1, 0, 0.7137255, 1,
1.169558, 1.406974, 1.590896, 1, 0, 0.7098039, 1,
1.170002, -1.876513, 1.057991, 1, 0, 0.7019608, 1,
1.177908, -0.58801, 1.114994, 1, 0, 0.6941177, 1,
1.184501, 0.7925355, 0.8495176, 1, 0, 0.6901961, 1,
1.187613, -1.433933, 4.194266, 1, 0, 0.682353, 1,
1.192595, 1.516026, 0.4920127, 1, 0, 0.6784314, 1,
1.200714, -0.2266855, 1.115963, 1, 0, 0.6705883, 1,
1.203179, -1.035661, 1.27166, 1, 0, 0.6666667, 1,
1.20364, -0.896816, 0.6656132, 1, 0, 0.6588235, 1,
1.204264, 1.069075, 1.945903, 1, 0, 0.654902, 1,
1.209558, 0.7183405, 1.390415, 1, 0, 0.6470588, 1,
1.209841, 0.9465054, 2.685889, 1, 0, 0.6431373, 1,
1.213737, 0.7314829, 0.8792681, 1, 0, 0.6352941, 1,
1.218722, 0.09996059, 1.728299, 1, 0, 0.6313726, 1,
1.222697, 0.2197054, 2.004206, 1, 0, 0.6235294, 1,
1.228245, -0.6275404, 1.07321, 1, 0, 0.6196079, 1,
1.241422, 1.383642, 0.4484368, 1, 0, 0.6117647, 1,
1.251913, -0.6607814, 1.512808, 1, 0, 0.6078432, 1,
1.25477, -1.032576, 3.082188, 1, 0, 0.6, 1,
1.258811, 0.5605924, 1.138924, 1, 0, 0.5921569, 1,
1.259126, -0.6064345, 0.9529805, 1, 0, 0.5882353, 1,
1.268048, -0.4228549, 0.5250704, 1, 0, 0.5803922, 1,
1.280002, 0.1547838, 0.8998309, 1, 0, 0.5764706, 1,
1.306109, 1.73694, -0.224734, 1, 0, 0.5686275, 1,
1.306647, 1.537021, -0.2794824, 1, 0, 0.5647059, 1,
1.309408, 0.9909934, 2.015942, 1, 0, 0.5568628, 1,
1.312717, -0.03493547, 1.019925, 1, 0, 0.5529412, 1,
1.313559, -0.7912846, 2.584843, 1, 0, 0.5450981, 1,
1.314894, -0.6944606, 1.313004, 1, 0, 0.5411765, 1,
1.316412, 0.6628073, 1.538303, 1, 0, 0.5333334, 1,
1.318355, 1.643131, -0.731745, 1, 0, 0.5294118, 1,
1.318799, 0.4284322, 2.679588, 1, 0, 0.5215687, 1,
1.319695, 0.4664485, 1.182316, 1, 0, 0.5176471, 1,
1.320342, 0.14139, 2.606616, 1, 0, 0.509804, 1,
1.32374, 0.366473, 1.155194, 1, 0, 0.5058824, 1,
1.329371, -1.643135, 2.986466, 1, 0, 0.4980392, 1,
1.331125, -0.7781819, 1.514651, 1, 0, 0.4901961, 1,
1.339517, -0.5386419, 1.16177, 1, 0, 0.4862745, 1,
1.353958, 1.361264, -0.7179949, 1, 0, 0.4784314, 1,
1.364128, 0.4044108, 0.5254677, 1, 0, 0.4745098, 1,
1.365943, -0.6665179, 2.924687, 1, 0, 0.4666667, 1,
1.37191, -0.7682412, 1.655248, 1, 0, 0.4627451, 1,
1.372887, 0.07054654, 1.950514, 1, 0, 0.454902, 1,
1.376771, -0.5889604, -0.8673371, 1, 0, 0.4509804, 1,
1.380213, -1.416656, 3.594316, 1, 0, 0.4431373, 1,
1.382473, -0.08295542, 3.58196, 1, 0, 0.4392157, 1,
1.389188, 0.4857572, 1.265658, 1, 0, 0.4313726, 1,
1.394742, -0.4986018, 0.8326698, 1, 0, 0.427451, 1,
1.401887, -0.1398159, 1.410099, 1, 0, 0.4196078, 1,
1.404806, 0.8563404, 1.75855, 1, 0, 0.4156863, 1,
1.410725, -0.7627404, 2.332921, 1, 0, 0.4078431, 1,
1.416116, 0.2230456, -0.1561308, 1, 0, 0.4039216, 1,
1.419375, -0.5247795, 1.650822, 1, 0, 0.3960784, 1,
1.434332, 0.6758705, -0.02746001, 1, 0, 0.3882353, 1,
1.452103, -0.2779209, -0.1632868, 1, 0, 0.3843137, 1,
1.457905, -0.908821, 0.6530567, 1, 0, 0.3764706, 1,
1.458869, 0.245697, -0.4083602, 1, 0, 0.372549, 1,
1.461355, 0.8589663, -0.3687651, 1, 0, 0.3647059, 1,
1.476333, -0.776537, 1.909242, 1, 0, 0.3607843, 1,
1.482124, -0.3166439, 0.8808908, 1, 0, 0.3529412, 1,
1.490684, 0.8154466, -0.4596691, 1, 0, 0.3490196, 1,
1.528159, -0.7012773, 1.216467, 1, 0, 0.3411765, 1,
1.541426, 0.1342175, 1.286737, 1, 0, 0.3372549, 1,
1.542473, 0.4917807, 0.7284855, 1, 0, 0.3294118, 1,
1.542827, 0.5773297, -0.9395361, 1, 0, 0.3254902, 1,
1.553306, 0.3083769, 1.597138, 1, 0, 0.3176471, 1,
1.56098, -0.1075592, 1.214682, 1, 0, 0.3137255, 1,
1.606605, 1.273672, -0.6975718, 1, 0, 0.3058824, 1,
1.607435, 0.4032564, 1.048624, 1, 0, 0.2980392, 1,
1.60754, 0.6279379, 0.7437401, 1, 0, 0.2941177, 1,
1.617359, -0.1718027, 1.363824, 1, 0, 0.2862745, 1,
1.62619, 0.1049228, 0.7434111, 1, 0, 0.282353, 1,
1.62934, -1.093975, 3.213816, 1, 0, 0.2745098, 1,
1.629712, 0.5526078, 0.5274, 1, 0, 0.2705882, 1,
1.637099, -0.1996656, 3.076669, 1, 0, 0.2627451, 1,
1.639616, 0.02160868, 1.090779, 1, 0, 0.2588235, 1,
1.643394, -0.5521923, 2.550226, 1, 0, 0.2509804, 1,
1.645428, 1.067536, 0.07157651, 1, 0, 0.2470588, 1,
1.651357, 0.4259064, 0.4736853, 1, 0, 0.2392157, 1,
1.655021, -0.06464598, 1.388939, 1, 0, 0.2352941, 1,
1.698377, -0.8624153, 2.113842, 1, 0, 0.227451, 1,
1.713468, -0.1740891, 1.536663, 1, 0, 0.2235294, 1,
1.718241, 0.9808266, -0.3480549, 1, 0, 0.2156863, 1,
1.720987, 0.6537409, -0.8089676, 1, 0, 0.2117647, 1,
1.737688, -1.092303, 1.95394, 1, 0, 0.2039216, 1,
1.764614, -1.470001, 2.534423, 1, 0, 0.1960784, 1,
1.782507, -0.5327859, 0.9677424, 1, 0, 0.1921569, 1,
1.802224, 0.6370547, 1.36885, 1, 0, 0.1843137, 1,
1.811056, -0.4774534, 0.2030856, 1, 0, 0.1803922, 1,
1.87759, -1.064399, 3.003133, 1, 0, 0.172549, 1,
1.890626, 0.8254104, 0.2529997, 1, 0, 0.1686275, 1,
1.910091, 0.8565478, 0.3369277, 1, 0, 0.1607843, 1,
1.913007, -1.288659, 1.837898, 1, 0, 0.1568628, 1,
1.914623, 1.319651, 1.26507, 1, 0, 0.1490196, 1,
2.014221, 1.51426, 1.426238, 1, 0, 0.145098, 1,
2.020932, -0.5332875, 1.653254, 1, 0, 0.1372549, 1,
2.039929, -0.609655, 2.394639, 1, 0, 0.1333333, 1,
2.050815, -0.7477987, 3.080653, 1, 0, 0.1254902, 1,
2.060342, 2.039376, 1.662657, 1, 0, 0.1215686, 1,
2.103557, 0.2308091, 0.100619, 1, 0, 0.1137255, 1,
2.119953, -1.153755, 2.691032, 1, 0, 0.1098039, 1,
2.139693, 0.3837137, 2.345758, 1, 0, 0.1019608, 1,
2.169137, 1.200816, 2.136748, 1, 0, 0.09411765, 1,
2.183244, 0.459469, 2.28619, 1, 0, 0.09019608, 1,
2.209176, 0.3292244, 1.401755, 1, 0, 0.08235294, 1,
2.209664, -0.4505364, 3.201631, 1, 0, 0.07843138, 1,
2.235761, 0.7407131, 3.132385, 1, 0, 0.07058824, 1,
2.291423, -0.1434012, 1.022441, 1, 0, 0.06666667, 1,
2.297806, 2.118574, 1.36698, 1, 0, 0.05882353, 1,
2.356851, -0.1699676, 0.4749013, 1, 0, 0.05490196, 1,
2.375474, 1.17482, 2.758634, 1, 0, 0.04705882, 1,
2.486556, 0.09893495, 2.075114, 1, 0, 0.04313726, 1,
2.532077, 0.3251012, 0.7353268, 1, 0, 0.03529412, 1,
2.605649, 0.1605504, 2.007006, 1, 0, 0.03137255, 1,
2.631309, 0.2509091, 1.96868, 1, 0, 0.02352941, 1,
2.634801, 0.6774012, 1.368021, 1, 0, 0.01960784, 1,
2.728048, -1.134121, 2.237369, 1, 0, 0.01176471, 1,
2.788898, 0.2114729, 1.846022, 1, 0, 0.007843138, 1
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
-0.2128417, -4.157506, -7.883436, 0, -0.5, 0.5, 0.5,
-0.2128417, -4.157506, -7.883436, 1, -0.5, 0.5, 0.5,
-0.2128417, -4.157506, -7.883436, 1, 1.5, 0.5, 0.5,
-0.2128417, -4.157506, -7.883436, 0, 1.5, 0.5, 0.5
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
-4.232171, 0.3732179, -7.883436, 0, -0.5, 0.5, 0.5,
-4.232171, 0.3732179, -7.883436, 1, -0.5, 0.5, 0.5,
-4.232171, 0.3732179, -7.883436, 1, 1.5, 0.5, 0.5,
-4.232171, 0.3732179, -7.883436, 0, 1.5, 0.5, 0.5
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
-4.232171, -4.157506, -0.2183454, 0, -0.5, 0.5, 0.5,
-4.232171, -4.157506, -0.2183454, 1, -0.5, 0.5, 0.5,
-4.232171, -4.157506, -0.2183454, 1, 1.5, 0.5, 0.5,
-4.232171, -4.157506, -0.2183454, 0, 1.5, 0.5, 0.5
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
-3, -3.111954, -6.114569,
2, -3.111954, -6.114569,
-3, -3.111954, -6.114569,
-3, -3.286213, -6.40938,
-2, -3.111954, -6.114569,
-2, -3.286213, -6.40938,
-1, -3.111954, -6.114569,
-1, -3.286213, -6.40938,
0, -3.111954, -6.114569,
0, -3.286213, -6.40938,
1, -3.111954, -6.114569,
1, -3.286213, -6.40938,
2, -3.111954, -6.114569,
2, -3.286213, -6.40938
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
-3, -3.63473, -6.999002, 0, -0.5, 0.5, 0.5,
-3, -3.63473, -6.999002, 1, -0.5, 0.5, 0.5,
-3, -3.63473, -6.999002, 1, 1.5, 0.5, 0.5,
-3, -3.63473, -6.999002, 0, 1.5, 0.5, 0.5,
-2, -3.63473, -6.999002, 0, -0.5, 0.5, 0.5,
-2, -3.63473, -6.999002, 1, -0.5, 0.5, 0.5,
-2, -3.63473, -6.999002, 1, 1.5, 0.5, 0.5,
-2, -3.63473, -6.999002, 0, 1.5, 0.5, 0.5,
-1, -3.63473, -6.999002, 0, -0.5, 0.5, 0.5,
-1, -3.63473, -6.999002, 1, -0.5, 0.5, 0.5,
-1, -3.63473, -6.999002, 1, 1.5, 0.5, 0.5,
-1, -3.63473, -6.999002, 0, 1.5, 0.5, 0.5,
0, -3.63473, -6.999002, 0, -0.5, 0.5, 0.5,
0, -3.63473, -6.999002, 1, -0.5, 0.5, 0.5,
0, -3.63473, -6.999002, 1, 1.5, 0.5, 0.5,
0, -3.63473, -6.999002, 0, 1.5, 0.5, 0.5,
1, -3.63473, -6.999002, 0, -0.5, 0.5, 0.5,
1, -3.63473, -6.999002, 1, -0.5, 0.5, 0.5,
1, -3.63473, -6.999002, 1, 1.5, 0.5, 0.5,
1, -3.63473, -6.999002, 0, 1.5, 0.5, 0.5,
2, -3.63473, -6.999002, 0, -0.5, 0.5, 0.5,
2, -3.63473, -6.999002, 1, -0.5, 0.5, 0.5,
2, -3.63473, -6.999002, 1, 1.5, 0.5, 0.5,
2, -3.63473, -6.999002, 0, 1.5, 0.5, 0.5
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
-3.304633, -3, -6.114569,
-3.304633, 3, -6.114569,
-3.304633, -3, -6.114569,
-3.459223, -3, -6.40938,
-3.304633, -2, -6.114569,
-3.459223, -2, -6.40938,
-3.304633, -1, -6.114569,
-3.459223, -1, -6.40938,
-3.304633, 0, -6.114569,
-3.459223, 0, -6.40938,
-3.304633, 1, -6.114569,
-3.459223, 1, -6.40938,
-3.304633, 2, -6.114569,
-3.459223, 2, -6.40938,
-3.304633, 3, -6.114569,
-3.459223, 3, -6.40938
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
-3.768402, -3, -6.999002, 0, -0.5, 0.5, 0.5,
-3.768402, -3, -6.999002, 1, -0.5, 0.5, 0.5,
-3.768402, -3, -6.999002, 1, 1.5, 0.5, 0.5,
-3.768402, -3, -6.999002, 0, 1.5, 0.5, 0.5,
-3.768402, -2, -6.999002, 0, -0.5, 0.5, 0.5,
-3.768402, -2, -6.999002, 1, -0.5, 0.5, 0.5,
-3.768402, -2, -6.999002, 1, 1.5, 0.5, 0.5,
-3.768402, -2, -6.999002, 0, 1.5, 0.5, 0.5,
-3.768402, -1, -6.999002, 0, -0.5, 0.5, 0.5,
-3.768402, -1, -6.999002, 1, -0.5, 0.5, 0.5,
-3.768402, -1, -6.999002, 1, 1.5, 0.5, 0.5,
-3.768402, -1, -6.999002, 0, 1.5, 0.5, 0.5,
-3.768402, 0, -6.999002, 0, -0.5, 0.5, 0.5,
-3.768402, 0, -6.999002, 1, -0.5, 0.5, 0.5,
-3.768402, 0, -6.999002, 1, 1.5, 0.5, 0.5,
-3.768402, 0, -6.999002, 0, 1.5, 0.5, 0.5,
-3.768402, 1, -6.999002, 0, -0.5, 0.5, 0.5,
-3.768402, 1, -6.999002, 1, -0.5, 0.5, 0.5,
-3.768402, 1, -6.999002, 1, 1.5, 0.5, 0.5,
-3.768402, 1, -6.999002, 0, 1.5, 0.5, 0.5,
-3.768402, 2, -6.999002, 0, -0.5, 0.5, 0.5,
-3.768402, 2, -6.999002, 1, -0.5, 0.5, 0.5,
-3.768402, 2, -6.999002, 1, 1.5, 0.5, 0.5,
-3.768402, 2, -6.999002, 0, 1.5, 0.5, 0.5,
-3.768402, 3, -6.999002, 0, -0.5, 0.5, 0.5,
-3.768402, 3, -6.999002, 1, -0.5, 0.5, 0.5,
-3.768402, 3, -6.999002, 1, 1.5, 0.5, 0.5,
-3.768402, 3, -6.999002, 0, 1.5, 0.5, 0.5
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
-3.304633, -3.111954, -4,
-3.304633, -3.111954, 4,
-3.304633, -3.111954, -4,
-3.459223, -3.286213, -4,
-3.304633, -3.111954, -2,
-3.459223, -3.286213, -2,
-3.304633, -3.111954, 0,
-3.459223, -3.286213, 0,
-3.304633, -3.111954, 2,
-3.459223, -3.286213, 2,
-3.304633, -3.111954, 4,
-3.459223, -3.286213, 4
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
-3.768402, -3.63473, -4, 0, -0.5, 0.5, 0.5,
-3.768402, -3.63473, -4, 1, -0.5, 0.5, 0.5,
-3.768402, -3.63473, -4, 1, 1.5, 0.5, 0.5,
-3.768402, -3.63473, -4, 0, 1.5, 0.5, 0.5,
-3.768402, -3.63473, -2, 0, -0.5, 0.5, 0.5,
-3.768402, -3.63473, -2, 1, -0.5, 0.5, 0.5,
-3.768402, -3.63473, -2, 1, 1.5, 0.5, 0.5,
-3.768402, -3.63473, -2, 0, 1.5, 0.5, 0.5,
-3.768402, -3.63473, 0, 0, -0.5, 0.5, 0.5,
-3.768402, -3.63473, 0, 1, -0.5, 0.5, 0.5,
-3.768402, -3.63473, 0, 1, 1.5, 0.5, 0.5,
-3.768402, -3.63473, 0, 0, 1.5, 0.5, 0.5,
-3.768402, -3.63473, 2, 0, -0.5, 0.5, 0.5,
-3.768402, -3.63473, 2, 1, -0.5, 0.5, 0.5,
-3.768402, -3.63473, 2, 1, 1.5, 0.5, 0.5,
-3.768402, -3.63473, 2, 0, 1.5, 0.5, 0.5,
-3.768402, -3.63473, 4, 0, -0.5, 0.5, 0.5,
-3.768402, -3.63473, 4, 1, -0.5, 0.5, 0.5,
-3.768402, -3.63473, 4, 1, 1.5, 0.5, 0.5,
-3.768402, -3.63473, 4, 0, 1.5, 0.5, 0.5
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
-3.304633, -3.111954, -6.114569,
-3.304633, 3.85839, -6.114569,
-3.304633, -3.111954, 5.677878,
-3.304633, 3.85839, 5.677878,
-3.304633, -3.111954, -6.114569,
-3.304633, -3.111954, 5.677878,
-3.304633, 3.85839, -6.114569,
-3.304633, 3.85839, 5.677878,
-3.304633, -3.111954, -6.114569,
2.87895, -3.111954, -6.114569,
-3.304633, -3.111954, 5.677878,
2.87895, -3.111954, 5.677878,
-3.304633, 3.85839, -6.114569,
2.87895, 3.85839, -6.114569,
-3.304633, 3.85839, 5.677878,
2.87895, 3.85839, 5.677878,
2.87895, -3.111954, -6.114569,
2.87895, 3.85839, -6.114569,
2.87895, -3.111954, 5.677878,
2.87895, 3.85839, 5.677878,
2.87895, -3.111954, -6.114569,
2.87895, -3.111954, 5.677878,
2.87895, 3.85839, -6.114569,
2.87895, 3.85839, 5.677878
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
var radius = 8.025432;
var distance = 35.70605;
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
mvMatrix.translate( 0.2128417, -0.3732179, 0.2183454 );
mvMatrix.scale( 1.403273, 1.244882, 0.7358315 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.70605);
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
Methabenzthiazuron<-read.table("Methabenzthiazuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Methabenzthiazuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methabenzthiazuron' not found
```

```r
y<-Methabenzthiazuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methabenzthiazuron' not found
```

```r
z<-Methabenzthiazuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methabenzthiazuron' not found
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
-3.214581, -0.5335755, -2.283723, 0, 0, 1, 1, 1,
-2.954608, -0.3179179, -1.263341, 1, 0, 0, 1, 1,
-2.906263, -1.093764, -2.133074, 1, 0, 0, 1, 1,
-2.830498, -0.6538133, -2.602024, 1, 0, 0, 1, 1,
-2.726663, -0.78896, -2.838058, 1, 0, 0, 1, 1,
-2.524112, -1.695462, -3.463266, 1, 0, 0, 1, 1,
-2.44817, 1.503865, -1.164281, 0, 0, 0, 1, 1,
-2.417435, -0.8751005, -1.751729, 0, 0, 0, 1, 1,
-2.376664, -1.411357, -2.393396, 0, 0, 0, 1, 1,
-2.374926, -0.4024623, -0.8125531, 0, 0, 0, 1, 1,
-2.362667, -0.3372374, -1.757231, 0, 0, 0, 1, 1,
-2.358408, -0.8126987, -2.193386, 0, 0, 0, 1, 1,
-2.292026, 0.9352779, -2.454267, 0, 0, 0, 1, 1,
-2.275833, -0.2369765, -2.092288, 1, 1, 1, 1, 1,
-2.275748, 0.450524, -0.6353446, 1, 1, 1, 1, 1,
-2.237359, -0.6602141, -2.459992, 1, 1, 1, 1, 1,
-2.234792, -0.7837804, -2.874713, 1, 1, 1, 1, 1,
-2.231658, 0.9832342, -1.207011, 1, 1, 1, 1, 1,
-2.219734, 0.6133458, -2.150451, 1, 1, 1, 1, 1,
-2.219202, -1.537825, -3.179551, 1, 1, 1, 1, 1,
-2.213179, -1.379174, -3.341707, 1, 1, 1, 1, 1,
-2.211874, 0.7772425, -2.711787, 1, 1, 1, 1, 1,
-2.210069, 1.044568, -2.041472, 1, 1, 1, 1, 1,
-2.207508, -0.7568817, -2.598086, 1, 1, 1, 1, 1,
-2.193918, -0.8319705, -1.678706, 1, 1, 1, 1, 1,
-2.173334, 0.03787977, -1.223851, 1, 1, 1, 1, 1,
-2.129016, 1.467337, -0.5236027, 1, 1, 1, 1, 1,
-2.110386, 2.034125, -1.595257, 1, 1, 1, 1, 1,
-2.099805, 0.8751048, -0.275783, 0, 0, 1, 1, 1,
-2.061465, 0.9244592, -0.7521158, 1, 0, 0, 1, 1,
-1.991181, -0.9631099, -2.262857, 1, 0, 0, 1, 1,
-1.965141, -0.1655225, -1.672009, 1, 0, 0, 1, 1,
-1.956556, -0.4979595, -2.305479, 1, 0, 0, 1, 1,
-1.95144, 1.310485, -1.08446, 1, 0, 0, 1, 1,
-1.930093, -0.7704889, -4.432352, 0, 0, 0, 1, 1,
-1.92409, 0.6867407, -1.937392, 0, 0, 0, 1, 1,
-1.917214, 0.9381785, -2.718881, 0, 0, 0, 1, 1,
-1.883708, 0.9491193, -1.139853, 0, 0, 0, 1, 1,
-1.853083, -0.02881591, -1.461399, 0, 0, 0, 1, 1,
-1.845599, -0.6222958, -1.673249, 0, 0, 0, 1, 1,
-1.842488, 0.3305503, -1.461841, 0, 0, 0, 1, 1,
-1.835801, 1.048806, -1.284368, 1, 1, 1, 1, 1,
-1.835206, -1.807235, -2.022579, 1, 1, 1, 1, 1,
-1.806679, 1.808894, -1.343774, 1, 1, 1, 1, 1,
-1.803702, -1.201966, -1.86323, 1, 1, 1, 1, 1,
-1.801712, 0.180993, -2.908132, 1, 1, 1, 1, 1,
-1.771052, 0.1250057, -1.317735, 1, 1, 1, 1, 1,
-1.77102, -0.01684515, -2.065168, 1, 1, 1, 1, 1,
-1.750864, -0.4996262, -1.218657, 1, 1, 1, 1, 1,
-1.747291, -2.695887, -1.936772, 1, 1, 1, 1, 1,
-1.737646, -0.1289308, -1.151852, 1, 1, 1, 1, 1,
-1.722769, -0.806818, -3.490854, 1, 1, 1, 1, 1,
-1.715958, -0.8225755, -2.731048, 1, 1, 1, 1, 1,
-1.70981, -0.1547383, -2.151616, 1, 1, 1, 1, 1,
-1.706611, -1.484735, -2.047232, 1, 1, 1, 1, 1,
-1.665324, -0.2788562, 0.0501451, 1, 1, 1, 1, 1,
-1.662229, -0.1598963, -0.3699712, 0, 0, 1, 1, 1,
-1.661832, -1.148433, -2.704904, 1, 0, 0, 1, 1,
-1.658795, 1.725996, -0.9435313, 1, 0, 0, 1, 1,
-1.650378, 0.4710673, -1.236688, 1, 0, 0, 1, 1,
-1.650021, 1.272142, -2.000959, 1, 0, 0, 1, 1,
-1.634039, 0.2180487, -1.448681, 1, 0, 0, 1, 1,
-1.618955, 0.5679288, 0.5438275, 0, 0, 0, 1, 1,
-1.610492, 0.8935186, 0.7826422, 0, 0, 0, 1, 1,
-1.609704, 0.01232599, -2.160808, 0, 0, 0, 1, 1,
-1.608202, 0.6804729, -0.6053617, 0, 0, 0, 1, 1,
-1.605772, -0.1827323, -3.140293, 0, 0, 0, 1, 1,
-1.596016, 0.5392141, -1.264918, 0, 0, 0, 1, 1,
-1.585896, 0.9620135, -0.1969707, 0, 0, 0, 1, 1,
-1.575659, 2.648418, -0.4653673, 1, 1, 1, 1, 1,
-1.575387, -0.0440885, 0.603774, 1, 1, 1, 1, 1,
-1.572466, 0.3468719, -1.579807, 1, 1, 1, 1, 1,
-1.563668, -0.2334383, -1.402229, 1, 1, 1, 1, 1,
-1.563612, 0.5712156, -2.175477, 1, 1, 1, 1, 1,
-1.561978, -1.812119, -2.63012, 1, 1, 1, 1, 1,
-1.558329, -0.4073746, -0.6577184, 1, 1, 1, 1, 1,
-1.549684, -0.7870009, -2.177652, 1, 1, 1, 1, 1,
-1.540534, 0.1427169, -1.144838, 1, 1, 1, 1, 1,
-1.520932, -1.072821, -2.493936, 1, 1, 1, 1, 1,
-1.520763, -1.350154, -0.904247, 1, 1, 1, 1, 1,
-1.516924, 0.7942638, -0.3745284, 1, 1, 1, 1, 1,
-1.510833, -0.3863968, -1.690742, 1, 1, 1, 1, 1,
-1.50109, -0.9588115, -2.661619, 1, 1, 1, 1, 1,
-1.498345, -0.2247745, -1.190203, 1, 1, 1, 1, 1,
-1.472025, -0.3930991, -1.327939, 0, 0, 1, 1, 1,
-1.46763, -0.4291263, -0.494495, 1, 0, 0, 1, 1,
-1.465691, -1.201956, -1.146209, 1, 0, 0, 1, 1,
-1.465598, 0.3168817, -2.220208, 1, 0, 0, 1, 1,
-1.459699, 1.190181, -0.9987004, 1, 0, 0, 1, 1,
-1.449722, -0.9864722, -2.058535, 1, 0, 0, 1, 1,
-1.448554, -0.739661, -2.839221, 0, 0, 0, 1, 1,
-1.446472, 0.2641006, -1.768756, 0, 0, 0, 1, 1,
-1.443523, 1.707299, -1.606901, 0, 0, 0, 1, 1,
-1.438342, 0.9765065, -0.9410141, 0, 0, 0, 1, 1,
-1.425861, -0.3845934, -2.285797, 0, 0, 0, 1, 1,
-1.422298, 1.010312, -1.593596, 0, 0, 0, 1, 1,
-1.413395, -1.892386, -1.957615, 0, 0, 0, 1, 1,
-1.404995, -0.8427633, -2.511632, 1, 1, 1, 1, 1,
-1.400851, 0.08600335, -1.126477, 1, 1, 1, 1, 1,
-1.379419, -0.8964675, -3.600918, 1, 1, 1, 1, 1,
-1.377731, -0.1351802, -2.938315, 1, 1, 1, 1, 1,
-1.374076, 0.1034181, -1.367269, 1, 1, 1, 1, 1,
-1.373201, 0.2112822, -1.44778, 1, 1, 1, 1, 1,
-1.361298, -0.8843791, -3.789058, 1, 1, 1, 1, 1,
-1.341845, -3.010444, -2.335257, 1, 1, 1, 1, 1,
-1.341249, 1.097045, 1.331875, 1, 1, 1, 1, 1,
-1.340792, 0.8791519, -1.253811, 1, 1, 1, 1, 1,
-1.334929, -0.2484864, -1.227102, 1, 1, 1, 1, 1,
-1.333757, 1.187662, 1.180516, 1, 1, 1, 1, 1,
-1.31802, -0.741666, -1.68178, 1, 1, 1, 1, 1,
-1.315367, -0.2971309, -1.836311, 1, 1, 1, 1, 1,
-1.308092, -2.848131, -2.840894, 1, 1, 1, 1, 1,
-1.307831, 0.8566087, -1.125913, 0, 0, 1, 1, 1,
-1.301507, 1.26884, -0.6441063, 1, 0, 0, 1, 1,
-1.30038, 0.2955502, 1.90856, 1, 0, 0, 1, 1,
-1.296877, -1.284222, -2.180695, 1, 0, 0, 1, 1,
-1.296756, 0.5204406, -2.37332, 1, 0, 0, 1, 1,
-1.292388, 0.9741672, -0.0351589, 1, 0, 0, 1, 1,
-1.291639, -0.6561418, -2.198838, 0, 0, 0, 1, 1,
-1.288733, 0.80071, -0.4797929, 0, 0, 0, 1, 1,
-1.284425, -0.5760324, -0.7381031, 0, 0, 0, 1, 1,
-1.273764, -0.1783623, -2.626428, 0, 0, 0, 1, 1,
-1.270775, -1.400925, -3.091796, 0, 0, 0, 1, 1,
-1.25436, 0.7800623, -2.621499, 0, 0, 0, 1, 1,
-1.251803, -0.7259026, -0.5312692, 0, 0, 0, 1, 1,
-1.24484, 0.1170102, -3.175439, 1, 1, 1, 1, 1,
-1.237609, 0.9361641, -1.768511, 1, 1, 1, 1, 1,
-1.234397, 1.232852, -0.9664072, 1, 1, 1, 1, 1,
-1.231306, 1.529376, -0.9840238, 1, 1, 1, 1, 1,
-1.222605, -0.7360193, -0.7587915, 1, 1, 1, 1, 1,
-1.211087, 0.4771512, -0.9409125, 1, 1, 1, 1, 1,
-1.207037, 0.8815486, -1.157024, 1, 1, 1, 1, 1,
-1.20191, 0.3495305, -0.6011318, 1, 1, 1, 1, 1,
-1.189944, 0.6334646, -1.617582, 1, 1, 1, 1, 1,
-1.184769, 0.8491474, -1.797267, 1, 1, 1, 1, 1,
-1.173268, -0.05609018, 0.2451374, 1, 1, 1, 1, 1,
-1.17265, 0.7517382, -0.236341, 1, 1, 1, 1, 1,
-1.16945, -0.2360293, -0.7701492, 1, 1, 1, 1, 1,
-1.169252, -2.008233, -2.584356, 1, 1, 1, 1, 1,
-1.155309, -0.3921125, -1.294208, 1, 1, 1, 1, 1,
-1.150256, -0.3386314, -2.372926, 0, 0, 1, 1, 1,
-1.144195, -0.1406026, -2.433255, 1, 0, 0, 1, 1,
-1.135712, -1.357947, -1.538493, 1, 0, 0, 1, 1,
-1.12394, 0.6907458, 0.3319245, 1, 0, 0, 1, 1,
-1.113377, -2.482114, -4.194368, 1, 0, 0, 1, 1,
-1.112794, -1.252555, -1.642672, 1, 0, 0, 1, 1,
-1.112278, -0.8147751, -2.431513, 0, 0, 0, 1, 1,
-1.110052, -1.253535, -2.867341, 0, 0, 0, 1, 1,
-1.106136, -2.001334, -4.771034, 0, 0, 0, 1, 1,
-1.092962, 0.4303132, -0.5622613, 0, 0, 0, 1, 1,
-1.092178, -0.7013716, -1.988352, 0, 0, 0, 1, 1,
-1.089128, -1.18285, -2.728612, 0, 0, 0, 1, 1,
-1.08902, 0.7896625, -2.185102, 0, 0, 0, 1, 1,
-1.088867, -0.4091997, -1.81818, 1, 1, 1, 1, 1,
-1.088041, 0.06118273, -0.2165511, 1, 1, 1, 1, 1,
-1.085055, 0.3158056, -1.971072, 1, 1, 1, 1, 1,
-1.080701, 0.5664279, -2.732641, 1, 1, 1, 1, 1,
-1.080083, 0.2821935, -1.547604, 1, 1, 1, 1, 1,
-1.076561, 0.5502043, -0.3579631, 1, 1, 1, 1, 1,
-1.057351, -1.14281, -2.200953, 1, 1, 1, 1, 1,
-1.057115, 0.6847306, -0.5405725, 1, 1, 1, 1, 1,
-1.040716, -0.3989616, -1.991488, 1, 1, 1, 1, 1,
-1.040084, -0.9995924, -2.299296, 1, 1, 1, 1, 1,
-1.039959, 0.9583132, -1.097065, 1, 1, 1, 1, 1,
-1.039003, -1.306765, -1.867559, 1, 1, 1, 1, 1,
-1.036455, 0.1555805, -2.216856, 1, 1, 1, 1, 1,
-1.033745, 0.2087004, -2.135527, 1, 1, 1, 1, 1,
-1.033742, 1.230198, -2.577495, 1, 1, 1, 1, 1,
-1.033502, 0.4302863, -2.035016, 0, 0, 1, 1, 1,
-1.03, 0.565368, -1.413847, 1, 0, 0, 1, 1,
-1.028238, 2.208633, -1.847652, 1, 0, 0, 1, 1,
-1.028037, 1.519903, -1.449614, 1, 0, 0, 1, 1,
-1.025851, -0.8459772, -1.414319, 1, 0, 0, 1, 1,
-1.024124, -1.252183, -3.238039, 1, 0, 0, 1, 1,
-1.015642, -0.5787488, -3.580151, 0, 0, 0, 1, 1,
-1.013313, 0.1848925, -1.922942, 0, 0, 0, 1, 1,
-1.009741, -0.003344746, -2.97731, 0, 0, 0, 1, 1,
-1.002146, -0.08385517, -0.1744895, 0, 0, 0, 1, 1,
-1.001708, 1.066462, 0.8164532, 0, 0, 0, 1, 1,
-1.000462, -0.6641076, -2.359485, 0, 0, 0, 1, 1,
-0.9978872, 2.583737, -2.48706, 0, 0, 0, 1, 1,
-0.9954717, -0.5385544, -1.915697, 1, 1, 1, 1, 1,
-0.9927944, 0.1384709, -2.722988, 1, 1, 1, 1, 1,
-0.9925904, 0.1717482, -1.606189, 1, 1, 1, 1, 1,
-0.9891401, -0.9159385, -3.274909, 1, 1, 1, 1, 1,
-0.9874848, -0.2036773, -2.084708, 1, 1, 1, 1, 1,
-0.9846457, 0.3134933, -0.2466995, 1, 1, 1, 1, 1,
-0.9843579, 0.4230043, -0.7776005, 1, 1, 1, 1, 1,
-0.9682807, -0.3168979, -1.391007, 1, 1, 1, 1, 1,
-0.9665701, -1.986586, -5.942834, 1, 1, 1, 1, 1,
-0.9663842, 0.2747976, 0.7263376, 1, 1, 1, 1, 1,
-0.9660609, 0.9478585, 0.7868137, 1, 1, 1, 1, 1,
-0.9647223, -0.7365429, -1.824142, 1, 1, 1, 1, 1,
-0.9492885, -0.5581096, -2.6812, 1, 1, 1, 1, 1,
-0.9484367, 0.6925825, -0.03742731, 1, 1, 1, 1, 1,
-0.9395406, 0.7533749, -0.5997921, 1, 1, 1, 1, 1,
-0.938845, 0.1195838, -3.239581, 0, 0, 1, 1, 1,
-0.9316688, 0.1863706, -0.7096442, 1, 0, 0, 1, 1,
-0.9284477, 0.07504234, -2.569448, 1, 0, 0, 1, 1,
-0.9197724, 0.2237469, -1.481188, 1, 0, 0, 1, 1,
-0.9174238, -1.942636, -4.133143, 1, 0, 0, 1, 1,
-0.913677, 0.9035362, -0.5195798, 1, 0, 0, 1, 1,
-0.910263, 1.213257, -1.228043, 0, 0, 0, 1, 1,
-0.9079335, 0.4229615, 1.270428, 0, 0, 0, 1, 1,
-0.9012545, -0.04878445, -2.756227, 0, 0, 0, 1, 1,
-0.9009268, -2.131735, -2.302447, 0, 0, 0, 1, 1,
-0.8938867, -0.5158256, -3.296094, 0, 0, 0, 1, 1,
-0.8896194, 1.701466, -1.112032, 0, 0, 0, 1, 1,
-0.881489, -0.2232656, -2.239129, 0, 0, 0, 1, 1,
-0.8773878, 0.3905452, -1.709167, 1, 1, 1, 1, 1,
-0.8771465, -0.04780186, -0.4609104, 1, 1, 1, 1, 1,
-0.870908, 1.388867, -0.5492979, 1, 1, 1, 1, 1,
-0.8703222, 0.4342824, -0.1504187, 1, 1, 1, 1, 1,
-0.8685859, 1.283729, -0.8599047, 1, 1, 1, 1, 1,
-0.8684888, -2.401814, -0.6187105, 1, 1, 1, 1, 1,
-0.8679615, -0.8391721, -2.573062, 1, 1, 1, 1, 1,
-0.863142, -0.1062017, -1.05578, 1, 1, 1, 1, 1,
-0.856336, -1.174862, -3.181544, 1, 1, 1, 1, 1,
-0.8512607, -0.5130547, -1.018533, 1, 1, 1, 1, 1,
-0.8486595, -0.8060995, -3.604862, 1, 1, 1, 1, 1,
-0.8480039, -0.1272522, -1.629383, 1, 1, 1, 1, 1,
-0.8479677, -0.4286956, -1.106319, 1, 1, 1, 1, 1,
-0.8466047, -0.5147424, -1.490648, 1, 1, 1, 1, 1,
-0.8404004, 0.4769075, -0.6650546, 1, 1, 1, 1, 1,
-0.8399102, 0.6893726, -1.429674, 0, 0, 1, 1, 1,
-0.8352591, 1.381457, -0.4145961, 1, 0, 0, 1, 1,
-0.8330005, 0.2910244, -0.5295215, 1, 0, 0, 1, 1,
-0.8304782, -0.6238018, -0.660758, 1, 0, 0, 1, 1,
-0.8294736, -0.9202005, -3.275841, 1, 0, 0, 1, 1,
-0.8260631, -0.4663061, -3.750524, 1, 0, 0, 1, 1,
-0.8236699, 0.3035509, -1.004378, 0, 0, 0, 1, 1,
-0.8210187, -1.008529, -2.624032, 0, 0, 0, 1, 1,
-0.8168769, -0.3925639, -2.063466, 0, 0, 0, 1, 1,
-0.8107013, -0.432244, -2.230687, 0, 0, 0, 1, 1,
-0.8006261, -0.08302794, -1.914668, 0, 0, 0, 1, 1,
-0.7901987, -0.7990367, -3.62796, 0, 0, 0, 1, 1,
-0.788806, 0.5337293, -1.853819, 0, 0, 0, 1, 1,
-0.7868695, 1.1781, -1.009308, 1, 1, 1, 1, 1,
-0.7860402, 1.155833, -0.347297, 1, 1, 1, 1, 1,
-0.7823679, -1.530387, -2.76982, 1, 1, 1, 1, 1,
-0.7782592, -0.7410014, -2.395626, 1, 1, 1, 1, 1,
-0.7765243, -2.865807, -3.074617, 1, 1, 1, 1, 1,
-0.7698779, -1.552036, -3.343876, 1, 1, 1, 1, 1,
-0.7562223, 0.1821157, -1.235733, 1, 1, 1, 1, 1,
-0.7446615, 1.472251, -1.359132, 1, 1, 1, 1, 1,
-0.7378002, -0.7058663, -3.295135, 1, 1, 1, 1, 1,
-0.7330253, -0.4971485, -1.882983, 1, 1, 1, 1, 1,
-0.7316005, -2.975949, -1.335489, 1, 1, 1, 1, 1,
-0.7253049, -0.9287015, -3.025769, 1, 1, 1, 1, 1,
-0.7235667, -0.1739054, -1.879739, 1, 1, 1, 1, 1,
-0.7226002, -0.9566963, -2.797102, 1, 1, 1, 1, 1,
-0.7206658, -0.1677386, -3.159862, 1, 1, 1, 1, 1,
-0.7174464, -1.415193, -3.050296, 0, 0, 1, 1, 1,
-0.7166959, 0.5336784, -0.7153134, 1, 0, 0, 1, 1,
-0.7151076, 0.3762139, -1.141149, 1, 0, 0, 1, 1,
-0.7080433, -0.1457877, -1.048601, 1, 0, 0, 1, 1,
-0.7073559, 0.242338, -1.275534, 1, 0, 0, 1, 1,
-0.706641, 1.184536, -2.242947, 1, 0, 0, 1, 1,
-0.6975157, -0.1269896, -1.838153, 0, 0, 0, 1, 1,
-0.6965468, -0.4031833, -1.49082, 0, 0, 0, 1, 1,
-0.696261, 0.2358694, -2.781814, 0, 0, 0, 1, 1,
-0.6960137, -1.004117, -1.591463, 0, 0, 0, 1, 1,
-0.6955747, -0.7148368, -2.549873, 0, 0, 0, 1, 1,
-0.6955162, 1.442978, -1.823138, 0, 0, 0, 1, 1,
-0.693953, -0.3825822, -0.8329408, 0, 0, 0, 1, 1,
-0.6878416, -0.1240088, -1.472882, 1, 1, 1, 1, 1,
-0.6769071, -0.4980022, -3.100846, 1, 1, 1, 1, 1,
-0.6757582, 0.206052, -2.598159, 1, 1, 1, 1, 1,
-0.6742574, -0.8102331, -2.414227, 1, 1, 1, 1, 1,
-0.665144, -1.279987, -2.90075, 1, 1, 1, 1, 1,
-0.6648408, -1.368076, -3.990131, 1, 1, 1, 1, 1,
-0.6600116, 1.1688, 1.305744, 1, 1, 1, 1, 1,
-0.6579618, -0.6466656, -4.496812, 1, 1, 1, 1, 1,
-0.650643, 0.4965439, -0.56665, 1, 1, 1, 1, 1,
-0.6476572, 0.9183187, -1.136976, 1, 1, 1, 1, 1,
-0.6377023, 1.020115, -1.262634, 1, 1, 1, 1, 1,
-0.6353202, -0.5435798, -1.798072, 1, 1, 1, 1, 1,
-0.6339344, 0.4171695, -2.116791, 1, 1, 1, 1, 1,
-0.6289294, -0.3218321, -3.127379, 1, 1, 1, 1, 1,
-0.626845, -0.6943183, -2.499646, 1, 1, 1, 1, 1,
-0.6240437, 0.8214572, -0.161538, 0, 0, 1, 1, 1,
-0.6216679, -0.07409909, -2.707667, 1, 0, 0, 1, 1,
-0.6186653, -1.400059, -1.247394, 1, 0, 0, 1, 1,
-0.6076539, 0.1976496, -1.646436, 1, 0, 0, 1, 1,
-0.6070955, -2.319127, -4.326335, 1, 0, 0, 1, 1,
-0.6051809, 0.1045178, 0.8414461, 1, 0, 0, 1, 1,
-0.597894, 0.4710405, 1.418463, 0, 0, 0, 1, 1,
-0.5915093, -0.1019061, -1.680662, 0, 0, 0, 1, 1,
-0.5899566, -0.7015936, -4.509023, 0, 0, 0, 1, 1,
-0.5881273, -0.4361601, -3.362344, 0, 0, 0, 1, 1,
-0.5874984, 0.9191984, -0.7787861, 0, 0, 0, 1, 1,
-0.5846373, 0.8847144, -0.7554799, 0, 0, 0, 1, 1,
-0.58379, 0.4429083, -0.1654733, 0, 0, 0, 1, 1,
-0.5803008, 1.253, 0.3876995, 1, 1, 1, 1, 1,
-0.5771199, 0.2134868, 0.3727346, 1, 1, 1, 1, 1,
-0.573797, -0.6672841, -3.276274, 1, 1, 1, 1, 1,
-0.5730015, 0.1676167, -0.2631163, 1, 1, 1, 1, 1,
-0.570483, 0.2139346, -1.882502, 1, 1, 1, 1, 1,
-0.5678136, -1.129728, -3.101418, 1, 1, 1, 1, 1,
-0.5655749, 0.1204224, -1.719565, 1, 1, 1, 1, 1,
-0.5630826, 1.349329, 0.08232421, 1, 1, 1, 1, 1,
-0.5616259, -1.224759, -2.859555, 1, 1, 1, 1, 1,
-0.5608771, 0.2995142, -0.3112077, 1, 1, 1, 1, 1,
-0.5562038, -0.08578792, -2.444073, 1, 1, 1, 1, 1,
-0.5412678, 0.6841887, -0.8775573, 1, 1, 1, 1, 1,
-0.5345395, 1.240788, -0.375444, 1, 1, 1, 1, 1,
-0.5313967, -0.4266993, -1.989216, 1, 1, 1, 1, 1,
-0.5304335, -1.902164, -2.338337, 1, 1, 1, 1, 1,
-0.5288773, -0.7955254, -2.93926, 0, 0, 1, 1, 1,
-0.5285082, 0.3131437, -0.501351, 1, 0, 0, 1, 1,
-0.5262074, -1.076511, -2.367681, 1, 0, 0, 1, 1,
-0.5228664, 0.6683615, -0.8055525, 1, 0, 0, 1, 1,
-0.5100092, 0.63925, -1.063341, 1, 0, 0, 1, 1,
-0.5086024, 0.9290776, -0.6126325, 1, 0, 0, 1, 1,
-0.5082912, 0.580825, -0.6846819, 0, 0, 0, 1, 1,
-0.5074376, -0.5034824, -2.354688, 0, 0, 0, 1, 1,
-0.5071931, -0.9985055, -1.45057, 0, 0, 0, 1, 1,
-0.5060221, 0.0512764, -1.47841, 0, 0, 0, 1, 1,
-0.503008, 0.6523078, -0.3845629, 0, 0, 0, 1, 1,
-0.4942362, 0.5492301, 0.2641956, 0, 0, 0, 1, 1,
-0.4912864, -0.1293205, -1.890543, 0, 0, 0, 1, 1,
-0.4888212, -0.7081352, -2.192498, 1, 1, 1, 1, 1,
-0.4883139, -1.299851, -2.41226, 1, 1, 1, 1, 1,
-0.4878513, 0.6388724, 0.6423637, 1, 1, 1, 1, 1,
-0.4864951, 0.1190773, -1.403814, 1, 1, 1, 1, 1,
-0.4837293, 0.628199, -1.729152, 1, 1, 1, 1, 1,
-0.4815714, -0.1185591, -3.843361, 1, 1, 1, 1, 1,
-0.4766296, 0.7935343, -1.65231, 1, 1, 1, 1, 1,
-0.4709736, -0.7209743, -1.646887, 1, 1, 1, 1, 1,
-0.4695594, -0.1157481, 0.1385314, 1, 1, 1, 1, 1,
-0.4672966, 0.4404829, 0.0146059, 1, 1, 1, 1, 1,
-0.4667555, 1.095585, -0.5407501, 1, 1, 1, 1, 1,
-0.465462, -2.102712, -2.431611, 1, 1, 1, 1, 1,
-0.4615459, 0.008896344, -1.037867, 1, 1, 1, 1, 1,
-0.4582416, 0.1810569, -1.797227, 1, 1, 1, 1, 1,
-0.4569288, -0.4225626, -1.169177, 1, 1, 1, 1, 1,
-0.4490793, 0.2137249, -0.6529848, 0, 0, 1, 1, 1,
-0.4472847, 1.585419, -0.3404526, 1, 0, 0, 1, 1,
-0.439875, 0.3778396, 0.9904652, 1, 0, 0, 1, 1,
-0.4391586, 0.4211334, -1.800892, 1, 0, 0, 1, 1,
-0.4386731, 0.3506886, -1.489432, 1, 0, 0, 1, 1,
-0.4354811, 0.2110546, 0.9699508, 1, 0, 0, 1, 1,
-0.4262816, -0.3782917, -2.230742, 0, 0, 0, 1, 1,
-0.4207203, 1.296842, 1.673899, 0, 0, 0, 1, 1,
-0.4202361, -0.2191157, -0.5416554, 0, 0, 0, 1, 1,
-0.4163204, 0.5873383, 0.07616942, 0, 0, 0, 1, 1,
-0.4146854, 0.6719226, -0.1340325, 0, 0, 0, 1, 1,
-0.4121253, 0.5397436, -1.555025, 0, 0, 0, 1, 1,
-0.4039948, -0.3725093, -0.9353866, 0, 0, 0, 1, 1,
-0.4032478, -1.691206, -1.602213, 1, 1, 1, 1, 1,
-0.4013402, 0.4716692, -1.217453, 1, 1, 1, 1, 1,
-0.39993, 0.3255368, -1.121191, 1, 1, 1, 1, 1,
-0.3952904, 0.6144108, -1.427292, 1, 1, 1, 1, 1,
-0.3920287, -0.007337736, -0.6869564, 1, 1, 1, 1, 1,
-0.3864317, -0.8725895, -2.041034, 1, 1, 1, 1, 1,
-0.3824206, -1.687355, -3.026854, 1, 1, 1, 1, 1,
-0.3766204, 0.2565214, -1.295598, 1, 1, 1, 1, 1,
-0.372566, 1.313023, 0.1765409, 1, 1, 1, 1, 1,
-0.3712459, 1.351907, -0.8106102, 1, 1, 1, 1, 1,
-0.3678523, -0.4571505, -3.557782, 1, 1, 1, 1, 1,
-0.3675936, 1.292904, -1.182435, 1, 1, 1, 1, 1,
-0.367479, -0.436422, -1.468606, 1, 1, 1, 1, 1,
-0.3625091, -0.4555332, -2.542229, 1, 1, 1, 1, 1,
-0.3609699, -2.37636, -2.96453, 1, 1, 1, 1, 1,
-0.3606254, 1.226876, 0.1459408, 0, 0, 1, 1, 1,
-0.3598574, -2.169409, -2.84081, 1, 0, 0, 1, 1,
-0.3570884, -0.50387, -2.440653, 1, 0, 0, 1, 1,
-0.3570646, -2.051418, -2.04811, 1, 0, 0, 1, 1,
-0.3530712, -0.2804222, -3.803339, 1, 0, 0, 1, 1,
-0.3522376, 0.1038957, -0.8803847, 1, 0, 0, 1, 1,
-0.3460984, -0.4109251, -1.393904, 0, 0, 0, 1, 1,
-0.3433137, 0.5994729, -0.6308144, 0, 0, 0, 1, 1,
-0.3429789, -0.2122286, -2.569697, 0, 0, 0, 1, 1,
-0.3419925, -1.264913, -3.527603, 0, 0, 0, 1, 1,
-0.3393131, -1.798923, -3.167353, 0, 0, 0, 1, 1,
-0.3378165, 0.4532361, -1.369106, 0, 0, 0, 1, 1,
-0.3331142, -0.6071314, -3.067313, 0, 0, 0, 1, 1,
-0.3259647, 1.580045, -0.364841, 1, 1, 1, 1, 1,
-0.3211535, -1.05203, -2.030826, 1, 1, 1, 1, 1,
-0.3182956, -0.5013465, -2.395794, 1, 1, 1, 1, 1,
-0.3168125, -0.134922, -0.009354685, 1, 1, 1, 1, 1,
-0.3065286, 1.784974, 1.055072, 1, 1, 1, 1, 1,
-0.306463, -0.8880756, -2.758338, 1, 1, 1, 1, 1,
-0.2981337, -0.1396033, -4.592678, 1, 1, 1, 1, 1,
-0.297331, 1.26621, -0.622372, 1, 1, 1, 1, 1,
-0.2955898, -0.9917685, -2.29573, 1, 1, 1, 1, 1,
-0.2926673, -0.3501702, -1.291754, 1, 1, 1, 1, 1,
-0.2909949, -0.2806578, -2.624599, 1, 1, 1, 1, 1,
-0.2869797, -1.480635, -4.802353, 1, 1, 1, 1, 1,
-0.2847021, 1.406632, -0.09637527, 1, 1, 1, 1, 1,
-0.2844673, 0.2138114, -0.6700816, 1, 1, 1, 1, 1,
-0.2841989, -1.079097, -3.721895, 1, 1, 1, 1, 1,
-0.284196, -2.757538, -2.565816, 0, 0, 1, 1, 1,
-0.2833748, 0.4430825, -1.608148, 1, 0, 0, 1, 1,
-0.2797168, -0.2726598, -3.313945, 1, 0, 0, 1, 1,
-0.2763533, 1.357682, 0.7518983, 1, 0, 0, 1, 1,
-0.2751879, -1.443222, -3.07016, 1, 0, 0, 1, 1,
-0.2750705, -0.07856234, -2.241152, 1, 0, 0, 1, 1,
-0.2724729, 1.447942, 0.258556, 0, 0, 0, 1, 1,
-0.2689219, -0.5786831, -3.396427, 0, 0, 0, 1, 1,
-0.2675017, -0.2826809, -2.972303, 0, 0, 0, 1, 1,
-0.267226, -0.8951774, -3.745916, 0, 0, 0, 1, 1,
-0.2669436, 0.1436463, -1.71704, 0, 0, 0, 1, 1,
-0.2669108, 0.5765489, -2.226175, 0, 0, 0, 1, 1,
-0.263211, 0.2945844, -0.5718942, 0, 0, 0, 1, 1,
-0.2534885, -0.1859814, -3.90488, 1, 1, 1, 1, 1,
-0.2526372, 0.4104572, -0.3991097, 1, 1, 1, 1, 1,
-0.2485514, -0.7907525, -2.386591, 1, 1, 1, 1, 1,
-0.2478769, -1.657377, -3.760998, 1, 1, 1, 1, 1,
-0.2474515, 0.2742737, 0.9971752, 1, 1, 1, 1, 1,
-0.2460852, 0.1952337, 1.051635, 1, 1, 1, 1, 1,
-0.2458328, -1.43028, -3.43636, 1, 1, 1, 1, 1,
-0.242156, 0.7778713, -0.7683626, 1, 1, 1, 1, 1,
-0.2393745, 0.4955513, -1.216093, 1, 1, 1, 1, 1,
-0.2380147, 1.690949, 0.6205841, 1, 1, 1, 1, 1,
-0.2350468, -0.5226429, -3.92853, 1, 1, 1, 1, 1,
-0.234654, 0.5149748, -1.465215, 1, 1, 1, 1, 1,
-0.2341549, -1.085766, -3.199535, 1, 1, 1, 1, 1,
-0.2338817, 0.01951588, -2.205805, 1, 1, 1, 1, 1,
-0.2308956, -0.3631308, -2.034191, 1, 1, 1, 1, 1,
-0.2290525, -0.8919226, -2.107342, 0, 0, 1, 1, 1,
-0.2272562, -0.4238364, -2.418903, 1, 0, 0, 1, 1,
-0.2269984, 0.2038899, -0.5189732, 1, 0, 0, 1, 1,
-0.226911, -0.0515536, -1.216975, 1, 0, 0, 1, 1,
-0.2256954, -0.3190418, -3.21471, 1, 0, 0, 1, 1,
-0.2225575, -1.948246, -2.347133, 1, 0, 0, 1, 1,
-0.2222166, 0.6919467, -1.261432, 0, 0, 0, 1, 1,
-0.2221237, 0.08301893, -0.5786204, 0, 0, 0, 1, 1,
-0.2183117, 1.086258, -0.7505053, 0, 0, 0, 1, 1,
-0.2134299, -0.7798265, -4.882054, 0, 0, 0, 1, 1,
-0.2131588, 0.4197946, -1.903868, 0, 0, 0, 1, 1,
-0.2115489, 0.9769997, -0.6719714, 0, 0, 0, 1, 1,
-0.2087676, -0.7866594, -3.060178, 0, 0, 0, 1, 1,
-0.207942, -0.1378426, -2.42927, 1, 1, 1, 1, 1,
-0.2040103, -0.8412505, -2.85378, 1, 1, 1, 1, 1,
-0.2027935, 2.525269, 1.363898, 1, 1, 1, 1, 1,
-0.1998351, 1.318521, 0.3584259, 1, 1, 1, 1, 1,
-0.1940015, -0.4542096, -2.796201, 1, 1, 1, 1, 1,
-0.1918403, 1.57689, -0.6000723, 1, 1, 1, 1, 1,
-0.1904472, 0.5890095, 0.921114, 1, 1, 1, 1, 1,
-0.1901194, 0.6992397, -0.2617174, 1, 1, 1, 1, 1,
-0.1891852, -1.992935, -3.423297, 1, 1, 1, 1, 1,
-0.1886563, -1.385553, -2.375579, 1, 1, 1, 1, 1,
-0.1834979, -0.02932438, -2.14925, 1, 1, 1, 1, 1,
-0.1828208, -0.1811072, -2.37568, 1, 1, 1, 1, 1,
-0.1762487, -0.2475535, -1.783549, 1, 1, 1, 1, 1,
-0.1719061, 0.1823355, -2.513557, 1, 1, 1, 1, 1,
-0.1715712, 0.4064742, 1.36941, 1, 1, 1, 1, 1,
-0.1613809, 1.441383, 0.9560639, 0, 0, 1, 1, 1,
-0.1601564, 0.7537922, 0.7053742, 1, 0, 0, 1, 1,
-0.1599996, 0.3098646, 0.4225275, 1, 0, 0, 1, 1,
-0.1562779, -0.6479291, -1.724134, 1, 0, 0, 1, 1,
-0.1513707, 0.6200414, -1.508162, 1, 0, 0, 1, 1,
-0.144565, 2.09092, -1.314199, 1, 0, 0, 1, 1,
-0.1441084, 0.1776882, -1.746175, 0, 0, 0, 1, 1,
-0.1413926, -0.4356199, -3.552093, 0, 0, 0, 1, 1,
-0.1409622, 0.70951, 1.396825, 0, 0, 0, 1, 1,
-0.1393176, 0.4407328, -0.2006993, 0, 0, 0, 1, 1,
-0.134248, -0.07310872, -0.4082293, 0, 0, 0, 1, 1,
-0.1340709, -0.4101821, -3.807551, 0, 0, 0, 1, 1,
-0.1335755, -0.1849631, -2.863829, 0, 0, 0, 1, 1,
-0.1318163, 1.949751, -0.6790278, 1, 1, 1, 1, 1,
-0.1301354, -0.04155025, -0.7255837, 1, 1, 1, 1, 1,
-0.1286515, 0.2859164, -0.211562, 1, 1, 1, 1, 1,
-0.127975, -0.02691821, -1.086087, 1, 1, 1, 1, 1,
-0.1264889, 1.393967, 0.103337, 1, 1, 1, 1, 1,
-0.1257895, -1.067817, -3.297917, 1, 1, 1, 1, 1,
-0.1193315, 0.4380067, 0.1264527, 1, 1, 1, 1, 1,
-0.1185037, -0.4496556, -3.858518, 1, 1, 1, 1, 1,
-0.1166154, -0.8578473, -2.505948, 1, 1, 1, 1, 1,
-0.1114736, 1.357515, 1.551461, 1, 1, 1, 1, 1,
-0.1038751, 0.2061303, -1.119322, 1, 1, 1, 1, 1,
-0.1031065, 1.262188, 0.9048713, 1, 1, 1, 1, 1,
-0.097984, 0.7862605, 0.1547764, 1, 1, 1, 1, 1,
-0.09784011, 0.04048896, -0.8779846, 1, 1, 1, 1, 1,
-0.09317788, -0.002604826, -0.7746971, 1, 1, 1, 1, 1,
-0.09294063, 0.9767598, 1.078099, 0, 0, 1, 1, 1,
-0.08565494, -1.08957, -5.46326, 1, 0, 0, 1, 1,
-0.08500545, -0.209611, -2.192358, 1, 0, 0, 1, 1,
-0.08469054, -0.7730609, -3.756864, 1, 0, 0, 1, 1,
-0.08459525, 0.0127128, -1.743817, 1, 0, 0, 1, 1,
-0.07982719, 2.353864, 1.455802, 1, 0, 0, 1, 1,
-0.07944778, -1.111224, -4.019053, 0, 0, 0, 1, 1,
-0.07660086, 0.3373338, -1.549465, 0, 0, 0, 1, 1,
-0.07437218, -1.120288, -4.150305, 0, 0, 0, 1, 1,
-0.07142265, -1.581818, -3.032559, 0, 0, 0, 1, 1,
-0.0706917, 0.8852139, 0.1377111, 0, 0, 0, 1, 1,
-0.06904888, -0.574832, -2.96291, 0, 0, 0, 1, 1,
-0.06830233, -1.116526, -2.458241, 0, 0, 0, 1, 1,
-0.06612048, 0.8718074, 1.794656, 1, 1, 1, 1, 1,
-0.06466506, -0.9861714, -2.076527, 1, 1, 1, 1, 1,
-0.06091429, 0.3962451, -0.7350981, 1, 1, 1, 1, 1,
-0.05215425, -0.6289099, -4.131295, 1, 1, 1, 1, 1,
-0.0481197, 0.002647982, -1.233937, 1, 1, 1, 1, 1,
-0.04007458, -0.4249203, -0.9102094, 1, 1, 1, 1, 1,
-0.03984075, -1.434237, -2.956335, 1, 1, 1, 1, 1,
-0.03810799, -0.4065118, -3.558967, 1, 1, 1, 1, 1,
-0.03801823, 0.4284952, 1.644354, 1, 1, 1, 1, 1,
-0.03712494, -0.6761753, -1.822602, 1, 1, 1, 1, 1,
-0.03500293, -1.325768, -3.260718, 1, 1, 1, 1, 1,
-0.03424091, -0.4797035, -2.489581, 1, 1, 1, 1, 1,
-0.03291712, 1.33714, -0.5381708, 1, 1, 1, 1, 1,
-0.02823358, -2.740909, -1.307992, 1, 1, 1, 1, 1,
-0.02513115, 1.175608, -0.4213786, 1, 1, 1, 1, 1,
-0.02168809, -0.01435033, -4.23914, 0, 0, 1, 1, 1,
-0.02133212, 0.6450119, 1.520764, 1, 0, 0, 1, 1,
-0.01945434, 0.5379537, 0.6671388, 1, 0, 0, 1, 1,
-0.01494119, -0.8489083, -4.100651, 1, 0, 0, 1, 1,
-0.01193731, -0.9242427, -2.601131, 1, 0, 0, 1, 1,
-0.00960928, -1.363437, -4.348738, 1, 0, 0, 1, 1,
-0.005245917, -0.6301603, -5.00841, 0, 0, 0, 1, 1,
-0.001226932, 0.2765716, 0.150714, 0, 0, 0, 1, 1,
9.177416e-05, -0.5726162, 3.936066, 0, 0, 0, 1, 1,
0.002776668, -0.7599881, 3.049005, 0, 0, 0, 1, 1,
0.002890599, 0.8869758, 0.44889, 0, 0, 0, 1, 1,
0.007415188, 2.160508, -1.641891, 0, 0, 0, 1, 1,
0.007928084, -0.4561202, 3.049211, 0, 0, 0, 1, 1,
0.01183893, 0.1563704, -0.4884003, 1, 1, 1, 1, 1,
0.01577761, -0.6756802, 3.496728, 1, 1, 1, 1, 1,
0.01884296, -1.49996, 2.959382, 1, 1, 1, 1, 1,
0.02916561, 0.1905032, -0.1826835, 1, 1, 1, 1, 1,
0.03455467, 2.07503, 0.3541187, 1, 1, 1, 1, 1,
0.03636483, -0.4359304, 2.06457, 1, 1, 1, 1, 1,
0.04048702, -0.6804696, 4.233549, 1, 1, 1, 1, 1,
0.04763611, 0.1918721, -1.708437, 1, 1, 1, 1, 1,
0.05327362, -0.9682328, 2.907136, 1, 1, 1, 1, 1,
0.05382889, 0.03115236, 1.215351, 1, 1, 1, 1, 1,
0.05697051, 0.9300669, -0.1212247, 1, 1, 1, 1, 1,
0.06307078, 0.006079137, 1.986016, 1, 1, 1, 1, 1,
0.06596647, 1.590831, 0.005497288, 1, 1, 1, 1, 1,
0.07166672, -0.03490266, 2.242969, 1, 1, 1, 1, 1,
0.07169179, 0.8592701, 1.147208, 1, 1, 1, 1, 1,
0.0725474, -0.1975459, 3.597872, 0, 0, 1, 1, 1,
0.07550344, 0.608815, 1.054334, 1, 0, 0, 1, 1,
0.07685401, 0.1223031, -0.3769759, 1, 0, 0, 1, 1,
0.07748706, -0.9669033, 3.913195, 1, 0, 0, 1, 1,
0.07942571, 0.9811902, -1.203052, 1, 0, 0, 1, 1,
0.08169372, 1.966314, -0.1740131, 1, 0, 0, 1, 1,
0.08673049, -0.3593937, 3.693304, 0, 0, 0, 1, 1,
0.09059147, 0.3947182, 1.675951, 0, 0, 0, 1, 1,
0.09539045, -0.1550488, 1.509452, 0, 0, 0, 1, 1,
0.09705307, 0.3708678, -1.299044, 0, 0, 0, 1, 1,
0.09897556, 2.008787, -0.7424576, 0, 0, 0, 1, 1,
0.1019232, 0.4401676, 0.7912004, 0, 0, 0, 1, 1,
0.1095898, -1.165101, 4.381383, 0, 0, 0, 1, 1,
0.1112746, -0.4531318, 2.401706, 1, 1, 1, 1, 1,
0.1192689, -0.8786035, 3.347802, 1, 1, 1, 1, 1,
0.120576, -0.9860224, 0.1813978, 1, 1, 1, 1, 1,
0.1214116, -0.7214755, 1.832637, 1, 1, 1, 1, 1,
0.1237366, 0.05111937, 1.565248, 1, 1, 1, 1, 1,
0.1241154, 0.7279546, 0.7947713, 1, 1, 1, 1, 1,
0.1243804, -0.04593943, 2.065463, 1, 1, 1, 1, 1,
0.125935, 0.1337832, 0.04416668, 1, 1, 1, 1, 1,
0.1274399, -2.887562, 2.250942, 1, 1, 1, 1, 1,
0.1277491, 0.7501275, -0.1882049, 1, 1, 1, 1, 1,
0.128021, 0.06310093, 0.6893217, 1, 1, 1, 1, 1,
0.1326862, -0.8206037, 2.144034, 1, 1, 1, 1, 1,
0.1343021, 1.229004, 0.2515997, 1, 1, 1, 1, 1,
0.1350437, -0.888046, 3.093735, 1, 1, 1, 1, 1,
0.1397695, -0.9967195, 2.720643, 1, 1, 1, 1, 1,
0.1405144, 2.243681, 0.8215292, 0, 0, 1, 1, 1,
0.1417931, 0.4777528, -0.1178062, 1, 0, 0, 1, 1,
0.1442402, 0.7801626, -0.1815346, 1, 0, 0, 1, 1,
0.1452061, 0.6252733, 1.297776, 1, 0, 0, 1, 1,
0.1503246, -0.06414097, 2.349676, 1, 0, 0, 1, 1,
0.1532464, 0.3901067, 0.749266, 1, 0, 0, 1, 1,
0.1545535, -0.8138304, 3.466012, 0, 0, 0, 1, 1,
0.1553003, -1.029068, 2.641943, 0, 0, 0, 1, 1,
0.1563756, -1.090047, 3.342583, 0, 0, 0, 1, 1,
0.1590152, 2.804997, 1.924758, 0, 0, 0, 1, 1,
0.1621423, 0.3809685, 1.963076, 0, 0, 0, 1, 1,
0.1643307, -1.11297, 3.961076, 0, 0, 0, 1, 1,
0.1654951, 0.3259525, -1.010718, 0, 0, 0, 1, 1,
0.1655293, -1.433582, 1.614494, 1, 1, 1, 1, 1,
0.1664937, -0.4024853, 2.529372, 1, 1, 1, 1, 1,
0.1678496, 0.7984149, 0.1680023, 1, 1, 1, 1, 1,
0.168136, 0.168088, 1.703161, 1, 1, 1, 1, 1,
0.1727938, 0.4773944, -2.989859, 1, 1, 1, 1, 1,
0.1729061, 4.481692e-05, 1.221434, 1, 1, 1, 1, 1,
0.1729821, -1.465435, 3.627633, 1, 1, 1, 1, 1,
0.1756837, -0.05115289, 1.557503, 1, 1, 1, 1, 1,
0.1770463, 1.545425, 1.999536, 1, 1, 1, 1, 1,
0.1780124, -0.4615761, 2.628335, 1, 1, 1, 1, 1,
0.1781912, 0.3397137, 0.6332669, 1, 1, 1, 1, 1,
0.1784948, -2.223729, 4.071442, 1, 1, 1, 1, 1,
0.1866079, 2.233767, 1.305889, 1, 1, 1, 1, 1,
0.1927271, 0.409684, -0.9198094, 1, 1, 1, 1, 1,
0.201111, 0.9148099, 3.045965, 1, 1, 1, 1, 1,
0.2020288, -1.505318, 4.052559, 0, 0, 1, 1, 1,
0.2021335, 0.3298877, 0.8624517, 1, 0, 0, 1, 1,
0.2034656, -0.2774293, 4.085223, 1, 0, 0, 1, 1,
0.2052613, -0.1162311, 1.309273, 1, 0, 0, 1, 1,
0.20793, -0.4021835, 0.8703986, 1, 0, 0, 1, 1,
0.2125064, -0.6295832, 2.601046, 1, 0, 0, 1, 1,
0.2148516, 2.186699, 0.989688, 0, 0, 0, 1, 1,
0.2157056, -0.5741546, 2.519729, 0, 0, 0, 1, 1,
0.2188096, 0.6126575, -0.4638994, 0, 0, 0, 1, 1,
0.2203848, 0.04027424, 0.4083214, 0, 0, 0, 1, 1,
0.2231758, 1.216073, -0.2155862, 0, 0, 0, 1, 1,
0.2312398, -0.4136646, 3.732016, 0, 0, 0, 1, 1,
0.2323855, -0.359576, 3.899261, 0, 0, 0, 1, 1,
0.2333317, 1.669947, 0.7557154, 1, 1, 1, 1, 1,
0.2354152, 0.1533559, 0.2575114, 1, 1, 1, 1, 1,
0.2362022, 0.07154937, 2.07373, 1, 1, 1, 1, 1,
0.2399228, -0.3805404, 3.175419, 1, 1, 1, 1, 1,
0.2403127, 0.8123047, 1.373075, 1, 1, 1, 1, 1,
0.2407022, 0.6455706, 0.8025562, 1, 1, 1, 1, 1,
0.246018, 0.3636743, 0.8749463, 1, 1, 1, 1, 1,
0.2478816, 0.2281917, 1.293927, 1, 1, 1, 1, 1,
0.2492875, 1.377864, 0.8673818, 1, 1, 1, 1, 1,
0.2575058, -0.6151177, 2.57641, 1, 1, 1, 1, 1,
0.2638779, -1.379455, 3.494876, 1, 1, 1, 1, 1,
0.2658882, -0.5446216, 3.8147, 1, 1, 1, 1, 1,
0.2666259, 0.910912, -0.8748217, 1, 1, 1, 1, 1,
0.2675608, -1.776555, 3.323357, 1, 1, 1, 1, 1,
0.2684012, 0.8682104, -1.39921, 1, 1, 1, 1, 1,
0.2699972, -0.8334823, 3.264386, 0, 0, 1, 1, 1,
0.2751616, 1.129335, 1.710784, 1, 0, 0, 1, 1,
0.2785819, 1.450539, -0.6291465, 1, 0, 0, 1, 1,
0.280823, -0.02387612, 0.6631888, 1, 0, 0, 1, 1,
0.2904866, 0.7046238, 0.4746191, 1, 0, 0, 1, 1,
0.291219, 1.425082, -0.7896071, 1, 0, 0, 1, 1,
0.2955323, 0.6837329, 0.619122, 0, 0, 0, 1, 1,
0.2986442, -1.755414, 5.506144, 0, 0, 0, 1, 1,
0.3006078, -0.3593999, 3.258618, 0, 0, 0, 1, 1,
0.3043555, 0.008475833, 1.996557, 0, 0, 0, 1, 1,
0.3105831, -1.776565, 2.107302, 0, 0, 0, 1, 1,
0.312532, -0.492479, 2.166524, 0, 0, 0, 1, 1,
0.3134767, -0.7860931, 1.467463, 0, 0, 0, 1, 1,
0.3162301, 1.255967, -0.02961029, 1, 1, 1, 1, 1,
0.3183755, -2.42631, 2.006682, 1, 1, 1, 1, 1,
0.3214308, -2.52516, 2.971005, 1, 1, 1, 1, 1,
0.3218573, 0.2088976, 0.3386196, 1, 1, 1, 1, 1,
0.3227199, 0.1289868, 0.4010878, 1, 1, 1, 1, 1,
0.3230564, -0.3391369, 1.737411, 1, 1, 1, 1, 1,
0.3405333, -0.2432, 2.936246, 1, 1, 1, 1, 1,
0.3419602, -0.5294111, 4.376812, 1, 1, 1, 1, 1,
0.3446466, 1.413499, -0.5416149, 1, 1, 1, 1, 1,
0.3492348, 0.3801216, 0.2262786, 1, 1, 1, 1, 1,
0.3536499, -0.6158057, 3.561309, 1, 1, 1, 1, 1,
0.3562542, 0.4952694, 0.7300329, 1, 1, 1, 1, 1,
0.3564282, 0.4110371, 0.6851625, 1, 1, 1, 1, 1,
0.3572905, 0.2774714, 0.7629392, 1, 1, 1, 1, 1,
0.3598631, 0.2128346, 0.6480798, 1, 1, 1, 1, 1,
0.3599807, 1.429822, 0.3329203, 0, 0, 1, 1, 1,
0.3618998, -0.5867234, 3.013971, 1, 0, 0, 1, 1,
0.3632681, 0.4451326, 1.6677, 1, 0, 0, 1, 1,
0.3644944, 0.2391966, 1.367732, 1, 0, 0, 1, 1,
0.3723505, -0.019093, 3.025186, 1, 0, 0, 1, 1,
0.3749566, 0.07895751, -0.4385266, 1, 0, 0, 1, 1,
0.3796403, 1.159758, -0.325705, 0, 0, 0, 1, 1,
0.3798433, 1.479304, -0.647445, 0, 0, 0, 1, 1,
0.3891845, -0.1777967, 2.136152, 0, 0, 0, 1, 1,
0.3901989, -1.058804, 3.049743, 0, 0, 0, 1, 1,
0.3968338, -0.2561507, -0.1140698, 0, 0, 0, 1, 1,
0.3977689, 1.555415, 1.00248, 0, 0, 0, 1, 1,
0.3979965, 0.2471508, 1.668039, 0, 0, 0, 1, 1,
0.3996804, 0.7015941, -0.8830745, 1, 1, 1, 1, 1,
0.4020868, -0.2703695, 3.458939, 1, 1, 1, 1, 1,
0.4024473, -0.8801699, 1.772127, 1, 1, 1, 1, 1,
0.4076517, -1.462845, 2.565538, 1, 1, 1, 1, 1,
0.4121145, 0.8110842, 0.964391, 1, 1, 1, 1, 1,
0.4148654, -0.6279976, 2.665408, 1, 1, 1, 1, 1,
0.4155154, -1.172462, 4.278944, 1, 1, 1, 1, 1,
0.4164154, 0.9004688, 0.349918, 1, 1, 1, 1, 1,
0.4167235, 0.7475177, 0.1879206, 1, 1, 1, 1, 1,
0.4191655, 2.709605, -1.303686, 1, 1, 1, 1, 1,
0.4208913, -0.06324824, 0.9770437, 1, 1, 1, 1, 1,
0.423833, -1.150874, 2.60498, 1, 1, 1, 1, 1,
0.4266286, 0.4185498, 1.042855, 1, 1, 1, 1, 1,
0.4266877, 2.311079, -0.5144215, 1, 1, 1, 1, 1,
0.429206, 0.249247, 2.014869, 1, 1, 1, 1, 1,
0.4329624, 1.370356, -0.2836167, 0, 0, 1, 1, 1,
0.4380566, 0.4537481, 0.3294297, 1, 0, 0, 1, 1,
0.4424608, -0.9377534, 2.546485, 1, 0, 0, 1, 1,
0.4467033, 0.3441767, 1.920769, 1, 0, 0, 1, 1,
0.4496237, -1.135008, 1.557526, 1, 0, 0, 1, 1,
0.450491, 0.03791847, 0.8998219, 1, 0, 0, 1, 1,
0.4517017, 1.586318, 0.01135952, 0, 0, 0, 1, 1,
0.4524675, -1.274873, 0.502113, 0, 0, 0, 1, 1,
0.4533926, 0.1866642, -0.06971686, 0, 0, 0, 1, 1,
0.4542912, -0.6143029, 3.102445, 0, 0, 0, 1, 1,
0.4551772, -0.3822848, 1.334485, 0, 0, 0, 1, 1,
0.4582478, 0.5295894, 1.312935, 0, 0, 0, 1, 1,
0.4584372, 1.506785, 0.3856522, 0, 0, 0, 1, 1,
0.460679, -0.2505439, 2.513268, 1, 1, 1, 1, 1,
0.461462, -1.107981, 2.431709, 1, 1, 1, 1, 1,
0.4621993, -0.4679982, 3.34682, 1, 1, 1, 1, 1,
0.4628344, 0.07410832, 0.2566431, 1, 1, 1, 1, 1,
0.4670622, 0.09547684, 1.376129, 1, 1, 1, 1, 1,
0.4701433, 0.1799471, 1.307231, 1, 1, 1, 1, 1,
0.4741046, 1.060485, 1.187682, 1, 1, 1, 1, 1,
0.4764034, -0.4766732, 0.4742655, 1, 1, 1, 1, 1,
0.4774441, -1.211601, 3.769943, 1, 1, 1, 1, 1,
0.4795701, 0.2729878, 1.782969, 1, 1, 1, 1, 1,
0.4813693, -1.572871, 1.908729, 1, 1, 1, 1, 1,
0.4862299, -0.5613023, 1.963461, 1, 1, 1, 1, 1,
0.4867361, 0.4018787, 0.9098673, 1, 1, 1, 1, 1,
0.4867746, 0.868311, -0.1721664, 1, 1, 1, 1, 1,
0.4889086, -0.09852207, 2.396134, 1, 1, 1, 1, 1,
0.4895619, 1.517024, 0.2625578, 0, 0, 1, 1, 1,
0.4940661, -1.276963, 2.600363, 1, 0, 0, 1, 1,
0.4951231, -1.918009, 4.566212, 1, 0, 0, 1, 1,
0.4962651, -1.32031, 3.62601, 1, 0, 0, 1, 1,
0.496869, -0.41061, -0.009871811, 1, 0, 0, 1, 1,
0.4983476, 1.302816, 0.4741223, 1, 0, 0, 1, 1,
0.5006363, 0.07653838, 2.678796, 0, 0, 0, 1, 1,
0.5012404, -0.8196821, 0.7473536, 0, 0, 0, 1, 1,
0.5053881, -1.175103, 2.519294, 0, 0, 0, 1, 1,
0.5069386, 1.113937, 0.7453529, 0, 0, 0, 1, 1,
0.5093231, 1.633016, 0.8086085, 0, 0, 0, 1, 1,
0.5107617, 0.3154316, 1.140623, 0, 0, 0, 1, 1,
0.5114529, -0.6575967, 3.776284, 0, 0, 0, 1, 1,
0.515041, -1.317773, 2.090045, 1, 1, 1, 1, 1,
0.5157623, -1.156232, 2.097425, 1, 1, 1, 1, 1,
0.5174426, 0.2323018, -1.014419, 1, 1, 1, 1, 1,
0.5208653, -1.670284, 2.776853, 1, 1, 1, 1, 1,
0.5214651, -1.015789, 2.520956, 1, 1, 1, 1, 1,
0.5216315, 0.3891225, -0.1353486, 1, 1, 1, 1, 1,
0.5216396, 0.3169048, 0.4918539, 1, 1, 1, 1, 1,
0.5243568, 0.05494817, 1.736539, 1, 1, 1, 1, 1,
0.5377591, -1.317393, 2.224909, 1, 1, 1, 1, 1,
0.5461954, 0.3010292, 0.9275314, 1, 1, 1, 1, 1,
0.5511729, 0.2809775, 0.2716995, 1, 1, 1, 1, 1,
0.5552032, 1.671733, 0.8709277, 1, 1, 1, 1, 1,
0.5552312, -0.5887969, 1.536151, 1, 1, 1, 1, 1,
0.5555271, -0.1932106, 2.934395, 1, 1, 1, 1, 1,
0.5671311, 0.9027781, -0.163887, 1, 1, 1, 1, 1,
0.5713478, 1.188276, 0.8859202, 0, 0, 1, 1, 1,
0.578768, -0.6873881, 2.749443, 1, 0, 0, 1, 1,
0.5800958, 0.09857086, 2.224975, 1, 0, 0, 1, 1,
0.5822748, -0.5748795, 3.045894, 1, 0, 0, 1, 1,
0.5908514, 0.2414638, 1.205044, 1, 0, 0, 1, 1,
0.5933359, 1.705482, 0.6820746, 1, 0, 0, 1, 1,
0.5940114, 1.076891, 0.7359594, 0, 0, 0, 1, 1,
0.5947142, 0.8742294, 2.555035, 0, 0, 0, 1, 1,
0.5966661, 0.8043182, 1.207073, 0, 0, 0, 1, 1,
0.5967846, -0.4257283, 1.82404, 0, 0, 0, 1, 1,
0.5999112, 1.143533, -0.2176735, 0, 0, 0, 1, 1,
0.6229979, 0.3952008, 1.275345, 0, 0, 0, 1, 1,
0.6299635, 0.506924, 1.571404, 0, 0, 0, 1, 1,
0.6344893, 0.2570373, 0.5628343, 1, 1, 1, 1, 1,
0.6354188, -0.1398464, 1.416339, 1, 1, 1, 1, 1,
0.6359328, 1.055916, 2.203135, 1, 1, 1, 1, 1,
0.6366882, 0.003906197, 2.380021, 1, 1, 1, 1, 1,
0.6423037, 0.7447169, 1.523358, 1, 1, 1, 1, 1,
0.6439754, -1.376752, 2.564969, 1, 1, 1, 1, 1,
0.6463874, -2.550596, 2.744558, 1, 1, 1, 1, 1,
0.6483964, 0.8432185, -0.06044523, 1, 1, 1, 1, 1,
0.6548807, 1.946138, 0.07900274, 1, 1, 1, 1, 1,
0.6605284, 0.3006581, 2.823016, 1, 1, 1, 1, 1,
0.6615933, -0.110225, 2.082815, 1, 1, 1, 1, 1,
0.6702055, -1.526808, 2.77997, 1, 1, 1, 1, 1,
0.6708118, 0.1819481, 1.316436, 1, 1, 1, 1, 1,
0.6792706, 0.1520224, 2.789506, 1, 1, 1, 1, 1,
0.6829515, -0.1272235, 0.8004939, 1, 1, 1, 1, 1,
0.683091, -0.007597926, 1.428454, 0, 0, 1, 1, 1,
0.685477, 0.05372746, 1.319512, 1, 0, 0, 1, 1,
0.6890643, -0.6725697, 2.201082, 1, 0, 0, 1, 1,
0.6893316, 0.2786103, 1.046003, 1, 0, 0, 1, 1,
0.6959057, 0.6051907, 1.20691, 1, 0, 0, 1, 1,
0.6963252, -0.5295528, 2.497106, 1, 0, 0, 1, 1,
0.6975709, -0.9526648, 2.722109, 0, 0, 0, 1, 1,
0.7068194, -0.9486486, 2.252872, 0, 0, 0, 1, 1,
0.7114373, 0.2296165, 2.445575, 0, 0, 0, 1, 1,
0.7160589, -0.6813944, 2.016615, 0, 0, 0, 1, 1,
0.7165077, -0.08938979, 0.9561256, 0, 0, 0, 1, 1,
0.7214263, 0.4629786, 1.629473, 0, 0, 0, 1, 1,
0.7220563, 0.6110739, 2.411409, 0, 0, 0, 1, 1,
0.7235284, 1.546966, 0.2438823, 1, 1, 1, 1, 1,
0.7304785, -0.9517657, 1.190752, 1, 1, 1, 1, 1,
0.732269, 0.3368523, 0.8515796, 1, 1, 1, 1, 1,
0.7328966, 1.511414, 0.06784952, 1, 1, 1, 1, 1,
0.7397352, 0.4351724, 0.648273, 1, 1, 1, 1, 1,
0.7426373, -0.27381, 2.610601, 1, 1, 1, 1, 1,
0.7437063, 1.077458, 0.9883477, 1, 1, 1, 1, 1,
0.7467782, 2.446523, -0.3391977, 1, 1, 1, 1, 1,
0.7489232, -0.3738451, -1.076137, 1, 1, 1, 1, 1,
0.7505071, 0.6335894, 0.8440955, 1, 1, 1, 1, 1,
0.7564228, 0.5400037, 1.87885, 1, 1, 1, 1, 1,
0.762211, 1.113982, -0.6655157, 1, 1, 1, 1, 1,
0.7630194, 0.9906628, 0.6928538, 1, 1, 1, 1, 1,
0.767445, 0.04452377, 0.2526386, 1, 1, 1, 1, 1,
0.7709556, 0.6046159, -0.1788745, 1, 1, 1, 1, 1,
0.7780933, -0.1551261, 1.694886, 0, 0, 1, 1, 1,
0.7786946, 0.4416804, -0.2308505, 1, 0, 0, 1, 1,
0.7811919, 0.5338056, -0.5309106, 1, 0, 0, 1, 1,
0.7815038, -0.7839319, 3.403649, 1, 0, 0, 1, 1,
0.7817131, -0.6285124, 1.921199, 1, 0, 0, 1, 1,
0.7829685, 0.8750063, 0.1969907, 1, 0, 0, 1, 1,
0.7910783, -0.8933132, 1.536501, 0, 0, 0, 1, 1,
0.7921015, -0.8958467, 2.544713, 0, 0, 0, 1, 1,
0.7968618, 1.101747, 2.194835, 0, 0, 0, 1, 1,
0.7971711, 1.187482, 0.0256279, 0, 0, 0, 1, 1,
0.8036901, 1.624387, -1.190863, 0, 0, 0, 1, 1,
0.8082111, -0.8520529, 1.690611, 0, 0, 0, 1, 1,
0.8162866, -1.486348, 1.978577, 0, 0, 0, 1, 1,
0.8216975, -0.1080969, 0.1983915, 1, 1, 1, 1, 1,
0.8253065, -0.8913331, 3.308444, 1, 1, 1, 1, 1,
0.8259988, -0.4229438, 2.062572, 1, 1, 1, 1, 1,
0.8302243, -0.4741102, 1.465343, 1, 1, 1, 1, 1,
0.8335728, 0.8444507, 1.110273, 1, 1, 1, 1, 1,
0.8353284, -0.3339422, 2.915252, 1, 1, 1, 1, 1,
0.8385776, 2.413075, -0.293634, 1, 1, 1, 1, 1,
0.8403285, 0.4301013, 1.446962, 1, 1, 1, 1, 1,
0.841909, -0.2362112, 0.700844, 1, 1, 1, 1, 1,
0.8452529, -1.024313, 1.480439, 1, 1, 1, 1, 1,
0.8485523, -0.7797065, 2.720215, 1, 1, 1, 1, 1,
0.8497094, 2.138947, 1.059373, 1, 1, 1, 1, 1,
0.855778, 1.516255, 1.405759, 1, 1, 1, 1, 1,
0.8692696, 0.3797685, 2.209897, 1, 1, 1, 1, 1,
0.8698186, -0.6900834, 0.1143193, 1, 1, 1, 1, 1,
0.8709613, -1.235677, 3.535961, 0, 0, 1, 1, 1,
0.8730318, -0.203371, 1.841071, 1, 0, 0, 1, 1,
0.8797081, -0.5611001, 2.206093, 1, 0, 0, 1, 1,
0.8797926, -0.03994716, 2.532173, 1, 0, 0, 1, 1,
0.8802341, -1.169308, 2.510836, 1, 0, 0, 1, 1,
0.8811713, 2.519351, 1.221414, 1, 0, 0, 1, 1,
0.8832916, -0.5419992, 2.541353, 0, 0, 0, 1, 1,
0.8834006, 1.668684, -0.6691146, 0, 0, 0, 1, 1,
0.8864212, -0.1303323, 1.231965, 0, 0, 0, 1, 1,
0.8937562, -0.1248552, 1.458822, 0, 0, 0, 1, 1,
0.8939717, -1.386026, 2.883272, 0, 0, 0, 1, 1,
0.8943943, -0.7358396, 2.792023, 0, 0, 0, 1, 1,
0.8944679, -0.6624216, 3.453531, 0, 0, 0, 1, 1,
0.8999944, 0.01388408, 2.529537, 1, 1, 1, 1, 1,
0.9091121, 1.569908, 1.28492, 1, 1, 1, 1, 1,
0.9106181, 0.5536333, 2.704742, 1, 1, 1, 1, 1,
0.911552, -0.2765886, 1.968898, 1, 1, 1, 1, 1,
0.9121069, 1.013237, 0.149947, 1, 1, 1, 1, 1,
0.9147856, -1.938113, 2.83252, 1, 1, 1, 1, 1,
0.9197206, 0.2099461, -1.224125, 1, 1, 1, 1, 1,
0.9201529, 0.01486452, 2.375787, 1, 1, 1, 1, 1,
0.9244748, 0.4196478, 0.5825911, 1, 1, 1, 1, 1,
0.939711, -0.3711041, 3.407979, 1, 1, 1, 1, 1,
0.940221, -0.7138723, 3.309466, 1, 1, 1, 1, 1,
0.9410103, 0.5299722, 0.1527441, 1, 1, 1, 1, 1,
0.9455013, 1.013795, 3.154943, 1, 1, 1, 1, 1,
0.9488244, 1.555376, 0.0007332779, 1, 1, 1, 1, 1,
0.950726, 0.04424424, 0.8233982, 1, 1, 1, 1, 1,
0.9526907, 0.08211093, 1.031067, 0, 0, 1, 1, 1,
0.9680998, 0.8861961, 0.3444328, 1, 0, 0, 1, 1,
0.9688306, -0.1003499, 1.365015, 1, 0, 0, 1, 1,
0.9704622, -0.1240512, 2.180124, 1, 0, 0, 1, 1,
0.9795519, 0.5217558, 0.3596268, 1, 0, 0, 1, 1,
0.9812111, -2.188192, 4.192719, 1, 0, 0, 1, 1,
0.9825042, -0.1360865, 2.705756, 0, 0, 0, 1, 1,
0.9853734, 1.113173, 1.239359, 0, 0, 0, 1, 1,
0.9897023, -1.719118, 2.10131, 0, 0, 0, 1, 1,
0.9932236, -0.3767914, 1.362229, 0, 0, 0, 1, 1,
1.004093, 0.9679632, 0.5514865, 0, 0, 0, 1, 1,
1.008088, -0.2817837, 1.121754, 0, 0, 0, 1, 1,
1.011609, -1.234558, 3.291569, 0, 0, 0, 1, 1,
1.026018, -0.6801728, 2.614443, 1, 1, 1, 1, 1,
1.034001, -1.399992, 1.826523, 1, 1, 1, 1, 1,
1.034256, 2.610822, -0.2834615, 1, 1, 1, 1, 1,
1.03793, -1.277813, 3.401561, 1, 1, 1, 1, 1,
1.040211, 0.05304676, 1.337706, 1, 1, 1, 1, 1,
1.049994, -0.5183169, 1.186086, 1, 1, 1, 1, 1,
1.054877, 0.07826389, 2.020695, 1, 1, 1, 1, 1,
1.056215, -1.624606, 3.531948, 1, 1, 1, 1, 1,
1.067718, -0.8488237, 2.91557, 1, 1, 1, 1, 1,
1.067768, 3.75688, 0.139886, 1, 1, 1, 1, 1,
1.073758, -1.227008, 3.296736, 1, 1, 1, 1, 1,
1.07836, -0.05051594, 2.509547, 1, 1, 1, 1, 1,
1.084176, -1.719057, 3.188161, 1, 1, 1, 1, 1,
1.090667, 2.680366, 0.08516972, 1, 1, 1, 1, 1,
1.095592, -1.332227, 2.089886, 1, 1, 1, 1, 1,
1.10169, 0.7069459, 0.288242, 0, 0, 1, 1, 1,
1.103665, -0.4870601, 3.228618, 1, 0, 0, 1, 1,
1.103793, 0.2321077, 0.5541033, 1, 0, 0, 1, 1,
1.10594, -1.161969, 1.926019, 1, 0, 0, 1, 1,
1.106586, 0.2605867, 0.3306474, 1, 0, 0, 1, 1,
1.111376, 0.6393841, 1.037386, 1, 0, 0, 1, 1,
1.115331, -0.09948821, 2.418712, 0, 0, 0, 1, 1,
1.126529, -1.466454, 3.315305, 0, 0, 0, 1, 1,
1.130796, 0.3189694, 0.9475398, 0, 0, 0, 1, 1,
1.13195, -1.451608, 4.332274, 0, 0, 0, 1, 1,
1.132781, 0.6146446, -1.670831, 0, 0, 0, 1, 1,
1.134249, -0.905407, 2.187914, 0, 0, 0, 1, 1,
1.149501, 0.6798761, -0.6736419, 0, 0, 0, 1, 1,
1.156949, -0.1049049, 2.526203, 1, 1, 1, 1, 1,
1.169558, 1.406974, 1.590896, 1, 1, 1, 1, 1,
1.170002, -1.876513, 1.057991, 1, 1, 1, 1, 1,
1.177908, -0.58801, 1.114994, 1, 1, 1, 1, 1,
1.184501, 0.7925355, 0.8495176, 1, 1, 1, 1, 1,
1.187613, -1.433933, 4.194266, 1, 1, 1, 1, 1,
1.192595, 1.516026, 0.4920127, 1, 1, 1, 1, 1,
1.200714, -0.2266855, 1.115963, 1, 1, 1, 1, 1,
1.203179, -1.035661, 1.27166, 1, 1, 1, 1, 1,
1.20364, -0.896816, 0.6656132, 1, 1, 1, 1, 1,
1.204264, 1.069075, 1.945903, 1, 1, 1, 1, 1,
1.209558, 0.7183405, 1.390415, 1, 1, 1, 1, 1,
1.209841, 0.9465054, 2.685889, 1, 1, 1, 1, 1,
1.213737, 0.7314829, 0.8792681, 1, 1, 1, 1, 1,
1.218722, 0.09996059, 1.728299, 1, 1, 1, 1, 1,
1.222697, 0.2197054, 2.004206, 0, 0, 1, 1, 1,
1.228245, -0.6275404, 1.07321, 1, 0, 0, 1, 1,
1.241422, 1.383642, 0.4484368, 1, 0, 0, 1, 1,
1.251913, -0.6607814, 1.512808, 1, 0, 0, 1, 1,
1.25477, -1.032576, 3.082188, 1, 0, 0, 1, 1,
1.258811, 0.5605924, 1.138924, 1, 0, 0, 1, 1,
1.259126, -0.6064345, 0.9529805, 0, 0, 0, 1, 1,
1.268048, -0.4228549, 0.5250704, 0, 0, 0, 1, 1,
1.280002, 0.1547838, 0.8998309, 0, 0, 0, 1, 1,
1.306109, 1.73694, -0.224734, 0, 0, 0, 1, 1,
1.306647, 1.537021, -0.2794824, 0, 0, 0, 1, 1,
1.309408, 0.9909934, 2.015942, 0, 0, 0, 1, 1,
1.312717, -0.03493547, 1.019925, 0, 0, 0, 1, 1,
1.313559, -0.7912846, 2.584843, 1, 1, 1, 1, 1,
1.314894, -0.6944606, 1.313004, 1, 1, 1, 1, 1,
1.316412, 0.6628073, 1.538303, 1, 1, 1, 1, 1,
1.318355, 1.643131, -0.731745, 1, 1, 1, 1, 1,
1.318799, 0.4284322, 2.679588, 1, 1, 1, 1, 1,
1.319695, 0.4664485, 1.182316, 1, 1, 1, 1, 1,
1.320342, 0.14139, 2.606616, 1, 1, 1, 1, 1,
1.32374, 0.366473, 1.155194, 1, 1, 1, 1, 1,
1.329371, -1.643135, 2.986466, 1, 1, 1, 1, 1,
1.331125, -0.7781819, 1.514651, 1, 1, 1, 1, 1,
1.339517, -0.5386419, 1.16177, 1, 1, 1, 1, 1,
1.353958, 1.361264, -0.7179949, 1, 1, 1, 1, 1,
1.364128, 0.4044108, 0.5254677, 1, 1, 1, 1, 1,
1.365943, -0.6665179, 2.924687, 1, 1, 1, 1, 1,
1.37191, -0.7682412, 1.655248, 1, 1, 1, 1, 1,
1.372887, 0.07054654, 1.950514, 0, 0, 1, 1, 1,
1.376771, -0.5889604, -0.8673371, 1, 0, 0, 1, 1,
1.380213, -1.416656, 3.594316, 1, 0, 0, 1, 1,
1.382473, -0.08295542, 3.58196, 1, 0, 0, 1, 1,
1.389188, 0.4857572, 1.265658, 1, 0, 0, 1, 1,
1.394742, -0.4986018, 0.8326698, 1, 0, 0, 1, 1,
1.401887, -0.1398159, 1.410099, 0, 0, 0, 1, 1,
1.404806, 0.8563404, 1.75855, 0, 0, 0, 1, 1,
1.410725, -0.7627404, 2.332921, 0, 0, 0, 1, 1,
1.416116, 0.2230456, -0.1561308, 0, 0, 0, 1, 1,
1.419375, -0.5247795, 1.650822, 0, 0, 0, 1, 1,
1.434332, 0.6758705, -0.02746001, 0, 0, 0, 1, 1,
1.452103, -0.2779209, -0.1632868, 0, 0, 0, 1, 1,
1.457905, -0.908821, 0.6530567, 1, 1, 1, 1, 1,
1.458869, 0.245697, -0.4083602, 1, 1, 1, 1, 1,
1.461355, 0.8589663, -0.3687651, 1, 1, 1, 1, 1,
1.476333, -0.776537, 1.909242, 1, 1, 1, 1, 1,
1.482124, -0.3166439, 0.8808908, 1, 1, 1, 1, 1,
1.490684, 0.8154466, -0.4596691, 1, 1, 1, 1, 1,
1.528159, -0.7012773, 1.216467, 1, 1, 1, 1, 1,
1.541426, 0.1342175, 1.286737, 1, 1, 1, 1, 1,
1.542473, 0.4917807, 0.7284855, 1, 1, 1, 1, 1,
1.542827, 0.5773297, -0.9395361, 1, 1, 1, 1, 1,
1.553306, 0.3083769, 1.597138, 1, 1, 1, 1, 1,
1.56098, -0.1075592, 1.214682, 1, 1, 1, 1, 1,
1.606605, 1.273672, -0.6975718, 1, 1, 1, 1, 1,
1.607435, 0.4032564, 1.048624, 1, 1, 1, 1, 1,
1.60754, 0.6279379, 0.7437401, 1, 1, 1, 1, 1,
1.617359, -0.1718027, 1.363824, 0, 0, 1, 1, 1,
1.62619, 0.1049228, 0.7434111, 1, 0, 0, 1, 1,
1.62934, -1.093975, 3.213816, 1, 0, 0, 1, 1,
1.629712, 0.5526078, 0.5274, 1, 0, 0, 1, 1,
1.637099, -0.1996656, 3.076669, 1, 0, 0, 1, 1,
1.639616, 0.02160868, 1.090779, 1, 0, 0, 1, 1,
1.643394, -0.5521923, 2.550226, 0, 0, 0, 1, 1,
1.645428, 1.067536, 0.07157651, 0, 0, 0, 1, 1,
1.651357, 0.4259064, 0.4736853, 0, 0, 0, 1, 1,
1.655021, -0.06464598, 1.388939, 0, 0, 0, 1, 1,
1.698377, -0.8624153, 2.113842, 0, 0, 0, 1, 1,
1.713468, -0.1740891, 1.536663, 0, 0, 0, 1, 1,
1.718241, 0.9808266, -0.3480549, 0, 0, 0, 1, 1,
1.720987, 0.6537409, -0.8089676, 1, 1, 1, 1, 1,
1.737688, -1.092303, 1.95394, 1, 1, 1, 1, 1,
1.764614, -1.470001, 2.534423, 1, 1, 1, 1, 1,
1.782507, -0.5327859, 0.9677424, 1, 1, 1, 1, 1,
1.802224, 0.6370547, 1.36885, 1, 1, 1, 1, 1,
1.811056, -0.4774534, 0.2030856, 1, 1, 1, 1, 1,
1.87759, -1.064399, 3.003133, 1, 1, 1, 1, 1,
1.890626, 0.8254104, 0.2529997, 1, 1, 1, 1, 1,
1.910091, 0.8565478, 0.3369277, 1, 1, 1, 1, 1,
1.913007, -1.288659, 1.837898, 1, 1, 1, 1, 1,
1.914623, 1.319651, 1.26507, 1, 1, 1, 1, 1,
2.014221, 1.51426, 1.426238, 1, 1, 1, 1, 1,
2.020932, -0.5332875, 1.653254, 1, 1, 1, 1, 1,
2.039929, -0.609655, 2.394639, 1, 1, 1, 1, 1,
2.050815, -0.7477987, 3.080653, 1, 1, 1, 1, 1,
2.060342, 2.039376, 1.662657, 0, 0, 1, 1, 1,
2.103557, 0.2308091, 0.100619, 1, 0, 0, 1, 1,
2.119953, -1.153755, 2.691032, 1, 0, 0, 1, 1,
2.139693, 0.3837137, 2.345758, 1, 0, 0, 1, 1,
2.169137, 1.200816, 2.136748, 1, 0, 0, 1, 1,
2.183244, 0.459469, 2.28619, 1, 0, 0, 1, 1,
2.209176, 0.3292244, 1.401755, 0, 0, 0, 1, 1,
2.209664, -0.4505364, 3.201631, 0, 0, 0, 1, 1,
2.235761, 0.7407131, 3.132385, 0, 0, 0, 1, 1,
2.291423, -0.1434012, 1.022441, 0, 0, 0, 1, 1,
2.297806, 2.118574, 1.36698, 0, 0, 0, 1, 1,
2.356851, -0.1699676, 0.4749013, 0, 0, 0, 1, 1,
2.375474, 1.17482, 2.758634, 0, 0, 0, 1, 1,
2.486556, 0.09893495, 2.075114, 1, 1, 1, 1, 1,
2.532077, 0.3251012, 0.7353268, 1, 1, 1, 1, 1,
2.605649, 0.1605504, 2.007006, 1, 1, 1, 1, 1,
2.631309, 0.2509091, 1.96868, 1, 1, 1, 1, 1,
2.634801, 0.6774012, 1.368021, 1, 1, 1, 1, 1,
2.728048, -1.134121, 2.237369, 1, 1, 1, 1, 1,
2.788898, 0.2114729, 1.846022, 1, 1, 1, 1, 1
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
var radius = 9.86628;
var distance = 34.65489;
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
mvMatrix.translate( 0.2128417, -0.3732178, 0.2183454 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.65489);
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
