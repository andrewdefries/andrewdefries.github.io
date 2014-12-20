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
-3.229082, -0.9351509, -1.230847, 1, 0, 0, 1,
-3.221313, 0.5577635, -2.014366, 1, 0.007843138, 0, 1,
-3.197304, -0.4842307, -2.530607, 1, 0.01176471, 0, 1,
-2.942878, 1.057896, 0.03826063, 1, 0.01960784, 0, 1,
-2.941759, -0.06435984, -1.568914, 1, 0.02352941, 0, 1,
-2.667483, 0.7196839, -1.733917, 1, 0.03137255, 0, 1,
-2.628503, 0.2467304, -1.88175, 1, 0.03529412, 0, 1,
-2.608132, 0.3436539, -2.261417, 1, 0.04313726, 0, 1,
-2.603914, -0.2121419, -0.138363, 1, 0.04705882, 0, 1,
-2.55268, -1.358399, -2.649974, 1, 0.05490196, 0, 1,
-2.405247, 1.046263, -0.731442, 1, 0.05882353, 0, 1,
-2.402674, -0.8645037, -2.126635, 1, 0.06666667, 0, 1,
-2.380729, 0.1980928, -0.2252825, 1, 0.07058824, 0, 1,
-2.370505, 0.1628173, -1.952132, 1, 0.07843138, 0, 1,
-2.292836, -1.833737, -2.989122, 1, 0.08235294, 0, 1,
-2.282966, 0.500024, -1.217165, 1, 0.09019608, 0, 1,
-2.276714, -0.2452184, -1.894935, 1, 0.09411765, 0, 1,
-2.273011, -0.2800481, -3.229717, 1, 0.1019608, 0, 1,
-2.227962, -0.5414277, -0.5459319, 1, 0.1098039, 0, 1,
-2.175663, 0.1769049, -0.5223362, 1, 0.1137255, 0, 1,
-2.138855, -0.1605556, -0.8900155, 1, 0.1215686, 0, 1,
-2.083729, 0.1438732, -0.9932808, 1, 0.1254902, 0, 1,
-2.058527, -0.01881589, -0.8907868, 1, 0.1333333, 0, 1,
-2.022809, -0.1768966, -2.492959, 1, 0.1372549, 0, 1,
-1.995951, 1.206721, -1.209853, 1, 0.145098, 0, 1,
-1.994032, 0.7304247, -0.654775, 1, 0.1490196, 0, 1,
-1.976193, 1.075228, -0.6119924, 1, 0.1568628, 0, 1,
-1.962566, -0.2811802, -1.526653, 1, 0.1607843, 0, 1,
-1.953765, 0.5870479, -1.011764, 1, 0.1686275, 0, 1,
-1.944962, -0.6283427, -1.959457, 1, 0.172549, 0, 1,
-1.881312, 0.01627387, -1.40018, 1, 0.1803922, 0, 1,
-1.869847, 1.601255, -1.396268, 1, 0.1843137, 0, 1,
-1.866488, 0.01410014, -1.165868, 1, 0.1921569, 0, 1,
-1.857512, -0.1583318, -0.6404625, 1, 0.1960784, 0, 1,
-1.844484, 0.4955915, -4.185376, 1, 0.2039216, 0, 1,
-1.828269, 1.757181, -0.2489503, 1, 0.2117647, 0, 1,
-1.821945, 0.5200081, -0.8327118, 1, 0.2156863, 0, 1,
-1.81365, 1.229303, -0.3857896, 1, 0.2235294, 0, 1,
-1.803339, 2.040765, -0.04018272, 1, 0.227451, 0, 1,
-1.798724, -0.2717684, -1.231189, 1, 0.2352941, 0, 1,
-1.778457, -2.192282, -1.464943, 1, 0.2392157, 0, 1,
-1.77462, -0.7163936, -2.084603, 1, 0.2470588, 0, 1,
-1.750994, 1.160851, -1.504418, 1, 0.2509804, 0, 1,
-1.742838, 0.6919136, -1.823391, 1, 0.2588235, 0, 1,
-1.740477, 0.6851063, 0.6693655, 1, 0.2627451, 0, 1,
-1.719968, 0.9096186, -1.34403, 1, 0.2705882, 0, 1,
-1.689298, 0.541514, 0.4363097, 1, 0.2745098, 0, 1,
-1.687878, -0.4902913, -2.475986, 1, 0.282353, 0, 1,
-1.672572, 0.3382601, -1.505489, 1, 0.2862745, 0, 1,
-1.672011, -1.168264, -4.025616, 1, 0.2941177, 0, 1,
-1.6657, 1.325181, -0.2029465, 1, 0.3019608, 0, 1,
-1.649563, 1.166335, -1.897544, 1, 0.3058824, 0, 1,
-1.64622, -0.3360189, -1.441917, 1, 0.3137255, 0, 1,
-1.64571, 0.2862496, -1.064347, 1, 0.3176471, 0, 1,
-1.640581, 0.3770619, -0.7457089, 1, 0.3254902, 0, 1,
-1.631983, -0.3981289, -2.430816, 1, 0.3294118, 0, 1,
-1.622768, -0.2776422, 0.2303228, 1, 0.3372549, 0, 1,
-1.621297, -1.733602, -3.059744, 1, 0.3411765, 0, 1,
-1.619532, 1.076764, 0.1318795, 1, 0.3490196, 0, 1,
-1.619287, 0.563925, -0.2606896, 1, 0.3529412, 0, 1,
-1.618768, -0.300582, -2.273647, 1, 0.3607843, 0, 1,
-1.600626, 0.128679, -1.560871, 1, 0.3647059, 0, 1,
-1.593383, 0.1618574, -2.224052, 1, 0.372549, 0, 1,
-1.589765, 0.526229, -3.59057, 1, 0.3764706, 0, 1,
-1.574345, -0.1318383, -2.333061, 1, 0.3843137, 0, 1,
-1.565835, -0.2887032, -2.619416, 1, 0.3882353, 0, 1,
-1.56432, 1.585724, -1.801448, 1, 0.3960784, 0, 1,
-1.558992, 0.8051404, -1.420342, 1, 0.4039216, 0, 1,
-1.558062, 0.4971639, -2.460241, 1, 0.4078431, 0, 1,
-1.551456, -0.6947166, -1.573426, 1, 0.4156863, 0, 1,
-1.550972, 1.558322, -2.537354, 1, 0.4196078, 0, 1,
-1.540842, 1.485612, 0.7011939, 1, 0.427451, 0, 1,
-1.530985, -1.64505, -2.941274, 1, 0.4313726, 0, 1,
-1.515973, 1.026143, -0.3500798, 1, 0.4392157, 0, 1,
-1.512348, -1.220444, -2.573671, 1, 0.4431373, 0, 1,
-1.507386, 0.2879382, -0.04422381, 1, 0.4509804, 0, 1,
-1.494711, 0.4354286, 0.7085534, 1, 0.454902, 0, 1,
-1.482982, 0.9375643, -1.044181, 1, 0.4627451, 0, 1,
-1.471275, -0.8217874, -0.5933718, 1, 0.4666667, 0, 1,
-1.469775, -0.3156377, -0.01417586, 1, 0.4745098, 0, 1,
-1.449988, 2.494222, -0.5303197, 1, 0.4784314, 0, 1,
-1.448292, -2.213813, -3.537315, 1, 0.4862745, 0, 1,
-1.444354, 0.4171224, -1.02704, 1, 0.4901961, 0, 1,
-1.438036, 0.7157856, -0.4425121, 1, 0.4980392, 0, 1,
-1.433149, 0.191029, -2.185807, 1, 0.5058824, 0, 1,
-1.42505, -0.7942812, -2.362463, 1, 0.509804, 0, 1,
-1.423591, -1.358882, -3.063162, 1, 0.5176471, 0, 1,
-1.404317, -0.4849423, -2.469514, 1, 0.5215687, 0, 1,
-1.403706, -0.4537816, -0.1501097, 1, 0.5294118, 0, 1,
-1.402329, -0.4592187, -0.5305021, 1, 0.5333334, 0, 1,
-1.397674, -0.3732088, -2.751832, 1, 0.5411765, 0, 1,
-1.395382, 0.4015098, -2.502583, 1, 0.5450981, 0, 1,
-1.391821, -0.1272561, -2.50751, 1, 0.5529412, 0, 1,
-1.388955, 0.2572753, -2.270781, 1, 0.5568628, 0, 1,
-1.381824, 0.2337272, -2.710158, 1, 0.5647059, 0, 1,
-1.343768, 1.85951, -2.632877, 1, 0.5686275, 0, 1,
-1.343745, -0.7332698, -1.97688, 1, 0.5764706, 0, 1,
-1.332874, 0.4267469, -1.705674, 1, 0.5803922, 0, 1,
-1.33175, 1.14551, -0.5111843, 1, 0.5882353, 0, 1,
-1.33101, -1.101447, -2.742661, 1, 0.5921569, 0, 1,
-1.33005, -0.2003486, -2.408257, 1, 0.6, 0, 1,
-1.328861, 1.102876, -1.035851, 1, 0.6078432, 0, 1,
-1.319982, 1.479262, -0.1579959, 1, 0.6117647, 0, 1,
-1.314424, -0.3486462, -1.905638, 1, 0.6196079, 0, 1,
-1.306713, -2.820853, -2.849228, 1, 0.6235294, 0, 1,
-1.304519, 1.410518, 1.492777, 1, 0.6313726, 0, 1,
-1.30003, 1.382923, -1.050457, 1, 0.6352941, 0, 1,
-1.299708, -0.07163841, -0.979184, 1, 0.6431373, 0, 1,
-1.299183, -1.6721, -4.495386, 1, 0.6470588, 0, 1,
-1.293597, -0.04664604, -2.203589, 1, 0.654902, 0, 1,
-1.288531, -0.2361477, -3.050229, 1, 0.6588235, 0, 1,
-1.2839, -0.3267856, -1.651429, 1, 0.6666667, 0, 1,
-1.271957, -0.03587985, -1.748019, 1, 0.6705883, 0, 1,
-1.268233, 2.385291, -0.3172845, 1, 0.6784314, 0, 1,
-1.26119, -0.2323429, -1.645368, 1, 0.682353, 0, 1,
-1.260873, -0.4653369, -2.330816, 1, 0.6901961, 0, 1,
-1.251116, -0.3092133, -2.450625, 1, 0.6941177, 0, 1,
-1.249834, -0.4579179, -1.616171, 1, 0.7019608, 0, 1,
-1.246859, 0.4059902, -1.60328, 1, 0.7098039, 0, 1,
-1.24601, 0.03691705, -0.4909261, 1, 0.7137255, 0, 1,
-1.226658, -1.510175, -1.84762, 1, 0.7215686, 0, 1,
-1.220145, -0.968458, -1.91058, 1, 0.7254902, 0, 1,
-1.208152, 0.7752438, -1.447048, 1, 0.7333333, 0, 1,
-1.198068, 0.4703724, -0.7540725, 1, 0.7372549, 0, 1,
-1.193851, -0.2331784, -1.515225, 1, 0.7450981, 0, 1,
-1.192252, -1.11139, -1.677427, 1, 0.7490196, 0, 1,
-1.189557, -0.8630987, -1.713363, 1, 0.7568628, 0, 1,
-1.188582, 0.6087415, -0.4664426, 1, 0.7607843, 0, 1,
-1.185285, 0.3250153, -1.467952, 1, 0.7686275, 0, 1,
-1.179633, -0.4866051, -1.506557, 1, 0.772549, 0, 1,
-1.176152, -0.3248756, -2.931451, 1, 0.7803922, 0, 1,
-1.174485, 0.6894149, -0.6703715, 1, 0.7843137, 0, 1,
-1.173773, 0.4706165, -0.838022, 1, 0.7921569, 0, 1,
-1.161033, -0.3153535, -0.8880526, 1, 0.7960784, 0, 1,
-1.149683, 0.3062711, -0.8560789, 1, 0.8039216, 0, 1,
-1.145587, -1.270402, -1.890296, 1, 0.8117647, 0, 1,
-1.137709, 0.2271329, -4.503277, 1, 0.8156863, 0, 1,
-1.136303, -0.6927902, -1.888746, 1, 0.8235294, 0, 1,
-1.134905, 0.8921133, -0.1478281, 1, 0.827451, 0, 1,
-1.134606, 1.843208, 1.454342, 1, 0.8352941, 0, 1,
-1.130139, -1.331168, -1.713379, 1, 0.8392157, 0, 1,
-1.129084, 2.120626, -1.926532, 1, 0.8470588, 0, 1,
-1.125751, 0.3730066, -1.433313, 1, 0.8509804, 0, 1,
-1.124681, -2.62401, -2.965574, 1, 0.8588235, 0, 1,
-1.124441, 1.039461, -1.059883, 1, 0.8627451, 0, 1,
-1.112823, 0.7749458, -1.57007, 1, 0.8705882, 0, 1,
-1.108112, -0.7549145, -1.882116, 1, 0.8745098, 0, 1,
-1.099392, -2.324544, -1.887146, 1, 0.8823529, 0, 1,
-1.096971, -0.748477, -2.139399, 1, 0.8862745, 0, 1,
-1.0923, 0.1950722, 0.4288922, 1, 0.8941177, 0, 1,
-1.089098, 0.7894276, -0.8239448, 1, 0.8980392, 0, 1,
-1.072467, -1.772884, -2.715355, 1, 0.9058824, 0, 1,
-1.068277, 1.222186, 0.1695839, 1, 0.9137255, 0, 1,
-1.066314, 0.5960056, -0.9572393, 1, 0.9176471, 0, 1,
-1.064597, 0.05529134, -1.112698, 1, 0.9254902, 0, 1,
-1.064003, 0.4390465, -2.95641, 1, 0.9294118, 0, 1,
-1.058315, 1.67872, -0.1685138, 1, 0.9372549, 0, 1,
-1.048324, 0.107977, -3.893787, 1, 0.9411765, 0, 1,
-1.046354, 1.000764, -2.049731, 1, 0.9490196, 0, 1,
-1.046233, -1.593467, -2.175152, 1, 0.9529412, 0, 1,
-1.044436, -0.385651, -2.032318, 1, 0.9607843, 0, 1,
-1.042853, 0.05606469, -0.1481278, 1, 0.9647059, 0, 1,
-1.040588, -0.7437798, -2.858472, 1, 0.972549, 0, 1,
-1.038047, -0.8699485, 0.91378, 1, 0.9764706, 0, 1,
-1.036793, -0.9900421, -3.097774, 1, 0.9843137, 0, 1,
-1.033351, 0.7060119, -1.099119, 1, 0.9882353, 0, 1,
-1.03332, -0.7265753, -2.006079, 1, 0.9960784, 0, 1,
-1.026578, -1.44044, -1.978312, 0.9960784, 1, 0, 1,
-1.022735, 0.4975612, -1.726776, 0.9921569, 1, 0, 1,
-1.018436, -0.6359245, -0.4938331, 0.9843137, 1, 0, 1,
-1.018129, -1.425316, -1.679532, 0.9803922, 1, 0, 1,
-1.00807, 0.657055, -0.2656514, 0.972549, 1, 0, 1,
-1.00577, 0.09909628, -1.189836, 0.9686275, 1, 0, 1,
-1.005034, -1.029403, -0.5286868, 0.9607843, 1, 0, 1,
-0.9916478, 0.4608757, 0.05394271, 0.9568627, 1, 0, 1,
-0.9882295, 2.040062, 0.467901, 0.9490196, 1, 0, 1,
-0.9859357, -1.41371, -2.437345, 0.945098, 1, 0, 1,
-0.9841561, 0.4613359, -1.814561, 0.9372549, 1, 0, 1,
-0.981892, 0.9535114, -0.03406458, 0.9333333, 1, 0, 1,
-0.9796242, -1.323977, -2.027928, 0.9254902, 1, 0, 1,
-0.973678, -0.3939233, -2.095789, 0.9215686, 1, 0, 1,
-0.9732941, -0.5734212, -2.527321, 0.9137255, 1, 0, 1,
-0.9675528, 0.5830266, -2.273461, 0.9098039, 1, 0, 1,
-0.9652864, -0.8068808, -2.496561, 0.9019608, 1, 0, 1,
-0.9647432, -0.06888339, -2.792571, 0.8941177, 1, 0, 1,
-0.9639428, -0.4705553, -1.634772, 0.8901961, 1, 0, 1,
-0.9615526, 0.9379266, -2.011163, 0.8823529, 1, 0, 1,
-0.9543, 2.52935, -1.00767, 0.8784314, 1, 0, 1,
-0.946393, -0.9991416, -1.299335, 0.8705882, 1, 0, 1,
-0.9386678, 0.5730143, -1.2411, 0.8666667, 1, 0, 1,
-0.9316801, -0.009918723, -1.662586, 0.8588235, 1, 0, 1,
-0.9239724, -0.2203896, 0.3242706, 0.854902, 1, 0, 1,
-0.9222263, -0.05410792, -0.673555, 0.8470588, 1, 0, 1,
-0.9172459, 0.5115468, -0.8186324, 0.8431373, 1, 0, 1,
-0.9157819, 0.3365664, -5.171323, 0.8352941, 1, 0, 1,
-0.900255, 1.412868, -0.7707957, 0.8313726, 1, 0, 1,
-0.8959603, 0.04792107, 0.2667482, 0.8235294, 1, 0, 1,
-0.8933561, 0.6101193, -1.317215, 0.8196079, 1, 0, 1,
-0.8911217, -1.117322, -1.562046, 0.8117647, 1, 0, 1,
-0.8890603, 1.085488, -0.1161161, 0.8078431, 1, 0, 1,
-0.8804639, 0.07671513, -3.019791, 0.8, 1, 0, 1,
-0.8716836, 0.175954, -1.332034, 0.7921569, 1, 0, 1,
-0.8696564, 0.5721561, -2.237301, 0.7882353, 1, 0, 1,
-0.8614096, 1.738435, -1.016419, 0.7803922, 1, 0, 1,
-0.8608221, -1.384969, -2.41555, 0.7764706, 1, 0, 1,
-0.8591424, 1.488132, -0.9436371, 0.7686275, 1, 0, 1,
-0.8589169, 1.575025, -1.509236, 0.7647059, 1, 0, 1,
-0.8588317, -0.315718, -1.238483, 0.7568628, 1, 0, 1,
-0.8584955, -0.5371317, 0.1208029, 0.7529412, 1, 0, 1,
-0.8528519, 0.892598, -1.411954, 0.7450981, 1, 0, 1,
-0.8455843, 0.7663195, -1.0551, 0.7411765, 1, 0, 1,
-0.844277, -0.07477371, 0.060888, 0.7333333, 1, 0, 1,
-0.8396211, -0.05353972, -2.353591, 0.7294118, 1, 0, 1,
-0.8352197, 0.4103766, -1.420733, 0.7215686, 1, 0, 1,
-0.8323783, 0.6922506, -2.64382, 0.7176471, 1, 0, 1,
-0.8280244, 0.1783929, -0.9822329, 0.7098039, 1, 0, 1,
-0.8274428, -2.146164, -3.730623, 0.7058824, 1, 0, 1,
-0.823656, -1.905243, -3.243956, 0.6980392, 1, 0, 1,
-0.813343, 0.424897, -0.9460973, 0.6901961, 1, 0, 1,
-0.8127876, 1.186147, -0.2266347, 0.6862745, 1, 0, 1,
-0.8111919, 0.4096608, -0.5929003, 0.6784314, 1, 0, 1,
-0.808044, 1.138255, -1.149051, 0.6745098, 1, 0, 1,
-0.8075258, -0.06684862, -0.5268607, 0.6666667, 1, 0, 1,
-0.8069537, 0.3051115, -2.286702, 0.6627451, 1, 0, 1,
-0.8033444, -0.1103794, -2.639367, 0.654902, 1, 0, 1,
-0.8022979, 1.075789, -1.327581, 0.6509804, 1, 0, 1,
-0.7918855, -0.492267, -1.69733, 0.6431373, 1, 0, 1,
-0.7912648, 1.834702, -1.302531, 0.6392157, 1, 0, 1,
-0.7905235, -1.31144, -2.212909, 0.6313726, 1, 0, 1,
-0.7902266, -2.164604, -1.892373, 0.627451, 1, 0, 1,
-0.7889512, 0.6665666, -1.991678, 0.6196079, 1, 0, 1,
-0.7869173, 0.07915559, -1.706188, 0.6156863, 1, 0, 1,
-0.7856935, 0.8772994, 0.0214837, 0.6078432, 1, 0, 1,
-0.7830716, 0.408633, -0.3227919, 0.6039216, 1, 0, 1,
-0.7731491, 0.1245842, -1.985199, 0.5960785, 1, 0, 1,
-0.7726552, 2.053845, -0.8112785, 0.5882353, 1, 0, 1,
-0.7708203, -1.167334, -2.363588, 0.5843138, 1, 0, 1,
-0.7677119, -0.8112583, -2.1769, 0.5764706, 1, 0, 1,
-0.7643226, 0.6930457, -1.273762, 0.572549, 1, 0, 1,
-0.7621905, 0.03034258, -2.246137, 0.5647059, 1, 0, 1,
-0.7603122, -0.6582657, -2.577513, 0.5607843, 1, 0, 1,
-0.7601478, 1.081295, 1.151335, 0.5529412, 1, 0, 1,
-0.7545242, 0.6829054, -1.268332, 0.5490196, 1, 0, 1,
-0.7448531, -0.9131054, -1.911033, 0.5411765, 1, 0, 1,
-0.7425575, 0.3317082, -0.5185494, 0.5372549, 1, 0, 1,
-0.7385398, 0.6794358, -0.5745552, 0.5294118, 1, 0, 1,
-0.7340782, -0.1205118, -2.212523, 0.5254902, 1, 0, 1,
-0.7326522, 0.03363851, -2.629641, 0.5176471, 1, 0, 1,
-0.7316527, -0.6283674, -2.218343, 0.5137255, 1, 0, 1,
-0.7249965, -0.8078678, -3.395138, 0.5058824, 1, 0, 1,
-0.7246202, -0.1527886, -0.3286062, 0.5019608, 1, 0, 1,
-0.7229031, -0.05454506, -2.244515, 0.4941176, 1, 0, 1,
-0.7223858, 0.4691456, -0.03584139, 0.4862745, 1, 0, 1,
-0.7172245, -1.511937, -1.442377, 0.4823529, 1, 0, 1,
-0.7148681, 1.267688, -0.1593604, 0.4745098, 1, 0, 1,
-0.7140287, 0.7325125, -1.103368, 0.4705882, 1, 0, 1,
-0.713149, 2.098839, 1.767055, 0.4627451, 1, 0, 1,
-0.7066528, -0.2715092, -3.051744, 0.4588235, 1, 0, 1,
-0.7031217, -1.269178, -2.488589, 0.4509804, 1, 0, 1,
-0.6996597, 0.8342854, 0.4453846, 0.4470588, 1, 0, 1,
-0.6988032, -1.378365, -0.9485031, 0.4392157, 1, 0, 1,
-0.6961408, 0.6524441, -1.996393, 0.4352941, 1, 0, 1,
-0.6950229, -0.4359624, -3.446331, 0.427451, 1, 0, 1,
-0.6908554, -0.05961877, -3.277273, 0.4235294, 1, 0, 1,
-0.6896049, 1.079126, -1.835188, 0.4156863, 1, 0, 1,
-0.6866252, -1.083479, -1.07717, 0.4117647, 1, 0, 1,
-0.686139, 1.169473, -0.05017838, 0.4039216, 1, 0, 1,
-0.683293, -0.2462312, -0.4984511, 0.3960784, 1, 0, 1,
-0.6750862, 1.356974, 1.257516, 0.3921569, 1, 0, 1,
-0.6744495, 0.8183711, -2.810632, 0.3843137, 1, 0, 1,
-0.6709846, 0.6809679, -2.990972, 0.3803922, 1, 0, 1,
-0.6699924, 1.073353, -0.7421456, 0.372549, 1, 0, 1,
-0.6688073, 1.033576, -0.04675274, 0.3686275, 1, 0, 1,
-0.6644214, 0.9892928, -1.7332, 0.3607843, 1, 0, 1,
-0.6617075, 0.9248781, 0.3784948, 0.3568628, 1, 0, 1,
-0.6606844, 1.116945, -0.9157357, 0.3490196, 1, 0, 1,
-0.6602712, -1.137662, -1.335591, 0.345098, 1, 0, 1,
-0.6528991, -0.5949695, -2.947166, 0.3372549, 1, 0, 1,
-0.6508616, 1.041004, -1.122469, 0.3333333, 1, 0, 1,
-0.646484, -0.5341082, -1.538087, 0.3254902, 1, 0, 1,
-0.6461084, 1.80349, 0.775399, 0.3215686, 1, 0, 1,
-0.6431146, -0.309466, -2.632478, 0.3137255, 1, 0, 1,
-0.6415172, 1.749926, 0.9102318, 0.3098039, 1, 0, 1,
-0.6400101, 1.263742, 1.147438, 0.3019608, 1, 0, 1,
-0.6392919, -0.1798457, -1.493626, 0.2941177, 1, 0, 1,
-0.6332819, -0.793875, -0.5593808, 0.2901961, 1, 0, 1,
-0.6283306, -0.331102, -2.415844, 0.282353, 1, 0, 1,
-0.6270161, -0.1871901, -1.479683, 0.2784314, 1, 0, 1,
-0.6255195, -0.4409516, -3.432623, 0.2705882, 1, 0, 1,
-0.6224197, 2.239216, -1.749675, 0.2666667, 1, 0, 1,
-0.613405, -0.8140485, -3.141883, 0.2588235, 1, 0, 1,
-0.6097103, -1.173488, -2.418095, 0.254902, 1, 0, 1,
-0.6068255, -0.1662888, -1.129112, 0.2470588, 1, 0, 1,
-0.6062304, 0.1119239, -1.099579, 0.2431373, 1, 0, 1,
-0.6029975, 1.164773, -1.673836, 0.2352941, 1, 0, 1,
-0.5995018, 0.7745531, -1.157833, 0.2313726, 1, 0, 1,
-0.5985242, 0.3187214, -0.7371452, 0.2235294, 1, 0, 1,
-0.5961806, 0.8459921, 0.8328925, 0.2196078, 1, 0, 1,
-0.5941383, -0.06644585, -2.811632, 0.2117647, 1, 0, 1,
-0.5927436, 0.1474967, -2.313821, 0.2078431, 1, 0, 1,
-0.582729, 0.5559159, -1.330525, 0.2, 1, 0, 1,
-0.5758331, -0.5072597, -1.245819, 0.1921569, 1, 0, 1,
-0.5737149, 0.897843, -1.382415, 0.1882353, 1, 0, 1,
-0.5709682, -0.5026129, -3.310312, 0.1803922, 1, 0, 1,
-0.5648302, 0.583469, -1.26174, 0.1764706, 1, 0, 1,
-0.5591829, -0.5788561, -2.371845, 0.1686275, 1, 0, 1,
-0.5557483, 0.9346246, 0.3869084, 0.1647059, 1, 0, 1,
-0.5523967, 1.736446, -0.1975853, 0.1568628, 1, 0, 1,
-0.5519365, 0.4465435, -0.5236335, 0.1529412, 1, 0, 1,
-0.5480158, -0.009744344, -2.621025, 0.145098, 1, 0, 1,
-0.5467132, 2.86175, 2.073538, 0.1411765, 1, 0, 1,
-0.5424084, 1.516082, 0.6097772, 0.1333333, 1, 0, 1,
-0.5417692, -0.7236056, -4.331698, 0.1294118, 1, 0, 1,
-0.5395432, -0.3330932, -0.5907386, 0.1215686, 1, 0, 1,
-0.5372592, 0.7958599, 0.5090683, 0.1176471, 1, 0, 1,
-0.5364313, -0.3819752, -1.909204, 0.1098039, 1, 0, 1,
-0.5267845, -1.326298, -2.224645, 0.1058824, 1, 0, 1,
-0.5261658, 0.8721553, -1.619846, 0.09803922, 1, 0, 1,
-0.5165935, -0.6339682, -1.599968, 0.09019608, 1, 0, 1,
-0.5059686, 0.912352, 0.0541721, 0.08627451, 1, 0, 1,
-0.494915, -1.821008, -3.402454, 0.07843138, 1, 0, 1,
-0.4940351, 0.06200384, -1.409576, 0.07450981, 1, 0, 1,
-0.4870679, -1.122132, -2.924429, 0.06666667, 1, 0, 1,
-0.4786741, -0.2283197, -1.696214, 0.0627451, 1, 0, 1,
-0.4735762, 0.8057023, 0.9835331, 0.05490196, 1, 0, 1,
-0.4705688, 0.05618029, -0.4415641, 0.05098039, 1, 0, 1,
-0.4687782, 0.1655285, -1.346626, 0.04313726, 1, 0, 1,
-0.4676799, 0.9228647, 0.7825562, 0.03921569, 1, 0, 1,
-0.4619946, -1.670137, -1.187184, 0.03137255, 1, 0, 1,
-0.4588337, 1.352774, -0.7628586, 0.02745098, 1, 0, 1,
-0.4585622, -0.3104998, -1.775284, 0.01960784, 1, 0, 1,
-0.4533756, 0.3494173, -0.2852251, 0.01568628, 1, 0, 1,
-0.4517049, -0.5506166, -2.737489, 0.007843138, 1, 0, 1,
-0.4474105, 0.3115426, -1.298872, 0.003921569, 1, 0, 1,
-0.4418487, 0.5093474, -0.6455655, 0, 1, 0.003921569, 1,
-0.4388131, 0.1698505, -1.302171, 0, 1, 0.01176471, 1,
-0.4385067, -0.7369308, -2.659435, 0, 1, 0.01568628, 1,
-0.4340995, 2.284857, 0.2602763, 0, 1, 0.02352941, 1,
-0.4329931, -0.4383095, -2.917066, 0, 1, 0.02745098, 1,
-0.4313087, -0.6595602, -0.8763446, 0, 1, 0.03529412, 1,
-0.4299137, 1.029995, 1.043787, 0, 1, 0.03921569, 1,
-0.4290097, 0.05364023, -2.903682, 0, 1, 0.04705882, 1,
-0.4287242, -0.06183102, -0.4959337, 0, 1, 0.05098039, 1,
-0.4274742, 0.01093297, -0.7066674, 0, 1, 0.05882353, 1,
-0.4247893, -2.390727, -2.521939, 0, 1, 0.0627451, 1,
-0.4198658, -1.889504, -3.589334, 0, 1, 0.07058824, 1,
-0.4174279, 0.562398, 0.3113277, 0, 1, 0.07450981, 1,
-0.4167144, -0.3147888, -3.141913, 0, 1, 0.08235294, 1,
-0.4164177, 0.252187, 0.1880375, 0, 1, 0.08627451, 1,
-0.4130164, -0.2787385, -2.626374, 0, 1, 0.09411765, 1,
-0.4127837, -0.3391513, -3.782514, 0, 1, 0.1019608, 1,
-0.4114677, -1.423932, -2.958935, 0, 1, 0.1058824, 1,
-0.4111586, 0.5381017, -0.4998021, 0, 1, 0.1137255, 1,
-0.4097838, 0.7902355, 0.756487, 0, 1, 0.1176471, 1,
-0.4097342, -0.5525722, -2.274984, 0, 1, 0.1254902, 1,
-0.4087011, -0.5115762, -2.511793, 0, 1, 0.1294118, 1,
-0.4080289, 0.331934, -0.1950729, 0, 1, 0.1372549, 1,
-0.4068642, 2.868991, 0.6500979, 0, 1, 0.1411765, 1,
-0.4048867, -1.721877, -2.009145, 0, 1, 0.1490196, 1,
-0.4033491, -0.9386282, -1.878716, 0, 1, 0.1529412, 1,
-0.3994918, -2.255602, -5.475328, 0, 1, 0.1607843, 1,
-0.3951633, -0.07967483, -1.586858, 0, 1, 0.1647059, 1,
-0.3920875, -0.6707482, -2.631075, 0, 1, 0.172549, 1,
-0.3871932, 0.5435175, -0.4065048, 0, 1, 0.1764706, 1,
-0.3864078, -1.734557, -2.953295, 0, 1, 0.1843137, 1,
-0.3836766, -1.556007, -3.418663, 0, 1, 0.1882353, 1,
-0.3836654, 1.5126, 1.025316, 0, 1, 0.1960784, 1,
-0.3833953, -0.0659653, -1.904721, 0, 1, 0.2039216, 1,
-0.3814787, 0.6892825, -0.8273077, 0, 1, 0.2078431, 1,
-0.3807197, -1.092503, -3.466166, 0, 1, 0.2156863, 1,
-0.3788513, -0.3657187, -1.85031, 0, 1, 0.2196078, 1,
-0.3777943, -1.298446, -1.295661, 0, 1, 0.227451, 1,
-0.3777464, -0.08828568, -2.531365, 0, 1, 0.2313726, 1,
-0.3767323, 0.246388, -1.853688, 0, 1, 0.2392157, 1,
-0.3758751, -0.03855841, -1.550185, 0, 1, 0.2431373, 1,
-0.3689753, -1.071743, -0.9231791, 0, 1, 0.2509804, 1,
-0.3679712, 1.646105, -0.6308161, 0, 1, 0.254902, 1,
-0.3659758, 0.277768, -2.232887, 0, 1, 0.2627451, 1,
-0.3654689, -1.647429, -2.441792, 0, 1, 0.2666667, 1,
-0.3641522, -1.414336, -3.333915, 0, 1, 0.2745098, 1,
-0.3631603, -0.3370423, -2.417088, 0, 1, 0.2784314, 1,
-0.3626035, -1.930464, -4.318739, 0, 1, 0.2862745, 1,
-0.3622539, -0.09523072, -1.984042, 0, 1, 0.2901961, 1,
-0.354651, -0.5270194, -2.785786, 0, 1, 0.2980392, 1,
-0.3528972, 1.563896, 1.141741, 0, 1, 0.3058824, 1,
-0.3511024, -0.03745713, -2.060771, 0, 1, 0.3098039, 1,
-0.3503679, -0.73053, -1.644715, 0, 1, 0.3176471, 1,
-0.3474206, -0.2377374, -2.86754, 0, 1, 0.3215686, 1,
-0.3471034, -0.5288531, -1.863257, 0, 1, 0.3294118, 1,
-0.3381037, -1.147483, -2.586092, 0, 1, 0.3333333, 1,
-0.3350873, -1.338809, -4.251798, 0, 1, 0.3411765, 1,
-0.3329431, 0.1457356, 0.03072382, 0, 1, 0.345098, 1,
-0.3296852, -1.587746, -4.609855, 0, 1, 0.3529412, 1,
-0.3253552, -0.624099, -3.17347, 0, 1, 0.3568628, 1,
-0.3182, 0.2191983, -2.075974, 0, 1, 0.3647059, 1,
-0.3174139, 0.3826545, 0.4851768, 0, 1, 0.3686275, 1,
-0.316755, -0.6246849, -4.439785, 0, 1, 0.3764706, 1,
-0.3145711, 1.107339, 0.2590086, 0, 1, 0.3803922, 1,
-0.3143949, -0.2515104, -1.43064, 0, 1, 0.3882353, 1,
-0.3053019, 0.3511361, -0.5355006, 0, 1, 0.3921569, 1,
-0.3045022, -0.2947669, -1.613896, 0, 1, 0.4, 1,
-0.2867289, -1.062262, -2.863696, 0, 1, 0.4078431, 1,
-0.2820081, -0.7170885, -3.997484, 0, 1, 0.4117647, 1,
-0.2801303, 1.638694, -1.465922, 0, 1, 0.4196078, 1,
-0.279501, 1.436326, -0.1373398, 0, 1, 0.4235294, 1,
-0.2765976, -0.2103976, -1.856237, 0, 1, 0.4313726, 1,
-0.2734025, 0.7343873, -0.2912578, 0, 1, 0.4352941, 1,
-0.2659459, -2.299709, -3.821936, 0, 1, 0.4431373, 1,
-0.262685, -0.2002465, -1.161823, 0, 1, 0.4470588, 1,
-0.2625599, -2.000911, -4.015456, 0, 1, 0.454902, 1,
-0.2573034, 0.3462274, -1.576429, 0, 1, 0.4588235, 1,
-0.2538461, 0.6424487, -0.5244685, 0, 1, 0.4666667, 1,
-0.2532553, -1.498417, -3.596555, 0, 1, 0.4705882, 1,
-0.2507763, 2.124543, 1.576174, 0, 1, 0.4784314, 1,
-0.24901, -0.7646165, -2.935299, 0, 1, 0.4823529, 1,
-0.2466753, -0.7455279, -2.478819, 0, 1, 0.4901961, 1,
-0.2455602, 0.9283089, 0.6288155, 0, 1, 0.4941176, 1,
-0.244969, -0.1429661, -0.4175003, 0, 1, 0.5019608, 1,
-0.2414231, -0.9279888, -2.485348, 0, 1, 0.509804, 1,
-0.2353667, -1.112429, -2.656728, 0, 1, 0.5137255, 1,
-0.2345285, 0.5084142, -0.4222571, 0, 1, 0.5215687, 1,
-0.2330333, 0.2826776, -0.9417362, 0, 1, 0.5254902, 1,
-0.2327047, -1.116507, -2.537128, 0, 1, 0.5333334, 1,
-0.2303208, -0.6046909, -2.660736, 0, 1, 0.5372549, 1,
-0.2287762, 0.1819582, -0.7677042, 0, 1, 0.5450981, 1,
-0.2285682, -0.9367397, -1.600092, 0, 1, 0.5490196, 1,
-0.2213643, -0.7904923, -4.136066, 0, 1, 0.5568628, 1,
-0.2178787, 0.6480222, -1.450846, 0, 1, 0.5607843, 1,
-0.2173817, 0.03047485, -2.267676, 0, 1, 0.5686275, 1,
-0.2153985, -0.5961565, -2.146326, 0, 1, 0.572549, 1,
-0.213269, -0.2519874, -3.625562, 0, 1, 0.5803922, 1,
-0.2108304, -1.952279, -4.073037, 0, 1, 0.5843138, 1,
-0.2087093, -0.6559213, -3.302242, 0, 1, 0.5921569, 1,
-0.2061429, 1.592553, 1.191886, 0, 1, 0.5960785, 1,
-0.2051604, -0.4052254, -3.646551, 0, 1, 0.6039216, 1,
-0.2049024, -0.6700715, -1.307347, 0, 1, 0.6117647, 1,
-0.2046884, 1.64246, 0.7922987, 0, 1, 0.6156863, 1,
-0.2004626, 0.5184781, -1.447875, 0, 1, 0.6235294, 1,
-0.1971, -0.510258, -2.137092, 0, 1, 0.627451, 1,
-0.1918027, 1.335777, -0.8699223, 0, 1, 0.6352941, 1,
-0.1911654, 0.9217684, 0.02323827, 0, 1, 0.6392157, 1,
-0.1899854, -0.8998604, -2.431733, 0, 1, 0.6470588, 1,
-0.1854243, -0.8082027, -3.557456, 0, 1, 0.6509804, 1,
-0.1847588, 0.7574092, -0.06775686, 0, 1, 0.6588235, 1,
-0.1843048, 0.6811149, 0.1242677, 0, 1, 0.6627451, 1,
-0.1838685, -0.2075256, -3.031016, 0, 1, 0.6705883, 1,
-0.1836179, -0.2049794, 0.004604766, 0, 1, 0.6745098, 1,
-0.1817577, -0.6179113, -3.087619, 0, 1, 0.682353, 1,
-0.1792407, 1.379048, -0.5665711, 0, 1, 0.6862745, 1,
-0.1785482, -0.7954401, -3.808743, 0, 1, 0.6941177, 1,
-0.1779055, -0.201267, -0.7094947, 0, 1, 0.7019608, 1,
-0.1777398, 0.01702463, -1.068691, 0, 1, 0.7058824, 1,
-0.1735504, -0.9631672, -1.487968, 0, 1, 0.7137255, 1,
-0.1701893, 0.772699, 0.0454954, 0, 1, 0.7176471, 1,
-0.1688771, 0.6318755, 2.191059, 0, 1, 0.7254902, 1,
-0.1681755, 0.9698154, 1.620599, 0, 1, 0.7294118, 1,
-0.1679021, 0.4843306, -0.1641853, 0, 1, 0.7372549, 1,
-0.1677813, 0.4697592, -0.449975, 0, 1, 0.7411765, 1,
-0.1646975, 2.080956, 1.173169, 0, 1, 0.7490196, 1,
-0.1590799, -0.2126488, -0.5937983, 0, 1, 0.7529412, 1,
-0.1538191, 1.449798, -0.8280513, 0, 1, 0.7607843, 1,
-0.1517728, 0.5995533, -0.8079723, 0, 1, 0.7647059, 1,
-0.1516005, -0.5971115, -3.723521, 0, 1, 0.772549, 1,
-0.1509451, -0.3668114, -2.646579, 0, 1, 0.7764706, 1,
-0.1479028, -0.1187663, -2.45631, 0, 1, 0.7843137, 1,
-0.1448978, 0.640503, -1.611782, 0, 1, 0.7882353, 1,
-0.1445238, -0.8514171, -2.815902, 0, 1, 0.7960784, 1,
-0.1424884, 1.262088, -0.8531057, 0, 1, 0.8039216, 1,
-0.1422571, -1.289792, -4.076601, 0, 1, 0.8078431, 1,
-0.1413358, 1.577047, 0.4989114, 0, 1, 0.8156863, 1,
-0.1399098, 0.7286841, -0.8151788, 0, 1, 0.8196079, 1,
-0.1349791, 0.0438734, 0.245487, 0, 1, 0.827451, 1,
-0.1320077, 0.08274768, -0.9235334, 0, 1, 0.8313726, 1,
-0.129315, -1.789888, -5.0752, 0, 1, 0.8392157, 1,
-0.1290243, -0.7695674, -3.343863, 0, 1, 0.8431373, 1,
-0.1253809, -1.599796, -3.290461, 0, 1, 0.8509804, 1,
-0.1219452, 0.632411, -1.167979, 0, 1, 0.854902, 1,
-0.1155151, 0.6279821, -0.2456769, 0, 1, 0.8627451, 1,
-0.1137998, 0.7328715, -0.5931367, 0, 1, 0.8666667, 1,
-0.1134657, -0.2576362, -1.785096, 0, 1, 0.8745098, 1,
-0.1112495, 0.9839327, -0.9538746, 0, 1, 0.8784314, 1,
-0.1079187, -0.2249455, -2.109051, 0, 1, 0.8862745, 1,
-0.1051222, -0.0009498601, -2.04753, 0, 1, 0.8901961, 1,
-0.1043498, 2.580515, -0.2490044, 0, 1, 0.8980392, 1,
-0.1036792, -1.475143, -4.850426, 0, 1, 0.9058824, 1,
-0.1027258, 1.713939, -0.1514421, 0, 1, 0.9098039, 1,
-0.1026811, -1.745787, -1.860388, 0, 1, 0.9176471, 1,
-0.1010903, 0.445276, -0.05950253, 0, 1, 0.9215686, 1,
-0.1002716, -0.5349419, -1.776835, 0, 1, 0.9294118, 1,
-0.09992082, -1.843339, -3.891165, 0, 1, 0.9333333, 1,
-0.09765139, -0.5887151, -2.391755, 0, 1, 0.9411765, 1,
-0.09110357, 2.327784, 0.9623274, 0, 1, 0.945098, 1,
-0.09046034, -1.769833, -2.125037, 0, 1, 0.9529412, 1,
-0.09044347, 0.5079731, 0.9232841, 0, 1, 0.9568627, 1,
-0.09036112, -0.4423881, -2.680528, 0, 1, 0.9647059, 1,
-0.08958897, 0.7215241, -2.129047, 0, 1, 0.9686275, 1,
-0.08687679, 0.1515874, -1.881221, 0, 1, 0.9764706, 1,
-0.08506452, 0.9094974, -0.2967467, 0, 1, 0.9803922, 1,
-0.08273865, -0.6488111, -4.488019, 0, 1, 0.9882353, 1,
-0.08055063, 0.1443181, 0.2197579, 0, 1, 0.9921569, 1,
-0.080374, -1.309658, -2.55417, 0, 1, 1, 1,
-0.0799325, -0.4785144, -3.678666, 0, 0.9921569, 1, 1,
-0.07839116, 1.368171, -0.4793171, 0, 0.9882353, 1, 1,
-0.07319364, 0.2115002, 0.2194693, 0, 0.9803922, 1, 1,
-0.07248398, 0.0302561, -2.231474, 0, 0.9764706, 1, 1,
-0.0697005, -1.787081, -3.511612, 0, 0.9686275, 1, 1,
-0.06572011, -1.010267, -1.663964, 0, 0.9647059, 1, 1,
-0.062358, -0.05486466, -3.853474, 0, 0.9568627, 1, 1,
-0.05988218, -0.5026408, -3.644917, 0, 0.9529412, 1, 1,
-0.05987543, -1.352489, -3.439879, 0, 0.945098, 1, 1,
-0.05931298, 1.367234, 1.694939, 0, 0.9411765, 1, 1,
-0.0539558, -1.78251, -5.340342, 0, 0.9333333, 1, 1,
-0.05040137, -0.6078528, -2.290883, 0, 0.9294118, 1, 1,
-0.04969381, 0.6658521, 0.8345784, 0, 0.9215686, 1, 1,
-0.04868942, -0.1129041, -2.752036, 0, 0.9176471, 1, 1,
-0.04856888, 0.4390662, 0.2203671, 0, 0.9098039, 1, 1,
-0.04678962, 0.01051182, -3.85588, 0, 0.9058824, 1, 1,
-0.04266014, -0.2949902, -3.397337, 0, 0.8980392, 1, 1,
-0.03958883, -1.432392, -2.609682, 0, 0.8901961, 1, 1,
-0.03938439, -0.7103363, -4.475496, 0, 0.8862745, 1, 1,
-0.03461508, 0.7978287, 0.7856855, 0, 0.8784314, 1, 1,
-0.03121467, -0.2261521, -2.801928, 0, 0.8745098, 1, 1,
-0.03086758, 0.06073206, -1.544063, 0, 0.8666667, 1, 1,
-0.03006906, 1.213511, 0.2821686, 0, 0.8627451, 1, 1,
-0.02687874, -1.042611, -3.955553, 0, 0.854902, 1, 1,
-0.02574359, 1.466304, 1.444426, 0, 0.8509804, 1, 1,
-0.02049529, -0.3552265, -3.654999, 0, 0.8431373, 1, 1,
-0.01955495, -0.01174282, -2.19013, 0, 0.8392157, 1, 1,
-0.01930902, 0.2094007, -0.6980975, 0, 0.8313726, 1, 1,
-0.01812519, 1.78496, 0.7896624, 0, 0.827451, 1, 1,
-0.01712647, 1.273176, 1.768512, 0, 0.8196079, 1, 1,
-0.01601822, 1.12197, -0.1378066, 0, 0.8156863, 1, 1,
-0.01459305, 2.570642, 0.5373933, 0, 0.8078431, 1, 1,
-0.01422401, -0.0828035, -1.363022, 0, 0.8039216, 1, 1,
-0.0109417, 1.042664, -0.5196828, 0, 0.7960784, 1, 1,
-0.008590695, -0.2363444, -2.286011, 0, 0.7882353, 1, 1,
-0.006016518, 0.2767113, 0.07279495, 0, 0.7843137, 1, 1,
0.002753898, 0.8281422, 0.792614, 0, 0.7764706, 1, 1,
0.003184068, 0.6212916, -1.590688, 0, 0.772549, 1, 1,
0.006516399, 0.3852776, -0.4204183, 0, 0.7647059, 1, 1,
0.009183233, 1.579261, -1.30051, 0, 0.7607843, 1, 1,
0.01198456, 2.040246, 0.6578608, 0, 0.7529412, 1, 1,
0.01392019, -2.228651, 1.16902, 0, 0.7490196, 1, 1,
0.01520313, -2.65603, 3.150643, 0, 0.7411765, 1, 1,
0.01723357, -0.08168548, 4.883991, 0, 0.7372549, 1, 1,
0.02241427, -0.8235798, 5.104223, 0, 0.7294118, 1, 1,
0.02371324, 0.02527179, 1.542489, 0, 0.7254902, 1, 1,
0.02449352, 2.105628, -0.87074, 0, 0.7176471, 1, 1,
0.02740796, -0.8049469, 1.860936, 0, 0.7137255, 1, 1,
0.02808635, 0.3104323, 0.9463897, 0, 0.7058824, 1, 1,
0.0286293, -0.7927014, 3.850618, 0, 0.6980392, 1, 1,
0.029893, -2.037036, 2.194055, 0, 0.6941177, 1, 1,
0.03234276, 0.8271403, -1.573717, 0, 0.6862745, 1, 1,
0.03243514, 1.161273, -0.04342965, 0, 0.682353, 1, 1,
0.0342812, -0.9659945, 3.370117, 0, 0.6745098, 1, 1,
0.03467592, -0.2753246, 2.720781, 0, 0.6705883, 1, 1,
0.03520299, 0.1570236, 1.177983, 0, 0.6627451, 1, 1,
0.03558797, 0.07316661, 0.558427, 0, 0.6588235, 1, 1,
0.04009876, -1.751249, 4.851372, 0, 0.6509804, 1, 1,
0.04062573, 0.06473052, 0.5916571, 0, 0.6470588, 1, 1,
0.04271842, -1.758477, 0.9988158, 0, 0.6392157, 1, 1,
0.04869822, 0.5762042, 0.8307107, 0, 0.6352941, 1, 1,
0.04881889, -1.307035, 3.835897, 0, 0.627451, 1, 1,
0.04913326, -1.086835, 2.614635, 0, 0.6235294, 1, 1,
0.04945076, 0.520312, -0.7785699, 0, 0.6156863, 1, 1,
0.05119501, -0.7355134, 3.483232, 0, 0.6117647, 1, 1,
0.0538763, 1.468474, 1.607827, 0, 0.6039216, 1, 1,
0.05782453, -1.497789, 3.671637, 0, 0.5960785, 1, 1,
0.05853762, -1.492707, 2.476588, 0, 0.5921569, 1, 1,
0.06804592, 1.520416, -1.061678, 0, 0.5843138, 1, 1,
0.07009555, -0.06809141, 2.558774, 0, 0.5803922, 1, 1,
0.07590453, 0.3368942, 2.081269, 0, 0.572549, 1, 1,
0.07785235, 1.083284, -0.4423182, 0, 0.5686275, 1, 1,
0.08732881, 0.1641194, -0.6558617, 0, 0.5607843, 1, 1,
0.08829473, 0.6733034, 1.205651, 0, 0.5568628, 1, 1,
0.08831049, -0.9666911, 3.71732, 0, 0.5490196, 1, 1,
0.08832914, -0.9930295, 1.495729, 0, 0.5450981, 1, 1,
0.0888379, -0.09613596, 3.998776, 0, 0.5372549, 1, 1,
0.0913408, 3.108567, -0.3743649, 0, 0.5333334, 1, 1,
0.09309772, 0.01870854, 1.580382, 0, 0.5254902, 1, 1,
0.09415974, 1.063798, -0.3583947, 0, 0.5215687, 1, 1,
0.09509669, -2.263996, 2.301114, 0, 0.5137255, 1, 1,
0.09932516, -1.603069, 4.160533, 0, 0.509804, 1, 1,
0.1014971, 0.4025474, -0.002051225, 0, 0.5019608, 1, 1,
0.1124761, -0.3622855, 2.284836, 0, 0.4941176, 1, 1,
0.1147031, 1.006124, 0.2575781, 0, 0.4901961, 1, 1,
0.1169124, -0.5513187, 2.541203, 0, 0.4823529, 1, 1,
0.1179143, -0.09970346, 3.56017, 0, 0.4784314, 1, 1,
0.1227328, 0.914636, -0.5706533, 0, 0.4705882, 1, 1,
0.1292291, 1.516747, -0.5951357, 0, 0.4666667, 1, 1,
0.1313416, -0.7795228, 5.513513, 0, 0.4588235, 1, 1,
0.1335215, -1.625263, 4.292767, 0, 0.454902, 1, 1,
0.1373366, -1.271123, 3.681069, 0, 0.4470588, 1, 1,
0.1398775, -1.183259, 2.605475, 0, 0.4431373, 1, 1,
0.1427434, -0.9581631, 2.912377, 0, 0.4352941, 1, 1,
0.1444192, -0.7387096, 2.494279, 0, 0.4313726, 1, 1,
0.1451311, -0.8317521, 2.930499, 0, 0.4235294, 1, 1,
0.1502875, 0.8980842, -0.9122205, 0, 0.4196078, 1, 1,
0.1506889, -0.6359915, 4.772569, 0, 0.4117647, 1, 1,
0.1524899, 0.6209919, -1.625103, 0, 0.4078431, 1, 1,
0.1535918, -0.7057182, 3.52988, 0, 0.4, 1, 1,
0.1597647, -0.7943212, 2.953879, 0, 0.3921569, 1, 1,
0.1603982, 2.098488, 0.5229867, 0, 0.3882353, 1, 1,
0.1617307, -0.8457724, 3.505111, 0, 0.3803922, 1, 1,
0.1683279, -1.435675, 4.775601, 0, 0.3764706, 1, 1,
0.1686081, 1.230024, 1.149492, 0, 0.3686275, 1, 1,
0.1701576, 1.313098, 1.161765, 0, 0.3647059, 1, 1,
0.1715253, -0.5355992, 3.106208, 0, 0.3568628, 1, 1,
0.1736891, -0.2279924, 2.253021, 0, 0.3529412, 1, 1,
0.1769017, -0.8814219, 2.684128, 0, 0.345098, 1, 1,
0.1861789, 0.1209629, 0.9644855, 0, 0.3411765, 1, 1,
0.1882972, 1.293038, -0.7509588, 0, 0.3333333, 1, 1,
0.1918531, -1.263928, 2.437956, 0, 0.3294118, 1, 1,
0.1948723, 0.5849477, 1.067688, 0, 0.3215686, 1, 1,
0.1981866, 0.8035094, -0.7249528, 0, 0.3176471, 1, 1,
0.1992338, -1.080712, 2.70015, 0, 0.3098039, 1, 1,
0.2060489, 0.2889097, -0.3701946, 0, 0.3058824, 1, 1,
0.206124, 0.4650336, -0.5889407, 0, 0.2980392, 1, 1,
0.2065071, -0.1738368, 1.531483, 0, 0.2901961, 1, 1,
0.2084956, 0.08233609, 1.626729, 0, 0.2862745, 1, 1,
0.2116565, 0.5033838, 2.308224, 0, 0.2784314, 1, 1,
0.2161599, -1.544901, 3.646719, 0, 0.2745098, 1, 1,
0.2171282, 0.6869608, -1.244928, 0, 0.2666667, 1, 1,
0.221415, -0.8112665, 4.148499, 0, 0.2627451, 1, 1,
0.2234572, -0.04171131, 1.018421, 0, 0.254902, 1, 1,
0.2249299, 2.038141, -0.1340897, 0, 0.2509804, 1, 1,
0.2253359, 1.169605, 1.511338, 0, 0.2431373, 1, 1,
0.2253871, 1.347106, -0.2424192, 0, 0.2392157, 1, 1,
0.2284314, -1.632849, 3.909002, 0, 0.2313726, 1, 1,
0.2301193, -1.455326, 2.93049, 0, 0.227451, 1, 1,
0.2304381, 0.8938598, 0.6271335, 0, 0.2196078, 1, 1,
0.2325183, -1.797883, 2.256172, 0, 0.2156863, 1, 1,
0.2334103, -2.287141, 2.495168, 0, 0.2078431, 1, 1,
0.2337011, -0.4489644, 2.654716, 0, 0.2039216, 1, 1,
0.2373657, -0.3905593, 0.8983608, 0, 0.1960784, 1, 1,
0.2375975, -0.5469515, 4.699122, 0, 0.1882353, 1, 1,
0.2377637, -1.157595, 3.443032, 0, 0.1843137, 1, 1,
0.2399563, -1.593633, 1.89008, 0, 0.1764706, 1, 1,
0.2499101, -1.035217, 0.8646186, 0, 0.172549, 1, 1,
0.2525153, -0.4063813, 1.775603, 0, 0.1647059, 1, 1,
0.2598372, 0.3374333, 0.8168598, 0, 0.1607843, 1, 1,
0.2634767, 0.9874035, 0.2584741, 0, 0.1529412, 1, 1,
0.2654439, 0.04918882, 1.625459, 0, 0.1490196, 1, 1,
0.2682867, 0.3648381, 0.6575803, 0, 0.1411765, 1, 1,
0.2717393, -1.345876, 3.459982, 0, 0.1372549, 1, 1,
0.2790816, 1.821245, 0.08615007, 0, 0.1294118, 1, 1,
0.2841639, -0.61198, 3.44396, 0, 0.1254902, 1, 1,
0.284185, -0.8208719, 1.901298, 0, 0.1176471, 1, 1,
0.2867038, 0.1946985, 1.301696, 0, 0.1137255, 1, 1,
0.2867921, -0.3008132, 2.181576, 0, 0.1058824, 1, 1,
0.2921068, 1.340012, -0.451028, 0, 0.09803922, 1, 1,
0.2927581, -0.2009436, 2.178774, 0, 0.09411765, 1, 1,
0.2951056, -1.08213, 3.252525, 0, 0.08627451, 1, 1,
0.2987348, 0.3438796, 1.779156, 0, 0.08235294, 1, 1,
0.3015042, -0.03410486, 2.069888, 0, 0.07450981, 1, 1,
0.3027399, 0.4564575, -1.375551, 0, 0.07058824, 1, 1,
0.3062274, -0.9672163, 2.652376, 0, 0.0627451, 1, 1,
0.3125226, -0.6249418, 1.061182, 0, 0.05882353, 1, 1,
0.3131593, 1.815559, -0.07839637, 0, 0.05098039, 1, 1,
0.3140785, -0.5881732, 2.008966, 0, 0.04705882, 1, 1,
0.3145565, -0.7598788, 4.672784, 0, 0.03921569, 1, 1,
0.3169569, 1.6823, -1.498691, 0, 0.03529412, 1, 1,
0.3178852, 0.8218626, -0.1407921, 0, 0.02745098, 1, 1,
0.3180077, -1.468834, 2.448944, 0, 0.02352941, 1, 1,
0.3215415, -0.005621899, 1.607265, 0, 0.01568628, 1, 1,
0.3229754, -1.107041, 2.703417, 0, 0.01176471, 1, 1,
0.3260038, 0.8840892, -1.246424, 0, 0.003921569, 1, 1,
0.3318059, -0.6471244, 1.877862, 0.003921569, 0, 1, 1,
0.3346098, -0.09987187, -0.3765888, 0.007843138, 0, 1, 1,
0.3349924, -0.2515093, 3.411706, 0.01568628, 0, 1, 1,
0.3367113, -0.2348475, 0.3367779, 0.01960784, 0, 1, 1,
0.337233, 0.1770419, 1.812647, 0.02745098, 0, 1, 1,
0.3384519, 0.6916659, 0.05243627, 0.03137255, 0, 1, 1,
0.3389925, -2.028546, 3.345628, 0.03921569, 0, 1, 1,
0.3437796, -0.3654078, 2.265395, 0.04313726, 0, 1, 1,
0.3444567, -0.3235708, 3.371763, 0.05098039, 0, 1, 1,
0.3510211, -0.9216781, 3.213566, 0.05490196, 0, 1, 1,
0.3511519, 1.541813, 0.7209137, 0.0627451, 0, 1, 1,
0.3519185, -1.800745, 3.721139, 0.06666667, 0, 1, 1,
0.3537445, -0.8051823, 3.999452, 0.07450981, 0, 1, 1,
0.3558222, 1.03084, 0.03586642, 0.07843138, 0, 1, 1,
0.3561202, -0.2163483, 2.103725, 0.08627451, 0, 1, 1,
0.3573331, -1.35271, 2.066939, 0.09019608, 0, 1, 1,
0.3627336, -1.036933, 3.712221, 0.09803922, 0, 1, 1,
0.3659061, 1.311896, 0.2969918, 0.1058824, 0, 1, 1,
0.3671192, 1.21194, -0.1837998, 0.1098039, 0, 1, 1,
0.3678602, 1.715934, 0.7807009, 0.1176471, 0, 1, 1,
0.3686868, -2.96821, 1.951428, 0.1215686, 0, 1, 1,
0.3743377, -0.5754293, 3.205669, 0.1294118, 0, 1, 1,
0.3834802, -0.5171368, 2.918691, 0.1333333, 0, 1, 1,
0.3900285, -1.072116, 2.15709, 0.1411765, 0, 1, 1,
0.3927639, 0.5148178, -0.5873123, 0.145098, 0, 1, 1,
0.4013165, 0.9031914, 2.034127, 0.1529412, 0, 1, 1,
0.4091389, 0.6386197, 1.277065, 0.1568628, 0, 1, 1,
0.4098248, 1.552929, 0.7923292, 0.1647059, 0, 1, 1,
0.4143543, 1.09236, 2.728679, 0.1686275, 0, 1, 1,
0.4160736, -2.811779, 4.811327, 0.1764706, 0, 1, 1,
0.4162115, 0.4563769, 2.521084, 0.1803922, 0, 1, 1,
0.4209507, 0.3362535, 0.2791192, 0.1882353, 0, 1, 1,
0.4215302, 0.6279078, 0.9477997, 0.1921569, 0, 1, 1,
0.4305949, 0.8413717, 0.5523111, 0.2, 0, 1, 1,
0.4314938, -0.1748203, 1.649343, 0.2078431, 0, 1, 1,
0.434739, -1.267758, 1.901338, 0.2117647, 0, 1, 1,
0.4370067, -0.1041745, 3.615924, 0.2196078, 0, 1, 1,
0.4376314, 1.77317, 0.8255397, 0.2235294, 0, 1, 1,
0.4383044, -1.093299, -0.1003796, 0.2313726, 0, 1, 1,
0.4394115, 1.206289, -0.3209986, 0.2352941, 0, 1, 1,
0.440645, -0.9589481, 1.955595, 0.2431373, 0, 1, 1,
0.4410992, 0.3389301, 1.387768, 0.2470588, 0, 1, 1,
0.4414046, 1.052292, 0.2800804, 0.254902, 0, 1, 1,
0.4416471, 1.103033, 0.4906841, 0.2588235, 0, 1, 1,
0.4486081, 0.02674554, 1.216281, 0.2666667, 0, 1, 1,
0.4488038, 1.472986, 0.3233107, 0.2705882, 0, 1, 1,
0.4523723, -3.844668, 4.271784, 0.2784314, 0, 1, 1,
0.4567765, 0.581383, -0.2096249, 0.282353, 0, 1, 1,
0.4571502, 0.8137684, -0.161403, 0.2901961, 0, 1, 1,
0.4655828, -0.2408315, 3.093336, 0.2941177, 0, 1, 1,
0.4678113, -0.7013832, 3.822297, 0.3019608, 0, 1, 1,
0.4701775, -0.1666778, 1.862862, 0.3098039, 0, 1, 1,
0.4724525, 0.5983464, 1.591728, 0.3137255, 0, 1, 1,
0.4759634, 1.015559, 0.3850243, 0.3215686, 0, 1, 1,
0.4816476, -0.6513562, 1.864635, 0.3254902, 0, 1, 1,
0.4899183, -1.428171, 2.111933, 0.3333333, 0, 1, 1,
0.490007, 0.7444636, 1.476887, 0.3372549, 0, 1, 1,
0.4996256, 0.590602, 1.968741, 0.345098, 0, 1, 1,
0.5026051, 0.1535316, 0.6817898, 0.3490196, 0, 1, 1,
0.5077737, -0.5849009, 3.175891, 0.3568628, 0, 1, 1,
0.5119289, 0.3170362, 0.5798162, 0.3607843, 0, 1, 1,
0.5126028, -0.9557682, 3.740271, 0.3686275, 0, 1, 1,
0.5137301, -0.07982592, -0.06482659, 0.372549, 0, 1, 1,
0.5218828, 0.8635834, 0.5795748, 0.3803922, 0, 1, 1,
0.5230419, -0.2319172, 1.573557, 0.3843137, 0, 1, 1,
0.525827, -0.6059284, 3.344524, 0.3921569, 0, 1, 1,
0.5315997, 1.745991, 0.4311912, 0.3960784, 0, 1, 1,
0.5345193, 0.423758, 0.9530994, 0.4039216, 0, 1, 1,
0.5353051, 1.863564, -0.4360185, 0.4117647, 0, 1, 1,
0.5439599, 1.94005, 0.9215134, 0.4156863, 0, 1, 1,
0.5488077, 0.3817635, 2.149045, 0.4235294, 0, 1, 1,
0.5506848, 1.945247, -0.5824849, 0.427451, 0, 1, 1,
0.5508993, -0.1994206, 2.356956, 0.4352941, 0, 1, 1,
0.5519411, -0.2356206, 3.230257, 0.4392157, 0, 1, 1,
0.5526716, -0.864938, 1.790679, 0.4470588, 0, 1, 1,
0.5628493, 0.6374578, 1.180254, 0.4509804, 0, 1, 1,
0.5689541, 1.155101, 1.454204, 0.4588235, 0, 1, 1,
0.5757585, 0.3887811, 0.8090659, 0.4627451, 0, 1, 1,
0.5784314, -0.5342461, 4.139524, 0.4705882, 0, 1, 1,
0.5815408, 2.354927, 1.21467, 0.4745098, 0, 1, 1,
0.5892676, 0.7969738, 1.64661, 0.4823529, 0, 1, 1,
0.5903825, 0.2206676, 0.3292042, 0.4862745, 0, 1, 1,
0.5909163, -0.2221961, 1.852949, 0.4941176, 0, 1, 1,
0.592001, -0.6018288, 1.879646, 0.5019608, 0, 1, 1,
0.6056526, 0.5231187, 1.146175, 0.5058824, 0, 1, 1,
0.6087222, 0.06099322, 1.77053, 0.5137255, 0, 1, 1,
0.6167752, 0.7172701, 2.488049, 0.5176471, 0, 1, 1,
0.6226353, -0.1302112, 1.328149, 0.5254902, 0, 1, 1,
0.623547, 0.668268, -0.2947317, 0.5294118, 0, 1, 1,
0.6253703, -1.101598, 3.69717, 0.5372549, 0, 1, 1,
0.630161, 1.985502, -0.5408908, 0.5411765, 0, 1, 1,
0.6306704, 0.3169091, 1.736065, 0.5490196, 0, 1, 1,
0.6314315, 0.9526474, 0.5577495, 0.5529412, 0, 1, 1,
0.6318521, 1.488987, 0.778327, 0.5607843, 0, 1, 1,
0.6334609, -1.413698, 2.851734, 0.5647059, 0, 1, 1,
0.6351718, -0.479375, 0.9887862, 0.572549, 0, 1, 1,
0.6451037, 2.927239, -0.788915, 0.5764706, 0, 1, 1,
0.648517, 0.215719, 1.647947, 0.5843138, 0, 1, 1,
0.6499425, -0.01306172, 2.625455, 0.5882353, 0, 1, 1,
0.6522788, -1.7916, 3.898623, 0.5960785, 0, 1, 1,
0.6549966, -0.4042137, 1.661209, 0.6039216, 0, 1, 1,
0.6558727, -1.85907, 3.523415, 0.6078432, 0, 1, 1,
0.6566906, -0.2128925, 0.9445769, 0.6156863, 0, 1, 1,
0.6584887, -0.3487694, 2.701377, 0.6196079, 0, 1, 1,
0.6673117, -1.041875, 1.911869, 0.627451, 0, 1, 1,
0.671647, 2.34709, 0.8306362, 0.6313726, 0, 1, 1,
0.6731734, -1.185639, 1.402189, 0.6392157, 0, 1, 1,
0.6732979, -1.219759, 3.4369, 0.6431373, 0, 1, 1,
0.6758754, 1.212407, -0.1721578, 0.6509804, 0, 1, 1,
0.6774261, 1.071607, 0.6885146, 0.654902, 0, 1, 1,
0.678351, -0.5965439, 4.060794, 0.6627451, 0, 1, 1,
0.6799608, -1.101875, 3.280179, 0.6666667, 0, 1, 1,
0.6810395, 1.081411, -0.5932361, 0.6745098, 0, 1, 1,
0.6812384, 1.755533, 0.1517916, 0.6784314, 0, 1, 1,
0.6834929, 0.2777298, 1.279458, 0.6862745, 0, 1, 1,
0.6890535, -0.38201, 0.1201532, 0.6901961, 0, 1, 1,
0.6897527, -0.284811, 1.329241, 0.6980392, 0, 1, 1,
0.7070183, 0.68664, 1.145149, 0.7058824, 0, 1, 1,
0.7187288, 0.1244608, 1.123905, 0.7098039, 0, 1, 1,
0.7188112, -0.09134176, 1.916487, 0.7176471, 0, 1, 1,
0.7189773, 1.237646, 0.9115854, 0.7215686, 0, 1, 1,
0.7209962, 0.701845, -0.1877775, 0.7294118, 0, 1, 1,
0.7224386, 1.500189, 0.6123704, 0.7333333, 0, 1, 1,
0.7235767, -0.6413221, 2.753723, 0.7411765, 0, 1, 1,
0.7320349, 0.1776137, 0.3295742, 0.7450981, 0, 1, 1,
0.7322326, 0.8289756, 0.5232587, 0.7529412, 0, 1, 1,
0.736216, -0.4915439, 1.536519, 0.7568628, 0, 1, 1,
0.73664, 1.17658, 0.4011106, 0.7647059, 0, 1, 1,
0.7378905, 1.93246, -0.4449238, 0.7686275, 0, 1, 1,
0.7444535, 0.397649, 1.2464, 0.7764706, 0, 1, 1,
0.7592539, 0.7555924, 0.971602, 0.7803922, 0, 1, 1,
0.7648245, 0.2592545, 0.3797177, 0.7882353, 0, 1, 1,
0.7671929, -0.1588774, 2.856667, 0.7921569, 0, 1, 1,
0.7702733, -1.848869, 1.87034, 0.8, 0, 1, 1,
0.7791952, -0.2880015, 1.279588, 0.8078431, 0, 1, 1,
0.7822632, -0.11741, 1.163116, 0.8117647, 0, 1, 1,
0.7860062, -0.07172559, 1.569965, 0.8196079, 0, 1, 1,
0.7920719, 0.977483, -0.4613754, 0.8235294, 0, 1, 1,
0.7969282, -0.9546337, 5.349203, 0.8313726, 0, 1, 1,
0.7988396, 0.06854187, 0.6449053, 0.8352941, 0, 1, 1,
0.8047917, -0.2676206, 2.940021, 0.8431373, 0, 1, 1,
0.8098332, 0.3254122, 0.6164917, 0.8470588, 0, 1, 1,
0.8115144, 1.117675, -0.02330649, 0.854902, 0, 1, 1,
0.8124781, -0.9998701, 2.271333, 0.8588235, 0, 1, 1,
0.8125261, 0.02212927, 2.497973, 0.8666667, 0, 1, 1,
0.8237309, 0.2215869, 1.873212, 0.8705882, 0, 1, 1,
0.8265519, 0.3120282, 1.162776, 0.8784314, 0, 1, 1,
0.8311812, -0.7312893, 0.2245045, 0.8823529, 0, 1, 1,
0.8514204, -0.04688655, 1.035188, 0.8901961, 0, 1, 1,
0.8555878, 0.1070711, 2.721051, 0.8941177, 0, 1, 1,
0.8586186, 0.1388939, 2.953031, 0.9019608, 0, 1, 1,
0.8658133, -1.141304, 4.433504, 0.9098039, 0, 1, 1,
0.8661169, 0.5496284, 0.5266122, 0.9137255, 0, 1, 1,
0.8697448, 0.8074507, -1.579637, 0.9215686, 0, 1, 1,
0.8800461, 0.1886674, 2.117695, 0.9254902, 0, 1, 1,
0.8898719, -0.8055227, 3.837037, 0.9333333, 0, 1, 1,
0.896488, 1.934861, 1.857163, 0.9372549, 0, 1, 1,
0.9000714, 2.025756, 0.1973606, 0.945098, 0, 1, 1,
0.9004423, 0.2948302, 3.252706, 0.9490196, 0, 1, 1,
0.9052426, 0.9390249, -0.06421076, 0.9568627, 0, 1, 1,
0.9074721, -1.873755, 3.929801, 0.9607843, 0, 1, 1,
0.9078791, -0.778365, 3.911802, 0.9686275, 0, 1, 1,
0.9134204, -1.110609, 2.765457, 0.972549, 0, 1, 1,
0.9143977, 0.2265318, 2.088666, 0.9803922, 0, 1, 1,
0.9183432, -0.330164, 3.080311, 0.9843137, 0, 1, 1,
0.9191037, -0.8337671, 3.427445, 0.9921569, 0, 1, 1,
0.9432956, 0.2417019, 0.6202009, 0.9960784, 0, 1, 1,
0.9454315, -0.6500599, 0.9036878, 1, 0, 0.9960784, 1,
0.9460828, 1.163269, 0.6543165, 1, 0, 0.9882353, 1,
0.9500283, -0.5134271, 0.8003567, 1, 0, 0.9843137, 1,
0.9537294, 0.652663, 0.2176264, 1, 0, 0.9764706, 1,
0.9548653, 0.8093803, 0.5458742, 1, 0, 0.972549, 1,
0.9642725, 0.6488054, 1.119195, 1, 0, 0.9647059, 1,
0.9649366, -1.376135, 3.508951, 1, 0, 0.9607843, 1,
0.9698519, -0.6874657, 2.113627, 1, 0, 0.9529412, 1,
0.9793647, 1.468803, 0.4069491, 1, 0, 0.9490196, 1,
0.9828066, 1.111087, 0.9888459, 1, 0, 0.9411765, 1,
0.9836989, -0.7686383, 1.965724, 1, 0, 0.9372549, 1,
0.985796, 0.06966886, 2.515361, 1, 0, 0.9294118, 1,
0.9863727, 0.870937, 0.2381026, 1, 0, 0.9254902, 1,
0.990519, -2.100991, 2.78322, 1, 0, 0.9176471, 1,
0.9950783, -0.03624143, 0.598469, 1, 0, 0.9137255, 1,
1.000165, 0.09899662, 1.613793, 1, 0, 0.9058824, 1,
1.005673, 1.835381, 0.807672, 1, 0, 0.9019608, 1,
1.008845, -1.068298, 3.030369, 1, 0, 0.8941177, 1,
1.011611, -1.654524, 3.11753, 1, 0, 0.8862745, 1,
1.013789, 0.7164385, 0.3193833, 1, 0, 0.8823529, 1,
1.025743, -0.2671238, 2.425029, 1, 0, 0.8745098, 1,
1.028206, -0.1567663, 2.607601, 1, 0, 0.8705882, 1,
1.032533, 0.09367619, 0.2281045, 1, 0, 0.8627451, 1,
1.050903, 0.9676569, 0.1771082, 1, 0, 0.8588235, 1,
1.053439, 0.4357378, -0.1473262, 1, 0, 0.8509804, 1,
1.054385, 0.2846534, 0.8670813, 1, 0, 0.8470588, 1,
1.066401, -1.557725, 1.982387, 1, 0, 0.8392157, 1,
1.067667, -0.4815907, 2.672632, 1, 0, 0.8352941, 1,
1.07295, -1.970724, 2.043111, 1, 0, 0.827451, 1,
1.07321, 0.8896691, 0.9928538, 1, 0, 0.8235294, 1,
1.074566, -0.6696115, 2.159266, 1, 0, 0.8156863, 1,
1.075781, -0.7037436, 3.643884, 1, 0, 0.8117647, 1,
1.07607, -0.2198898, 1.951157, 1, 0, 0.8039216, 1,
1.078505, 2.619938, -0.2171071, 1, 0, 0.7960784, 1,
1.078807, -0.6416214, 3.977355, 1, 0, 0.7921569, 1,
1.082947, 0.8903221, 0.935639, 1, 0, 0.7843137, 1,
1.088279, 0.9367296, 0.5209406, 1, 0, 0.7803922, 1,
1.097335, -0.6976402, 2.872423, 1, 0, 0.772549, 1,
1.118285, 1.329356, 2.232613, 1, 0, 0.7686275, 1,
1.13277, -0.5236512, 1.376788, 1, 0, 0.7607843, 1,
1.145214, -0.112473, 2.36736, 1, 0, 0.7568628, 1,
1.147723, -0.07694224, 2.079227, 1, 0, 0.7490196, 1,
1.152265, 0.9659948, -0.6050158, 1, 0, 0.7450981, 1,
1.157324, 0.09923962, 2.909127, 1, 0, 0.7372549, 1,
1.158237, -0.2847048, 1.693053, 1, 0, 0.7333333, 1,
1.17513, 1.068089, 2.281914, 1, 0, 0.7254902, 1,
1.180715, -1.874096, 2.215688, 1, 0, 0.7215686, 1,
1.181541, 0.583718, 0.9518285, 1, 0, 0.7137255, 1,
1.181641, -0.1865489, 1.281149, 1, 0, 0.7098039, 1,
1.183403, -1.047702, 2.162694, 1, 0, 0.7019608, 1,
1.190789, -0.07643166, 2.451701, 1, 0, 0.6941177, 1,
1.204642, -1.193503, 1.18661, 1, 0, 0.6901961, 1,
1.213728, -0.9151174, 1.06056, 1, 0, 0.682353, 1,
1.217561, -0.0203686, 3.304077, 1, 0, 0.6784314, 1,
1.218745, 0.7067034, 1.097085, 1, 0, 0.6705883, 1,
1.228873, 0.9463952, 0.9023762, 1, 0, 0.6666667, 1,
1.236526, -1.557531, 3.33435, 1, 0, 0.6588235, 1,
1.240464, 0.2596073, -0.5119964, 1, 0, 0.654902, 1,
1.245248, -1.041871, 1.430843, 1, 0, 0.6470588, 1,
1.246522, 0.005642955, 1.344387, 1, 0, 0.6431373, 1,
1.25979, -0.4027575, 3.017678, 1, 0, 0.6352941, 1,
1.26821, 0.8462014, 2.294892, 1, 0, 0.6313726, 1,
1.270887, -1.050311, 1.386342, 1, 0, 0.6235294, 1,
1.286839, 0.3553272, 1.982463, 1, 0, 0.6196079, 1,
1.295689, 0.4602999, 2.18816, 1, 0, 0.6117647, 1,
1.301623, -1.562426, 1.916378, 1, 0, 0.6078432, 1,
1.315785, 1.355338, 1.445424, 1, 0, 0.6, 1,
1.316909, -1.451144, 5.101209, 1, 0, 0.5921569, 1,
1.318033, 1.386312, 2.135333, 1, 0, 0.5882353, 1,
1.323003, -0.7939535, 2.909478, 1, 0, 0.5803922, 1,
1.33036, 0.8269094, -0.4782851, 1, 0, 0.5764706, 1,
1.331144, 0.2887107, 3.291401, 1, 0, 0.5686275, 1,
1.334927, -1.165177, 1.863941, 1, 0, 0.5647059, 1,
1.335522, -0.428285, 0.8858058, 1, 0, 0.5568628, 1,
1.348869, -0.05380377, 3.528859, 1, 0, 0.5529412, 1,
1.358243, 0.421843, -0.1469465, 1, 0, 0.5450981, 1,
1.360007, 0.009903638, 4.20934, 1, 0, 0.5411765, 1,
1.362003, -0.4174924, 4.446162, 1, 0, 0.5333334, 1,
1.368724, -0.9775234, 0.5734318, 1, 0, 0.5294118, 1,
1.372203, 0.4771539, 1.805189, 1, 0, 0.5215687, 1,
1.374952, 0.773707, 0.3457838, 1, 0, 0.5176471, 1,
1.379992, -0.8733898, 2.207754, 1, 0, 0.509804, 1,
1.384025, 1.126629, -0.389031, 1, 0, 0.5058824, 1,
1.39531, 0.3952053, 1.38555, 1, 0, 0.4980392, 1,
1.41347, 1.034904, -0.2636375, 1, 0, 0.4901961, 1,
1.423241, 1.17696, -0.597907, 1, 0, 0.4862745, 1,
1.437369, 0.617234, 1.694084, 1, 0, 0.4784314, 1,
1.450119, 0.1542678, 0.3500974, 1, 0, 0.4745098, 1,
1.455776, 0.6484141, 0.2698897, 1, 0, 0.4666667, 1,
1.456239, 0.9851029, 0.4630302, 1, 0, 0.4627451, 1,
1.456353, -1.3614, 1.516232, 1, 0, 0.454902, 1,
1.469419, 2.058273, 1.598111, 1, 0, 0.4509804, 1,
1.471964, -0.6538805, 0.6749021, 1, 0, 0.4431373, 1,
1.480772, 0.9533297, 0.3261091, 1, 0, 0.4392157, 1,
1.483239, 0.2101653, 2.926624, 1, 0, 0.4313726, 1,
1.491673, -1.420304, 0.9991469, 1, 0, 0.427451, 1,
1.496986, -1.388843, 1.274022, 1, 0, 0.4196078, 1,
1.499583, 1.62057, 0.9217507, 1, 0, 0.4156863, 1,
1.522059, 1.661694, 0.3843355, 1, 0, 0.4078431, 1,
1.543666, -1.993664, 2.344426, 1, 0, 0.4039216, 1,
1.556336, 0.4951313, 1.338064, 1, 0, 0.3960784, 1,
1.563525, -0.2403906, 1.509839, 1, 0, 0.3882353, 1,
1.586445, 1.71666, 0.6663923, 1, 0, 0.3843137, 1,
1.586668, 0.9827311, 0.02799879, 1, 0, 0.3764706, 1,
1.58717, 0.5244915, 1.689882, 1, 0, 0.372549, 1,
1.594857, -0.1998115, 3.84652, 1, 0, 0.3647059, 1,
1.604377, -0.07144862, 2.180128, 1, 0, 0.3607843, 1,
1.605482, 0.9168147, 0.245882, 1, 0, 0.3529412, 1,
1.60771, -0.6232263, 2.01414, 1, 0, 0.3490196, 1,
1.610995, 0.7326764, 1.80123, 1, 0, 0.3411765, 1,
1.612051, 1.03029, -0.8679298, 1, 0, 0.3372549, 1,
1.613184, -0.8549422, 2.439753, 1, 0, 0.3294118, 1,
1.618354, -0.7471611, 3.075628, 1, 0, 0.3254902, 1,
1.620901, 1.875082, -0.2221571, 1, 0, 0.3176471, 1,
1.626102, -1.384738, 3.666101, 1, 0, 0.3137255, 1,
1.626221, -0.6625843, 2.323515, 1, 0, 0.3058824, 1,
1.682055, -0.1899617, 0.5677659, 1, 0, 0.2980392, 1,
1.686178, -0.4113483, 2.656152, 1, 0, 0.2941177, 1,
1.690894, 0.04746639, 1.347165, 1, 0, 0.2862745, 1,
1.709025, -2.776486, 0.454847, 1, 0, 0.282353, 1,
1.712389, -0.9954401, 3.522207, 1, 0, 0.2745098, 1,
1.713762, -0.4348892, -0.03802795, 1, 0, 0.2705882, 1,
1.747293, 0.2183041, 0.4966152, 1, 0, 0.2627451, 1,
1.766228, -2.376458, 1.179742, 1, 0, 0.2588235, 1,
1.790183, 1.658942, 1.09434, 1, 0, 0.2509804, 1,
1.796131, 0.8494245, 1.698609, 1, 0, 0.2470588, 1,
1.802325, -0.5489443, 1.339694, 1, 0, 0.2392157, 1,
1.819225, -0.1758474, 1.836353, 1, 0, 0.2352941, 1,
1.823196, -1.274142, 2.172446, 1, 0, 0.227451, 1,
1.824816, 1.033468, -0.6083646, 1, 0, 0.2235294, 1,
1.855973, -0.4365449, 1.12028, 1, 0, 0.2156863, 1,
1.856239, 1.799416, 1.091606, 1, 0, 0.2117647, 1,
1.869364, 2.153962, 2.264132, 1, 0, 0.2039216, 1,
1.886962, 0.2576263, 0.7854495, 1, 0, 0.1960784, 1,
1.88777, -0.4556082, 3.14592, 1, 0, 0.1921569, 1,
1.913247, 0.03004456, 1.728787, 1, 0, 0.1843137, 1,
1.915734, 0.6150991, 0.513805, 1, 0, 0.1803922, 1,
1.917236, -0.3110678, 2.256507, 1, 0, 0.172549, 1,
1.922616, 0.06632657, -0.4509443, 1, 0, 0.1686275, 1,
1.941926, -0.1954522, 2.124242, 1, 0, 0.1607843, 1,
1.944697, -1.023305, 1.950338, 1, 0, 0.1568628, 1,
1.965193, -0.3005689, 0.2830854, 1, 0, 0.1490196, 1,
1.978463, -0.2734328, 2.173777, 1, 0, 0.145098, 1,
1.979437, -1.298264, 1.320718, 1, 0, 0.1372549, 1,
1.984298, 0.237184, 2.006407, 1, 0, 0.1333333, 1,
1.99691, -0.3618045, 2.225133, 1, 0, 0.1254902, 1,
2.001547, 1.120716, 0.8234234, 1, 0, 0.1215686, 1,
2.014768, 0.3325058, 3.450249, 1, 0, 0.1137255, 1,
2.029294, -2.144747, 3.003008, 1, 0, 0.1098039, 1,
2.037318, -1.207228, 3.011154, 1, 0, 0.1019608, 1,
2.066433, 1.375661, 1.219344, 1, 0, 0.09411765, 1,
2.093893, -0.9414004, 2.899269, 1, 0, 0.09019608, 1,
2.176847, 0.5568643, 3.74431, 1, 0, 0.08235294, 1,
2.177222, 1.54833, 0.2198921, 1, 0, 0.07843138, 1,
2.242208, -0.4785225, 2.510289, 1, 0, 0.07058824, 1,
2.292495, -1.615171, 2.607334, 1, 0, 0.06666667, 1,
2.495389, 1.702551, 0.944913, 1, 0, 0.05882353, 1,
2.498309, -0.6282385, 2.056576, 1, 0, 0.05490196, 1,
2.510374, -0.4381457, 0.7589402, 1, 0, 0.04705882, 1,
2.543778, 0.3067506, 2.425861, 1, 0, 0.04313726, 1,
2.627534, -0.4969083, 0.6755906, 1, 0, 0.03529412, 1,
2.638299, 2.25186, 2.956824, 1, 0, 0.03137255, 1,
2.738502, -0.2629046, 2.357337, 1, 0, 0.02352941, 1,
2.762635, -1.247862, 0.5292292, 1, 0, 0.01960784, 1,
2.851009, -0.1959547, 1.131646, 1, 0, 0.01176471, 1,
3.043711, -1.283602, 2.458728, 1, 0, 0.007843138, 1
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
-0.09268534, -5.023241, -7.337937, 0, -0.5, 0.5, 0.5,
-0.09268534, -5.023241, -7.337937, 1, -0.5, 0.5, 0.5,
-0.09268534, -5.023241, -7.337937, 1, 1.5, 0.5, 0.5,
-0.09268534, -5.023241, -7.337937, 0, 1.5, 0.5, 0.5
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
-4.29232, -0.3680502, -7.337937, 0, -0.5, 0.5, 0.5,
-4.29232, -0.3680502, -7.337937, 1, -0.5, 0.5, 0.5,
-4.29232, -0.3680502, -7.337937, 1, 1.5, 0.5, 0.5,
-4.29232, -0.3680502, -7.337937, 0, 1.5, 0.5, 0.5
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
-4.29232, -5.023241, 0.01909232, 0, -0.5, 0.5, 0.5,
-4.29232, -5.023241, 0.01909232, 1, -0.5, 0.5, 0.5,
-4.29232, -5.023241, 0.01909232, 1, 1.5, 0.5, 0.5,
-4.29232, -5.023241, 0.01909232, 0, 1.5, 0.5, 0.5
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
-3, -3.948966, -5.640161,
3, -3.948966, -5.640161,
-3, -3.948966, -5.640161,
-3, -4.128012, -5.923124,
-2, -3.948966, -5.640161,
-2, -4.128012, -5.923124,
-1, -3.948966, -5.640161,
-1, -4.128012, -5.923124,
0, -3.948966, -5.640161,
0, -4.128012, -5.923124,
1, -3.948966, -5.640161,
1, -4.128012, -5.923124,
2, -3.948966, -5.640161,
2, -4.128012, -5.923124,
3, -3.948966, -5.640161,
3, -4.128012, -5.923124
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
-3, -4.486104, -6.489049, 0, -0.5, 0.5, 0.5,
-3, -4.486104, -6.489049, 1, -0.5, 0.5, 0.5,
-3, -4.486104, -6.489049, 1, 1.5, 0.5, 0.5,
-3, -4.486104, -6.489049, 0, 1.5, 0.5, 0.5,
-2, -4.486104, -6.489049, 0, -0.5, 0.5, 0.5,
-2, -4.486104, -6.489049, 1, -0.5, 0.5, 0.5,
-2, -4.486104, -6.489049, 1, 1.5, 0.5, 0.5,
-2, -4.486104, -6.489049, 0, 1.5, 0.5, 0.5,
-1, -4.486104, -6.489049, 0, -0.5, 0.5, 0.5,
-1, -4.486104, -6.489049, 1, -0.5, 0.5, 0.5,
-1, -4.486104, -6.489049, 1, 1.5, 0.5, 0.5,
-1, -4.486104, -6.489049, 0, 1.5, 0.5, 0.5,
0, -4.486104, -6.489049, 0, -0.5, 0.5, 0.5,
0, -4.486104, -6.489049, 1, -0.5, 0.5, 0.5,
0, -4.486104, -6.489049, 1, 1.5, 0.5, 0.5,
0, -4.486104, -6.489049, 0, 1.5, 0.5, 0.5,
1, -4.486104, -6.489049, 0, -0.5, 0.5, 0.5,
1, -4.486104, -6.489049, 1, -0.5, 0.5, 0.5,
1, -4.486104, -6.489049, 1, 1.5, 0.5, 0.5,
1, -4.486104, -6.489049, 0, 1.5, 0.5, 0.5,
2, -4.486104, -6.489049, 0, -0.5, 0.5, 0.5,
2, -4.486104, -6.489049, 1, -0.5, 0.5, 0.5,
2, -4.486104, -6.489049, 1, 1.5, 0.5, 0.5,
2, -4.486104, -6.489049, 0, 1.5, 0.5, 0.5,
3, -4.486104, -6.489049, 0, -0.5, 0.5, 0.5,
3, -4.486104, -6.489049, 1, -0.5, 0.5, 0.5,
3, -4.486104, -6.489049, 1, 1.5, 0.5, 0.5,
3, -4.486104, -6.489049, 0, 1.5, 0.5, 0.5
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
-3.323174, -3, -5.640161,
-3.323174, 3, -5.640161,
-3.323174, -3, -5.640161,
-3.484698, -3, -5.923124,
-3.323174, -2, -5.640161,
-3.484698, -2, -5.923124,
-3.323174, -1, -5.640161,
-3.484698, -1, -5.923124,
-3.323174, 0, -5.640161,
-3.484698, 0, -5.923124,
-3.323174, 1, -5.640161,
-3.484698, 1, -5.923124,
-3.323174, 2, -5.640161,
-3.484698, 2, -5.923124,
-3.323174, 3, -5.640161,
-3.484698, 3, -5.923124
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
-3.807747, -3, -6.489049, 0, -0.5, 0.5, 0.5,
-3.807747, -3, -6.489049, 1, -0.5, 0.5, 0.5,
-3.807747, -3, -6.489049, 1, 1.5, 0.5, 0.5,
-3.807747, -3, -6.489049, 0, 1.5, 0.5, 0.5,
-3.807747, -2, -6.489049, 0, -0.5, 0.5, 0.5,
-3.807747, -2, -6.489049, 1, -0.5, 0.5, 0.5,
-3.807747, -2, -6.489049, 1, 1.5, 0.5, 0.5,
-3.807747, -2, -6.489049, 0, 1.5, 0.5, 0.5,
-3.807747, -1, -6.489049, 0, -0.5, 0.5, 0.5,
-3.807747, -1, -6.489049, 1, -0.5, 0.5, 0.5,
-3.807747, -1, -6.489049, 1, 1.5, 0.5, 0.5,
-3.807747, -1, -6.489049, 0, 1.5, 0.5, 0.5,
-3.807747, 0, -6.489049, 0, -0.5, 0.5, 0.5,
-3.807747, 0, -6.489049, 1, -0.5, 0.5, 0.5,
-3.807747, 0, -6.489049, 1, 1.5, 0.5, 0.5,
-3.807747, 0, -6.489049, 0, 1.5, 0.5, 0.5,
-3.807747, 1, -6.489049, 0, -0.5, 0.5, 0.5,
-3.807747, 1, -6.489049, 1, -0.5, 0.5, 0.5,
-3.807747, 1, -6.489049, 1, 1.5, 0.5, 0.5,
-3.807747, 1, -6.489049, 0, 1.5, 0.5, 0.5,
-3.807747, 2, -6.489049, 0, -0.5, 0.5, 0.5,
-3.807747, 2, -6.489049, 1, -0.5, 0.5, 0.5,
-3.807747, 2, -6.489049, 1, 1.5, 0.5, 0.5,
-3.807747, 2, -6.489049, 0, 1.5, 0.5, 0.5,
-3.807747, 3, -6.489049, 0, -0.5, 0.5, 0.5,
-3.807747, 3, -6.489049, 1, -0.5, 0.5, 0.5,
-3.807747, 3, -6.489049, 1, 1.5, 0.5, 0.5,
-3.807747, 3, -6.489049, 0, 1.5, 0.5, 0.5
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
-3.323174, -3.948966, -4,
-3.323174, -3.948966, 4,
-3.323174, -3.948966, -4,
-3.484698, -4.128012, -4,
-3.323174, -3.948966, -2,
-3.484698, -4.128012, -2,
-3.323174, -3.948966, 0,
-3.484698, -4.128012, 0,
-3.323174, -3.948966, 2,
-3.484698, -4.128012, 2,
-3.323174, -3.948966, 4,
-3.484698, -4.128012, 4
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
-3.807747, -4.486104, -4, 0, -0.5, 0.5, 0.5,
-3.807747, -4.486104, -4, 1, -0.5, 0.5, 0.5,
-3.807747, -4.486104, -4, 1, 1.5, 0.5, 0.5,
-3.807747, -4.486104, -4, 0, 1.5, 0.5, 0.5,
-3.807747, -4.486104, -2, 0, -0.5, 0.5, 0.5,
-3.807747, -4.486104, -2, 1, -0.5, 0.5, 0.5,
-3.807747, -4.486104, -2, 1, 1.5, 0.5, 0.5,
-3.807747, -4.486104, -2, 0, 1.5, 0.5, 0.5,
-3.807747, -4.486104, 0, 0, -0.5, 0.5, 0.5,
-3.807747, -4.486104, 0, 1, -0.5, 0.5, 0.5,
-3.807747, -4.486104, 0, 1, 1.5, 0.5, 0.5,
-3.807747, -4.486104, 0, 0, 1.5, 0.5, 0.5,
-3.807747, -4.486104, 2, 0, -0.5, 0.5, 0.5,
-3.807747, -4.486104, 2, 1, -0.5, 0.5, 0.5,
-3.807747, -4.486104, 2, 1, 1.5, 0.5, 0.5,
-3.807747, -4.486104, 2, 0, 1.5, 0.5, 0.5,
-3.807747, -4.486104, 4, 0, -0.5, 0.5, 0.5,
-3.807747, -4.486104, 4, 1, -0.5, 0.5, 0.5,
-3.807747, -4.486104, 4, 1, 1.5, 0.5, 0.5,
-3.807747, -4.486104, 4, 0, 1.5, 0.5, 0.5
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
-3.323174, -3.948966, -5.640161,
-3.323174, 3.212866, -5.640161,
-3.323174, -3.948966, 5.678346,
-3.323174, 3.212866, 5.678346,
-3.323174, -3.948966, -5.640161,
-3.323174, -3.948966, 5.678346,
-3.323174, 3.212866, -5.640161,
-3.323174, 3.212866, 5.678346,
-3.323174, -3.948966, -5.640161,
3.137803, -3.948966, -5.640161,
-3.323174, -3.948966, 5.678346,
3.137803, -3.948966, 5.678346,
-3.323174, 3.212866, -5.640161,
3.137803, 3.212866, -5.640161,
-3.323174, 3.212866, 5.678346,
3.137803, 3.212866, 5.678346,
3.137803, -3.948966, -5.640161,
3.137803, 3.212866, -5.640161,
3.137803, -3.948966, 5.678346,
3.137803, 3.212866, 5.678346,
3.137803, -3.948966, -5.640161,
3.137803, -3.948966, 5.678346,
3.137803, 3.212866, -5.640161,
3.137803, 3.212866, 5.678346
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
var radius = 7.940789;
var distance = 35.32947;
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
mvMatrix.translate( 0.09268534, 0.3680502, -0.01909232 );
mvMatrix.scale( 1.328861, 1.198819, 0.7585574 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.32947);
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
Methomyl<-read.table("Methomyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Methomyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methomyl' not found
```

```r
y<-Methomyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methomyl' not found
```

```r
z<-Methomyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methomyl' not found
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
-3.229082, -0.9351509, -1.230847, 0, 0, 1, 1, 1,
-3.221313, 0.5577635, -2.014366, 1, 0, 0, 1, 1,
-3.197304, -0.4842307, -2.530607, 1, 0, 0, 1, 1,
-2.942878, 1.057896, 0.03826063, 1, 0, 0, 1, 1,
-2.941759, -0.06435984, -1.568914, 1, 0, 0, 1, 1,
-2.667483, 0.7196839, -1.733917, 1, 0, 0, 1, 1,
-2.628503, 0.2467304, -1.88175, 0, 0, 0, 1, 1,
-2.608132, 0.3436539, -2.261417, 0, 0, 0, 1, 1,
-2.603914, -0.2121419, -0.138363, 0, 0, 0, 1, 1,
-2.55268, -1.358399, -2.649974, 0, 0, 0, 1, 1,
-2.405247, 1.046263, -0.731442, 0, 0, 0, 1, 1,
-2.402674, -0.8645037, -2.126635, 0, 0, 0, 1, 1,
-2.380729, 0.1980928, -0.2252825, 0, 0, 0, 1, 1,
-2.370505, 0.1628173, -1.952132, 1, 1, 1, 1, 1,
-2.292836, -1.833737, -2.989122, 1, 1, 1, 1, 1,
-2.282966, 0.500024, -1.217165, 1, 1, 1, 1, 1,
-2.276714, -0.2452184, -1.894935, 1, 1, 1, 1, 1,
-2.273011, -0.2800481, -3.229717, 1, 1, 1, 1, 1,
-2.227962, -0.5414277, -0.5459319, 1, 1, 1, 1, 1,
-2.175663, 0.1769049, -0.5223362, 1, 1, 1, 1, 1,
-2.138855, -0.1605556, -0.8900155, 1, 1, 1, 1, 1,
-2.083729, 0.1438732, -0.9932808, 1, 1, 1, 1, 1,
-2.058527, -0.01881589, -0.8907868, 1, 1, 1, 1, 1,
-2.022809, -0.1768966, -2.492959, 1, 1, 1, 1, 1,
-1.995951, 1.206721, -1.209853, 1, 1, 1, 1, 1,
-1.994032, 0.7304247, -0.654775, 1, 1, 1, 1, 1,
-1.976193, 1.075228, -0.6119924, 1, 1, 1, 1, 1,
-1.962566, -0.2811802, -1.526653, 1, 1, 1, 1, 1,
-1.953765, 0.5870479, -1.011764, 0, 0, 1, 1, 1,
-1.944962, -0.6283427, -1.959457, 1, 0, 0, 1, 1,
-1.881312, 0.01627387, -1.40018, 1, 0, 0, 1, 1,
-1.869847, 1.601255, -1.396268, 1, 0, 0, 1, 1,
-1.866488, 0.01410014, -1.165868, 1, 0, 0, 1, 1,
-1.857512, -0.1583318, -0.6404625, 1, 0, 0, 1, 1,
-1.844484, 0.4955915, -4.185376, 0, 0, 0, 1, 1,
-1.828269, 1.757181, -0.2489503, 0, 0, 0, 1, 1,
-1.821945, 0.5200081, -0.8327118, 0, 0, 0, 1, 1,
-1.81365, 1.229303, -0.3857896, 0, 0, 0, 1, 1,
-1.803339, 2.040765, -0.04018272, 0, 0, 0, 1, 1,
-1.798724, -0.2717684, -1.231189, 0, 0, 0, 1, 1,
-1.778457, -2.192282, -1.464943, 0, 0, 0, 1, 1,
-1.77462, -0.7163936, -2.084603, 1, 1, 1, 1, 1,
-1.750994, 1.160851, -1.504418, 1, 1, 1, 1, 1,
-1.742838, 0.6919136, -1.823391, 1, 1, 1, 1, 1,
-1.740477, 0.6851063, 0.6693655, 1, 1, 1, 1, 1,
-1.719968, 0.9096186, -1.34403, 1, 1, 1, 1, 1,
-1.689298, 0.541514, 0.4363097, 1, 1, 1, 1, 1,
-1.687878, -0.4902913, -2.475986, 1, 1, 1, 1, 1,
-1.672572, 0.3382601, -1.505489, 1, 1, 1, 1, 1,
-1.672011, -1.168264, -4.025616, 1, 1, 1, 1, 1,
-1.6657, 1.325181, -0.2029465, 1, 1, 1, 1, 1,
-1.649563, 1.166335, -1.897544, 1, 1, 1, 1, 1,
-1.64622, -0.3360189, -1.441917, 1, 1, 1, 1, 1,
-1.64571, 0.2862496, -1.064347, 1, 1, 1, 1, 1,
-1.640581, 0.3770619, -0.7457089, 1, 1, 1, 1, 1,
-1.631983, -0.3981289, -2.430816, 1, 1, 1, 1, 1,
-1.622768, -0.2776422, 0.2303228, 0, 0, 1, 1, 1,
-1.621297, -1.733602, -3.059744, 1, 0, 0, 1, 1,
-1.619532, 1.076764, 0.1318795, 1, 0, 0, 1, 1,
-1.619287, 0.563925, -0.2606896, 1, 0, 0, 1, 1,
-1.618768, -0.300582, -2.273647, 1, 0, 0, 1, 1,
-1.600626, 0.128679, -1.560871, 1, 0, 0, 1, 1,
-1.593383, 0.1618574, -2.224052, 0, 0, 0, 1, 1,
-1.589765, 0.526229, -3.59057, 0, 0, 0, 1, 1,
-1.574345, -0.1318383, -2.333061, 0, 0, 0, 1, 1,
-1.565835, -0.2887032, -2.619416, 0, 0, 0, 1, 1,
-1.56432, 1.585724, -1.801448, 0, 0, 0, 1, 1,
-1.558992, 0.8051404, -1.420342, 0, 0, 0, 1, 1,
-1.558062, 0.4971639, -2.460241, 0, 0, 0, 1, 1,
-1.551456, -0.6947166, -1.573426, 1, 1, 1, 1, 1,
-1.550972, 1.558322, -2.537354, 1, 1, 1, 1, 1,
-1.540842, 1.485612, 0.7011939, 1, 1, 1, 1, 1,
-1.530985, -1.64505, -2.941274, 1, 1, 1, 1, 1,
-1.515973, 1.026143, -0.3500798, 1, 1, 1, 1, 1,
-1.512348, -1.220444, -2.573671, 1, 1, 1, 1, 1,
-1.507386, 0.2879382, -0.04422381, 1, 1, 1, 1, 1,
-1.494711, 0.4354286, 0.7085534, 1, 1, 1, 1, 1,
-1.482982, 0.9375643, -1.044181, 1, 1, 1, 1, 1,
-1.471275, -0.8217874, -0.5933718, 1, 1, 1, 1, 1,
-1.469775, -0.3156377, -0.01417586, 1, 1, 1, 1, 1,
-1.449988, 2.494222, -0.5303197, 1, 1, 1, 1, 1,
-1.448292, -2.213813, -3.537315, 1, 1, 1, 1, 1,
-1.444354, 0.4171224, -1.02704, 1, 1, 1, 1, 1,
-1.438036, 0.7157856, -0.4425121, 1, 1, 1, 1, 1,
-1.433149, 0.191029, -2.185807, 0, 0, 1, 1, 1,
-1.42505, -0.7942812, -2.362463, 1, 0, 0, 1, 1,
-1.423591, -1.358882, -3.063162, 1, 0, 0, 1, 1,
-1.404317, -0.4849423, -2.469514, 1, 0, 0, 1, 1,
-1.403706, -0.4537816, -0.1501097, 1, 0, 0, 1, 1,
-1.402329, -0.4592187, -0.5305021, 1, 0, 0, 1, 1,
-1.397674, -0.3732088, -2.751832, 0, 0, 0, 1, 1,
-1.395382, 0.4015098, -2.502583, 0, 0, 0, 1, 1,
-1.391821, -0.1272561, -2.50751, 0, 0, 0, 1, 1,
-1.388955, 0.2572753, -2.270781, 0, 0, 0, 1, 1,
-1.381824, 0.2337272, -2.710158, 0, 0, 0, 1, 1,
-1.343768, 1.85951, -2.632877, 0, 0, 0, 1, 1,
-1.343745, -0.7332698, -1.97688, 0, 0, 0, 1, 1,
-1.332874, 0.4267469, -1.705674, 1, 1, 1, 1, 1,
-1.33175, 1.14551, -0.5111843, 1, 1, 1, 1, 1,
-1.33101, -1.101447, -2.742661, 1, 1, 1, 1, 1,
-1.33005, -0.2003486, -2.408257, 1, 1, 1, 1, 1,
-1.328861, 1.102876, -1.035851, 1, 1, 1, 1, 1,
-1.319982, 1.479262, -0.1579959, 1, 1, 1, 1, 1,
-1.314424, -0.3486462, -1.905638, 1, 1, 1, 1, 1,
-1.306713, -2.820853, -2.849228, 1, 1, 1, 1, 1,
-1.304519, 1.410518, 1.492777, 1, 1, 1, 1, 1,
-1.30003, 1.382923, -1.050457, 1, 1, 1, 1, 1,
-1.299708, -0.07163841, -0.979184, 1, 1, 1, 1, 1,
-1.299183, -1.6721, -4.495386, 1, 1, 1, 1, 1,
-1.293597, -0.04664604, -2.203589, 1, 1, 1, 1, 1,
-1.288531, -0.2361477, -3.050229, 1, 1, 1, 1, 1,
-1.2839, -0.3267856, -1.651429, 1, 1, 1, 1, 1,
-1.271957, -0.03587985, -1.748019, 0, 0, 1, 1, 1,
-1.268233, 2.385291, -0.3172845, 1, 0, 0, 1, 1,
-1.26119, -0.2323429, -1.645368, 1, 0, 0, 1, 1,
-1.260873, -0.4653369, -2.330816, 1, 0, 0, 1, 1,
-1.251116, -0.3092133, -2.450625, 1, 0, 0, 1, 1,
-1.249834, -0.4579179, -1.616171, 1, 0, 0, 1, 1,
-1.246859, 0.4059902, -1.60328, 0, 0, 0, 1, 1,
-1.24601, 0.03691705, -0.4909261, 0, 0, 0, 1, 1,
-1.226658, -1.510175, -1.84762, 0, 0, 0, 1, 1,
-1.220145, -0.968458, -1.91058, 0, 0, 0, 1, 1,
-1.208152, 0.7752438, -1.447048, 0, 0, 0, 1, 1,
-1.198068, 0.4703724, -0.7540725, 0, 0, 0, 1, 1,
-1.193851, -0.2331784, -1.515225, 0, 0, 0, 1, 1,
-1.192252, -1.11139, -1.677427, 1, 1, 1, 1, 1,
-1.189557, -0.8630987, -1.713363, 1, 1, 1, 1, 1,
-1.188582, 0.6087415, -0.4664426, 1, 1, 1, 1, 1,
-1.185285, 0.3250153, -1.467952, 1, 1, 1, 1, 1,
-1.179633, -0.4866051, -1.506557, 1, 1, 1, 1, 1,
-1.176152, -0.3248756, -2.931451, 1, 1, 1, 1, 1,
-1.174485, 0.6894149, -0.6703715, 1, 1, 1, 1, 1,
-1.173773, 0.4706165, -0.838022, 1, 1, 1, 1, 1,
-1.161033, -0.3153535, -0.8880526, 1, 1, 1, 1, 1,
-1.149683, 0.3062711, -0.8560789, 1, 1, 1, 1, 1,
-1.145587, -1.270402, -1.890296, 1, 1, 1, 1, 1,
-1.137709, 0.2271329, -4.503277, 1, 1, 1, 1, 1,
-1.136303, -0.6927902, -1.888746, 1, 1, 1, 1, 1,
-1.134905, 0.8921133, -0.1478281, 1, 1, 1, 1, 1,
-1.134606, 1.843208, 1.454342, 1, 1, 1, 1, 1,
-1.130139, -1.331168, -1.713379, 0, 0, 1, 1, 1,
-1.129084, 2.120626, -1.926532, 1, 0, 0, 1, 1,
-1.125751, 0.3730066, -1.433313, 1, 0, 0, 1, 1,
-1.124681, -2.62401, -2.965574, 1, 0, 0, 1, 1,
-1.124441, 1.039461, -1.059883, 1, 0, 0, 1, 1,
-1.112823, 0.7749458, -1.57007, 1, 0, 0, 1, 1,
-1.108112, -0.7549145, -1.882116, 0, 0, 0, 1, 1,
-1.099392, -2.324544, -1.887146, 0, 0, 0, 1, 1,
-1.096971, -0.748477, -2.139399, 0, 0, 0, 1, 1,
-1.0923, 0.1950722, 0.4288922, 0, 0, 0, 1, 1,
-1.089098, 0.7894276, -0.8239448, 0, 0, 0, 1, 1,
-1.072467, -1.772884, -2.715355, 0, 0, 0, 1, 1,
-1.068277, 1.222186, 0.1695839, 0, 0, 0, 1, 1,
-1.066314, 0.5960056, -0.9572393, 1, 1, 1, 1, 1,
-1.064597, 0.05529134, -1.112698, 1, 1, 1, 1, 1,
-1.064003, 0.4390465, -2.95641, 1, 1, 1, 1, 1,
-1.058315, 1.67872, -0.1685138, 1, 1, 1, 1, 1,
-1.048324, 0.107977, -3.893787, 1, 1, 1, 1, 1,
-1.046354, 1.000764, -2.049731, 1, 1, 1, 1, 1,
-1.046233, -1.593467, -2.175152, 1, 1, 1, 1, 1,
-1.044436, -0.385651, -2.032318, 1, 1, 1, 1, 1,
-1.042853, 0.05606469, -0.1481278, 1, 1, 1, 1, 1,
-1.040588, -0.7437798, -2.858472, 1, 1, 1, 1, 1,
-1.038047, -0.8699485, 0.91378, 1, 1, 1, 1, 1,
-1.036793, -0.9900421, -3.097774, 1, 1, 1, 1, 1,
-1.033351, 0.7060119, -1.099119, 1, 1, 1, 1, 1,
-1.03332, -0.7265753, -2.006079, 1, 1, 1, 1, 1,
-1.026578, -1.44044, -1.978312, 1, 1, 1, 1, 1,
-1.022735, 0.4975612, -1.726776, 0, 0, 1, 1, 1,
-1.018436, -0.6359245, -0.4938331, 1, 0, 0, 1, 1,
-1.018129, -1.425316, -1.679532, 1, 0, 0, 1, 1,
-1.00807, 0.657055, -0.2656514, 1, 0, 0, 1, 1,
-1.00577, 0.09909628, -1.189836, 1, 0, 0, 1, 1,
-1.005034, -1.029403, -0.5286868, 1, 0, 0, 1, 1,
-0.9916478, 0.4608757, 0.05394271, 0, 0, 0, 1, 1,
-0.9882295, 2.040062, 0.467901, 0, 0, 0, 1, 1,
-0.9859357, -1.41371, -2.437345, 0, 0, 0, 1, 1,
-0.9841561, 0.4613359, -1.814561, 0, 0, 0, 1, 1,
-0.981892, 0.9535114, -0.03406458, 0, 0, 0, 1, 1,
-0.9796242, -1.323977, -2.027928, 0, 0, 0, 1, 1,
-0.973678, -0.3939233, -2.095789, 0, 0, 0, 1, 1,
-0.9732941, -0.5734212, -2.527321, 1, 1, 1, 1, 1,
-0.9675528, 0.5830266, -2.273461, 1, 1, 1, 1, 1,
-0.9652864, -0.8068808, -2.496561, 1, 1, 1, 1, 1,
-0.9647432, -0.06888339, -2.792571, 1, 1, 1, 1, 1,
-0.9639428, -0.4705553, -1.634772, 1, 1, 1, 1, 1,
-0.9615526, 0.9379266, -2.011163, 1, 1, 1, 1, 1,
-0.9543, 2.52935, -1.00767, 1, 1, 1, 1, 1,
-0.946393, -0.9991416, -1.299335, 1, 1, 1, 1, 1,
-0.9386678, 0.5730143, -1.2411, 1, 1, 1, 1, 1,
-0.9316801, -0.009918723, -1.662586, 1, 1, 1, 1, 1,
-0.9239724, -0.2203896, 0.3242706, 1, 1, 1, 1, 1,
-0.9222263, -0.05410792, -0.673555, 1, 1, 1, 1, 1,
-0.9172459, 0.5115468, -0.8186324, 1, 1, 1, 1, 1,
-0.9157819, 0.3365664, -5.171323, 1, 1, 1, 1, 1,
-0.900255, 1.412868, -0.7707957, 1, 1, 1, 1, 1,
-0.8959603, 0.04792107, 0.2667482, 0, 0, 1, 1, 1,
-0.8933561, 0.6101193, -1.317215, 1, 0, 0, 1, 1,
-0.8911217, -1.117322, -1.562046, 1, 0, 0, 1, 1,
-0.8890603, 1.085488, -0.1161161, 1, 0, 0, 1, 1,
-0.8804639, 0.07671513, -3.019791, 1, 0, 0, 1, 1,
-0.8716836, 0.175954, -1.332034, 1, 0, 0, 1, 1,
-0.8696564, 0.5721561, -2.237301, 0, 0, 0, 1, 1,
-0.8614096, 1.738435, -1.016419, 0, 0, 0, 1, 1,
-0.8608221, -1.384969, -2.41555, 0, 0, 0, 1, 1,
-0.8591424, 1.488132, -0.9436371, 0, 0, 0, 1, 1,
-0.8589169, 1.575025, -1.509236, 0, 0, 0, 1, 1,
-0.8588317, -0.315718, -1.238483, 0, 0, 0, 1, 1,
-0.8584955, -0.5371317, 0.1208029, 0, 0, 0, 1, 1,
-0.8528519, 0.892598, -1.411954, 1, 1, 1, 1, 1,
-0.8455843, 0.7663195, -1.0551, 1, 1, 1, 1, 1,
-0.844277, -0.07477371, 0.060888, 1, 1, 1, 1, 1,
-0.8396211, -0.05353972, -2.353591, 1, 1, 1, 1, 1,
-0.8352197, 0.4103766, -1.420733, 1, 1, 1, 1, 1,
-0.8323783, 0.6922506, -2.64382, 1, 1, 1, 1, 1,
-0.8280244, 0.1783929, -0.9822329, 1, 1, 1, 1, 1,
-0.8274428, -2.146164, -3.730623, 1, 1, 1, 1, 1,
-0.823656, -1.905243, -3.243956, 1, 1, 1, 1, 1,
-0.813343, 0.424897, -0.9460973, 1, 1, 1, 1, 1,
-0.8127876, 1.186147, -0.2266347, 1, 1, 1, 1, 1,
-0.8111919, 0.4096608, -0.5929003, 1, 1, 1, 1, 1,
-0.808044, 1.138255, -1.149051, 1, 1, 1, 1, 1,
-0.8075258, -0.06684862, -0.5268607, 1, 1, 1, 1, 1,
-0.8069537, 0.3051115, -2.286702, 1, 1, 1, 1, 1,
-0.8033444, -0.1103794, -2.639367, 0, 0, 1, 1, 1,
-0.8022979, 1.075789, -1.327581, 1, 0, 0, 1, 1,
-0.7918855, -0.492267, -1.69733, 1, 0, 0, 1, 1,
-0.7912648, 1.834702, -1.302531, 1, 0, 0, 1, 1,
-0.7905235, -1.31144, -2.212909, 1, 0, 0, 1, 1,
-0.7902266, -2.164604, -1.892373, 1, 0, 0, 1, 1,
-0.7889512, 0.6665666, -1.991678, 0, 0, 0, 1, 1,
-0.7869173, 0.07915559, -1.706188, 0, 0, 0, 1, 1,
-0.7856935, 0.8772994, 0.0214837, 0, 0, 0, 1, 1,
-0.7830716, 0.408633, -0.3227919, 0, 0, 0, 1, 1,
-0.7731491, 0.1245842, -1.985199, 0, 0, 0, 1, 1,
-0.7726552, 2.053845, -0.8112785, 0, 0, 0, 1, 1,
-0.7708203, -1.167334, -2.363588, 0, 0, 0, 1, 1,
-0.7677119, -0.8112583, -2.1769, 1, 1, 1, 1, 1,
-0.7643226, 0.6930457, -1.273762, 1, 1, 1, 1, 1,
-0.7621905, 0.03034258, -2.246137, 1, 1, 1, 1, 1,
-0.7603122, -0.6582657, -2.577513, 1, 1, 1, 1, 1,
-0.7601478, 1.081295, 1.151335, 1, 1, 1, 1, 1,
-0.7545242, 0.6829054, -1.268332, 1, 1, 1, 1, 1,
-0.7448531, -0.9131054, -1.911033, 1, 1, 1, 1, 1,
-0.7425575, 0.3317082, -0.5185494, 1, 1, 1, 1, 1,
-0.7385398, 0.6794358, -0.5745552, 1, 1, 1, 1, 1,
-0.7340782, -0.1205118, -2.212523, 1, 1, 1, 1, 1,
-0.7326522, 0.03363851, -2.629641, 1, 1, 1, 1, 1,
-0.7316527, -0.6283674, -2.218343, 1, 1, 1, 1, 1,
-0.7249965, -0.8078678, -3.395138, 1, 1, 1, 1, 1,
-0.7246202, -0.1527886, -0.3286062, 1, 1, 1, 1, 1,
-0.7229031, -0.05454506, -2.244515, 1, 1, 1, 1, 1,
-0.7223858, 0.4691456, -0.03584139, 0, 0, 1, 1, 1,
-0.7172245, -1.511937, -1.442377, 1, 0, 0, 1, 1,
-0.7148681, 1.267688, -0.1593604, 1, 0, 0, 1, 1,
-0.7140287, 0.7325125, -1.103368, 1, 0, 0, 1, 1,
-0.713149, 2.098839, 1.767055, 1, 0, 0, 1, 1,
-0.7066528, -0.2715092, -3.051744, 1, 0, 0, 1, 1,
-0.7031217, -1.269178, -2.488589, 0, 0, 0, 1, 1,
-0.6996597, 0.8342854, 0.4453846, 0, 0, 0, 1, 1,
-0.6988032, -1.378365, -0.9485031, 0, 0, 0, 1, 1,
-0.6961408, 0.6524441, -1.996393, 0, 0, 0, 1, 1,
-0.6950229, -0.4359624, -3.446331, 0, 0, 0, 1, 1,
-0.6908554, -0.05961877, -3.277273, 0, 0, 0, 1, 1,
-0.6896049, 1.079126, -1.835188, 0, 0, 0, 1, 1,
-0.6866252, -1.083479, -1.07717, 1, 1, 1, 1, 1,
-0.686139, 1.169473, -0.05017838, 1, 1, 1, 1, 1,
-0.683293, -0.2462312, -0.4984511, 1, 1, 1, 1, 1,
-0.6750862, 1.356974, 1.257516, 1, 1, 1, 1, 1,
-0.6744495, 0.8183711, -2.810632, 1, 1, 1, 1, 1,
-0.6709846, 0.6809679, -2.990972, 1, 1, 1, 1, 1,
-0.6699924, 1.073353, -0.7421456, 1, 1, 1, 1, 1,
-0.6688073, 1.033576, -0.04675274, 1, 1, 1, 1, 1,
-0.6644214, 0.9892928, -1.7332, 1, 1, 1, 1, 1,
-0.6617075, 0.9248781, 0.3784948, 1, 1, 1, 1, 1,
-0.6606844, 1.116945, -0.9157357, 1, 1, 1, 1, 1,
-0.6602712, -1.137662, -1.335591, 1, 1, 1, 1, 1,
-0.6528991, -0.5949695, -2.947166, 1, 1, 1, 1, 1,
-0.6508616, 1.041004, -1.122469, 1, 1, 1, 1, 1,
-0.646484, -0.5341082, -1.538087, 1, 1, 1, 1, 1,
-0.6461084, 1.80349, 0.775399, 0, 0, 1, 1, 1,
-0.6431146, -0.309466, -2.632478, 1, 0, 0, 1, 1,
-0.6415172, 1.749926, 0.9102318, 1, 0, 0, 1, 1,
-0.6400101, 1.263742, 1.147438, 1, 0, 0, 1, 1,
-0.6392919, -0.1798457, -1.493626, 1, 0, 0, 1, 1,
-0.6332819, -0.793875, -0.5593808, 1, 0, 0, 1, 1,
-0.6283306, -0.331102, -2.415844, 0, 0, 0, 1, 1,
-0.6270161, -0.1871901, -1.479683, 0, 0, 0, 1, 1,
-0.6255195, -0.4409516, -3.432623, 0, 0, 0, 1, 1,
-0.6224197, 2.239216, -1.749675, 0, 0, 0, 1, 1,
-0.613405, -0.8140485, -3.141883, 0, 0, 0, 1, 1,
-0.6097103, -1.173488, -2.418095, 0, 0, 0, 1, 1,
-0.6068255, -0.1662888, -1.129112, 0, 0, 0, 1, 1,
-0.6062304, 0.1119239, -1.099579, 1, 1, 1, 1, 1,
-0.6029975, 1.164773, -1.673836, 1, 1, 1, 1, 1,
-0.5995018, 0.7745531, -1.157833, 1, 1, 1, 1, 1,
-0.5985242, 0.3187214, -0.7371452, 1, 1, 1, 1, 1,
-0.5961806, 0.8459921, 0.8328925, 1, 1, 1, 1, 1,
-0.5941383, -0.06644585, -2.811632, 1, 1, 1, 1, 1,
-0.5927436, 0.1474967, -2.313821, 1, 1, 1, 1, 1,
-0.582729, 0.5559159, -1.330525, 1, 1, 1, 1, 1,
-0.5758331, -0.5072597, -1.245819, 1, 1, 1, 1, 1,
-0.5737149, 0.897843, -1.382415, 1, 1, 1, 1, 1,
-0.5709682, -0.5026129, -3.310312, 1, 1, 1, 1, 1,
-0.5648302, 0.583469, -1.26174, 1, 1, 1, 1, 1,
-0.5591829, -0.5788561, -2.371845, 1, 1, 1, 1, 1,
-0.5557483, 0.9346246, 0.3869084, 1, 1, 1, 1, 1,
-0.5523967, 1.736446, -0.1975853, 1, 1, 1, 1, 1,
-0.5519365, 0.4465435, -0.5236335, 0, 0, 1, 1, 1,
-0.5480158, -0.009744344, -2.621025, 1, 0, 0, 1, 1,
-0.5467132, 2.86175, 2.073538, 1, 0, 0, 1, 1,
-0.5424084, 1.516082, 0.6097772, 1, 0, 0, 1, 1,
-0.5417692, -0.7236056, -4.331698, 1, 0, 0, 1, 1,
-0.5395432, -0.3330932, -0.5907386, 1, 0, 0, 1, 1,
-0.5372592, 0.7958599, 0.5090683, 0, 0, 0, 1, 1,
-0.5364313, -0.3819752, -1.909204, 0, 0, 0, 1, 1,
-0.5267845, -1.326298, -2.224645, 0, 0, 0, 1, 1,
-0.5261658, 0.8721553, -1.619846, 0, 0, 0, 1, 1,
-0.5165935, -0.6339682, -1.599968, 0, 0, 0, 1, 1,
-0.5059686, 0.912352, 0.0541721, 0, 0, 0, 1, 1,
-0.494915, -1.821008, -3.402454, 0, 0, 0, 1, 1,
-0.4940351, 0.06200384, -1.409576, 1, 1, 1, 1, 1,
-0.4870679, -1.122132, -2.924429, 1, 1, 1, 1, 1,
-0.4786741, -0.2283197, -1.696214, 1, 1, 1, 1, 1,
-0.4735762, 0.8057023, 0.9835331, 1, 1, 1, 1, 1,
-0.4705688, 0.05618029, -0.4415641, 1, 1, 1, 1, 1,
-0.4687782, 0.1655285, -1.346626, 1, 1, 1, 1, 1,
-0.4676799, 0.9228647, 0.7825562, 1, 1, 1, 1, 1,
-0.4619946, -1.670137, -1.187184, 1, 1, 1, 1, 1,
-0.4588337, 1.352774, -0.7628586, 1, 1, 1, 1, 1,
-0.4585622, -0.3104998, -1.775284, 1, 1, 1, 1, 1,
-0.4533756, 0.3494173, -0.2852251, 1, 1, 1, 1, 1,
-0.4517049, -0.5506166, -2.737489, 1, 1, 1, 1, 1,
-0.4474105, 0.3115426, -1.298872, 1, 1, 1, 1, 1,
-0.4418487, 0.5093474, -0.6455655, 1, 1, 1, 1, 1,
-0.4388131, 0.1698505, -1.302171, 1, 1, 1, 1, 1,
-0.4385067, -0.7369308, -2.659435, 0, 0, 1, 1, 1,
-0.4340995, 2.284857, 0.2602763, 1, 0, 0, 1, 1,
-0.4329931, -0.4383095, -2.917066, 1, 0, 0, 1, 1,
-0.4313087, -0.6595602, -0.8763446, 1, 0, 0, 1, 1,
-0.4299137, 1.029995, 1.043787, 1, 0, 0, 1, 1,
-0.4290097, 0.05364023, -2.903682, 1, 0, 0, 1, 1,
-0.4287242, -0.06183102, -0.4959337, 0, 0, 0, 1, 1,
-0.4274742, 0.01093297, -0.7066674, 0, 0, 0, 1, 1,
-0.4247893, -2.390727, -2.521939, 0, 0, 0, 1, 1,
-0.4198658, -1.889504, -3.589334, 0, 0, 0, 1, 1,
-0.4174279, 0.562398, 0.3113277, 0, 0, 0, 1, 1,
-0.4167144, -0.3147888, -3.141913, 0, 0, 0, 1, 1,
-0.4164177, 0.252187, 0.1880375, 0, 0, 0, 1, 1,
-0.4130164, -0.2787385, -2.626374, 1, 1, 1, 1, 1,
-0.4127837, -0.3391513, -3.782514, 1, 1, 1, 1, 1,
-0.4114677, -1.423932, -2.958935, 1, 1, 1, 1, 1,
-0.4111586, 0.5381017, -0.4998021, 1, 1, 1, 1, 1,
-0.4097838, 0.7902355, 0.756487, 1, 1, 1, 1, 1,
-0.4097342, -0.5525722, -2.274984, 1, 1, 1, 1, 1,
-0.4087011, -0.5115762, -2.511793, 1, 1, 1, 1, 1,
-0.4080289, 0.331934, -0.1950729, 1, 1, 1, 1, 1,
-0.4068642, 2.868991, 0.6500979, 1, 1, 1, 1, 1,
-0.4048867, -1.721877, -2.009145, 1, 1, 1, 1, 1,
-0.4033491, -0.9386282, -1.878716, 1, 1, 1, 1, 1,
-0.3994918, -2.255602, -5.475328, 1, 1, 1, 1, 1,
-0.3951633, -0.07967483, -1.586858, 1, 1, 1, 1, 1,
-0.3920875, -0.6707482, -2.631075, 1, 1, 1, 1, 1,
-0.3871932, 0.5435175, -0.4065048, 1, 1, 1, 1, 1,
-0.3864078, -1.734557, -2.953295, 0, 0, 1, 1, 1,
-0.3836766, -1.556007, -3.418663, 1, 0, 0, 1, 1,
-0.3836654, 1.5126, 1.025316, 1, 0, 0, 1, 1,
-0.3833953, -0.0659653, -1.904721, 1, 0, 0, 1, 1,
-0.3814787, 0.6892825, -0.8273077, 1, 0, 0, 1, 1,
-0.3807197, -1.092503, -3.466166, 1, 0, 0, 1, 1,
-0.3788513, -0.3657187, -1.85031, 0, 0, 0, 1, 1,
-0.3777943, -1.298446, -1.295661, 0, 0, 0, 1, 1,
-0.3777464, -0.08828568, -2.531365, 0, 0, 0, 1, 1,
-0.3767323, 0.246388, -1.853688, 0, 0, 0, 1, 1,
-0.3758751, -0.03855841, -1.550185, 0, 0, 0, 1, 1,
-0.3689753, -1.071743, -0.9231791, 0, 0, 0, 1, 1,
-0.3679712, 1.646105, -0.6308161, 0, 0, 0, 1, 1,
-0.3659758, 0.277768, -2.232887, 1, 1, 1, 1, 1,
-0.3654689, -1.647429, -2.441792, 1, 1, 1, 1, 1,
-0.3641522, -1.414336, -3.333915, 1, 1, 1, 1, 1,
-0.3631603, -0.3370423, -2.417088, 1, 1, 1, 1, 1,
-0.3626035, -1.930464, -4.318739, 1, 1, 1, 1, 1,
-0.3622539, -0.09523072, -1.984042, 1, 1, 1, 1, 1,
-0.354651, -0.5270194, -2.785786, 1, 1, 1, 1, 1,
-0.3528972, 1.563896, 1.141741, 1, 1, 1, 1, 1,
-0.3511024, -0.03745713, -2.060771, 1, 1, 1, 1, 1,
-0.3503679, -0.73053, -1.644715, 1, 1, 1, 1, 1,
-0.3474206, -0.2377374, -2.86754, 1, 1, 1, 1, 1,
-0.3471034, -0.5288531, -1.863257, 1, 1, 1, 1, 1,
-0.3381037, -1.147483, -2.586092, 1, 1, 1, 1, 1,
-0.3350873, -1.338809, -4.251798, 1, 1, 1, 1, 1,
-0.3329431, 0.1457356, 0.03072382, 1, 1, 1, 1, 1,
-0.3296852, -1.587746, -4.609855, 0, 0, 1, 1, 1,
-0.3253552, -0.624099, -3.17347, 1, 0, 0, 1, 1,
-0.3182, 0.2191983, -2.075974, 1, 0, 0, 1, 1,
-0.3174139, 0.3826545, 0.4851768, 1, 0, 0, 1, 1,
-0.316755, -0.6246849, -4.439785, 1, 0, 0, 1, 1,
-0.3145711, 1.107339, 0.2590086, 1, 0, 0, 1, 1,
-0.3143949, -0.2515104, -1.43064, 0, 0, 0, 1, 1,
-0.3053019, 0.3511361, -0.5355006, 0, 0, 0, 1, 1,
-0.3045022, -0.2947669, -1.613896, 0, 0, 0, 1, 1,
-0.2867289, -1.062262, -2.863696, 0, 0, 0, 1, 1,
-0.2820081, -0.7170885, -3.997484, 0, 0, 0, 1, 1,
-0.2801303, 1.638694, -1.465922, 0, 0, 0, 1, 1,
-0.279501, 1.436326, -0.1373398, 0, 0, 0, 1, 1,
-0.2765976, -0.2103976, -1.856237, 1, 1, 1, 1, 1,
-0.2734025, 0.7343873, -0.2912578, 1, 1, 1, 1, 1,
-0.2659459, -2.299709, -3.821936, 1, 1, 1, 1, 1,
-0.262685, -0.2002465, -1.161823, 1, 1, 1, 1, 1,
-0.2625599, -2.000911, -4.015456, 1, 1, 1, 1, 1,
-0.2573034, 0.3462274, -1.576429, 1, 1, 1, 1, 1,
-0.2538461, 0.6424487, -0.5244685, 1, 1, 1, 1, 1,
-0.2532553, -1.498417, -3.596555, 1, 1, 1, 1, 1,
-0.2507763, 2.124543, 1.576174, 1, 1, 1, 1, 1,
-0.24901, -0.7646165, -2.935299, 1, 1, 1, 1, 1,
-0.2466753, -0.7455279, -2.478819, 1, 1, 1, 1, 1,
-0.2455602, 0.9283089, 0.6288155, 1, 1, 1, 1, 1,
-0.244969, -0.1429661, -0.4175003, 1, 1, 1, 1, 1,
-0.2414231, -0.9279888, -2.485348, 1, 1, 1, 1, 1,
-0.2353667, -1.112429, -2.656728, 1, 1, 1, 1, 1,
-0.2345285, 0.5084142, -0.4222571, 0, 0, 1, 1, 1,
-0.2330333, 0.2826776, -0.9417362, 1, 0, 0, 1, 1,
-0.2327047, -1.116507, -2.537128, 1, 0, 0, 1, 1,
-0.2303208, -0.6046909, -2.660736, 1, 0, 0, 1, 1,
-0.2287762, 0.1819582, -0.7677042, 1, 0, 0, 1, 1,
-0.2285682, -0.9367397, -1.600092, 1, 0, 0, 1, 1,
-0.2213643, -0.7904923, -4.136066, 0, 0, 0, 1, 1,
-0.2178787, 0.6480222, -1.450846, 0, 0, 0, 1, 1,
-0.2173817, 0.03047485, -2.267676, 0, 0, 0, 1, 1,
-0.2153985, -0.5961565, -2.146326, 0, 0, 0, 1, 1,
-0.213269, -0.2519874, -3.625562, 0, 0, 0, 1, 1,
-0.2108304, -1.952279, -4.073037, 0, 0, 0, 1, 1,
-0.2087093, -0.6559213, -3.302242, 0, 0, 0, 1, 1,
-0.2061429, 1.592553, 1.191886, 1, 1, 1, 1, 1,
-0.2051604, -0.4052254, -3.646551, 1, 1, 1, 1, 1,
-0.2049024, -0.6700715, -1.307347, 1, 1, 1, 1, 1,
-0.2046884, 1.64246, 0.7922987, 1, 1, 1, 1, 1,
-0.2004626, 0.5184781, -1.447875, 1, 1, 1, 1, 1,
-0.1971, -0.510258, -2.137092, 1, 1, 1, 1, 1,
-0.1918027, 1.335777, -0.8699223, 1, 1, 1, 1, 1,
-0.1911654, 0.9217684, 0.02323827, 1, 1, 1, 1, 1,
-0.1899854, -0.8998604, -2.431733, 1, 1, 1, 1, 1,
-0.1854243, -0.8082027, -3.557456, 1, 1, 1, 1, 1,
-0.1847588, 0.7574092, -0.06775686, 1, 1, 1, 1, 1,
-0.1843048, 0.6811149, 0.1242677, 1, 1, 1, 1, 1,
-0.1838685, -0.2075256, -3.031016, 1, 1, 1, 1, 1,
-0.1836179, -0.2049794, 0.004604766, 1, 1, 1, 1, 1,
-0.1817577, -0.6179113, -3.087619, 1, 1, 1, 1, 1,
-0.1792407, 1.379048, -0.5665711, 0, 0, 1, 1, 1,
-0.1785482, -0.7954401, -3.808743, 1, 0, 0, 1, 1,
-0.1779055, -0.201267, -0.7094947, 1, 0, 0, 1, 1,
-0.1777398, 0.01702463, -1.068691, 1, 0, 0, 1, 1,
-0.1735504, -0.9631672, -1.487968, 1, 0, 0, 1, 1,
-0.1701893, 0.772699, 0.0454954, 1, 0, 0, 1, 1,
-0.1688771, 0.6318755, 2.191059, 0, 0, 0, 1, 1,
-0.1681755, 0.9698154, 1.620599, 0, 0, 0, 1, 1,
-0.1679021, 0.4843306, -0.1641853, 0, 0, 0, 1, 1,
-0.1677813, 0.4697592, -0.449975, 0, 0, 0, 1, 1,
-0.1646975, 2.080956, 1.173169, 0, 0, 0, 1, 1,
-0.1590799, -0.2126488, -0.5937983, 0, 0, 0, 1, 1,
-0.1538191, 1.449798, -0.8280513, 0, 0, 0, 1, 1,
-0.1517728, 0.5995533, -0.8079723, 1, 1, 1, 1, 1,
-0.1516005, -0.5971115, -3.723521, 1, 1, 1, 1, 1,
-0.1509451, -0.3668114, -2.646579, 1, 1, 1, 1, 1,
-0.1479028, -0.1187663, -2.45631, 1, 1, 1, 1, 1,
-0.1448978, 0.640503, -1.611782, 1, 1, 1, 1, 1,
-0.1445238, -0.8514171, -2.815902, 1, 1, 1, 1, 1,
-0.1424884, 1.262088, -0.8531057, 1, 1, 1, 1, 1,
-0.1422571, -1.289792, -4.076601, 1, 1, 1, 1, 1,
-0.1413358, 1.577047, 0.4989114, 1, 1, 1, 1, 1,
-0.1399098, 0.7286841, -0.8151788, 1, 1, 1, 1, 1,
-0.1349791, 0.0438734, 0.245487, 1, 1, 1, 1, 1,
-0.1320077, 0.08274768, -0.9235334, 1, 1, 1, 1, 1,
-0.129315, -1.789888, -5.0752, 1, 1, 1, 1, 1,
-0.1290243, -0.7695674, -3.343863, 1, 1, 1, 1, 1,
-0.1253809, -1.599796, -3.290461, 1, 1, 1, 1, 1,
-0.1219452, 0.632411, -1.167979, 0, 0, 1, 1, 1,
-0.1155151, 0.6279821, -0.2456769, 1, 0, 0, 1, 1,
-0.1137998, 0.7328715, -0.5931367, 1, 0, 0, 1, 1,
-0.1134657, -0.2576362, -1.785096, 1, 0, 0, 1, 1,
-0.1112495, 0.9839327, -0.9538746, 1, 0, 0, 1, 1,
-0.1079187, -0.2249455, -2.109051, 1, 0, 0, 1, 1,
-0.1051222, -0.0009498601, -2.04753, 0, 0, 0, 1, 1,
-0.1043498, 2.580515, -0.2490044, 0, 0, 0, 1, 1,
-0.1036792, -1.475143, -4.850426, 0, 0, 0, 1, 1,
-0.1027258, 1.713939, -0.1514421, 0, 0, 0, 1, 1,
-0.1026811, -1.745787, -1.860388, 0, 0, 0, 1, 1,
-0.1010903, 0.445276, -0.05950253, 0, 0, 0, 1, 1,
-0.1002716, -0.5349419, -1.776835, 0, 0, 0, 1, 1,
-0.09992082, -1.843339, -3.891165, 1, 1, 1, 1, 1,
-0.09765139, -0.5887151, -2.391755, 1, 1, 1, 1, 1,
-0.09110357, 2.327784, 0.9623274, 1, 1, 1, 1, 1,
-0.09046034, -1.769833, -2.125037, 1, 1, 1, 1, 1,
-0.09044347, 0.5079731, 0.9232841, 1, 1, 1, 1, 1,
-0.09036112, -0.4423881, -2.680528, 1, 1, 1, 1, 1,
-0.08958897, 0.7215241, -2.129047, 1, 1, 1, 1, 1,
-0.08687679, 0.1515874, -1.881221, 1, 1, 1, 1, 1,
-0.08506452, 0.9094974, -0.2967467, 1, 1, 1, 1, 1,
-0.08273865, -0.6488111, -4.488019, 1, 1, 1, 1, 1,
-0.08055063, 0.1443181, 0.2197579, 1, 1, 1, 1, 1,
-0.080374, -1.309658, -2.55417, 1, 1, 1, 1, 1,
-0.0799325, -0.4785144, -3.678666, 1, 1, 1, 1, 1,
-0.07839116, 1.368171, -0.4793171, 1, 1, 1, 1, 1,
-0.07319364, 0.2115002, 0.2194693, 1, 1, 1, 1, 1,
-0.07248398, 0.0302561, -2.231474, 0, 0, 1, 1, 1,
-0.0697005, -1.787081, -3.511612, 1, 0, 0, 1, 1,
-0.06572011, -1.010267, -1.663964, 1, 0, 0, 1, 1,
-0.062358, -0.05486466, -3.853474, 1, 0, 0, 1, 1,
-0.05988218, -0.5026408, -3.644917, 1, 0, 0, 1, 1,
-0.05987543, -1.352489, -3.439879, 1, 0, 0, 1, 1,
-0.05931298, 1.367234, 1.694939, 0, 0, 0, 1, 1,
-0.0539558, -1.78251, -5.340342, 0, 0, 0, 1, 1,
-0.05040137, -0.6078528, -2.290883, 0, 0, 0, 1, 1,
-0.04969381, 0.6658521, 0.8345784, 0, 0, 0, 1, 1,
-0.04868942, -0.1129041, -2.752036, 0, 0, 0, 1, 1,
-0.04856888, 0.4390662, 0.2203671, 0, 0, 0, 1, 1,
-0.04678962, 0.01051182, -3.85588, 0, 0, 0, 1, 1,
-0.04266014, -0.2949902, -3.397337, 1, 1, 1, 1, 1,
-0.03958883, -1.432392, -2.609682, 1, 1, 1, 1, 1,
-0.03938439, -0.7103363, -4.475496, 1, 1, 1, 1, 1,
-0.03461508, 0.7978287, 0.7856855, 1, 1, 1, 1, 1,
-0.03121467, -0.2261521, -2.801928, 1, 1, 1, 1, 1,
-0.03086758, 0.06073206, -1.544063, 1, 1, 1, 1, 1,
-0.03006906, 1.213511, 0.2821686, 1, 1, 1, 1, 1,
-0.02687874, -1.042611, -3.955553, 1, 1, 1, 1, 1,
-0.02574359, 1.466304, 1.444426, 1, 1, 1, 1, 1,
-0.02049529, -0.3552265, -3.654999, 1, 1, 1, 1, 1,
-0.01955495, -0.01174282, -2.19013, 1, 1, 1, 1, 1,
-0.01930902, 0.2094007, -0.6980975, 1, 1, 1, 1, 1,
-0.01812519, 1.78496, 0.7896624, 1, 1, 1, 1, 1,
-0.01712647, 1.273176, 1.768512, 1, 1, 1, 1, 1,
-0.01601822, 1.12197, -0.1378066, 1, 1, 1, 1, 1,
-0.01459305, 2.570642, 0.5373933, 0, 0, 1, 1, 1,
-0.01422401, -0.0828035, -1.363022, 1, 0, 0, 1, 1,
-0.0109417, 1.042664, -0.5196828, 1, 0, 0, 1, 1,
-0.008590695, -0.2363444, -2.286011, 1, 0, 0, 1, 1,
-0.006016518, 0.2767113, 0.07279495, 1, 0, 0, 1, 1,
0.002753898, 0.8281422, 0.792614, 1, 0, 0, 1, 1,
0.003184068, 0.6212916, -1.590688, 0, 0, 0, 1, 1,
0.006516399, 0.3852776, -0.4204183, 0, 0, 0, 1, 1,
0.009183233, 1.579261, -1.30051, 0, 0, 0, 1, 1,
0.01198456, 2.040246, 0.6578608, 0, 0, 0, 1, 1,
0.01392019, -2.228651, 1.16902, 0, 0, 0, 1, 1,
0.01520313, -2.65603, 3.150643, 0, 0, 0, 1, 1,
0.01723357, -0.08168548, 4.883991, 0, 0, 0, 1, 1,
0.02241427, -0.8235798, 5.104223, 1, 1, 1, 1, 1,
0.02371324, 0.02527179, 1.542489, 1, 1, 1, 1, 1,
0.02449352, 2.105628, -0.87074, 1, 1, 1, 1, 1,
0.02740796, -0.8049469, 1.860936, 1, 1, 1, 1, 1,
0.02808635, 0.3104323, 0.9463897, 1, 1, 1, 1, 1,
0.0286293, -0.7927014, 3.850618, 1, 1, 1, 1, 1,
0.029893, -2.037036, 2.194055, 1, 1, 1, 1, 1,
0.03234276, 0.8271403, -1.573717, 1, 1, 1, 1, 1,
0.03243514, 1.161273, -0.04342965, 1, 1, 1, 1, 1,
0.0342812, -0.9659945, 3.370117, 1, 1, 1, 1, 1,
0.03467592, -0.2753246, 2.720781, 1, 1, 1, 1, 1,
0.03520299, 0.1570236, 1.177983, 1, 1, 1, 1, 1,
0.03558797, 0.07316661, 0.558427, 1, 1, 1, 1, 1,
0.04009876, -1.751249, 4.851372, 1, 1, 1, 1, 1,
0.04062573, 0.06473052, 0.5916571, 1, 1, 1, 1, 1,
0.04271842, -1.758477, 0.9988158, 0, 0, 1, 1, 1,
0.04869822, 0.5762042, 0.8307107, 1, 0, 0, 1, 1,
0.04881889, -1.307035, 3.835897, 1, 0, 0, 1, 1,
0.04913326, -1.086835, 2.614635, 1, 0, 0, 1, 1,
0.04945076, 0.520312, -0.7785699, 1, 0, 0, 1, 1,
0.05119501, -0.7355134, 3.483232, 1, 0, 0, 1, 1,
0.0538763, 1.468474, 1.607827, 0, 0, 0, 1, 1,
0.05782453, -1.497789, 3.671637, 0, 0, 0, 1, 1,
0.05853762, -1.492707, 2.476588, 0, 0, 0, 1, 1,
0.06804592, 1.520416, -1.061678, 0, 0, 0, 1, 1,
0.07009555, -0.06809141, 2.558774, 0, 0, 0, 1, 1,
0.07590453, 0.3368942, 2.081269, 0, 0, 0, 1, 1,
0.07785235, 1.083284, -0.4423182, 0, 0, 0, 1, 1,
0.08732881, 0.1641194, -0.6558617, 1, 1, 1, 1, 1,
0.08829473, 0.6733034, 1.205651, 1, 1, 1, 1, 1,
0.08831049, -0.9666911, 3.71732, 1, 1, 1, 1, 1,
0.08832914, -0.9930295, 1.495729, 1, 1, 1, 1, 1,
0.0888379, -0.09613596, 3.998776, 1, 1, 1, 1, 1,
0.0913408, 3.108567, -0.3743649, 1, 1, 1, 1, 1,
0.09309772, 0.01870854, 1.580382, 1, 1, 1, 1, 1,
0.09415974, 1.063798, -0.3583947, 1, 1, 1, 1, 1,
0.09509669, -2.263996, 2.301114, 1, 1, 1, 1, 1,
0.09932516, -1.603069, 4.160533, 1, 1, 1, 1, 1,
0.1014971, 0.4025474, -0.002051225, 1, 1, 1, 1, 1,
0.1124761, -0.3622855, 2.284836, 1, 1, 1, 1, 1,
0.1147031, 1.006124, 0.2575781, 1, 1, 1, 1, 1,
0.1169124, -0.5513187, 2.541203, 1, 1, 1, 1, 1,
0.1179143, -0.09970346, 3.56017, 1, 1, 1, 1, 1,
0.1227328, 0.914636, -0.5706533, 0, 0, 1, 1, 1,
0.1292291, 1.516747, -0.5951357, 1, 0, 0, 1, 1,
0.1313416, -0.7795228, 5.513513, 1, 0, 0, 1, 1,
0.1335215, -1.625263, 4.292767, 1, 0, 0, 1, 1,
0.1373366, -1.271123, 3.681069, 1, 0, 0, 1, 1,
0.1398775, -1.183259, 2.605475, 1, 0, 0, 1, 1,
0.1427434, -0.9581631, 2.912377, 0, 0, 0, 1, 1,
0.1444192, -0.7387096, 2.494279, 0, 0, 0, 1, 1,
0.1451311, -0.8317521, 2.930499, 0, 0, 0, 1, 1,
0.1502875, 0.8980842, -0.9122205, 0, 0, 0, 1, 1,
0.1506889, -0.6359915, 4.772569, 0, 0, 0, 1, 1,
0.1524899, 0.6209919, -1.625103, 0, 0, 0, 1, 1,
0.1535918, -0.7057182, 3.52988, 0, 0, 0, 1, 1,
0.1597647, -0.7943212, 2.953879, 1, 1, 1, 1, 1,
0.1603982, 2.098488, 0.5229867, 1, 1, 1, 1, 1,
0.1617307, -0.8457724, 3.505111, 1, 1, 1, 1, 1,
0.1683279, -1.435675, 4.775601, 1, 1, 1, 1, 1,
0.1686081, 1.230024, 1.149492, 1, 1, 1, 1, 1,
0.1701576, 1.313098, 1.161765, 1, 1, 1, 1, 1,
0.1715253, -0.5355992, 3.106208, 1, 1, 1, 1, 1,
0.1736891, -0.2279924, 2.253021, 1, 1, 1, 1, 1,
0.1769017, -0.8814219, 2.684128, 1, 1, 1, 1, 1,
0.1861789, 0.1209629, 0.9644855, 1, 1, 1, 1, 1,
0.1882972, 1.293038, -0.7509588, 1, 1, 1, 1, 1,
0.1918531, -1.263928, 2.437956, 1, 1, 1, 1, 1,
0.1948723, 0.5849477, 1.067688, 1, 1, 1, 1, 1,
0.1981866, 0.8035094, -0.7249528, 1, 1, 1, 1, 1,
0.1992338, -1.080712, 2.70015, 1, 1, 1, 1, 1,
0.2060489, 0.2889097, -0.3701946, 0, 0, 1, 1, 1,
0.206124, 0.4650336, -0.5889407, 1, 0, 0, 1, 1,
0.2065071, -0.1738368, 1.531483, 1, 0, 0, 1, 1,
0.2084956, 0.08233609, 1.626729, 1, 0, 0, 1, 1,
0.2116565, 0.5033838, 2.308224, 1, 0, 0, 1, 1,
0.2161599, -1.544901, 3.646719, 1, 0, 0, 1, 1,
0.2171282, 0.6869608, -1.244928, 0, 0, 0, 1, 1,
0.221415, -0.8112665, 4.148499, 0, 0, 0, 1, 1,
0.2234572, -0.04171131, 1.018421, 0, 0, 0, 1, 1,
0.2249299, 2.038141, -0.1340897, 0, 0, 0, 1, 1,
0.2253359, 1.169605, 1.511338, 0, 0, 0, 1, 1,
0.2253871, 1.347106, -0.2424192, 0, 0, 0, 1, 1,
0.2284314, -1.632849, 3.909002, 0, 0, 0, 1, 1,
0.2301193, -1.455326, 2.93049, 1, 1, 1, 1, 1,
0.2304381, 0.8938598, 0.6271335, 1, 1, 1, 1, 1,
0.2325183, -1.797883, 2.256172, 1, 1, 1, 1, 1,
0.2334103, -2.287141, 2.495168, 1, 1, 1, 1, 1,
0.2337011, -0.4489644, 2.654716, 1, 1, 1, 1, 1,
0.2373657, -0.3905593, 0.8983608, 1, 1, 1, 1, 1,
0.2375975, -0.5469515, 4.699122, 1, 1, 1, 1, 1,
0.2377637, -1.157595, 3.443032, 1, 1, 1, 1, 1,
0.2399563, -1.593633, 1.89008, 1, 1, 1, 1, 1,
0.2499101, -1.035217, 0.8646186, 1, 1, 1, 1, 1,
0.2525153, -0.4063813, 1.775603, 1, 1, 1, 1, 1,
0.2598372, 0.3374333, 0.8168598, 1, 1, 1, 1, 1,
0.2634767, 0.9874035, 0.2584741, 1, 1, 1, 1, 1,
0.2654439, 0.04918882, 1.625459, 1, 1, 1, 1, 1,
0.2682867, 0.3648381, 0.6575803, 1, 1, 1, 1, 1,
0.2717393, -1.345876, 3.459982, 0, 0, 1, 1, 1,
0.2790816, 1.821245, 0.08615007, 1, 0, 0, 1, 1,
0.2841639, -0.61198, 3.44396, 1, 0, 0, 1, 1,
0.284185, -0.8208719, 1.901298, 1, 0, 0, 1, 1,
0.2867038, 0.1946985, 1.301696, 1, 0, 0, 1, 1,
0.2867921, -0.3008132, 2.181576, 1, 0, 0, 1, 1,
0.2921068, 1.340012, -0.451028, 0, 0, 0, 1, 1,
0.2927581, -0.2009436, 2.178774, 0, 0, 0, 1, 1,
0.2951056, -1.08213, 3.252525, 0, 0, 0, 1, 1,
0.2987348, 0.3438796, 1.779156, 0, 0, 0, 1, 1,
0.3015042, -0.03410486, 2.069888, 0, 0, 0, 1, 1,
0.3027399, 0.4564575, -1.375551, 0, 0, 0, 1, 1,
0.3062274, -0.9672163, 2.652376, 0, 0, 0, 1, 1,
0.3125226, -0.6249418, 1.061182, 1, 1, 1, 1, 1,
0.3131593, 1.815559, -0.07839637, 1, 1, 1, 1, 1,
0.3140785, -0.5881732, 2.008966, 1, 1, 1, 1, 1,
0.3145565, -0.7598788, 4.672784, 1, 1, 1, 1, 1,
0.3169569, 1.6823, -1.498691, 1, 1, 1, 1, 1,
0.3178852, 0.8218626, -0.1407921, 1, 1, 1, 1, 1,
0.3180077, -1.468834, 2.448944, 1, 1, 1, 1, 1,
0.3215415, -0.005621899, 1.607265, 1, 1, 1, 1, 1,
0.3229754, -1.107041, 2.703417, 1, 1, 1, 1, 1,
0.3260038, 0.8840892, -1.246424, 1, 1, 1, 1, 1,
0.3318059, -0.6471244, 1.877862, 1, 1, 1, 1, 1,
0.3346098, -0.09987187, -0.3765888, 1, 1, 1, 1, 1,
0.3349924, -0.2515093, 3.411706, 1, 1, 1, 1, 1,
0.3367113, -0.2348475, 0.3367779, 1, 1, 1, 1, 1,
0.337233, 0.1770419, 1.812647, 1, 1, 1, 1, 1,
0.3384519, 0.6916659, 0.05243627, 0, 0, 1, 1, 1,
0.3389925, -2.028546, 3.345628, 1, 0, 0, 1, 1,
0.3437796, -0.3654078, 2.265395, 1, 0, 0, 1, 1,
0.3444567, -0.3235708, 3.371763, 1, 0, 0, 1, 1,
0.3510211, -0.9216781, 3.213566, 1, 0, 0, 1, 1,
0.3511519, 1.541813, 0.7209137, 1, 0, 0, 1, 1,
0.3519185, -1.800745, 3.721139, 0, 0, 0, 1, 1,
0.3537445, -0.8051823, 3.999452, 0, 0, 0, 1, 1,
0.3558222, 1.03084, 0.03586642, 0, 0, 0, 1, 1,
0.3561202, -0.2163483, 2.103725, 0, 0, 0, 1, 1,
0.3573331, -1.35271, 2.066939, 0, 0, 0, 1, 1,
0.3627336, -1.036933, 3.712221, 0, 0, 0, 1, 1,
0.3659061, 1.311896, 0.2969918, 0, 0, 0, 1, 1,
0.3671192, 1.21194, -0.1837998, 1, 1, 1, 1, 1,
0.3678602, 1.715934, 0.7807009, 1, 1, 1, 1, 1,
0.3686868, -2.96821, 1.951428, 1, 1, 1, 1, 1,
0.3743377, -0.5754293, 3.205669, 1, 1, 1, 1, 1,
0.3834802, -0.5171368, 2.918691, 1, 1, 1, 1, 1,
0.3900285, -1.072116, 2.15709, 1, 1, 1, 1, 1,
0.3927639, 0.5148178, -0.5873123, 1, 1, 1, 1, 1,
0.4013165, 0.9031914, 2.034127, 1, 1, 1, 1, 1,
0.4091389, 0.6386197, 1.277065, 1, 1, 1, 1, 1,
0.4098248, 1.552929, 0.7923292, 1, 1, 1, 1, 1,
0.4143543, 1.09236, 2.728679, 1, 1, 1, 1, 1,
0.4160736, -2.811779, 4.811327, 1, 1, 1, 1, 1,
0.4162115, 0.4563769, 2.521084, 1, 1, 1, 1, 1,
0.4209507, 0.3362535, 0.2791192, 1, 1, 1, 1, 1,
0.4215302, 0.6279078, 0.9477997, 1, 1, 1, 1, 1,
0.4305949, 0.8413717, 0.5523111, 0, 0, 1, 1, 1,
0.4314938, -0.1748203, 1.649343, 1, 0, 0, 1, 1,
0.434739, -1.267758, 1.901338, 1, 0, 0, 1, 1,
0.4370067, -0.1041745, 3.615924, 1, 0, 0, 1, 1,
0.4376314, 1.77317, 0.8255397, 1, 0, 0, 1, 1,
0.4383044, -1.093299, -0.1003796, 1, 0, 0, 1, 1,
0.4394115, 1.206289, -0.3209986, 0, 0, 0, 1, 1,
0.440645, -0.9589481, 1.955595, 0, 0, 0, 1, 1,
0.4410992, 0.3389301, 1.387768, 0, 0, 0, 1, 1,
0.4414046, 1.052292, 0.2800804, 0, 0, 0, 1, 1,
0.4416471, 1.103033, 0.4906841, 0, 0, 0, 1, 1,
0.4486081, 0.02674554, 1.216281, 0, 0, 0, 1, 1,
0.4488038, 1.472986, 0.3233107, 0, 0, 0, 1, 1,
0.4523723, -3.844668, 4.271784, 1, 1, 1, 1, 1,
0.4567765, 0.581383, -0.2096249, 1, 1, 1, 1, 1,
0.4571502, 0.8137684, -0.161403, 1, 1, 1, 1, 1,
0.4655828, -0.2408315, 3.093336, 1, 1, 1, 1, 1,
0.4678113, -0.7013832, 3.822297, 1, 1, 1, 1, 1,
0.4701775, -0.1666778, 1.862862, 1, 1, 1, 1, 1,
0.4724525, 0.5983464, 1.591728, 1, 1, 1, 1, 1,
0.4759634, 1.015559, 0.3850243, 1, 1, 1, 1, 1,
0.4816476, -0.6513562, 1.864635, 1, 1, 1, 1, 1,
0.4899183, -1.428171, 2.111933, 1, 1, 1, 1, 1,
0.490007, 0.7444636, 1.476887, 1, 1, 1, 1, 1,
0.4996256, 0.590602, 1.968741, 1, 1, 1, 1, 1,
0.5026051, 0.1535316, 0.6817898, 1, 1, 1, 1, 1,
0.5077737, -0.5849009, 3.175891, 1, 1, 1, 1, 1,
0.5119289, 0.3170362, 0.5798162, 1, 1, 1, 1, 1,
0.5126028, -0.9557682, 3.740271, 0, 0, 1, 1, 1,
0.5137301, -0.07982592, -0.06482659, 1, 0, 0, 1, 1,
0.5218828, 0.8635834, 0.5795748, 1, 0, 0, 1, 1,
0.5230419, -0.2319172, 1.573557, 1, 0, 0, 1, 1,
0.525827, -0.6059284, 3.344524, 1, 0, 0, 1, 1,
0.5315997, 1.745991, 0.4311912, 1, 0, 0, 1, 1,
0.5345193, 0.423758, 0.9530994, 0, 0, 0, 1, 1,
0.5353051, 1.863564, -0.4360185, 0, 0, 0, 1, 1,
0.5439599, 1.94005, 0.9215134, 0, 0, 0, 1, 1,
0.5488077, 0.3817635, 2.149045, 0, 0, 0, 1, 1,
0.5506848, 1.945247, -0.5824849, 0, 0, 0, 1, 1,
0.5508993, -0.1994206, 2.356956, 0, 0, 0, 1, 1,
0.5519411, -0.2356206, 3.230257, 0, 0, 0, 1, 1,
0.5526716, -0.864938, 1.790679, 1, 1, 1, 1, 1,
0.5628493, 0.6374578, 1.180254, 1, 1, 1, 1, 1,
0.5689541, 1.155101, 1.454204, 1, 1, 1, 1, 1,
0.5757585, 0.3887811, 0.8090659, 1, 1, 1, 1, 1,
0.5784314, -0.5342461, 4.139524, 1, 1, 1, 1, 1,
0.5815408, 2.354927, 1.21467, 1, 1, 1, 1, 1,
0.5892676, 0.7969738, 1.64661, 1, 1, 1, 1, 1,
0.5903825, 0.2206676, 0.3292042, 1, 1, 1, 1, 1,
0.5909163, -0.2221961, 1.852949, 1, 1, 1, 1, 1,
0.592001, -0.6018288, 1.879646, 1, 1, 1, 1, 1,
0.6056526, 0.5231187, 1.146175, 1, 1, 1, 1, 1,
0.6087222, 0.06099322, 1.77053, 1, 1, 1, 1, 1,
0.6167752, 0.7172701, 2.488049, 1, 1, 1, 1, 1,
0.6226353, -0.1302112, 1.328149, 1, 1, 1, 1, 1,
0.623547, 0.668268, -0.2947317, 1, 1, 1, 1, 1,
0.6253703, -1.101598, 3.69717, 0, 0, 1, 1, 1,
0.630161, 1.985502, -0.5408908, 1, 0, 0, 1, 1,
0.6306704, 0.3169091, 1.736065, 1, 0, 0, 1, 1,
0.6314315, 0.9526474, 0.5577495, 1, 0, 0, 1, 1,
0.6318521, 1.488987, 0.778327, 1, 0, 0, 1, 1,
0.6334609, -1.413698, 2.851734, 1, 0, 0, 1, 1,
0.6351718, -0.479375, 0.9887862, 0, 0, 0, 1, 1,
0.6451037, 2.927239, -0.788915, 0, 0, 0, 1, 1,
0.648517, 0.215719, 1.647947, 0, 0, 0, 1, 1,
0.6499425, -0.01306172, 2.625455, 0, 0, 0, 1, 1,
0.6522788, -1.7916, 3.898623, 0, 0, 0, 1, 1,
0.6549966, -0.4042137, 1.661209, 0, 0, 0, 1, 1,
0.6558727, -1.85907, 3.523415, 0, 0, 0, 1, 1,
0.6566906, -0.2128925, 0.9445769, 1, 1, 1, 1, 1,
0.6584887, -0.3487694, 2.701377, 1, 1, 1, 1, 1,
0.6673117, -1.041875, 1.911869, 1, 1, 1, 1, 1,
0.671647, 2.34709, 0.8306362, 1, 1, 1, 1, 1,
0.6731734, -1.185639, 1.402189, 1, 1, 1, 1, 1,
0.6732979, -1.219759, 3.4369, 1, 1, 1, 1, 1,
0.6758754, 1.212407, -0.1721578, 1, 1, 1, 1, 1,
0.6774261, 1.071607, 0.6885146, 1, 1, 1, 1, 1,
0.678351, -0.5965439, 4.060794, 1, 1, 1, 1, 1,
0.6799608, -1.101875, 3.280179, 1, 1, 1, 1, 1,
0.6810395, 1.081411, -0.5932361, 1, 1, 1, 1, 1,
0.6812384, 1.755533, 0.1517916, 1, 1, 1, 1, 1,
0.6834929, 0.2777298, 1.279458, 1, 1, 1, 1, 1,
0.6890535, -0.38201, 0.1201532, 1, 1, 1, 1, 1,
0.6897527, -0.284811, 1.329241, 1, 1, 1, 1, 1,
0.7070183, 0.68664, 1.145149, 0, 0, 1, 1, 1,
0.7187288, 0.1244608, 1.123905, 1, 0, 0, 1, 1,
0.7188112, -0.09134176, 1.916487, 1, 0, 0, 1, 1,
0.7189773, 1.237646, 0.9115854, 1, 0, 0, 1, 1,
0.7209962, 0.701845, -0.1877775, 1, 0, 0, 1, 1,
0.7224386, 1.500189, 0.6123704, 1, 0, 0, 1, 1,
0.7235767, -0.6413221, 2.753723, 0, 0, 0, 1, 1,
0.7320349, 0.1776137, 0.3295742, 0, 0, 0, 1, 1,
0.7322326, 0.8289756, 0.5232587, 0, 0, 0, 1, 1,
0.736216, -0.4915439, 1.536519, 0, 0, 0, 1, 1,
0.73664, 1.17658, 0.4011106, 0, 0, 0, 1, 1,
0.7378905, 1.93246, -0.4449238, 0, 0, 0, 1, 1,
0.7444535, 0.397649, 1.2464, 0, 0, 0, 1, 1,
0.7592539, 0.7555924, 0.971602, 1, 1, 1, 1, 1,
0.7648245, 0.2592545, 0.3797177, 1, 1, 1, 1, 1,
0.7671929, -0.1588774, 2.856667, 1, 1, 1, 1, 1,
0.7702733, -1.848869, 1.87034, 1, 1, 1, 1, 1,
0.7791952, -0.2880015, 1.279588, 1, 1, 1, 1, 1,
0.7822632, -0.11741, 1.163116, 1, 1, 1, 1, 1,
0.7860062, -0.07172559, 1.569965, 1, 1, 1, 1, 1,
0.7920719, 0.977483, -0.4613754, 1, 1, 1, 1, 1,
0.7969282, -0.9546337, 5.349203, 1, 1, 1, 1, 1,
0.7988396, 0.06854187, 0.6449053, 1, 1, 1, 1, 1,
0.8047917, -0.2676206, 2.940021, 1, 1, 1, 1, 1,
0.8098332, 0.3254122, 0.6164917, 1, 1, 1, 1, 1,
0.8115144, 1.117675, -0.02330649, 1, 1, 1, 1, 1,
0.8124781, -0.9998701, 2.271333, 1, 1, 1, 1, 1,
0.8125261, 0.02212927, 2.497973, 1, 1, 1, 1, 1,
0.8237309, 0.2215869, 1.873212, 0, 0, 1, 1, 1,
0.8265519, 0.3120282, 1.162776, 1, 0, 0, 1, 1,
0.8311812, -0.7312893, 0.2245045, 1, 0, 0, 1, 1,
0.8514204, -0.04688655, 1.035188, 1, 0, 0, 1, 1,
0.8555878, 0.1070711, 2.721051, 1, 0, 0, 1, 1,
0.8586186, 0.1388939, 2.953031, 1, 0, 0, 1, 1,
0.8658133, -1.141304, 4.433504, 0, 0, 0, 1, 1,
0.8661169, 0.5496284, 0.5266122, 0, 0, 0, 1, 1,
0.8697448, 0.8074507, -1.579637, 0, 0, 0, 1, 1,
0.8800461, 0.1886674, 2.117695, 0, 0, 0, 1, 1,
0.8898719, -0.8055227, 3.837037, 0, 0, 0, 1, 1,
0.896488, 1.934861, 1.857163, 0, 0, 0, 1, 1,
0.9000714, 2.025756, 0.1973606, 0, 0, 0, 1, 1,
0.9004423, 0.2948302, 3.252706, 1, 1, 1, 1, 1,
0.9052426, 0.9390249, -0.06421076, 1, 1, 1, 1, 1,
0.9074721, -1.873755, 3.929801, 1, 1, 1, 1, 1,
0.9078791, -0.778365, 3.911802, 1, 1, 1, 1, 1,
0.9134204, -1.110609, 2.765457, 1, 1, 1, 1, 1,
0.9143977, 0.2265318, 2.088666, 1, 1, 1, 1, 1,
0.9183432, -0.330164, 3.080311, 1, 1, 1, 1, 1,
0.9191037, -0.8337671, 3.427445, 1, 1, 1, 1, 1,
0.9432956, 0.2417019, 0.6202009, 1, 1, 1, 1, 1,
0.9454315, -0.6500599, 0.9036878, 1, 1, 1, 1, 1,
0.9460828, 1.163269, 0.6543165, 1, 1, 1, 1, 1,
0.9500283, -0.5134271, 0.8003567, 1, 1, 1, 1, 1,
0.9537294, 0.652663, 0.2176264, 1, 1, 1, 1, 1,
0.9548653, 0.8093803, 0.5458742, 1, 1, 1, 1, 1,
0.9642725, 0.6488054, 1.119195, 1, 1, 1, 1, 1,
0.9649366, -1.376135, 3.508951, 0, 0, 1, 1, 1,
0.9698519, -0.6874657, 2.113627, 1, 0, 0, 1, 1,
0.9793647, 1.468803, 0.4069491, 1, 0, 0, 1, 1,
0.9828066, 1.111087, 0.9888459, 1, 0, 0, 1, 1,
0.9836989, -0.7686383, 1.965724, 1, 0, 0, 1, 1,
0.985796, 0.06966886, 2.515361, 1, 0, 0, 1, 1,
0.9863727, 0.870937, 0.2381026, 0, 0, 0, 1, 1,
0.990519, -2.100991, 2.78322, 0, 0, 0, 1, 1,
0.9950783, -0.03624143, 0.598469, 0, 0, 0, 1, 1,
1.000165, 0.09899662, 1.613793, 0, 0, 0, 1, 1,
1.005673, 1.835381, 0.807672, 0, 0, 0, 1, 1,
1.008845, -1.068298, 3.030369, 0, 0, 0, 1, 1,
1.011611, -1.654524, 3.11753, 0, 0, 0, 1, 1,
1.013789, 0.7164385, 0.3193833, 1, 1, 1, 1, 1,
1.025743, -0.2671238, 2.425029, 1, 1, 1, 1, 1,
1.028206, -0.1567663, 2.607601, 1, 1, 1, 1, 1,
1.032533, 0.09367619, 0.2281045, 1, 1, 1, 1, 1,
1.050903, 0.9676569, 0.1771082, 1, 1, 1, 1, 1,
1.053439, 0.4357378, -0.1473262, 1, 1, 1, 1, 1,
1.054385, 0.2846534, 0.8670813, 1, 1, 1, 1, 1,
1.066401, -1.557725, 1.982387, 1, 1, 1, 1, 1,
1.067667, -0.4815907, 2.672632, 1, 1, 1, 1, 1,
1.07295, -1.970724, 2.043111, 1, 1, 1, 1, 1,
1.07321, 0.8896691, 0.9928538, 1, 1, 1, 1, 1,
1.074566, -0.6696115, 2.159266, 1, 1, 1, 1, 1,
1.075781, -0.7037436, 3.643884, 1, 1, 1, 1, 1,
1.07607, -0.2198898, 1.951157, 1, 1, 1, 1, 1,
1.078505, 2.619938, -0.2171071, 1, 1, 1, 1, 1,
1.078807, -0.6416214, 3.977355, 0, 0, 1, 1, 1,
1.082947, 0.8903221, 0.935639, 1, 0, 0, 1, 1,
1.088279, 0.9367296, 0.5209406, 1, 0, 0, 1, 1,
1.097335, -0.6976402, 2.872423, 1, 0, 0, 1, 1,
1.118285, 1.329356, 2.232613, 1, 0, 0, 1, 1,
1.13277, -0.5236512, 1.376788, 1, 0, 0, 1, 1,
1.145214, -0.112473, 2.36736, 0, 0, 0, 1, 1,
1.147723, -0.07694224, 2.079227, 0, 0, 0, 1, 1,
1.152265, 0.9659948, -0.6050158, 0, 0, 0, 1, 1,
1.157324, 0.09923962, 2.909127, 0, 0, 0, 1, 1,
1.158237, -0.2847048, 1.693053, 0, 0, 0, 1, 1,
1.17513, 1.068089, 2.281914, 0, 0, 0, 1, 1,
1.180715, -1.874096, 2.215688, 0, 0, 0, 1, 1,
1.181541, 0.583718, 0.9518285, 1, 1, 1, 1, 1,
1.181641, -0.1865489, 1.281149, 1, 1, 1, 1, 1,
1.183403, -1.047702, 2.162694, 1, 1, 1, 1, 1,
1.190789, -0.07643166, 2.451701, 1, 1, 1, 1, 1,
1.204642, -1.193503, 1.18661, 1, 1, 1, 1, 1,
1.213728, -0.9151174, 1.06056, 1, 1, 1, 1, 1,
1.217561, -0.0203686, 3.304077, 1, 1, 1, 1, 1,
1.218745, 0.7067034, 1.097085, 1, 1, 1, 1, 1,
1.228873, 0.9463952, 0.9023762, 1, 1, 1, 1, 1,
1.236526, -1.557531, 3.33435, 1, 1, 1, 1, 1,
1.240464, 0.2596073, -0.5119964, 1, 1, 1, 1, 1,
1.245248, -1.041871, 1.430843, 1, 1, 1, 1, 1,
1.246522, 0.005642955, 1.344387, 1, 1, 1, 1, 1,
1.25979, -0.4027575, 3.017678, 1, 1, 1, 1, 1,
1.26821, 0.8462014, 2.294892, 1, 1, 1, 1, 1,
1.270887, -1.050311, 1.386342, 0, 0, 1, 1, 1,
1.286839, 0.3553272, 1.982463, 1, 0, 0, 1, 1,
1.295689, 0.4602999, 2.18816, 1, 0, 0, 1, 1,
1.301623, -1.562426, 1.916378, 1, 0, 0, 1, 1,
1.315785, 1.355338, 1.445424, 1, 0, 0, 1, 1,
1.316909, -1.451144, 5.101209, 1, 0, 0, 1, 1,
1.318033, 1.386312, 2.135333, 0, 0, 0, 1, 1,
1.323003, -0.7939535, 2.909478, 0, 0, 0, 1, 1,
1.33036, 0.8269094, -0.4782851, 0, 0, 0, 1, 1,
1.331144, 0.2887107, 3.291401, 0, 0, 0, 1, 1,
1.334927, -1.165177, 1.863941, 0, 0, 0, 1, 1,
1.335522, -0.428285, 0.8858058, 0, 0, 0, 1, 1,
1.348869, -0.05380377, 3.528859, 0, 0, 0, 1, 1,
1.358243, 0.421843, -0.1469465, 1, 1, 1, 1, 1,
1.360007, 0.009903638, 4.20934, 1, 1, 1, 1, 1,
1.362003, -0.4174924, 4.446162, 1, 1, 1, 1, 1,
1.368724, -0.9775234, 0.5734318, 1, 1, 1, 1, 1,
1.372203, 0.4771539, 1.805189, 1, 1, 1, 1, 1,
1.374952, 0.773707, 0.3457838, 1, 1, 1, 1, 1,
1.379992, -0.8733898, 2.207754, 1, 1, 1, 1, 1,
1.384025, 1.126629, -0.389031, 1, 1, 1, 1, 1,
1.39531, 0.3952053, 1.38555, 1, 1, 1, 1, 1,
1.41347, 1.034904, -0.2636375, 1, 1, 1, 1, 1,
1.423241, 1.17696, -0.597907, 1, 1, 1, 1, 1,
1.437369, 0.617234, 1.694084, 1, 1, 1, 1, 1,
1.450119, 0.1542678, 0.3500974, 1, 1, 1, 1, 1,
1.455776, 0.6484141, 0.2698897, 1, 1, 1, 1, 1,
1.456239, 0.9851029, 0.4630302, 1, 1, 1, 1, 1,
1.456353, -1.3614, 1.516232, 0, 0, 1, 1, 1,
1.469419, 2.058273, 1.598111, 1, 0, 0, 1, 1,
1.471964, -0.6538805, 0.6749021, 1, 0, 0, 1, 1,
1.480772, 0.9533297, 0.3261091, 1, 0, 0, 1, 1,
1.483239, 0.2101653, 2.926624, 1, 0, 0, 1, 1,
1.491673, -1.420304, 0.9991469, 1, 0, 0, 1, 1,
1.496986, -1.388843, 1.274022, 0, 0, 0, 1, 1,
1.499583, 1.62057, 0.9217507, 0, 0, 0, 1, 1,
1.522059, 1.661694, 0.3843355, 0, 0, 0, 1, 1,
1.543666, -1.993664, 2.344426, 0, 0, 0, 1, 1,
1.556336, 0.4951313, 1.338064, 0, 0, 0, 1, 1,
1.563525, -0.2403906, 1.509839, 0, 0, 0, 1, 1,
1.586445, 1.71666, 0.6663923, 0, 0, 0, 1, 1,
1.586668, 0.9827311, 0.02799879, 1, 1, 1, 1, 1,
1.58717, 0.5244915, 1.689882, 1, 1, 1, 1, 1,
1.594857, -0.1998115, 3.84652, 1, 1, 1, 1, 1,
1.604377, -0.07144862, 2.180128, 1, 1, 1, 1, 1,
1.605482, 0.9168147, 0.245882, 1, 1, 1, 1, 1,
1.60771, -0.6232263, 2.01414, 1, 1, 1, 1, 1,
1.610995, 0.7326764, 1.80123, 1, 1, 1, 1, 1,
1.612051, 1.03029, -0.8679298, 1, 1, 1, 1, 1,
1.613184, -0.8549422, 2.439753, 1, 1, 1, 1, 1,
1.618354, -0.7471611, 3.075628, 1, 1, 1, 1, 1,
1.620901, 1.875082, -0.2221571, 1, 1, 1, 1, 1,
1.626102, -1.384738, 3.666101, 1, 1, 1, 1, 1,
1.626221, -0.6625843, 2.323515, 1, 1, 1, 1, 1,
1.682055, -0.1899617, 0.5677659, 1, 1, 1, 1, 1,
1.686178, -0.4113483, 2.656152, 1, 1, 1, 1, 1,
1.690894, 0.04746639, 1.347165, 0, 0, 1, 1, 1,
1.709025, -2.776486, 0.454847, 1, 0, 0, 1, 1,
1.712389, -0.9954401, 3.522207, 1, 0, 0, 1, 1,
1.713762, -0.4348892, -0.03802795, 1, 0, 0, 1, 1,
1.747293, 0.2183041, 0.4966152, 1, 0, 0, 1, 1,
1.766228, -2.376458, 1.179742, 1, 0, 0, 1, 1,
1.790183, 1.658942, 1.09434, 0, 0, 0, 1, 1,
1.796131, 0.8494245, 1.698609, 0, 0, 0, 1, 1,
1.802325, -0.5489443, 1.339694, 0, 0, 0, 1, 1,
1.819225, -0.1758474, 1.836353, 0, 0, 0, 1, 1,
1.823196, -1.274142, 2.172446, 0, 0, 0, 1, 1,
1.824816, 1.033468, -0.6083646, 0, 0, 0, 1, 1,
1.855973, -0.4365449, 1.12028, 0, 0, 0, 1, 1,
1.856239, 1.799416, 1.091606, 1, 1, 1, 1, 1,
1.869364, 2.153962, 2.264132, 1, 1, 1, 1, 1,
1.886962, 0.2576263, 0.7854495, 1, 1, 1, 1, 1,
1.88777, -0.4556082, 3.14592, 1, 1, 1, 1, 1,
1.913247, 0.03004456, 1.728787, 1, 1, 1, 1, 1,
1.915734, 0.6150991, 0.513805, 1, 1, 1, 1, 1,
1.917236, -0.3110678, 2.256507, 1, 1, 1, 1, 1,
1.922616, 0.06632657, -0.4509443, 1, 1, 1, 1, 1,
1.941926, -0.1954522, 2.124242, 1, 1, 1, 1, 1,
1.944697, -1.023305, 1.950338, 1, 1, 1, 1, 1,
1.965193, -0.3005689, 0.2830854, 1, 1, 1, 1, 1,
1.978463, -0.2734328, 2.173777, 1, 1, 1, 1, 1,
1.979437, -1.298264, 1.320718, 1, 1, 1, 1, 1,
1.984298, 0.237184, 2.006407, 1, 1, 1, 1, 1,
1.99691, -0.3618045, 2.225133, 1, 1, 1, 1, 1,
2.001547, 1.120716, 0.8234234, 0, 0, 1, 1, 1,
2.014768, 0.3325058, 3.450249, 1, 0, 0, 1, 1,
2.029294, -2.144747, 3.003008, 1, 0, 0, 1, 1,
2.037318, -1.207228, 3.011154, 1, 0, 0, 1, 1,
2.066433, 1.375661, 1.219344, 1, 0, 0, 1, 1,
2.093893, -0.9414004, 2.899269, 1, 0, 0, 1, 1,
2.176847, 0.5568643, 3.74431, 0, 0, 0, 1, 1,
2.177222, 1.54833, 0.2198921, 0, 0, 0, 1, 1,
2.242208, -0.4785225, 2.510289, 0, 0, 0, 1, 1,
2.292495, -1.615171, 2.607334, 0, 0, 0, 1, 1,
2.495389, 1.702551, 0.944913, 0, 0, 0, 1, 1,
2.498309, -0.6282385, 2.056576, 0, 0, 0, 1, 1,
2.510374, -0.4381457, 0.7589402, 0, 0, 0, 1, 1,
2.543778, 0.3067506, 2.425861, 1, 1, 1, 1, 1,
2.627534, -0.4969083, 0.6755906, 1, 1, 1, 1, 1,
2.638299, 2.25186, 2.956824, 1, 1, 1, 1, 1,
2.738502, -0.2629046, 2.357337, 1, 1, 1, 1, 1,
2.762635, -1.247862, 0.5292292, 1, 1, 1, 1, 1,
2.851009, -0.1959547, 1.131646, 1, 1, 1, 1, 1,
3.043711, -1.283602, 2.458728, 1, 1, 1, 1, 1
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
var radius = 9.797251;
var distance = 34.41243;
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
mvMatrix.translate( 0.09268546, 0.3680501, -0.01909232 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.41243);
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
